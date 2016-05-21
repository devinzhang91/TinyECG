///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            17/Mar/2016  11:28:17 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_OLED\hardware\timer4.c       /
//    Command line =  D:\workspace\STM8\stm8l151_OLED\hardware\timer4.c -e    /
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
//    List file    =  D:\workspace\STM8\stm8l151_OLED\iar\Debug\List\timer4.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME timer4

        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN CLK_PeripheralClockConfig
        EXTERN Get_AFE_Data
        EXTERN TIM4_ClearFlag
        EXTERN TIM4_ClearITPendingBit
        EXTERN TIM4_Cmd
        EXTERN TIM4_ITConfig
        EXTERN TIM4_TimeBaseInit

        PUBLIC DrawMap
        PUBLIC TIM4_Config
        PUBLIC TIM4_UPD_OVF_TRG_IRQHandler
        PUBLIC _interrupt_27
        PUBLIC buff_cnt
        PUBLIC map_buff0
        PUBLIC map_buff1
        PUBLIC timer_cnt

// D:\workspace\STM8\stm8l151_OLED\hardware\timer4.c
//    1 #include "timer4.h"
//    2 
//    3 void DrawMap(void);
//    4 
//    5 //******************************************************************
//    6 //函数名：  TIM4_Config
//    7 //功能：    TIMER4初始化
//    8 //输入参数：period：定时器周期
//    9 //返回值：  无
//   10 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   11 void TIM4_Config(u8 period)
//   12 {
TIM4_Config:
        PUSH      S:?b8
        LD        S:?b8, A
//   13   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   14   TIM4_TimeBaseInit(TIM4_Prescaler_128, period);
        MOV       S:?b0, S:?b8
        LD        A, #0x7
        CALL      L:TIM4_TimeBaseInit
//   15   TIM4_ClearFlag(TIM4_FLAG_Update);
        LD        A, #0x1
        CALL      L:TIM4_ClearFlag
//   16   TIM4_ITConfig(TIM4_IT_Update, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALL      L:TIM4_ITConfig
//   17   enableInterrupts();
        rim
//   18   TIM4_Cmd(ENABLE);
        LD        A, #0x1
        CALL      L:TIM4_Cmd
//   19 }
        POP       S:?b8
        RET
//   20 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   21 u8 timer_cnt = 31;
timer_cnt:
        DC8 31
//   22 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   23 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
//   24 {
TIM4_UPD_OVF_TRG_IRQHandler:
_interrupt_27:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//   25 //  if(timer_cnt==0)
//   26 //  {
//   27 //    //DrawMap();
//   28 //    timer_cnt = 31;
//   29 //  }
//   30 //  timer_cnt--;
//   31 //  DMA_USART_Enable();
//   32   TIM4_ClearITPendingBit(TIM4_IT_Update);
        LD        A, #0x1
        CALL      L:TIM4_ClearITPendingBit
//   33 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//   34 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   35 u8 map_buff0[128];
map_buff0:
        DS8 128

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   36 u8 map_buff1[128];
map_buff1:
        DS8 128

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   37 u8 buff_cnt = 0;
buff_cnt:
        DS8 1
//   38 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   39 void DrawMap(void)
//   40 {
//   41 //  GUI_DrawPoint(buff_cnt, 256-map_buff0[buff_cnt], BLACK);
//   42 //  GUI_DrawPoint(buff_cnt, 256-map_buff1[buff_cnt], BLACK);
//   43 //  GUI_DrawPoint(buff_cnt, 256-(map_buff0[buff_cnt]-map_buff1[buff_cnt]), RED);
//   44   
//   45   map_buff0[buff_cnt] = Get_AFE_Data(LED1);
DrawMap:
        LD        A, #0x81
        CALL      L:Get_AFE_Data
        LD        S:?b0, A
        LD        A, L:buff_cnt
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:map_buff0,X), A
//   46   map_buff1[buff_cnt] = Get_AFE_Data(LED2);
        LD        A, #0x82
        CALL      L:Get_AFE_Data
        LD        S:?b0, A
        LD        A, L:buff_cnt
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:map_buff1,X), A
//   47   
//   48 //  GUI_DrawPoint(buff_cnt, 256-map_buff0[buff_cnt], RED);
//   49 //  GUI_DrawPoint(buff_cnt, 256-map_buff1[buff_cnt], BLUE);
//   50 //  GUI_DrawPoint(buff_cnt, 256-(map_buff0[buff_cnt]-map_buff1[buff_cnt]), RED);
//   51   
//   52   buff_cnt++;
        LD        A, L:buff_cnt
        ADD       A, #0x1
        LD        L:buff_cnt, A
//   53   buff_cnt = buff_cnt % 128;
        LD        A, L:buff_cnt
        MOV       S:?b0, #0x80
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        DIV       X, A
        LD        L:buff_cnt, A
//   54    
//   55 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 257 bytes in section .near.bss
//   1 byte  in section .near.data
// 128 bytes in section .near_func.text
// 
// 128 bytes of CODE memory
// 258 bytes of DATA memory
//
//Errors: none
//Warnings: none
