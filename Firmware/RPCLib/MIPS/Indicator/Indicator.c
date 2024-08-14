#include "Indicator.h"
#include "System/TaskManager.h"

static ind_cxt_t *pInd=NULL;

private new_simple_task_t(Indicator_Tasks)
{
    pInd=&IndCfg0;

    while(pInd!=NULL)
    {
        if(pInd->Task==0)
        {
            if(Tick_Timer_Is_Over_Ms(pInd->Tick, pInd->Ton))
            {
                Gpio_SetState(pInd->IO.Pin, ~pInd->IO.ACTIVELOGIC);

                if(pInd->Loop==IND_LOOP_FOREVER)
                    pInd->Task=0x01;
                else if(pInd->Loop>1)
                {
                    pInd->Loop--;
                    pInd->Task=0x01;
                }
                else
                    pInd->Task=0xFF;
            }
        }
        else if(pInd->Task==1)
        {
            if(Tick_Timer_Is_Over_Ms(pInd->Tick, pInd->Toff))
            {
                pInd->Task=0x00;
                Gpio_SetState(pInd->IO.Pin, pInd->IO.ACTIVELOGIC);
            }
            break;
        }

        pInd=pInd->Next;
    }

    Task_Done();
}

public void Indicator_Init(void)
{
    pInd=&IndCfg0;

    while(pInd!=NULL)
    {
        pInd->Loop=0;
        pInd->Task=0;
        Tick_Timer_Reset(pInd->Tick);
        Gpio_SetState(pInd->IO.Pin, ~pInd->IO.ACTIVELOGIC);
        Gpio_SetDigitalOutput(pInd->IO.Pin);
        pInd=pInd->Next;
    }

    pInd=&IndCfg0;
    TaskManager_Create_NewSimpleTask(Indicator_Tasks);
}

public void Indicator_SetState(uint8_t Idx, uint16_t TOn, uint16_t TOff, uint16_t Loop)
{
    uint8_t cnt;
    ind_cxt_t *p=&IndCfg0;

    cnt=0;

    while(cnt<Idx)
    {
        p=p->Next;

        if(p==NULL) // not found
            return;

        cnt++;
    }

    p->Task=0xFF;
    // Update new config
    if(TOn==0)
        Gpio_SetState(p->IO.Pin, ~p->IO.ACTIVELOGIC);
    else if(TOff==0)
        Gpio_SetState(p->IO.Pin, p->IO.ACTIVELOGIC);
    else
    {
        p->Ton=TOn;
        p->Toff=TOff;
        p->Loop=Loop;

        if(Loop>0)
        {
            p->Task=0;
            Gpio_SetState(p->IO.Pin, p->IO.ACTIVELOGIC);
            Tick_Timer_Reset(p->Tick);
        }
        else
            Gpio_SetState(p->IO.Pin, ~p->IO.ACTIVELOGIC);
    }
}

public void Indicator_Stop(uint8_t Idx)
{
    uint8_t cnt;
    ind_cxt_t *p=&IndCfg0;

    cnt=0;

    while(cnt<Idx)
    {
        p=p->Next;

        if(p==NULL) // not found
            return;

        cnt++;
    }

    Gpio_SetState(p->IO.Pin, ~p->IO.ACTIVELOGIC);
    p->Task=0xFF;
}