#include "RingBuffer.h"

size_t RingBuffer_IsRxReady(ring_buf_rx_t *pRxBuf) // <editor-fold defaultstate="collapsed" desc="Get Rx buffer size">
{
    size_t Size;
    uint8_t *pSnapshot_RxTail=pRxBuf->pTail;

    if(pSnapshot_RxTail<pRxBuf->pHead)
        Size=(pRxBuf->Size-(pRxBuf->pHead-pSnapshot_RxTail));
    else
        Size=(pSnapshot_RxTail-pRxBuf->pHead);

    return Size;
} // </editor-fold>

bool RingBuffer_RxWrite(ring_buf_rx_t *pRxBuf, uint8_t Data) // <editor-fold defaultstate="collapsed" desc="Write 1 byte to Rx buffer">
{
    bool OverFlowed;

    *pRxBuf->pTail=Data;

    if((pRxBuf->pTail!=(pRxBuf->pQueue+pRxBuf->Size-1))
            &&((pRxBuf->pTail+1)!=pRxBuf->pHead))
    {
        pRxBuf->pTail++;
        OverFlowed=0;
    }
    else if((pRxBuf->pTail==(pRxBuf->pQueue+pRxBuf->Size-1))
            &&(pRxBuf->pHead!=pRxBuf->pQueue))
    {
        pRxBuf->pTail=pRxBuf->pQueue;
        OverFlowed=0;
    }
    else
        OverFlowed=1;

    return OverFlowed;
} // </editor-fold>

uint8_t RingBuffer_RxRead(ring_buf_rx_t *pRxBuf) // <editor-fold defaultstate="collapsed" desc="Read 1 byte from Rx buffer">
{
    uint8_t c;

    if(RingBuffer_IsRxReady(pRxBuf)==0)
        return 0;

    c=*pRxBuf->pHead;
    pRxBuf->pHead++;

    if(pRxBuf->pHead==(pRxBuf->pQueue+pRxBuf->Size))
        pRxBuf->pHead=pRxBuf->pQueue;

    return c;
} // </editor-fold>

size_t RingBuffer_IsTxReady(ring_buf_tx_t *pTxBuf) // <editor-fold defaultstate="collapsed" desc="Get Tx buffer available size">
{
    size_t Size;
    uint8_t *pSnapshot_TxHeader=pTxBuf->pHead;

    if(pTxBuf->pTail<pSnapshot_TxHeader)
        Size=(pSnapshot_TxHeader-pTxBuf->pTail-1);
    else
        Size=(pTxBuf->Size-(pTxBuf->pTail-pSnapshot_TxHeader)-1);

    return Size;
} // </editor-fold>

bool RingBuffer_TxWrite(ring_buf_tx_t *pTxBuf, uint8_t Data) // <editor-fold defaultstate="collapsed" desc="Write 1 byte to Tx buffer">
{
    if(RingBuffer_IsTxReady(pTxBuf)==0)
        return 0;

    *pTxBuf->pTail=Data;
    pTxBuf->pTail++;

    if(pTxBuf->pTail==(pTxBuf->pQueue+pTxBuf->Size))
        pTxBuf->pTail=pTxBuf->pQueue;

    return 1;
} // </editor-fold>

bool RingBuffer_TxRead(ring_buf_tx_t *pTxBuf, uint8_t *pData) // <editor-fold defaultstate="collapsed" desc="Read 1 byte from Tx buffer">
{
    if(pTxBuf->pHead==pTxBuf->pTail)
        return 0;

    *pData=*pTxBuf->pHead;
    pTxBuf->pHead++;

    if(pTxBuf->pHead==(pTxBuf->pQueue+pTxBuf->Size))
        pTxBuf->pHead=pTxBuf->pQueue;

    return 1;
} // </editor-fold>
