///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:42:56 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\main\io_test.c                  /
//    Command line =  E:\HWT\io\stm8l152_demo\main\io_test.c -e -Ohs          /
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
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\io_test.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME io_test

        EXTERN CLK_DeInit
        EXTERN CLK_SYSCLKDivConfig
        EXTERN delay

        PUBLIC main

// E:\HWT\io\stm8l152_demo\main\io_test.c
//    1 #include "stm8l15x.h"
//    2 #include "periph_io.h"
//    3 #include "delay.h"
//    4 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    5 int main()
//    6 {     
//    7     CLK_DeInit();                          //时钟恢复默设置
main:
        CALL      L:CLK_DeInit
//    8     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  //HSI不分频，16M
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//    9   
//   10     GPIO_LED_1_Off();
        BSET      L:0x500f, #0x6
//   11     GPIO_LED_1_MakeOutputPushPullSlow();
        BSET      L:0x5011, #0x6
        BSET      L:0x5012, #0x6
        BRES      L:0x5013, #0x6
//   12     //LED_1设置为OutputPushPullSlow，初始输出Off  
//   13     
//   14     GPIO_LED_2_On();
        BRES      L:0x500f, #0x5
//   15     GPIO_LED_2_MakeOutputPushPullSlow();
        BSET      L:0x5011, #0x5
        BSET      L:0x5012, #0x5
        BRES      L:0x5013, #0x5
//   16     //LED_2设置为OutputPushPullSlow，初始输出On
//   17     
//   18     GPIO_LED_3_On();
        BRES      L:0x500f, #0x4
//   19     GPIO_LED_3_MakeOutputPushPullSlow();
        BSET      L:0x5011, #0x4
        BSET      L:0x5012, #0x4
        BRES      L:0x5013, #0x4
//   20     //LED_3设置为OutputPushPullSlow，初始输出On    
//   21      
//   22     while(1)
//   23     {
//   24         delay();
??main_0:
        CALL      L:delay
//   25            
//   26         GPIO_LED_1_Toggle();    //LED_1翻转
        LD        A, #0x40
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   27         GPIO_LED_2_Toggle();    //LED_2翻转
        LD        A, #0x20
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   28         GPIO_LED_3_Toggle();    //LED_3翻转                      
        LD        A, #0x10
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   29     }
        JRA       L:??main_0
//   30 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   31 
// 
// 84 bytes in section .near_func.text
// 
// 84 bytes of CODE memory
//
//Errors: none
//Warnings: none
