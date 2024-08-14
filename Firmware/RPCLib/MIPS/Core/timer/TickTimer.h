#ifndef TICKTIMER_H
#define TICKTIMER_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

#define TICK_PER_SEC 12000000 // Clock source of core timer
#define TICK_PER_MS  12000
#define TICK_PER_US  12

#define tick_t  uint32_t

typedef enum {
    US,
    MS,
    SEC
} tick_timer_type_t;

typedef struct {
    tick_t Start;
    tick_t Duration;
} __attribute_packed__ elapse_t;

typedef struct {
    volatile bool Timeout;
    tick_t Start;
    tick_t Duration;
} __attribute_packed__ tick_timer_t;

public void Tick_Timer_SetFncCallInDelay(simple_fnc_t pFnc);
public void Delay(tick_t Time, tick_timer_type_t TickType); // Do not use in multi-task mode
public bool Tick_Timer_Is_Over(tick_timer_t *pTick, tick_t Time, tick_timer_type_t TickType);

static inline void Tick_Reset(tick_timer_t *pTick) {
    pTick->Timeout = 1;
}

static inline tick_t Tick_Timer_Get_TickVal(void) {
    return (tick_t) _CP0_GET_COUNT();
}

#define Tick_Timer_Init()                   Tick_Timer_SetFncCallInDelay(NULL)
#define Tick_Timer_Reset(x)                 Tick_Reset(&(x))
#define Delay_Us(Time)                      Delay(Time, US)
#define delay_us(t)                         Delay_Us(t)
#define __delay_us(t)                       Delay_Us(t)
#define Tick_GetTimeUs()                    (Tick_Timer_Get_TickVal() / TICK_PER_US)
#define Tick_Timer_Is_Over_Us(pTick, Time)  Tick_Timer_Is_Over(&pTick, Time, US)

#define Delay_Ms(Time)                      Delay(Time, MS)
#define Delay_Sec(Time)                     Delay(Time, SEC)
#define delay_ms(t)                         Delay_Ms(t)
#define delay_sec(t)                        Delay_Sec(t)
#define __delay_ms(t)                       Delay_Ms(t)
#define __delay_sec(t)                      Delay_Sec(t)

#define Tick_Timer_Read()                   _CP0_GET_COUNT()
#define Tick_GetTimeMs()                    (Tick_Timer_Get_TickVal() / TICK_PER_MS)
#define Tick_GetTimeSec()                   (Tick_Timer_Get_TickVal() / TICK_PER_SEC)
#define Tick_Timer_Is_Over_Ms(pTick, Time)  Tick_Timer_Is_Over(&pTick, Time, MS)
#define Tick_Timer_Is_Over_Sec(pTick, Time) Tick_Timer_Is_Over(&pTick, Time, SEC)
#define Elapse_Create(name, t)              do{name.Start=Tick_Timer_Get_TickVal(); name.Duration=t*TICK_PER_MS;}while(0)
#define Elapse_Get(name)                    ((Tick_Timer_Get_TickVal()-name.Start)>name.Duration?1:0)
#define Elapse_Update(name)                 name.Start=Tick_Timer_Get_TickVal()

#define Tick_Get()                          (_CP0_GET_COUNT())
#define Tick_GetUs(ms)                      (ms*TICK_PER_US)
#define Tick_Dif_Us(tk1, tk2)               (((tk1)-(tk2))/TICK_PER_US)

#define Tick_GetMs(ms)                      (ms*TICK_PER_MS)
#define Tick_GetSec(ms)                     (ms*TICK_PER_SEC)
#define Tick_Dif(tk1, tk2)                  (tick_t)((tk1)-(tk2))
#define Tick_Dif_Ms(tk1, tk2)               (tick_t)(((tk1)-(tk2))/TICK_PER_MS)
#define Tick_Dif_Sec(tk1, tk2)              (tick_t)(((tk1)-(tk2))/TICK_PER_SEC)

#endif