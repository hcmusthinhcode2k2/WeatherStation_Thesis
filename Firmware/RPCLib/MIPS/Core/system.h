#ifndef SYSTEM_H
#define	SYSTEM_H

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

#define _XTAL_FREQ  24000000UL
#define WDT_CLR_KEY 0x5743

extern uint32_t system_task_count;

#define SYSTEM_SetBusy() system_busy=1

inline static void SYSTEM_RegUnlock(void) {
    SYSKEY = 0x0; //write invalid key to force lock
    SYSKEY = 0xAA996655; //write Key1 to SYSKEY
    SYSKEY = 0x556699AA; //write Key2 to SYSKEY
}

inline static void SYSTEM_RegLock(void) {
    SYSKEY = 0x00000000;
}

void SYSTEM_Initialize(void);
void SYSTEM_SleepControl(void);

#endif
