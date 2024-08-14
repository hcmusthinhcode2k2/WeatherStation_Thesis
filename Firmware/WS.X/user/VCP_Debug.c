#include "VCP.h"
#include "VCP_Debug.h"

private uint8_t CdcPortIdx=0;
private port_txbuf_t VcpDbgTxBuf={.next=0};
private port_rxbuf_t VcpDbgRxBuf;

public void VCP_Debug_Write(uint8_t c) // <editor-fold defaultstate="collapsed" desc="Debug write a byte">
{
    Tick_Timer_Reset(VcpDbgTxBuf.tk);

    while(VcpDbgTxBuf.len==CDC_DATA_IN_EP_SIZE)
    {
        if(VcpDbgTxBuf.ready==0)
        {
            VcpDbgTxBuf.len=0;
            return;
        }

        TaskManager();
    }

    VcpDbgTxBuf.buf[VcpDbgTxBuf.len++]=c;
} // </editor-fold>

private new_simple_task_t(VCP_Debug_Tasks) // <editor-fold defaultstate="collapsed" desc="VCP debug tasks">
{
    if((USBGetDeviceState()<CONFIGURED_STATE)||(USBIsDeviceSuspended()==true))
        Task_Break();

    if(VcpDbgTxBuf.ready)
    {
        // USB CDC0 get data
        VcpDbgRxBuf.len=getsUSBUSART_CMD(CdcPortIdx, VcpDbgRxBuf.buf, CDC_DATA_OUT_EP_SIZE);

        if(VcpDbgRxBuf.len>0)
        {
            VcpDbgRxBuf.buf[VcpDbgRxBuf.len]=0x00;

            if(VcpDbgRxBuf.cbfnc!=NULL)
                VcpDbgRxBuf.cbfnc(VcpDbgRxBuf.buf);
        }
        // USB CDC0 put data
        switch(VcpDbgTxBuf.next)
        {
            case 0:
                if(Tick_Timer_Is_Over_Ms(VcpDbgTxBuf.tk, 10)||(VcpDbgTxBuf.len==CDC_DATA_IN_EP_SIZE))
                {
                    if(VcpDbgTxBuf.len>0)
                        VcpDbgTxBuf.next=1;
                    else
                        break;
                }
                else
                    break;

            case 1:
                if(USBUSARTIsTxTrfReady(0))
                {
                    VcpDbgTxBuf.next=2;
                    putUSBUSART(CdcPortIdx, VcpDbgTxBuf.buf, VcpDbgTxBuf.len);
                }
                break;

            default: // Waiting for TX done
                CDCTxService(CdcPortIdx);

                if(USBUSARTIsTxTrfReady(CdcPortIdx)) // check TX state again
                {
                    VcpDbgTxBuf.next=0;
                    VcpDbgTxBuf.len=0;
                    Tick_Timer_Reset(VcpDbgTxBuf.tk);
                }
                break;
        }
    }
    else
    {
        Tick_Timer_Reset(VcpDbgTxBuf.tk);
        VcpDbgTxBuf.next=0;
        VcpDbgTxBuf.len=0;
    }

    Task_Done();
} // </editor-fold>

public void VCP_Debug_SetRxCallback(void (*cbfnc)(uint8_t *)) // <editor-fold defaultstate="collapsed" desc="VCP Debug set RX callback">
{
    VcpDbgRxBuf.cbfnc=cbfnc;
} // </editor-fold>

private void DTRPinHandler(char logic) // <editor-fold defaultstate="collapsed" desc="DTR pin handler">
{
    if(logic==USB_CDC_DTR_ACTIVE_LEVEL)
        VcpDbgTxBuf.ready=1;
    else
        VcpDbgTxBuf.ready=0;
} // </editor-fold>

public void VCP_Debug_Init(uint8_t PortIdx) // <editor-fold defaultstate="collapsed" desc="VCP debug initialize">
{
    CdcPortIdx=PortIdx;
    VcpDbgTxBuf.next=0;
    DTRPin_SetHandler(CdcPortIdx, DTRPinHandler);
    TaskManager_Create_NewSimpleTask(VCP_Debug_Tasks);
} // </editor-fold>