#include "TaskManager.h"

#define __debug(...) //printf(__VA_ARGS__)

task_t *pCurrTask=NULL; // external variable
uint8_t TaskCount=0; // external variable

public void TaskManager_Add_Task(task_t *pTaskCxt)
{
    if(pTaskCxt->pNext!=NULL) // already in queue
    {
        __debug("\nTask is already in queue\n");
        return;
    }

    pTaskCxt->Lock=0;
    pTaskCxt->pLabel=NULL;

    if(TaskCount>0)
    {
        pTaskCxt->pNext=pCurrTask->pNext; // backup next-context of current task
        pCurrTask->pNext=pTaskCxt;
    }
    else
    {
        pTaskCxt->pNext=pTaskCxt;
        pCurrTask=pTaskCxt;
    }

    TaskCount++;
    __debug("\nTask count %d, new task at %08X\n", TaskCount, pTaskCxt);
}

public void TaskManager_Remove_Task(task_t *pTaskCxt)
{
    uint8_t i=0;

    if(TaskCount==0)
    {
        __debug("\nThere is no any task\n");
        return;
    }

    do
    {
        if(pCurrTask->pNext==pTaskCxt)
        {
            TaskCount--;
            __debug("\nRemove task at %08X. ", pTaskCxt);
            pCurrTask->pNext=pTaskCxt->pNext;
            pTaskCxt->pNext=NULL;
            break;
        }
        else
        {
            i++;
            pCurrTask=pCurrTask->pNext;
        }
    }
    while(i<TaskCount);

    __debug("Task count %d\n", TaskCount);
}

public bool TaskManager_SendMessage(fnc_t pTaskFnc, void *pMsg)
{
    uint8_t i;
    task_t *pTask;
    bool rslt=0;

    __debug("\nStart %08X ", pTaskFnc);
    pTask=pCurrTask;

    for(i=0; i<TaskCount; i++)
    {
        if(pTask->pFnc==pTaskFnc)
        {
            if(pTask->pMsg==NULL)
            {
                rslt=1;
                pTask->pMsg=pMsg;
            }
        }

        pTask=pTask->pNext;
    }

    __debug("End %08X\n", pTaskFnc);

    return rslt; // 1-done, 0-busy
}

public bool TaskManager_IsTaskReady(fnc_t pTaskFnc)
{
    uint8_t i;
    task_t *pTask;

    __debug("\nStart %08X ", pTaskFnc);
    pTask=pCurrTask;

    for(i=0; i<TaskCount; i++)
    {
        if(pTask->pFnc==pTaskFnc)
        {
            __debug("found\n");
            return 1;
        }

        pTask=pTask->pNext;
    }

    __debug("not found\n");

    return 0; // 1-done, 0-busy
}

public void TaskManager_Init(void)
{
    pCurrTask=NULL;
    TaskCount=0;
}