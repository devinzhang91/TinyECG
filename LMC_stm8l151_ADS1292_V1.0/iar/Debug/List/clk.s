///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\clk.c       /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\clk.c -e    /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\clk.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME clk

        EXTERN CLK_GetSYSCLKSource
        EXTERN CLK_HSICmd
        EXTERN CLK_LSICmd
        EXTERN CLK_SYSCLKDivConfig
        EXTERN CLK_SYSCLKSourceConfig
        EXTERN CLK_SYSCLKSourceSwitchCmd

        PUBLIC CLK_Config
        PUBLIC Switch_HSI_Config
        PUBLIC Switch_LSI_Config

// D:\workspace\STM8\stm8l151_ADS1292\hardware\clk.c
//    1 #include "clk.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void CLK_Config(void)  
//    4 {
//    5   CLK_SYSCLKSourceSwitchCmd(ENABLE);
CLK_Config:
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceSwitchCmd
//    6   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceConfig
//    7   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);                 //16HMZ/1=16
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//    8   while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI);
??CLK_Config_0:
        CALL      L:CLK_GetSYSCLKSource
        CP        A, #0x1
        JRNE      L:??CLK_Config_0
//    9   CLK_HSICmd(ENABLE);
        LD        A, #0x1
        CALL      L:CLK_HSICmd
//   10 }
        RET
//   11 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   12 void Switch_LSI_Config(void)  
//   13 {
//   14   CLK_SYSCLKSourceSwitchCmd(ENABLE);                    //使能时钟切换
Switch_LSI_Config:
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceSwitchCmd
//   15   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);         //选择内部低速时钟作为时钟源
        LD        A, #0x2
        CALL      L:CLK_SYSCLKSourceConfig
//   16   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);                 //设置系统时钟分频
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//   17   while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
??Switch_LSI_Config_0:
        CALL      L:CLK_GetSYSCLKSource
        CP        A, #0x2
        JRNE      L:??Switch_LSI_Config_0
//   18   CLK_HSICmd(DISABLE);                                  //关闭原先的 CLK source
        CLR       A
        CALL      L:CLK_HSICmd
//   19 }
        RET
//   20 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   21 void Switch_HSI_Config(void)  
//   22 {
//   23   CLK_SYSCLKSourceSwitchCmd(ENABLE);                    //使能时钟切换
Switch_HSI_Config:
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceSwitchCmd
//   24   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);         //选择内部低速时钟作为时钟源
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceConfig
//   25   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);                 //设置系统时钟分频
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//   26   while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI);//等待时钟稳定
??Switch_HSI_Config_0:
        CALL      L:CLK_GetSYSCLKSource
        CP        A, #0x1
        JRNE      L:??Switch_HSI_Config_0
//   27   CLK_LSICmd(DISABLE);                                  //关闭原先的 CLK source
        CLR       A
        CALL      L:CLK_LSICmd
//   28 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   29 
// 
// 79 bytes in section .near_func.text
// 
// 79 bytes of CODE memory
//
//Errors: none
//Warnings: none
