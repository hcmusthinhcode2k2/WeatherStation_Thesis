/**
  ADC1 Generated Driver API Header File

  @Company
    Microchip Technology Inc.

  @File Name
    adc1.h

  @Summary
    This is the generated header file for the ADC1 driver using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description
    This header file provides APIs for driver for ADC1.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.168.0
        Device            :  PIC32MM0256GPM048
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.50
        MPLAB 	          :  MPLAB X v5.40
 */

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
 */

#ifndef _ADC1_H
#define _ADC1_H

/**
  Section: Included Files
 */

#include <xc.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif

    /**
      Section: Data Types
     */

    /** Scan Selected Macro Definition
 
     @Summary 
       Defines the scan option selection done for the shared channels.
 
     @Description
       This macro defines the scan option selection done for the shared channels.
 
     Remarks:
       None
     */
#define ADC1_SCAN_MODE_SELECTED false

    /** ADC1 Channel Definition
 
     @Summary 
       Defines the channels selected.
 
     @Description
       This routine defines the channels that are available for the module to use.
 
     Remarks:
       None
     */
    typedef enum {
        UNO_VREF = 0, //Channel Name:AN0   Assigned to:Shared Channel
        UNO_AN3, //Channel Name:AN1   Assigned to:Shared Channel
        VBAT_DIV, //Channel Name:AN8   Assigned to:Shared Channel
        UNO_AN1, //Channel Name:AN12   Assigned to:Shared Channel
        UNO_AN2, //Channel Name:AN13   Assigned to:Shared Channel
        CHANNEL_VDD_core, //Channel Name:VDD core   Assigned to:Shared Channel
        CHANNEL_VBG, //Channel Name:VBG   Assigned to:Shared Channel
        CHANNEL_AVSS, //Channel Name:AVSS   Assigned to:Shared Channel
        CHANNEL_AVDD, //Channel Name:AVDD   Assigned to:Shared Channel
    } ADC1_CHANNEL;

    /**
      Section: Interface Routines
     */

    /**
      @Summary
        Initializes ADC1 module.

      @Description
        This routine initializes ADC1 module, using the given initialization data. 
        This routine must be called before any other ADC routine is called. 

      @Preconditions
        None.

      @Param
        None.

      @Returns
        None

      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    void ADC1_Initialize(void);

    /**
      @Summary
        Enables the ADC1 module.

      @Description
        This routine is used to enable the ADC1 module.
 
      @Preconditions
        ADC1_Initialize function should have been called 
        before calling this function.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    inline static void ADC1_Enable(void) {
        AD1CON1bits.ON = 1;
    }

    /**
      @Summary
        Disables the ADC1 module.

      @Description
        This routine is used to disable the ADC1 module.
 
      @Preconditions
        ADC1_Initialize function should have been called 
        before calling this function.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    inline static void ADC1_Disable(void) {
        AD1CON1bits.ON = 0;
    }

    /**
      @Summary
        Starts sampling manually.

      @Description
        This routine is used to start sampling manually.
 
      @Preconditions
        ADC1_Initialize function should have been called 
        before calling this function.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */

    inline static void ADC1_SoftwareTriggerEnable(void) {
        AD1CON1SET = (1 << _AD1CON1_SAMP_POSITION);
    }

    /**
      @Summary
        Stops sampling manually.

      @Description
        This routine is used to stop the sampling manually.
 
      @Preconditions
        ADC1_Initialize() function should have been 
        called before calling this function.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    inline static void ADC1_SoftwareTriggerDisable(void) {
        AD1CON1CLR = (1 << _AD1CON1_SAMP_POSITION);
    }

    /**
      @Summary
        Allows selection of a channel for conversion.

      @Description
        This routine is used to select desired channel for conversion.
  
      @Preconditions
        ADC1_Initialize() function should have been 
        called before calling this function.

      @Param
        channel - Channel for conversion

      @Returns
        None
  
      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    inline static void ADC1_ChannelSelect(ADC1_CHANNEL channel) {
        switch (channel) {
            case UNO_VREF:
                AD1CHSbits.CH0SA = 0x0;
                break;
            case UNO_AN3:
                AD1CHSbits.CH0SA = 0x1;
                break;
            case VBAT_DIV:
                AD1CHSbits.CH0SA = 0x8;
                break;
            case UNO_AN1:
                AD1CHSbits.CH0SA = 0xC;
                break;
            case UNO_AN2:
                AD1CHSbits.CH0SA = 0xD;
                break;
            case CHANNEL_VDD_core:
                AD1CHSbits.CH0SA = 0x1B;
                break;
            case CHANNEL_VBG:
                AD1CHSbits.CH0SA = 0x1C;
                break;
            case CHANNEL_AVSS:
                AD1CHSbits.CH0SA = 0x1D;
                break;
            case CHANNEL_AVDD:
                AD1CHSbits.CH0SA = 0x1E;
                break;
            default:
                break;
        }
    }

    /**
      @Summary
        Returns the conversion value for the channel selected.

      @Description
        This routine is used to get the analog to digital converted value for a 
        specific channel.
 
      @Preconditions
        This routine returns the conversion value only after the conversion is complete. 
        Conversion completion status can be checked using ADC1_IsConversionComplete(channel)
        routine.

      @Param
        channel - Selected channel
   
      @Returns
       Returns the analog to digital converted value
  
      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    inline static uint16_t ADC1_ConversionResultGet(ADC1_CHANNEL channel) {
        uint16_t result;

        result = ADC1BUF0;

        return result;
    }

    /**
      @Summary
        Returns the status of conversion.

      @Description
        This routine is used to determine if conversion is completed. When conversion
        is complete the routine returns true otherwise false.
 
      @Preconditions
        ADC1_Initialize() function should have been 
        called before calling this function.

      @Param
        channel - Selected channel
 
      @Returns
        true - Conversion is complete.
        false - Conversion is not complete.
  
      @Example
        <code>
            int conversion,i=0;
            ADC1_Initialize();

            ADC1_Enable();
            ADC1_ChannelSelect(channel);
            ADC1_SoftwareTriggerEnable();
            //Provide Delay
            for(i=0;i <1000;i++)
            {
            }
            ADC1_SoftwareTriggerDisable();
            while(!ADC1_IsConversionComplete(channel));
            conversion = ADC1_ConversionResultGet(channel);
            ADC1_Disable(); 
        </code>
     */
    inline static bool ADC1_IsConversionComplete(ADC1_CHANNEL channel) {
        bool status;

        status = AD1CON1bits.DONE;

        return status;
    }

    /**
      @Summary
        Enables interrupts.

      @Description
        This routine is used to enable the ADC1 interrupt.
 
      @Preconditions
        None.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            ADC1_InterruptEnable(); 
        </code>
     */
    inline static void ADC1_InterruptEnable(void) {
        IEC1bits.AD1IE = 1;
    }

    /**
      @Summary
        Disables interrupts.

      @Description
        This routine is used to disable the ADC1 interrupt.
 
      @Preconditions
        None.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            ADC1_InterruptDisable(); 
        </code>
     */
    inline static void ADC1_InterruptDisable(void) {
        IEC1bits.AD1IE = 0;
    }

    /**
      @Summary
        Clears interrupt flag

      @Description
        This routine is used to clear the interrupt flag manually.
 
      @Preconditions
        None.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            ADC1_InterruptFlagClear(); 
        </code>
     */
    inline static void ADC1_InterruptFlagClear(void) {
        IFS1CLR = 1 << _IFS1_AD1IF_POSITION;
    }

    /**
      @Summary
        Allows selection of priority for interrupt.

      @Description
        This routine is used to select desired priority for interrupt.
  
      @Preconditions
        None.

      @Param
        None.

      @Returns
        None.

      @Example
        <code>
            uint16_t priorityValue;
            priorityValue = 0x002;
 
            ADC1_InterruptPrioritySet(priorityValue); 
        </code>
     */
    inline static void ADC1_InterruptPrioritySet(uint16_t priorityValue) {
        IPC8bits.AD1IP = 0x7 & priorityValue;
    }

    /**
      @Summary
        Callback for ADC1.

      @Description
        This routine is callback for ADC1
  
      @Preconditions
        None.

      @Param
        None.

      @Returns
        None
 
      @Example 
        <code>    
            ADC1_CallBack();
        </code>
     */
    void ADC1_CallBack(void);

    /**
      @Summary
        Assigns a function pointer with a callback address.

      @Description
        This routine assigns a function pointer with a callback address.
  
      @Preconditions
        None.

      @Param
        Address of the callback routine.

      @Returns
        None
 
      @Example 
        <code>
            ADC1_SetInterruptHandler(&ADC1_CallBack);
        </code>
     */
    void ADC1_SetInterruptHandler(void* handler);

    /**
      @Summary		
        Polled implementation

      @Description
        This routine is used to implement the tasks for polled implementations.
  
      @Preconditions
        ADC1_Initialize() function should have been 
        called before calling this function.
 
      @Param
        None

      @Returns 
        None
 
      @Example
        <code>    
            ADC1_Tasks();
        </code>
     */
    void ADC1_Tasks(void);

    /*******************************************************************************

      !!! Deprecated Definitions and APIs !!!
      !!! These functions will not be supported in future releases !!!

     *******************************************************************************/
    /**
      @Summary
        Starts sampling manually.

      @Description
        This routine is used to start the sampling manually.
 
      @Preconditions
        ADC1_Initialize function should have been called 
        before calling this function.

      @Param
        None.

      @Returns
        None.

      @Example
        None.
     */
    void ADC1_Start(void);

    /**
      @Summary
        Stops sampling manually.

      @Description
        This routine is used to stop the sampling manually before conversion
        is triggered.
 
      @Preconditions
        ADC1_Initialize() function should have been 
        called before calling this function.

      @Param
        None.

      @Returns
        None.

      @Example
        None.
     */
    void ADC1_Stop(void);

    /**
      @Summary
        Gets the buffer loaded with conversion results.

      @Description
        This routine is used to get the analog to digital converted values in a
        buffer. This routine gets converted values from multiple channels.
 
      @Preconditions
        This routine returns the buffer containing the conversion values only after 
        the conversion is complete. Completion status conversion can be checked using 
        ADC1_IsConversionComplete() routine.
 
      @Param
        None.

      @Returns
        Returns the count of the buffer containing the conversion values.

      @Example
        None.
     */
    uint16_t ADC1_ConversionResultBufferGet(uint16_t *buffer);

#ifdef __cplusplus  // Provide C++ Compatibility

}

#endif

#endif //_ADC1_H

/**
 End of File
 */
