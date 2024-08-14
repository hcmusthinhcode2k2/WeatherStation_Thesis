#include "Sensors/WindSpeed.h"
#include "tmr1.h"

void WindSpeed_TimerStart(void)
{
    TMR1_Start();
}

void WindSpeed_TimerStop(void)
{
    TMR1_Stop();
}