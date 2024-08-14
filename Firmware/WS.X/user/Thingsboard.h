#ifndef THINGSBOARD_H
#define	THINGSBOARD_H

#include <stdint.h>
#include <stdbool.h>

typedef enum {
    TB_OK = 0,
    TB_BUSY,
    TB_ERROR = (-1)
} tb_stt_t;

typedef struct {
    float temperature;
    int humidity;
    int pressure;
    float windSpeed;
    int dustDensity;
    float rainRate;
    int windDirection;
} sensordata_t;
/* ********************************************* Defined in thingsboard_cfg.c */
void Thingsboard_getdata(sensordata_t *pData);
/* ********************************************************************** API */
bool Thingsboard_init(void);
tb_stt_t Thingsboard_task(bool syncRdy);

#endif	/* THINGSBOARD_H */

