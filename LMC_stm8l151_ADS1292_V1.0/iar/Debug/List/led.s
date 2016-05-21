///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\devices\led.c        /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\devices\led.c -e     /
//                    -On --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o D:\workspace\STM8\stm8l151_ADS12 /
//                    92\iar\Debug\Obj\ --dlib_config                         /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\ -I   /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\..\main\ -I      /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\..\fwlib\inc\    /
//                    -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\devices\   /
//                    -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\hardware\  /
//                    --vregs 16                                              /
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\led.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME led

        EXTERN ?b0
        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits

        PUBLIC LED_Init

// D:\workspace\STM8\stm8l151_ADS1292\devices\led.c
//    1 #include "led.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void LED_Init(void)
//    4 {
//    5   GPIO_Init( LED_BLUE_PORT, LED_BLUE_PIN, GPIO_Mode_Out_PP_High_Fast);
LED_Init:
        MOV       S:?b0, #0xf0
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//    6   
//    7   LED_BLUE_OFF;
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//    8 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//    9 
//   10 
// 
// 21 bytes in section .near_func.text
// 
// 21 bytes of CODE memory
//
//Errors: none
//Warnings: none
