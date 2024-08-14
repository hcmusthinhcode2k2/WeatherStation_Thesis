#ifndef GP2Y101xAU_H
#define	GP2Y101xAU_H

#include "../Common/LibDef.h"
#include "Project_Cfg.h"

#define GP2Y101xAU_ON   0
#define GP2Y101xAU_OFF  1

void GP2Y101xAU_PowerSetState(bool onoff);
void GP2Y101xAU_LedSetState(bool onoff);
void GP2Y101xAU_AdcInit(void);
uint16_t GP2Y101xAU_GetVoltage(void);
void GP2Y101xAU_DelayUs(uint32_t us);

bool GP2Y101xAU_Init(void);
void GP2Y101xAU_Deinit(void);
float GP2Y101xAU_GetDustDensity(void);

#endif
