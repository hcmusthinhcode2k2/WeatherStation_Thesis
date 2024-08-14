#include "Cellular/TelitPwrCtrl.h"
#include "pin_manager.h"
#include "Power_Monitor.h"
#include "System/TickTimer.h"

const telitpwrctrl_para_t TelitPara={
    3400,
    2800,
    DEFAULT_TELIT_VAUX_MIN,
    DEFAULT_TELIT_VAUX_TIMEOUT,
    DEFAULT_TELIT_ONOFF_PULSE,
    DEFAULT_TELIT_ONOFF_TIMEOUT,
    DEFAULT_TELIT_HWSDN_PULSE,
    DEFAULT_TELIT_HWSDN_TIMEOUT,
    DEFAULT_TELIT_FSDN_PULSE,
    DEFAULT_TELIT_FSDN_TIMEOUT,
    10000,
    DEFAULT_TELIT_PWR_DISCHR_WAIT
};

void TELIT_HWSDN_SetState(bool x)
{
    // Not designed on this device
}

void TELIT_FSDN_SetState(bool x)
{
    // Not designed on this device
}

void TELIT_PWREN_SetState(bool x)
{
    VNB_EN_SetValue(x);
    VIO_EN_SetValue(x);
}

void TELIT_ONOFF_SetState(bool x)
{
    NB_ONOFF_SetValue(x);
}

bool TELIT_SWRDY_GetState(void)
{
    static tick_timer_t Tk={1, 0, 0};

    // Not designed on this device
    if(Tick_Timer_Is_Over_Ms(Tk, 5000))
        return 1;

    return 0;
}

uint16_t TELIT_VCEL_Get(void)
{
    return GetVNb();
}

uint16_t TELIT_VAUX_Get(void)
{
    return GetVNbAux();
}
