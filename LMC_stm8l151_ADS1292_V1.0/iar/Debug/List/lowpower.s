///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\lowpower.c  /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\lowpower.c  /
//                    -e -On --no_cse --no_unroll --no_inline                 /
//                    --no_code_motion --no_tbaa --no_cross_call --debug      /
//                    --code_model small --data_model medium -o               /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\Obj\       /
//                    --dlib_config D:\IAR\stm8\LIB\dlstm8smn.h -D            /
//                    STM8L15X_MDP -lB D:\workspace\STM8\stm8l151_ADS1292\iar /
//                    \Debug\List\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\ /
//                    ..\main\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\f /
//                    wlib\inc\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\ /
//                    devices\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\h /
//                    ardware\ --vregs 16                                     /
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\lowpo /
//                    wer.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME lowpower

        EXTERN ?b0
        EXTERN CLK_GetSYSCLKSource
        EXTERN CLK_HSEConfig
        EXTERN CLK_HSICmd
        EXTERN CLK_HaltConfig
        EXTERN CLK_SYSCLKDivConfig
        EXTERN CLK_SYSCLKSourceConfig
        EXTERN CLK_SYSCLKSourceSwitchCmd
        EXTERN GPIO_Init
        EXTERN PWR_UltraLowPowerCmd

        PUBLIC LowPower_CLK_Config
        PUBLIC LowPower_GPIO_Config
        PUBLIC LowPower_Init

// D:\workspace\STM8\stm8l151_ADS1292\hardware\lowpower.c
//    1 #include "lowpower.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void LowPower_Init(void)
//    4 {
//    5   LowPower_CLK_Config();
LowPower_Init:
        CALL      L:LowPower_CLK_Config
//    6   CLK_HaltConfig(CLK_Halt_FastWakeup,ENABLE);//快速唤醒
        MOV       S:?b0, #0x1
        LD        A, #0x20
        CALL      L:CLK_HaltConfig
//    7   LowPower_GPIO_Config(); 
        CALL      L:LowPower_GPIO_Config
//    8   PWR_UltraLowPowerCmd(ENABLE);   
        LD        A, #0x1
        CALL      L:PWR_UltraLowPowerCmd
//    9 }
        RET
//   10 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   11 void LowPower_CLK_Config(void)
//   12 {
//   13   CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能时钟切换
LowPower_CLK_Config:
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceSwitchCmd
//   14   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//选择内部低速时钟作为时钟源
        LD        A, #0x2
        CALL      L:CLK_SYSCLKSourceConfig
//   15   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//设置系统时钟分频
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//   16   while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
??LowPower_CLK_Config_0:
        CALL      L:CLK_GetSYSCLKSource
        CP        A, #0x2
        JRNE      L:??LowPower_CLK_Config_0
//   17   CLK_HSICmd(DISABLE);                          //关闭原先的 CLK source
        CLR       A
        CALL      L:CLK_HSICmd
//   18   CLK_HSEConfig(CLK_HSE_OFF);                   //关闭外部 CLK source
        CLR       A
        CALL      L:CLK_HSEConfig
//   19 }
        RET
//   20 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   21 void LowPower_GPIO_Config(void)
//   22 { 
//   23   GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
LowPower_GPIO_Config:
        MOV       S:?b0, #0xc0
        LD        A, #0xff
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//   24   GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
        MOV       S:?b0, #0xc0
        LD        A, #0xff
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   25   GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
        MOV       S:?b0, #0xc0
        LD        A, #0xff
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   26   GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
        MOV       S:?b0, #0xc0
        LD        A, #0xff
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   27   GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
        MOV       S:?b0, #0xc0
        LD        A, #0xff
        LDW       X, #0x5014
        CALL      L:GPIO_Init
//   28   GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
        MOV       S:?b0, #0xc0
        LD        A, #0xff
        LDW       X, #0x5019
        CALL      L:GPIO_Init
//   29 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 124 bytes in section .near_func.text
// 
// 124 bytes of CODE memory
//
//Errors: none
//Warnings: none
