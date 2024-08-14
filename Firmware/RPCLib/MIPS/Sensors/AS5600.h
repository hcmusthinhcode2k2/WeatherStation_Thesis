#ifndef AS5600_H
#define	AS5600_H

#include "../Common/LibDef.h"
#include "Project_Cfg.h"

#define AS5600_SLV_ADDR 0x36
#define AS5600_ERROR    (-1)
#define AS5600_OK       0

extern const uint8_t AS5600_SW_DIRECTION_PIN;
//  CONFIGURATION REGISTERS
extern const uint8_t AS5600_ZMCO;
extern const uint8_t AS5600_ZPOS;
extern const uint8_t AS5600_MPOS;
extern const uint8_t AS5600_MANG;
extern const uint8_t AS5600_CONF;
//  CONFIGURATION BIT MASKS - byte level
extern const uint8_t AS5600_CONF_POWER_MODE;
extern const uint8_t AS5600_CONF_HYSTERESIS;
extern const uint8_t AS5600_CONF_OUTPUT_MODE;
extern const uint8_t AS5600_CONF_PWM_FREQUENCY;
extern const uint8_t AS5600_CONF_SLOW_FILTER;
extern const uint8_t AS5600_CONF_FAST_FILTER;
extern const uint8_t AS5600_CONF_WATCH_DOG;

//  UNKNOWN REGISTERS 0x09-0x0A
//  OUTPUT REGISTERS
extern const uint8_t AS5600_RAW_ANGLE;
extern const uint8_t AS5600_ANGLE;
// I2C_ADDRESS REGISTERS (AS5600L)
extern const uint8_t AS5600_I2CADDR;
extern const uint8_t AS5600_I2CUPDT;
//  STATUS REGISTERS
extern const uint8_t AS5600_STATUS;
extern const uint8_t AS5600_AGC;
extern const uint8_t AS5600_MAGNITUDE;
extern const uint8_t AS5600_BURN;
//  STATUS BITS
extern const uint8_t AS5600_MAGNET_HIGH;
extern const uint8_t AS5600_MAGNET_LOW;
extern const uint8_t AS5600_MAGNET_DETECT;

//  setDirection
extern const uint8_t AS5600_CLOCK_WISE; //  LOW
extern const uint8_t AS5600_COUNTERCLOCK_WISE; //  HIGH
//  0.087890625;
extern const float AS5600_RAW_TO_DEGREES;
extern const float AS5600_DEGREES_TO_RAW;
//  0.00153398078788564122971808758949;
extern const float AS5600_RAW_TO_RADIANS;
//  4.06901041666666e-6
extern const float AS5600_RAW_TO_RPM;
//  getAngularSpeed
extern const uint8_t AS5600_MODE_DEGREES;
extern const uint8_t AS5600_MODE_RADIANS;
extern const uint8_t AS5600_MODE_RPM;

//  CONFIGURE CONSTANTS
//  setOutputMode
extern const uint8_t AS5600_OUTMODE_ANALOG_100;
extern const uint8_t AS5600_OUTMODE_ANALOG_90;
extern const uint8_t AS5600_OUTMODE_PWM;
//  setPowerMode
extern const uint8_t AS5600_POWERMODE_NOMINAL;
extern const uint8_t AS5600_POWERMODE_LOW1;
extern const uint8_t AS5600_POWERMODE_LOW2;
extern const uint8_t AS5600_POWERMODE_LOW3;
//  setPWMFrequency
extern const uint8_t AS5600_PWM_115;
extern const uint8_t AS5600_PWM_230;
extern const uint8_t AS5600_PWM_460;
extern const uint8_t AS5600_PWM_920;
//  setHysteresis
extern const uint8_t AS5600_HYST_OFF;
extern const uint8_t AS5600_HYST_LSB1;
extern const uint8_t AS5600_HYST_LSB2;
extern const uint8_t AS5600_HYST_LSB3;
//  setSlowFilter
extern const uint8_t AS5600_SLOW_FILT_16X;
extern const uint8_t AS5600_SLOW_FILT_8X;
extern const uint8_t AS5600_SLOW_FILT_4X;
extern const uint8_t AS5600_SLOW_FILT_2X;
//  setFastFilter
extern const uint8_t AS5600_FAST_FILT_NONE;
extern const uint8_t AS5600_FAST_FILT_LSB6;
extern const uint8_t AS5600_FAST_FILT_LSB7;
extern const uint8_t AS5600_FAST_FILT_LSB9;
extern const uint8_t AS5600_FAST_FILT_LSB18;
extern const uint8_t AS5600_FAST_FILT_LSB21;
extern const uint8_t AS5600_FAST_FILT_LSB24;
extern const uint8_t AS5600_FAST_FILT_LSB10;
//  setWatchDog
extern const uint8_t AS5600_WATCHDOG_OFF;
extern const uint8_t AS5600_WATCHDOG_ON;

typedef enum {
    // https://dev.qweather.com/en/docs/resource/wind-info/
    DIR_N = 0,
    DIR_NNE,
    DIR_NE,
    DIR_ENE,
    DIR_E,
    DIR_ESE,
    DIR_SE,
    DIR_SSE,
    DIR_S,
    DIR_SSW,
    DIR_SW,
    DIR_WSW,
    DIR_W,
    DIR_WNW,
    DIR_NW,
    DIR_NNW
} direction_t;

bool AS5600_Init(void);
void AS5600_Deinit(void);
int8_t AS5600_lastError(void);
direction_t AS5600_GetAngle(uint16_t *pAngle);

/* ************************************************** Defined in AS5600_Cfg.c */
void AS5600_I2C_Open(void);
void AS5600_I2C_Close(void);
bool AS5600_I2C_WriteNByte(uint8_t slcAddr, const uint8_t *pD, uint8_t len);
bool AS5600_I2C_ReadNByte(uint8_t slcAddr, uint8_t *pD, uint8_t len);

#endif
