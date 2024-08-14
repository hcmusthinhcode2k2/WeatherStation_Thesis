/**
\file
\brief This file contains the functions that implement the SPI master driver functionalities.

\copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
\page License
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
  Section: Included Files
 */

#include "spi_master.h"

bool MASTER3_open(void);
bool MASTER2_open(void);
bool MASTER1_open(void);
bool MASTER0_open(void);

const spi_master_functions_t spiMaster[] = {   
    { spi2_close, MASTER3_open, spi2_exchangeByte, spi2_exchangeBlock, spi2_writeBlock, spi2_readBlock, spi2_writeByte, spi2_readByte, spi2_setSpiISR, spi2_isr },
    { spi2_close, MASTER2_open, spi2_exchangeByte, spi2_exchangeBlock, spi2_writeBlock, spi2_readBlock, spi2_writeByte, spi2_readByte, spi2_setSpiISR, spi2_isr },
    { spi2_close, MASTER1_open, spi2_exchangeByte, spi2_exchangeBlock, spi2_writeBlock, spi2_readBlock, spi2_writeByte, spi2_readByte, spi2_setSpiISR, spi2_isr },
    { spi2_close, MASTER0_open, spi2_exchangeByte, spi2_exchangeBlock, spi2_writeBlock, spi2_readBlock, spi2_writeByte, spi2_readByte, spi2_setSpiISR, spi2_isr }
};

bool MASTER3_open(void){
    return spi2_open(MASTER3_CONFIG);
}

bool MASTER2_open(void){
    return spi2_open(MASTER2_CONFIG);
}

bool MASTER1_open(void){
    return spi2_open(MASTER1_CONFIG);
}

bool MASTER0_open(void){
    return spi2_open(MASTER0_CONFIG);
}

/**
 * \brief Open the SPI interface.
 * This function is to keep the backward compatibility with older API users
 * \param[in] configuration The configuration to use in the transfer
 *
 * \return Initialization status.
 * \retval false The SPI open was unsuccessful
 * \retval true  The SPI open was successful
 */
bool spi_master_open(spi_master_configurations_t config){
    switch(config){
        case MASTER3:
            return MASTER3_open();
        case MASTER2:
            return MASTER2_open();
        case MASTER1:
            return MASTER1_open();
        case MASTER0:
            return MASTER0_open();
        default:
            return 0;
    }
}
/**
 End of File
 */
