#include <stdio.h>
#include "usb_device_cdc.h"
#include "usb.h"

#if(0)
#include "Common/TinyPrintf.h"
#else
#define __tsdbsu(...)
#define __tsdbs(...)
#define __dbsu(...)
#endif

#ifndef FIXED_ADDRESS_MEMORY
#define IN_DATA_BUFFER_ADDRESS_TAG
#define OUT_DATA_BUFFER_ADDRESS_TAG
#define CONTROL_BUFFER_ADDRESS_TAG
#endif

#if !defined(IN_DATA_BUFFER_ADDRESS_TAG) || !defined(OUT_DATA_BUFFER_ADDRESS_TAG) || !defined(CONTROL_BUFFER_ADDRESS_TAG)
#error "One of the fixed memory address definitions is not defined.  Please define the required address tags for the required buffers."
#endif

volatile unsigned char cdc_data_tx[NUM_OF_CDC_PORTS][CDC_DATA_IN_EP_SIZE] IN_DATA_BUFFER_ADDRESS_TAG;
volatile unsigned char cdc_data_rx[NUM_OF_CDC_PORTS][CDC_DATA_OUT_EP_SIZE] OUT_DATA_BUFFER_ADDRESS_TAG;

typedef union
{
    LINE_CODING lineCoding;
    CDC_NOTICE cdcNotice;
} CONTROL_BUFFER;

LINE_CODING line_coding; // Buffer to store line coding information
CDC_NOTICE cdc_notice;

uint8_t cdc_rx_len[NUM_OF_CDC_PORTS]; // total rx length
uint8_t cdc_trf_state[NUM_OF_CDC_PORTS]; // States are defined cdc.h
POINTER pCDCSrc[NUM_OF_CDC_PORTS]; // Dedicated source pointer
POINTER pCDCDst[NUM_OF_CDC_PORTS]; // Dedicated destination pointer
uint8_t cdc_tx_len[NUM_OF_CDC_PORTS]; // total tx length
uint8_t cdc_mem_type[NUM_OF_CDC_PORTS]; // _ROM, _RAM

USB_HANDLE CDCDataOutHandle[NUM_OF_CDC_PORTS];
USB_HANDLE CDCDataInHandle[NUM_OF_CDC_PORTS];

CONTROL_SIGNAL_BITMAP control_signal_bitmap;

#define dummy_length    0x08
uint8_t dummy_encapsulated_cmd_response[dummy_length];

#if defined(USB_CDC_SUPPORT_DTR_SIGNALING)
static cdc_pin_cb_fnc DTRPin_Handler[NUM_OF_CDC_PORTS]={
    NULL,

#if(NUM_OF_CDC_PORTS>=2)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=3)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=4)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=5)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=6)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=7)
    NULL
#endif
};

static void DTRPin_DefaultHandler(char logic)
{
    __tsdbsu("Port1 DTR=", logic);
}

void DTRPin_SetHandler(uint8_t index, cdc_pin_cb_fnc cbFnc)
{
    USBMaskInterrupts();

    if(cbFnc!=NULL)
        DTRPin_Handler[index]=cbFnc;
    else
        DTRPin_Handler[index]=DTRPin_DefaultHandler;

    USBUnmaskInterrupts();
}

#endif

#if defined(USB_CDC_SUPPORT_HARDWARE_FLOW_CONTROL)
static cdc_pin_cb_fnc CTSPin_Handler[NUM_OF_CDC_PORTS]={
    NULL,

#if(NUM_OF_CDC_PORTS>=2)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=3)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=4)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=5)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=6)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=7)
    NULL
#endif
};

static void CTSPin_DefaultHandler(char logic)
{
    __tsdbsu("Port1 CTS=", logic);
}

void CTSPin_SetHandler(uint8_t index, cdc_pin_cb_fnc cbFnc)
{
    USBMaskInterrupts();

    if(cbFnc!=NULL)
        CTSPin_Handler[index]=cbFnc;
    else
        CTSPin_Handler[index]=CTSPin_DefaultHandler;

    USBUnmaskInterrupts();
}
#endif

static cdc_coding_cb_fnc USB_CDC_LineCodingHandler[NUM_OF_CDC_PORTS]={
    NULL,

#if(NUM_OF_CDC_PORTS>=2)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=3)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=4)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=5)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=6)
    NULL,
#endif

#if(NUM_OF_CDC_PORTS>=7)
    NULL
#endif
};

static void USB_CDC_DefaultLineCodingHandler(void)
{
    __tsdbs("Port1 Line Coding");
    __dbsu("Baud: ", line_coding.bDataBits);
    __dbsu("Parity: ", line_coding.bParityType);
}

void USB_CDC_SetLineCodingHandler(uint8_t index, cdc_coding_cb_fnc cbFnc)
{
    USBMaskInterrupts();

    if(cbFnc!=NULL)
        USB_CDC_LineCodingHandler[index]=cbFnc;
    else
        USB_CDC_LineCodingHandler[index]=USB_CDC_DefaultLineCodingHandler;

    USBUnmaskInterrupts();
}

static uint8_t getDataEndpointName(uint8_t index) // <editor-fold defaultstate="collapsed" desc="Get DATA endpoint name">
{
    switch(index)
    {
        case 0:
#if(NUM_OF_CDC_PORTS>1)
            return CDC1_DATA_EP;
#else
            return CDC_DATA_EP;
#endif

#if(NUM_OF_CDC_PORTS>=2)
        case 1:
            return CDC2_DATA_EP;
#endif

#if(NUM_OF_CDC_PORTS>=3)
        case 2:
            return CDC3_DATA_EP;
#endif

#if(NUM_OF_CDC_PORTS>=4)
        case 3:
            return CDC4_DATA_EP;
#endif

#if(NUM_OF_CDC_PORTS>=5)
        case 4:
            return CDC5_DATA_EP;
#endif

#if(NUM_OF_CDC_PORTS>=6)
        case 5:
            return CDC6_DATA_EP;
#endif

#if(NUM_OF_CDC_PORTS>=7)
        case 6:
            return CDC7_DATA_EP;
#endif

        default:
            break;
    }

    return 0xFF;
} // </editor-fold>

static uint8_t getCommEndpointName(uint8_t index) // <editor-fold defaultstate="collapsed" desc="Get COMM endpoint name">
{
    switch(index)
    {
        case 0:
#if(NUM_OF_CDC_PORTS>1)
            return CDC1_COMM_EP;
#else
            return CDC_COMM_EP;
#endif

#if(NUM_OF_CDC_PORTS>=2)
        case 1:
            return CDC2_COMM_EP;
#endif

#if(NUM_OF_CDC_PORTS>=3)
        case 2:
            return CDC3_COMM_EP;
#endif

#if(NUM_OF_CDC_PORTS>=4)
        case 3:
            return CDC4_COMM_EP;
#endif

#if(NUM_OF_CDC_PORTS>=5)
        case 4:
            return CDC5_COMM_EP;
#endif

#if(NUM_OF_CDC_PORTS>=6)
        case 5:
            return CDC6_COMM_EP;
#endif

#if(NUM_OF_CDC_PORTS>=7)
        case 6:
            return CDC7_COMM_EP;
#endif

        default:
            break;
    }

    return 0xFF;
} // </editor-fold>

void USBCheckCDCRequest(void) // <editor-fold defaultstate="collapsed" desc="USB Check CDC Request">
{
    uint8_t index;

    if(SetupPkt.Recipient!=USB_SETUP_RECIPIENT_INTERFACE_BITFIELD)
        return;

    if(SetupPkt.RequestType!=USB_SETUP_TYPE_CLASS_BITFIELD)
        return;

#if(NUM_OF_CDC_PORTS>1)
    if((SetupPkt.bIntfID==CDC1_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC1_DATA_INTF_ID))
        index=0;
#else
    if((SetupPkt.bIntfID==CDC_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC_DATA_INTF_ID))
        index=0;
#endif

#if(NUM_OF_CDC_PORTS>=2)
    else if((SetupPkt.bIntfID==CDC2_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC2_DATA_INTF_ID))
        index=1;
#endif

#if(NUM_OF_CDC_PORTS>=3)
    else if((SetupPkt.bIntfID==CDC3_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC3_DATA_INTF_ID))
        index=2;
#endif

#if(NUM_OF_CDC_PORTS>=4)
    else if((SetupPkt.bIntfID==CDC4_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC4_DATA_INTF_ID))
        index=3;
#endif

#if(NUM_OF_CDC_PORTS>=5)
    else if((SetupPkt.bIntfID==CDC5_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC5_DATA_INTF_ID))
        index=4;
#endif

#if(NUM_OF_CDC_PORTS>=6)
    else if((SetupPkt.bIntfID==CDC6_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC6_DATA_INTF_ID))
        index=5;
#endif

#if(NUM_OF_CDC_PORTS>=7)
    else if((SetupPkt.bIntfID==CDC7_COMM_INTF_ID)||(SetupPkt.bIntfID==CDC7_DATA_INTF_ID))
        index=6;
#endif
    else
        return;

    switch(SetupPkt.bRequest)
    {
        case SEND_ENCAPSULATED_COMMAND: //send the packet
            inPipes[0].pSrc.bRam=(uint8_t*)&dummy_encapsulated_cmd_response;
            inPipes[0].wCount.Val=dummy_length;
            inPipes[0].info.bits.ctrl_trf_mem=USB_EP0_RAM;
            inPipes[0].info.bits.busy=1;
            break;

        case GET_ENCAPSULATED_RESPONSE: // Populate dummy_encapsulated_cmd_response first.
            inPipes[0].pSrc.bRam=(uint8_t*)&dummy_encapsulated_cmd_response;
            inPipes[0].info.bits.busy=1;
            break;

#if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D1)
        case SET_LINE_CODING:
            outPipes[0].wCount.Val=SetupPkt.wLength;
            outPipes[0].pDst.bRam=(uint8_t*) LINE_CODING_TARGET;
            outPipes[0].pFunc=LINE_CODING_PFUNC(index);
            outPipes[0].info.bits.busy=1;
            break;

        case GET_LINE_CODING:
            USBEP0SendRAMPtr((uint8_t*)&line_coding, LINE_CODING_LENGTH, USB_EP0_INCLUDE_ZERO);
            break;

        case SET_CONTROL_LINE_STATE:
            control_signal_bitmap._byte=(uint8_t) SetupPkt.wValue;

#if defined(USB_CDC_SUPPORT_DTR_SIGNALING)
            if(control_signal_bitmap.DTE_PRESENT==1)
                DTRPin_Handler[index](USB_CDC_DTR_ACTIVE_LEVEL);
            else
                DTRPin_Handler[index](USB_CDC_DTR_ACTIVE_LEVEL^1);
#endif
            inPipes[0].info.bits.busy=1;
            break;
#endif

        default:
            break;
    } //end switch(SetupPkt.bRequest)

} // </editor-fold>

void CDCInitEP(void) // <editor-fold defaultstate="collapsed" desc="CDC Init EP">
{
    uint8_t i;
    //Abstract line coding information
    line_coding.bCharFormat=0; // 1 stop bit
    line_coding.bDataBits=8; // 5,6,7,8, or 16
    line_coding.bParityType=0; // None
    line_coding.dwDTERate=115200; // baud rate

    for(i=0; i<NUM_OF_CDC_PORTS; i++)
        cdc_rx_len[i]=0;

    for(i=0; i<NUM_OF_CDC_PORTS; i++)
    {
        USBEnableEndpoint(getCommEndpointName(i), USB_IN_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);
        USBEnableEndpoint(getDataEndpointName(i), USB_IN_ENABLED|USB_OUT_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);
    }

    for(i=0; i<NUM_OF_CDC_PORTS; i++)
        CDCDataOutHandle[i]=USBRxOnePacket(getDataEndpointName(i), (uint8_t*)&cdc_data_rx[i], CDC_DATA_OUT_EP_SIZE);

    for(i=0; i<NUM_OF_CDC_PORTS; i++)
    {
        cdc_trf_state[i]=CDC_TX_READY;
        CDCDataInHandle[i]=NULL;

        if(USB_CDC_LineCodingHandler[i]==NULL)
            USB_CDC_LineCodingHandler[i]=USB_CDC_DefaultLineCodingHandler;

#if defined(USB_CDC_SUPPORT_DTR_SIGNALING)
        if(DTRPin_Handler[i]==NULL)
            DTRPin_Handler[i]=DTRPin_DefaultHandler;

        DTRPin_Handler[i](USB_CDC_DTR_ACTIVE_LEVEL^1);
#endif

#if defined(USB_CDC_SUPPORT_HARDWARE_FLOW_CONTROL)
        if(CTSPin_Handler[i]==NULL)
            CTSPin_Handler[i]=CTSPin_DefaultHandler;

        CTSPin_Handler[i](USB_CDC_DTR_ACTIVE_LEVEL^1);
#endif
    }
} // </editor-fold>

uint8_t getsUSBUSART(uint8_t index, uint8_t *buffer, uint8_t len) // <editor-fold defaultstate="collapsed" desc="gets USB USART data">
{
    cdc_rx_len[index]=0;

    if(!USBHandleBusy(CDCDataOutHandle[index]))
    {
        uint8_t i;

        if(len>USBHandleGetLength(CDCDataOutHandle[index]))
            len=USBHandleGetLength(CDCDataOutHandle[index]);

        cdc_rx_len[index]=len;

        for(i=0; i<len; i++)
            buffer[i]=cdc_data_rx[index][i];


        CDCDataOutHandle[index]=USBRxOnePacket(getDataEndpointName(index), (uint8_t*)&cdc_data_rx[index], CDC_DATA_OUT_EP_SIZE);
    }//end if

    return cdc_rx_len[index];

} // </editor-fold>

uint8_t getsUSBUSART_CMD(uint8_t index, uint8_t *buffer, uint8_t len) // <editor-fold defaultstate="collapsed" desc="gets USB USART data with <CR> detection">
{
    bool newCmd=0;

    cdc_rx_len[index]=0;

    if(!USBHandleBusy(CDCDataOutHandle[index]))
    {
        uint8_t i;

        if(len>USBHandleGetLength(CDCDataOutHandle[index]))
            len=USBHandleGetLength(CDCDataOutHandle[index]);

        cdc_rx_len[index]=len;

        for(i=0; i<len; i++)
        {
            buffer[i]=cdc_data_rx[index][i];

            if(buffer[i]=='\r')
                newCmd=1;
        }

        CDCDataOutHandle[index]=USBRxOnePacket(getDataEndpointName(index), (uint8_t*)&cdc_data_rx[index], CDC_DATA_OUT_EP_SIZE);
    }//end if

    if(newCmd)
        return cdc_rx_len[index];

    return 0;
} // </editor-fold>

void putUSBUSART(uint8_t index, uint8_t *data, uint8_t length) // <editor-fold defaultstate="collapsed" desc="put USB USART data">
{
    USBMaskInterrupts();

    if(cdc_trf_state[index]==CDC_TX_READY)
    {
        mUSBUSARTTxRam(index, (uint8_t*) data, length);
    }

    USBUnmaskInterrupts();
} // </editor-fold>

void CDCTxService(uint8_t index) // <editor-fold defaultstate="collapsed" desc="CDC Tx Service">
{
    uint8_t byte_to_send;
    uint8_t i;

    if(USBHandleBusy(CDCDataInHandle[index]))
        return;

    if(cdc_trf_state[index]==CDC_TX_COMPLETING)
        cdc_trf_state[index]=CDC_TX_READY;

    if(cdc_trf_state[index]==CDC_TX_READY)
        return;

    if(cdc_trf_state[index]==CDC_TX_BUSY_ZLP)
    {
        CDCDataInHandle[index]=USBTxOnePacket(getDataEndpointName(index), NULL, 0);
        cdc_trf_state[index]=CDC_TX_COMPLETING;
    }
    else if(cdc_trf_state[index]==CDC_TX_BUSY)
    {
        if(cdc_tx_len[index]>CDC_DATA_IN_EP_SIZE)
            byte_to_send=CDC_DATA_IN_EP_SIZE;
        else
            byte_to_send=cdc_tx_len[index];

        cdc_tx_len[index]=cdc_tx_len[index]-byte_to_send;
        pCDCDst[index].bRam=(uint8_t*)&cdc_data_tx[index]; // Set destination pointer
        i=byte_to_send;

        if(cdc_mem_type[index]==USB_EP0_ROM) // Determine type of memory source
        {
            while(i)
            {
                *pCDCDst[index].bRam= *pCDCSrc[index].bRom;
                pCDCDst[index].bRam++;
                pCDCSrc[index].bRom++;
                i--;
            }//end while(byte_to_send)
        }
        else
        {
            while(i)
            {
                *pCDCDst[index].bRam= *pCDCSrc[index].bRam;
                pCDCDst[index].bRam++;
                pCDCSrc[index].bRam++;
                i--;
            }
        }

        if(cdc_tx_len[index]==0)
        {
            if(byte_to_send==CDC_DATA_IN_EP_SIZE)
                cdc_trf_state[index]=CDC_TX_BUSY_ZLP;
            else
                cdc_trf_state[index]=CDC_TX_COMPLETING;
        }//end if(cdc_tx_len...)

        CDCDataInHandle[index]=USBTxOnePacket(getDataEndpointName(index), (uint8_t*)&cdc_data_tx[index], byte_to_send);
    }//end if(cdc_tx_sate == CDC_TX_BUSY)
} // </editor-fold>