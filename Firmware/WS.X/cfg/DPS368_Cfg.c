#include "Sensors/DPS368.h"
#include "i2c1.h"

#ifdef USE_DPS368_DEBUG
#include "Common/Debug.h"
#else
#define __dbsi(...)
#define __dbs(...)
#define __dbh2(...)
#endif

void DPS368_I2C_Open(void)
{
    I2C1_Open();
}

void DPS368_I2C_Close(void)
{
    I2C1_Close();
}

bool DPS368_I2C_WriteNByte(uint8_t slvAddr, const uint8_t *pD, uint8_t len)
{
    // IMPLEMENT
    uint16_t i;

    __dbs("\nDPS368 Write: ");

    for(i=0; i<len; i++)
        __dbh2(pD[i]);

    bool rslt=I2C1_Master_Write(slvAddr, pD, (uint8_t) len); // 0-success, 1-fail

    if(rslt==0)
    {
        __dbs(" error");
        return 0;
    }

    return 1;
}

bool DPS368_I2C_ReadNByte(uint8_t slvAddr, uint8_t *pD, uint8_t len)
{
    // IMPLEMENT
    bool rslt=I2C1_Master_Read(slvAddr, pD, (uint8_t) len); // 0-success, 1-fail

    uint16_t i;

    __dbsi("\nDPS368 Read: ", len);
    __dbs("\n");

    for(i=0; i<len; i++)
        __dbh2(pD[i]);

    if(rslt==0)
    {
        __dbs(" error");
        return 0;
    }

    return 1;
}

void DPS368_Config(void)
{
    DPS368_config_prs(DPS368_MEAS_RATE_1, DPS368_SAMP_RATE_16);
    DPS368_config_tmp(DPS368_MEAS_RATE_1, DPS368_SAMP_RATE_16);
    DPS368_config_int(DPS368_INT_TMP|DPS368_INT_PRS);
}