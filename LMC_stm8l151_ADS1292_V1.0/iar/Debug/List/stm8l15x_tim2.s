///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:46 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim2.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim2.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_tim2.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_tim2

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

        PUBLIC TIM2_ARRPreloadConfig
        PUBLIC TIM2_BKRConfig
        PUBLIC TIM2_CCxCmd
        PUBLIC TIM2_ClearFlag
        PUBLIC TIM2_ClearITPendingBit
        PUBLIC TIM2_Cmd
        PUBLIC TIM2_CounterModeConfig
        PUBLIC TIM2_CtrlPWMOutputs
        PUBLIC TIM2_DMACmd
        PUBLIC TIM2_DeInit
        PUBLIC TIM2_ETRClockMode1Config
        PUBLIC TIM2_ETRClockMode2Config
        PUBLIC TIM2_ETRConfig
        PUBLIC TIM2_EncoderInterfaceConfig
        PUBLIC TIM2_ForcedOC1Config
        PUBLIC TIM2_ForcedOC2Config
        PUBLIC TIM2_GenerateEvent
        PUBLIC TIM2_GetCapture1
        PUBLIC TIM2_GetCapture2
        PUBLIC TIM2_GetCounter
        PUBLIC TIM2_GetFlagStatus
        PUBLIC TIM2_GetITStatus
        PUBLIC TIM2_GetPrescaler
        PUBLIC TIM2_ICInit
        PUBLIC TIM2_ITConfig
        PUBLIC TIM2_InternalClockConfig
        PUBLIC TIM2_OC1FastCmd
        PUBLIC TIM2_OC1Init
        PUBLIC TIM2_OC1PolarityConfig
        PUBLIC TIM2_OC1PreloadConfig
        PUBLIC TIM2_OC2FastCmd
        PUBLIC TIM2_OC2Init
        PUBLIC TIM2_OC2PolarityConfig
        PUBLIC TIM2_OC2PreloadConfig
        PUBLIC TIM2_PWMIConfig
        PUBLIC TIM2_PrescalerConfig
        PUBLIC TIM2_SelectCCDMA
        PUBLIC TIM2_SelectHallSensor
        PUBLIC TIM2_SelectInputTrigger
        PUBLIC TIM2_SelectMasterSlaveMode
        PUBLIC TIM2_SelectOCxM
        PUBLIC TIM2_SelectOnePulseMode
        PUBLIC TIM2_SelectOutputTrigger
        PUBLIC TIM2_SelectSlaveMode
        PUBLIC TIM2_SetAutoreload
        PUBLIC TIM2_SetCompare1
        PUBLIC TIM2_SetCompare2
        PUBLIC TIM2_SetCounter
        PUBLIC TIM2_SetIC1Prescaler
        PUBLIC TIM2_SetIC2Prescaler
        PUBLIC TIM2_TIxExternalClockConfig
        PUBLIC TIM2_TimeBaseInit
        PUBLIC TIM2_UpdateDisableConfig
        PUBLIC TIM2_UpdateRequestConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim2.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_tim2.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the TIM2 firmware functions.
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
//   22 #include "stm8l15x_tim2.h"
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
//   33 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//   34                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
//   35                        uint8_t TIM2_ICFilter);
//   36 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//   37                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
//   38                        uint8_t TIM2_ICFilter);
//   39 
//   40 
//   41 /**
//   42   * @addtogroup TIM2_Public_Functions
//   43   * @{
//   44   */
//   45 
//   46 /**
//   47   * @brief  Deinitializes the TIM2 peripheral registers to their default reset values.
//   48   * @param  None
//   49   * @retval None
//   50   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51 void TIM2_DeInit(void)
//   52 {
//   53   TIM2->CR1 = TIM_CR1_RESET_VALUE;
TIM2_DeInit:
        CLR       A
        LD        L:0x5250, A
//   54   TIM2->CR2 = TIM_CR2_RESET_VALUE;
        LD        L:0x5251, A
//   55   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
        LD        L:0x5252, A
//   56   TIM2->ETR = TIM_ETR_RESET_VALUE;
        LD        L:0x5253, A
//   57   TIM2->IER = TIM_IER_RESET_VALUE;
        LD        L:0x5255, A
//   58   TIM2->SR2 = TIM_SR2_RESET_VALUE;
        LD        L:0x5257, A
//   59 
//   60   /* Disable channels */
//   61   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
        LD        L:0x525b, A
//   62   /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
//   63   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
        LD        A, #0x1
        LD        L:0x5259, A
//   64   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
        LD        L:0x525a, A
//   65 
//   66   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   67   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
        CLR       A
        LD        L:0x525b, A
//   68   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
        LD        L:0x5259, A
//   69   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
        LD        L:0x525a, A
//   70 
//   71   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
        LD        L:0x525c, A
//   72   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
        LD        L:0x525d, A
//   73 
//   74   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
        LD        L:0x525e, A
//   75 
//   76   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x525f, A
//   77   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
        LD        L:0x5260, A
//   78 
//   79   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
        CLR       A
        LD        L:0x5261, A
//   80   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
        LD        L:0x5262, A
//   81   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
        LD        L:0x5263, A
//   82   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
        LD        L:0x5264, A
//   83 
//   84 
//   85   TIM2->OISR = TIM_OISR_RESET_VALUE;
        LD        L:0x5266, A
//   86   TIM2->EGR = 0x01;/* TIM_EGR_UG */
        LD        A, #0x1
        LD        L:0x5258, A
//   87   TIM2->BKR = TIM_BKR_RESET_VALUE;
        CLR       A
        LD        L:0x5265, A
//   88   TIM2->SR1 = TIM_SR1_RESET_VALUE;
        LD        L:0x5256, A
//   89 }
        RET
//   90 
//   91 /**
//   92   * @brief  Initializes the TIM2 Time Base Unit according to the specified  parameters.
//   93   * @param  TIM2_Prescaler : This parameter can be any member of the @Ref TIM2_Prescaler_TypeDef enumeration.
//   94   * @param  TIM2_CounterMode : This parameter can be any member of the @Ref TIM2_CounterMode_TypeDef enumeration.
//   95   * @param  TIM2_Period : This parameter must be a value between 0x0000 and 0xFFFF.
//   96   * @retval None
//   97   */
//   98 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
//  100                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
//  101                        uint16_t TIM2_Period)
//  102 {
TIM2_TimeBaseInit:
        LD        S:?b1, A
        LDW       Y, X
//  103 
//  104   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
//  105   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
//  106 
//  107 
//  108 
//  109   /* Set the Autoreload value */
//  110   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x525f, A
//  111   TIM2->ARRL = (uint8_t)(TIM2_Period);
        LD        A, YL
        LD        L:0x5260, A
//  112 
//  113   /* Set the Prescaler value */
//  114   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
        LD        A, S:?b1
        LD        L:0x525e, A
//  115 
//  116   /* Select the Counter Mode */
//  117   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
        LD        A, #0x8f
        AND       A, L:0x5250
        LD        L:0x5250, A
//  118   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
        LD        A, S:?b0
        OR        A, L:0x5250
        LD        L:0x5250, A
//  119 
//  120   /* Generate an update event to reload the Prescaler value immediately */
//  121   TIM2->EGR = TIM2_EventSource_Update;
        LD        A, #0x1
        LD        L:0x5258, A
//  122 }
        RET
//  123 
//  124 /**
//  125   * @brief  Initializes the TIM2 Channel1 according to the specified parameters.
//  126   * @param  TIM2_OCMode : This parameter can be any member of the @Ref TIM2_OCMode_TypeDef enumeration.
//  127   * @param  TIM2_OutputState : This parameter can be any member of the @Ref TIM2_OutputState_TypeDef enumeration.
//  128   * @param  TIM2_Pulse : This parameter must be a value between 0x0000 and 0xFFFF.
//  129   * @param  TIM2_OCPolarity : This parameter can be any member of the @Ref TIM2_OCPolarity_TypeDef enumeration.
//  130   * @param  TIM2_OCIdleState : This parameter can be any member of the @Ref TIM2_OCIdleState_TypeDef  enumeration.
//  131   * @retval None
//  132   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  134                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  135                   uint16_t TIM2_Pulse,
//  136                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
//  137                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
//  138 {
TIM2_OC1Init:
        LD        S:?b3, A
        LDW       Y, X
//  139   uint8_t tmpccmr1 = 0;
//  140 
//  141   /* Check the parameters */
//  142   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
//  143   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
//  144   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
//  145   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
//  146 
//  147   tmpccmr1 = TIM2->CCMR1;
        LD        A, L:0x5259
//  148 
//  149   /* Disable the Channel 1: Reset the CCE Bit */
//  150   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x525b, #0x0
//  151   /* Reset the Output Compare Bits */
//  152   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
//  153 
//  154   /* Set the Ouput Compare Mode */
//  155   tmpccmr1 |= (uint8_t)TIM2_OCMode;
//  156 
//  157   TIM2->CCMR1 = tmpccmr1;
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x5259, A
//  158 
//  159   /* Set the Output State */
//  160   if (TIM2_OutputState == TIM2_OutputState_Enable)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM2_OC1Init_0
//  161   {
//  162     TIM2->CCER1 |= TIM_CCER1_CC1E;
        BSET      L:0x525b, #0x0
        JRA       L:??TIM2_OC1Init_1
//  163   }
//  164   else
//  165   {
//  166     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
??TIM2_OC1Init_0:
        BRES      L:0x525b, #0x0
//  167   }
//  168 
//  169   /* Set the Output Polarity */
//  170   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
??TIM2_OC1Init_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM2_OC1Init_2
//  171   {
//  172     TIM2->CCER1 |= TIM_CCER1_CC1P;
        BSET      L:0x525b, #0x1
        JRA       L:??TIM2_OC1Init_3
//  173   }
//  174   else
//  175   {
//  176     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
??TIM2_OC1Init_2:
        BRES      L:0x525b, #0x1
//  177   }
//  178 
//  179   /* Set the Output Idle state */
//  180   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
??TIM2_OC1Init_3:
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TIM2_OC1Init_4
//  181   {
//  182     TIM2->OISR |= TIM_OISR_OIS1;
        BSET      L:0x5266, #0x0
        JRA       L:??TIM2_OC1Init_5
//  183   }
//  184   else
//  185   {
//  186     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
??TIM2_OC1Init_4:
        BRES      L:0x5266, #0x0
//  187   }
//  188 
//  189   /* Set the Pulse value */
//  190   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
??TIM2_OC1Init_5:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5261, A
//  191   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
        LD        A, YL
        LD        L:0x5262, A
//  192 }
        RET
//  193 
//  194 /**
//  195   * @brief  Initializes the TIM2 Channel2 according to the specified parameters.
//  196   * @param  TIM2_OCMode : This parameter can be any member of the @Ref TIM2_OCMode_TypeDef enumeration.
//  197   * @param  TIM2_OutputState : This parameter can be any member of the @Ref TIM2_OutputState_TypeDef enumeration.
//  198   * @param  TIM2_Pulse : This parameter must be a value between 0x0000 and 0xFFFF.
//  199   * @param  TIM2_OCPolarity : This parameter can be any member of the @Ref TIM2_OCPolarity_TypeDef enumeration.
//  200   * @param  TIM2_OCIdleState : This parameter can be any member of the @Ref TIM2_OCIdleState_TypeDef  enumeration.
//  201   * @retval None
//  202   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  203 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
//  204                   TIM2_OutputState_TypeDef TIM2_OutputState,
//  205                   uint16_t TIM2_Pulse,
//  206                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
//  207                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
//  208 {
TIM2_OC2Init:
        LD        S:?b3, A
        LDW       Y, X
//  209   uint8_t tmpccmr2 = 0;
//  210 
//  211   /* Check the parameters */
//  212   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
//  213   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
//  214   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
//  215   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
//  216 
//  217   tmpccmr2 = TIM2->CCMR2;
        LD        A, L:0x525a
//  218 
//  219   /* Disable the Channel 2: Reset the CCE Bit */
//  220   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
        BRES      L:0x525b, #0x4
//  221 
//  222   /* Reset the Output Compare Bits */
//  223   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
//  224 
//  225   /* Set the Ouput Compare Mode */
//  226   tmpccmr2 |= (uint8_t)TIM2_OCMode;
//  227 
//  228   TIM2->CCMR2 = tmpccmr2;
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x525a, A
//  229 
//  230   /* Set the Output State */
//  231   if (TIM2_OutputState == TIM2_OutputState_Enable)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM2_OC2Init_0
//  232   {
//  233     TIM2->CCER1 |= TIM_CCER1_CC2E;
        BSET      L:0x525b, #0x4
        JRA       L:??TIM2_OC2Init_1
//  234   }
//  235   else
//  236   {
//  237     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
??TIM2_OC2Init_0:
        BRES      L:0x525b, #0x4
//  238   }
//  239 
//  240   /* Set the Output Polarity */
//  241   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
??TIM2_OC2Init_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM2_OC2Init_2
//  242   {
//  243     TIM2->CCER1 |= TIM_CCER1_CC2P;
        BSET      L:0x525b, #0x5
        JRA       L:??TIM2_OC2Init_3
//  244   }
//  245   else
//  246   {
//  247     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
??TIM2_OC2Init_2:
        BRES      L:0x525b, #0x5
//  248   }
//  249 
//  250 
//  251   /* Set the Output Idle state */
//  252   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
??TIM2_OC2Init_3:
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TIM2_OC2Init_4
//  253   {
//  254     TIM2->OISR |= TIM_OISR_OIS2;
        BSET      L:0x5266, #0x2
        JRA       L:??TIM2_OC2Init_5
//  255   }
//  256   else
//  257   {
//  258     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
??TIM2_OC2Init_4:
        BRES      L:0x5266, #0x2
//  259   }
//  260 
//  261   /* Set the Pulse value */
//  262   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
??TIM2_OC2Init_5:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5263, A
//  263   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
        LD        A, YL
        LD        L:0x5264, A
//  264 }
        RET
//  265 
//  266 /**
//  267   * @brief  Configures the Break feature, dead time, Lock level, the OSSI,
//  268   * and the AOE(automatic output enable).
//  269   * @param  TIM2_OSSIState : Off-State Selection for Idle mode states.
//  270   *   This parameter can be any member of the @Ref TIM2_OSSIState_TypeDef enumeration.
//  271   * @param  TIM2_LockLevel : Lock level.
//  272   *   This parameter can be any member of the @Ref TIM2_LockLevel_TypeDef enumeration.
//  273   * @param  TIM2_BreakState : Break Input enable/disable .
//  274   *   This parameter can be any member of the @Ref TIM2_BreakState_TypeDef enumeration.
//  275   * @param  TIM2_BreakPolarity : Break Polarity.
//  276   *   This parameter can be any member of the @Ref TIM2_BreakPolarity_TypeDef enumeration.
//  277   * @param  TIM2_AutomaticOutput : TIM2 AOE Bit Set/Reset .
//  278   *   This parameter can be anymember  of the @Ref TIM2_AutomaticOutput_TypeDef enumeration.
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
//  282                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
//  283                     TIM2_BreakState_TypeDef TIM2_BreakState,
//  284                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
//  285                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
//  286 
//  287 {
//  288   /* Check the parameters */
//  289   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
//  290   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
//  291   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
//  292   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
//  293   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
//  294 
//  295 
//  296 
//  297   /* Set the Lock level, the Break enable Bit and the Ploarity, the OSSI State,
//  298   the dead time value and the Automatic Output Enable Bit */
//  299 
//  300   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \ 
//  301                                   (uint8_t)((uint8_t)TIM2_BreakState | TIM2_BreakPolarity)) | \ 
//  302                         (uint8_t)TIM2_AutomaticOutput);
TIM2_BKRConfig:
        LD        S:?b4, A
        LD        A, S:?b0
        OR        A, S:?b4
        OR        A, S:?b1
        OR        A, S:?b2
        OR        A, S:?b3
        LD        L:0x5265, A
//  303 }
        RET
//  304 
//  305 /**
//  306   * @brief  Initializes the TIM2 peripheral according to the specified parameters.
//  307   * @param  TIM2_Channel : This parameter can be any member of the @Ref TIM2_Channel_TypeDef enumeration.
//  308   * @param  TIM2_ICPolarity : This parameter can be any member of the @Ref TIM2_ICPolarity_TypeDef enumeration.
//  309   * @param  TIM2_ICSelection : This parameter can be any member of the @Ref TIM2_ICSelection_TypeDef enumeration.
//  310   * @param  TIM2_ICPrescaler : This parameter can be any member of the @Ref TIM2_ICPSC_TypeDef enumeration.
//  311   * @param  TIM2_ICFilter : This parameter must be a value between 0x00 and 0x0F.
//  312   * @retval None
//  313   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  314 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
//  315                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  316                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
//  317                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
//  318                  uint8_t TIM2_ICFilter)
//  319 {
TIM2_ICInit:
        LD        S:?b5, A
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b6, S:?b2
        MOV       S:?b1, S:?b3
//  320   /* Check the parameters */
//  321   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
//  322 
//  323   if (TIM2_Channel == TIM2_Channel_1)
        CLR       A
        CP        A, S:?b5
        JRNE      L:??TIM2_ICInit_0
//  324   {
//  325     /* TI1 Configuration */
//  326     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
        LD        A, S:?b4
        CALL      L:TI1_Config
//  327 
//  328     /* Set the Input Capture Prescaler value */
//  329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x5259
        AND       A, #0xf3
        OR        A, S:?b6
        LD        L:0x5259, A
//  330   }
        RET
//  331   else /* if (TIM2_Channel == TIM2_Channel_2) */
//  332   {
//  333     /* TI2 Configuration */
//  334     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
??TIM2_ICInit_0:
        LD        A, S:?b4
        CALL      L:TI2_Config
//  335 
//  336     /* Set the Input Capture Prescaler value */
//  337     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b6
        LD        L:0x525a, A
//  338   }
//  339 }
        RET
//  340 
//  341 /**
//  342   * @brief  Configures the TIM2 peripheral in PWM Input Mode according to the
//  343   * specified parameters.
//  344   * @param  TIM2_Channel : This parameter can be any member of the @Ref TIM2_Channel_TypeDef enumeration.
//  345   * @param  TIM2_ICPolarity : This parameter can be any member of the @Ref TIM2_ICPolarity_TypeDef enumeration.
//  346   * @param  TIM2_ICSelection : This parameter can be any member of the @Ref TIM2_ICSelection_TypeDef enumeration.
//  347   * @param  TIM2_ICPrescaler : This parameter can be any member of the @Ref TIM2_ICPSC_TypeDef enumeration.
//  348   * @param  TIM2_ICFilter : This parameter must be a value between 0x00 and 0x0F.
//  349   * @retval None
//  350   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  351 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
//  352                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  353                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
//  354                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
//  355                      uint8_t TIM2_ICFilter)
//  356 {
TIM2_PWMIConfig:
        PUSH      L:?b9
        PUSH      L:?b8
        LD        S:?b8, A
        MOV       S:?b7, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b9, S:?b2
        MOV       S:?b5, S:?b3
//  357   uint8_t icpolarity = TIM2_ICPolarity_Rising;
//  358   uint8_t icselection = TIM2_ICSelection_DirectTI;
//  359 
//  360   /* Check the parameters */
//  361   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
//  362 
//  363   /* Select the Opposite Input Polarity */
//  364   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b7
        JRNE      L:??TIM2_PWMIConfig_0
//  365   {
//  366     icpolarity = TIM2_ICPolarity_Falling;
        LD        A, #0x1
        LD        S:?b4, A
        JRA       L:??TIM2_PWMIConfig_1
//  367   }
//  368   else
//  369   {
//  370     icpolarity = TIM2_ICPolarity_Rising;
??TIM2_PWMIConfig_0:
        CLR       S:?b4
//  371   }
//  372 
//  373   /* Select the Opposite Input */
//  374   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
??TIM2_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM2_PWMIConfig_2
//  375   {
//  376     icselection = TIM2_ICSelection_IndirectTI;
        LD        A, #0x2
        LD        S:?b6, A
        JRA       L:??TIM2_PWMIConfig_3
//  377   }
//  378   else
//  379   {
//  380     icselection = TIM2_ICSelection_DirectTI;
??TIM2_PWMIConfig_2:
        LD        A, #0x1
        LD        S:?b6, A
//  381   }
//  382 
//  383   if (TIM2_Channel == TIM2_Channel_1)
??TIM2_PWMIConfig_3:
        CLR       A
        CP        A, S:?b8
        MOV       S:?b1, S:?b5
        JRNE      L:??TIM2_PWMIConfig_4
//  384   {
//  385     /* TI1 Configuration */
//  386     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
//  387                TIM2_ICFilter);
        LD        A, S:?b7
        CALL      L:TI1_Config
//  388 
//  389     /* Set the Input Capture Prescaler value */
//  390     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x5259
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x5259, A
//  391 
//  392     /* TI2 Configuration */
//  393     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
        MOV       S:?b1, S:?b5
        MOV       S:?b0, S:?b6
        LD        A, S:?b4
        CALL      L:TI2_Config
//  394 
//  395     /* Set the Input Capture Prescaler value */
//  396     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x525a, A
//  397   }
        JRA       L:??TIM2_PWMIConfig_5
//  398   else
//  399   {
//  400     /* TI2 Configuration */
//  401     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
//  402                TIM2_ICFilter);
??TIM2_PWMIConfig_4:
        LD        A, S:?b7
        CALL      L:TI2_Config
//  403 
//  404     /* Set the Input Capture Prescaler value */
//  405     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x525a, A
//  406 
//  407     /* TI1 Configuration */
//  408     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
        MOV       S:?b1, S:?b5
        MOV       S:?b0, S:?b6
        LD        A, S:?b4
        CALL      L:TI1_Config
//  409 
//  410     /* Set the Input Capture Prescaler value */
//  411     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
        LD        A, L:0x5259
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x5259, A
//  412   }
//  413 }
??TIM2_PWMIConfig_5:
        POP       L:?b8
        POP       L:?b9
        RET
//  414 
//  415 /**
//  416   * @brief  Enables or disables the TIM2 peripheral.
//  417   * @param  NewState : The new state of the TIM2 peripheral.
//  418   *   This parameter can be any of the @ref FunctionalState enumeration.
//  419   * @retval None
//  420   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  421 void TIM2_Cmd(FunctionalState NewState)
//  422 {
//  423   /* Check the parameters */
//  424   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  425 
//  426   /* set or Reset the CEN Bit */
//  427   if (NewState != DISABLE)
TIM2_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_Cmd_0
//  428   {
//  429     TIM2->CR1 |= TIM_CR1_CEN;
        BSET      L:0x5250, #0x0
        RET
//  430   }
//  431   else
//  432   {
//  433     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
??TIM2_Cmd_0:
        BRES      L:0x5250, #0x0
//  434   }
//  435 }
        RET
//  436 
//  437 /**
//  438   * @brief  Enables or disables the TIM2 peripheral Main Outputs.
//  439   * @param  NewState : The new state of the TIM2 peripheral.
//  440   *   This parameter can be any of the @ref FunctionalState enumeration.
//  441   * @retval None
//  442   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  443 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
//  444 {
//  445   /* Check the parameters */
//  446   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  447 
//  448   /* Set or Reset the MOE Bit */
//  449 
//  450   if (NewState != DISABLE)
TIM2_CtrlPWMOutputs:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_CtrlPWMOutputs_0
//  451   {
//  452     TIM2->BKR |= TIM_BKR_MOE ;
        BSET      L:0x5265, #0x7
        RET
//  453   }
//  454   else
//  455   {
//  456     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
??TIM2_CtrlPWMOutputs_0:
        BRES      L:0x5265, #0x7
//  457   }
//  458 }
        RET
//  459 
//  460 /**
//  461   * @brief  Enables or disables the specified TIM2 interrupts.
//  462   * @param  TIM2_IT : Specifies the TIM2 interrupts sources to be enabled or disabled.
//  463   *   This parameter can be any combination of the @ref TIM2_IT_TypeDef enumeration.
//  464   * @param  NewState : The new state of the TIM2 peripheral.
//  465   *   This parameter can be any of the @ref FunctionalState enumeration.
//  466   * @retval None
//  467   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  468 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
//  469 {
TIM2_ITConfig:
        LD        S:?b1, A
//  470   /* Check the parameters */
//  471   assert_param(IS_TIM2_IT(TIM2_IT));
//  472   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  473 
//  474   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM2_ITConfig_0
//  475   {
//  476     /* Enable the Interrupt sources */
//  477     TIM2->IER |= (uint8_t)TIM2_IT;
        LD        A, S:?b1
        OR        A, L:0x5255
        LD        L:0x5255, A
        RET
//  478   }
//  479   else
//  480   {
//  481     /* Disable the Interrupt sources */
//  482     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
??TIM2_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5255
        LD        L:0x5255, A
//  483   }
//  484 }
        RET
//  485 
//  486 /**
//  487   * @brief  Enables or disables the TIM2 DMA Requests.
//  488   * @param  TIM2_DMASources: specifies the DMA Request sources.
//  489   *   This parameter can be any combination of  @ref TIM2_DMASource_TypeDef enumeration.
//  490   * @param  NewState: new state of the DMA Request sources.
//  491   *   This parameter can be: ENABLE or DISABLE.
//  492   * @retval None
//  493   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  494 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
//  495 {
TIM2_DMACmd:
        LD        S:?b1, A
//  496   /* Check the parameters */
//  497   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  498   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
//  499 
//  500   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM2_DMACmd_0
//  501   {
//  502     /* Enable the DMA sources */
//  503     TIM2->DER |= (uint8_t)TIM2_DMASource;
        LD        A, S:?b1
        OR        A, L:0x5254
        LD        L:0x5254, A
        RET
//  504   }
//  505   else
//  506   {
//  507     /* Disable the DMA sources */
//  508     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
??TIM2_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5254
        LD        L:0x5254, A
//  509   }
//  510 }
        RET
//  511 
//  512 /**
//  513   * @brief  Enables the TIM2 internal Clock.
//  514   * @par Parameters:
//  515   * None
//  516   * @retval None
//  517   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  518 void TIM2_InternalClockConfig(void)
//  519 {
//  520   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  521   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
TIM2_InternalClockConfig:
        LD        A, #0xf8
        AND       A, L:0x5252
        LD        L:0x5252, A
//  522 }
        RET
//  523 
//  524 /**
//  525   * @brief  Configures the TIM2 External clock Mode1.
//  526   * @param  TIM2_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  527   *   This parameter can be one of @ref TIM2_ExtTRGPSC_TypeDef enumeration.
//  528   * @param  TIM2_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  529   *   This parameter can be one of @ref TIM2_ExtTRGPolarity_TypeDef enumeration.
//  530   * @param  ExtTRGFilter : Specifies the External Trigger Filter.
//  531   *   This parameter must be a value between 0x00 and 0x0F
//  532   * @retval None
//  533   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  534 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
//  535                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
//  536                               uint8_t ExtTRGFilter)
//  537 {
//  538   /* Configure the ETR Clock source */
//  539   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
TIM2_ETRClockMode1Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5253
        LD        L:0x5253, A
//  540 
//  541   /* Select the External clock mode1 */
//  542   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
        LD        A, #0xf8
        AND       A, L:0x5252
        LD        L:0x5252, A
//  543   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x5252
        LD        L:0x5252, A
//  544 
//  545   /* Select the Trigger selection : ETRF */
//  546   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
        LD        A, #0x8f
        AND       A, L:0x5252
        LD        L:0x5252, A
//  547   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
        LD        A, #0x70
        OR        A, L:0x5252
        LD        L:0x5252, A
//  548 }
        RET
//  549 
//  550 /**
//  551   * @brief  Configures the TIM2 External clock Mode2.
//  552   * @param  TIM2_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  553   *   This parameter can be one of the @ref TIM2_ExtTRGPSC_TypeDef enumeration.
//  554   * @param  TIM2_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  555   *   This parameter can be one of the @ref TIM2_ExtTRGPolarity_TypeDef enumeration.
//  556   * @param  ExtTRGFilter : Specifies the External Trigger Filter.
//  557   *   This parameter must be a value between 0x00 and 0x0F
//  558   * @retval None
//  559   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  560 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
//  561                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
//  562                               uint8_t ExtTRGFilter)
//  563 {
//  564   /* Configure the ETR Clock source */
//  565   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
TIM2_ETRClockMode2Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5253
        LD        L:0x5253, A
//  566 
//  567   /* Enable the External clock mode2 */
//  568   TIM2->ETR |= TIM_ETR_ECE ;
        BSET      L:0x5253, #0x6
//  569 }
        RET
//  570 
//  571 /**
//  572   * @brief  Configures the TIM2 External Trigger.
//  573   * @param  TIM2_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  574   *   This parameter can be one of the @ref TIM2_ExtTRGPSC_TypeDef enumeration.
//  575   * @param  TIM2_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  576   *   This parameter can be one of the @ref TIM2_ExtTRGPolarity_TypeDef enumeration.
//  577   * @param  ExtTRGFilter : Specifies the External Trigger Filter.
//  578   *   This parameter must be a value between 0x00 and 0x0F
//  579   * @retval None
//  580   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  581 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
//  582                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
//  583                     uint8_t ExtTRGFilter)
//  584 {
//  585   /* Check the parameters */
//  586   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
//  587   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
//  588   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
//  589   /* Set the Prescaler, the Filter value and the Polarity */
//  590   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | \ 
//  591                                    (uint8_t)TIM2_ExtTRGPolarity ) | (uint8_t)ExtTRGFilter);
TIM2_ETRConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5253
        LD        L:0x5253, A
//  592 }
        RET
//  593 
//  594 /**
//  595   * @brief  Configures the TIM2 Trigger as External Clock.
//  596   * @param  TIM2_TIxExternalCLKSource : Specifies Trigger source.
//  597   *   This parameter can be one of the @ref TIM2_TIxExternalCLK1Source_TypeDef enumeration.
//  598   * @param  TIM2_ICPolarity : Specifies the TIx Polarity.
//  599   *   This parameter can be @ref TIM2_ICPolarity_TypeDef enumeration.
//  600   * @param  ICFilter : Specifies the filter value.
//  601   *   This parameter must be a value between 0x00 and 0x0F
//  602   * @retval None
//  603   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  604 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
//  605                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
//  606                                  uint8_t ICFilter)
//  607 {
TIM2_TIxExternalClockConfig:
        LD        S:?b4, A
        MOV       S:?b2, S:?b0
//  608   /* Check the parameters */
//  609   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
//  610   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
//  611   assert_param(IS_TIM2_IC_FILTER(ICFilter));
//  612 
//  613   /* Configure the TIM2 Input Clock Source */
//  614   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
        CP        A, #0x60
        JRNE      L:??TIM2_TIxExternalClockConfig_0
//  615   {
//  616     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI2_Config
        JRA       L:??TIM2_TIxExternalClockConfig_1
//  617   }
//  618   else
//  619   {
//  620     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
??TIM2_TIxExternalClockConfig_0:
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI1_Config
//  621   }
//  622 
//  623   /* Select the Trigger source */
//  624   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
??TIM2_TIxExternalClockConfig_1:
        LD        A, L:0x5252
        AND       A, #0x8f
        OR        A, S:?b4
        LD        L:0x5252, A
//  625 
//  626   /* Select the External clock mode1 */
//  627   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x5252
        LD        L:0x5252, A
//  628 }
        RET
//  629 
//  630 /**
//  631   * @brief  Selects the TIM2 Input Trigger source.
//  632   * @param  TIM2_InputTriggerSource : Specifies Input Trigger source.
//  633   *   This parameter can be one of the @ref TIM2_TRGSelection_TypeDef enumeration.
//  634   * @retval None
//  635   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  636 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
//  637 {
TIM2_SelectInputTrigger:
        LD        S:?b0, A
//  638   uint8_t tmpsmcr = 0;
//  639 
//  640   /* Check the parameters */
//  641   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
//  642 
//  643   tmpsmcr = TIM2->SMCR;
        LD        A, L:0x5252
//  644 
//  645   /* Select the Tgigger Source */
//  646   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
//  647   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
//  648 
//  649   TIM2->SMCR = (uint8_t)tmpsmcr;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5252, A
//  650 }
        RET
//  651 
//  652 /**
//  653   * @brief  Enables or Disables the TIM2 Update event.
//  654   * @param  NewState : The new state of the TIM2 peripheral Preload register.
//  655   *   This parameter can be any of the @ref FunctionalState enumeration.
//  656   * @retval None
//  657   */
//  658 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  659 void TIM2_UpdateDisableConfig(FunctionalState NewState)
//  660 {
//  661   /* Check the parameters */
//  662   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  663 
//  664   /* Set or Reset the UDIS Bit */
//  665   if (NewState != DISABLE)
TIM2_UpdateDisableConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_UpdateDisableConfig_0
//  666   {
//  667     TIM2->CR1 |= TIM_CR1_UDIS;
        BSET      L:0x5250, #0x1
        RET
//  668   }
//  669   else
//  670   {
//  671     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
??TIM2_UpdateDisableConfig_0:
        BRES      L:0x5250, #0x1
//  672   }
//  673 }
        RET
//  674 
//  675 /**
//  676   * @brief  Selects the TIM2 Update Request Interrupt source.
//  677   * @param  TIM2_UpdateSource : Specifies the Update source.
//  678   *   This parameter can be one of the @ref TIM2_UpdateSource_TypeDef enumeration.
//  679   * @retval None
//  680   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  681 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
//  682 {
//  683   /* Check the parameters */
//  684   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
//  685 
//  686   /* Set or Reset the URS Bit */
//  687   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
TIM2_UpdateRequestConfig:
        CP        A, #0x1
        JRNE      L:??TIM2_UpdateRequestConfig_0
//  688   {
//  689     TIM2->CR1 |= TIM_CR1_URS ;
        BSET      L:0x5250, #0x2
        RET
//  690   }
//  691   else
//  692   {
//  693     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
??TIM2_UpdateRequestConfig_0:
        BRES      L:0x5250, #0x2
//  694   }
//  695 }
        RET
//  696 
//  697 /**
//  698   * @brief  Enables or Disables the TIM’s Hall sensor interface.
//  699   * @param  NewState : The new state of the TIM2 Hall sensor interface.
//  700   *   This parameter can be any of the @ref FunctionalState enumeration.
//  701   * @retval None
//  702   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  703 void TIM2_SelectHallSensor(FunctionalState NewState)
//  704 {
//  705   /* Check the parameters */
//  706   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  707 
//  708   /* Set or Reset the TI1S Bit */
//  709   if (NewState != DISABLE)
TIM2_SelectHallSensor:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_SelectHallSensor_0
//  710   {
//  711     TIM2->CR2 |= TIM_CR2_TI1S;
        BSET      L:0x5251, #0x7
        RET
//  712   }
//  713   else
//  714   {
//  715     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
??TIM2_SelectHallSensor_0:
        BRES      L:0x5251, #0x7
//  716   }
//  717 }
        RET
//  718 
//  719 /**
//  720   * @brief  Selects the TIM’s One Pulse Mode.
//  721   * @param  TIM2_OPMode : Specifies the OPM Mode to be used.
//  722   *   This parameter can be one of the @ref TIM2_OPMode_TypeDef enumeration.
//  723   * @retval None
//  724   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  725 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
//  726 {
//  727   /* Check the parameters */
//  728   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
//  729 
//  730   /* Set or Reset the OPM Bit */
//  731   if (TIM2_OPMode == TIM2_OPMode_Single)
TIM2_SelectOnePulseMode:
        CP        A, #0x1
        JRNE      L:??TIM2_SelectOnePulseMode_0
//  732   {
//  733     TIM2->CR1 |= TIM_CR1_OPM ;
        BSET      L:0x5250, #0x3
        RET
//  734   }
//  735   else
//  736   {
//  737     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
??TIM2_SelectOnePulseMode_0:
        BRES      L:0x5250, #0x3
//  738   }
//  739 }
        RET
//  740 
//  741 /**
//  742   * @brief  Selects the TIM2 Trigger Output Mode.
//  743   * @param  TIM2_TRGOSource : Specifies the Trigger Output source.
//  744   *   This parameter can be one of the @ref TIM2_TRGOSource_TypeDef enumeration.
//  745   * @retval None
//  746   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  747 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
//  748 {
TIM2_SelectOutputTrigger:
        LD        S:?b0, A
//  749   uint8_t tmpcr2 = 0;
//  750 
//  751   /* Check the parameters */
//  752   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
//  753 
//  754   tmpcr2 = TIM2->CR2;
        LD        A, L:0x5251
//  755 
//  756   /* Reset the MMS Bits */
//  757   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
//  758 
//  759   /* Select the TRGO source */
//  760   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
//  761 
//  762   TIM2->CR2 = tmpcr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5251, A
//  763 }
        RET
//  764 
//  765 /**
//  766   * @brief  Selects the TIM2 Slave Mode.
//  767   * @param  TIM2_SlaveMode : Specifies the TIM2 Slave Mode.
//  768   *   This parameter can be one of the @ref TIM2_SlaveMode_TypeDef enumeration.
//  769   * @retval None
//  770   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  771 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
//  772 {
TIM2_SelectSlaveMode:
        LD        S:?b0, A
//  773   uint8_t tmpsmcr = 0;
//  774 
//  775   /* Check the parameters */
//  776   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
//  777 
//  778   tmpsmcr = TIM2->SMCR;
        LD        A, L:0x5252
//  779 
//  780   /* Reset the SMS Bits */
//  781   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
//  782 
//  783   /* Select the Slave Mode */
//  784   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
//  785 
//  786   TIM2->SMCR = tmpsmcr;
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x5252, A
//  787 }
        RET
//  788 
//  789 /**
//  790   * @brief  Sets or Resets the TIM2 Master/Slave Mode.
//  791   * @param  NewState : The new state of the synchronization between TIM2 and its slaves (through TRGO).
//  792   *   This parameter can be any of the @ref FunctionalState enumeration.
//  793   * @retval None
//  794   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  795 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
//  796 {
//  797   /* Check the parameters */
//  798   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  799 
//  800   /* Set or Reset the MSM Bit */
//  801   if (NewState != DISABLE)
TIM2_SelectMasterSlaveMode:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_SelectMasterSlaveMode_0
//  802   {
//  803     TIM2->SMCR |= TIM_SMCR_MSM;
        BSET      L:0x5252, #0x7
        RET
//  804   }
//  805   else
//  806   {
//  807     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
??TIM2_SelectMasterSlaveMode_0:
        BRES      L:0x5252, #0x7
//  808   }
//  809 }
        RET
//  810 
//  811 /**
//  812   * @brief  Configures the TIM2 Encoder Interface.
//  813   * @param  TIM2_EncoderMode : Specifies the TIM2 Encoder Mode.
//  814   *   This parameter can be one of the @ref TIM2_EncoderMode_TypeDef enumeration.
//  815   * @param  TIM2_IC1Polarity : Specifies the IC1 Polarity.
//  816   *   This parameter can be one of the @ref TIM2_ICPolarity_TypeDef enumeration.
//  817   * @param  TIM2_IC2Polarity : Specifies the IC2 Polarity.
//  818   *   This parameter can be one of the @ref TIM2_ICPolarity_TypeDef enumeration.
//  819   * @retval None
//  820   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  821 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
//  822                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
//  823                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
//  824 {
TIM2_EncoderInterfaceConfig:
        LD        S:?b4, A
//  825   uint8_t tmpsmcr = 0;
//  826   uint8_t tmpccmr1 = 0;
//  827   uint8_t tmpccmr2 = 0;
//  828 
//  829   /* Check the parameters */
//  830   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
//  831   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
//  832   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
//  833 
//  834   tmpsmcr = TIM2->SMCR;
        LD        A, L:0x5252
        LD        S:?b2, A
//  835   tmpccmr1 = TIM2->CCMR1;
        LD        A, L:0x5259
        LD        S:?b3, A
//  836   tmpccmr2 = TIM2->CCMR2;
        LD        A, L:0x525a
        LD        S:?b5, A
//  837 
//  838   /* Set the encoder Mode */
//  839   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
//  840   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
        LD        A, S:?b2
        AND       A, #0xf0
        OR        A, S:?b4
        LD        S:?b4, A
//  841 
//  842   /* Select the Capture Compare 1 and the Capture Compare 2 as input */
//  843   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
//  844   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
//  845   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
        LD        A, S:?b3
        AND       A, #0xfc
        OR        A, #0x1
        LD        S:?b3, A
//  846   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
        LD        A, S:?b5
        AND       A, #0xfc
        OR        A, #0x1
        LD        S:?b2, A
//  847 
//  848   /* Set the TI1 and the TI2 Polarities */
//  849   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM2_EncoderInterfaceConfig_0
//  850   {
//  851     TIM2->CCER1 |= TIM_CCER1_CC1P ;
        BSET      L:0x525b, #0x1
        JRA       L:??TIM2_EncoderInterfaceConfig_1
//  852   }
//  853   else
//  854   {
//  855     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
??TIM2_EncoderInterfaceConfig_0:
        BRES      L:0x525b, #0x1
//  856   }
//  857 
//  858   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
??TIM2_EncoderInterfaceConfig_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM2_EncoderInterfaceConfig_2
//  859   {
//  860     TIM2->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x525b, #0x5
        JRA       L:??TIM2_EncoderInterfaceConfig_3
//  861   }
//  862   else
//  863   {
//  864     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TIM2_EncoderInterfaceConfig_2:
        BRES      L:0x525b, #0x5
//  865   }
//  866 
//  867   TIM2->SMCR = tmpsmcr;
??TIM2_EncoderInterfaceConfig_3:
        LD        A, S:?b4
        LD        L:0x5252, A
//  868   TIM2->CCMR1 = tmpccmr1;
        LD        A, S:?b3
        LD        L:0x5259, A
//  869   TIM2->CCMR2 = tmpccmr2;
        LD        A, S:?b2
        LD        L:0x525a, A
//  870 }
        RET
//  871 
//  872 /**
//  873   * @brief  Configures the TIM2 Prescaler.
//  874   * @param  Prescaler : Specifies the Prescaler Register value
//  875   *   This parameter can be one of the @ref TIM2_Prescaler_TypeDef enumeration.
//  876   * @param  TIM2_PSCReloadMode : Specifies the TIM2 Prescaler Reload mode.
//  877   *   This parameter can be one of the @ref TIM2_PSCReloadMode_TypeDef enumeration.
//  878   * @retval None
//  879   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  880 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
//  881                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
//  882 {
//  883   /* Check the parameters */
//  884   assert_param(IS_TIM2_PRESCALER(Prescaler));
//  885   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
//  886 
//  887   /* Set the Prescaler value */
//  888   TIM2->PSCR = (uint8_t)(Prescaler);
TIM2_PrescalerConfig:
        LD        L:0x525e, A
//  889 
//  890   /* Set or reset the UG Bit */
//  891   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM2_PrescalerConfig_0
//  892   {
//  893     TIM2->EGR |= TIM_EGR_UG ;
        BSET      L:0x5258, #0x0
        RET
//  894   }
//  895   else
//  896   {
//  897     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
??TIM2_PrescalerConfig_0:
        BRES      L:0x5258, #0x0
//  898   }
//  899 }
        RET
//  900 
//  901 /**
//  902   * @brief  Specifies the TIM2 Counter Mode to be used.
//  903   * @param  TIM2_CounterMode : Specifies the Counter Mode to be used
//  904   *   This parameter can be one of the @ref TIM2_CounterMode_TypeDef enumeration.
//  905   * @retval None
//  906   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  907 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
//  908 {
TIM2_CounterModeConfig:
        LD        S:?b0, A
//  909   uint8_t tmpcr1 = 0;
//  910 
//  911   /* Check the parameters */
//  912   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
//  913 
//  914   tmpcr1 = TIM2->CR1;
        LD        A, L:0x5250
//  915 
//  916   /* Reset the CMS and DIR Bits */
//  917   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
//  918 
//  919   /* Set the Counter Mode */
//  920   tmpcr1 |= (uint8_t)TIM2_CounterMode;
//  921 
//  922   TIM2->CR1 = tmpcr1;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5250, A
//  923 }
        RET
//  924 
//  925 /**
//  926   * @brief  Forces the TIM2 Channel1 output waveform to active or inactive level.
//  927   * @param  TIM2_ForcedAction : Specifies the forced Action to be set to the output waveform.
//  928   *   This parameter can be one of the @ref TIM2_ForcedAction_TypeDef enumeration.
//  929   * @retval None
//  930   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  931 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  932 {
TIM2_ForcedOC1Config:
        LD        S:?b0, A
//  933   uint8_t tmpccmr1 = 0;
//  934 
//  935   /* Check the parameters */
//  936   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
//  937 
//  938   tmpccmr1 = TIM2->CCMR1;
        LD        A, L:0x5259
//  939 
//  940   /* Reset the OCM Bits */
//  941   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
//  942 
//  943   /* Configure The Forced output Mode */
//  944   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
//  945 
//  946   TIM2->CCMR1 = tmpccmr1;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5259, A
//  947 }
        RET
//  948 
//  949 /**
//  950   * @brief  Forces the TIM2 Channel2 output waveform to active or inactive level.
//  951   * @param  TIM2_ForcedAction : Specifies the forced Action to be set to the output waveform.
//  952   *   This parameter can be one of the @ref TIM2_ForcedAction_TypeDef enumeration.
//  953   * @retval None
//  954   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  955 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
//  956 {
TIM2_ForcedOC2Config:
        LD        S:?b0, A
//  957   uint8_t tmpccmr2 = 0;
//  958 
//  959   /* Check the parameters */
//  960   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
//  961 
//  962   tmpccmr2 = TIM2->CCMR2;
        LD        A, L:0x525a
//  963 
//  964   /* Reset the OCM Bits */
//  965   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
//  966 
//  967   /* Configure The Forced output Mode */
//  968   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
//  969 
//  970   TIM2->CCMR2 = tmpccmr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x525a, A
//  971 }
        RET
//  972 
//  973 /**
//  974   * @brief  Enables or disables TIM2 peripheral Preload register on ARR.
//  975   * @param  NewState : The new state of the TIM2 peripheral Preload register.
//  976   *   This parameter can be any of the @ref FunctionalState enumeration.
//  977   * @retval None
//  978   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  979 void TIM2_ARRPreloadConfig(FunctionalState NewState)
//  980 {
//  981   /* Check the parameters */
//  982   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  983 
//  984   /* Set or Reset the ARPE Bit */
//  985   if (NewState != DISABLE)
TIM2_ARRPreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_ARRPreloadConfig_0
//  986   {
//  987     TIM2->CR1 |= TIM_CR1_ARPE;
        BSET      L:0x5250, #0x7
        RET
//  988   }
//  989   else
//  990   {
//  991     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
??TIM2_ARRPreloadConfig_0:
        BRES      L:0x5250, #0x7
//  992   }
//  993 }
        RET
//  994 
//  995 /**
//  996   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR1.
//  997   * @param  NewState : The new state of the Capture Compare Preload register.
//  998   *   This parameter can be any of the @ref FunctionalState enumeration.
//  999   * @retval None
// 1000   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1001 void TIM2_OC1PreloadConfig(FunctionalState NewState)
// 1002 {
// 1003   /* Check the parameters */
// 1004   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1005 
// 1006   /* Set or Reset the OC1PE Bit */
// 1007   if (NewState != DISABLE)
TIM2_OC1PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_OC1PreloadConfig_0
// 1008   {
// 1009     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
        BSET      L:0x5259, #0x3
        RET
// 1010   }
// 1011   else
// 1012   {
// 1013     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
??TIM2_OC1PreloadConfig_0:
        BRES      L:0x5259, #0x3
// 1014   }
// 1015 }
        RET
// 1016 
// 1017 /**
// 1018   * @brief  Enables or disables the TIM2 peripheral Preload Register on CCR2.
// 1019   * @param  NewState : The new state of the Capture Compare Preload register.
// 1020   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1021   * @retval None
// 1022   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1023 void TIM2_OC2PreloadConfig(FunctionalState NewState)
// 1024 {
// 1025   /* Check the parameters */
// 1026   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1027 
// 1028   /* Set or Reset the OC2PE Bit */
// 1029   if (NewState != DISABLE)
TIM2_OC2PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_OC2PreloadConfig_0
// 1030   {
// 1031     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
        BSET      L:0x525a, #0x3
        RET
// 1032   }
// 1033   else
// 1034   {
// 1035     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
??TIM2_OC2PreloadConfig_0:
        BRES      L:0x525a, #0x3
// 1036   }
// 1037 }
        RET
// 1038 
// 1039 /**
// 1040   * @brief  Configures the TIM2 Capture Compare 1 Fast feature.
// 1041   * @param  NewState : The new state of the Output Compare Fast Enable bit.
// 1042   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1043   * @retval None
// 1044   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1045 void TIM2_OC1FastCmd(FunctionalState NewState)
// 1046 {
// 1047   /* Check the parameters */
// 1048   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1049 
// 1050   /* Set or Reset the OC1FE Bit */
// 1051   if (NewState != DISABLE)
TIM2_OC1FastCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_OC1FastCmd_0
// 1052   {
// 1053     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
        BSET      L:0x5259, #0x2
        RET
// 1054   }
// 1055   else
// 1056   {
// 1057     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
??TIM2_OC1FastCmd_0:
        BRES      L:0x5259, #0x2
// 1058   }
// 1059 }
        RET
// 1060 
// 1061 /**
// 1062   * @brief  Configures the TIM2 Capture Compare 2 Fast feature.
// 1063   * @param  NewState : The new state of the Output Compare Fast Enable bit.
// 1064   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1065   * @retval None
// 1066   */
// 1067 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1068 void TIM2_OC2FastCmd(FunctionalState NewState)
// 1069 {
// 1070   /* Check the parameters */
// 1071   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1072 
// 1073   /* Set or Reset the OC2FE Bit */
// 1074   if (NewState != DISABLE)
TIM2_OC2FastCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_OC2FastCmd_0
// 1075   {
// 1076     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
        BSET      L:0x525a, #0x2
        RET
// 1077   }
// 1078   else
// 1079   {
// 1080     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
??TIM2_OC2FastCmd_0:
        BRES      L:0x525a, #0x2
// 1081   }
// 1082 }
        RET
// 1083 
// 1084 /**
// 1085   * @brief  Configures the TIM2 event to be generated by software.
// 1086   * @param  TIM2_EventSource : Specifies the event source.
// 1087   *   This parameter can be one of the @ref TIM2_EventSource_TypeDef enumeration.
// 1088   * @retval None
// 1089   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1090 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
// 1091 {
// 1092   /* Check the parameters */
// 1093   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
// 1094 
// 1095   /* Set the event sources */
// 1096   TIM2->EGR |= (uint8_t)TIM2_EventSource;
TIM2_GenerateEvent:
        OR        A, L:0x5258
        LD        L:0x5258, A
// 1097 }
        RET
// 1098 
// 1099 /**
// 1100   * @brief  Configures the TIM2 Channel 1 polarity.
// 1101   * @param  TIM2_OCPolarity : Specifies the OC1 Polarity.
// 1102   *   This parameter can be one of the @ref TIM2_OCPolarity_TypeDef enumeration.
// 1103   * @retval None
// 1104   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1105 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
// 1106 {
// 1107   /* Check the parameters */
// 1108   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
// 1109 
// 1110   /* Set or Reset the CC1P Bit */
// 1111   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
TIM2_OC1PolarityConfig:
        CP        A, #0x1
        JRNE      L:??TIM2_OC1PolarityConfig_0
// 1112   {
// 1113     TIM2->CCER1 |= TIM_CCER1_CC1P ;
        BSET      L:0x525b, #0x1
        RET
// 1114   }
// 1115   else
// 1116   {
// 1117     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
??TIM2_OC1PolarityConfig_0:
        BRES      L:0x525b, #0x1
// 1118   }
// 1119 }
        RET
// 1120 
// 1121 /**
// 1122   * @brief  Configures the TIM2 Channel 2 polarity.
// 1123   * @param  TIM2_OCPolarity : Specifies the OC2 Polarity.
// 1124   *   This parameter can be one of the @ref TIM2_OCPolarity_TypeDef enumeration.
// 1125   * @retval None
// 1126   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1127 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
// 1128 {
// 1129   /* Check the parameters */
// 1130   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
// 1131 
// 1132   /* Set or Reset the CC2P Bit */
// 1133   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
TIM2_OC2PolarityConfig:
        CP        A, #0x1
        JRNE      L:??TIM2_OC2PolarityConfig_0
// 1134   {
// 1135     TIM2->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x525b, #0x5
        RET
// 1136   }
// 1137   else
// 1138   {
// 1139     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TIM2_OC2PolarityConfig_0:
        BRES      L:0x525b, #0x5
// 1140   }
// 1141 }
        RET
// 1142 
// 1143 /**
// 1144   * @brief  Enables or disables the TIM2 Capture Compare Channel x.
// 1145   * @param  TIM2_Channel : Specifies the TIM2 Channel.
// 1146   *   This parameter can be one of @ref TIM2_Channel_TypeDef enumeration.
// 1147   * @param  NewState : Specifies the TIM2 Channel CCxE bit new state.
// 1148   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1149   * @retval None
// 1150   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1151 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
// 1152                  FunctionalState NewState)
// 1153 {
// 1154   /* Check the parameters */
// 1155   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
// 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1157 
// 1158   if (TIM2_Channel == TIM2_Channel_1)
TIM2_CCxCmd:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JRNE      L:??TIM2_CCxCmd_0
// 1159   {
// 1160     /* Set or Reset the CC1E Bit */
// 1161     if (NewState != DISABLE)
        CP        A, S:?b0
        JREQ      L:??TIM2_CCxCmd_1
// 1162     {
// 1163       TIM2->CCER1 |= TIM_CCER1_CC1E ;
        BSET      L:0x525b, #0x0
        RET
// 1164     }
// 1165     else
// 1166     {
// 1167       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
??TIM2_CCxCmd_1:
        BRES      L:0x525b, #0x0
        RET
// 1168     }
// 1169 
// 1170   }
// 1171   else /* if (TIM2_Channel == TIM2_Channel_2) */
// 1172   {
// 1173     /* Set or Reset the CC2E Bit */
// 1174     if (NewState != DISABLE)
??TIM2_CCxCmd_0:
        CP        A, S:?b0
        JREQ      L:??TIM2_CCxCmd_2
// 1175     {
// 1176       TIM2->CCER1 |= TIM_CCER1_CC2E;
        BSET      L:0x525b, #0x4
        RET
// 1177     }
// 1178     else
// 1179     {
// 1180       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
??TIM2_CCxCmd_2:
        BRES      L:0x525b, #0x4
// 1181     }
// 1182   }
// 1183 }
        RET
// 1184 
// 1185 /**
// 1186   * @brief  Selects the TIM2 Ouput Compare Mode. This function disables the
// 1187   * selected channel before changing the Ouput Compare Mode. User has to
// 1188   * enable this channel using TIM2_CCxCmd and TIM2_CCxNCmd functions.
// 1189   * @param  TIM2_Channel : Specifies the TIM2 Channel.
// 1190   *   This parameter can be one of the @ref TIM2_Channel_TypeDef enumeration
// 1191   * @param  TIM2_OCMode : Specifies the TIM2 Output Compare Mode.
// 1192   *   This parameter can be one of the @ref TIM2_OCMode_TypeDef enumeration.
// 1193   * @retval None
// 1194   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1195 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
// 1196                      TIM2_OCMode_TypeDef TIM2_OCMode)
// 1197 {
// 1198   /* Check the parameters */
// 1199   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
// 1200   assert_param(IS_TIM2_OCM(TIM2_OCMode));
// 1201 
// 1202   if (TIM2_Channel == TIM2_Channel_1)
TIM2_SelectOCxM:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JRNE      L:??TIM2_SelectOCxM_0
// 1203   {
// 1204     /* Disable the Channel 1: Reset the CCE Bit */
// 1205     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x525b, #0x0
// 1206 
// 1207     /* Reset the Output Compare Bits */
// 1208     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
        LD        A, #0x8f
        AND       A, L:0x5259
        LD        L:0x5259, A
// 1209 
// 1210     /* Set the Ouput Compare Mode */
// 1211     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
        LD        A, S:?b0
        OR        A, L:0x5259
        LD        L:0x5259, A
        RET
// 1212   }
// 1213   else /* if (TIM2_Channel == TIM2_Channel_2) */
// 1214   {
// 1215     /* Disable the Channel 2: Reset the CCE Bit */
// 1216     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
??TIM2_SelectOCxM_0:
        BRES      L:0x525b, #0x4
// 1217 
// 1218     /* Reset the Output Compare Bits */
// 1219     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
        LD        A, #0x8f
        AND       A, L:0x525a
        LD        L:0x525a, A
// 1220 
// 1221     /* Set the Ouput Compare Mode */
// 1222     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
        LD        A, S:?b0
        OR        A, L:0x525a
        LD        L:0x525a, A
// 1223   }
// 1224 }
        RET
// 1225 
// 1226 /**
// 1227   * @brief  Sets the TIM2 Counter Register value.
// 1228   * @param  Counter : Specifies the Counter register new value.
// 1229   *   This parameter is between 0x0000 and 0xFFFF.
// 1230   * @retval None
// 1231   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1232 void TIM2_SetCounter(uint16_t Counter)
// 1233 {
TIM2_SetCounter:
        LDW       Y, X
// 1234 
// 1235   /* Set the Counter Register value */
// 1236   TIM2->CNTRH = (uint8_t)(Counter >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x525c, A
// 1237   TIM2->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x525d, A
// 1238 }
        RET
// 1239 
// 1240 /**
// 1241   * @brief  Sets the TIM2 Autoreload Register value.
// 1242   * @param  Autoreload : Specifies the Autoreload register new value.
// 1243   *   This parameter is between 0x0000 and 0xFFFF.
// 1244   * @retval None
// 1245   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1246 void TIM2_SetAutoreload(uint16_t Autoreload)
// 1247 {
TIM2_SetAutoreload:
        LDW       Y, X
// 1248   /* Set the Autoreload Register value */
// 1249   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x525f, A
// 1250   TIM2->ARRL = (uint8_t)(Autoreload);
        LD        A, YL
        LD        L:0x5260, A
// 1251 }
        RET
// 1252 
// 1253 /**
// 1254   * @brief  Sets the TIM2 Capture Compare1 Register value.
// 1255   * @param  Compare : Specifies the Capture Compare1 register new value.
// 1256   *   This parameter is between 0x0000 and 0xFFFF.
// 1257   * @retval None
// 1258   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1259 void TIM2_SetCompare1(uint16_t Compare)
// 1260 {
TIM2_SetCompare1:
        LDW       Y, X
// 1261   /* Set the Capture Compare1 Register value */
// 1262   TIM2->CCR1H = (uint8_t)(Compare >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5261, A
// 1263   TIM2->CCR1L = (uint8_t)(Compare);
        LD        A, YL
        LD        L:0x5262, A
// 1264 }
        RET
// 1265 
// 1266 /**
// 1267   * @brief  Sets the TIM2 Capture Compare2 Register value.
// 1268   * @param  Compare : Specifies the Capture Compare2 register new value.
// 1269   *   This parameter is between 0x0000 and 0xFFFF.
// 1270   * @retval None
// 1271   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1272 void TIM2_SetCompare2(uint16_t Compare)
// 1273 {
TIM2_SetCompare2:
        LDW       Y, X
// 1274   /* Set the Capture Compare2 Register value */
// 1275   TIM2->CCR2H = (uint8_t)(Compare >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5263, A
// 1276   TIM2->CCR2L = (uint8_t)(Compare);
        LD        A, YL
        LD        L:0x5264, A
// 1277 }
        RET
// 1278 
// 1279 /**
// 1280   * @brief  Sets the TIM2 Input Capture 1 prescaler.
// 1281   * @param  TIM2_IC1Prescaler : Specifies the Input Capture prescaler new value
// 1282   *   This parameter can be one of the @ref TIM2_ICPSC_TypeDef enumeration.
// 1283   * @retval None
// 1284   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1285 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
// 1286 {
TIM2_SetIC1Prescaler:
        LD        S:?b0, A
// 1287   uint8_t tmpccmr1 = 0;
// 1288 
// 1289   /* Check the parameters */
// 1290   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
// 1291 
// 1292   tmpccmr1 = TIM2->CCMR1;
        LD        A, L:0x5259
// 1293 
// 1294   /* Reset the IC1PSC Bits */
// 1295   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
// 1296 
// 1297   /* Set the IC1PSC value */
// 1298   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
// 1299 
// 1300   TIM2->CCMR1 = tmpccmr1;
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5259, A
// 1301 }
        RET
// 1302 
// 1303 /**
// 1304   * @brief  Sets the TIM2 Input Capture 2 prescaler.
// 1305   * @param  TIM2_IC2Prescaler : Specifies the Input Capture prescaler new value
// 1306   *   This parameter can be one of the @ref TIM2_ICPSC_TypeDef enumeration.
// 1307   * @retval None
// 1308   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1309 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
// 1310 {
TIM2_SetIC2Prescaler:
        LD        S:?b0, A
// 1311   uint8_t tmpccmr2 = 0;
// 1312 
// 1313   /* Check the parameters */
// 1314   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
// 1315 
// 1316   tmpccmr2 = TIM2->CCMR2;
        LD        A, L:0x525a
// 1317 
// 1318   /* Reset the IC2PSC Bits */
// 1319   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
// 1320 
// 1321   /* Set the IC2PSC value */
// 1322   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
// 1323 
// 1324   TIM2->CCMR2 = tmpccmr2;
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x525a, A
// 1325 }
        RET
// 1326 
// 1327 /**
// 1328   * @brief  Gets the TIM2 Input Capture 1 value.
// 1329   * @param  None
// 1330   * @retval Capture Compare 1 Register value.
// 1331   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1332 uint16_t TIM2_GetCapture1(void)
// 1333 {
// 1334   uint16_t tmpccr1 = 0;
// 1335   uint8_t tmpccr1l, tmpccr1h;
// 1336 
// 1337   tmpccr1h = TIM2->CCR1H;
TIM2_GetCapture1:
        LD        A, L:0x5261
        LD        S:?b1, A
// 1338   tmpccr1l = TIM2->CCR1L;
        LD        A, L:0x5262
        LD        S:?b0, A
// 1339 
// 1340   tmpccr1 = (uint16_t)(tmpccr1l);
// 1341   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
// 1342   /* Get the Capture 1 Register value */
// 1343   return ((uint16_t)tmpccr1);
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
// 1344 }
// 1345 
// 1346 /**
// 1347   * @brief  Gets the TIM2 Input Capture 2 value.
// 1348   * @param  None
// 1349   * @retval Capture Compare 2 Register value.
// 1350   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1351 uint16_t TIM2_GetCapture2(void)
// 1352 {
// 1353   uint16_t tmpccr2 = 0;
// 1354   uint8_t tmpccr2l, tmpccr2h;
// 1355 
// 1356   tmpccr2h = TIM2->CCR2H;
TIM2_GetCapture2:
        LD        A, L:0x5263
        LD        S:?b1, A
// 1357   tmpccr2l = TIM2->CCR2L;
        LD        A, L:0x5264
        LD        S:?b0, A
// 1358 
// 1359   tmpccr2 = (uint16_t)(tmpccr2l);
// 1360   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
// 1361   /* Get the Capture 2 Register value */
// 1362   return ((uint16_t)tmpccr2);
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
// 1363 }
// 1364 
// 1365 /**
// 1366   * @brief  Gets the TIM2 Counter value.
// 1367   * @param  None
// 1368   * @retval Counter Register value.
// 1369   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1370 uint16_t TIM2_GetCounter(void)
// 1371 {
// 1372   uint16_t tmpcnt = 0;
// 1373   uint8_t tmpcntrl, tmpcntrh;
// 1374 
// 1375   tmpcntrh = TIM2->CNTRH;
TIM2_GetCounter:
        LD        A, L:0x525c
        LD        S:?b1, A
// 1376   tmpcntrl = TIM2->CNTRL;
        LD        A, L:0x525d
        LD        S:?b0, A
// 1377 
// 1378   tmpcnt = (uint16_t)(tmpcntrl);
// 1379   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
// 1380   /* Get the Counter Register value */
// 1381   return ((uint16_t)tmpcnt);
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
// 1382 }
// 1383 
// 1384 /**
// 1385   * @brief  Gets the TIM2 Prescaler value.
// 1386   * @param  None
// 1387   * @retval TIM2_Prescaler_TypeDef : Prescaler Register value.
// 1388   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1389 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
// 1390 {
// 1391   /* Get the Prescaler Register value */
// 1392   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
TIM2_GetPrescaler:
        LD        A, L:0x525e
        RET
// 1393 }
// 1394 
// 1395 /**
// 1396   * @brief  Selects the TIM2 peripheral Capture Compare DMA source.
// 1397   * @param   NewState: new state of the Capture Compare DMA source.
// 1398   *   This parameter can be: ENABLE or DISABLE.
// 1399   * @retval None
// 1400   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1401 void TIM2_SelectCCDMA(FunctionalState NewState)
// 1402 {
// 1403   /* Check the parameters */
// 1404   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1405 
// 1406   if (NewState != DISABLE)
TIM2_SelectCCDMA:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM2_SelectCCDMA_0
// 1407   {
// 1408     /* Set the CCDS Bit */
// 1409     TIM2->CR2 |= TIM_CR2_CCDS;
        BSET      L:0x5251, #0x3
        RET
// 1410   }
// 1411   else
// 1412   {
// 1413     /* Reset the CCDS Bit */
// 1414     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
??TIM2_SelectCCDMA_0:
        BRES      L:0x5251, #0x3
// 1415   }
// 1416 }
        RET
// 1417 
// 1418 /**
// 1419   * @brief  Checks whether the specified TIM2 flag is set or not.
// 1420   * @param  TIM2_FLAG : Specifies the flag to check.
// 1421   *   This parameter can be one of the @ref TIM2_FLAG_TypeDef enumeration.
// 1422   * @retval FlagStatus : The new state of TIM2_FLAG.
// 1423   *   This parameter can be any of the @ref FlagStatus enumeration.
// 1424   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1425 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
// 1426 {
TIM2_GetFlagStatus:
        LDW       Y, X
// 1427   FlagStatus bitstatus = RESET;
// 1428   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
// 1429 
// 1430   /* Check the parameters */
// 1431   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
// 1432 
// 1433   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
        LD        A, L:0x5256
        LD        S:?b1, A
// 1434   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
        LD        A, L:0x5257
        LD        S:?b0, A
// 1435 
// 1436   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
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
        JREQ      L:??TIM2_GetFlagStatus_0
// 1437   {
// 1438     bitstatus = SET;
        LD        A, #0x1
        RET
// 1439   }
// 1440   else
// 1441   {
// 1442     bitstatus = RESET;
??TIM2_GetFlagStatus_0:
        CLR       A
// 1443   }
// 1444   return ((FlagStatus)bitstatus);
        RET
// 1445 }
// 1446 
// 1447 /**
// 1448   * @brief  Clears the TIM’s pending flags.
// 1449   * @param  TIM2_FLAG : Specifies the flag to clear.
// 1450   *   This parameter can be one of the @ref TIM2_FLAG_TypeDef enumeration.
// 1451   * @retval None
// 1452   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1453 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
// 1454 {
// 1455   /* Check the parameters */
// 1456   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
// 1457   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 1458   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
TIM2_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5256, A
// 1459   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
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
        LD        L:0x5257, A
// 1460 }
        RET
// 1461 
// 1462 /**
// 1463   * @brief  Checks whether the TIM2 interrupt has occurred or not.
// 1464   * @param  TIM2_IT : Specifies the TIM2 interrupt source to check.
// 1465   *   This parameter can be one of the @ref TIM2_IT_TypeDef enumeration.
// 1466   * @retval ITStatus : The new state of the TIM2_IT.
// 1467   *   This parameter can be any of the @ref ITStatus enumeration.
// 1468   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1469 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
// 1470 {
TIM2_GetITStatus:
        LD        S:?b0, A
// 1471   ITStatus bitstatus = RESET;
// 1472 
// 1473   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
// 1474 
// 1475   /* Check the parameters */
// 1476   assert_param(IS_TIM2_GET_IT(TIM2_IT));
// 1477 
// 1478   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
        LD        A, L:0x5256
        LD        S:?b1, A
// 1479 
// 1480   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
        LD        A, S:?b0
        AND       A, L:0x5255
        LD        S:?b2, A
// 1481 
// 1482   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
        LD        A, S:?b0
        AND       A, S:?b1
        JREQ      L:??TIM2_GetITStatus_0
        CLR       A
        CP        A, S:?b2
        JREQ      L:??TIM2_GetITStatus_0
// 1483   {
// 1484     bitstatus = (ITStatus)SET;
        LD        A, #0x1
        RET
// 1485   }
// 1486   else
// 1487   {
// 1488     bitstatus = (ITStatus)RESET;
??TIM2_GetITStatus_0:
        CLR       A
// 1489   }
// 1490   return ((ITStatus)bitstatus);
        RET
// 1491 }
// 1492 
// 1493 /**
// 1494   * @brief  Clears the TIM's interrupt pending bits.
// 1495   * @param  TIM2_IT : Specifies the pending bit to clear.
// 1496   *   This parameter can be one of the @ref TIM2_IT_TypeDef enumeration.
// 1497   * @retval None
// 1498   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1499 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
// 1500 {
// 1501   /* Check the parameters */
// 1502   assert_param(IS_TIM2_IT(TIM2_IT));
// 1503 
// 1504   /* Clear the IT pending Bit */
// 1505   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
TIM2_ClearITPendingBit:
        CPL       A
        LD        L:0x5256, A
// 1506 }
        RET
// 1507 
// 1508 /**
// 1509   * @brief  Configure the TI1 as Input.
// 1510   * @param  TIM2_ICPolarity : The Input Polarity.
// 1511   *   This parameter can be one of the @ref TIM2_ICPolarity_TypeDef enumeration.
// 1512   * @param  TIM2_ICSelection : Specifies the input to be used.
// 1513   *   This parameter can be one of the @ref TIM2_ICSelection_TypeDef enumeration.
// 1514   * @param  TIM2_ICFilter : Specifies the Input Capture Filter.
// 1515   *   This parameter must be a value between 0x00 and 0x0F.
// 1516   * @retval None
// 1517   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1518 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \ 
// 1519                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \ 
// 1520                        uint8_t TIM2_ICFilter)
// 1521 {
TI1_Config:
        LD        S:?b2, A
// 1522   uint8_t tmpccmr1 = 0;
// 1523   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
// 1524   tmpccmr1 = TIM2->CCMR1;
        LD        A, L:0x5259
// 1525 
// 1526   /* Check the parameters */
// 1527   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
// 1528   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
// 1529   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
// 1530 
// 1531   /* Disable the Channel 1: Reset the CCE Bit */
// 1532   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x525b, #0x0
// 1533 
// 1534   /* Select the Input and set the filter */
// 1535   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
// 1536   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
// 1537 
// 1538   TIM2->CCMR1 = tmpccmr1;
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b3, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b3
        OR        A, S:?b0
        LD        L:0x5259, A
// 1539 
// 1540   /* Select the Polarity */
// 1541   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TI1_Config_0
// 1542   {
// 1543     TIM2->CCER1 |= TIM_CCER1_CC1P;
        BSET      L:0x525b, #0x1
        JRA       L:??TI1_Config_1
// 1544   }
// 1545   else
// 1546   {
// 1547     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x525b, #0x1
// 1548   }
// 1549 
// 1550   /* Set the CCE Bit */
// 1551   TIM2->CCER1 |=  TIM_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x525b, #0x0
// 1552 }
        RET
// 1553 
// 1554 /**
// 1555   * @brief  Configure the TI2 as Input.
// 1556   * @param  TIM2_ICPolarity : The Input Polarity.
// 1557   *   This parameter can be one of the @ref TIM2_ICPolarity_TypeDef enumeration.
// 1558   * @param  TIM2_ICSelection : Specifies the input to be used.
// 1559   *   This parameter can be one of the @ref TIM2_ICSelection_TypeDef enumeration.
// 1560   * @param  TIM2_ICFilter : Specifies the Input Capture Filter.
// 1561   *   This parameter must be a value between 0x00 and 0x0F.
// 1562   * @retval None
// 1563   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1564 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
// 1565                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
// 1566                        uint8_t TIM2_ICFilter)
// 1567 {
TI2_Config:
        LD        S:?b2, A
// 1568   uint8_t tmpccmr2 = 0;
// 1569   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
// 1570 
// 1571   /* Check the parameters */
// 1572   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
// 1573   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
// 1574   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
// 1575 
// 1576   tmpccmr2 = TIM2->CCMR2;
        LD        A, L:0x525a
// 1577 
// 1578   /* Disable the Channel 2: Reset the CCE Bit */
// 1579   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
        BRES      L:0x525b, #0x4
// 1580 
// 1581   /* Select the Input and set the filter */
// 1582   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
// 1583   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
// 1584 
// 1585   TIM2->CCMR2 = tmpccmr2;
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b3, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b3
        OR        A, S:?b0
        LD        L:0x525a, A
// 1586 
// 1587   /* Select the Polarity */
// 1588   if (tmpicpolarity == TIM2_ICPolarity_Falling)
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TI2_Config_0
// 1589   {
// 1590     TIM2->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x525b, #0x5
        JRA       L:??TI2_Config_1
// 1591   }
// 1592   else
// 1593   {
// 1594     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TI2_Config_0:
        BRES      L:0x525b, #0x5
// 1595   }
// 1596 
// 1597   /* Set the CCE Bit */
// 1598   TIM2->CCER1 |=  TIM_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x525b, #0x4
// 1599 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1600 /**
// 1601   * @}
// 1602   */
// 1603 
// 1604 /**
// 1605   * @}
// 1606   */
// 1607 
// 1608 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 1 677 bytes in section .near_func.text
// 
// 1 677 bytes of CODE memory
//
//Errors: none
//Warnings: none
