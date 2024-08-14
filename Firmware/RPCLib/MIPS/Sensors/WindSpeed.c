#include "ext_int.h"
#include "Sensors/WindSpeed.h"
#include "tmr1.h"

static uint32_t Cnt = 0;
static float Speed = 0;
static bool init = false;
static const float SPEED_CONST = 0.10430112; 

void WindSpeed_Count(void)
{
    Cnt++;
}

void WindSpeed_Process(void)
{
    Speed = (float)Cnt * SPEED_CONST; 
    Cnt = 0; 
}

bool WindSpeed_Init(void)
{
    if (!init)
    {
        init = true;
        Cnt = 0;
        Speed = 0;
        WindSpeed_TimerStart();
    }

    return true;
}

void WindSpeed_Deinit(void)
{
    init = false;
    WindSpeed_TimerStop();
}

float WindSpeed_GetSpeed(void)
{
    return Speed; 
}
