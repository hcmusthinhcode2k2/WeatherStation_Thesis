#include "Sensors/SHT4x.h"
#include "System/TickTimer.h"
#include "System/softWdt.h"
#include "i2c1.h"
#include "Sensors/sensirion_arch_config.h"
#include "Sensors/sensirion_common.h"
#include "Sensors/sensirion_i2c.h"

#ifdef USE_SHT4X_DEBUG
#include "Common/Debug.h"
#else
#define __dbsi(...)
#define __dbs(...)
#define __dbh2(...)
#endif

/*
 * INSTRUCTIONS
 * ============
 *
 * Implement all functions where they are marked as IMPLEMENT.
 * Follow the function specification in the comments.
 */

/**
 * Select the current i2c bus by index.
 * All following i2c operations will be directed at that bus.
 *
 * THE IMPLEMENTATION IS OPTIONAL ON SINGLE-BUS SETUPS (all sensors on the same
 * bus)
 *
 * @param bus_idx   Bus index to select
 * @returns         0 on success, an error code otherwise
 */
int16_t sensirion_i2c_select_bus(uint8_t bus_idx)
{
    // IMPLEMENT or leave empty if all sensors are located on one single bus
    return STATUS_OK;
}

/**
 * Initialize all hard- and software components that are needed for the I2C
 * communication.
 */
void sensirion_i2c_init(void)
{
    // IMPLEMENT
    I2C1_Open();
}

/**
 * Release all resources initialized by sensirion_i2c_init().
 */
void sensirion_i2c_release(void)
{
    I2C1_Close();
    // IMPLEMENT or leave empty if no resources need to be freed
}

/**
 * Execute one read transaction on the I2C bus, reading a given number of bytes.
 * If the device does not acknowledge the read command, an error shall be
 * returned.
 *
 * @param address 7-bit I2C address to read from
 * @param data    pointer to the buffer where the data is to be stored
 * @param count   number of bytes to read from I2C and store in the buffer
 * @returns 0 on success, error code otherwise
 */
int8_t sensirion_i2c_read(uint8_t address, uint8_t* data, uint16_t count)
{
    // IMPLEMENT
    bool rslt=I2C1_Master_Read(address, data, (uint8_t) count); // 0-success, 1-fail

    uint16_t i;

    __dbsi("\nRead: ", count);
    __dbs("\n");

    for(i=0; i<count; i++)
        __dbh2(data[i]);

    if(rslt==0)
    {
        __dbs(" error");
        return STATUS_FAIL;
    }

    return STATUS_OK;
}

/**
 * Execute one write transaction on the I2C bus, sending a given number of
 * bytes. The bytes in the supplied buffer must be sent to the given address. If
 * the slave device does not acknowledge any of the bytes, an error shall be
 * returned.
 *
 * @param address 7-bit I2C address to write to
 * @param data    pointer to the buffer containing the data to write
 * @param count   number of bytes to read from the buffer and send over I2C
 * @returns 0 on success, error code otherwise
 */
int8_t sensirion_i2c_write(uint8_t address, const uint8_t* data, uint16_t count)
{
    // IMPLEMENT
    uint16_t i;

    __dbs("\nWrite: ");

    for(i=0; i<count; i++)
        __dbh2(data[i]);

    bool rslt=I2C1_Master_Write(address, data, (uint8_t) count); // 0-success, 1-fail

    if(rslt==0)
    {
        __dbs(" error");
        return STATUS_FAIL;
    }

    return STATUS_OK;
}

/**
 * Sleep for a given number of microseconds. The function should delay the
 * execution for at least the given time, but may also sleep longer.
 *
 * Despite the unit, a <10 millisecond precision is sufficient.
 *
 * @param useconds the sleep time in microseconds
 */
void sensirion_sleep_usec(uint32_t useconds)
{
    // IMPLEMENT
    tick_timer_t tk;
    
    Tick_Timer_Reset(tk);
    
    while(!Tick_Timer_Is_Over_Us(tk, useconds))
        TaskManager();
}
