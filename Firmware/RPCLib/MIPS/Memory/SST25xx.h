#ifndef SST25VF_H
#define	SST25VF_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

/* **********************************************Please to read these documents:
 * http://ww1.microchip.com/downloads/en/DeviceDoc/S71417_03.pdf
 * http://ww1.microchip.com/downloads/en/DeviceDoc/20005051C.pdf
 ******************************************************************************/

// MAX_MEM_ADDR=(Capacity in Mbit *1024^2)/8 - 1 (address start at 0)

#define SECTOR_LENGTH   4096
#define PAGE_LENGTH     256
#define PAGE_IN_SECTOR  16

#if defined(USE_SST25VF020B)
#define MAX_MEM_ADDR    0x3FFFF  
#define JEDEC_ID_BYTE0  0xBF
#define JEDEC_ID_BYTE1  0x25
#define JEDEC_ID_BYTE2  0x8C
#elif defined(USE_SST25PF040B)
#define MAX_MEM_ADDR    0x7FFFF     
#define JEDEC_ID_BYTE0  0xBF
#define JEDEC_ID_BYTE1  0x25
#define JEDEC_ID_BYTE2  0x8D
#elif defined(USE_SST25PF040C)
#define MAX_MEM_ADDR    0x7FFFF     
#define JEDEC_ID_BYTE0  0x62
#define JEDEC_ID_BYTE1  0x06
#define JEDEC_ID_BYTE2  0x13
// commands
#define SST_READ_DATA        0x03
#define SST_FAST_READ_DATA   0x0B
#define SST_SECTOR_ERASE     0x20
#define SST_SECTOR_32_ERASE  0x52
#define SST_SECTOR_64_ERASE  0xD8
#define SST_BULK_ERASE       0xC7
#define SST_BYTE_PROG        0x02
#define SST_WORD_PROG        0xAD
#define SST_READ_STATUS      0x05
#define SST_WRITE_STATUS_EN  0x50
#define SST_WRITE_STATUS     0x01
#define SST_WRITE_EN         0x06
#define SST_WRITE_DIS        0x04
#define SST_READ_JDECID      0x9F
#define SST_HW_WR_STATUS     0x70
#define SST_POLL_WR_STATUS   0x80
// keys
#define FLASH_PROTECT_LOCK   0x80
#define FLASH_PROTECT_UNLOCK 0x00
#elif defined(USE_SST25VF016B)
#define MAX_MEM_ADDR    0x1FFFFF 
#define JEDEC_ID_BYTE0  0xBF
#define JEDEC_ID_BYTE1  0x25
#define JEDEC_ID_BYTE2  0x41
#elif defined(USE_SST25VF032B)
#define MAX_MEM_ADDR    0x3FFFFF
#define TOTAL_BLOCK     64
#define TOTAL_SECTOR    1024
#define JEDEC_ID_BYTE0  0xBF
#define JEDEC_ID_BYTE1  0x25
#define JEDEC_ID_BYTE2  0x4A
#else
#error "Chip is not supported"
#endif

#define SST_REG_INVALID 0

typedef enum SST_PROTECT_RANGE {
    FLASH_PROTECT_NONE = 0,
    FLASH_PROTECT_64KB = 1,
    FLASH_PROTECT_128KB = 2,
    FLASH_PROTECT_256KB = 3,
    FLASH_PRTOECT_512KB = 4,
    FLASH_PROTECT_1MB = 5,
    FLASH_PROTECT_2MB = 6,
    FLASH_PROTECT_ALL = 7
} sst_protect_range_t;

typedef __PACKED_STRUCT {
    uint32_t max_mem_addr;
    uint8_t jedec_id_byte0;
    uint8_t jedec_id_byte1;
    uint8_t jedec_id_byte2;
    // commands
    uint8_t sst_read_data;
    uint8_t sst_fast_read_data;
    uint8_t sst_sector_erase;
    uint8_t sst_sector_32_erase;
    uint8_t sst_sector_64_erase;
    uint8_t sst_bulk_erase;
    uint8_t sst_byte_prog;
    uint8_t sst_word_prog;
    uint8_t sst_read_status;
    uint8_t sst_write_status_en;
    uint8_t sst_write_status;
    uint8_t sst_write_en;
    uint8_t sst_write_dis;
    uint8_t sst_read_jdecid;
    uint8_t sst_hw_wr_status;
    uint8_t sst_poll_wr_status;
    uint8_t flash_protect_lock;
    uint8_t flash_protect_unlock;
} sst_chip_t;

extern const sst_chip_t ChipInfo;
/************************************************* PROTOTYPE IN SST25xx_Cfg.c */
void SST_SPI_Open(void);
uint8_t SST_SPI_ExchangeByte(uint8_t);
void SST_SPI_Close(void);
void SST_SPI_ChipSel(bool);
/*********************************************************** PUBLIC FUNCTIONS */
// address= 0x00000 to MAX_MEM_ADDR
// range= see in FLASH_PROTECT_RANGE
// len=1 to 256, if over 256 bytes, this function will not execute

public void SST_Chip_Erase(void); // Erase full-memory
public void SST_Sector_Erase(uint32_t BAddr); // Erase a sector
public void SST_Read_nByte(uint32_t BAddr, uint32_t len, uint8_t *buffer); // Read n byte(s)
public void SST_Write_nByte(uint32_t BAddr, uint32_t len, const uint8_t *data); // Write n byte(s)
public void SST_Write_Byte(uint32_t Addr, uint8_t data); // Write 1 byte
public uint8_t SST_Read_Byte(uint32_t Addr); // Read 1 byte
public void SST_Protect(sst_protect_range_t range); // Protect memory zone
public bool SST_Init(void); // Call this function first (SPI must be initialized before)

#endif