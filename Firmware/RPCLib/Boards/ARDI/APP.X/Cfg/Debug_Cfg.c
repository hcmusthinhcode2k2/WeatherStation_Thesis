#include "Common/Debug.h"
#include "VCP_Debug.h"

void debug_port_write(uint8_t c)
{
    VCP_Debug_Write(c);
}