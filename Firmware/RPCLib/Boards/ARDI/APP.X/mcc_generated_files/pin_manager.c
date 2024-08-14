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
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.168.0
        Device            :  PIC32MM0256GPM048
    The generated drivers are tested against the following:
        Compiler          :  XC32 v2.40
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


/**
    Section: Includes
*/

#include <xc.h>
#include "pin_manager.h"
#include "system.h"

/**
 Section: File specific functions
*/
void (*LIGHT_INT_InterruptHandler)(void) = NULL;
void (*ACC_INT1_InterruptHandler)(void) = NULL;
void (*TEMP_INT_InterruptHandler)(void) = NULL;
void (*UNO_INT1_InterruptHandler)(void) = NULL;
void (*ACC_INT2_InterruptHandler)(void) = NULL;
void (*UNO_INT0_InterruptHandler)(void) = NULL;

/**
 Section: Driver Interface Function Definitions
*/
void PIN_MANAGER_Initialize (void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
    LATA = 0x0010;
    LATB = 0x0000;
    LATC = 0x0080;
    LATD = 0x0001;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    TRISA = 0x0747;
    TRISB = 0xEF5F;
    TRISC = 0x027F;
    TRISD = 0x0000;

    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
    CNPDA = 0x0000;
    CNPDB = 0x0000;
    CNPDC = 0x0000;
    CNPDD = 0x0000;
    CNPUA = 0x0004;
    CNPUB = 0x0000;
    CNPUC = 0x0000;
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
    ANSELA = 0x0007;
    ANSELB = 0x2000;
    ANSELC = 0x0003;

    /****************************************************************************
     * Set the PPS
     ***************************************************************************/
    SYSTEM_RegUnlock(); // unlock PPS
    RPCONbits.IOLOCK = 0;

    RPOR2bits.RP11R = 0x0008;    //RB5->SPI2:SDO2
    RPOR1bits.RP5R = 0x0006;    //RA4->UART3:U3TX
    RPOR4bits.RP20R = 0x0004;    //RC7->UART2:U2TX
    RPOR2bits.RP12R = 0x0009;    //RB7->SPI2:SCK2OUT
    RPINR11bits.SDI2R = 0x0018;    //RA9->SPI2:SDI2
    RPINR9bits.U2RXR = 0x0017;    //RC6->UART2:U2RX
    RPINR8bits.U3RXR = 0x000A;    //RB4->UART3:U3RX

    RPCONbits.IOLOCK = 1; // lock   PPS
    SYSTEM_RegLock(); 

    /****************************************************************************
     * Interrupt On Change: negative
     ***************************************************************************/
    CNEN1Abits.CNIE1A6 = 1;    //Pin : RA6
    CNEN1Abits.CNIE1A8 = 1;    //Pin : RA8
    CNEN1Bbits.CNIE1B15 = 1;    //Pin : RB15
    CNEN1Cbits.CNIE1C2 = 1;    //Pin : RC2
    CNEN1Cbits.CNIE1C3 = 1;    //Pin : RC3
    CNEN1Cbits.CNIE1C5 = 1;    //Pin : RC5
    /****************************************************************************
     * Interrupt On Change: flag
     ***************************************************************************/
    CNFAbits.CNFA6 = 0;    //Pin : RA6
    CNFAbits.CNFA8 = 0;    //Pin : RA8
    CNFBbits.CNFB15 = 0;    //Pin : RB15
    CNFCbits.CNFC2 = 0;    //Pin : RC2
    CNFCbits.CNFC3 = 0;    //Pin : RC3
    CNFCbits.CNFC5 = 0;    //Pin : RC5
    /****************************************************************************
     * Interrupt On Change: config
     ***************************************************************************/
    CNCONAbits.CNSTYLE = 1;    //Config for PORTA
    CNCONAbits.ON = 1;    //Config for PORTA
    CNCONBbits.CNSTYLE = 1;    //Config for PORTB
    CNCONBbits.ON = 1;    //Config for PORTB
    CNCONCbits.CNSTYLE = 1;    //Config for PORTC
    CNCONCbits.ON = 1;    //Config for PORTC
    
    /* Initialize IOC Interrupt Handler*/
    LIGHT_INT_SetInterruptHandler(&LIGHT_INT_CallBack);
    ACC_INT1_SetInterruptHandler(&ACC_INT1_CallBack);
    TEMP_INT_SetInterruptHandler(&TEMP_INT_CallBack);
    UNO_INT1_SetInterruptHandler(&UNO_INT1_CallBack);
    ACC_INT2_SetInterruptHandler(&ACC_INT2_CallBack);
    UNO_INT0_SetInterruptHandler(&UNO_INT0_CallBack);
    
    /****************************************************************************
     * Interrupt On Change: Interrupt Enable
     ***************************************************************************/
    IFS0CLR= 1 << _IFS0_CNAIF_POSITION; //Clear CNAI interrupt flag
    IEC0bits.CNAIE = 1; //Enable CNAI interrupt
    IFS0CLR= 1 << _IFS0_CNBIF_POSITION; //Clear CNBI interrupt flag
    IEC0bits.CNBIE = 1; //Enable CNBI interrupt
    IFS0CLR= 1 << _IFS0_CNCIF_POSITION; //Clear CNCI interrupt flag
    IEC0bits.CNCIE = 1; //Enable CNCI interrupt
}

void __attribute__ ((weak)) LIGHT_INT_CallBack(void)
{

}

void __attribute__ ((weak)) ACC_INT1_CallBack(void)
{

}

void __attribute__ ((weak)) TEMP_INT_CallBack(void)
{

}

void __attribute__ ((weak)) UNO_INT1_CallBack(void)
{

}

void __attribute__ ((weak)) ACC_INT2_CallBack(void)
{

}

void __attribute__ ((weak)) UNO_INT0_CallBack(void)
{

}

void LIGHT_INT_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNAIE = 0; //Disable CNAI interrupt
    LIGHT_INT_InterruptHandler = InterruptHandler; 
    IEC0bits.CNAIE = 1; //Enable CNAI interrupt
}

void LIGHT_INT_SetIOCInterruptHandler(void *handler)
{ 
    LIGHT_INT_SetInterruptHandler(handler);
}

void ACC_INT1_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNAIE = 0; //Disable CNAI interrupt
    ACC_INT1_InterruptHandler = InterruptHandler; 
    IEC0bits.CNAIE = 1; //Enable CNAI interrupt
}

void ACC_INT1_SetIOCInterruptHandler(void *handler)
{ 
    ACC_INT1_SetInterruptHandler(handler);
}

void TEMP_INT_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNBIE = 0; //Disable CNBI interrupt
    TEMP_INT_InterruptHandler = InterruptHandler; 
    IEC0bits.CNBIE = 1; //Enable CNBI interrupt
}

void TEMP_INT_SetIOCInterruptHandler(void *handler)
{ 
    TEMP_INT_SetInterruptHandler(handler);
}

void UNO_INT1_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNCIE = 0; //Disable CNCI interrupt
    UNO_INT1_InterruptHandler = InterruptHandler; 
    IEC0bits.CNCIE = 1; //Enable CNCI interrupt
}

void UNO_INT1_SetIOCInterruptHandler(void *handler)
{ 
    UNO_INT1_SetInterruptHandler(handler);
}

void ACC_INT2_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNCIE = 0; //Disable CNCI interrupt
    ACC_INT2_InterruptHandler = InterruptHandler; 
    IEC0bits.CNCIE = 1; //Enable CNCI interrupt
}

void ACC_INT2_SetIOCInterruptHandler(void *handler)
{ 
    ACC_INT2_SetInterruptHandler(handler);
}

void UNO_INT0_SetInterruptHandler(void (* InterruptHandler)(void))
{ 
    IEC0bits.CNCIE = 0; //Disable CNCI interrupt
    UNO_INT0_InterruptHandler = InterruptHandler; 
    IEC0bits.CNCIE = 1; //Enable CNCI interrupt
}

void UNO_INT0_SetIOCInterruptHandler(void *handler)
{ 
    UNO_INT0_SetInterruptHandler(handler);
}

/* Interrupt service routine for the CNAI interrupt. */
void __attribute__ ((vector(_CHANGE_NOTICE_A_VECTOR), interrupt(IPL7SOFT))) _CHANGE_NOTICE_A( void )
{
    if(IFS0bits.CNAIF == 1)
    {
        if(CNFAbits.CNFA6 == 1)
        {
            if(LIGHT_INT_InterruptHandler) 
            { 
                LIGHT_INT_InterruptHandler(); 
            }
            
            CNFACLR = 0x40;  //Clear CNFAbits.CNFA6
        }
        
        if(CNFAbits.CNFA8 == 1)
        {
            if(ACC_INT1_InterruptHandler) 
            { 
                ACC_INT1_InterruptHandler(); 
            }
            
            CNFACLR = 0x100;  //Clear CNFAbits.CNFA8
        }
        
        // Clear the flag
        IFS0CLR= 1 << _IFS0_CNAIF_POSITION; // Clear IFS0bits.CNAIF
    }
}

/* Interrupt service routine for the CNBI interrupt. */
void __attribute__ ((vector(_CHANGE_NOTICE_B_VECTOR), interrupt(IPL7SOFT))) _CHANGE_NOTICE_B( void )
{
    if(IFS0bits.CNBIF == 1)
    {
        if(CNFBbits.CNFB15 == 1)
        {
            if(TEMP_INT_InterruptHandler) 
            { 
                TEMP_INT_InterruptHandler(); 
            }
            
            CNFBCLR = 0x8000;  //Clear CNFBbits.CNFB15
        }
        
        // Clear the flag
        IFS0CLR= 1 << _IFS0_CNBIF_POSITION; // Clear IFS0bits.CNBIF
    }
}

/* Interrupt service routine for the CNCI interrupt. */
void __attribute__ ((vector(_CHANGE_NOTICE_C_VECTOR), interrupt(IPL7SOFT))) _CHANGE_NOTICE_C( void )
{
    if(IFS0bits.CNCIF == 1)
    {
        if(CNFCbits.CNFC3 == 1)
        {
            if(UNO_INT1_InterruptHandler) 
            { 
                UNO_INT1_InterruptHandler(); 
            }
            
            CNFCCLR = 0x8;  //Clear CNFCbits.CNFC3
        }
        
        if(CNFCbits.CNFC2 == 1)
        {
            if(ACC_INT2_InterruptHandler) 
            { 
                ACC_INT2_InterruptHandler(); 
            }
            
            CNFCCLR = 0x4;  //Clear CNFCbits.CNFC2
        }
        
        if(CNFCbits.CNFC5 == 1)
        {
            if(UNO_INT0_InterruptHandler) 
            { 
                UNO_INT0_InterruptHandler(); 
            }
            
            CNFCCLR = 0x20;  //Clear CNFCbits.CNFC5
        }
        
        // Clear the flag
        IFS0CLR= 1 << _IFS0_CNCIF_POSITION; // Clear IFS0bits.CNCIF
    }
}

