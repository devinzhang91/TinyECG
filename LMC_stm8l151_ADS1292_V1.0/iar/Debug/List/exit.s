///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\exit.c      /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\exit.c -e   /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\exit. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME exit

        EXTERN ?b0
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_SetPinSensitivity
        EXTERN GPIO_Init
        EXTERN delay_ms

        PUBLIC EXIT_Button_Init
        PUBLIC EXTI1_IRQHandler
        PUBLIC _interrupt_11

// D:\workspace\STM8\stm8l151_ADS1292\hardware\exit.c
//    1 #include "exit.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void EXIT_Button_Init(void)
//    4 {
//    5   GPIO_Init( EXIT_BTN_PORT, EXIT_BTN_PIN, GPIO_Mode_In_FL_IT);
EXIT_Button_Init:
        MOV       S:?b0, #0x20
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//    6   EXTI_SetPinSensitivity(EXIT_BTN_EXIT,EXTI_Trigger_Falling_Low);
        CLR       S:?b0
        LD        A, #0x2
        CALL      L:EXTI_SetPinSensitivity
//    7 }
        RET
//    8 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
//   10 {
EXTI1_IRQHandler:
_interrupt_11:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//   11   disableInterrupts();
        sim
//   12   delay_ms(100);
        LDW       X, #0x64
        CALL      L:delay_ms
//   13   EXTI_ClearITPendingBit(EXTI_IT_Pin1); //清除中断标志位
        LDW       X, #0x2
        CALL      L:EXTI_ClearITPendingBit
//   14   enableInterrupts();
        rim
//   15 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   16 
// 
// 53 bytes in section .near_func.text
// 
// 53 bytes of CODE memory
//
//Errors: none
//Warnings: none
