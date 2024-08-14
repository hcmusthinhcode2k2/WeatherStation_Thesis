#include "Power_Monitor.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"
#include "Common/Utils.h"

static pwrmoni_buf_t PwrMoniBuff[8];

uint16_t Power_Monitor_Get(pwrmoni_ch_t Channel) // <editor-fold defaultstate="collapsed" desc="Get voltage">
{
    uint32_t tmp=PwrMoniBuff[Channel].Val;

    switch(Channel)
    {
            // External channels
        case CH_V5V_SEN:
            tmp*=5247;
            tmp/=1024;
            break;

        case CH_VBAT_SEN:
            tmp*=56925;
            tmp/=1024;
            break;

        case CH_NB_VAUX_SEN:
        case CH_BAND_GAP:
        case CH_VCORE:
            tmp*=825;
            tmp/=1024;
            break;

        case CH_VNB_SEN:
            tmp*=15125;
            tmp/=4096;
            break;

        case CH_VSOLAR_SEN:
            tmp*=4983;
            tmp/=4096;
            break;

        default:
            tmp=0;
            break;
    }

    return (uint16_t) tmp;
} // </editor-fold>

private new_delay_task_t(Power_Monitor_Tasks) // <editor-fold defaultstate="collapsed" desc="Power monitor tasks">
{
    static pwrmoni_ch_t ch=CH_V5V_SEN;

    ch=CH_V5V_SEN;
    
    while(ch<CH_END)
    {
        switch(ch)
        {
                // External channels
            case CH_V5V_SEN:
                ADC1_ChannelSelect(V5V_SEN);
                break;

            case CH_VBAT_SEN:
                ADC1_ChannelSelect(VBAT_SEN);
                break;

            case CH_NB_VAUX_SEN:
                ADC1_ChannelSelect(NB_VAUX_SEN);
                break;

            case CH_VNB_SEN:
                ADC1_ChannelSelect(VNB_SEN);
                break;

            case CH_VSOLAR_SEN:
                ADC1_ChannelSelect(VSOLAR_SEN);
                break;

                // Internal channels
            case CH_VCORE:
                ADC1_ChannelSelect(ADC1_CHANNEL_VDD_CORE);
                break;

            case CH_BAND_GAP:
                ADC1_ChannelSelect(ADC1_CHANNEL_VBG);
                break;

            default:
                Task_Break();
        }

        ADC1_Start();
        Task_Delay(Power_Monitor_Tasks, 1);
        ADC1_Stop();

        while(!ADC1_IsConversionComplete())
            ADC1_Tasks();

        PwrMoniBuff[ch].Val=iir(&PwrMoniBuff[ch].Iir, ADC1_ConversionResultGet(), 2);
        ch++;
    }

    Task_Done();
} // </editor-fold>

void Power_Monitor_Init(void) // <editor-fold defaultstate="collapsed" desc="Power monitor init">
{
    TaskManager_Create_NewDelayTask(Power_Monitor_Tasks);
} // </editor-fold>