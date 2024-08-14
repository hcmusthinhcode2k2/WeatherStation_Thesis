#ifndef I2C1_H
#define I2C1_H
#include <xc.h>
#include <stdbool.h>
#include <stdint.h>

void I2C1_Initialize(void);
void I2C1_Deinitialize(void);
void I2C1_Open(void);
void I2C1_Close(void);
bool I2C1_Start(void);
bool I2C1_Stop(void);
bool I2C1_Restart(void);
uint8_t I2C1_Read(void);
bool I2C1_Write(uint8_t d);
bool I2C1_Ack(void);
bool I2C1_Nack(void);
bool I2C1_Master_Write(uint8_t DvAddr, const uint8_t *pData, uint8_t Len); // 1-success, 0-fail
bool I2C1_Master_Read(uint8_t DvAddr, uint8_t *pData, uint8_t Len); // 1-success, 0-fail

#endif