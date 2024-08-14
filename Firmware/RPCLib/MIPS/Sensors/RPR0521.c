#include "libcomp.h"
#include "RPR0521.h"

#ifndef USE_RPR0521_DEBUG
#undef __db
#define __db(...)
#endif

static uint8_t SensorBuff[8];

static bool RPR0521_Write(uint8_t Reg, const uint8_t *pData, uint8_t Len) // <editor-fold defaultstate="collapsed" desc="Write data to RPR0521">
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

    return RPR0521_I2C_writeNByte(RPR0521_SLAVE_ADDR, __Buff, __Len);
} // </editor-fold>

static bool RPR0521_Read(uint8_t Reg, uint8_t *pData, uint8_t Len) // <editor-fold defaultstate="collapsed" desc="Read data from RPR0521">
{
    if(RPR0521_I2C_writeNByte(RPR0521_SLAVE_ADDR, &Reg, 1))
        return RPR0521_I2C_readNByte(RPR0521_SLAVE_ADDR, pData, Len);

    return 0;
} // </editor-fold>

bool RPR0521_Init(void) // <editor-fold defaultstate="collapsed" desc="RPR0521 init">
{
    // ALS enable, PS enable, PS LED pulse width 330us, twice measurement mode, ALS 100ms, PS 100ms
    SensorBuff[0]=0b11110110;

    if(RPR0521_Write(RPR0521_REG_MODE_CONTROL, &SensorBuff[0], 1))
    {
        // Gain mode 1,1, 100mA
        SensorBuff[0]=0b00000010;

        if(RPR0521_Write(RPR0521_REG_ALS_PS_CONTROL, &SensorBuff[0], 1))
        {
            // Gain 1, interrupt status is updated at each measurement end 
            SensorBuff[0]=0b00000001;

            if(RPR0521_Write(RPR0521_REG_PS_CONTROL, &SensorBuff[0], 1))
            {
                if(RPR0521_Read(RPR0521_REG_MANUFACT_ID, &SensorBuff[0], 1))
                {
                    __db("%02X ", SensorBuff[0]);
                    
                    if(SensorBuff[0]==RPR0521_ID)
                        return 1;
                }
            }
        }
    }

    return 0;
} // </editor-fold>

uint16_t RPR0521_PsRead(void) // <editor-fold defaultstate="collapsed" desc="Read PS">
{
    uint16_t PsVal=0;

    if(RPR0521_Read(RPR0521_REG_PS_DATA_LSB, &SensorBuff[0], 2))
    {
        PsVal=SensorBuff[1];
        PsVal<<=8;
        PsVal|=SensorBuff[0];
    }

    return PsVal;
} // </editor-fold>

uint32_t RPR0521_AlsRead(void) // <editor-fold defaultstate="collapsed" desc="Read ALS">
{
    uint32_t AlsVal=0;

    if(RPR0521_Read(RPR0521_REG_ALS_DATA0_LSB, &SensorBuff[0], 4))
    {
        AlsVal=SensorBuff[3];
        AlsVal<<=8;
        AlsVal|=SensorBuff[2];
        AlsVal<<=8;
        AlsVal|=SensorBuff[1];
        AlsVal<<=8;
        AlsVal|=SensorBuff[0];
    }

    return AlsVal;
} // </editor-fold>