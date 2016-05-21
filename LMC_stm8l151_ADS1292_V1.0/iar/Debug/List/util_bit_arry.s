///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            10/Jan/2016  16:00:46 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l152_LCM\utility\util_bit_arry.c  /
//    Command line =  D:\workspace\STM8\stm8l152_LCM\utility\util_bit_arry.c  /
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
//                    arry.s                                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME util_bit_arry

        EXTERN ?b2
        EXTERN ?w0
        EXTERN BIT8_MASK_TAB

        PUBLIC bit_arry_clr_bit
        PUBLIC bit_arry_set_bit

// D:\workspace\STM8\stm8l152_LCM\utility\util_bit_arry.c
//    1 #include "util_bit_arry.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void bit_arry_set_bit(uint8 *arry,uint8 i)
//    4 {
bit_arry_set_bit:
        LD        S:?b2, A
//    5   arry[BITARRY_BYTE_INDEX(i)] |=  BIT8_MASK_TAB[BITARRY_BIT_INDEX(i)]; 
        SRL       A
        SRL       A
        SRL       A
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        LD        A, S:?b2
        AND       A, #0x7
        CLRW      X
        LD        XL, A
        LD        A, (L:BIT8_MASK_TAB,X)
        OR        A, (Y)
        LD        (Y), A
//    6 }
        RET
//    7 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    8 void bit_arry_clr_bit(uint8 *arry,uint8 i)
//    9 {
bit_arry_clr_bit:
        LD        S:?b2, A
//   10   arry[BITARRY_BYTE_INDEX(i)] &= ~BIT8_MASK_TAB[BITARRY_BIT_INDEX(i)]; 
        SRL       A
        SRL       A
        SRL       A
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, X
        ADDW      Y, S:?w0
        LD        A, S:?b2
        AND       A, #0x7
        CLRW      X
        LD        XL, A
        LD        A, (L:BIT8_MASK_TAB,X)
        CPL       A
        AND       A, (Y)
        LD        (Y), A
//   11 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 59 bytes in section .near_func.text
// 
// 59 bytes of CODE memory
//
//Errors: none
//Warnings: none
