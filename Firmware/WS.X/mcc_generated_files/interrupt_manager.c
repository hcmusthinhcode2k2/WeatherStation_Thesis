/**
  System Interrupts Generated Driver File 

  @Company:
    Microchip Technology Inc.

  @File Name:
    interrupt_manager.h

  @Summary:
    This is the generated driver implementation file for setting up the
    interrupts using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description:
    This source file provides implementations for PIC24 / dsPIC33 / PIC32MM MCUs interrupts.
    Generation Information : 
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.170.0
        Device            :  PIC32MM0256GPM048
    The generated drivers are tested against the following:
        Compiler          :  XC32 v2.50
        MPLAB             :  MPLAB X v5.45
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

/**
    void INTERRUPT_Initialize (void)
*/
void INTERRUPT_Initialize (void)
{
    // Enable Multi Vector Configuration
    INTCONbits.MVEC = 1;
    
    //    CTI: Core Timer
    //    Priority: 1
        IPC0bits.CTIP = 1;
    //    Sub Priority: 1
        IPC0bits.CTIS = 1;
    //    USBI: USB
    //    Priority: 1
        IPC7bits.USBIP = 1;
    //    Sub Priority: 0
        IPC7bits.USBIS = 0;
    //    CNCI: PORT C Change Notification
    //    Priority: 7
        IPC2bits.CNCIP = 7;
    //    Sub Priority: 0
        IPC2bits.CNCIS = 0;
    //    UERI: UART 1 Error
    //    Priority: 2
        IPC13bits.U1EIP = 2;
    //    Sub Priority: 0
        IPC13bits.U1EIS = 0;
    //    UTXI: UART 1 Transmission
    //    Priority: 2
        IPC13bits.U1TXIP = 2;
    //    Sub Priority: 0
        IPC13bits.U1TXIS = 0;
    //    URXI: UART 1 Reception
    //    Priority: 2
        IPC13bits.U1RXIP = 2;
    //    Sub Priority: 0
        IPC13bits.U1RXIS = 0;
    //    INT4I: External 4
    //    Priority: 6
        IPC1bits.INT4IP = 6;
    //    Sub Priority: 0
        IPC1bits.INT4IS = 0;
    //    TI: Timer 1
    //    Priority: 1
        IPC4bits.T1IP = 1;
    //    Sub Priority: 2
        IPC4bits.T1IS = 2;
}
