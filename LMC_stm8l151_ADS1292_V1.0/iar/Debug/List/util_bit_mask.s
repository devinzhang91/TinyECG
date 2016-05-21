///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            10/Jan/2016  16:00:46 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l152_LCM\utility\util_bit_mask.c  /
//    Command line =  D:\workspace\STM8\stm8l152_LCM\utility\util_bit_mask.c  /
//                    -e -Ohs --no_cross_call --debug --code_model small      /
//                    --data_model medium -o D:\workspace\STM8\stm8l152_LCM\i /
//                    ar\Debug\Obj\ --dlib_config                             /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l152_LCM\iar\Debug\List\ -I       /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\main\ -I          /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\fwlib\inc\ -I     /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\periph\ -I        /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\utility\ --vregs  /
//                    16                                                      /
//    List file    =  D:\workspace\STM8\stm8l152_LCM\iar\Debug\List\util_bit_ /
//                    mask.s                                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME util_bit_mask

        PUBLIC BIT16_MASK_TAB
        PUBLIC BIT32_MASK_TAB
        PUBLIC BIT8_MASK_TAB

// D:\workspace\STM8\stm8l152_LCM\utility\util_bit_mask.c
//    1 #include "util_bit_mask.h"
//    2 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//    3 const uint8  BIT8_MASK_TAB[8]=
BIT8_MASK_TAB:
        DC8 1, 2, 4, 8, 16, 32, 64, 128
//    4 {  
//    5    [0]=1UL<<0,
//    6    [1]=1UL<<1,
//    7    [2]=1UL<<2,
//    8    [3]=1UL<<3,
//    9    [4]=1UL<<4,
//   10    [5]=1UL<<5,
//   11    [6]=1UL<<6,
//   12    [7]=1UL<<7,
//   13 };
//   14 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   15 const uint16  BIT16_MASK_TAB[16]=
BIT16_MASK_TAB:
        DC16 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192
        DC16 16384, 32768
//   16 {  
//   17    [0]=1UL<<0,
//   18    [1]=1UL<<1,
//   19    [2]=1UL<<2,
//   20    [3]=1UL<<3,
//   21    [4]=1UL<<4,
//   22    [5]=1UL<<5,
//   23    [6]=1UL<<6,
//   24    [7]=1UL<<7,
//   25    
//   26    [8]=1UL<<8,
//   27    [9]=1UL<<9,
//   28    [10]=1UL<<10,
//   29    [11]=1UL<<11,
//   30    [12]=1UL<<12,
//   31    [13]=1UL<<13,
//   32    [14]=1UL<<14,
//   33    [15]=1UL<<15,
//   34 };
//   35 
//   36 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   37 const uint32  BIT32_MASK_TAB[32]=
BIT32_MASK_TAB:
        DC32 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192
        DC32 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152
        DC32 4194304, 8388608, 16777216, 33554432, 67108864, 134217728
        DC32 268435456, 536870912, 1073741824, 2147483648

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   38 {  
//   39    [0]=1UL<<0,
//   40    [1]=1UL<<1,
//   41    [2]=1UL<<2,
//   42    [3]=1UL<<3,
//   43    [4]=1UL<<4,
//   44    [5]=1UL<<5,
//   45    [6]=1UL<<6,
//   46    [7]=1UL<<7,
//   47    
//   48    [8]=1UL<<8,
//   49    [9]=1UL<<9,
//   50    [10]=1UL<<10,
//   51    [11]=1UL<<11,
//   52    [12]=1UL<<12,
//   53    [13]=1UL<<13,
//   54    [14]=1UL<<14,
//   55    [15]=1UL<<15,
//   56    
//   57    [16]=1UL<<16,
//   58    [17]=1UL<<17,
//   59    [18]=1UL<<18,
//   60    [19]=1UL<<19,
//   61    [20]=1UL<<20,
//   62    [21]=1UL<<21,
//   63    [22]=1UL<<22,
//   64    [23]=1UL<<23,
//   65    
//   66    [24]=1UL<<24,
//   67    [25]=1UL<<25,
//   68    [26]=1UL<<26,
//   69    [27]=1UL<<27,
//   70    [28]=1UL<<28,
//   71    [29]=1UL<<29,
//   72    [30]=1UL<<30,
//   73    [31]=1UL<<31,  
//   74 };
// 
// 168 bytes in section .near.rodata
// 
// 168 bytes of CONST memory
//
//Errors: none
//Warnings: none
