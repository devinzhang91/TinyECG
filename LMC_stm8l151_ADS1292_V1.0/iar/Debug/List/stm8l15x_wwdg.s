///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:41 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_wwdg.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_wwdg.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_wwdg.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_wwdg

        EXTERN ?b0
        EXTERN ?b1

        PUBLIC WWDG_Enable
        PUBLIC WWDG_GetCounter
        PUBLIC WWDG_Init
        PUBLIC WWDG_SWReset
        PUBLIC WWDG_SetCounter
        PUBLIC WWDG_SetWindowValue

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_wwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8l15x_wwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the WWDG firmware functions.
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
//   21 /* Includes ------------------------------------------------------------------*/
//   22 #include "stm8l15x_wwdg.h"
//   23 
//   24 /** @addtogroup STM8L15x_StdPeriph_Driver
//   25   * @{
//   26   */
//   27 
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 #define BIT_MASK          ((uint8_t)0x7F)
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 /* Private functions ---------------------------------------------------------*/
//   35 /* Public functions ----------------------------------------------------------*/
//   36 
//   37 /** @addtogroup WWDG_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Initializes the WWDG peripheral.
//   43   *         This function set Window Register = WindowValue, Counter Register
//   44   *         according to Counter and \b ENABLE \b WWDG
//   45   * @param  Counter : WWDG counter value
//   46   * @param  WindowValue : specifies the WWDG Window Register, range is 0x00 to 0x7F.
//   47   * @retval None
//   48   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   49 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
//   50 {
WWDG_Init:
        LD        S:?b1, A
//   51   /* Check the parameters */
//   52   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
//   53   WWDG->WR = WWDG_WR_RESET_VALUE;
        LD        A, #0x7f
        LD        L:0x50d4, A
//   54   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
        LD        A, S:?b1
        OR        A, #0x80
        LD        L:0x50d3, A
//   55   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
        LD        A, S:?b0
        AND       A, #0x7f
        LD        L:0x50d4, A
//   56 }
        RET
//   57 
//   58 /**
//   59   * @brief  Enables WWDG and load the counter value.
//   60   * @param  Counter: specifies the watchdog counter value.
//   61   *         This parameter must be a number between 0x40 and 0x7F.
//   62   * @retval None
//   63   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void WWDG_Enable(uint8_t Counter)
//   65 {
//   66   /* Check the parameters */
//   67   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
//   68   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
WWDG_Enable:
        OR        A, #0x80
        LD        L:0x50d3, A
//   69 }
        RET
//   70 
//   71 /**
//   72   * @brief  Refreshs the WWDG peripheral.
//   73   * @param  Counter :  WWDG Counter Value
//   74   *         This parameter must be a number between 0x40 and 0x7F.
//   75   * @retval None
//   76   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   77 void WWDG_SetCounter(uint8_t Counter)
//   78 {
//   79   /* Check the parameters */
//   80   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
//   81 
//   82   /* Write to T[6:0] bits to configure the counter value, no need to do
//   83      a read-modify-write; writing a 0 to WDGA bit does nothing */
//   84   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
WWDG_SetCounter:
        AND       A, #0x7f
        LD        L:0x50d3, A
//   85 }
        RET
//   86 
//   87 /**
//   88   * @brief Gets the WWDG Counter Value.
//   89   *        This value could be used to check if WWDG is in the window, where
//   90   *        refresh is allowed.
//   91   * @param  None
//   92   * @retval WWDG Counter Value
//   93   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   94 uint8_t WWDG_GetCounter(void)
//   95 {
//   96   return(WWDG->CR);
WWDG_GetCounter:
        LD        A, L:0x50d3
        RET
//   97 }
//   98 
//   99 /**
//  100   * @brief Generates immediate WWDG RESET.
//  101   * @param  None
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 void WWDG_SWReset(void)
//  105 {
//  106   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
WWDG_SWReset:
        LD        A, #0x80
        LD        L:0x50d3, A
//  107 }
        RET
//  108 
//  109 /**
//  110   * @brief  Sets the WWDG window value.
//  111   * @param  WindowValue: specifies the window value to be compared to the
//  112   *         downcounter.
//  113   *         This parameter value must be lower than 0x80.
//  114   * @retval None
//  115   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  116 void WWDG_SetWindowValue(uint8_t WindowValue)
//  117 {
WWDG_SetWindowValue:
        SUB       SP, #0x1
        LD        S:?b0, A
//  118   __IO uint8_t tmpreg = 0;
        CLR       A
        LD        (0x1,SP), A
//  119 
//  120   /* Check the parameters */
//  121   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
//  122 
//  123   /* Set W[6:0] bits according to WindowValue value */
//  124   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
        LD        A, S:?b0
        AND       A, #0x7f
        OR        A, (0x1,SP)
        LD        (0x1,SP), A
//  125 
//  126   /* Store the new value */
//  127   WWDG->WR = tmpreg;
        LD        A, (0x1,SP)
        LD        L:0x50d4, A
//  128 }
        ADD       SP, #0x1
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  129 /**
//  130   * @}
//  131   */
//  132 
//  133 /**
//  134   * @}
//  135   */
//  136 
//  137 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 67 bytes in section .near_func.text
// 
// 67 bytes of CODE memory
//
//Errors: none
//Warnings: none
