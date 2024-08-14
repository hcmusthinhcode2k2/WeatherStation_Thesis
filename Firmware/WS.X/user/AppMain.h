#ifndef APPMAIN_H
#define APPMAIN_H

#include "mcc.h"
#include "Common/Debug.h"
#include "System/Gpio.h"
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
#include "Sensors/AS5600.h"
#include "Sensors/DPS368.h"
#include "Sensors/GP2Y101xAU.h"
#include "Sensors/RainFall.h"
#include "Sensors/SHT4x.h"
#include "Sensors/WindSpeed.h"

public void APP_Main_Initialize(void); // Called by KIT_Tasks(), after global interrupt enabling and after start-up delay
public void APP_Main_Tasks(void);

#endif