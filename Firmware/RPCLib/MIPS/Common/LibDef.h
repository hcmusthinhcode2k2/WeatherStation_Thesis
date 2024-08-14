#ifndef LIBDEF_H
#define	LIBDEF_H

#if (defined(__PCH__)||defined(__ISNT_CCS__))
#include <xc.h>
#else
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <time.h>

#ifdef __WIN32
#include <windows.h>
#define WIN32_LEAN_AND_MEAN
#include <wincrypt.h>
#endif

/* Application Definitions */
#ifdef public
#undef  public
#define public
#else
#define public
#endif

#ifdef private
#undef  private
#define private static
#else
#define private static
#endif

#ifndef	BYTE
#define	BYTE uint8_t
#endif

#ifndef	WORD
#define	WORD uint16_t
#endif

#ifndef	DWORD
#define	DWORD uint32_t
#endif

#ifndef	QWORD
#define	QWORD uint64_t
#endif

#ifndef ROM
#define ROM const
#endif

#if !defined(__XC8)
#define __attribute_packed__            __attribute__((packed))
#define __attribute_aligned4__          __attribute__((aligned(4)))
#define __attribute_aligned8__          __attribute__((aligned(8)))
#define __attribute_aligned16__         __attribute__((aligned(16)))
#else
#define __attribute_packed__
#define __attribute_aligned4__
#endif

#ifndef rslt_t
typedef int8_t                          rslt_t;
#define	rslt_t                          __int8_t
#endif

typedef struct tm                       tm_t;
typedef const char *far_string_t;

#endif

// Result code
#define PROC_DONE                       0
#define PROC_BUSY                       1
#define PROC_REMAIN                     2
#define PROC_CONT                       3
#define PROC_ERR                        (-1)
#define PROC_DRV_ERR                    (-2)

#define RESULT_DONE                     0
#define RESULT_ACK                      0
#define RESULT_NACK                     1
#define RESULT_BUSY                     2
#define RESULT_REBOOT                   3
#define RESULT_ERR                      (-1)

#ifdef __XC32
#include "sys/attribs.h"
// MIPS memory address convert
#ifndef KVA_TO_PA
#define KVA_TO_PA(v)                    ((_paddr_t)(v)&0x1FFFFFFF)
#endif

#ifndef PA_TO_KVA0
#define PA_TO_KVA0(pa)                  ((void*)((pa)|0x80000000))
#endif
#endif

#define BitTest(x, i)                   ((x>>i)&1)
#define bittest(x, i)                   ((x>>i)&1)
#define bit_test(x, i)                  ((x>>i)&1)

#define BitSet(x, i)                    x=x|(1<<i)
#define bitset(x, i)                    x=x|(1<<i)
#define bit_set(x, i)                   x=x|(1<<i)

#define BitClear(x, i)                  x=x&(~(1<<i))
#define bitclear(x, i)                  x=x&(~(1<<i))
#define bit_clear(x, i)                 x=x&(~(1<<i))

#ifndef bit_is_set
#define bit_is_set(sfr, bit)            (((x>>i)&1)==1)
#endif

#ifndef bit_is_clear
#define bit_is_clear(sfr, bit)          (((x>>i)&1)==0)
#endif

#define BitTest(x, i)                   ((x>>i)&1)
#define BitSet(x, i)                    x=x|(1<<i)
#define BitClear(x, i)                  x=x&(~(1<<i))

#define membersof(a)                    (sizeof(a)/sizeof((a)[0])) // Get the number of elements in an array.
#define indexof(e_p, a)                 (e_p-&(a)[0]) // Get the index of given element in an array.

#define container_of(ptr, type, member) ({const typeof(((type *)0)->member ) *__mptr=(ptr); \
                                        (type *)((char *)__mptr-offsetof(type,member));})

#define DIV_CEIL(n, d)                  (((n)+(d)-1)/(d)) // Integer division that rounds the result up.
#define DIV_ROUND(n, d)                 (((n)+(d/2))/(d)) // Integer division that rounds the result to the closest integer.

#define MIN(a, b)                       (((a)<(b))?(a):(b))
#define MAX(a, b)                       (((a)>(b))?(a):(b))

#define BIT(pos)                        (1<<(pos))
#define BITFIELD_SET(name, value)       (((value)<<name ## _POS)&name ## _MASK)
#define BITFIELD_GET(name, value)       (((value)&name ## _MASK)>>name ## _POS)

#define _convert2(type, pt)             (*((type*)pt))

#define NO_INIT                        __attribute__((section(".no_init")))
#define SECTION(a)                     __attribute__((__section__(a)))

#ifndef   __ASM
    #define __ASM                      __asm__
#endif
#ifndef   __INLINE
    #define __INLINE                   __inline__
#endif
#ifndef   __STATIC_INLINE
    #define __STATIC_INLINE            static __inline__
#endif
#ifndef   __STATIC_FORCEINLINE
    #define __STATIC_FORCEINLINE       __attribute__((always_inline)) static __inline__
#endif
#ifndef   __NO_RETURN
    #define __NO_RETURN                __attribute__((__noreturn__))
#endif
#ifndef   __USED
    #define __USED                     __attribute__((used))
#endif
#ifndef   __WEAK
    #define __WEAK                     __attribute__((weak))
#endif
#ifndef   __PACKED
    #define __PACKED                   __attribute__((packed, aligned(1)))
#endif
#ifndef   __PACKED_STRUCT
    #define __PACKED_STRUCT            struct __attribute__((packed, aligned(1)))
#endif
#ifndef   __PACKED_UNION
    #define __PACKED_UNION             union __attribute__((packed, aligned(1)))
#endif
#ifndef   __COHERENT
    #define __COHERENT                 __attribute__((coherent))
#endif
#ifndef   __ALIGNED
    #define __ALIGNED(x)               __attribute__((aligned(x)))
#endif
#ifndef   __RESTRICT
    #define __RESTRICT                 __restrict__
#endif

#define CACHE_LINE_SIZE                (4u)
#define CACHE_ALIGN

#define CACHE_ALIGNED_SIZE_GET(size)     (size + ((size % CACHE_LINE_SIZE)? (CACHE_LINE_SIZE - (size % CACHE_LINE_SIZE)) : 0))

#ifndef FORMAT_ATTRIBUTE
   #define FORMAT_ATTRIBUTE(archetype, string_index, first_to_check)  __attribute__ ((format (archetype, string_index, first_to_check)))
#endif

#ifndef SYS_ASSERT
#define SYS_ASSERT(test,message)
#endif

#define MAIN_RETURN int
#define MAIN_RETURN_CODE(c)     ((MAIN_RETURN)(c))

typedef enum {
    MAIN_RETURN_FAILURE = -1,
    MAIN_RETURN_SUCCESS = 0
} MAIN_RETURN_CODES;

#define SYS_VersionGet( void ) SYS_VERSION
#define SYS_VersionStrGet( void )   SYS_VERSION_STR

typedef unsigned short int SYS_MODULE_INDEX;
typedef uintptr_t SYS_MODULE_OBJ;

#define SYS_MODULE_OBJ_INVALID      ((SYS_MODULE_OBJ) -1 )
#define SYS_MODULE_OBJ_STATIC       ((SYS_MODULE_OBJ) 0 )

typedef enum {
    SYS_STATUS_ERROR_EXTENDED = -10,
    /*An unspecified error has occurred.*/
    SYS_STATUS_ERROR = -1,
    // The module has not yet been initialized
    SYS_STATUS_UNINITIALIZED = 0,
    // An operation is currently in progress
    SYS_STATUS_BUSY = 1,
    // Any previous operations have succeeded and the module is ready for
    // additional operations
    SYS_STATUS_READY = 2,
    // Indicates that the module is in a non-system defined ready/run state.
    // The caller must call the extended status routine for the module in
    // question to identify the state.
    SYS_STATUS_READY_EXTENDED = 10
} SYS_STATUS;

typedef union {
    uint8_t value;

    struct {
        // Module-definable field, module-specific usage
        uint8_t reserved : 4;
    } sys;

} SYS_MODULE_INIT;

typedef SYS_MODULE_OBJ(* SYS_MODULE_INITIALIZE_ROUTINE) (const SYS_MODULE_INDEX index,
        const SYS_MODULE_INIT * const init);

typedef void (* SYS_MODULE_REINITIALIZE_ROUTINE) (SYS_MODULE_OBJ object,
        const SYS_MODULE_INIT * const init);

typedef void (* SYS_MODULE_DEINITIALIZE_ROUTINE) (SYS_MODULE_OBJ object);

typedef SYS_STATUS(* SYS_MODULE_STATUS_ROUTINE) (SYS_MODULE_OBJ object);

typedef void (* SYS_MODULE_TASKS_ROUTINE) (SYS_MODULE_OBJ object);

typedef enum
{
    /* Read */
    DRV_IO_INTENT_READ               /*DOM-IGNORE-BEGIN*/ = 1 << 0 /* DOM-IGNORE-END*/,
    /* Write */
    DRV_IO_INTENT_WRITE              /*DOM-IGNORE-BEGIN*/ = 1 << 1 /* DOM-IGNORE-END*/,
    /* Read and Write*/
    DRV_IO_INTENT_READWRITE          /*DOM-IGNORE-BEGIN*/ \
            = DRV_IO_INTENT_READ|DRV_IO_INTENT_WRITE /* DOM-IGNORE-END*/,
    /* The driver will block and will return when the operation is complete */
    DRV_IO_INTENT_BLOCKING           /*DOM-IGNORE-BEGIN*/ = 0 << 2 /* DOM-IGNORE-END*/,
    /* The driver will return immediately */
    DRV_IO_INTENT_NONBLOCKING        /*DOM-IGNORE-BEGIN*/ = 1 << 2 /* DOM-IGNORE-END*/,
    /* The driver will support only one client at a time */
    DRV_IO_INTENT_EXCLUSIVE          /*DOM-IGNORE-BEGIN*/ = 1 << 3 /* DOM-IGNORE-END*/,
    /* The driver will support multiple clients at a time */
    DRV_IO_INTENT_SHARED             /*DOM-IGNORE-BEGIN*/ = 0 << 3 /* DOM-IGNORE-END*/
} DRV_IO_INTENT;

typedef enum
{
    /* Indicates that a driver-specific error has occurred. */
    DRV_CLIENT_STATUS_ERROR_EXTENDED   = -10,
    /* An unspecified error has occurred.*/
    DRV_CLIENT_STATUS_ERROR            =  -1,
    /* The driver is closed, no operations for this client are ongoing,
    and/or the given handle is invalid. */
    DRV_CLIENT_STATUS_CLOSED           =   0,
    /* The driver is currently busy and cannot start additional operations. */
    DRV_CLIENT_STATUS_BUSY             =   1,
    /* The module is running and ready for additional operations */
    DRV_CLIENT_STATUS_READY            =   2,
    /* Indicates that the module is in a driver-specific ready/run state. */
    DRV_CLIENT_STATUS_READY_EXTENDED   =  10
} DRV_CLIENT_STATUS;

#define DRV_IO_ISBLOCKING(intent)          (intent & DRV_IO_INTENT_BLOCKING)
#define DRV_IO_ISNONBLOCKING(intent)       (intent & DRV_IO_INTENT_NONBLOCKING )
#define DRV_IO_ISEXCLUSIVE(intent)       (intent & DRV_IO_INTENT_EXCLUSIVE)

typedef enum
{
    // Operation does not apply to any buffer
    DRV_IO_BUFFER_TYPE_NONE      = 0x00,
    // Operation applies to read buffer
    DRV_IO_BUFFER_TYPE_READ      = 0x01,
    // Operation applies to write buffer
    DRV_IO_BUFFER_TYPE_WRITE     = 0x02,
    // Operation applies to both read and write buffers
    DRV_IO_BUFFER_TYPE_RW        = DRV_IO_BUFFER_TYPE_READ|DRV_IO_BUFFER_TYPE_WRITE
} DRV_IO_BUFFER_TYPES;

typedef uintptr_t DRV_HANDLE;

#define DRV_HANDLE_INVALID  (((DRV_HANDLE) -1))

#define __make_str(str) #str
#define __make_xstr(str) __make_str(str)

typedef void (*simple_fnc_t) (void);

#endif