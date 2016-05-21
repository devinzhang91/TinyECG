///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:40 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim1.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim1.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_tim1.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_tim1

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?w0
        EXTERN ?w1

        PUBLIC TIM1_ARRPreloadConfig
        PUBLIC TIM1_BDTRConfig
        PUBLIC TIM1_CCPreloadControl
        PUBLIC TIM1_CCxCmd
        PUBLIC TIM1_CCxNCmd
        PUBLIC TIM1_ClearFlag
        PUBLIC TIM1_ClearITPendingBit
        PUBLIC TIM1_ClearOC1Ref
        PUBLIC TIM1_ClearOC2Ref
        PUBLIC TIM1_ClearOC3Ref
        PUBLIC TIM1_ClearOC4Ref
        PUBLIC TIM1_Cmd
        PUBLIC TIM1_CounterModeConfig
        PUBLIC TIM1_CtrlPWMOutputs
        PUBLIC TIM1_DMACmd
        PUBLIC TIM1_DMAConfig
        PUBLIC TIM1_DeInit
        PUBLIC TIM1_ETRClockMode1Config
        PUBLIC TIM1_ETRClockMode2Config
        PUBLIC TIM1_ETRConfig
        PUBLIC TIM1_EncoderInterfaceConfig
        PUBLIC TIM1_ForcedOC1Config
        PUBLIC TIM1_ForcedOC2Config
        PUBLIC TIM1_ForcedOC3Config
        PUBLIC TIM1_GenerateEvent
        PUBLIC TIM1_GetCapture1
        PUBLIC TIM1_GetCapture2
        PUBLIC TIM1_GetCapture3
        PUBLIC TIM1_GetCapture4
        PUBLIC TIM1_GetCounter
        PUBLIC TIM1_GetFlagStatus
        PUBLIC TIM1_GetITStatus
        PUBLIC TIM1_GetPrescaler
        PUBLIC TIM1_ICInit
        PUBLIC TIM1_ITConfig
        PUBLIC TIM1_InternalClockConfig
        PUBLIC TIM1_OC1FastConfig
        PUBLIC TIM1_OC1Init
        PUBLIC TIM1_OC1NPolarityConfig
        PUBLIC TIM1_OC1PolarityConfig
        PUBLIC TIM1_OC1PreloadConfig
        PUBLIC TIM1_OC2FastConfig
        PUBLIC TIM1_OC2Init
        PUBLIC TIM1_OC2NPolarityConfig
        PUBLIC TIM1_OC2PolarityConfig
        PUBLIC TIM1_OC2PreloadConfig
        PUBLIC TIM1_OC3FastConfig
        PUBLIC TIM1_OC3Init
        PUBLIC TIM1_OC3NPolarityConfig
        PUBLIC TIM1_OC3PolarityConfig
        PUBLIC TIM1_OC3PreloadConfig
        PUBLIC TIM1_OC4PreloadConfig
        PUBLIC TIM1_PWMIConfig
        PUBLIC TIM1_PrescalerConfig
        PUBLIC TIM1_SelectCCDMA
        PUBLIC TIM1_SelectCOM
        PUBLIC TIM1_SelectHallSensor
        PUBLIC TIM1_SelectInputTrigger
        PUBLIC TIM1_SelectMasterSlaveMode
        PUBLIC TIM1_SelectOCREFClear
        PUBLIC TIM1_SelectOCxM
        PUBLIC TIM1_SelectOnePulseMode
        PUBLIC TIM1_SelectOutputTrigger
        PUBLIC TIM1_SelectSlaveMode
        PUBLIC TIM1_SetAutoreload
        PUBLIC TIM1_SetCompare1
        PUBLIC TIM1_SetCompare2
        PUBLIC TIM1_SetCompare3
        PUBLIC TIM1_SetCompare4
        PUBLIC TIM1_SetCounter
        PUBLIC TIM1_SetIC1Prescaler
        PUBLIC TIM1_SetIC2Prescaler
        PUBLIC TIM1_SetIC3Prescaler
        PUBLIC TIM1_SetIC4Prescaler
        PUBLIC TIM1_TIxExternalClockConfig
        PUBLIC TIM1_TimeBaseInit
        PUBLIC TIM1_UpdateDisableConfig
        PUBLIC TIM1_UpdateRequestConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim1.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_tim1.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the TIM1 firmware functions.
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
//   22 #include "stm8l15x_tim1.h"
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
//   33 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   34                        uint8_t TIM1_ICFilter);
//   35 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   36                        uint8_t TIM1_ICFilter);
//   37 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   38                        uint8_t TIM1_ICFilter);
//   39 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection,
//   40                        uint8_t TIM1_ICFilter);
//   41 
//   42 /**
//   43   * @addtogroup TIM1_Public_Functions
//   44   * @{
//   45   */
//   46 
//   47 /**
//   48   * @brief  Deinitializes the TIM1 peripheral registers to their default reset values.
//   49   * @param  None
//   50   * @retval None
//   51   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   52 void TIM1_DeInit(void)
//   53 {
//   54   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
TIM1_DeInit:
        CLR       A
        LD        L:0x52b0, A
//   55   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
        LD        L:0x52b1, A
//   56   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
        LD        L:0x52b2, A
//   57   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
        LD        L:0x52b3, A
//   58   TIM1->IER  = TIM1_IER_RESET_VALUE;
        LD        L:0x52b5, A
//   59 
//   60   /* Disable channels */
//   61   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
        LD        L:0x52bd, A
//   62   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
        LD        L:0x52be, A
//   63   /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
//   64   TIM1->CCMR1 = 0x01;
        LD        A, #0x1
        LD        L:0x52b9, A
//   65   TIM1->CCMR2 = 0x01;
        LD        L:0x52ba, A
//   66   TIM1->CCMR3 = 0x01;
        LD        L:0x52bb, A
//   67   TIM1->CCMR4 = 0x01;
        LD        L:0x52bc, A
//   68   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   69   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
        CLR       A
        LD        L:0x52bd, A
//   70   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
        LD        L:0x52be, A
//   71   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
        LD        L:0x52b9, A
//   72   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
        LD        L:0x52ba, A
//   73   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
        LD        L:0x52bb, A
//   74   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
        LD        L:0x52bc, A
//   75   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
        LD        L:0x52bf, A
//   76   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
        LD        L:0x52c0, A
//   77   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
        LD        L:0x52c1, A
//   78   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
        LD        L:0x52c2, A
//   79   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x52c3, A
//   80   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
        LD        L:0x52c4, A
//   81   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
        CLR       A
        LD        L:0x52c6, A
//   82   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
        LD        L:0x52c7, A
//   83   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
        LD        L:0x52c8, A
//   84   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
        LD        L:0x52c9, A
//   85   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
        LD        L:0x52ca, A
//   86   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
        LD        L:0x52cb, A
//   87   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
        LD        L:0x52cc, A
//   88   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
        LD        L:0x52cd, A
//   89   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
        LD        L:0x52d0, A
//   90   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
        LD        A, #0x1
        LD        L:0x52b8, A
//   91   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
        CLR       A
        LD        L:0x52cf, A
//   92   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
        LD        L:0x52ce, A
//   93   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
        LD        L:0x52c5, A
//   94   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
        LD        L:0x52b6, A
//   95   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
        LD        L:0x52b7, A
//   96 }
        RET
//   97 
//   98 /**
//   99   * @brief  Initializes the TIM1 Time Base Unit according to the specified parameters.
//  100   * @param  TIM1_Prescaler specifies the Prescaler value.
//  101   * @param  TIM1_CounterMode specifies the counter mode from
//  102   *         @ref TIM1_CounterMode_TypeDef .
//  103   * @param  TIM1_Period specifies the Period value.
//  104   * @param  TIM1_RepetitionCounter specifies the Repetition counter value
//  105   * @retval None
//  106   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  107 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
//  108                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
//  109                        uint16_t TIM1_Period,
//  110                        uint8_t TIM1_RepetitionCounter)
//  111 {
TIM1_TimeBaseInit:
        LDW       S:?w1, X
        LD        S:?b1, A
//  112   /* Check parameters */
//  113   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
//  114 
//  115 
//  116   /* Set the Autoreload value */
//  117   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
        LDW       X, Y
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c3, A
//  118   TIM1->ARRL = (uint8_t)(TIM1_Period);
        LD        A, YL
        LD        L:0x52c4, A
//  119 
//  120   /* Set the Prescaler value */
//  121   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
        LDW       X, S:?w1
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c1, A
//  122   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
        LD        A, S:?b3
        LD        L:0x52c2, A
//  123 
//  124   /* Select the Counter Mode */
//  125   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
//  126                         | (uint8_t)(TIM1_CounterMode));
        LD        A, #0x8f
        AND       A, L:0x52b0
        OR        A, S:?b1
        LD        L:0x52b0, A
//  127 
//  128   /* Set the Repetition Counter value */
//  129   TIM1->RCR = TIM1_RepetitionCounter;
        LD        A, S:?b0
        LD        L:0x52c5, A
//  130 
//  131 
//  132 
//  133 }
        RET
//  134 
//  135 /**
//  136   * @brief  Initializes the TIM1 Channel1 according to the specified parameters.
//  137   * @param  TIM1_OCMode specifies the Output Compare mode from
//  138   *         @ref TIM1_OCMode_TypeDef.
//  139   * @param  TIM1_OutputState specifies the Output State from
//  140   *         @ref TIM1_OutputState_TypeDef.
//  141   * @param  TIM1_OutputNState specifies the Complementary Output State from
//  142   *         @ref TIM1_OutputNState_TypeDef.
//  143   * @param  TIM1_Pulse specifies the Pulse width value.
//  144   * @param  TIM1_OCPolarity specifies the Output Compare Polarity from
//  145   *         @ref TIM1_OCPolarity_TypeDef.
//  146   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare
//  147   *         Polarity from @ref TIM1_OCNPolarity_TypeDef.
//  148   * @param  TIM1_OCIdleState specifies the Output Compare Idle State from
//  149   *         @ref TIM1_OCIdleState_TypeDef.
//  150   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare
//  151   *         Idle State from @ref TIM1_OCIdleState_TypeDef.
//  152   * @retval None
//  153   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  155                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  157                   uint16_t TIM1_Pulse,
//  158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  162 {
TIM1_OC1Init:
        LD        S:?b6, A
        LDW       Y, X
//  163   /* Check the parameters */
//  164   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
//  165   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
//  166   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
//  167   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
//  168   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
//  169   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
//  170   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
//  171 
//  172   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State ,
//  173   the Output N State, the Output Polarity & the Output N Polarity*/
//  174   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
//  175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
        LD        A, #0xf0
        AND       A, L:0x52bd
        LD        L:0x52bd, A
//  176   /* Set the Output State & Set the Output N State & Set the Output Polarity
//  177   & Set the Output N Polarity */
//  178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
//  179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
//  180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
//  181                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
        LD        A, S:?b1
        AND       A, #0x4
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0x1
        OR        A, S:?b1
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0x2
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        LD        S:?b1, A
        LD        A, S:?b3
        AND       A, #0x8
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, L:0x52bd
        LD        L:0x52bd, A
//  182 
//  183   /* Reset the Output Compare Bits & Set the Ouput Compare Mode */
//  184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
//  185                           | (uint8_t)TIM1_OCMode);
        LD        A, #0x8f
        AND       A, L:0x52b9
        OR        A, S:?b6
        LD        L:0x52b9, A
//  186 
//  187   /* Reset the Output Idle state & the Output N Idle state bits */
//  188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
        LD        A, #0xfc
        AND       A, L:0x52d0
        LD        L:0x52d0, A
//  189   /* Set the Output Idle state & the Output N Idle state configuration */
//  190   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
//  191                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
        LD        A, S:?b5
        AND       A, #0x2
        LD        S:?b0, A
        LD        A, S:?b4
        AND       A, #0x1
        OR        A, S:?b0
        OR        A, L:0x52d0
        LD        L:0x52d0, A
//  192 
//  193   /* Set the Pulse value */
//  194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c6, A
//  195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
        LD        A, YL
        LD        L:0x52c7, A
//  196 }
        RET
//  197 
//  198 /**
//  199   * @brief  Initializes the TIM1 Channel2 according to the specified parameters.
//  200   * @param  TIM1_OCMode specifies the Output Compare mode from
//  201   *         @ref TIM1_OCMode_TypeDef.
//  202   * @param  TIM1_OutputState specifies the Output State from
//  203   *         @ref TIM1_OutputState_TypeDef.
//  204   * @param  TIM1_OutputNState specifies the Complementary Output State from
//  205   *         @ref TIM1_OutputNState_TypeDef.
//  206   * @param  TIM1_Pulse specifies the Pulse width value.
//  207   * @param  TIM1_OCPolarity specifies the Output Compare Polarity from
//  208   *         @ref TIM1_OCPolarity_TypeDef.
//  209   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare
//  210   *         Polarity from @ref TIM1_OCNPolarity_TypeDef.
//  211   * @param  TIM1_OCIdleState specifies the Output Compare Idle State
//  212   *         from @ref TIM1_OCIdleState_TypeDef.
//  213   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare
//  214   *         Idle State from @ref TIM1_OCIdleState_TypeDef.
//  215   * @retval None
//  216   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  218                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  220                   uint16_t TIM1_Pulse,
//  221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  225 {
TIM1_OC2Init:
        LD        S:?b6, A
        LDW       Y, X
//  226 
//  227   /* Check the parameters */
//  228   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
//  229   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
//  230   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
//  231   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
//  232   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
//  233   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
//  234   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
//  235 
//  236   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State,
//  237      the Output N State, the Output Polarity & the Output N Polarity*/
//  238   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
        LD        A, #0xf
        AND       A, L:0x52bd
        LD        L:0x52bd, A
//  239 
//  240   /* Set the Output State & Set the Output N State & Set the Output Polarity & Set the Output N Polarity */
//  241   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
//  242                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
        LD        A, S:?b1
        AND       A, #0x40
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0x10
        OR        A, S:?b1
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0x20
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        LD        S:?b1, A
        LD        A, S:?b3
        AND       A, #0x80
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, L:0x52bd
        LD        L:0x52bd, A
//  243 
//  244   /* Reset the Output Compare Bits & Set the Ouput Compare Mode */
//  245   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
        LD        A, #0x8f
        AND       A, L:0x52ba
        OR        A, S:?b6
        LD        L:0x52ba, A
//  246 
//  247   /* Reset the Output Idle state & the Output N Idle state bits */
//  248   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
        LD        A, #0xf3
        AND       A, L:0x52d0
        LD        L:0x52d0, A
//  249   /* Set the Output Idle state & the Output N Idle state configuration */
//  250   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
        LD        A, S:?b5
        AND       A, #0x8
        LD        S:?b0, A
        LD        A, S:?b4
        AND       A, #0x4
        OR        A, S:?b0
        OR        A, L:0x52d0
        LD        L:0x52d0, A
//  251 
//  252   /* Set the Pulse value */
//  253   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c8, A
//  254   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
        LD        A, YL
        LD        L:0x52c9, A
//  255 }
        RET
//  256 
//  257 /**
//  258   * @brief  Initializes the TIM1 Channel3 according to the specified parameters.
//  259   * @param  TIM1_OCMode specifies the Output Compare mode  from @ref TIM1_OCMode_TypeDef.
//  260   * @param  TIM1_OutputState specifies the Output State  from @ref TIM1_OutputState_TypeDef.
//  261   * @param  TIM1_OutputNState specifies the Complementary Output State
//  262   *         from @ref TIM1_OutputNState_TypeDef.
//  263   * @param  TIM1_Pulse specifies the Pulse width value.
//  264   * @param  TIM1_OCPolarity specifies the Output Compare Polarity  from
//  265   *         @ref TIM1_OCPolarity_TypeDef.
//  266   * @param  TIM1_OCNPolarity specifies the Complementary Output Compare Polarity
//  267   *         from @ref TIM1_OCNPolarity_TypeDef.
//  268   * @param  TIM1_OCIdleState specifies the Output Compare Idle State
//  269   *         from @ref TIM1_OCIdleState_TypeDef.
//  270   * @param  TIM1_OCNIdleState specifies the Complementary Output Compare Idle
//  271   *         State  from @ref TIM1_OCIdleState_TypeDef.
//  272   * @retval None
//  273   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  274 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
//  275                   TIM1_OutputState_TypeDef TIM1_OutputState,
//  276                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
//  277                   uint16_t TIM1_Pulse,
//  278                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
//  279                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
//  280                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
//  281                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
//  282 {
TIM1_OC3Init:
        LD        S:?b6, A
        LDW       Y, X
//  283 
//  284   /* Check the parameters */
//  285   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
//  286   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
//  287   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
//  288   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
//  289   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
//  290   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
//  291   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
//  292 
//  293   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State,
//  294      the Output N State, the Output Polarity & the Output N Polarity */
//  295   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
        LD        A, #0xf0
        AND       A, L:0x52be
        LD        L:0x52be, A
//  296 
//  297   /* Set the Output State & Set the Output N State & Set the Output Polarity & Set the Output N Polarity */
//  298   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
//  299                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
        LD        A, S:?b1
        AND       A, #0x4
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0x1
        OR        A, S:?b1
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0x2
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        LD        S:?b1, A
        LD        A, S:?b3
        AND       A, #0x8
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, L:0x52be
        LD        L:0x52be, A
//  300 
//  301   /* Reset the Output Compare Bits & Set the Ouput Compare Mode */
//  302   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
        LD        A, #0x8f
        AND       A, L:0x52bb
        OR        A, S:?b6
        LD        L:0x52bb, A
//  303 
//  304   /* Reset the Output Idle state & the Output N Idle state bits */
//  305   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
        LD        A, #0xcf
        AND       A, L:0x52d0
        LD        L:0x52d0, A
//  306   /* Set the Output Idle state & the Output N Idle state configuration */
//  307   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
        LD        A, S:?b5
        AND       A, #0x20
        LD        S:?b0, A
        LD        A, S:?b4
        AND       A, #0x10
        OR        A, S:?b0
        OR        A, L:0x52d0
        LD        L:0x52d0, A
//  308 
//  309   /* Set the Pulse value */
//  310   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52ca, A
//  311   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
        LD        A, YL
        LD        L:0x52cb, A
//  312 }
        RET
//  313 
//  314 /**
//  315   * @brief  Configures the Break feature, dead time, Lock level, the OSSI,
//  316   *         and the AOE(automatic output enable).
//  317   * @param  TIM1_OSSIState specifies the OSSIS State from @ref TIM1_OSSIState_TypeDef.
//  318   * @param  TIM1_LockLevel specifies the lock level from @ref TIM1_LockLevel_TypeDef.
//  319   * @param  TIM1_DeadTime specifies the dead time value.
//  320   * @param  TIM1_Break specifies the Break state @ref TIM1_BreakState_TypeDef.
//  321   * @param  TIM1_BreakPolarity specifies the Break polarity from @ref TIM1_BreakPolarity_TypeDef.
//  322   * @param  TIM1_AutomaticOutput specifies the Automatic Output configuration from @ref TIM1_AutomaticOutput_TypeDef.
//  323   * @retval None
//  324   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  325 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
//  326                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
//  327                      uint8_t TIM1_DeadTime,
//  328                      TIM1_BreakState_TypeDef TIM1_Break,
//  329                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
//  330                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
//  331 {
TIM1_BDTRConfig:
        LD        S:?b5, A
//  332 
//  333   /* Check the parameters */
//  334   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
//  335   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
//  336   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
//  337   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
//  338   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
//  339 
//  340   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
        LD        A, S:?b1
        LD        L:0x52cf, A
//  341   /* Set the Lock level, the Break enable Bit and the Ploarity, the OSSI State,
//  342      the dead time value  and the Automatic Output Enable Bit */
//  343 
//  344   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
//  345                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
//  346                                       | (uint8_t)TIM1_AutomaticOutput));
        LD        A, S:?b0
        OR        A, S:?b5
        OR        A, S:?b2
        OR        A, S:?b3
        OR        A, S:?b4
        LD        L:0x52ce, A
//  347 
//  348 }
        RET
//  349 
//  350 /**
//  351   * @brief  Initializes the TIM1 peripheral according to the specified parameters.
//  352   * @param  TIM1_Channel specifies the input capture channel from @ref TIM1_Channel_TypeDef.
//  353   * @param  TIM1_ICPolarity specifies the Input capture polarity from  @ref TIM1_ICPolarity_TypeDef .
//  354   * @param  TIM1_ICSelection specifies the Input capture source selection from @ref TIM1_ICSelection_TypeDef.
//  355   * @param  TIM1_ICPrescaler specifies the Input capture Prescaler from @ref TIM1_ICPSC_TypeDef.
//  356   * @param  TIM1_ICFilter specifies the Input capture filter value.
//  357   * @note
//  358   *         - If the channel 3 is selected the TIM1_ICSelection_IndirectTI
//  359   *         parameter is forbidden.
//  360   *         - IF the channel 4 is selected the TIM1_ICSelection_DirectTI
//  361   *         parameter is forbidden.
//  362   * @retval None
//  363   */
//  364 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  365 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
//  366                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  367                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
//  368                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
//  369                  uint8_t TIM1_ICFilter)
//  370 {
TIM1_ICInit:
        LD        S:?b5, A
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b6, S:?b2
        MOV       S:?b1, S:?b3
//  371 
//  372   /* Check the parameters */
//  373   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
//  374   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
//  375   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
//  376   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
//  377   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
//  378 
//  379   if (TIM1_Channel == TIM1_Channel_1)
        CLR       A
        CP        A, S:?b5
        JRNE      L:??TIM1_ICInit_0
//  380   {
//  381     /* TI1 Configuration */
//  382     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:TI1_Config
//  383     /* Set the Input Capture Prescaler value */
//  384     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52b9
        OR        A, S:?b6
        LD        L:0x52b9, A
//  385   }
        RET
//  386   else if (TIM1_Channel == TIM1_Channel_2)
??TIM1_ICInit_0:
        LD        A, S:?b5
        CP        A, #0x1
        JRNE      L:??TIM1_ICInit_1
//  387   {
//  388     /* TI2 Configuration */
//  389     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:TI2_Config
//  390     /* Set the Input Capture Prescaler value */
//  391     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52ba
        OR        A, S:?b6
        LD        L:0x52ba, A
//  392   }
        RET
//  393   else if (TIM1_Channel == TIM1_Channel_3)
??TIM1_ICInit_1:
        CP        A, #0x2
        JRNE      L:??TIM1_ICInit_2
//  394   {
//  395     /* TI3 Configuration */
//  396     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:TI3_Config
//  397     /* Set the Input Capture Prescaler value */
//  398     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52bb
        OR        A, S:?b6
        LD        L:0x52bb, A
//  399   }
        RET
//  400   else
//  401   {
//  402     /* TI4 Configuration */
//  403     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
??TIM1_ICInit_2:
        LD        A, S:?b4
        CALL      L:TI4_Config
//  404     /* Set the Input Capture Prescaler value */
//  405     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52bc
        OR        A, S:?b6
        LD        L:0x52bc, A
//  406   }
//  407 }
        RET
//  408 
//  409 /**
//  410   * @brief  Configures the TIM1 peripheral in PWM Input Mode according to the
//  411   *         specified parameters.
//  412   * @param  TIM1_Channel specifies the input capture channel from
//  413   *         @ref TIM1_Channel_TypeDef.
//  414   * @param  TIM1_ICPolarity specifies the Input capture polarity from
//  415   *         @ref TIM1_ICPolarity_TypeDef.
//  416   * @param  TIM1_ICSelection specifies the Input capture source selection from
//  417   *         @ref TIM1_ICSelection_TypeDef.
//  418   * @param  TIM1_ICPrescaler specifies the Input capture Prescaler from
//  419   *         @ref TIM1_ICPSC_TypeDef.
//  420   * @param  TIM1_ICFilter specifies the Input capture filter value.
//  421   * @retval None
//  422   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  423 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
//  424                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  425                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
//  426                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
//  427                      uint8_t TIM1_ICFilter)
//  428 {
TIM1_PWMIConfig:
        PUSH      L:?b9
        PUSH      L:?b8
        LD        S:?b8, A
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b9, S:?b2
        MOV       S:?b6, S:?b3
//  429   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
//  430   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
//  431 
//  432   /* Check the parameters */
//  433   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
//  434   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
//  435   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
//  436   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
//  437 
//  438   /* Select the Opposite Input Polarity */
//  439   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
        LD        A, S:?b4
        CP        A, #0x1
        JREQ      L:??TIM1_PWMIConfig_0
//  440   {
//  441     icpolarity = TIM1_ICPolarity_Falling;
        LD        A, #0x1
        LD        S:?b5, A
        JRA       L:??TIM1_PWMIConfig_1
//  442   }
//  443   else
//  444   {
//  445     icpolarity = TIM1_ICPolarity_Rising;
??TIM1_PWMIConfig_0:
        CLR       S:?b5
//  446   }
//  447 
//  448   /* Select the Opposite Input */
//  449   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
??TIM1_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM1_PWMIConfig_2
//  450   {
//  451     icselection = TIM1_ICSelection_IndirectTI;
        LD        A, #0x2
        LD        S:?b7, A
        JRA       L:??TIM1_PWMIConfig_3
//  452   }
//  453   else
//  454   {
//  455     icselection = TIM1_ICSelection_DirectTI;
??TIM1_PWMIConfig_2:
        LD        A, #0x1
        LD        S:?b7, A
//  456   }
//  457 
//  458   if (TIM1_Channel == TIM1_Channel_1)
??TIM1_PWMIConfig_3:
        CLR       A
        CP        A, S:?b8
        MOV       S:?b1, S:?b6
        JRNE      L:??TIM1_PWMIConfig_4
//  459   {
//  460     /* TI1 Configuration */
//  461     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
        LD        A, S:?b4
        CALL      L:TI1_Config
//  462 
//  463     /* Set the Input Capture Prescaler value */
//  464     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52b9
        OR        A, S:?b9
        LD        L:0x52b9, A
//  465 
//  466     /* TI2 Configuration */
//  467     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
        MOV       S:?b1, S:?b6
        MOV       S:?b0, S:?b7
        LD        A, S:?b5
        CALL      L:TI2_Config
//  468 
//  469     /* Set the Input Capture Prescaler value */
//  470     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52ba
        OR        A, S:?b9
        LD        L:0x52ba, A
//  471   }
        JRA       L:??TIM1_PWMIConfig_5
//  472   else
//  473   {
//  474     /* TI2 Configuration */
//  475     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
??TIM1_PWMIConfig_4:
        LD        A, S:?b4
        CALL      L:TI2_Config
//  476 
//  477     /* Set the Input Capture Prescaler value */
//  478     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52ba
        OR        A, S:?b9
        LD        L:0x52ba, A
//  479 
//  480     /* TI1 Configuration */
//  481     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
        MOV       S:?b1, S:?b6
        MOV       S:?b0, S:?b7
        LD        A, S:?b5
        CALL      L:TI1_Config
//  482 
//  483     /* Set the Input Capture Prescaler value */
//  484     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
        LD        A, #0xf3
        AND       A, L:0x52b9
        OR        A, S:?b9
        LD        L:0x52b9, A
//  485   }
//  486 }
??TIM1_PWMIConfig_5:
        POP       L:?b8
        POP       L:?b9
        RET
//  487 
//  488 /**
//  489   * @brief  Enables or disables the TIM1 peripheral.
//  490   * @param  NewState new state of the TIM1 peripheral. This parameter can
//  491   *         be ENABLE or DISABLE.
//  492   * @retval None
//  493   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  494 void TIM1_Cmd(FunctionalState NewState)
//  495 {
//  496   /* Check the parameters */
//  497   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  498 
//  499   /* set or Reset the CEN Bit */
//  500   if (NewState != DISABLE)
TIM1_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_Cmd_0
//  501   {
//  502     TIM1->CR1 |= TIM1_CR1_CEN;
        BSET      L:0x52b0, #0x0
        RET
//  503   }
//  504   else
//  505   {
//  506     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
??TIM1_Cmd_0:
        BRES      L:0x52b0, #0x0
//  507   }
//  508 }
        RET
//  509 
//  510 /**
//  511   * @brief  Enables or disables the TIM1 peripheral Main Outputs.
//  512   * @param  NewState new state of the TIM1 peripheral. This parameter can
//  513   *         be ENABLE or DISABLE.
//  514   * @retval None
//  515   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  516 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
//  517 {
//  518   /* Check the parameters */
//  519   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  520 
//  521   /* Set or Reset the MOE Bit */
//  522 
//  523   if (NewState != DISABLE)
TIM1_CtrlPWMOutputs:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_CtrlPWMOutputs_0
//  524   {
//  525     TIM1->BKR |= TIM1_BKR_MOE;
        BSET      L:0x52ce, #0x7
        RET
//  526   }
//  527   else
//  528   {
//  529     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
??TIM1_CtrlPWMOutputs_0:
        BRES      L:0x52ce, #0x7
//  530   }
//  531 }
        RET
//  532 
//  533 /**
//  534   * @brief  Enables or disables the specified TIM1 interrupts.
//  535   * @param  NewState new state of the TIM1 peripheral.
//  536   *         This parameter can be: ENABLE or DISABLE.
//  537   * @param  TIM1_IT specifies the TIM1 interrupts sources to be enabled or disabled.
//  538   *         This parameter can be any combination of the @ref TIM1_IT_TypeDef
//  539   *         enumeration.
//  540   * @param  NewState new state of the TIM1 peripheral.
//  541   * @retval None
//  542   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  543 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
//  544 {
TIM1_ITConfig:
        LD        S:?b1, A
//  545   /* Check the parameters */
//  546   assert_param(IS_TIM1_IT(TIM1_IT));
//  547   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  548 
//  549   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_ITConfig_0
//  550   {
//  551     /* Enable the Interrupt sources */
//  552     TIM1->IER |= (uint8_t)TIM1_IT;
        LD        A, S:?b1
        OR        A, L:0x52b5
        LD        L:0x52b5, A
        RET
//  553   }
//  554   else
//  555   {
//  556     /* Disable the Interrupt sources */
//  557     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
??TIM1_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x52b5
        LD        L:0x52b5, A
//  558   }
//  559 }
        RET
//  560 
//  561 /**
//  562   * @brief  Configures the TIM1x’s DMA interface.
//  563   * @param  TIM1_DMABase: DMA Base address.
//  564   * @param  TIM1_DMABurstLength: DMA Burst length.
//  565   * @retval None.
//  566   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  567 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
//  568                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
//  569 {
//  570   /* Check the parameters */
//  571   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
//  572   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
//  573 
//  574   /* Set the DMA Base and the DMA Burst Length */
//  575   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
TIM1_DMAConfig:
        LD        L:0x52d1, A
//  576   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
        LD        A, S:?b0
        LD        L:0x52d2, A
//  577 }
        RET
//  578 
//  579 /**
//  580   * @brief  Enables or disables the TIMx’s DMA Requests.
//  581   * @param  TIM1_DMASources: specifies the DMA Request sources.
//  582   *         This parameter can be any combination of the following values:
//  583   *          - TIM1_DMA_Update: TIM1 update Interrupt source
//  584   *          - TIM1_DMA_Trigger: TIM1 Trigger DMA source
//  585   * @param  NewState  new state of the DMA Request sources.
//  586   *         This parameter can be: ENABLE or DISABLE.
//  587   * @retval None.
//  588   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  589 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
//  590 {
TIM1_DMACmd:
        LD        S:?b1, A
//  591   /* Check the parameters */
//  592   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  593   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
//  594 
//  595   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_DMACmd_0
//  596   {
//  597     /* Enable the DMA sources */
//  598     TIM1->DER |= (uint8_t)TIM1_DMASource;
        LD        A, S:?b1
        OR        A, L:0x52b4
        LD        L:0x52b4, A
        RET
//  599   }
//  600   else
//  601   {
//  602     /* Disable the DMA sources */
//  603     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
??TIM1_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x52b4
        LD        L:0x52b4, A
//  604   }
//  605 }
        RET
//  606 
//  607 /**
//  608   * @brief  Configures the TIM1 internal Clock.
//  609   * @param  None
//  610   * @retval None
//  611   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  612 void TIM1_InternalClockConfig(void)
//  613 {
//  614   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  615   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
TIM1_InternalClockConfig:
        LD        A, #0xf8
        AND       A, L:0x52b2
        LD        L:0x52b2, A
//  616 }
        RET
//  617 
//  618 /**
//  619   * @brief  Configures the TIM1 External clock Mode1.
//  620   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  621   *         This parameter can be one of the following values:
//  622   *         - TIM1_ExtTRGPSC_OFF
//  623   *         - TIM1_ExtTRGPSC_DIV2
//  624   *         - TIM1_ExtTRGPSC_DIV4
//  625   *         - TIM1_ExtTRGPSC_DIV8.
//  626   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  627   *         This parameter can be one of the following values:
//  628   *         - TIM1_ExtTRGPolarity_Inverted
//  629   *         - TIM1_ExtTRGPolarity_NonInverted
//  630   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  631   *         This parameter must be a value between 0x00 and 0x0F
//  632   * @retval None
//  633   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  634 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  635                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  636                               uint8_t ExtTRGFilter)
//  637 {
//  638   /* Check the parameters */
//  639   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
//  640   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
//  641   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
//  642 
//  643   /* Configure the ETR Clock source */
//  644   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
TIM1_ETRClockMode1Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x52b3
        LD        L:0x52b3, A
//  645 
//  646   /* Select the External clock mode1 & Select the Trigger selection : ETRF */
//  647   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
//  648                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
        LD        A, #0x77
        OR        A, L:0x52b2
        LD        L:0x52b2, A
//  649 }
        RET
//  650 
//  651 /**
//  652   * @brief  Configures the TIM1 External clock Mode2.
//  653   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  654   *         This parameter can be one of the following values:
//  655   *         - TIM1_ExtTRGPSC_OFF
//  656   *         - TIM1_ExtTRGPSC_DIV2
//  657   *         - TIM1_ExtTRGPSC_DIV4
//  658   *         - TIM1_ExtTRGPSC_DIV8.
//  659   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  660   *         This parameter can be one of the following values:
//  661   *         - TIM1_ExtTRGPolarity_Inverted
//  662   *         - TIM1_ExtTRGPolarity_NonInverted
//  663   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  664   *         This parameter must be a value between 0x00 and 0x0F
//  665   * @retval None
//  666   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  667 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  668                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  669                               uint8_t ExtTRGFilter)
//  670 {
//  671   /* Check the parameters */
//  672   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
//  673   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
//  674 
//  675   /* Configure the ETR Clock source */
//  676   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
TIM1_ETRClockMode2Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x52b3
        LD        L:0x52b3, A
//  677 
//  678   /* Enable the External clock mode2 */
//  679   TIM1->ETR |= TIM1_ETR_ECE;
        BSET      L:0x52b3, #0x6
//  680 }
        RET
//  681 
//  682 
//  683 /**
//  684   * @brief  Configures the TIM1 External Trigger.
//  685   * @param  TIM1_ExtTRGPrescaler specifies the external Trigger Prescaler.
//  686   *         This parameter can be one of the following values:
//  687   *                       - TIM1_ExtTRGPSC_OFF
//  688   *                       - TIM1_ExtTRGPSC_DIV2
//  689   *                       - TIM1_ExtTRGPSC_DIV4
//  690   *                       - TIM1_ExtTRGPSC_DIV8.
//  691   * @param  TIM1_ExtTRGPolarity specifies the external Trigger Polarity.
//  692   *         This parameter can be one of the following values:
//  693   *                       - TIM1_ExtTRGPolarity_Inverted
//  694   *                       - TIM1_ExtTRGPolarity_NonInverted
//  695   * @param  ExtTRGFilter specifies the External Trigger Filter.
//  696   *         This parameter must be a value between 0x00 and 0x0F
//  697   * @retval None
//  698   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  699 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
//  700                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
//  701                     uint8_t ExtTRGFilter)
//  702 {
//  703   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
//  704 
//  705   /* Set the Prescaler, the Filter value and the Polarity */
//  706   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
//  707                                    | (uint8_t) TIM1_ExtTRGPolarity)
//  708                          | (uint8_t) ExtTRGFilter);
TIM1_ETRConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x52b3
        LD        L:0x52b3, A
//  709 }
        RET
//  710 
//  711 
//  712 /**
//  713   * @brief  Configures the TIM1 Trigger as External Clock.
//  714   * @param  TIM1_TIxExternalCLKSource specifies Trigger source.
//  715   *         This parameter can be one of the following values:
//  716   *                       - TIM1_TIxExternalCLK1Source_TI1: TI1 Edge Detector
//  717   *                       - TIM1_TIxExternalCLK1Source_TI2: Filtered TIM1 Input 1
//  718   *                       - TIM1_TIxExternalCLK1Source_TI1ED: Filtered TIM1 Input 2
//  719   * @param  TIM1_ICPolarity specifies the TIx Polarity.
//  720   *         This parameter can be:
//  721   *                       - TIM1_ICPolarity_Rising
//  722   *                       - TIM1_ICPolarity_Falling
//  723   * @param  ICFilter specifies the filter value.
//  724   *          This parameter must be a value between 0x00 and 0x0F
//  725   * @retval None
//  726   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  727 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
//  728                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
//  729                                  uint8_t ICFilter)
//  730 {
TIM1_TIxExternalClockConfig:
        LD        S:?b4, A
        MOV       S:?b2, S:?b0
//  731   /* Check the parameters */
//  732   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
//  733   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
//  734   assert_param(IS_TIM1_IC_FILTER(ICFilter));
//  735 
//  736   /* Configure the TIM1 Input Clock Source */
//  737   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
        CP        A, #0x60
        JRNE      L:??TIM1_TIxExternalClockConfig_0
//  738   {
//  739     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI2_Config
        JRA       L:??TIM1_TIxExternalClockConfig_1
//  740   }
//  741   else
//  742   {
//  743     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
??TIM1_TIxExternalClockConfig_0:
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI1_Config
//  744   }
//  745 
//  746   /* Select the Trigger source */
//  747   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
??TIM1_TIxExternalClockConfig_1:
        LD        A, #0x8f
        AND       A, L:0x52b2
        OR        A, S:?b4
        LD        L:0x52b2, A
//  748 
//  749   /* Select the External clock mode1 */
//  750   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x52b2
        LD        L:0x52b2, A
//  751 }
        RET
//  752 
//  753 /**
//  754   * @brief  Selects the TIM1 Input Trigger source.
//  755   * @param  TIM1_InputTriggerSource specifies Input Trigger source.
//  756   *         This parameter can be one of the following values:
//  757   *                       - TIM1_TRGSelection_TIM4
//  758   *                       - TIM1_TRGSelection_TIM3
//  759   *                       - TIM1_TRGSelection_TIM2
//  760   *                       - TIM1_TRGSelection_TI1F_ED: TI1 Edge Detector
//  761   *                       - TIM1_TRGSelection_TI1FP1: Filtered Timer Input 1
//  762   *                       - TIM1_TRGSelection_TI2FP2: Filtered Timer Input 2
//  763   *                       - TIM1_TRGSelection_ETRF: External Trigger input
//  764   * @retval None
//  765   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  766 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
//  767 {
TIM1_SelectInputTrigger:
        LD        S:?b0, A
//  768   /* Check the parameters */
//  769   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
//  770 
//  771   /* Select the Tgigger Source */
//  772   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
        LD        A, #0x8f
        AND       A, L:0x52b2
        OR        A, S:?b0
        LD        L:0x52b2, A
//  773 }
        RET
//  774 
//  775 /**
//  776   * @brief  Enables or Disables the TIM1 Update event.
//  777   * @param  NewState new state of the TIM1 peripheral Preload register.
//  778   *         This parameter can be ENABLE or DISABLE.
//  779   * @retval None
//  780   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  781 void TIM1_UpdateDisableConfig(FunctionalState NewState)
//  782 {
//  783   /* Check the parameters */
//  784   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  785 
//  786   /* Set or Reset the UDIS Bit */
//  787   if (NewState != DISABLE)
TIM1_UpdateDisableConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_UpdateDisableConfig_0
//  788   {
//  789     TIM1->CR1 |= TIM1_CR1_UDIS;
        BSET      L:0x52b0, #0x1
        RET
//  790   }
//  791   else
//  792   {
//  793     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
??TIM1_UpdateDisableConfig_0:
        BRES      L:0x52b0, #0x1
//  794   }
//  795 }
        RET
//  796 
//  797 /**
//  798   * @brief  Selects the TIM1 Update Request Interrupt source.
//  799   * @param  TIM1_UpdateSource specifies the Update source.
//  800   *         This parameter can be one of the following values
//  801   *                       - TIM1_UpdateSource_Regular
//  802   *                       - TIM1_UpdateSource_Global
//  803   * @retval None
//  804   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  805 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
//  806 {
//  807   /* Check the parameters */
//  808   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
//  809 
//  810   /* Set or Reset the URS Bit */
//  811   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
TIM1_UpdateRequestConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_UpdateRequestConfig_0
//  812   {
//  813     TIM1->CR1 |= TIM1_CR1_URS;
        BSET      L:0x52b0, #0x2
        RET
//  814   }
//  815   else
//  816   {
//  817     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
??TIM1_UpdateRequestConfig_0:
        BRES      L:0x52b0, #0x2
//  818   }
//  819 }
        RET
//  820 
//  821 /**
//  822   * @brief  Enables or Disables the TIM’s Hall sensor interface.
//  823   * @param  NewState : The new state of the TIM1 Hall sensor interface.
//  824   *         This parameter can be any of the @ref FunctionalState enumeration.
//  825   * @retval None
//  826   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  827 void TIM1_SelectHallSensor(FunctionalState NewState)
//  828 {
//  829   /* Check the parameters */
//  830   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  831 
//  832   /* Set or Reset the TI1S Bit */
//  833   if (NewState != DISABLE)
TIM1_SelectHallSensor:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_SelectHallSensor_0
//  834   {
//  835     TIM1->CR2 |= TIM1_CR2_TI1S;
        BSET      L:0x52b1, #0x7
        RET
//  836   }
//  837   else
//  838   {
//  839     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
??TIM1_SelectHallSensor_0:
        BRES      L:0x52b1, #0x7
//  840   }
//  841 }
        RET
//  842 
//  843 /**
//  844   * @brief  Selects the TIM1’s One Pulse Mode.
//  845   * @param  TIM1_OPMode specifies the OPM Mode to be used.
//  846   *         This parameter can be one of the following values
//  847   *                    - TIM1_OPMode_Single
//  848   *                    - TIM1_OPMode_Repetitive
//  849   * @retval None
//  850   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  851 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
//  852 {
//  853   /* Check the parameters */
//  854   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
//  855 
//  856   /* Set or Reset the OPM Bit */
//  857   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
TIM1_SelectOnePulseMode:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_SelectOnePulseMode_0
//  858   {
//  859     TIM1->CR1 |= TIM1_CR1_OPM;
        BSET      L:0x52b0, #0x3
        RET
//  860   }
//  861   else
//  862   {
//  863     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
??TIM1_SelectOnePulseMode_0:
        BRES      L:0x52b0, #0x3
//  864   }
//  865 }
        RET
//  866 
//  867 /**
//  868   * @brief  Selects the TIM1 Trigger Output Mode.
//  869   * @param  TIM1_TRGOSource specifies the Trigger Output source.
//  870   *          This parameter can be one of the following values
//  871   *                       - TIM1_TRGOSource_Reset
//  872   *                       - TIM1_TRGOSource_Enable
//  873   *                       - TIM1_TRGOSource_Update
//  874   *                       - TIM1_TRGOSource_OC1
//  875   *                       - TIM1_TRGOSource_OC1REF
//  876   *                       - TIM1_TRGOSource_OC2REF
//  877   *                       - TIM1_TRGOSource_OC3REF
//  878   *                       - TIM1_TRGOSource_OC4REF
//  879   * @retval None
//  880   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  881 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
//  882 {
TIM1_SelectOutputTrigger:
        LD        S:?b0, A
//  883   /* Check the parameters */
//  884   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
//  885   /* Reset the MMS Bits & Select the TRGO source */
//  886   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
        LD        A, #0x8f
        AND       A, L:0x52b1
        OR        A, S:?b0
        LD        L:0x52b1, A
//  887 }
        RET
//  888 
//  889 /**
//  890   * @brief  Selects the TIM1 Slave Mode.
//  891   * @param  TIM1_SlaveMode specifies the TIM1 Slave Mode.
//  892   *         This parameter can be one of the following values
//  893   *                       - TIM1_SlaveMode_Reset
//  894   *                       - TIM1_SlaveMode_Gated
//  895   *                       - TIM1_SlaveMode_Trigger
//  896   *                       - TIM1_SlaveMode_External1
//  897   * @retval None
//  898   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  899 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
//  900 {
TIM1_SelectSlaveMode:
        LD        S:?b0, A
//  901   /* Check the parameters */
//  902   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
//  903 
//  904   /* Reset the SMS Bits and Select the Slave Mode */
//  905   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
        LD        A, #0xf8
        AND       A, L:0x52b2
        OR        A, S:?b0
        LD        L:0x52b2, A
//  906 
//  907 }
        RET
//  908 
//  909 /**
//  910   * @brief  Sets or Resets the TIM1 Master/Slave Mode.
//  911   * @param  NewState new state of the synchronization between TIM1 and its slaves
//  912   *         (through TRGO). This parameter can be ENABLE or DISABLE.
//  913   * @retval None
//  914   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  915 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
//  916 {
//  917   /* Check the parameters */
//  918   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  919 
//  920   /* Set or Reset the MSM Bit */
//  921   if (NewState != DISABLE)
TIM1_SelectMasterSlaveMode:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_SelectMasterSlaveMode_0
//  922   {
//  923     TIM1->SMCR |= TIM1_SMCR_MSM;
        BSET      L:0x52b2, #0x7
        RET
//  924   }
//  925   else
//  926   {
//  927     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
??TIM1_SelectMasterSlaveMode_0:
        BRES      L:0x52b2, #0x7
//  928   }
//  929 }
        RET
//  930 
//  931 /**
//  932   * @brief  Configures the TIM1 Encoder Interface.
//  933   * @param  TIM1_EncoderMode specifies the TIM1 Encoder Mode.
//  934   *         This parameter can be one of the following values
//  935   *         - TIM1_EncoderMode_TI1: Counter counts on TI1FP1 edge
//  936   *          depending on TI2FP2 level.
//  937   *         - TIM1_EncoderMode_TI2: Counter counts on TI2FP2 edge
//  938   *         depending on TI1FP1 level.
//  939   *         - TIM1_EncoderMode_TI12: Counter counts on both TI1FP1 and
//  940   *         TI2FP2 edges depending on the level of the other input.
//  941   * @param  TIM1_IC1Polarity specifies the IC1 Polarity.
//  942   *         This parameter can be one of the following values
//  943   *         - TIM1_ICPolarity_Falling
//  944   *         - TIM1_ICPolarity_Rising
//  945   * @param  TIM1_IC2Polarity specifies the IC2 Polarity.
//  946   *         This parameter can be one of the following values
//  947   *         - TIM1_ICPolarity_Falling
//  948   *         - TIM1_ICPolarity_Rising
//  949   * @retval None
//  950   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  951 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
//  952                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
//  953                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
//  954 {
TIM1_EncoderInterfaceConfig:
        LD        S:?b2, A
//  955   /* Check the parameters */
//  956   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
//  957   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
//  958   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
//  959 
//  960   /* Set the TI1 and the TI2 Polarities */
//  961   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_EncoderInterfaceConfig_0
//  962   {
//  963     TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x52bd, #0x1
        JRA       L:??TIM1_EncoderInterfaceConfig_1
//  964   }
//  965   else
//  966   {
//  967     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TIM1_EncoderInterfaceConfig_0:
        BRES      L:0x52bd, #0x1
//  968   }
//  969 
//  970   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
??TIM1_EncoderInterfaceConfig_1:
        CP        A, S:?b1
        JREQ      L:??TIM1_EncoderInterfaceConfig_2
//  971   {
//  972     TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x52bd, #0x5
        JRA       L:??TIM1_EncoderInterfaceConfig_3
//  973   }
//  974   else
//  975   {
//  976     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TIM1_EncoderInterfaceConfig_2:
        BRES      L:0x52bd, #0x5
//  977   }
//  978   /* Set the encoder Mode */
//  979   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
??TIM1_EncoderInterfaceConfig_3:
        LD        A, #0xf0
        AND       A, L:0x52b2
        OR        A, S:?b2
        LD        L:0x52b2, A
//  980 
//  981   /* Select the Capture Compare 1 and the Capture Compare 2 as input */
//  982   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
        LD        A, #0xfc
        AND       A, L:0x52b9
        OR        A, #0x1
        LD        L:0x52b9, A
//  983   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
        LD        A, #0xfc
        AND       A, L:0x52ba
        OR        A, #0x1
        LD        L:0x52ba, A
//  984 
//  985 }
        RET
//  986 
//  987 /**
//  988   * @brief  Configures the TIM1 Prescaler.
//  989   * @param  Prescaler specifies the Prescaler Register value
//  990   *         This parameter must be a value between 0x0000 and 0xFFFF
//  991   * @param  TIM1_PSCReloadMode specifies the TIM1 Prescaler Reload mode.
//  992   *         This parameter can be one of the following values
//  993   *         - TIM1_PSCReloadMode_Immediate: The Prescaler is loaded immediately.
//  994   *         - TIM1_PSCReloadMode_Update: The Prescaler is loaded at the update
//  995   *         event.
//  996   * @retval None
//  997   */
//  998 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  999 void TIM1_PrescalerConfig(uint16_t Prescaler,
// 1000                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
// 1001 {
TIM1_PrescalerConfig:
        LDW       Y, X
        LD        S:?b0, A
// 1002   /* Check the parameters */
// 1003   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
// 1004 
// 1005   /* Set the Prescaler value */
// 1006   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c1, A
// 1007   TIM1->PSCRL = (uint8_t)(Prescaler);
        LD        A, YL
        LD        L:0x52c2, A
// 1008 
// 1009   /* Set or reset the UG Bit */
// 1010   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
        LD        A, S:?b0
        LD        L:0x52b8, A
// 1011 }
        RET
// 1012 
// 1013 /**
// 1014   * @brief  Specifies the TIM1 Counter Mode to be used.
// 1015   * @param  TIM1_CounterMode specifies the Counter Mode to be used
// 1016   *   This parameter can be one of the following values:
// 1017   *                       - TIM1_CounterMode_Up: TIM1 Up Counting Mode
// 1018   *                       - TIM1_CounterMode_Down: TIM1 Down Counting Mode
// 1019   *                       - TIM1_CounterMode_CenterAligned1: TIM1 Center Aligned Mode1
// 1020   *                       - TIM1_CounterMode_CenterAligned2: TIM1 Center Aligned Mode2
// 1021   *                       - TIM1_CounterMode_CenterAligned3: TIM1 Center Aligned Mode3
// 1022   * @retval None
// 1023   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1024 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
// 1025 {
TIM1_CounterModeConfig:
        LD        S:?b0, A
// 1026   /* Check the parameters */
// 1027   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
// 1028 
// 1029 
// 1030   /* Reset the CMS and DIR Bits & Set the Counter Mode */
// 1031   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
// 1032                         | (uint8_t)TIM1_CounterMode);
        LD        A, #0x8f
        AND       A, L:0x52b0
        OR        A, S:?b0
        LD        L:0x52b0, A
// 1033 }
        RET
// 1034 
// 1035 /**
// 1036   * @brief  Forces the TIM1 Channel1 output waveform to active or inactive level.
// 1037   * @param  TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1038   *   This parameter can be one of the following values:
// 1039   *                       - TIM1_ForcedAction_Active: Force active level on OC1REF
// 1040   *                       - TIM1_ForcedAction_Inactive: Force inactive level on
// 1041   *                         OC1REF.
// 1042   * @retval None
// 1043   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1044 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1045 {
TIM1_ForcedOC1Config:
        LD        S:?b0, A
// 1046   /* Check the parameters */
// 1047   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
// 1048 
// 1049   /* Reset the OCM Bits & Configure the Forced output Mode */
// 1050   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
        LD        A, #0x8f
        AND       A, L:0x52b9
        OR        A, S:?b0
        LD        L:0x52b9, A
// 1051 }
        RET
// 1052 
// 1053 /**
// 1054   * @brief  Forces the TIM1 Channel2 output waveform to active or inactive level.
// 1055   * @param  TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1056   *   This parameter can be one of the following values:
// 1057   *                       - TIM1_ForcedAction_Active: Force active level on OC2REF
// 1058   *                       - TIM1_ForcedAction_Inactive: Force inactive level on
// 1059   *                         OC2REF.
// 1060   * @retval None
// 1061   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1062 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1063 {
TIM1_ForcedOC2Config:
        LD        S:?b0, A
// 1064   /* Check the parameters */
// 1065   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
// 1066 
// 1067   /* Reset the OCM Bits & Configure the Forced output Mode */
// 1068   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
        LD        A, #0x8f
        AND       A, L:0x52ba
        OR        A, S:?b0
        LD        L:0x52ba, A
// 1069 }
        RET
// 1070 
// 1071 /**
// 1072   * @brief  Forces the TIM1 Channel3 output waveform to active or inactive level.
// 1073   * @param  TIM1_ForcedAction specifies the forced Action to be set to the output waveform.
// 1074   *   This parameter can be one of the following values:
// 1075   *                       - TIM1_ForcedAction_Active: Force active level on OC3REF
// 1076   *                       - TIM1_ForcedAction_Inactive: Force inactive level on
// 1077   *                         OC3REF.
// 1078   * @retval None
// 1079   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1080 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
// 1081 {
TIM1_ForcedOC3Config:
        LD        S:?b0, A
// 1082   /* Check the parameters */
// 1083   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
// 1084 
// 1085   /* Reset the OCM Bits */ /* Configure The Forced output Mode */
// 1086   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
        LD        A, #0x8f
        AND       A, L:0x52bb
        OR        A, S:?b0
        LD        L:0x52bb, A
// 1087 }
        RET
// 1088 
// 1089 /**
// 1090   * @brief  Enables or disables TIM1 peripheral Preload register on ARR.
// 1091   * @param  NewState new state of the TIM1 peripheral Preload register.
// 1092   *   This parameter can be ENABLE or DISABLE.
// 1093   * @retval None
// 1094   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1095 void TIM1_ARRPreloadConfig(FunctionalState NewState)
// 1096 {
// 1097   /* Check the parameters */
// 1098   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1099 
// 1100   /* Set or Reset the ARPE Bit */
// 1101   if (NewState != DISABLE)
TIM1_ARRPreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_ARRPreloadConfig_0
// 1102   {
// 1103     TIM1->CR1 |= TIM1_CR1_ARPE;
        BSET      L:0x52b0, #0x7
        RET
// 1104   }
// 1105   else
// 1106   {
// 1107     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
??TIM1_ARRPreloadConfig_0:
        BRES      L:0x52b0, #0x7
// 1108   }
// 1109 }
        RET
// 1110 
// 1111 /**
// 1112   * @brief  Selects the TIM1 peripheral Commutation event.
// 1113   * @param  NewState new state of the Commutation event.
// 1114   *   This parameter can be ENABLE or DISABLE.
// 1115   * @retval None
// 1116   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1117 void TIM1_SelectCOM(FunctionalState NewState)
// 1118 {
// 1119   /* Check the parameters */
// 1120   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1121 
// 1122   /* Set or Reset the CCUS Bit */
// 1123   if (NewState != DISABLE)
TIM1_SelectCOM:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_SelectCOM_0
// 1124   {
// 1125     TIM1->CR2 |= TIM1_CR2_CCUS;
        BSET      L:0x52b1, #0x2
        RET
// 1126   }
// 1127   else
// 1128   {
// 1129     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
??TIM1_SelectCOM_0:
        BRES      L:0x52b1, #0x2
// 1130   }
// 1131 }
        RET
// 1132 
// 1133 /**
// 1134   * @brief  Sets or Resets the TIM1 peripheral Capture Compare Preload Control bit.
// 1135   * @param  NewState new state of the Capture Compare Preload Control bit.
// 1136   *   This parameter can be ENABLE or DISABLE.
// 1137   * @retval None
// 1138   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1139 void TIM1_CCPreloadControl(FunctionalState NewState)
// 1140 {
// 1141   /* Check the parameters */
// 1142   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1143 
// 1144   /* Set or Reset the CCPC Bit */
// 1145   if (NewState != DISABLE)
TIM1_CCPreloadControl:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_CCPreloadControl_0
// 1146   {
// 1147     TIM1->CR2 |= TIM1_CR2_CCPC;
        BSET      L:0x52b1, #0x0
        RET
// 1148   }
// 1149   else
// 1150   {
// 1151     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
??TIM1_CCPreloadControl_0:
        BRES      L:0x52b1, #0x0
// 1152   }
// 1153 }
        RET
// 1154 
// 1155 /**
// 1156   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR1.
// 1157   * @param  NewState new state of the Capture Compare Preload register.
// 1158   *   This parameter can be ENABLE or DISABLE.
// 1159   * @retval None
// 1160   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1161 void TIM1_OC1PreloadConfig(FunctionalState NewState)
// 1162 {
// 1163   /* Check the parameters */
// 1164   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1165 
// 1166   /* Set or Reset the OC1PE Bit */
// 1167   if (NewState != DISABLE)
TIM1_OC1PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC1PreloadConfig_0
// 1168   {
// 1169     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
        BSET      L:0x52b9, #0x3
        RET
// 1170   }
// 1171   else
// 1172   {
// 1173     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC1PreloadConfig_0:
        BRES      L:0x52b9, #0x3
// 1174   }
// 1175 }
        RET
// 1176 
// 1177 /**
// 1178   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR2.
// 1179   * @param  NewState new state of the Capture Compare Preload register.
// 1180   *   This parameter can be ENABLE or DISABLE.
// 1181   * @retval None
// 1182   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1183 void TIM1_OC2PreloadConfig(FunctionalState NewState)
// 1184 {
// 1185   /* Check the parameters */
// 1186   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1187 
// 1188   /* Set or Reset the OC2PE Bit */
// 1189   if (NewState != DISABLE)
TIM1_OC2PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC2PreloadConfig_0
// 1190   {
// 1191     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
        BSET      L:0x52ba, #0x3
        RET
// 1192   }
// 1193   else
// 1194   {
// 1195     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC2PreloadConfig_0:
        BRES      L:0x52ba, #0x3
// 1196   }
// 1197 }
        RET
// 1198 
// 1199 /**
// 1200   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR3.
// 1201   * @param  NewState new state of the Capture Compare Preload register.
// 1202   *   This parameter can be ENABLE or DISABLE.
// 1203   * @retval None
// 1204   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1205 void TIM1_OC3PreloadConfig(FunctionalState NewState)
// 1206 {
// 1207   /* Check the parameters */
// 1208   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1209 
// 1210   /* Set or Reset the OC3PE Bit */
// 1211   if (NewState != DISABLE)
TIM1_OC3PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC3PreloadConfig_0
// 1212   {
// 1213     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
        BSET      L:0x52bb, #0x3
        RET
// 1214   }
// 1215   else
// 1216   {
// 1217     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC3PreloadConfig_0:
        BRES      L:0x52bb, #0x3
// 1218   }
// 1219 }
        RET
// 1220 
// 1221 /**
// 1222   * @brief  Enables or disables the TIM1 peripheral Preload Register on CCR4.
// 1223   * @param  NewState new state of the Capture Compare Preload register.
// 1224   *   This parameter can be ENABLE or DISABLE.
// 1225   * @retval None
// 1226   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1227 void TIM1_OC4PreloadConfig(FunctionalState NewState)
// 1228 {
// 1229   /* Check the parameters */
// 1230   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1231 
// 1232   /* Set or Reset the OC4PE Bit */
// 1233   if (NewState != DISABLE)
TIM1_OC4PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC4PreloadConfig_0
// 1234   {
// 1235     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
        BSET      L:0x52bc, #0x3
        RET
// 1236   }
// 1237   else
// 1238   {
// 1239     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
??TIM1_OC4PreloadConfig_0:
        BRES      L:0x52bc, #0x3
// 1240   }
// 1241 }
        RET
// 1242 
// 1243 /**
// 1244   * @brief  Configures the TIM1 Capture Compare 1 Fast feature.
// 1245   * @param  NewState new state of the Output Compare Fast Enable bit.
// 1246   *   This parameter can be ENABLE or DISABLE.
// 1247   * @retval None
// 1248   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1249 void TIM1_OC1FastConfig(FunctionalState NewState)
// 1250 {
// 1251   /* Check the parameters */
// 1252   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1253 
// 1254   /* Set or Reset the OC1FE Bit */
// 1255   if (NewState != DISABLE)
TIM1_OC1FastConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC1FastConfig_0
// 1256   {
// 1257     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
        BSET      L:0x52b9, #0x2
        RET
// 1258   }
// 1259   else
// 1260   {
// 1261     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC1FastConfig_0:
        BRES      L:0x52b9, #0x2
// 1262   }
// 1263 }
        RET
// 1264 
// 1265 /**
// 1266   * @brief  Configures the TIM1 Capture Compare 2 Fast feature.
// 1267   * @param  NewState new state of the Output Compare Fast Enable bit.
// 1268   *   This parameter can be ENABLE or DISABLE.
// 1269   * @retval None
// 1270   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1271 void TIM1_OC2FastConfig(FunctionalState NewState)
// 1272 {
// 1273   /* Check the parameters */
// 1274   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1275 
// 1276   /* Set or Reset the OC2FE Bit */
// 1277   if (NewState != DISABLE)
TIM1_OC2FastConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC2FastConfig_0
// 1278   {
// 1279     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
        BSET      L:0x52ba, #0x2
        RET
// 1280   }
// 1281   else
// 1282   {
// 1283     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC2FastConfig_0:
        BRES      L:0x52ba, #0x2
// 1284   }
// 1285 }
        RET
// 1286 
// 1287 /**
// 1288   * @brief  Configures the TIM1 Capture Compare 3 Fast feature.
// 1289   * @param  NewState new state of the Output Compare Fast Enable bit.
// 1290   *   This parameter can be ENABLE or DISABLE.
// 1291   * @retval None
// 1292   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1293 void TIM1_OC3FastConfig(FunctionalState NewState)
// 1294 {
// 1295   /* Check the parameters */
// 1296   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1297 
// 1298   /* Set or Reset the OC3FE Bit */
// 1299   if (NewState != DISABLE)
TIM1_OC3FastConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC3FastConfig_0
// 1300   {
// 1301     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
        BSET      L:0x52bb, #0x2
        RET
// 1302   }
// 1303   else
// 1304   {
// 1305     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
??TIM1_OC3FastConfig_0:
        BRES      L:0x52bb, #0x2
// 1306   }
// 1307 }
        RET
// 1308 
// 1309 /**
// 1310   * @brief   Clears or safeguards the OC1REF signal.
// 1311   * @param  NewState new state of the Output Compare 1 Clear Enable bit.
// 1312   *   This parameter can be ENABLE or DISABLE.
// 1313   * @retval None
// 1314   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1315 void TIM1_ClearOC1Ref(FunctionalState NewState)
// 1316 {
// 1317   /* Check the parameters */
// 1318   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1319 
// 1320   /* Set or Reset the OC1CE Bit */
// 1321   if (NewState != DISABLE)
TIM1_ClearOC1Ref:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_ClearOC1Ref_0
// 1322   {
// 1323     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
        BSET      L:0x52b9, #0x7
        RET
// 1324   }
// 1325   else
// 1326   {
// 1327     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
??TIM1_ClearOC1Ref_0:
        BRES      L:0x52b9, #0x7
// 1328   }
// 1329 }
        RET
// 1330 
// 1331 /**
// 1332   * @brief  Clears or safeguards the OC2REF signal.
// 1333   * @param  NewState new state of the Output Compare 2 Clear Enable bit.
// 1334   *   This parameter can be ENABLE or DISABLE.
// 1335   * @retval None
// 1336   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1337 void TIM1_ClearOC2Ref(FunctionalState NewState)
// 1338 {
// 1339   /* Check the parameters */
// 1340   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1341 
// 1342   /* Set or Reset the OC2CE Bit */
// 1343   if (NewState != DISABLE)
TIM1_ClearOC2Ref:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_ClearOC2Ref_0
// 1344   {
// 1345     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
        BSET      L:0x52ba, #0x7
        RET
// 1346   }
// 1347   else
// 1348   {
// 1349     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
??TIM1_ClearOC2Ref_0:
        BRES      L:0x52ba, #0x7
// 1350   }
// 1351 }
        RET
// 1352 
// 1353 /**
// 1354   * @brief  Clears or safeguards the OC3REF signal.
// 1355   * @param  NewState new state of the Output Compare 3 Clear Enable bit.
// 1356   *   This parameter can be ENABLE or DISABLE.
// 1357   * @retval None
// 1358   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1359 void TIM1_ClearOC3Ref(FunctionalState NewState)
// 1360 {
// 1361   /* Check the parameters */
// 1362   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1363 
// 1364   /* Set or Reset the OC3CE Bit */
// 1365   if (NewState != DISABLE)
TIM1_ClearOC3Ref:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_ClearOC3Ref_0
// 1366   {
// 1367     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
        BSET      L:0x52bb, #0x7
        RET
// 1368   }
// 1369   else
// 1370   {
// 1371     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
??TIM1_ClearOC3Ref_0:
        BRES      L:0x52bb, #0x7
// 1372   }
// 1373 }
        RET
// 1374 
// 1375 /**
// 1376   * @brief  Clears or safeguards the OC4REF signal.
// 1377   * @param  NewState new state of the Output Compare 4 Clear Enable bit.
// 1378   *   This parameter can be ENABLE or DISABLE.
// 1379   * @retval None
// 1380   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1381 void TIM1_ClearOC4Ref(FunctionalState NewState)
// 1382 {
// 1383   /* Check the parameters */
// 1384   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1385 
// 1386   /* Set or Reset the OC4CE Bit */
// 1387   if (NewState != DISABLE)
TIM1_ClearOC4Ref:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_ClearOC4Ref_0
// 1388   {
// 1389     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
        BSET      L:0x52bc, #0x7
        RET
// 1390   }
// 1391   else
// 1392   {
// 1393     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
??TIM1_ClearOC4Ref_0:
        BRES      L:0x52bc, #0x7
// 1394   }
// 1395 }
        RET
// 1396 
// 1397 /**
// 1398   * @brief  Configures the TIM1 event to be generated by software.
// 1399   * @param  TIM1_EventSource specifies the event source.
// 1400   *   This parameter can be one of the @ref TIM1_EventSource_TypeDef enumeration.
// 1401   * @retval None
// 1402   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1403 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
// 1404 {
// 1405   /* Check the parameters */
// 1406   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
// 1407 
// 1408   /* Set the event sources */
// 1409   TIM1->EGR = (uint8_t)TIM1_EventSource;
TIM1_GenerateEvent:
        LD        L:0x52b8, A
// 1410 }
        RET
// 1411 
// 1412 /**
// 1413   * @brief  Configures the TIM1 Channel 1 polarity.
// 1414   * @param  TIM1_OCPolarity specifies the OC1 Polarity.
// 1415   *   This parameter can be one of the following values:
// 1416   *                       - TIM1_OCPolarity_Low: Output Compare active low
// 1417   *                       - TIM1_OCPolarity_High: Output Compare active high
// 1418   * @retval None
// 1419   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1420 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1421 {
// 1422   /* Check the parameters */
// 1423   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
// 1424 
// 1425   /* Set or Reset the CC1P Bit */
// 1426   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
TIM1_OC1PolarityConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC1PolarityConfig_0
// 1427   {
// 1428     TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x52bd, #0x1
        RET
// 1429   }
// 1430   else
// 1431   {
// 1432     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TIM1_OC1PolarityConfig_0:
        BRES      L:0x52bd, #0x1
// 1433   }
// 1434 }
        RET
// 1435 
// 1436 /**
// 1437   * @brief  Configures the TIM1 Channel 1N polarity.
// 1438   * @param  TIM1_OCNPolarity specifies the OC1N Polarity.
// 1439   *   This parameter can be one of the following values:
// 1440   *                       - TIM1_OCNPolarity_Low: Output Compare active low
// 1441   *                       - TIM1_OCNPolarity_High: Output Compare active high
// 1442   * @retval None
// 1443   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1444 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1445 {
// 1446   /* Check the parameters */
// 1447   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
// 1448 
// 1449   /* Set or Reset the CC3P Bit */
// 1450   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
TIM1_OC1NPolarityConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC1NPolarityConfig_0
// 1451   {
// 1452     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
        BSET      L:0x52bd, #0x3
        RET
// 1453   }
// 1454   else
// 1455   {
// 1456     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
??TIM1_OC1NPolarityConfig_0:
        BRES      L:0x52bd, #0x3
// 1457   }
// 1458 }
        RET
// 1459 
// 1460 /**
// 1461   * @brief  Configures the TIM1 Channel 2 polarity.
// 1462   * @param  TIM1_OCPolarity specifies the OC2 Polarity.
// 1463   *   This parameter can be one of the following values:
// 1464   *                       - TIM1_OCPolarity_Low: Output Compare active low
// 1465   *                       - TIM1_OCPolarity_High: Output Compare active high
// 1466   * @retval None
// 1467   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1468 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1469 {
// 1470   /* Check the parameters */
// 1471   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
// 1472 
// 1473   /* Set or Reset the CC2P Bit */
// 1474   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
TIM1_OC2PolarityConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC2PolarityConfig_0
// 1475   {
// 1476     TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x52bd, #0x5
        RET
// 1477   }
// 1478   else
// 1479   {
// 1480     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TIM1_OC2PolarityConfig_0:
        BRES      L:0x52bd, #0x5
// 1481   }
// 1482 }
        RET
// 1483 
// 1484 /**
// 1485   * @brief  Configures the TIM1 Channel 2N polarity.
// 1486   * @param  TIM1_OCNPolarity specifies the OC2N Polarity.
// 1487   *   This parameter can be one of the following values:
// 1488   *                       - TIM1_OCNPolarity_Low: Output Compare active low
// 1489   *                       - TIM1_OCNPolarity_High: Output Compare active high
// 1490   * @retval None
// 1491   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1492 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1493 {
// 1494   /* Check the parameters */
// 1495   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
// 1496 
// 1497   /* Set or Reset the CC3P Bit */
// 1498   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
TIM1_OC2NPolarityConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC2NPolarityConfig_0
// 1499   {
// 1500     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
        BSET      L:0x52bd, #0x7
        RET
// 1501   }
// 1502   else
// 1503   {
// 1504     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
??TIM1_OC2NPolarityConfig_0:
        BRES      L:0x52bd, #0x7
// 1505   }
// 1506 }
        RET
// 1507 
// 1508 /**
// 1509   * @brief  Configures the TIM1 Channel 3 polarity.
// 1510   * @param  TIM1_OCPolarity specifies the OC3 Polarity.
// 1511   *   This parameter can be one of the following values:
// 1512   *                       - TIM1_OCPolarity_Low: Output Compare active low
// 1513   *                       - TIM1_OCPolarity_High: Output Compare active high
// 1514   * @retval None
// 1515   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1516 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
// 1517 {
// 1518   /* Check the parameters */
// 1519   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
// 1520 
// 1521   /* Set or Reset the CC3P Bit */
// 1522   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
TIM1_OC3PolarityConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC3PolarityConfig_0
// 1523   {
// 1524     TIM1->CCER2 |= TIM1_CCER2_CC3P;
        BSET      L:0x52be, #0x1
        RET
// 1525   }
// 1526   else
// 1527   {
// 1528     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
??TIM1_OC3PolarityConfig_0:
        BRES      L:0x52be, #0x1
// 1529   }
// 1530 }
        RET
// 1531 
// 1532 /**
// 1533   * @brief  Configures the TIM1 Channel 3N polarity.
// 1534   * @param  TIM1_OCNPolarity specifies the OC3N Polarity.
// 1535   *   This parameter can be one of the following values:
// 1536   *                       - TIM1_OCNPolarity_Low: Output Compare active low
// 1537   *                       - TIM1_OCNPolarity_High: Output Compare active high
// 1538   * @retval None
// 1539   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1540 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
// 1541 {
// 1542   /* Check the parameters */
// 1543   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
// 1544 
// 1545   /* Set or Reset the CC3P Bit */
// 1546   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
TIM1_OC3NPolarityConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_OC3NPolarityConfig_0
// 1547   {
// 1548     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
        BSET      L:0x52be, #0x3
        RET
// 1549   }
// 1550   else
// 1551   {
// 1552     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
??TIM1_OC3NPolarityConfig_0:
        BRES      L:0x52be, #0x3
// 1553   }
// 1554 }
        RET
// 1555 
// 1556 /**
// 1557   * @brief  Enables or disables the TIM1 Capture Compare Channel x (x=1,..,4).
// 1558   * @param  TIM1_Channel specifies the TIM1 Channel.
// 1559   *   This parameter can be one of the following values:
// 1560   *                       - TIM1_Channel_1: TIM1 Channel1
// 1561   *                       - TIM1_Channel_2: TIM1 Channel2
// 1562   *                       - TIM1_Channel_3: TIM1 Channel3
// 1563   *                       - TIM1_CHANNEL_4: TIM1 Channel4
// 1564   * @param  NewState specifies the TIM1 Channel CCxE bit new state.
// 1565   *   This parameter can be: ENABLE or DISABLE.
// 1566   * @retval None
// 1567   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1568 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
// 1569 {
TIM1_CCxCmd:
        LD        S:?b1, A
// 1570   /* Check the parameters */
// 1571   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
// 1572   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1573 
// 1574   if (TIM1_Channel == TIM1_Channel_1)
        CLR       A
        CP        A, S:?b1
        JRNE      L:??TIM1_CCxCmd_0
// 1575   {
// 1576     /* Set or Reset the CC1E Bit */
// 1577     if (NewState != DISABLE)
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxCmd_1
// 1578     {
// 1579       TIM1->CCER1 |= TIM1_CCER1_CC1E;
        BSET      L:0x52bd, #0x0
        RET
// 1580     }
// 1581     else
// 1582     {
// 1583       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
??TIM1_CCxCmd_1:
        BRES      L:0x52bd, #0x0
        RET
// 1584     }
// 1585   }
// 1586   else if (TIM1_Channel == TIM1_Channel_2)
??TIM1_CCxCmd_0:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM1_CCxCmd_2
// 1587   {
// 1588     /* Set or Reset the CC2E Bit */
// 1589     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxCmd_3
// 1590     {
// 1591       TIM1->CCER1 |= TIM1_CCER1_CC2E;
        BSET      L:0x52bd, #0x4
        RET
// 1592     }
// 1593     else
// 1594     {
// 1595       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
??TIM1_CCxCmd_3:
        BRES      L:0x52bd, #0x4
        RET
// 1596     }
// 1597   }
// 1598   else if (TIM1_Channel == TIM1_Channel_3)
??TIM1_CCxCmd_2:
        CP        A, #0x2
        JRNE      L:??TIM1_CCxCmd_4
// 1599   {
// 1600     /* Set or Reset the CC3E Bit */
// 1601     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxCmd_5
// 1602     {
// 1603       TIM1->CCER2 |= TIM1_CCER2_CC3E;
        BSET      L:0x52be, #0x0
        RET
// 1604     }
// 1605     else
// 1606     {
// 1607       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
??TIM1_CCxCmd_5:
        BRES      L:0x52be, #0x0
        RET
// 1608     }
// 1609   }
// 1610   else
// 1611   {
// 1612     /* Set or Reset the CC4E Bit */
// 1613     if (NewState != DISABLE)
??TIM1_CCxCmd_4:
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxCmd_6
// 1614     {
// 1615       TIM1->CCER2 |= TIM1_CCER2_CC4E;
        BSET      L:0x52be, #0x4
        RET
// 1616     }
// 1617     else
// 1618     {
// 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
??TIM1_CCxCmd_6:
        BRES      L:0x52be, #0x4
// 1620     }
// 1621   }
// 1622 }
        RET
// 1623 
// 1624 /**
// 1625   * @brief  Enables or disables the TIM1 Capture Compare Channel xN (xN=1,..,3).
// 1626   * @param  TIM1_Channel specifies the TIM1 Channel.
// 1627   *   This parameter can be one of the following values:
// 1628   *                       - TIM1_Channel_1: TIM1 Channel1
// 1629   *                       - TIM1_Channel_2: TIM1 Channel2
// 1630   *                       - TIM1_Channel_3: TIM1 Channel3
// 1631   * @param  NewState specifies the TIM1 Channel CCxNE bit new state.
// 1632   *   This parameter can be: ENABLE or DISABLE.
// 1633   * @retval None
// 1634   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1635 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
// 1636 {
TIM1_CCxNCmd:
        LD        S:?b1, A
// 1637   /* Check the parameters */
// 1638   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
// 1639   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1640 
// 1641   if (TIM1_Channel == TIM1_Channel_1)
        CLR       A
        CP        A, S:?b1
        JRNE      L:??TIM1_CCxNCmd_0
// 1642   {
// 1643     /* Set or Reset the CC1NE Bit */
// 1644     if (NewState != DISABLE)
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxNCmd_1
// 1645     {
// 1646       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
        BSET      L:0x52bd, #0x2
        RET
// 1647     }
// 1648     else
// 1649     {
// 1650       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
??TIM1_CCxNCmd_1:
        BRES      L:0x52bd, #0x2
        RET
// 1651     }
// 1652   }
// 1653   else if (TIM1_Channel == TIM1_Channel_2)
??TIM1_CCxNCmd_0:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM1_CCxNCmd_2
// 1654   {
// 1655     /* Set or Reset the CC2NE Bit */
// 1656     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxNCmd_3
// 1657     {
// 1658       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
        BSET      L:0x52bd, #0x6
        RET
// 1659     }
// 1660     else
// 1661     {
// 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
??TIM1_CCxNCmd_3:
        BRES      L:0x52bd, #0x6
        RET
// 1663     }
// 1664   }
// 1665   else
// 1666   {
// 1667     /* Set or Reset the CC3NE Bit */
// 1668     if (NewState != DISABLE)
??TIM1_CCxNCmd_2:
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM1_CCxNCmd_4
// 1669     {
// 1670       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
        BSET      L:0x52be, #0x2
        RET
// 1671     }
// 1672     else
// 1673     {
// 1674       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
??TIM1_CCxNCmd_4:
        BRES      L:0x52be, #0x2
// 1675     }
// 1676   }
// 1677 }
        RET
// 1678 
// 1679 /**
// 1680   * @brief  Selects the TIM1 Ouput Compare Mode. This function disables the
// 1681   * selected channel before changing the Ouput Compare Mode. User has to
// 1682   * enable this channel using TIM1_CCxCmd and TIM1_CCxNCmd functions.
// 1683   * @param  TIM1_Channel specifies the TIM1 Channel.
// 1684   *   This parameter can be one of the following values:
// 1685   *                       - TIM1_Channel_1: TIM1 Channel1
// 1686   *                       - TIM1_Channel_2: TIM1 Channel2
// 1687   *                       - TIM1_Channel_3: TIM1 Channel3
// 1688 
// 1689   * @param  TIM1_OCMode specifies the TIM1 Output Compare Mode.
// 1690   * This paramter can be one of the following values:
// 1691   *                       - TIM1_OCMode_Timing
// 1692   *                       - TIM1_OCMode_Active
// 1693   *                       - TIM1_OCMode_Inactive
// 1694   *                       - TIM1_OCMode_Toggle
// 1695   *                       - TIM1_OCMode_PWM1
// 1696   *                       - TIM1_OCMode_PWM2
// 1697   * @retval None
// 1698   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1699 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
// 1700 {
TIM1_SelectOCxM:
        LD        S:?b1, A
// 1701   /* Check the parameters */
// 1702   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
// 1703   assert_param(IS_TIM1_OCM(TIM1_OCMode));
// 1704 
// 1705   if (TIM1_Channel == TIM1_Channel_1)
        CLR       A
        CP        A, S:?b1
        JRNE      L:??TIM1_SelectOCxM_0
// 1706   {
// 1707     /* Disable the Channel 1: Reset the CCE Bit */
// 1708     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
        BRES      L:0x52bd, #0x0
// 1709 
// 1710     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1711     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
        LD        A, #0x8f
        AND       A, L:0x52b9
        OR        A, S:?b0
        LD        L:0x52b9, A
        RET
// 1712   }
// 1713   else if (TIM1_Channel == TIM1_Channel_2)
??TIM1_SelectOCxM_0:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM1_SelectOCxM_1
// 1714   {
// 1715     /* Disable the Channel 2: Reset the CCE Bit */
// 1716     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
        BRES      L:0x52bd, #0x4
// 1717 
// 1718     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1719     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
        LD        A, #0x8f
        AND       A, L:0x52ba
        OR        A, S:?b0
        LD        L:0x52ba, A
        RET
// 1720   }
// 1721   else
// 1722   {
// 1723     /* Disable the Channel 3: Reset the CCE Bit */
// 1724     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
??TIM1_SelectOCxM_1:
        BRES      L:0x52be, #0x0
// 1725 
// 1726     /* Reset the Output Compare Bits & Set the Output Compare Mode */
// 1727     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
        LD        A, #0x8f
        AND       A, L:0x52bb
        OR        A, S:?b0
        LD        L:0x52bb, A
// 1728 
// 1729 
// 1730 
// 1731 
// 1732 
// 1733 
// 1734 
// 1735 
// 1736   }
// 1737 }
        RET
// 1738 
// 1739 /**
// 1740   * @brief  Sets the TIM1 Counter Register value.
// 1741   * @param  Counter specifies the Counter register new value.
// 1742   *   This parameter is between 0x0000 and 0xFFFF.
// 1743   * @retval None
// 1744   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1745 void TIM1_SetCounter(uint16_t Counter)
// 1746 {
TIM1_SetCounter:
        LDW       Y, X
// 1747   /* Set the Counter Register value */
// 1748   TIM1->CNTRH = (uint8_t)(Counter >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52bf, A
// 1749   TIM1->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x52c0, A
// 1750 
// 1751 }
        RET
// 1752 
// 1753 /**
// 1754   * @brief  Sets the TIM1 Autoreload Register value.
// 1755   * @param  Autoreload specifies the Autoreload register new value.
// 1756   *   This parameter is between 0x0000 and 0xFFFF.
// 1757   * @retval None
// 1758   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1759 void TIM1_SetAutoreload(uint16_t Autoreload)
// 1760 {
TIM1_SetAutoreload:
        LDW       Y, X
// 1761   /* Set the Autoreload Register value */
// 1762   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c3, A
// 1763   TIM1->ARRL = (uint8_t)(Autoreload);
        LD        A, YL
        LD        L:0x52c4, A
// 1764 }
        RET
// 1765 
// 1766 /**
// 1767   * @brief  Sets the TIM1 Capture Compare1 Register value.
// 1768   * @param  Compare1 specifies the Capture Compare1 register new value.
// 1769   *   This parameter is between 0x0000 and 0xFFFF.
// 1770   * @retval None
// 1771   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1772 void TIM1_SetCompare1(uint16_t Compare1)
// 1773 {
TIM1_SetCompare1:
        LDW       Y, X
// 1774   /* Set the Capture Compare1 Register value */
// 1775   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c6, A
// 1776   TIM1->CCR1L = (uint8_t)(Compare1);
        LD        A, YL
        LD        L:0x52c7, A
// 1777 
// 1778 }
        RET
// 1779 
// 1780 /**
// 1781   * @brief  Sets the TIM1 Capture Compare2 Register value.
// 1782   * @param  Compare2 specifies the Capture Compare2 register new value.
// 1783   *   This parameter is between 0x0000 and 0xFFFF.
// 1784   * @retval None
// 1785   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1786 void TIM1_SetCompare2(uint16_t Compare2)
// 1787 {
TIM1_SetCompare2:
        LDW       Y, X
// 1788   /* Set the Capture Compare2 Register value */
// 1789   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52c8, A
// 1790   TIM1->CCR2L = (uint8_t)(Compare2);
        LD        A, YL
        LD        L:0x52c9, A
// 1791 }
        RET
// 1792 
// 1793 /**
// 1794   * @brief  Sets the TIM1 Capture Compare3 Register value.
// 1795   * @param  Compare3 specifies the Capture Compare3 register new value.
// 1796   *   This parameter is between 0x0000 and 0xFFFF.
// 1797   * @retval None
// 1798   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1799 void TIM1_SetCompare3(uint16_t Compare3)
// 1800 {
TIM1_SetCompare3:
        LDW       Y, X
// 1801   /* Set the Capture Compare3 Register value */
// 1802   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52ca, A
// 1803   TIM1->CCR3L = (uint8_t)(Compare3);
        LD        A, YL
        LD        L:0x52cb, A
// 1804 }
        RET
// 1805 
// 1806 /**
// 1807   * @brief  Sets the TIM1 Capture Compare4 Register value.
// 1808   * @param  Compare4 specifies the Capture Compare4 register new value.
// 1809   *   This parameter is between 0x0000 and 0xFFFF.
// 1810   * @retval None
// 1811   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1812 void TIM1_SetCompare4(uint16_t Compare4)
// 1813 {
TIM1_SetCompare4:
        LDW       Y, X
// 1814   /* Set the Capture Compare4 Register value */
// 1815   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x52cc, A
// 1816   TIM1->CCR4L = (uint8_t)(Compare4);
        LD        A, YL
        LD        L:0x52cd, A
// 1817 }
        RET
// 1818 
// 1819 /**
// 1820   * @brief  Sets the TIM1 Input Capture 1 prescaler.
// 1821   * @param  TIM1_IC1Prescaler specifies the Input Capture prescaler new value
// 1822   *   This parameter can be one of the following values:
// 1823   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1824   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1825   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1826   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1827   * @retval None
// 1828   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1829 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
// 1830 {
TIM1_SetIC1Prescaler:
        LD        S:?b0, A
// 1831   /* Check the parameters */
// 1832   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
// 1833 
// 1834   /* Reset the IC1PSC Bits */ /* Set the IC1PSC value */
// 1835   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
        LD        A, #0xf3
        AND       A, L:0x52b9
        OR        A, S:?b0
        LD        L:0x52b9, A
// 1836 }
        RET
// 1837 
// 1838 /**
// 1839   * @brief  Sets the TIM1 Input Capture 2 prescaler.
// 1840   * @param  TIM1_IC2Prescaler specifies the Input Capture prescaler new value
// 1841   *   This parameter can be one of the following values:
// 1842   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1843   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1844   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1845   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1846   * @retval None
// 1847   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1848 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
// 1849 {
TIM1_SetIC2Prescaler:
        LD        S:?b0, A
// 1850   /* Check the parameters */
// 1851   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
// 1852 
// 1853   /* Reset the IC1PSC Bits */ /* Set the IC1PSC value */
// 1854   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
        LD        A, #0xf3
        AND       A, L:0x52ba
        OR        A, S:?b0
        LD        L:0x52ba, A
// 1855 }
        RET
// 1856 
// 1857 /**
// 1858   * @brief  Sets the TIM1 Input Capture 3 prescaler.
// 1859   * @param  TIM1_IC3Prescaler specifies the Input Capture prescaler new value
// 1860   *   This parameter can be one of the following values:
// 1861   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1862   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1863   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1864   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1865   * @retval None
// 1866   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1867 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
// 1868 {
TIM1_SetIC3Prescaler:
        LD        S:?b0, A
// 1869 
// 1870   /* Check the parameters */
// 1871   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
// 1872 
// 1873   /* Reset the IC1PSC Bits & Set the IC1PSC value */
// 1874   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
        LD        A, #0xf3
        AND       A, L:0x52bb
        OR        A, S:?b0
        LD        L:0x52bb, A
// 1875 }
        RET
// 1876 
// 1877 /**
// 1878   * @brief  Sets the TIM1 Input Capture 4 prescaler.
// 1879   * @param  TIM1_IC4Prescaler specifies the Input Capture prescaler new value
// 1880   *   This parameter can be one of the following values:
// 1881   *                       - TIM1_ICPSC_DIV1: no prescaler
// 1882   *                       - TIM1_ICPSC_DIV2: capture is done once every 2 events
// 1883   *                       - TIM1_ICPSC_DIV4: capture is done once every 4 events
// 1884   *                       - TIM1_ICPSC_DIV8: capture is done once every 8 events
// 1885   * @retval None
// 1886   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1887 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
// 1888 {
TIM1_SetIC4Prescaler:
        LD        S:?b0, A
// 1889 
// 1890   /* Check the parameters */
// 1891   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
// 1892 
// 1893   /* Reset the IC1PSC Bits &  Set the IC1PSC value */
// 1894   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
        LD        A, #0xf3
        AND       A, L:0x52bc
        OR        A, S:?b0
        LD        L:0x52bc, A
// 1895 }
        RET
// 1896 
// 1897 /**
// 1898   * @brief  Gets the TIM1 Input Capture 1 value.
// 1899   * @param  None
// 1900   * @retval Capture Compare 1 Register value.
// 1901   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1902 uint16_t TIM1_GetCapture1(void)
// 1903 {
// 1904   /* Get the Capture 1 Register value */
// 1905 
// 1906   uint16_t tmpccr1 = 0;
// 1907   uint8_t tmpccr1l = 0, tmpccr1h = 0;
// 1908 
// 1909   tmpccr1h = TIM1->CCR1H;
TIM1_GetCapture1:
        LD        A, L:0x52c6
        LD        S:?b1, A
// 1910   tmpccr1l = TIM1->CCR1L;
        LD        A, L:0x52c7
        LD        S:?b0, A
// 1911 
// 1912   tmpccr1 = (uint16_t)(tmpccr1l);
// 1913   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
// 1914   /* Get the Capture 1 Register value */
// 1915   return (uint16_t)tmpccr1;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 1916 }
// 1917 
// 1918 /**
// 1919   * @brief  Gets the TIM1 Input Capture 2 value.
// 1920   * @param  None
// 1921   * @retval Capture Compare 2 Register value.
// 1922   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1923 uint16_t TIM1_GetCapture2(void)
// 1924 {
// 1925   /* Get the Capture 2 Register value */
// 1926 
// 1927   uint16_t tmpccr2 = 0;
// 1928   uint8_t tmpccr2l = 0, tmpccr2h = 0;
// 1929 
// 1930   tmpccr2h = TIM1->CCR2H;
TIM1_GetCapture2:
        LD        A, L:0x52c8
        LD        S:?b1, A
// 1931   tmpccr2l = TIM1->CCR2L;
        LD        A, L:0x52c9
        LD        S:?b0, A
// 1932 
// 1933   tmpccr2 = (uint16_t)(tmpccr2l);
// 1934   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
// 1935   /* Get the Capture 2 Register value */
// 1936   return (uint16_t)tmpccr2;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 1937 }
// 1938 
// 1939 /**
// 1940   * @brief  Gets the TIM1 Input Capture 3 value.
// 1941   * @param  None
// 1942   * @retval Capture Compare 3 Register value.
// 1943   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1944 uint16_t TIM1_GetCapture3(void)
// 1945 {
// 1946   /* Get the Capture 3 Register value */
// 1947   uint16_t tmpccr3 = 0;
// 1948   uint8_t tmpccr3l = 0, tmpccr3h = 0;
// 1949 
// 1950   tmpccr3h = TIM1->CCR3H;
TIM1_GetCapture3:
        LD        A, L:0x52ca
        LD        S:?b1, A
// 1951   tmpccr3l = TIM1->CCR3L;
        LD        A, L:0x52cb
        LD        S:?b0, A
// 1952 
// 1953   tmpccr3 = (uint16_t)(tmpccr3l);
// 1954   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
// 1955   /* Get the Capture 3 Register value */
// 1956   return (uint16_t)tmpccr3;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 1957 }
// 1958 
// 1959 /**
// 1960   * @brief  Gets the TIM1 Input Capture 4 value.
// 1961   * @param  None
// 1962   * @retval Capture Compare 4 Register value.
// 1963   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1964 uint16_t TIM1_GetCapture4(void)
// 1965 {
// 1966   /* Get the Capture 4 Register value */
// 1967   uint16_t tmpccr4 = 0;
// 1968   uint8_t tmpccr4l = 0, tmpccr4h = 0;
// 1969 
// 1970   tmpccr4h = TIM1->CCR4H;
TIM1_GetCapture4:
        LD        A, L:0x52cc
        LD        S:?b1, A
// 1971   tmpccr4l = TIM1->CCR4L;
        LD        A, L:0x52cd
        LD        S:?b0, A
// 1972 
// 1973   tmpccr4 = (uint16_t)(tmpccr4l);
// 1974   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
// 1975   /* Get the Capture 4 Register value */
// 1976   return (uint16_t)tmpccr4;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 1977 }
// 1978 
// 1979 /**
// 1980   * @brief  Gets the TIM1 Counter value.
// 1981   * @param  None
// 1982   * @retval Counter Register value.
// 1983   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1984 uint16_t TIM1_GetCounter(void)
// 1985 {
// 1986   /* Get the Counter Register value */
// 1987   uint16_t tmpcntr = 0;
// 1988   uint8_t tmpcntrl = 0, tmpcntrh = 0;
// 1989 
// 1990   tmpcntrh = TIM1->CNTRH;
TIM1_GetCounter:
        LD        A, L:0x52bf
        LD        S:?b1, A
// 1991   tmpcntrl = TIM1->CNTRL;
        LD        A, L:0x52c0
        LD        S:?b0, A
// 1992 
// 1993   tmpcntr  = (uint16_t)(tmpcntrl);
// 1994   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
// 1995 
// 1996   /* Get the Counter Register value */
// 1997   return (uint16_t)tmpcntr;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b1
        EXG       A, XL
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
// 1998 }
// 1999 
// 2000 /**
// 2001   * @brief  Gets the TIM1 Prescaler value.
// 2002   * @param  :
// 2003   * None
// 2004   * @retval Prescaler Register value.
// 2005   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2006 uint16_t TIM1_GetPrescaler(void)
// 2007 {
// 2008   uint16_t tmpreg = 0;
// 2009   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
TIM1_GetPrescaler:
        LD        A, L:0x52c1
// 2010   /* Get the Prescaler Register value */
// 2011   return (uint16_t)(tmpreg | TIM1->PSCRL);
        CLRW      X
        LD        XL, A
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        SLLW      X
        LD        A, L:0x52c2
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
// 2012 }
// 2013 
// 2014 /**
// 2015   * @brief  Selects the OCReference Clear source.
// 2016   * @param  TIM_OCReferenceClear: specifies the OCReference Clear source.
// 2017   *   This parameter can be one of the following values:
// 2018   *     - TIM1_OCReferenceClear_ETRF
// 2019   *     - TIM1_OCReferenceClear_OCREFCLR
// 2020   * @retval None
// 2021   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2022 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
// 2023 {
// 2024   /* Check the parameters */
// 2025   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
// 2026 
// 2027   /* Set the TIM1_OCReferenceClear source */
// 2028   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
TIM1_SelectOCREFClear:
        BRES      L:0x52b2, #0x3
// 2029   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
        OR        A, L:0x52b2
        LD        L:0x52b2, A
// 2030 }
        RET
// 2031 /**
// 2032   * @brief  Selects the TIM1 peripheral Capture Compare DMA source.
// 2033   * @param   NewState: new state of the Capture Compare DMA source.
// 2034   *   This parameter can be: ENABLE or DISABLE.
// 2035   * @retval None
// 2036   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2037 void TIM1_SelectCCDMA(FunctionalState NewState)
// 2038 {
// 2039   /* Check the parameters */
// 2040   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 2041 
// 2042   if (NewState != DISABLE)
TIM1_SelectCCDMA:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM1_SelectCCDMA_0
// 2043   {
// 2044     /* Set the CCDS Bit */
// 2045     TIM1->CR2 |= TIM1_CR2_CCDS;
        BSET      L:0x52b1, #0x3
        RET
// 2046   }
// 2047   else
// 2048   {
// 2049     /* Reset the CCDS Bit */
// 2050     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
??TIM1_SelectCCDMA_0:
        BRES      L:0x52b1, #0x3
// 2051   }
// 2052 }
        RET
// 2053 
// 2054 /**
// 2055   * @brief  Checks whether the specified TIM1 flag is set or not.
// 2056   * @param  TIM1_FLAG specifies the flag to check.
// 2057   *   This parameter can be one of the following values:
// 2058   *                       - TIM1_FLAG_Update: TIM1 update Flag
// 2059   *                       - TIM1_FLAG_CC1: TIM1 Capture Compare 1 Flag
// 2060   *                       - TIM1_FLAG_CC2: TIM1 Capture Compare 2 Flag
// 2061   *                       - TIM1_FLAG_CC3: TIM1 Capture Compare 3 Flag
// 2062   *                       - TIM1_FLAG_CC4: TIM1 Capture Compare 4 Flag
// 2063   *                       - TIM1_FLAG_COM: TIM1 Commutation Flag
// 2064   *                       - TIM1_FLAG_Trigger: TIM1 Trigger Flag
// 2065   *                       - TIM1_FLAG_Break: TIM1 Break Flag
// 2066   *                       - TIM1_FLAG_CC1OF: TIM1 Capture Compare 1 overcapture Flag
// 2067   *                       - TIM1_FLAG_CC2OF: TIM1 Capture Compare 2 overcapture Flag
// 2068   *                       - TIM1_FLAG_CC3OF: TIM1 Capture Compare 3 overcapture Flag
// 2069   *                       - TIM1_FLAG_CC4OF: TIM1 Capture Compare 4 overcapture Flag
// 2070   * @retval FlagStatus The new state of TIM1_FLAG (SET or RESET).
// 2071   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2072 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
// 2073 {
TIM1_GetFlagStatus:
        LDW       Y, X
// 2074   FlagStatus bitstatus = RESET;
// 2075   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
// 2076 
// 2077   /* Check the parameters */
// 2078   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
// 2079 
// 2080   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
        LD        A, L:0x52b6
        LD        S:?b1, A
// 2081   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
        LD        A, L:0x52b7
        LD        S:?b0, A
// 2082 
// 2083   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, S:?b0
        LD        S:?b0, A
        LD        A, YL
        AND       A, S:?b1
        OR        A, S:?b0
        JREQ      L:??TIM1_GetFlagStatus_0
// 2084   {
// 2085     bitstatus = SET;
        LD        A, #0x1
        RET
// 2086   }
// 2087   else
// 2088   {
// 2089     bitstatus = RESET;
??TIM1_GetFlagStatus_0:
        CLR       A
// 2090   }
// 2091   return (FlagStatus)(bitstatus);
        RET
// 2092 }
// 2093 
// 2094 /**
// 2095   * @brief  Clears the TIM1’s pending flags.
// 2096   * @param  TIM1_FLAG specifies the flag to clear.
// 2097   *   This parameter can be one of the following values:
// 2098   *                       - TIM1_FLAG_Update: TIM1 update Flag
// 2099   *                       - TIM1_FLAG_CC1: TIM1 Capture Compare 1 Flag
// 2100   *                       - TIM1_FLAG_CC2: TIM1 Capture Compare 2 Flag
// 2101   *                       - TIM1_FLAG_CC3: TIM1 Capture Compare 3 Flag
// 2102   *                       - TIM1_FLAG_CC4: TIM1 Capture Compare 4 Flag
// 2103   *                       - TIM1_FLAG_COM: TIM1 Commutation Flag
// 2104   *                       - TIM1_FLAG_Trigger: TIM1 Trigger Flag
// 2105   *                       - TIM1_FLAG_Break: TIM1 Break Flag
// 2106   *                       - TIM1_FLAG_CC1OF: TIM1 Capture Compare 1 overcapture Flag
// 2107   *                       - TIM1_FLAG_CC2OF: TIM1 Capture Compare 2 overcapture Flag
// 2108   *                       - TIM1_FLAG_CC3OF: TIM1 Capture Compare 3 overcapture Flag
// 2109   *                       - TIM1_FLAG_CC4OF: TIM1 Capture Compare 4 overcapture Flag
// 2110   * @retval None.
// 2111   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2112 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
// 2113 {
// 2114   /* Check the parameters */
// 2115   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
// 2116 
// 2117   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 2118   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
TIM1_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x52b6, A
// 2119   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        CPL       A
        AND       A, #0x1e
        LD        L:0x52b7, A
// 2120 }
        RET
// 2121 
// 2122 /**
// 2123   * @brief  Checks whether the TIM1 interrupt has occurred or not.
// 2124   * @param  TIM1_IT specifies the TIM1 interrupt source to check.
// 2125   *   This parameter can be one of the @ref TIM1_IT_TypeDef enumeration.
// 2126   * @retval ITStatus The new state of the TIM1_IT(SET or RESET).
// 2127   */
// 2128 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2129 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
// 2130 {
TIM1_GetITStatus:
        LD        S:?b0, A
// 2131   ITStatus bitstatus = RESET;
// 2132 
// 2133   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
// 2134 
// 2135   /* Check the parameters */
// 2136   assert_param(IS_TIM1_GET_IT(TIM1_IT));
// 2137 
// 2138   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
        LD        A, L:0x52b6
        LD        S:?b1, A
// 2139 
// 2140   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
        LD        A, S:?b0
        AND       A, L:0x52b5
        LD        S:?b2, A
// 2141 
// 2142   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
        LD        A, S:?b0
        AND       A, S:?b1
        JREQ      L:??TIM1_GetITStatus_0
        CLR       A
        CP        A, S:?b2
        JREQ      L:??TIM1_GetITStatus_0
// 2143   {
// 2144     bitstatus = SET;
        LD        A, #0x1
        RET
// 2145   }
// 2146   else
// 2147   {
// 2148     bitstatus = RESET;
??TIM1_GetITStatus_0:
        CLR       A
// 2149   }
// 2150   return (ITStatus)(bitstatus);
        RET
// 2151 }
// 2152 
// 2153 /**
// 2154   * @brief  Clears the TIM1's interrupt pending bits.
// 2155   * @param  TIM1_IT specifies the pending bit to clear.
// 2156   *   This parameter can be one of the @ref TIM1_IT_TypeDef enumeration.
// 2157   * @retval None.
// 2158   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2159 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
// 2160 {
// 2161   /* Check the parameters */
// 2162   assert_param(IS_TIM1_IT(TIM1_IT));
// 2163 
// 2164   /* Clear the IT pending Bit */
// 2165   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
TIM1_ClearITPendingBit:
        CPL       A
        LD        L:0x52b6, A
// 2166 }
        RET
// 2167 
// 2168 /**
// 2169   * @brief  Configure the TI1 as Input.
// 2170   * @param  TIM1_ICPolarity  The Input Polarity.
// 2171   *   This parameter can be one of the following values:
// 2172   *                       - TIM1_ICPolarity_Falling
// 2173   *                       - TIM1_ICPolarity_Rising
// 2174   * @param  TIM1_ICSelection specifies the input to be used.
// 2175   *   This parameter can be one of the following values:
// 2176   *                       - TIM1_ICSelection_DirectTI: TIM1 Input 1 is selected to
// 2177   *                         be connected to IC1.
// 2178   *                       - TIM1_ICSelection_IndirectTI: TIM1 Input 1 is selected to
// 2179   *                         be connected to IC2.
// 2180   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2181   *   This parameter must be a value between 0x00 and 0x0F.
// 2182   * @retval None
// 2183   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2184 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
// 2185 {
TI1_Config:
        LD        S:?b3, A
// 2186 
// 2187   /* Disable the Channel 1: Reset the CCE Bit */
// 2188   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
        BRES      L:0x52bd, #0x0
// 2189 
// 2190   /* Select the Input and set the filter */
// 2191   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
// 2192                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, #0xc
        AND       A, L:0x52b9
        OR        A, S:?b0
        LD        S:?b2, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b2
        OR        A, S:?b0
        LD        L:0x52b9, A
// 2193 
// 2194 
// 2195 
// 2196   /* Select the Polarity */
// 2197   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b3
        JREQ      L:??TI1_Config_0
// 2198   {
// 2199     TIM1->CCER1 |= TIM1_CCER1_CC1P;
        BSET      L:0x52bd, #0x1
        JRA       L:??TI1_Config_1
// 2200   }
// 2201   else
// 2202   {
// 2203     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x52bd, #0x1
// 2204   }
// 2205 
// 2206   /* Set the CCE Bit */
// 2207   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x52bd, #0x0
// 2208 }
        RET
// 2209 
// 2210 /**
// 2211   * @brief  Configure the TI2 as Input.
// 2212   * @param  TIM1_ICPolarity  The Input Polarity.
// 2213   *   This parameter can be one of the following values:
// 2214   *                       - TIM1_ICPolarity_Falling
// 2215   *                       - TIM1_ICPolarity_Rising
// 2216   * @param  TIM1_ICSelection specifies the input to be used.
// 2217   *   This parameter can be one of the following values:
// 2218   *                       - TIM1_ICSelection_DirectTI: TIM1 Input 2 is selected to
// 2219   *                         be connected to IC2.
// 2220   *                       - TIM1_ICSelection_IndirectTI: TIM1 Input 2 is selected to
// 2221   *                         be connected to IC1.
// 2222   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2223   *   This parameter must be a value between 0x00 and 0x0F.
// 2224   * @retval None
// 2225   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2226 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
// 2227 {
TI2_Config:
        LD        S:?b3, A
// 2228   /* Disable the Channel 2: Reset the CCE Bit */
// 2229   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
        BRES      L:0x52bd, #0x4
// 2230 
// 2231   /* Select the Input and set the filter */
// 2232   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
// 2233                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, #0xc
        AND       A, L:0x52ba
        OR        A, S:?b0
        LD        S:?b2, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b2
        OR        A, S:?b0
        LD        L:0x52ba, A
// 2234   /* Select the Polarity */
// 2235   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b3
        JREQ      L:??TI2_Config_0
// 2236   {
// 2237     TIM1->CCER1 |= TIM1_CCER1_CC2P;
        BSET      L:0x52bd, #0x5
        JRA       L:??TI2_Config_1
// 2238   }
// 2239   else
// 2240   {
// 2241     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x52bd, #0x5
// 2242   }
// 2243   /* Set the CCE Bit */
// 2244   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x52bd, #0x4
// 2245 }
        RET
// 2246 
// 2247 /**
// 2248   * @brief  Configure the TI3 as Input.
// 2249   * @param  TIM1_ICPolarity  The Input Polarity.
// 2250   *   This parameter can be one of the following values:
// 2251   *                       - TIM1_ICPolarity_Falling
// 2252   *                       - TIM1_ICPolarity_Rising
// 2253   * @param  TIM1_ICSelection specifies the input to be used.
// 2254   *   This parameter can be one of the following values:
// 2255   *                       - TIM1_ICSelection_DirectTI: TIM1 Input 3 is selected to
// 2256   *                         be connected to IC3.
// 2257   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2258   *   This parameter must be a value between 0x00 and 0x0F.
// 2259   * @retval None
// 2260   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2261 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
// 2262 {
TI3_Config:
        LD        S:?b3, A
// 2263   /* Disable the Channel 3: Reset the CCE Bit */
// 2264   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
        BRES      L:0x52be, #0x0
// 2265 
// 2266   /* Select the Input and set the filter */
// 2267   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
// 2268                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, #0xc
        AND       A, L:0x52bb
        OR        A, S:?b0
        LD        S:?b2, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b2
        OR        A, S:?b0
        LD        L:0x52bb, A
// 2269 
// 2270   /* Select the Polarity */
// 2271   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b3
        JREQ      L:??TI3_Config_0
// 2272   {
// 2273     TIM1->CCER2 |= TIM1_CCER2_CC3P;
        BSET      L:0x52be, #0x1
        JRA       L:??TI3_Config_1
// 2274   }
// 2275   else
// 2276   {
// 2277     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
??TI3_Config_0:
        BRES      L:0x52be, #0x1
// 2278   }
// 2279   /* Set the CCE Bit */
// 2280   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
??TI3_Config_1:
        BSET      L:0x52be, #0x0
// 2281 }
        RET
// 2282 
// 2283 /**
// 2284   * @brief  Configure the TI4 as Input.
// 2285   * @param  TIM1_ICPolarity  The Input Polarity.
// 2286   *   This parameter can be one of the following values:
// 2287   *                       - TIM1_ICPolarity_Falling
// 2288   *                       - TIM1_ICPolarity_Rising
// 2289   * @param  TIM1_ICSelection specifies the input to be used.
// 2290   *   This parameter can be one of the following values:
// 2291   *                       - TIM1_ICSelection_IndirectTI: TIM1 Input 4 is selected to
// 2292   *                         be connected to IC3.
// 2293   * @param  TIM1_ICFilter Specifies the Input Capture Filter.
// 2294   *   This parameter must be a value between 0x00 and 0x0F.
// 2295   * @retval None
// 2296   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 2297 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
// 2298 {
TI4_Config:
        LD        S:?b3, A
// 2299 
// 2300   /* Disable the Channel 4: Reset the CCE Bit */
// 2301   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
        BRES      L:0x52be, #0x4
// 2302 
// 2303   /* Select the Input and set the filter */
// 2304   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
// 2305                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
        LD        A, #0xc
        AND       A, L:0x52bc
        OR        A, S:?b0
        LD        S:?b2, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b2
        OR        A, S:?b0
        LD        L:0x52bc, A
// 2306 
// 2307   /* Select the Polarity */
// 2308   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b3
        JREQ      L:??TI4_Config_0
// 2309   {
// 2310     TIM1->CCER2 |= TIM1_CCER2_CC4P;
        BSET      L:0x52be, #0x5
        JRA       L:??TI4_Config_1
// 2311   }
// 2312   else
// 2313   {
// 2314     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
??TI4_Config_0:
        BRES      L:0x52be, #0x5
// 2315   }
// 2316 
// 2317   /* Set the CCE Bit */
// 2318   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
??TI4_Config_1:
        BSET      L:0x52be, #0x4
// 2319 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 2320 
// 2321 
// 2322 /**
// 2323   * @}
// 2324   */
// 2325 
// 2326 /**
// 2327   * @}
// 2328   */
// 2329 
// 2330 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 2 567 bytes in section .near_func.text
// 
// 2 567 bytes of CODE memory
//
//Errors: none
//Warnings: none
