#include "Sensors/GP2Y101xAU.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"
#include "pin_manager.h"
#include "adc1.h"

void GP2Y101xAU_PowerSetState(bool onoff)
{
    DUST_EN_SetValue(onoff);
}

void GP2Y101xAU_LedSetState(bool onoff)
{
    if(onoff==0)
    {
        DUST_IREN_N_SetLow();
        DUST_IREN_N_SetDigitalOutput();
    }
    else
        DUST_IREN_N_SetDigitalInput();
}

void GP2Y101xAU_AdcInit(void)
{

}

uint16_t GP2Y101xAU_GetVoltage(void)
{
    uint32_t tmp;

    ADC1_ChannelSelect(DUST_SEN);
    ADC1_Start();
    __delay_us(20);
    ADC1_Stop();

    while(!ADC1_IsConversionComplete())
        ADC1_Tasks();

    tmp=ADC1_ConversionResultGet();
    tmp*=3300; // VREF
    tmp/=4096; // ADC resolution

    return (uint16_t) tmp;
}

void GP2Y101xAU_DelayUs(uint32_t us)
{
    tick_timer_t Tk;

    Tick_Timer_Reset(Tk);

    while(!Tick_Timer_Is_Over_Us(Tk, us))
        TaskManager();
}