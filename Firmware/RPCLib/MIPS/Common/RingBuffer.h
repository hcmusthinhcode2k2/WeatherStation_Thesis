#ifndef RINGBUFFER_H
#define RINGBUFFER_H

#include "Common/LibDef.h"

typedef struct {
    size_t Size;
    uint8_t *pHead;
    uint8_t *pTail;
    uint8_t *pQueue;
} __attribute_packed__ ring_buf_rx_t;

typedef struct {
    size_t Size;
    uint8_t *pHead;
    uint8_t *pTail;
    uint8_t *pQueue;
} __attribute_packed__ ring_buf_tx_t;

#define RingBuffer_RxInit(pBuf, Src, Sz) do{pBuf.pQueue=Src; pBuf.pHead=Src; \
                                            pBuf.pTail=Src; pBuf.Size=Sz;}while(0)

#define RingBuffer_RxDeinit(pRxBuf)
size_t RingBuffer_IsRxReady(ring_buf_rx_t *pRxBuf); // Check this before call RingBuffer_RxRead
uint8_t RingBuffer_RxRead(ring_buf_rx_t *pRxBuf);
bool RingBuffer_RxWrite(ring_buf_rx_t *pRxBuf, uint8_t Data); // Called by event function

#define RingBuffer_TxInit(pBuf, Src, Sz) do{pBuf.pQueue=Src; pBuf.pHead=Src; \
                                            pBuf.pTail=Src; pBuf.Size=Sz;}while(0)

#define RingBuffer_TxDeinit(pTxBuf)
size_t RingBuffer_IsTxReady(ring_buf_tx_t *pTxBuf); // Check this before call RingBuffer_TxWrite
bool RingBuffer_TxWrite(ring_buf_tx_t *pTxBuf, uint8_t Data);
bool RingBuffer_TxRead(ring_buf_tx_t *pTxBuf, uint8_t *pData); // Called by event function

/* Sample Code
ring_buf_rx_t RxBuf;
ring_buf_tx_t TxBuf;
uint8_t RxSrc[128];
uint8_t TxSrc[128];

void main(void)
{
    uint8_t RxLen, TxIdx;
    uint8_t RxData[64];
    uint8_t TxData[64]="Hello World\n";

    RingBuffer_RxInit(RxBuf, RxSrc, sizeof (RxSrc));
    RingBuffer_TxInit(TxBuf, TxSrc, sizeof (TxSrc));
    RxLen=0;
    TxIdx=0;

    while(true)
    {
        while(RingBuffer_IsTxReady(&TxBuf)) // User write data to TX buffer
        {
            if(RingBuffer_TxWrite(&TxBuf, TxData[TxIdx]))
            {
                TxIdx++;

                if(TxIdx>=sizeof (TxData))
                {
                    TxIdx=0;
                    break;
                }
            }
            else
                break;
        }
        
        while(RingBuffer_IsTxReady(&RxBuf)) // User read data from RX buffer
        {
            RxData[RxLen++]=RingBuffer_RxRead(&RxBuf);
            
            if(RxLen>=sizeof(RxData))
                RxLen=0;
        }
        
        if(RxLen>0) // Process RX data by user
        {
            // Do something
            RxLen=0;
        }
        
        uint8_t c;
        
        if(RingBuffer_TxRead(&TxBuf, &c))
        {
            // Write 'c' to hardware port
        }
        
        c=0; // Read hardware port
        
        if(RingBuffer_RxWrite(&RxBuf, c))
        {
            // Over flow process
        }
    }
} */
#endif