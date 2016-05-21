///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:42 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_dac.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_dac.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_dac.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_dac

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?sll16_x_x_a
        EXTERN ?sra16_x_x_a
        EXTERN ?w0
        EXTERN ?w1

        PUBLIC DAC_ClearFlag
        PUBLIC DAC_ClearITPendingBit
        PUBLIC DAC_Cmd
        PUBLIC DAC_DMACmd
        PUBLIC DAC_DeInit
        PUBLIC DAC_DualSoftwareTriggerCmd
        PUBLIC DAC_GetDataOutputValue
        PUBLIC DAC_GetFlagStatus
        PUBLIC DAC_GetITStatus
        PUBLIC DAC_ITConfig
        PUBLIC DAC_Init
        PUBLIC DAC_NoiseWaveLFSR
        PUBLIC DAC_SetChannel1Data
        PUBLIC DAC_SetChannel2Data
        PUBLIC DAC_SetDualChannelData
        PUBLIC DAC_SoftwareTriggerCmd
        PUBLIC DAC_TriangleWaveAmplitude
        PUBLIC DAC_WaveGenerationCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_dac.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_dac.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the DAC firmware functions.
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
//   22 #include "stm8l15x_dac.h"
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
//   36     * @addtogroup DAC_Public_Functions
//   37     * @{
//   38     */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the DAC peripheral registers to their default reset values.
//   42   * @param  None
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void DAC_DeInit(void)
//   46 {
//   47   /*  Set Channel1  the Configuration registers to their reset values */
//   48   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
DAC_DeInit:
        CLR       A
        LD        L:0x5380, A
//   49   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
        LD        L:0x5381, A
//   50 
//   51   /*  Set Channel2  the Configuration registers to their reset values */
//   52   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
        LD        L:0x5382, A
//   53   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
        LD        L:0x5383, A
//   54 
//   55   /*  Set the Software Trigger configuration registers to their reset values */
//   56   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
        LD        L:0x5384, A
//   57 
//   58   /*  Set the Status registers to their reset values */
//   59   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x5385, A
//   60 
//   61   /*  Set the Channel1 Data holding registers to their reset values */
//   62   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
        CLR       A
        LD        L:0x5388, A
//   63   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
        LD        L:0x5389, A
//   64   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
        LD        L:0x538c, A
//   65   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
        LD        L:0x538d, A
//   66   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
        LD        L:0x5390, A
//   67 
//   68   /*  Set the Channel2 Data holding registers to their reset values */
//   69   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
        LD        L:0x5394, A
//   70   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
        LD        L:0x5395, A
//   71   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
        LD        L:0x5398, A
//   72   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
        LD        L:0x5399, A
//   73   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
        LD        L:0x539c, A
//   74 
//   75   /*  Set the Dual mode 12bit Right Data holding registers to their reset values */
//   76   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
        LD        L:0x53a0, A
//   77   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
        LD        L:0x53a1, A
//   78   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
        LD        L:0x53a2, A
//   79   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
        LD        L:0x53a3, A
//   80 
//   81   /*  Set the Dual mode 12bit Left Data holding registers to their reset values */
//   82   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
        LD        L:0x53a4, A
//   83   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
        LD        L:0x53a5, A
//   84   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
        LD        L:0x53a6, A
//   85   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
        LD        L:0x53a7, A
//   86 
//   87   /*  Set the Dual mode 8bit Data holding registers to their reset values */
//   88   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
        LD        L:0x53a8, A
//   89   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
        LD        L:0x53a9, A
//   90 }
        RET
//   91 
//   92 /**
//   93   * @brief  Initializes the DAC according to the specified parameters.
//   94   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//   95   *         enumeration.
//   96   * @param  DAC_Trigger : the selected DAC trigger from @ref DAC_Trigger_TypeDef
//   97   *         enumeration.
//   98   * @param  DAC_OutputBuffer : the status of DAC load Buffer from
//   99   *         @ref DAC_OutputBuffer_TypeDef enumeration.
//  100   * @retval None
//  101   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  102 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
//  103               DAC_Trigger_TypeDef DAC_Trigger,
//  104               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
//  105 {
//  106   uint8_t tmpreg = 0;
//  107   uint16_t tmpreg2 = 0;
//  108 
//  109   /* Check the DAC parameters */
//  110   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  111   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
//  112   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
//  113 
//  114   /* Get the DAC CHxCR1 value */
//  115   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
DAC_Init:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5380
        LD        A, #0xc1
        AND       A, (X)
        OR        A, S:?b1
        LD        S:?b1, A
//  116   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
//  117 
//  118   /* Clear BOFFx, TENx, TSELx bits */
//  119   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
//  120 
//  121   /* Set BOFFx bit according to DAC_OutputBuffer value */
//  122   tmpreg |= (uint8_t)(DAC_OutputBuffer);
//  123 
//  124 
//  125   /* Configure for the selected DAC channel trigger*/
//  126   if (DAC_Trigger != DAC_Trigger_None)
        LD        A, S:?b0
        CP        A, #0x30
        JREQ      L:??DAC_Init_0
//  127   {
//  128     /* Set TSELx and TEN  bits according to DAC_Trigger value */
//  129     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
        OR        A, #0x4
        OR        A, S:?b1
        LD        S:?b1, A
//  130   }
//  131 
//  132   /* Write to DAC CHxCR1 */
//  133   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
??DAC_Init_0:
        LD        A, S:?b1
        LD        (X), A
//  134 }
        RET
//  135 
//  136 /**
//  137   * @brief  Enables or disables DAC Wave Generation according to the specified
//  138   *         parameters.
//  139   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  140   *         enumeration.
//  141   * @param  DAC_Wave : the selected waveform from @ref DAC_Wave_TypeDef enumeration.
//  142   * @retval None
//  143   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  144 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
//  145                            DAC_Wave_TypeDef DAC_Wave,
//  146                            FunctionalState NewState)
//  147 {
//  148   uint8_t tmpreg = 0;
//  149 
//  150   /* Check the DAC parameters */
//  151   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  152   assert_param(IS_DAC_WAVE(DAC_Wave));
//  153   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  154 
//  155   /* Get the DAC CHxCR1 value & Clear WAVEN bits */
//  156   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
DAC_WaveGenerationCmd:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5380
        LD        A, #0x3f
        AND       A, (X)
        LD        S:?b2, A
//  157 
//  158   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b1
        JREQ      L:??DAC_WaveGenerationCmd_0
//  159   {
//  160     tmpreg |= (uint8_t)(DAC_Wave);
        LD        A, S:?b0
        OR        A, S:?b2
        LD        S:?b2, A
//  161   }
//  162 
//  163   /* Write to DAC CHxCR1 */
//  164   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
??DAC_WaveGenerationCmd_0:
        LD        A, S:?b2
        LD        (X), A
//  165 
//  166 }
        RET
//  167 
//  168 
//  169 /**
//  170   * @brief  Select DAC Noise Wave Generation LFSR according to the specified
//  171   *         parameters.
//  172   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  173   *         enumeration.
//  174   * @param  DAC_LFSRUnmask : the selected unmasked bit from
//  175   *         @ref DAC_LFSRUnmask_TypeDef enumeration.
//  176   * @retval None
//  177   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  178 void DAC_NoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
//  179 {
//  180   uint8_t tmpreg = 0;
//  181   uint16_t cr2addr = 0;
//  182 
//  183   /* Check the DAC parameters */
//  184   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  185   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
//  186 
//  187   /* Get the DAC CHxCR2 value  &  Clear MAMPx bits */
//  188   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
DAC_NoiseWaveLFSR:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
//  189   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
//  190 
//  191   /* Write to DAC CHxCR2 */
//  192   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
        LD        A, #0xf0
        AND       A, (X)
        OR        A, S:?b0
        LD        (X), A
//  193 }
        RET
//  194 /**
//  195   * @brief  Select DAC Triangle Wave Generation Amplitude according
//  196   *         to the specified parameters.
//  197   * @param  DAC_Channel : the selected DAC channel from
//  198   *         @ref DAC_Channel_TypeDef enumeration.
//  199   * @param  DAC_TriangleAmplitude : the selected Amplitude from
//  200   *         @ref DAC_TriangleAmplitude_TypeDef enumeration.
//  201   * @retval None
//  202   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  203 void DAC_TriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
//  204 {
//  205   uint8_t tmpreg = 0;
//  206   uint16_t cr2addr = 0;
//  207 
//  208   /* Check the DAC parameters */
//  209   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  210   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
//  211 
//  212 
//  213   /* Get the DAC CHxCR2 value  &  Clear MAMPx bits */
//  214   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
DAC_TriangleWaveAmplitude:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
//  215   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
//  216 
//  217   /* Write to DAC CHxCR2 */
//  218   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
        LD        A, #0xf0
        AND       A, (X)
        OR        A, S:?b0
        LD        (X), A
//  219 }
        RET
//  220 /**
//  221   * @brief  Enables or disables the specified DAC channel.
//  222   * @param  DAC_Channel : the selected DAC channel from
//  223   *         @ref DAC_Channel_TypeDef enumeration.
//  224   * @param  NewState : new state of the DAC channel.
//  225   *         This parameter can be: ENABLE or DISABLE.
//  226   * @retval None
//  227   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  228 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
//  229 {
//  230   uint16_t cr1addr = 0;
//  231   /* Check the parameters */
//  232   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  233   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  234 
//  235   /* Find CHxCR1 register Address */
//  236   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
DAC_Cmd:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5380
//  237 
//  238   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??DAC_Cmd_0
//  239   {
//  240     /* Enable the selected DAC channel */
//  241     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  242   }
//  243   else
//  244   {
//  245     /* Disable the selected DAC channel */
//  246     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
??DAC_Cmd_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  247   }
//  248 }
        RET
//  249 
//  250 /**
//  251   * @brief  Enables or disables the specified DAC interrupts.
//  252   * @param  DAC_Channel : the selected DAC channel from
//  253   *         @ref DAC_Channel_TypeDef enumeration.
//  254   * @param  DAC_IT : the selected DAC interrupt from
//  255   *         @ref DAC_IT_TypeDef enumeration.
//  256   * @param  NewState : new state of the DAC interrupt .
//  257   *         This parameter can be: ENABLE or DISABLE.
//  258   * @retval None
//  259   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  260 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT,
//  261                   FunctionalState NewState)
//  262 {
//  263   uint16_t cr2addr = 0;
//  264 
//  265   /* Check the parameters */
//  266   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  267   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  268   assert_param(IS_DAC_IT(DAC_IT));
//  269 
//  270   /* Find CHxCR2 register Address */
//  271   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
DAC_ITConfig:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
//  272 
//  273   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b1
        JREQ      L:??DAC_ITConfig_0
//  274   {
//  275     /* Enable the selected DAC interrupts */
//  276     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
        RET
//  277   }
//  278   else
//  279   {
//  280     /* Disable the selected DAC interrupts */
//  281     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
??DAC_ITConfig_0:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, (X)
        LD        (X), A
//  282   }
//  283 }
        RET
//  284 
//  285 /**
//  286   * @brief  Enables or disables the specified DAC channel DMA request.
//  287   * @param  DAC_Channel : the selected DAC channel from
//  288   *         @ref DAC_Channel_TypeDef enumeration.
//  289   * @param  NewState : new state of the selected DAC channel DMA request.
//  290   *         This parameter can be: ENABLE or DISABLE.
//  291   * @retval None.
//  292   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  293 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
//  294 {
//  295   uint16_t cr2addr = 0;
//  296 
//  297   /* Check the parameters */
//  298   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  299   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  300 
//  301   /* Find CHxCR2 register Address */
//  302   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
DAC_DMACmd:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
//  303 
//  304   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??DAC_DMACmd_0
//  305   {
//  306     /* Enable the selected DAC channel DMA request */
//  307     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
        LD        A, #0x10
        OR        A, (X)
        LD        (X), A
        RET
//  308   }
//  309   else
//  310   {
//  311     /* Disable the selected DAC channel DMA request */
//  312     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
??DAC_DMACmd_0:
        LD        A, #0xef
        AND       A, (X)
        LD        (X), A
//  313   }
//  314 }
        RET
//  315 
//  316 /**
//  317   * @brief  Enables or disables the selected DAC channel software trigger.
//  318   * @param  DAC_Channel : the selected DAC channel from
//  319   *         @ref DAC_Channel_TypeDef enumeration.
//  320   * @param  NewState : new state of the selected DAC channel software trigger.
//  321   *         This parameter can be: ENABLE or DISABLE.
//  322   * @retval None.
//  323   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  324 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
//  325 {
DAC_SoftwareTriggerCmd:
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        CLR       A
        CP        A, S:?b0
        JREQ      L:??DAC_SoftwareTriggerCmd_0
//  326   /* Check the parameters */
//  327   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  328   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  329 
//  330   if (NewState != DISABLE)
//  331   {
//  332     /* Enable software trigger for the selected DAC channel */
//  333     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
        LD        A, S:?b1
        OR        A, L:0x5384
        LD        L:0x5384, A
        RET
//  334   }
//  335   else
//  336   {
//  337     /* Disable software trigger for the selected DAC channel */
//  338     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
??DAC_SoftwareTriggerCmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5384
        LD        L:0x5384, A
//  339   }
//  340 }
        RET
//  341 
//  342 
//  343 /**
//  344   * @brief  Enables or disables the dual channel DAC  software triggers.
//  345   * @param  NewState : new state of the  DAC channels software triggers.
//  346   *         This parameter can be: ENABLE or DISABLE.
//  347   * @retval None.
//  348   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  349 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
//  350 {
//  351   /* Check the parameters */
//  352   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  353 
//  354   if (NewState != DISABLE)
DAC_DualSoftwareTriggerCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??DAC_DualSoftwareTriggerCmd_0
//  355   {
//  356     /* Enable software trigger for both DAC channels */
//  357     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
        LD        A, #0x3
        OR        A, L:0x5384
        LD        L:0x5384, A
        RET
//  358   }
//  359   else
//  360   {
//  361     /* Disable software trigger for both DAC channels */
//  362     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
??DAC_DualSoftwareTriggerCmd_0:
        LD        A, #0xfc
        AND       A, L:0x5384
        LD        L:0x5384, A
//  363   }
//  364 }
        RET
//  365 
//  366 
//  367 /**
//  368   * @brief  Set the specified data holding register value for DAC channel1.
//  369   * @param  DAC_Align : Specifies the data alignement for DAC channel1 from
//  370   *         @ref DAC_Align_TypeDef enumeration.
//  371   * @param  DAC_Data : Data to be loaded in the selected data holding register.
//  372   * @retval None.
//  373   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  374 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
//  375 {
DAC_SetChannel1Data:
        LDW       Y, X
//  376   /* Check the parameters */
//  377   assert_param(IS_DAC_ALIGN(DAC_Align));
//  378 
//  379   if (DAC_Align != DAC_Align_8b_R)
        CP        A, #0x8
        JREQ      L:??DAC_SetChannel1Data_0
//  380   {
//  381     /* Set the DAC channel1 selected data holding register */
//  382     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
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
        LDW       X, S:?w0
        ADDW      X, #0x5388
        LD        (X), A
//  383     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
        LDW       X, S:?w0
        ADDW      X, #0x5389
        LD        A, YL
        LD        (X), A
        RET
//  384   }
//  385   else
//  386   {
//  387     /* Check the parameter */
//  388     assert_param(IS_DAC_DATA_08R(DAC_Data));
//  389 
//  390     /* Set the DAC channel1 selected data holding register */
//  391     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
??DAC_SetChannel1Data_0:
        LD        A, YL
        LD        L:0x5390, A
//  392   }
//  393 }
        RET
//  394 
//  395 /**
//  396   * @brief  Set the specified data holding register value for DAC channel2.
//  397   * @param  DAC_Align : Specifies the data alignement for DAC channel2 from
//  398   *         @ref DAC_Align_TypeDef enumeration.
//  399   * @param  DAC_Data : Data to be loaded in the selected data holding register.
//  400   * @retval None.
//  401   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  402 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
//  403 {
DAC_SetChannel2Data:
        LDW       Y, X
//  404   /* Check the parameters */
//  405   assert_param(IS_DAC_ALIGN(DAC_Align));
//  406 
//  407   if (DAC_Align != DAC_Align_8b_R)
        CP        A, #0x8
        JREQ      L:??DAC_SetChannel2Data_0
//  408   {
//  409     /* Set the DAC channel2 selected data holding register */
//  410     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
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
        LDW       X, S:?w0
        ADDW      X, #0x5394
        LD        (X), A
//  411     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
        LDW       X, S:?w0
        ADDW      X, #0x5395
        LD        A, YL
        LD        (X), A
        RET
//  412   }
//  413   else
//  414   {
//  415     /* Check the parameter */
//  416     assert_param(IS_DAC_DATA_08R(DAC_Data));
//  417 
//  418     /* Set the DAC channel2 selected data holding register */
//  419     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
??DAC_SetChannel2Data_0:
        LD        A, YL
        LD        L:0x539c, A
//  420   }
//  421 }
        RET
//  422 
//  423 /**
//  424   * @brief  Set the specified data holding register value for DAC Dual channels data.
//  425   * @param  DAC_Align : Specifies the data alignement for DAC channel2 from
//  426   *         @ref DAC_Align_TypeDef enumeration.
//  427   * @param  DAC_Data2 : Data to be loaded in the selected data holding register
//  428   *         for channel 2.
//  429   * @param  DAC_Data1 : Data to be loaded in the selected data holding register
//  430   *         for channel 1.
//  431   * @retval None.
//  432   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  433 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align,
//  434                             uint16_t DAC_Data2,
//  435                             uint16_t DAC_Data1)
//  436 {
DAC_SetDualChannelData:
        LDW       S:?w1, X
//  437   uint16_t dchxrdhrhaddr = 0;
//  438 
//  439   /* Check the parameters */
//  440   assert_param(IS_DAC_ALIGN(DAC_Align));
//  441 
//  442   if (DAC_Align != DAC_Align_8b_R)
        CP        A, #0x8
        JREQ      L:??DAC_SetDualChannelData_0
//  443   {
//  444     /* Identify the DCHxRDHRH address*/
//  445     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
        CLRW      X
        LD        XL, A
        ADDW      X, #0x53a0
        LDW       S:?w0, X
//  446 
//  447     /* Set the DAC channels Dual data holding registers */
//  448     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
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
        LD        [S:?w0.w], A
//  449     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
        LDW       X, S:?w0
        INCW      X
        LD        A, YL
        LD        (X), A
//  450     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
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
        LDW       X, S:?w0
        ADDW      X, #0x2
        LD        (X), A
//  451     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
        LDW       X, S:?w0
        ADDW      X, #0x3
        LD        A, S:?b3
        LD        (X), A
        RET
//  452   }
//  453   else
//  454   {
//  455     /* Check the parameter */
//  456     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
//  457 
//  458     /* Set the DAC channels Dual data holding registers */
//  459     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
??DAC_SetDualChannelData_0:
        LD        A, YL
        LD        L:0x53a8, A
//  460     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
        LD        A, S:?b3
        LD        L:0x53a9, A
//  461   }
//  462 }
        RET
//  463 /**
//  464   * @brief  Returns the last data output value of the selected DAC channel.
//  465   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  466   *         enumeration.
//  467   * @retval The selected DAC channel data output value.
//  468   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  469 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
//  470 {
//  471   uint16_t outputdata = 0;
//  472   uint16_t tmp = 0;
//  473 
//  474   /* Check the parameters */
//  475   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  476 
//  477   if ( DAC_Channel ==  DAC_Channel_1)
DAC_GetDataOutputValue:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JRNE      L:??DAC_GetDataOutputValue_0
//  478   {
//  479     /* Returns the DAC channel data output register value */
//  480     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
        LD        A, L:0x53ac
//  481     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
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
        LD        A, L:0x53ad
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
//  482   }
//  483   else
//  484   {
//  485     /* Returns the DAC channel data output register value */
//  486     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
??DAC_GetDataOutputValue_0:
        LD        A, L:0x53b0
//  487     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
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
        LD        A, L:0x53b1
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
//  488   }
//  489 
//  490   /* return the selected DAC channel data output value.*/
//  491   return (uint16_t)outputdata;
        RET
//  492 }
//  493 /**
//  494   * @brief  Checks whether the specified DAC flag is set or not.
//  495   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  496   *         enumeration.
//  497   * @param  DAC_FLAG : specifies the flag to check from @ref DAC_FLAG_TypeDef
//  498   *         enumeration.
//  499   * @retval FlagStatus The new state of DAC_FLAG (SET or RESET).
//  500   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  501 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
//  502 {
//  503   FlagStatus flagstatus = RESET;
//  504   uint8_t flag = 0;
//  505 
//  506   /* Check the parameters */
//  507   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  508   assert_param(IS_DAC_FLAG(DAC_FLAG));
//  509 
//  510   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
//  511 
//  512   /* Check the status of the specified DAC flag */
//  513   if ((DAC->SR & flag ) != (uint8_t)RESET)
DAC_GetFlagStatus:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, L:0x5385
        JREQ      L:??DAC_GetFlagStatus_0
//  514   {
//  515     /* DAC FLAG is set */
//  516     flagstatus = SET;
        LD        A, #0x1
        RET
//  517   }
//  518   else
//  519   {
//  520     /* DAC FLAG is reset */
//  521     flagstatus = RESET;
??DAC_GetFlagStatus_0:
        CLR       A
//  522   }
//  523 
//  524   /* Return the DAC FLAG status */
//  525   return  flagstatus;
        RET
//  526 }
//  527 
//  528 /**
//  529   * @brief  Clears the DAC channelx's pending flags.
//  530   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  531   *         enumeration.
//  532   * @param  DAC_FLAG : specifies the flag to clear from @ref DAC_FLAG_TypeDef
//  533   *         enumeration.
//  534   * @retval None.
//  535   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  536 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
//  537 {
//  538   uint8_t flag = 0;
//  539 
//  540   /* Check the parameters */
//  541   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  542   assert_param(IS_DAC_FLAG(DAC_FLAG));
//  543 
//  544   /* identify the selected flag*/
//  545   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
//  546 
//  547   /* Clear the selected DAC flag */
//  548   DAC->SR = (uint8_t)(~flag);
DAC_ClearFlag:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        LD        L:0x5385, A
//  549 }
        RET
//  550 /**
//  551   * @brief  Checks whether the specified DAC interrupt has occurred or not.
//  552   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  553   *         enumeration.
//  554   * @param  DAC_IT : specifies the DAC interrupt source to check from
//  555   *         @ref DAC_IT_TypeDef enumeration.
//  556   * @retval ITStatus The new state of DAC_IT (SET or RESET).
//  557   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  558 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
//  559 {
DAC_GetITStatus:
        LD        S:?b2, A
//  560   ITStatus itstatus = RESET;
//  561   uint8_t enablestatus = 0;
//  562   uint8_t flagstatus = 0;
//  563   uint8_t tempreg = 0;
//  564 
//  565   /* Check the parameters */
//  566   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  567   assert_param(IS_DAC_IT(DAC_IT));
//  568 
//  569   /* identify the status of the IT and its correspondent flag*/
//  570   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
//  571   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        EXG       A, YL
        SLL       A
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
        LDW       S:?w0, X
        LD        A, S:?b2
        LDW       X, Y
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, [S:?w0.w]
        LD        S:?b1, A
//  572   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
        LD        A, L:0x5385
        LD        S:?b0, A
//  573 
//  574   /* Check the status of the specified DAC interrupt */
//  575   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
        LD        A, #0x5
        SUB       A, S:?b2
        LDW       X, Y
        CALL      L:?sra16_x_x_a
        LD        A, XL
        AND       A, S:?b0
        JREQ      L:??DAC_GetITStatus_0
        CLR       A
        CP        A, S:?b1
        JREQ      L:??DAC_GetITStatus_0
//  576   {
//  577     /* DAC IT is set */
//  578     itstatus = SET;
        LD        A, #0x1
        RET
//  579   }
//  580   else
//  581   {
//  582     /* DAC IT is reset */
//  583     itstatus = RESET;
??DAC_GetITStatus_0:
        CLR       A
//  584   }
//  585 
//  586   /* Return the DAC IT status */
//  587   return  itstatus;
        RET
//  588 }
//  589 
//  590 /**
//  591   * @brief   Clears the DAC channelx’s interrupt pending bits.
//  592   * @param  DAC_Channel : the selected DAC channel from @ref DAC_Channel_TypeDef
//  593   *         enumeration.
//  594   * @param  DAC_IT : specifies the DAC interrupt pending bit to clear from
//  595   *         @ref DAC_IT_TypeDef enumeration.
//  596   * @retval None.
//  597   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  598 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
//  599 {
DAC_ClearITPendingBit:
        LD        S:?b1, A
//  600   /* Check the parameters */
//  601   assert_param(IS_DAC_CHANNEL(DAC_Channel));
//  602   assert_param(IS_DAC_IT(DAC_IT));
//  603 
//  604   /* Clear the selected DAC interrupt pending bits */
//  605   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
        LD        A, #0x5
        SUB       A, S:?b1
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        CALL      L:?sra16_x_x_a
        LD        A, XL
        CPL       A
        LD        L:0x5385, A
//  606 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  607 
//  608 /**
//  609     * @}
//  610     */
//  611 
//  612 /**
//  613   * @}
//  614   */
//  615 
//  616 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 617 bytes in section .near_func.text
// 
// 617 bytes of CODE memory
//
//Errors: none
//Warnings: none
