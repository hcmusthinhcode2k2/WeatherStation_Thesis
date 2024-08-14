#include "Cellular/TelitAtCmd.h"
#include "uart2.h"

bool ATCMD_Port_IsRxReady(void)
{
    return UART2_IsRxReady();
}

uint8_t ATCMD_Port_Read(void)
{
    return UART2_Read();
}

bool ATCMD_Port_IsTxReady(void)
{
    return UART2_IsTxReady();
}

void ATCMD_Port_Write(uint8_t b)
{
    UART2_Write(b);
}

bool ATCMD_Port_IsTxDone(void)
{
    return UART2_IsTxDone();
}