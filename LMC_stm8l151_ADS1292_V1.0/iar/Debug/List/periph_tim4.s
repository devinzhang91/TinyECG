///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  21:16:37 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\periph\periph_tim4.c            /
//    Command line =  E:\HWT\io\stm8l152_demo\periph\periph_tim4.c -e -Ohs    /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ -I            /
//                    E:\HWT\io\stm8l152_demo\iar\..\periph\ -I               /
//                    E:\HWT\io\stm8l152_demo\iar\..\utility\ --vregs 16      /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\periph_tim4.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME periph_tim4

        EXTERN ?b0
        EXTERN ?b3
        EXTERN ?srl32_l0_l0_db
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN CLK_GetClockFreq
        EXTERN TIM4_ARRPreloadConfig
        EXTERN TIM4_Cmd
        EXTERN TIM4_ITConfig
        EXTERN TIM4_TimeBaseInit

        PUBLIC ISR_TIM4_vect
        PUBLIC TIM4_Init
        PUBLIC _interrupt_27
        PUBLIC tim4_ticks

// E:\HWT\io\stm8l152_demo\periph\periph_tim4.c
//    1 #include "stm8l15x.h"
//    2 #include "io_stm8l15x.h"
//    3 #include "iar_interrupt.h"
//    4 #include "uni_int.h"
//    5 #include "periph_tim4.h"
//    6 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    7 volatile uint16 tim4_ticks;
tim4_ticks:
        DS8 2
//    8 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void TIM4_Init(void)
//   10 {      
//   11    TIM4_ARRPreloadConfig(1);         //使能自动重载影子寄存器
TIM4_Init:
        LD        A, #0x1
        CALL      L:TIM4_ARRPreloadConfig
//   12    TIM4_TimeBaseInit(TIM4_Prescaler_64,CLK_GetClockFreq()/64/1000-1);  //TIM4 64分频，中断频率1000Hz  
        CALL      L:CLK_GetClockFreq
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x6
        CODE
        LDW       X, #0x3e8
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?udiv32_l0_l0_l1
        LD        A, S:?b3
        ADD       A, #0xff
        LD        S:?b0, A
        LD        A, #0x6
        CALL      L:TIM4_TimeBaseInit
//   13    TIM4_Cmd(1);                      //启动TIM4定时器                  
        LD        A, #0x1
        CALL      L:TIM4_Cmd
//   14    TIM4_ITConfig(TIM4_IT_Update,1);  //打开TIM4溢出中断       
        LD        A, #0x1
        LD        S:?b0, A
        JP        L:TIM4_ITConfig
//   15 }
//   16 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   17 STM8_ISR(TIM4_vect)
//   18 {
//   19    __disable_interrupt();
ISR_TIM4_vect:
_interrupt_27:
        SIM
//   20    TIM4->SR1 &=  ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
//   21    
//   22    tim4_ticks++;
        LDW       X, L:tim4_ticks
        INCW      X
        LDW       L:tim4_ticks, X
//   23 }
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//  2 bytes in section .near.bss
// 59 bytes in section .near_func.text
// 
// 59 bytes of CODE memory
//  2 bytes of DATA memory
//
//Errors: none
//Warnings: none
