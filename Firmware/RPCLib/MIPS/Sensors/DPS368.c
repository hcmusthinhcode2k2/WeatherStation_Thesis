#include "DPS368.h"

#define DPS368_COEF_SIZE 18
#define DPS368_RES_SIZE 3

static uint8_t source;
static int32_t c0, c1, c00, c10, c01, c11, c20, c21, c30;
//static int16_t c0, c1, c01, c11, c20, c21, c30;
static int32_t c00, c10;
static dps368_samp_rate_t sr_tmp, sr_prs;

static const float scale_factor[]={
    524288, 1572864, 3670016, 7864320,
    253952, 516096, 1040384, 2088960
};

static void DPS368_write(uint8_t addr, uint8_t data)
{
    uint8_t d[2];

    d[0]=addr;
    d[1]=data;
    DPS368_I2C_WriteNByte(DPS368_ADDR, d, 2);
}

static uint8_t DPS368_read(uint8_t addr)
{
    uint8_t r;

    DPS368_I2C_WriteNByte(DPS368_ADDR, &addr, 1);
    DPS368_I2C_ReadNByte(DPS368_ADDR, &r, 1);

    return r;
}

static void DPS368_read_bytes(uint8_t addr, void *buff, uint16_t len)
{
    DPS368_I2C_WriteNByte(DPS368_ADDR, &addr, 1);
    DPS368_I2C_ReadNByte(DPS368_ADDR, buff, len);
}

static void DPS368_read_tmp_sens(void)
{
    source=DPS368_read(DPS368_COEF_SRCE);
    source&=0x80;
}

static void DPS368_get_comp(int32_t *val, uint8_t len)
{
    if(*val&(UINT32_C(1)<<(len-1)))
    {
        *val-=UINT32_C(1)<<len;
    }
}

static void DPS368_read_coefs(void)
{
    uint8_t coefs[DPS368_COEF_SIZE];

    DPS368_read_bytes(DPS368_COEF, coefs, DPS368_COEF_SIZE);

    c0=((uint32_t) coefs[0]<<4)|(((uint32_t) coefs[1]>>4) & 0x0f);
    DPS368_get_comp(&c0, 12);

    c1=(((uint32_t) coefs[1] & 0x0f)<<8)|(uint32_t) coefs[2];
    DPS368_get_comp(&c1, 12);

    c00=((uint32_t) coefs[3]<<12)|((uint32_t) coefs[4]<<4)|(((uint32_t) coefs[5]>>4) & 0x0f);
    DPS368_get_comp(&c00, 20);

    c10=(((uint32_t) coefs[5] & 0x0f)<<16)|((uint32_t) coefs[6]<<8)|(uint32_t) coefs[7];
    DPS368_get_comp(&c10, 20);

    c01=((uint32_t) coefs[8]<<8)|(uint32_t) coefs[9];
    DPS368_get_comp(&c01, 16);

    c11=((uint32_t) coefs[10]<<8)|(uint32_t) coefs[11];
    DPS368_get_comp(&c11, 16);

    c20=((uint32_t) coefs[12]<<8)|(uint32_t) coefs[13];
    DPS368_get_comp(&c20, 16);

    c21=((uint32_t) coefs[14]<<8)|(uint32_t) coefs[15];
    DPS368_get_comp(&c21, 16);

    c30=((uint32_t) coefs[16]<<8)|(uint32_t) coefs[17];
    DPS368_get_comp(&c30, 16);
}

void DPS368_set_opmode(dps368_opmode_t mode)
{
    DPS368_write(DPS368_MEAS_CFG, mode);
}

void DPS368_config_tmp(dps368_meas_rate_t mr, dps368_samp_rate_t sr)
{
    DPS368_write(DPS368_TMP_CFG, source|mr|sr);
    sr_tmp=sr;
}

void DPS368_config_prs(dps368_meas_rate_t mr, dps368_samp_rate_t sr)
{
    DPS368_write(DPS368_PRS_CFG, mr|sr);
    sr_prs=sr;
}

void DPS368_config_int(uint8_t int_source)
{
    uint8_t reg=0;

    if(sr_tmp>=DPS368_SAMP_RATE_16)
        reg|=(1<<3);

    if(sr_prs>=DPS368_SAMP_RATE_16)
        reg|=(1<<2);

    reg|=int_source;
    DPS368_write(DPS368_CFG_REG, reg);
}

void DPS368_clear_intflgs(void)
{
    DPS368_read(DPS368_INT_STS);
}

void DPS368_get_result(int32_t *tmp, int32_t *prs)
{
    uint8_t res[DPS368_RES_SIZE*2];
    int32_t t_raw, p_raw;
    float t_raw_sc, p_raw_sc, tp;

    DPS368_read_bytes(0x00, res, DPS368_RES_SIZE*2);

    p_raw=((uint32_t) res[0]<<16)|((uint32_t) res[1]<<8)|((uint32_t) res[2]);
    DPS368_get_comp(&p_raw, 24);
    t_raw=((uint32_t) res[3]<<16)|((uint32_t) res[4]<<8)|((uint32_t) res[5]);
    DPS368_get_comp(&t_raw, 24);

    t_raw_sc=(float)t_raw/scale_factor[sr_tmp];
    tp=((float)c0*0.5f+(float)c1*t_raw_sc) * 100.0f;
    *tmp=(int32_t)tp;

    p_raw_sc=(float)p_raw/scale_factor[sr_prs];
    tp=(float)c00+p_raw_sc*((float)c10+p_raw_sc*((float)c20+p_raw_sc*(float)c30))
            +t_raw_sc*(float)c01+t_raw_sc*p_raw_sc*((float)c11+p_raw_sc*(float)c21);
    *prs=(int32_t)tp;
}

bool DPS368_Init(void)
{
    DPS368_I2C_Open();

    if(DPS368_I2C_WriteNByte(DPS368_ADDR, NULL, 0))
    {
        DPS368_read_tmp_sens();
        DPS368_read_coefs();
        DPS368_Config();

        return 1;
    }

    return 0;
}

void DPS368_Deinit(void)
{
    DPS368_I2C_Close();
}