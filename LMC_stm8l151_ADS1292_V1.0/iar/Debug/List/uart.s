///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:14 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\uart.c      /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\uart.c -e   /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\uart. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME uart

        EXTERN ?b0
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?epilogue_l2
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?push_l2
        EXTERN ?w0
        EXTERN ?w1
        EXTERN CLK_PeripheralClockConfig
        EXTERN DMA_Cmd
        EXTERN DMA_DeInit
        EXTERN DMA_GlobalCmd
        EXTERN DMA_GlobalDeInit
        EXTERN DMA_Init
        EXTERN DMA_SetCurrDataCounter
        EXTERN GPIO_Init
        EXTERN USART_Cmd
        EXTERN USART_DMACmd
        EXTERN USART_DeInit
        EXTERN USART_Init

        PUBLIC DMA_USART_Config
        PUBLIC DMA_USART_TX_Enable
        PUBLIC RxBuffer
        PUBLIC TxBuffer
        PUBLIC UART_Init

// D:\workspace\STM8\stm8l151_ADS1292\hardware\uart.c
//    1 #include "uart.h"
//    2 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    3 u8 TxBuffer[DATA_TO_TRANSFER] = {0};
TxBuffer:
        DS8 20

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    4 u8 RxBuffer[DATA_TO_RECEIVE] = {0};
RxBuffer:
        DS8 20
//    5 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    6 void UART_Init(u32 baudrate)
//    7 {
UART_Init:
        CALL      L:?push_l2
        CALL      L:?mov_l2_l0
//    8   GPIO_Init(GPIOC, GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);
        MOV       S:?b0, #0x40
        LD        A, #0x4
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//    9   GPIO_Init(GPIOC, GPIO_Pin_3,GPIO_Mode_Out_PP_Low_Fast);
        MOV       S:?b0, #0xe0
        LD        A, #0x8
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   10   CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);	//一定要打开，上电默认是关闭，8S是默认打开
        MOV       S:?b0, #0x1
        LD        A, #0x5
        CALL      L:CLK_PeripheralClockConfig
//   11   USART_DeInit(USART1);
        LDW       X, #0x5230
        CALL      L:USART_DeInit
//   12   USART_Init(USART1, baudrate, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_TypeDef)(USART_Mode_Rx | USART_Mode_Tx));
        MOV       S:?b6, #0xc
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        CALL      L:?mov_l0_l2
        LDW       X, #0x5230
        CALL      L:USART_Init
//   13   //USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
//   14   USART_Cmd(USART1, DISABLE);
        CLR       A
        LDW       X, #0x5230
        CALL      L:USART_Cmd
//   15   DMA_USART_Config();
        CALL      L:DMA_USART_Config
//   16   USART_Cmd(USART1, ENABLE);
        LD        A, #0x1
        LDW       X, #0x5230
        CALL      L:USART_Cmd
//   17 }
        JP        L:?epilogue_l2
//   18 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   19 void DMA_USART_Config(void)
//   20 {
//   21   CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);       //开启DMA1时钟
DMA_USART_Config:
        MOV       S:?b0, #0x1
        LD        A, #0x14
        CALL      L:CLK_PeripheralClockConfig
//   22   DMA_GlobalDeInit();   //复位DMA功能
        CALL      L:DMA_GlobalDeInit
//   23   
//   24   DMA_DeInit(USART_DMA_CHANNEL_RX);
        LDW       X, #0x5089
        CALL      L:DMA_DeInit
//   25   DMA_DeInit(USART_DMA_CHANNEL_TX);
        LDW       X, #0x507f
        CALL      L:DMA_DeInit
//   26   
//   27   DMA_Init(USART_DMA_CHANNEL_RX, (uint16_t)RxBuffer, (uint16_t)USART_DR_ADDRESS,        //RX DMA配置
//   28            DATA_TO_RECEIVE, DMA_DIR_PeripheralToMemory, DMA_Mode_Circular,
//   29            DMA_MemoryIncMode_Inc, DMA_Priority_Low, DMA_MemoryDataSize_Byte);
        PUSH      #0x0
        CLR       S:?b7
        MOV       S:?b6, #0x20
        MOV       S:?b5, #0x10
        CLR       S:?b4
        LD        A, #0x14
        LDW       Y, #0x5231
        LDW       X, #RxBuffer
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0x5089
        CALL      L:DMA_Init
        ADD       SP, #0x1
//   30   
//   31   DMA_Init(USART_DMA_CHANNEL_TX, (uint16_t)TxBuffer, (uint16_t)USART_DR_ADDRESS,        //TX DMA配置
//   32            DATA_TO_TRANSFER, DMA_DIR_MemoryToPeripheral, DMA_Mode_Normal,
//   33            DMA_MemoryIncMode_Inc, DMA_Priority_High, DMA_MemoryDataSize_Byte);
        PUSH      #0x0
        MOV       S:?b7, #0x20
        MOV       S:?b6, #0x20
        CLR       S:?b5
        MOV       S:?b4, #0x8
        LD        A, #0x14
        LDW       Y, #0x5231
        LDW       X, #TxBuffer
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0x507f
        CALL      L:DMA_Init
        ADD       SP, #0x1
//   34   
//   35   USART_DMACmd(USART1, USART_DMAReq_TX, ENABLE);        //USART DMA配置
        MOV       S:?b0, #0x1
        LD        A, #0x80
        LDW       X, #0x5230
        CALL      L:USART_DMACmd
//   36   USART_DMACmd(USART1, USART_DMAReq_RX, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x40
        LDW       X, #0x5230
        CALL      L:USART_DMACmd
//   37   DMA_GlobalCmd(ENABLE);
        LD        A, #0x1
        CALL      L:DMA_GlobalCmd
//   38   
//   39   //  DMA_Cmd(USART_DMA_CHANNEL_TX, ENABLE);      //开启传输
//   40   DMA_Cmd(USART_DMA_CHANNEL_RX, ENABLE);        //开启接收
        LD        A, #0x1
        LDW       X, #0x5089
        CALL      L:DMA_Cmd
//   41 }
        RET
//   42 
//   43 //开启一次DMA传输

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 void DMA_USART_TX_Enable(void)
//   45 { 
//   46   DMA_Cmd(USART_DMA_CHANNEL_TX, DISABLE);      //关闭USART1 TX DMA1 所指示的通道      
DMA_USART_TX_Enable:
        CLR       A
        LDW       X, #0x507f
        CALL      L:DMA_Cmd
//   47   DMA_SetCurrDataCounter(USART_DMA_CHANNEL_TX, DATA_TO_TRANSFER);//DMA通道的DMA缓存的大小
        LD        A, #0x14
        LDW       X, #0x507f
        CALL      L:DMA_SetCurrDataCounter
//   48   DMA_Cmd(USART_DMA_CHANNEL_TX, ENABLE);      //开启传输 使能USART1 TX DMA1 所指示的通道 
        LD        A, #0x1
        LDW       X, #0x507f
        CALL      L:DMA_Cmd
//   49 }	  
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   50 
//   51 
//   52 
// 
//  40 bytes in section .near.bss
// 244 bytes in section .near_func.text
// 
// 244 bytes of CODE memory
//  40 bytes of DATA memory
//
//Errors: none
//Warnings: none
