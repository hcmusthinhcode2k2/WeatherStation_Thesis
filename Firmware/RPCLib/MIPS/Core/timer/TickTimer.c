#include "TickTimer.h"

static simple_fnc_t CbFnc=NULL;

public bool Tick_Timer_Is_Over(tick_timer_t *pTick, tick_t Time, tick_timer_type_t TickType) // <editor-fold defaultstate="collapsed" desc="Check tick over microsecond">
{
    if(pTick->Timeout)
    {
        pTick->Timeout=0;

        if(TickType==US)
            pTick->Duration=TICK_PER_US*Time;
        else if(TickType==MS)
            pTick->Duration=TICK_PER_MS*Time;
        else
            pTick->Duration=TICK_PER_SEC*Time;

        pTick->Start=Tick_Timer_Get_TickVal();
    }

    if((Tick_Timer_Get_TickVal()-pTick->Start)>=pTick->Duration)
    {
        pTick->Timeout=1;
        return 1;
    }

    return 0;
} // </editor-fold>

public void Delay(tick_t Time, tick_timer_type_t TickType) // <editor-fold defaultstate="collapsed" desc="Delay">
{
    tick_t Duration;
    tick_t Start=Tick_Timer_Get_TickVal();

    if(TickType==US)
        Duration=TICK_PER_US*Time;
    else if(TickType==MS)

        Duration=TICK_PER_MS*Time;
    else
        Duration=TICK_PER_SEC*Time;

    while((Tick_Timer_Get_TickVal()-Start)<Duration)
    {
        if(CbFnc)
            CbFnc();
    }
} // </editor-fold>

public void Tick_Timer_SetFncCallInDelay(simple_fnc_t pFnc)
{
    CbFnc=pFnc;
}