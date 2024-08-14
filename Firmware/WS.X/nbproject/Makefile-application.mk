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
ProjectDir="D:\WeatherStation\Firmware\WS.X"
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
${OBJECTDIR}/_ext/1566831265/Gpio.o: ../RPCLib/MIPS/System/Gpio.c  .generated_files/flags/application/db79cefb6040ffbf054d6c6ea1ad11f0a04c5cb6 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/Gpio.o.d" -o ${OBJECTDIR}/_ext/1566831265/Gpio.o ../RPCLib/MIPS/System/Gpio.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SST25xx_Cfg.o: cfg/SST25xx_Cfg.c  .generated_files/flags/application/b46786d55ee3425a0055fda03ec3ebf45f6c391a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SST25xx_Cfg.o.d" -o ${OBJECTDIR}/cfg/SST25xx_Cfg.o cfg/SST25xx_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Indicator_Cfg.o: cfg/Indicator_Cfg.c  .generated_files/flags/application/be280924296dff81eb8fb87199d2a93cc38fb3cf .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Indicator_Cfg.o.d" -o ${OBJECTDIR}/cfg/Indicator_Cfg.o cfg/Indicator_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o: cfg/TelitPwrCtrl_Cfg.c  .generated_files/flags/application/76c0df259bf85419319954df5550561416868dc1 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o cfg/TelitPwrCtrl_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Debug_Cfg.o: cfg/Debug_Cfg.c  .generated_files/flags/application/1d82db2cc1858497f573035d4106d6c9e687d1e8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Debug_Cfg.o.d" -o ${OBJECTDIR}/cfg/Debug_Cfg.o cfg/Debug_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/AS5600_Cfg.o: cfg/AS5600_Cfg.c  .generated_files/flags/application/bfe18359210656bc07a08e0a0dc06e256334b0b3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/AS5600_Cfg.o.d" -o ${OBJECTDIR}/cfg/AS5600_Cfg.o cfg/AS5600_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/DPS368_Cfg.o: cfg/DPS368_Cfg.c  .generated_files/flags/application/bcffe9f29930bab3647ff8d4381f05d7282ce4c4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/DPS368_Cfg.o.d" -o ${OBJECTDIR}/cfg/DPS368_Cfg.o cfg/DPS368_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SHT4x_Cfg.o: cfg/SHT4x_Cfg.c  .generated_files/flags/application/6959ce25811d422996becb6f6270ed5bff46ca94 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SHT4x_Cfg.o.d" -o ${OBJECTDIR}/cfg/SHT4x_Cfg.o cfg/SHT4x_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o: cfg/GP2Y101xAU_Cfg.c  .generated_files/flags/application/829f0f62d3164029a827506cf61623646b917904 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d" -o ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o cfg/GP2Y101xAU_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/RainFall_Cfg.o: cfg/RainFall_Cfg.c  .generated_files/flags/application/ca04c7fc17724c1884c67fb61c3a6e663e7e18a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/RainFall_Cfg.o.d" -o ${OBJECTDIR}/cfg/RainFall_Cfg.o cfg/RainFall_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Thingsboard_Cfg.o: cfg/Thingsboard_Cfg.c  .generated_files/flags/application/4fa114840dc29bc9de6ca9a5cd738ed1769453b4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d" -o ${OBJECTDIR}/cfg/Thingsboard_Cfg.o cfg/Thingsboard_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/WindSpeed_Cfg.o: cfg/WindSpeed_Cfg.c  .generated_files/flags/application/c6465c85f2a49978e5f0602b69630eb353397bc2 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d" -o ${OBJECTDIR}/cfg/WindSpeed_Cfg.o cfg/WindSpeed_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o: cfg/TelitAtCmd_Cfg.c  .generated_files/flags/application/5f689d29a4a200bb77419e9664ede3670532c80 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o cfg/TelitAtCmd_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/application/d041caf7b72f52381919aee46e10ac16c3c26d66 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o mcc_generated_files/drivers/spi_master.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/application/f1d789ff784aa54051c25206239fad948245a5e1 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/application/c7699bbc599f0826d726f3dfe4917eabc8c330b4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/application/50757d98eae011d8f0f15bbcd7939d81446eae91 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/application/7c8cae5120cb9560232207b0dfabd49ba9315ce2 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/application/4ab0ad543550555ffc96b6c1682762fa6bb9de30 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/application/96ff831e9b21da029ee59e21b7a2e55817dfebbd .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/coretimer.o: mcc_generated_files/coretimer.c  .generated_files/flags/application/c866f6ba426ce713eba36433adca3b861c413c84 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/coretimer.o.d" -o ${OBJECTDIR}/mcc_generated_files/coretimer.o mcc_generated_files/coretimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/application/e13904cbabc7f556e76f0d7ed57c4857cddcaa9f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/application/689af5bfebb9cc03305bf60d3a6336d9ddcd2b4f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/application/85378806be251f29c290074bf0ee300f3cb81c80 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/application/cea69eb9a74c9add4353e15cf70a20628384b373 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi2_driver.o: mcc_generated_files/spi2_driver.c  .generated_files/flags/application/b823d1fee7f63a9ee6448d20c9f1397619a634b6 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o mcc_generated_files/spi2_driver.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/application/d3fc2ed581cbd0d0b035d22d6c5c8807ce978787 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  .generated_files/flags/application/e908f466f804859c6da1d1e3bc16a33653fb824c .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" -o ${OBJECTDIR}/mcc_generated_files/ext_int.o mcc_generated_files/ext_int.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/application/d44175ea3066d4f19545316da50a6ec4b2775201 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr1.o mcc_generated_files/tmr1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/application/3dfc036f11aa9380b66b6e8f52bb0378a1fb0505 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart1.o mcc_generated_files/uart1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/application/dda7fa71004e76c40fe1e83c383429c1ea1299a9 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c1.o: mcc_generated_files/i2c1.c  .generated_files/flags/application/6348b4a8bf97f6044019323081ce09700f4c996d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c1.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c1.o mcc_generated_files/i2c1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/651594321/Buttons.o: ../RPCLib/MIPS/Buttons/Buttons.c  .generated_files/flags/application/1ec2ffe0dc3f280add89d06b571ba1a284b0db2c .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/651594321" 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/651594321/Buttons.o.d" -o ${OBJECTDIR}/_ext/651594321/Buttons.o ../RPCLib/MIPS/Buttons/Buttons.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o: ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c  .generated_files/flags/application/18ce04071f4ad725de29af55838e203a083046fe .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o: ../RPCLib/MIPS/Cellular/TelitAtCmd.c  .generated_files/flags/application/c23d983a552e8f974f54974444b9ba0092d339fe .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o ../RPCLib/MIPS/Cellular/TelitAtCmd.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Debug.o: ../RPCLib/MIPS/Common/Debug.c  .generated_files/flags/application/d30df9db37def5e5580e2c1202d3156e116f0e38 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Debug.o.d" -o ${OBJECTDIR}/_ext/2034318053/Debug.o ../RPCLib/MIPS/Common/Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Utils.o: ../RPCLib/MIPS/Common/Utils.c  .generated_files/flags/application/bbad49e096e234261456d77aae4a8dbe310c3c12 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Utils.o.d" -o ${OBJECTDIR}/_ext/2034318053/Utils.o ../RPCLib/MIPS/Common/Utils.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1606675233/Indicator.o: ../RPCLib/MIPS/Indicator/Indicator.c  .generated_files/flags/application/a8cdada6a0687887dbd9aea4155bfe4a10a27fd4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1606675233" 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o.d 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1606675233/Indicator.o.d" -o ${OBJECTDIR}/_ext/1606675233/Indicator.o ../RPCLib/MIPS/Indicator/Indicator.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1757259727/SST25xx.o: ../RPCLib/MIPS/Memory/SST25xx.c  .generated_files/flags/application/4c5dd4e1fbe84b3e481fc5a2b13b1d6ef7dfcb08 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1757259727" 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1757259727/SST25xx.o.d" -o ${OBJECTDIR}/_ext/1757259727/SST25xx.o ../RPCLib/MIPS/Memory/SST25xx.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/AS5600.o: ../RPCLib/MIPS/Sensors/AS5600.c  .generated_files/flags/application/537fe93062fe291b3851deec6e7088c9185a337d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/AS5600.o.d" -o ${OBJECTDIR}/_ext/1904349495/AS5600.o ../RPCLib/MIPS/Sensors/AS5600.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/DPS368.o: ../RPCLib/MIPS/Sensors/DPS368.c  .generated_files/flags/application/3d72a9a0aa4ba95089e438e07fca6d44985d7ec4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/DPS368.o.d" -o ${OBJECTDIR}/_ext/1904349495/DPS368.o ../RPCLib/MIPS/Sensors/DPS368.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/RainFall.o: ../RPCLib/MIPS/Sensors/RainFall.c  .generated_files/flags/application/48c1445ae89e69ae04d394e7bf066acea3e69ea7 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/RainFall.o.d" -o ${OBJECTDIR}/_ext/1904349495/RainFall.o ../RPCLib/MIPS/Sensors/RainFall.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o: ../RPCLib/MIPS/Sensors/GP2Y101xAU.c  .generated_files/flags/application/d3f99ef96e39f60fa2a6c4ab342aec11f784b045 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d" -o ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o ../RPCLib/MIPS/Sensors/GP2Y101xAU.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/WindSpeed.o: ../RPCLib/MIPS/Sensors/WindSpeed.c  .generated_files/flags/application/d98db92a9eae336355ea6e31f40d73e1e58d166a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d" -o ${OBJECTDIR}/_ext/1904349495/WindSpeed.o ../RPCLib/MIPS/Sensors/WindSpeed.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/SHT4x.o: ../RPCLib/MIPS/Sensors/SHT4x.c  .generated_files/flags/application/be022918e8f02520e73290d672e9dc032d31ed78 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/SHT4x.o.d" -o ${OBJECTDIR}/_ext/1904349495/SHT4x.o ../RPCLib/MIPS/Sensors/SHT4x.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sensirion_common.o: ../RPCLib/MIPS/Sensors/sensirion_common.c  .generated_files/flags/application/47d58905c9c55f0d1ba2d39426f116955db26717 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d" -o ${OBJECTDIR}/_ext/1904349495/sensirion_common.o ../RPCLib/MIPS/Sensors/sensirion_common.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sht_git_version.o: ../RPCLib/MIPS/Sensors/sht_git_version.c  .generated_files/flags/application/30b942ea2edb165bb5ab4217f767d44ca267e705 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d" -o ${OBJECTDIR}/_ext/1904349495/sht_git_version.o ../RPCLib/MIPS/Sensors/sht_git_version.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TaskManager.o: ../RPCLib/MIPS/system/TaskManager.c  .generated_files/flags/application/96ffec8ce047541cb13f27a0114f59773a1526cf .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TaskManager.o.d" -o ${OBJECTDIR}/_ext/650698433/TaskManager.o ../RPCLib/MIPS/system/TaskManager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TickTimer.o: ../RPCLib/MIPS/system/TickTimer.c  .generated_files/flags/application/6ddc26da2a1ed19d784cb0d7eab0faa22cfb336a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TickTimer.o.d" -o ${OBJECTDIR}/_ext/650698433/TickTimer.o ../RPCLib/MIPS/system/TickTimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1566831265/softWdt.o: ../RPCLib/MIPS/System/softWdt.c  .generated_files/flags/application/2e028597563158f68078a59148dc5cca34019969 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/softWdt.o.d" -o ${OBJECTDIR}/_ext/1566831265/softWdt.o ../RPCLib/MIPS/System/softWdt.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/AppMain.o: user/AppMain.c  .generated_files/flags/application/30de7758496b07175000eb94949e640f94818bcf .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/AppMain.o.d 
	@${RM} ${OBJECTDIR}/user/AppMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/AppMain.o.d" -o ${OBJECTDIR}/user/AppMain.o user/AppMain.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Power_Monitor.o: user/Power_Monitor.c  .generated_files/flags/application/ef3ea57d5eaa024167c7a1abc10c40491b94aed8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o.d 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Power_Monitor.o.d" -o ${OBJECTDIR}/user/Power_Monitor.o user/Power_Monitor.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP.o: user/VCP.c  .generated_files/flags/application/29641fdfebe265f5764550b8ed668c2d3bb00c2b .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP.o.d 
	@${RM} ${OBJECTDIR}/user/VCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP.o.d" -o ${OBJECTDIR}/user/VCP.o user/VCP.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP_Debug.o: user/VCP_Debug.c  .generated_files/flags/application/6607c0e8d92666339605080adf67d40c8084d63e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o.d 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP_Debug.o.d" -o ${OBJECTDIR}/user/VCP_Debug.o user/VCP_Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Thingsboard.o: user/Thingsboard.c  .generated_files/flags/application/12c04e67e64abb2fe9b3345a25dc31877fd78368 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o.d 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Thingsboard.o.d" -o ${OBJECTDIR}/user/Thingsboard.o user/Thingsboard.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/application/54944576b5cfa7c5946b9085e3b15fb9eb77751d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1566831265/Gpio.o: ../RPCLib/MIPS/System/Gpio.c  .generated_files/flags/application/5b9b84e964fd27cbb7f392ba927e4cba16cb5a59 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/Gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/Gpio.o.d" -o ${OBJECTDIR}/_ext/1566831265/Gpio.o ../RPCLib/MIPS/System/Gpio.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SST25xx_Cfg.o: cfg/SST25xx_Cfg.c  .generated_files/flags/application/ad8c354d19b2a63307c571e5fff7259cd53cecdf .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SST25xx_Cfg.o.d" -o ${OBJECTDIR}/cfg/SST25xx_Cfg.o cfg/SST25xx_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Indicator_Cfg.o: cfg/Indicator_Cfg.c  .generated_files/flags/application/a89e7f7a90174aad9e3aa78e713ef0c2501f9973 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Indicator_Cfg.o.d" -o ${OBJECTDIR}/cfg/Indicator_Cfg.o cfg/Indicator_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o: cfg/TelitPwrCtrl_Cfg.c  .generated_files/flags/application/6e9c45df2fd2e5822bd82223572d9f5edbee9acb .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitPwrCtrl_Cfg.o cfg/TelitPwrCtrl_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Debug_Cfg.o: cfg/Debug_Cfg.c  .generated_files/flags/application/949473552ae1e6390ae0c60302825104eb09188b .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Debug_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Debug_Cfg.o.d" -o ${OBJECTDIR}/cfg/Debug_Cfg.o cfg/Debug_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/AS5600_Cfg.o: cfg/AS5600_Cfg.c  .generated_files/flags/application/3b2c6252bf6476ead9e2131eb9de0f889f1e25d8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/AS5600_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/AS5600_Cfg.o.d" -o ${OBJECTDIR}/cfg/AS5600_Cfg.o cfg/AS5600_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/DPS368_Cfg.o: cfg/DPS368_Cfg.c  .generated_files/flags/application/c477255ce8339627e78da899f42d3e56065d636b .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/DPS368_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/DPS368_Cfg.o.d" -o ${OBJECTDIR}/cfg/DPS368_Cfg.o cfg/DPS368_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/SHT4x_Cfg.o: cfg/SHT4x_Cfg.c  .generated_files/flags/application/f7c2ac86c0e12b82ccdac802b609e8e1054b9bb3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SHT4x_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SHT4x_Cfg.o.d" -o ${OBJECTDIR}/cfg/SHT4x_Cfg.o cfg/SHT4x_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o: cfg/GP2Y101xAU_Cfg.c  .generated_files/flags/application/8640cfc4226dca4a1878baa907b3e41bc8690807 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o.d" -o ${OBJECTDIR}/cfg/GP2Y101xAU_Cfg.o cfg/GP2Y101xAU_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/RainFall_Cfg.o: cfg/RainFall_Cfg.c  .generated_files/flags/application/14c0fbaf18c24395d6454ac0caf897433a42a1d1 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/RainFall_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/RainFall_Cfg.o.d" -o ${OBJECTDIR}/cfg/RainFall_Cfg.o cfg/RainFall_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Thingsboard_Cfg.o: cfg/Thingsboard_Cfg.c  .generated_files/flags/application/73b5731e8bb24f30a1168c6e6f2af1d80bcb2a42 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Thingsboard_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Thingsboard_Cfg.o.d" -o ${OBJECTDIR}/cfg/Thingsboard_Cfg.o cfg/Thingsboard_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/WindSpeed_Cfg.o: cfg/WindSpeed_Cfg.c  .generated_files/flags/application/ec5dba17584b6f3b15cfe9c7eaa30597491c9691 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/WindSpeed_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/WindSpeed_Cfg.o.d" -o ${OBJECTDIR}/cfg/WindSpeed_Cfg.o cfg/WindSpeed_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o: cfg/TelitAtCmd_Cfg.c  .generated_files/flags/application/8bf4d0b403f919f95ca1311b95ecb2824ee32ec9 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o.d" -o ${OBJECTDIR}/cfg/TelitAtCmd_Cfg.o cfg/TelitAtCmd_Cfg.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/application/a990bcdcf1e22997be3402e0f692d845b6ad2be8 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o mcc_generated_files/drivers/spi_master.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/application/f05afe6da8c60f07e9f866373d9a1e184bfd76d6 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/application/aae1f3b91f3c0716a327f07cea8a3d149430ae0d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/application/ca8c0b83b2b12328808252f5575aefeb4da4a99d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/application/dec54ca408d6b277601f174f1405903fe14aa614 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/application/2a638a62cbf1ecfd6d62d41d07504adbda39db80 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/application/322568ceb4e1e450d9f872025f92c16584e7722 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/coretimer.o: mcc_generated_files/coretimer.c  .generated_files/flags/application/fda6bde2e35c275e7b7afb23a702ecfda826b299 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/coretimer.o.d" -o ${OBJECTDIR}/mcc_generated_files/coretimer.o mcc_generated_files/coretimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/application/749cfe205507a9a1d02ab74fb1fb5f52d2701329 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/application/d2ecbe26971c597382f689d50d54ac80a21bc85f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/application/bc60701f358f687fd4bf8add2fe78658de3f5710 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/application/94f814e861c39b62ca979a4b3ab1a6c887e69f4f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi2_driver.o: mcc_generated_files/spi2_driver.c  .generated_files/flags/application/1edfb00560d8c53fa73de2dee3c70f12729d1e7d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o mcc_generated_files/spi2_driver.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/application/6659bfcab7c762d2c8b7c6edc5b2cbc5524497f1 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/ext_int.o: mcc_generated_files/ext_int.c  .generated_files/flags/application/372fd65413e24f55cf233f80ae363a36db007eed .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ext_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/ext_int.o.d" -o ${OBJECTDIR}/mcc_generated_files/ext_int.o mcc_generated_files/ext_int.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/application/d1de433da62c2813a7d3324ceba7a9932d384c31 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d" -o ${OBJECTDIR}/mcc_generated_files/tmr1.o mcc_generated_files/tmr1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/application/a9cfe24a70b5798255d788b3c6e4934860ff8b8a .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart1.o mcc_generated_files/uart1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/application/f732197c6c614105ea44f4921e92f6a04128af4e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c1.o: mcc_generated_files/i2c1.c  .generated_files/flags/application/93822c09126a5baba78fc1f2b28cb0326966e664 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c1.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c1.o mcc_generated_files/i2c1.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/651594321/Buttons.o: ../RPCLib/MIPS/Buttons/Buttons.c  .generated_files/flags/application/41764e8ed81442cfe6522a2c7f3202f8cd7f9d5b .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/651594321" 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/651594321/Buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/651594321/Buttons.o.d" -o ${OBJECTDIR}/_ext/651594321/Buttons.o ../RPCLib/MIPS/Buttons/Buttons.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o: ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c  .generated_files/flags/application/27a73ee8bbc051445f9a83efe6d90879c381a2f2 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitPwrCtrl.o ../RPCLib/MIPS/Cellular/TelitPwrCtrl.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o: ../RPCLib/MIPS/Cellular/TelitAtCmd.c  .generated_files/flags/application/1f52b33c15f713c6a4499606f2f1643fdf7c2418 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1084004198" 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o.d" -o ${OBJECTDIR}/_ext/1084004198/TelitAtCmd.o ../RPCLib/MIPS/Cellular/TelitAtCmd.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Debug.o: ../RPCLib/MIPS/Common/Debug.c  .generated_files/flags/application/c8c77427420da99669f754af44b4b5df27e1dcfa .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Debug.o.d" -o ${OBJECTDIR}/_ext/2034318053/Debug.o ../RPCLib/MIPS/Common/Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2034318053/Utils.o: ../RPCLib/MIPS/Common/Utils.c  .generated_files/flags/application/a463de152635ec907724e4d9ad0a29ba1dd40667 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2034318053" 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2034318053/Utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/2034318053/Utils.o.d" -o ${OBJECTDIR}/_ext/2034318053/Utils.o ../RPCLib/MIPS/Common/Utils.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1606675233/Indicator.o: ../RPCLib/MIPS/Indicator/Indicator.c  .generated_files/flags/application/cbafb15681896d07e76a4369dcd9562f617adc33 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1606675233" 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o.d 
	@${RM} ${OBJECTDIR}/_ext/1606675233/Indicator.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1606675233/Indicator.o.d" -o ${OBJECTDIR}/_ext/1606675233/Indicator.o ../RPCLib/MIPS/Indicator/Indicator.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1757259727/SST25xx.o: ../RPCLib/MIPS/Memory/SST25xx.c  .generated_files/flags/application/fe3677fbb280f84b367c9011b46ed1f9d9d43c79 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1757259727" 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1757259727/SST25xx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1757259727/SST25xx.o.d" -o ${OBJECTDIR}/_ext/1757259727/SST25xx.o ../RPCLib/MIPS/Memory/SST25xx.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/AS5600.o: ../RPCLib/MIPS/Sensors/AS5600.c  .generated_files/flags/application/41b68d2883ec8fa2591d6e7c871c14fbc3b5ae6f .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/AS5600.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/AS5600.o.d" -o ${OBJECTDIR}/_ext/1904349495/AS5600.o ../RPCLib/MIPS/Sensors/AS5600.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/DPS368.o: ../RPCLib/MIPS/Sensors/DPS368.c  .generated_files/flags/application/d796531abc3ef29a1ccba5381337eb94541a644d .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/DPS368.o.d" -o ${OBJECTDIR}/_ext/1904349495/DPS368.o ../RPCLib/MIPS/Sensors/DPS368.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/RainFall.o: ../RPCLib/MIPS/Sensors/RainFall.c  .generated_files/flags/application/b33a8a1c838216e12383b270c80aceb69a0a03ba .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/RainFall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/RainFall.o.d" -o ${OBJECTDIR}/_ext/1904349495/RainFall.o ../RPCLib/MIPS/Sensors/RainFall.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o: ../RPCLib/MIPS/Sensors/GP2Y101xAU.c  .generated_files/flags/application/7aee32b0735ac2830dccfdd5938ce072006b08cc .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o.d" -o ${OBJECTDIR}/_ext/1904349495/GP2Y101xAU.o ../RPCLib/MIPS/Sensors/GP2Y101xAU.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/WindSpeed.o: ../RPCLib/MIPS/Sensors/WindSpeed.c  .generated_files/flags/application/7f8944fc4d517efb3a48fca8851eb42b0db983ff .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/WindSpeed.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/WindSpeed.o.d" -o ${OBJECTDIR}/_ext/1904349495/WindSpeed.o ../RPCLib/MIPS/Sensors/WindSpeed.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/SHT4x.o: ../RPCLib/MIPS/Sensors/SHT4x.c  .generated_files/flags/application/91fb4664f34981bec9977d9af746fcb2eac1d171 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/SHT4x.o.d" -o ${OBJECTDIR}/_ext/1904349495/SHT4x.o ../RPCLib/MIPS/Sensors/SHT4x.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sensirion_common.o: ../RPCLib/MIPS/Sensors/sensirion_common.c  .generated_files/flags/application/7075f35b6b187cae4e8897228c108f4ccaec66a3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sensirion_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sensirion_common.o.d" -o ${OBJECTDIR}/_ext/1904349495/sensirion_common.o ../RPCLib/MIPS/Sensors/sensirion_common.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1904349495/sht_git_version.o: ../RPCLib/MIPS/Sensors/sht_git_version.c  .generated_files/flags/application/4f6918d1bb00b1de26a61f65461acd859614a8a4 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1904349495" 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904349495/sht_git_version.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1904349495/sht_git_version.o.d" -o ${OBJECTDIR}/_ext/1904349495/sht_git_version.o ../RPCLib/MIPS/Sensors/sht_git_version.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TaskManager.o: ../RPCLib/MIPS/system/TaskManager.c  .generated_files/flags/application/25a86277ce306563b1070029203c622dedd3754b .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TaskManager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TaskManager.o.d" -o ${OBJECTDIR}/_ext/650698433/TaskManager.o ../RPCLib/MIPS/system/TaskManager.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/650698433/TickTimer.o: ../RPCLib/MIPS/system/TickTimer.c  .generated_files/flags/application/ca29ce5c1b48a11ac9f659b8f876169ace51ebd1 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/650698433" 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/650698433/TickTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/650698433/TickTimer.o.d" -o ${OBJECTDIR}/_ext/650698433/TickTimer.o ../RPCLib/MIPS/system/TickTimer.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1566831265/softWdt.o: ../RPCLib/MIPS/System/softWdt.c  .generated_files/flags/application/7967a774ea4ca0d3fa63f5c6d6b37807f4f0866c .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1566831265" 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1566831265/softWdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1566831265/softWdt.o.d" -o ${OBJECTDIR}/_ext/1566831265/softWdt.o ../RPCLib/MIPS/System/softWdt.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/AppMain.o: user/AppMain.c  .generated_files/flags/application/c9662d3598b4d353be79cc9e2db55218c339def0 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/AppMain.o.d 
	@${RM} ${OBJECTDIR}/user/AppMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/AppMain.o.d" -o ${OBJECTDIR}/user/AppMain.o user/AppMain.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Power_Monitor.o: user/Power_Monitor.c  .generated_files/flags/application/12f72421fa90867c97c253c1c05f627b596f8e70 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o.d 
	@${RM} ${OBJECTDIR}/user/Power_Monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Power_Monitor.o.d" -o ${OBJECTDIR}/user/Power_Monitor.o user/Power_Monitor.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP.o: user/VCP.c  .generated_files/flags/application/c4a8a98050df5adf157d816e4af873b0ce590384 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP.o.d 
	@${RM} ${OBJECTDIR}/user/VCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP.o.d" -o ${OBJECTDIR}/user/VCP.o user/VCP.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/VCP_Debug.o: user/VCP_Debug.c  .generated_files/flags/application/aea1b9f4b91039d0962e513f03d90698ec5e80a3 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o.d 
	@${RM} ${OBJECTDIR}/user/VCP_Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/VCP_Debug.o.d" -o ${OBJECTDIR}/user/VCP_Debug.o user/VCP_Debug.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/user/Thingsboard.o: user/Thingsboard.c  .generated_files/flags/application/cecc093f6e08eb2f776dec94f165df9b7ae60284 .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/user" 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o.d 
	@${RM} ${OBJECTDIR}/user/Thingsboard.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"cfg" -I"mcc_generated_files" -I"user" -I"../RPCLib/MIPS" -ffunction-sections -fdata-sections -O2 -fno-common -DDISABLE_LIBRARY_WARNING -DUSE_PROJECT_CFG -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/user/Thingsboard.o.d" -o ${OBJECTDIR}/user/Thingsboard.o user/Thingsboard.c    -DXPRJ_application=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/application/f0c695bb4545db706b11d75612534a064d98244e .generated_files/flags/application/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
