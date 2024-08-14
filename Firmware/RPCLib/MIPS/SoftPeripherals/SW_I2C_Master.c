#include "SW_I2C_Master.h"

#ifdef USE_SW_I2C_DEBUG
#include "Common/debug.h"
#else
#define __dbs(str)
#define __dbsi(str, i)
#endif

typedef enum
{
    SW_I2C_IDLE=0,
    SW_I2C_START,
    SW_I2C_WRITE,
    SW_I2C_READ,
    SW_I2C_SUCCESS,
    SW_I2C_FAILED,
} sw_i2c_task_t;

typedef struct
{
    uint8_t *pD; // point to destination data
    uint8_t Len; // length of destination data
} sw_i2c_buffer_t;

typedef struct
{
    sw_i2c_buffer_t Tx;
    sw_i2c_buffer_t Rx;
    sw_i2c_buffer_t Buf;
    uint8_t SlvAddr;
    sw_i2c_task_t DoNext;
    int8_t State;
} sw_i2c_cxt_t;

#ifndef SW_I2C_Delay
#define SW_I2C_Delay()     __delay_us(4) //f=1/2*(8*1e-6)=62.5kHz
#endif

#ifndef SW_SCL_SetOpenDrain
#define SW_SCL_SetOpenDrain()
#endif

#ifndef SW_SCL_SetDigitalMode
#define SW_SCL_SetDigitalMode()
#endif

#ifndef SW_SCL_SetDigitalOutput
#define SW_SCL_SetDigitalOutput()
#endif

#ifndef SW_SCL_SetDigitalInput
#define SW_SCL_SetDigitalInput()
#endif

#ifndef SW_SCL_SetHigh
#define SW_SCL_SetHigh()
#endif

#ifndef SW_SCL_SetLow
#define SW_SCL_SetLow()
#endif

#ifndef SW_SCL_GetValue
#define SW_SCL_GetValue() 0
#warning "Not define SW_SCL pin"
#endif

#ifndef SW_SDA_SetOpenDrain
#define SW_SDA_SetOpenDrain()
#endif

#ifndef SW_SDA_SetDigitalMode
#define SW_SDA_SetDigitalMode()
#endif

#ifndef SW_SDA_SetDigitalOutput
#define SW_SDA_SetDigitalOutput()
#endif

#ifndef SW_SDA_SetDigitalInput
#define SW_SDA_SetDigitalInput()
#endif

#ifndef SW_SDA_SetHigh
#define SW_SDA_SetHigh()
#endif

#ifndef SW_SDA_SetLow
#define SW_SDA_SetLow()
#endif

#ifndef SW_SDA_GetValue
#define SW_SDA_GetValue() 0
#warning "Not define SW_SDA pin"
#endif

#ifndef SW_I2C_VBUS_SetDigitalOutput
#define SW_I2C_VBUS_SetDigitalOutput()
#endif

#ifndef SW_I2C_VBUS_SetDigitalInput
#define SW_I2C_VBUS_SetDigitalInput()
#endif

#ifndef SW_I2C_VBUS_SetHigh
#define SW_I2C_VBUS_SetHigh()
#endif

#ifndef SW_I2C_VBUS_SetLow
#define SW_I2C_VBUS_SetLow()
#endif

#ifndef SW_I2C_VBUS_GetValue
#define SW_I2C_VBUS_GetValue() 0
#endif

static sw_i2c_cxt_t Sw_I2c_Cxt={.State=SW_I2C_ERR};

public void SW_I2C_Init(void) // <editor-fold defaultstate="collapsed" desc="Soft I2C initialize">
{
    Sw_I2c_Cxt.State=SW_I2C_SUCCESS;
    Sw_I2c_Cxt.DoNext=SW_I2C_IDLE;
    SW_I2C_VBUS_SetHigh();
    SW_SCL_SetHigh();
    SW_SDA_SetHigh();
    SW_SCL_SetOpenDrain();
    SW_SDA_SetOpenDrain();
    SW_I2C_VBUS_SetDigitalOutput();
    SW_SCL_SetDigitalOutput();
    SW_SDA_SetDigitalInput();
} // </editor-fold>

private void SW_I2C_Drv_Open(void) // <editor-fold defaultstate="collapsed" desc="I2C driver open">
{
    SW_I2C_VBUS_SetHigh();
    SW_SCL_SetHigh();
    SW_SDA_SetHigh();
    SW_SCL_SetDigitalOutput();
    SW_SDA_SetDigitalOutput();
} // </editor-fold>

private void SW_I2C_Drv_Close(void) // <editor-fold defaultstate="collapsed" desc="I2C driver close">
{
    SW_I2C_Delay();
    SW_SCL_SetHigh();
    SW_SDA_SetHigh();
    SW_SCL_SetDigitalOutput();
    SW_SDA_SetDigitalOutput();
    SW_I2C_VBUS_SetLow();
} // </editor-fold>

private void SW_I2C_SCL_Pulse(bool x) // <editor-fold defaultstate="collapsed" desc="SCL pulse">
{
    if(x)
    {
        SW_SCL_SetDigitalInput();
        SW_SCL_SetHigh();
    }
    else
    {
        SW_SCL_SetLow();
        SW_SCL_SetDigitalOutput();
    }

    uint8_t Count=0;

    while(SW_SCL_GetValue()!=x)
    {
        SW_I2C_Delay();

        if(++Count==0)
        {
            __dbsi("\nLine ", __LINE__);
            Sw_I2c_Cxt.State=SW_I2C_ERR;
            return;
        }
    }
} // </editor-fold>

private void SW_I2C_SDA_Pulse(bool x) // <editor-fold defaultstate="collapsed" desc="SDA pulse">
{
    if(x)
    {
        SW_SDA_SetDigitalInput();
        SW_SDA_SetHigh();
    }
    else
    {
        SW_SDA_SetLow();
        SW_SDA_SetDigitalOutput();
    }

    uint8_t Count=0;

    while(SW_SDA_GetValue()!=x)
    {
        SW_I2C_Delay();

        if(++Count==0)
        {
            __dbsi("\nLine ", __LINE__);
            Sw_I2c_Cxt.State=SW_I2C_ERR;
            return;
        }
    }
} // </editor-fold>

private void SW_I2C_WriteBit(bool x) // <editor-fold defaultstate="collapsed" desc="Write 1 bit">
{
    // preparing for SDA changing
    SW_I2C_SCL_Pulse(0);
    SW_I2C_Delay();
    SW_I2C_SDA_Pulse(x); // SDA changing
    SW_I2C_SCL_Pulse(1); // data valid pulse
    SW_I2C_Delay();
} // </editor-fold>

private bool SW_I2C_ReadBit(void) // <editor-fold defaultstate="collapsed" desc="Write 1 bit">
{
    //bool x;
    // preparing for SDA changing
    SW_I2C_SCL_Pulse(0);
    SW_SDA_SetDigitalInput();
    SW_I2C_Delay();
    SW_I2C_SCL_Pulse(1); // data valid pulse
    SW_I2C_Delay();
    //x=SW_SDA_GetValue();

    return SW_SDA_GetValue();
} // </editor-fold>

public void SW_I2C_Start(void) // <editor-fold defaultstate="collapsed" desc="Start bit">
{
    /* SDA ---
             |______
       SCL ------
                |___                                                          */
    SW_I2C_SCL_Pulse(1);
    SW_I2C_SDA_Pulse(1);
    SW_I2C_Delay();
    SW_I2C_SDA_Pulse(0);
    SW_I2C_Delay();
} // </editor-fold>

public void SW_I2C_Stop(void) // <editor-fold defaultstate="collapsed" desc="Stop bit">
{
    /* SDA    ------
           ___|
           ---------                                            
       SCL                                                                    */
    //sw_i2c_debug('1');
    SW_I2C_SCL_Pulse(0);
    SW_I2C_Delay();
    //sw_i2c_debug('2');
    SW_I2C_SDA_Pulse(0);
    SW_I2C_SCL_Pulse(1);
    //sw_i2c_debug('3');
    SW_I2C_Delay();
    SW_I2C_SDA_Pulse(1);
    //sw_i2c_debug('4');
    SW_I2C_Delay();
} // </editor-fold>

public uint8_t SW_I2C_ReadByte(void) // <editor-fold defaultstate="collapsed" desc="Read byte">
{
    uint8_t i;
    uint8_t data_in=0x00;

    for(i=0; i<8; i++)
    {
        data_in<<=1;
        data_in|=SW_I2C_ReadBit();
    }

    return data_in;
} // </editor-fold>

public void SW_I2C_SendAck(void) // <editor-fold defaultstate="collapsed" desc="Send ACK bit">
{
    SW_I2C_WriteBit(SW_I2C_ACK);
} // </editor-fold>

public void SW_I2C_SendNAck(void) // <editor-fold defaultstate="collapsed" desc="Send NACK bit">
{
    SW_I2C_WriteBit(SW_I2C_NACK);
} // </editor-fold>

public uint8_t SW_I2C_Read(bool ack) // <editor-fold defaultstate="collapsed" desc="Read byte+ send ACK">
{
    uint8_t data_in=SW_I2C_ReadByte();

    SW_I2C_WriteBit(ack);

    return data_in;
}// </editor-fold>

public bool SW_I2C_Write(uint8_t data_out) // <editor-fold defaultstate="collapsed" desc="Write byte">
{
    uint8_t i;

    for(i=0; i<8; i++)
    {
        SW_I2C_WriteBit((bool) (data_out&0x80));
        data_out<<=1;
    }

    return (SW_I2C_ReadBit()==0?1:0); // get ACK
} // </editor-fold>

public void SW_I2C_Tasks(void) // <editor-fold defaultstate="collapsed" desc="I2C task">
{
    switch(Sw_I2c_Cxt.DoNext)
    {
        case SW_I2C_IDLE:
        default: // idle
            break;

        case SW_I2C_START: // send start bit & slaver address
            __dbs("\nStart");

            if(Sw_I2c_Cxt.Tx.Len>0) // write
            {
                __dbs("\nWrite");
                Sw_I2c_Cxt.DoNext=SW_I2C_WRITE;
                Sw_I2c_Cxt.SlvAddr=(uint8_t) (Sw_I2c_Cxt.SlvAddr<<1);
            }
            else // read
            {
                __dbs("\nRead");
                Sw_I2c_Cxt.DoNext=SW_I2C_READ;
                Sw_I2c_Cxt.SlvAddr=(uint8_t) (Sw_I2c_Cxt.SlvAddr<<1)|1;
            }

            SW_I2C_Start();

            if(SW_I2C_Write(Sw_I2c_Cxt.SlvAddr)==0) // write slave address include R/W bit then get ACK
            {
                Sw_I2c_Cxt.DoNext=SW_I2C_FAILED;
                Sw_I2c_Cxt.State=SW_I2C_ACK_ERR;
                __dbsi(" ", __LINE__);
            }
            break;

        case SW_I2C_WRITE: // write
            if(SW_I2C_Write(*Sw_I2c_Cxt.Tx.pD)==1)
            {
                Sw_I2c_Cxt.Tx.pD++;
                Sw_I2c_Cxt.Tx.Len--;

                if(Sw_I2c_Cxt.Tx.Len>0)
                    break;

                SW_I2C_Stop();

                if(Sw_I2c_Cxt.Rx.Len>0)
                {
                    Sw_I2c_Cxt.SlvAddr>>=1; // turn back 7 bit address
                    Sw_I2c_Cxt.DoNext=SW_I2C_START;
                    __dbsi(" ", __LINE__);
                }
                else if(Sw_I2c_Cxt.State>SW_I2C_ERR)
                {
                    Sw_I2c_Cxt.State=SW_I2C_OK;
                    Sw_I2c_Cxt.DoNext=SW_I2C_SUCCESS;
                    __dbsi(" ", __LINE__);
                }
                else
                {
                    Sw_I2c_Cxt.DoNext=SW_I2C_FAILED;
                    __dbsi(" ", __LINE__);
                }
            }
            else
            {
                Sw_I2c_Cxt.DoNext=SW_I2C_FAILED;
                Sw_I2c_Cxt.State=SW_I2C_ACK_ERR;
                __dbsi(" ", __LINE__);
            }
            break;

        case SW_I2C_READ:// enable receive
            *Sw_I2c_Cxt.Rx.pD=SW_I2C_ReadByte();

            if(Sw_I2c_Cxt.Rx.Len>1) // send ACK
                SW_I2C_SendAck();
            else // send NACK
                SW_I2C_SendNAck();

            Sw_I2c_Cxt.Rx.pD++;
            Sw_I2c_Cxt.Rx.Len--;

            if(Sw_I2c_Cxt.Rx.Len>0)
                break;

            SW_I2C_Stop();

            if(Sw_I2c_Cxt.State>SW_I2C_ERR)
            {
                Sw_I2c_Cxt.State=SW_I2C_OK;
                Sw_I2c_Cxt.DoNext=SW_I2C_SUCCESS;
                __dbsi(" ", __LINE__);
            }
            else
            {
                Sw_I2c_Cxt.DoNext=SW_I2C_FAILED;
                __dbsi(" ", __LINE__);
            }
            break;

        case SW_I2C_SUCCESS: // done
            SW_I2C_Drv_Close();
            Sw_I2c_Cxt.State=SW_I2C_OK;
            __dbs("\nDone");
            break;

        case SW_I2C_FAILED: // error
            SW_I2C_Drv_Close();
            __dbs("\nError");
            break;
    }
} // </editor-fold>

public bool SW_I2C_ReadNBytes(uint8_t address, uint8_t *data, size_t len) // <editor-fold defaultstate="collapsed" desc="Read n bytes">
{
    uint8_t i;

    if(Sw_I2c_Cxt.State<=SW_I2C_ERR)
        goto EXIT;

    Sw_I2c_Cxt.State=SW_I2C_BUSY;
    SW_I2C_Start();

    if(!SW_I2C_Write((uint8_t) (address<<1)|1)) // Write and get ACK bit
    {
        Sw_I2c_Cxt.State=SW_I2C_ACK_ERR;
        goto EXIT;
    }

    for(i=0; i<(len-1); i++)
    {
        *data=SW_I2C_Read(0);
        data++;
    }

    *data=SW_I2C_Read(1);
    SW_I2C_Stop();

    if(Sw_I2c_Cxt.State!=SW_I2C_ERR)
    {
        Sw_I2c_Cxt.State=SW_I2C_OK;
        return 1;
    }

EXIT:
    SW_I2C_Init();
    return 0;
} // </editor-fold>

public bool SW_I2C_WriteNBytes(uint8_t address, uint8_t *data, size_t len) // <editor-fold defaultstate="collapsed" desc="Write n bytes">
{
    uint8_t i;

    if(Sw_I2c_Cxt.State<=SW_I2C_ERR)
        goto EXIT;

    Sw_I2c_Cxt.State=SW_I2C_BUSY;
    SW_I2C_Start();

    if(!SW_I2C_Write((uint8_t) (address<<1))) // Write and get ACK bit
    {
        Sw_I2c_Cxt.State=SW_I2C_ACK_ERR;
        goto EXIT;
    }

    for(i=0; i<len; i++)
    {
        if(!SW_I2C_Write(*data))
        {
            Sw_I2c_Cxt.State=SW_I2C_ACK_ERR;
            goto EXIT;
        }

        data++;
    }

    SW_I2C_Stop();

    if(Sw_I2c_Cxt.State!=SW_I2C_ERR)
    {
        Sw_I2c_Cxt.State=SW_I2C_OK;
        return 1;
    }

EXIT:
    SW_I2C_Init();
    return 0;
} // </editor-fold>

public int8_t SW_I2C_Open(uint8_t SlvAddr) // <editor-fold defaultstate="collapsed" desc="I2C open">
{
    if(Sw_I2c_Cxt.DoNext==SW_I2C_IDLE)
    {
        SW_I2C_Drv_Open();
        Sw_I2c_Cxt.SlvAddr=SlvAddr;
        return SW_I2C_OK;
    }

    return SW_I2C_BUSY;
} // </editor-fold>

public int8_t SW_I2C_Close(void) // <editor-fold defaultstate="collapsed" desc="I2C close">
{
    SW_I2C_Drv_Close();
    Sw_I2c_Cxt.DoNext=SW_I2C_START;
    return SW_I2C_OK;
} // </editor-fold>

public int8_t SW_I2C_MasterOperation(bool read) // <editor-fold defaultstate="collapsed" desc="I2C read/write">
{
    if(Sw_I2c_Cxt.Buf.pD!=NULL)
    {
        if(read)
        {
            Sw_I2c_Cxt.Tx.pD=NULL;
            Sw_I2c_Cxt.Tx.Len=0;
            Sw_I2c_Cxt.Rx.pD=Sw_I2c_Cxt.Buf.pD;
            Sw_I2c_Cxt.Rx.Len=Sw_I2c_Cxt.Buf.Len;
        }
        else
        {
            Sw_I2c_Cxt.Rx.pD=NULL;
            Sw_I2c_Cxt.Rx.Len=0;
            Sw_I2c_Cxt.Tx.pD=Sw_I2c_Cxt.Buf.pD;
            Sw_I2c_Cxt.Tx.Len=Sw_I2c_Cxt.Buf.Len;
        }

        Sw_I2c_Cxt.Buf.pD=NULL;
        Sw_I2c_Cxt.DoNext=SW_I2C_START;
        Sw_I2c_Cxt.State=SW_I2C_BUSY;
    }
    else
        SW_I2C_Tasks();

    return Sw_I2c_Cxt.State;
} // </editor-fold>

public void SW_I2C_SetBuffer(void *buffer, size_t bufferSize) // <editor-fold defaultstate="collapsed" desc="Set buffer">
{
    Sw_I2c_Cxt.Buf.pD=(uint8_t *) buffer;
    Sw_I2c_Cxt.Buf.Len=(uint8_t) bufferSize;
} // </editor-fold>
