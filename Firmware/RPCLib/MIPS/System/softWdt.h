#ifndef SOFTWDT_H
#define	SOFTWDT_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"
#include "Gpio.h"
#include "TaskManager.h"

extern volatile uint32_t softWdtCount;
extern volatile uint32_t softWdtCountMax;

public void SYS_SoftReset(void);
public void softWDT_Tasks(void *);
public void softWDT_Enable(void);
public void softWDT_Disable(void);
public void softWDT_SetLedIndicator(gpio_pin_t pin);
public void softWDT_SetCbBeforeReset(simple_fnc_t fnc);

public void softWDT_Isr(void); // Call this function in timer interrupt

#define NO_WDT  0xFFFFFFFF

static inline void softWDT_Init(uint32_t tout, gpio_pin_t led, simple_fnc_t cb) {
    softWdtCountMax = tout;
    softWdtCount = 0;
    softWDT_SetLedIndicator(led);
    softWDT_SetCbBeforeReset(cb);
    softWDT_Enable();
    CORETIMER_SetInterruptHandler(softWDT_Isr);
}

#define ClrWdt() TaskManager()

#endif