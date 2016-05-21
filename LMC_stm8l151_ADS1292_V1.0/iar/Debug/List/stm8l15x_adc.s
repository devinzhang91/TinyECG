///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:41 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_adc.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_adc.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_adc.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_adc

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?w0
        EXTERN ?w1

        PUBLIC ADC_AnalogWatchdogChannelSelect
        PUBLIC ADC_AnalogWatchdogConfig
        PUBLIC ADC_AnalogWatchdogThresholdsConfig
        PUBLIC ADC_ChannelCmd
        PUBLIC ADC_ClearFlag
        PUBLIC ADC_ClearITPendingBit
        PUBLIC ADC_Cmd
        PUBLIC ADC_DMACmd
        PUBLIC ADC_DeInit
        PUBLIC ADC_ExternalTrigConfig
        PUBLIC ADC_GetConversionValue
        PUBLIC ADC_GetFlagStatus
        PUBLIC ADC_GetITStatus
        PUBLIC ADC_ITConfig
        PUBLIC ADC_Init
        PUBLIC ADC_SamplingTimeConfig
        PUBLIC ADC_SchmittTriggerConfig
        PUBLIC ADC_SoftwareStartConv
        PUBLIC ADC_TempSensorCmd
        PUBLIC ADC_VrefintCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_adc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_adc.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the ADC firmware functions.
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
//   22 #include "stm8l15x_adc.h"
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
//   34 
//   35 /**
//   36     * @addtogroup ADC_Public_Functions
//   37     * @{
//   38     */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the ADC peripheral registers to their default reset values.
//   42   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void ADC_DeInit(ADC_TypeDef* ADCx)
//   46 {
//   47   /*  Set the Configuration registers to their reset values */
//   48   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
ADC_DeInit:
        CLR       A
        LD        (X), A
//   49   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//   50   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x2
        LD        A, #0x1f
        LD        (Y), A
//   51 
//   52   /*  Set the status registers to their reset values */
//   53   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, #0xff
        LD        (Y), A
//   54 
//   55   /*  Set the High threshold registers to their reset values */
//   56   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x6
        LD        A, #0xf
        LD        (Y), A
//   57   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x7
        LD        A, #0xff
        LD        (Y), A
//   58 
//   59   /*  Set the low threshold registers to their reset values */
//   60   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x8
        CLR       A
        LD        (Y), A
//   61   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x9
        LD        (Y), A
//   62 
//   63   /*  Set the channels sequence registers to their reset values */
//   64   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xa
        LD        (Y), A
//   65   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xb
        LD        (Y), A
//   66   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xc
        LD        (Y), A
//   67   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xd
        LD        (Y), A
//   68 
//   69   /*  Set the channels Trigger registers to their reset values */
//   70   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xe
        LD        (Y), A
//   71   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xf
        LD        (Y), A
//   72   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x10
        LD        (Y), A
//   73   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
        ADDW      X, #0x11
        LD        (X), A
//   74 }
        RET
//   75 
//   76 /**
//   77   * @brief  Initializes the specified ADC peripheral according to the specified parameters.
//   78   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//   79   * @param  ADC_ConversionMode : specifies the ADC conversion mode,
//   80   *         This parameter can be one of the @ref ADC_ConversionMode_TypeDef
//   81   * @param  ADC_Resolution : specifies the ADC Data resolusion,
//   82   *         This parameter can be one of the @ref ADC_Resolution_TypeDef
//   83   * @param  ADC_Prescaler : specifies the ADC Prescaler,
//   84   *         This parameter can be one of the @ref ADC_Prescaler_TypeDef
//   85   * @retval None
//   86   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   87 void ADC_Init(ADC_TypeDef* ADCx,
//   88               ADC_ConversionMode_TypeDef ADC_ConversionMode,
//   89               ADC_Resolution_TypeDef ADC_Resolution,
//   90               ADC_Prescaler_TypeDef ADC_Prescaler)
//   91 {
ADC_Init:
        LD        S:?b2, A
//   92   /* Check the parameters */
//   93   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
//   94   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
//   95   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
//   96 
//   97   /*clear CR1 register */
//   98   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
        LD        A, #0x9b
        AND       A, (X)
        LD        (X), A
//   99 
//  100   /* set the resolution and the conversion mode */
//  101   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, (X)
        LD        (X), A
//  102 
//  103   /*clear CR2 register */
//  104   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC );
        INCW      X
        LD        A, #0x7f
        AND       A, (X)
        LD        (X), A
//  105 
//  106   /* set the Prescaler */
//  107   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
//  108 }
        RET
//  109 
//  110 
//  111 /**
//  112   * @brief  Enables or disables the selected ADC channel(s).
//  113   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  114   * @param  ADC_Channels: specifies the ADC channels to be initialized,
//  115   *         This parameter can be a value of @ref ADC_Channel_TypeDef, or a combination
//  116   *         of values as follows:
//  117   *           - 1st combination : channels from ADC_Channel_0 to ADC_Channel_7
//  118   *           - 2nd combination : channels from ADC_Channel_8 to ADC_Channel_15
//  119   *           - 3rd combination : channels from ADC_Channel_16 to ADC_Channel_23
//  120   * @param  NewState : new state of the specified ADC channel(s).
//  121   *         This parameter can be: ENABLE or DISABLE.
//  122   * @retval None
//  123   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  124 void ADC_ChannelCmd(ADC_TypeDef* ADCx,
//  125                     ADC_Channel_TypeDef ADC_Channels,
//  126                     FunctionalState NewState)
//  127 {
ADC_ChannelCmd:
        LDW       S:?w0, X
        LD        S:?b2, A
//  128   uint8_t regindex = 0;
//  129   /* Check the parameters */
//  130   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  131 
//  132   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
        LDW       X, Y
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
//  133 
//  134   if (NewState != DISABLE)
        ADDW      X, L:?w0
        ADDW      X, #0xa
        CLR       A
        CP        A, S:?b2
        LD        A, YL
        JREQ      L:??ADC_ChannelCmd_0
//  135   {
//  136     /* Enable the selected ADC channel(s). */
//  137     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
        OR        A, (X)
        LD        (X), A
        RET
//  138   }
//  139   else
//  140   {
//  141     /* Disable the selected ADC channel(s). */
//  142     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
??ADC_ChannelCmd_0:
        CPL       A
        AND       A, (X)
        LD        (X), A
//  143   }
//  144 }
        RET
//  145 
//  146 /**
//  147   * @brief  Enables or disables the selected ADC peripheral.
//  148   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  149   * @param  NewState : new state of the specified ADC peripheral.
//  150   *         This parameter can be: ENABLE or DISABLE.
//  151   * @retval None
//  152   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  153 void ADC_Cmd(ADC_TypeDef* ADCx,
//  154              FunctionalState NewState)
//  155 {
//  156   /* Check the parameters */
//  157   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  158 
//  159   if (NewState != DISABLE)
ADC_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??ADC_Cmd_0
//  160   {
//  161     /* Set the ADON bit to wake up the specified ADC from power down mode */
//  162     ADCx->CR1 |= ADC_CR1_ADON;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  163   }
//  164   else
//  165   {
//  166     /* Disable the selected ADC peripheral */
//  167     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
??ADC_Cmd_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  168   }
//  169 }
        RET
//  170 
//  171 /**
//  172   * @brief  Enables or disables the specified ADC interrupts.
//  173   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  174   * @param  ADC_IT : specifies the ADC interrupt sources to be enabled or disabled.
//  175   *         This parameter can be any combination of the @ref ADC_IT_TypeDef
//  176   * @param  NewState : new state of the specified ADC interrupts.
//  177   *         This parameter can be: ENABLE or DISABLE.
//  178   * @retval None
//  179   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  180 void ADC_ITConfig(ADC_TypeDef* ADCx,
//  181                   ADC_IT_TypeDef ADC_IT,
//  182                   FunctionalState NewState)
//  183 {
ADC_ITConfig:
        LD        S:?b1, A
//  184   /* Check the parameters */
//  185   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  186   assert_param(IS_ADC_IT(ADC_IT));
//  187 
//  188   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??ADC_ITConfig_0
//  189   {
//  190     /* Enable the selected ADC interrupts */
//  191     ADCx->CR1 |= (uint8_t) ADC_IT;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        RET
//  192   }
//  193   else
//  194   {
//  195     /* Disable the selected ADC interrupts */
//  196     ADCx->CR1 &= (uint8_t)(~ADC_IT);
??ADC_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  197   }
//  198 }
        RET
//  199 
//  200 /**
//  201   * @brief  Enables or disables the specified ADC DMA request.
//  202   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  203   * @param  NewState : new state of the specified ADC DMA transfer.
//  204   *         This parameter can be: ENABLE or DISABLE.
//  205   * @retval None
//  206   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 void ADC_DMACmd(ADC_TypeDef* ADCx,
//  208                 FunctionalState NewState)
//  209 {
//  210   /* Check the parameters */
//  211   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  212 
//  213   if (NewState != DISABLE)
ADC_DMACmd:
        ADDW      X, #0xa
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??ADC_DMACmd_0
//  214   {
//  215     /* Enable the specified ADC DMA request */
//  216     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
        LD        A, #0x7f
        AND       A, (X)
        LD        (X), A
        RET
//  217   }
//  218   else
//  219   {
//  220     /* Disable the specified ADC DMA request */
//  221     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
??ADC_DMACmd_0:
        LD        A, #0x80
        OR        A, (X)
        LD        (X), A
//  222   }
//  223 }
        RET
//  224 
//  225 /**
//  226   * @brief  Enables or disables the Temperature sensor internal reference.
//  227   * @param  NewState : new state of the Temperature sensor internal reference.
//  228   *         This parameter can be: ENABLE or DISABLE.
//  229   * @retval None
//  230   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  231 void ADC_TempSensorCmd(FunctionalState NewState)
//  232 {
//  233   /* Check the parameters */
//  234   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  235 
//  236   if (NewState != DISABLE)
ADC_TempSensorCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??ADC_TempSensorCmd_0
//  237   {
//  238     /*Enable the Temperature sensor internal reference.*/
//  239     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
        BSET      L:0x534e, #0x5
        RET
//  240   }
//  241   else
//  242   {
//  243     /*Disable the Temperature sensor internal reference.*/
//  244     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
??ADC_TempSensorCmd_0:
        BRES      L:0x534e, #0x5
//  245   }
//  246 }
        RET
//  247 
//  248 /**
//  249   * @brief  Enables or disables the Internal Voltage reference.
//  250   * @param  NewState : new state of the Internal Voltage reference.
//  251   *         This parameter can be: ENABLE or DISABLE.
//  252   * @retval None
//  253   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  254 void ADC_VrefintCmd(FunctionalState NewState)
//  255 {
//  256   /* Check the parameters */
//  257   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  258 
//  259   if (NewState != DISABLE)
ADC_VrefintCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??ADC_VrefintCmd_0
//  260   {
//  261     /* Enable the Internal Voltage reference.*/
//  262     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
        BSET      L:0x534e, #0x4
        RET
//  263   }
//  264   else
//  265   {
//  266     /* Disable the Internal Voltage reference.*/
//  267     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
??ADC_VrefintCmd_0:
        BRES      L:0x534e, #0x4
//  268   }
//  269 }
        RET
//  270 
//  271 /**
//  272   * @brief  Starts ADC conversion, by software trigger.
//  273   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  274   * @retval None
//  275   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  276 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
//  277 {
//  278   /*  Start the ADC software conversion */
//  279   ADCx->CR1 |= ADC_CR1_START;
ADC_SoftwareStartConv:
        LD        A, #0x2
        OR        A, (X)
        LD        (X), A
//  280 }
        RET
//  281 
//  282 /**
//  283   * @brief  Configures the sampling time for the selected ADC channel group.
//  284   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  285   * @param  ADC_GroupChannels : ADC channel group to configure.
//  286   *         This parameter can be a value of @ref ADC_Group_TypeDef
//  287   * @param  ADC_SamplingTime : Specifies the sample time value
//  288   *         This parameter can be a value of @ref ADC_SamplingTime_TypeDef
//  289   * @retval None
//  290   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  291 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
//  292                             ADC_Group_TypeDef ADC_GroupChannels,
//  293                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
//  294 {
//  295   /* Check the parameters */
//  296   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
//  297   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
//  298 
//  299   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
ADC_SamplingTimeConfig:
        CLR       S:?b1
        LD        S:?b2, A
        LD        A, S:?b1
        CP        A, S:?b2
        JREQ      L:??ADC_SamplingTimeConfig_0
//  300   {
//  301     /* Configures the sampling time for the Fast ADC channel group. */
//  302     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
        ADDW      X, #0x2
        LD        A, #0x1f
        AND       A, (X)
        LD        (X), A
//  303     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        SLL       A
        OR        A, (X)
        LD        (X), A
        RET
//  304   }
//  305   else
//  306   {
//  307     /* Configures the sampling time for the Slow ADC channel group. */
//  308     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
??ADC_SamplingTimeConfig_0:
        INCW      X
        LD        A, #0xf8
        AND       A, (X)
        LD        (X), A
//  309     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  310   }
//  311 }
        RET
//  312 
//  313 /**
//  314   * @brief  Configures the status of the Schmitt Trigger for the selected ADC channel(s).
//  315   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  316   * @param  ADC_Channels: specifies the ADC channels to be initialized,
//  317   *         This parameter can be a value of @ref ADC_Channel_TypeDef enumeration.
//  318   * @param  NewState : new state of the Schmitt Trigger
//  319   *         This parameter can be: ENABLE or DISABLE.
//  320   * @retval None
//  321   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  322 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx,
//  323                               ADC_Channel_TypeDef ADC_Channels,
//  324                               FunctionalState NewState)
//  325 {
ADC_SchmittTriggerConfig:
        LDW       S:?w0, X
        LD        S:?b2, A
//  326   uint8_t regindex = 0;
//  327   /* Check the parameters */
//  328   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  329 
//  330   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
        LDW       X, Y
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
//  331 
//  332   if (NewState != DISABLE)
        ADDW      X, L:?w0
        ADDW      X, #0xe
        CLR       A
        CP        A, S:?b2
        LD        A, YL
        JREQ      L:??ADC_SchmittTriggerConfig_0
//  333   {
//  334     /* Enable the Schmitt Trigger for the selected ADC channel(s).*/
//  335     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
        CPL       A
        AND       A, (X)
        LD        (X), A
        RET
//  336   }
//  337   else
//  338   {
//  339     /* Disable the Schmitt Trigger for the selected ADC channel(s).*/
//  340     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
??ADC_SchmittTriggerConfig_0:
        OR        A, (X)
        LD        (X), A
//  341   }
//  342 }
        RET
//  343 
//  344 /**
//  345   * @brief  Configures the ADC conversion through external trigger.
//  346   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  347   * @param  ADC_ExtEventSelection : Specifies the external trigger.
//  348   *         This parameter can be a value of @ref ADC_ExtEventSelection_TypeDef
//  349   * @param  ADC_ExtTRGSensitivity : Specifies the external trigger sensitivity.
//  350   *         This parameter can be a value of @ref ADC_ExtTRGSensitivity_TypeDef
//  351   * @retval None
//  352   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  353 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
//  354                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
//  355                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
//  356 {
ADC_ExternalTrigConfig:
        LD        S:?b1, A
//  357   /* Check the parameters */
//  358   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
//  359   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
//  360 
//  361   /*clear old config in CR2 register */
//  362   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
        INCW      X
        LD        A, #0x87
        AND       A, (X)
        LD        (X), A
//  363 
//  364   /* set the External Trigger Edge Sensitivity  and the external event selection*/
//  365   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | (uint8_t)ADC_ExtEventSelection);
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  366 }
        RET
//  367 
//  368 
//  369 /**
//  370   * @brief  Returns the last ADC converted data.
//  371   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  372   * @retval The Data conversion value.
//  373   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  374 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
//  375 {
//  376   uint16_t tmpreg = 0;
//  377 
//  378   /* Get last ADC converted data.*/
//  379   tmpreg = (uint16_t)(ADCx->DRH);
ADC_GetConversionValue:
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, (Y)
        LD        S:?b1, A
//  380   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
        ADDW      X, #0x5
        LD        A, (X)
        LD        S:?b0, A
//  381 
//  382   /* Return the selected ADC conversion value */
//  383   return (uint16_t)(tmpreg) ;
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
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
//  384 }
//  385 
//  386 
//  387 /**
//  388   * @brief  Configures the channel to be checked by the Analog watchdog.
//  389   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  390   * @param  ADC_AnalogWatchdogSelection : Specifies the channel to be checked by
//  391   *         by the Analog watchdog.
//  392   *         This parameter can be a value of @ref ADC_AnalogWatchdogSelection_TypeDef
//  393   * @retval None
//  394   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  395 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
//  396                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
//  397 {
ADC_AnalogWatchdogChannelSelect:
        LD        S:?b0, A
//  398   /* Check the parameters */
//  399   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
//  400 
//  401   /*reset the CHSEL bits */
//  402   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
        ADDW      X, #0x2
        LD        A, #0xe0
        AND       A, (X)
        LD        (X), A
//  403 
//  404   /* Select the channel to be checked by the Analog watchdog.*/
//  405   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  406 }
        RET
//  407 
//  408 /**
//  409   * @brief  Configures the high and low thresholds of the Analog watchdog.
//  410   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  411   * @param  HighThreshold: Analog watchdog High threshold value.
//  412     *       This parameter must be a 12bit value.
//  413   * @param  LowThreshold: Analog watchdog Low threshold value.
//  414     *       This parameter must be a 12bit value.
//  415   * @retval None
//  416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx,
//  418                                         uint16_t HighThreshold,
//  419                                         uint16_t LowThreshold)
//  420 {
ADC_AnalogWatchdogThresholdsConfig:
        LDW       S:?w1, X
//  421   /* Check the parameters */
//  422   assert_param(IS_ADC_THRESHOLD(HighThreshold));
//  423   assert_param(IS_ADC_THRESHOLD(LowThreshold));
//  424 
//  425   /* Set the ADC high threshold */
//  426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
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
        LDW       X, S:?w1
        ADDW      X, #0x6
        LD        (X), A
//  427   ADCx->HTRL = (uint8_t)(HighThreshold);
        LDW       X, S:?w1
        ADDW      X, #0x7
        LD        A, YL
        LD        (X), A
//  428 
//  429   /* Set the ADC low threshold */
//  430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
        LDW       X, S:?w0
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LDW       X, S:?w1
        ADDW      X, #0x8
        LD        (X), A
//  431   ADCx->LTRL = (uint8_t)(LowThreshold);
        LDW       X, S:?w1
        ADDW      X, #0x9
        LD        A, S:?b1
        LD        (X), A
//  432 }
        RET
//  433 
//  434 /**
//  435   * @brief  Configures the Analog watchdog.
//  436   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  437   * @param  ADC_AnalogWatchdogSelection : Specifies the channel to be checked by
//  438   *         by the Analog watchdog.
//  439   *         This parameter can be a value of @ref ADC_AnalogWatchdogSelection_TypeDef
//  440   * @param  HighThreshold: Analog watchdog High threshold value.
//  441     *       This parameter must be a 12bit value.
//  442   * @param  LowThreshold: Analog watchdog Low threshold value.
//  443     *       This parameter must be a 12bit value.
//  444   * @retval None
//  445   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  446 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
//  447                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
//  448                               uint16_t HighThreshold,
//  449                               uint16_t LowThreshold)
//  450 {
ADC_AnalogWatchdogConfig:
        LDW       S:?w1, X
        LD        S:?b4, A
//  451   /* Check the parameters */
//  452   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
//  453   assert_param(IS_ADC_THRESHOLD(HighThreshold));
//  454   assert_param(IS_ADC_THRESHOLD(LowThreshold));
//  455 
//  456   /*Reset the CHSEL bits */
//  457   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
        ADDW      X, #0x2
        LD        A, #0xe0
        AND       A, (X)
        LD        (X), A
//  458 
//  459   /* Select the channel to be checked by the Analog watchdog.*/
//  460   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
        LD        A, S:?b4
        OR        A, (X)
        LD        (X), A
//  461 
//  462   /* Set the ADC high threshold */
//  463   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
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
        LDW       X, S:?w1
        ADDW      X, #0x6
        LD        (X), A
//  464   ADCx->HTRL = (uint8_t)(HighThreshold);
        LDW       X, S:?w1
        ADDW      X, #0x7
        LD        A, YL
        LD        (X), A
//  465 
//  466   /* Set the ADC low threshold */
//  467   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
        LDW       X, S:?w0
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LDW       X, S:?w1
        ADDW      X, #0x8
        LD        (X), A
//  468   ADCx->LTRL = (uint8_t)LowThreshold;
        LDW       X, S:?w1
        ADDW      X, #0x9
        LD        A, S:?b1
        LD        (X), A
//  469 }
        RET
//  470 
//  471 /**
//  472   * @brief  Checks whether the specified ADC flag is set or not.
//  473   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  474   * @param  ADC_FLAG: specifies the flag to check.
//  475   *         This parameter can be a value of @ref ADC_FLAG_TypeDef
//  476   * @retval The new state of ADC_FLAG (SET or RESET).
//  477   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  478 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
//  479 {
//  480   FlagStatus flagstatus = RESET;
//  481 
//  482   /* Check the parameters */
//  483   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
//  484 
//  485   /* Check the status of the specified ADC flag */
//  486   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
ADC_GetFlagStatus:
        ADDW      X, #0x3
        AND       A, (X)
        JREQ      L:??ADC_GetFlagStatus_0
//  487   {
//  488     /* ADC_FLAG is set */
//  489     flagstatus = SET;
        LD        A, #0x1
        RET
//  490   }
//  491   else
//  492   {
//  493     /* ADC_FLAG is reset */
//  494     flagstatus = RESET;
??ADC_GetFlagStatus_0:
        CLR       A
//  495   }
//  496 
//  497   /* Return the ADC_FLAG status */
//  498   return  flagstatus;
        RET
//  499 }
//  500 
//  501 /**
//  502   * @brief  Clears the ADC's pending flags.
//  503   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  504   * @param  ADC_FLAG: specifies the flag to clear.
//  505   *         This parameter can be a value of @ref ADC_FLAG_TypeDef
//  506   * @retval None
//  507   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  508 void ADC_ClearFlag(ADC_TypeDef* ADCx,
//  509                    ADC_FLAG_TypeDef ADC_FLAG)
//  510 {
//  511   /* Check the parameters */
//  512   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
//  513 
//  514   /* Clear the selected ADC flags */
//  515   ADCx->SR = (uint8_t)~ADC_FLAG;
ADC_ClearFlag:
        ADDW      X, #0x3
        CPL       A
        LD        (X), A
//  516 }
        RET
//  517 
//  518 
//  519 /**
//  520   * @brief  Checks whether the specified ADC interrupt has occurred or not.
//  521   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  522   * @param  ADC_IT: specifies the ADC interrupt source to check.
//  523   *         This parameter can be a value of @ref ADC_IT_TypeDef
//  524   * @retval Status of ADC_IT (SET or RESET).
//  525   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  526 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
//  527                          ADC_IT_TypeDef ADC_IT)
//  528 {
ADC_GetITStatus:
        LD        S:?b0, A
//  529   ITStatus itstatus = RESET;
//  530   uint8_t itmask = 0, enablestatus = 0;
//  531 
//  532   /* Check the parameters */
//  533   assert_param(IS_ADC_GET_IT(ADC_IT));
//  534 
//  535   /* Get the ADC IT index */
//  536   itmask = (uint8_t)(ADC_IT >> 3);
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b1, A
//  537   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | (uint8_t)(itmask & (uint8_t)0x03));
//  538 
//  539   /* Get the ADC_IT enable bit status */
//  540   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
        LD        A, S:?b0
        AND       A, (X)
        LD        S:?b3, A
//  541 
//  542   /* Check the status of the specified ADC interrupt */
//  543   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
        LD        A, S:?b1
        AND       A, #0x10
        SRA       A
        SRA       A
        LD        S:?b2, A
        LD        A, S:?b1
        AND       A, #0x3
        LD        S:?b0, A
        LD        A, S:?b2
        OR        A, S:?b0
        ADDW      X, #0x3
        AND       A, (X)
        JREQ      L:??ADC_GetITStatus_0
        CLR       A
        CP        A, S:?b3
        JREQ      L:??ADC_GetITStatus_0
//  544   {
//  545     /* ADC_IT is set */
//  546     itstatus = SET;
        LD        A, #0x1
        RET
//  547   }
//  548   else
//  549   {
//  550     /* ADC_IT is reset */
//  551     itstatus = RESET;
??ADC_GetITStatus_0:
        CLR       A
//  552   }
//  553 
//  554   /* Return the ADC_IT status */
//  555   return  itstatus;
        RET
//  556 }
//  557 
//  558 /**
//  559   * @brief  Clears the ADC’s interrupt pending bits.
//  560   * @param  ADCx where x can be 1 to select the specified ADC peripheral.
//  561   * @param  ADC_IT: specifies the ADC interrupt pending bit to clear.
//  562   *         This parameter can be a value of @ref ADC_IT_TypeDef
//  563   * @retval None
//  564   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  565 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
//  566                            ADC_IT_TypeDef ADC_IT)
//  567 {
//  568   uint8_t itmask = 0;
//  569 
//  570   /* Check the parameters */
//  571   assert_param(IS_ADC_IT(ADC_IT));
//  572 
//  573   /* Get the ADC IT index */
//  574   itmask = (uint8_t)(ADC_IT >> 3);
ADC_ClearITPendingBit:
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b0, A
//  575   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | (uint8_t)(itmask & (uint8_t)0x03));
//  576 
//  577   /* Clear the selected ADC interrupt pending bits */
//  578   ADCx->SR = (uint8_t)~itmask;
        SRL       A
        SRL       A
        AND       A, #0x4
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0x3
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        CPL       A
        ADDW      X, #0x3
        LD        (X), A
//  579 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  580 
//  581 /**
//  582     * @}
//  583     */
//  584 
//  585 /**
//  586   * @}
//  587   */
//  588 
//  589 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 636 bytes in section .near_func.text
// 
// 636 bytes of CODE memory
//
//Errors: none
//Warnings: none
