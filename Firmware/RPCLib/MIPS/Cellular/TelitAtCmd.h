#ifndef TELITATCMD_H
#define TELITATCMD_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

typedef struct {
    const size_t Size;
    uint8_t *pData;
    size_t Len;
} __attribute_packed__ buff_t;

typedef struct {
    uint8_t tryCount;
    uint16_t firstWait;
    uint16_t lastWait;
    char *pCmd;
    char *pAck;
    char *pNack;
} __attribute_packed__ atcmd_cxt_t;

typedef struct {
    uint32_t plmn;
    uint32_t cid;
    uint16_t tac;
    int16_t sinr;
    int8_t rsrp;
    int8_t rssi;
    int8_t rsrq;
} __attribute_packed__ rfsts_t;

typedef struct {
    char imei[16];
    char ccid[20];
    char imsi[16];
} __attribute_packed__ module_info_t;

typedef struct {
    float lat;
    float lon;
    float alt;
} __attribute_packed__ gnss_t;

/* ******************************************************* External variables */
extern buff_t AtCmdRxBuff;
// Response constants
extern const char RES_OK[];
extern const char RES_ERROR[];
extern const char RES_READY[];
/* ********************************************** Defined in TelitAtCmd_Cfg.c */
void ATCMD_Port_Init(void);
void ATCMD_Port_Deinit(void);
bool ATCMD_Port_IsRxReady(void);
uint8_t ATCMD_Port_Read(void);
bool ATCMD_Port_IsTxReady(void);
void ATCMD_Port_Write(uint8_t);
bool ATCMD_Port_IsTxDone(void);
/* ************************************************************************** */
void ATCMD_Init(void);
void ATCMD_Deinit(void);
void ATCMD_Delay(uint16_t delayMs);
int8_t ATCMD_SendRaw(const uint8_t *pD, int sz, uint16_t Wait);
int8_t ATCMD_GetRaw(uint8_t *pD, int *pSz, uint16_t firstWait, uint16_t lastWait);
int8_t ATCMD_SendGetDat(const char *pTx, char *pRx, uint16_t firstWait, uint16_t lastWait);
int8_t ATCMD_SendGetAck(const char *pTx, const char *pAck, const char *pNAck, uint16_t firstWait, uint16_t lastWait, uint8_t tryCount);
int8_t ATCMD_GetAck(const char *pAck, const char *pNAck, uint16_t firstWait, uint16_t lastWait);
/* ************************************************************************** */
int8_t __ATCMD_Test(uint8_t tryCount); // Max 63 time
// tryCount OR (|) options
#define ALL_STATE_ON    0x00
#define ALL_STATE_OFF   0x40
#define AT_LEAST_1ON    0x80
#define AT_LEAST_1OFF   0xC0
#define ATCMD_Test(trycount, opt)    __ATCMD_Test(trycount|opt)
/* ********************************************************************* APIs */

int8_t ATCMD_EchoOff(uint8_t);
int8_t ATCMD_ReportOn(void);
int8_t ATCMD_NoFlowCtrl(void);
int8_t ATCMD_SetAirplaneMode(void);
int8_t ATCMD_SetFullFuncMode(void);
int8_t ATCMD_SetNbPriority(void);
int8_t ATCMD_SetLteOnly(void);
int8_t ATCMD_Reboot(void);
int8_t ATCMD_SysHalt(void);
int8_t ATCMD_CheckSim(void);
int8_t ATCMD_CheckNetReg(uint8_t);
int8_t ATCMD_GetGnssPwrStt(bool *);
int8_t ATCMD_SetGnssPwrStt(bool);
int8_t ATCMD_GetImei(char *);
int8_t ATCMD_GetIccId(char *);
int8_t ATCMD_GetImsi(char *);

int8_t ATCMD_GetModuleInfo(module_info_t *);
int8_t ATCMD_GetRfsts(rfsts_t *);
int8_t ATCMD_GetGnss(gnss_t *);

#define ATCMD_GetRxBuffer(idx)  AtCmdRxBuff.pData[idx]
#define ATCMD_GetRxSize()       AtCmdRxBuff.Size
#define ATCMD_GetRxLen()        AtCmdRxBuff.Len

#endif