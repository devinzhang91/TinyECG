#ifndef __IAR_MACRO_H__
#define __IAR_MACRO_H__

#include <intrinsics.h>
#include <stddef.h>

#ifndef _BV
#define _BV(A)  (1U<<(A))
#endif

#ifndef __inline__ 
#define __inline__ inline
#endif

#ifndef __always_inline__
#define __always_inline__  _Pragma("inline=forced") inline
#endif

#ifndef nop
#define nop() __no_operation()
#endif

#define ATTR_CTASK __task
#define ATTR_NAKED __task

#endif
