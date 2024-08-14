#ifndef I2C2_H
#define I2C2_H
#include <xc.h>
#include <stdbool.h>
#include <stdint.h>

void I2C2_Initialize(void);
void I2C2_Start(void);
void I2C2_Stop(void);
void I2C2_Restart(void);
uint8_t I2C2_Read(void);
bool I2C2_Write(uint8_t d);
void I2C2_Ack(void);
void I2C2_Nack(void);
bool I2C2_Master_Write(uint8_t DvAddr, uint8_t *pData, uint8_t Len);
bool I2C2_Master_Read(uint8_t DvAddr, uint8_t *pData, uint8_t Len);

#endif