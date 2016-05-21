///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:49 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_rst.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_rst.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_rst.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_rst

        PUBLIC RST_ClearFlag
        PUBLIC RST_GPOutputEnable
        PUBLIC RST_GetFlagStatus

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_rst.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_rst.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the RST firmware functions.
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
//   22 
//   23 #include "stm8l15x_rst.h"
//   24 
//   25 /** @addtogroup STM8L15x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /**
//   31   * @addtogroup RST_Private_Define
//   32   * @{
//   33   */
//   34 #define RST_CR_MASK  0xD0 /*!< Enable the GPIO */
//   35 
//   36 /**
//   37   * @}
//   38   */
//   39 
//   40 /* Private macro -------------------------------------------------------------*/
//   41 /* Private variables ---------------------------------------------------------*/
//   42 /* Private function prototypes -----------------------------------------------*/
//   43 /* Private Constants ---------------------------------------------------------*/
//   44 
//   45 /**
//   46   * @addtogroup RST_Public_Functions
//   47   * @{
//   48   */
//   49 
//   50 
//   51 /**
//   52   * @brief   Checks whether the specified RST flag is set or not.
//   53   * @param   RST_Flag : specify the reset flag to check.
//   54   *          This parameter can be a value of @ref RST_FLAG_TypeDef.
//   55   * @retval  FlagStatus: status of the given RST flag.
//   56   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
//   58 {
//   59   /* Check the parameters */
//   60   assert_param(IS_RST_FLAG(RST_Flag));
//   61 
//   62   /* Get flag status */
//   63 
//   64   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
RST_GetFlagStatus:
        AND       A, L:0x50b1
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, #0x1
        RET
??RST_GetFlagStatus_0:
        CLR       A
        RET
//   65 }
//   66 
//   67 /**
//   68   * @brief  Clears the specified RST flag.
//   69   * @param  RST_Flag : specify the reset flag to clear.
//   70   *         This parameter can be a value of @ref RST_FLAG_TypeDef.
//   71   * @retval None
//   72   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   73 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
//   74 {
//   75   /* Check the parameters */
//   76   assert_param(IS_RST_FLAG(RST_Flag));
//   77 
//   78   RST->SR = (uint8_t)RST_Flag;
RST_ClearFlag:
        LD        L:0x50b1, A
//   79 }
        RET
//   80 
//   81 /**
//   82   * @brief  Configures the reset pad as GP output.
//   83   * @param  None
//   84   * @retval None
//   85   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   86 void RST_GPOutputEnable(void)
//   87 {
//   88 
//   89   RST->CR = RST_CR_MASK;
RST_GPOutputEnable:
        LD        A, #0xd0
        LD        L:0x50b0, A
//   90 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   91 
//   92 /**
//   93   * @}
//   94   */
//   95 
//   96 
//   97 /**
//   98   * @}
//   99   */
//  100 
//  101 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 20 bytes in section .near_func.text
// 
// 20 bytes of CODE memory
//
//Errors: none
//Warnings: none
