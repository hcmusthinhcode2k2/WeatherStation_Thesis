#ifndef VCP_DEBUG_H
#define	VCP_DEBUG_H

#include "Common/LibDef.h"

public void VCP_Debug_Write(uint8_t c);
public void VCP_Debug_Init(uint8_t PortIdx);
public void VCP_Debug_SetRxCallback(void (*cbfnc)(uint8_t *));

#endif