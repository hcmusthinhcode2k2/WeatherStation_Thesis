#ifndef BUTTONS_H
#define BUTTONS_H

#include "Common/LibDef.h"
#include "Project_Cfg.h"

typedef enum {
    NOT_PRESS = 0,
    SINGLE_PRESS,
    NEXT_PRESS,
    DOUBLE_PRESS,
    HOLD_PRESS,
    WAIT_RELEASE
} bt_stt_t;

typedef struct {
    bt_stt_t DoNext;
    uint32_t Begin;
    void (*SinglePressCallback)(void);
    void (*DoublePressCallback)(void);
    void (*HoldPressCallback)(void);
} bt_cxt_t;

extern bt_cxt_t ModeBtCxt;

#define BUTTON_Init(pBtCxt, pCbSF, pCbDF, pCbHF) do{pBtCxt.DoNext=NOT_PRESS; \
        pBtCxt.SinglePressCallback=pCbSF; pBtCxt.DoublePressCallback=pCbDF;  \
        pBtCxt.HoldPressCallback=pCbHF;}while(0)

bt_stt_t BUTTON_GetState(bt_cxt_t *pBtCxt, bool preInput);

#ifndef SINGLE_PRESS_INTERVAL
#define SINGLE_PRESS_INTERVAL   30
#endif

#ifndef HOLD_PRESS_INTERVAL
#define HOLD_PRESS_INTERVAL     2000
#endif

#ifndef BUTTON_RELEASE_INTERVAL
#define BUTTON_RELEASE_INTERVAL 150
#endif

#ifdef BT_N_GetValue
#define USE_DEFAULT_BUTTON
#define MOD_Button_GetState()                   BUTTON_GetState(&ModeBtCxt, BT_N_GetValue())
#ifndef DISABLE_LIBRARY_WARNING
#warning "Input of MOD_Button_GetState() function is BT_N_GetValue()"
#endif
#else
#define MOD_Button_GetState(input)              BUTTON_GetState(&ModeBtCxt, input)
#endif

#define MOD_Button_SetSinglePress_Event(pCbSF)  ModeBtCxt.SinglePressCallback=pCbSF
#define MOD_Button_SetDoublePress_Event(pCbDF)  ModeBtCxt.DoublePressCallback=pCbDF
#define MOD_Button_SetHoldPress_Event(pCbHF)    ModeBtCxt.HoldPressCallback=pCbHF

#endif