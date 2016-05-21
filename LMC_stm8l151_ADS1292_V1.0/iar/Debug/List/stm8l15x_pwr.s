///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:44 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_pwr.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_pwr.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_pwr.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_pwr

        EXTERN ?b0
        EXTERN ?b1

        PUBLIC PWR_DeInit
        PUBLIC PWR_FastWakeUpCmd
        PUBLIC PWR_GetFlagStatus
        PUBLIC PWR_PVDClearFlag
        PUBLIC PWR_PVDClearITPendingBit
        PUBLIC PWR_PVDCmd
        PUBLIC PWR_PVDGetITStatus
        PUBLIC PWR_PVDITConfig
        PUBLIC PWR_PVDLevelConfig
        PUBLIC PWR_UltraLowPowerCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_pwr.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_pwr.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the PWR firmware functions.
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
//   22 #include "stm8l15x_pwr.h"
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
//   36 /**
//   37   * @addtogroup PWR_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Deinitializes the PWR peripheral registers to their default reset values.
//   43   * @param  None
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void PWR_DeInit(void)
//   47 {
//   48   PWR->CSR1 = PWR_CSR1_PVDIF;
PWR_DeInit:
        LD        A, #0x20
        LD        L:0x50b2, A
//   49   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
        CLR       A
        LD        L:0x50b3, A
//   50 }
        RET
//   51 
//   52 /**
//   53   * @brief  Enable or disable the PWR fast wake up function.
//   54   * @param  NewState : Indicates the new state of the PWR fast wake up .
//   55   * @retval None
//   56   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 void PWR_FastWakeUpCmd(FunctionalState NewState)
//   58 {
//   59   /* Check the parameters */
//   60   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   61 
//   62   if (NewState != DISABLE)
PWR_FastWakeUpCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??PWR_FastWakeUpCmd_0
//   63   {
//   64     /* Enable the PWR FWU */
//   65     PWR->CSR2 |= PWR_CSR2_FWU;
        BSET      L:0x50b3, #0x2
        RET
//   66   }
//   67   else
//   68   {
//   69     /* Disable the PWR FWU */
//   70     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
??PWR_FastWakeUpCmd_0:
        BRES      L:0x50b3, #0x2
//   71   }
//   72 }
        RET
//   73 
//   74 /**
//   75   * @brief  Enable or disable the PWR Ultra Low Power (ULP) function.
//   76   * @param  NewState :  Indicates the new state of the PWR ULP.
//   77   * @retval None
//   78   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   79 void PWR_UltraLowPowerCmd(FunctionalState NewState)
//   80 {
//   81   /* Check the parameters */
//   82   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   83 
//   84   if (NewState != DISABLE)
PWR_UltraLowPowerCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??PWR_UltraLowPowerCmd_0
//   85   {
//   86     /* Enable the PWR ULP */
//   87     PWR->CSR2 |= PWR_CSR2_ULP;
        BSET      L:0x50b3, #0x1
        RET
//   88   }
//   89   else
//   90   {
//   91     /* Disable the PWR ULP */
//   92     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
??PWR_UltraLowPowerCmd_0:
        BRES      L:0x50b3, #0x1
//   93   }
//   94 }
        RET
//   95 
//   96 /**
//   97   * @brief  Enable or disable the PWR Programmable Voltage Detector (PVD) function.
//   98   * @param  NewState : Indicates the new state of the PWR PVD.
//   99   * @retval None
//  100   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  101 void PWR_PVDCmd(FunctionalState NewState)
//  102 {
//  103   /* Check the parameters */
//  104   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  105 
//  106   if (NewState != DISABLE)
PWR_PVDCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??PWR_PVDCmd_0
//  107   {
//  108     /* Enable the PWR PVD */
//  109     PWR->CSR1 |= PWR_CSR1_PVDE;
        BSET      L:0x50b2, #0x0
        RET
//  110   }
//  111   else
//  112   {
//  113     /* Disable the PWR PVD */
//  114     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
??PWR_PVDCmd_0:
        BRES      L:0x50b2, #0x0
//  115   }
//  116 }
        RET
//  117 
//  118 /**
//  119   * @brief  Configures the Programmable Voltage Detector (PVD) Interrupt .
//  120   * @param  NewState : Indicates the new state of the PVD interrupt.
//  121   * @retval None
//  122   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  123 void PWR_PVDITConfig(FunctionalState NewState)
//  124 {
//  125   /* Check the parameters */
//  126   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  127 
//  128   if (NewState != DISABLE)
PWR_PVDITConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??PWR_PVDITConfig_0
//  129   {
//  130     /* Enable the PVD interrupt */
//  131     PWR->CSR1 |= PWR_CSR1_PVDIEN;
        BSET      L:0x50b2, #0x4
        RET
//  132   }
//  133   else
//  134   {
//  135     /* Disable the PVD interrupt */
//  136     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
??PWR_PVDITConfig_0:
        BRES      L:0x50b2, #0x4
//  137   }
//  138 }
        RET
//  139 
//  140 /**
//  141   * @brief  Configures the Programmable Voltage Detector (PVD)  levels .
//  142   * @param  PWR_PVDLevel : Indicates the new level of the PWR PVD.
//  143   *         This paramter can be value of @ref PWR_PVDLevel_TypeDef
//  144   * @retval None
//  145   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  146 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
//  147 {
PWR_PVDLevelConfig:
        LD        S:?b0, A
//  148   /* Check the parameters */
//  149   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
//  150 
//  151   /* Clear the PVD level */
//  152   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
        LD        A, #0xf1
        AND       A, L:0x50b2
        LD        L:0x50b2, A
//  153 
//  154   /* Configure the PVD level */
//  155   PWR->CSR1 |= PWR_PVDLevel;
        LD        A, S:?b0
        OR        A, L:0x50b2
        LD        L:0x50b2, A
//  156 
//  157 }
        RET
//  158 
//  159 /**
//  160   * @brief  Checks whether the specified PWR flag is set or not.
//  161   * @param  PWR_FLAG : Flag to check.
//  162   *         This paramter can be value of @ref PWR_Flag_TypeDef
//  163   * @retval FlagStatus: status of the checked flag
//  164   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  165 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
//  166 {
PWR_GetFlagStatus:
        LD        S:?b0, A
//  167   FlagStatus bitstatus = RESET;
//  168 
//  169   /* Check the parameters */
//  170   assert_param(IS_PWR_FLAG(PWR_FLAG));
//  171 
//  172   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
        AND       A, #0x1
        JREQ      L:??PWR_GetFlagStatus_0
//  173   {
//  174     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
        LD        A, L:0x50b3
//  175     {
//  176       bitstatus = SET;
//  177     }
//  178     else
//  179     {
//  180       bitstatus = RESET;
        AND       A, #0x1
        RET
//  181     }
//  182   }
//  183   else
//  184   {
//  185     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
??PWR_GetFlagStatus_0:
        LD        A, S:?b0
        AND       A, L:0x50b2
        JREQ      L:??PWR_GetFlagStatus_1
//  186     {
//  187       bitstatus = SET;
        LD        A, #0x1
        RET
//  188     }
//  189     else
//  190     {
//  191       bitstatus = RESET;
??PWR_GetFlagStatus_1:
        CLR       A
//  192     }
//  193   }
//  194 
//  195   /* Return the flag status */
//  196   return((FlagStatus)bitstatus);
        RET
//  197 }
//  198 /**
//  199   * @brief  Clears the PWR PVDIF Flag.
//  200   * @param  None
//  201   * @retval None
//  202   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  203 void PWR_PVDClearFlag(void)
//  204 {
//  205   /* Set the PVDIF to clear it */
//  206   PWR->CSR1 |= PWR_CSR1_PVDIF;
PWR_PVDClearFlag:
        BSET      L:0x50b2, #0x5
//  207 }
        RET
//  208 
//  209 /**
//  210   * @brief  Checks whether the PVD interrupt has occurred or not.
//  211   * @param  None
//  212   * @retval ITStatus : The new state of the PVD Interrupt.
//  213   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 ITStatus PWR_PVDGetITStatus(void)
//  215 {
//  216   ITStatus bitstatus = RESET;
//  217 
//  218   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
//  219 
//  220   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
PWR_PVDGetITStatus:
        LD        A, L:0x50b2
        LD        S:?b0, A
//  221   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
        LD        A, L:0x50b2
//  222 
//  223   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
//  224   {
//  225     bitstatus = (ITStatus)SET;
//  226   }
//  227   else
//  228   {
//  229     bitstatus = (ITStatus)RESET;
//  230   }
//  231   return ((ITStatus)bitstatus);
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        LD        S:?b1, A
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        AND       A, S:?b1
        RET
//  232 }
//  233 
//  234 /**
//  235   * @brief  Clears the PWR interrupt pending bit.
//  236   * @param  None
//  237   * @retval None
//  238   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  239 void PWR_PVDClearITPendingBit(void)
//  240 {
//  241   /* Set the PVDIF to clear it */
//  242   PWR->CSR1 |= PWR_CSR1_PVDIF;
PWR_PVDClearITPendingBit:
        BSET      L:0x50b2, #0x5
//  243 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  244 
//  245 /**
//  246   * @}
//  247   */
//  248 
//  249 /**
//  250   * @}
//  251   */
//  252 
//  253 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 169 bytes in section .near_func.text
// 
// 169 bytes of CODE memory
//
//Errors: none
//Warnings: none
