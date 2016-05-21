///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:50 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_wfe.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_wfe.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_wfe.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_wfe

        EXTERN ?b0
        EXTERN ?b1

        PUBLIC WFE_DeInit
        PUBLIC WFE_GetWakeUpSourceEventStatus
        PUBLIC WFE_WakeUpSourceEventCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_wfe.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_wfe.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the WFE firmware functions.
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
//   22 #include "stm8l15x_wfe.h"
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
//   36 /** @addtogroup WFE_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the WFE registers to their default reset value.
//   42   * @param  None
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void WFE_DeInit(void)
//   46 {
//   47   WFE->CR1 = WFE_CRX_RESET_VALUE;
WFE_DeInit:
        CLR       A
        LD        L:0x50a6, A
//   48   WFE->CR2 = WFE_CRX_RESET_VALUE;
        LD        L:0x50a7, A
//   49   WFE->CR3 = WFE_CRX_RESET_VALUE;
        LD        L:0x50a8, A
//   50   WFE->CR4 = WFE_CRX_RESET_VALUE;
        LD        L:0x50a9, A
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Set the source that can generate the wake-up event.
//   55   * @param  WFE_Source: The wake-up event source .
//   56   *         This parameter can be a value of @ref WFE_Source_TypeDef enumeration
//   57   * @param  NewState : The wake-up new state.
//   58   *         This parameter can be a value of  @ref FunctionalState enumeration.
//   59   * @retval None
//   60   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   61 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
//   62 {
WFE_WakeUpSourceEventCmd:
        LDW       Y, X
        LD        S:?b1, A
//   63   uint8_t register_index = 0;
//   64   /* Check function parameters */
//   65   assert_param(IS_WFE_SOURCE(WFE_Source));
//   66   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   67 
//   68   /* The mask is reversed in order to  */
//   69   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        EXG       A, XL
        LD        S:?b0, A
//   70 
//   71   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b1
        JREQ      L:??WFE_WakeUpSourceEventCmd_0
//   72   {
//   73     switch (register_index)
        LD        A, S:?b0
        CP        A, #0x1
        JREQ      L:??WFE_WakeUpSourceEventCmd_1
        CP        A, #0x2
        JREQ      L:??WFE_WakeUpSourceEventCmd_2
        CP        A, #0x3
        JREQ      L:??WFE_WakeUpSourceEventCmd_3
        CP        A, #0x4
        JREQ      L:??WFE_WakeUpSourceEventCmd_4
        RET
//   74     {
//   75       case 1:
//   76         WFE->CR1 |= (uint8_t)WFE_Source;
??WFE_WakeUpSourceEventCmd_1:
        LD        A, YL
        OR        A, L:0x50a6
        LD        L:0x50a6, A
//   77         break;
        RET
//   78 
//   79       case 2:
//   80         WFE->CR2 |= (uint8_t)WFE_Source;
??WFE_WakeUpSourceEventCmd_2:
        LD        A, YL
        OR        A, L:0x50a7
        LD        L:0x50a7, A
//   81         break;
        RET
//   82 
//   83       case 3:
//   84         WFE->CR3 |= (uint8_t)WFE_Source;
??WFE_WakeUpSourceEventCmd_3:
        LD        A, YL
        OR        A, L:0x50a8
        LD        L:0x50a8, A
//   85         break;
        RET
//   86 
//   87       case 4:
//   88         WFE->CR4 |= (uint8_t)WFE_Source;
??WFE_WakeUpSourceEventCmd_4:
        LD        A, YL
        OR        A, L:0x50a9
        LD        L:0x50a9, A
//   89         break;
        RET
//   90 
//   91       default:
//   92         break;
//   93     }
//   94   }
//   95   else
//   96   {
//   97     switch (register_index)
??WFE_WakeUpSourceEventCmd_0:
        LD        A, S:?b0
        CP        A, #0x1
        JREQ      L:??WFE_WakeUpSourceEventCmd_5
        CP        A, #0x2
        JREQ      L:??WFE_WakeUpSourceEventCmd_6
        CP        A, #0x3
        JREQ      L:??WFE_WakeUpSourceEventCmd_7
        CP        A, #0x4
        JREQ      L:??WFE_WakeUpSourceEventCmd_8
        RET
//   98     {
//   99       case 1:
//  100         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
??WFE_WakeUpSourceEventCmd_5:
        LD        A, YL
        CPL       A
        AND       A, L:0x50a6
        LD        L:0x50a6, A
//  101         break;
        RET
//  102 
//  103       case 2:
//  104         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
??WFE_WakeUpSourceEventCmd_6:
        LD        A, YL
        CPL       A
        AND       A, L:0x50a7
        LD        L:0x50a7, A
//  105         break;
        RET
//  106 
//  107       case 3:
//  108         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
??WFE_WakeUpSourceEventCmd_7:
        LD        A, YL
        CPL       A
        AND       A, L:0x50a8
        LD        L:0x50a8, A
//  109         break;
        RET
//  110 
//  111       case 4:
//  112         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
??WFE_WakeUpSourceEventCmd_8:
        LD        A, YL
        CPL       A
        AND       A, L:0x50a9
        LD        L:0x50a9, A
//  113         break;
//  114 
//  115       default:
//  116         break;
//  117     }
//  118   }
//  119 }
        RET
//  120 
//  121 /**
//  122   * @brief  Gets the status of the specified source event.
//  123   * @param  WFE_Source: The wake-up event source.
//  124   *         This parameter can be a value of @ref WFE_Source_TypeDef enumeration
//  125   * @retval FunctionalState : Source Event state, ENABLE or DISABLE
//  126   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  127 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
//  128 {
WFE_GetWakeUpSourceEventStatus:
        LDW       Y, X
//  129   FunctionalState status = DISABLE;
        CLR       S:?b0
//  130   /* Check function parameters */
//  131   assert_param(IS_WFE_SOURCE(WFE_Source));
//  132 
//  133   switch (WFE_Source)
        SUBW      X, #0x101
        JRNE      ??lb_0
        JP        L:??WFE_GetWakeUpSourceEventStatus_0
??lb_0:
        DECW      X
        JRNE      ??lb_1
        JP        L:??WFE_GetWakeUpSourceEventStatus_0
??lb_1:
        SUBW      X, #0x2
        JRNE      ??lb_2
        JP        L:??WFE_GetWakeUpSourceEventStatus_0
??lb_2:
        SUBW      X, #0x4
        JRNE      ??lb_3
        JP        L:??WFE_GetWakeUpSourceEventStatus_0
??lb_3:
        SUBW      X, #0x8
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_0
        SUBW      X, #0x10
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_0
        SUBW      X, #0x20
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_0
        SUBW      X, #0x40
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_0
        SUBW      X, #0x81
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        DECW      X
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x2
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x4
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x8
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x10
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x20
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x40
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_1
        SUBW      X, #0x81
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        DECW      X
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x2
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x4
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x8
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x10
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x20
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x40
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_2
        SUBW      X, #0x81
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        DECW      X
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        SUBW      X, #0x2
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        SUBW      X, #0x4
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        SUBW      X, #0x8
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        SUBW      X, #0x10
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        SUBW      X, #0x20
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_3
        JRA       L:??WFE_GetWakeUpSourceEventStatus_4
//  134   {
//  135     case WFE_Source_TIM2_EV0:
//  136     case WFE_Source_TIM2_EV1:
//  137     case WFE_Source_TIM1_EV0:
//  138     case WFE_Source_TIM1_EV1:
//  139     case WFE_Source_EXTI_EV0:
//  140     case WFE_Source_EXTI_EV1:
//  141     case WFE_Source_EXTI_EV2:
//  142     case WFE_Source_EXTI_EV3:
//  143 
//  144       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
??WFE_GetWakeUpSourceEventStatus_0:
        LD        A, YL
        AND       A, L:0x50a6
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_4
//  145       {
//  146         /* The wake-up event source is enabled*/
//  147         status = ENABLE;
??WFE_GetWakeUpSourceEventStatus_5:
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??WFE_GetWakeUpSourceEventStatus_4
//  148       }
//  149       else
//  150       {
//  151         /* The wake-up event source is disabled*/
//  152         status = DISABLE;
//  153       }
//  154       break;
//  155 
//  156     case WFE_Source_EXTI_EV4:
//  157     case WFE_Source_EXTI_EV5:
//  158     case WFE_Source_EXTI_EV6:
//  159     case WFE_Source_EXTI_EV7:
//  160     case WFE_Source_EXTI_EVB_G:
//  161     case WFE_Source_EXTI_EVD_H:
//  162     case WFE_Source_EXTI_EVE_F:
//  163     case WFE_Source_ADC1_COMP_EV:
//  164 
//  165       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
??WFE_GetWakeUpSourceEventStatus_1:
        LD        A, YL
        AND       A, L:0x50a7
        JRNE      L:??WFE_GetWakeUpSourceEventStatus_5
        JRA       L:??WFE_GetWakeUpSourceEventStatus_4
//  166       {
//  167         /* The wake-up event source is enabled*/
//  168         status = ENABLE;
//  169       }
//  170       else
//  171       {
//  172         /* The wake-up event source is disabled*/
//  173         status = DISABLE;
//  174       }
//  175       break;
//  176     case WFE_Source_TIM3_EV0:
//  177     case WFE_Source_TIM3_EV1:
//  178     case WFE_Source_TIM4_EV:
//  179     case WFE_Source_SPI1_EV:
//  180     case WFE_Source_I2C1_EV:
//  181     case WFE_Source_USART1_EV:
//  182     case WFE_Source_DMA1CH01_EV:
//  183     case WFE_Source_DMA1CH23_EV:
//  184 
//  185       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
??WFE_GetWakeUpSourceEventStatus_2:
        LD        A, YL
        AND       A, L:0x50a8
        JRNE      L:??WFE_GetWakeUpSourceEventStatus_5
        JRA       L:??WFE_GetWakeUpSourceEventStatus_4
//  186       {
//  187         /* The wake-up event source is enabled*/
//  188         status = ENABLE;
//  189       }
//  190       else
//  191       {
//  192         /* The wake-up event source is disabled*/
//  193         status = DISABLE;
//  194       }
//  195       break;
//  196 
//  197     case WFE_Source_TIM5_EV0:
//  198     case WFE_Source_TIM5_EV1:
//  199     case WFE_Source_AES_EV:
//  200     case WFE_Source_SPI2_EV:
//  201     case WFE_Source_USART2_EV:
//  202     case WFE_Source_USART3_EV:
//  203     case WFE_Source_RTC_CSS_EV:
//  204 
//  205       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
??WFE_GetWakeUpSourceEventStatus_3:
        LD        A, YL
        AND       A, L:0x50a9
        JRNE      L:??WFE_GetWakeUpSourceEventStatus_5
//  206       {
//  207         /* The wake-up event source is enabled*/
//  208         status = ENABLE;
//  209       }
//  210       else
//  211       {
//  212         /* The wake-up event source is disabled*/
//  213         status = DISABLE;
//  214       }
//  215       break;
//  216     default:
//  217       break;
//  218   }
//  219   return status;
??WFE_GetWakeUpSourceEventStatus_4:
        LD        A, S:?b0
        RET
//  220 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  221 
//  222 /**
//  223   * @}
//  224   */
//  225 
//  226 /**
//  227   * @}
//  228   */
//  229 
//  230 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 354 bytes in section .near_func.text
// 
// 354 bytes of CODE memory
//
//Errors: none
//Warnings: none
