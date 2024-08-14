#include "AppMain.h"

typedef enum
{
    APP_INIT=0,
    APP_AT_CHECK,
    APP_RUN,
    APP_ERROR,
    APP_IDLE
} app_task_t;

static struct
{
    tick_timer_t Tick;
    app_task_t Next;
} AppCxt;

uint8_t I2C_Scan(void) // <editor-fold defaultstate="collapsed" desc="Scan I2C slaver">
{
    uint8_t found, slv;

    __dbs("\nScan I2C: ");

    for(slv=1, found=0; slv<128; slv++)
    {
        ClrWdt();

        if(I2C1_Master_Write(slv, NULL, 0))
        {
            found++;
            __dbs("\n-> Found 0x");
            __dbh2(slv);
        }
    }

    return found;
} // </editor-fold>

void Display_Volatge(void) // <editor-fold defaultstate="collapsed" desc="Display all analog inputs as mV">
{
    __tsdbs("VOTAGE (mV):");
    __dbsu("\nVbat=", GetVbat());
    __dbsu("\nVcore=", GetVCore());
    __dbsu("\nVbg=", GetVBGap());
    __dbsu("\nVUno1=", GetUnoAn1());
    __dbsu("\nVUno2=", GetUnoAn2());
    __dbsu("\nVUno3=", GetUnoAn3());
    __dbsu("\nVUnoVref=", GetUnoVref());
} // </editor-fold>

private void APP_DebugCmd_Process(uint8_t *pCmd) // <editor-fold defaultstate="collapsed" desc="Debug CMD process">
{
    str_uppercase(pCmd);

    if(strstr((const char *) pCmd, "AT#CUSTOMAT")!=NULL)
    {

    }
} // </editor-fold>

public void APP_Main_Initialize(void) // <editor-fold defaultstate="collapsed" desc="Application Initialize">
{
    uint8_t deviceCnt;

    __dbs("\n---------- APP INIT ----------\n");
    AppCxt.Next=APP_INIT;
    Tick_Timer_Reset(AppCxt.Tick);
    Indicator_Toggle(0, 500, 500);
    Power_Monitor_Init();
    VCP_Debug_SetRxCallback(APP_DebugCmd_Process);

    if(SST_Init()==1)
        __dbs("\nSST25xx ready");
    else
    {
        AppCxt.Next=APP_ERROR;
        __dbs("\nSST25VF016B error");
    }

    deviceCnt=I2C_Scan();
    __dbsu("\nI2C device found: ", deviceCnt);
    Telit_PwrCtrl_Init();
    Telit_TurnOn(0, 1);
    __dbs("\n------------------------------\n");
} // </editor-fold>

public void APP_Main_Tasks(void) // <editor-fold defaultstate="collapsed" desc="Application Main Task">
{
    int8_t rslt;

    if(Tick_Timer_Is_Over_Ms(AppCxt.Tick, 3000))
    {
        __tsdbs("Press BTN to see voltages");
    }

    switch(MOD_Button_GetState(BUTTON_GetValue()))
    {
        case SINGLE_PRESS:
            Tick_Timer_Reset(AppCxt.Tick);
            Display_Volatge();
            break;

        case HOLD_PRESS:
            break;

        default: // Do nothing
            break;
    }

    switch(AppCxt.Next)
    {
        case APP_INIT:
            if(Telit_Ready())
            {
                __tsdbs("Module running");
                Indicator_Toggle(0, 100, 500);
                ATCMD_Init();
                AppCxt.Next=APP_AT_CHECK;
            }
            else if(!Telit_IsBusy()&&Telit_PwrCtrl_IsError())
            {
                AppCxt.Next=APP_ERROR;
                __tsdbs("Module error: ");

                if(TelitState.dischrErr==1)
                    __dbs("\n->DisChr error");

                if(TelitState.vcelRdy==0)
                    __dbs("\n->Vcell error");

                if(TelitState.vauxRdy==0)
                    __dbs("\n->Vaux error");

                if(TelitState.swRdy==0)
                    __dbs("\n->SW Rdy error");

                if(TelitState.reboot==1)
                    __dbs("\n->Reboot or Sleep");
            }
            break;

        case APP_AT_CHECK:
            rslt=ATCMD_Test(AT_LEAST_1ON, 10);

            if(rslt==RESULT_DONE)
            {
                __tsdbs("Module AT ready");
                Indicator_Toggle(0, 100, 2900);
                AppCxt.Next=APP_IDLE;
            }
            else if(rslt==RESULT_ERR)
            {
                __tsdbs("Module AT error");
                AppCxt.Next=APP_ERROR;
            }
            break;

        case APP_RUN:
            // Do something
            if(Telit_PwrCtrl_IsError())
            {
                __tsdbs("Module error: ");

                if(TelitState.dischrErr==1)
                    __dbs("\n->DisChr error");

                if(TelitState.vcelRdy==0)
                    __dbs("\n->Vcell error");

                if(TelitState.vauxRdy==0)
                    __dbs("\n->Vaux error");

                if(TelitState.swRdy==0)
                    __dbs("\n->SW Rdy error");

                if(TelitState.reboot==1)
                {
                    Indicator_Toggle(0, 500, 500);
                    AppCxt.Next=APP_INIT;
                    __dbs("\n->Reboot or Sleep\nWait module reboot or wakeup");
                }
            }
            break;

        case APP_ERROR:
            if(Telit_IsBusy()==0)
            {
                AppCxt.Next=APP_IDLE;
                Indicator_Toggle(0, 500, 500);
            }
            break;

        case APP_IDLE:
        default:
            break;
    }
} // </editor-fold>