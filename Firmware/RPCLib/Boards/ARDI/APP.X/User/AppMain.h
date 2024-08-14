#ifndef APPMAIN_H
#define APPMAIN_H

#include "Common/Debug.h"
#include "System/PIC32MM_Gpio.h"
#include "Indicator/Indicator.h"
#include "Buttons/Buttons.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"
#include "System/softWdt.h"
#include "Common/Utils.h"
#include "Memory/SST25xx.h"
#include "Power_Monitor.h"
#include "VCP_Debug.h"
#include "VCP.h"
#include "Cellular/TelitAtCmd.h"
#include "Cellular/TelitPwrCtrl.h"

public void APP_Main_Initialize(void); // Called by KIT_Tasks(), after global interrupt enabling and after start-up delay
public void APP_Main_Tasks(void);

#endif