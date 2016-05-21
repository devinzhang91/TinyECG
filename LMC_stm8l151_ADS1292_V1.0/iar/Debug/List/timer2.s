///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  15:18:58 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\timer2.c    /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\timer2.c    /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\timer /
//                    2.s                                                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME timer2

        EXTERN ?b0
        EXTERN ?epilogue_w4
        EXTERN ?mul16_x_x_w0
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w4
        EXTERN CLK_PeripheralClockConfig
        EXTERN DMA_USART_TX_Enable
        EXTERN MLX90615_Read_Temp
        EXTERN TIM2_ClearFlag
        EXTERN TIM2_ClearITPendingBit
        EXTERN TIM2_Cmd
        EXTERN TIM2_ITConfig
        EXTERN TIM2_TimeBaseInit
        EXTERN TxBuffer
        EXTERN data_buff

        PUBLIC TIM2_Config
        PUBLIC TIM2_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC _interrupt_21
        PUBLIC temp_data
        PUBLIC temp_looper
        PUBLIC timer2_looper

// D:\workspace\STM8\stm8l151_ADS1292\hardware\timer2.c
//    1 #include "timer2.h"
//    2 
//    3 //******************************************************************
//    4 //函数名：  TIM2_Config
//    5 //功能：    TIMER2初始化
//    6 //输入参数：period：定时器周期
//    7 //返回值：  无
//    8 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void TIM2_Config(u16 period)
//   10 {
TIM2_Config:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   11   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
        MOV       S:?b0, #0x1
        CLR       A
        CALL      L:CLK_PeripheralClockConfig
//   12   TIM2_TimeBaseInit(TIM2_Prescaler_128, TIM2_CounterMode_Down, period);
        LDW       X, S:?w4
        MOV       S:?b0, #0x10
        LD        A, #0x7
        CALL      L:TIM2_TimeBaseInit
//   13   TIM2_ClearFlag(TIM2_FLAG_Update);
        CLRW      X
        INCW      X
        CALL      L:TIM2_ClearFlag
//   14   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALL      L:TIM2_ITConfig
//   15 //  enableInterrupts();
//   16   TIM2_Cmd(ENABLE);
        LD        A, #0x1
        CALL      L:TIM2_Cmd
//   17 }
        JP        L:?epilogue_w4
//   18 
//   19 //extern u16 DATA_CH1;
//   20 //extern u16 DATA_CH2;
//   21 extern u8 data_buff[9];
//   22 extern u8 TxBuffer[DATA_TO_TRANSFER];

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   23 u16 temp_data = 0;
temp_data:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   24 u8 timer2_looper = 0;
timer2_looper:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   25 u8 temp_looper = 0;
temp_looper:
        DS8 1
//   26 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   27 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
//   28 {
TIM2_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_21:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//   29   if(temp_looper==200)
        LD        A, L:temp_looper
        CP        A, #0xc8
        JRNE      L:??TIM2_UPD_OVF_TRG_BRK_IRQHandler_0
//   30   {
//   31     //disableInterrupts();        //添加温度
//   32     temp_data = MLX90615_Read_Temp();
        CALL      L:MLX90615_Read_Temp
        LDW       L:temp_data, X
//   33     //enableInterrupts();
//   34     TxBuffer[16]=(temp_data>>8)&0xff;       //数据装载 温度
        LDW       X, L:temp_data
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:TxBuffer + 16, A
//   35     TxBuffer[17]=(temp_data)&0xff;
        LDW       X, L:temp_data
        LD        A, XL
        LD        L:TxBuffer + 17, A
//   36     temp_looper = 0;
        MOV       L:temp_looper, #0x0
//   37   }
//   38   if(timer2_looper==4)
??TIM2_UPD_OVF_TRG_BRK_IRQHandler_0:
        LD        A, L:timer2_looper
        CP        A, #0x4
        JRNE      L:??TIM2_UPD_OVF_TRG_BRK_IRQHandler_1
//   39   {
//   40     DMA_USART_TX_Enable();              //发送数据
        CALL      L:DMA_USART_TX_Enable
//   41     timer2_looper = 0;
        MOV       L:timer2_looper, #0x0
//   42   }
//   43 //  TxBuffer[timer2_looper*4+0]=data_buff[3]^0x80;       //数据装载 CH1
//   44 //  TxBuffer[timer2_looper*4+1]=data_buff[4];           
//   45   TxBuffer[timer2_looper*4+2]=data_buff[6]^0x80;        //CH2
??TIM2_UPD_OVF_TRG_BRK_IRQHandler_1:
        LD        A, L:timer2_looper
        CLRW      Y
        LD        YL, A
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #TxBuffer + 2
        LD        A, L:data_buff + 6
        XOR       A, #0x80
        LD        (X), A
//   46   TxBuffer[timer2_looper*4+3]=data_buff[7];
        LD        A, L:timer2_looper
        CLRW      Y
        LD        YL, A
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #TxBuffer + 3
        LD        A, L:data_buff + 7
        LD        (X), A
//   47   
//   48   TxBuffer[timer2_looper*4+0]=data_buff[4];       //数据装载 CH1
        LD        A, L:timer2_looper
        CLRW      Y
        LD        YL, A
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LD        A, L:data_buff + 4
        LD        (L:TxBuffer,X), A
//   49   TxBuffer[timer2_looper*4+1]=data_buff[5];
        LD        A, L:timer2_looper
        CLRW      Y
        LD        YL, A
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #TxBuffer + 1
        LD        A, L:data_buff + 5
        LD        (X), A
//   50 //  TxBuffer[timer2_looper*4+2]=data_buff[7];     //CH2
//   51 //  TxBuffer[timer2_looper*4+3]=data_buff[8];
//   52   
//   53   timer2_looper++;
        LD        A, L:timer2_looper
        ADD       A, #0x1
        LD        L:timer2_looper, A
//   54   temp_looper++;
        LD        A, L:temp_looper
        ADD       A, #0x1
        LD        L:temp_looper, A
//   55   TIM2_ClearITPendingBit(TIM2_IT_Update);
        LD        A, #0x1
        CALL      L:TIM2_ClearITPendingBit
//   56 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//   4 bytes in section .near.bss
// 226 bytes in section .near_func.text
// 
// 226 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
