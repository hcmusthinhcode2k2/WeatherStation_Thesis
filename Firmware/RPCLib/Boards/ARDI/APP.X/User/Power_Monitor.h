#ifndef POWER_MONITOR_H
#define	POWER_MONITOR_H

#include <stdint.h>
#include "Project_Cfg.h"

#define ADC_CHANNEL_COUNT   9
#define ADC_RESOLUTION      4096
#define ADC_VREF            3300

typedef struct {
    uint32_t Iir;
    uint16_t Val;
} pwrmoni_buf_t;

void Power_Monitor_Init(void);
uint16_t Power_Monitor_Get(ADC1_CHANNEL Channel);

#define GetUnoVref() Power_Monitor_Get(UNO_VREF)
#define GetUnoAn1() Power_Monitor_Get(UNO_AN1)
#define GetUnoAn2() Power_Monitor_Get(UNO_AN2)
#define GetUnoAn3() Power_Monitor_Get(UNO_AN3)
#define GetVbat()   Power_Monitor_Get(VBAT_DIV)
#define GetVCore()  Power_Monitor_Get(CHANNEL_VDD_core)
#define GetVBGap()  Power_Monitor_Get(CHANNEL_VBG)

#endif
