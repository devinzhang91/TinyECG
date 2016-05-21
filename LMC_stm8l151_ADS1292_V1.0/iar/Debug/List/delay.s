///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\main\delay.c         /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\main\delay.c -e -On  /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\delay /
//                    .s                                                      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME delay

        EXTERN ?b0
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w4
        EXTERN CLK_PeripheralClockConfig

        PUBLIC delay_10us
        PUBLIC delay_ms
        PUBLIC delay_nus

// D:\workspace\STM8\stm8l151_ADS1292\main\delay.c
//    1 #include "delay.h"
//    2 
//    3 /**
//    4   * @brief  delay for some time in ms unit
//    5   * @caller auto_test
//    6   * @param  n_ms is how many ms of time to delay
//    7   * @retval None
//    8   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void delay_ms(u16 n_ms)
//   10 {
delay_ms:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   11   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   12 /* Init TIMER 4 prescaler: / (2^6) = /64 */
//   13   TIM4->PSCR = 6;
        MOV       L:0x52e8, #0x6
//   14 /* HSI div by 1 --> Auto-Reload value: 16M / 64 = 1/4M, 1/4M / 1k = 250*/
//   15   TIM4->ARR = 250;
        MOV       L:0x52e9, #0xfa
//   16 /* Counter value: 2, to compensate the initialization of TIMER*/
//   17   TIM4->CNTR = 2;
        MOV       L:0x52e7, #0x2
//   18   
//   19   TIM4->SR1 &= ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
//   20   TIM4->CR1 |= TIM4_CR1_CEN;
        BSET      L:0x52e0, #0x0
//   21   while(n_ms--)
??delay_ms_0:
        LDW       X, S:?w4
        LDW       Y, X
        DECW      Y
        LDW       S:?w4, Y
        TNZW      X
        JREQ      L:??delay_ms_1
//   22   {
//   23     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
??delay_ms_2:
        BTJF      L:0x52e5, #0x0, L:??delay_ms_2
//   24     TIM4->SR1 &= ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
        JRA       L:??delay_ms_0
//   25   }
//   26   TIM4->CR1 &= ~TIM4_CR1_CEN;
??delay_ms_1:
        BRES      L:0x52e0, #0x0
//   27 }
        JP        L:?epilogue_w4
//   28 
//   29 /**
//   30   * @brief  delay for some time in 10us unit(partial accurate)
//   31   * @caller auto_test
//   32   * @param n_10us is how many 10us of time to delay
//   33   * @retval None
//   34   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   35 void delay_10us(u16 n_10us)
//   36 {
delay_10us:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   37 /* Init TIMER 4 */
//   38   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   39 
//   40 /* prescaler: / (2^0) = /1 */
//   41   TIM4->PSCR = 0;
        MOV       L:0x52e8, #0x0
//   42 
//   43 /* SYS_CLK_HSI_DIV1 Auto-Reload value: 16M / 1 = 16M, 16M / 100k = 160 */
//   44   TIM4->ARR = 160;
        MOV       L:0x52e9, #0xa0
//   45 
//   46 /* Counter value: 10, to compensate the initialization of TIMER */
//   47   TIM4->CNTR = 10;
        MOV       L:0x52e7, #0xa
//   48 
//   49 /* clear update flag */
//   50   TIM4->SR1 &= ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
//   51 
//   52 /* Enable Counter */
//   53   TIM4->CR1 |= TIM4_CR1_CEN;
        BSET      L:0x52e0, #0x0
//   54 
//   55   while(n_10us--)
??delay_10us_0:
        LDW       X, S:?w4
        LDW       Y, X
        DECW      Y
        LDW       S:?w4, Y
        TNZW      X
        JREQ      L:??delay_10us_1
//   56   {
//   57     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
??delay_10us_2:
        BTJF      L:0x52e5, #0x0, L:??delay_10us_2
//   58     TIM4->SR1 &= ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
        JRA       L:??delay_10us_0
//   59   }
//   60 
//   61 /* Disable Counter */
//   62   TIM4->CR1 &= ~TIM4_CR1_CEN;
??delay_10us_1:
        BRES      L:0x52e0, #0x0
//   63  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
        CLR       S:?b0
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   64 
//   65 }
        JP        L:?epilogue_w4
//   66 
//   67 /**
//   68   * @brief  delay for some time in 1us unit(partial accurate)
//   69   * @caller auto_test
//   70   * @param n_us is how many 1us of time to delay
//   71   * @retval None
//   72   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   73 void delay_nus(u16 n_us)
//   74 {
delay_nus:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   75 /* Init TIMER 4 */
//   76   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
        MOV       S:?b0, #0x1
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   77 
//   78 /* prescaler: / (2^0) = /1 */
//   79   TIM4->PSCR = 0;
        MOV       L:0x52e8, #0x0
//   80 
//   81 /* SYS_CLK_HSI_DIV1 Auto-Reload value: 16M / 1 = 16M, 16M / 1M = 16 */
//   82   TIM4->ARR = 16;
        MOV       L:0x52e9, #0x10
//   83 
//   84 /* Counter value: 10, to compensate the initialization of TIMER */
//   85   TIM4->CNTR = 10;
        MOV       L:0x52e7, #0xa
//   86 
//   87 /* clear update flag */
//   88   TIM4->SR1 &= ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
//   89 
//   90 /* Enable Counter */
//   91   TIM4->CR1 |= TIM4_CR1_CEN;
        BSET      L:0x52e0, #0x0
//   92 
//   93   while(n_us--)
??delay_nus_0:
        LDW       X, S:?w4
        LDW       Y, X
        DECW      Y
        LDW       S:?w4, Y
        TNZW      X
        JREQ      L:??delay_nus_1
//   94   {
//   95     while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
??delay_nus_2:
        BTJF      L:0x52e5, #0x0, L:??delay_nus_2
//   96     TIM4->SR1 &= ~TIM4_SR1_UIF;
        BRES      L:0x52e5, #0x0
        JRA       L:??delay_nus_0
//   97   }
//   98 
//   99 /* Disable Counter */
//  100   TIM4->CR1 &= ~TIM4_CR1_CEN;
??delay_nus_1:
        BRES      L:0x52e0, #0x0
//  101  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
        CLR       S:?b0
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//  102 
//  103 }
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 206 bytes in section .near_func.text
// 
// 206 bytes of CODE memory
//
//Errors: none
//Warnings: none
