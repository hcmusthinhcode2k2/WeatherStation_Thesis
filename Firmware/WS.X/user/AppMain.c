#include "AppMain.h"
#include "Thingsboard.h"

enum
{
    APP_INIT=0,
    APP_SYNC,
    APP_WAIT_OFF,
    APP_ERROR,
    APP_REBOOT
};

static struct
{
    tick_timer_t TickReport;
    tick_timer_t TickSync;
    uint8_t Next;
    uint8_t SyncEn;
} AppCxt;

void I2C_Scan(void) // <editor-fold defaultstate="collapsed" desc="Scan I2C slaver">
{
    uint8_t found, slv;

    I2C1_Open();

    for(slv=1, found=0; slv<128; slv++)
    {
        ClrWdt();
        TaskManager();

        if(I2C1_Master_Write(slv, NULL, 0))
        {
            found++;

            __dbs("\n ->Found 0x");
            __dbh2(slv);
        }
    }

    I2C1_Close();
    __dbsu("\nFound ", found);
    __dbs(" device(s)");
} // </editor-fold>

public void APP_Main_Initialize(void) // <editor-fold defaultstate="collapsed" desc="Application Initialize">
{
    __dbs("\n---------- APP INIT ----------\n");
    Tick_Timer_Reset(AppCxt.TickReport);
    Tick_Timer_Reset(AppCxt.TickSync);
    Indicator_Toggle(0, 50, 2950);
    Power_Monitor_Init();
    I2C_Scan();

    if(SST_Init()==0)
        __dbs("\nSST25VF016B error");

    if(AS5600_Init()==0)
        __dbs("\nAS5600 error");

    if(DPS368_Init()==0)
        __dbs("\nDPS368 error");

    if(sht4x_init()==0)
        __dbs("\nSHT4x error");

    if(GP2Y101xAU_Init()==0)
        __dbs("\nGP2Y101xAU error");

    if(RainFall_Init()==0)
        __dbs("\nRainFall sensor error");

    if(WindSpeed_Init()==0)
        __dbs("\nWindSpeed sensor error");

    Telit_PwrCtrl_Init();
    __dbs("\n------------------------------\n");
    __tsdbs("Module enable\n");
    Telit_TurnOn(0, 1);
    AppCxt.Next=APP_INIT;
} // </editor-fold>

public void APP_Main_Tasks(void) // <editor-fold defaultstate="collapsed" desc="Application Main Task">
{
    int8_t rslt;

        if(Tick_Timer_Is_Over_Ms(AppCxt.TickReport, 5000))
        {
            sensordata_t data;
            Thingsboard_getdata(&data);
        }

    switch(MOD_Button_GetState(BT_APP_N_GetValue()))
    {
        case SINGLE_PRESS:
            __tsdbs("Force sync\n");

            if(AppCxt.Next==APP_SYNC)
                AppCxt.SyncEn=1;
            else
                __dbsu("Busy: ", AppCxt.Next);
            break;

        case HOLD_PRESS:
            __tsdbs("System reboot\n");
            softWDT_Disable();
            LED_SYS_SetHigh();
            Tick_Timer_Reset(AppCxt.TickReport);

            while(!Tick_Timer_Is_Over_Sec(AppCxt.TickReport, 3))
                TaskManager();

            SYS_SoftReset();
            break;

        default: // Do nothing
            break;
    }

#if(1)
    switch(AppCxt.Next)
    {
        case APP_INIT:
            if(Telit_Ready())
            {
                __tsdbs("Module ready\n");
                Thingsboard_init();
                AppCxt.Next=APP_SYNC;
            }
            else if(!Telit_IsBusy()&&Telit_PwrCtrl_IsError())
            {
                AppCxt.Next=APP_REBOOT;
                __tsdbs("Module error: ");

                if(TelitState.dischrErr==1)
                    __dbs("\n->DisChr error");

                if(TelitState.vcelRdy==0)
                    __dbs("\n->Vcell error");

                if(TelitState.vauxRdy==0)
                    __dbs("\n->Vaux error");

                if(TelitState.swRdy==0)
                    __dbs("\n->SW Rdy error");

                if(TelitState.reboot==1)
                    __dbs("\n->Reboot or Sleep");

                __dbc('\n');
            }
            break;

        case APP_SYNC:
            rslt=Thingsboard_task(AppCxt.SyncEn);

            switch(rslt)
            {
                case TB_OK:
                    __tsdbs("Sync success");
                    LED_APP_SetLow();
                    AppCxt.SyncEn=0;
                    Tick_Timer_Reset(AppCxt.TickSync);
                    break;

                case TB_ERROR:
                    __dbs("\nSync error");
                    Telit_TurnOff();
                    AppCxt.Next=APP_WAIT_OFF;
                    break;

                case TB_BUSY:
                default:
                    if(Tick_Timer_Is_Over_Sec(AppCxt.TickSync, 75))
                    {
                        AppCxt.SyncEn^=1;

                        if(AppCxt.SyncEn==1)
                        {
                            LED_APP_SetHigh();
                            __tsdbs("Start Sync\n");
                        }
                        else
                        {
                            LED_APP_SetLow();
                            Telit_TurnOff();
                            AppCxt.Next=APP_WAIT_OFF;
                            __tsdbs("Sync timeout\n");
                        }
                    }
                    break;
            }

        case APP_WAIT_OFF:
            if(!Telit_IsBusy()&&Telit_PwrCtrl_IsError())
            {
                AppCxt.Next=APP_ERROR;
                __tsdbs("Module off\n");

                if(TelitState.dischrErr==1)
                    __dbs("\n->DisChr error");

                if(TelitState.vcelRdy==0)
                    __dbs("\n->Vcell error");

                if(TelitState.vauxRdy==0)
                    __dbs("\n->Vaux error");

                if(TelitState.swRdy==0)
                    __dbs("\n->SW Rdy error");

                if(TelitState.reboot==1)
                    __dbs("\n->Reboot or Sleep");

                __dbc('\n');
            }
            break;

        case APP_ERROR:
            if(Tick_Timer_Is_Over_Sec(AppCxt.TickSync, 10))
            {
                __tsdbs("Module enable\n");
                Telit_TurnOn(0, 1);
                AppCxt.Next=APP_INIT;
            }
            break;

        case APP_REBOOT:
        default:
            SYS_SoftReset();
            break;
    }
#endif
} // </editor-fold>