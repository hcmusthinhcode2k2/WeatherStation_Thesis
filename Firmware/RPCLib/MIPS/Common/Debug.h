#ifndef TINYPRINTF_H
#define TINYPRINTF_H

#include "LibDef.h"
#include "Project_Cfg.h"
#include "System/TickTimer.h"
#include "System/TaskManager.h"

#define HEX_HEADER 0x80

typedef struct {
    bool (*IsTxReady)(void);
    bool (*IsTxDone)(void);
    void (*Write)(uint8_t);
} dbg_port_cxt_t;

void debug_port_write(uint8_t c); // Defined in TynyPrintf_Cfg.h
void debug_systime_stamp(void);
void debug(const char *str, bool tsEn);
/* debug_hex(b, dgcount): display b as hex format 0xABC... or ABC...
 * b: value to be displayed
 * dgcount: number of digit
 * dgcount option (dgcount|0x80): display header 0x
 */
void debug_hex(uint32_t b, uint8_t dgcount);
void debug_hexs(uint8_t *pD, int len);
void debug_hexf(const uint8_t *pSource, int Size, int NumOfCol);
void debug_i32(int32_t b);
void debug_u32(uint32_t b);
void debug_data(uint8_t *pD, int len);
void debug_time(tm_t *time);
void debug_date(tm_t *time);
/* ********************************************************************* APIs */
void dbsi(const char *str, int32_t x, bool tsEn);
void dbsu(const char *str, uint32_t x, bool tsEn);
void dbsh(const char *str, uint32_t x, bool tsEn);
void dbsc(const char *str, char c, bool tsEn);
void dbss(const char *str1, const char *str2, bool tsEn);
void dbstime(const char *str, tm_t tcxt, bool tsEn);
void dbsdate(const char *str, tm_t tcxt, bool tsEn);
void dbsdata(const char *str, uint8_t *pd, int len, bool tsEn);

extern sem_declare_t(debug);

#define task_debug(fnc)             mutex_lock(debug, fnc)
#define nontask_debug(fnc)          sem_wait(debug, fnc)
// Debug for non-functions
#define __dbc(c)                    sem_wait(debug, debug_port_write(c))
#define __dbs(str)                  sem_wait(debug, debug((const char *)(str), 0))
#define __dbi(x)                    sem_wait(debug, debug_i32(x))
#define __dbu(x)                    sem_wait(debug, debug_u32(x))
#define __dbh(x, dg)                sem_wait(debug, debug_hex(x, 0x80|dg))
#define __dbh2(x)                   sem_wait(debug, debug_hex(x, 2))
#define __dbhs(str, len)            sem_wait(debug, debug_hexs(str, len))
#define __dbdata(str, len)          sem_wait(debug, debug_data(str, len))
// Debug for task-functions
#define __dbc_t(c)                  mutex_lock(debug, debug_port_write(c))
#define __dbs_t(str)                mutex_lock(debug, debug((const char *)(str), 0))
#define __dbi_t(x)                  mutex_lock(debug, debug_i32(x))
#define __dbu_t(x)                  mutex_lock(debug, debug_u32(x))
#define __dbh_t(x, dg)              mutex_lock(debug, debug_hex(x, 0x80|dg))
#define __dbh2_t(x)                 mutex_lock(debug, debug_hex(x, 2))
#define __dbhs_t(str, len)          mutex_lock(debug, debug_hexs(str, len))
#define __dbdata_t(str, len)        mutex_lock(debug, debug_data(str, len))
// Debug for non-functions
#define __dbsi(str, x)              sem_wait(debug, dbsi((const char *)str, x, 0))
#define __dbsu(str, x)              sem_wait(debug, dbsu((const char *)str, x, 0))
#define __dbsh(str, x)              sem_wait(debug, dbsh((const char *)str, x, 0))
#define __dbsc(str, c)              sem_wait(debug, dbsc((const char *)str, c, 0))
#define __dbss(str1, str2)          sem_wait(debug, dbss((const char *)str1, (const char *)str2, 0))
#define __dbstime(str, tcxt)        sem_wait(debug, dbstime((const char *)str, tcxt, 0))
#define __dbsdate(str, tcxt)        sem_wait(debug, dbsdate((const char *)str, tcxt, 0))
#define __dbsdata(str, pd, len)     sem_wait(debug, dbsdata((const char *)str, pd, len, 0))
// Debug for task-functions
#define __dbsi_t(str, x)            mutex_lock(debug, dbsi((const char *)str, x, 0))
#define __dbsu_t(str, x)            mutex_lock(debug, dbsu((const char *)str, x, 0))
#define __dbsh_t(str, x)            mutex_lock(debug, dbsh((const char *)str, x, 0))
#define __dbsc_t(str, c)            mutex_lock(debug, dbsc((const char *)str, c, 0))
#define __dbss_t(str1, str2)        mutex_lock(debug, dbss((const char *)str1, (const char *)str2, 0))
#define __dbstime_t(str, tcxt)      mutex_lock(debug, dbstime((const char *)str, tcxt, 0))
#define __dbsdate_t(str, tcxt)      mutex_lock(debug, dbsdate((const char *)str, tcxt, 0))
#define __dbsdata_t(str, pd, len)   mutex_lock(debug, dbsdata((const char *)str, pd, len, 0))

// Debug for non-functions 
#define __tsdbs(str)                sem_wait(debug, debug((const char *)(str), 1))
#define __tsdbsi(str, x)            sem_wait(debug, dbsi((const char *)str, x, 1))
#define __tsdbsu(str, x)            sem_wait(debug, dbsu((const char *)str, x, 1))
#define __tsdbsh(str, x)            sem_wait(debug, dbsh((const char *)str, x, 1))
#define __tsdbsc(str, c)            sem_wait(debug, dbsc((const char *)str, c, 1))
#define __tsdbss(str1, str2)        sem_wait(debug, dbss((const char *)str1, (const char *)str2, 1))
#define __tsdbstime(str, tcxt)      sem_wait(debug, dbstime((const char *)str, tcxt, 1))
#define __tsdbsdate(str, tcxt)      sem_wait(debug, dbsdate((const char *)str, tcxt, 1))
#define __tsdbsdata(str, pd, len)   sem_wait(debug, dbsdata((const char *)str, pd, len, 1))
// Debug for task-functions
#define __tsdbs_t(str)              mutex_lock(debug, debug((const char *)(str), 1))
#define __tsdbsi_t(str, x)          mutex_lock(debug, dbsi((const char *)str, x, 1))
#define __tsdbsu_t(str, x)          mutex_lock(debug, dbsu((const char *)str, x, 1))
#define __tsdbsh_t(str, x)          mutex_lock(debug, dbsh((const char *)str, x, 1))
#define __tsdbsc_t(str, c)          mutex_lock(debug, dbsc((const char *)str, c, 1))
#define __tsdbss_t(str1, str2)      mutex_lock(debug, dbss((const char *)str1, (const char *)str2, 1))
#define __tsdbstime_t(str, tcxt)    mutex_lock(debug, dbstime((const char *)str, tcxt, 1))
#define __tsdbsdate_t(str, tcxt)    mutex_lock(debug, dbsdate((const char *)str, tcxt, 1))
#define __tsdbsdata_t(str, pd, len) mutex_lock(debug, dbsdata((const char *)str, pd, len, 1))

#endif