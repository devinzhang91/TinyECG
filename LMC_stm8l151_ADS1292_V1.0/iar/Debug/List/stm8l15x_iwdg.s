///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:48 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_iwdg.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_iwdg.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_iwdg.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_iwdg

        PUBLIC IWDG_Enable
        PUBLIC IWDG_ReloadCounter
        PUBLIC IWDG_SetPrescaler
        PUBLIC IWDG_SetReload
        PUBLIC IWDG_WriteAccessCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_iwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8l15x_iwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the IWDG firmware functions.
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
//   22 #include "stm8l15x_iwdg.h"
//   23 
//   24 /** @addtogroup STM8L15x_StdPeriph_Driver
//   25   * @{
//   26   */
//   27 
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 /* Public functions ----------------------------------------------------------*/
//   35 
//   36 /** @addtogroup IWDG_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Enables or disables write access to Prescaler and Reload registers.
//   42   * @param  IWDG_WriteAccess : New state of write access to Prescaler and Reload
//   43   *         registers.  This parameter can be a value of @ref IWDG_WriteAccess_TypeDef.
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
//   47 {
//   48   /* Check the parameters */
//   49   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
//   50   IWDG->KR = IWDG_WriteAccess; /* Write Access */
IWDG_WriteAccessCmd:
        LD        L:0x50e0, A
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Sets IWDG Prescaler value.
//   55   * @note   Write access should be enabled
//   56   * @param  IWDG_Prescaler : Specifies the IWDG Prescaler value.
//   57   *         This parameter can be a value of @ref IWDG_Prescaler_TypeDef.
//   58   * @retval None
//   59   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
//   61 {
//   62   /* Check the parameters */
//   63   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
//   64   IWDG->PR = IWDG_Prescaler;
IWDG_SetPrescaler:
        LD        L:0x50e1, A
//   65 }
        RET
//   66 
//   67 /**
//   68   * @brief  Sets IWDG Reload value.
//   69   * @note   Write access should be enabled
//   70   * @param  IWDG_Reload : Reload register value.
//   71   *         This parameter must be a number between 0 and 0xFF.
//   72   * @retval None
//   73   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 void IWDG_SetReload(uint8_t IWDG_Reload)
//   75 {
//   76   IWDG->RLR = IWDG_Reload;
IWDG_SetReload:
        LD        L:0x50e2, A
//   77 }
        RET
//   78 
//   79 /**
//   80   * @brief  Reloads IWDG counter
//   81   * @note   Write access should be enabled
//   82   * @param  None
//   83   * @retval None
//   84   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void IWDG_ReloadCounter(void)
//   86 {
//   87   IWDG->KR = IWDG_KEY_REFRESH;
IWDG_ReloadCounter:
        LD        A, #0xaa
        LD        L:0x50e0, A
//   88 }
        RET
//   89 
//   90 /**
//   91   * @brief  Enables IWDG.
//   92   * @param  None
//   93   * @retval None
//   94   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   95 void IWDG_Enable(void)
//   96 {
//   97   IWDG->KR = IWDG_KEY_ENABLE;
IWDG_Enable:
        LD        A, #0xcc
        LD        L:0x50e0, A
//   98 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   99 
//  100 /**
//  101   * @}
//  102   */
//  103 
//  104 /**
//  105   * @}
//  106   */
//  107 
//  108 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 24 bytes in section .near_func.text
// 
// 24 bytes of CODE memory
//
//Errors: none
//Warnings: none
