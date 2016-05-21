///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:39 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_irtim.c      /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_irtim.c -e   /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_irtim.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_irtim

        EXTERN ?b0
        EXTERN ?b1

        PUBLIC IRTIM_Cmd
        PUBLIC IRTIM_DeInit
        PUBLIC IRTIM_GetHighSinkODStatus
        PUBLIC IRTIM_GetStatus
        PUBLIC IRTIM_HighSinkODCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_irtim.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_irtim.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the IRTIM firmware functions.
//    8   ******************************************************************************
//    9   * @copy
//   10   *
//   11   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   12   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   13   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   14   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   15   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   16   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   17   *
//   18   * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
//   19   */
//   20 
//   21 
//   22 /* Includes ------------------------------------------------------------------*/
//   23 #include "stm8l15x_irtim.h"
//   24 
//   25 /** @addtogroup STM8L15x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private define ------------------------------------------------------------*/
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 
//   35 /**
//   36   * @addtogroup IRTIM_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the IRTIM peripheral registers to their default reset values.
//   42   * @param  None
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void IRTIM_DeInit(void)
//   46 {
//   47   IRTIM->CR = IRTIM_CR_RESET_VALUE;
IRTIM_DeInit:
        CLR       A
        LD        L:0x52ff, A
//   48 }
        RET
//   49 
//   50 /**
//   51   * @brief  Enables or disables the IRTIM peripheral.
//   52   * @param  NewState : The new state of the IRTIM peripheral.
//   53   *         This parameter can be: ENABLE or DISABLE.
//   54   * @retval None
//   55   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   56 void IRTIM_Cmd(FunctionalState NewState)
//   57 {
//   58   /* Check the parameters */
//   59   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   60 
//   61   /* set or Reset the EN Bit */
//   62   if (NewState ==   DISABLE)
IRTIM_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JRNE      L:??IRTIM_Cmd_0
//   63   {
//   64     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
        BRES      L:0x52ff, #0x0
        RET
//   65   }
//   66   else
//   67   {
//   68     IRTIM->CR |= IRTIM_CR_EN ;
??IRTIM_Cmd_0:
        BSET      L:0x52ff, #0x0
//   69   }
//   70 }
        RET
//   71 
//   72 /**
//   73   * @brief  Enables or disables the High sink open drain buffer of the IRTIM peripheral.
//   74   * @param  NewState : The new state of the High sink open drain buffer.
//   75   *         This parameter can be: ENABLE or DISABLE.
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void IRTIM_HighSinkODCmd(FunctionalState NewState)
//   79 {
//   80   /* Check the parameters */
//   81   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   82 
//   83   /* set or Reset the EN Bit */
//   84   if (NewState == DISABLE)
IRTIM_HighSinkODCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JRNE      L:??IRTIM_HighSinkODCmd_0
//   85   {
//   86     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
        BRES      L:0x52ff, #0x1
        RET
//   87   }
//   88   else
//   89   {
//   90     IRTIM->CR |= IRTIM_CR_HSEN ;
??IRTIM_HighSinkODCmd_0:
        BSET      L:0x52ff, #0x1
//   91   }
//   92 }
        RET
//   93 
//   94 /**
//   95   * @brief  Checks whether the IRTIM device is enabled or not.
//   96   * @param  None
//   97   * @retval FunctionalState : state of the IRTIM device.
//   98   *         This parameter can be: ENABLE or DISABLE.
//   99   */
//  100 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  101 FunctionalState IRTIM_GetStatus(void)
//  102 {
//  103   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
IRTIM_GetStatus:
        LD        A, #0x1
        AND       A, L:0x52ff
        RET
//  104 }
//  105 
//  106 /**
//  107   * @brief  Checks whether the IRTIM High Sink Open Drain buffer is Enabled or not.
//  108   * @param  None
//  109   * @retval FunctionalState : state of High Sink Open Drain buffer.
//  110   *         This parameter can be: ENABLE or DISABLE.
//  111   */
//  112 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  113 FunctionalState IRTIM_GetHighSinkODStatus(void)
//  114 {
//  115   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
IRTIM_GetHighSinkODStatus:
        LD        A, L:0x52ff
        SRL       A
        AND       A, #0x1
        RET
//  116 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  117 
//  118 /**
//  119   * @}
//  120   */
//  121 
//  122 /**
//  123   * @}
//  124   */
//  125 
//  126 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 58 bytes in section .near_func.text
// 
// 58 bytes of CODE memory
//
//Errors: none
//Warnings: none
