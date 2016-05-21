///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:50 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_clk.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_clk.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_clk.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_clk

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC CLK_AdjustHSICalibrationValue
        PUBLIC CLK_BEEPClockConfig
        PUBLIC CLK_CCOConfig
        PUBLIC CLK_ClearFlag
        PUBLIC CLK_ClearITPendingBit
        PUBLIC CLK_ClockSecuritySystemEnable
        PUBLIC CLK_ClockSecuritySytemDeglitchCmd
        PUBLIC CLK_DeInit
        PUBLIC CLK_GetClockFreq
        PUBLIC CLK_GetFlagStatus
        PUBLIC CLK_GetITStatus
        PUBLIC CLK_GetSYSCLKSource
        PUBLIC CLK_HSEConfig
        PUBLIC CLK_HSICmd
        PUBLIC CLK_HaltConfig
        PUBLIC CLK_ITConfig
        PUBLIC CLK_LSEClockSecuritySystemEnable
        PUBLIC CLK_LSEConfig
        PUBLIC CLK_LSICmd
        PUBLIC CLK_MainRegulatorCmd
        PUBLIC CLK_PeripheralClockConfig
        PUBLIC CLK_RTCCLKSwitchOnLSEFailureEnable
        PUBLIC CLK_RTCClockConfig
        PUBLIC CLK_SYSCLKDivConfig
        PUBLIC CLK_SYSCLKSourceConfig
        PUBLIC CLK_SYSCLKSourceSwitchCmd
        PUBLIC SYSDivFactor

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_clk.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_clk.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the CLK firmware functions.
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
//   22 
//   23 #include "stm8l15x_clk.h"
//   24 
//   25 /** @addtogroup STM8L15x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private Variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /**
//   36   * @addtogroup CLK_Private_Constants
//   37   * @{
//   38   */
//   39 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   40 __CONST uint8_t SYSDivFactor[5] =
SYSDivFactor:
        DC8 1, 2, 4, 8, 16
//   41   {
//   42     1, 2, 4, 8, 16
//   43   }
//   44   ; /*!< Holds the different Master clock Divider factors */
//   45 
//   46 /**
//   47   * @}
//   48   */
//   49 
//   50 /**
//   51   * @addtogroup CLK_Public_Functions
//   52   * @{
//   53   */
//   54 
//   55 /**
//   56   * @brief  Deinitializes the CLK peripheral registers to their default reset values.
//   57   * @param  None
//   58   * @retval None
//   59   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 void CLK_DeInit(void)
//   61 {
//   62   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
CLK_DeInit:
        LD        A, #0x11
        LD        L:0x50c2, A
//   63   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
        CLR       A
        LD        L:0x50c6, A
//   64   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
        LD        L:0x50c1, A
//   65   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
        LD        L:0x50cb, A
//   66   CLK->SWR  = CLK_SWR_RESET_VALUE;
        LD        A, #0x1
        LD        L:0x50c8, A
//   67   CLK->SWCR = CLK_SWCR_RESET_VALUE;
        CLR       A
        LD        L:0x50c9, A
//   68   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
        LD        A, #0x3
        LD        L:0x50c0, A
//   69   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
        CLR       A
        LD        L:0x50c3, A
//   70   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
        LD        A, #0x80
        LD        L:0x50c4, A
//   71   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
        CLR       A
        LD        L:0x50d0, A
//   72   CLK->CSSR = CLK_CSSR_RESET_VALUE;
        LD        L:0x50ca, A
//   73   CLK->CCOR = CLK_CCOR_RESET_VALUE;
        LD        L:0x50c5, A
//   74   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
        LD        L:0x50cd, A
//   75   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
        LD        L:0x50cc, A
//   76   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
        LD        L:0x50ce, A
//   77   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
        LD        A, #0xb9
        LD        L:0x50cf, A
//   78 }
        RET
//   79 
//   80 /**
//   81   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
//   82   * @param  NewState : new state of HSI, value accepted ENABLE, DISABLE.
//   83   * @retval None
//   84   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void CLK_HSICmd(FunctionalState NewState)
//   86 {
//   87 
//   88   /* Check the parameters */
//   89   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   90 
//   91   if (NewState != DISABLE)
CLK_HSICmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??CLK_HSICmd_0
//   92   {
//   93     /* Set HSION bit */
//   94     CLK->ICKCR |= CLK_ICKCR_HSION;
        BSET      L:0x50c2, #0x0
        RET
//   95   }
//   96   else
//   97   {
//   98     /* Reset HSION bit */
//   99     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
??CLK_HSICmd_0:
        BRES      L:0x50c2, #0x0
//  100   }
//  101 }
        RET
//  102 
//  103 /**
//  104   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
//  105   * @param  CLK_HSICalibrationValue : calibration trimming value.
//  106   * @retval None
//  107   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
//  109 {
CLK_AdjustHSICalibrationValue:
        LD        S:?b0, A
//  110   /* two consecutive write access to HSIUNLCKR register to unlock HSITRIMR */
//  111   CLK->HSIUNLCKR = 0xAC;
        LD        A, #0xac
        LD        L:0x50ce, A
//  112   CLK->HSIUNLCKR = 0x35;
        LD        A, #0x35
        LD        L:0x50ce, A
//  113 
//  114   /* Store the new value */
//  115   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
        LD        A, S:?b0
        LD        L:0x50cd, A
//  116 }
        RET
//  117 
//  118 /**
//  119   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
//  120   * @param  NewState : new state of LSI, value accepted ENABLE, DISABLE.
//  121   * @retval None
//  122   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  123 void CLK_LSICmd(FunctionalState NewState)
//  124 {
//  125 
//  126   /* Check the parameters */
//  127   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  128 
//  129   if (NewState != DISABLE)
CLK_LSICmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??CLK_LSICmd_0
//  130   {
//  131     /* Set LSION bit */
//  132     CLK->ICKCR |= CLK_ICKCR_LSION;
        BSET      L:0x50c2, #0x2
        RET
//  133   }
//  134   else
//  135   {
//  136     /* Reset LSION bit */
//  137     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
??CLK_LSICmd_0:
        BRES      L:0x50c2, #0x2
//  138   }
//  139 }
        RET
//  140 
//  141 /**
//  142   * @brief  Configures the HSE Clock source.
//  143   * @note   In case of Enabling HSE Bypass be sure
//  144   *         that SWI, CKM and Clock RTC are not using HSE as clock source
//  145   * @param  CLK_HSE : This parameter specifies the HSE clock configuarton.
//  146   *         This parameter can be a value of @ref CLK_HSE_TypeDef.
//  147   * @retval None
//  148   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  149 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
//  150 {
//  151   /* Check the parameters */
//  152   assert_param(IS_CLK_HSE(CLK_HSE));
//  153 
//  154   /* Reset HSEON and HSEBYP bits before configuring the HSE ------------------*/
//  155   /* Reset HSEON bit */
//  156   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
CLK_HSEConfig:
        BRES      L:0x50c6, #0x0
//  157 
//  158   /* Reset HSEBYP bit */
//  159   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
        BRES      L:0x50c6, #0x4
//  160 
//  161   /* Configure HSE */
//  162   CLK->ECKCR |= (uint8_t)CLK_HSE;
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  163 }
        RET
//  164 
//  165 /**
//  166   * @brief  Configures the LSE Clock source.
//  167   * @note   In case of Enabling LSE ByPass be sure that SWI, CKM
//  168   *        and Clock RTC are not using LSE as clock source
//  169   * @param  CLK_LSE : This parameter specifies the LSE clock configuarton.
//  170   *         This parameter can be a value of @ref CLK_ConfigLSE_TypeDef.
//  171   * @retval None
//  172   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  173 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
//  174 {
//  175   /* Check the parameters */
//  176   assert_param(IS_CLK_LSE(CLK_LSE));
//  177 
//  178   /* Reset LSEON and LSEBYP bits before configuring the LSE ------------------*/
//  179   /* Reset LSEON bit */
//  180   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
CLK_LSEConfig:
        BRES      L:0x50c6, #0x2
//  181 
//  182   /* Reset LSEBYP bit */
//  183   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
        BRES      L:0x50c6, #0x5
//  184 
//  185   /* Configure LSE */
//  186   CLK->ECKCR |= (uint8_t)CLK_LSE;
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  187 
//  188 }
        RET
//  189 
//  190 /**
//  191   * @brief  Configures the System clock (SYSCLK) source.
//  192   * @param  CLK_SYSCLKSource : Specifies the new clock.
//  193   *         This parameter can be a value of @ref CLK_SYSCLKSource_TypeDef.
//  194   * @retval None
//  195   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  196 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
//  197 {
//  198   /* check teh parameters */
//  199   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
//  200 
//  201   /* Selection of the target clock source */
//  202   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
CLK_SYSCLKSourceConfig:
        LD        L:0x50c8, A
//  203 }
        RET
//  204 
//  205 /**
//  206   * @brief Configures the System clock (SYSCLK) dividers.
//  207   * @param CLK_SYSCLKDiv : Specifies the system clock divider to apply.
//  208   *        This parameter can be a value of @ref CLK_SYSCLKDiv_TypeDef.
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
//  212 {
//  213   /* check the parameters */
//  214   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
//  215 
//  216   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
CLK_SYSCLKDivConfig:
        LD        L:0x50c0, A
//  217 }
        RET
//  218 /**
//  219   * @brief  Enables or disables the clock switch execution.
//  220   * @param  NewState : new state of clock switch, value accepted ENABLE, DISABLE.
//  221   * @retval None
//  222   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  223 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
//  224 {
//  225   /* Check the parameters */
//  226   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  227 
//  228   if (NewState != DISABLE)
CLK_SYSCLKSourceSwitchCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??CLK_SYSCLKSourceSwitchCmd_0
//  229   {
//  230     /* Set SWEN bit */
//  231     CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c9, #0x1
        RET
//  232   }
//  233   else
//  234   {
//  235     /* Reset SWEN  bit */
//  236     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
??CLK_SYSCLKSourceSwitchCmd_0:
        BRES      L:0x50c9, #0x1
//  237   }
//  238 }
        RET
//  239 
//  240 /**
//  241   * @brief  Returns the clock source used as system clock.
//  242   * @param  None
//  243   * @retval Clock used as System clock (SYSCLK) source.
//  244   *         The returned value can be one of the following:
//  245   *         - CLK_SYSCLKSource_HSI: HSI used as system clock
//  246   *         - CLK_SYSCLKSource_LSI: LSI used as system clock
//  247   *         - CLK_SYSCLKSource_HSE: HSE used as system clock
//  248   *         - CLK_SYSCLKSource_LSE: LSE used as system clock
//  249   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  250 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
//  251 {
//  252   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
CLK_GetSYSCLKSource:
        LD        A, L:0x50c7
        RET
//  253 }
//  254 
//  255 /**
//  256   * @brief  Enables the Clock Security System.
//  257   * @note   Once CSS is enabled it cannot be disabled until the next reset.
//  258   * @param  None
//  259   * @retval None
//  260   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  261 void CLK_ClockSecuritySystemEnable(void)
//  262 {
//  263   /* Set CSSEN bit */
//  264   CLK->CSSR |= CLK_CSSR_CSSEN;
CLK_ClockSecuritySystemEnable:
        BSET      L:0x50ca, #0x0
//  265 }
        RET
//  266 
//  267 /**
//  268   * @brief  Enables the Clock Security System deglitcher system.
//  269   * @param  None
//  270   * @retval None
//  271   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  272 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
//  273 {
//  274   /* Check the parameters */
//  275   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  276 
//  277   if (NewState != DISABLE)
CLK_ClockSecuritySytemDeglitchCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??CLK_ClockSecuritySytemDeglitchCmd_0
//  278   {
//  279     /* Set CSSDGON bit */
//  280     CLK->CSSR |= CLK_CSSR_CSSDGON;
        BSET      L:0x50ca, #0x4
        RET
//  281   }
//  282   else
//  283   {
//  284     /* Reset CSSDGON  bit */
//  285     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
??CLK_ClockSecuritySytemDeglitchCmd_0:
        BRES      L:0x50ca, #0x4
//  286   }
//  287 }
        RET
//  288 /**
//  289   * @brief  Returns the frequency of the System clock (SYSCLK).
//  290   * @param  None
//  291   * @retval System clock (SYSCLK) frequency
//  292   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  293 uint32_t CLK_GetClockFreq(void)
//  294 {
//  295   uint32_t clockfrequency = 0;
//  296   uint32_t sourcefrequency = 0;
CLK_GetClockFreq:
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
//  297   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
//  298   uint8_t tmp = 0, presc = 0;
//  299 
//  300   /* Get SYSCLK source. */
//  301   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
        LD        A, L:0x50c7
//  302 
//  303   if ( clocksource == CLK_SYSCLKSource_HSI)
        CP        A, #0x1
        JRNE      L:??CLK_GetClockFreq_0
//  304   {
//  305     sourcefrequency = HSI_VALUE;
??CLK_GetClockFreq_1:
        LDW       X, #0x2400
        LDW       S:?w1, X
        LDW       X, #0xf4
        LDW       S:?w0, X
        JRA       L:??CLK_GetClockFreq_2
//  306   }
//  307   else if ( clocksource == CLK_SYSCLKSource_LSI)
??CLK_GetClockFreq_0:
        CP        A, #0x2
        JRNE      L:??CLK_GetClockFreq_3
//  308   {
//  309     sourcefrequency = LSI_VALUE;
        LDW       X, #0x9470
        LDW       S:?w1, X
        CLRW      X
        JRA       L:??CLK_GetClockFreq_2
//  310   }
//  311   else if ( clocksource == CLK_SYSCLKSource_HSE)
??CLK_GetClockFreq_3:
        CP        A, #0x4
        JREQ      L:??CLK_GetClockFreq_1
//  312   {
//  313     sourcefrequency = HSE_VALUE;
//  314   }
//  315   else
//  316   {
//  317     clockfrequency = LSE_VALUE;
//  318   }
//  319 
//  320   /* Get System clock divider factor*/
//  321   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
??CLK_GetClockFreq_2:
        LD        A, L:0x50c0
//  322   presc = SYSDivFactor[tmp];
//  323 
//  324   /* Get System clock clcok frequency */
//  325   clockfrequency = sourcefrequency / presc;
//  326 
//  327   return((uint32_t)clockfrequency);
        AND       A, #0x7
        LD        XL, A
        LD        A, (L:SYSDivFactor,X)
        LD        XL, A
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        JP        L:?udiv32_l0_l0_l1
//  328 }
//  329 
//  330 
//  331 /**
//  332   * @brief  Enables or disables the specified CLK interrupts.
//  333   * @param  CLK_IT : Specifies the interrupt sources.
//  334   *         This parameter can be a value of @ref CLK_IT_TypeDef.
//  335   * @param  NewState : New state of the Interrupt, value accepted ENABLE, DISABLE.
//  336   * @retval None
//  337   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  338 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
//  339 {
CLK_ITConfig:
        LD        S:?b1, A
//  340 
//  341   /* check the parameters */
//  342   assert_param(IS_CLK_IT(CLK_IT));
//  343   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  344 
//  345   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??CLK_ITConfig_0
//  346   {
//  347     if (CLK_IT == CLK_IT_SWIF)
        LD        A, S:?b1
        CP        A, #0x1c
        JRNE      L:??CLK_ITConfig_1
//  348     {
//  349       /* Enable the clock switch interrupt */
//  350       CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c9, #0x2
        RET
//  351     }
//  352     else if (CLK_IT == CLK_IT_LSECSSF)
??CLK_ITConfig_1:
        CP        A, #0x2c
        JRNE      L:??CLK_ITConfig_2
//  353     {
//  354       /* Enable the CSS on LSE  interrupt */
//  355       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
        BSET      L:0x5190, #0x2
        RET
//  356     }
//  357     else
//  358     {
//  359       /* Enable the clock security system detection interrupt */
//  360       CLK->CSSR |= CLK_CSSR_CSSDIE;
??CLK_ITConfig_2:
        BSET      L:0x50ca, #0x2
        RET
//  361     }
//  362   }
//  363   else  /*(NewState == DISABLE)*/
//  364   {
//  365     if (CLK_IT == CLK_IT_SWIF)
??CLK_ITConfig_0:
        LD        A, S:?b1
        CP        A, #0x1c
        JRNE      L:??CLK_ITConfig_3
//  366     {
//  367       /* Disable the clock switch interrupt */
//  368       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
        BRES      L:0x50c9, #0x2
        RET
//  369     }
//  370     else if (CLK_IT == CLK_IT_LSECSSF)
??CLK_ITConfig_3:
        CP        A, #0x2c
        JRNE      L:??CLK_ITConfig_4
//  371     {
//  372       /* Disable the CSS on LSE  interrupt */
//  373       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
        BRES      L:0x5190, #0x2
        RET
//  374     }
//  375     else
//  376     {
//  377       /* Disable the clock security system detection interrupt */
//  378       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
??CLK_ITConfig_4:
        BRES      L:0x50ca, #0x2
//  379     }
//  380   }
//  381 }
        RET
//  382 
//  383 /**
//  384   * @brief  Selects the clock source to output on CCO pin.
//  385   * @param  CLK_CCOSource : Specifies the clock source.
//  386   *         This parameter can be a value of @ref CLK_CCOSource_TypeDef.
//  387   * @param  CLK_CCODiv : Specifies the clock source divider.
//  388   *         This parameter can be a value of @ref CLK_CCODiv_TypeDef.
//  389   * @retval None
//  390   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  391 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
//  392 {
//  393   /* check teh parameters */
//  394   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
//  395   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
//  396 
//  397   /* Selects the source provided on cco_ck output and its divider*/
//  398   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
CLK_CCOConfig:
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, S:?b1
        LD        L:0x50c5, A
//  399 }
        RET
//  400 
//  401 /**
//  402   * @brief  Configures the RTC clock source.
//  403   * @param  CLK_RTCCLKSource : Specifies the RTC clock source.
//  404   *         This parameter can be a value of @ref CLK_RTCCLKSource_TypeDef.
//  405   * @param  CLK_RTCCLKDiv : Specifies the RTC clock source divider.
//  406   *         This parameter can be a value of @ref CLK_RTCCLKDiv_TypeDef.
//  407   * @retval None
//  408   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  409 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
//  410 {
//  411   /* check the parameters */
//  412   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
//  413   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
//  414 
//  415   /* Selects the source provided on to RTC and its divider*/
//  416   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
CLK_RTCClockConfig:
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, S:?b1
        LD        L:0x50c1, A
//  417 }
        RET
//  418 
//  419 /**
//  420   * @brief  Configures the BEEP clock source.
//  421   * @param  CLK_BEEPCLKSource : Specifies the BEEP clock source.
//  422   *         This parameter can be a value of @ref CLK_BEEPCLKSource_TypeDef.
//  423   * @retval None
//  424   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  425 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
//  426 {
//  427   /* check the parameters */
//  428   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
//  429 
//  430   /* Selects the source provided to BEEP*/
//  431   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
CLK_BEEPClockConfig:
        LD        L:0x50cb, A
//  432 
//  433 }
        RET
//  434 
//  435 /**
//  436   * @brief  Enables or disables the specified peripheral clock.
//  437   * @param  CLK_Peripheral : This parameter specifies the peripheral clock to gate.
//  438   *         This parameter can be a value of @ref CLK_Peripheral_TypeDef.
//  439   * @param  NewState : New state of specified peripheral clock.
//  440   *         This parameter can be a value of @ref FunctionalState.
//  441   * @retval None
//  442   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  443 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
//  444 {
CLK_PeripheralClockConfig:
        LD        S:?b2, A
        MOV       S:?b1, S:?b0
//  445   uint8_t reg = 0;
//  446 
//  447   /* Check the parameters */
//  448   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
//  449   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  450 
//  451   /* get flag register */
//  452   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
        AND       A, #0xf0
        LD        S:?b3, A
//  453 
//  454   if ( reg == 0x00)
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b3
        JRNE      L:??CLK_PeripheralClockConfig_0
//  455   {
//  456     if (NewState != DISABLE)
        CP        A, S:?b1
        JREQ      L:??CLK_PeripheralClockConfig_1
//  457     {
//  458       /* Enable the peripheral Clock */
//  459       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b0
        OR        A, L:0x50c3
        LD        L:0x50c3, A
        RET
//  460     }
//  461     else
//  462     {
//  463       /* Disable the peripheral Clock */
//  464       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_1:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x50c3
        LD        L:0x50c3, A
        RET
//  465     }
//  466   }
//  467   else if (reg == 0x10)
??CLK_PeripheralClockConfig_0:
        LD        A, S:?b3
        CP        A, #0x10
        JRNE      L:??CLK_PeripheralClockConfig_2
//  468   {
//  469     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b1
        JREQ      L:??CLK_PeripheralClockConfig_3
//  470     {
//  471       /* Enable the peripheral Clock */
//  472       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b0
        OR        A, L:0x50c4
        LD        L:0x50c4, A
        RET
//  473     }
//  474     else
//  475     {
//  476       /* Disable the peripheral Clock */
//  477       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_3:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x50c4
        LD        L:0x50c4, A
        RET
//  478     }
//  479   }
//  480   else
//  481   {
//  482     if (NewState != DISABLE)
??CLK_PeripheralClockConfig_2:
        CLR       A
        CP        A, S:?b1
        JREQ      L:??CLK_PeripheralClockConfig_4
//  483     {
//  484       /* Enable the peripheral Clock */
//  485       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b0
        OR        A, L:0x50d0
        LD        L:0x50d0, A
        RET
//  486     }
//  487     else
//  488     {
//  489       /* Disable the peripheral Clock */
//  490       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_4:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x50d0
        LD        L:0x50d0, A
//  491     }
//  492   }
//  493 }
        RET
//  494 
//  495 /**
//  496   * @brief  Configures clock during halt and active halt modes.
//  497   * @param  CLK_Halt : Specifies the clock state and wake-up mode from halt way.
//  498   *         This parameter can be a value of @ref CLK_Halt_TypeDef.
//  499   * @param  NewState : Specifies the System clock (SYSCLK) state in active halt mode.
//  500   *         This parameter can be ENABLE or DISABLE.
//  501   * @retval None
//  502   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  503 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
//  504 {
CLK_HaltConfig:
        LD        S:?b1, A
//  505   /* check the parameters */
//  506   assert_param(IS_CLK_HALT(CLK_Halt));
//  507   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  508 
//  509   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??CLK_HaltConfig_0
//  510   {
//  511     CLK->ICKCR |= (uint8_t)(CLK_Halt);
        LD        A, S:?b1
        OR        A, L:0x50c2
        LD        L:0x50c2, A
        RET
//  512   }
//  513   else
//  514   {
//  515     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
??CLK_HaltConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50c2
        LD        L:0x50c2, A
//  516   }
//  517 }
        RET
//  518 
//  519 /**
//  520   * @brief  Configures the main voltage regulator
//  521   * @param  NewState: specifies the MVR  state.
//  522   *         This parameter can be one of the following values:
//  523   *         - DISABLE: MVR disabled;
//  524   *         - ENABLE:  MVR enabled.
//  525   * @retval None
//  526   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  527 void CLK_MainRegulatorCmd(FunctionalState NewState)
//  528 {
//  529   /* check the parameters */
//  530   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  531 
//  532   if (NewState != DISABLE)
CLK_MainRegulatorCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??CLK_MainRegulatorCmd_0
//  533   {
//  534     /* Reset REGUOFF bit */
//  535     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
        BRES      L:0x50cf, #0x1
        RET
//  536   }
//  537   else
//  538   {
//  539     /* Set REGUOFF bit */
//  540     CLK->REGCSR |= CLK_REGCSR_REGOFF;
??CLK_MainRegulatorCmd_0:
        BSET      L:0x50cf, #0x1
//  541   }
//  542 }
        RET
//  543 
//  544 /**
//  545   * @brief  Checks whether the specified CLK flag is set or not.
//  546   * @param  CLK_FLAG : Flag to check. This parameter can be a value of @ref CLK_FLAG_TypeDef
//  547   * @retval FlagStatus : status of the checked flag
//  548   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  549 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
//  550 {
CLK_GetFlagStatus:
        LD        S:?b0, A
//  551   uint8_t reg = 0;
//  552   uint8_t pos = 0;
//  553   FlagStatus bitstatus = RESET;
//  554 
//  555   /* check the parameters */
//  556   assert_param(IS_CLK_FLAGS(CLK_FLAG));
//  557 
//  558   /* get flag register */
//  559   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
        AND       A, #0xf0
        LD        S:?b1, A
//  560 
//  561   /* get flag position */
//  562   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
        LD        A, S:?b0
        AND       A, #0xf
        LD        S:?b0, A
//  563 
//  564   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
        CLR       A
        CP        A, S:?b1
        JRNE      L:??CLK_GetFlagStatus_0
//  565   {
//  566     reg = CLK->CRTCR;
        LD        A, L:0x50c1
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  567   }
//  568   else if (reg == 0x10) /* The flag to check is in ICKCR register */
??CLK_GetFlagStatus_0:
        LD        A, S:?b1
        CP        A, #0x10
        JRNE      L:??CLK_GetFlagStatus_2
//  569   {
//  570     reg = CLK->ICKCR;
        LD        A, L:0x50c2
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  571   }
//  572   else if (reg == 0x20) /* The flag to check is in CCOR register */
??CLK_GetFlagStatus_2:
        CP        A, #0x20
        JRNE      L:??CLK_GetFlagStatus_3
//  573   {
//  574     reg = CLK->CCOR;
        LD        A, L:0x50c5
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  575   }
//  576   else if (reg == 0x30) /* The flag to check is in ECKCR register */
??CLK_GetFlagStatus_3:
        CP        A, #0x30
        JRNE      L:??CLK_GetFlagStatus_4
//  577   {
//  578     reg = CLK->ECKCR;
        LD        A, L:0x50c6
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  579   }
//  580   else if (reg == 0x40) /* The flag to check is in SWCR register */
??CLK_GetFlagStatus_4:
        CP        A, #0x40
        JRNE      L:??CLK_GetFlagStatus_5
//  581   {
//  582     reg = CLK->SWCR;
        LD        A, L:0x50c9
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  583   }
//  584   else if (reg == 0x50) /* The flag to check is in CSSR register */
??CLK_GetFlagStatus_5:
        CP        A, #0x50
        JRNE      L:??CLK_GetFlagStatus_6
//  585   {
//  586     reg = CLK->CSSR;
        LD        A, L:0x50ca
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  587   }
//  588   else if (reg == 0x70) /* The flag to check is in REGCSR register */
??CLK_GetFlagStatus_6:
        CP        A, #0x70
        JRNE      L:??CLK_GetFlagStatus_7
//  589   {
//  590     reg = CLK->REGCSR;
        LD        A, L:0x50cf
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  591   }
//  592   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
??CLK_GetFlagStatus_7:
        CP        A, #0x80
        JRNE      L:??CLK_GetFlagStatus_8
//  593   {
//  594     reg = CSSLSE->CSR;
        LD        A, L:0x5190
        LD        S:?b1, A
        JRA       L:??CLK_GetFlagStatus_1
//  595   }
//  596   else /* The flag to check is in CBEEPR register */
//  597   {
//  598     reg = CLK->CBEEPR;
??CLK_GetFlagStatus_8:
        LD        A, L:0x50cb
        LD        S:?b1, A
//  599   }
//  600 
//  601 
//  602   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
??CLK_GetFlagStatus_1:
        CLRW      X
        INCW      X
        LD        A, S:?b0
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, S:?b1
        JREQ      L:??CLK_GetFlagStatus_9
//  603   {
//  604     bitstatus = SET;
        LD        A, #0x1
        RET
//  605   }
//  606   else
//  607   {
//  608     bitstatus = RESET;
??CLK_GetFlagStatus_9:
        CLR       A
//  609   }
//  610 
//  611   /* Return the flag status */
//  612   return((FlagStatus)bitstatus);
        RET
//  613 }
//  614 
//  615 /**
//  616   * @brief  Clears the CSS LSE Flag.
//  617   * @param  None
//  618   * @retval None
//  619   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  620 void CLK_ClearFlag(void)
//  621 {
//  622 
//  623   /* Clear the clock security system on LSE  dtetction Flag */
//  624   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
CLK_ClearFlag:
        BRES      L:0x5190, #0x3
//  625 }
        RET
//  626 
//  627 /**
//  628   * @brief  Checks whether the specified CLK interrupt has is enabled or not.
//  629   * @param  CLK_IT : specifies the CLK interrupt.
//  630   *         This parameter can be a value of @ref CLK_IT_TypeDef
//  631   * @retval ITStatus : state of CLK_IT (SET or RESET).
//  632   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  633 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
//  634 {
//  635 
//  636   ITStatus bitstatus = RESET;
//  637 
//  638   /* check the parameters */
//  639   assert_param(IS_CLK_IT(CLK_IT));
//  640 
//  641   if (CLK_IT == CLK_IT_SWIF)
CLK_GetITStatus:
        CP        A, #0x1c
        JRNE      L:??CLK_GetITStatus_0
//  642   {
//  643     /* Check the status of the clock switch interrupt */
//  644     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        LD        A, #0x1c
        AND       A, L:0x50c9
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_1
//  645     {
//  646       bitstatus = SET;
??CLK_GetITStatus_2:
        LD        A, #0x1
//  647     }
//  648     else
//  649     {
//  650       bitstatus = RESET;
//  651     }
//  652   }
//  653   else if (CLK_IT == CLK_IT_LSECSSF)
//  654   {
//  655     /* Check the status of the clock security system on LSE interrupt */
//  656     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
//  657     {
//  658       bitstatus = SET;
//  659     }
//  660     else
//  661     {
//  662       bitstatus = RESET;
//  663     }
//  664   }
//  665   else /* CLK_IT == CLK_IT_CSSD */
//  666   {
//  667     /* Check the status of the security system detection interrupt */
//  668     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
//  669     {
//  670       bitstatus = SET;
//  671     }
//  672     else
//  673     {
//  674       bitstatus = RESET;
//  675     }
//  676   }
//  677 
//  678   /* Return the CLK_IT status */
//  679   return bitstatus;
        RET
??CLK_GetITStatus_0:
        CP        A, #0x2c
        JRNE      L:??CLK_GetITStatus_3
        LD        A, #0x2c
        AND       A, L:0x5190
        CP        A, #0xc
        JREQ      L:??CLK_GetITStatus_2
??CLK_GetITStatus_1:
        CLR       A
        RET
??CLK_GetITStatus_3:
        AND       A, L:0x50ca
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_1
        JRA       L:??CLK_GetITStatus_2
//  680 }
//  681 
//  682 
//  683 /**
//  684   * @brief  Clears the CLK’s interrupt pending bits.
//  685   * @param  CLK_IT : specifies the interrupt pending bits.
//  686   *         This parameter can be a value of CLK_IT_TypeDef
//  687   * @retval None
//  688   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  689 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
//  690 {
//  691 
//  692   /* check the parameters */
//  693   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
//  694 
//  695   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
CLK_ClearITPendingBit:
        AND       A, #0xf0
        CP        A, #0x20
        JRNE      L:??CLK_ClearITPendingBit_0
//  696   {
//  697     /* Clear the status of the clock security system on LSE interrupt */
//  698     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
        BRES      L:0x5190, #0x3
        RET
//  699   }
//  700   else
//  701   {
//  702     /* Clear the status of the clock switch interrupt */
//  703     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
??CLK_ClearITPendingBit_0:
        BRES      L:0x50c9, #0x3
//  704   }
//  705 }
        RET
//  706 
//  707 /**
//  708   * @brief  Enables the clock CSS on LSE.
//  709   * @note   Once Enabled, only POR can Disable it.
//  710   * @param  None
//  711   * @retval None
//  712   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  713 void CLK_LSEClockSecuritySystemEnable(void)
//  714 {
//  715   /* Set CSSEN bit */
//  716   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
CLK_LSEClockSecuritySystemEnable:
        BSET      L:0x5190, #0x0
//  717 }
        RET
//  718 
//  719 /**
//  720   * @brief  Enables RTC clock switch to LSI in case of LSE failure.
//  721   * @note   Once Enabled, only POR can Disable it.
//  722   * @param  None
//  723   * @retval None
//  724   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  725 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
//  726 {
//  727   /* Set SWITCHEN bit */
//  728   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
CLK_RTCCLKSwitchOnLSEFailureEnable:
        BSET      L:0x5190, #0x1
//  729 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  730 
//  731 
//  732 /**
//  733   * @}
//  734   */
//  735 
//  736 /**
//  737   * @}
//  738   */
//  739 
//  740 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
//   5 bytes in section .near.rodata
// 696 bytes in section .near_func.text
// 
// 696 bytes of CODE  memory
//   5 bytes of CONST memory
//
//Errors: none
//Warnings: none
