#include <xc.h>
#include "softWdt.h"
#include "TickTimer.h"

private gpio_pin_t WdtLed=NOT_USE;
private tick_timer_t Tick={1, 0, 0};
private simple_fnc_t CbFnc=NULL;

volatile uint32_t softWdtCount=0;
volatile uint32_t softWdtCountMax=NO_WDT;

public void SYS_SoftReset(void) // <editor-fold defaultstate="collapsed" desc="Software reset">
{
    uint32_t dummy;

    SYSKEY=0x0; //write invalid key to force lock
    SYSKEY=0xAA996655; //write Key1 to SYSKEY
    SYSKEY=0x556699AA; //write Key2 to SYSKEY
    RSWRSTSET=1;
    /* read RSWRST register to trigger reset */
    dummy=RSWRST;

    while(1)
        dummy--;
} // </editor-fold>

public void softWDT_Isr(void)
{
    WDTCONbits.WDTCLRKEY=0x5743;

    if(softWdtCountMax==0xFFFFFF) // No soft WDT
        return;

    if(++softWdtCount==softWdtCountMax)
    {
        if(CbFnc)
            CbFnc();

        SYSKEY=0x0; //write invalid key to force lock
        SYSKEY=0xAA996655; //write Key1 to SYSKEY
        SYSKEY=0x556699AA; //write Key2 to SYSKEY
        RSWRSTSET=1;
        /* read RSWRST register to trigger reset */
        softWdtCount=RSWRST;
        while(1);
    }
}

public new_simple_task_t(softWDT_Tasks) // <editor-fold defaultstate="collapsed" desc="WDT tasks">
{
    if(Tick_Timer_Is_Over_Ms(Tick, 500))
    {
        softWdtCount=0;
        Gpio_Toggle(WdtLed);
    }

    Task_Done();
} // </editor-fold>

public void softWDT_Enable(void) // <editor-fold defaultstate="collapsed" desc="WDT enable">
{
    Gpio_SetHigh(WdtLed);
    Tick_Timer_Reset(Tick);
    TaskManager_Create_NewSimpleTask(softWDT_Tasks);
} // </editor-fold>

public void softWDT_Disable(void) // <editor-fold defaultstate="collapsed" desc="WDT disable">
{
    Gpio_SetLow(WdtLed);
    TaskManager_End_Task(softWDT_Tasks);
} // </editor-fold>

public void softWDT_SetLedIndicator(gpio_pin_t pin)
{
    WdtLed=pin;
    Gpio_SetLow(pin);
    Gpio_SetDigitalOutput(pin);
}

public void softWDT_SetCbBeforeReset(simple_fnc_t fnc)
{
    CbFnc=fnc;
}