#ifndef TELITPWRCTRL_H
#define	TELITPWRCTRL_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

#define DEFAULT_TELIT_VCEL_STARTUP_MIN  3200 // mV
#define DEFAULT_TELIT_VCEL_PPWRDN_MIN   2700 // mV
#define DEFAULT_TELIT_VAUX_MIN          1350 // mV
#define DEFAULT_TELIT_VAUX_TIMEOUT      10000 // ms
#define DEFAULT_TELIT_ONOFF_PULSE       5500 // ms
#define DEFAULT_TELIT_ONOFF_TIMEOUT     3500 // ms
#define DEFAULT_TELIT_HWSDN_PULSE       12000 // ms
#define DEFAULT_TELIT_HWSDN_TIMEOUT     3500 // ms
#define DEFAULT_TELIT_FSDN_PULSE        800 // ms
#define DEFAULT_TELIT_FSDN_TIMEOUT      3500 // ms
#define DEFAULT_TELIT_SWRDY_WAIT        1000 // ms
#define DEFAULT_TELIT_PWR_DISCHR_WAIT   3000 // ms

typedef __PACKED_STRUCT
{
    uint16_t TELIT_VCEL_STARTUP_MIN;
    uint16_t TELIT_VCEL_PPWRDN_MIN;
    uint16_t TELIT_VAUX_MIN;
    uint16_t TELIT_VAUX_TIMEOUT;
    uint16_t TELIT_ONOFF_PULSE;
    uint16_t TELIT_ONOFF_TIMEOUT;
    uint16_t TELIT_HWSDN_PULSE;
    uint16_t TELIT_HWSDN_TIMEOUT;
    uint16_t TELIT_FSDN_PULSE;
    uint16_t TELIT_FSDN_TIMEOUT;
    uint16_t TELIT_SWRDY_WAIT;
    uint16_t TELIT_PWR_DISCHR_WAIT;
}
telitpwrctrl_para_t;

typedef union {
    uint8_t val;

    struct {
        unsigned dischrErr : 1; // VCEL discharge error
        unsigned vcelRdy : 1; // VCEL ready
        unsigned vauxRdy : 1; // VAUX ready
        unsigned swRdy : 1; // Software ready
        unsigned reboot : 1; // Reboot state
        unsigned rfu : 2; // Unused
        unsigned busy : 1; // Internal process is in progress
    };
} telit_stt_t;

extern telit_stt_t TelitState;
extern const telitpwrctrl_para_t TelitPara;

//Defined in TelitPwrCtrl_Cfg.c
void TELIT_HWSDN_SetState(bool);
void TELIT_FSDN_SetState(bool);
void TELIT_PWREN_SetState(bool);
void TELIT_ONOFF_SetState(bool);
bool TELIT_SWRDY_GetState(void);
uint16_t TELIT_VCEL_Get(void);
uint16_t TELIT_VAUX_Get(void);

#define Telit_Ready()               ((TelitState.val&0b10011111)==0b10001110)
#define Telit_IsBusy()              (TelitState.busy==1)
#define Telit_PwrCtrl_GetState()    (TelitState)

void Telit_PwrCtrl_Init(void);
void Telit_PwrCtrl_Tasks(void*);
void Telit_TurnOn(bool dischrFirst, uint8_t Retry);
void Telit_TurnOff(void);
bool Telit_PwrCtrl_IsError(void);

#endif

