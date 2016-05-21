///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:42 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim5.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim5.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_tim5.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_tim5

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

        PUBLIC TIM5_ARRPreloadConfig
        PUBLIC TIM5_BKRConfig
        PUBLIC TIM5_CCxCmd
        PUBLIC TIM5_ClearFlag
        PUBLIC TIM5_ClearITPendingBit
        PUBLIC TIM5_Cmd
        PUBLIC TIM5_CounterModeConfig
        PUBLIC TIM5_CtrlPWMOutputs
        PUBLIC TIM5_DMACmd
        PUBLIC TIM5_DeInit
        PUBLIC TIM5_ETRClockMode1Config
        PUBLIC TIM5_ETRClockMode2Config
        PUBLIC TIM5_ETRConfig
        PUBLIC TIM5_EncoderInterfaceConfig
        PUBLIC TIM5_ForcedOC1Config
        PUBLIC TIM5_ForcedOC2Config
        PUBLIC TIM5_GenerateEvent
        PUBLIC TIM5_GetCapture1
        PUBLIC TIM5_GetCapture2
        PUBLIC TIM5_GetCounter
        PUBLIC TIM5_GetFlagStatus
        PUBLIC TIM5_GetITStatus
        PUBLIC TIM5_GetPrescaler
        PUBLIC TIM5_ICInit
        PUBLIC TIM5_ITConfig
        PUBLIC TIM5_InternalClockConfig
        PUBLIC TIM5_OC1FastCmd
        PUBLIC TIM5_OC1Init
        PUBLIC TIM5_OC1PolarityConfig
        PUBLIC TIM5_OC1PreloadConfig
        PUBLIC TIM5_OC2FastCmd
        PUBLIC TIM5_OC2Init
        PUBLIC TIM5_OC2PolarityConfig
        PUBLIC TIM5_OC2PreloadConfig
        PUBLIC TIM5_PWMIConfig
        PUBLIC TIM5_PrescalerConfig
        PUBLIC TIM5_SelectCCDMA
        PUBLIC TIM5_SelectHallSensor
        PUBLIC TIM5_SelectInputTrigger
        PUBLIC TIM5_SelectMasterSlaveMode
        PUBLIC TIM5_SelectOCxM
        PUBLIC TIM5_SelectOnePulseMode
        PUBLIC TIM5_SelectOutputTrigger
        PUBLIC TIM5_SelectSlaveMode
        PUBLIC TIM5_SetAutoreload
        PUBLIC TIM5_SetCompare1
        PUBLIC TIM5_SetCompare2
        PUBLIC TIM5_SetCounter
        PUBLIC TIM5_SetIC1Prescaler
        PUBLIC TIM5_SetIC2Prescaler
        PUBLIC TIM5_TIxExternalClockConfig
        PUBLIC TIM5_TimeBaseInit
        PUBLIC TIM5_UpdateDisableConfig
        PUBLIC TIM5_UpdateRequestConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_tim5.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_TIM5.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the TIM5 firmware functions.
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
//   22 #include "stm8l15x_TIM5.h"
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
//   33 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
//   34                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
//   35                        uint8_t TIM5_ICFilter);
//   36 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
//   37                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
//   38                        uint8_t TIM5_ICFilter);
//   39 
//   40 
//   41 /**
//   42   * @addtogroup TIM5_Public_Functions
//   43   * @{
//   44   */
//   45 
//   46 /**
//   47   * @brief  Deinitializes the TIM5 peripheral registers to their default reset values.
//   48   * @param  None
//   49   * @retval None
//   50   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51 void TIM5_DeInit(void)
//   52 {
//   53   TIM5->CR1 = TIM_CR1_RESET_VALUE;
TIM5_DeInit:
        CLR       A
        LD        L:0x5300, A
//   54   TIM5->CR2 = TIM_CR2_RESET_VALUE;
        LD        L:0x5301, A
//   55   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
        LD        L:0x5302, A
//   56   TIM5->ETR = TIM_ETR_RESET_VALUE;
        LD        L:0x5303, A
//   57   TIM5->IER = TIM_IER_RESET_VALUE;
        LD        L:0x5305, A
//   58   TIM5->SR2 = TIM_SR2_RESET_VALUE;
        LD        L:0x5307, A
//   59 
//   60   /* Disable channels */
//   61   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
        LD        L:0x530b, A
//   62   /* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
//   63   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
        LD        A, #0x1
        LD        L:0x5309, A
//   64   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
        LD        L:0x530a, A
//   65 
//   66   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   67   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
        CLR       A
        LD        L:0x530b, A
//   68   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
        LD        L:0x5309, A
//   69   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
        LD        L:0x530a, A
//   70 
//   71   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
        LD        L:0x530c, A
//   72   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
        LD        L:0x530d, A
//   73 
//   74   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
        LD        L:0x530e, A
//   75 
//   76   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x530f, A
//   77   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
        LD        L:0x5310, A
//   78 
//   79   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
        CLR       A
        LD        L:0x5311, A
//   80   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
        LD        L:0x5312, A
//   81   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
        LD        L:0x5313, A
//   82   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
        LD        L:0x5314, A
//   83 
//   84 
//   85   TIM5->OISR = TIM_OISR_RESET_VALUE;
        LD        L:0x5316, A
//   86   TIM5->EGR = 0x01;/* TIM_EGR_UG */
        LD        A, #0x1
        LD        L:0x5308, A
//   87   TIM5->BKR = TIM_BKR_RESET_VALUE;
        CLR       A
        LD        L:0x5315, A
//   88   TIM5->SR1 = TIM_SR1_RESET_VALUE;
        LD        L:0x5306, A
//   89 }
        RET
//   90 
//   91 /**
//   92   * @brief  Initializes the TIM5 Time Base Unit according to the specified  parameters.
//   93   * @param  TIM5_Prescaler : This parameter can be any member of the @Ref TIM5_Prescaler_TypeDef enumeration.
//   94   * @param  TIM5_CounterMode : This parameter can be any member of the @Ref TIM5_CounterMode_TypeDef enumeration.
//   95   * @param  TIM5_Period : This parameter must be a value between 0x0000 and 0xFFFF.
//   96   * @retval None
//   97   */
//   98 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
//  100                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
//  101                        uint16_t TIM5_Period)
//  102 {
TIM5_TimeBaseInit:
        LD        S:?b1, A
        LDW       Y, X
//  103 
//  104   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
//  105   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
//  106 
//  107 
//  108 
//  109   /* Set the Autoreload value */
//  110   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x530f, A
//  111   TIM5->ARRL = (uint8_t)(TIM5_Period);
        LD        A, YL
        LD        L:0x5310, A
//  112 
//  113   /* Set the Prescaler value */
//  114   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
        LD        A, S:?b1
        LD        L:0x530e, A
//  115 
//  116   /* Select the Counter Mode */
//  117   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
        LD        A, #0x8f
        AND       A, L:0x5300
        LD        L:0x5300, A
//  118   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
        LD        A, S:?b0
        OR        A, L:0x5300
        LD        L:0x5300, A
//  119 
//  120   /* Generate an update event to reload the Prescaler value immediately */
//  121   TIM5->EGR = TIM5_EventSource_Update;
        LD        A, #0x1
        LD        L:0x5308, A
//  122 }
        RET
//  123 
//  124 /**
//  125   * @brief  Initializes the TIM5 Channel1 according to the specified parameters.
//  126   * @param  TIM5_OCMode : This parameter can be any member of the @Ref TIM5_OCMode_TypeDef enumeration.
//  127   * @param  TIM5_OutputState : This parameter can be any member of the @Ref TIM5_OutputState_TypeDef enumeration.
//  128   * @param  TIM5_Pulse : This parameter must be a value between 0x0000 and 0xFFFF.
//  129   * @param  TIM5_OCPolarity : This parameter can be any member of the @Ref TIM5_OCPolarity_TypeDef enumeration.
//  130   * @param  TIM5_OCIdleState : This parameter can be any member of the @Ref TIM5_OCIdleState_TypeDef  enumeration.
//  131   * @retval None
//  132   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
//  134                   TIM5_OutputState_TypeDef TIM5_OutputState,
//  135                   uint16_t TIM5_Pulse,
//  136                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
//  137                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
//  138 {
TIM5_OC1Init:
        LD        S:?b3, A
        LDW       Y, X
//  139   uint8_t tmpccmr1 = 0;
//  140 
//  141   /* Check the parameters */
//  142   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
//  143   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
//  144   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
//  145   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
//  146 
//  147   tmpccmr1 = TIM5->CCMR1;
        LD        A, L:0x5309
//  148 
//  149   /* Disable the Channel 1: Reset the CCE Bit */
//  150   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x530b, #0x0
//  151   /* Reset the Output Compare Bits */
//  152   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
//  153 
//  154   /* Set the Ouput Compare Mode */
//  155   tmpccmr1 |= (uint8_t)TIM5_OCMode;
//  156 
//  157   TIM5->CCMR1 = tmpccmr1;
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x5309, A
//  158 
//  159   /* Set the Output State */
//  160   if (TIM5_OutputState == TIM5_OutputState_Enable)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM5_OC1Init_0
//  161   {
//  162     TIM5->CCER1 |= TIM_CCER1_CC1E;
        BSET      L:0x530b, #0x0
        JRA       L:??TIM5_OC1Init_1
//  163   }
//  164   else
//  165   {
//  166     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
??TIM5_OC1Init_0:
        BRES      L:0x530b, #0x0
//  167   }
//  168 
//  169   /* Set the Output Polarity */
//  170   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
??TIM5_OC1Init_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM5_OC1Init_2
//  171   {
//  172     TIM5->CCER1 |= TIM_CCER1_CC1P;
        BSET      L:0x530b, #0x1
        JRA       L:??TIM5_OC1Init_3
//  173   }
//  174   else
//  175   {
//  176     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
??TIM5_OC1Init_2:
        BRES      L:0x530b, #0x1
//  177   }
//  178 
//  179   /* Set the Output Idle state */
//  180   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
??TIM5_OC1Init_3:
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TIM5_OC1Init_4
//  181   {
//  182     TIM5->OISR |= TIM_OISR_OIS1;
        BSET      L:0x5316, #0x0
        JRA       L:??TIM5_OC1Init_5
//  183   }
//  184   else
//  185   {
//  186     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
??TIM5_OC1Init_4:
        BRES      L:0x5316, #0x0
//  187   }
//  188 
//  189   /* Set the Pulse value */
//  190   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
??TIM5_OC1Init_5:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5311, A
//  191   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
        LD        A, YL
        LD        L:0x5312, A
//  192 }
        RET
//  193 
//  194 /**
//  195   * @brief  Initializes the TIM5 Channel2 according to the specified parameters.
//  196   * @param  TIM5_OCMode : This parameter can be any member of the @Ref TIM5_OCMode_TypeDef enumeration.
//  197   * @param  TIM5_OutputState : This parameter can be any member of the @Ref TIM5_OutputState_TypeDef enumeration.
//  198   * @param  TIM5_Pulse : This parameter must be a value between 0x0000 and 0xFFFF.
//  199   * @param  TIM5_OCPolarity : This parameter can be any member of the @Ref TIM5_OCPolarity_TypeDef enumeration.
//  200   * @param  TIM5_OCIdleState : This parameter can be any member of the @Ref TIM5_OCIdleState_TypeDef  enumeration.
//  201   * @retval None
//  202   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  203 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
//  204                   TIM5_OutputState_TypeDef TIM5_OutputState,
//  205                   uint16_t TIM5_Pulse,
//  206                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
//  207                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
//  208 {
TIM5_OC2Init:
        LD        S:?b3, A
        LDW       Y, X
//  209   uint8_t tmpccmr2 = 0;
//  210 
//  211   /* Check the parameters */
//  212   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
//  213   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
//  214   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
//  215   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
//  216 
//  217   tmpccmr2 = TIM5->CCMR2;
        LD        A, L:0x530a
//  218 
//  219   /* Disable the Channel 2: Reset the CCE Bit */
//  220   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
        BRES      L:0x530b, #0x4
//  221 
//  222   /* Reset the Output Compare Bits */
//  223   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
//  224 
//  225   /* Set the Ouput Compare Mode */
//  226   tmpccmr2 |= (uint8_t)TIM5_OCMode;
//  227 
//  228   TIM5->CCMR2 = tmpccmr2;
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x530a, A
//  229 
//  230   /* Set the Output State */
//  231   if (TIM5_OutputState == TIM5_OutputState_Enable)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM5_OC2Init_0
//  232   {
//  233     TIM5->CCER1 |= TIM_CCER1_CC2E;
        BSET      L:0x530b, #0x4
        JRA       L:??TIM5_OC2Init_1
//  234   }
//  235   else
//  236   {
//  237     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
??TIM5_OC2Init_0:
        BRES      L:0x530b, #0x4
//  238   }
//  239 
//  240   /* Set the Output Polarity */
//  241   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
??TIM5_OC2Init_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM5_OC2Init_2
//  242   {
//  243     TIM5->CCER1 |= TIM_CCER1_CC2P;
        BSET      L:0x530b, #0x5
        JRA       L:??TIM5_OC2Init_3
//  244   }
//  245   else
//  246   {
//  247     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
??TIM5_OC2Init_2:
        BRES      L:0x530b, #0x5
//  248   }
//  249 
//  250 
//  251   /* Set the Output Idle state */
//  252   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
??TIM5_OC2Init_3:
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TIM5_OC2Init_4
//  253   {
//  254     TIM5->OISR |= TIM_OISR_OIS2;
        BSET      L:0x5316, #0x2
        JRA       L:??TIM5_OC2Init_5
//  255   }
//  256   else
//  257   {
//  258     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
??TIM5_OC2Init_4:
        BRES      L:0x5316, #0x2
//  259   }
//  260 
//  261   /* Set the Pulse value */
//  262   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
??TIM5_OC2Init_5:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5313, A
//  263   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
        LD        A, YL
        LD        L:0x5314, A
//  264 }
        RET
//  265 
//  266 /**
//  267   * @brief  Configures the Break feature, dead time, Lock level, the OSSI,
//  268   * and the AOE(automatic output enable).
//  269   * @param  TIM5_OSSIState : Off-State Selection for Idle mode states.
//  270   *   This parameter can be any member of the @Ref TIM5_OSSIState_TypeDef enumeration.
//  271   * @param  TIM5_LockLevel : Lock level.
//  272   *   This parameter can be any member of the @Ref TIM5_LockLevel_TypeDef enumeration.
//  273   * @param  TIM5_BreakState : Break Input enable/disable .
//  274   *   This parameter can be any member of the @Ref TIM5_BreakState_TypeDef enumeration.
//  275   * @param  TIM5_BreakPolarity : Break Polarity.
//  276   *   This parameter can be any member of the @Ref TIM5_BreakPolarity_TypeDef enumeration.
//  277   * @param  TIM5_AutomaticOutput : TIM5 AOE Bit Set/Reset .
//  278   *   This parameter can be anymember  of the @Ref TIM5_AutomaticOutput_TypeDef enumeration.
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
//  282                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
//  283                     TIM5_BreakState_TypeDef TIM5_BreakState,
//  284                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
//  285                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
//  286 
//  287 {
//  288   /* Check the parameters */
//  289   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
//  290   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
//  291   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
//  292   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
//  293   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
//  294 
//  295 
//  296 
//  297   /* Set the Lock level, the Break enable Bit and the Ploarity, the OSSI State,
//  298   the dead time value and the Automatic Output Enable Bit */
//  299   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \ 
//  300                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \ 
//  301                                   TIM5_AutomaticOutput));
TIM5_BKRConfig:
        LD        S:?b4, A
        LD        A, S:?b0
        OR        A, S:?b4
        OR        A, S:?b1
        OR        A, S:?b2
        OR        A, S:?b3
        LD        L:0x5315, A
//  302 }
        RET
//  303 
//  304 /**
//  305   * @brief  Initializes the TIM5 peripheral according to the specified parameters.
//  306   * @param  TIM5_Channel : This parameter can be any member of the @Ref TIM5_Channel_TypeDef enumeration.
//  307   * @param  TIM5_ICPolarity : This parameter can be any member of the @Ref TIM5_ICPolarity_TypeDef enumeration.
//  308   * @param  TIM5_ICSelection : This parameter can be any member of the @Ref TIM5_ICSelection_TypeDef enumeration.
//  309   * @param  TIM5_ICPrescaler : This parameter can be any member of the @Ref TIM5_ICPSC_TypeDef enumeration.
//  310   * @param  TIM5_ICFilter : This parameter must be a value between 0x00 and 0x0F.
//  311   * @retval None
//  312   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  313 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
//  314                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
//  315                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
//  316                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
//  317                  uint8_t TIM5_ICFilter)
//  318 {
TIM5_ICInit:
        LD        S:?b5, A
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b6, S:?b2
        MOV       S:?b1, S:?b3
//  319   /* Check the parameters */
//  320   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
//  321 
//  322   if (TIM5_Channel == TIM5_Channel_1)
        CLR       A
        CP        A, S:?b5
        JRNE      L:??TIM5_ICInit_0
//  323   {
//  324     /* TI1 Configuration */
//  325     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
        LD        A, S:?b4
        CALL      L:TI1_Config
//  326 
//  327     /* Set the Input Capture Prescaler value */
//  328     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
        LD        A, L:0x5309
        AND       A, #0xf3
        OR        A, S:?b6
        LD        L:0x5309, A
//  329   }
        RET
//  330   else /* if (TIM5_Channel == TIM5_Channel_2) */
//  331   {
//  332     /* TI2 Configuration */
//  333     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
??TIM5_ICInit_0:
        LD        A, S:?b4
        CALL      L:TI2_Config
//  334 
//  335     /* Set the Input Capture Prescaler value */
//  336     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
        LD        A, L:0x530a
        AND       A, #0xf3
        OR        A, S:?b6
        LD        L:0x530a, A
//  337   }
//  338 }
        RET
//  339 
//  340 /**
//  341   * @brief  Configures the TIM5 peripheral in PWM Input Mode according to the
//  342   * specified parameters.
//  343   * @param  TIM5_Channel : This parameter can be any member of the @Ref TIM5_Channel_TypeDef enumeration.
//  344   * @param  TIM5_ICPolarity : This parameter can be any member of the @Ref TIM5_ICPolarity_TypeDef enumeration.
//  345   * @param  TIM5_ICSelection : This parameter can be any member of the @Ref TIM5_ICSelection_TypeDef enumeration.
//  346   * @param  TIM5_ICPrescaler : This parameter can be any member of the @Ref TIM5_ICPSC_TypeDef enumeration.
//  347   * @param  TIM5_ICFilter : This parameter must be a value between 0x00 and 0x0F.
//  348   * @retval None
//  349   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  350 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
//  351                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
//  352                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
//  353                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
//  354                      uint8_t TIM5_ICFilter)
//  355 {
TIM5_PWMIConfig:
        PUSH      L:?b9
        PUSH      L:?b8
        LD        S:?b8, A
        MOV       S:?b7, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b9, S:?b2
        MOV       S:?b5, S:?b3
//  356   uint8_t icpolarity = TIM5_ICPolarity_Rising;
//  357   uint8_t icselection = TIM5_ICSelection_DirectTI;
//  358 
//  359   /* Check the parameters */
//  360   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
//  361 
//  362   /* Select the Opposite Input Polarity */
//  363   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
        CLR       A
        CP        A, S:?b7
        JRNE      L:??TIM5_PWMIConfig_0
//  364   {
//  365     icpolarity = TIM5_ICPolarity_Falling;
        LD        A, #0x1
        LD        S:?b4, A
        JRA       L:??TIM5_PWMIConfig_1
//  366   }
//  367   else
//  368   {
//  369     icpolarity = TIM5_ICPolarity_Rising;
??TIM5_PWMIConfig_0:
        CLR       S:?b4
//  370   }
//  371 
//  372   /* Select the Opposite Input */
//  373   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
??TIM5_PWMIConfig_1:
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM5_PWMIConfig_2
//  374   {
//  375     icselection = TIM5_ICSelection_IndirectTI;
        LD        A, #0x2
        LD        S:?b6, A
        JRA       L:??TIM5_PWMIConfig_3
//  376   }
//  377   else
//  378   {
//  379     icselection = TIM5_ICSelection_DirectTI;
??TIM5_PWMIConfig_2:
        LD        A, #0x1
        LD        S:?b6, A
//  380   }
//  381 
//  382   if (TIM5_Channel == TIM5_Channel_1)
??TIM5_PWMIConfig_3:
        CLR       A
        CP        A, S:?b8
        MOV       S:?b1, S:?b5
        JRNE      L:??TIM5_PWMIConfig_4
//  383   {
//  384     /* TI1 Configuration */
//  385     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
//  386                TIM5_ICFilter);
        LD        A, S:?b7
        CALL      L:TI1_Config
//  387 
//  388     /* Set the Input Capture Prescaler value */
//  389     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
        LD        A, L:0x5309
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x5309, A
//  390 
//  391     /* TI2 Configuration */
//  392     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
        MOV       S:?b1, S:?b5
        MOV       S:?b0, S:?b6
        LD        A, S:?b4
        CALL      L:TI2_Config
//  393 
//  394     /* Set the Input Capture Prescaler value */
//  395     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
        LD        A, L:0x530a
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x530a, A
//  396   }
        JRA       L:??TIM5_PWMIConfig_5
//  397   else
//  398   {
//  399     /* TI2 Configuration */
//  400     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
//  401                TIM5_ICFilter);
??TIM5_PWMIConfig_4:
        LD        A, S:?b7
        CALL      L:TI2_Config
//  402 
//  403     /* Set the Input Capture Prescaler value */
//  404     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
        LD        A, L:0x530a
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x530a, A
//  405 
//  406     /* TI1 Configuration */
//  407     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
        MOV       S:?b1, S:?b5
        MOV       S:?b0, S:?b6
        LD        A, S:?b4
        CALL      L:TI1_Config
//  408 
//  409     /* Set the Input Capture Prescaler value */
//  410     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
        LD        A, L:0x5309
        AND       A, #0xf3
        OR        A, S:?b9
        LD        L:0x5309, A
//  411   }
//  412 }
??TIM5_PWMIConfig_5:
        POP       L:?b8
        POP       L:?b9
        RET
//  413 
//  414 /**
//  415   * @brief  Enables or disables the TIM5 peripheral.
//  416   * @param  NewState : The new state of the TIM5 peripheral.
//  417   *   This parameter can be any of the @ref FunctionalState enumeration.
//  418   * @retval None
//  419   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  420 void TIM5_Cmd(FunctionalState NewState)
//  421 {
//  422   /* Check the parameters */
//  423   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  424 
//  425   /* set or Reset the CEN Bit */
//  426   if (NewState != DISABLE)
TIM5_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_Cmd_0
//  427   {
//  428     TIM5->CR1 |= TIM_CR1_CEN;
        BSET      L:0x5300, #0x0
        RET
//  429   }
//  430   else
//  431   {
//  432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
??TIM5_Cmd_0:
        BRES      L:0x5300, #0x0
//  433   }
//  434 }
        RET
//  435 
//  436 /**
//  437   * @brief  Enables or disables the TIM5 peripheral Main Outputs.
//  438   * @param  NewState : The new state of the TIM5 peripheral.
//  439   *   This parameter can be any of the @ref FunctionalState enumeration.
//  440   * @retval None
//  441   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  442 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
//  443 {
//  444   /* Check the parameters */
//  445   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  446 
//  447   /* Set or Reset the MOE Bit */
//  448 
//  449   if (NewState != DISABLE)
TIM5_CtrlPWMOutputs:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_CtrlPWMOutputs_0
//  450   {
//  451     TIM5->BKR |= TIM_BKR_MOE ;
        BSET      L:0x5315, #0x7
        RET
//  452   }
//  453   else
//  454   {
//  455     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
??TIM5_CtrlPWMOutputs_0:
        BRES      L:0x5315, #0x7
//  456   }
//  457 }
        RET
//  458 
//  459 /**
//  460   * @brief  Enables or disables the specified TIM5 interrupts.
//  461   * @param  TIM5_IT : Specifies the TIM5 interrupts sources to be enabled or disabled.
//  462   *   This parameter can be any combination of the @ref TIM5_IT_TypeDef enumeration.
//  463   * @param  NewState : The new state of the TIM5 peripheral.
//  464   *   This parameter can be any of the @ref FunctionalState enumeration.
//  465   * @retval None
//  466   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  467 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
//  468 {
TIM5_ITConfig:
        LD        S:?b1, A
//  469   /* Check the parameters */
//  470   assert_param(IS_TIM5_IT(TIM5_IT));
//  471   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  472 
//  473   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM5_ITConfig_0
//  474   {
//  475     /* Enable the Interrupt sources */
//  476     TIM5->IER |= (uint8_t)TIM5_IT;
        LD        A, S:?b1
        OR        A, L:0x5305
        LD        L:0x5305, A
        RET
//  477   }
//  478   else
//  479   {
//  480     /* Disable the Interrupt sources */
//  481     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
??TIM5_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5305
        LD        L:0x5305, A
//  482   }
//  483 }
        RET
//  484 
//  485 /**
//  486   * @brief  Enables or disables the TIM5 DMA Requests.
//  487   * @param  TIM5_DMASources: specifies the DMA Request sources.
//  488   *   This parameter can be any combination of  @ref TIM5_DMASource_TypeDef enumeration.
//  489   * @param  NewState: new state of the DMA Request sources.
//  490   *   This parameter can be: ENABLE or DISABLE.
//  491   * @retval None
//  492   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  493 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
//  494 {
TIM5_DMACmd:
        LD        S:?b1, A
//  495   /* Check the parameters */
//  496   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  497   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
//  498 
//  499   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??TIM5_DMACmd_0
//  500   {
//  501     /* Enable the DMA sources */
//  502     TIM5->DER |= TIM5_DMASource;
        LD        A, S:?b1
        OR        A, L:0x5304
        LD        L:0x5304, A
        RET
//  503   }
//  504   else
//  505   {
//  506     /* Disable the DMA sources */
//  507     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
??TIM5_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5304
        LD        L:0x5304, A
//  508   }
//  509 }
        RET
//  510 
//  511 /**
//  512   * @brief  Enables the TIM5 internal Clock.
//  513   * @par Parameters:
//  514   * None
//  515   * @retval None
//  516   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  517 void TIM5_InternalClockConfig(void)
//  518 {
//  519   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  520   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
TIM5_InternalClockConfig:
        LD        A, #0xf8
        AND       A, L:0x5302
        LD        L:0x5302, A
//  521 }
        RET
//  522 
//  523 /**
//  524   * @brief  Configures the TIM5 External clock Mode1.
//  525   * @param  TIM5_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  526   *   This parameter can be one of @ref TIM5_ExtTRGPSC_TypeDef enumeration.
//  527   * @param  TIM5_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  528   *   This parameter can be one of @ref TIM5_ExtTRGPolarity_TypeDef enumeration.
//  529   * @param  ExtTRGFilter : Specifies the External Trigger Filter.
//  530   *   This parameter must be a value between 0x00 and 0x0F
//  531   * @retval None
//  532   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  533 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
//  534                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
//  535                               uint8_t ExtTRGFilter)
//  536 {
//  537   /* Configure the ETR Clock source */
//  538   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
TIM5_ETRClockMode1Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5303
        LD        L:0x5303, A
//  539 
//  540   /* Select the External clock mode1 */
//  541   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
        LD        A, #0xf8
        AND       A, L:0x5302
        LD        L:0x5302, A
//  542   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x5302
        LD        L:0x5302, A
//  543 
//  544   /* Select the Trigger selection : ETRF */
//  545   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
        LD        A, #0x8f
        AND       A, L:0x5302
        LD        L:0x5302, A
//  546   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
        LD        A, #0x70
        OR        A, L:0x5302
        LD        L:0x5302, A
//  547 }
        RET
//  548 
//  549 /**
//  550   * @brief  Configures the TIM5 External clock Mode2.
//  551   * @param  TIM5_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  552   *   This parameter can be one of the @ref TIM5_ExtTRGPSC_TypeDef enumeration.
//  553   * @param  TIM5_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  554   *   This parameter can be one of the @ref TIM5_ExtTRGPolarity_TypeDef enumeration.
//  555   * @param  ExtTRGFilter : Specifies the External Trigger Filter.
//  556   *   This parameter must be a value between 0x00 and 0x0F
//  557   * @retval None
//  558   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  559 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
//  560                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
//  561                               uint8_t ExtTRGFilter)
//  562 {
//  563   /* Configure the ETR Clock source */
//  564   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
TIM5_ETRClockMode2Config:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5303
        LD        L:0x5303, A
//  565 
//  566   /* Enable the External clock mode2 */
//  567   TIM5->ETR |= TIM_ETR_ECE ;
        BSET      L:0x5303, #0x6
//  568 }
        RET
//  569 
//  570 /**
//  571   * @brief  Configures the TIM5 External Trigger.
//  572   * @param  TIM5_ExtTRGPrescaler : Specifies the external Trigger Prescaler.
//  573   *   This parameter can be one of the @ref TIM5_ExtTRGPSC_TypeDef enumeration.
//  574   * @param  TIM5_ExtTRGPolarity : Specifies the external Trigger Polarity.
//  575   *   This parameter can be one of the @ref TIM5_ExtTRGPolarity_TypeDef enumeration.
//  576   * @param  ExtTRGFilter : Specifies the External Trigger Filter.
//  577   *   This parameter must be a value between 0x00 and 0x0F
//  578   * @retval None
//  579   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  580 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
//  581                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
//  582                     uint8_t ExtTRGFilter)
//  583 {
//  584   /* Check the parameters */
//  585   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
//  586   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
//  587   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
//  588 
//  589   /* Set the Prescaler, the Filter value and the Polarity */
//  590   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
//  591                          | (uint8_t)ExtTRGFilter);
TIM5_ETRConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5303
        LD        L:0x5303, A
//  592 }
        RET
//  593 
//  594 /**
//  595   * @brief  Configures the TIM5 Trigger as External Clock.
//  596   * @param  TIM5_TIxExternalCLKSource : Specifies Trigger source.
//  597   *   This parameter can be one of the @ref TIM5_TIxExternalCLK1Source_TypeDef enumeration.
//  598   * @param  TIM5_ICPolarity : Specifies the TIx Polarity.
//  599   *   This parameter can be @ref TIM5_ICPolarity_TypeDef enumeration.
//  600   * @param  ICFilter : Specifies the filter value.
//  601   *   This parameter must be a value between 0x00 and 0x0F
//  602   * @retval None
//  603   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  604 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
//  605                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
//  606                                  uint8_t ICFilter)
//  607 {
TIM5_TIxExternalClockConfig:
        LD        S:?b4, A
        MOV       S:?b2, S:?b0
//  608   /* Check the parameters */
//  609   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
//  610   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
//  611   assert_param(IS_TIM5_IC_FILTER(ICFilter));
//  612 
//  613   /* Configure the TIM5 Input Clock Source */
//  614   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
        CP        A, #0x60
        JRNE      L:??TIM5_TIxExternalClockConfig_0
//  615   {
//  616     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI2_Config
        JRA       L:??TIM5_TIxExternalClockConfig_1
//  617   }
//  618   else
//  619   {
//  620     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
??TIM5_TIxExternalClockConfig_0:
        LD        A, #0x1
        LD        S:?b0, A
        LD        A, S:?b2
        CALL      L:TI1_Config
//  621   }
//  622 
//  623   /* Select the Trigger source */
//  624   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
??TIM5_TIxExternalClockConfig_1:
        LD        A, L:0x5302
        AND       A, #0x8f
        OR        A, S:?b4
        LD        L:0x5302, A
//  625 
//  626   /* Select the External clock mode1 */
//  627   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
        LD        A, #0x7
        OR        A, L:0x5302
        LD        L:0x5302, A
//  628 }
        RET
//  629 
//  630 /**
//  631   * @brief  Selects the TIM5 Input Trigger source.
//  632   * @param  TIM5_InputTriggerSource : Specifies Input Trigger source.
//  633   *   This parameter can be one of the @ref TIM5_TRGSelection_TypeDef enumeration.
//  634   * @retval None
//  635   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  636 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
//  637 {
TIM5_SelectInputTrigger:
        LD        S:?b0, A
//  638   uint8_t tmpsmcr = 0;
//  639 
//  640   /* Check the parameters */
//  641   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
//  642 
//  643   tmpsmcr = TIM5->SMCR;
        LD        A, L:0x5302
//  644 
//  645   /* Select the Tgigger Source */
//  646   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
//  647   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
//  648 
//  649   TIM5->SMCR = (uint8_t)tmpsmcr;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5302, A
//  650 }
        RET
//  651 
//  652 /**
//  653   * @brief  Enables or Disables the TIM5 Update event.
//  654   * @param  NewState : The new state of the TIM5 peripheral Preload register.
//  655   *   This parameter can be any of the @ref FunctionalState enumeration.
//  656   * @retval None
//  657   */
//  658 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  659 void TIM5_UpdateDisableConfig(FunctionalState NewState)
//  660 {
//  661   /* Check the parameters */
//  662   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  663 
//  664   /* Set or Reset the UDIS Bit */
//  665   if (NewState != DISABLE)
TIM5_UpdateDisableConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_UpdateDisableConfig_0
//  666   {
//  667     TIM5->CR1 |= TIM_CR1_UDIS;
        BSET      L:0x5300, #0x1
        RET
//  668   }
//  669   else
//  670   {
//  671     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
??TIM5_UpdateDisableConfig_0:
        BRES      L:0x5300, #0x1
//  672   }
//  673 }
        RET
//  674 
//  675 /**
//  676   * @brief  Selects the TIM5 Update Request Interrupt source.
//  677   * @param  TIM5_UpdateSource : Specifies the Update source.
//  678   *   This parameter can be one of the @ref TIM5_UpdateSource_TypeDef enumeration.
//  679   * @retval None
//  680   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  681 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
//  682 {
//  683   /* Check the parameters */
//  684   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
//  685 
//  686   /* Set or Reset the URS Bit */
//  687   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
TIM5_UpdateRequestConfig:
        CP        A, #0x1
        JRNE      L:??TIM5_UpdateRequestConfig_0
//  688   {
//  689     TIM5->CR1 |= TIM_CR1_URS ;
        BSET      L:0x5300, #0x2
        RET
//  690   }
//  691   else
//  692   {
//  693     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
??TIM5_UpdateRequestConfig_0:
        BRES      L:0x5300, #0x2
//  694   }
//  695 }
        RET
//  696 
//  697 /**
//  698   * @brief  Enables or Disables the TIM’s Hall sensor interface.
//  699   * @param  NewState : The new state of the TIM5 Hall sensor interface.
//  700   *   This parameter can be any of the @ref FunctionalState enumeration.
//  701   * @retval None
//  702   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  703 void TIM5_SelectHallSensor(FunctionalState NewState)
//  704 {
//  705   /* Check the parameters */
//  706   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  707 
//  708   /* Set or Reset the TI1S Bit */
//  709   if (NewState != DISABLE)
TIM5_SelectHallSensor:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_SelectHallSensor_0
//  710   {
//  711     TIM5->CR2 |= TIM_CR2_TI1S;
        BSET      L:0x5301, #0x7
        RET
//  712   }
//  713   else
//  714   {
//  715     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
??TIM5_SelectHallSensor_0:
        BRES      L:0x5301, #0x7
//  716   }
//  717 }
        RET
//  718 
//  719 /**
//  720   * @brief  Selects the TIM’s One Pulse Mode.
//  721   * @param  TIM5_OPMode : Specifies the OPM Mode to be used.
//  722   *   This parameter can be one of the @ref TIM5_OPMode_TypeDef enumeration.
//  723   * @retval None
//  724   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  725 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
//  726 {
//  727   /* Check the parameters */
//  728   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
//  729 
//  730   /* Set or Reset the OPM Bit */
//  731   if (TIM5_OPMode == TIM5_OPMode_Single)
TIM5_SelectOnePulseMode:
        CP        A, #0x1
        JRNE      L:??TIM5_SelectOnePulseMode_0
//  732   {
//  733     TIM5->CR1 |= TIM_CR1_OPM ;
        BSET      L:0x5300, #0x3
        RET
//  734   }
//  735   else
//  736   {
//  737     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
??TIM5_SelectOnePulseMode_0:
        BRES      L:0x5300, #0x3
//  738   }
//  739 }
        RET
//  740 
//  741 /**
//  742   * @brief  Selects the TIM5 Trigger Output Mode.
//  743   * @param  TIM5_TRGOSource : Specifies the Trigger Output source.
//  744   *   This parameter can be one of the @ref TIM5_TRGOSource_TypeDef enumeration.
//  745   * @retval None
//  746   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  747 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
//  748 {
TIM5_SelectOutputTrigger:
        LD        S:?b0, A
//  749   uint8_t tmpcr2 = 0;
//  750 
//  751   /* Check the parameters */
//  752   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
//  753 
//  754   tmpcr2 = TIM5->CR2;
        LD        A, L:0x5301
//  755 
//  756   /* Reset the MMS Bits */
//  757   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
//  758 
//  759   /* Select the TRGO source */
//  760   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
//  761 
//  762   TIM5->CR2 = tmpcr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5301, A
//  763 }
        RET
//  764 
//  765 /**
//  766   * @brief  Selects the TIM5 Slave Mode.
//  767   * @param  TIM5_SlaveMode : Specifies the TIM5 Slave Mode.
//  768   *   This parameter can be one of the @ref TIM5_SlaveMode_TypeDef enumeration.
//  769   * @retval None
//  770   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  771 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
//  772 {
TIM5_SelectSlaveMode:
        LD        S:?b0, A
//  773   uint8_t tmpsmcr = 0;
//  774 
//  775   /* Check the parameters */
//  776   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
//  777 
//  778   tmpsmcr = TIM5->SMCR;
        LD        A, L:0x5302
//  779 
//  780   /* Reset the SMS Bits */
//  781   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
//  782 
//  783   /* Select the Slave Mode */
//  784   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
//  785 
//  786   TIM5->SMCR = tmpsmcr;
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x5302, A
//  787 }
        RET
//  788 
//  789 /**
//  790   * @brief  Sets or Resets the TIM5 Master/Slave Mode.
//  791   * @param  NewState : The new state of the synchronization between TIM5 and its slaves (through TRGO).
//  792   *   This parameter can be any of the @ref FunctionalState enumeration.
//  793   * @retval None
//  794   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  795 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
//  796 {
//  797   /* Check the parameters */
//  798   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  799 
//  800   /* Set or Reset the MSM Bit */
//  801   if (NewState != DISABLE)
TIM5_SelectMasterSlaveMode:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_SelectMasterSlaveMode_0
//  802   {
//  803     TIM5->SMCR |= TIM_SMCR_MSM;
        BSET      L:0x5302, #0x7
        RET
//  804   }
//  805   else
//  806   {
//  807     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
??TIM5_SelectMasterSlaveMode_0:
        BRES      L:0x5302, #0x7
//  808   }
//  809 }
        RET
//  810 
//  811 /**
//  812   * @brief  Configures the TIM5 Encoder Interface.
//  813   * @param  TIM5_EncoderMode : Specifies the TIM5 Encoder Mode.
//  814   *   This parameter can be one of the @ref TIM5_EncoderMode_TypeDef enumeration.
//  815   * @param  TIM5_IC1Polarity : Specifies the IC1 Polarity.
//  816   *   This parameter can be one of the @ref TIM5_ICPolarity_TypeDef enumeration.
//  817   * @param  TIM5_IC2Polarity : Specifies the IC2 Polarity.
//  818   *   This parameter can be one of the @ref TIM5_ICPolarity_TypeDef enumeration.
//  819   * @retval None
//  820   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  821 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
//  822                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
//  823                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
//  824 {
TIM5_EncoderInterfaceConfig:
        LD        S:?b4, A
//  825   uint8_t tmpsmcr = 0;
//  826   uint8_t tmpccmr1 = 0;
//  827   uint8_t tmpccmr2 = 0;
//  828 
//  829   /* Check the parameters */
//  830   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
//  831   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
//  832   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
//  833 
//  834   tmpsmcr = TIM5->SMCR;
        LD        A, L:0x5302
        LD        S:?b2, A
//  835   tmpccmr1 = TIM5->CCMR1;
        LD        A, L:0x5309
        LD        S:?b3, A
//  836   tmpccmr2 = TIM5->CCMR2;
        LD        A, L:0x530a
        LD        S:?b5, A
//  837 
//  838   /* Set the encoder Mode */
//  839   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
//  840   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
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
//  849   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM5_EncoderInterfaceConfig_0
//  850   {
//  851     TIM5->CCER1 |= TIM_CCER1_CC1P ;
        BSET      L:0x530b, #0x1
        JRA       L:??TIM5_EncoderInterfaceConfig_1
//  852   }
//  853   else
//  854   {
//  855     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
??TIM5_EncoderInterfaceConfig_0:
        BRES      L:0x530b, #0x1
//  856   }
//  857 
//  858   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
??TIM5_EncoderInterfaceConfig_1:
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??TIM5_EncoderInterfaceConfig_2
//  859   {
//  860     TIM5->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x530b, #0x5
        JRA       L:??TIM5_EncoderInterfaceConfig_3
//  861   }
//  862   else
//  863   {
//  864     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TIM5_EncoderInterfaceConfig_2:
        BRES      L:0x530b, #0x5
//  865   }
//  866 
//  867   TIM5->SMCR = tmpsmcr;
??TIM5_EncoderInterfaceConfig_3:
        LD        A, S:?b4
        LD        L:0x5302, A
//  868   TIM5->CCMR1 = tmpccmr1;
        LD        A, S:?b3
        LD        L:0x5309, A
//  869   TIM5->CCMR2 = tmpccmr2;
        LD        A, S:?b2
        LD        L:0x530a, A
//  870 }
        RET
//  871 
//  872 /**
//  873   * @brief  Configures the TIM5 Prescaler.
//  874   * @param  Prescaler : Specifies the Prescaler Register value
//  875   *   This parameter can be one of the @ref TIM5_Prescaler_TypeDef enumeration.
//  876   * @param  TIM5_PSCReloadMode : Specifies the TIM5 Prescaler Reload mode.
//  877   *   This parameter can be one of the @ref TIM5_PSCReloadMode_TypeDef enumeration.
//  878   * @retval None
//  879   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  880 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
//  881                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
//  882 {
//  883   /* Check the parameters */
//  884   assert_param(IS_TIM5_PRESCALER(Prescaler));
//  885   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
//  886 
//  887   /* Set the Prescaler value */
//  888   TIM5->PSCR = (uint8_t)(Prescaler);
TIM5_PrescalerConfig:
        LD        L:0x530e, A
//  889 
//  890   /* Set or reset the UG Bit */
//  891   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM5_PrescalerConfig_0
//  892   {
//  893     TIM5->EGR |= TIM_EGR_UG ;
        BSET      L:0x5308, #0x0
        RET
//  894   }
//  895   else
//  896   {
//  897     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
??TIM5_PrescalerConfig_0:
        BRES      L:0x5308, #0x0
//  898   }
//  899 }
        RET
//  900 
//  901 /**
//  902   * @brief  Specifies the TIM5 Counter Mode to be used.
//  903   * @param  TIM5_CounterMode : Specifies the Counter Mode to be used
//  904   *   This parameter can be one of the @ref TIM5_CounterMode_TypeDef enumeration.
//  905   * @retval None
//  906   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  907 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
//  908 {
TIM5_CounterModeConfig:
        LD        S:?b0, A
//  909   uint8_t tmpcr1 = 0;
//  910 
//  911   /* Check the parameters */
//  912   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
//  913 
//  914   tmpcr1 = TIM5->CR1;
        LD        A, L:0x5300
//  915 
//  916   /* Reset the CMS and DIR Bits */
//  917   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
//  918 
//  919   /* Set the Counter Mode */
//  920   tmpcr1 |= (uint8_t)TIM5_CounterMode;
//  921 
//  922   TIM5->CR1 = tmpcr1;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5300, A
//  923 }
        RET
//  924 
//  925 /**
//  926   * @brief  Forces the TIM5 Channel1 output waveform to active or inactive level.
//  927   * @param  TIM5_ForcedAction : Specifies the forced Action to be set to the output waveform.
//  928   *   This parameter can be one of the @ref TIM5_ForcedAction_TypeDef enumeration.
//  929   * @retval None
//  930   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  931 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
//  932 {
TIM5_ForcedOC1Config:
        LD        S:?b0, A
//  933   uint8_t tmpccmr1 = 0;
//  934 
//  935   /* Check the parameters */
//  936   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
//  937 
//  938   tmpccmr1 = TIM5->CCMR1;
        LD        A, L:0x5309
//  939 
//  940   /* Reset the OCM Bits */
//  941   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
//  942 
//  943   /* Configure The Forced output Mode */
//  944   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
//  945 
//  946   TIM5->CCMR1 = tmpccmr1;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5309, A
//  947 }
        RET
//  948 
//  949 /**
//  950   * @brief  Forces the TIM5 Channel2 output waveform to active or inactive level.
//  951   * @param  TIM5_ForcedAction : Specifies the forced Action to be set to the output waveform.
//  952   *   This parameter can be one of the @ref TIM5_ForcedAction_TypeDef enumeration.
//  953   * @retval None
//  954   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  955 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
//  956 {
TIM5_ForcedOC2Config:
        LD        S:?b0, A
//  957   uint8_t tmpccmr2 = 0;
//  958 
//  959   /* Check the parameters */
//  960   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
//  961 
//  962   tmpccmr2 = TIM5->CCMR2;
        LD        A, L:0x530a
//  963 
//  964   /* Reset the OCM Bits */
//  965   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
//  966 
//  967   /* Configure The Forced output Mode */
//  968   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
//  969 
//  970   TIM5->CCMR2 = tmpccmr2;
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x530a, A
//  971 }
        RET
//  972 
//  973 /**
//  974   * @brief  Enables or disables TIM5 peripheral Preload register on ARR.
//  975   * @param  NewState : The new state of the TIM5 peripheral Preload register.
//  976   *   This parameter can be any of the @ref FunctionalState enumeration.
//  977   * @retval None
//  978   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  979 void TIM5_ARRPreloadConfig(FunctionalState NewState)
//  980 {
//  981   /* Check the parameters */
//  982   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  983 
//  984   /* Set or Reset the ARPE Bit */
//  985   if (NewState != DISABLE)
TIM5_ARRPreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_ARRPreloadConfig_0
//  986   {
//  987     TIM5->CR1 |= TIM_CR1_ARPE;
        BSET      L:0x5300, #0x7
        RET
//  988   }
//  989   else
//  990   {
//  991     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
??TIM5_ARRPreloadConfig_0:
        BRES      L:0x5300, #0x7
//  992   }
//  993 }
        RET
//  994 
//  995 /**
//  996   * @brief  Enables or disables the TIM5 peripheral Preload Register on CCR1.
//  997   * @param  NewState : The new state of the Capture Compare Preload register.
//  998   *   This parameter can be any of the @ref FunctionalState enumeration.
//  999   * @retval None
// 1000   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1001 void TIM5_OC1PreloadConfig(FunctionalState NewState)
// 1002 {
// 1003   /* Check the parameters */
// 1004   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1005 
// 1006   /* Set or Reset the OC1PE Bit */
// 1007   if (NewState != DISABLE)
TIM5_OC1PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_OC1PreloadConfig_0
// 1008   {
// 1009     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
        BSET      L:0x5309, #0x3
        RET
// 1010   }
// 1011   else
// 1012   {
// 1013     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
??TIM5_OC1PreloadConfig_0:
        BRES      L:0x5309, #0x3
// 1014   }
// 1015 }
        RET
// 1016 
// 1017 /**
// 1018   * @brief  Enables or disables the TIM5 peripheral Preload Register on CCR2.
// 1019   * @param  NewState : The new state of the Capture Compare Preload register.
// 1020   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1021   * @retval None
// 1022   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1023 void TIM5_OC2PreloadConfig(FunctionalState NewState)
// 1024 {
// 1025   /* Check the parameters */
// 1026   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1027 
// 1028   /* Set or Reset the OC2PE Bit */
// 1029   if (NewState != DISABLE)
TIM5_OC2PreloadConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_OC2PreloadConfig_0
// 1030   {
// 1031     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
        BSET      L:0x530a, #0x3
        RET
// 1032   }
// 1033   else
// 1034   {
// 1035     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
??TIM5_OC2PreloadConfig_0:
        BRES      L:0x530a, #0x3
// 1036   }
// 1037 }
        RET
// 1038 
// 1039 /**
// 1040   * @brief  Configures the TIM5 Capture Compare 1 Fast feature.
// 1041   * @param  NewState : The new state of the Output Compare Fast Enable bit.
// 1042   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1043   * @retval None
// 1044   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1045 void TIM5_OC1FastCmd(FunctionalState NewState)
// 1046 {
// 1047   /* Check the parameters */
// 1048   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1049 
// 1050   /* Set or Reset the OC1FE Bit */
// 1051   if (NewState != DISABLE)
TIM5_OC1FastCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_OC1FastCmd_0
// 1052   {
// 1053     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
        BSET      L:0x5309, #0x2
        RET
// 1054   }
// 1055   else
// 1056   {
// 1057     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
??TIM5_OC1FastCmd_0:
        BRES      L:0x5309, #0x2
// 1058   }
// 1059 }
        RET
// 1060 
// 1061 /**
// 1062   * @brief  Configures the TIM5 Capture Compare 2 Fast feature.
// 1063   * @param  NewState : The new state of the Output Compare Fast Enable bit.
// 1064   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1065   * @retval None
// 1066   */
// 1067 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1068 void TIM5_OC2FastCmd(FunctionalState NewState)
// 1069 {
// 1070   /* Check the parameters */
// 1071   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1072 
// 1073   /* Set or Reset the OC2FE Bit */
// 1074   if (NewState != DISABLE)
TIM5_OC2FastCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_OC2FastCmd_0
// 1075   {
// 1076     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
        BSET      L:0x530a, #0x2
        RET
// 1077   }
// 1078   else
// 1079   {
// 1080     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
??TIM5_OC2FastCmd_0:
        BRES      L:0x530a, #0x2
// 1081   }
// 1082 }
        RET
// 1083 
// 1084 /**
// 1085   * @brief  Configures the TIM5 event to be generated by software.
// 1086   * @param  TIM5_EventSource : Specifies the event source.
// 1087   *   This parameter can be one of the @ref TIM5_EventSource_TypeDef enumeration.
// 1088   * @retval None
// 1089   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1090 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
// 1091 {
// 1092   /* Check the parameters */
// 1093   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
// 1094 
// 1095   /* Set the event sources */
// 1096   TIM5->EGR |= (uint8_t)TIM5_EventSource;
TIM5_GenerateEvent:
        OR        A, L:0x5308
        LD        L:0x5308, A
// 1097 }
        RET
// 1098 
// 1099 /**
// 1100   * @brief  Configures the TIM5 Channel 1 polarity.
// 1101   * @param  TIM5_OCPolarity : Specifies the OC1 Polarity.
// 1102   *   This parameter can be one of the @ref TIM5_OCPolarity_TypeDef enumeration.
// 1103   * @retval None
// 1104   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1105 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
// 1106 {
// 1107   /* Check the parameters */
// 1108   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
// 1109 
// 1110   /* Set or Reset the CC1P Bit */
// 1111   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
TIM5_OC1PolarityConfig:
        CP        A, #0x1
        JRNE      L:??TIM5_OC1PolarityConfig_0
// 1112   {
// 1113     TIM5->CCER1 |= TIM_CCER1_CC1P ;
        BSET      L:0x530b, #0x1
        RET
// 1114   }
// 1115   else
// 1116   {
// 1117     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
??TIM5_OC1PolarityConfig_0:
        BRES      L:0x530b, #0x1
// 1118   }
// 1119 }
        RET
// 1120 
// 1121 /**
// 1122   * @brief  Configures the TIM5 Channel 2 polarity.
// 1123   * @param  TIM5_OCPolarity : Specifies the OC2 Polarity.
// 1124   *   This parameter can be one of the @ref TIM5_OCPolarity_TypeDef enumeration.
// 1125   * @retval None
// 1126   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1127 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
// 1128 {
// 1129   /* Check the parameters */
// 1130   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
// 1131 
// 1132   /* Set or Reset the CC2P Bit */
// 1133   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
TIM5_OC2PolarityConfig:
        CP        A, #0x1
        JRNE      L:??TIM5_OC2PolarityConfig_0
// 1134   {
// 1135     TIM5->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x530b, #0x5
        RET
// 1136   }
// 1137   else
// 1138   {
// 1139     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TIM5_OC2PolarityConfig_0:
        BRES      L:0x530b, #0x5
// 1140   }
// 1141 }
        RET
// 1142 
// 1143 /**
// 1144   * @brief  Enables or disables the TIM5 Capture Compare Channel x.
// 1145   * @param  TIM5_Channel : Specifies the TIM5 Channel.
// 1146   *   This parameter can be one of @ref TIM5_Channel_TypeDef enumeration.
// 1147   * @param  NewState : Specifies the TIM5 Channel CCxE bit new state.
// 1148   *   This parameter can be any of the @ref FunctionalState enumeration.
// 1149   * @retval None
// 1150   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1151 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
// 1152                  FunctionalState NewState)
// 1153 {
// 1154   /* Check the parameters */
// 1155   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
// 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1157 
// 1158   if (TIM5_Channel == TIM5_Channel_1)
TIM5_CCxCmd:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JRNE      L:??TIM5_CCxCmd_0
// 1159   {
// 1160     /* Set or Reset the CC1E Bit */
// 1161     if (NewState != DISABLE)
        CP        A, S:?b0
        JREQ      L:??TIM5_CCxCmd_1
// 1162     {
// 1163       TIM5->CCER1 |= TIM_CCER1_CC1E ;
        BSET      L:0x530b, #0x0
        RET
// 1164     }
// 1165     else
// 1166     {
// 1167       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
??TIM5_CCxCmd_1:
        BRES      L:0x530b, #0x0
        RET
// 1168     }
// 1169 
// 1170   }
// 1171   else /* if (TIM5_Channel == TIM5_Channel_2) */
// 1172   {
// 1173     /* Set or Reset the CC2E Bit */
// 1174     if (NewState != DISABLE)
??TIM5_CCxCmd_0:
        CP        A, S:?b0
        JREQ      L:??TIM5_CCxCmd_2
// 1175     {
// 1176       TIM5->CCER1 |= TIM_CCER1_CC2E;
        BSET      L:0x530b, #0x4
        RET
// 1177     }
// 1178     else
// 1179     {
// 1180       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
??TIM5_CCxCmd_2:
        BRES      L:0x530b, #0x4
// 1181     }
// 1182   }
// 1183 }
        RET
// 1184 
// 1185 /**
// 1186   * @brief  Selects the TIM5 Ouput Compare Mode. This function disables the
// 1187   * selected channel before changing the Ouput Compare Mode. User has to
// 1188   * enable this channel using TIM5_CCxCmd and TIM5_CCxNCmd functions.
// 1189   * @param  TIM5_Channel : Specifies the TIM5 Channel.
// 1190   *   This parameter can be one of the @ref TIM5_Channel_TypeDef enumeration
// 1191   * @param  TIM5_OCMode : Specifies the TIM5 Output Compare Mode.
// 1192   *   This parameter can be one of the @ref TIM5_OCMode_TypeDef enumeration.
// 1193   * @retval None
// 1194   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1195 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
// 1196                      TIM5_OCMode_TypeDef TIM5_OCMode)
// 1197 {
// 1198   /* Check the parameters */
// 1199   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
// 1200   assert_param(IS_TIM5_OCM(TIM5_OCMode));
// 1201 
// 1202   if (TIM5_Channel == TIM5_Channel_1)
TIM5_SelectOCxM:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JRNE      L:??TIM5_SelectOCxM_0
// 1203   {
// 1204     /* Disable the Channel 1: Reset the CCE Bit */
// 1205     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x530b, #0x0
// 1206 
// 1207     /* Reset the Output Compare Bits */
// 1208     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
        LD        A, #0x8f
        AND       A, L:0x5309
        LD        L:0x5309, A
// 1209 
// 1210     /* Set the Ouput Compare Mode */
// 1211     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
        LD        A, S:?b0
        OR        A, L:0x5309
        LD        L:0x5309, A
        RET
// 1212   }
// 1213   else /* if (TIM5_Channel == TIM5_Channel_2) */
// 1214   {
// 1215     /* Disable the Channel 2: Reset the CCE Bit */
// 1216     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
??TIM5_SelectOCxM_0:
        BRES      L:0x530b, #0x4
// 1217 
// 1218     /* Reset the Output Compare Bits */
// 1219     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
        LD        A, #0x8f
        AND       A, L:0x530a
        LD        L:0x530a, A
// 1220 
// 1221     /* Set the Ouput Compare Mode */
// 1222     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
        LD        A, S:?b0
        OR        A, L:0x530a
        LD        L:0x530a, A
// 1223   }
// 1224 }
        RET
// 1225 
// 1226 /**
// 1227   * @brief  Sets the TIM5 Counter Register value.
// 1228   * @param  Counter : Specifies the Counter register new value.
// 1229   *   This parameter is between 0x0000 and 0xFFFF.
// 1230   * @retval None
// 1231   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1232 void TIM5_SetCounter(uint16_t Counter)
// 1233 {
TIM5_SetCounter:
        LDW       Y, X
// 1234 
// 1235   /* Set the Counter Register value */
// 1236   TIM5->CNTRH = (uint8_t)(Counter >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x530c, A
// 1237   TIM5->CNTRL = (uint8_t)(Counter);
        LD        A, YL
        LD        L:0x530d, A
// 1238 }
        RET
// 1239 
// 1240 /**
// 1241   * @brief  Sets the TIM5 Autoreload Register value.
// 1242   * @param  Autoreload : Specifies the Autoreload register new value.
// 1243   *   This parameter is between 0x0000 and 0xFFFF.
// 1244   * @retval None
// 1245   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1246 void TIM5_SetAutoreload(uint16_t Autoreload)
// 1247 {
TIM5_SetAutoreload:
        LDW       Y, X
// 1248   /* Set the Autoreload Register value */
// 1249   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x530f, A
// 1250   TIM5->ARRL = (uint8_t)(Autoreload);
        LD        A, YL
        LD        L:0x5310, A
// 1251 }
        RET
// 1252 
// 1253 /**
// 1254   * @brief  Sets the TIM5 Capture Compare1 Register value.
// 1255   * @param  Compare : Specifies the Capture Compare1 register new value.
// 1256   *   This parameter is between 0x0000 and 0xFFFF.
// 1257   * @retval None
// 1258   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1259 void TIM5_SetCompare1(uint16_t Compare)
// 1260 {
TIM5_SetCompare1:
        LDW       Y, X
// 1261   /* Set the Capture Compare1 Register value */
// 1262   TIM5->CCR1H = (uint8_t)(Compare >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5311, A
// 1263   TIM5->CCR1L = (uint8_t)(Compare);
        LD        A, YL
        LD        L:0x5312, A
// 1264 }
        RET
// 1265 
// 1266 /**
// 1267   * @brief  Sets the TIM5 Capture Compare2 Register value.
// 1268   * @param  Compare : Specifies the Capture Compare2 register new value.
// 1269   *   This parameter is between 0x0000 and 0xFFFF.
// 1270   * @retval None
// 1271   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1272 void TIM5_SetCompare2(uint16_t Compare)
// 1273 {
TIM5_SetCompare2:
        LDW       Y, X
// 1274   /* Set the Capture Compare2 Register value */
// 1275   TIM5->CCR2H = (uint8_t)(Compare >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5313, A
// 1276   TIM5->CCR2L = (uint8_t)(Compare);
        LD        A, YL
        LD        L:0x5314, A
// 1277 }
        RET
// 1278 
// 1279 /**
// 1280   * @brief  Sets the TIM5 Input Capture 1 prescaler.
// 1281   * @param  TIM5_IC1Prescaler : Specifies the Input Capture prescaler new value
// 1282   *   This parameter can be one of the @ref TIM5_ICPSC_TypeDef enumeration.
// 1283   * @retval None
// 1284   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1285 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
// 1286 {
TIM5_SetIC1Prescaler:
        LD        S:?b0, A
// 1287   uint8_t tmpccmr1 = 0;
// 1288 
// 1289   /* Check the parameters */
// 1290   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
// 1291 
// 1292   tmpccmr1 = TIM5->CCMR1;
        LD        A, L:0x5309
// 1293 
// 1294   /* Reset the IC1PSC Bits */
// 1295   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
// 1296 
// 1297   /* Set the IC1PSC value */
// 1298   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
// 1299 
// 1300   TIM5->CCMR1 = tmpccmr1;
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5309, A
// 1301 }
        RET
// 1302 
// 1303 /**
// 1304   * @brief  Sets the TIM5 Input Capture 2 prescaler.
// 1305   * @param  TIM5_IC2Prescaler : Specifies the Input Capture prescaler new value
// 1306   *   This parameter can be one of the @ref TIM5_ICPSC_TypeDef enumeration.
// 1307   * @retval None
// 1308   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1309 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
// 1310 {
TIM5_SetIC2Prescaler:
        LD        S:?b0, A
// 1311   uint8_t tmpccmr2 = 0;
// 1312 
// 1313   /* Check the parameters */
// 1314   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
// 1315 
// 1316   tmpccmr2 = TIM5->CCMR2;
        LD        A, L:0x530a
// 1317 
// 1318   /* Reset the IC2PSC Bits */
// 1319   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
// 1320 
// 1321   /* Set the IC2PSC value */
// 1322   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
// 1323 
// 1324   TIM5->CCMR2 = tmpccmr2;
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x530a, A
// 1325 }
        RET
// 1326 
// 1327 /**
// 1328   * @brief  Gets the TIM5 Input Capture 1 value.
// 1329   * @param  None
// 1330   * @retval Capture Compare 1 Register value.
// 1331   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1332 uint16_t TIM5_GetCapture1(void)
// 1333 {
// 1334   uint16_t tmpccr1 = 0;
// 1335   uint8_t tmpccr1l, tmpccr1h;
// 1336 
// 1337   tmpccr1h = TIM5->CCR1H;
TIM5_GetCapture1:
        LD        A, L:0x5311
        LD        S:?b1, A
// 1338   tmpccr1l = TIM5->CCR1L;
        LD        A, L:0x5312
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
// 1347   * @brief  Gets the TIM5 Input Capture 2 value.
// 1348   * @param  None
// 1349   * @retval Capture Compare 2 Register value.
// 1350   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1351 uint16_t TIM5_GetCapture2(void)
// 1352 {
// 1353   uint16_t tmpccr2 = 0;
// 1354   uint8_t tmpccr2l, tmpccr2h;
// 1355 
// 1356   tmpccr2h = TIM5->CCR2H;
TIM5_GetCapture2:
        LD        A, L:0x5313
        LD        S:?b1, A
// 1357   tmpccr2l = TIM5->CCR2L;
        LD        A, L:0x5314
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
// 1366   * @brief  Gets the TIM5 Counter value.
// 1367   * @param  None
// 1368   * @retval Counter Register value.
// 1369   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1370 uint16_t TIM5_GetCounter(void)
// 1371 {
// 1372   uint16_t tmpcnt = 0;
// 1373   uint8_t tmpcntrl, tmpcntrh;
// 1374 
// 1375   tmpcntrh = TIM5->CNTRH;
TIM5_GetCounter:
        LD        A, L:0x530c
        LD        S:?b1, A
// 1376   tmpcntrl = TIM5->CNTRL;
        LD        A, L:0x530d
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
// 1385   * @brief  Gets the TIM5 Prescaler value.
// 1386   * @param  None
// 1387   * @retval TIM5_Prescaler_TypeDef : Prescaler Register value.
// 1388   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1389 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
// 1390 {
// 1391   /* Get the Prescaler Register value */
// 1392   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
TIM5_GetPrescaler:
        LD        A, L:0x530e
        RET
// 1393 }
// 1394 
// 1395 /**
// 1396   * @brief  Selects the TIM5 peripheral Capture Compare DMA source.
// 1397   * @param   NewState: new state of the Capture Compare DMA source.
// 1398   *   This parameter can be: ENABLE or DISABLE.
// 1399   * @retval None
// 1400   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1401 void TIM5_SelectCCDMA(FunctionalState NewState)
// 1402 {
// 1403   /* Check the parameters */
// 1404   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1405 
// 1406   if (NewState != DISABLE)
TIM5_SelectCCDMA:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??TIM5_SelectCCDMA_0
// 1407   {
// 1408     /* Set the CCDS Bit */
// 1409     TIM5->CR2 |= TIM_CR2_CCDS;
        BSET      L:0x5301, #0x3
        RET
// 1410   }
// 1411   else
// 1412   {
// 1413     /* Reset the CCDS Bit */
// 1414     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
??TIM5_SelectCCDMA_0:
        BRES      L:0x5301, #0x3
// 1415   }
// 1416 }
        RET
// 1417 
// 1418 /**
// 1419   * @brief  Checks whether the specified TIM5 flag is set or not.
// 1420   * @param  TIM5_FLAG : Specifies the flag to check.
// 1421   *   This parameter can be one of the @ref TIM5_FLAG_TypeDef enumeration.
// 1422   * @retval FlagStatus : The new state of TIM5_FLAG.
// 1423   *   This parameter can be any of the @ref FlagStatus enumeration.
// 1424   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1425 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
// 1426 {
TIM5_GetFlagStatus:
        LDW       Y, X
// 1427   FlagStatus bitstatus = RESET;
// 1428   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
// 1429 
// 1430   /* Check the parameters */
// 1431   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
// 1432 
// 1433   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
        LD        A, L:0x5306
        LD        S:?b1, A
// 1434   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
        LD        A, L:0x5307
        LD        S:?b0, A
// 1435 
// 1436   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
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
        JREQ      L:??TIM5_GetFlagStatus_0
// 1437   {
// 1438     bitstatus = SET;
        LD        A, #0x1
        RET
// 1439   }
// 1440   else
// 1441   {
// 1442     bitstatus = RESET;
??TIM5_GetFlagStatus_0:
        CLR       A
// 1443   }
// 1444   return ((FlagStatus)bitstatus);
        RET
// 1445 }
// 1446 
// 1447 /**
// 1448   * @brief  Clears the TIM’s pending flags.
// 1449   * @param  TIM5_FLAG : Specifies the flag to clear.
// 1450   *   This parameter can be one of the @ref TIM5_FLAG_TypeDef enumeration.
// 1451   * @retval None
// 1452   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1453 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
// 1454 {
// 1455   /* Check the parameters */
// 1456   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
// 1457   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
// 1458   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
TIM5_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5306, A
// 1459   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
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
        LD        L:0x5307, A
// 1460 }
        RET
// 1461 
// 1462 /**
// 1463   * @brief  Checks whether the TIM5 interrupt has occurred or not.
// 1464   * @param  TIM5_IT : Specifies the TIM5 interrupt source to check.
// 1465   *   This parameter can be one of the @ref TIM5_IT_TypeDef enumeration.
// 1466   * @retval ITStatus : The new state of the TIM5_IT.
// 1467   *   This parameter can be any of the @ref ITStatus enumeration.
// 1468   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1469 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
// 1470 {
TIM5_GetITStatus:
        LD        S:?b0, A
// 1471   ITStatus bitstatus = RESET;
// 1472 
// 1473   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
// 1474 
// 1475   /* Check the parameters */
// 1476   assert_param(IS_TIM5_GET_IT(TIM5_IT));
// 1477 
// 1478   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
        LD        A, L:0x5306
        LD        S:?b1, A
// 1479 
// 1480   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
        LD        A, S:?b0
        AND       A, L:0x5305
        LD        S:?b2, A
// 1481 
// 1482   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
        LD        A, S:?b0
        AND       A, S:?b1
        JREQ      L:??TIM5_GetITStatus_0
        CLR       A
        CP        A, S:?b2
        JREQ      L:??TIM5_GetITStatus_0
// 1483   {
// 1484     bitstatus = (ITStatus)SET;
        LD        A, #0x1
        RET
// 1485   }
// 1486   else
// 1487   {
// 1488     bitstatus = (ITStatus)RESET;
??TIM5_GetITStatus_0:
        CLR       A
// 1489   }
// 1490   return ((ITStatus)bitstatus);
        RET
// 1491 }
// 1492 
// 1493 /**
// 1494   * @brief  Clears the TIM's interrupt pending bits.
// 1495   * @param  TIM5_IT : Specifies the pending bit to clear.
// 1496   *   This parameter can be one of the @ref TIM5_IT_TypeDef enumeration.
// 1497   * @retval None
// 1498   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1499 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
// 1500 {
// 1501   /* Check the parameters */
// 1502   assert_param(IS_TIM5_IT(TIM5_IT));
// 1503 
// 1504   /* Clear the IT pending Bit */
// 1505   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
TIM5_ClearITPendingBit:
        CPL       A
        LD        L:0x5306, A
// 1506 }
        RET
// 1507 
// 1508 /**
// 1509   * @brief  Configure the TI1 as Input.
// 1510   * @param  TIM5_ICPolarity : The Input Polarity.
// 1511   *   This parameter can be one of the @ref TIM5_ICPolarity_TypeDef enumeration.
// 1512   * @param  TIM5_ICSelection : Specifies the input to be used.
// 1513   *   This parameter can be one of the @ref TIM5_ICSelection_TypeDef enumeration.
// 1514   * @param  TIM5_ICFilter : Specifies the Input Capture Filter.
// 1515   *   This parameter must be a value between 0x00 and 0x0F.
// 1516   * @retval None
// 1517   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1518 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \ 
// 1519                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \ 
// 1520                        uint8_t TIM5_ICFilter)
// 1521 {
TI1_Config:
        LD        S:?b2, A
// 1522   uint8_t tmpccmr1 = 0;
// 1523   uint8_t tmpicpolarity = TIM5_ICPolarity;
// 1524   tmpccmr1 = TIM5->CCMR1;
        LD        A, L:0x5309
// 1525 
// 1526   /* Check the parameters */
// 1527   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
// 1528   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
// 1529   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
// 1530 
// 1531   /* Disable the Channel 1: Reset the CCE Bit */
// 1532   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
        BRES      L:0x530b, #0x0
// 1533 
// 1534   /* Select the Input and set the filter */
// 1535   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
// 1536   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
// 1537 
// 1538   TIM5->CCMR1 = tmpccmr1;
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b3, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b3
        OR        A, S:?b0
        LD        L:0x5309, A
// 1539 
// 1540   /* Select the Polarity */
// 1541   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TI1_Config_0
// 1542   {
// 1543     TIM5->CCER1 |= TIM_CCER1_CC1P;
        BSET      L:0x530b, #0x1
        JRA       L:??TI1_Config_1
// 1544   }
// 1545   else
// 1546   {
// 1547     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x530b, #0x1
// 1548   }
// 1549 
// 1550   /* Set the CCE Bit */
// 1551   TIM5->CCER1 |=  TIM_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x530b, #0x0
// 1552 }
        RET
// 1553 
// 1554 /**
// 1555   * @brief  Configure the TI2 as Input.
// 1556   * @param  TIM5_ICPolarity : The Input Polarity.
// 1557   *   This parameter can be one of the @ref TIM5_ICPolarity_TypeDef enumeration.
// 1558   * @param  TIM5_ICSelection : Specifies the input to be used.
// 1559   *   This parameter can be one of the @ref TIM5_ICSelection_TypeDef enumeration.
// 1560   * @param  TIM5_ICFilter : Specifies the Input Capture Filter.
// 1561   *   This parameter must be a value between 0x00 and 0x0F.
// 1562   * @retval None
// 1563   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1564 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
// 1565                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
// 1566                        uint8_t TIM5_ICFilter)
// 1567 {
TI2_Config:
        LD        S:?b2, A
// 1568   uint8_t tmpccmr2 = 0;
// 1569   uint8_t tmpicpolarity = TIM5_ICPolarity;
// 1570 
// 1571   /* Check the parameters */
// 1572   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
// 1573   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
// 1574   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
// 1575 
// 1576   tmpccmr2 = TIM5->CCMR2;
        LD        A, L:0x530a
// 1577 
// 1578   /* Disable the Channel 2: Reset the CCE Bit */
// 1579   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
        BRES      L:0x530b, #0x4
// 1580 
// 1581   /* Select the Input and set the filter */
// 1582   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
// 1583   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
// 1584 
// 1585   TIM5->CCMR2 = tmpccmr2;
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b3, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        LD        S:?b0, A
        LD        A, S:?b3
        OR        A, S:?b0
        LD        L:0x530a, A
// 1586 
// 1587   /* Select the Polarity */
// 1588   if (tmpicpolarity == TIM5_ICPolarity_Falling)
        LD        A, S:?b2
        CP        A, #0x1
        JRNE      L:??TI2_Config_0
// 1589   {
// 1590     TIM5->CCER1 |= TIM_CCER1_CC2P ;
        BSET      L:0x530b, #0x5
        JRA       L:??TI2_Config_1
// 1591   }
// 1592   else
// 1593   {
// 1594     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
??TI2_Config_0:
        BRES      L:0x530b, #0x5
// 1595   }
// 1596 
// 1597   /* Set the CCE Bit */
// 1598   TIM5->CCER1 |=  TIM_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x530b, #0x4
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
