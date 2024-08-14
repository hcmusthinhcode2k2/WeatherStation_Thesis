#include "Cellular/TelitPwrCtrl.h"
#include "pin_manager.h"

const telitpwrctrl_para_t TelitPara={
    DEFAULT_TELIT_VCEL_STARTUP_MIN,
    DEFAULT_TELIT_VCEL_PPWRDN_MIN,
    DEFAULT_TELIT_VAUX_MIN,
    DEFAULT_TELIT_VAUX_TIMEOUT,
    DEFAULT_TELIT_ONOFF_PULSE,
    DEFAULT_TELIT_ONOFF_TIMEOUT,
    DEFAULT_TELIT_HWSDN_PULSE,
    DEFAULT_TELIT_HWSDN_TIMEOUT,
    DEFAULT_TELIT_FSDN_PULSE,
    DEFAULT_TELIT_FSDN_TIMEOUT,
    DEFAULT_TELIT_SWRDY_WAIT,
    DEFAULT_TELIT_PWR_DISCHR_WAIT
};

void TELIT_HWSDN_SetState(bool x)
{
    CELL_HWSDN_SetValue(x);
}

void TELIT_FSDN_SetState(bool x)
{
    // Not designed on this device
}

void TELIT_PWREN_SetState(bool x)
{
    CELL_PWR_EN_SetValue(x);
}

void TELIT_ONOFF_SetState(bool x)
{
    // Not designed on this device
}

bool TELIT_SWRDY_GetState(void)
{
    // Not designed on this device
    return 1;
}

uint16_t TELIT_VCEL_Get(void)
{
    if(CELL_PWR_EN_GetValue())
        return 4000;

    return 0;
}

uint16_t TELIT_VAUX_Get(void)
{
    return 1800;
}
