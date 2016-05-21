///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:48 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_aes.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_aes.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_aes.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_aes

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2

        PUBLIC AES_ClearFlag
        PUBLIC AES_ClearITPendingBit
        PUBLIC AES_Cmd
        PUBLIC AES_Config
        PUBLIC AES_DMAConfig
        PUBLIC AES_DeInit
        PUBLIC AES_GetFlagStatus
        PUBLIC AES_GetITStatus
        PUBLIC AES_ITConfig
        PUBLIC AES_ReadSubData
        PUBLIC AES_ReadSubKey
        PUBLIC AES_WriteSubData
        PUBLIC AES_WriteSubKey

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_aes.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_aes.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the AES firmware functions.
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
//   22 #include "stm8l15x_aes.h"
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
//   36 /** @}
//   37   * @addtogroup AES_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief   Deinitializes the AES peripheral.
//   43   * @param   None.
//   44   * @retval  None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void AES_DeInit(void)
//   47 {
//   48   /* Set AES_CR to reset value 0x00, AES_SR is reset by setting ERRC and CCFC bits in CR */
//   49   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
AES_DeInit:
        LD        A, #0x18
        LD        L:0x53d0, A
//   50   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
        CLR       A
        LD        L:0x53d2, A
//   51   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
        LD        L:0x53d3, A
//   52 }
        RET
//   53 
//   54 /**
//   55   * @brief   Configures the AES operation mode.
//   56   * @param   AES_Operation : the selected AES operation mode.
//   57   *          This parameter can be any of the @ref AES_Operation_TypeDef
//   58   *          enumeration.
//   59   * @retval  None
//   60   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   61 void AES_Config(AES_Operation_TypeDef AES_Operation)
//   62 {
AES_Config:
        LD        S:?b0, A
//   63   /* Check the parameter */
//   64   assert_param(IS_AES_MODE(AES_Operation));
//   65 
//   66   /* Reset the operaton mode bits in CR register */
//   67   AES->CR &= (uint8_t) (~AES_CR_MODE);
        LD        A, #0xf9
        AND       A, L:0x53d0
        LD        L:0x53d0, A
//   68 
//   69   /* Set the new operaton mode bits in CR register */
//   70   AES->CR |= (uint8_t) (AES_Operation);
        LD        A, S:?b0
        OR        A, L:0x53d0
        LD        L:0x53d0, A
//   71 }
        RET
//   72 
//   73 /**
//   74   * @brief  Enable the AES peripheral.
//   75   * @param  NewState : The new state of the AES peripheral.
//   76   *         This parameter can be any of the @ref FunctionalState enumeration.
//   77   * @retval None
//   78   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   79 void AES_Cmd(FunctionalState NewState)
//   80 {
//   81   /* Check the parameter */
//   82   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   83 
//   84   if (NewState != DISABLE)
AES_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??AES_Cmd_0
//   85   {
//   86     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
        BSET      L:0x53d0, #0x0
        RET
//   87   }
//   88   else
//   89   {
//   90     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
??AES_Cmd_0:
        BRES      L:0x53d0, #0x0
//   91   }
//   92 }
        RET
//   93 
//   94 /**
//   95   * @brief  Enables or disables the specified AES interrupt.
//   96   * @param  AES_IT: Specifies the AES interrupt source to enable/disable.
//   97   *         This parameter can be any of the @ref AES_IT_TypeDef enumeration.
//   98   * @param  NewState : The new state of the AES peripheral.
//   99   *         This parameter can be any of the @ref FunctionalState enumeration.
//  100   * @retval None
//  101   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  102 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
//  103 {
AES_ITConfig:
        LD        S:?b1, A
//  104   /* Check the parameters */
//  105   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  106   assert_param(IS_AES_IT(AES_IT));
//  107 
//  108   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??AES_ITConfig_0
//  109   {
//  110     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
        LD        A, S:?b1
        OR        A, L:0x53d0
        LD        L:0x53d0, A
        RET
//  111   }
//  112   else
//  113   {
//  114     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT IDisable */
??AES_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x53d0
        LD        L:0x53d0, A
//  115   }
//  116 }
        RET
//  117 /**
//  118   * @brief  Write data in DINR register to be processed by AES peripheral.
//  119   * @param  Data: The data to be processed.
//  120   * @retval None
//  121   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  122 void AES_WriteSubData(uint8_t Data)
//  123 {
//  124   /* Write Data */
//  125   AES->DINR = Data;
AES_WriteSubData:
        LD        L:0x53d2, A
//  126 }
        RET
//  127 
//  128 /**
//  129   * @brief  Write key in DINR register.
//  130   * @param  Key: The key to be used for encryption/decryption.
//  131   * @retval None
//  132   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 void AES_WriteSubKey(uint8_t Key)
//  134 {
//  135   /* Write key */
//  136   AES->DINR = Key;
AES_WriteSubKey:
        LD        L:0x53d2, A
//  137 }
        RET
//  138 
//  139 /**
//  140   * @brief  Returns the data in DOUTR register processed by AES peripheral.
//  141   * @retval The processed data.
//  142   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  143 uint8_t AES_ReadSubData(void)
//  144 {
//  145   return AES->DOUTR;
AES_ReadSubData:
        LD        A, L:0x53d3
        RET
//  146 }
//  147 
//  148 /**
//  149   * @brief  Returns the DOUTR register content.
//  150   * @retval The derivation key.
//  151   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  152 uint8_t AES_ReadSubKey(void)
//  153 {
//  154   return AES->DOUTR;
AES_ReadSubKey:
        LD        A, L:0x53d3
        RET
//  155 }
//  156 /**
//  157   * @brief  Configures the AES DMA interface.
//  158   * @param  AES_DMATransfer: Specifies the AES DMA transfer.
//  159   *         This parameter can be any of the @ref AES_DMATransfer_TypeDef
//  160   *         enumeration.
//  161   * @param  NewState Indicates the new state of the AES DMA interface.
//  162   *         This parameter can be any of the @ref FunctionalState enumeration.
//  163   * @retval None
//  164   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  165 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
//  166 {
AES_DMAConfig:
        LD        S:?b1, A
//  167   /* Check the parameter */
//  168   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
//  169 
//  170   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??AES_DMAConfig_0
//  171   {
//  172     /* Enable the DMA transfer */
//  173     AES->CR |= (uint8_t) AES_DMATransfer;
        LD        A, S:?b1
        OR        A, L:0x53d0
        LD        L:0x53d0, A
        RET
//  174   }
//  175   else
//  176   {
//  177     /* Disable the DMA transfer */
//  178     AES->CR &= (uint8_t)(~AES_DMATransfer);
??AES_DMAConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x53d0
        LD        L:0x53d0, A
//  179   }
//  180 }
        RET
//  181 
//  182 /**
//  183   * @brief  Checks whether the specified AES flag is set or not.
//  184   * @param  AES_FLAG specifies the flag to check.
//  185   *         This parameter can be any of the @ref AES_FLAG_TypeDef enumeration.
//  186   * @retval FlagStatus (SET or RESET)
//  187   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  188 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
//  189 {
//  190   FlagStatus status = RESET;
//  191 
//  192   /* Check parameters */
//  193   assert_param(IS_AES_FLAG(AES_FLAG));
//  194 
//  195   if (AES_FLAG == AES_FLAG_CCF)
AES_GetFlagStatus:
        CP        A, #0x1
        JRNE      L:??AES_GetFlagStatus_0
//  196   {
//  197     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
        LD        A, L:0x53d1
//  198     {
//  199       /* Computation Complete Flag CCF is set */
//  200       status = (FlagStatus) SET;
//  201     }
//  202     else
//  203     {
//  204       /* Computation Complete Flag CCF is reset */
//  205       status = (FlagStatus) RESET;
        AND       A, #0x1
        RET
//  206     }
//  207   }
//  208   else if (AES_FLAG == AES_FLAG_RDERR)
??AES_GetFlagStatus_0:
        CP        A, #0x2
        JRNE      L:??AES_GetFlagStatus_1
//  209   {
//  210     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
        LD        A, L:0x53d1
//  211     {
//  212       /* Read Error Flag RDERR is set */
//  213       status = (FlagStatus) SET;
//  214     }
//  215     else
//  216     {
//  217       /* Read Error Flag RDERR is reset */
//  218       status = (FlagStatus) RESET;
        AND       A, #0x2
        JREQ      L:??AES_GetFlagStatus_2
        LD        A, #0x1
        RET
??AES_GetFlagStatus_2:
        CLR       A
        RET
//  219     }
//  220   }
//  221   else
//  222   {
//  223     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
??AES_GetFlagStatus_1:
        LD        A, L:0x53d1
//  224     {
//  225       /* Write Error Flag WRERR is set */
//  226       status = (FlagStatus) SET;
//  227     }
//  228     else
//  229     {
//  230       /* Write Error Flag WRERR is reset */
//  231       status = (FlagStatus) RESET;
        AND       A, #0x4
        JREQ      L:??AES_GetFlagStatus_3
        LD        A, #0x1
        RET
??AES_GetFlagStatus_3:
        CLR       A
//  232     }
//  233   }
//  234   /* Return the AES_FLAG status */
//  235   return ((FlagStatus) status);
        RET
//  236 }
//  237 
//  238 /**
//  239   * @brief  Clears the AES flags.
//  240   * @param  AES_FLAG: specifies the flag to clear.
//  241   *         This parameter can be any of the @ref AES_FLAG_TypeDef enumeration.
//  242   * @retval None
//  243   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  244 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
//  245 {
//  246   /* Check the parameters */
//  247   assert_param(IS_AES_FLAG(AES_FLAG));
//  248 
//  249   /* Check if AES_FLAG is AES_FLAG_CCF */
//  250   if (AES_FLAG == AES_FLAG_CCF)
AES_ClearFlag:
        CP        A, #0x1
        JRNE      L:??AES_ClearFlag_0
//  251   {
//  252     /* Clear CCF flag by setting CCFC bit */
//  253     AES->CR |= (uint8_t) AES_CR_CCFC;
        BSET      L:0x53d0, #0x3
        RET
//  254   }
//  255   else /* AES_FLAG is AES_FLAG_RDERR or AES_FLAG_WRERR */
//  256   {
//  257     /* Clear RDERR and WRERR flags by setting ERRC bit */
//  258     AES->CR |= (uint8_t) AES_CR_ERRC;
??AES_ClearFlag_0:
        BSET      L:0x53d0, #0x4
//  259   }
//  260 }
        RET
//  261 
//  262 /**
//  263   * @brief  Checks whether the specified AES interrupt has occurred or not.
//  264   * @param  AES_IT: Specifies the AES interrupt pending bit to check.
//  265   *         This parameter can be any of the @ref AES_IT_TypeDef enumeration.
//  266   * @retval ITStatus The new state of AES_IT (SET or RESET).
//  267   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  268 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
//  269 {
AES_GetITStatus:
        LD        S:?b0, A
//  270   ITStatus itstatus = RESET;
//  271   BitStatus cciebitstatus, ccfbitstatus = RESET;
//  272 
//  273   /* Check parameters */
//  274   assert_param(IS_AES_IT(AES_IT));
//  275 
//  276   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
        LD        A, L:0x53d0
        LD        S:?b1, A
//  277   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
        LD        A, L:0x53d1
        LD        S:?b2, A
//  278 
//  279   /* Check if AES_IT is AES_IT_CCIE */
//  280   if (AES_IT == AES_IT_CCIE)
        LD        A, S:?b0
        CP        A, #0x20
        JRNE      L:??AES_GetITStatus_0
//  281   {
//  282     /* Check the status of the specified AES interrupt */
//  283     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
//  284     {
//  285       /* Interrupt occurred */
//  286       itstatus = (ITStatus) SET;
//  287     }
//  288     else
//  289     {
//  290       /* Interrupt not occurred */
//  291       itstatus = (ITStatus) RESET;
        LD        A, S:?b1
        AND       A, #0x20
        JREQ      L:??AES_GetITStatus_1
        LD        A, S:?b2
        AND       A, #0x1
        JREQ      L:??AES_GetITStatus_1
        LD        A, #0x1
        RET
??AES_GetITStatus_1:
        CLR       A
        RET
//  292     }
//  293   }
//  294   else /* AES_IT is AES_IT_ERRIE */
//  295   {
//  296     /* Check the status of the specified AES interrupt */
//  297     if ((AES->CR & AES_CR_ERRIE) != RESET)
??AES_GetITStatus_0:
        LD        A, #0x40
        AND       A, L:0x53d0
        JREQ      L:??AES_GetITStatus_2
//  298     {
//  299       /* Check if WRERR or RDERR flags are set */
//  300       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
        LD        A, #0x6
        AND       A, L:0x53d1
        JREQ      L:??AES_GetITStatus_2
//  301       {
//  302         /* Interrupt occurred */
//  303         itstatus = (ITStatus) SET;
        LD        A, #0x1
        RET
//  304       }
//  305       else
//  306       {
//  307         /* Interrupt not occurred */
//  308         itstatus = (ITStatus) RESET;
??AES_GetITStatus_2:
        CLR       A
//  309       }
//  310     }
//  311     else
//  312     {
//  313       /* Interrupt not occurred */
//  314       itstatus = (ITStatus) RESET;
//  315     }
//  316   }
//  317 
//  318   /* Return the AES_IT status */
//  319   return ((ITStatus)itstatus);
        RET
//  320 }
//  321 
//  322 /**
//  323   * @brief  Clears the AES's interrupt pending bits.
//  324   * @param  AES_IT: specifies the interrupt pending bit to clear.
//  325   *         This parameter can be any of the @ref AES_IT_TypeDef enumeration.
//  326   * @retval None
//  327   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  328 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
//  329 {
//  330   /* Check the parameters */
//  331   assert_param(IS_AES_IT(AES_IT));
//  332 
//  333   /* Check if AES_IT is AES_IT_CCIE */
//  334   if (AES_IT == AES_IT_CCIE)
AES_ClearITPendingBit:
        CP        A, #0x20
        JRNE      L:??AES_ClearITPendingBit_0
//  335   {
//  336     /* Clear CCF flag by setting CCFC bit */
//  337     AES->CR |= (uint8_t) AES_CR_CCFC;
        BSET      L:0x53d0, #0x3
        RET
//  338   }
//  339   else /* AES_IT is AES_IT_ERRIE */
//  340   {
//  341     /* Clear RDERR and WRERR flags by setting ERRC bit */
//  342     AES->CR |= (uint8_t) AES_CR_ERRC;
??AES_ClearITPendingBit_0:
        BSET      L:0x53d0, #0x4
//  343   }
//  344 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  345 
//  346 
//  347 /**
//  348   * @}
//  349   */
//  350 
//  351 /**
//  352   * @}
//  353   */
//  354 
//  355 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 242 bytes in section .near_func.text
// 
// 242 bytes of CODE memory
//
//Errors: none
//Warnings: none
