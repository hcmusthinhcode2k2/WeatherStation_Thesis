#include "GP2Y101xAU.h"
#include "Common/Utils.h"

#define SAMPLING_TIME_US    280
#define DELTA_TIME_US       40
#define SLEEP_TIME_US       9680

uint32_t iirFilter=0;

bool GP2Y101xAU_Init(void)
{
    GP2Y101xAU_PowerSetState(GP2Y101xAU_ON);
    GP2Y101xAU_DelayUs(10000);
    GP2Y101xAU_LedSetState(GP2Y101xAU_OFF);
    GP2Y101xAU_AdcInit();
    iirFilter=0;

    return 1;
}

void GP2Y101xAU_Deinit(void)
{
    GP2Y101xAU_PowerSetState(GP2Y101xAU_OFF);
}

float GP2Y101xAU_GetDustDensity(void)
{
    int i;
    float dustDensity=0.0;
    uint32_t calcVoltage=0;

    for(i=0; i<10; i++)
    {
        uint16_t vol;

        GP2Y101xAU_LedSetState(GP2Y101xAU_ON);
        GP2Y101xAU_DelayUs(SAMPLING_TIME_US);
        vol=GP2Y101xAU_GetVoltage();
        GP2Y101xAU_LedSetState(GP2Y101xAU_OFF);
        GP2Y101xAU_DelayUs(SLEEP_TIME_US);
        calcVoltage=iir(&iirFilter, vol, 2);
        dustDensity+=0.17*(float) calcVoltage-0.1;
    }

    return dustDensity/10.0;
}
