#include "TelitPwrCtrl.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"

#ifdef USE_TELITPWRCTRL_DEBUG
#include "Common/Debug.h"
#else
#define __dbs(...)
#define __dbs_t(...)
#define __dbsu_t(...)
#define __tsdbs(...)
#define __tsdbsu_t(...)
#define __tsdbs_t(...)
#endif

typedef enum
{
    PWRCTRL_INIT=0, // 0
    PWRCTRL_MODULE_OFF, // 1
    PWRCTRL_DISCHR, // 2
    PWRCTRL_PWREN, // 3
    PWRCTRL_TRIG_ON, // 4
    PWRCTRL_CHECK_VAUX, // 5
    PWRCTRL_CHECK_SWRDY, // 6
    PWRCTRL_MODULE_RDY, // 7
    PWRCTRL_TRIG_FSDN, // 8
    PWRCTRL_RELEASE_FSDN, // 9
    PWRCTRL_TRIG_OFF, // 10
    PWRCTRL_RELEASE_OFF, // 11
    PWRCTRL_TRIG_HWSDN, // 12
    PWRCTRL_RELEASE_HWSDN, // 13
    PWRCTRL_PWRDISABLE // 14
} pwrctrl_task_t;

typedef struct
{
    uint8_t dischr;
    uint8_t vcell;
    uint8_t vaux;
    uint8_t swrdy;
    uint8_t reboot;
} pwr_try_t;

static struct
{
    uint8_t Retry;
    pwr_try_t Count;
    tick_timer_t Tick;
    pwrctrl_task_t Now;
    pwrctrl_task_t Next;
} PwrCtrlCxt;

telit_stt_t TelitState; // Global variable

public new_simple_task_t(Telit_PwrCtrl_Tasks) // <editor-fold defaultstate="collapsed" desc="Power control task">
{
    if(TelitState.vcelRdy==0)
    {
        if(TELIT_VCEL_Get()>=TelitPara.TELIT_VCEL_STARTUP_MIN)
            TelitState.vcelRdy=1;
    }
    else if(TELIT_VCEL_Get()<TelitPara.TELIT_VCEL_PPWRDN_MIN)
        TelitState.vcelRdy=0;

    if(TELIT_VAUX_Get()>=TelitPara.TELIT_VAUX_MIN)
        TelitState.vauxRdy=1;
    else
        TelitState.vauxRdy=0;

    if(TELIT_SWRDY_GetState())
        TelitState.swRdy=1;
    else
        TelitState.swRdy=0;

    switch(PwrCtrlCxt.Now)
    {
        default:
        case PWRCTRL_MODULE_OFF: // Do nothing
            TelitState.busy=0;
            __tsdbs_t("Close task: Telit_PwrCtrl_Tasks");
            TaskManager_End_Task(Telit_PwrCtrl_Tasks);
            break;

        case PWRCTRL_INIT:
            TELIT_PWREN_SetState(0);
            TELIT_HWSDN_SetState(0);
            TELIT_FSDN_SetState(0);
            TELIT_ONOFF_SetState(0);
            Tick_Timer_Reset(PwrCtrlCxt.Tick);
            PwrCtrlCxt.Now=PwrCtrlCxt.Next;
            __tsdbsu_t("Prog=", PwrCtrlCxt.Now);
            break;

        case PWRCTRL_DISCHR:
            TelitState.dischrErr=0;

            if(TELIT_VCEL_Get()<400)
            {
                Tick_Timer_Reset(PwrCtrlCxt.Tick);
                PwrCtrlCxt.Now=PWRCTRL_PWREN;
                PwrCtrlCxt.Count.dischr=0;
                __tsdbs_t("Pwr ena");
            }
            else if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_PWR_DISCHR_WAIT)) // Power is not ready in TELIT_PWR_DISCHR_WAIT ms
            {
                __tsdbsu_t("DisChr err: ", TELIT_VCEL_Get());
                TelitState.dischrErr=1;
                PwrCtrlCxt.Now=PWRCTRL_INIT;

                if(PwrCtrlCxt.Count.dischr<PwrCtrlCxt.Retry)
                {
                    PwrCtrlCxt.Count.dischr++;
                    __dbsu_t(", retry ", PwrCtrlCxt.Count.dischr);
                }
                else
                    PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
            }
            break;

        case PWRCTRL_PWREN:
            TELIT_PWREN_SetState(1);

            if(TelitState.vcelRdy==1)
            {
                PwrCtrlCxt.Now=PWRCTRL_TRIG_ON;
                PwrCtrlCxt.Count.vcell=0;
                Tick_Timer_Reset(PwrCtrlCxt.Tick);
                __tsdbsu_t("Pwr ready: ", TELIT_VCEL_Get());
                __dbs_t(", Trig on");
            }
            else if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, 1000)) // Power is not ready in 1000ms
            {
                __tsdbsu_t("Pwr err: ", TELIT_VCEL_Get());
                PwrCtrlCxt.Now=PWRCTRL_INIT;

                if(PwrCtrlCxt.Count.vcell<PwrCtrlCxt.Retry)
                {
                    PwrCtrlCxt.Count.vcell++;
                    __dbsu_t(", retry ", PwrCtrlCxt.Count.vcell);
                }
                else
                    PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
            }
            break;

        case PWRCTRL_TRIG_ON:
            TELIT_ONOFF_SetState(1);

            if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_ONOFF_PULSE))
            {
                TELIT_ONOFF_SetState(0);
                PwrCtrlCxt.Now=PWRCTRL_CHECK_VAUX;
                __tsdbs_t("Check Vaux");
            }

            break;

        case PWRCTRL_CHECK_VAUX:
            if(TelitState.vauxRdy==1)
            {
                PwrCtrlCxt.Now=PWRCTRL_CHECK_SWRDY;
                PwrCtrlCxt.Count.vaux=0;
                Tick_Timer_Reset(PwrCtrlCxt.Tick);
                __tsdbs_t("Check SwRdy");
            }
            else if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_VAUX_TIMEOUT)) // VAUX is not ready in TELIT_VAUX_TIMEOUT ms
            {
                __tsdbsu_t("Vaux err: ", TELIT_VAUX_Get());
                PwrCtrlCxt.Now=PWRCTRL_INIT;

                if(PwrCtrlCxt.Count.vaux<PwrCtrlCxt.Retry)
                {
                    PwrCtrlCxt.Count.vaux++;
                    __dbsu_t(", retry ", PwrCtrlCxt.Count.vaux);
                }
                else
                    PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
            }
            break;

        case PWRCTRL_CHECK_SWRDY:
            if(TelitState.swRdy==1)
            {
                PwrCtrlCxt.Now=PWRCTRL_MODULE_RDY;
                PwrCtrlCxt.Count.swrdy=0;
                Tick_Timer_Reset(PwrCtrlCxt.Tick);
                __tsdbs_t("SwRdy Ok");
            }
            else if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_SWRDY_WAIT)) // SWRDY is not ready in TELIT_SWRDY_WAIT ms
            {
                __tsdbs_t("SwRdy err, Turn off");
                PwrCtrlCxt.Now=PWRCTRL_TRIG_FSDN;

                if(PwrCtrlCxt.Count.swrdy<PwrCtrlCxt.Retry)
                {
                    PwrCtrlCxt.Count.swrdy++;
                    __dbsu_t(", retry ", PwrCtrlCxt.Count.swrdy);
                }
                else
                    PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
            }
            break;

        case PWRCTRL_MODULE_RDY:
            if(TelitState.vcelRdy==1)
            {
                if(TelitState.vauxRdy==1)
                {
                    TelitState.reboot=0;
                    Tick_Timer_Reset(PwrCtrlCxt.Tick);
                }
                else
                {
                    TelitState.reboot=1;

                    if(TelitPara.TELIT_VAUX_TIMEOUT>0)
                    {
                        if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_VAUX_TIMEOUT)) // VAUX is not ready in TELIT_VAUX_TIMEOUT ms
                        {
                            __tsdbsu_t("Vaux lost: ", TELIT_VAUX_Get());
                            PwrCtrlCxt.Now=PWRCTRL_INIT;

                            if(PwrCtrlCxt.Count.reboot<PwrCtrlCxt.Retry)
                            {
                                PwrCtrlCxt.Count.reboot++;
                                __dbsu_t(", retry ", PwrCtrlCxt.Count.reboot);
                            }
                            else
                                PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
                        }
                    }
                }
            }
            else
            {
                // The Status is not be updated here.
                __tsdbsu_t("Vin low: ", TELIT_VCEL_Get());
                __dbs_t(", Power off");
                PwrCtrlCxt.Now=PWRCTRL_TRIG_FSDN;
                PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
            }
            break;

        case PWRCTRL_TRIG_FSDN:
            TELIT_FSDN_SetState(1);
            Tick_Timer_Reset(PwrCtrlCxt.Tick);
            PwrCtrlCxt.Now=PWRCTRL_RELEASE_FSDN;
            __tsdbs_t("Trig Fsdn");
            break;

        case PWRCTRL_RELEASE_FSDN:
            if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_FSDN_PULSE))
            {
                TELIT_FSDN_SetState(0);
                PwrCtrlCxt.Now=PWRCTRL_TRIG_OFF;
                __tsdbs_t("Rel Fsdn");
            }
            break;

        case PWRCTRL_TRIG_OFF:
            if(TelitState.vauxRdy==1)
            {
                if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_FSDN_TIMEOUT))
                {
                    TELIT_ONOFF_SetState(1);
                    PwrCtrlCxt.Now=PWRCTRL_RELEASE_OFF;
                    __tsdbs_t("Trig off");
                }
            }
            else
            {
                Tick_Timer_Reset(PwrCtrlCxt.Tick);
                PwrCtrlCxt.Now=PWRCTRL_PWRDISABLE;
            }
            break;

        case PWRCTRL_RELEASE_OFF:
            if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_ONOFF_PULSE))
            {
                TELIT_ONOFF_SetState(0);
                PwrCtrlCxt.Now=PWRCTRL_TRIG_HWSDN;
                __tsdbs_t("Rel off");
            }
            break;

        case PWRCTRL_TRIG_HWSDN:
            if(TelitState.vauxRdy==1)
            {
                if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_ONOFF_TIMEOUT))
                {
                    TELIT_HWSDN_SetState(1);
                    PwrCtrlCxt.Now=PWRCTRL_RELEASE_HWSDN;
                    __tsdbs_t("Trig hwsdn");
                }
            }
            else
            {
                Tick_Timer_Reset(PwrCtrlCxt.Tick);
                PwrCtrlCxt.Now=PWRCTRL_PWRDISABLE;
            }
            break;

        case PWRCTRL_RELEASE_HWSDN:
            if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_HWSDN_PULSE))
            {
                TELIT_HWSDN_SetState(0);
                PwrCtrlCxt.Now=PWRCTRL_PWRDISABLE;
                __tsdbs_t("Rel hwsdn");
            }
            break;

        case PWRCTRL_PWRDISABLE:
            if(TelitState.vauxRdy==1)
            {
                if(Tick_Timer_Is_Over_Ms(PwrCtrlCxt.Tick, TelitPara.TELIT_HWSDN_TIMEOUT))
                    __tsdbs_t("Force pwr dis");
                else
                    break;
            }

            PwrCtrlCxt.Now=PWRCTRL_INIT;
            break;
    }

    Task_Done();
} // </editor-fold>

void Telit_TurnOn(bool dischrFirst, uint8_t Retry) // <editor-fold defaultstate="collapsed" desc="Turn on the module">
{
    if(Telit_Ready()==0)
    {
        __tsdbs("Turn on");
        TelitState.busy=1;
        TelitState.reboot=1;
        PwrCtrlCxt.Retry=Retry;
        PwrCtrlCxt.Count.dischr=0;
        PwrCtrlCxt.Count.reboot=0;
        PwrCtrlCxt.Count.swrdy=0;
        PwrCtrlCxt.Count.vaux=0;
        PwrCtrlCxt.Count.vcell=0;
        PwrCtrlCxt.Now=PWRCTRL_INIT;

        if(dischrFirst==1)
            PwrCtrlCxt.Next=PWRCTRL_DISCHR;
        else
            PwrCtrlCxt.Next=PWRCTRL_PWREN;

        __dbs("\nCreate task: Telit_PwrCtrl_Tasks");
        TaskManager_Create_NewSimpleTask(Telit_PwrCtrl_Tasks);
    }
    else
        __tsdbs("Already on");
} // </editor-fold>

void Telit_TurnOff(void) // <editor-fold defaultstate="collapsed" desc="Turn off the module">
{
    if(TelitState.vauxRdy==1)
    {
        TELIT_FSDN_SetState(1);
        PwrCtrlCxt.Now=PWRCTRL_TRIG_FSDN;
        PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
        __tsdbs("Turn off");
    }
    else if(PwrCtrlCxt.Now!=PWRCTRL_INIT)
    {
        PwrCtrlCxt.Now=PWRCTRL_INIT;
        PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
        __tsdbs("Force off");
    }
    else
        __tsdbs("Already off");
} // </editor-fold>

bool Telit_PwrCtrl_IsError(void) // <editor-fold defaultstate="collapsed" desc="Check error state">
{
    if((TelitState.val&0b00010001)>0) // reboot & discharge error
        return 1;

    if((TelitState.val&0b00001110)<0b00001110)// no Sw Rdy, no VAUX, no Vcel
        return 1;

    return 0;
} // </editor-fold>

void Telit_PwrCtrl_Init(void) // <editor-fold defaultstate="collapsed" desc="Initialize">
{
    Tick_Timer_Reset(PwrCtrlCxt.Tick);
    TelitState.val=0;
    PwrCtrlCxt.Now=PWRCTRL_INIT;
    PwrCtrlCxt.Next=PWRCTRL_MODULE_OFF;
} // </editor-fold>