#ifndef RPR0521_H
#define	RPR0521_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

#define RPR0521_SLAVE_ADDR              0x38

#define RPR0521_REG_SYSTEM_CONTROL      0x40 // RW, System control
#define RPR0521_REG_MODE_CONTROL        0x41 // RW, ALS, PS function setting
#define RPR0521_REG_ALS_PS_CONTROL      0x42 // RW, ALS Gain, PS LED Driver
#define RPR0521_REG_PS_CONTROL          0x43 // RW, PS Gain, PS interrupt persistence
#define RPR0521_REG_PS_DATA_LSB         0x44 // R, PS data low byte
#define RPR0521_REG_PS_DATA_MSB         0x45 // R, PS data high byte
#define RPR0521_REG_ALS_DATA0_LSB       0x46 // R, ALS DATA0 low byte
#define RPR0521_REG_ALS_DATA0_MSB       0x47 // R, ALS DATA0 high byte
#define RPR0521_REG_ALS_DATA1_LSB       0x48 // R, ALS DATA1 low byte
#define RPR0521_REG_ALS_DATA1_MSB       0x49 // R, ALS DATA1 high byte
#define RPR0521_REG_INTERRUPT           0x4A // RW, Interrupt control
#define RPR0521_REG_PS_TH_LSB           0x4B // RW, PS upper threshold low byte
#define RPR0521_REG_PS_TH_MSB           0x4C // RW, PS upper threshold high byte
#define RPR0521_REG_PS_TL_LSB           0x4D // RW, PS lower threshold low byte
#define RPR0521_REG_PS_TL_MSB           0x4E // RW, PS lower threshold high byte
#define RPR0521_REG_ALS_DATA0_TH_LSB    0x4F // RW, ALS DATA0 upper threshold low byte
#define RPR0521_REG_ALS_DATA0_TH_MSB    0x50 // RW, ALS DATA0 upper threshold high byte
#define RPR0521_REG_ALS_DATA0_TL_LSB    0x51 // RW, ALS DATA0 lower threshold low byte
#define RPR0521_REG_ALS_DATA0_TL_MSB    0x52 // RW, ALS DATA0 lower threshold high byte
#define RPR0521_REG_PS_OFFSET_LSB       0x53 // RW, PS offset low byte
#define RPR0521_REG_PS_OFFSET_MSB       0x54 // RW, PS offset high byte
#define RPR0521_REG_MANUFACT_ID         0x92 // R, Manufactor ID
#define RPR0521_ID                      0b11100000

bool RPR0521_Init(void);
uint16_t RPR0521_PsRead(void);
uint32_t RPR0521_AlsRead(void);

#endif