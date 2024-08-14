/***********************************************************************************************//**
 * \file xensiv_dps3xx.c
 *
 * Description: This file is the public implementation of the DPS3xx pressure sensors.
 ***************************************************************************************************
 * \copyright
 * Copyright 2021 Cypress Semiconductor Corporation
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **************************************************************************************************/

#include <stddef.h>
#include "xensiv_dps3xx.h"

/*******************************************************************************
* Macros
*******************************************************************************/
#define XENSIV_DPS3XX_PSR_READ_REG_ADDR             (0x00)
#define XENSIV_DPS3XX_PSR_READ_LEN                  (3)

#define XENSIV_DPS3XX_TMP_READ_REG_ADDR             (0x03)
#define XENSIV_DPS3XX_TMP_READ_LEN                  (3)

#define XENSIV_DPS3XX_PSR_TMP_READ_REG_ADDR         (0x00)
#define XENSIV_DPS3XX_PSR_TMP_READ_LEN              (0x06)

#define XENSIV_DPS3XX_PRS_CFG_REG_ADDR              (0x06)
#define XENSIV_DPS3XX_PRS_CFG_REG_LEN               (1)

#define XENSIV_DPS3XX_TMP_CFG_REG_ADDR              (0x07)
#define XENSIV_DPS3XX_TMP_CFG_REG_LEN               (1)

#define XENSIV_DPS3XX_MEAS_CFG_REG_ADDR             (0x08)
#define XENSIV_DPS3XX_MEAS_CFG_REG_LEN              (1)

#define XENSIV_DPS3XX_CFG_REG_ADDR                  (0x09)
#define XENSIV_DPS3XX_CFG_REG_LEN                   (1)

#define XENSIV_DPS3XX_INTR_STATUS_REG_ADDR          (0x0A)
#define XENSIV_DPS3XX_INTR_STATUS_REG_LEN           (1)

#define XENSIV_DPS3XX_FIFO_STATUS_REG_ADDR          (0x0B)
#define XENSIV_DPS3XX_FIFO_STATUS_REG_LEN           (1)

#define XENSIV_DPS3XX_SOFT_RESET_REG_ADDR           (0x0C)
#define XENSIV_DPS3XX_SOFT_RESET_REG_DATA           (0x09)

#define XENSIV_DPS3XX_FIFO_FLUSH_REG_ADDR           (0x0C)
#define XENSIV_DPS3XX_FIFO_FLUSH_REG_VAL            (0b1000000U)

#define XENSIV_DPS3XX_PROD_REV_ID_REG_ADDR          (0x0D)
#define XENSIV_DPS3XX_PROD_REV_ID_LEN               (1)
#define XENSIV_DPS3XX_PROD_REV_ID_VAL_1             (DEVICE_PROD_REV_ID_1)
#define XENSIV_DPS3XX_PROD_REV_ID_VAL_2             (DEVICE_PROD_REV_ID_2)


#define XENSIV_DPS3XX_COEF_REG_ADDR                 (0x10)
#define XENSIV_DPS3XX_COEF_WRITE_LEN                (1)
#define XENSIV_DPS3XX_COEF_LEN                      (18)

#define XENSIV_DPS3XX_TMP_COEF_SRCE_REG_ADDR        (0x28)
#define XENSIV_DPS3XX_TMP_COEF_SRCE_REG_LEN         (1)
#define XENSIV_DPS3XX_TMP_COEF_SRCE_REG_POS_MASK    (7)

#define XENSIV_DPS3XX_CFG_INT_MASK                  (0xF0)
#define XENSIV_DPS3XX_CFG_TMP_SHIFT_EN_SET_VAL      (0x08)
#define XENSIV_DPS3XX_CFG_PRS_SHIFT_EN_SET_VAL      (0x04)
#define XENSIV_DPS3XX_CFG_FIFO_EN_SET_VAL           (0x02)
#define XENSIV_DPS3XX_CFG_SPI_MODE_SET_VAL          (0x01)

#define XENSIV_DPS3XX_FIFO_READ_REG_ADDR            (0x00)
#define XENSIV_DPS3XX_FIFO_REG_READ_LEN             (3)
#define XENSIV_DPS3XX_FIFO_BYTES_PER_ENTRY          (3)

#define XENSIV_DPS3XX_CORRECTION_REG_LEN            (2)

#define XENSIV_DPS3XX_INTR_DISABLE_ALL              ((uint8_t)0b10001111)
#define XENSIV_DPS3XX_REG_WRITE_LEN                 (2)

#define POW_2_11_MINUS_1                            (0x7FF)
#define POW_2_12                                    (0x1000)
#define POW_2_15_MINUS_1                            (0x7FFF)
#define POW_2_16                                    (0x10000)
#define POW_2_19_MINUS_1                            (0x7FFFF)
#define POW_2_20                                    (0x100000)
#define POW_2_23_MINUS_1                            (0x7FFFFF)
#define POW_2_24                                    (0x1000000)

#define XENSIV_DPS3XX_MEAS_CFG_RESET_VALUE          (0xC0)
#define XENSIV_DPS3XX_IS_COEFFICIENTS_READY(x)      ((x >> 7) & 1)
#define XENSIV_DPS3XX_IS_SENSOR_READY(x)            ((x >> 6) & 1)
#define XENSIV_DPS3XX_IS_TEMPERATURE_READY(x)       ((x >> 5) & 1)
#define XENSIV_DPS3XX_IS_PRESSURE_READY(x)          ((x >> 4) & 1)


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_reg_read
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_reg_read(xensiv_dps3xx_t* dev, uint8_t reg_addr, uint8_t* data,
                                         uint8_t length)
{
    return dev->comm.read(dev->comm.context, dev->user_config.i2c_timeout, dev->i2c_address,
                          reg_addr, data, length);
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_reg_write
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_reg_write(xensiv_dps3xx_t* dev, uint8_t reg_addr, uint8_t* data,
                                          uint8_t length)
{
    return dev->comm.write(dev->comm.context, dev->user_config.i2c_timeout, dev->i2c_address,
                           reg_addr, data, length);
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_meas_cfg_read
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_meas_cfg_read(xensiv_dps3xx_t* dev)
{
    return _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_MEAS_CFG_REG_ADDR, &(dev->meas_cfg), 1);
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_meas_cfg_write
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_meas_cfg_write(xensiv_dps3xx_t* dev,
                                               xensiv_dps3xx_mode_t meas_ctrl)
{
    uint8_t reg_val = (uint8_t)meas_ctrl;
    cy_rslt_t rc = _xensiv_dps3xx_reg_write(dev, XENSIV_DPS3XX_MEAS_CFG_REG_ADDR, &reg_val, 1);
    if (CY_RSLT_SUCCESS == rc)
    {
        dev->user_config.dev_mode = meas_ctrl;
    }
    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_set_cfg_reg
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_set_cfg_reg(xensiv_dps3xx_t* dev, bool fifo_enable,
                                            xensiv_dps3xx_interrupt_t interrupt_triggers)
{
    uint8_t reg_val;
    cy_rslt_t rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &reg_val, 1);
    if (CY_RSLT_SUCCESS == rc)
    {
        reg_val &= ~(XENSIV_DPS3XX_CFG_INT_MASK | XENSIV_DPS3XX_CFG_FIFO_EN_SET_VAL);

        reg_val |= (uint8_t)interrupt_triggers;
        if (fifo_enable)
        {
            reg_val |= XENSIV_DPS3XX_CFG_FIFO_EN_SET_VAL;
        }

        rc = _xensiv_dps3xx_reg_write(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &reg_val, 1);
        if (CY_RSLT_SUCCESS == rc)
        {
            dev->user_config.fifo_enable = fifo_enable;
            dev->user_config.interrupt_triggers = interrupt_triggers;
        }
    }
    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_wait_data_ready
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_wait_data_ready(xensiv_dps3xx_t* dev, bool pressure, bool temp)
{
    bool ready = false, pressure_ready = false, temp_ready = false;
    cy_rslt_t rc = CY_RSLT_SUCCESS;

    for (int i = 0; i < dev->user_config.data_timeout && (rc == CY_RSLT_SUCCESS) && !ready; i++)
    {
        if (i > 0)
        {
            dev->comm.delay(1);
        }

        rc = xensiv_dps3xx_check_ready(dev, &pressure_ready, &temp_ready);
        ready = (!pressure || pressure_ready) && (!temp || temp_ready);
    }
    if ((CY_RSLT_SUCCESS == rc) && !ready)
    {
        rc = XENSIV_DPS3XX_RSLT_ERR_DATA_NOT_READY;
    }

    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_get_scaling_coef
//--------------------------------------------------------------------------------------------------
static _xensiv_dps3xx_scaling_coeffs_t _xensiv_dps3xx_get_scaling_coef(
    xensiv_dps3xx_oversample_t osr)
{
    switch (osr)
    {
        case XENSIV_DPS3XX_OVERSAMPLE_1:
            return _XENSIV_DPS3XX_OSR_SF_1;

        case XENSIV_DPS3XX_OVERSAMPLE_2:
            return _XENSIV_DPS3XX_OSR_SF_2;

        case XENSIV_DPS3XX_OVERSAMPLE_4:
            return _XENSIV_DPS3XX_OSR_SF_4;

        case XENSIV_DPS3XX_OVERSAMPLE_8:
            return _XENSIV_DPS3XX_OSR_SF_8;

        case XENSIV_DPS3XX_OVERSAMPLE_16:
            return _XENSIV_DPS3XX_OSR_SF_16;

        case XENSIV_DPS3XX_OVERSAMPLE_32:
            return _XENSIV_DPS3XX_OSR_SF_32;

        case XENSIV_DPS3XX_OVERSAMPLE_64:
            return _XENSIV_DPS3XX_OSR_SF_64;

        case XENSIV_DPS3XX_OVERSAMPLE_128:
            return _XENSIV_DPS3XX_OSR_SF_128;

        default:
            CY_ASSERT(false);
            return _XENSIV_DPS3XX_OSR_SF_1;
    }
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_calc_temperature
//--------------------------------------------------------------------------------------------------
static float _xensiv_dps3xx_calc_temperature(xensiv_dps3xx_t* dev, int32_t temp_raw)
{
    if (temp_raw > POW_2_23_MINUS_1)
    {
        temp_raw -= POW_2_24;
    }
    dev->temp_scaled = (float)temp_raw / (float)dev->tmp_osr_scale_coeff;

    int64_t c0 = dev->calib_coeffs.C0;
    int64_t c1 = dev->calib_coeffs.C1;
    return (c0 / 2.0f) + (c1 * dev->temp_scaled);
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_calc_pressure
//--------------------------------------------------------------------------------------------------
static float _xensiv_dps3xx_calc_pressure(xensiv_dps3xx_t* dev, int32_t press_raw)
{
    if (press_raw > POW_2_23_MINUS_1)
    {
        press_raw -= POW_2_24;
    }

    float press_scaled = (float)press_raw / dev->prs_osr_scale_coeff;
    int64_t c00 = dev->calib_coeffs.C00;
    int64_t c10 = dev->calib_coeffs.C10;
    int64_t c20 = dev->calib_coeffs.C20;
    int64_t c30 = dev->calib_coeffs.C30;
    int64_t c01 = dev->calib_coeffs.C01;
    int64_t c11 = dev->calib_coeffs.C11;
    int64_t c21 = dev->calib_coeffs.C21;

    float Pcal = c00
                 + press_scaled * (c10 + press_scaled * (c20 + press_scaled * c30))
                 + (dev->temp_scaled * c01)
                 + (dev->temp_scaled * press_scaled * (c11 + press_scaled * c21));
    return Pcal * 0.01f;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_read_calibration_regs
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_read_calibration_regs(xensiv_dps3xx_t* dev)
{
    uint8_t data[19];

    // read coefficients
    cy_rslt_t rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_COEF_REG_ADDR, data,
                                           XENSIV_DPS3XX_COEF_LEN);

    dev->calib_coeffs.C0 = ((int32_t)data[0] << 4u) + (((int32_t)data[1] >> 4u) & 0x0F);
    if (dev->calib_coeffs.C0 > POW_2_11_MINUS_1)
    {
        dev->calib_coeffs.C0 = dev->calib_coeffs.C0 - POW_2_12;
    }

    dev->calib_coeffs.C1 = (data[2] + ((data[1] & 0x0F) << 8u));
    if (dev->calib_coeffs.C1 > POW_2_11_MINUS_1)
    {
        dev->calib_coeffs.C1 = dev->calib_coeffs.C1 - POW_2_12;
    }

    dev->calib_coeffs.C00 = (((int32_t)data[4] << 4u)
                             + ((int32_t)data[3] << 12u)) + (((int32_t)data[5] >> 4) & 0x0F);
    if (dev->calib_coeffs.C00 > POW_2_19_MINUS_1)
    {
        dev->calib_coeffs.C00 = dev->calib_coeffs.C00 - POW_2_20;
    }

    dev->calib_coeffs.C10 = (((int32_t)data[5] & (int32_t)0x0F) << 16u)
                            + ((int32_t)data[6] << 8u) + data[7];
    if (dev->calib_coeffs.C10 > POW_2_19_MINUS_1)
    {
        dev->calib_coeffs.C10 = dev->calib_coeffs.C10 - POW_2_20;
    }

    dev->calib_coeffs.C01 = (data[9] + ((int32_t)data[8] << 8u));
    if (dev->calib_coeffs.C01 > POW_2_15_MINUS_1)
    {
        dev->calib_coeffs.C01 = dev->calib_coeffs.C01 - POW_2_16;
    }

    dev->calib_coeffs.C11 = (data[11] + ((int32_t)data[10] << 8u));
    if (dev->calib_coeffs.C11 > POW_2_15_MINUS_1)
    {
        dev->calib_coeffs.C11 = dev->calib_coeffs.C11 - POW_2_16;
    }

    dev->calib_coeffs.C20 = (data[13] + ((int32_t)data[12] << 8u));
    if (dev->calib_coeffs.C20 > POW_2_15_MINUS_1)
    {
        dev->calib_coeffs.C20 = dev->calib_coeffs.C20 - POW_2_16;
    }

    dev->calib_coeffs.C21 = (data[15] + ((int32_t)data[14] << 8u));
    if (dev->calib_coeffs.C21 > POW_2_15_MINUS_1)
    {
        dev->calib_coeffs.C21 = dev->calib_coeffs.C21 - POW_2_16;
    }

    dev->calib_coeffs.C30 = (data[17] + ((int32_t)data[16] << 8u));
    if (dev->calib_coeffs.C30 > POW_2_15_MINUS_1)
    {
        dev->calib_coeffs.C30 = dev->calib_coeffs.C30 - POW_2_16;
    }

    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_correct_temperature
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_correct_temperature(xensiv_dps3xx_t* dev)
{
    uint8_t write_data = 0xA5;
    cy_rslt_t rc = _xensiv_dps3xx_reg_write(dev, 0x0E, &write_data, 1);

    if (rc == CY_RSLT_SUCCESS)
    {
        write_data = 0x96;
        rc = _xensiv_dps3xx_reg_write(dev, 0x0F, &write_data, 1);
    }

    if (rc == CY_RSLT_SUCCESS)
    {
        write_data = 0x02;
        rc = _xensiv_dps3xx_reg_write(dev, 0x62, &write_data, 1);
    }

    if (rc == CY_RSLT_SUCCESS)
    {
        write_data = 0x00;
        rc = _xensiv_dps3xx_reg_write(dev, 0x0E, &write_data, 1);
    }

    if (rc == CY_RSLT_SUCCESS)
    {
        write_data = 0x00;
        rc = _xensiv_dps3xx_reg_write(dev, 0x0F, &write_data, 1);
    }

    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_set_temperature_config
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_set_temperature_config(xensiv_dps3xx_t* dev,
                                                       xensiv_dps3xx_oversample_t osr_temp,
                                                       xensiv_dps3xx_rate_t mr_temp)
{
    // write temperature config
    uint8_t reg_val = (uint8_t)dev->tmp_ext | (uint8_t)mr_temp | (uint8_t)osr_temp;
    cy_rslt_t rc = _xensiv_dps3xx_reg_write(dev, XENSIV_DPS3XX_TMP_CFG_REG_ADDR, &reg_val, 1);

    if (rc == CY_RSLT_SUCCESS)
    {
        if (osr_temp > XENSIV_DPS3XX_OVERSAMPLE_8)
        {
            // set T_SHIFT bit in CFG_REG if oversampling rate for temperature is greater than 8x
            rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &reg_val, 1);
            if (rc == CY_RSLT_SUCCESS)
            {
                reg_val |= XENSIV_DPS3XX_CFG_TMP_SHIFT_EN_SET_VAL;
                rc = _xensiv_dps3xx_reg_write(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &reg_val, 1);
            }
        }

        if (rc == CY_RSLT_SUCCESS)
        {
            dev->user_config.temperature_rate = mr_temp;
            dev->user_config.temperature_oversample = osr_temp;
            dev->tmp_osr_scale_coeff = _xensiv_dps3xx_get_scaling_coef(osr_temp);
        }
    }
    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_set_pressure_config
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_set_pressure_config(xensiv_dps3xx_t* dev,
                                                    xensiv_dps3xx_oversample_t osr_press,
                                                    xensiv_dps3xx_rate_t mr_press)
{
    // write pressure config
    uint8_t reg_val = (uint8_t)mr_press | (uint8_t)osr_press;
    cy_rslt_t rc = _xensiv_dps3xx_reg_write(dev, XENSIV_DPS3XX_PRS_CFG_REG_ADDR, &reg_val, 1);

    if (rc == CY_RSLT_SUCCESS)
    {
        if (osr_press > XENSIV_DPS3XX_OVERSAMPLE_8)
        {
            // set P_SHIFT bit in CFG_REG if oversampling rate for pressure is greater than 8x
            rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &reg_val, 1);
            if (rc == CY_RSLT_SUCCESS)
            {
                reg_val |= XENSIV_DPS3XX_CFG_PRS_SHIFT_EN_SET_VAL;
                rc = _xensiv_dps3xx_reg_write(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &reg_val, 1);
            }
        }

        if (rc == CY_RSLT_SUCCESS)
        {
            dev->user_config.pressure_rate = mr_press;
            dev->user_config.pressure_oversample = osr_press;
            dev->prs_osr_scale_coeff = _xensiv_dps3xx_get_scaling_coef(osr_press);
        }
    }
    return rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_read_raw_values
//--------------------------------------------------------------------------------------------------
static cy_rslt_t _xensiv_dps3xx_read_raw_values(xensiv_dps3xx_t* dev, uint8_t* raw_value)
{
    uint8_t read_reg_addr = XENSIV_DPS3XX_MEAS_CFG_REG_ADDR;
    uint8_t read_reg_len = XENSIV_DPS3XX_PSR_TMP_READ_LEN;
    bool pressure = false, temperature = false;

    switch (dev->user_config.dev_mode)
    {
        case XENSIV_DPS3XX_MODE_COMMAND_PRESSURE:
        case XENSIV_DPS3XX_MODE_BACKGROUND_PRESSURE:
            read_reg_addr = XENSIV_DPS3XX_PSR_READ_REG_ADDR;
            read_reg_len = XENSIV_DPS3XX_PSR_READ_LEN;
            pressure = true;
            break;

        case XENSIV_DPS3XX_MODE_COMMAND_TEMPERATURE:
        case XENSIV_DPS3XX_MODE_BACKGROUND_TEMPERATURE:
            read_reg_addr = XENSIV_DPS3XX_TMP_READ_REG_ADDR;
            read_reg_len = XENSIV_DPS3XX_TMP_READ_LEN;
            temperature = true;
            break;

        case XENSIV_DPS3XX_MODE_BACKGROUND_ALL:
            read_reg_addr = XENSIV_DPS3XX_PSR_TMP_READ_REG_ADDR;
            read_reg_len = XENSIV_DPS3XX_PSR_TMP_READ_LEN;
            pressure = true;
            temperature = true;
            break;

        default:
            CY_ASSERT(0);
            break;
    }

    cy_rslt_t rc = _xensiv_dps3xx_wait_data_ready(dev, pressure, temperature);

    return (CY_RSLT_SUCCESS == rc)
        ? _xensiv_dps3xx_reg_read(dev, read_reg_addr, raw_value, read_reg_len)
        : rc;
}


//--------------------------------------------------------------------------------------------------
// _xensiv_dps3xx_convert_raw_values
//--------------------------------------------------------------------------------------------------
static void _xensiv_dps3xx_convert_raw_values(xensiv_dps3xx_t* dev, uint8_t* raw_value,
                                              float* pressure, float* temperature)
{
    int32_t press_raw, temp_raw;
    float pres = 0, temp = 0;

    switch (dev->user_config.dev_mode)
    {
        case XENSIV_DPS3XX_MODE_COMMAND_PRESSURE:
        case XENSIV_DPS3XX_MODE_BACKGROUND_PRESSURE:
            press_raw = (int32_t)((raw_value[2]) + (raw_value[1] << 8) + (raw_value[0] << 16));
            pres = _xensiv_dps3xx_calc_pressure(dev, press_raw);
            break;

        case XENSIV_DPS3XX_MODE_COMMAND_TEMPERATURE:
        case XENSIV_DPS3XX_MODE_BACKGROUND_TEMPERATURE:
            temp_raw = (int32_t)(raw_value[2]) + (raw_value[1] << 8) + (raw_value[0] << 16);
            temp = _xensiv_dps3xx_calc_temperature(dev, temp_raw);
            break;

        case XENSIV_DPS3XX_MODE_BACKGROUND_ALL:
            press_raw = (int32_t)(raw_value[2]) + (raw_value[1] << 8) + (raw_value[0] << 16);
            temp_raw = (int32_t)(raw_value[5]) + (raw_value[4] << 8) + (raw_value[3] << 16);
            pres = _xensiv_dps3xx_calc_pressure(dev, press_raw);
            temp = _xensiv_dps3xx_calc_temperature(dev, temp_raw);
            break;

        default:
            CY_ASSERT(0);
            break;
    }

    if (NULL != pressure)
    {
        *pressure = pres;
    }
    if (NULL != temperature)
    {
        *temperature = temp;
    }
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_init_i2c
//--------------------------------------------------------------------------------------------------
cy_rslt_t xensiv_dps3xx_init_i2c(xensiv_dps3xx_t* dev, const xensiv_dps3xx_i2c_comm_t* functions,
                                 xensiv_dps3xx_i2c_addr_t i2c_addr)
{
    cy_rslt_t rc = CY_RSLT_SUCCESS;
    uint8_t read_reg_val;
    dev->user_config.i2c_timeout = 10;
    dev->user_config.data_timeout = 500;
    dev->comm.read = functions->read;
    dev->comm.write = functions->write;
    dev->comm.delay = functions->delay;
    dev->comm.context = functions->context;
    dev->i2c_address = i2c_addr;
    dev->temp_scaled = 0;

    /* Wait for a completion event from the master or slave */
    int32_t timeout = dev->user_config.i2c_timeout;
    do
    {
        rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_MEAS_CFG_REG_ADDR, &read_reg_val,
                                     XENSIV_DPS3XX_MEAS_CFG_REG_LEN);
        if (rc != CY_RSLT_SUCCESS)
        {
            // device not present
            return rc;
        }
        if ((read_reg_val & XENSIV_DPS3XX_MEAS_CFG_RESET_VALUE) ==
            XENSIV_DPS3XX_MEAS_CFG_RESET_VALUE)
        {
            break;
        }
        dev->comm.delay(10);
        timeout -= 10;
    } while (0L >= timeout);

    // read calibration coefficients
    if (rc == CY_RSLT_SUCCESS)
    {
        rc = _xensiv_dps3xx_read_calibration_regs(dev);
    }

    // read configuration
    if (rc == CY_RSLT_SUCCESS)
    {
        rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_CFG_REG_ADDR, &read_reg_val,
                                     XENSIV_DPS3XX_CFG_REG_LEN);
    }

    if (rc == CY_RSLT_SUCCESS)
    {
        dev->user_config.fifo_enable = (read_reg_val & XENSIV_DPS3XX_CFG_FIFO_EN_SET_VAL) > 0;
        dev->user_config.interrupt_triggers =
            (xensiv_dps3xx_interrupt_t)(read_reg_val & XENSIV_DPS3XX_CFG_INT_MASK);

        // read temperature source
        rc = _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_TMP_COEF_SRCE_REG_ADDR, &read_reg_val,
                                     XENSIV_DPS3XX_TMP_COEF_SRCE_REG_LEN);
    }

    // set measurement configuration
    if (rc == CY_RSLT_SUCCESS)
    {
        dev->tmp_ext = ((read_reg_val >> XENSIV_DPS3XX_TMP_COEF_SRCE_REG_POS_MASK) & 0x01)
            ? _XENSIV_DPS3XX_TEMP_SRC_MEMS
            : _XENSIV_DPS3XX_TEMP_SRC_ASIC;

        rc = _xensiv_dps3xx_correct_temperature(dev);
    }
    if (rc == CY_RSLT_SUCCESS)
    {
        rc = _xensiv_dps3xx_set_temperature_config(dev, XENSIV_DPS3XX_OVERSAMPLE_1,
                                                   XENSIV_DPS3XX_RATE_1);
    }
    if (rc == CY_RSLT_SUCCESS)
    {
        rc = _xensiv_dps3xx_set_pressure_config(dev, XENSIV_DPS3XX_OVERSAMPLE_1,
                                                XENSIV_DPS3XX_RATE_1);
    }
    if (rc == CY_RSLT_SUCCESS)
    {
        rc = _xensiv_dps3xx_meas_cfg_write(dev, XENSIV_DPS3XX_MODE_BACKGROUND_ALL);
    }

    return rc;
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_get_config
//--------------------------------------------------------------------------------------------------
cy_rslt_t xensiv_dps3xx_get_config(xensiv_dps3xx_t* dev, xensiv_dps3xx_config_t* config)
{
    *config = dev->user_config;
    return CY_RSLT_SUCCESS;
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_set_config
//--------------------------------------------------------------------------------------------------
cy_rslt_t xensiv_dps3xx_set_config(xensiv_dps3xx_t* dev, xensiv_dps3xx_config_t* config)
{
    cy_rslt_t rc = CY_RSLT_SUCCESS;
    dev->user_config.data_timeout = config->data_timeout;
    dev->user_config.i2c_timeout = config->i2c_timeout;

    if (config->dev_mode != dev->user_config.dev_mode)
    {
        rc = _xensiv_dps3xx_meas_cfg_write(dev, config->dev_mode);
    }
    if ((CY_RSLT_SUCCESS == rc) &&
        ((config->temperature_rate != dev->user_config.temperature_rate) ||
         (config->temperature_oversample != dev->user_config.temperature_oversample)))
    {
        rc = _xensiv_dps3xx_set_temperature_config(dev, config->temperature_oversample,
                                                   config->temperature_rate);
    }
    if ((CY_RSLT_SUCCESS == rc) &&
        ((config->pressure_rate != dev->user_config.temperature_rate) ||
         (config->pressure_oversample != dev->user_config.temperature_oversample)))
    {
        rc = _xensiv_dps3xx_set_pressure_config(dev, config->pressure_oversample,
                                                config->pressure_rate);
    }
    if ((CY_RSLT_SUCCESS == rc) &&
        ((config->fifo_enable != dev->user_config.fifo_enable) ||
         (config->interrupt_triggers != dev->user_config.interrupt_triggers)))
    {
        rc = _xensiv_dps3xx_set_cfg_reg(dev, config->fifo_enable, config->interrupt_triggers);
    }
    return rc;
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_get_revision_id
//--------------------------------------------------------------------------------------------------
cy_rslt_t xensiv_dps3xx_get_revision_id(xensiv_dps3xx_t* dev, uint8_t* revision_id)
{
    return _xensiv_dps3xx_reg_read(dev, XENSIV_DPS3XX_PROD_REV_ID_REG_ADDR, revision_id,
                                   XENSIV_DPS3XX_PROD_REV_ID_LEN);
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_check_ready
//--------------------------------------------------------------------------------------------------
cy_rslt_t xensiv_dps3xx_check_ready(xensiv_dps3xx_t* dev, bool* pressure_ready,
                                    bool* temperature_ready)
{
    cy_rslt_t rc = _xensiv_dps3xx_meas_cfg_read(dev);
    if (rc == CY_RSLT_SUCCESS)
    {
        if (pressure_ready != NULL)
        {
            *pressure_ready = XENSIV_DPS3XX_IS_PRESSURE_READY(dev->meas_cfg);
        }
        if (temperature_ready != NULL)
        {
            *temperature_ready = XENSIV_DPS3XX_IS_TEMPERATURE_READY(dev->meas_cfg);
        }
    }
    return rc;
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_read
//--------------------------------------------------------------------------------------------------
cy_rslt_t xensiv_dps3xx_read(xensiv_dps3xx_t* dev, float* pressure, float* temperature)
{
    uint8_t read_buffer[XENSIV_DPS3XX_PSR_TMP_READ_LEN];

    cy_rslt_t rc = _xensiv_dps3xx_read_raw_values(dev, read_buffer);
    if (CY_RSLT_SUCCESS == rc)
    {
        _xensiv_dps3xx_convert_raw_values(dev, read_buffer, pressure, temperature);
    }

    return rc;
}


//--------------------------------------------------------------------------------------------------
// xensiv_dps3xx_free
//--------------------------------------------------------------------------------------------------
void xensiv_dps3xx_free(xensiv_dps3xx_t* dev)
{
    cy_rslt_t rc = _xensiv_dps3xx_meas_cfg_write(dev, XENSIV_DPS3XX_MODE_IDLE);
    CY_ASSERT(CY_RSLT_SUCCESS == rc);
    (void)rc;
}
