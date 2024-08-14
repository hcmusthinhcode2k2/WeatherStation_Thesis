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

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "mcc.h"
#include "spi2_driver.h"

void (*spi2_interruptHandler)(void); 

void spi2_close(void)
{
    SPI2CONbits.ON = 0;
}

//con == SPIxCON, con2 == SPIxCON2, stat == SPIxSTAT, brg == SPIxBRG, operation == Master/Slave
typedef struct { uint32_t con; uint32_t con2; uint32_t stat; uint32_t brg; uint8_t operation;} spi2_configuration_t;
static const spi2_configuration_t spi2_configuration[] = {   
    { 0x00000060, 0x00000000, 0x00000000, 0x0000000B, 0 },
    { 0x00000160, 0x00000000, 0x00000000, 0x0000000B, 0 },
    { 0x00000020, 0x00000000, 0x00000000, 0x0000000B, 0 },
    { 0x00000120, 0x00000000, 0x00000000, 0x0000000B, 0 },
    { 0x00000120, 0x00000000, 0x00000000, 0x0000005F, 0 }
};

bool spi2_open(spi2_modes spiUniqueConfiguration)
{
    if(!SPI2CONbits.ON)
    {
        SPI2CON = spi2_configuration[spiUniqueConfiguration].con;
        SPI2CON2 = spi2_configuration[spiUniqueConfiguration].con2;
        SPI2STAT = spi2_configuration[spiUniqueConfiguration].stat;
        SPI2BRG = spi2_configuration[spiUniqueConfiguration].brg;
        
        TRISAbits.TRISA7 = spi2_configuration[spiUniqueConfiguration].operation;
        SPI2CONbits.ON = 1;
        return true;
    }
    return false;
}

// Full Duplex SPI Functions
uint8_t spi2_exchangeByte(uint8_t b)
{
    SPI2BUF = b;
    while(!SPI2STATbits.SPIRBF);
    return SPI2BUF;
}

void spi2_exchangeBlock(void *block, size_t blockSize)
{
    uint8_t *data = block;
    while(blockSize--)
    {
        *data = spi2_exchangeByte(*data );
        data++;
    }
}

// Half Duplex SPI Functions
void spi2_writeBlock(void *block, size_t blockSize)
{
    uint8_t *data = block;
    while(blockSize--)
    {
        spi2_exchangeByte(*data++);
    }
}

void spi2_readBlock(void *block, size_t blockSize)
{
    uint8_t *data = block;
    while(blockSize--)
    {
        *data++ = spi2_exchangeByte(0);
    }
}

void spi2_writeByte(uint8_t byte)
{
    SPI2BUF = byte;
}

uint8_t spi2_readByte(void)
{
    return SPI2BUF;
}

/**
 * Interrupt from SPI on bit 8 received and SR moved to buffer
 * If interrupts are not being used, then call this method from the main while(1) loop
 */
void spi2_isr(void)
{
    if(IFS1bits.SPI2EIF == 1){
        if(spi2_interruptHandler){
            spi2_interruptHandler();
        }
        IFS1bits.SPI2EIF = 0;
    }
}

void spi2_setSpiISR(void(*handler)(void))
{
    spi2_interruptHandler = handler;
}
