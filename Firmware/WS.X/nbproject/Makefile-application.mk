#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-application.mk)" "nbproject/Makefile-local-application.mk"
include nbproject/Makefile-local-application.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=application
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../RPCLib/MIPS/System/Gpio.c cfg/SST25xx_Cfg.c cfg/Indicator_Cfg.c cfg/TelitPwrCtrl_Cfg.c cfg/Debug_Cfg.c cfg/AS5600_Cfg.c cfg/DPS368_Cfg.c cfg/SHT4x_Cfg.c cfg/GP2Y101xAU_Cfg.c cfg/RainFall_Cfg.c cfg/Thingsboard_Cfg.c cfg/WindSpeed_Cfg.c cfg/TelitAtCmd_Cfg.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/coretimer.c mcc_generated_files/interrupt_manager.c mcc_generated_files/system.c mcc_generated_files/exceptions.c mcc_generated_files/mcc.c mcc_generated_files/spi2_driver.c mcc_generated_files/adc1.c mcc_generated_files/ext_int.c mcc_generated_files/tmr1.c mcc_generated_files/uart1.c mcc_generated_files/rtcc.c mcc_generated_files/i2c1.c ../RPCLib/MIPS/Buttons/Buttons.c ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c ../RPCLib/MIPS/Cellular/TelitAtCmd.c ../RPCLib/MIPS/Common/Debug.c ../RPCLib/MIPS/Common/Utils.c ../RPCLib/MIPS/Indicator/Indicator.c ../RPCLib/MIPS/Memory/SST25xx.c ../RPCLib/MIPS/Sensors/AS5600.c ../RPCLib/MIPS/Sensors/DPS368.c ../RPCLib/MIPS/Sensors/RainFall.c ../RPCLib/MIPS/Sensors/GP2Y101xAU.c ../RPCLib/MIPS/Sensors/WindSpeed.c ../RPCLib/MIPS/Sensors/SHT4x.c ../RPCLib/MIPS/Sensors/sensirion_common.c ../RPCLib/MIPS/Sensors/sht_git_version.c ../RPCLib/MIPS/system/TaskManager.c ../RPCLib/MIPS/system/TickTimer.c ../RPCLib/MIPS/System/softWdt.c user/AppMain.c user/Power_Monitor.c user/VCP.c user/VCP_Debug.c user/Thingsboard.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1566831265/Gpio.o ${OBJECTDIR}/cfg/SST25xx_Cfg.o ${OBJECTDIR}/cfg/Indicator_Cfg.o ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o ${OBJECTDIR}/cfg/Debug_Cfg.o ${OBJECTDIR}/cfg/AS5600_Cfg.o ${OBJECTDIR}/cfg/DPS368_Cfg.o ${OBJECTDIR}/cfg/SHT4x_Cfg.o ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o ${OBJECTDIR}/cfg/RainFall_Cfg.o ${OBJECTDIR}/cfg/Thingsboard_Cfg.o ${OBJECTDIR}/cfg/WindSpeed_Cfg.o ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/coretimer.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/ext_int.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/i2c1.o ${OBJECTDIR}/_ext/651594321/Buttons.o ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o ${OBJECTDIR}/_ext/2034318053/Debug.o ${OBJECTDIR}/_ext/2034318053/Utils.o ${OBJECTDIR}/_ext/1606675233/Indicator.o ${OBJECTDIR}/_ext/1757259727/SST25xx.o ${OBJECTDIR}/_ext/1904349495/AS5600.o ${OBJECTDIR}/_ext/1904349495/DPS368.o ${OBJECTDIR}/_ext/1904349495/RainFall.o ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o ${OBJECTDIR}/_ext/1904349495/WindSpeed.o ${OBJECTDIR}/_ext/1904349495/SHT4x.o ${OBJECTDIR}/_ext/1904349495/sensirion_common.o ${OBJECTDIR}/_ext/1904349495/sht_git_version.o ${OBJECTDIR}/_ext/650698433/TaskManager.o ${OBJECTDIR}/_ext/650698433/TickTimer.o ${OBJECTDIR}/_ext/1566831265/softWdt.o ${OBJECTDIR}/user/AppMain.o ${OBJECTDIR}/user/Power_Monitor.o ${OBJECTDIR}/user/VCP.o ${OBJECTDIR}/user/VCP_Debug.o ${OBJECTDIR}/user/Thingsboard.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1566831265/Gpio.o.d ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d ${OBJECTDIR}/cfg/Indicator_Cfg.o.d ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d ${OBJECTDIR}/cfg/Debug_Cfg.o.d ${OBJECTDIR}/cfg/AS5600_Cfg.o.d ${OBJECTDIR}/cfg/DPS368_Cfg.o.d ${OBJECTDIR}/cfg/SHT4x_Cfg.o.d ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d ${OBJECTDIR}/cfg/RainFall_Cfg.o.d ${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d ${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/coretimer.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/exceptions.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/mcc_generated_files/ext_int.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/rtcc.o.d ${OBJECTDIR}/mcc_generated_files/i2c1.o.d ${OBJECTDIR}/_ext/651594321/Buttons.o.d ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d ${OBJECTDIR}/_ext/2034318053/Debug.o.d ${OBJECTDIR}/_ext/2034318053/Utils.o.d ${OBJECTDIR}/_ext/1606675233/Indicator.o.d ${OBJECTDIR}/_ext/1757259727/SST25xx.o.d ${OBJECTDIR}/_ext/1904349495/AS5600.o.d ${OBJECTDIR}/_ext/1904349495/DPS368.o.d ${OBJECTDIR}/_ext/1904349495/RainFall.o.d ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d ${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d ${OBJECTDIR}/_ext/1904349495/SHT4x.o.d ${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d ${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d ${OBJECTDIR}/_ext/650698433/TaskManager.o.d ${OBJECTDIR}/_ext/650698433/TickTimer.o.d ${OBJECTDIR}/_ext/1566831265/softWdt.o.d ${OBJECTDIR}/user/AppMain.o.d ${OBJECTDIR}/user/Power_Monitor.o.d ${OBJECTDIR}/user/VCP.o.d ${OBJECTDIR}/user/VCP_Debug.o.d ${OBJECTDIR}/user/Thingsboard.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1566831265/Gpio.o ${OBJECTDIR}/cfg/SST25xx_Cfg.o ${OBJECTDIR}/cfg/Indicator_Cfg.o ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o ${OBJECTDIR}/cfg/Debug_Cfg.o ${OBJECTDIR}/cfg/AS5600_Cfg.o ${OBJECTDIR}/cfg/DPS368_Cfg.o ${OBJECTDIR}/cfg/SHT4x_Cfg.o ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o ${OBJECTDIR}/cfg/RainFall_Cfg.o ${OBJECTDIR}/cfg/Thingsboard_Cfg.o ${OBJECTDIR}/cfg/WindSpeed_Cfg.o ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/coretimer.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/ext_int.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/i2c1.o ${OBJECTDIR}/_ext/651594321/Buttons.o ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o ${OBJECTDIR}/_ext/2034318053/Debug.o ${OBJECTDIR}/_ext/2034318053/Utils.o ${OBJECTDIR}/_ext/1606675233/Indicator.o ${OBJECTDIR}/_ext/1757259727/SST25xx.o ${OBJECTDIR}/_ext/1904349495/AS5600.o ${OBJECTDIR}/_ext/1904349495/DPS368.o ${OBJECTDIR}/_ext/1904349495/RainFall.o ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o ${OBJECTDIR}/_ext/1904349495/WindSpeed.o ${OBJECTDIR}/_ext/1904349495/SHT4x.o ${OBJECTDIR}/_ext/1904349495/sensirion_common.o ${OBJECTDIR}/_ext/1904349495/sht_git_version.o ${OBJECTDIR}/_ext/650698433/TaskManager.o ${OBJECTDIR}/_ext/650698433/TickTimer.o ${OBJECTDIR}/_ext/1566831265/softWdt.o ${OBJECTDIR}/user/AppMain.o ${OBJECTDIR}/user/Power_Monitor.o ${OBJECTDIR}/user/VCP.o ${OBJECTDIR}/user/VCP_Debug.o ${OBJECTDIR}/user/Thingsboard.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=../RPCLib/MIPS/System/Gpio.c cfg/SST25xx_Cfg.c cfg/Indicator_Cfg.c cfg/TelitPwrCtrl_Cfg.c cfg/Debug_Cfg.c cfg/AS5600_Cfg.c cfg/DPS368_Cfg.c cfg/SHT4x_Cfg.c cfg/GP2Y101xAU_Cfg.c cfg/RainFall_Cfg.c cfg/Thingsboard_Cfg.c cfg/WindSpeed_Cfg.c cfg/TelitAtCmd_Cfg.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/coretimer.c mcc_generated_files/interrupt_manager.c mcc_generated_files/system.c mcc_generated_files/exceptions.c mcc_generated_files/mcc.c mcc_generated_files/spi2_driver.c mcc_generated_files/adc1.c mcc_generated_files/ext_int.c mcc_generated_files/tmr1.c mcc_generated_files/uart1.c mcc_generated_files/rtcc.c mcc_generated_files/i2c1.c ../RPCLib/MIPS/Buttons/Buttons.c ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c ../RPCLib/MIPS/Cellular/TelitAtCmd.c ../RPCLib/MIPS/Common/Debug.c ../RPCLib/MIPS/Common/Utils.c ../RPCLib/MIPS/Indicator/Indicator.c ../RPCLib/MIPS/Memory/SST25xx.c ../RPCLib/MIPS/Sensors/AS5600.c ../RPCLib/MIPS/Sensors/DPS368.c ../RPCLib/MIPS/Sensors/RainFall.c ../RPCLib/MIPS/Sensors/GP2Y101xAU.c ../RPCLib/MIPS/Sensors/WindSpeed.c ../RPCLib/MIPS/Sensors/SHT4x.c ../RPCLib/MIPS/Sensors/sensirion_common.c ../RPCLib/MIPS/Sensors/sht_git_version.c ../RPCLib/MIPS/system/TaskManager.c ../RPCLib/MIPS/system/TickTimer.c ../RPCLib/MIPS/System/softWdt.c user/AppMain.c user/Power_Monitor.c user/VCP.c user/VCP_Debug.c user/Thingsboard.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MM0256GPM048
ProjectDir="D:\WeatherStation_Thesis\Firmware\WS.X"
ProjectName=WS
ConfName=application
ImagePath="dist\application\${IMAGE_TYPE}\WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\application\${IMAGE_TYPE}"
ImageName="WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-application.mk ${DISTDIR}/WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [copy ${ImagePath} ".\app.${OUTPUT_SUFFIX}"]"
	@copy ${ImagePath} ".\app.${OUTPUT_SUFFIX}"
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=32MM0256GPM048
MP_LINKER_FILE_OPTION=,--script="App.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1566831265/Gpio.o: ../RPCLib/MIPS/System/Gpio.c  .generated_files/flags/application/e9511c395efc6041d170254678970e8a880d09b5 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/Gpio.o.d" -o ${OBJECTDIR}/_ext/1566831265/Gpio.o ../RPCLib/MIPS/System/Gpio.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SST25xx_Cfg.o: cfg/SST25xx_Cfg.c  .generated_files/flags/application/40d0d23546d9bac6e3209348d01ca45809483ebe .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SST25xx_Cfg.o.d" -o ${OBJECTDIR}/cfg/SST25xx_Cfg.o cfg/SST25xx_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Indicator_Cfg.o: cfg/Indicator_Cfg.c  .generated_files/flags/application/b1ee6e0fde21013968e8ecee8da0b9b7046fd885 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Indicator_Cfg.o.d" -o ${OBJECTDIR}/cfg/Indicator_Cfg.o cfg/Indicator_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o: cfg/TelitPwrCtrl_Cfg.c  .generated_files/flags/application/f23c26b41a37c5826eb21544625c65bf02611d82 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o cfg/TelitPwrCtrl_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Debug_Cfg.o: cfg/Debug_Cfg.c  .generated_files/flags/application/9fc804730ca73104ce65898ca663816fb302ee03 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Debug_Cfg.o.d" -o ${OBJECTDIR}/cfg/Debug_Cfg.o cfg/Debug_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/AS5600_Cfg.o: cfg/AS5600_Cfg.c  .generated_files/flags/application/1b42d8273041e5450da3c07ff228064bffcb4aba .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/AS5600_Cfg.o.d" -o ${OBJECTDIR}/cfg/AS5600_Cfg.o cfg/AS5600_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/DPS368_Cfg.o: cfg/DPS368_Cfg.c  .generated_files/flags/application/da49ec42f4e5c6a6bd9477639aa0d4d35320425d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/DPS368_Cfg.o.d" -o ${OBJECTDIR}/cfg/DPS368_Cfg.o cfg/DPS368_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SHT4x_Cfg.o: cfg/SHT4x_Cfg.c  .generated_files/flags/application/a755573d39764d2676c9b00e5851c9ded801774d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SHT4x_Cfg.o.d" -o ${OBJECTDIR}/cfg/SHT4x_Cfg.o cfg/SHT4x_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o: cfg/GP2Y101xAU_Cfg.c  .generated_files/flags/application/f434b9709489374e0bd5b6217906197a4abbb21c .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d" -o ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o cfg/GP2Y101xAU_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/RainFall_Cfg.o: cfg/RainFall_Cfg.c  .generated_files/flags/application/ce39300d9c9d38863717cfa02aec9d3c420c45f9 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/RainFall_Cfg.o.d" -o ${OBJECTDIR}/cfg/RainFall_Cfg.o cfg/RainFall_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Thingsboard_Cfg.o: cfg/Thingsboard_Cfg.c  .generated_files/flags/application/eefe0ea988b5cfcd52952dac1416e08ef8e27981 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d" -o ${OBJECTDIR}/cfg/Thingsboard_Cfg.o cfg/Thingsboard_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/WindSpeed_Cfg.o: cfg/WindSpeed_Cfg.c  .generated_files/flags/application/876e4be7a1f14c0c8a7cf38024bead3100a7e294 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d" -o ${OBJECTDIR}/cfg/WindSpeed_Cfg.o cfg/WindSpeed_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o: cfg/TelitAtCmd_Cfg.c  .generated_files/flags/application/f32be9c50248ac3482dd456d3cb7ee21b984a8d9 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o cfg/TelitAtCmd_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/application/42a68f75bf80015ca08cb8793ec4d059f7f38ed3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o mcc_generated_files/drivers/spi_master.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/application/21977394665a09ada9b764f1a50c4d0757966384 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/application/89d2d0234b72de3ca0dc1c6db6ea87ea8ca680f7 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/application/67820e567987367e1beaeaf7e4a0e2ca158f8366 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/application/5de5ce2f65fdd18ba10d26be553e2eb37dac7a94 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/application/782eb2dd1cd289d460b4bea472d45000de1257e6 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/application/9cadb50317b0dd7b314d1b2a7ddbc846ac31e7e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/coretimer.o: mcc_generated_files/coretimer.c  .generated_files/flags/application/3c27da813775887086909e58d005660cd9ae78f3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/coretimer.o.d" -o ${OBJECTDIR}/mcc_generated_files/coretimer.o mcc_generated_files/coretimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/application/b45d49c4605267003597efe864a71894de2b33fa .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/application/6545ce97b9da5c8dec8256319bb31f5f68170271 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/application/1bc94664ec3b1179099cb0039247dc978fe184c8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/application/39b17fc38ae8efa97622e95e6140893983aee4f1 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi2_driver.o: mcc_generated_files/spi2_driver.c  .generated_files/flags/application/5964ed6f74c64cd2236d61a7b0aa61a359258ca9 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o mcc_generated_files/spi2_driver.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/application/d58cc7da093b8714bea6150ed0bf9e92f28bd349 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  .generated_files/flags/application/5a40619d9e4f00cc3827548d52e36494fd1de7bc .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" -o ${OBJECTDIR}/mcc_generated_files/ext_int.o mcc_generated_files/ext_int.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/application/72a7cccffac0406ddea1c0d1d7c75a4fc7df4d6 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr1.o mcc_generated_files/tmr1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/application/d569f6ed6fc461fe6a878b24cce8dbf88315a95 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart1.o mcc_generated_files/uart1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/application/31036d1f9f0be0d377c586675335211c668bfc80 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c1.o: mcc_generated_files/i2c1.c  .generated_files/flags/application/aca3606d3cfb061126ea0a8b1f18accfedd7e01a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c1.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c1.o mcc_generated_files/i2c1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/651594321/Buttons.o: ../RPCLib/MIPS/Buttons/Buttons.c  .generated_files/flags/application/5f009e72619a0291bb251871343a3777476393ab .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/651594321" 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/651594321/Buttons.o.d" -o ${OBJECTDIR}/_ext/651594321/Buttons.o ../RPCLib/MIPS/Buttons/Buttons.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o: ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c  .generated_files/flags/application/96b0dfe3a3128742e72c56dcc8407f07982a47ad .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o: ../RPCLib/MIPS/Cellular/TelitAtCmd.c  .generated_files/flags/application/52a0c26c20c96aa0bc87e9d49fde03473a1c4186 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o ../RPCLib/MIPS/Cellular/TelitAtCmd.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Debug.o: ../RPCLib/MIPS/Common/Debug.c  .generated_files/flags/application/dced94bf4c38637cb0b51c9ffc46b7acda7daee .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Debug.o.d" -o ${OBJECTDIR}/_ext/2034318053/Debug.o ../RPCLib/MIPS/Common/Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Utils.o: ../RPCLib/MIPS/Common/Utils.c  .generated_files/flags/application/f5ec61ef410109317250d62997429208d3c83320 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Utils.o.d" -o ${OBJECTDIR}/_ext/2034318053/Utils.o ../RPCLib/MIPS/Common/Utils.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1606675233/Indicator.o: ../RPCLib/MIPS/Indicator/Indicator.c  .generated_files/flags/application/832e1e526443935d6400ff4a12eebccb471c0234 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1606675233" 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o.d 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1606675233/Indicator.o.d" -o ${OBJECTDIR}/_ext/1606675233/Indicator.o ../RPCLib/MIPS/Indicator/Indicator.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1757259727/SST25xx.o: ../RPCLib/MIPS/Memory/SST25xx.c  .generated_files/flags/application/987fb94f6fd08d503dcf90f4dc7ba12f439b5db8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1757259727" 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1757259727/SST25xx.o.d" -o ${OBJECTDIR}/_ext/1757259727/SST25xx.o ../RPCLib/MIPS/Memory/SST25xx.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/AS5600.o: ../RPCLib/MIPS/Sensors/AS5600.c  .generated_files/flags/application/7719912d16a3a4fc9030b817e6352390a52f9018 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/AS5600.o.d" -o ${OBJECTDIR}/_ext/1904349495/AS5600.o ../RPCLib/MIPS/Sensors/AS5600.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/DPS368.o: ../RPCLib/MIPS/Sensors/DPS368.c  .generated_files/flags/application/9ef825367fd4bd1bf11393ec9c9505080a6b5cba .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/DPS368.o.d" -o ${OBJECTDIR}/_ext/1904349495/DPS368.o ../RPCLib/MIPS/Sensors/DPS368.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/RainFall.o: ../RPCLib/MIPS/Sensors/RainFall.c  .generated_files/flags/application/782d1740766864d6970cf5f930cac9f334acfac2 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/RainFall.o.d" -o ${OBJECTDIR}/_ext/1904349495/RainFall.o ../RPCLib/MIPS/Sensors/RainFall.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o: ../RPCLib/MIPS/Sensors/GP2Y101xAU.c  .generated_files/flags/application/1e4fc7e815932c5933fef9e753d2e79ff531de21 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d" -o ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o ../RPCLib/MIPS/Sensors/GP2Y101xAU.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/WindSpeed.o: ../RPCLib/MIPS/Sensors/WindSpeed.c  .generated_files/flags/application/32d257a22b1864e118fc38bf69b3ea60c54c2d0a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d" -o ${OBJECTDIR}/_ext/1904349495/WindSpeed.o ../RPCLib/MIPS/Sensors/WindSpeed.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/SHT4x.o: ../RPCLib/MIPS/Sensors/SHT4x.c  .generated_files/flags/application/43ead28304e4425e498c5e4f3acdefcb24f70504 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/SHT4x.o.d" -o ${OBJECTDIR}/_ext/1904349495/SHT4x.o ../RPCLib/MIPS/Sensors/SHT4x.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sensirion_common.o: ../RPCLib/MIPS/Sensors/sensirion_common.c  .generated_files/flags/application/b03aa50ff65a52d9d7054cc6962956e739e3c7bd .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d" -o ${OBJECTDIR}/_ext/1904349495/sensirion_common.o ../RPCLib/MIPS/Sensors/sensirion_common.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sht_git_version.o: ../RPCLib/MIPS/Sensors/sht_git_version.c  .generated_files/flags/application/a2b6a9d1117b292c6ad4e2c056f41f1777f21b2e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d" -o ${OBJECTDIR}/_ext/1904349495/sht_git_version.o ../RPCLib/MIPS/Sensors/sht_git_version.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TaskManager.o: ../RPCLib/MIPS/system/TaskManager.c  .generated_files/flags/application/e1b2c11d8c449438628e23099b7e21c14445be55 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TaskManager.o.d" -o ${OBJECTDIR}/_ext/650698433/TaskManager.o ../RPCLib/MIPS/system/TaskManager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TickTimer.o: ../RPCLib/MIPS/system/TickTimer.c  .generated_files/flags/application/af6aa59995bb473b41996fa2c84315f3b31ad439 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TickTimer.o.d" -o ${OBJECTDIR}/_ext/650698433/TickTimer.o ../RPCLib/MIPS/system/TickTimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1566831265/softWdt.o: ../RPCLib/MIPS/System/softWdt.c  .generated_files/flags/application/5aa5063af045478a017700d625722ebd86099332 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/softWdt.o.d" -o ${OBJECTDIR}/_ext/1566831265/softWdt.o ../RPCLib/MIPS/System/softWdt.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/AppMain.o: user/AppMain.c  .generated_files/flags/application/34eed7eaa6b56160d8bbd21b20735793e6ccd18a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/AppMain.o.d 
	@${RM} ${OBJECTDIR}/user/AppMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/AppMain.o.d" -o ${OBJECTDIR}/user/AppMain.o user/AppMain.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Power_Monitor.o: user/Power_Monitor.c  .generated_files/flags/application/fe17a238b455e4f286c57fe5e33e6829bef3ba42 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o.d 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Power_Monitor.o.d" -o ${OBJECTDIR}/user/Power_Monitor.o user/Power_Monitor.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP.o: user/VCP.c  .generated_files/flags/application/37894b3f3a1df2faca8c0604649f60987f5cdd26 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP.o.d 
	@${RM} ${OBJECTDIR}/user/VCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP.o.d" -o ${OBJECTDIR}/user/VCP.o user/VCP.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP_Debug.o: user/VCP_Debug.c  .generated_files/flags/application/47da133bbc5ca0d23820e8138f9b9242bc69976f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o.d 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP_Debug.o.d" -o ${OBJECTDIR}/user/VCP_Debug.o user/VCP_Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Thingsboard.o: user/Thingsboard.c  .generated_files/flags/application/a3b1b4b918fba0fb82f576cadaeb95a8a213067a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o.d 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Thingsboard.o.d" -o ${OBJECTDIR}/user/Thingsboard.o user/Thingsboard.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/application/f75c2dbbfa0163784ef38dfd040941e9fed5ad63 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1566831265/Gpio.o: ../RPCLib/MIPS/System/Gpio.c  .generated_files/flags/application/a8736a755d92447855a885aa230edb01f39c16e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/Gpio.o.d" -o ${OBJECTDIR}/_ext/1566831265/Gpio.o ../RPCLib/MIPS/System/Gpio.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SST25xx_Cfg.o: cfg/SST25xx_Cfg.c  .generated_files/flags/application/456e9eab0ce538ab6fcdccdad318f42d99d07ae .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SST25xx_Cfg.o.d" -o ${OBJECTDIR}/cfg/SST25xx_Cfg.o cfg/SST25xx_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Indicator_Cfg.o: cfg/Indicator_Cfg.c  .generated_files/flags/application/96f7ce06fb46f4acb6a81882861b04b9bcd452f6 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Indicator_Cfg.o.d" -o ${OBJECTDIR}/cfg/Indicator_Cfg.o cfg/Indicator_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o: cfg/TelitPwrCtrl_Cfg.c  .generated_files/flags/application/a22a0529fe099f5ff74eae64adfb69e9fe34bc5e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o cfg/TelitPwrCtrl_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Debug_Cfg.o: cfg/Debug_Cfg.c  .generated_files/flags/application/d55be4f844fb03c0b8f90839cfe8b3a386fd7dc8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Debug_Cfg.o.d" -o ${OBJECTDIR}/cfg/Debug_Cfg.o cfg/Debug_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/AS5600_Cfg.o: cfg/AS5600_Cfg.c  .generated_files/flags/application/9f1583e347b6de53a93b54c92e63ab74ecb51d2c .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/AS5600_Cfg.o.d" -o ${OBJECTDIR}/cfg/AS5600_Cfg.o cfg/AS5600_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/DPS368_Cfg.o: cfg/DPS368_Cfg.c  .generated_files/flags/application/61bd2dc257ec1799b517b8960aa74e6b11409340 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/DPS368_Cfg.o.d" -o ${OBJECTDIR}/cfg/DPS368_Cfg.o cfg/DPS368_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SHT4x_Cfg.o: cfg/SHT4x_Cfg.c  .generated_files/flags/application/35d1d65a69697b99b392a13948439adb3cd161fe .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SHT4x_Cfg.o.d" -o ${OBJECTDIR}/cfg/SHT4x_Cfg.o cfg/SHT4x_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o: cfg/GP2Y101xAU_Cfg.c  .generated_files/flags/application/aaf1f14ad51e9db9d230074d26ef6844de2740b7 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d" -o ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o cfg/GP2Y101xAU_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/RainFall_Cfg.o: cfg/RainFall_Cfg.c  .generated_files/flags/application/b6011d999dfbc7722376b0ee65a2f635f05733f9 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/RainFall_Cfg.o.d" -o ${OBJECTDIR}/cfg/RainFall_Cfg.o cfg/RainFall_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Thingsboard_Cfg.o: cfg/Thingsboard_Cfg.c  .generated_files/flags/application/e2bc6f0e57b59935e9335a724b80283be031db26 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d" -o ${OBJECTDIR}/cfg/Thingsboard_Cfg.o cfg/Thingsboard_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/WindSpeed_Cfg.o: cfg/WindSpeed_Cfg.c  .generated_files/flags/application/e51ce94a8be71aa6379e4fd7bc2b1d288b902a04 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d" -o ${OBJECTDIR}/cfg/WindSpeed_Cfg.o cfg/WindSpeed_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o: cfg/TelitAtCmd_Cfg.c  .generated_files/flags/application/34ebf38b2b2645d20759ae77c01c78822e8bb83 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o cfg/TelitAtCmd_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/application/29832db6b6869b988498483d0b83b57e94b40352 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o mcc_generated_files/drivers/spi_master.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/application/d2a53b965bebf71e9336a916f952a2f81de6ff58 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/application/d946888c4e5447f412c89909892276ac023ff061 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/application/199f5aea77e236bc54c0301b0d2e1b4debe37744 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/application/1f45058b296713d7f7e478a9f2f352f48d7b2d55 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/application/4a9c1b9b68ae1a32a902f6fe1970ca7fd9fa4c90 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/application/dd0c2667823a9e66b2c9ea59cce3643b46dfc298 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/coretimer.o: mcc_generated_files/coretimer.c  .generated_files/flags/application/802d752cece4e0de501924481f91b0c878e6897b .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/coretimer.o.d" -o ${OBJECTDIR}/mcc_generated_files/coretimer.o mcc_generated_files/coretimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/application/37c761a770863fd6596d526fbf5a3d9886568271 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/application/52229636886d40174f52db70d90c03dbd9142fdf .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/application/bbaf024bbd0513e7772f8b16a8d620856331fda2 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/application/9b510c43f8f9debb5b2964b21299546db33bef8e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi2_driver.o: mcc_generated_files/spi2_driver.c  .generated_files/flags/application/3d3881116edd4305aaf8d21e92951c90f39a871d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o mcc_generated_files/spi2_driver.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/application/65f988a3ddc46f4448fd532a2a647f2993222740 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  .generated_files/flags/application/707e1f9d5987cfa92bcfc5a85139a178d2df8daf .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" -o ${OBJECTDIR}/mcc_generated_files/ext_int.o mcc_generated_files/ext_int.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/application/fac2a7991c40a7f8ee64705d9fe45b027a13623a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr1.o mcc_generated_files/tmr1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/application/b862c0d6fa604c40c27158f0bd0946c651452abb .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart1.o mcc_generated_files/uart1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/application/363b96616974d1694273f88b9231e86e380159be .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c1.o: mcc_generated_files/i2c1.c  .generated_files/flags/application/e6c95ca5a96c3e72e9d42d3eba9fe382003d8421 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c1.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c1.o mcc_generated_files/i2c1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/651594321/Buttons.o: ../RPCLib/MIPS/Buttons/Buttons.c  .generated_files/flags/application/63d32178fa65e69f7b12a040aa82928255da7e30 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/651594321" 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/651594321/Buttons.o.d" -o ${OBJECTDIR}/_ext/651594321/Buttons.o ../RPCLib/MIPS/Buttons/Buttons.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o: ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c  .generated_files/flags/application/ac0b5c61f61f4d3fde5ff82df850e93f6be01459 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o: ../RPCLib/MIPS/Cellular/TelitAtCmd.c  .generated_files/flags/application/821263c2be8e5c2c58a995c27d1d3097ba364377 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o ../RPCLib/MIPS/Cellular/TelitAtCmd.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Debug.o: ../RPCLib/MIPS/Common/Debug.c  .generated_files/flags/application/a3c37d6900b0327a584495eae8c39e4956b4488 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Debug.o.d" -o ${OBJECTDIR}/_ext/2034318053/Debug.o ../RPCLib/MIPS/Common/Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Utils.o: ../RPCLib/MIPS/Common/Utils.c  .generated_files/flags/application/9fdd543c4ad0bdd3c18844ce5c935f0f3224dabc .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Utils.o.d" -o ${OBJECTDIR}/_ext/2034318053/Utils.o ../RPCLib/MIPS/Common/Utils.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1606675233/Indicator.o: ../RPCLib/MIPS/Indicator/Indicator.c  .generated_files/flags/application/f8cc52683f0ef7383503e20ccea80a6171d508c3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1606675233" 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o.d 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1606675233/Indicator.o.d" -o ${OBJECTDIR}/_ext/1606675233/Indicator.o ../RPCLib/MIPS/Indicator/Indicator.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1757259727/SST25xx.o: ../RPCLib/MIPS/Memory/SST25xx.c  .generated_files/flags/application/6a155ab4fef0f61871110239415b61682295b7a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1757259727" 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1757259727/SST25xx.o.d" -o ${OBJECTDIR}/_ext/1757259727/SST25xx.o ../RPCLib/MIPS/Memory/SST25xx.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/AS5600.o: ../RPCLib/MIPS/Sensors/AS5600.c  .generated_files/flags/application/ecf3ebd75a53309088c7cbac4d559fff66d9ad7f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/AS5600.o.d" -o ${OBJECTDIR}/_ext/1904349495/AS5600.o ../RPCLib/MIPS/Sensors/AS5600.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/DPS368.o: ../RPCLib/MIPS/Sensors/DPS368.c  .generated_files/flags/application/e2dc8c1c2ebc7a5cccc3d8126d03a10375d68986 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/DPS368.o.d" -o ${OBJECTDIR}/_ext/1904349495/DPS368.o ../RPCLib/MIPS/Sensors/DPS368.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/RainFall.o: ../RPCLib/MIPS/Sensors/RainFall.c  .generated_files/flags/application/497e52a8378951352c9c14cfb2fa890a3a811cca .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/RainFall.o.d" -o ${OBJECTDIR}/_ext/1904349495/RainFall.o ../RPCLib/MIPS/Sensors/RainFall.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o: ../RPCLib/MIPS/Sensors/GP2Y101xAU.c  .generated_files/flags/application/cd3f450c21ea8f658a68f88063a1e34000b731c3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d" -o ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o ../RPCLib/MIPS/Sensors/GP2Y101xAU.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/WindSpeed.o: ../RPCLib/MIPS/Sensors/WindSpeed.c  .generated_files/flags/application/8c4516ae8afc7eb1a93c026cbff363fc24dc74c4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d" -o ${OBJECTDIR}/_ext/1904349495/WindSpeed.o ../RPCLib/MIPS/Sensors/WindSpeed.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/SHT4x.o: ../RPCLib/MIPS/Sensors/SHT4x.c  .generated_files/flags/application/b9933092818ecef82c3acd5ae8e7eaf1770d745f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/SHT4x.o.d" -o ${OBJECTDIR}/_ext/1904349495/SHT4x.o ../RPCLib/MIPS/Sensors/SHT4x.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sensirion_common.o: ../RPCLib/MIPS/Sensors/sensirion_common.c  .generated_files/flags/application/4c669d5a4194aaf36d737862932677f3e6623008 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d" -o ${OBJECTDIR}/_ext/1904349495/sensirion_common.o ../RPCLib/MIPS/Sensors/sensirion_common.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sht_git_version.o: ../RPCLib/MIPS/Sensors/sht_git_version.c  .generated_files/flags/application/9b323960fb38d7b520b5e2e9c22fbe7d3d9695d5 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d" -o ${OBJECTDIR}/_ext/1904349495/sht_git_version.o ../RPCLib/MIPS/Sensors/sht_git_version.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TaskManager.o: ../RPCLib/MIPS/system/TaskManager.c  .generated_files/flags/application/f13339d45c8525ac8fb399fa83cfbe8ca5fc0afe .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TaskManager.o.d" -o ${OBJECTDIR}/_ext/650698433/TaskManager.o ../RPCLib/MIPS/system/TaskManager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TickTimer.o: ../RPCLib/MIPS/system/TickTimer.c  .generated_files/flags/application/d6092472ce33416e49c91ba171b77cd506b612e3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TickTimer.o.d" -o ${OBJECTDIR}/_ext/650698433/TickTimer.o ../RPCLib/MIPS/system/TickTimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1566831265/softWdt.o: ../RPCLib/MIPS/System/softWdt.c  .generated_files/flags/application/38f38681aad644ef6bdb8a59b3b9129b8317d361 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/softWdt.o.d" -o ${OBJECTDIR}/_ext/1566831265/softWdt.o ../RPCLib/MIPS/System/softWdt.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/AppMain.o: user/AppMain.c  .generated_files/flags/application/3f138e63205005f3d5fe80c43cef136a4926b4b8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/AppMain.o.d 
	@${RM} ${OBJECTDIR}/user/AppMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/AppMain.o.d" -o ${OBJECTDIR}/user/AppMain.o user/AppMain.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Power_Monitor.o: user/Power_Monitor.c  .generated_files/flags/application/287c296ee5860ba7c6549b0642293c0288266a14 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o.d 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Power_Monitor.o.d" -o ${OBJECTDIR}/user/Power_Monitor.o user/Power_Monitor.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP.o: user/VCP.c  .generated_files/flags/application/a4809f567996b6385f4d69fc66ca08165ee2143c .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP.o.d 
	@${RM} ${OBJECTDIR}/user/VCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP.o.d" -o ${OBJECTDIR}/user/VCP.o user/VCP.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP_Debug.o: user/VCP_Debug.c  .generated_files/flags/application/60dd379469bb9546a54d8842b083fddec51b58b2 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o.d 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP_Debug.o.d" -o ${OBJECTDIR}/user/VCP_Debug.o user/VCP_Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Thingsboard.o: user/Thingsboard.c  .generated_files/flags/application/5ec0a6ceddb49fa23adb4c04d66b416ec345cd4f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o.d 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Thingsboard.o.d" -o ${OBJECTDIR}/user/Thingsboard.o user/Thingsboard.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/application/e1878af12583cdf29cf9e90974f60a4acb1c680a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    App.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -o ${DISTDIR}/WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=4096,--defsym=_min_stack_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/WS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   App.ld bld_m0256_0F08071E0A1F.hex
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -o ${DISTDIR}/WS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=4096,--defsym=_min_stack_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/WS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/WS.X.${IMAGE_TYPE}.hex -o${DISTDIR}/WS.X.${IMAGE_TYPE}.hex

	@echo "Creating unified hex file"
	@"C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/WS.X.${IMAGE_TYPE}.hex bld_m0256_0F08071E0A1F.hex -odist/${CND_CONF}/production/WS.X.production.unified.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
