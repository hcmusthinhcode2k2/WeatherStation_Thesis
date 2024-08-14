#include "TelitAtCmd.h"
#include "Common/Utils.h"
#include "System/TickTimer.h"

#ifdef USE_ATCMD_DEBUG
#include "Common/Debug.h"
#else
#define __dbs(...)
#define __dbc(...)
#define __dbh2(...)
#define __tsdbs(...)
#define __dbsu(...)
#endif

/* ******************************************************* External variables */
// Response constants
const char RES_OK[]="\r\nOK\r\n";
const char RES_ERROR[]="\r\nERROR\r\n";
const char RES_READY[]="\r\nREADY\r\n";

/* ********************************************************** Local variables */

static size_t AckCount=0;
static size_t NAckCount=0;
static size_t RxCount=0;
static uint8_t ReTry=0;
static uint8_t TestCount=0;
static uint8_t DoNext=0;
static tick_t Tdelay=500;
static int8_t lastRslt=RESULT_DONE;
static tick_timer_t TickRaw={1, 0, 0};

void ATCMD_Init(void) // <editor-fold defaultstate="collapsed" desc="initialize">
{
    ReTry=0;
    DoNext=0;
    RxCount=0;
    TestCount=0;
    AckCount=0;
    NAckCount=0;
    Tdelay=500;
    AtCmdRxBuff.Len=0;
    lastRslt=RESULT_DONE;
    Tick_Timer_Reset(TickRaw);
    ATCMD_Port_Init();
} // </editor-fold>

void ATCMD_Deinit(void) // <editor-fold defaultstate="collapsed" desc="deinitialize">
{
    ATCMD_Port_Deinit();
}

int8_t ATCMD_SendRaw(const uint8_t *pD, int sz, uint16_t Wait) // <editor-fold defaultstate="collapsed" desc="send raw data">
{
    // Get all response data in Rx buffer before send new data
    __dbs("\n\nClear Rx: ");

    while(ATCMD_Port_IsRxReady())
    {
        uint8_t c=ATCMD_Port_Read();

        if(is_printable(c))
            __dbc(c);
        else
        {
            __dbc('<');
            __dbh2(c);
            __dbc('>');
        }

        if(Tick_Timer_Is_Over_Ms(TickRaw, Wait))
        {
            __dbs("\nTX timeout");
            return RESULT_ERR;
        }
    }

    __dbs(" Done");
    __tsdbs("TX: ");
    Tick_Timer_Reset(TickRaw);
    RxCount=0;

    while(sz>0)
    {
        if(ATCMD_Port_IsTxReady())
        {
            if(is_printable(*pD))
                __dbc(*pD);
            else
            {
                __dbc('<');
                __dbh2(*pD);
                __dbc('>');
            }

            ATCMD_Port_Write(*pD++);
            sz--;
        }
    }

    while(!ATCMD_Port_IsTxDone());

    return RESULT_DONE;
} // </editor-fold>

int8_t ATCMD_GetRaw(uint8_t *pD, int *pSz, uint16_t firstWait, uint16_t lastWait) // <editor-fold defaultstate="collapsed" desc="get raw data">
{
    while(ATCMD_Port_IsRxReady())
    {
        uint8_t c=ATCMD_Port_Read();

        Tick_Timer_Reset(TickRaw);

        if(is_printable(c))
            __dbc(c);
        else
        {
            __dbc('<');
            __dbh2(c);
            __dbc('>');
        }

        if(RxCount>=AtCmdRxBuff.Size)
            RxCount=0;

        pD[RxCount++]=c;
    }

    if(RxCount==0)
    {
        if(Tick_Timer_Is_Over_Ms(TickRaw, firstWait))
        {
            if(pSz!=NULL)
                *pSz=RxCount;

            pD[RxCount]=0x00;
            RxCount=0;

            __dbs("\nNo response");
            return RESULT_ERR;
        }
    }
    else if(Tick_Timer_Is_Over_Ms(TickRaw, lastWait))
    {
        if(pSz!=NULL)
            *pSz=RxCount;

        pD[RxCount]=0x00;
        RxCount=0;

        return RESULT_DONE;
    }

    return RESULT_BUSY;
} // </editor-fold>

int8_t ATCMD_SendGetDat(const char *pTx, char *pRx, uint16_t firstWait, uint16_t lastWait) // <editor-fold defaultstate="collapsed" desc="send cmd then get response">
{
    int8_t rslt=RESULT_BUSY;

    switch(DoNext)
    {
        default:
        case 3:
            if(Tick_Timer_Is_Over_Ms(TickRaw, Tdelay))
                DoNext=0;
            break;

        case 0:
            DoNext++;
            Tick_Timer_Reset(TickRaw);

        case 1:
            rslt=ATCMD_SendRaw((const uint8_t*) pTx, slen(pTx), 1000);

            if(rslt==RESULT_DONE)
            {
                DoNext++;
                rslt=RESULT_BUSY;
                __tsdbs("RX: ");
            }
            else if(rslt==RESULT_ERR)
                DoNext=0;
            break;

        case 2:
            rslt=ATCMD_GetRaw((uint8_t*) pRx, NULL, firstWait, lastWait);

            if(rslt!=RESULT_BUSY)
                DoNext=0;
            break;
    }

    return rslt;
} // </editor-fold>

int8_t ATCMD_SendGetAck(const char *pTx, const char *pAck, const char *pNAck,
                        uint16_t firstWait, uint16_t lastWait, uint8_t tryCount) // <editor-fold defaultstate="collapsed" desc="send cmd then get ack">
{
    int8_t rslt=RESULT_BUSY;

    switch(DoNext)
    {
        default:
        case 3:
            if(Tick_Timer_Is_Over_Ms(TickRaw, Tdelay))
                DoNext=0;
            break;

        case 0:
            DoNext++;
            AckCount=0;
            NAckCount=0;
            AtCmdRxBuff.Len=0;
            lastRslt=RESULT_ERR;
            Tick_Timer_Reset(TickRaw);

        case 1:
            rslt=ATCMD_SendRaw((const uint8_t*) pTx, (int) slen(pTx), 1000);

            if(rslt==RESULT_DONE)
            {
                DoNext++;
                rslt=RESULT_BUSY;
                __tsdbs("RX: ");
            }
            else if(rslt==RESULT_ERR)
                DoNext=0;
            break;

        case 2:
            while(ATCMD_Port_IsRxReady())
            {
                char c=ATCMD_Port_Read();

                if(is_printable(c))
                    __dbc(c);
                else
                {
                    __dbc('<');
                    __dbh2(c);
                    __dbc('>');
                }

                AtCmdRxBuff.pData[AtCmdRxBuff.Len++]=c;
                AtCmdRxBuff.pData[AtCmdRxBuff.Len]=0;

                if((AtCmdRxBuff.Len+1)==AtCmdRxBuff.Size)
                    AtCmdRxBuff.Len=0;

                if(FindString(c, &AckCount, (const char *) pAck))
                    lastRslt=RESULT_ACK;

                if(lastRslt!=RESULT_ACK)
                {
                    if(FindString(c, &NAckCount, (const char *) pNAck))
                        lastRslt=RESULT_NACK;
                }

                if(c!=0x00)
                    Tick_Timer_Reset(TickRaw);
                else
                    break;
            }

            if(AtCmdRxBuff.Len==0)
            {
                if(Tick_Timer_Is_Over_Ms(TickRaw, firstWait))
                {
                    if(++ReTry>=tryCount)
                    {
                        ReTry=0;
                        DoNext=0;
                        __dbsu("\nRX timeout: ", firstWait);
                        return RESULT_ERR;
                    }
                    else
                        DoNext=3;
                }
            }
            else if(Tick_Timer_Is_Over_Ms(TickRaw, lastWait))
            {
                if(lastRslt==RESULT_ERR)
                {
                    if(++ReTry>=tryCount)
                    {
                        ReTry=0;
                        DoNext=0;
                        __dbs("\nNot found");
                        return RESULT_ERR;
                    }
                    else
                        DoNext=3;
                }
                else
                {
                    ReTry=0;
                    DoNext=0;

                    if(lastRslt==RESULT_ACK)
                        __dbs("\nFound Ack");
                    else
                        __dbs("\nFound Nack");
                    
                    __dbsu(", t=", lastWait);

                    return lastRslt;
                }
            }
            break;
    }

    return RESULT_BUSY;
} // </editor-fold>

int8_t ATCMD_GetAck(const char *pAck, const char *pNAck,
                    uint16_t firstWait, uint16_t lastWait) // <editor-fold defaultstate="collapsed" desc="get ack only">
{
    int8_t rslt=RESULT_BUSY;

    switch(DoNext)
    {
        default:
        case 3:
        case 0:
            DoNext++;
            AckCount=0;
            NAckCount=0;
            AtCmdRxBuff.Len=0;
            Tick_Timer_Reset(TickRaw);

        case 1:
            DoNext++;

        case 2:
            while(ATCMD_Port_IsRxReady())
            {
                char c=ATCMD_Port_Read();

                if(is_printable(c))
                    __dbc(c);
                else
                {
                    __dbc('<');
                    __dbh2(c);
                    __dbc('>');
                }

                AtCmdRxBuff.pData[AtCmdRxBuff.Len++]=c;
                AtCmdRxBuff.pData[AtCmdRxBuff.Len]=0;

                if((AtCmdRxBuff.Len+1)==AtCmdRxBuff.Size)
                    AtCmdRxBuff.Len=0;

                if(FindString(c, &AckCount, (const char *) pAck))
                    lastRslt=RESULT_ACK;

                if(lastRslt!=RESULT_ACK)
                {
                    if(FindString(c, &NAckCount, (const char *) pNAck))
                        lastRslt=RESULT_NACK;
                }

                if(c!=0x00)
                    Tick_Timer_Reset(TickRaw);
                else
                    break;
            }

            if(AtCmdRxBuff.Len==0)
            {
                if(Tick_Timer_Is_Over_Ms(TickRaw, firstWait))
                {
                    ReTry=0;
                    DoNext=0;
                    __dbs("\nRX timeout");
                    return RESULT_ERR;
                }
            }
            else if(Tick_Timer_Is_Over_Ms(TickRaw, lastWait))
            {
                if(lastRslt==RESULT_ERR)
                {
                    ReTry=0;
                    DoNext=0;
                    __dbs("\nNot found");
                    return RESULT_ERR;
                }
                else
                {
                    ReTry=0;
                    DoNext=0;

                    if(lastRslt==RESULT_ACK)
                        __dbs("\nFound Ack");
                    else
                        __dbs("\nFound Nack");

                    return lastRslt;
                }
            }
            break;
    }

    return rslt;
} // </editor-fold>

int8_t __ATCMD_Test(uint8_t tryCount) // <editor-fold defaultstate="collapsed" desc="test at cmd">
{
    int8_t rslt;
    uint8_t type=tryCount&0xC0;

    tryCount&=0x3F;
    rslt=ATCMD_SendGetAck("ATE0\r", RES_OK, NULL, 500, 10, 1);

    switch(type)
    {
        default:
        case ALL_STATE_ON:
            if(rslt==RESULT_DONE)
            {
                if(++TestCount>=tryCount)
                {
                    TestCount=0;
                    return RESULT_DONE;
                }
            }
            else if(rslt==RESULT_ERR)
            {
                TestCount=0;
                return RESULT_ERR;
            }
            break;

        case ALL_STATE_OFF:
            if(rslt==RESULT_DONE)
            {
                TestCount=0;
                return RESULT_ERR;
            }
            else if(rslt==RESULT_ERR)
            {
                if(++TestCount>=tryCount)
                {
                    TestCount=0;
                    return RESULT_DONE;
                }
            }
            break;

        case AT_LEAST_1ON:
            if(rslt==RESULT_DONE)
            {
                TestCount=0;
                return RESULT_DONE;
            }
            else if(rslt==RESULT_ERR)
            {
                if(++TestCount>=tryCount)
                {
                    TestCount=0;
                    return RESULT_ERR;
                }
            }
            break;

        case AT_LEAST_1OFF:
            if(rslt==RESULT_DONE)
            {
                if(++TestCount>=tryCount)
                {
                    TestCount=0;
                    return RESULT_ERR;
                }
            }
            else if(rslt==RESULT_ERR)
            {
                TestCount=0;
                return RESULT_DONE;
            }
            break;
    }

    return RESULT_BUSY;
} // </editor-fold>

void ATCMD_Delay(uint16_t delayMs) // <editor-fold defaultstate="collapsed" desc="set delay before cmd sent">
{
    DoNext=3;
    Tdelay=delayMs;
    Tick_Timer_Reset(TickRaw);
} // </editor-fold>

/* ********************************************************************* APIs */

int8_t ATCMD_EchoOff(uint8_t reTry)
{
    if(reTry>63)
        reTry=63;

    return __ATCMD_Test(reTry|AT_LEAST_1ON);
}

int8_t ATCMD_ReportOn(void)
{
    return ATCMD_SendGetAck("AT+CMEE=2\r", RES_OK, NULL, 500, 10, 3);
}

int8_t ATCMD_NoFlowCtrl(void)
{
    return ATCMD_SendGetAck("AT&K0\r", RES_OK, NULL, 500, 10, 3);
}

int8_t ATCMD_SetAirplaneMode(void)
{
    return ATCMD_SendGetAck("AT+CFUN=4\r", RES_OK, NULL, 5000, 10, 3);
}

int8_t ATCMD_SetFullFuncMode(void)
{
    return ATCMD_SendGetAck("AT+CFUN=1\r", RES_OK, NULL, 5000, 10, 3);
}

int8_t ATCMD_SetLteOnly(void)
{
    return ATCMD_SendGetAck("AT+WS46=28\r", RES_OK, NULL, 5000, 10, 3);
}

int8_t ATCMD_SetNbPriority(void)
{
    return ATCMD_SendGetAck("AT#WS46=1\r", RES_OK, NULL, 5000, 10, 3);
}

int8_t ATCMD_Reboot(void)
{
    return ATCMD_SendGetAck("AT#REBOOT\r", RES_OK, NULL, 3000, 10, 3);
}

int8_t ATCMD_SysHalt(void)
{
    return ATCMD_SendGetAck("AT#SYSHALT\r", RES_OK, NULL, 5000, 10, 3);
}

int8_t ATCMD_CheckSim(void)
{
    return ATCMD_SendGetAck("AT+CPIN?\r", RES_READY, NULL, 500, 10, 3);
}

int8_t ATCMD_CheckNetReg(uint8_t retry)
{
    int8_t rslt=ATCMD_SendGetAck("AT+CEREG?\r", ",1", ",5", 500, 10, retry);

    if((rslt==RESULT_ACK)||(rslt==RESULT_NACK))
        rslt=RESULT_DONE;

    return rslt;
}

int8_t ATCMD_GetGnssPwrStt(bool *pStt)
{
    int8_t rslt=ATCMD_SendGetAck("AT$GPSP?\r", ": 1", ": 0", 500, 10, 3);

    if(rslt==RESULT_ACK)
    {
        *pStt=1;
        rslt=RESULT_DONE;
    }
    else if(rslt==RESULT_NACK)
    {
        *pStt=0;
        rslt=RESULT_DONE;
    }

    return rslt;
}

int8_t ATCMD_SetGnssPwrStt(bool Stt)
{
    int8_t rslt;

    if(Stt==1)
        rslt=ATCMD_SendGetAck("AT$GPSP=1\r", RES_OK, NULL, 500, 10, 3);
    else
        rslt=ATCMD_SendGetAck("AT$GPSP=0\r", RES_OK, NULL, 500, 10, 3);

    return rslt;
}

int8_t ATCMD_GetImei(char *pStr)
{
    int8_t rslt=ATCMD_SendGetAck("AT#CGSN\r", RES_OK, NULL, 500, 10, 3);

    if(rslt==RESULT_DONE)
        str_sub_between_2sub(pStr, (const char *) AtCmdRxBuff.pData, "#CGSN: ", "\r");

    return rslt;
}

int8_t ATCMD_GetIccId(char *pStr)
{
    int8_t rslt=ATCMD_SendGetAck("AT#CCID\r", RES_OK, NULL, 500, 10, 3);

    if(rslt==RESULT_DONE)
        str_sub_between_2sub(pStr, (const char *) AtCmdRxBuff.pData, "#CCID: ", "\r");

    return rslt;
}

int8_t ATCMD_GetImsi(char *pStr)
{
    int8_t rslt=ATCMD_SendGetAck("AT#IMSI\r", RES_OK, NULL, 500, 10, 3);

    if(rslt==RESULT_DONE)
        str_sub_between_2sub(pStr, (const char *) AtCmdRxBuff.pData, "#IMSI: ", "\r");

    return rslt;
}