///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  21:16:37 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\main\tim4_test.c                /
//    Command line =  E:\HWT\io\stm8l152_demo\main\tim4_test.c -e -Ohs        /
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
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\tim4_test.s      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME tim4_test

        EXTERN ?b0
        EXTERN CLK_DeInit
        EXTERN CLK_PeripheralClockConfig
        EXTERN CLK_SYSCLKDivConfig
        EXTERN TIM4_Init
        EXTERN tim4_ticks

        PUBLIC led_1_proc
        PUBLIC led_2_proc
        PUBLIC led_3_proc
        PUBLIC main

// E:\HWT\io\stm8l152_demo\main\tim4_test.c
//    1 #include "stm8l15x.h"
//    2 #include "io_stm8l15x.h"
//    3 #include "uni_int.h"
//    4 #include "periph_tim4.h"
//    5 #include "periph_io.h"
//    6 
//    7 extern volatile uint16 tim4_ticks;
//    8 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void led_1_proc(void)   //LED_1调度，每500ms翻转一次
//   10 {
//   11   static uint16 last_ticks=0;
//   12   if(((uint16)(tim4_ticks-last_ticks)) >=500)
led_1_proc:
        LDW       X, L:tim4_ticks
        SUBW      X, L:??last_ticks
        CPW       X, #0x1f4
        JRC       L:??led_1_proc_0
//   13   {
//   14     last_ticks=tim4_ticks;
        LDW       X, L:tim4_ticks
        LDW       L:??last_ticks, X
//   15     GPIO_LED_1_Toggle(); 
        LD        A, #0x40
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   16   } 
//   17 }
??led_1_proc_0:
        RET

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??last_ticks:
        DS8 2
//   18 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   19 void led_2_proc(void)   //LED_2调度，每250ms翻转一次
//   20 {
//   21   static uint16 last_ticks=0;
//   22   if(((uint16)(tim4_ticks-last_ticks)) >=250)
led_2_proc:
        LDW       X, L:tim4_ticks
        SUBW      X, L:??last_ticks_1
        CPW       X, #0xfa
        JRC       L:??led_2_proc_0
//   23   {
//   24     last_ticks=tim4_ticks;
        LDW       X, L:tim4_ticks
        LDW       L:??last_ticks_1, X
//   25     GPIO_LED_2_Toggle(); 
        LD        A, #0x20
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   26   } 
//   27 }
??led_2_proc_0:
        RET

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??last_ticks_1:
        DS8 2
//   28 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   29 void led_3_proc(void)   //LED_3调度，每100ms翻转一次
//   30 {
//   31   static uint16 last_ticks=0;
//   32   if(((uint16)(tim4_ticks-last_ticks)) >=100)
led_3_proc:
        LDW       X, L:tim4_ticks
        SUBW      X, L:??last_ticks_2
        CPW       X, #0x64
        JRC       L:??led_3_proc_0
//   33   {
//   34     last_ticks=tim4_ticks;
        LDW       X, L:tim4_ticks
        LDW       L:??last_ticks_2, X
//   35     GPIO_LED_3_Toggle(); 
        LD        A, #0x10
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   36   } 
//   37 }
??led_3_proc_0:
        RET

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
??last_ticks_2:
        DS8 2
//   38 
//   39 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   40 int main()
//   41 { 
//   42     CLK_DeInit();                          //时钟恢复默设置
main:
        CALL      L:CLK_DeInit
//   43     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  //HSI不分频，16M
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//   44     
//   45     GPIO_LED_1_Off();
        BSET      L:0x500f, #0x6
//   46     GPIO_LED_1_MakeOutputPushPullSlow();
        BSET      L:0x5011, #0x6
        BSET      L:0x5012, #0x6
        BRES      L:0x5013, #0x6
//   47     //LED_1设置为OutputPushPullSlow，初始输出Off  
//   48     
//   49     GPIO_LED_2_On();
        BRES      L:0x500f, #0x5
//   50     GPIO_LED_2_MakeOutputPushPullSlow();
        BSET      L:0x5011, #0x5
        BSET      L:0x5012, #0x5
        BRES      L:0x5013, #0x5
//   51     //LED_2设置为OutputPushPullSlow，初始输出On
//   52     
//   53     GPIO_LED_3_On();
        BRES      L:0x500f, #0x4
//   54     GPIO_LED_3_MakeOutputPushPullSlow();
        BSET      L:0x5011, #0x4
        BSET      L:0x5012, #0x4
        BRES      L:0x5013, #0x4
//   55     //LED_3设置为OutputPushPullSlow，初始输出On  
//   56  
//   57     CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);  //使能TIM4时钟
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   58     TIM4_Init();  //TIM4初始化，1ms中断一次，生成节拍
        CALL      L:TIM4_Init
//   59     
//   60     __enable_interrupt();   //打开中断
        RIM
//   61   
//   62     while(1)
//   63     {
//   64       led_1_proc();
??main_0:
        LDW       X, L:tim4_ticks
        SUBW      X, L:??last_ticks
        CPW       X, #0x1f4
        JRC       L:??main_1
        LDW       X, L:tim4_ticks
        LDW       L:??last_ticks, X
        LD        A, #0x40
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   65       led_2_proc();
??main_1:
        LDW       X, L:tim4_ticks
        SUBW      X, L:??last_ticks_1
        CPW       X, #0xfa
        JRC       L:??main_2
        LDW       X, L:tim4_ticks
        LDW       L:??last_ticks_1, X
        LD        A, #0x20
        XOR       A, L:0x500f
        LD        L:0x500f, A
//   66       led_3_proc();
??main_2:
        LDW       X, L:tim4_ticks
        SUBW      X, L:??last_ticks_2
        CPW       X, #0x64
        JRC       L:??main_0
        LDW       X, L:tim4_ticks
        LDW       L:??last_ticks_2, X
        LD        A, #0x10
        XOR       A, L:0x500f
        LD        L:0x500f, A
        JRA       L:??main_0
//   67     }
//   68 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//   6 bytes in section .near.bss
// 229 bytes in section .near_func.text
// 
// 229 bytes of CODE memory
//   6 bytes of DATA memory
//
//Errors: none
//Warnings: none
