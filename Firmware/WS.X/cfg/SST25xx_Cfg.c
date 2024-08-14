#include "Memory/SST25xx.h"
#include "spi2_driver.h"
#include "pin_manager.h"

const sst_chip_t ChipInfo={
    MAX_MEM_ADDR,
    JEDEC_ID_BYTE0,
    JEDEC_ID_BYTE1,
    JEDEC_ID_BYTE2,
    // commands
    SST_READ_DATA,
    SST_FAST_READ_DATA,
    SST_SECTOR_ERASE,
    SST_SECTOR_32_ERASE,
    SST_SECTOR_64_ERASE,
    SST_BULK_ERASE,
    SST_BYTE_PROG,
    SST_WORD_PROG,
    SST_READ_STATUS,
    SST_WRITE_STATUS_EN,
    SST_WRITE_STATUS,
    SST_WRITE_EN,
    SST_WRITE_DIS,
    SST_READ_JDECID,
    SST_HW_WR_STATUS,
    SST_POLL_WR_STATUS,
    FLASH_PROTECT_LOCK,
    FLASH_PROTECT_UNLOCK
};

void SST_SPI_Open(void)
{
    spi2_open(MASTER0_CONFIG);
}

uint8_t SST_SPI_ExchangeByte(uint8_t b)
{
    return spi2_exchangeByte(b);
}

void SST_SPI_Close(void)
{
    spi2_close();
}

void SST_SPI_ChipSel(bool x)
{
    if(x)
        FLASH_CS_N_SetHigh();
    else
        FLASH_CS_N_SetLow();
}
