#include "Sensors/AS5600.h"
#include "i2c1.h"

#ifdef USE_AS5600_DEBUG
#include "Common/Debug.h"
#else
#define __dbsi(...)
#define __dbs(...)
#define __dbh2(...)
#endif

void AS5600_I2C_Open(void)
{
    I2C1_Open();
}

void AS5600_I2C_Close(void)
{
    I2C1_Close();
}

bool AS5600_I2C_WriteNByte(uint8_t slvAddr, const uint8_t *pD, uint8_t len)
{
    // IMPLEMENT
    uint16_t i;

    __dbs("\nAS5600 Write: ");

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

bool AS5600_I2C_ReadNByte(uint8_t slvAddr, uint8_t *pD, uint8_t len)
{
    // IMPLEMENT
    bool rslt=I2C1_Master_Read(slvAddr, pD, (uint8_t) len); // 0-success, 1-fail

    uint16_t i;

    __dbsi("\nAS5600 Read: ", len);
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
