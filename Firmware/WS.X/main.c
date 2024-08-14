#include "system.h"
#include "AppMain.h"
#include "Apps/VCP.h"
#include "System/softWdt.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"
#include "Common/Debug.h"
#include "Indicator/Indicator.h"

static const char HwInfo[]={
    "\n\nWEATHER STATION"
    "\nHARDWARE : HWZ012_REV0.0"
    "\nPCB      : PCB.Y146-3908731A"
    "\nBUILD    : " __TIME__ "-" __DATE__
    "\nCLOCK    : " __make_xstr(_XTAL_FREQ) " Hz"
};

private void ResetCodeDisplay(void) // <editor-fold defaultstate="collapsed" desc="Reset code display">
{
    __dbsh("\n\nRESET CONTROL REGISTER: ", RCON);

    if(RCONbits.PORIO)
        __dbs("\n-->PORIO: A Power-on Reset has occurred due to VDD voltage");

    if(RCONbits.PORCORE)
        __dbs("\n-->PORCORE: A Power-on Reset has occurred due to core voltage");

    if(RCONbits.BCFGERR)
        __dbs("\n-->BCFGERR: An error occurred during a read of the Primary Configuration registers");

    if(RCONbits.BCFGFAIL)
        __dbs("\n-->BCFGFAIL: An error occurred during a read of the Primary and Alternate Configuration registers");

    if(RCONbits.CMR)
        __dbs("\n-->CMR: Configuration Mismatch Reset has occurred");

    if(RCONbits.EXTR)
        __dbs("\n-->EXTR:  Master Clear (pin) Reset has occurred");

    if(RCONbits.SWR)
        __dbs("\n-->SWR: Software Reset was executed");

    if(RCONbits.WDTO)
        __dbs("\n-->WDTO: Watchdog Timer Time-out Flag bit");

    if(RCONbits.SLEEP)
        __dbs("\n-->SLEEP: Device was in Sleep mode");

    if(RCONbits.IDLE)
        __dbs("\n-->IDLE: Device was in Idle mode");

    if(RCONbits.BOR)
        __dbs("\n-->BOR: Brown-out Reset has occurred");

    if(RCONbits.POR)
        __dbs("\n-->POR: Power-on Reset has occurred");

    RCON&=0xFFFFFF20; // Clear bit 7,6,4,3,2,1,0
    __dbs("\n\n");
} // </editor-fold>

private void UdIdDisplay(const uint32_t *pUdId) // <editor-fold defaultstate="collapsed" desc="UDID display">
{
    int i;
    uint8_t *pD=(uint8_t *) pUdId;

    __dbs("\nUDID     : ");

    for(i=0; i<8; i++)
        __dbh2(*pD++);
} // </editor-fold>

int main(void) // <editor-fold defaultstate="collapsed" desc="Main function">
{
    uint32_t udID[2];
    uint8_t DoNext=0;
    tick_timer_t Tick={1, 0, 0};

    SYSTEM_Initialize();
    Tick_Timer_Init();
    TaskManager_Init();
    Indicator_Init();
    softWDT_Init(4, NOT_USE, NULL);
    USB_Device_LoadUDID(udID);
    USBDeviceInit();
    USBDeviceAttach();
    VCP_Init();
    spi2_close();
    I2C1_Close();
    UART1_Deinitialize();
    Indicator_Toggle(0, 250, 250);

    while(1)
    {
        switch(DoNext)
        {
            case 0:
                if(Tick_Timer_Is_Over_Ms(Tick, 10000))
                {
                    DoNext++;
                    __dbs(HwInfo);
                    UdIdDisplay(udID);
                    ResetCodeDisplay();
                    APP_Main_Initialize();
                }
                break;

            default:
                APP_Main_Tasks();
                break;
        }

        TaskManager();
        //SYSTEM_SleepControl();
    }

    return 1;
} // </editor-fold>