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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=cfg/SST25xx_Cfg.c cfg/Indicator_Cfg.c Cfg/Debug_Cfg.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/memory/flash.c mcc_generated_files/usb/usb_device_generic.c mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/uart3.c mcc_generated_files/system.c mcc_generated_files/coretimer.c mcc_generated_files/clock.c mcc_generated_files/exceptions.c mcc_generated_files/adc1.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/uart2.c mcc_generated_files/spi2_driver.c mcc_generated_files/i2c1.c mcc_generated_files/i2c2.c ../../../MIPS/Buttons/Buttons.c ../../../MIPS/Common/Utils.c ../../../MIPS/Common/Debug.c ../../../MIPS/Indicator/Indicator.c ../../../MIPS/Memory/SST25xx.c ../../../MIPS/System/PIC32MM_Gpio.c ../../../MIPS/System/softWdt.c ../../../MIPS/System/TaskManager.c ../../../MIPS/System/TickTimer.c User/AppMain.c User/Power_Monitor.c User/VCP.c User/VCP_Debug.c main.c ../../../MIPS/Cellular/TelitAtCmd.c ../../../MIPS/Cellular/TelitPwrCtrl.c Cfg/TelitAtCmd_Cfg.c Cfg/TelitPwrCtrl_Cfg.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/cfg/SST25xx_Cfg.o ${OBJECTDIR}/cfg/Indicator_Cfg.o ${OBJECTDIR}/Cfg/Debug_Cfg.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/memory/flash.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/uart3.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/coretimer.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o ${OBJECTDIR}/mcc_generated_files/i2c1.o ${OBJECTDIR}/mcc_generated_files/i2c2.o ${OBJECTDIR}/_ext/393083968/Buttons.o ${OBJECTDIR}/_ext/1349920436/Utils.o ${OBJECTDIR}/_ext/1349920436/Debug.o ${OBJECTDIR}/_ext/927021298/Indicator.o ${OBJECTDIR}/_ext/1072862110/SST25xx.o ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o ${OBJECTDIR}/_ext/882433648/softWdt.o ${OBJECTDIR}/_ext/882433648/TaskManager.o ${OBJECTDIR}/_ext/882433648/TickTimer.o ${OBJECTDIR}/User/AppMain.o ${OBJECTDIR}/User/Power_Monitor.o ${OBJECTDIR}/User/VCP.o ${OBJECTDIR}/User/VCP_Debug.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o
POSSIBLE_DEPFILES=${OBJECTDIR}/cfg/SST25xx_Cfg.o.d ${OBJECTDIR}/cfg/Indicator_Cfg.o.d ${OBJECTDIR}/Cfg/Debug_Cfg.o.d ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d ${OBJECTDIR}/mcc_generated_files/memory/flash.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d ${OBJECTDIR}/mcc_generated_files/uart3.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/coretimer.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/exceptions.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/uart2.o.d ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d ${OBJECTDIR}/mcc_generated_files/i2c1.o.d ${OBJECTDIR}/mcc_generated_files/i2c2.o.d ${OBJECTDIR}/_ext/393083968/Buttons.o.d ${OBJECTDIR}/_ext/1349920436/Utils.o.d ${OBJECTDIR}/_ext/1349920436/Debug.o.d ${OBJECTDIR}/_ext/927021298/Indicator.o.d ${OBJECTDIR}/_ext/1072862110/SST25xx.o.d ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o.d ${OBJECTDIR}/_ext/882433648/softWdt.o.d ${OBJECTDIR}/_ext/882433648/TaskManager.o.d ${OBJECTDIR}/_ext/882433648/TickTimer.o.d ${OBJECTDIR}/User/AppMain.o.d ${OBJECTDIR}/User/Power_Monitor.o.d ${OBJECTDIR}/User/VCP.o.d ${OBJECTDIR}/User/VCP_Debug.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o.d ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o.d ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o.d ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/cfg/SST25xx_Cfg.o ${OBJECTDIR}/cfg/Indicator_Cfg.o ${OBJECTDIR}/Cfg/Debug_Cfg.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/memory/flash.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/uart3.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/coretimer.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o ${OBJECTDIR}/mcc_generated_files/i2c1.o ${OBJECTDIR}/mcc_generated_files/i2c2.o ${OBJECTDIR}/_ext/393083968/Buttons.o ${OBJECTDIR}/_ext/1349920436/Utils.o ${OBJECTDIR}/_ext/1349920436/Debug.o ${OBJECTDIR}/_ext/927021298/Indicator.o ${OBJECTDIR}/_ext/1072862110/SST25xx.o ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o ${OBJECTDIR}/_ext/882433648/softWdt.o ${OBJECTDIR}/_ext/882433648/TaskManager.o ${OBJECTDIR}/_ext/882433648/TickTimer.o ${OBJECTDIR}/User/AppMain.o ${OBJECTDIR}/User/Power_Monitor.o ${OBJECTDIR}/User/VCP.o ${OBJECTDIR}/User/VCP_Debug.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o

# Source Files
SOURCEFILES=cfg/SST25xx_Cfg.c cfg/Indicator_Cfg.c Cfg/Debug_Cfg.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/memory/flash.c mcc_generated_files/usb/usb_device_generic.c mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/uart3.c mcc_generated_files/system.c mcc_generated_files/coretimer.c mcc_generated_files/clock.c mcc_generated_files/exceptions.c mcc_generated_files/adc1.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/uart2.c mcc_generated_files/spi2_driver.c mcc_generated_files/i2c1.c mcc_generated_files/i2c2.c ../../../MIPS/Buttons/Buttons.c ../../../MIPS/Common/Utils.c ../../../MIPS/Common/Debug.c ../../../MIPS/Indicator/Indicator.c ../../../MIPS/Memory/SST25xx.c ../../../MIPS/System/PIC32MM_Gpio.c ../../../MIPS/System/softWdt.c ../../../MIPS/System/TaskManager.c ../../../MIPS/System/TickTimer.c User/AppMain.c User/Power_Monitor.c User/VCP.c User/VCP_Debug.c main.c ../../../MIPS/Cellular/TelitAtCmd.c ../../../MIPS/Cellular/TelitPwrCtrl.c Cfg/TelitAtCmd_Cfg.c Cfg/TelitPwrCtrl_Cfg.c



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
ProjectDir="D:\Github\RPCLib\MIPS\Boards\ARDI\APP.X"
ProjectName=APP
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [copy ${ImagePath} ".\App.${OUTPUT_SUFFIX}"]"
	@copy ${ImagePath} ".\App.${OUTPUT_SUFFIX}"
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=32MM0256GPM048
MP_LINKER_FILE_OPTION=,--script="..\Bld\App.ld"
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
${OBJECTDIR}/cfg/SST25xx_Cfg.o: cfg/SST25xx_Cfg.c  .generated_files/flags/default/1815299a247effcd00095d7ed0b3b96659ee3a40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SST25xx_Cfg.o.d" -o ${OBJECTDIR}/cfg/SST25xx_Cfg.o cfg/SST25xx_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Indicator_Cfg.o: cfg/Indicator_Cfg.c  .generated_files/flags/default/68cd5fff43efbf6124c9dbbe83599f62e0981563 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Indicator_Cfg.o.d" -o ${OBJECTDIR}/cfg/Indicator_Cfg.o cfg/Indicator_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Cfg/Debug_Cfg.o: Cfg/Debug_Cfg.c  .generated_files/flags/default/b04fa9ad017a219d113fe4651a84842c50016ae2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/Cfg" 
	@${RM} ${OBJECTDIR}/Cfg/Debug_Cfg.o.d 
	@${RM} ${OBJECTDIR}/Cfg/Debug_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/Cfg/Debug_Cfg.o.d" -o ${OBJECTDIR}/Cfg/Debug_Cfg.o Cfg/Debug_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/65fc527103be416261294ba39065acda7359176 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o mcc_generated_files/drivers/spi_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/memory/flash.o: mcc_generated_files/memory/flash.c  .generated_files/flags/default/f21913f4849b011bebf1cdd3fd1b5bfa99cedf7d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/memory" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory/flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory/flash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/memory/flash.o.d" -o ${OBJECTDIR}/mcc_generated_files/memory/flash.o mcc_generated_files/memory/flash.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o: mcc_generated_files/usb/usb_device_generic.c  .generated_files/flags/default/5de9735b478e27d2cb21e3938b6c9d47f99dddb5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o mcc_generated_files/usb/usb_device_generic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/bc5fb0806165a215202b5b7902ddf9e9c344527d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/6ea69e123b861b2eff47a6de2935cd30ff4661f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/f6959644a8833a61a2486cd614dc0bdaab59f535 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/d64bf57a1f93c5974254192e43af1eb3a9430819 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart3.o: mcc_generated_files/uart3.c  .generated_files/flags/default/db258edbc0c6b6755896a63be5ada4a1f1683e53 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart3.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart3.o mcc_generated_files/uart3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/82f845fc402c954f2094db6521753d17b5affe47 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/coretimer.o: mcc_generated_files/coretimer.c  .generated_files/flags/default/e1cf8d64fb82d83d62e890b49678e13696bf30d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/coretimer.o.d" -o ${OBJECTDIR}/mcc_generated_files/coretimer.o mcc_generated_files/coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/6a3f928d200881a56005572e07f7ff0d52215d4e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/8c82c40931eb3f9bc294f4ca31030f33bc12fce4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/57436ee87e4d36b21b6f8f48a49b65128efd62e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/e7e8817b245666ff0f9341a873cbac185fd8ba43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/db1a251c119b4b79a4f99304c140f6699a8a957 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/acb1f04f024d427234cf6d2ac555744c05b20768 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  .generated_files/flags/default/4568566e41cd18ab94db7145890da9dfa4de4d59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart2.o mcc_generated_files/uart2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi2_driver.o: mcc_generated_files/spi2_driver.c  .generated_files/flags/default/b71111367e0b007558e93a3c2fa74cf10140609f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o mcc_generated_files/spi2_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c1.o: mcc_generated_files/i2c1.c  .generated_files/flags/default/a5c9a887e3dbe6547d054df1210c22763a146978 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c1.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c1.o mcc_generated_files/i2c1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c2.o: mcc_generated_files/i2c2.c  .generated_files/flags/default/123f4e5638c200d5e5aa2f4aab5643356bb3f27f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c2.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c2.o mcc_generated_files/i2c2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/393083968/Buttons.o: ../../../MIPS/Buttons/Buttons.c  .generated_files/flags/default/80f4fdb0998c10ab30f8d9b27a05d6df714bb4b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/393083968" 
	@${RM} ${OBJECTDIR}/_ext/393083968/Buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/393083968/Buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/393083968/Buttons.o.d" -o ${OBJECTDIR}/_ext/393083968/Buttons.o ../../../MIPS/Buttons/Buttons.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1349920436/Utils.o: ../../../MIPS/Common/Utils.c  .generated_files/flags/default/d71f0fdc8312bc11a6c04d662f71da50d41aadc6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1349920436" 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1349920436/Utils.o.d" -o ${OBJECTDIR}/_ext/1349920436/Utils.o ../../../MIPS/Common/Utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1349920436/Debug.o: ../../../MIPS/Common/Debug.c  .generated_files/flags/default/d1d024a8bcfec3d7b1365cff0aaf66fcafb31e66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1349920436" 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1349920436/Debug.o.d" -o ${OBJECTDIR}/_ext/1349920436/Debug.o ../../../MIPS/Common/Debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/927021298/Indicator.o: ../../../MIPS/Indicator/Indicator.c  .generated_files/flags/default/b1a44367589adebc8211a0b9ecb9579f7d633357 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/927021298" 
	@${RM} ${OBJECTDIR}/_ext/927021298/Indicator.o.d 
	@${RM} ${OBJECTDIR}/_ext/927021298/Indicator.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/927021298/Indicator.o.d" -o ${OBJECTDIR}/_ext/927021298/Indicator.o ../../../MIPS/Indicator/Indicator.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1072862110/SST25xx.o: ../../../MIPS/Memory/SST25xx.c  .generated_files/flags/default/50ceb5e6a67d5c1cc52b1b9e23fc0b6aed71d990 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1072862110" 
	@${RM} ${OBJECTDIR}/_ext/1072862110/SST25xx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1072862110/SST25xx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1072862110/SST25xx.o.d" -o ${OBJECTDIR}/_ext/1072862110/SST25xx.o ../../../MIPS/Memory/SST25xx.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o: ../../../MIPS/System/PIC32MM_Gpio.c  .generated_files/flags/default/dea4c5077d97e6555c721490acf785993ca98220 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o.d" -o ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o ../../../MIPS/System/PIC32MM_Gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/softWdt.o: ../../../MIPS/System/softWdt.c  .generated_files/flags/default/ce486e2fd0cb4f14a2fa5bd98269830052e7b598 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/softWdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/softWdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/softWdt.o.d" -o ${OBJECTDIR}/_ext/882433648/softWdt.o ../../../MIPS/System/softWdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/TaskManager.o: ../../../MIPS/System/TaskManager.c  .generated_files/flags/default/612e054e54b1aee766ad4c999737954732e918a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/TaskManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/TaskManager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/TaskManager.o.d" -o ${OBJECTDIR}/_ext/882433648/TaskManager.o ../../../MIPS/System/TaskManager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/TickTimer.o: ../../../MIPS/System/TickTimer.c  .generated_files/flags/default/bc4aa4929717f448c4016343b408a8828e251f3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/TickTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/TickTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/TickTimer.o.d" -o ${OBJECTDIR}/_ext/882433648/TickTimer.o ../../../MIPS/System/TickTimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/AppMain.o: User/AppMain.c  .generated_files/flags/default/6c4bf02f861e9a7bec6d6515c51a8a7bf77cff5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/AppMain.o.d 
	@${RM} ${OBJECTDIR}/User/AppMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/AppMain.o.d" -o ${OBJECTDIR}/User/AppMain.o User/AppMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/Power_Monitor.o: User/Power_Monitor.c  .generated_files/flags/default/9aba09b799b36f4bfdd7bdfc346a81b932657b35 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/Power_Monitor.o.d 
	@${RM} ${OBJECTDIR}/User/Power_Monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/Power_Monitor.o.d" -o ${OBJECTDIR}/User/Power_Monitor.o User/Power_Monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/VCP.o: User/VCP.c  .generated_files/flags/default/748ac5cb70f999790532f8c0abd63c23cedd1f7b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/VCP.o.d 
	@${RM} ${OBJECTDIR}/User/VCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/VCP.o.d" -o ${OBJECTDIR}/User/VCP.o User/VCP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/VCP_Debug.o: User/VCP_Debug.c  .generated_files/flags/default/ff61f9308240a234879fe95922984621145a947b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/VCP_Debug.o.d 
	@${RM} ${OBJECTDIR}/User/VCP_Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/VCP_Debug.o.d" -o ${OBJECTDIR}/User/VCP_Debug.o User/VCP_Debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/61dbfe7c638e61ae4ac6eed8614e63ba385e74df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507890549/TelitAtCmd.o: ../../../MIPS/Cellular/TelitAtCmd.c  .generated_files/flags/default/bc8a78c691c3969e8a439476d9491eb6e5d57bb1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507890549" 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/507890549/TelitAtCmd.o.d" -o ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o ../../../MIPS/Cellular/TelitAtCmd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o: ../../../MIPS/Cellular/TelitPwrCtrl.c  .generated_files/flags/default/f666eaf334388bb8b9ef619ca208b2fb43748634 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507890549" 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o.d" -o ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o ../../../MIPS/Cellular/TelitPwrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o: Cfg/TelitAtCmd_Cfg.c  .generated_files/flags/default/bcb1a46de00c0753f3220343ccdf49d33bf40377 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/Cfg" 
	@${RM} ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o.d 
	@${RM} ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o.d" -o ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o Cfg/TelitAtCmd_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o: Cfg/TelitPwrCtrl_Cfg.c  .generated_files/flags/default/54b6969866cc0b7fbb1bd2dbd2d1c98cd6736983 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/Cfg" 
	@${RM} ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o.d 
	@${RM} ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o.d" -o ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o Cfg/TelitPwrCtrl_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/cfg/SST25xx_Cfg.o: cfg/SST25xx_Cfg.c  .generated_files/flags/default/ac391c7b18f8fd04014284914f537bba680b92e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/SST25xx_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/SST25xx_Cfg.o.d" -o ${OBJECTDIR}/cfg/SST25xx_Cfg.o cfg/SST25xx_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cfg/Indicator_Cfg.o: cfg/Indicator_Cfg.c  .generated_files/flags/default/ebe88cf01d0469c57f7ccd68125fd2747d7ede5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/cfg" 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o.d 
	@${RM} ${OBJECTDIR}/cfg/Indicator_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/cfg/Indicator_Cfg.o.d" -o ${OBJECTDIR}/cfg/Indicator_Cfg.o cfg/Indicator_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Cfg/Debug_Cfg.o: Cfg/Debug_Cfg.c  .generated_files/flags/default/b8b9026c2519dca1900505d3564e05edd90be5a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/Cfg" 
	@${RM} ${OBJECTDIR}/Cfg/Debug_Cfg.o.d 
	@${RM} ${OBJECTDIR}/Cfg/Debug_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/Cfg/Debug_Cfg.o.d" -o ${OBJECTDIR}/Cfg/Debug_Cfg.o Cfg/Debug_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/ad01471754cef8bf7dda77e5ef614aef7122fe7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d" -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o mcc_generated_files/drivers/spi_master.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/memory/flash.o: mcc_generated_files/memory/flash.c  .generated_files/flags/default/aeec6f6b8e272adca1a786ea4e82ed8ca02be5ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/memory" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory/flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/memory/flash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/memory/flash.o.d" -o ${OBJECTDIR}/mcc_generated_files/memory/flash.o mcc_generated_files/memory/flash.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o: mcc_generated_files/usb/usb_device_generic.c  .generated_files/flags/default/e3b0587c32079da267d414ac62c3d692e6beba4f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_generic.o mcc_generated_files/usb/usb_device_generic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/4f509b1aee544e3332c969258dedeaf6432d785e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/87b4e3c415517dc9956153c0dc57fa86f99b28c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/bdbd65b710a168fee6e14b19e8262ec277cd5835 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/faf2c37bd58e170f9934e6f9fd2280df14bc7fa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart3.o: mcc_generated_files/uart3.c  .generated_files/flags/default/25aed4aa02050159be32c656d6f7d86ed0e5839c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart3.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart3.o mcc_generated_files/uart3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/ebab9922b0db540bac0e79a76a425896ae9b0a65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/coretimer.o: mcc_generated_files/coretimer.c  .generated_files/flags/default/23af1beb13db181c4a1c05e42a2c2d12ed95de05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/coretimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/coretimer.o.d" -o ${OBJECTDIR}/mcc_generated_files/coretimer.o mcc_generated_files/coretimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/a1306e7e17a2520223fcb69a29ec0285979b1983 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/e95717ade523fdbb3f44f3c3b81661969f119c9f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/3e0bc4679a850cef5e43a1119b60ae1a2a25f01e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/7f7bb520f9fbf6f02ab64213fc2a8556e26c03e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/60260164f01dddabcef561f5312a2e4083b6c94f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/3503050efee93e28689589014ab935a31c2abb70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  .generated_files/flags/default/a2a20f5324fe420f86e9ef3a1228ef9efe3b34bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d" -o ${OBJECTDIR}/mcc_generated_files/uart2.o mcc_generated_files/uart2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi2_driver.o: mcc_generated_files/spi2_driver.c  .generated_files/flags/default/17250bc97c69cc7c3e01f100b174ce2e1e37c7a4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2_driver.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi2_driver.o mcc_generated_files/spi2_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c1.o: mcc_generated_files/i2c1.c  .generated_files/flags/default/3782b5762cc6f27853919e6e604fd7f1dc38ffdd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c1.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c1.o mcc_generated_files/i2c1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/i2c2.o: mcc_generated_files/i2c2.c  .generated_files/flags/default/41f5ab0337812879efa6e526e9b39ddb5135512e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/i2c2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/i2c2.o.d" -o ${OBJECTDIR}/mcc_generated_files/i2c2.o mcc_generated_files/i2c2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/393083968/Buttons.o: ../../../MIPS/Buttons/Buttons.c  .generated_files/flags/default/71da8aeb1fae77b777f43977426c1c3928d4b4d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/393083968" 
	@${RM} ${OBJECTDIR}/_ext/393083968/Buttons.o.d 
	@${RM} ${OBJECTDIR}/_ext/393083968/Buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/393083968/Buttons.o.d" -o ${OBJECTDIR}/_ext/393083968/Buttons.o ../../../MIPS/Buttons/Buttons.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1349920436/Utils.o: ../../../MIPS/Common/Utils.c  .generated_files/flags/default/6ae74769d5bfdfe101683bf123ff964131770d72 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1349920436" 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1349920436/Utils.o.d" -o ${OBJECTDIR}/_ext/1349920436/Utils.o ../../../MIPS/Common/Utils.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1349920436/Debug.o: ../../../MIPS/Common/Debug.c  .generated_files/flags/default/efb871bd88616e4a1fcefe6b656ca272727e0b60 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1349920436" 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1349920436/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1349920436/Debug.o.d" -o ${OBJECTDIR}/_ext/1349920436/Debug.o ../../../MIPS/Common/Debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/927021298/Indicator.o: ../../../MIPS/Indicator/Indicator.c  .generated_files/flags/default/14403ab3af7300f1cf61b2058999c696d1f2dfc8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/927021298" 
	@${RM} ${OBJECTDIR}/_ext/927021298/Indicator.o.d 
	@${RM} ${OBJECTDIR}/_ext/927021298/Indicator.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/927021298/Indicator.o.d" -o ${OBJECTDIR}/_ext/927021298/Indicator.o ../../../MIPS/Indicator/Indicator.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1072862110/SST25xx.o: ../../../MIPS/Memory/SST25xx.c  .generated_files/flags/default/3488e45e99d01f601842f5dec90e4f061aba8830 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1072862110" 
	@${RM} ${OBJECTDIR}/_ext/1072862110/SST25xx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1072862110/SST25xx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/1072862110/SST25xx.o.d" -o ${OBJECTDIR}/_ext/1072862110/SST25xx.o ../../../MIPS/Memory/SST25xx.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o: ../../../MIPS/System/PIC32MM_Gpio.c  .generated_files/flags/default/165892dc80b004d6558a686588242c2207cd2e84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o.d" -o ${OBJECTDIR}/_ext/882433648/PIC32MM_Gpio.o ../../../MIPS/System/PIC32MM_Gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/softWdt.o: ../../../MIPS/System/softWdt.c  .generated_files/flags/default/a848391f6322fba2acf966d665de49b245a084c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/softWdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/softWdt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/softWdt.o.d" -o ${OBJECTDIR}/_ext/882433648/softWdt.o ../../../MIPS/System/softWdt.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/TaskManager.o: ../../../MIPS/System/TaskManager.c  .generated_files/flags/default/a484b9fca06a59231050ad6400e2d22826b9635a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/TaskManager.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/TaskManager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/TaskManager.o.d" -o ${OBJECTDIR}/_ext/882433648/TaskManager.o ../../../MIPS/System/TaskManager.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/882433648/TickTimer.o: ../../../MIPS/System/TickTimer.c  .generated_files/flags/default/87365803322c6ce347b3860d3af5ff5496ab210d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/882433648" 
	@${RM} ${OBJECTDIR}/_ext/882433648/TickTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/882433648/TickTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/882433648/TickTimer.o.d" -o ${OBJECTDIR}/_ext/882433648/TickTimer.o ../../../MIPS/System/TickTimer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/AppMain.o: User/AppMain.c  .generated_files/flags/default/d5e4edb7acd9ae1925c72ac2ca6276a59f0748b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/AppMain.o.d 
	@${RM} ${OBJECTDIR}/User/AppMain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/AppMain.o.d" -o ${OBJECTDIR}/User/AppMain.o User/AppMain.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/Power_Monitor.o: User/Power_Monitor.c  .generated_files/flags/default/43821d7f44871a26d02c68b69a69e91c46ba63b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/Power_Monitor.o.d 
	@${RM} ${OBJECTDIR}/User/Power_Monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/Power_Monitor.o.d" -o ${OBJECTDIR}/User/Power_Monitor.o User/Power_Monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/VCP.o: User/VCP.c  .generated_files/flags/default/c501fec16b57252dca028adba9b2929e86ea5309 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/VCP.o.d 
	@${RM} ${OBJECTDIR}/User/VCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/VCP.o.d" -o ${OBJECTDIR}/User/VCP.o User/VCP.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/User/VCP_Debug.o: User/VCP_Debug.c  .generated_files/flags/default/d35fe2f7a5f05e92ad78227bf9b0087ff16e11d3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/User" 
	@${RM} ${OBJECTDIR}/User/VCP_Debug.o.d 
	@${RM} ${OBJECTDIR}/User/VCP_Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/User/VCP_Debug.o.d" -o ${OBJECTDIR}/User/VCP_Debug.o User/VCP_Debug.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/e91975d7ebc822eb72a99b097d46f438d09beb04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507890549/TelitAtCmd.o: ../../../MIPS/Cellular/TelitAtCmd.c  .generated_files/flags/default/2954b16ae8d3bbcbe38a764af1d0c723df0c88ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507890549" 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o.d 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/507890549/TelitAtCmd.o.d" -o ${OBJECTDIR}/_ext/507890549/TelitAtCmd.o ../../../MIPS/Cellular/TelitAtCmd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o: ../../../MIPS/Cellular/TelitPwrCtrl.c  .generated_files/flags/default/41b3e5e5d3d1391e2d3bfb32a08e0401f6abf34c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/507890549" 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o.d" -o ${OBJECTDIR}/_ext/507890549/TelitPwrCtrl.o ../../../MIPS/Cellular/TelitPwrCtrl.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o: Cfg/TelitAtCmd_Cfg.c  .generated_files/flags/default/43bfb2949a84859fe5048d1e0fbfd4f076f79e5f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/Cfg" 
	@${RM} ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o.d 
	@${RM} ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o.d" -o ${OBJECTDIR}/Cfg/TelitAtCmd_Cfg.o Cfg/TelitAtCmd_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o: Cfg/TelitPwrCtrl_Cfg.c  .generated_files/flags/default/f098e7b568be0250636ae406e2f15eaca5c1e8c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/Cfg" 
	@${RM} ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o.d 
	@${RM} ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"mcc_generated_files" -I"Cfg" -I"User" -I"../Bld" -I"../../../MIPS" -ffunction-sections -fdata-sections -O1 -fno-common -Werror -Wall -mcci -MP -MMD -MF "${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o.d" -o ${OBJECTDIR}/Cfg/TelitPwrCtrl_Cfg.o Cfg/TelitPwrCtrl_Cfg.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../Bld/App.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC016FF -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=4096,--defsym=_min_stack_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/APP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../Bld/App.ld ../Bld/bld_m0256_0F0A18194802.hex
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/APP.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=4096,--defsym=_min_stack_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/APP.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/APP.X.${IMAGE_TYPE}.hex -o${DISTDIR}/APP.X.${IMAGE_TYPE}.hex

	@echo "Creating unified hex file"
	@"C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.20/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/APP.X.${IMAGE_TYPE}.hex ../Bld/bld_m0256_0F0A18194802.hex -odist/${CND_CONF}/production/APP.X.production.unified.hex

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
