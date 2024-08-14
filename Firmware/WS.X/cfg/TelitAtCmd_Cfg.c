#include "Cellular/TelitAtCmd.h"
#include "uart1.h"

static uint8_t AtCmdData[512];

buff_t AtCmdRxBuff={
    .Size=sizeof(AtCmdData),
    .Len=0,
    .pData=AtCmdData
};

void ATCMD_Port_Init(void)
{
    UART1_Initialize();
}

void ATCMD_Port_Deinit(void)
{
    UART1_Deinitialize();
}

bool ATCMD_Port_IsRxReady(void)
{
    return UART1_IsRxReady();
}

uint8_t ATCMD_Port_Read(void)
{
    return UART1_Read();
}

bool ATCMD_Port_IsTxReady(void)
{
    return UART1_IsTxReady();
}

void ATCMD_Port_Write(uint8_t b)
{
    UART1_Write(b);
}

bool ATCMD_Port_IsTxDone(void)
{
    return UART1_IsTxDone();
}