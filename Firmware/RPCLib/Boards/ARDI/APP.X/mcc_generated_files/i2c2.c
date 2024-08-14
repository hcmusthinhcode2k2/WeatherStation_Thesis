#include "i2c2.h"

void I2C2_Initialize(void)
{
    // Baud Rate Generator Value: I2CBRG 26;   
    I2C2BRG=0x1A;
    // ACKEN disabled; STRICT disabled; STREN disabled; GCEN disabled; SMEN disabled; DISSLW enabled; SBCDE disabled; SIDL disabled; BOEN disabled; ACKDT Sends ACK; SCIE disabled; PCIE disabled; SCLREL Holds; RSEN disabled; SDAHT disabled; A10M 7 Bit; PEN disabled; RCEN disabled; SEN disabled; ON enabled; 
    I2C2CON=0x8000;
    // BCL disabled; P disabled; S disabled; I2COV disabled; IWCOL disabled; 
    I2C2STAT=0x0;
}

void I2C2_Start(void)
{
    I2C2CONbits.SEN=1;
    while(I2C2CONbits.SEN);
}

void I2C2_Stop(void)
{
    I2C2CONbits.PEN=1;
    while(I2C2CONbits.PEN);
}

void I2C2_Restart(void)
{
    I2C2CONbits.RSEN=1;
    while(I2C2CONbits.RSEN);
}

uint8_t I2C2_Read(void)
{
    I2C2CONbits.RCEN=1;
    while(!I2C2STATbits.RBF);

    return I2C2RCV;
}

bool I2C2_Write(uint8_t d)
{
    I2C2TRN=d;
    while(I2C2STATbits.TRSTAT);

    return I2C2STATbits.ACKSTAT;
}

void I2C2_Ack(void)
{
    I2C2CONbits.ACKDT=0;
    I2C2CONbits.ACKEN=1;
    while(I2C2CONbits.ACKEN);
    I2C2CONbits.RCEN=1;
}

void I2C2_Nack(void)
{
    I2C2CONbits.ACKDT=1;
    I2C2CONbits.ACKEN=1;
    while(I2C2CONbits.ACKEN);
}

bool I2C2_Master_Write(uint8_t DvAddr, uint8_t *pData, uint8_t Len)
{
    bool ack;

    DvAddr=DvAddr<<1;
    I2C2_Start();
    ack=I2C2_Write(DvAddr);

    while(Len--)
        ack|=I2C2_Write(*pData++);

    I2C2_Stop();

    return (!ack); // 1-success, 0-fail
}

bool I2C2_Master_Read(uint8_t DvAddr, uint8_t *pData, uint8_t Len)
{
    DvAddr=(DvAddr<<1)|1;
    I2C2_Start();

    if(I2C2_Write(DvAddr)==0)
    {
        I2C2_Stop();
        return 0; // fail
    }

    while(Len>1)
    {
        *pData=I2C2_Read();
        I2C2_Ack();
        Len--;
        pData++;
    }

    I2C2_Nack();
    I2C2_Stop();

    return 1; // done
}