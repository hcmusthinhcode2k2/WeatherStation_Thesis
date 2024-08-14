/* 
 * File:   Thingsboard_Cfg.h
 * Author: thinh
 *
 * Created on Ngày 03 tháng 7 n?m 2024, 09:42
 */

#ifndef THINGSBOARD_CFG_H
#define	THINGSBOARD_CFG_H
#include <stdbool.h>
#include <stdint.h>
typedef struct {
    float temperature;
    int humidity;
    int pressure;
    float windSpeed;
    int dustDensity;
    float rainRate;
    int windDirection;
} sensordata_t;

void Uart_Init(void);
bool Uart_isRxReady(void);
bool Uart_isTxReady(void);
bool Uart_isTxDone(void);
uint8_t Uart_Read(void);
void Uart_Write(uint8_t b);
void Thingsboard_getdata(sensordata_t *pData);

#endif	/* THINGSBOARD_CFG_H */

