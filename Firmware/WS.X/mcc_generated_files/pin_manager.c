/**
  PIN MANAGER Generated Driver File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.c

  @Summary:
    This is the generated manager file for the PIC24 / dsPIC33 / PIC32MM MCUs device.  This manager
    configures the pins direction, initial state, analog setting.
    The peripheral pin select, PPS, configuration is also handled by this manager.

  @Description:
    This source file provides implementations for PIN MANAGER.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.170.0
        Device            :  PIC32MM0256GPM048
    The generated drivers are tested against the following:
        Compiler          :  XC32 v2.50
        MPLAB 	          :  MPLAB X v5.45
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


/**
    Section: Includes
*/

#include <xc.h>
#include "pin_manager.h"
#include "system.h"
#include "Sensors/RainFall.h"

/**
 Section: File specific functions
*/
void (*RNF_PULSE_N_InterruptHandler)(void) = NULL;

/**
 Section: Driver Interface Function Definitions
*/
void PIN_MANAGER_Initialize (void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
    LATA = 0x0000;
    LATB = 0x8008;
    LATC = 0x1204;
    LATD = 0x0000;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    TRISA = 0x014C;
    TRISB = 0x6FD7;
    TRISC = 0x01EF;
    TRISD = 0x0001;

    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
    CNPDA = 0x0000;
    CNPDB = 0x0000;
    CNPDC = 0x0000;
    CNPDD = 0x0000;
    CNPUA = 0x0040;
    CNPUB = 0x0000;
    CNPUC = 0x00C0;
    CNPUD = 0x0000;

    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
    ODCA = 0x0000;
    ODCB = 0x0000;
    ODCC = 0x0000;
    ODCD = 0x0000;

    /****************************************************************************
     * Setting the Analog/Digital Configuration SFR(s)
     ***************************************************************************/
    ANSELA = 0x000C;
    ANSELB = 0x200C;
    ANSELC = 0x0123;

    /****************************************************************************
     * Set the PPS
     ***************************************************************************/
    SYSTEM_RegUnlock(); // unlock PPS
    RPCONbits.IOLOCK = 0;

    RPOR5bits.RP21R = 0x0009;    //RA7->SPI2:SCK2OUT
    RPOR5bits.RP22R = 0x0008;    //RA10->SPI2:SDO2
    RPINR1bits.INT4R = 0x0014;    //RC7->EXT_INT:INT4
    RPINR11bits.SDI2R = 0x0010;    //RB14->SPI2:SDI2

    RPCONbits.IOLOCK = 1; // lock   PPS
    SYSTEM_RegLock(); 

    /****************************************************************************
     * Interrupt On Change: any
     ***************************************************************************/
    CNEN0Cbits.CNIE0C6 = 1;    //Pin : RC6
    CNEN1Cbits.CNIE1C6 = 1;    //Pin : RC6
    /****************************************************************************
     * Interrupt On Change: flag
     ***************************************************************************/
    CNFCbits.CNFC6 = 0;    //Pin : RC6
    /****************************************************************************
     * Interrupt On Change: config
     ***************************************************************************/
    CNCONCbits.CNSTYLE = 1;    //Config for PORTC
    CNCONCbits.ON = 1;    //Config for PORTC
    
    /* Initialize IOC Interrupt Handler*/
    RNF_PULSE_N_SetInterruptHandler(&RNF_PULSE_N_CallBack);
    
    /****************************************************************************
     * Interrupt On Change: Interrupt Enable
     ***************************************************************************/
    IFS0CLR= 1 << _IFS0_CNCIF_POSITION; //Clear CNCI interrupt flag
    IEC0bits.CNCIE = 1; //Enable CNCI interrupt
}

void __attribute__ ((weak)) RNF_PULSE_N_CallBack(void)
{
    RainFall_Count();
}

void RNF_PULSE_N_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNCIE = 0; //Disable CNCI interrupt
    RNF_PULSE_N_InterruptHandler = InterruptHandler; 
    IEC0bits.CNCIE = 1; //Enable CNCI interrupt
}

void RNF_PULSE_N_SetIOCInterruptHandler(void *handler)
{ 
    RNF_PULSE_N_SetInterruptHandler(handler);
}

/* Interrupt service routine for the CNCI interrupt. */
void __attribute__ ((vector(_CHANGE_NOTICE_C_VECTOR), interrupt(IPL7SOFT))) _CHANGE_NOTICE_C( void )
{
    if(IFS0bits.CNCIF == 1)
    {
        if(CNFCbits.CNFC6 == 1)
        {
            if(RNF_PULSE_N_InterruptHandler) 
            { 
                RNF_PULSE_N_InterruptHandler(); 
            }
            
            CNFCCLR = 0x40;  //Clear CNFCbits.CNFC6
        }
        
        // Clear the flag
        IFS0CLR= 1 << _IFS0_CNCIF_POSITION; // Clear IFS0bits.CNCIF
    }
}

