#ifndef AT30TS74_H
#define	AT30TS74_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

// AT30TS74 I2C Slaver address
#define AT30TS74_BASE_ADDR          0b01001000
#define AT30TS74_UFM10_T_072        0b01001000
#define AT30TS74_UFM11_T_072        0b01001001
#define AT30TS74_UFM12_T_072        0b01001010
#define AT30TS74_UFM13_T_072        0b01001011
#define AT30TS74_UFM14_T_072        0b01001100
#define AT30TS74_UFM15_T_072        0b01001101
#define AT30TS74_UFM16_T_072        0b01001110
#define AT30TS74_UFM17_T_072        0b01001111
#define AT30TS74_U1FMAB_T           0b01001000
#define AT30TS74_U1FMBB_T           0b01001001
#define AT30TS74_U1FMCB_T           0b01001010
#define AT30TS74_U1FMDB_T           0b01001011
#define AT30TS74_U1FMEB_T           0b01001100
#define AT30TS74_U1FMFB_T           0b01001101
#define AT30TS74_U1FMGB_T           0b01001110
#define AT30TS74_U1FMHB_T           0b01001111
// AT30TS74 Registers
#define AT30TS74_TEMPER_REG         0x00 // Temperature Register
#define AT30TS74_CONFIG_REG         0x01 // Configuration Register
#define AT30TS74_TLOW_REG           0x02 // TLOW Limit Register
#define AT30TS74_THIGH_REG          0x03 // THIGH Limit Register

#define AT30TS74_Alert_Clear(SlvAddr)       AT30TS74_Reboot(SlvAddr)
#define AT30TS74_SetSlave_Address(slvAddr)  at30ts74_slv_addr=slvAddr

extern uint8_t at30ts74_slv_addr;

public void AT30TS74_Shutdown(void);
public void AT30TS74_Wakeup(void);
public void AT30TS74_Reboot(void);
public float AT30TS74_ReadTemp(void);
public void AT30TS74_SetLimit(float Low, float High);
public bool AT30TS74_Init(void);

#endif