#include "Thingsboard.h"
#include "Common/Debug.h"
#include "Sensors/AS5600.h"
#include "Sensors/DPS368.h"
#include "Sensors/GP2Y101xAU.h"
#include "Sensors/RainFall.h"
#include "Sensors/SHT4x.h"
#include "Sensors/WindSpeed.h"

void Thingsboard_getdata(sensordata_t *pData)
{
    char buff[128];
    int32_t temperature, humidity;
    int8_t ret;

    memset((void *) pData, 0x00, sizeof (sensordata_t));

    if(AS5600_Init())
    {
        uint16_t tmp;
        int angle=(int) AS5600_GetAngle(&tmp);

        if(AS5600_lastError()==AS5600_OK)
        {
            pData->windDirection=angle;
            __dbsi("\nWind Dir= ", pData->windDirection);
        }
        else
            __dbs("\nAS5600 read error");
    }
    else
        __dbs("\nAS5600 init error");

    AS5600_Deinit();

    if(DPS368_Init())
    {
        int32_t temp, press;

        DPS368_set_opmode(DPS368_CONT_PRS_TMP_MEAS);
        DPS368_clear_intflgs();
        DPS368_get_result(&temp, &press);
        DPS368_set_opmode(DPS368_OPMODE_IDOL);
        pData->pressure=(int) press/100;
        __dbsi("\nPressure= ", pData->pressure);
        __dbs(" hPa");
    }
    else
        __dbs("\nDPS368 init error");

    DPS368_Deinit();

    if(sht4x_init())
    {
        ret=sht4x_measure_blocking_read(&temperature, &humidity);

        if(ret==STATUS_OK)
        {
            pData->humidity=(int) humidity/1000;
            pData->temperature=(float) temperature/1000.0f;
            sprintf(buff, "\nTemp=%0.2f, Humi=%d%%RH\n",
                    pData->temperature, pData->humidity);
            __dbs(buff);
        }
        else
            __dbs("\nSHT4x read error");
    }
    else
        __dbs("\nSHT4x init error");

    sht4x_deinit();

    if(GP2Y101xAU_Init())
    {
        pData->dustDensity=GP2Y101xAU_GetDustDensity();
        __dbsi("\nDust= ", pData->dustDensity);
        __dbs(" ug/m^3");
    }
    else
        __dbs("\nGP2Y101xAU error");

    GP2Y101xAU_Deinit();

    if(WindSpeed_Init())
    {
        pData->windSpeed=WindSpeed_GetSpeed();
        sprintf(buff, "\nWind Spd= %.1f m/s", pData->windSpeed);
        __dbs(buff);
    }
    else
        __dbs("\nWindSpeed sensor error");

    if(RainFall_Init())
    {
        pData->rainRate=RainFall_GetRainGauge();
        sprintf(buff, "\nRain= %.1f mm/h", pData->rainRate);
        __dbs(buff);
    }
    else
        __dbs("\nRainFall sensor error");
}
