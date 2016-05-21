///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:52 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim4.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim4.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_tim4.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_tim4

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2

        PUBLIC TIM4_ARRPreloadConfig
        PUBLIC TIM4_ClearFlag
        PUBLIC TIM4_ClearITPendingBit
        PUBLIC TIM4_Cmd
        PUBLIC TIM4_DMACmd
        PUBLIC TIM4_DeInit
        PUBLIC TIM4_GenerateEvent
        PUBLIC TIM4_GetCounter
        PUBLIC TIM4_GetFlagStatus
        PUBLIC TIM4_GetITStatus
        PUBLIC TIM4_GetPrescaler
        PUBLIC TIM4_ITConfig
        PUBLIC TIM4_InternalClockConfig
        PUBLIC TIM4_PrescalerConfig
        PUBLIC TIM4_SelectInputTrigger
        PUBLIC TIM4_SelectMasterSlaveMode
        PUBLIC TIM4_SelectOnePulseMode
        PUBLIC TIM4_SelectOutputTrigger
        PUBLIC TIM4_SelectSlaveMode
        PUBLIC TIM4_SetAutoreload
        PUBLIC TIM4_SetCounter
        PUBLIC TIM4_TimeBaseInit
        PUBLIC TIM4_UpdateDisableConfig
        PUBLIC TIM4_UpdateRequestConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim4.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_tim4.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the TIM4 firmware functions.
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
//   23 #include "stm8l15x_tim4.h"
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
//   34 /**
//   35   * @addtogroup TIM4_Public_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Deinitializes the TIM4 peripheral registers to their default reset values.
//   41   * @param  None
//   42   * @retval None
//   43   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 void TIM4_DeInit(void)
//   45 {
//   46   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
TIM4_DeInit:
        CLR       A
        LD        L:0x52e0, A
//   47   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
        LD        L:0x52e1, A
//   48   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
        LD        L:0x52e2, A
//   49   TIM4->IER   = TIM4_IER_RESET_VALUE;
        LD        L:0x52e4, A
//   50   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
        LD        L:0x52e7, A
//   51   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
        LD        L:0x52e8, A
//   52   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x52e9, A
//   53   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
        CLR       A
        LD        L:0x52e5, A
//   54 }
        RET
//   55 
//   56 /**
//   57   * @brief  Initializes the TIM4 Time Base Unit according to the specified parameters.
//   58   * @param  TIM4_Prescaler : This parameter can be any of the @Ref TIM2_Prescaler_TypeDef enumeration.
//   59   * @param  TIM4_Period : This parameter must be a value between 0x00 and 0xFF.
//   60   * @retval None
//   61   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   62 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
//   63                        uint8_t TIM4_Period)
//   64 {
TIM4_TimeBaseInit:
        LD        S:?b1, A
//   65   /* Check TIM4 prescaler value */
//   66   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
//   67   /* Set the Autoreload value */
//   68   TIM4->ARR = (uint8_t)(TIM4_Period);
        LD        A, S:?b0
        LD        L:0x52e9, A
//   69   /* Set the Prescaler value */
//   70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
        LD        A, S:?b1
        LD        L:0x52e8, A
//   71 
//   72   /* Generate an update event to reload the Prescaler value immediately */
//   73   TIM4->EGR = TIM4_EventSource_Update;
        LD        A, #0x1
        LD        L:0x52e6, A
//   74 }
        RET
//   75 
//   76 /**
//   77   * @brief  Enables or disables the TIM4 peripheral.
//   78   * @param  NewState : The new state of the TIM4 peripheral.
//   79   *   This parameter can be any of the @ref FunctionalState enumeration.
//   80   * @retval None
//   81   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 void TIM4_Cmd(FunctionalState NewState)
//   83 {
//   84   /* Check the parameters */
//   85   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   86 
//   87   /* set or Reset the CEN Bit */
//   88   if (NewState != DISABLE)
TIM4_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM4_Cmd_0
//   89   {
//   90     TIM4->CR1 |= TIM4_CR1_CEN ;
        BSET      L:0x52e0, #0x0
        RET
//   91   }
//   92   else
//   93   {
//   94     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
??TIM4_Cmd_0:
        BRES      L:0x52e0, #0x0
//   95   }
//   96 }
        RET
//   97 
//   98 /**
//   99   * @brief  Enables or Disables the TIM4 Update event.
//  100   * @param  NewState : The new state of the TIM4 peripheral Preload register.
//  101   *   This parameter can be any of the @ref FunctionalState enumeration.
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 void TIM4_UpdateDisableConfig(FunctionalState NewState)
//  105 {
//  106   /* Check the parameters */
//  107   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  108 
//  109   /* Set or Reset the UDIS Bit */
//  110   if (NewState != DISABLE)
TIM4_UpdateDisableConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM4_UpdateDisableConfig_0
//  111   {
//  112     TIM4->CR1 |= TIM4_CR1_UDIS ;
        BSET      L:0x52e0, #0x1
        RET
//  113   }
//  114   else
//  115   {
//  116     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
??TIM4_UpdateDisableConfig_0:
        BRES      L:0x52e0, #0x1
//  117   }
//  118 }
        RET
//  119 
//  120 /**
//  121   * @brief  Selects the TIM4 Update Request Interrupt source.
//  122   * @param  TIM4_UpdateSource : Specifies the Update source.
//  123   *   This parameter can be one of the @ref TIM4_UpdateSource_TypeDef enumeration.
//  124   * @retval None
//  125   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  126 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
//  127 {
//  128   /* Check the parameters */
//  129   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
//  130 
//  131   /* Set or Reset the URS Bit */
//  132   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
TIM4_UpdateRequestConfig:
        CP        A, #0x1
        JRNE      L:??TIM4_UpdateRequestConfig_0
//  133   {
//  134     TIM4->CR1 |= TIM4_CR1_URS ;
        BSET      L:0x52e0, #0x2
        RET
//  135   }
//  136   else
//  137   {
//  138     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
??TIM4_UpdateRequestConfig_0:
        BRES      L:0x52e0, #0x2
//  139   }
//  140 }
        RET
//  141 
//  142 /**
//  143   * @brief  Selects the TIM4’s One Pulse Mode.
//  144   * @param  TIM4_OPMode : Specifies the OPM Mode to be used.
//  145   *   This parameter can be one of the @ref TIM4_OPMode_TypeDef enumeration.
//  146   * @retval None
//  147   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  148 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
//  149 {
//  150   /* Check the parameters */
//  151   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
//  152 
//  153   /* Set or Reset the OPM Bit */
//  154   if (TIM4_OPMode == TIM4_OPMode_Single)
TIM4_SelectOnePulseMode:
        CP        A, #0x1
        JRNE      L:??TIM4_SelectOnePulseMode_0
//  155   {
//  156     TIM4->CR1 |= TIM4_CR1_OPM ;
        BSET      L:0x52e0, #0x3
        RET
//  157   }
//  158   else
//  159   {
//  160     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
??TIM4_SelectOnePulseMode_0:
        BRES      L:0x52e0, #0x3
//  161   }
//  162 
//  163 }
        RET
//  164 
//  165 /**
//  166   * @brief  Configures the TIM4 Prescaler.
//  167   * @param  Prescaler : Specifies the Prescaler Register value
//  168   *   This parameter can be one of the @ref TIM4_Prescaler_TypeDef enumeration.
//  169   * @param  TIM4_PSCReloadMode : Specifies the TIM4 Prescaler Reload mode.
//  170   *   This parameter can be one of the @ref TIM4_PSCReloadMode_TypeDef enumeration.
//  171   * @retval None
//  172   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  173 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
//  174                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
//  175 {
//  176   /* Check the parameters */
//  177   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
//  178   assert_param(IS_TIM4_Prescaler(Prescaler));
//  179 
//  180   /* Set the Prescaler value */
//  181   TIM4->PSCR = (uint8_t) Prescaler;
TIM4_PrescalerConfig:
        LD        L:0x52e8, A
//  182 
//  183   /* Set or reset the UG Bit */
//  184   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM4_PrescalerConfig_0
//  185   {
//  186     TIM4->EGR |= TIM4_EGR_UG ;
        BSET      L:0x52e6, #0x0
        RET
//  187   }
//  188   else
//  189   {
//  190     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
??TIM4_PrescalerConfig_0:
        BRES      L:0x52e6, #0x0
//  191   }
//  192 }
        RET
//  193 
//  194 /**
//  195   * @brief  Enables or disables TIM4 peripheral Preload register on ARR.
//  196   * @param  NewState : The new state of the TIM4 peripheral Preload register.
//  197   *   This parameter can be any of the @ref FunctionalState enumeration.
//  198   * @retval None
//  199   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  200 void TIM4_ARRPreloadConfig(FunctionalState NewState)
//  201 {
//  202   /* Check the parameters */
//  203   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  204 
//  205   /* Set or Reset the ARPE Bit */
//  206   if (NewState != DISABLE)
TIM4_ARRPreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM4_ARRPreloadConfig_0
//  207   {
//  208     TIM4->CR1 |= TIM4_CR1_ARPE ;
        BSET      L:0x52e0, #0x7
        RET
//  209   }
//  210   else
//  211   {
//  212     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
??TIM4_ARRPreloadConfig_0:
        BRES      L:0x52e0, #0x7
//  213   }
//  214 }
        RET
//  215 
//  216 /**
//  217   * @brief  Sets the TIM4 Counter Register value.
//  218   * @param  Counter : Specifies the Counter register new value.
//  219   *   This parameter is between 0x00 and 0xFF.
//  220   * @retval None
//  221   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  222 void TIM4_SetCounter(uint8_t Counter)
//  223 {
//  224   /* Set the Counter Register value */
//  225   TIM4->CNTR = (uint8_t)(Counter);
TIM4_SetCounter:
        LD        L:0x52e7, A
//  226 }
        RET
//  227 
//  228 /**
//  229   * @brief  Sets the TIM4 Autoreload Register value.
//  230   * @param  Autoreload : Specifies the Autoreload register new value.
//  231   *   This parameter is between 0x00 and 0xFF.
//  232   * @retval None
//  233   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  234 void TIM4_SetAutoreload(uint8_t Autoreload)
//  235 {
//  236 
//  237   /* Set the Autoreload Register value */
//  238   TIM4->ARR = (uint8_t)(Autoreload);
TIM4_SetAutoreload:
        LD        L:0x52e9, A
//  239 }
        RET
//  240 
//  241 /**
//  242   * @brief  Gets the TIM4 Counter value.
//  243   * @param  None
//  244   * @retval Counter Register value.
//  245   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  246 uint8_t TIM4_GetCounter(void)
//  247 {
//  248   uint8_t tmpcntr = 0;
//  249   tmpcntr = TIM4->CNTR;
TIM4_GetCounter:
        LD        A, L:0x52e7
//  250   /* Get the Counter Register value */
//  251   return ((uint8_t)tmpcntr);
        RET
//  252 }
//  253 
//  254 /**
//  255   * @brief  Gets the TIM4 Prescaler value.
//  256   * @param  None
//  257   * @retval TIM4_Prescaler_TypeDef : Prescaler Register configuration value.
//  258   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  259 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
//  260 {
//  261   /* Get the Prescaler Register value */
//  262   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
TIM4_GetPrescaler:
        LD        A, L:0x52e8
        RET
//  263 }
//  264 
//  265 /**
//  266   * @brief  Enables or disables the specified TIM4 interrupts.
//  267   * @param  TIM4_IT : Specifies the TIM4 interrupts sources to be enabled or disabled.
//  268   *   This parameter can be any combination of the @ref TIM4_IT_TypeDef enumeration.
//  269   * @param  NewState : The new state of the TIM4 peripheral.
//  270   *   This parameter can be any of the @ref FunctionalState enumeration.
//  271   * @retval None
//  272   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  273 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
//  274 {
TIM4_ITConfig:
        LD        S:?b1, A
//  275   /* Check the parameters */
//  276   assert_param(IS_TIM4_IT(TIM4_IT));
//  277   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  278 
//  279   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM4_ITConfig_0
//  280   {
//  281     /* Enable the Interrupt sources */
//  282     TIM4->IER |= (uint8_t)TIM4_IT;
        LD        A, S:?b1
        OR        A, L:0x52e4
        LD        L:0x52e4, A
        RET
//  283   }
//  284   else
//  285   {
//  286     /* Disable the Interrupt sources */
//  287     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
??TIM4_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x52e4
        LD        L:0x52e4, A
//  288   }
//  289 }
        RET
//  290 
//  291 /**
//  292   * @brief  Configures the TIM4 event to be generated by software.
//  293   * @param  TIM4_EventSource : Specifies the event source.
//  294   *   This parameter can be one of the @ref TIM4_EventSource_TypeDef enumeration.
//  295   * @retval None
//  296   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  297 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
//  298 {
//  299   /* Check the parameters */
//  300   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
//  301 
//  302   /* Set the event sources */
//  303   TIM4->EGR |= (uint8_t)TIM4_EventSource;
TIM4_GenerateEvent:
        OR        A, L:0x52e6
        LD        L:0x52e6, A
//  304 }
        RET
//  305 
//  306 /**
//  307   * @brief  Enables or disables the TIMx’s DMA Requests.
//  308   * @param  TIM4_DMASources: specifies the DMA Request sources.
//  309   *   This parameter can any combination  of the @ref TIM4_DMA_Source_TypeDef enumeration.
//  310   * @param  NewState: new state of the DMA Request sources.
//  311   *   This parameter can be: ENABLE or DISABLE.
//  312   * @retval None
//  313   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  314 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
//  315 {
TIM4_DMACmd:
        LD        S:?b1, A
//  316   /* Check the parameters */
//  317   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  318   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
//  319 
//  320   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM4_DMACmd_0
//  321   {
//  322     /* Enable the DMA sources */
//  323     TIM4->DER |= (uint8_t)TIM4_DMASource;
        LD        A, S:?b1
        OR        A, L:0x52e3
        LD        L:0x52e3, A
        RET
//  324   }
//  325   else
//  326   {
//  327     /* Disable the DMA sources */
//  328     TIM4->DER &= (uint8_t)~TIM4_DMASource;
??TIM4_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x52e3
        LD        L:0x52e3, A
//  329   }
//  330 }
        RET
//  331 
//  332 /**
//  333   * @brief  Selects the TIM4 Trigger Output Mode.
//  334   * @param  TIM4_TRGOSource : Specifies the Trigger Output source.
//  335   *   This parameter can be one of the @ref TIM4_TRGOSource_TypeDef enumeration.
//  336   * @retval None
//  337   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  338 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
//  339 {
TIM4_SelectOutputTrigger:
        LD        S:?b0, A
//  340   uint8_t tmpcr2 = 0;
//  341 
//  342   /* Check the parameters */
//  343   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
//  344 
//  345   tmpcr2 = TIM4->CR2;
        LD        A, L:0x52e1
//  346 
//  347   /* Reset the MMS Bits */
//  348   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
//  349 
//  350   /* Select the TRGO source */
//  351   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
//  352 
//  353   TIM4->CR2 = tmpcr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x52e1, A
//  354 }
        RET
//  355 
//  356 /**
//  357   * @brief  Sets or Resets the TIM4 Master/Slave Mode.
//  358   * @param NewState : The new state of the synchronization between TIM4 and its slaves (through TRGO).
//  359   *   This parameter can be any of the @ref FunctionalState enumeration.
//  360   * @retval None
//  361   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  362 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
//  363 {
//  364   /* Check the parameters */
//  365   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  366 
//  367   /* Set or Reset the MSM Bit */
//  368   if (NewState != DISABLE)
TIM4_SelectMasterSlaveMode:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM4_SelectMasterSlaveMode_0
//  369   {
//  370     TIM4->SMCR |= TIM4_SMCR_MSM;
        BSET      L:0x52e2, #0x7
        RET
//  371   }
//  372   else
//  373   {
//  374     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
??TIM4_SelectMasterSlaveMode_0:
        BRES      L:0x52e2, #0x7
//  375   }
//  376 }
        RET
//  377 
//  378 /**
//  379   * @brief  Selects the TIM4 Input Trigger source.
//  380   * @param  TIM4_InputTriggerSource : Specifies Input Trigger source.
//  381   *   This parameter can be one of the @ref TIM4_TRGSelection_TypeDef enumeration.
//  382   * @retval None
//  383   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  384 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
//  385 {
TIM4_SelectInputTrigger:
        LD        S:?b0, A
//  386   uint8_t tmpsmcr = 0;
//  387 
//  388   /* Check the parameters */
//  389   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
//  390 
//  391   tmpsmcr = TIM4->SMCR;
        LD        A, L:0x52e2
//  392 
//  393   /* Select the Tgigger Source */
//  394   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
//  395   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
//  396 
//  397   TIM4->SMCR = (uint8_t)tmpsmcr;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x52e2, A
//  398 }
        RET
//  399 
//  400 /**
//  401   * @brief  Enables the TIM4 internal Clock.
//  402   * @param  None
//  403   * @retval None
//  404   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  405 void TIM4_InternalClockConfig(void)
//  406 {
//  407   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  408   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
TIM4_InternalClockConfig:
        LD        A, #0xf8
        AND       A, L:0x52e2
        LD        L:0x52e2, A
//  409 }
        RET
//  410 
//  411 /**
//  412   * @brief  Selects the TIM4 Slave Mode.
//  413   * @param  TIM4_SlaveMode : Specifies the TIM4 Slave Mode.
//  414   *   This parameter can be one of the @ref TIM4_SlaveMode_TypeDef enumeration.
//  415   * @retval None
//  416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
//  418 {
TIM4_SelectSlaveMode:
        LD        S:?b0, A
//  419   uint8_t tmpsmcr = 0;
//  420 
//  421   /* Check the parameters */
//  422   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
//  423 
//  424   tmpsmcr = TIM4->SMCR;
        LD        A, L:0x52e2
//  425 
//  426   /* Reset the SMS Bits */
//  427   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
//  428 
//  429   /* Select the Slave Mode */
//  430   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
//  431 
//  432   TIM4->SMCR = tmpsmcr;
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x52e2, A
//  433 }
        RET
//  434 
//  435 /**
//  436   * @brief  Checks whether the specified TIM4 flag is set or not.
//  437   * @param  TIM4_FLAG : Specifies the flag to check.
//  438   *   This parameter can be one of the @ref TIM4_FLAG_TypeDef enumeration.
//  439   * @retval FlagStatus : The new state of TIM4_FLAG.
//  440   *   This parameter can be any of the @ref FlagStatus enumeration.
//  441   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  442 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
//  443 {
//  444   FlagStatus bitstatus = RESET;
//  445 
//  446   /* Check the parameters */
//  447   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
//  448 
//  449   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
TIM4_GetFlagStatus:
        AND       A, L:0x52e5
        JREQ      L:??TIM4_GetFlagStatus_0
//  450   {
//  451     bitstatus = SET;
        LD        A, #0x1
        RET
//  452   }
//  453   else
//  454   {
//  455     bitstatus = RESET;
??TIM4_GetFlagStatus_0:
        CLR       A
//  456   }
//  457   return ((FlagStatus)bitstatus);
        RET
//  458 }
//  459 
//  460 /**
//  461   * @brief  Clears the TIM’s pending flags.
//  462   * @param  TIM4_FLAG : Specifies the flag to clear.
//  463   *   This parameter can be one of the @ref TIM4_FLAG_TypeDef enumeration.
//  464   * @retval None
//  465   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  466 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
//  467 {
//  468   /* Check the parameters */
//  469   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
//  470   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
//  471   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
TIM4_ClearFlag:
        CPL       A
        LD        L:0x52e5, A
//  472 }
        RET
//  473 
//  474 /**
//  475   * @brief  Checks whether the TIM4 interrupt has occurred or not.
//  476   * @param  TIM4_IT : Specifies the TIM4 interrupt source to check.
//  477   *   This parameter can be one of the @ref TIM4_IT_TypeDef enumeration.
//  478   * @retval ITStatus : The new state of the TIM4_IT.
//  479   *   This parameter can be any of the @ref ITStatus enumeration.
//  480   */
//  481 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  482 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
//  483 {
TIM4_GetITStatus:
        LD        S:?b0, A
//  484   ITStatus bitstatus = RESET;
//  485 
//  486   uint8_t itStatus = 0x0, itEnable = 0x0;
//  487 
//  488   /* Check the parameters */
//  489   assert_param(IS_TIM4_GET_IT(TIM4_IT));
//  490 
//  491   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
        LD        A, L:0x52e5
        LD        S:?b1, A
//  492 
//  493   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
        LD        A, S:?b0
        AND       A, L:0x52e4
        LD        S:?b2, A
//  494 
//  495   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
        LD        A, S:?b0
        AND       A, S:?b1
        JREQ      L:??TIM4_GetITStatus_0
        CLR       A
        CP        A, S:?b2
        JREQ      L:??TIM4_GetITStatus_0
//  496   {
//  497     bitstatus = (ITStatus)SET;
        LD        A, #0x1
        RET
//  498   }
//  499   else
//  500   {
//  501     bitstatus = (ITStatus)RESET;
??TIM4_GetITStatus_0:
        CLR       A
//  502   }
//  503   return ((ITStatus)bitstatus);
        RET
//  504 }
//  505 
//  506 /**
//  507   * @brief  Clears the TIM4's interrupt pending bits.
//  508   * @param  TIM4_IT : Specifies the pending bit to clear.
//  509   *   This parameter can be one of the @ref TIM4_IT_TypeDef enumeration.
//  510   * @retval None
//  511   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  512 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
//  513 {
//  514   /* Check the parameters */
//  515   assert_param(IS_TIM4_IT(TIM4_IT));
//  516 
//  517   /* Clear the IT pending Bit */
//  518   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
TIM4_ClearITPendingBit:
        CPL       A
        LD        L:0x52e5, A
//  519 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  520 /**
//  521   * @}
//  522   */
//  523 /**
//  524   * @}
//  525   */
//  526 
//  527 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 349 bytes in section .near_func.text
// 
// 349 bytes of CODE memory
//
//Errors: none
//Warnings: none
