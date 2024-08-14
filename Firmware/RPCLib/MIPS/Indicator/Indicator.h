#ifndef INDICATOR_H
#define	INDICATOR_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"
#include "System/TickTimer.h"
#include "System/Gpio.h"

typedef __PACKED_STRUCT
{
    uint8_t ACTIVELOGIC;
    gpio_pin_t Pin;
}
ind_io_t;

typedef __PACKED_STRUCT IND_CXT_T{
    const ind_io_t IO;
    uint8_t Task;
    uint16_t Ton;
    uint16_t Toff;
    uint16_t Loop;
    tick_timer_t Tick;
    struct IND_CXT_T *Next;
}
ind_cxt_t;

// Defined in Indicator_Cfg.c
extern ind_cxt_t IndCfg0;

#define IND_LOOP_FOREVER        0xFFFF
#define Indicator_SetHigh(idx)  Indicator_SetState(idx, 1, 0, IND_LOOP_FOREVER)
#define Indicator_SetLow(idx)   Indicator_SetState(idx, 0, 1, IND_LOOP_FOREVER)
#define Indicator_OneShot(idx, Ton) Indicator_SetState(idx, Ton, 1, 1)
#define Indicator_Toggle(idx, Ton, Toff) Indicator_SetState(idx, Ton, Toff, IND_LOOP_FOREVER)

public void Indicator_Init(void);
public void Indicator_SetState(uint8_t Idx, uint16_t TOn, uint16_t TOff, uint16_t Loop);
public void Indicator_Stop(uint8_t Idx);

#endif