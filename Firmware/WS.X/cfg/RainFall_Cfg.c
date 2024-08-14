#include "Sensors/RainFall.h"
#include "System/TickTimer.h"

const float RAIN_PER_TIP=0.52615;

void RainFall_TimerStart(void)
{

}

void RainFall_TimerStop(void)
{

}

uint32_t RainFall_TimerGet(void)
{
    return Tick_GetTimeMs();
}