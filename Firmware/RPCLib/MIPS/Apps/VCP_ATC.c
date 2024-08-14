#include "VCP.h"
#include "VCP_ATC.h"
#include "AppMain.h"
#include "Indicator/Indicator.h"
#include "uart2.h"
#include "uart3.h"

private uint8_t CdcPortIdx=0;
private port_txbuf_t VcpAtcTxBuf={.next=0};
private port_rxbuf_t VcpAtcRxBuf;

private new_simple_task_t(VCP_ATC_Tasks) // <editor-fold defaultstate="collapsed" desc="VCP ATC Tasks">
{
    uint8_t i;

    if((USBGetDeviceState()<CONFIGURED_STATE)||(USBIsDeviceSuspended()==true))
        goto __HERE;

    if(VcpAtcTxBuf.ready)
    {
        // USB DCD1 to UART2
        VcpAtcRxBuf.len=getsUSBUSART(CdcPortIdx, VcpAtcRxBuf.buf, CDC_DATA_OUT_EP_SIZE);

        for(i=0; i<VcpAtcRxBuf.len; i++)
        {
            if(active_logic==0)
                Indicator_OneShot(0, 20);

            while(!UART2_IsTxReady());
            UART2_Write(VcpAtcRxBuf.buf[i]);
        }
        // UART2 to USB CDC1
        switch(VcpAtcTxBuf.next)
        {
            case 0: // Get RX data
                if(UART2_IsRxReady())
                {
                    i=0;

                    do
                    {
                        VcpAtcTxBuf.buf[i]=UART2_Read();

                        if(++i>=CDC_DATA_IN_EP_SIZE)
                            break;
                    }
                    while(UART2_IsRxReady());

                    VcpAtcTxBuf.len=i;
                    VcpAtcTxBuf.next=1;
                }
                else
                    break;

            case 1: // Put TX data
                if(USBUSARTIsTxTrfReady(1))
                {
                    VcpAtcTxBuf.next=2;
                    putUSBUSART(CdcPortIdx, VcpAtcTxBuf.buf, VcpAtcTxBuf.len);
                }
                break;

            default: // Waiting for TX done
                CDCTxService(CdcPortIdx);

                if(active_logic==0)
                    Indicator_OneShot(0, 20);

                if(USBUSARTIsTxTrfReady(CdcPortIdx)||(VcpAtcTxBuf.ready==0)) // check TX state again
                    VcpAtcTxBuf.next=0;
                break;
        }
    }
    else
    {
        Tick_Timer_Reset(VcpAtcTxBuf.tk);
        VcpAtcTxBuf.next=0;
    }

__HERE:
    if(VcpAtcTxBuf.ready==0)
    {
        VcpAtcTxBuf.next=0;
        i=0;

        while(UART2_IsRxReady())
        {
            if(UART3_IsTxReady())
            {
                UART3_Write(UART2_Read());

                if(active_logic==0)
                    Indicator_OneShot(0, 50);
            }

            if(++i>=CDC_DATA_IN_EP_SIZE) // prevent from RX pull down
                break;
        }

        i=0;

        while(UART3_IsRxReady())
        {
            if(UART2_IsTxReady())
            {
                UART2_Write(UART3_Read());

                if(active_logic==0)
                    Indicator_OneShot(0, 50);
            }

            if(++i>=CDC_DATA_IN_EP_SIZE) // prevent from RX pull down
                break;
        }
    }

    Task_Done();
} // </editor-fold>

private void CellUart_Enable(uint32_t dwDTERate) // <editor-fold defaultstate="collapsed" desc="CELL UART enable">
{
    uint32_t BaudValue;

    // TX pin init
    LATBbits.LATB3=1;
    TRISBbits.TRISB3=0;
    // RX pin init
    LATBbits.LATB4=0;
    TRISBbits.TRISB4=1;
    // Uart2 enable
    if(U2MODEbits.BRGH)
    {
        BaudValue=(CLOCK_SystemFrequencyGet()/(4*dwDTERate))-1;
        U2BRG=BaudValue;
    }
    else
    {
        BaudValue=(CLOCK_SystemFrequencyGet()/(16*dwDTERate))-1;
        U2BRG=BaudValue;
    }

    IEC1bits.U2TXIE=0;
    IEC1bits.U2RXIE=1;
    U2STASET=_U2STA_UTXEN_MASK;
    U2STASET=_U2STA_URXEN_MASK;
    U2MODESET=_U2MODE_ON_MASK;
} // </editor-fold>

private void CellUart_Disable(void) // <editor-fold defaultstate="collapsed" desc="CELL UART disable">
{
    if(U2MODEbits.ON==1)
    {
        UART2_Initialize(); // Reload default configure of UART2
        // Uart2 disable
        U2MODECLR=_U2MODE_ON_MASK;
        U2STACLR=_U2STA_UTXEN_MASK;
        U2STACLR=_U2STA_URXEN_MASK;
        IEC1bits.U2TXIE=0;
        IEC1bits.U2RXIE=0;
        // TX pin deinit
        LATBbits.LATB3=0;
        TRISBbits.TRISB3=0;
        // RX pin deinit
        LATBbits.LATB4=0;
        TRISBbits.TRISB4=0;
    }
} // </editor-fold>

private void LineCodingHandler(void) // <editor-fold defaultstate="collapsed" desc="Line coding handler">
{
    //Update the baudrate info in the CDC driver
    CDCSetBaudRate(cdc_notice.GetLineCoding.dwDTERate);
    CellUart_Disable();
    CellUart_Enable(cdc_notice.GetLineCoding.dwDTERate);
} // </editor-fold>

private void DTRPinHandler(char logic) // <editor-fold defaultstate="collapsed" desc="DTR pin handler">
{
    if(logic==USB_CDC_DTR_ACTIVE_LEVEL)
        VcpAtcTxBuf.ready=1;
    else
        VcpAtcTxBuf.ready=0;
} // </editor-fold>

public void VCP_ATC_Init(uint8_t PortIdx)
{
    CdcPortIdx=PortIdx;
    VcpAtcTxBuf.next=0;
    USB_CDC_SetLineCodingHandler(CdcPortIdx, LineCodingHandler);
    DTRPin_SetHandler(CdcPortIdx, DTRPinHandler);
    TaskManager_Create_NewSimpleTask(VCP_ATC_Tasks); // Cellular AT command
}