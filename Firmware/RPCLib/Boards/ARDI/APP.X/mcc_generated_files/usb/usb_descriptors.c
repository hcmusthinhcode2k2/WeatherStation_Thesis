/********************************************************************
 FileName:     	usb_descriptors.c
 Dependencies:	See INCLUDES section
 Processor:		PIC18 or PIC24 USB Microcontrollers
 Hardware:		The code is natively intended to be used on the following
                hardware platforms: PICDEM FS USB Demo Board, 
                PIC18F87J50 FS USB Plug-In Module, or
                Explorer 16 + PIC24 USB PIM.  The firmware may be
                modified for use on other USB platforms by editing the
                HardwareProfile.h file.
 Complier:  	Microchip C18 (for PIC18) or C30 (for PIC24)
 Company:		Microchip Technology, Inc.

 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") for its PIC(R) Microcontroller is intended and
 supplied to you, the Company's customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
 software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.

 *********************************************************************
-usb_descriptors.c-
-------------------------------------------------------------------
Filling in the descriptor values in the usb_descriptors.c file:
-------------------------------------------------------------------

[Device Descriptors]
The device descriptor is defined as a USB_DEVICE_DESCRIPTOR type.  
This type is defined in usb_ch9.h  Each entry into this structure
needs to be the correct length for the data type of the entry.

[Configuration Descriptors]
The configuration descriptor was changed in v2.x from a structure
to a uint8_t array.  Given that the configuration is now a byte array
each byte of multi-byte fields must be listed individually.  This
means that for fields like the total size of the configuration where
the field is a 16-bit value "64,0," is the correct entry for a
configuration that is only 64 bytes long and not "64," which is one
too few bytes.

The configuration attribute must always have the _DEFAULT
definition at the minimum. Additional options can be ORed
to the _DEFAULT attribute. Available options are _SELF and _RWU.
These definitions are defined in the usb_device.h file. The
_SELF tells the USB host that this device is self-powered. The
_RWU tells the USB host that this device supports Remote Wakeup.

[Endpoint Descriptors]
Like the configuration descriptor, the endpoint descriptors were 
changed in v2.x of the stack from a structure to a uint8_t array.  As
endpoint descriptors also has a field that are multi-byte entities,
please be sure to specify both bytes of the field.  For example, for
the endpoint size an endpoint that is 64 bytes needs to have the size
defined as "64,0," instead of "64,"

Take the following example:
    // Endpoint Descriptor //
    0x07,                       //the size of this descriptor //
    USB_DESCRIPTOR_ENDPOINT,    //Endpoint Descriptor
    _EP02_IN,                   //EndpointAddress
    _INT,                       //Attributes
    0x08,0x00,                  //size (note: 2 bytes)
    0x02,                       //Interval

The first two parameters are self-explanatory. They specify the
length of this endpoint descriptor (7) and the descriptor type.
The next parameter identifies the endpoint, the definitions are
defined in usb_device.h and has the following naming
convention:
_EP<##>_<dir>
where ## is the endpoint number and dir is the direction of
transfer. The dir has the value of either 'OUT' or 'IN'.
The next parameter identifies the type of the endpoint. Available
options are _BULK, _INT, _ISO, and _CTRL. The _CTRL is not
typically used because the default control transfer endpoint is
not defined in the USB descriptors. When _ISO option is used,
addition options can be ORed to _ISO. Example:
_ISO|_AD|_FE
This describes the endpoint as an isochronous pipe with adaptive
and feedback attributes. See usb_device.h and the USB
specification for details. The next parameter defines the size of
the endpoint. The last parameter in the polling interval.

-------------------------------------------------------------------
Adding a USB String
-------------------------------------------------------------------
A string descriptor array should have the following format:

rom struct{byte bLength;byte bDscType;word string[size];}sdxxx={
sizeof(sdxxx),DSC_STR,<text>};

The above structure provides a means for the C compiler to
calculate the length of string descriptor sdxxx, where xxx is the
index number. The first two bytes of the descriptor are descriptor
length and type. The rest <text> are string texts which must be
in the unicode format. The unicode format is achieved by declaring
each character as a word type. The whole text string is declared
as a word array with the number of characters equals to <size>.
<size> has to be manually counted and entered into the array
declaration. Let's study this through an example:
if the string is "USB" , then the string descriptor should be:
(Using index 02)
rom struct{byte bLength;byte bDscType;word string[3];}sd002={
sizeof(sd002),DSC_STR,'U','S','B'};

A USB project may have multiple strings and the firmware supports
the management of multiple strings through a look-up table.
The look-up table is defined as:
rom const unsigned char *rom USB_SD_Ptr[]={&sd000,&sd001,&sd002};

The above declaration has 3 strings, sd000, sd001, and sd002.
Strings can be removed or added. sd000 is a specialized string
descriptor. It defines the language code, usually this is
US English (0x0409). The index of the string must match the index
position of the USB_SD_Ptr array, &sd000 must be in position
USB_SD_Ptr[0], &sd001 must be in position USB_SD_Ptr[1] and so on.
The look-up table USB_SD_Ptr is used by the get string handler
function.

-------------------------------------------------------------------

The look-up table scheme also applies to the configuration
descriptor. A USB device may have multiple configuration
descriptors, i.e. CFG01, CFG02, etc. To add a configuration
descriptor, user must implement a structure similar to CFG01.
The next step is to add the configuration descriptor name, i.e.
cfg01, cfg02,.., to the look-up table USB_CD_Ptr. USB_CD_Ptr[0]
is a dummy place holder since configuration 0 is the un-configured
state according to the definition in the USB specification.

 ********************************************************************/

/*********************************************************************
 * Descriptor specific type definitions are defined in:
 * usb_device.h
 *
 * Configuration options are defined in:
 * usb_config.h
 ********************************************************************/
#ifndef __USB_DESCRIPTORS_C
#define __USB_DESCRIPTORS_C

/** INCLUDES *******************************************************/
#include "usb.h"
#include "usb_device_cdc.h"
#include "Common/Utils.h"

#if(0)
#include "Common/Debug.h"
#else
#define __dbsh(...)
#endif

/** CONSTANTS ******************************************************/
#if defined(__18CXX)
#pragma romdata
#endif

/* Device Descriptor */
const USB_DEVICE_DESCRIPTOR device_dsc={
    0x12, // Size of this descriptor in bytes
    USB_DESCRIPTOR_DEVICE, // DEVICE descriptor type
    0x0200, // USB Spec Release Number in BCD format
    0xEF, // Class Code
    0x02, // Subclass code
    0x01, // Protocol code
    USB_EP0_BUFF_SIZE, // Max packet size for EP0, see usb_config.h
    0x04D8, // Vendor ID
    0x000A, // Product ID: CDC RS-232 Emulation Demo
    0x0100, // Device release number in BCD format
    0x01, // Manufacturer string index
    0x02, // Product string index
    0x03, // Device serial number string index
    0x01 // Number of possible configurations
};

/* Configuration 1 Descriptor */
const uint8_t configDescriptor1[]={
    /* Configuration Descriptor */
    0x09, //sizeof(USB_CFG_DSC),    // Size of this descriptor in bytes
    USB_DESCRIPTOR_CONFIGURATION, // CONFIGURATION descriptor type
    ((9+NUM_OF_CDC_PORTS*66)&0xFF), (((9+NUM_OF_CDC_PORTS*66)>>8)&0xFF), //(Bytes)Size of the Config descriptor
    (NUM_OF_CDC_PORTS*2), // Number of interfaces in this cfg
    1, // Index value of this configuration
    0, // Configuration string index
    _DEFAULT|_SELF, // Attributes, see usb_device.h
    50, // Max power consumption (2X mA)

#if(NUM_OF_CDC_PORTS>1)
#define CDC_FUNCTION_IDX 0
    /* ************************************** Descriptor for Function 1 - CDC */
    /* Interface Association Descriptor: CDC Function 1*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC1_COMM_INTF_ID,
    CDC1_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC1_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP01_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP02_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP02_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#elif(NUM_OF_CDC_PORTS==1)
#define CDC_FUNCTION_IDX 0
    /* ************************************** Descriptor for Function 1 - CDC */
    /* Interface Association Descriptor: CDC Function 1*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC_COMM_INTF_ID,
    CDC_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP01_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP02_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP02_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif

#if(NUM_OF_CDC_PORTS>=2)
#define CDC_FUNCTION_IDX 1
    /* ************************************** Descriptor for Function 2 - CDC */
    /* Interface Association Descriptor: CDC Function 2*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC2_COMM_INTF_ID,
    CDC2_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC2_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP03_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP04_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP04_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif

#if(NUM_OF_CDC_PORTS>=3)
#define CDC_FUNCTION_IDX 2
    /* ************************************** Descriptor for Function 3 - CDC */
    /* Interface Association Descriptor: CDC Function 3*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC3_COMM_INTF_ID,
    CDC3_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC3_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP05_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP06_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP06_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif

#if(NUM_OF_CDC_PORTS>=4)
#define CDC_FUNCTION_IDX 3
    /* ************************************** Descriptor for Function 4 - CDC */
    /* Interface Association Descriptor: CDC Function 4*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC4_COMM_INTF_ID,
    CDC4_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC4_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP07_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP08_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP08_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif

#if(NUM_OF_CDC_PORTS>=5)
#define CDC_FUNCTION_IDX 4
    /* ************************************** Descriptor for Function 5 - CDC */
    /* Interface Association Descriptor: CDC Function 5*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC5_COMM_INTF_ID,
    CDC5_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC5_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP09_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP10_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP10_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif

#if(NUM_OF_CDC_PORTS>=6)
#define CDC_FUNCTION_IDX 5
    /* ************************************** Descriptor for Function 6 - CDC */
    /* Interface Association Descriptor: CDC Function 6*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC6_COMM_INTF_ID,
    CDC6_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC6_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP11_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP12_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP12_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif

#if(NUM_OF_CDC_PORTS>=7)
#define CDC_FUNCTION_IDX 6
    /* ************************************** Descriptor for Function 7 - CDC */
    /* Interface Association Descriptor: CDC Function 7*/
    0x08, // Size of this descriptor in bytes
    0x0B, // Interface association descriptor type
    (CDC_FUNCTION_IDX*2), // The first associated interface
    0x02, // Number of contiguous associated interface
    0x02, // bInterfaceClass of the first interface
    0x02, // bInterfaceSubclass of the first interface
    0x01, // bInterfaceProtocol of the first interface
    0x00, // Interface string index

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2), // Interface Number
    0, // Alternate Setting Number
    1, // Number of endpoints in this intf
    COMM_INTF, // Class code
    ABSTRACT_CONTROL_MODEL, // Subclass code
    V25TER, // Protocol code
    0, // Interface string index

    /* CDC Class-Specific Descriptors */
    sizeof (USB_CDC_HEADER_FN_DSC),
    CS_INTERFACE,
    DSC_FN_HEADER,
    0x10, 0x01,

    sizeof (USB_CDC_ACM_FN_DSC),
    CS_INTERFACE,
    DSC_FN_ACM,
    USB_CDC_ACM_FN_DSC_VAL,

    sizeof (USB_CDC_UNION_FN_DSC),
    CS_INTERFACE,
    DSC_FN_UNION,
    CDC7_COMM_INTF_ID,
    CDC7_DATA_INTF_ID,

    sizeof (USB_CDC_CALL_MGT_FN_DSC),
    CS_INTERFACE,
    DSC_FN_CALL_MGT,
    0x00,
    CDC7_DATA_INTF_ID,

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP13_IN, //EndpointAddress
    _INTERRUPT, //Attributes
    0x08, 0x00, //size
    0x02, //Interval

    /* Interface Descriptor */
    9, //sizeof(USB_INTF_DSC),   // Size of this descriptor in bytes
    USB_DESCRIPTOR_INTERFACE, // INTERFACE descriptor type
    (CDC_FUNCTION_IDX*2)+1, // Interface Number
    0, // Alternate Setting Number
    2, // Number of endpoints in this intf
    DATA_INTF, // Class code
    0, // Subclass code
    NO_PROTOCOL, // Protocol code
    0, // Interface string index

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP14_OUT, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval

    /* Endpoint Descriptor */
    0x07, /*sizeof(USB_EP_DSC)*/
    USB_DESCRIPTOR_ENDPOINT, //Endpoint Descriptor
    _EP14_IN, //EndpointAddress
    _BULK, //Attributes
    0x40, 0x00, //size
    0x00, //Interval
#undef CDC_FUNCTION_IDX
#endif
};

// Language code string descriptor

const struct
{
    uint8_t bLength;
    uint8_t bDscType;
    uint16_t string[1];
}

sd000={
    (uint8_t) sizeof (sd000),
    USB_DESCRIPTOR_STRING,
    {
        0x0409
    }
};

// Manufacturer string descriptor

const struct
{
    uint8_t bLength;
    uint8_t bDscType;
    uint16_t string[15];
}

sd001={
    (uint8_t) sizeof (sd001),
    USB_DESCRIPTOR_STRING,
    {
        'R', 'P', 'C', ' ', 'E', 'L', 'E', 'C', 'T', 'R', 'O', 'N', 'I', 'C', 'S'
    }
};

//Product string descriptor

const struct
{
    uint8_t bLength;
    uint8_t bDscType;
    uint16_t string[14];
}

sd002={
    (uint8_t) sizeof (sd002),
    USB_DESCRIPTOR_STRING,
    {
        'M', 'u', 'l', 't', 'i', ' ', 'U', 'S', 'B', '-', 'U', 'A', 'R', 'T'
    }
};

//Array of configuration descriptors
const uint8_t*const USB_CD_Ptr[]={
    (const uint8_t*const) &configDescriptor1
};

//Serial number string descriptor.  Note: This should be unique for each unit 
//built on the assembly line.  Plugging in two units simultaneously with the 
//same serial number into a single machine can cause problems.  Additionally, not 
//all hosts support all character values in the serial number string.  The MSD 
//Bulk Only Transport (BOT) specs v1.0 restrict the serial number to consist only
//of ASCII characters "0" through "9" and capital letters "A" through "F".

struct
{
    uint8_t bLength;
    uint8_t bDscType;
    uint16_t string[16];
}

sd003={
    (uint8_t) sizeof (sd003),
    USB_DESCRIPTOR_STRING,
    {
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
    }
};

void USB_Device_LoadUDID(uint32_t udID[2])
{
    uint32_t tmp;
    uint8_t i;

    tmp=UDID1;
    udID[0]=UDID1;
    __dbsh("\nUDID: ", udID[0]);

    for(i=0; i<8; i++)
    {
        sd003.string[i]=Bcd2AHex((uint8_t) (tmp&0xF));
        tmp>>=4;
    }

    tmp=UDID2;
    udID[1]=UDID2;
    __dbsh("-", udID[1]);

    for(i=0; i<8; i++)
    {
        sd003.string[8+i]=Bcd2AHex((uint8_t) (tmp&0xF));
        tmp>>=4;
    }
}

//Array of string descriptors
const uint8_t*const USB_SD_Ptr[]={
    (const uint8_t*const) &sd000,
    (const uint8_t*const) &sd001,
    (const uint8_t*const) &sd002,
    (const uint8_t*const) &sd003
};

#if defined(__18CXX)
#pragma code
#endif

#endif
/** EOF usb_descriptors.c ****************************************************/
