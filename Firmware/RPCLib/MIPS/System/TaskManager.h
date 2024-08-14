#ifndef TASKMANAGER_H
#define TASKMANAGER_H

#include "Common/LibDef.h"

typedef void (*fnc_t)(void *);

typedef struct TASK_T {
    bool Lock; // do not use
    fnc_t pFnc; // do not use
    void *pMsg; // message from another task
    void *pLabel; // do not use
    struct TASK_T *pNext; // do not use
} task_t;

extern task_t *pCurrTask;
extern uint8_t TaskCount;

#define __make_sem_name(x)                  __sem_ ## x
#define __make_task_cxt(x)                  __TaskCxt_ ## x
#define __make_tick_cxt(x)                  __TickCxt_ ## x
#define __make_tick_cxt1(x)                 __make_tick_cxt(x)
#define __make_label_name2(x)               __LINE ## x
#define __make_label_name1(x)               __make_label_name2(x)
#define __make_label_name()                 __make_label_name1(__LINE__)

#define __task_lock()                       (pTaskCxt->Lock=1)

#define __task_unlock()                     (pTaskCxt->Lock=0)

#define __task_begin()                      do{__task_lock(); if(pTaskCxt->pLabel!=NULL) \
                                            goto *pTaskCxt->pLabel;}while(0)

#define Task_Wait(x)                        do{pTaskCxt->pLabel=&&__make_label_name(); \
                                            __make_label_name(): if(!(x)){__task_unlock(); \
                                            return;}}while(0)

#define Task_Delay(x, t)                    Task_Wait(Tick_Timer_Is_Over_Ms(__make_tick_cxt(x), t))

#define Task_Done()                         ;}do{__task_unlock(); pTaskCxt->pLabel=NULL;}while(0)

#define Task_Break()                        do{__task_unlock(); pTaskCxt->pLabel=NULL; return;}while(0)

#define TaskManager()                       if(TaskCount>0){if(pCurrTask->Lock==0) \
                                            {pCurrTask->pFnc(pCurrTask);} \
                                            pCurrTask=pCurrTask->pNext;}

#define TaskManager_Count()                 TaskCount
#define TaskManager_End_AllTasks()          TaskManager_Init()

#define TaskManager_End_Task(x)             TaskManager_Remove_Task(&__make_task_cxt(x))

#define TaskManager_Create_NewSimpleTask(x) do{__make_task_cxt(x).pFnc=(fnc_t) x; \
                                            TaskManager_Add_Task(&__make_task_cxt(x)); \
                                            }while(0)

#define TaskManager_Create_NewDelayTask(x)  do{__make_task_cxt(x).pFnc=(fnc_t) x; \
                                            Tick_Timer_Reset(__make_tick_cxt(x)); \
                                            TaskManager_Add_Task(&__make_task_cxt(x)); \
                                            }while(0)

#define new_simple_task_t(x)                task_t __make_task_cxt(x)={0, NULL, NULL, NULL}; \
                                            void x(void *pThisCxt){task_t *pTaskCxt=(task_t*)pThisCxt; \
                                            __task_begin();

#define new_delay_task_t(x)                 task_t __make_task_cxt(x)={0, NULL, NULL, NULL}; \
                                            static tick_timer_t __make_tick_cxt(x); \
                                            void x(void *pThisCxt){task_t *pTaskCxt=(task_t*)pThisCxt; \
                                            __task_begin();

#define get_task_arg()                      ((task_t*)pThisCxt)
#define get_task_message()                  (pTaskCxt->pMsg)

#define sem_declare_t(st)                   bool __make_sem_name(st)
#define sem_declare(st)                     bool __make_sem_name(st)=1

#define mutex_lock(mt, fnc)                 do{Task_Wait(__make_sem_name(mt)); \
                                            __make_sem_name(mt)=0; (fnc); \
                                            __make_sem_name(mt)=1;}while(0)

#define sem_wait(st, fnc)                   do{while(__make_sem_name(st)==0) \
                                            {TaskManager();} \
                                            __make_sem_name(st)=0; (fnc); \
                                            __make_sem_name(st)=1;}while(0)

public void TaskManager_Init(void);
public bool TaskManager_IsTaskReady(fnc_t pTaskFnc);
public void TaskManager_Add_Task(task_t *pTaskCxt);
public void TaskManager_Remove_Task(task_t *pTaskCxt);
public bool TaskManager_SendMessage(fnc_t pTaskFnc, void *pMsg);

#endif