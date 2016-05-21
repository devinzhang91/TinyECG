///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:43 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim3.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim3.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_tim3.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_tim3

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

        PUBLIC TIM3_ARRPreloadConfig
        PUBLIC TIM3_BKRConfig
        PUBLIC TIM3_CCxCmd
        PUBLIC TIM3_ClearFlag
        PUBLIC TIM3_ClearITPendingBit
        PUBLIC TIM3_Cmd
        PUBLIC TIM3_CounterModeConfig
        PUBLIC TIM3_CtrlPWMOutputs
        PUBLIC TIM3_DMACmd
        PUBLIC TIM3_DeInit
        PUBLIC TIM3_ETRClockMode1Config
        PUBLIC TIM3_ETRClockMode2Config
        PUBLIC TIM3_ETRConfig
        PUBLIC TIM3_EncoderInterfaceConfig
        PUBLIC TIM3_ForcedOC1Config
        PUBLIC TIM3_ForcedOC2Config
        PUBLIC TIM3_GenerateEvent
        PUBLIC TIM3_GetCapture1
        PUBLIC TIM3_GetCapture2
        PUBLIC TIM3_GetCounter
        PUBLIC TIM3_GetFlagStatus
        PUBLIC TIM3_GetITStatus
        PUBLIC TIM3_GetPrescaler
        PUBLIC TIM3_ICInit
        PUBLIC TIM3_ITConfig
        PUBLIC TIM3_InternalClockConfig
        PUBLIC TIM3_OC1FastCmd
        PUBLIC TIM3_OC1Init
        PUBLIC TIM3_OC1PolarityConfig
        PUBLIC TIM3_OC1PreloadConfig
        PUBLIC TIM3_OC2FastCmd
        PUBLIC TIM3_OC2Init
        PUBLIC TIM3_OC2PolarityConfig
        PUBLIC TIM3_OC2PreloadConfig
        PUBLIC TIM3_PWMIConfig
        PUBLIC TIM3_PrescalerConfig
        PUBLIC TIM3_SelectCCDMA
        PUBLIC TIM3_SelectHallSensor
        PUBLIC TIM3_SelectInputTrigger
        PUBLIC TIM3_SelectMasterSlaveMode
        PUBLIC TIM3_SelectOCxM
        PUBLIC TIM3_SelectOnePulseMode
        PUBLIC TIM3_SelectOutputTrigger
        PUBLIC TIM3_SelectSlaveMode
        PUBLIC TIM3_SetAutoreload
        PUBLIC TIM3_SetCompare1
        PUBLIC TIM3_SetCompare2
        PUBLIC TIM3_SetCounter
        PUBLIC TIM3_SetIC1Prescaler
        PUBLIC TIM3_SetIC2Prescaler
        PUBLIC TIM3_TIxExternalClockConfig
        PUBLIC TIM3_TimeBaseInit
        PUBLIC TIM3_UpdateDisableConfig
        PUBLIC TIM3_UpdateRequestConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim3.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_tim3.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the TIM3 firmware functions.
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
//   22 #include "stm8l15x_tim3.h"
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
//   33 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//   34                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
//   35                        uint8_t TIM3_ICFilter);
//   36 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//   37                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
//   38                        uint8_t TIM3_ICFilter);
//   39 
//   40 
//   41 /**
//   42   * @addtogroup TIM3_Public_Functions
//   43   * @{
//   44   */
//   45 
//   46 /**
//   47   * @brief  Deinitializes the TIM3 peripheral registers to their default reset values.
//   48   * @param  None
//   49   * @retval None
//   50   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51 void TIM3_DeInit(void)
//   52 {
//   53   TIM3->CR1 = TIM_CR1_RESET_VALUE;
TIM3_DeInit:
        CLR       A
        LD        L:0x5280, A
//   54   TIM3->CR2 = TIM_CR2_RESET_VALUE;
        LD        L:0x5281, A
//   55   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
        LD        L:0x5282, A
//   56   TIM3->ETR = TIM_ETR_RESET_VALUE;
        LD        L:0x5283, A
//   57   TIM3->IER = TIM_IER_RESET_VALUE;
        LD        L:0x5285, A
//   58   TIM3->SR2 = TIM_SR2_RESET_VALUE;
        LD        L:0x5287, A
//   59 
//   60   /* Disable channels */
//   61   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
        LD        L:0x528b, A
//   62   /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
//   63   TIM3->CCMR1 = 0x01;/* TIM3_ICxSource_TIxFPx */
        LD        A, #0x1
        LD        L:0x5289, A
//   64   TIM3->CCMR2 = 0x01;/* TIM3_ICxSource_TIxFPx */
        LD        L:0x528a, A
//   65 
//   66   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   67   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
        CLR       A
        LD        L:0x528b, A
//   68   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
        LD        L:0x5289, A
//   69   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
        LD        L:0x528a, A
//   70 
//   71   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
        LD        L:0x528c, A
//   72   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
        LD        L:0x528d, A
//   73 
//   74   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
        LD        L:0x528e, A
//   75 
//   76   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x528f, A
//   77   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
        LD        L:0x5290, A
//   78 
//   79   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
        CLR       A
        LD        L:0x5291, A
//   80   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
        LD        L:0x5292, A
//   81   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
        LD        L:0x5293, A
//   82   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
        LD        L:0x5294, A
//   83 
//   84 
//   85   TIM3->OISR = TIM_OISR_RESET_VALUE;
        LD        L:0x5296, A
//   86   TIM3->EGR = 0x01;/* TIM_EGR_UG */
        LD        A, #0x1
        LD        L:0x5288, A
//   87   TIM3->BKR = TIM_BKR_RESET_VALUE;
        CLR       A
        LD        L:0x5295, A
//   88   TIM3->SR1 = TIM_SR1_RESET_VALUE;
        LD        L:0x5286, A
//   89 }
        RET
//   90 
//   91 /**
//   92   * @brief  Initializes the TIM3 Time Base Unit according to the specified parameters.
//   93   * @param  TIM3_Prescaler : This parameter can be any member of the @Ref TIM3_Prescaler_TypeDef enumeration.
//   94   * @param  TIM3_CounterMode : This parameter can be any member of the @Ref TIM3_CounterMode_TypeDef enumeration.
//   95   * @param  TIM3_Period : This parameter must be a value between 0x0000 and 0xFFFF.
//   96   * @retval None
//   97   */
//   98 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
//  100                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
//  101                        uint16_t TIM3_Period)
//  102 {
TIM3_TimeBaseInit:
        LD        S:?b1, A
        LDW       Y, X
//  103 
//  104   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
//  105   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
//  106 
//  107 
//  108 
//  109   /* Set the Autoreload value */
//  110   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x528f, A
//  111   TIM3->ARRL = (uint8_t)(TIM3_Period);
        LD        A, YL
        LD        L:0x5290, A
//  112 
//  113   /* Set the Prescaler value */
//  114   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
        LD        A, S:?b1
        LD        L:0x528e, A
//  115 
//  116   /* Select the Counter Mode */
//  117   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
        LD        A, #0x8f
        AND       A, L:0x5280
        LD        L:0x5280, A
//  118   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
        LD        A, S:?b0
        OR        A, L:0x5280
        LD        L:0x5280, A
//  119 
//  120   /* Generate an update event to reload the Prescaler value immediately */
//  121   TIM3->EGR = TIM3_EventSource_Update;
        LD        A, #0x1
        LD        L:0x5288, A
//  122 }
        RET
//  123 
//  124 /**
//  125   * @brief Initializes the TIM3 Channel1 according to the specified parameters.
//  126   * @param  TIM3_OCMode : This parameter can be any member of the @Ref TIM3_OCMode_TypeDef enumeration.
//  127   * @param  TIM3_OutputState : This parameter can be any member of the @Ref TIM3_OutputState_TypeDef enumeration.
//  128   * @param  TIM3_Pulse : This parameter must be a value between 0x0000 and 0xFFFF.
//  129   * @param  TIM3_OCPolarity : This parameter can be any member of the @Ref TIM3_OCPolarity_TypeDef enumeration.
//  130   * @param  TIM3_OCIdleState : This parameter can be any member of the @Ref TIM3_OCIdleState_TypeDef  enumeration.
//  131   * @retval None
//  132   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
//  134                   TIM3_OutputState_TypeDef TIM3_OutputState,
//  135                   uint16_t TIM3_Pulse,
//  136                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
//  137                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
//  138 {
TIM3_OC1Init:
        LD        S:?b3, A
        LDW       Y, X
//  139   uint8_t tmpccmr1 = 0;
//  140 
//  141   /* Check the parameters */
//  142   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
//  143   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
//  144   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
//  145   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
//  146 
//  147   tmpccmr1 = TIM3->CCMR1;
        LD        A, L:0x5289
//  148 
//  149   /* Disable the Channel 1: Reset the CCE Bit */
//  150   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x528b, #0x0
//  151   /* Reset the Output Compare Bits */
//  152   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
//  153 
//  154   /* Set the Ouput Compare Mode */
//  155   tmpccmr1 |= (uint8_t)TIM3_OCMode;
//  156 
//  157   TIM3->CCMR1 = tmpccmr1;
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x5289, A
//  158 
//  159   /* Set the Output State */
//  160   if (TIM3_OutputState == TIM3_OutputState_Enable)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM3_OC1Init_0
//  161   {
//  162     TIM3->CCER1 |= TIM_CCER1_CC1E;
        BSET      L:0x528b, #0x0
        JRA       L:??TIM3_OC1Init_1
//  163   }
//  164   else
//  165   {
//  166     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
??TIM3_OC1Init_0:
        BRES      L:0x528b, #0x0
//  167   }
//  168 
//  169   /* Set the Output Polarity */
//  170   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
??TIM3_OC1Init_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM3_OC1Init_2
//  171   {
//  172     TIM3->CCER1 |= TIM_CCER1_CC1P;
        BSET      L:0x528b, #0x1
        JRA       L:??TIM3_OC1Init_3
//  173   }
//  174   else
//  175   {
//  176     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
??TIM3_OC1Init_2:
        BRES      L:0x528b, #0x1
//  177   }
//  178 
//  179   /* Set the Output Idle state */
//  180   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
??TIM3_OC1Init_3:
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TIM3_OC1Init_4
//  181   {
//  182     TIM3->OISR |= TIM_OISR_OIS1;
        BSET      L:0x5296, #0x0
        JRA       L:??TIM3_OC1Init_5
//  183   }
//  184   else
//  185   {
//  186     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
??TIM3_OC1Init_4:
        BRES      L:0x5296, #0x0
//  187   }
//  188 
//  189   /* Set the Pulse value */
//  190   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
??TIM3_OC1Init_5:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5291, A
//  191   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
        LD        A, YL
        LD        L:0x5292, A
//  192 }
        RET
//  193 
//  194 /**
//  195   * @brief  Initializes the TIM3 Channel2 according to the specified parameters.
//  196   * @param  TIM3_OCMode : This parameter can be any member of the @Ref TIM3_OCMode_TypeDef enumeration.
//  197   * @param  TIM3_OutputState : This parameter can be any member of the @Ref TIM3_OutputState_TypeDef enumeration.
//  198   * @param  TIM3_Pulse : This parameter must be a value between 0x0000 and 0xFFFF.
//  199   * @param  TIM3_OCPolarity : This parameter can be any member of the @Ref TIM3_OCPolarity_TypeDef enumeration.
//  200   * @param  TIM3_OCIdleState : This parameter can be any member of the @Ref TIM3_OCIdleState_TypeDef  enumeration.
//  201   * @retval None
//  202   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  203 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
//  204                   TIM3_OutputState_TypeDef TIM3_OutputState,
//  205                   uint16_t TIM3_Pulse,
//  206                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
//  207                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
//  208 {
TIM3_OC2Init:
        LD        S:?b3, A
        LDW       Y, X
//  209   uint8_t tmpccmr2 = 0;
//  210 
//  211   /* Check the parameters */
//  212   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
//  213   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
//  214   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
//  215   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
//  216 
//  217   tmpccmr2 = TIM3->CCMR2;
        LD        A, L:0x528a
//  218 
//  219   /* Disable the Channel 2: Reset the CCE Bit */
//  220   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
        BRES      L:0x528b, #0x4
//  221 
//  222   /* Reset the Output Compare Bits */
//  223   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
//  224 
//  225   /* Set the Ouput Compare Mode */
//  226   tmpccmr2 |= (uint8_t)TIM3_OCMode;
//  227 
//  228   TIM3->CCMR2 = tmpccmr2;
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x528a, A
//  229 
//  230   /* Set the Output State */
//  231   if (TIM3_OutputState == TIM3_OutputState_Enable)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM3_OC2Init_0
//  232   {
//  233     TIM3->CCER1 |= TIM_CCER1_CC2E;
        BSET      L:0x528b, #0x4
        JRA       L:??TIM3_OC2Init_1
//  234   }
//  235   else
//  236   {
//  237     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
??TIM3_OC2Init_0:
        BRES      L:0x528b, #0x4
//  238   }
//  239 
//  240   /* Set the Output Polarity */
//  241   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
??TIM3_OC2Init_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM3_OC2Init_2
//  242   {
//  243     TIM3->CCER1 |= TIM_CCER1_CC2P;
        BSET      L:0x528b, #0x5
        JRA       L:??TIM3_OC2Init_3
//  244   }
//  245   else
//  246   {
//  247     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
??TIM3_OC2Init_2:
        BRES      L:0x528b, #0x5
//  248   }
//  249 
//  250 
//  251   /* Set the Output Idle state */
//  252   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
??TIM3_OC2Init_3:
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TIM3_OC2Init_4
//  253   {
//  254     TIM3->OISR |= TIM_OISR_OIS2;
        BSET      L:0x5296, #0x2
        JRA       L:??TIM3_OC2Init_5
//  255   }
//  256   else
//  257   {
//  258     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
??TIM3_OC2Init_4:
        BRES      L:0x5296, #0x2
//  259   }
//  260 
//  261   /* Set the Pulse value */
//  262   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
??TIM3_OC2Init_5:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5293, A
//  263   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
        LD        A, YL
        LD        L:0x5294, A
//  264 }
        RET
//  265 
//  266 /**
//  267   * @brief  Configures the Break feature, dead time, Lock level, the OSSI,
//  268   * and the AOE(automatic output enable).
//  269   * @param  TIM3_OSSIState : Off-State Selection for Idle mode states.
//  270   *   This parameter can be any member of the @Ref TIM3_OSSIState_TypeDef enumeration.
//  271   * @param  TIM3_LockLevel : Lock level.
//  272   *   This parameter can be any member of the @Ref TIM3_LockLevel_TypeDef enumeration.
//  273   * @param  TIM3_BreakState : Break Input enable/disable .
//  274   *   This parameter can be any member of the @Ref TIM3_BreakState_TypeDef enumeration.
//  275   * @param  TIM3_BreakPolarity : Break Polarity.
//  276   *   This parameter can be any member of the @Ref TIM3_BreakPolarity_TypeDef enumeration.
//  277   * @param  TIM3_AutomaticOutput : TIM3 AOE Bit Set/Reset .
//  278   *   This parameter can be anymember of the @Ref TIM3_AutomaticOutput_TypeDef enumeration.
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
//  282                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
//  283                     TIM3_BreakState_TypeDef TIM3_BreakState,
//  284                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
//  285                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
//  286 {
//  287   /* Check the parameters */
//  288   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
//  289   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
//  290   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
//  291   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
//  292   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
//  293 
//  294 
//  295 
//  296   /* Set the Lock level, the Break enable Bit and the Ploarity, the OSSI State,
//  297   the dead time value and the Automatic Output Enable Bit */
//  298 
//  299   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \ 
//  300                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \ 
//  301                                   TIM3_AutomaticOutput));
TIM3_BKRConfig:
        LD        S:?b4, A
        LD        A, S:?b0
        OR        A, S:?b4
        OR        A, S:?b1
        OR        A, S:?b2
        OR        A, S:?b3
        LD        L:0x5295, A
//  302 }
        RET
//  303 
//  304 /**
//  305   * @brief  Initializes the TIM3 peripheral according to the specified parameters.
//  306   * @param  TIM3_Channel : This parameter can be any member of the @Ref TIM3_Channel_TypeDef enumeration.
//  307   * @param  TIM3_ICPolarity : This parameter can be any member of the @Ref TIM3_ICPolarity_TypeDef enumeration.
//  308   * @param  TIM3_ICSelection : This parameter can be any member of the @Ref TIM3_ICSelection_TypeDef enumeration.
//  309   * @param  TIM3_ICPrescaler : This parameter can be any member of the @Ref TIM3_ICPSC_TypeDef enumeration.
//  310   * @param  TIM3_ICFilter : This parameter must be a value between 0x00 and 0x0F.
//  311   * @retval None
//  312   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  313 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
//  314                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  315                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
//  316                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
//  317                  uint8_t TIM3_ICFilter)
//  318 {
TIM3_ICInit:
        LD        S:?b5, A
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b6, S:?b2
        MOV       S:?b1, S:?b3
//  319   /* Check the parameters */
//  320   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
//  321 
//  322   if (TIM3_Channel == TIM3_Channel_1)
        CLR       A
        CP        A, S:?b5
        JRNE      L:??TIM3_ICInit_0
//  323   {
//  324     /* TI1 Configuration */
//  325     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
        LD        A, S:?b4
        CALL      L:TI1_Config
//  326 
//  327     /* Set the Input Capture Prescaler value */
//  328     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
        LD        A, L:0x5289
        AND       A, #0xf3
        OR        A, S:?b6
        LD        L:0x5289, A
//  329   }
        RET
//  330   else /* if (TIM3_Channel == TIM3_Channel_2) */
//  331   {
//  332     /* TI2 Configuration */
//  333     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
??TIM3_ICInit_0:
        LD        A, S:?b4
        CALL      L:TI2_Config
//  334     /* Set the Input Capture Prescaler value */
//  335     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
        LD        A, L:0x528a
        AND       A, #0xf3
        OR        A, S:?b6
        LD        L:0x528a, A
//  336   }
//  337 }
        RET
//  338 
//  339 /**
//  340   * @brief  Configures the TIM3 peripheral in PWM Input Mode according to the
//  341   * specified parameters.
//  342   * @param  TIM3_Channel : This parameter can be any member of the @Ref TIM3_Channel_TypeDef enumeration.
//  343   * @param  TIM3_ICPolarity : This parameter can be any member of the @Ref TIM3_ICPolarity_TypeDef enumeration.
//  344   * @param  TIM3_ICSelection : This parameter can be any member of the @Ref TIM3_ICSelection_TypeDef enumeration.
//  345   * @param  TIM3_ICPrescaler : This parameter can be any member of the @Ref TIM3_ICPSC_TypeDef enumeration.
//  346   * @param  TIM3_ICFilter : This parameter must be a value between 0x00 and 0x0F.
//  347   * @retval None
//  348   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  349 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
//  350                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  351                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
//  352                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
//  353                      uint8_t TIM3_ICFilter)
//  354 {
TIM3_PWMIConfig:
        PUSH      L:?b9
        PUSH      L:?b8
        LD        S:?b8, A
        MOV       S:?b7, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b9, S:?b2
        MOV       S:?b5, S:?b3
//  355   uint8_t icpolarity = TIM3_ICPolarity_Rising;
//  356   uint8_t icselection = TIM3_ICSelection_DirectTI;
//  357 
//  358   /* Check the parameters */
//  359   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
//  360 
//  361   /* Select the Opposite Input Polarity */
//  362   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b7
        JRNE      L:??TIM3_PWMIConfig_0
//  363   {
//  364     icpolarity = TIM3_ICPolarity_Falling;
        LD        A, #0x1
        LD        S:?b4, A
        JRA       L:??TIM3_PWMIConfig_1
//  365   }
//  366   else
//  367   {
//  368     icpolarity = TIM3_ICPolarity_Rising;
??TIM3_PWMIConfig_0:
        CLR       S:?b4
//  369   }
//  370 
//  371   /* Select the Opposite Input */
//  372   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
??TIM3_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM3_PWMIConfig_2
//  373   {
//  374     icselection = TIM3_ICSelection_IndirectTI;
        LD        A, #0x2
        LD        S:?b6, A
        JRA       L:??TIM3_PWMIConfig_3
//  375   }
//  376   else
//  377   {
//  378     icselection = TIM3_ICSelection_DirectTI;
??TIM3_PWMIConfig_2:
        LD        A, #0x1
        LD        S:?b6, A
//  379   }
//  380 
//  381   if (TIM3_Channel == TIM3_Channel_1)
??TIM3_PWMIConfig_3:
        CLR       A
        CP        A, S:?b8
        MOV       S:?b1, S:?b5
        JRNE      L:??TIM3_PWMIConfig_4
//  382   {
//  383     /* TI1 Configuration */
//  384     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
        LD        A, S:?b7
        CALL      L:TI1_Config
//  385 
//  386     /* Set the Input Capture Prescaler value */
//  387     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
        LD        A, L:0x5289
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x5289, A
//  388 
//  389     /* TI2 Configuration */
//  390     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
        MOV       S:?b1, S:?b5
        MOV       S:?b0, S:?b6
        LD        A, S:?b4
        CALL      L:TI2_Config
//  391 
//  392     /* Set the Input Capture Prescaler value */
//  393     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
        LD        A, L:0x528a
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x528a, A
//  394   }
        JRA       L:??TIM3_PWMIConfig_5
//  395   else
//  396   {
//  397     /* TI2 Configuration */
//  398     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
??TIM3_PWMIConfig_4:
        LD        A, S:?b7
        CALL      L:TI2_Config
//  399 
//  400     /* Set the Input Capture Prescaler value */
//  401     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
        LD        A, L:0x528a
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x528a, A
//  402 
//  403     /* TI1 Configuration */
//  404     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
        MOV       S:?b1, S:?b5
        MOV       S:?b0, S:?b6
        LD        A, S:?b4
        CALL      L:TI1_Config
//  405 
//  406     /* Set the Input Capture Prescaler value */
//  407     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
        LD        A, L:0x5289
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x5289, A
//  408   }
//  409 }
??TIM3_PWMIConfig_5:
        POP       L:?b8
        POP       L:?b9
        RET
//  410 
//  411 /**
//  412   * @brief  Enables or disables the TIM3 peripheral.
//  413   * @param NewState : The new state of the TIM3 peripheral.
//  414   *   This parameter can be any of the @ref FunctionalState enumeration.
//  415   * @retval None
//  416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417 void TIM3_Cmd(FunctionalState NewState)
//  418 {
//  419   /* Check the parameters */
//  420   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  421 
//  422   /* set or Reset the CEN Bit */
//  423   if (NewState != DISABLE)
TIM3_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_Cmd_0
//  424   {
//  425     TIM3->CR1 |= TIM_CR1_CEN;
        BSET      L:0x5280, #0x0
        RET
//  426   }
//  427   else
//  428   {
//  429     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
??TIM3_Cmd_0:
        BRES      L:0x5280, #0x0
//  430   }
//  431 }
        RET
//  432 
//  433 /**
//  434   * @brief  Enables or disables the TIM3 peripheral Main Outputs.
//  435   * @param NewState : The new state of the TIM3 peripheral.
//  436   *   This parameter can be any of the @ref FunctionalState enumeration.
//  437   * @retval None
//  438   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  439 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
//  440 {
//  441   /* Check the parameters */
//  442   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  443 
//  444   /* Set or Reset the MOE Bit */
//  445 
//  446   if (NewState != DISABLE)
TIM3_CtrlPWMOutputs:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_CtrlPWMOutputs_0
//  447   {
//  448     TIM3->BKR |= TIM_BKR_MOE ;
        BSET      L:0x5295, #0x7
        RET
//  449   }
//  450   else
//  451   {
//  452     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
??TIM3_CtrlPWMOutputs_0:
        BRES      L:0x5295, #0x7
//  453   }
//  454 }
        RET
//  455 /**
//  456   * @brief  Enables or disables the specified TIM3 interrupts.
//  457   * @param  TIM3_IT : Specifies the TIM3 interrupts sources to be enabled or disabled.
//  458   *   This parameter can be any combination of the @ref TIM3_IT_TypeDef enumeration.
//  459   * @param NewState : The new state of the TIM3 peripheral.
//  460   *   This parameter can be any of the @ref FunctionalState enumeration.
//  461   * @retval None
//  462   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  463 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
//  464 {
TIM3_ITConfig:
        LD        S:?b1, A
//  465   /* Check the parameters */
//  466   assert_param(IS_TIM3_IT(TIM3_IT));
//  467   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  468 
//  469   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM3_ITConfig_0
//  470   {
//  471     /* Enable the Interrupt sources */
//  472     TIM3->IER |= (uint8_t)TIM3_IT;
        LD        A, S:?b1
        OR        A, L:0x5285
        LD        L:0x5285, A
        RET
//  473   }
//  474   else
//  475   {
//  476     /* Disable the Interrupt sources */
//  477     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
??TIM3_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5285
        LD        L:0x5285, A
//  478   }
//  479 }
        RET
//  480 
//  481 /**
//  482   * @brief  Enables or disables the TIMx’s DMA Requests.
//  483   * @param  TIM3_DMASources: specifies the DMA Request sources.
//  484   *   This parameter can be any combination of the @ref TIM3_DMASource_TypeDef enumeration.
//  485   * @param NewState: new state of the DMA Request sources. This parameter can be: ENABLE or DISABLE.
//  486   * @retval None
//  487   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  488 void TIM3_DMACmd(TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
//  489 {
TIM3_DMACmd:
        LD        S:?b1, A
//  490   /* Check the parameters */
//  491   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  492   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
//  493 
//  494   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM3_DMACmd_0
//  495   {
//  496     /* Enable the DMA sources */
//  497     TIM3->DER |= TIM3_DMASource;
        LD        A, S:?b1
        OR        A, L:0x5284
        LD        L:0x5284, A
        RET
//  498   }
//  499   else
//  500   {
//  501     /* Disable the DMA sources */
//  502     TIM3->DER &= (uint8_t)~TIM3_DMASource;
??TIM3_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5284
        LD        L:0x5284, A
//  503   }
//  504 }
        RET
//  505 /**
//  506   * @brief  Enables the TIM3 internal Clock.
//  507   * @par Parameters:
//  508   * None
//  509   * @retval None
//  510   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  511 void TIM3_InternalClockConfig(void)
//  512 {
//  513   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  514   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
TIM3_InternalClockConfig:
        LD        A, #0xf8
        AND       A, L:0x5282
        LD        L:0x5282, A
//  515 }
        RET
//  516 
//  517 /**
//  518   * @brief  Configures the TIM3 External clock Mode1.
//  519   * @param  TIM3_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  520   *   This parameter can be one of @ref TIM3_ExtTRGPSC_TypeDef enumeration.
//  521   * @param  TIM3_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  522   *   This parameter can be one of @ref TIM3_ExtTRGPolarity_TypeDef enumeration.
//  523   * @param ExtTRGFilter : Specifies the External Trigger Filter.
//  524   *   This parameter must be a value between 0x00 and 0x0F
//  525   * @retval None
//  526   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  527 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
//  528                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
//  529                               uint8_t ExtTRGFilter)
//  530 {
//  531   /* Configure the ETR Clock source */
//  532   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
TIM3_ETRClockMode1Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5283
        LD        L:0x5283, A
//  533 
//  534   /* Select the External clock mode1 */
//  535   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
        LD        A, #0xf8
        AND       A, L:0x5282
        LD        L:0x5282, A
//  536   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x5282
        LD        L:0x5282, A
//  537 
//  538   /* Select the Trigger selection : ETRF */
//  539   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
        LD        A, #0x8f
        AND       A, L:0x5282
        LD        L:0x5282, A
//  540   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
        LD        A, #0x70
        OR        A, L:0x5282
        LD        L:0x5282, A
//  541 }
        RET
//  542 
//  543 /**
//  544   * @brief  Configures the TIM3 External clock Mode2.
//  545   * @param  TIM3_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  546   *   This parameter can be one of the @ref TIM3_ExtTRGPSC_TypeDef enumeration.
//  547   * @param  TIM3_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  548   *   This parameter can be one of the @ref TIM3_ExtTRGPolarity_TypeDef enumeration.
//  549   * @param ExtTRGFilter : Specifies the External Trigger Filter.
//  550   *   This parameter must be a value between 0x00 and 0x0F
//  551   * @retval None
//  552   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  553 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
//  554                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
//  555                               uint8_t ExtTRGFilter)
//  556 {
//  557   /* Configure the ETR Clock source */
//  558   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
TIM3_ETRClockMode2Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5283
        LD        L:0x5283, A
//  559 
//  560   /* Enable the External clock mode2 */
//  561   TIM3->ETR |= TIM_ETR_ECE ;
        BSET      L:0x5283, #0x6
//  562 }
        RET
//  563 
//  564 /**
//  565   * @brief  Configures the TIM3 External Trigger.
//  566   * @param  TIM3_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  567   *   This parameter can be one of the @ref TIM3_ExtTRGPSC_TypeDef enumeration.
//  568   * @param  TIM3_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  569   *   This parameter can be one of the @ref TIM3_ExtTRGPolarity_TypeDef enumeration.
//  570   * @param ExtTRGFilter : Specifies the External Trigger Filter.
//  571   *   This parameter must be a value between 0x00 and 0x0F
//  572   * @retval None
//  573   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  574 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
//  575                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
//  576                     uint8_t ExtTRGFilter)
//  577 {
//  578   /* Check the parameters */
//  579   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
//  580   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
//  581   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
//  582 
//  583   /* Set the Prescaler, the Filter value and the Polarity */
//  584   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
//  585                          | (uint8_t)ExtTRGFilter);
TIM3_ETRConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5283
        LD        L:0x5283, A
//  586 }
        RET
//  587 
//  588 /**
//  589   * @brief  Configures the TIM3 Trigger as External Clock.
//  590   * @param  TIM3_TIxExternalCLKSource : Specifies Trigger source.
//  591   *   This parameter can be one of the @ref TIM3_TIxExternalCLK1Source_TypeDef enumeration.
//  592   * @param  TIM3_ICPolarity : Specifies the TIx Polarity.
//  593   *   This parameter can be @ref TIM3_ICPolarity_TypeDef enumeration.
//  594   * @param ICFilter : Specifies the filter value.
//  595   *   This parameter must be a value between 0x00 and 0x0F
//  596   * @retval None
//  597   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  598 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
//  599                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  600                                  uint8_t ICFilter)
//  601 {
TIM3_TIxExternalClockConfig:
        LD        S:?b4, A
        MOV       S:?b2, S:?b0
//  602   /* Check the parameters */
//  603   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
//  604   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
//  605   assert_param(IS_TIM3_IC_FILTER(ICFilter));
//  606 
//  607   /* Configure the TIM3 Input Clock Source */
//  608   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
        CP        A, #0x60
        JRNE      L:??TIM3_TIxExternalClockConfig_0
//  609   {
//  610     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI2_Config
        JRA       L:??TIM3_TIxExternalClockConfig_1
//  611   }
//  612   else
//  613   {
//  614     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
??TIM3_TIxExternalClockConfig_0:
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI1_Config
//  615   }
//  616 
//  617   /* Select the Trigger source */
//  618   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
??TIM3_TIxExternalClockConfig_1:
        LD        A, L:0x5282
        AND       A, #0x8f
        OR        A, S:?b4
        LD        L:0x5282, A
//  619 
//  620   /* Select the External clock mode1 */
//  621   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x5282
        LD        L:0x5282, A
//  622 }
        RET
//  623 
//  624 /**
//  625   * @brief  Selects the TIM3 Input Trigger source.
//  626   * @param  TIM3_InputTriggerSource : Specifies Input Trigger source.
//  627   *   This parameter can be one of the @ref TIM3_TRGSelection_TypeDef enumeration.
//  628   * @retval None
//  629   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  630 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
//  631 {
TIM3_SelectInputTrigger:
        LD        S:?b0, A
//  632   uint8_t tmpsmcr = 0;
//  633 
//  634   /* Check the parameters */
//  635   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
//  636 
//  637   tmpsmcr = TIM3->SMCR;
        LD        A, L:0x5282
//  638 
//  639   /* Select the Tgigger Source */
//  640   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
//  641   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
//  642 
//  643   TIM3->SMCR = (uint8_t)tmpsmcr;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5282, A
//  644 }
        RET
//  645 
//  646 /**
//  647   * @brief  Enables or Disables the TIM3 Update event.
//  648   * @param NewState : The new state of the TIM3 peripheral Preload register.
//  649   *   This parameter can be any of the @ref FunctionalState enumeration.
//  650   * @retval None
//  651   */
//  652 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  653 void TIM3_UpdateDisableConfig(FunctionalState NewState)
//  654 {
//  655   /* Check the parameters */
//  656   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  657 
//  658   /* Set or Reset the UDIS Bit */
//  659   if (NewState != DISABLE)
TIM3_UpdateDisableConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_UpdateDisableConfig_0
//  660   {
//  661     TIM3->CR1 |= TIM_CR1_UDIS;
        BSET      L:0x5280, #0x1
        RET
//  662   }
//  663   else
//  664   {
//  665     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
??TIM3_UpdateDisableConfig_0:
        BRES      L:0x5280, #0x1
//  666   }
//  667 }
        RET
//  668 
//  669 /**
//  670   * @brief  Selects the TIM3 Update Request Interrupt source.
//  671   * @param  TIM3_UpdateSource : Specifies the Update source.
//  672   *   This parameter can be one of the @ref TIM3_UpdateSource_TypeDef enumeration.
//  673   * @retval None
//  674   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  675 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
//  676 {
//  677   /* Check the parameters */
//  678   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
//  679 
//  680   /* Set or Reset the URS Bit */
//  681   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
TIM3_UpdateRequestConfig:
        CP        A, #0x1
        JRNE      L:??TIM3_UpdateRequestConfig_0
//  682   {
//  683     TIM3->CR1 |= TIM_CR1_URS ;
        BSET      L:0x5280, #0x2
        RET
//  684   }
//  685   else
//  686   {
//  687     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
??TIM3_UpdateRequestConfig_0:
        BRES      L:0x5280, #0x2
//  688   }
//  689 }
        RET
//  690 
//  691 /**
//  692   * @brief  Enables or Disables the TIM’s Hall sensor interface.
//  693   * @param NewState : The new state of the TIM3 Hall sensor interface.
//  694   *   This parameter can be any of the @ref FunctionalState enumeration.
//  695   * @retval None
//  696   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  697 void TIM3_SelectHallSensor(FunctionalState NewState)
//  698 {
//  699   /* Check the parameters */
//  700   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  701 
//  702   /* Set or Reset the TI1S Bit */
//  703   if (NewState != DISABLE)
TIM3_SelectHallSensor:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_SelectHallSensor_0
//  704   {
//  705     TIM3->CR2 |= TIM_CR2_TI1S;
        BSET      L:0x5281, #0x7
        RET
//  706   }
//  707   else
//  708   {
//  709     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
??TIM3_SelectHallSensor_0:
        BRES      L:0x5281, #0x7
//  710   }
//  711 }
        RET
//  712 
//  713 /**
//  714   * @brief  Selects the TIM’s One Pulse Mode.
//  715   * @param  TIM3_OPMode : Specifies the OPM Mode to be used.
//  716   *   This parameter can be one of the @ref TIM3_OPMode_TypeDef enumeration.
//  717   * @retval None
//  718   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  719 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
//  720 {
//  721   /* Check the parameters */
//  722   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
//  723 
//  724   /* Set or Reset the OPM Bit */
//  725   if (TIM3_OPMode == TIM3_OPMode_Single)
TIM3_SelectOnePulseMode:
        CP        A, #0x1
        JRNE      L:??TIM3_SelectOnePulseMode_0
//  726   {
//  727     TIM3->CR1 |= TIM_CR1_OPM ;
        BSET      L:0x5280, #0x3
        RET
//  728   }
//  729   else
//  730   {
//  731     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
??TIM3_SelectOnePulseMode_0:
        BRES      L:0x5280, #0x3
//  732   }
//  733 }
        RET
//  734 
//  735 /**
//  736   * @brief  Selects the TIM3 Trigger Output Mode.
//  737   * @param  TIM3_TRGOSource : Specifies the Trigger Output source.
//  738   *   This parameter can be one of the @ref TIM3_TRGOSource_TypeDef enumeration.
//  739   * @retval None
//  740   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  741 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
//  742 {
TIM3_SelectOutputTrigger:
        LD        S:?b0, A
//  743   uint8_t tmpcr2 = 0;
//  744 
//  745   /* Check the parameters */
//  746   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
//  747 
//  748   tmpcr2 = TIM3->CR2;
        LD        A, L:0x5281
//  749 
//  750   /* Reset the MMS Bits */
//  751   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
//  752 
//  753   /* Select the TRGO source */
//  754   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
//  755 
//  756   TIM3->CR2 = tmpcr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5281, A
//  757 }
        RET
//  758 
//  759 /**
//  760   * @brief  Selects the TIM3 Slave Mode.
//  761   * @param  TIM3_SlaveMode : Specifies the TIM3 Slave Mode.
//  762   *   This parameter can be one of the @ref TIM3_SlaveMode_TypeDef enumeration.
//  763   * @retval None
//  764   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  765 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
//  766 {
TIM3_SelectSlaveMode:
        LD        S:?b0, A
//  767   uint8_t tmpsmcr = 0;
//  768 
//  769   /* Check the parameters */
//  770   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
//  771 
//  772   tmpsmcr = TIM3->SMCR;
        LD        A, L:0x5282
//  773 
//  774   /* Reset the SMS Bits */
//  775   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
//  776 
//  777   /* Select the Slave Mode */
//  778   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
//  779 
//  780   TIM3->SMCR = tmpsmcr;
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x5282, A
//  781 }
        RET
//  782 
//  783 /**
//  784   * @brief  Sets or Resets the TIM3 Master/Slave Mode.
//  785   * @param NewState : The new state of the synchronization between TIM3 and its slaves (through TRGO).
//  786   *   This parameter can be any of the @ref FunctionalState enumeration.
//  787   * @retval None
//  788   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  789 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
//  790 {
//  791   /* Check the parameters */
//  792   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  793 
//  794   /* Set or Reset the MSM Bit */
//  795   if (NewState != DISABLE)
TIM3_SelectMasterSlaveMode:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_SelectMasterSlaveMode_0
//  796   {
//  797     TIM3->SMCR |= TIM_SMCR_MSM;
        BSET      L:0x5282, #0x7
        RET
//  798   }
//  799   else
//  800   {
//  801     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
??TIM3_SelectMasterSlaveMode_0:
        BRES      L:0x5282, #0x7
//  802   }
//  803 }
        RET
//  804 
//  805 /**
//  806   * @brief  Configures the TIM3 Encoder Interface.
//  807   * @param  TIM3_EncoderMode : Specifies the TIM3 Encoder Mode.
//  808   *   This parameter can be one of the @ref TIM3_EncoderMode_TypeDef enumeration.
//  809   * @param  TIM3_IC1Polarity : Specifies the IC1 Polarity.
//  810   *   This parameter can be one of the @ref TIM3_ICPolarity_TypeDef enumeration.
//  811   * @param  TIM3_IC2Polarity : Specifies the IC2 Polarity.
//  812   *   This parameter can be one of the @ref TIM3_ICPolarity_TypeDef enumeration.
//  813   * @retval None
//  814   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  815 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
//  816                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
//  817                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
//  818 {
TIM3_EncoderInterfaceConfig:
        LD        S:?b4, A
//  819   uint8_t tmpsmcr = 0;
//  820   uint8_t tmpccmr1 = 0;
//  821   uint8_t tmpccmr2 = 0;
//  822 
//  823   /* Check the parameters */
//  824   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
//  825   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
//  826   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
//  827 
//  828   tmpsmcr = TIM3->SMCR;
        LD        A, L:0x5282
        LD        S:?b2, A
//  829   tmpccmr1 = TIM3->CCMR1;
        LD        A, L:0x5289
        LD        S:?b3, A
//  830   tmpccmr2 = TIM3->CCMR2;
        LD        A, L:0x528a
        LD        S:?b5, A
//  831 
//  832   /* Set the encoder Mode */
//  833   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
//  834   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
        LD        A, S:?b2
        AND       A, #0xf0
        OR        A, S:?b4
        LD        S:?b4, A
//  835 
//  836   /* Select the Capture Compare 1 and the Capture Compare 2 as input */
//  837   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
//  838   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
//  839   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
        LD        A, S:?b3
        AND       A, #0xfc
        OR        A, #0x1
        LD        S:?b3, A
//  840   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
        LD        A, S:?b5
        AND       A, #0xfc
        OR        A, #0x1
        LD        S:?b2, A
//  841 
//  842   /* Set the TI1 and the TI2 Polarities */
//  843   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM3_EncoderInterfaceConfig_0
//  844   {
//  845     TIM3->CCER1 |= TIM_CCER1_CC1P ;
        BSET      L:0x528b, #0x1
        JRA       L:??TIM3_EncoderInterfaceConfig_1
//  846   }
//  847   else
//  848   {
//  849     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
??TIM3_EncoderInterfaceConfig_0:
        BRES      L:0x528b, #0x1
//  850   }
//  851 
//  852   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
??TIM3_EncoderInterfaceConfig_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM3_EncoderInterfaceConfig_2
//  853   {
//  854     TIM3->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x528b, #0x5
        JRA       L:??TIM3_EncoderInterfaceConfig_3
//  855   }
//  856   else
//  857   {
//  858     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TIM3_EncoderInterfaceConfig_2:
        BRES      L:0x528b, #0x5
//  859   }
//  860 
//  861   TIM3->SMCR = tmpsmcr;
??TIM3_EncoderInterfaceConfig_3:
        LD        A, S:?b4
        LD        L:0x5282, A
//  862   TIM3->CCMR1 = tmpccmr1;
        LD        A, S:?b3
        LD        L:0x5289, A
//  863   TIM3->CCMR2 = tmpccmr2;
        LD        A, S:?b2
        LD        L:0x528a, A
//  864 }
        RET
//  865 
//  866 /**
//  867   * @brief  Configures the TIM3 Prescaler.
//  868   * @param Prescaler : Specifies the Prescaler Register value
//  869   *   This parameter can be one of the @ref TIM3_Prescaler_TypeDef enumeration.
//  870   * @param  TIM3_PSCReloadMode : Specifies the TIM3 Prescaler Reload mode.
//  871   *   This parameter can be one of the @ref TIM3_PSCReloadMode_TypeDef enumeration.
//  872   * @retval None
//  873   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  874 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
//  875                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
//  876 {
//  877   /* Check the parameters */
//  878   assert_param(IS_TIM3_PRESCALER(Prescaler));
//  879   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
//  880 
//  881   /* Set the Prescaler value */
//  882   TIM3->PSCR = (uint8_t)(Prescaler);
TIM3_PrescalerConfig:
        LD        L:0x528e, A
//  883 
//  884   /* Set or reset the UG Bit */
//  885   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM3_PrescalerConfig_0
//  886   {
//  887     TIM3->EGR |= TIM_EGR_UG ;
        BSET      L:0x5288, #0x0
        RET
//  888   }
//  889   else
//  890   {
//  891     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
??TIM3_PrescalerConfig_0:
        BRES      L:0x5288, #0x0
//  892   }
//  893 }
        RET
//  894 
//  895 /**
//  896   * @brief  Specifies the TIM3 Counter Mode to be used.
//  897   * @param  TIM3_CounterMode : Specifies the Counter Mode to be used
//  898   *   This parameter can be one of the @ref TIM3_CounterMode_TypeDef enumeration.
//  899   * @retval None
//  900   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  901 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
//  902 {
TIM3_CounterModeConfig:
        LD        S:?b0, A
//  903   uint8_t tmpcr1 = 0;
//  904 
//  905   /* Check the parameters */
//  906   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
//  907 
//  908   tmpcr1 = TIM3->CR1;
        LD        A, L:0x5280
//  909 
//  910   /* Reset the CMS and DIR Bits */
//  911   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
//  912 
//  913   /* Set the Counter Mode */
//  914   tmpcr1 |= (uint8_t)TIM3_CounterMode;
//  915 
//  916   TIM3->CR1 = tmpcr1;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5280, A
//  917 }
        RET
//  918 
//  919 /**
//  920   * @brief  Forces the TIM3 Channel1 output waveform to active or inactive level.
//  921   * @param  TIM3_ForcedAction : Specifies the forced Action to be set to the output waveform.
//  922   *   This parameter can be one of the @ref TIM3_ForcedAction_TypeDef enumeration.
//  923   * @retval None
//  924   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  925 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
//  926 {
TIM3_ForcedOC1Config:
        LD        S:?b0, A
//  927   uint8_t tmpccmr1 = 0;
//  928 
//  929   /* Check the parameters */
//  930   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
//  931 
//  932   tmpccmr1 = TIM3->CCMR1;
        LD        A, L:0x5289
//  933 
//  934   /* Reset the OCM Bits */
//  935   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
//  936 
//  937   /* Configure The Forced output Mode */
//  938   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
//  939 
//  940   TIM3->CCMR1 = tmpccmr1;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5289, A
//  941 }
        RET
//  942 
//  943 /**
//  944   * @brief  Forces the TIM3 Channel2 output waveform to active or inactive level.
//  945   * @param  TIM3_ForcedAction : Specifies the forced Action to be set to the output waveform.
//  946   *   This parameter can be one of the @ref TIM3_ForcedAction_TypeDef enumeration.
//  947   * @retval None
//  948   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  949 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
//  950 {
TIM3_ForcedOC2Config:
        LD        S:?b0, A
//  951   uint8_t tmpccmr2 = 0;
//  952 
//  953   /* Check the parameters */
//  954   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
//  955 
//  956   tmpccmr2 = TIM3->CCMR2;
        LD        A, L:0x528a
//  957 
//  958   /* Reset the OCM Bits */
//  959   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
//  960 
//  961   /* Configure The Forced output Mode */
//  962   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
//  963 
//  964   TIM3->CCMR2 = tmpccmr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x528a, A
//  965 }
        RET
//  966 
//  967 /**
//  968   * @brief  Enables or disables TIM3 peripheral Preload register on ARR.
//  969   * @param NewState : The new state of the TIM3 peripheral Preload register.
//  970   *   This parameter can be any of the @ref FunctionalState enumeration.
//  971   * @retval None
//  972   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  973 void TIM3_ARRPreloadConfig(FunctionalState NewState)
//  974 {
//  975   /* Check the parameters */
//  976   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  977 
//  978   /* Set or Reset the ARPE Bit */
//  979   if (NewState != DISABLE)
TIM3_ARRPreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_ARRPreloadConfig_0
//  980   {
//  981     TIM3->CR1 |= TIM_CR1_ARPE;
        BSET      L:0x5280, #0x7
        RET
//  982   }
//  983   else
//  984   {
//  985     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
??TIM3_ARRPreloadConfig_0:
        BRES      L:0x5280, #0x7
//  986   }
//  987 }
        RET
//  988 
//  989 /**
//  990   * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR1.
//  991   * @param NewState : new state of the Capture Compare Preload register.
//  992   *   This parameter can be any of the @ref FunctionalState enumeration.
//  993   * @retval None
//  994   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  995 void TIM3_OC1PreloadConfig(FunctionalState NewState)
//  996 {
//  997   /* Check the parameters */
//  998   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  999 
// 1000   /* Set or Reset the OC1PE Bit */
// 1001   if (NewState != DISABLE)
TIM3_OC1PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_OC1PreloadConfig_0
// 1002   {
// 1003     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
        BSET      L:0x5289, #0x3
        RET
// 1004   }
// 1005   else
// 1006   {
// 1007     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
??TIM3_OC1PreloadConfig_0:
        BRES      L:0x5289, #0x3
// 1008   }
// 1009 }
        RET
// 1010 
// 1011 /**
// 1012   * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR2.
// 1013   * @param NewState : The new state of the Capture Compare Preload register.
// 1014   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1015   * @retval None
// 1016   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1017 void TIM3_OC2PreloadConfig(FunctionalState NewState)
// 1018 {
// 1019   /* Check the parameters */
// 1020   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1021 
// 1022   /* Set or Reset the OC2PE Bit */
// 1023   if (NewState != DISABLE)
TIM3_OC2PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_OC2PreloadConfig_0
// 1024   {
// 1025     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
        BSET      L:0x528a, #0x3
        RET
// 1026   }
// 1027   else
// 1028   {
// 1029     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
??TIM3_OC2PreloadConfig_0:
        BRES      L:0x528a, #0x3
// 1030   }
// 1031 }
        RET
// 1032 
// 1033 /**
// 1034   * @brief  Configures the TIM3 Capture Compare 1 Fast feature.
// 1035   * @param NewState : The new state of the Output Compare Fast Enable bit.
// 1036   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1037   * @retval None
// 1038   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1039 void TIM3_OC1FastCmd(FunctionalState NewState)
// 1040 {
// 1041   /* Check the parameters */
// 1042   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1043 
// 1044   /* Set or Reset the OC1FE Bit */
// 1045   if (NewState != DISABLE)
TIM3_OC1FastCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_OC1FastCmd_0
// 1046   {
// 1047     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
        BSET      L:0x5289, #0x2
        RET
// 1048   }
// 1049   else
// 1050   {
// 1051     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
??TIM3_OC1FastCmd_0:
        BRES      L:0x5289, #0x2
// 1052   }
// 1053 }
        RET
// 1054 
// 1055 /**
// 1056   * @brief  Configures the TIM3 Capture Compare 2 Fast feature.
// 1057   * @param NewState : The new state of the Output Compare Fast Enable bit.
// 1058   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1059   * @retval None
// 1060   */
// 1061 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1062 void TIM3_OC2FastCmd(FunctionalState NewState)
// 1063 {
// 1064   /* Check the parameters */
// 1065   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1066 
// 1067   /* Set or Reset the OC2FE Bit */
// 1068   if (NewState != DISABLE)
TIM3_OC2FastCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_OC2FastCmd_0
// 1069   {
// 1070     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
        BSET      L:0x528a, #0x2
        RET
// 1071   }
// 1072   else
// 1073   {
// 1074     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
??TIM3_OC2FastCmd_0:
        BRES      L:0x528a, #0x2
// 1075   }
// 1076 }
        RET
// 1077 
// 1078 /**
// 1079   * @brief  Configures the TIM3 event to be generated by software.
// 1080   * @param  TIM3_EventSource : Specifies the event source.
// 1081   *   This parameter can be one of the @ref TIM3_EventSource_TypeDef enumeration.
// 1082   * @retval None
// 1083   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1084 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
// 1085 {
// 1086   /* Check the parameters */
// 1087   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
// 1088 
// 1089   /* Set the event sources */
// 1090   TIM3->EGR |= (uint8_t)TIM3_EventSource;
TIM3_GenerateEvent:
        OR        A, L:0x5288
        LD        L:0x5288, A
// 1091 }
        RET
// 1092 
// 1093 /**
// 1094   * @brief  Configures the TIM3 Channel 1 polarity.
// 1095   * @param  TIM3_OCPolarity : Specifies the OC1 Polarity.
// 1096   *   This parameter can be one of the @ref TIM3_OCPolarity_TypeDef enumeration.
// 1097   * @retval None
// 1098   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1099 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
// 1100 {
// 1101   /* Check the parameters */
// 1102   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
// 1103 
// 1104   /* Set or Reset the CC1P Bit */
// 1105   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
TIM3_OC1PolarityConfig:
        CP        A, #0x1
        JRNE      L:??TIM3_OC1PolarityConfig_0
// 1106   {
// 1107     TIM3->CCER1 |= TIM_CCER1_CC1P ;
        BSET      L:0x528b, #0x1
        RET
// 1108   }
// 1109   else
// 1110   {
// 1111     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
??TIM3_OC1PolarityConfig_0:
        BRES      L:0x528b, #0x1
// 1112   }
// 1113 }
        RET
// 1114 
// 1115 /**
// 1116   * @brief  Configures the TIM3 Channel 2 polarity.
// 1117   * @param  TIM3_OCPolarity : Specifies the OC2 Polarity.
// 1118   *   This parameter can be one of the @ref TIM3_OCPolarity_TypeDef enumeration.
// 1119   * @retval None
// 1120   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1121 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
// 1122 {
// 1123   /* Check the parameters */
// 1124   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
// 1125 
// 1126   /* Set or Reset the CC2P Bit */
// 1127   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
TIM3_OC2PolarityConfig:
        CP        A, #0x1
        JRNE      L:??TIM3_OC2PolarityConfig_0
// 1128   {
// 1129     TIM3->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x528b, #0x5
        RET
// 1130   }
// 1131   else
// 1132   {
// 1133     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TIM3_OC2PolarityConfig_0:
        BRES      L:0x528b, #0x5
// 1134   }
// 1135 }
        RET
// 1136 
// 1137 /**
// 1138   * @brief  Enables or disables the TIM3 Capture Compare Channel x.
// 1139   * @param  TIM3_Channel : Specifies the TIM3 Channel.
// 1140   *   This parameter can be one of @ref TIM3_Channel_TypeDef enumeration.
// 1141   * @param NewState : specifies the TIM3 Channel CCxE bit new state.
// 1142   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1143   * @retval None
// 1144   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1145 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
// 1146 {
// 1147   /* Check the parameters */
// 1148   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
// 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1150 
// 1151   if (TIM3_Channel == TIM3_Channel_1)
TIM3_CCxCmd:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JRNE      L:??TIM3_CCxCmd_0
// 1152   {
// 1153     /* Set or Reset the CC1E Bit */
// 1154     if (NewState != DISABLE)
        CP        A, S:?b0
        JREQ      L:??TIM3_CCxCmd_1
// 1155     {
// 1156       TIM3->CCER1 |= TIM_CCER1_CC1E ;
        BSET      L:0x528b, #0x0
        RET
// 1157     }
// 1158     else
// 1159     {
// 1160       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
??TIM3_CCxCmd_1:
        BRES      L:0x528b, #0x0
        RET
// 1161     }
// 1162 
// 1163   }
// 1164   else /* if (TIM3_Channel == TIM3_Channel_2) */
// 1165   {
// 1166     /* Set or Reset the CC2E Bit */
// 1167     if (NewState != DISABLE)
??TIM3_CCxCmd_0:
        CP        A, S:?b0
        JREQ      L:??TIM3_CCxCmd_2
// 1168     {
// 1169       TIM3->CCER1 |= TIM_CCER1_CC2E;
        BSET      L:0x528b, #0x4
        RET
// 1170     }
// 1171     else
// 1172     {
// 1173       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
??TIM3_CCxCmd_2:
        BRES      L:0x528b, #0x4
// 1174     }
// 1175   }
// 1176 }
        RET
// 1177 
// 1178 /**
// 1179   * @brief  Selects the TIM3 Ouput Compare Mode. This function disables the
// 1180   * selected channel before changing the Ouput Compare Mode. User has to
// 1181   * enable this channel using TIM3_CCxCmd and TIM3_CCxNCmd functions.
// 1182   * @param  TIM3_Channel : Specifies the TIM3 Channel.
// 1183   *   This parameter can be one of the @ref TIM3_Channel_TypeDef enumeration
// 1184   * @param  TIM3_OCMode : Specifies the TIM3 Output Compare Mode.
// 1185   * This paramter can be one of the @ref TIM3_OCMode_TypeDef enumeration.
// 1186   * @retval None
// 1187   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1188 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
// 1189                      TIM3_OCMode_TypeDef TIM3_OCMode)
// 1190 {
// 1191   /* Check the parameters */
// 1192   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
// 1193   assert_param(IS_TIM3_OCM(TIM3_OCMode));
// 1194 
// 1195   if (TIM3_Channel == TIM3_Channel_1)
TIM3_SelectOCxM:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JRNE      L:??TIM3_SelectOCxM_0
// 1196   {
// 1197     /* Disable the Channel 1: Reset the CCE Bit */
// 1198     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x528b, #0x0
// 1199 
// 1200     /* Reset the Output Compare Bits */
// 1201     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
        LD        A, #0x8f
        AND       A, L:0x5289
        LD        L:0x5289, A
// 1202 
// 1203     /* Set the Ouput Compare Mode */
// 1204     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
        LD        A, S:?b0
        OR        A, L:0x5289
        LD        L:0x5289, A
        RET
// 1205   }
// 1206   else /* if (TIM3_Channel == TIM3_Channel_2) */
// 1207   {
// 1208     /* Disable the Channel 2: Reset the CCE Bit */
// 1209     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
??TIM3_SelectOCxM_0:
        BRES      L:0x528b, #0x4
// 1210 
// 1211     /* Reset the Output Compare Bits */
// 1212     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
        LD        A, #0x8f
        AND       A, L:0x528a
        LD        L:0x528a, A
// 1213 
// 1214     /* Set the Ouput Compare Mode */
// 1215     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
        LD        A, S:?b0
        OR        A, L:0x528a
        LD        L:0x528a, A
// 1216   }
// 1217 }
        RET
// 1218 
// 1219 /**
// 1220   * @brief  Sets the TIM3 Counter Register value.
// 1221   * @param  Counter : Specifies the Counter register new value.
// 1222   *   This parameter is between 0x0000 and 0xFFFF.
// 1223   * @retval None
// 1224   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1225 void TIM3_SetCounter(uint16_t Counter)
// 1226 {
TIM3_SetCounter:
        LDW       Y, X
// 1227   /* Set the Counter Register value */
// 1228   TIM3->CNTRH = (uint8_t)(Counter >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x528c, A
// 1229   TIM3->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x528d, A
// 1230 }
        RET
// 1231 
// 1232 /**
// 1233   * @brief  Sets the TIM3 Autoreload Register value.
// 1234   * @param  Autoreload : Specifies the Autoreload register new value.
// 1235   *   This parameter is between 0x0000 and 0xFFFF.
// 1236   * @retval None
// 1237   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1238 void TIM3_SetAutoreload(uint16_t Autoreload)
// 1239 {
TIM3_SetAutoreload:
        LDW       Y, X
// 1240   /* Set the Autoreload Register value */
// 1241   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x528f, A
// 1242   TIM3->ARRL = (uint8_t)(Autoreload);
        LD        A, YL
        LD        L:0x5290, A
// 1243 }
        RET
// 1244 
// 1245 /**
// 1246   * @brief  Sets the TIM3 Capture Compare1 Register value.
// 1247   * @param  Compare : Specifies the Capture Compare1 register new value.
// 1248   *   This parameter is between 0x0000 and 0xFFFF.
// 1249   * @retval None
// 1250   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1251 void TIM3_SetCompare1(uint16_t Compare)
// 1252 {
TIM3_SetCompare1:
        LDW       Y, X
// 1253   /* Set the Capture Compare1 Register value */
// 1254   TIM3->CCR1H = (uint8_t)(Compare >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5291, A
// 1255   TIM3->CCR1L = (uint8_t)(Compare);
        LD        A, YL
        LD        L:0x5292, A
// 1256 }
        RET
// 1257 
// 1258 /**
// 1259   * @brief  Sets the TIM3 Capture Compare2 Register value.
// 1260   * @param  Compare : Specifies the Capture Compare2 register new value.
// 1261   *   This parameter is between 0x0000 and 0xFFFF.
// 1262   * @retval None
// 1263   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1264 void TIM3_SetCompare2(uint16_t Compare)
// 1265 {
TIM3_SetCompare2:
        LDW       Y, X
// 1266   /* Set the Capture Compare2 Register value */
// 1267   TIM3->CCR2H = (uint8_t)(Compare >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5293, A
// 1268   TIM3->CCR2L = (uint8_t)(Compare);
        LD        A, YL
        LD        L:0x5294, A
// 1269 }
        RET
// 1270 
// 1271 /**
// 1272   * @brief  Sets the TIM3 Input Capture 1 prescaler.
// 1273   * @param  TIM3_IC1Prescaler : Specifies the Input Capture prescaler new value
// 1274   *   This parameter can be one of the @ref TIM3_ICPSC_TypeDef enumeration.
// 1275   * @retval None
// 1276   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1277 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
// 1278 {
TIM3_SetIC1Prescaler:
        LD        S:?b0, A
// 1279   uint8_t tmpccmr1 = 0;
// 1280 
// 1281   /* Check the parameters */
// 1282   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
// 1283 
// 1284   tmpccmr1 = TIM3->CCMR1;
        LD        A, L:0x5289
// 1285 
// 1286   /* Reset the IC1PSC Bits */
// 1287   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
// 1288 
// 1289   /* Set the IC1PSC value */
// 1290   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
// 1291 
// 1292   TIM3->CCMR1 = tmpccmr1;
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5289, A
// 1293 }
        RET
// 1294 
// 1295 /**
// 1296   * @brief  Sets the TIM3 Input Capture 2 prescaler.
// 1297   * @param  TIM3_IC2Prescaler : Specifies the Input Capture prescaler new value
// 1298   *   This parameter can be one of the @ref TIM3_ICPSC_TypeDef enumeration.
// 1299   * @retval None
// 1300   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1301 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
// 1302 {
TIM3_SetIC2Prescaler:
        LD        S:?b0, A
// 1303   uint8_t tmpccmr2 = 0;
// 1304 
// 1305   /* Check the parameters */
// 1306   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
// 1307 
// 1308   tmpccmr2 = TIM3->CCMR2;
        LD        A, L:0x528a
// 1309 
// 1310   /* Reset the IC2PSC Bits */
// 1311   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
// 1312 
// 1313   /* Set the IC2PSC value */
// 1314   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
// 1315 
// 1316   TIM3->CCMR2 = tmpccmr2;
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x528a, A
// 1317 }
        RET
// 1318 
// 1319 /**
// 1320   * @brief  Gets the TIM3 Input Capture 1 value.
// 1321   * @param  None
// 1322   * @retval Capture Compare 1 Register value.
// 1323   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1324 uint16_t TIM3_GetCapture1(void)
// 1325 {
// 1326   uint16_t tmpccr1 = 0;
// 1327   uint8_t tmpccr1l, tmpccr1h;
// 1328 
// 1329   tmpccr1h = TIM3->CCR1H;
TIM3_GetCapture1:
        LD        A, L:0x5291
        LD        S:?b1, A
// 1330   tmpccr1l = TIM3->CCR1L;
        LD        A, L:0x5292
        LD        S:?b0, A
// 1331 
// 1332   tmpccr1 = (uint16_t)(tmpccr1l);
// 1333   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
// 1334   /* Get the Capture 1 Register value */
// 1335   return ((uint16_t)tmpccr1);
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
// 1336 }
// 1337 
// 1338 /**
// 1339   * @brief  Gets the TIM3 Input Capture 2 value.
// 1340   * @param  None
// 1341   * @retval Capture Compare 2 Register value.
// 1342   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1343 uint16_t TIM3_GetCapture2(void)
// 1344 {
// 1345   uint16_t tmpccr2 = 0;
// 1346   uint8_t tmpccr2l, tmpccr2h;
// 1347 
// 1348   tmpccr2h = TIM3->CCR2H;
TIM3_GetCapture2:
        LD        A, L:0x5293
        LD        S:?b1, A
// 1349   tmpccr2l = TIM3->CCR2L;
        LD        A, L:0x5294
        LD        S:?b0, A
// 1350 
// 1351   tmpccr2 = (uint16_t)(tmpccr2l);
// 1352   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
// 1353   /* Get the Capture 2 Register value */
// 1354   return ((uint16_t)tmpccr2);
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
// 1355 }
// 1356 
// 1357 /**
// 1358   * @brief  Gets the TIM3 Counter value.
// 1359   * @param  None
// 1360   * @retval Counter Register value.
// 1361   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1362 uint16_t TIM3_GetCounter(void)
// 1363 {
// 1364   uint16_t tmpcnt = 0;
// 1365   uint8_t tmpcntrl, tmpcntrh;
// 1366 
// 1367   tmpcntrh = TIM3->CNTRH;
TIM3_GetCounter:
        LD        A, L:0x528c
        LD        S:?b1, A
// 1368   tmpcntrl = TIM3->CNTRL;
        LD        A, L:0x528d
        LD        S:?b0, A
// 1369 
// 1370   tmpcnt = (uint16_t)(tmpcntrl);
// 1371   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
// 1372   /* Get the Counter Register value */
// 1373   return ((uint16_t)tmpcnt);
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
// 1374 }
// 1375 
// 1376 /**
// 1377   * @brief  Gets the TIM3 Prescaler value.
// 1378   * @param  None
// 1379   * @retval TIM3_Prescaler_TypeDef : Prescaler Register value.
// 1380   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1381 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
// 1382 {
// 1383   /* Get the Prescaler Register value */
// 1384   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
TIM3_GetPrescaler:
        LD        A, L:0x528e
        RET
// 1385 }
// 1386 
// 1387 /**
// 1388   * @brief  Selects the TIM3 peripheral Capture Compare DMA source.
// 1389   * @param  NewState: new state of the Capture Compare DMA source.
// 1390   *   This parameter can be: ENABLE or DISABLE.
// 1391   * @retval None
// 1392   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1393 void TIM3_SelectCCDMA(FunctionalState NewState)
// 1394 {
// 1395   /* Check the parameters */
// 1396   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1397 
// 1398   if (NewState != DISABLE)
TIM3_SelectCCDMA:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM3_SelectCCDMA_0
// 1399   {
// 1400     /* Set the CCDS Bit */
// 1401     TIM3->CR2 |= TIM_CR2_CCDS;
        BSET      L:0x5281, #0x3
        RET
// 1402   }
// 1403   else
// 1404   {
// 1405     /* Reset the CCDS Bit */
// 1406     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
??TIM3_SelectCCDMA_0:
        BRES      L:0x5281, #0x3
// 1407   }
// 1408 }
        RET
// 1409 
// 1410 /**
// 1411   * @brief  Checks whether the specified TIM3 flag is set or not.
// 1412   * @param  TIM3_FLAG : Specifies the flag to check.
// 1413   *   This parameter can be one of the @ref TIM3_FLAG_TypeDef enumeration.
// 1414   * @retval FlagStatus : The new state of TIM3_FLAG.
// 1415   *   This parameter can be any of the @ref FlagStatus enumeration.
// 1416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1417 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
// 1418 {
TIM3_GetFlagStatus:
        LDW       Y, X
// 1419   FlagStatus bitstatus = RESET;
// 1420   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
// 1421 
// 1422   /* Check the parameters */
// 1423   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
// 1424 
// 1425   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
        LD        A, L:0x5286
        LD        S:?b1, A
// 1426   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
        LD        A, L:0x5287
        LD        S:?b0, A
// 1427 
// 1428   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
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
        JREQ      L:??TIM3_GetFlagStatus_0
// 1429   {
// 1430     bitstatus = SET;
        LD        A, #0x1
        RET
// 1431   }
// 1432   else
// 1433   {
// 1434     bitstatus = RESET;
??TIM3_GetFlagStatus_0:
        CLR       A
// 1435   }
// 1436   return ((FlagStatus)bitstatus);
        RET
// 1437 }
// 1438 
// 1439 /**
// 1440   * @brief  Clears the TIM’s pending flags.
// 1441   * @param  TIM3_FLAG : Specifies the flag to clear.
// 1442   *   This parameter can be one of the @ref TIM3_FLAG_TypeDef enumeration.
// 1443   * @retval None
// 1444   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1445 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
// 1446 {
// 1447   /* Check the parameters */
// 1448   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
// 1449   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 1450   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
TIM3_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5286, A
// 1451   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
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
        LD        L:0x5287, A
// 1452 }
        RET
// 1453 
// 1454 /**
// 1455   * @brief  Checks whether the TIM3 interrupt has occurred or not.
// 1456   * @param  TIM3_IT : Specifies the TIM3 interrupt source to check.
// 1457   *   This parameter can be one of the @ref TIM3_IT_TypeDef enumeration.
// 1458   * @retval ITStatus : The new state of the TIM3_IT.
// 1459   *   This parameter can be any of the @ref ITStatus enumeration.
// 1460   */
// 1461 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1462 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
// 1463 {
TIM3_GetITStatus:
        LD        S:?b0, A
// 1464   ITStatus bitstatus = RESET;
// 1465 
// 1466   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
// 1467 
// 1468   /* Check the parameters */
// 1469   assert_param(IS_TIM3_GET_IT(TIM3_IT));
// 1470 
// 1471   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
        LD        A, L:0x5286
        LD        S:?b1, A
// 1472 
// 1473   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
        LD        A, S:?b0
        AND       A, L:0x5285
        LD        S:?b2, A
// 1474 
// 1475   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
        LD        A, S:?b0
        AND       A, S:?b1
        JREQ      L:??TIM3_GetITStatus_0
        CLR       A
        CP        A, S:?b2
        JREQ      L:??TIM3_GetITStatus_0
// 1476   {
// 1477     bitstatus = (ITStatus)SET;
        LD        A, #0x1
        RET
// 1478   }
// 1479   else
// 1480   {
// 1481     bitstatus = (ITStatus)RESET;
??TIM3_GetITStatus_0:
        CLR       A
// 1482   }
// 1483   return ((ITStatus)bitstatus);
        RET
// 1484 }
// 1485 
// 1486 /**
// 1487   * @brief  Clears the TIM's interrupt pending bits.
// 1488   * @param  TIM3_IT : Specifies the pending bit to clear.
// 1489   *   This parameter can be one of the @ref TIM3_IT_TypeDef enumeration.
// 1490   * @retval None
// 1491   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1492 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
// 1493 {
// 1494   /* Check the parameters */
// 1495   assert_param(IS_TIM3_IT(TIM3_IT));
// 1496 
// 1497   /* Clear the IT pending Bit */
// 1498   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
TIM3_ClearITPendingBit:
        CPL       A
        LD        L:0x5286, A
// 1499 }
        RET
// 1500 
// 1501 /**
// 1502   * @brief  Configure the TI1 as Input.
// 1503   * @param  TIM3_ICPolarity : The Input Polarity.
// 1504   *   This parameter can be one of the @ref TIM3_ICPolarity_TypeDef enumeration.
// 1505   * @param  TIM3_ICSelection : Specifies the input to be used.
// 1506   *   This parameter can be one of the @ref TIM3_ICSelection_TypeDef enumeration.
// 1507   * @param  TIM3_ICFilter : Specifies the Input Capture Filter.
// 1508   *   This parameter must be a value between 0x00 and 0x0F.
// 1509   * @retval None
// 1510   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1511 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
// 1512                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
// 1513                        uint8_t TIM3_ICFilter)
// 1514 {
TI1_Config:
        LD        S:?b2, A
// 1515   uint8_t tmpccmr1 = 0;
// 1516   uint8_t tmpicpolarity = TIM3_ICPolarity;
// 1517   tmpccmr1 = TIM3->CCMR1;
        LD        A, L:0x5289
// 1518 
// 1519   /* Check the parameters */
// 1520   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
// 1521   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
// 1522   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
// 1523 
// 1524   /* Disable the Channel 1: Reset the CCE Bit */
// 1525   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x528b, #0x0
// 1526 
// 1527   /* Select the Input and set the filter */
// 1528   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
// 1529   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
// 1530 
// 1531   TIM3->CCMR1 = tmpccmr1;
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b3, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b3
        OR        A, S:?b0
        LD        L:0x5289, A
// 1532 
// 1533   /* Select the Polarity */
// 1534   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TI1_Config_0
// 1535   {
// 1536     TIM3->CCER1 |= TIM_CCER1_CC1P;
        BSET      L:0x528b, #0x1
        JRA       L:??TI1_Config_1
// 1537   }
// 1538   else
// 1539   {
// 1540     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x528b, #0x1
// 1541   }
// 1542 
// 1543   /* Set the CCE Bit */
// 1544   TIM3->CCER1 |=  TIM_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x528b, #0x0
// 1545 }
        RET
// 1546 
// 1547 /**
// 1548   * @brief  Configure the TI2 as Input.
// 1549   * @param  TIM3_ICPolarity : The Input Polarity.
// 1550   *   This parameter can be one of the @ref TIM3_ICPolarity_TypeDef enumeration.
// 1551   * @param  TIM3_ICSelection : Specifies the input to be used.
// 1552   *   This parameter can be one of the @ref TIM3_ICSelection_TypeDef enumeration.
// 1553   * @param  TIM3_ICFilter : Specifies the Input Capture Filter.
// 1554   *   This parameter must be a value between 0x00 and 0x0F.
// 1555   * @retval None
// 1556   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1557 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
// 1558                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
// 1559                        uint8_t TIM3_ICFilter)
// 1560 {
TI2_Config:
        LD        S:?b2, A
// 1561   uint8_t tmpccmr2 = 0;
// 1562   uint8_t tmpicpolarity = TIM3_ICPolarity;
// 1563 
// 1564   /* Check the parameters */
// 1565   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
// 1566   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
// 1567   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
// 1568 
// 1569   tmpccmr2 = TIM3->CCMR2;
        LD        A, L:0x528a
// 1570 
// 1571   /* Disable the Channel 2: Reset the CCE Bit */
// 1572   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
        BRES      L:0x528b, #0x4
// 1573 
// 1574   /* Select the Input and set the filter */
// 1575   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
// 1576   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
// 1577 
// 1578   TIM3->CCMR2 = tmpccmr2;
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b3, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b3
        OR        A, S:?b0
        LD        L:0x528a, A
// 1579 
// 1580   /* Select the Polarity */
// 1581   if (tmpicpolarity == TIM3_ICPolarity_Falling)
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TI2_Config_0
// 1582   {
// 1583     TIM3->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x528b, #0x5
        JRA       L:??TI2_Config_1
// 1584   }
// 1585   else
// 1586   {
// 1587     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TI2_Config_0:
        BRES      L:0x528b, #0x5
// 1588   }
// 1589 
// 1590   /* Set the CCE Bit */
// 1591   TIM3->CCER1 |=  TIM_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x528b, #0x4
// 1592 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1593 
// 1594 
// 1595 /**
// 1596   * @}
// 1597   */
// 1598 
// 1599 /**
// 1600   * @}
// 1601   */
// 1602 
// 1603 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 1 677 bytes in section .near_func.text
// 
// 1 677 bytes of CODE memory
//
//Errors: none
//Warnings: none
