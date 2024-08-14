#ifndef SW_I2C_MASTER_H
#define SW_I2C_MASTER_H

#include "Common/LibDef.h"

#ifdef USE_PROJECT_CFG
#include "Project_Cfg.h"
#else
#include "SW_I2C_Master_Cfg.h"
#endif

#define SW_I2C_OK       0 // Bus free
#define SW_I2C_BUSY     1 // Bus busy
#define SW_I2C_ERR      (-1) // Bus collision error
#define SW_I2C_ACK_ERR  (-2) // Ack bit error

#define SW_I2C_ACK  0
#define SW_I2C_NACK 1
/* *************************************************************** Simple API */
public void SW_I2C_Init(void); //Call first, return 0: success
public void SW_I2C_Start(void);
public void SW_I2C_Stop(void);
public bool SW_I2C_Write(uint8_t data_out);// return 1 if slaver ACK
public uint8_t SW_I2C_Read(bool ack);
public void SW_I2C_SendAck(void);
public void SW_I2C_SendNAck(void);
public uint8_t SW_I2C_ReadByte(void);
public bool SW_I2C_ReadNBytes(uint8_t address, uint8_t *data, size_t len); // return 1 if success
public bool SW_I2C_WriteNBytes(uint8_t address, uint8_t *data, size_t len); // return 1 if success
/* ************************************************************* Advanced API */
public int8_t SW_I2C_Open(uint8_t SlvAddr);
public int8_t SW_I2C_Close(void);
public int8_t SW_I2C_MasterOperation(bool read);
public void SW_I2C_SetBuffer(void *buffer, size_t bufferSize);
public void SW_I2C_Tasks(void);

#endif