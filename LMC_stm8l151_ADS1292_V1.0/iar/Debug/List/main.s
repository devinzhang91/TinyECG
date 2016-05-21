///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\main\main.c          /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\main\main.c -e -On   /
//                    --no_cse --no_unroll --no_inline --no_code_motion       /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\main. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN ?w0
        EXTERN ?w1
        EXTERN ADS1292R_Init
        EXTERN CLK_Config
        EXTERN GPIO_ToggleBits
        EXTERN LED_Init
        EXTERN MLX90615_Init
        EXTERN MLX90615_Read_Temp
        EXTERN TIM2_Config
        EXTERN UART_Init
        EXTERN delay_ms

        PUBLIC main

// D:\workspace\STM8\stm8l151_ADS1292\main\main.c
//    1 #include "main.h"
//    2 
//    3 extern u8 RxBuffer[DATA_TO_RECEIVE];
//    4 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    5 int main()
//    6 {
//    7   CLK_Config();
main:
        CALL      L:CLK_Config
//    8   LED_Init();
        CALL      L:LED_Init
//    9   UART_Init(115200);
        LDW       X, #0xc200
        LDW       S:?w1, X
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        CALL      L:UART_Init
//   10   ADS1292R_Init();
        CALL      L:ADS1292R_Init
//   11   MLX90615_Init();
        CALL      L:MLX90615_Init
//   12   TIM2_Config(625);     //128*625 /16M = 5ms
        LDW       X, #0x271
        CALL      L:TIM2_Config
//   13   
//   14   enableInterrupts();
        rim
//   15   
//   16   while(1)
//   17   {
//   18     delay_ms(500);
??main_0:
        LDW       X, #0x1f4
        CALL      L:delay_ms
//   19     MLX90615_Read_Temp();
        CALL      L:MLX90615_Read_Temp
//   20     LED_BLUE_REVERSE;
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_ToggleBits
        JRA       L:??main_0
//   21   }
//   22 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 50 bytes in section .near_func.text
// 
// 50 bytes of CODE memory
//
//Errors: none
//Warnings: none
