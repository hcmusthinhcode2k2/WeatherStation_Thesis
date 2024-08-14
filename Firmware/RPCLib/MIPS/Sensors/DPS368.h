#ifndef DPS368_H
#define	DPS368_H

#include "../Common/LibDef.h"
#include "Project_Cfg.h"

#define DPS368_ADDR 0x77

#define DPS368_PSR_B2 0x00
#define DPS368_PSR_B1 0x01
#define DPS368_PSR_B0 0x02
#define DPS368_TMP_B2 0x03
#define DPS368_TMP_B1 0x04
#define DPS368_TMP_B0 0x05
#define DPS368_PRS_CFG 0x06
#define DPS368_TMP_CFG 0x07
#define DPS368_MEAS_CFG 0x08
#define DPS368_CFG_REG 0x09
#define DPS368_INT_STS 0x0A
#define DPS368_FIFO_STS 0x0B
#define DPS368_RESET 0x0C
#define DPS368_PROD_ID 0x0D
#define DPS368_COEF 0x10
#define DPS368_COEF_SRCE 0x28

typedef enum DPS368_OPMODE {
    DPS368_OPMODE_IDOL,
    DPS368_PRS_MEAS,
    DPS368_TMP_MEAS,
    DPS368_CONT_PRS_MEAS = 5,
    DPS368_CONT_TMP_MEAS,
    DPS368_CONT_PRS_TMP_MEAS
} dps368_opmode_t;

typedef enum DPS368_MEAS_RATE {
    DPS368_MEAS_RATE_1,
    DPS368_MEAS_RATE_2 = 16,
    DPS368_MEAS_RATE_4 = 32,
    DPS368_MEAS_RATE_8 = 48,
    DPS368_MEAS_RATE_16 = 64,
    DPS368_MEAS_RATE_32 = 80,
    DPS368_MEAS_RATE_64 = 96,
    DPS368_MEAS_RATE_128 = 112
} dps368_meas_rate_t;

typedef enum DPS368_SAMP_RATE {
    DPS368_SAMP_RATE_1,
    DPS368_SAMP_RATE_2,
    DPS368_SAMP_RATE_4,
    DPS368_SAMP_RATE_8,
    DPS368_SAMP_RATE_16,
    DPS368_SAMP_RATE_32,
    DPS368_SAMP_RATE_64,
    DPS368_SAMP_RATE_128
} dps368_samp_rate_t;

#define DPS368_INT_FIFO 0x40
#define DPS368_INT_TMP 0x20
#define DPS368_INT_PRS 0x10

void DPS368_clear_intflgs(void);
void DPS368_set_opmode(dps368_opmode_t mode);
void DPS368_config_tmp(dps368_meas_rate_t mr, dps368_samp_rate_t sr);
void DPS368_config_prs(dps368_meas_rate_t mr, dps368_samp_rate_t sr);
void DPS368_config_int(uint8_t int_source);

/* Ex:
 * DPS368_set_opmode(DPS368_CONT_PRS_TMP_MEAS);
 * dps368_clear_intflgs();
 * DPS368_get_result(&tmp, &prs);
 * dps368_set_opmode(DPS368_OPMODE_IDOL);
 */
void DPS368_get_result(int32_t *tmp, int32_t *prs);
bool DPS368_Init(void);
void DPS368_Deinit(void);
/* ************************************************** Defined in DPS368_Cfg.c */
void DPS368_Config(void);
void DPS368_I2C_Open(void);
void DPS368_I2C_Close(void);
bool DPS368_I2C_ReadNByte(uint8_t slvAddr, uint8_t *pD, uint8_t len);
bool DPS368_I2C_WriteNByte(uint8_t slvAddr, const uint8_t *pD, uint8_t len);

#endif
