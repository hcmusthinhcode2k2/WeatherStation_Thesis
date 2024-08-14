#ifndef USB_DEVICE_CDC_H
#define USB_DEVICE_CDC_H

#include <stdbool.h>
#include <stdint.h>

#include "usb_ch9.h"
#include "usb_device_config.h"

#if(NUM_OF_CDC_PORTS>7)
#error "USB Device CDC supports maximum 7 ports"
#endif

/* Class-Specific Requests                                                    */
#define SEND_ENCAPSULATED_COMMAND   0x00
#define GET_ENCAPSULATED_RESPONSE   0x01
#define SET_COMM_FEATURE            0x02
#define GET_COMM_FEATURE            0x03
#define CLEAR_COMM_FEATURE          0x04
#define SET_LINE_CODING             0x20
#define GET_LINE_CODING             0x21
#define SET_CONTROL_LINE_STATE      0x22
#define SEND_BREAK                  0x23

/* Notifications are polled over Communication Interface (Interrupt Endpoint) */
#define NETWORK_CONNECTION          0x00
#define RESPONSE_AVAILABLE          0x01
#define SERIAL_STATE                0x20

/* Device Class Code                                                          */
#define CDC_DEVICE                  0x02

/* Communication Interface Class Code                                         */
#define COMM_INTF                   0x02

/* Communication Interface Class SubClass Codes                               */
#define ABSTRACT_CONTROL_MODEL      0x02

/* Communication Interface Class Control Protocol Codes                       */
#define V25TER                      0x01    // Common AT commands ("Hayes(TM)")

/* Data Interface Class Codes                                                 */
#define DATA_INTF                   0x0A

/* Data Interface Class Protocol Codes                                        */
#define NO_PROTOCOL                 0x00    // No class specific protocol required

/* Communication Feature Selector Codes                                       */
#define ABSTRACT_STATE              0x01
#define COUNTRY_SETTING             0x02

/* Functional Descriptors-Type Values for the bDscType Field                  */
#define CS_INTERFACE                0x24
#define CS_ENDPOINT                 0x25

/* bDscSubType in Functional Descriptors                                      */
#define DSC_FN_HEADER               0x00
#define DSC_FN_CALL_MGT             0x01
#define DSC_FN_ACM                  0x02 // ACM - Abstract Control Management
#define DSC_FN_DLM                  0x03 // DLM - Direct Line Managment
#define DSC_FN_TELEPHONE_RINGER     0x04
#define DSC_FN_RPT_CAPABILITIES     0x05
#define DSC_FN_UNION                0x06
#define DSC_FN_COUNTRY_SELECTION    0x07
#define DSC_FN_TEL_OP_MODES         0x08
#define DSC_FN_USB_TERMINAL         0x09

/* CDC Bulk IN transfer states                                                */
#define CDC_TX_READY                0
#define CDC_TX_BUSY                 1
#define CDC_TX_BUSY_ZLP             2 // ZLP: Zero Length Packet
#define CDC_TX_COMPLETING           3

#define LINE_CODING_TARGET          &cdc_notice.SetLineCoding._byte[0]
#define LINE_CODING_PFUNC(idx)      USB_CDC_SET_LINE_CODING_HANDLER[idx]

#if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D3)
#error This option is not currently supported.
#else
#define USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D3_VAL 0x00
#endif

#if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D2)
#define USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D2_VAL 0x04
#else
#define USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D2_VAL 0x00
#endif

#if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D1)
#define USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D1_VAL 0x02
#else
#define USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D1_VAL 0x00
#endif

#if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D0)
#error This option is not currently supported.
#else
#define USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D0_VAL 0x00
#endif

#define USB_CDC_ACM_FN_DSC_VAL  \
    (USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D3_VAL|\
    USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D2_VAL |\
    USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D1_VAL |\
    USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D0_VAL)

#define CDCSetBaudRate(baudRate)            line_coding.dwDTERate=baudRate
#define CDCSetCharacterFormat(charFormat)   line_coding.bCharFormat=charFormat
#define NUM_STOP_BITS_1     0 //1 stop bit - used by CDCSetLineCoding() and CDCSetCharacterFormat()
#define NUM_STOP_BITS_1_5   1 //1.5 stop bit - used by CDCSetLineCoding() and CDCSetCharacterFormat()
#define NUM_STOP_BITS_2     2 //2 stop bit - used by CDCSetLineCoding() and CDCSetCharacterFormat()

#define CDCSetParity(parityType)            line_coding.bParityType=parityType
#define PARITY_NONE         0 //no parity - used by CDCSetLineCoding() and CDCSetParity()
#define PARITY_ODD          1 //odd parity - used by CDCSetLineCoding() and CDCSetParity()
#define PARITY_EVEN         2 //even parity - used by CDCSetLineCoding() and CDCSetParity()
#define PARITY_MARK         3 //mark parity - used by CDCSetLineCoding() and CDCSetParity()
#define PARITY_SPACE        4 //space parity - used by CDCSetLineCoding() and CDCSetParity()

#define CDCSetDataSize(dataBits)            line_coding.bDataBits=dataBits

#define CDCSetLineCoding(baud,format,parity,dataSize) do{\
            CDCSetBaudRate(baud);\
            CDCSetCharacterFormat(format);\
            CDCSetParity(parity);\
            CDCSetDataSize(dataSize);\
        } while(0)

#define USBUSARTIsTxTrfReady(i)             (cdc_trf_state[i] == CDC_TX_READY)
#define mUSBUSARTIsTxTrfReady(i)            USBUSARTIsTxTrfReady(i)
#define mUSBUSARTTxRam(index,pData,len)   do{\
    pCDCSrc[index].bRam = pData;           \
    cdc_tx_len[index] = len;               \
    cdc_mem_type[index] = USB_EP0_RAM;     \
    cdc_trf_state[index] = CDC_TX_BUSY;    \
} while(0)

typedef void (*cdc_pin_cb_fnc)(char);
typedef void (*cdc_coding_cb_fnc)(void);

void DTRPin_SetHandler(uint8_t index, cdc_pin_cb_fnc cbFnc);
void CTSPin_SetHandler(uint8_t index, cdc_pin_cb_fnc cbFnc);
void USB_CDC_SetLineCodingHandler(uint8_t index, cdc_coding_cb_fnc cbFnc);

void CDCInitEP(void);
void USBCheckCDCRequest(void);
uint8_t getsUSBUSART(uint8_t index, uint8_t *buffer, uint8_t len);
uint8_t getsUSBUSART_CMD(uint8_t index, uint8_t *buffer, uint8_t len);
void putUSBUSART(uint8_t index, uint8_t *data, uint8_t Length);
void CDCTxService(uint8_t index);

#define LINE_CODING_LENGTH          0x07

typedef union _LINE_CODING {

    struct {
        uint8_t _byte[LINE_CODING_LENGTH];
    };

    struct {
        uint32_t dwDTERate;
        uint8_t bCharFormat;
        uint8_t bParityType;
        uint8_t bDataBits;
    };
} LINE_CODING;

typedef union _CONTROL_SIGNAL_BITMAP {
    uint8_t _byte;

    struct {
        unsigned DTE_PRESENT : 1; // [0] Not Present  [1] Present
        unsigned CARRIER_CONTROL : 1; // [0] Deactivate   [1] Activate
    };
} CONTROL_SIGNAL_BITMAP;

/* Header Functional Descriptor                                               */
typedef struct __attribute__((packed)) _USB_CDC_HEADER_FN_DSC {
    uint8_t bFNLength;
    uint8_t bDscType;
    uint8_t bDscSubType;
    uint16_t bcdCDC;
} USB_CDC_HEADER_FN_DSC;

/* Abstract Control Management Functional Descriptor                          */
typedef struct __attribute__((packed)) _USB_CDC_ACM_FN_DSC {
    uint8_t bFNLength;
    uint8_t bDscType;
    uint8_t bDscSubType;
    uint8_t bmCapabilities;
} USB_CDC_ACM_FN_DSC;

/* Union Functional Descriptor                                                */
typedef struct __attribute__((packed)) _USB_CDC_UNION_FN_DSC {
    uint8_t bFNLength;
    uint8_t bDscType;
    uint8_t bDscSubType;
    uint8_t bMasterIntf;
    uint8_t bSaveIntf0;
} USB_CDC_UNION_FN_DSC;

/* Call Management Functional Descriptor                                      */
typedef struct __attribute__((packed)) _USB_CDC_CALL_MGT_FN_DSC {
    uint8_t bFNLength;
    uint8_t bDscType;
    uint8_t bDscSubType;
    uint8_t bmCapabilities;
    uint8_t bDataInterface;
} USB_CDC_CALL_MGT_FN_DSC;

typedef union __attribute__((packed)) _CDC_NOTICE {
    LINE_CODING GetLineCoding;
    LINE_CODING SetLineCoding;
    unsigned char packet[CDC_COMM_IN_EP_SIZE];
} CDC_NOTICE, *PCDC_NOTICE;

/* Bit structure definition for the SerialState notification byte             */
typedef union {
    uint8_t byte;

    struct {
        uint8_t DCD : 1;
        uint8_t DSR : 1;
        uint8_t BreakState : 1;
        uint8_t RingDetect : 1;
        uint8_t FramingError : 1;
        uint8_t ParityError : 1;
        uint8_t Overrun : 1;
        uint8_t Reserved : 1;
    } bits;
} BM_SERIAL_STATE;

/* Serial State Notification Packet Structure                                 */
typedef struct {
    uint8_t bmRequestType; //Always 0xA1 for serial state notification packets
    uint8_t bNotification; //Always SERIAL_STATE (0x20) for serial state notification packets
    uint16_t wValue; //Always 0 for serial state notification packets
    uint16_t wIndex; //Interface number
    uint16_t wLength; //Should always be 2 for serial state notification packets
    BM_SERIAL_STATE SerialState;
    uint8_t Reserved;
} SERIAL_STATE_NOTIFICATION;

extern uint8_t cdc_rx_len[NUM_OF_CDC_PORTS];
extern uint8_t cdc_trf_state[NUM_OF_CDC_PORTS];
extern uint8_t cdc_tx_len[NUM_OF_CDC_PORTS];
extern uint8_t cdc_mem_type[NUM_OF_CDC_PORTS];

extern CDC_NOTICE cdc_notice;
extern LINE_CODING line_coding;
extern volatile CTRL_TRF_SETUP SetupPkt;
extern const uint8_t configDescriptor1[];

#endif //CDC_H
