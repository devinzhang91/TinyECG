///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Mar/2016  10:05:00 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_OLED\devices\ad1292r.c       /
//    Command line =  D:\workspace\STM8\stm8l151_OLED\devices\ad1292r.c -e    /
//                    -On --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o D:\workspace\STM8\stm8l151_OLED\ /
//                    iar\Debug\Obj\ --dlib_config                            /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l151_OLED\iar\Debug\List\ -I      /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\main\ -I         /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\fwlib\inc\ -I    /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\devices\ -I      /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\hardware\        /
//                    --vregs 16                                              /
//    List file    =  D:\workspace\STM8\stm8l151_OLED\iar\Debug\List\ad1292r. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ad1292r

        EXTERN ?b0
        EXTERN GPIO_Init
        EXTERN GPIO_SetBits

        PUBLIC AD1292R_Init

// D:\workspace\STM8\stm8l151_OLED\devices\ad1292r.c
//    1 #include "ad1292r.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void AD1292R_Init(void)
//    4 {
//    5   //SPI_Master_Conf();	//SPI端口设置
//    6   
//    7   GPIO_Init(AD1292R_CS_PORT, AD1292R_CS_PIN, GPIO_Mode_Out_PP_High_Slow);	//片选IO
AD1292R_Init:
        MOV       S:?b0, #0xd0
        LD        A, #0x10
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//    8   GPIO_Init(AD1292R_CTRL_PORT, AD1292R_RESET_PIN | AD1292R_START_PIN, GPIO_Mode_Out_PP_High_Slow);	//低功耗IO
        MOV       S:?b0, #0xd0
        LD        A, #0x6
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//    9 //  GPIO_Init(AFE_CTRL_PORT, AFE_ADC_RDY_PIN, GPIO_Mode_In_PU_IT);	//ADC_RDY 中断设置
//   10 //  EXTI_SetPinSensitivity(EXIT_ADC_RDY_EXIT, EXTI_Trigger_Rising);
//   11   
//   12   AD1292R_CS_H;	//关闭AD1292R
        LD        A, #0x10
        LDW       X, #0x5000
        CALL      L:GPIO_SetBits
//   13 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 33 bytes in section .near_func.text
// 
// 33 bytes of CODE memory
//
//Errors: none
//Warnings: none
