#include "i2c1.h"

void I2C1_Initialize(void)
{
    // Baud Rate Generator Value: I2CBRG 26;   
    I2C1BRG=0x7A;
    // ACKEN disabled; STRICT disabled; STREN disabled; GCEN disabled; SMEN disabled; DISSLW enabled; SBCDE disabled; SIDL disabled; BOEN disabled; ACKDT Sends ACK; SCIE disabled; PCIE disabled; SCLREL Holds; RSEN disabled; SDAHT disabled; A10M 7 Bit; PEN disabled; RCEN disabled; SEN disabled; ON enabled; 
    I2C1CON=0x8000;
    // BCL disabled; P disabled; S disabled; I2COV disabled; IWCOL disabled; 
    I2C1STAT=0x0;
}

void I2C1_Deinitialize(void)
{
    I2C1CONbits.ON=0;
}

void I2C1_Open(void)
{
    if(I2C1CONbits.ON==0)
        I2C1_Initialize();
}

void I2C1_Close(void)
{
    I2C1_Deinitialize();
}

void I2C1_Start(void)
{
    I2C1CONbits.SEN=1;
    while(I2C1CONbits.SEN);
}

void I2C1_Stop(void)
{
    I2C1CONbits.PEN=1;
    while(I2C1CONbits.PEN);
}

void I2C1_Restart(void)
{
    I2C1CONbits.RSEN=1;
    while(I2C1CONbits.RSEN);
}

uint8_t I2C1_Read(void)
{
    I2C1CONbits.RCEN=1;
    while(!I2C1STATbits.RBF);

    return I2C1RCV;
}

bool I2C1_Write(uint8_t d)
{
    I2C1TRN=d;
    while(I2C1STATbits.TRSTAT);

    return I2C1STATbits.ACKSTAT;
}

void I2C1_Ack(void)
{
    I2C1CONbits.ACKDT=0;
    I2C1CONbits.ACKEN=1;
    while(I2C1CONbits.ACKEN);
    I2C1CONbits.RCEN=1;
}

void I2C1_Nack(void)
{
    I2C1CONbits.ACKDT=1;
    I2C1CONbits.ACKEN=1;
    while(I2C1CONbits.ACKEN);
}

bool I2C1_Master_Write(uint8_t DvAddr, const uint8_t *pData, uint8_t Len)
{
    bool ack;

    DvAddr=DvAddr<<1;
    I2C1_Start();
    ack=I2C1_Write(DvAddr);

    while(Len>0)
    {
        ack|=I2C1_Write(*pData++);
        Len--;
    }

    I2C1_Stop();

    return (!ack); // 1-success, 0-fail
}

bool I2C1_Master_Read(uint8_t DvAddr, uint8_t *pData, uint8_t Len)
{
    DvAddr=(DvAddr<<1)|1;
    I2C1_Start();

    if(I2C1_Write(DvAddr)==1)
    {
        I2C1_Stop();
        return 0; // fail
    }

    while(Len>1)
    {
        *pData=I2C1_Read();
        I2C1_Ack();
        Len--;
        pData++;
    }

    *pData=I2C1_Read();
    I2C1_Nack();
    I2C1_Stop();

    return 1; // done
}