#include "RainFall.h"

static uint16_t Cnt=0;
static float RainfallRate=0;
static int8_t init=0;
static uint32_t t0, t1;

void RainFall_Count(void)
{
    uint32_t dt;
    
    if(init==0)
    {
        init=1;
        Cnt=0;
        RainFall_TimerStart();
        t0=RainFall_TimerGet();
    }
    
    t1=RainFall_TimerGet();
    dt=t1-t0;
    
    if(dt>100) // min=100ms
    {
        Cnt++;
        t0=RainFall_TimerGet();
    }
}

bool RainFall_Init(void)
{

    return true;
}

float RainFall_GetRainGauge(void)
{
    RainfallRate=Cnt;
    RainfallRate*=RAIN_PER_TIP;
    Cnt=0;
    init=0;
    
    return RainfallRate;
}
