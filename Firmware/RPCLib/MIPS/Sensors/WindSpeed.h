
#ifndef WINDSPEED_H
#define	WINDSPEED_H

#include "../Common/LibDef.h"
#include "Project_Cfg.h"

void WindSpeed_Count(void);

bool WindSpeed_Init(void);

void WindSpeed_Deinit(void);

void WindSpeed_Process(void);

float WindSpeed_GetSpeed(void);

void WindSpeed_TimerStart(void);

void WindSpeed_TimerStop(void);

#endif 
