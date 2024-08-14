#include "libcomp.h"
#include "at30ts74.h"

#ifndef USE_AT30TS74_DEBUG
#undef __db
#define __db(...)
#endif

uint8_t at30ts74_slv_addr=AT30TS74_BASE_ADDR;

static uint8_t SensorBuff[4];

static void AT30TS74_Temper2Raw(float Temper, uint8_t *pRaw) // <editor-fold defaultstate="collapsed" desc="Convert float value to byte">
{
    int32_t tmp;

    if(Temper<0.0f) // Temperature<0
    {
        Temper*=2.0f;
        tmp=(int32_t) Temper;
        tmp+=512;
        tmp<<=7;
    }
    else // Temperature>0
    {
        Temper*=2.0f;
        tmp=(int32_t) Temper;
        tmp<<=7;
    }

    pRaw[0]=(uint8_t) (tmp>>8);
    pRaw[1]=(uint8_t) tmp;
} // </editor-fold>

static bool AT30TS74_Write(uint8_t Reg, const uint8_t *pData, uint8_t Len) // <editor-fold defaultstate="collapsed" desc="Write data to AT30TS74">
{
    uint8_t __Len;
    uint8_t __Buff[4];

    if(Len>4)
        return 0;

    __Len=0;
    __Buff[__Len++]=Reg;

    while(Len>0)
    {
        __Buff[__Len++]=*pData;
        pData++;
        Len--;
    }

    return AT30TS74_I2C_writeNByte(at30ts74_slv_addr, __Buff, __Len);
} // </editor-fold>

static bool AT30TS74_Read(uint8_t Reg, uint8_t *pData, uint8_t Len) // <editor-fold defaultstate="collapsed" desc="Read data from AT30TS74">
{
    if(AT30TS74_I2C_writeNByte(at30ts74_slv_addr, &Reg, 1))
        return AT30TS74_I2C_readNByte(at30ts74_slv_addr, pData, Len);

    return 0;
} // </editor-fold>

public void AT30TS74_Shutdown(void) // <editor-fold defaultstate="collapsed" desc="Shutdown mode">
{
    /*
    Bit 15 OS One-Shot Mode R/W
        0 Normal Operation (Default)
        1 Perform One-Shot Measurement (Valid in Shutdown Mode Only)
     
    Bit 14:13 R1:R0 Conversion Resolution R/W
        00 9-bits (Default)
        01 10-bits
        10 11-bits
        11 12-bits
     
    Bit 12:11 FT1:FT0 Fault Tolerance Queue R/W
        00 Alarm after 1 Fault (Default)
        01 Alarm after 2 Consecutive Faults
        10 Alarm after 4 Consecutive Faults
        11 Alarm after 6 Consecutive Faults
     
    Bit 10 POL ALERT Pin Polarity R/W
        0 ALERT pin is Active Low (Default)
        1 ALERT pin is Active High
     
    Bit 9 CMP/INT Alarm Thermostat Mode R/W
        0 Comparator Mode (Default)
        1 Interrupt Mode
     
    Bit 8 SD Shutdown Mode R/W
        0 Temperature Sensor Performing Active Measurements (Default)
        1 Temperature Sensor Disabled and Device In Shutdown Mode
     
    Bit 7:0 RFU Reserved for Future Use R 0 Reserved for Future Use
     */
    SensorBuff[0]=0b00000001; // upper byte
    SensorBuff[1]=0b00000000; // lower byte
    AT30TS74_Write(AT30TS74_CONFIG_REG, &SensorBuff[0], 2);
} // </editor-fold>

public void AT30TS74_Wakeup(void) // <editor-fold defaultstate="collapsed" desc="Wake up">
{
    /*
Bit 15 OS One-Shot Mode R/W
    0 Normal Operation (Default)
    1 Perform One-Shot Measurement (Valid in Shutdown Mode Only)
     
Bit 14:13 R1:R0 Conversion Resolution R/W
    00 9-bits (Default)
    01 10-bits
    10 11-bits
    11 12-bits
     
Bit 12:11 FT1:FT0 Fault Tolerance Queue R/W
    00 Alarm after 1 Fault (Default)
    01 Alarm after 2 Consecutive Faults
    10 Alarm after 4 Consecutive Faults
    11 Alarm after 6 Consecutive Faults
     
Bit 10 POL ALERT Pin Polarity R/W
    0 ALERT pin is Active Low (Default)
    1 ALERT pin is Active High
     
Bit 9 CMP/INT Alarm Thermostat Mode R/W
    0 Comparator Mode (Default)
    1 Interrupt Mode
     
Bit 8 SD Shutdown Mode R/W
    0 Temperature Sensor Performing Active Measurements (Default)
    1 Temperature Sensor Disabled and Device In Shutdown Mode
     
Bit 7:0 RFU Reserved for Future Use R 0 Reserved for Future Use
     */

    AT30TS74_Read(AT30TS74_CONFIG_REG, &SensorBuff[0], 2);

    if(SensorBuff[0]&1)
    {
        SensorBuff[0]&=0xFE;
        AT30TS74_Write(AT30TS74_CONFIG_REG, &SensorBuff[0], 2);
    }
} // </editor-fold>

public void AT30TS74_Reboot(void) // <editor-fold defaultstate="collapsed" desc="Reboot">
{
    AT30TS74_Shutdown();
    AT30TS74_Wakeup();
} // </editor-fold>

public float AT30TS74_ReadTemp(void) // <editor-fold defaultstate="collapsed" desc="Get temperature">
{
    int32_t tmp;
    float temper;

    if(AT30TS74_Read(AT30TS74_TEMPER_REG, &SensorBuff[0], 2))
    {
        if(AT30TS74_Read(AT30TS74_CONFIG_REG, &SensorBuff[2], 1))
        {
            tmp=SensorBuff[0];
            tmp<<=8;
            tmp|=SensorBuff[1];

            switch(SensorBuff[2]&0b01100000)
            {
                case 0b00000000: // 9-bit
                    tmp>>=7;

                    if(tmp&512) // Temperature<0
                        tmp-=512;

                    temper=tmp;
                    temper*=0.5f;
                    break;

                case 0b00100000: // 10-bit
                    tmp>>=6;

                    if(tmp&1024) // Temperature<0
                        tmp-=1024;

                    temper=tmp;
                    temper*=0.25f;
                    break;

                case 0b01000000: // 11-bit
                    tmp>>=5;

                    if(tmp&2048) // Temperature<0
                        tmp-=2048;

                    temper=tmp;
                    temper*=0.125f;
                    break;

                default: // 12-bit
                    tmp>>=4;

                    if(tmp&4096) // Temperature<0
                        tmp-=4096;

                    temper=tmp;
                    temper*=0.0625f;
                    break;
            }

            return temper;
        }
    }

    return 255.0;
} // </editor-fold>

public void AT30TS74_SetLimit(float Low, float High) // <editor-fold defaultstate="collapsed" desc="Set limit temperature">
{
    AT30TS74_Temper2Raw(Low, &SensorBuff[0]);
    AT30TS74_Write(AT30TS74_TLOW_REG, &SensorBuff[0], 2);
    AT30TS74_Temper2Raw(High, &SensorBuff[0]);
    AT30TS74_Write(AT30TS74_THIGH_REG, &SensorBuff[0], 2);
} // </editor-fold>

public bool AT30TS74_Init(void) // <editor-fold defaultstate="collapsed" desc="Sensor initialize">
{
    // Reboot
    AT30TS74_Reboot();
    // Configure
    /* One-Shot Mode            0: Normal Operation (Default)
       Conversion Resolution   11: 12-bits (Default)
       Fault Tolerance Queue   00: Alarm after 1 Fault (Default)
       ALERT Pin Polarity       0: ALERT pin is Active Low (Default)
       Alarm Thermostat Mode    1: Interrupt Mode
       Shutdown Mode            0: Temperature Sensor Performing Active Measurements (Default)
       00000000: Reserved for Future Use */

    SensorBuff[0]=0b01100010; // upper byte
    SensorBuff[1]=0x00; // lower byte

    if(AT30TS74_Write(AT30TS74_CONFIG_REG, &SensorBuff[0], 2))
    {
        if(AT30TS74_Read(AT30TS74_CONFIG_REG, &SensorBuff[2], 2))
        {
            __db("%02X%02X ", SensorBuff[2], SensorBuff[3]);

            if((SensorBuff[0]==SensorBuff[2])&&(SensorBuff[1]==SensorBuff[3]))
                return 1;
        }
    }

    return 0;
} // </editor-fold>