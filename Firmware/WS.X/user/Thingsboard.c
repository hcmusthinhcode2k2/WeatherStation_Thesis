#include "Thingsboard.h"
#include "System/TickTimer.h"
#include "Common/Debug.h"
#include "Cellular/TelitAtCmd.h"

#define SERVER_IP       "demo.thingsboard.io"
#define SERVER_PORT     "1883"
#define CLIENT_ID       "txk7pn5sp238ul9304hc"
#define CLIENT_USERNAME "smlbga9stdp7cckqzcia"
#define CLIENT_PASSWORD "k2prlu7e27zxh2nrd5tb"

static uint8_t Next;
static float latitudeDecimal;
static float longitudeDecimal;

typedef enum
{
    TASK_INIT=0,
    TASK_ECHO_OFF,
    TASK_SET_FLIGHT_MODE,
    TASK_CHECK_POWER_STATUS,
    TASK_POWERED_UP,
    TASK_SET_GNSS_PRIORITY,
    TASK_SET_GNSS_CONSTELLATIONS,
    TASK_SET_GNSS_PRIORITY_RUNTIME,
    TASK_GET_ACQUIRED_POSITION,
    TASK_TURN_OFF_GPS,
    TASK_SET_FULL_FUNCTIONALITY,
    TASK_SET_LTE_ONLY,
    TASK_SET_NB_PRIORITY,
    TASK_GETSENSOR,
    TASK_CHECK_NETWORK,
    TASK_GET_SIGNAL,
    TASK_SGACT,
    TASK_MQEN,
    TASK_MQCFG,
    TASK_MQCONN,
    TASK_GENBUFFER,
    TASK_MQPUBS,
    TASK_DISCONNECT,
    TASK_IDLE,
    TASK_ERROR
} TbTasks;

bool Thingsboard_checkBuffer(const char *check)
{
    return strstr((const char*) &ATCMD_GetRxBuffer(0), check)!=NULL;
}

void parseAndPrintGPSData(char *data) // <editor-fold defaultstate="collapsed" desc="GNSS data process">
{
    char *token;
    char *latitude=NULL;
    char *longitude=NULL;
    int fieldCount=0;

    token=strtok(data, ",");

    while(token!=NULL)
    {
        fieldCount++;

        if(fieldCount==2)
            latitude=token;
        else if(fieldCount==3)
        {
            longitude=token;
            break;
        }

        token=strtok(NULL, ",");
    }

    if((latitude!=NULL)&&(longitude!=NULL))
    {
        float latDegrees, latMinutes;
        char latDir=latitude[strlen(latitude)-1];

        latitude[strlen(latitude)-1]='\0';
        latDegrees=(int) (atof(latitude)/100);
        latMinutes=atof(latitude) - (latDegrees*100);
        latitudeDecimal=latDegrees+(latMinutes/60);

        if(latDir=='S')
            latitudeDecimal= -latitudeDecimal;

        float lonDegrees, lonMinutes;
        char lonDir=longitude[strlen(longitude)-1];

        longitude[strlen(longitude)-1]='\0';
        lonDegrees=(int) (atof(longitude)/100);
        lonMinutes=atof(longitude) - (lonDegrees*100);
        longitudeDecimal=lonDegrees+(lonMinutes/60);

        if(lonDir=='W')
            longitudeDecimal= -longitudeDecimal;

        char latStr[20], lonStr[20];
        snprintf(latStr, sizeof (latStr), "%.6f", latitudeDecimal);
        snprintf(lonStr, sizeof (lonStr), "%.6f", longitudeDecimal);

        __dbss("\nLatitude: ", latStr);
        __dbss("\nLongitude: ", lonStr);
    }
} // </editor-fold>

bool Thingsboard_init(void) // <editor-fold defaultstate="collapsed" desc="Thingsboard init">
{
    __tsdbs("Thingsboard init");
    Next=TASK_INIT; // Initialize task

    return 1;
} // </editor-fold>

tb_stt_t Thingsboard_task(bool syncRdy) // <editor-fold defaultstate="collapsed" desc="Thingsboard tasks">
{
    static char pubCmd[256];
    static sensordata_t SensorData;
    int8_t rslt;
    bool stt;

    switch(Next)
    {
        case TASK_INIT:
            ATCMD_Init();
            ATCMD_Delay(500);
            Next=TASK_ECHO_OFF;
            break;

        case TASK_ECHO_OFF:
            rslt=ATCMD_EchoOff(30);

            if(rslt==RESULT_DONE)
                Next=TASK_SET_FULL_FUNCTIONALITY; //TASK_GETSENSOR;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("AT CMD error");
            }
            break;

        case TASK_SET_FLIGHT_MODE:
            rslt=ATCMD_SetAirplaneMode();

            if(rslt==RESULT_DONE)
                Next=TASK_CHECK_POWER_STATUS;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_SET_FULL_FUNCTIONALITY;
                __tsdbs("Can not set flight mode");
            }
            break;

        case TASK_CHECK_POWER_STATUS:
            rslt=ATCMD_GetGnssPwrStt(&stt);

            if(rslt==RESULT_DONE)
            {
                if(stt==1)
                    Next=TASK_SET_GNSS_PRIORITY;
                else
                    Next=TASK_POWERED_UP;
            }
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_SET_FULL_FUNCTIONALITY;
                __tsdbs("Can not get GNSS state");
            }
            break;

        case TASK_POWERED_UP:
            rslt=ATCMD_SetGnssPwrStt(1);

            if(rslt==RESULT_DONE)
                Next=TASK_SET_GNSS_PRIORITY;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_SET_FULL_FUNCTIONALITY;
                __tsdbs("Can not turn on GNSS");
            }
            break;

        case TASK_SET_GNSS_PRIORITY:
            rslt=ATCMD_SendGetAck("AT$GPSCFG=0,0\r", RES_OK, NULL, 1000, 10, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_SET_GNSS_CONSTELLATIONS;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_TURN_OFF_GPS;
                __tsdbs("Can not set GNSS priority");
            }
            break;

        case TASK_SET_GNSS_CONSTELLATIONS:
            rslt=ATCMD_SendGetAck("AT$GPSCFG=2,1\r", RES_OK, NULL, 1000, 10, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_SET_GNSS_PRIORITY_RUNTIME;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_TURN_OFF_GPS;
                __tsdbs("Can not set GNSS constellations");
            }
            break;

        case TASK_SET_GNSS_PRIORITY_RUNTIME:
            rslt=ATCMD_SendGetAck("AT$GPSCFG=3,0\r", RES_OK, NULL, 1000, 10, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_GET_ACQUIRED_POSITION;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_TURN_OFF_GPS;
                __tsdbs("Can not set GNSS priority runtime");
            }
            break;

        case TASK_GET_ACQUIRED_POSITION:
            rslt=ATCMD_SendGetAck("AT$GPSACP\r", RES_OK, NULL, 1000, 10, 1);

            if(syncRdy==1)
                Next=TASK_TURN_OFF_GPS;
            else
            {
                if(rslt==RESULT_DONE)
                {
                    ATCMD_Delay(1000);
                    if(Thingsboard_checkBuffer("N"))
                        parseAndPrintGPSData((char *) &ATCMD_GetRxBuffer(0));
                }
                else if(rslt==RESULT_ERR)
                {
                    ATCMD_Delay(1000);
                    __tsdbs("Can not acquire position");
                }
            }
            break;

        case TASK_TURN_OFF_GPS:
            rslt=ATCMD_SetGnssPwrStt(0);

            if(rslt==RESULT_DONE)
                Next=TASK_SET_FULL_FUNCTIONALITY;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not turn off GNSS");
            }
            break;

        case TASK_SET_FULL_FUNCTIONALITY:
            rslt=ATCMD_SetFullFuncMode();

            if(rslt==RESULT_DONE)
                //Next=TASK_SET_LTE_ONLY; //TASK_GETSENSOR;
                Next=TASK_GETSENSOR;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not set full functionality");
            }
            break;

            //        case TASK_SET_LTE_ONLY:
            //            rslt=ATCMD_SetLteOnly();
            //
            //            if(rslt==RESULT_DONE)
            //                Next=TASK_SET_NB_PRIORITY;
            //            else if(rslt==RESULT_ERR)
            //            {
            //                Next=TASK_ERROR;
            //                __tsdbs("Can not set LTE only");
            //            }
            //            break;
            //
            //        case TASK_SET_NB_PRIORITY:
            //            rslt=ATCMD_SetNbPriority();
            //
            //            if(rslt==RESULT_DONE)
            //                Next=TASK_GETSENSOR;
            //            else if(rslt==RESULT_ERR)
            //            {
            //                Next=TASK_ERROR;
            //                __tsdbs("Can not set NB priority");
            //            }
            //            break;

        case TASK_GETSENSOR:
            Thingsboard_getdata(&SensorData);
            Next=TASK_CHECK_NETWORK;
            break;

        case TASK_CHECK_NETWORK:
            rslt=ATCMD_CheckNetReg(60);

            if(rslt==RESULT_DONE)
                Next=TASK_GET_SIGNAL;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not register network");
            }
            break;

        case TASK_GET_SIGNAL:
            rslt=ATCMD_SendGetAck("AT#RFSTS\r", RES_OK, NULL, 5000, 100, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_SGACT;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not measure RF");
            }
            break;

        case TASK_SGACT:
            rslt=ATCMD_SendGetAck("AT#SGACT=1,1\r", "#SGACT:", NULL, 5000, 100, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_MQEN;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not active PDP");
            }
            break;

        case TASK_MQEN:
            rslt=ATCMD_SendGetAck("AT#MQEN=1,1\r", RES_OK, NULL, 1000, 10, 3);

            if(rslt!=RESULT_BUSY)
                Next=TASK_MQCFG;
            //            else if(rslt==RESULT_ERR)
            //            {
            //                Next=TASK_ERROR;
            //                __tsdbs("Can not enable MQTT");
            //            }
            break;

        case TASK_MQCFG:
            rslt=ATCMD_SendGetAck("AT#MQCFG=1,\"" SERVER_IP "\"," SERVER_PORT ",1\r", RES_OK, NULL, 1000, 10, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_MQCONN;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not config");
            }
            break;

        case TASK_MQCONN:
            rslt=ATCMD_SendGetAck("AT#MQCONN=1,\"" CLIENT_ID "\",\"" CLIENT_USERNAME "\",\"" CLIENT_PASSWORD "\"\r",
                    RES_OK, NULL, 30000, 10, 2);

            if(rslt==RESULT_DONE)
                Next=TASK_GENBUFFER;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not connect");
            }
            break;

        case TASK_GENBUFFER:
            snprintf(pubCmd, sizeof (pubCmd),
                    "AT#MQPUBS=1,\"esp/telemetry\",0,1,\"{temperature:%.2f, humidity:%d, pressure:%d,windSpeed:%.2f, dustDensity:%d, rainRate:%.2f,windDirection:%d,latitude:%.6f,longitude:%.6f}\"\r",
                    SensorData.temperature, SensorData.humidity, SensorData.pressure,
                    SensorData.windSpeed, SensorData.dustDensity, SensorData.rainRate,
                    SensorData.windDirection, latitudeDecimal, longitudeDecimal);
            Next=TASK_MQPUBS;
            break;

        case TASK_MQPUBS:
            rslt=ATCMD_SendGetAck(pubCmd, RES_OK, NULL, 30000, 10, 3);

            if(rslt!=RESULT_BUSY)
                Next=TASK_DISCONNECT;
            break;

        case TASK_DISCONNECT:
            rslt=ATCMD_SendGetAck("AT#MQDISC=1\r", RES_OK, NULL, 5000, 10, 3);

            if(rslt==RESULT_DONE)
                Next=TASK_IDLE;
            else if(rslt==RESULT_ERR)
            {
                Next=TASK_ERROR;
                __tsdbs("Can not disconnect");
            }
            break;

        case TASK_IDLE:
            Next=TASK_SET_FLIGHT_MODE;
            return TB_OK;

        case TASK_ERROR:
        default:
            ATCMD_Deinit();
            return TB_ERROR;
    }

    return TB_BUSY;
} // </editor-fold>
