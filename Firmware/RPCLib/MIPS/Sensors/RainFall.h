#ifndef RAINFALL_H
#define	RAINFALL_H

#include "../Common/LibDef.h"
#include "Project_Cfg.h"

extern const float RAIN_PER_TIP; // mm

void RainFall_Count(void);
bool RainFall_Init(void);
void RainFall_Deinit(void);
float RainFall_GetRainGauge(void);

uint32_t RainFall_TimerGet(void);
void RainFall_TimerStart(void);
void RainFall_TimerStop(void);

#endif
