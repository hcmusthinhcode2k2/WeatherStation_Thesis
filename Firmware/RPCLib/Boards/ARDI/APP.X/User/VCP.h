#ifndef VCP_H
#define	VCP_H

#include "usb/usb_device_cdc.h"
#include "System/TaskManager.h"
#include "System/TickTimer.h"
#include "Project_Cfg.h"

typedef struct
{
    uint8_t buf[CDC_DATA_OUT_EP_SIZE];
    uint8_t len;
    uint8_t next;
    tick_timer_t tk;
    bool ready;
} port_txbuf_t;

typedef struct
{
    uint8_t buf[CDC_DATA_IN_EP_SIZE+1];
    uint8_t len;
    void (*cbfnc)(uint8_t *);
} port_rxbuf_t;

void VCP_Init(void);
    
#endif
