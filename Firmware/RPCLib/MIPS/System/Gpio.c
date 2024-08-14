#include "Gpio.h"
#include "Common/Utils.h"

void Gpio_Set(volatile uint32_t *baseReg, gpio_pin_t pin, uint8_t val)
{
    if(val==0) // Clear
        baseReg+=1; // Set
    else if(val==1)
        baseReg+=2;
    else // Invert
        baseReg+=3;

    if(pin<=PIN_A15) // Port A
    {
        baseReg+=0;
        pin-=PIN_A0;
    }
    else if(pin<=PIN_B15) // Port B
    {
        baseReg+=64;
        pin-=PIN_B0;
    }
    else if(pin<=PIN_C15) // Port C
    {
        baseReg+=128;
        pin-=PIN_C0;
    }
    else if(pin<=PIN_D4)// Port D
    {
        baseReg+=192;
        pin-=PIN_D0;
    }
    else
        return;

    *baseReg=(1<<pin);
}

bool Gpio_Get(volatile uint32_t *baseReg, gpio_pin_t pin)
{
    if(pin<=PIN_A15) // Port A
    {
        baseReg+=0;
        pin-=PIN_A0;
    }
    else if(pin<=PIN_B15) // Port B
    {
        baseReg+=64;
        pin-=PIN_B0;
    }
    else if(pin<=PIN_C15) // Port C
    {
        baseReg+=128;
        pin-=PIN_C0;
    }
    else if(pin<=PIN_D4)// Port D
    {
        baseReg+=192;
        pin-=PIN_D0;
    }
    else
        return 0;

    return BitTest((*baseReg), pin);
}

void Gpio_GetPinName(char *pStr, gpio_pin_t pin)
{
    if(pin<=PIN_A15) // Port A
    {
        *pStr='A';
        pin-=PIN_A0;
    }
    else if(pin<=PIN_B15) // Port B
    {
        *pStr='B';
        pin-=PIN_B0;
    }
    else if(pin<=PIN_C15) // Port C
    {
        *pStr='C';
        pin-=PIN_C0;
    }
    else if(pin<=PIN_D4)// Port D
    {
        *pStr='D';
        pin-=PIN_D0;
    }
    else
        return;

    pStr++;
    u32str(pin, pStr);
}