#include "Power_Monitor.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"
#include "Common/Utils.h"

static pwrmoni_buf_t PwrMoniBuff[ADC_CHANNEL_COUNT];

uint16_t Power_Monitor_Get(ADC1_CHANNEL Channel) // <editor-fold defaultstate="collapsed" desc="Get voltage">
{
    uint32_t tmp=PwrMoniBuff[Channel].Val;

    switch(Channel)
    {
        case UNO_VREF:
        case UNO_AN3:
        case VBAT_DIV:
        case UNO_AN1:
        case UNO_AN2:
        case CHANNEL_VBG:
        case CHANNEL_VDD_core:
        case CHANNEL_AVSS:
        case CHANNEL_AVDD:
            tmp*=ADC_VREF;
            tmp/=ADC_RESOLUTION;
            break;

        default:
            tmp=0;
            break;
    }

    return (uint16_t) tmp;
} // </editor-fold>

private new_delay_task_t(Power_Monitor_Tasks) // <editor-fold defaultstate="collapsed" desc="Power monitor tasks">
{
    static ADC1_CHANNEL ch=UNO_VREF;

    ch=UNO_VREF;
    
    while(ch<(UNO_VREF+ADC_CHANNEL_COUNT))
    {
        ADC1_ChannelSelect(ch);
        ADC1_Start();
        Task_Delay(Power_Monitor_Tasks, 1);
        ADC1_Stop();

        while(!AD1CON1bits.DONE)
            ADC1_Tasks();

        PwrMoniBuff[ch].Val=iir(&PwrMoniBuff[ch].Iir, (uint16_t) ADC1BUF0, 2);
        ch++;
    }

    Task_Done();
} // </editor-fold>

void Power_Monitor_Init(void) // <editor-fold defaultstate="collapsed" desc="Power monitor init">
{
    TaskManager_Create_NewDelayTask(Power_Monitor_Tasks);
} // </editor-fold>