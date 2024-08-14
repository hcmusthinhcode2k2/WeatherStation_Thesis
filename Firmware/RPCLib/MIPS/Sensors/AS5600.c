#include <math.h>
#include "AS5600.h"
#include "System/TickTimer.h"

const uint8_t AS5600_SW_DIRECTION_PIN=255;
//  CONFIGURATION REGISTERS
const uint8_t AS5600_ZMCO=0x00;
const uint8_t AS5600_ZPOS=0x01; //  + 0x02
const uint8_t AS5600_MPOS=0x03; //  + 0x04
const uint8_t AS5600_MANG=0x05; //  + 0x06
const uint8_t AS5600_CONF=0x07; //  + 0x08
//  CONFIGURATION BIT MASKS - byte level
const uint8_t AS5600_CONF_POWER_MODE=0x03;
const uint8_t AS5600_CONF_HYSTERESIS=0x0C;
const uint8_t AS5600_CONF_OUTPUT_MODE=0x30;
const uint8_t AS5600_CONF_PWM_FREQUENCY=0xC0;
const uint8_t AS5600_CONF_SLOW_FILTER=0x03;
const uint8_t AS5600_CONF_FAST_FILTER=0x1C;
const uint8_t AS5600_CONF_WATCH_DOG=0x20;

//  UNKNOWN REGISTERS 0x09-0x0A
//  OUTPUT REGISTERS
const uint8_t AS5600_RAW_ANGLE=0x0C; //  + 0x0D
const uint8_t AS5600_ANGLE=0x0E; //  + 0x0F
// I2C_ADDRESS REGISTERS (AS5600L)
const uint8_t AS5600_I2CADDR=0x20;
const uint8_t AS5600_I2CUPDT=0x21;
//  STATUS REGISTERS
const uint8_t AS5600_STATUS=0x0B;
const uint8_t AS5600_AGC=0x1A;
const uint8_t AS5600_MAGNITUDE=0x1B; //  + 0x1C
const uint8_t AS5600_BURN=0xFF;
//  STATUS BITS
const uint8_t AS5600_MAGNET_HIGH=0x08;
const uint8_t AS5600_MAGNET_LOW=0x10;
const uint8_t AS5600_MAGNET_DETECT=0x20;

//  setDirection
const uint8_t AS5600_CLOCK_WISE=0; //  LOW
const uint8_t AS5600_COUNTERCLOCK_WISE=1; //  HIGH
//  0.087890625;
const float AS5600_RAW_TO_DEGREES=(360.0/4096.0);
const float AS5600_DEGREES_TO_RAW=(4096.0/360.0);
//  0.00153398078788564122971808758949;
const float AS5600_RAW_TO_RADIANS=((3.14159265*2.0)/4096.0);
//  4.06901041666666e-6
const float AS5600_RAW_TO_RPM=(60.0/4096.0);
//  getAngularSpeed
const uint8_t AS5600_MODE_DEGREES=0;
const uint8_t AS5600_MODE_RADIANS=1;
const uint8_t AS5600_MODE_RPM=2;

//  CONFIGURE CONSTANTS
//  setOutputMode
const uint8_t AS5600_OUTMODE_ANALOG_100=0;
const uint8_t AS5600_OUTMODE_ANALOG_90=1;
const uint8_t AS5600_OUTMODE_PWM=2;
//  setPowerMode
const uint8_t AS5600_POWERMODE_NOMINAL=0;
const uint8_t AS5600_POWERMODE_LOW1=1;
const uint8_t AS5600_POWERMODE_LOW2=2;
const uint8_t AS5600_POWERMODE_LOW3=3;
//  setPWMFrequency
const uint8_t AS5600_PWM_115=0;
const uint8_t AS5600_PWM_230=1;
const uint8_t AS5600_PWM_460=2;
const uint8_t AS5600_PWM_920=3;
//  setHysteresis
const uint8_t AS5600_HYST_OFF=0;
const uint8_t AS5600_HYST_LSB1=1;
const uint8_t AS5600_HYST_LSB2=2;
const uint8_t AS5600_HYST_LSB3=3;
//  setSlowFilter
const uint8_t AS5600_SLOW_FILT_16X=0;
const uint8_t AS5600_SLOW_FILT_8X=1;
const uint8_t AS5600_SLOW_FILT_4X=2;
const uint8_t AS5600_SLOW_FILT_2X=3;
//  setFastFilter
const uint8_t AS5600_FAST_FILT_NONE=0;
const uint8_t AS5600_FAST_FILT_LSB6=1;
const uint8_t AS5600_FAST_FILT_LSB7=2;
const uint8_t AS5600_FAST_FILT_LSB9=3;
const uint8_t AS5600_FAST_FILT_LSB18=4;
const uint8_t AS5600_FAST_FILT_LSB21=5;
const uint8_t AS5600_FAST_FILT_LSB24=6;
const uint8_t AS5600_FAST_FILT_LSB10=7;
//  setWatchDog
const uint8_t AS5600_WATCHDOG_OFF=0;
const uint8_t AS5600_WATCHDOG_ON=1;

/* ********************************************************** Local variables */

uint8_t _directionPin=255;
uint8_t _direction=AS5600_CLOCK_WISE;
int _error=AS5600_OK;

//  for getAngularSpeed()
uint32_t _lastMeasurement=0;
int16_t _lastAngle=0;

//  for readAngle() and rawAngle()
//set
uint16_t _offset=0;

//  EXPERIMENTAL
//  cumulative position counter
//  works only if the sensor is read often enough.
int32_t _position=0;
int16_t _lastPosition=0;

uint8_t readReg(uint8_t reg)
{
    _error=AS5600_ERROR;

    if(AS5600_I2C_WriteNByte(AS5600_SLV_ADDR, &reg, 1))
    {
        if(AS5600_I2C_ReadNByte(AS5600_SLV_ADDR, &reg, 1))
            _error=AS5600_OK;
    }

    return reg;
}

uint16_t readReg2(uint8_t reg)
{
    uint16_t tmp=0xFFFF;
    uint8_t data[2];

    _error=AS5600_ERROR;

    if(AS5600_I2C_WriteNByte(AS5600_SLV_ADDR, &reg, 1))
    {
        if(AS5600_I2C_ReadNByte(AS5600_SLV_ADDR, &data[0], 2))
        {
            tmp=((uint16_t) data[0]<<8)|data[1]; 
            _error=AS5600_OK;
        }
    }

    return tmp;
}

void writeReg(uint8_t reg, uint8_t val)
{
    uint8_t data[2];

    data[0]=reg;
    data[1]=val;
    AS5600_I2C_WriteNByte(AS5600_SLV_ADDR, &data[0], 2);
}

void writeReg2(uint8_t reg, uint16_t val)
{
    uint8_t data[4];

    data[0]=reg;
    data[1]=(uint8_t) (val>>8);
    data[2]=(uint8_t) val;
    AS5600_I2C_WriteNByte(AS5600_SLV_ADDR, &data[0], 3);
}

void AS5600_setDirection(uint8_t direction)
{
    _direction=direction;
}

uint8_t AS5600_getZMCO(void)
{
    return (uint8_t) readReg(AS5600_ZMCO);
}

bool AS5600_setZPosition(uint16_t value)
{
    if(value>0x0FFF)
        return false;

    writeReg2(AS5600_ZPOS, value);

    return true;
}

uint16_t AS5600_getZPosition(void)
{
    return (readReg2(AS5600_ZPOS) & 0x0FFF);
}

bool AS5600_setMPosition(uint16_t value)
{
    if(value>0x0FFF)
        return false;

    writeReg2(AS5600_MPOS, value);

    return true;
}

uint16_t AS5600_getMPosition(void)
{
    return (readReg2(AS5600_MPOS) & 0x0FFF);
}

bool AS5600_setMaxAngle(uint16_t value)
{
    if(value>0x0FFF)
        return false;

    writeReg2(AS5600_MANG, value);

    return true;
}

uint16_t AS5600_getMaxAngle(void)
{
    return (readReg2(AS5600_MANG) & 0x0FFF);
}

bool AS5600_setConfigure(uint16_t value)
{
    if(value>0x3FFF)
        return false;

    writeReg2(AS5600_CONF, value);

    return true;
}

uint16_t AS5600_getConfigure(void)
{
    return (readReg2(AS5600_CONF) & 0x3FFF);
}

bool AS5600_setPowerMode(uint8_t powerMode)
{
    uint8_t value;

    if(powerMode>3)
        return false;

    value=readReg(AS5600_CONF+1);
    value&= ~AS5600_CONF_POWER_MODE;
    value|=powerMode;
    writeReg(AS5600_CONF+1, value);

    return true;
}

uint8_t AS5600_getPowerMode(void)
{
    return (readReg(AS5600_CONF+1) & 0x03);
}

bool AS5600_setHysteresis(uint8_t hysteresis)
{
    uint8_t value;

    if(hysteresis>3)
        return false;

    value=readReg(AS5600_CONF+1);
    value&= ~AS5600_CONF_HYSTERESIS;
    value|=(hysteresis<<2);
    writeReg(AS5600_CONF+1, value);

    return true;
}

uint8_t AS5600_getHysteresis(void)
{
    return ((readReg(AS5600_CONF+1)>>2) & 0x03);
}

bool AS5600_setOutputMode(uint8_t outputMode)
{
    uint8_t value;

    if(outputMode>2)
        return false;

    value=readReg(AS5600_CONF+1);
    value&= ~AS5600_CONF_OUTPUT_MODE;
    value|=(outputMode<<4);
    writeReg(AS5600_CONF+1, value);

    return true;
}

uint8_t AS5600_getOutputMode(void)
{
    return ((readReg(AS5600_CONF+1)>>4) & 0x03);
}

bool AS5600_setPWMFrequency(uint8_t pwmFreq)
{
    uint8_t value;

    if(pwmFreq>3)
        return false;

    value=readReg(AS5600_CONF+1);
    value&= ~AS5600_CONF_PWM_FREQUENCY;
    value|=(pwmFreq<<6);
    writeReg(AS5600_CONF+1, value);

    return true;
}

uint8_t AS5600_getPWMFrequency(void)
{
    return ((readReg(AS5600_CONF+1)>>6) & 0x03);
}

bool AS5600_setSlowFilter(uint8_t mask)
{
    uint8_t value;

    if(mask>3)
        return false;

    value=readReg(AS5600_CONF);
    value&= ~AS5600_CONF_SLOW_FILTER;
    value|=mask;
    writeReg(AS5600_CONF, value);

    return true;
}

uint8_t AS5600_getSlowFilter(void)
{
    return (readReg(AS5600_CONF) & 0x03);
}

bool AS5600_setFastFilter(uint8_t mask)
{
    uint8_t value;

    if(mask>7)
        return false;

    value=readReg(AS5600_CONF);
    value&= ~AS5600_CONF_FAST_FILTER;
    value|=(mask<<2);
    writeReg(AS5600_CONF, value);

    return true;
}

uint8_t AS5600_getFastFilter(void)
{
    return ((readReg(AS5600_CONF)>>2) & 0x07);
}

bool AS5600_setWatchDog(uint8_t mask)
{
    uint8_t value;

    if(mask>1)
        return false;

    value=readReg(AS5600_CONF);
    value&= ~AS5600_CONF_WATCH_DOG;
    value|=(mask<<5);
    writeReg(AS5600_CONF, value);

    return true;
}

uint8_t AS5600_getWatchDog(void)
{
    return ((readReg(AS5600_CONF)>>5) & 0x01);
}

uint16_t AS5600_rawAngle(void)
{
    int16_t value=readReg2(AS5600_RAW_ANGLE) & 0x0FFF;

    if(_offset>0)
        value=(value+_offset) & 0x0FFF;

    if((_directionPin==AS5600_SW_DIRECTION_PIN) && (_direction==AS5600_COUNTERCLOCK_WISE))
        value=(4096-value) & 0x0FFF;

    return value;
}

uint16_t AS5600_readAngle(void)
{
    uint16_t value=readReg2(AS5600_ANGLE) & 0x0FFF;

    if(_offset>0)
        value=(value+_offset) & 0x0FFF;

    if((_directionPin==AS5600_SW_DIRECTION_PIN) && (_direction==AS5600_COUNTERCLOCK_WISE))
        value=(4096-value) & 0x0FFF;

    return value;
}

bool AS5600_setOffset(float degrees)
{
    bool neg;
    uint16_t offset;

    //  expect loss of precision.
    if(abs(degrees)>36000)
        return false;

    neg=(degrees<0);

    if(neg)
        degrees= -degrees;

    offset=round(degrees*AS5600_DEGREES_TO_RAW);
    offset&=4095;

    if(neg)
        offset=4096-offset;

    _offset=offset;

    return true;
}

float AS5600_getOffset(void)
{
    return (_offset*AS5600_RAW_TO_DEGREES);
}

bool AS5600_increaseOffset(float degrees)
{
    //  add offset to existing offset in degrees.
    return AS5600_setOffset((_offset*AS5600_RAW_TO_DEGREES)+degrees);
}

uint8_t AS5600_readStatus(void)
{
    return readReg(AS5600_STATUS);
}

uint8_t AS5600_readAGC(void)
{
    return readReg(AS5600_AGC);
}

uint16_t AS5600_readMagnitude(void)
{
    return readReg2(AS5600_MAGNITUDE) & 0x0FFF;
}

bool AS5600_detectMagnet(void)
{
    return (AS5600_readStatus()&AS5600_MAGNET_DETECT)>1;
}

bool AS5600_magnetTooStrong(void)
{
    return (AS5600_readStatus()&AS5600_MAGNET_HIGH)>1;
}

bool AS5600_magnetTooWeak(void)
{
    return (AS5600_readStatus()&AS5600_MAGNET_LOW)>1;
}

float AS5600_getAngularSpeed(uint8_t mode)
{
    float speed;
    uint32_t now=Tick_GetTimeUs();

    int angle=AS5600_readAngle();
    uint32_t deltaT=now-_lastMeasurement;
    int deltaA=angle-_lastAngle;

    //  assumption is that there is no more than 180? rotation
    //  between two consecutive measurements.
    //  => at least two measurements per rotation (preferred 4).
    if(deltaA>2048)
        deltaA-=4096;

    if(deltaA < -2048)
        deltaA+=4096;

    speed=(deltaA*1e6)/deltaT;

    //  remember last time & angle
    _lastMeasurement=now;
    _lastAngle=angle;

    //  return radians, RPM or degrees.
    if(mode==AS5600_MODE_RADIANS)
        return speed*AS5600_RAW_TO_RADIANS;

    if(mode==AS5600_MODE_RPM)
        return speed*AS5600_RAW_TO_RPM;

    //  default return degrees
    return speed * AS5600_RAW_TO_DEGREES;
}

int32_t AS5600_getCumulativePosition(void)
{
    int16_t value=readReg2(AS5600_ANGLE) & 0x0FFF;

    if(_error!=AS5600_OK)
        return _position;

    //  whole rotation CW?
    //  less than half a circle
    if((_lastPosition>2048) && (value<(_lastPosition-2048)))
        _position=_position+4096-_lastPosition+value;
        //  whole rotation CCW?
        //  less than half a circle
    else if((value>2048) && (_lastPosition<(value-2048)))
        _position=_position-4096-_lastPosition+value;
    else
        _position=_position-_lastPosition+value;

    _lastPosition=value;

    return _position;
}

int32_t AS5600_getRevolutions(void)
{
    int32_t p=_position>>12; //  divide by 4096

    return p;
}

int32_t AS5600_resetPosition(int32_t position)
{
    int32_t old=_position;

    _position=position;

    return old;
}

int32_t AS5600_resetCumulativePosition(int32_t position)
{
    int32_t old;

    _lastPosition=readReg2(AS5600_RAW_ANGLE) & 0x0FFF;
    old=_position;
    _position=position;

    return old;
}

int8_t AS5600_lastError(void)
{
    int value=_error;

    _error=AS5600_OK;

    return value;
}

bool AS5600_Init(void)
{
    uint8_t reg;

    AS5600_I2C_Open();
    _directionPin=255;
    _direction=AS5600_CLOCK_WISE;
    _error=AS5600_OK;

    //  for getAngularSpeed()
    _lastMeasurement=0;
    _lastAngle=0;

    //  for readAngle() and rawAngle()
    _offset=0;

    //  EXPERIMENTAL
    //  cumulative position counter
    //  works only if the sensor is read often enough.
    _position=0;
    _lastPosition=0;
    reg=AS5600_CONF;
    AS5600_setDirection(AS5600_SW_DIRECTION_PIN);

    return AS5600_I2C_WriteNByte(AS5600_SLV_ADDR, &reg, 1);
}

void AS5600_Deinit(void)
{
    AS5600_I2C_Close();
}

direction_t AS5600_GetAngle(uint16_t *pAngle)
{
    float tmp;
    
    *pAngle=AS5600_rawAngle();
    tmp=(float) *pAngle;
    tmp=tmp*360.0;
    tmp=tmp/4096.0;
    tmp=tmp+70.0;
    
    if (tmp >= 360.0)
        tmp -= 360.0; 
    else if (tmp < 0.0)
        tmp += 360.0;
    
    tmp = 360.0 - tmp;
    
    return (direction_t) tmp;
}
