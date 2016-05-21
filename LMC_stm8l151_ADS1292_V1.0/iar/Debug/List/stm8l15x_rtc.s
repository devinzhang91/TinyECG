///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:47 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_rtc.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_rtc.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_rtc.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_rtc

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
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
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5

        PUBLIC RTC_AlarmCmd
        PUBLIC RTC_AlarmStructInit
        PUBLIC RTC_AlarmSubSecondConfig
        PUBLIC RTC_BypassShadowCmd
        PUBLIC RTC_CalibOutputCmd
        PUBLIC RTC_CalibOutputConfig
        PUBLIC RTC_ClearFlag
        PUBLIC RTC_ClearITPendingBit
        PUBLIC RTC_DateStructInit
        PUBLIC RTC_DayLightSavingConfig
        PUBLIC RTC_DeInit
        PUBLIC RTC_EnterInitMode
        PUBLIC RTC_ExitInitMode
        PUBLIC RTC_GetAlarm
        PUBLIC RTC_GetDate
        PUBLIC RTC_GetFlagStatus
        PUBLIC RTC_GetITStatus
        PUBLIC RTC_GetStoreOperation
        PUBLIC RTC_GetSubSecond
        PUBLIC RTC_GetTime
        PUBLIC RTC_GetWakeUpCounter
        PUBLIC RTC_ITConfig
        PUBLIC RTC_Init
        PUBLIC RTC_OutputConfig
        PUBLIC RTC_RatioCmd
        PUBLIC RTC_SetAlarm
        PUBLIC RTC_SetDate
        PUBLIC RTC_SetTime
        PUBLIC RTC_SetWakeUpCounter
        PUBLIC RTC_SmoothCalibConfig
        PUBLIC RTC_StructInit
        PUBLIC RTC_SynchroShiftConfig
        PUBLIC RTC_TamperCmd
        PUBLIC RTC_TamperFilterConfig
        PUBLIC RTC_TamperLevelConfig
        PUBLIC RTC_TamperPinsPrechargeDuration
        PUBLIC RTC_TamperSamplingFreqConfig
        PUBLIC RTC_TimeStructInit
        PUBLIC RTC_WaitForSynchro
        PUBLIC RTC_WakeUpClockConfig
        PUBLIC RTC_WakeUpCmd
        PUBLIC RTC_WriteProtectionCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_rtc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_rtc.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the RTC firmware functions.
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
//   22 #include "stm8l15x_rtc.h"
//   23 
//   24 /** @addtogroup STM8L15x_StdPeriph_Driver
//   25 * @{
//   26 */
//   27 
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 #define INIT_TIMEOUT       ((uint16_t)0xFFFF)
//   31 #define RSF_TIMEOUT        ((uint16_t)0xFFFF)
//   32 #define INITF_TIMEOUT      ((uint16_t)0xFFFF)
//   33 #define WUTWF_TIMEOUT      ((uint16_t)0xFFFF)
//   34 #define ALRAWF_TIMEOUT     ((uint16_t)0xFFFF)
//   35 #define RECALPF_TIMEOUT    ((uint16_t)0xFFFF)
//   36 #define SHPF_TIMEOUT       ((uint16_t)0xFFFF)
//   37 
//   38 #define TEN_VALUE_BCD      ((uint8_t)0x10)
//   39 #define TEN_VALUE_BIN      ((uint8_t)0x0A)
//   40 
//   41 /* Private macro -------------------------------------------------------------*/
//   42 /* Private variables ---------------------------------------------------------*/
//   43 /**
//   44  * @addtogroup RTC_Private_Functions_Prototype
//   45  * @{
//   46  */
//   47 static uint8_t ByteToBcd2(uint8_t Value);
//   48 static uint8_t Bcd2ToByte(uint8_t Value);
//   49 
//   50 /**
//   51  * @}
//   52  */
//   53 
//   54 
//   55 /**
//   56  * @addtogroup RTC_Public_Functions
//   57  * @{
//   58  */
//   59 
//   60 /**
//   61 * @brief  Deinitializes the RTC registers to their default reset values.
//   62 * @param  None
//   63 * @retval An ErrorStatus enumeration value:
//   64 *          - SUCCESS: RTC registers are deinitialized
//   65 *          - ERROR: RTC registers are not deinitialized
//   66 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 ErrorStatus RTC_DeInit(void)
//   68 {
//   69   ErrorStatus status = ERROR;
//   70   uint16_t wutwfcount = 0;
RTC_DeInit:
        CLR       S:?b0
        CLR       S:?b1
//   71   uint16_t recalpfcount = 0;
        CLRW      Y
//   72 
//   73   /* Disable the write protection for RTC registers */
//   74   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//   75 
//   76   /* Set Initialization mode */
//   77   if (RTC_EnterInitMode() == ERROR)
        CALL      L:RTC_EnterInitMode
        TNZ       A
        JRNE      L:??RTC_DeInit_0
//   78   {
//   79     status = ERROR;
??RTC_DeInit_1:
        CLR       S:?b0
//   80     /* Enable the write protection for RTC registers */
//   81     RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
        JP        L:??RTC_DeInit_2
//   82   }
//   83   else
//   84   {
//   85     /* Reset TR registers */
//   86     RTC->TR1 = RTC_TR1_RESET_VALUE;
??RTC_DeInit_0:
        CLR       A
        LD        L:0x5140, A
//   87     RTC->TR2 = RTC_TR2_RESET_VALUE;
        LD        L:0x5141, A
//   88     RTC->TR3 = RTC_TR3_RESET_VALUE;
        LD        L:0x5142, A
//   89 
//   90     /* Reset DR registers */
//   91     RTC->DR1 = RTC_DR1_RESET_VALUE;
        LD        A, #0x1
        LD        L:0x5144, A
//   92     RTC->DR2 = RTC_DR2_RESET_VALUE;
        LD        A, #0x21
        LD        L:0x5145, A
//   93     RTC->DR3 = RTC_DR3_RESET_VALUE;
        CLR       A
        LD        L:0x5146, A
//   94 
//   95     /* Reset SPER & ARPER registers */
//   96     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
        LD        L:0x5150, A
//   97     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x5151, A
//   98     RTC->APRER  = RTC_APRER_RESET_VALUE;
        LD        A, #0x7f
        LD        L:0x5152, A
//   99 
//  100     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
        CLR       A
        LD        L:0x516c, A
//  101     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
        LD        L:0x516d, A
//  102 
//  103     /* Reset All CR1 bits except CR1[2:0] */
//  104 
//  105     RTC->CR1 = RTC_CR1_RESET_VALUE;
        LD        L:0x5148, A
//  106     RTC->CR2 = RTC_CR2_RESET_VALUE;
        LD        L:0x5149, A
//  107     RTC->CR3 = RTC_CR3_RESET_VALUE;
        LD        L:0x514a, A
        JRA       L:??RTC_DeInit_3
//  108 
//  109     /* Wait till RTC WUTWF flag is set or if Time out is reached exit */
//  110     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
//  111     {
//  112       wutwfcount++;
??RTC_DeInit_4:
        INCW      X
        LDW       S:?w0, X
//  113       RTC->ISR1 = 0;
        CLR       A
        LD        L:0x514c, A
//  114     }
??RTC_DeInit_3:
        LD        A, #0x4
        AND       A, L:0x514c
        JRNE      L:??RTC_DeInit_5
        LDW       X, S:?w0
        CPW       X, #0xffff
        JRNE      L:??RTC_DeInit_4
//  115 
//  116     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
??RTC_DeInit_5:
        LD        A, #0x4
        AND       A, L:0x514c
        JREQ      L:??RTC_DeInit_1
//  117     {
//  118       status = ERROR;
//  119       /* Enable the write protection for RTC registers */
//  120       RTC_WriteProtectionCmd(ENABLE);
//  121     }
//  122     else
//  123     {
//  124       /* Reset All CR1 bits */
//  125       RTC->CR1 = RTC_CR1_RESET_VALUE;
        CLR       A
        LD        L:0x5148, A
//  126 
//  127       /* Reset WUTR registers */
//  128       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
        LD        A, #0xff
        LD        L:0x5154, A
//  129       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
        LD        L:0x5155, A
//  130 
//  131       /* Reset ALARM registers */
//  132       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
        CLR       A
        LD        L:0x515c, A
//  133       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
        LD        L:0x515d, A
//  134       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
        LD        L:0x515e, A
//  135       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
        LD        L:0x515f, A
//  136 
//  137       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
        LD        L:0x5164, A
//  138       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
        LD        L:0x5165, A
//  139       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
        LD        L:0x5166, A
//  140 
//  141       /* Reset ISR register and exit initialization mode */
//  142       RTC->ISR1 = (uint8_t)0x00;
        LD        L:0x514c, A
//  143       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
        LD        L:0x514d, A
//  144 
//  145       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
        LD        A, #0x2
        AND       A, L:0x514c
        JRNE      L:??RTC_DeInit_6
        JRA       L:??RTC_DeInit_7
//  146       {
//  147         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
//  148         {
//  149           recalpfcount++;
??RTC_DeInit_8:
        INCW      Y
//  150         }
??RTC_DeInit_6:
        LD        A, #0x2
        AND       A, L:0x514c
        JREQ      L:??RTC_DeInit_7
        CPW       Y, #0xffff
        JRNE      L:??RTC_DeInit_8
//  151       }
//  152       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
??RTC_DeInit_7:
        LD        A, #0x2
        AND       A, L:0x514c
        JRNE      L:??RTC_DeInit_9
//  153       {
//  154         RTC->CALRH = RTC_CALRH_RESET_VALUE;
        CLR       A
        LD        L:0x516a, A
//  155         RTC->CALRL = RTC_CALRL_RESET_VALUE;
        LD        L:0x516b, A
//  156 
//  157         if (RTC_WaitForSynchro() == ERROR)
//  158         {
//  159           status = ERROR;
        CALL      L:RTC_WaitForSynchro
        LD        S:?b0, A
        JRA       L:??RTC_DeInit_10
//  160         }
//  161         else
//  162         {
//  163           status = SUCCESS;
//  164         }
//  165       }
//  166       else
//  167       {
//  168         status = ERROR;
??RTC_DeInit_9:
        CLR       S:?b0
//  169       }
//  170 
//  171       /* Enable the write protection for RTC registers */
//  172       RTC_WriteProtectionCmd(ENABLE);
??RTC_DeInit_10:
        LD        A, #0xff
        LD        L:0x5159, A
//  173     }
//  174   }
//  175 
//  176   /* return Deinitialize RTC registers status*/
//  177   return (ErrorStatus)status;
??RTC_DeInit_2:
        LD        A, S:?b0
        RET
//  178 }
//  179 
//  180 /**
//  181 * @brief  Initializes the RTC registers according to the specified parameters
//  182 *         in RTC_InitStruct.
//  183 * @param  RTC_InitStruct: pointer to a RTC_InitTypeDef structure that contains
//  184 *         the configuration information for the RTC peripheral.
//  185 * @retval An ErrorStatus enumeration value:
//  186 *          - SUCCESS: RTC registers are initialized
//  187 *          - ERROR: RTC registers are not initialized
//  188 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  189 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
//  190 {
RTC_Init:
        LDW       S:?w0, X
//  191   ErrorStatus status = ERROR;
//  192 
//  193   /* Check the parameters */
//  194   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
//  195   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
//  196   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
//  197 
//  198   /* Disable the write protection for RTC registers */
//  199   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  200 
//  201   /* Set Initialization mode */
//  202   if (RTC_EnterInitMode() == ERROR)
        CALL      L:RTC_EnterInitMode
        TNZ       A
        JRNE      L:??RTC_Init_0
//  203   {
//  204     status = ERROR;
        CLR       S:?b0
        JRA       L:??RTC_Init_1
//  205   }
//  206   else
//  207   {
//  208     /* Clear the bits to be configured first */
//  209     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
??RTC_Init_0:
        BRES      L:0x5148, #0x6
//  210 
//  211     /* Set RTC_CR1 register */
//  212     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
        LD        A, [S:?w0.w]
        OR        A, L:0x5148
        LD        L:0x5148, A
//  213 
//  214     /* Set Prescalers registers */
//  215     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
        LDW       Y, S:?w0
        ADDW      Y, #0x2
        LDW       X, Y
        LDW       X, (X)
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5150, A
//  216     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
        LDW       Y, (Y)
        LD        A, YL
        LD        L:0x5151, A
//  217     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
        LDW       X, S:?w0
        INCW      X
        LD        A, (X)
        LD        L:0x5152, A
//  218 
//  219     /* Exit Initialization mode */
//  220     RTC_ExitInitMode();
        BRES      L:0x514c, #0x7
//  221 
//  222     status = SUCCESS;
        LD        A, #0x1
        LD        S:?b0, A
//  223   }
//  224 
//  225   /* Enable the write protection for RTC registers */
//  226   RTC_WriteProtectionCmd(ENABLE);
??RTC_Init_1:
        LD        A, #0xff
        LD        L:0x5159, A
//  227 
//  228   /* return Initialize the RTC registers status*/
//  229   return (ErrorStatus)(status);
        LD        A, S:?b0
        RET
//  230 }
//  231 
//  232 /**
//  233 * @brief  Fills each RTC_InitStruct member with its default value
//  234 *         Hour format = 24h / Prescalers configured to their reset values.
//  235 * @param  RTC_InitStruct: pointer to a RTC_InitTypeDef structure which will be
//  236 *         initialized.
//  237 * @retval None
//  238 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  239 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
//  240 {
//  241   /* Initialize the RTC_HourFormat member */
//  242   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
RTC_StructInit:
        CLR       A
        LD        (X), A
//  243 
//  244   /* Initialize the RTC_AsynchPrediv member */
//  245   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
        LDW       Y, X
        INCW      Y
        LD        A, #0x7f
        LD        (Y), A
//  246 
//  247   /* Initialize the RTC_SynchPrediv member */
//  248   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
        ADDW      X, #0x2
        LDW       Y, #0xff
        LDW       (X), Y
//  249 }
        RET
//  250 /**
//  251 * @brief  Fills each RTC_TimeStruct member with its default value
//  252 *         (Time = 00h:00min:00sec).
//  253 * @param  RTC_TimeStruct: pointer to a @ref RTC_TimeTypeDef structure which will be
//  254 *         initialized.
//  255 * @retval None
//  256 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  257 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
//  258 {
//  259   /* Time = 00h:00min:00sec*/
//  260   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
RTC_TimeStructInit:
        LDW       Y, X
        ADDW      Y, #0x3
        CLR       A
        LD        (Y), A
//  261   RTC_TimeStruct->RTC_Hours = 0;
        LD        (X), A
//  262   RTC_TimeStruct->RTC_Minutes = 0;
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//  263   RTC_TimeStruct->RTC_Seconds = 0;
        ADDW      X, #0x2
        LD        (X), A
//  264 }
        RET
//  265 /**
//  266 * @brief  Fills each RTC_DateStruct member with its default value
//  267 *         (Monday 01 January xx00).
//  268 * @param  RTC_DateStruct: pointer to a @ref RTC_DateTypeDef structure which will be
//  269 *         initialized.
//  270 * @retval None
//  271 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  272 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
//  273 {
//  274   /* * (Monday 01 January xx00)*/
//  275   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
RTC_DateStructInit:
        LD        A, #0x1
        LD        (X), A
//  276   RTC_DateStruct->RTC_Date = 1;
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//  277   RTC_DateStruct->RTC_Month = RTC_Month_January;
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//  278   RTC_DateStruct->RTC_Year = 0;
        ADDW      X, #0x3
        CLR       A
        LD        (X), A
//  279 }
        RET
//  280 /**
//  281 * @brief  Fills each RTC_AlarmStruct member with its default value
//  282 *         (Time = 00h:00mn:00sec / Date = 1st day of the month/Mask =
//  283 *         all fields are masked).
//  284 * @param  RTC_AlarmStruct: pointer to a @ref RTC_AlarmTypeDef structure which
//  285 *         will be initialized.
//  286 * @retval None
//  287 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  288 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
//  289 {
//  290   /* Alarm Time Settings : Time = 00h:00mn:00sec */
//  291   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
RTC_AlarmStructInit:
        LDW       Y, X
        ADDW      Y, #0x3
        CLR       A
        LD        (Y), A
//  292   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
        LD        (X), A
//  293   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//  294   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//  295 
//  296   /* Alarm Date Settings : Date = 1st day of the month*/
//  297   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
        LDW       Y, X
        ADDW      Y, #0x5
        LD        (Y), A
//  298   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
        LDW       Y, X
        ADDW      Y, #0x6
        LD        A, #0x1
        LD        (Y), A
//  299 
//  300   /* Alarm Masks Settings : Mask =  all fields are masked*/
//  301   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
        ADDW      X, #0x4
        LD        A, #0xf0
        LD        (X), A
//  302 }
        RET
//  303 /**
//  304 * @brief  Enables or Disables the specified RTC interrupts.
//  305 * @param  RTC_IT: specifies the RTC interrupt sources to be enabled or disabled.
//  306 *         This parameter can be any combination of the following values:
//  307 *         @arg RTC_IT_ALRA:  Alarm A interrupt
//  308 *         @arg RTC_IT_TAMP:  Tampers interrupt
//  309 *         @arg RTC_IT_WUT:  WakeUp Timer interrupt
//  310 * @param  NewState: new state of the specified RTC interrupts.
//  311 *         This parameter can be: ENABLE or DISABLE.
//  312 * @retval None
//  313 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  314 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
//  315 {
RTC_ITConfig:
        LD        S:?b2, A
//  316   /* Check the parameters */
//  317   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
//  318   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  319 
//  320   /* Disable the write protection for RTC registers */
//  321   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  322 
//  323   if (NewState != DISABLE)
        LD        A, XL
        AND       A, #0x1
        LD        S:?b1, A
        LD        A, XL
        AND       A, #0xf0
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b2
        JREQ      L:??RTC_ITConfig_0
//  324   {
//  325     /* Enable the Interrupts */
//  326     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
        LD        A, S:?b0
        OR        A, L:0x5149
        LD        L:0x5149, A
//  327     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
        LD        A, S:?b1
        OR        A, L:0x516c
        LD        L:0x516c, A
        JRA       L:??RTC_ITConfig_1
//  328   }
//  329   else
//  330   {
//  331     /* Disable the Interrupts */
//  332     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
??RTC_ITConfig_0:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5149
        LD        L:0x5149, A
//  333     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x516c
        LD        L:0x516c, A
//  334   }
//  335 
//  336   /* Enable the write protection for RTC registers */
//  337   RTC_WriteProtectionCmd(ENABLE);
??RTC_ITConfig_1:
        LD        A, #0xff
        LD        L:0x5159, A
//  338 }
        RET
//  339 
//  340 /**
//  341 * @brief  Enters the RTC Initialization mode.
//  342 * @param  None
//  343 * @retval An ErrorStatus enumeration value:
//  344 *          - SUCCESS: RTC is in Init mode
//  345 *          - ERROR: RTC is not in Init mode
//  346 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  347 ErrorStatus RTC_EnterInitMode(void)
//  348 {
//  349   ErrorStatus status = ERROR;
//  350   uint16_t initfcount = 0;
RTC_EnterInitMode:
        CLRW      X
//  351 
//  352   /* Check if the Initialization mode is set */
//  353   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
        LD        A, #0x40
        AND       A, L:0x514c
        JRNE      L:??RTC_EnterInitMode_0
//  354   {
//  355     /* Set the Initialization mode */
//  356     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
        LD        A, #0x80
        LD        L:0x514c, A
        JRA       L:??RTC_EnterInitMode_1
//  357 
//  358     /* Wait until INITF flag is set */
//  359     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
//  360     {
//  361       initfcount++;
??RTC_EnterInitMode_2:
        INCW      X
//  362     }
??RTC_EnterInitMode_1:
        LD        A, #0x40
        AND       A, L:0x514c
        JRNE      L:??RTC_EnterInitMode_0
        CPW       X, #0xffff
        JRNE      L:??RTC_EnterInitMode_2
//  363   }
//  364 
//  365   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
??RTC_EnterInitMode_0:
        LD        A, L:0x514c
//  366   {
//  367     status = ERROR;
//  368   }
//  369   else
//  370   {
//  371     status = SUCCESS;
//  372   }
//  373 
//  374   return (ErrorStatus)status;
        SWAP      A
        AND       A, #0xf
        SRL       A
        SRL       A
        AND       A, #0x1
        RET
//  375 }
//  376 
//  377 /**
//  378 * @brief  Exits the RTC Initialization mode.
//  379 * @param  None
//  380 * @retval None
//  381 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  382 void RTC_ExitInitMode(void)
//  383 {
//  384   /* Exit Initialization mode */
//  385   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
RTC_ExitInitMode:
        BRES      L:0x514c, #0x7
//  386 }
        RET
//  387 
//  388 /**
//  389 * @brief  Waits until the RTC Calendar registers (Time and Date)
//  390 *         are synchronized with RTC clock.
//  391 * @note   This function must be called before any read operation.
//  392 * @param  None
//  393 * @retval An ErrorStatus enumeration value:
//  394 *          - SUCCESS: RTC registers are synchronized
//  395 *          - ERROR: RTC registers are not synchronized
//  396 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  397 ErrorStatus RTC_WaitForSynchro(void)
//  398 {
//  399   uint16_t rsfcount = 0;
RTC_WaitForSynchro:
        CLRW      X
//  400   ErrorStatus status = ERROR;
//  401 
//  402   /* Clear RSF flag by writing 0 in RSF bit  */
//  403   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
        LD        A, #0x5f
        AND       A, L:0x514c
        LD        L:0x514c, A
        JRA       L:??RTC_WaitForSynchro_0
//  404 
//  405   /* Wait the registers to be synchronised */
//  406   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
//  407   {
//  408     rsfcount++;
??RTC_WaitForSynchro_1:
        INCW      X
//  409   }
??RTC_WaitForSynchro_0:
        LD        A, #0x20
        AND       A, L:0x514c
        JRNE      L:??RTC_WaitForSynchro_2
        CPW       X, #0xffff
        JRNE      L:??RTC_WaitForSynchro_1
//  410 
//  411   /* Check if RSF flag occurs*/
//  412   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
??RTC_WaitForSynchro_2:
        LD        A, L:0x514c
//  413   {
//  414     status = SUCCESS;
//  415   }
//  416   else
//  417   {
//  418     status = ERROR;
//  419   }
//  420 
//  421   return (ErrorStatus)status;
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        RET
//  422 }
//  423 
//  424 /**
//  425 * @brief  Enables or disables the RTC registers write protection.
//  426 * @param  NewState: new state of the write protection.
//  427 *         This parameter can be: ENABLE or DISABLE.
//  428 * @retval None
//  429 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  430 void RTC_WriteProtectionCmd(FunctionalState NewState)
//  431 {
//  432   /* Check the parameters */
//  433   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  434 
//  435   if (NewState != DISABLE)
RTC_WriteProtectionCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??RTC_WriteProtectionCmd_0
//  436   {
//  437     /* Enable the write protection for RTC registers */
//  438     RTC->WPR = RTC_WPR_EnableKey;
        LD        A, #0xff
        LD        L:0x5159, A
        RET
//  439   }
//  440   else
//  441   {
//  442     /* Disable the write protection for RTC registers */
//  443     RTC->WPR = RTC_WPR_DisableKey1;
??RTC_WriteProtectionCmd_0:
        LD        A, #0xca
        LD        L:0x5159, A
//  444     RTC->WPR = RTC_WPR_DisableKey2;
        LD        A, #0x53
        LD        L:0x5159, A
//  445   }
//  446 }
        RET
//  447 
//  448 /**
//  449 * @brief  Enables or Disables the Bypass Shadow feature.
//  450 * @param  NewState: new state of the Bypass Shadow feature.
//  451 *         This parameter can be: ENABLE or DISABLE.
//  452 * @retval None
//  453 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  454 void RTC_BypassShadowCmd(FunctionalState NewState)
//  455 {
RTC_BypassShadowCmd:
        LD        S:?b0, A
//  456   /* Check the parameters */
//  457   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  458 
//  459   /* Disable the write protection for RTC registers */
//  460   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  461 
//  462   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_BypassShadowCmd_0
//  463   {
//  464     /* Set the BYPSHAD bit */
//  465     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
        BSET      L:0x5148, #0x4
        JRA       L:??RTC_BypassShadowCmd_1
//  466   }
//  467   else
//  468   {
//  469     /* Reset the BYPSHAD bit */
//  470     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
??RTC_BypassShadowCmd_0:
        BRES      L:0x5148, #0x4
//  471   }
//  472 
//  473   /* Enable the write protection for RTC registers */
//  474   RTC_WriteProtectionCmd(ENABLE);
??RTC_BypassShadowCmd_1:
        LD        A, #0xff
        LD        L:0x5159, A
//  475 }
        RET
//  476 
//  477 /**
//  478 * @brief  Enables or Disables the RTC Ratio.
//  479 * @param  NewState: new state of the Ratio feature.
//  480 *         This parameter can be: ENABLE or DISABLE.
//  481 * @retval None
//  482 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  483 void RTC_RatioCmd(FunctionalState NewState)
//  484 {
RTC_RatioCmd:
        LD        S:?b0, A
//  485   /* Check the parameters */
//  486   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  487 
//  488   /* Disable the write protection for RTC registers */
//  489   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  490 
//  491   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_RatioCmd_0
//  492   {
//  493     /* Set the RATIO bit */
//  494     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
        BSET      L:0x5148, #0x5
        JRA       L:??RTC_RatioCmd_1
//  495   }
//  496   else
//  497   {
//  498     /* Reset the RATIO bit */
//  499     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
??RTC_RatioCmd_0:
        BRES      L:0x5148, #0x5
//  500   }
//  501 
//  502   /* Enable the write protection for RTC registers */
//  503   RTC_WriteProtectionCmd(ENABLE);
??RTC_RatioCmd_1:
        LD        A, #0xff
        LD        L:0x5159, A
//  504 }
        RET
//  505 
//  506 /**
//  507 * @brief Sets the RTC current time.
//  508 * @param  RTC_Format: specifies the format of the entered parameters.
//  509 *         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
//  510 * @param  RTC_TimeStruct:  pointer to a  @ref RTC_TimeTypeDef structure that
//  511 *         contains the time configuration information for the RTC
//  512 * @retval An ErrorStatus enumeration value:
//  513 *          - SUCCESS: RTC Time register is configured
//  514 *          - ERROR: RTC Time register is not configured
//  515 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  516 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
//  517                         RTC_TimeTypeDef* RTC_TimeStruct)
//  518 {
RTC_SetTime:
        LD        S:?b1, A
        LDW       Y, X
//  519   ErrorStatus status = ERROR;
//  520   uint8_t temp = 0;
//  521 
//  522   /* Check the parameters */
//  523   assert_param(IS_RTC_FORMAT(RTC_Format));
//  524 
//  525   if (RTC_Format == RTC_Format_BIN)
//  526   {
//  527     /* Ckeck Hour Format (24h or 12h)*/
//  528     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
        LD        A, L:0x5148
//  529     {
//  530       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
//  531       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
//  532     }
//  533     else
//  534     {
//  535       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
//  536     }
//  537     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
//  538     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
//  539   }
//  540   else
//  541   {
//  542     /* Ckeck Hour Format (24h or 12h)*/
//  543     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
//  544     {
//  545       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
//  546       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
//  547     }
//  548     else
//  549     {
//  550       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
//  551     }
//  552     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
//  553     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
//  554   }
//  555 
//  556 
//  557   /* Disable the write protection for RTC registers */
//  558   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  559 
//  560   /* Set Initialization mode */
//  561   if (RTC_EnterInitMode() == ERROR)
        CALL      L:RTC_EnterInitMode
        TNZ       A
        JRNE      L:??RTC_SetTime_0
//  562   {
//  563     status = ERROR;
        CLR       S:?b0
//  564     /* Enable the write protection for RTC registers */
//  565     RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
        JRA       L:??RTC_SetTime_1
//  566   }
//  567   else
//  568   {
//  569     /* Ckeck Hour Format is 12h)*/
//  570     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
??RTC_SetTime_0:
        LD        A, #0x40
        AND       A, L:0x5148
        JREQ      L:??RTC_SetTime_2
//  571     {
//  572       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
//  573       temp = RTC_TimeStruct->RTC_H12;
        LDW       X, Y
        ADDW      X, #0x3
        LD        A, (X)
        LD        S:?b4, A
        JRA       L:??RTC_SetTime_3
//  574     }
//  575     else
//  576     {
//  577       temp = 0;
??RTC_SetTime_2:
        CLR       S:?b4
//  578     }
//  579     /* Check the input parameters format */
//  580     if (RTC_Format != RTC_Format_BIN)
??RTC_SetTime_3:
        LDW       X, Y
        ADDW      X, #0x2
        LD        A, (X)
        LD        S:?b0, A
        LDW       X, Y
        INCW      X
        LDW       S:?w1, X
        CLR       A
        CP        A, S:?b1
        JREQ      L:??RTC_SetTime_4
//  581     {
//  582       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
        LD        A, S:?b0
        LD        L:0x5140, A
//  583       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
        LD        A, [S:?w1.w]
        LD        L:0x5141, A
//  584       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
        LD        A, S:?b4
        OR        A, (Y)
        LD        L:0x5142, A
        JRA       L:??RTC_SetTime_5
//  585     }
//  586     else
//  587     {
//  588       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
??RTC_SetTime_4:
        LD        A, S:?b0
        CALL      L:ByteToBcd2
        LD        L:0x5140, A
//  589       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
        LD        A, [S:?w1.w]
        CALL      L:ByteToBcd2
        LD        L:0x5141, A
//  590       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
        LD        A, (Y)
        CALL      L:ByteToBcd2
        OR        A, S:?b4
        LD        L:0x5142, A
//  591     }
//  592     /*read DR3 register to unfroze calender registers */
//  593     (void)(RTC->DR3);
??RTC_SetTime_5:
        LD        A, L:0x5146
//  594 
//  595     /* Exit Initialization mode */
//  596     RTC_ExitInitMode();
        BRES      L:0x514c, #0x7
//  597 
//  598     /* Enable the write protection for RTC registers */
//  599     RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
//  600 
//  601     /* if  RTC_CR1_BYPSHAD bit = 0, wait for synchro else this check is not needed */
//  602     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
        LD        A, #0x10
        AND       A, L:0x5148
        JRNE      L:??RTC_SetTime_6
//  603     {
//  604       if (RTC_WaitForSynchro() == ERROR)
//  605       {
//  606         status = ERROR;
        CALL      L:RTC_WaitForSynchro
        LD        S:?b0, A
        JRA       L:??RTC_SetTime_1
//  607       }
//  608       else
//  609       {
//  610         status = SUCCESS;
//  611       }
//  612     }
//  613     else
//  614     {
//  615       status = SUCCESS;
??RTC_SetTime_6:
        LD        A, #0x1
        LD        S:?b0, A
//  616     }
//  617   }
//  618 
//  619   return (ErrorStatus)status;
??RTC_SetTime_1:
        LD        A, S:?b0
        RET
//  620 }
//  621 
//  622 /**
//  623 * @brief  Gets the RTC current Time.
//  624 * @note   To read the calendar, user software must first check that the
//  625 *         RSF flag is set in RTC_ISR1, using RTC_WaitForSynchro() function,
//  626 *         which means that the calendar registers have been correctly copied
//  627 *         into the shadow registers (RTC_TRx and RTC_DRx).
//  628 * @param  RTC_Format: specifies the format of the returned parameters.
//  629 *         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
//  630 * @param  RTC_TimeStruct: pointer to a @ref RTC_TimeTypeDef structure that
//  631 *         will contain the returned current time configuration.
//  632 * @retval None
//  633 
//  634 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  635 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
//  636                  RTC_TimeTypeDef* RTC_TimeStruct)
//  637 {
RTC_GetTime:
        LD        S:?b5, A
        LDW       Y, X
//  638   uint8_t  tmpreg = 0;
//  639 
//  640   /* Check the parameters */
//  641   assert_param(IS_RTC_FORMAT(RTC_Format));
//  642 
//  643   /* Fill the structure fields with the read parameters */
//  644   /* Get RTC seconds */
//  645   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
        ADDW      X, #0x2
        LDW       S:?w1, X
        LD        A, L:0x5140
        LD        [S:?w1.w], A
//  646 
//  647   /* Get RTC Minutes */
//  648   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
        LDW       X, Y
        INCW      X
        LDW       S:?w0, X
        LD        A, L:0x5141
        LD        [S:?w0.w], A
//  649 
//  650   /* Get the RTC_TR3 register */
//  651   tmpreg = (uint8_t)RTC->TR3;
        LD        A, L:0x5142
        LD        S:?b4, A
//  652 
//  653   /* Read DR3 register to unfreeze calender registers */
//  654   (void) (RTC->DR3) ;
        LD        A, L:0x5146
//  655 
//  656   /* Clear RSF flag by writing 0 in RSF bit */
//  657   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF);
        BRES      L:0x514c, #0x5
//  658 
//  659 
//  660   /* Get RTC Hours */
//  661   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
        LD        A, S:?b4
        AND       A, #0xbf
        LD        (Y), A
//  662 
//  663   /* Get RTC H12 state */
//  664   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
        LD        A, S:?b4
        AND       A, #0x40
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
//  665 
//  666   /* Check the input parameters format */
//  667   if (RTC_Format == RTC_Format_BIN)
        CLR       A
        CP        A, S:?b5
        JRNE      L:??RTC_GetTime_0
//  668   {
//  669     /* Convert the structure parameters to Binary format */
//  670     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
        LD        A, (Y)
        LD        S:?b6, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b4, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b4
        MUL       X, A
        EXG       A, XL
        LD        S:?b5, A
        LD        A, S:?b6
        AND       A, #0xf
        LD        S:?b4, A
        LD        A, S:?b5
        ADD       A, S:?b4
        LD        (Y), A
//  671     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
        LD        A, [S:?w0.w]
        LD        S:?b6, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b4, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b4
        MUL       X, A
        EXG       A, XL
        LD        S:?b5, A
        LD        A, S:?b6
        AND       A, #0xf
        LD        S:?b4, A
        LD        A, S:?b5
        ADD       A, S:?b4
        LD        [S:?w0.w], A
//  672     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
        LD        A, [S:?w1.w]
        LD        S:?b4, A
//  673   }
        SWAP      A
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b4
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, S:?b1
        ADD       A, S:?b0
        LD        [S:?w1.w], A
//  674 }
??RTC_GetTime_0:
        RET
//  675 
//  676 /**
//  677 * @brief  Gets the RTC current Calendar Subseconds value.
//  678 * @note   To read the calendar, user software must first check that the
//  679 *         RSF flag is set in RTC_ISR1, using RTC_WaitForSynchro() function,
//  680 *         which means that the calendar registers have been correctly copied
//  681 *         into the shadow registers (RTC_TRx and RTC_DRx).
//  682 * @param  None
//  683 * @retval RTC current Calendar Subseconds value.
//  684 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  685 uint16_t RTC_GetSubSecond(void)
//  686 {
//  687   uint8_t ssrhreg = 0, ssrlreg = 0;
//  688   uint16_t ssrreg = 0;
//  689 
//  690   /* Get subseconds values from the correspondent registers*/
//  691   ssrhreg = RTC->SSRH;
RTC_GetSubSecond:
        LD        A, L:0x5157
        LD        S:?b0, A
//  692   ssrlreg = RTC->SSRL;
        LD        A, L:0x5158
        LD        S:?b1, A
//  693 
//  694   /*read DR3 register to unfroze calender registers */
//  695   (void) (RTC->DR3);
        LD        A, L:0x5146
//  696 
//  697   /* Clear RSF flag by writing 0 in RSF bit */
//  698   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF);
        BRES      L:0x514c, #0x5
//  699 
//  700   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
//  701   return (uint16_t)(ssrreg);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
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
        LD        A, S:?b1
        EXG       A, YL
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RET
//  702 }
//  703 
//  704 /**
//  705 * @brief  Set the RTC current date.
//  706 * @param  RTC_Format: specifies the format of the entered parameters.
//  707 *         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
//  708 * @param  RTC_DateStruct:  pointer to a  @ref RTC_TimeTypeDef structure that
//  709 *         contains the date configuration information for the RTC.
//  710 * @retval An ErrorStatus enumeration value:
//  711 *          - SUCCESS: RTC Date register is configured
//  712 *          - ERROR: RTC Date register is not configured
//  713 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  714 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
//  715                         RTC_DateTypeDef* RTC_DateStruct)
//  716 {
RTC_SetDate:
        LD        S:?b1, A
        LDW       S:?w1, X
//  717   ErrorStatus status = ERROR;
//  718 
//  719   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
        CLR       A
        CP        A, S:?b1
        JRNE      L:??RTC_SetDate_0
        INCW      X
        LDW       Y, X
        LD        A, (Y)
        LD        S:?b0, A
        AND       A, #0x10
        JREQ      L:??RTC_SetDate_0
//  720   {
//  721     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
        LD        A, S:?b0
        AND       A, #0xef
        ADD       A, #0xa
        LD        (Y), A
//  722   }
//  723 
//  724   /* Check the parameters */
//  725   assert_param(IS_RTC_FORMAT(RTC_Format));
//  726   if (RTC_Format == RTC_Format_BIN)
//  727   {
//  728     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
//  729     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
//  730     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
//  731     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
//  732     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
//  733   }
//  734   else
//  735   {
//  736     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
//  737     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
//  738     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
//  739     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
//  740     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
//  741   }
//  742   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
//  743 
//  744   /* Disable the write protection for RTC registers */
//  745   RTC_WriteProtectionCmd(DISABLE);
??RTC_SetDate_0:
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  746 
//  747   /* Set Initialization mode */
//  748   if (RTC_EnterInitMode() == ERROR)
        CALL      L:RTC_EnterInitMode
        TNZ       A
        JRNE      L:??RTC_SetDate_1
//  749   {
//  750     status = ERROR;
        CLR       S:?b0
//  751     /* Enable the write protection for RTC registers */
//  752     RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
        JRA       L:??RTC_SetDate_2
//  753   }
//  754   else
//  755   {
//  756     (void)(RTC->TR1);
??RTC_SetDate_1:
        LD        A, L:0x5140
//  757     /* Set the RTC_DR registers */
//  758     /* Check the input parameters format */
//  759     if (RTC_Format != RTC_Format_BIN)
        LDW       X, S:?w1
        ADDW      X, #0x2
        LD        A, (X)
        LD        S:?b0, A
        LDW       X, S:?w1
        ADDW      X, #0x3
        LDW       S:?w2, X
        LDW       X, S:?w1
        INCW      X
        LDW       Y, X
        CLR       A
        CP        A, S:?b1
        JREQ      L:??RTC_SetDate_3
//  760     {
//  761       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
        LD        A, S:?b0
        LD        L:0x5144, A
//  762       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
        LD        A, [S:?w1.w]
        SWAP      A
        AND       A, #0xf0
        SLL       A
        OR        A, (Y)
        LD        L:0x5145, A
//  763       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
        LD        A, [S:?w2.w]
        LD        L:0x5146, A
        JRA       L:??RTC_SetDate_4
//  764     }
//  765     else
//  766     {
//  767       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
??RTC_SetDate_3:
        LD        A, S:?b0
        CALL      L:ByteToBcd2
        LD        L:0x5144, A
//  768       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
        LD        A, (Y)
        CALL      L:ByteToBcd2
        LD        S:?b0, A
        LD        A, [S:?w1.w]
        SWAP      A
        AND       A, #0xf0
        SLL       A
        OR        A, S:?b0
        LD        L:0x5145, A
//  769       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
        LD        A, [S:?w2.w]
        CALL      L:ByteToBcd2
        LD        L:0x5146, A
//  770     }
//  771 
//  772     /* Exit Initialization mode */
//  773     RTC_ExitInitMode();
??RTC_SetDate_4:
        BRES      L:0x514c, #0x7
//  774 
//  775     /* Enable the write protection for RTC registers */
//  776     RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
//  777 
//  778     /* if  RTC_CR1_BYPSHAD bit = 0, wait for synchro else this check is not needed */
//  779     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
        LD        A, #0x10
        AND       A, L:0x5148
        JRNE      L:??RTC_SetDate_5
//  780     {
//  781       if (RTC_WaitForSynchro() == ERROR)
//  782       {
//  783         status = ERROR;
        CALL      L:RTC_WaitForSynchro
        LD        S:?b0, A
        JRA       L:??RTC_SetDate_2
//  784       }
//  785       else
//  786       {
//  787         status = SUCCESS;
//  788       }
//  789     }
//  790     else
//  791     {
//  792       status = SUCCESS;
??RTC_SetDate_5:
        LD        A, #0x1
        LD        S:?b0, A
//  793     }
//  794   }
//  795 
//  796   return (ErrorStatus)status;
??RTC_SetDate_2:
        LD        A, S:?b0
        RET
//  797 }
//  798 
//  799 /**
//  800 * @brief  Get the RTC current date.
//  801 * @note   To read the calendar, user software must first check that the
//  802 *         RSF flag is set in RTC_ISR1, using RTC_WaitForSynchro() function,
//  803 *         which means that the calendar registers have been correctly copied
//  804 *         into the shadow registers (RTC_TRx and RTC_DRx).
//  805 * @param  RTC_Format: specifies the format of the returned parameters.
//  806 *         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
//  807 * @param  RTC_DateStruct: pointer to a @ref RTC_DateTypeDef structure that
//  808 *         will contain the returned current Date configuration.
//  809 * @retval None
//  810 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  811 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
//  812                  RTC_DateTypeDef* RTC_DateStruct)
//  813 {
RTC_GetDate:
        LD        S:?b7, A
        LDW       S:?w2, X
//  814   uint8_t tmpreg = 0;
//  815 
//  816   /* Check the parameters */
//  817   assert_param(IS_RTC_FORMAT(RTC_Format));
//  818 
//  819   /* Fill the structure fields with the read parameters */
//  820   (void) (RTC->TR1) ;
        LD        A, L:0x5140
//  821   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
        ADDW      X, #0x2
        LDW       Y, X
        LD        A, L:0x5144
        LD        (Y), A
//  822   tmpreg = (uint8_t)RTC->DR2;
        LD        A, L:0x5145
        LD        S:?b6, A
//  823   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
        LDW       X, S:?w2
        ADDW      X, #0x3
        LDW       S:?w1, X
        LD        A, L:0x5146
        LD        [S:?w1.w], A
//  824 
//  825   /* Clear RSF flag by writing 0 in RSF bit */
//  826   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF);
        BRES      L:0x514c, #0x5
//  827 
//  828   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
        LDW       X, S:?w2
        INCW      X
        LDW       S:?w0, X
        LD        A, S:?b6
        AND       A, #0x1f
        LD        [S:?w0.w], A
//  829   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
        LD        A, S:?b6
        SWAP      A
        AND       A, #0xf
        SRL       A
        LD        [S:?w2.w], A
//  830 
//  831   /* Check the input parameters format */
//  832   if (RTC_Format == RTC_Format_BIN)
        CLR       A
        CP        A, S:?b7
        JRNE      L:??RTC_GetDate_0
//  833   {
//  834     /* Convert the structure parameters to Binary format */
//  835     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
        LD        A, [S:?w1.w]
        LD        S:?b6, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b4, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b4
        MUL       X, A
        EXG       A, XL
        LD        S:?b5, A
        LD        A, S:?b6
        AND       A, #0xf
        LD        S:?b4, A
        LD        A, S:?b5
        ADD       A, S:?b4
        LD        [S:?w1.w], A
//  836     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
        LD        A, [S:?w0.w]
        LD        S:?b4, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b2, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b2
        MUL       X, A
        EXG       A, XL
        LD        S:?b3, A
        LD        A, S:?b4
        AND       A, #0xf
        LD        S:?b2, A
        LD        A, S:?b3
        ADD       A, S:?b2
        LD        [S:?w0.w], A
//  837     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
        LD        A, (Y)
        LD        S:?b2, A
//  838   }
        SWAP      A
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, S:?b1
        ADD       A, S:?b0
        LD        (Y), A
//  839 }
??RTC_GetDate_0:
        RET
//  840 
//  841 /**
//  842 * @brief  Configure the RTC Alarm Subseconds value and mask.
//  843 * @param  RTC_AlarmSubSecondValue: specifies the Subseconds value.
//  844 *         This parameter can be a value from 0 to 0x7FFF.
//  845 * @param  RTC_AlarmSubSecondMask:  specifies the Subseconds Mask.
//  846 *         This parameter can be one of the @ref RTC_AlarmSubSecondMask_TypeDef enumeration.
//  847 * @retval An ErrorStatus enumeration value:
//  848 *          - SUCCESS: Alarm Subseconds value and mask are configured
//  849 *          - ERROR: Alarm Subseconds value and mask are  not configured
//  850 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  851 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
//  852                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
//  853 {
RTC_AlarmSubSecondConfig:
        LDW       Y, X
        LD        S:?b1, A
//  854   uint8_t alarmstatus = 0;
//  855   ErrorStatus status = ERROR;
//  856 
//  857   /* Check the parameters */
//  858   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
//  859   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
//  860 
//  861   /* Disable the write protection for RTC registers */
//  862   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  863 
//  864   /* Check if the initialiazation mode is not set */
//  865   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
        LD        A, #0x40
        AND       A, L:0x514c
        JRNE      L:??RTC_AlarmSubSecondConfig_0
//  866   {
//  867     /* save  Alarm status */
//  868     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
        LD        A, L:0x5149
        LD        S:?b0, A
//  869 
//  870     /* Disable the Alarm */
//  871     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
        BRES      L:0x5149, #0x0
//  872 
//  873     /* Configure the Alarm register */
//  874     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5164, A
//  875     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
        LD        A, YL
        LD        L:0x5165, A
//  876     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
        LD        A, S:?b1
        LD        L:0x5166, A
//  877 
//  878     /* restore the saved  Alarm status */
//  879     RTC->CR2 |= alarmstatus;
        LD        A, S:?b0
        OR        A, #0x1
        OR        A, L:0x5149
        LD        L:0x5149, A
//  880 
//  881     status = SUCCESS;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??RTC_AlarmSubSecondConfig_1
//  882   }
//  883   else
//  884   {
//  885     status = ERROR;
??RTC_AlarmSubSecondConfig_0:
        CLR       S:?b0
//  886   }
//  887 
//  888   /* Enable the write protection for RTC registers */
//  889   RTC_WriteProtectionCmd(ENABLE);
??RTC_AlarmSubSecondConfig_1:
        LD        A, #0xff
        LD        L:0x5159, A
//  890 
//  891   return (ErrorStatus)status;
        LD        A, S:?b0
        RET
//  892 }
//  893 
//  894 /**
//  895   * @brief  Sets the RTC Alarm configuration.
//  896   * @note   Before configuring the Alarm sttings, the Alarm Unit must be disabled
//  897   *         (if enabled) using RTC_AlarmCmd() function.
//  898   * @param  RTC_Format: specifies the format of the entered parameters.
//  899   *         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
//  900   * @param  RTC_AlarmStruct:  pointer to a  @ref RTC_AlarmTypeDef structure that
//  901   *         contains the Alarm configuration information for the RTC.
//  902   * @retval None.
//  903   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  904 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
//  905                   RTC_AlarmTypeDef* RTC_AlarmStruct)
//  906 {
RTC_SetAlarm:
        PUSH      L:?b11
        PUSH      L:?b10
        PUSH      L:?b9
        PUSH      L:?b8
        PUSH      L:?b12
        LD        S:?b0, A
        LDW       Y, X
//  907   uint8_t tmpreg1 = 0;
//  908   uint8_t tmpreg2 = 0;
//  909   uint8_t tmpreg3 = 0;
//  910   uint8_t tmpreg4 = 0;
//  911 
//  912   /* Check the parameters */
//  913   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
//  914   assert_param(IS_RTC_FORMAT(RTC_Format));
//  915   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
//  916   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
//  917 
//  918 
//  919   if (RTC_Format == RTC_Format_BIN)
//  920   {
//  921     /* Ckeck Hour Format (24h or 12h)*/
//  922     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
        LD        A, L:0x5148
//  923     {
//  924       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
//  925       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
//  926     }
//  927     else
//  928     {
//  929       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
//  930     }
//  931     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
//  932     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
//  933   }
//  934   else
//  935   {
//  936     /* Ckeck Hour Format (24h or 12h)*/
//  937     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
//  938     {
//  939       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
//  940       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
//  941     }
//  942     else
//  943     {
//  944       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
//  945     }
//  946 
//  947     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
//  948 
//  949     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
//  950 
//  951   }
//  952 
//  953   /* if Date/Wday field is not masked */
//  954   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
//  955   {
//  956     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
//  957     {
//  958       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
//  959     }
//  960     else
//  961     {
//  962       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
//  963       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
//  964     }
//  965   }
//  966 
//  967 
//  968   /* Disable the write protection for RTC registers */
//  969   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
//  970 
//  971   /* Disable the Alarm in RTC_CR2 register */
//  972   RTC->CR2 &= (uint8_t)~RTC_CR2_ALRAE;
        BRES      L:0x5149, #0x0
//  973 
//  974   /* Check the input parameters format & Configure the Alarm register */
//  975   if (RTC_Format != RTC_Format_BIN)
        ADDW      X, #0x2
        LD        A, (X)
        LD        S:?b12, A
        LDW       X, Y
        ADDW      X, #0x5
        LDW       S:?w1, X
        LDW       X, Y
        ADDW      X, #0x6
        LDW       S:?w2, X
        LDW       X, Y
        ADDW      X, #0x3
        LDW       S:?w3, X
        LDW       X, Y
        INCW      X
        LDW       S:?w4, X
        LDW       X, Y
        ADDW      X, #0x4
        LDW       S:?w5, X
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_SetAlarm_0
//  976   {
//  977     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \ 
//  978                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
        LD        A, [S:?w5.w]
        LD        S:?b1, A
        AND       A, #0x80
        OR        A, S:?b12
        LD        S:?b12, A
//  979 
//  980     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \ 
//  981                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
        LD        A, S:?b1
        SLL       A
        AND       A, #0x80
        OR        A, [S:?w4.w]
        LD        S:?b8, A
//  982 
//  983     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \ 
//  984                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \ 
//  985                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
        LD        A, [S:?w3.w]
        OR        A, (Y)
        LD        S:?b6, A
        LD        A, S:?b1
        SLL       A
        SLL       A
        AND       A, #0x80
        LD        S:?b0, A
        LD        A, S:?b6
        OR        A, S:?b0
        LD        S:?b6, A
//  986 
//  987     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \ 
//  988                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \ 
//  989                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
        LD        A, [S:?w1.w]
        OR        A, [S:?w2.w]
        LD        S:?b2, A
        LD        A, S:?b1
        SLL       A
        SLL       A
        SLL       A
        AND       A, #0x80
        LD        S:?b0, A
        LD        A, S:?b2
        OR        A, S:?b0
        LD        S:?b0, A
        JRA       L:??RTC_SetAlarm_1
//  990 
//  991   }
//  992   else
//  993   {
//  994     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \ 
//  995                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
??RTC_SetAlarm_0:
        LD        A, S:?b12
        CALL      L:ByteToBcd2
        LD        S:?b0, A
        LD        A, #0x80
        AND       A, [S:?w5.w]
        OR        A, S:?b0
        LD        S:?b12, A
//  996 
//  997     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \ 
//  998                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
        LD        A, [S:?w4.w]
        CALL      L:ByteToBcd2
        LD        S:?b0, A
        LD        A, [S:?w5.w]
        SLL       A
        AND       A, #0x80
        OR        A, S:?b0
        LD        S:?b8, A
//  999 
// 1000     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \ 
// 1001                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \ 
// 1002                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
        LD        A, (Y)
        CALL      L:ByteToBcd2
        LD        S:?b0, A
        LD        A, [S:?w5.w]
        SLL       A
        SLL       A
        AND       A, #0x80
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, [S:?w3.w]
        OR        A, S:?b1
        LD        S:?b6, A
// 1003 
// 1004     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \ 
// 1005                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \ 
// 1006                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
        LD        A, [S:?w2.w]
        CALL      L:ByteToBcd2
        LD        S:?b0, A
        LD        A, [S:?w5.w]
        SLL       A
        SLL       A
        SLL       A
        AND       A, #0x80
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, [S:?w1.w]
        OR        A, S:?b1
        LD        S:?b0, A
// 1007   }
// 1008 
// 1009   /* Configure the Alarm register */
// 1010   RTC->ALRMAR1 = tmpreg1;
??RTC_SetAlarm_1:
        LD        A, S:?b12
        LD        L:0x515c, A
// 1011   RTC->ALRMAR2 = tmpreg2;
        LD        A, S:?b8
        LD        L:0x515d, A
// 1012   RTC->ALRMAR3 = tmpreg3;
        LD        A, S:?b6
        LD        L:0x515e, A
// 1013   RTC->ALRMAR4 = tmpreg4;
        LD        A, S:?b0
        LD        L:0x515f, A
// 1014 
// 1015   /* Enable the write protection for RTC registers */
// 1016   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1017 
// 1018 }
        POP       L:?b12
        POP       L:?b8
        POP       L:?b9
        POP       L:?b10
        POP       L:?b11
        RET
// 1019 
// 1020 /**
// 1021   * @brief  Gets the RTC Alarm configuration.
// 1022   * @param  RTC_Format: specifies the format of the entered parameters.
// 1023   *         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
// 1024   * @param  RTC_AlarmStruct:  pointer to a  @ref RTC_AlarmTypeDef structure that
// 1025   *         will contain the Alarm configuration information of  the RTC.
// 1026   * @retval None
// 1027   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1028 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
// 1029                   RTC_AlarmTypeDef* RTC_AlarmStruct)
// 1030 {
RTC_GetAlarm:
        PUSH      L:?b9
        PUSH      L:?b8
        PUSH      L:?b10
        LD        S:?b7, A
        LDW       Y, X
// 1031   uint8_t tmpreg1 = 0;
// 1032   uint8_t tmpreg2 = 0;
// 1033   uint8_t tmpreg3 = 0;
// 1034   uint8_t tmpreg4 = 0;
// 1035   uint8_t alarmmask = 0;
// 1036 
// 1037   /* Check the parameters */
// 1038   assert_param(IS_RTC_FORMAT(RTC_Format));
// 1039 
// 1040   /* Get Alarm registers data */
// 1041   tmpreg1 = (uint8_t)RTC->ALRMAR1;
        LD        A, L:0x515c
        LD        S:?b6, A
// 1042   tmpreg2 = (uint8_t)RTC->ALRMAR2;
        LD        A, L:0x515d
        LD        S:?b9, A
// 1043   tmpreg3 = (uint8_t)RTC->ALRMAR3;
        LD        A, L:0x515e
        LD        S:?b10, A
// 1044   tmpreg4 = (uint8_t)RTC->ALRMAR4;
        LD        A, L:0x515f
        LD        S:?b8, A
// 1045 
// 1046   /* Fill the structure with the read parameters */
// 1047   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
        ADDW      X, #0x2
        LDW       S:?w1, X
        LD        A, S:?b6
        AND       A, #0x7f
        LD        [S:?w1.w], A
// 1048   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
// 1049 
// 1050   /* Fill the structure with the read parameters */
// 1051   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
        LDW       X, Y
        INCW      X
        LDW       S:?w0, X
        LD        A, S:?b9
        AND       A, #0x7f
        LD        [S:?w0.w], A
// 1052   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
// 1053 
// 1054   /* Fill the structure with the read parameters */
// 1055   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
        LD        A, S:?b10
        AND       A, #0x3f
        LD        (Y), A
// 1056   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
        LD        A, S:?b10
        AND       A, #0x40
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
// 1057   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
// 1058 
// 1059   /* Fill the structure with the read parameters */
// 1060   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
        LDW       X, Y
        ADDW      X, #0x6
        LDW       S:?w2, X
        LD        A, S:?b8
        AND       A, #0x3f
        LD        [S:?w2.w], A
// 1061   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
        LD        A, S:?b8
        AND       A, #0x40
        LDW       X, Y
        ADDW      X, #0x5
        LD        (X), A
// 1062   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
// 1063 
// 1064   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
        LD        A, S:?b9
        SRL       A
        AND       A, #0x40
        LD        S:?b9, A
        LD        A, S:?b6
        AND       A, #0x80
        OR        A, S:?b9
        LD        S:?b9, A
        LD        A, S:?b10
        SRL       A
        SRL       A
        AND       A, #0x20
        LD        S:?b6, A
        LD        A, S:?b9
        OR        A, S:?b6
        LD        S:?b9, A
        LD        A, S:?b8
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x10
        LD        S:?b6, A
        LD        A, S:?b9
        OR        A, S:?b6
        LDW       X, Y
        ADDW      X, #0x4
        LD        (X), A
// 1065 
// 1066   if (RTC_Format == RTC_Format_BIN)
        CLR       A
        CP        A, S:?b7
        JRNE      L:??RTC_GetAlarm_0
// 1067   {
// 1068     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
        LD        A, (Y)
        LD        S:?b8, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b6, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b6
        MUL       X, A
        EXG       A, XL
        LD        S:?b7, A
        LD        A, S:?b8
        AND       A, #0xf
        LD        S:?b6, A
        LD        A, S:?b7
        ADD       A, S:?b6
        LD        (Y), A
// 1069     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
        LD        A, [S:?w0.w]
        LD        S:?b8, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b6, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b6
        MUL       X, A
        EXG       A, XL
        LD        S:?b7, A
        LD        A, S:?b8
        AND       A, #0xf
        LD        S:?b6, A
        LD        A, S:?b7
        ADD       A, S:?b6
        LD        [S:?w0.w], A
// 1070     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
        LD        A, [S:?w1.w]
        LD        S:?b6, A
        SWAP      A
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b6
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, S:?b1
        ADD       A, S:?b0
        LD        [S:?w1.w], A
// 1071     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
        LD        A, [S:?w2.w]
        LD        S:?b2, A
// 1072   }
        SWAP      A
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, #0xa
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, S:?b1
        ADD       A, S:?b0
        LD        [S:?w2.w], A
// 1073 }
??RTC_GetAlarm_0:
        POP       L:?b10
        POP       L:?b8
        POP       L:?b9
        RET
// 1074 
// 1075 /**
// 1076   * @brief  Enables or disables the RTC Alarm.
// 1077   * @param  NewState: new state of the alarm. This parameter can be: ENABLE or DISABLE.
// 1078   * @retval An ErrorStatus enumuration value:
// 1079   *          - SUCCESS: RTC Alarm is enabled/disabled
// 1080   *          - ERROR: RTC Alarm is not enabled/disabled
// 1081   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1082 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
// 1083 {
RTC_AlarmCmd:
        SUB       SP, #0x2
        LD        S:?b0, A
// 1084   __IO uint16_t alrawfcount = 0;
        CLRW      X
        LDW       (0x1,SP), X
// 1085   ErrorStatus status = ERROR;
// 1086   uint8_t temp1 = 0;
// 1087 
// 1088   /* Check the parameters */
// 1089   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1090 
// 1091   /* Disable the write protection for RTC registers */
// 1092   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1093 
// 1094   /* Configure the Alarm state */
// 1095   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_AlarmCmd_0
// 1096   { /*Enable the Alarm*/
// 1097     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
        BSET      L:0x5149, #0x0
// 1098     status = SUCCESS;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??RTC_AlarmCmd_1
// 1099   }
// 1100   else
// 1101   {  /* Disable the Alarm */
// 1102     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
??RTC_AlarmCmd_0:
        BRES      L:0x5149, #0x0
// 1103 
// 1104     /* Wait until ALRxWF flag is set */
// 1105     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
        LD        A, #0x1
        AND       A, L:0x514c
        LD        S:?b0, A
        JRA       L:??RTC_AlarmCmd_2
// 1106     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
// 1107     {
// 1108       alrawfcount++;
??RTC_AlarmCmd_3:
        LDW       X, (0x1,SP)
        INCW      X
        LDW       (0x1,SP), X
// 1109     }
??RTC_AlarmCmd_2:
        LDW       X, (0x1,SP)
        CPW       X, #0xffff
        JREQ      L:??RTC_AlarmCmd_4
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_AlarmCmd_3
// 1110 
// 1111     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
??RTC_AlarmCmd_4:
        LD        A, L:0x514c
// 1112     {
// 1113       status = ERROR;
        AND       A, #0x1
        LD        S:?b0, A
// 1114     }
// 1115     else
// 1116     {
// 1117       status = SUCCESS;
// 1118     }
// 1119   }
// 1120 
// 1121   /* Enable the write protection for RTC registers */
// 1122   RTC_WriteProtectionCmd(ENABLE);
??RTC_AlarmCmd_1:
        LD        A, #0xff
        LD        L:0x5159, A
// 1123 
// 1124   /* Return the status*/
// 1125   return (ErrorStatus)status;
        LD        A, S:?b0
        ADD       SP, #0x2
        RET
// 1126 }
// 1127 
// 1128 /**
// 1129   * @brief  Configures the RTC Wakeup clock source.
// 1130   * @pre    Before configuring the wakeup unit Clock source, the wake up Unit must
// 1131   *         be disabled (if enabled) using RTC_WakeUpCmd(Disable) .
// 1132   * @param  RTC_WakeupClockSrc: specifies the Wakeup clock source,
// 1133   *         this parameter  can be one of the @ref RTC_WakeupClockSrc_TypeDef enumeration.
// 1134   * @retval None
// 1135   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1136 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
// 1137 {
RTC_WakeUpClockConfig:
        LD        S:?b0, A
// 1138 
// 1139   /* Check the parameters */
// 1140   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
// 1141 
// 1142   /* Disable the write protection for RTC registers */
// 1143   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1144 
// 1145   /* Disable the Wake-up timer in RTC_CR2 register */
// 1146   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
        BRES      L:0x5149, #0x2
// 1147 
// 1148   /* Clear the Wakeup Timer clock source bits in CR1 register */
// 1149   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
        LD        A, #0xf8
        AND       A, L:0x5148
        LD        L:0x5148, A
// 1150 
// 1151   /* Configure the clock source */
// 1152   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
        LD        A, S:?b0
        OR        A, L:0x5148
        LD        L:0x5148, A
// 1153 
// 1154   /* Enable the write protection for RTC registers */
// 1155   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1156 }
        RET
// 1157 
// 1158 /**
// 1159   * @brief  Sets the RTC Wakeup counter.
// 1160   * @note   Before configuring the wakeup unit counter, the wake up Unit must be
// 1161   *         disabled (if enabled) using RTC_WakeUpCmd(Disable).
// 1162   * @param  RTC_WakeupCounter: specifies the Wake up counter,
// 1163   *         This parameter can be a value from 0x0000 to 0xFFFF.
// 1164   * @retval None.
// 1165   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1166 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
// 1167 {
RTC_SetWakeUpCounter:
        LDW       Y, X
// 1168   /* Disable the write protection for RTC registers */
// 1169   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1170 
// 1171   /* Disable the Wake-up timer in RTC_CR2 register */
// 1172   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
        BRES      L:0x5149, #0x2
// 1173 
// 1174   /* Configure the Wakeup Timer counter */
// 1175   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LD        L:0x5154, A
// 1176   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
        LD        A, YL
        LD        L:0x5155, A
// 1177 
// 1178   /* Enable the write protection for RTC registers */
// 1179   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1180 }
        RET
// 1181 
// 1182 /**
// 1183   * @brief  Returns the RTC Wakeup timer counter value.
// 1184   * @param  None.
// 1185   * @retval RTC Wakeup Counter value.
// 1186   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1187 uint16_t RTC_GetWakeUpCounter(void)
// 1188 {
// 1189   uint16_t tmpreg = 0;
// 1190 
// 1191   /* Get the counter value */
// 1192   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
RTC_GetWakeUpCounter:
        LD        A, L:0x5154
        LD        S:?b1, A
// 1193   tmpreg |= RTC->WUTRL;
        LD        A, L:0x5155
        LD        S:?b0, A
// 1194 
// 1195   /* return RTC Wakeup Counter value*/
// 1196   return (uint16_t)tmpreg;
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
// 1197 }
// 1198 
// 1199 /**
// 1200   * @brief  Enables or Disables the RTC Wakeup Unit.
// 1201   * @param  NewState: new state of the Wakeup Unit. This parameter can be: ENABLE or DISABLE.
// 1202   * @retval An ErrorStatus enumuration value:
// 1203   *          - SUCCESS : RTC Wakeup Unit is enabled/disabled
// 1204   *          - ERROR    : RTC Wakeup Unit is not enabled/disabled
// 1205   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1206 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
// 1207 {
RTC_WakeUpCmd:
        LD        S:?b0, A
// 1208   ErrorStatus status = ERROR;
// 1209   uint16_t wutwfcount = 0;
        CLRW      X
// 1210 
// 1211   /* Check the parameters */
// 1212   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1213 
// 1214   /* Disable the write protection for RTC registers */
// 1215   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1216 
// 1217   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_WakeUpCmd_0
// 1218   {
// 1219     /* Enable the Wakeup Timer */
// 1220     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
        BSET      L:0x5149, #0x2
// 1221 
// 1222     status = SUCCESS;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??RTC_WakeUpCmd_1
// 1223   }
// 1224   else
// 1225   {
// 1226     /* Disable the Wakeup Timer */
// 1227     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
??RTC_WakeUpCmd_0:
        BRES      L:0x5149, #0x2
        JRA       L:??RTC_WakeUpCmd_2
// 1228 
// 1229     /* Wait until WUTWF flag is set */
// 1230     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
// 1231     {
// 1232       wutwfcount++;
??RTC_WakeUpCmd_3:
        INCW      X
// 1233     }
??RTC_WakeUpCmd_2:
        LD        A, #0x4
        AND       A, L:0x514c
        JRNE      L:??RTC_WakeUpCmd_4
        CPW       X, #0xffff
        JRNE      L:??RTC_WakeUpCmd_3
// 1234 
// 1235     /* Check WUTWF flag is set or not */
// 1236     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
??RTC_WakeUpCmd_4:
        LD        A, L:0x514c
// 1237     {
// 1238       status = ERROR;
        AND       A, #0x4
        JREQ      L:??RTC_WakeUpCmd_5
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??RTC_WakeUpCmd_1
??RTC_WakeUpCmd_5:
        CLR       S:?b0
// 1239     }
// 1240     else
// 1241     {
// 1242       status = SUCCESS;
// 1243     }
// 1244   }
// 1245 
// 1246   /* Enable the write protection for RTC registers */
// 1247   RTC_WriteProtectionCmd(ENABLE);
??RTC_WakeUpCmd_1:
        LD        A, #0xff
        LD        L:0x5159, A
// 1248 
// 1249   /* Return the status*/
// 1250   return (ErrorStatus)status;
        LD        A, S:?b0
        RET
// 1251 }
// 1252 
// 1253 /**
// 1254   * @brief  Configures the RTC output for the output pin (RTC_ALARM output).
// 1255   * @param  RTC_OutputSel: Specifies which signal will be mapped to the output.
// 1256   *         This parameter can be one parameter from the @ref RTC_OutputSel_TypeDef enumeration.
// 1257   * @param  RTC_OutputPolarity: Specifies the polarity of the output signal.
// 1258   *         This parameter can be one parameter from the @ref RTC_OutputPolarity_TypeDef enumeration.
// 1259   * @retval None
// 1260   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1261 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
// 1262                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
// 1263 {
RTC_OutputConfig:
        LD        S:?b1, A
// 1264   /* Check the parameters */
// 1265   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
// 1266   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
// 1267 
// 1268   /* Disable the write protection for RTC registers */
// 1269   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1270 
// 1271   /* Clear the bits to be configured */
// 1272   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
        LD        A, #0x8f
        AND       A, L:0x514a
        LD        L:0x514a, A
// 1273 
// 1274   /* Configure the output selection and polarity */
// 1275   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
        LD        A, S:?b0
        OR        A, S:?b1
        OR        A, L:0x514a
        LD        L:0x514a, A
// 1276 
// 1277   /* Enable the write protection for RTC registers */
// 1278   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1279 }
        RET
// 1280 
// 1281 /**
// 1282   * @brief  Adds or subtracts one hour from the current time depending on
// 1283   *         the daylight saving parameter.
// 1284   * @param  RTC_DayLightSaving: the day light saving Mode
// 1285   *         This parameter can be one of the @ref RTC_DayLightSaving_TypeDef enumeration.
// 1286   * @param  RTC_StoreOperation: the day light saving store operation
// 1287   *         This parameter can be one of the @ref RTC_StoreOperation_TypeDef enumeration.
// 1288   * @retval None
// 1289   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1290 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
// 1291                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
// 1292 {
RTC_DayLightSavingConfig:
        LD        S:?b1, A
// 1293   /* Check the parameters */
// 1294   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
// 1295   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
// 1296 
// 1297   /* Disable the write protection for RTC registers */
// 1298   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1299 
// 1300   /* Clear the bits to be configured */
// 1301   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
        BRES      L:0x514a, #0x2
// 1302 
// 1303   /* Configure the RTC_CR3 register */
// 1304   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
        LD        A, S:?b0
        OR        A, S:?b1
        OR        A, L:0x514a
        LD        L:0x514a, A
// 1305 
// 1306   /* Enable the write protection for RTC registers */
// 1307   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1308 }
        RET
// 1309 
// 1310 /**
// 1311   * @brief  Returns the stored operation.
// 1312   * @param  None
// 1313   * @retval the store operation, this parameter can be one of
// 1314   * the @ref RTC_StoreOperation_TypeDef enumeration.
// 1315   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1316 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
// 1317 {
// 1318   /* Return the stored operation*/
// 1319   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
RTC_GetStoreOperation:
        LD        A, #0x4
        AND       A, L:0x514a
        RET
// 1320 }
// 1321 
// 1322 /**
// 1323   * @brief  Configures the Tampers Filter.
// 1324   * @param  RTC_TamperFilter: Specifies the tampers filter.
// 1325   *         This parameter can be one parameter from the
// 1326   *         @ref RTC_TamperFilter_TypeDef enumeration.
// 1327   * @retval None
// 1328   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1329 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
// 1330 {
RTC_TamperFilterConfig:
        LD        S:?b0, A
// 1331 
// 1332   /* Check the parameters */
// 1333   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
// 1334 
// 1335   /* Disable the write protection for RTC registers */
// 1336   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1337 
// 1338   /*clear flags before config*/
// 1339   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
        LD        A, #0xe7
        AND       A, L:0x516d
        LD        L:0x516d, A
// 1340 
// 1341   /* Configure the RTC_TCR register */
// 1342   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
        LD        A, S:?b0
        OR        A, L:0x516d
        LD        L:0x516d, A
// 1343 
// 1344   /* Enable the write protection for RTC registers */
// 1345   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1346 
// 1347 }
        RET
// 1348 
// 1349 /**
// 1350   * @brief  Configures the Tampers Sampling Frequency.
// 1351   * @param  RTC_TamperSamplingFreq: Specifies the tampers Sampling Frequency.
// 1352   *         This parameter can be one parameter from the
// 1353   *         @ref RTC_TamperSamplingFreq_TypeDef enumeration.
// 1354   * @retval None
// 1355   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1356 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
// 1357 {
RTC_TamperSamplingFreqConfig:
        LD        S:?b0, A
// 1358   /* Check the parameters */
// 1359   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
// 1360 
// 1361   /* Disable the write protection for RTC registers */
// 1362   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1363 
// 1364   /* Clear flags before config*/
// 1365   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
        LD        A, #0xf8
        AND       A, L:0x516d
        LD        L:0x516d, A
// 1366 
// 1367   /* Configure the RTC_TCR register */
// 1368   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
        LD        A, S:?b0
        OR        A, L:0x516d
        LD        L:0x516d, A
// 1369 
// 1370   /* Enable the write protection for RTC registers */
// 1371   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1372 }
        RET
// 1373 
// 1374 /**
// 1375 * @brief  Configures the Tampers Pins input Precharge Duration.
// 1376 * @param  RTC_TamperPrechargeDuration: Specifies the Tampers Pins input
// 1377 *         Precharge Duration.
// 1378 *         This parameter can be one parameter from the
// 1379 *         @ref RTC_TamperPrechargeDuration_TypeDef enumeration.
// 1380 * @retval None
// 1381 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1382 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
// 1383 {
RTC_TamperPinsPrechargeDuration:
        LD        S:?b0, A
// 1384   /* Check the parameters */
// 1385   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
// 1386 
// 1387   /* Disable the write protection for RTC registers */
// 1388   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1389 
// 1390   /* Clear the tampers  pull-up  and precharge/discharge duration Old settings*/
// 1391   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
        LD        A, #0x1f
        AND       A, L:0x516d
        LD        L:0x516d, A
// 1392 
// 1393   /* Configure the Tampers Precharge Duration  and pull-up New settings*/
// 1394   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
        LD        A, S:?b0
        OR        A, L:0x516d
        LD        L:0x516d, A
// 1395 
// 1396   /* Enable the write protection for RTC registers */
// 1397   RTC_WriteProtectionCmd(ENABLE);
        LD        A, #0xff
        LD        L:0x5159, A
// 1398 }
        RET
// 1399 
// 1400 /**
// 1401 * @brief  Configures the Tamper Sensitive Level.
// 1402 * @param  RTC_Tamper: Select the tamper to configure.
// 1403 *         This parameter can be one parameter from the @ref RTC_Tamper_TypeDef
// 1404 *         enumeration.
// 1405 * @param  RTC_TamperLevel: Select the tamper Sensitive Level.
// 1406 *         This parameter can be one parameter from the @ref RTC_TamperLevel_TypeDef
// 1407 *         enumeration.
// 1408 * @retval None
// 1409 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1410 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
// 1411                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
// 1412 {
RTC_TamperLevelConfig:
        LD        S:?b1, A
// 1413   /* Check the parameters */
// 1414   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
// 1415   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
// 1416 
// 1417   /* Disable the write protection for RTC registers */
// 1418   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1419 
// 1420   if (RTC_TamperLevel != RTC_TamperLevel_Low)
        LD        A, S:?b1
        SLL       A
        LD        S:?b1, A
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_TamperLevelConfig_0
// 1421   {
// 1422     /* Enable the selected Tampers */
// 1423     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
        LD        A, S:?b1
        OR        A, L:0x516c
        LD        L:0x516c, A
        JRA       L:??RTC_TamperLevelConfig_1
// 1424   }
// 1425   else
// 1426   {
// 1427     /* Disable the selected Tampers */
// 1428     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
??RTC_TamperLevelConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x516c
        LD        L:0x516c, A
// 1429   }
// 1430 
// 1431   /* Enable the write protection for RTC registers */
// 1432   RTC_WriteProtectionCmd(ENABLE);
??RTC_TamperLevelConfig_1:
        LD        A, #0xff
        LD        L:0x5159, A
// 1433 }
        RET
// 1434 
// 1435 /**
// 1436 * @brief  Enables or Disables the Tamper detection.
// 1437 * @param  RTC_Tamper: Select the tamper to configure.
// 1438 *         This parameter can be one parameter from the @ref RTC_Tamper_TypeDef
// 1439 *         enumeration.
// 1440 * @param  NewState: new state of the tamper pin.
// 1441 *         This parameter can be: ENABLE or DISABLE.
// 1442 * @retval None
// 1443 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1444 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
// 1445                    FunctionalState NewState)
// 1446 {
RTC_TamperCmd:
        LD        S:?b1, A
// 1447 
// 1448   /* Check the parameters */
// 1449   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
// 1450   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1451 
// 1452   /* Disable the write protection for RTC registers */
// 1453   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1454 
// 1455 
// 1456   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_TamperCmd_0
// 1457   {
// 1458     /* Enable the selected Tampers */
// 1459     RTC->TCR1 |= (uint8_t)RTC_Tamper;
        LD        A, S:?b1
        OR        A, L:0x516c
        LD        L:0x516c, A
        JRA       L:??RTC_TamperCmd_1
// 1460   }
// 1461   else
// 1462   {
// 1463     /* Disable the selected Tampers */
// 1464     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
??RTC_TamperCmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x516c
        LD        L:0x516c, A
// 1465   }
// 1466 
// 1467 
// 1468   /* Enable the write protection for RTC registers */
// 1469   RTC_WriteProtectionCmd(ENABLE);
??RTC_TamperCmd_1:
        LD        A, #0xff
        LD        L:0x5159, A
// 1470 }
        RET
// 1471 
// 1472 /**
// 1473 * @brief  Configures the Synchronization Shift Control Settings.
// 1474 * @param  RTC_ShiftAdd1S : Select to add or not 1 second to the time Calendar.
// 1475 *         This parameter can be one parameter from the @ref RTC_ShiftAdd1S_TypeDef
// 1476 *         enumeration.
// 1477 * @param  RTC_ShiftSubFS: Select the number of Second Fractions to Substitute.
// 1478 *         This parameter can be one any value from 0 to 0x7FFF.
// 1479  * @retval An ErrorStatus enumeration value:
// 1480 *          - SUCCESS: RTC Shift registers are configured
// 1481 *          - ERROR: RTC Shift registers are not configured
// 1482 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1483 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
// 1484                                    uint16_t RTC_ShiftSubFS)
// 1485 {
RTC_SynchroShiftConfig:
        LD        S:?b0, A
        LDW       Y, X
// 1486   uint8_t shiftrhreg = 0;
// 1487   ErrorStatus status = ERROR;
// 1488   uint16_t shpfcount = 0;
        CLRW      X
// 1489 
// 1490   /* Check the parameters */
// 1491   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
// 1492   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
// 1493 
// 1494   /* Disable the write protection for RTC registers */
// 1495   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1496 
// 1497   /* Check if a Shift is pending*/
// 1498   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
        LD        A, #0x8
        AND       A, L:0x514c
        JRNE      L:??RTC_SynchroShiftConfig_0
        JRA       L:??RTC_SynchroShiftConfig_1
// 1499   {
// 1500     /* wait until the shift is completed*/
// 1501     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
// 1502     {
// 1503       shpfcount++;
??RTC_SynchroShiftConfig_2:
        INCW      X
// 1504     }
??RTC_SynchroShiftConfig_0:
        LD        A, #0x8
        AND       A, L:0x514c
        JREQ      L:??RTC_SynchroShiftConfig_1
        CPW       X, #0xffff
        JRNE      L:??RTC_SynchroShiftConfig_2
// 1505   }
// 1506 
// 1507   /* check if the Shift pending is completed or if there is no Shift operation at all*/
// 1508   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
??RTC_SynchroShiftConfig_1:
        LD        A, #0x8
        AND       A, L:0x514c
        JRNE      L:??RTC_SynchroShiftConfig_3
// 1509   {
// 1510     /* Configure the Shift settings */
// 1511     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
// 1512     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
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
        OR        A, S:?b0
        LD        L:0x515a, A
// 1513     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
        LD        A, YL
        LD        L:0x515b, A
// 1514 
// 1515     status = SUCCESS;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??RTC_SynchroShiftConfig_4
// 1516   }
// 1517   else
// 1518   {
// 1519     status = ERROR;
??RTC_SynchroShiftConfig_3:
        CLR       S:?b0
// 1520   }
// 1521 
// 1522   /* Enable the write protection for RTC registers */
// 1523   RTC_WriteProtectionCmd(ENABLE);
??RTC_SynchroShiftConfig_4:
        LD        A, #0xff
        LD        L:0x5159, A
// 1524 
// 1525   return (ErrorStatus)(status);
        LD        A, S:?b0
        RET
// 1526 }
// 1527 
// 1528 /**
// 1529 * @brief  Configures the Smooth Calibration Settings.
// 1530 * @param  RTC_SmoothCalibPeriod : Select the Smooth Calibration Period.
// 1531 *         This parameter can be one parameter from
// 1532 *         the @ref RTC_SmoothCalibPeriod_TypeDef enumeration.
// 1533 * @param  RTC_SmoothCalibPlusPulses : Select to Set or reset the CALP bit.
// 1534 *         This parameter can be one parameter from the
// 1535 *         @ref RTC_SmoothCalibPlusPulses_TypeDef enumeration.
// 1536 * @param  RTC_SmouthCalibMinusPulsesValue: Select the value of CALM[8:0] bits.
// 1537 *         This parameter can be one any value from 0 to 0x01FF.
// 1538 * @retval An ErrorStatus enumeration value:
// 1539 *          - SUCCESS: RTC Calib registers are configured
// 1540 *          - ERROR: RTC Calib registers are not configured
// 1541 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1542 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
// 1543                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
// 1544                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
// 1545 {
RTC_SmoothCalibConfig:
        LD        S:?b1, A
        LDW       Y, X
// 1546   ErrorStatus status = ERROR;
// 1547   uint16_t recalpfcount = 0;
        CLRW      X
// 1548 
// 1549   /* Check the parameters */
// 1550   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
// 1551   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
// 1552   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
// 1553 
// 1554   /* Disable the write protection for RTC registers */
// 1555   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1556 
// 1557   /* check if a calibrartion is pending*/
// 1558   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
        LD        A, #0x2
        AND       A, L:0x514c
        JRNE      L:??RTC_SmoothCalibConfig_0
        JRA       L:??RTC_SmoothCalibConfig_1
// 1559   {
// 1560     /* wait until the Calibration is completed*/
// 1561     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
// 1562     {
// 1563       recalpfcount++;
??RTC_SmoothCalibConfig_2:
        INCW      X
// 1564     }
??RTC_SmoothCalibConfig_0:
        LD        A, #0x2
        AND       A, L:0x514c
        JREQ      L:??RTC_SmoothCalibConfig_1
        CPW       X, #0xffff
        JRNE      L:??RTC_SmoothCalibConfig_2
// 1565   }
// 1566 
// 1567   /* check if the calibrartion pending is completed or if there is no calibration operation at all*/
// 1568   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
??RTC_SmoothCalibConfig_1:
        LD        A, #0x2
        AND       A, L:0x514c
        JRNE      L:??RTC_SmoothCalibConfig_3
// 1569   {
// 1570     /* Configure the Smooth calib settings */
// 1571     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | (uint8_t)RTC_SmoothCalibPlusPulses) | (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
        LDW       X, Y
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        EXG       A, XL
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b1
        OR        A, S:?b2
        LD        L:0x516a, A
// 1572     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
        LD        A, YL
        LD        L:0x516b, A
// 1573 
// 1574     status = SUCCESS;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??RTC_SmoothCalibConfig_4
// 1575   }
// 1576   else
// 1577   {
// 1578     status = ERROR;
??RTC_SmoothCalibConfig_3:
        CLR       S:?b0
// 1579   }
// 1580 
// 1581   /* Enable the write protection for RTC registers */
// 1582   RTC_WriteProtectionCmd(ENABLE);
??RTC_SmoothCalibConfig_4:
        LD        A, #0xff
        LD        L:0x5159, A
// 1583 
// 1584   return (ErrorStatus)(status);
        LD        A, S:?b0
        RET
// 1585 }
// 1586 
// 1587 /**
// 1588 * @brief  Configure the Calib Pinout (RTC_CALIB) Selection (1Hz or 512Hz).
// 1589 * @param  RTC_CalibOutput : Select the Calib output Selection .
// 1590 *         This parameter can be one parameter from the
// 1591 *         @ref RTC_CalibOutput_TypeDef enumeration.
// 1592 * @retval None
// 1593 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1594 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
// 1595 {
RTC_CalibOutputConfig:
        LD        S:?b0, A
// 1596   /* Check the parameters */
// 1597   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
// 1598 
// 1599   /* Disable the write protection for RTC registers */
// 1600   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1601 
// 1602   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_CalibOutputConfig_0
// 1603   {
// 1604     /* Enable the RTC clock output */
// 1605     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
        BSET      L:0x514a, #0x3
        JRA       L:??RTC_CalibOutputConfig_1
// 1606   }
// 1607   else
// 1608   {
// 1609     /* Disable the RTC clock output */
// 1610     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
??RTC_CalibOutputConfig_0:
        BRES      L:0x514a, #0x3
// 1611   }
// 1612 
// 1613   /* Enable the write protection for RTC registers */
// 1614   RTC_WriteProtectionCmd(ENABLE);
??RTC_CalibOutputConfig_1:
        LD        A, #0xff
        LD        L:0x5159, A
// 1615 }
        RET
// 1616 
// 1617 /**
// 1618 * @brief  Enables or disables the RTC clock to be output through the relative pin.
// 1619 * @param  NewState: new state of the RTC calib output
// 1620 *         This parameter can be: ENABLE or DISABLE.
// 1621 * @retval None
// 1622 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1623 void RTC_CalibOutputCmd(FunctionalState NewState)
// 1624 {
RTC_CalibOutputCmd:
        LD        S:?b0, A
// 1625   /* Check the parameters */
// 1626   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1627 
// 1628   /* Disable the write protection for RTC registers */
// 1629   RTC_WriteProtectionCmd(DISABLE);
        LD        A, #0xca
        LD        L:0x5159, A
        LD        A, #0x53
        LD        L:0x5159, A
// 1630 
// 1631   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??RTC_CalibOutputCmd_0
// 1632   {
// 1633     /* Enable the RTC clock output */
// 1634     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
        BSET      L:0x514a, #0x7
        JRA       L:??RTC_CalibOutputCmd_1
// 1635   }
// 1636   else
// 1637   {
// 1638     /* Disable the RTC clock output */
// 1639     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
??RTC_CalibOutputCmd_0:
        BRES      L:0x514a, #0x7
// 1640   }
// 1641 
// 1642   /* Enable the write protection for RTC registers */
// 1643   RTC_WriteProtectionCmd(ENABLE);
??RTC_CalibOutputCmd_1:
        LD        A, #0xff
        LD        L:0x5159, A
// 1644 }
        RET
// 1645 
// 1646 /**
// 1647 * @brief  Checks whether the specified RTC flag is set or not.
// 1648 * @param  RTC_FLAG: specifies the flag to check.
// 1649 *         This parameter can be one of the @ref RTC_Flag_TypeDef enumeration.
// 1650 * @retval Status of RTC_FLAG (SET or RESET)
// 1651 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1652 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
// 1653 {
RTC_GetFlagStatus:
        LDW       S:?w2, X
// 1654   FlagStatus flagstatus = RESET;
// 1655   uint16_t tmpreg1 = 0;
// 1656   uint16_t tmpreg2 = 0;
// 1657 
// 1658   /* Check the parameters */
// 1659   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
// 1660 
// 1661   /* Get all the flags */
// 1662   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
        LD        A, L:0x514c
        LD        S:?b1, A
// 1663   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
        LD        A, L:0x514d
        LD        S:?b0, A
// 1664 
// 1665   /* Return the status of the flag */
// 1666   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
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
        LDW       S:?w1, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        RRWA      X, A
        OR        A, S:?b3
        RRWA      X, A
        OR        A, S:?b2
        RLWA      X, A
        AND       A, S:?b5
        RRWA      X, A
        AND       A, S:?b4
        RRWA      X, A
        JREQ      L:??RTC_GetFlagStatus_0
// 1667   {
// 1668     flagstatus = SET;
        LD        A, #0x1
        RET
// 1669   }
// 1670   else
// 1671   {
// 1672     flagstatus = RESET;
??RTC_GetFlagStatus_0:
        CLR       A
// 1673   }
// 1674   return (FlagStatus)flagstatus;
        RET
// 1675 }
// 1676 
// 1677 /**
// 1678 * @brief  Clears the RTC's pending flags.
// 1679 * @param  RTC_FLAG: specifies the RTC flag to clear.
// 1680 *         This parameter can be any combination of the @ref RTC_Flag_TypeDef
// 1681 *         enumeration.
// 1682 * @retval None
// 1683 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1684 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
// 1685 {
// 1686   /* Check the parameters */
// 1687   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
// 1688 
// 1689   /* Clear the Flags in the RTC_ISR registers */
// 1690   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
RTC_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x514d, A
// 1691   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
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
        AND       A, #0x7f
        LD        L:0x514c, A
// 1692 }
        RET
// 1693 
// 1694 /**
// 1695 * @brief  Checks whether the specified RTC interrupt has occurred or not.
// 1696 * @param  RTC_IT: specifies the RTC interrupt source to check.
// 1697 *   This parameter can be one of the @ref RTC_IT_TypeDef enumeration.
// 1698 * @retval Status of RTC_IT (SET or RESET).
// 1699 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1700 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
// 1701 {
RTC_GetITStatus:
        LDW       Y, X
// 1702   ITStatus itstatus = RESET;
// 1703   uint8_t enablestatus = 0, tmpreg = 0;
// 1704 
// 1705   /* Check the parameters */
// 1706   assert_param(IS_RTC_GET_IT(RTC_IT));
// 1707 
// 1708   /* Get the Interrupt enable Status */
// 1709   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
        LD        A, L:0x5149
        LD        S:?b0, A
// 1710 
// 1711   /* Get the Interrupt pending bit */
// 1712   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, L:0x514d
        LD        S:?b1, A
// 1713 
// 1714   /* Get the status of the Interrupt */
// 1715   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
        LD        A, YL
        AND       A, S:?b0
        JREQ      L:??RTC_GetITStatus_0
        CLR       A
        CP        A, S:?b1
        JREQ      L:??RTC_GetITStatus_0
// 1716   {
// 1717     itstatus = SET;
        LD        A, #0x1
        RET
// 1718   }
// 1719   else
// 1720   {
// 1721     itstatus = RESET;
??RTC_GetITStatus_0:
        CLR       A
// 1722   }
// 1723 
// 1724   return (ITStatus)itstatus;
        RET
// 1725 }
// 1726 
// 1727 /**
// 1728 * @brief  Clears the RTC's interrupt pending bits.
// 1729 * @param  RTC_IT: specifies the RTC interrupt pending bit to clear.
// 1730 *         This parameter can be any combination of the @ref RTC_IT_TypeDef
// 1731 *         enumeration.
// 1732 * @retval None
// 1733 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1734 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
// 1735 {
// 1736   /* Check the parameters */
// 1737   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
// 1738 
// 1739   /* Clear the interrupt pending bits in the RTC_ISR registers */
// 1740   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
RTC_ClearITPendingBit:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        CPL       A
        LD        L:0x514d, A
// 1741 }
        RET
// 1742 
// 1743 /**
// 1744  * @addtogroup RTC_Private_Functions
// 1745  * @{
// 1746  */
// 1747 /**
// 1748 * @brief  Converts a 2 digit decimal to BCD format
// 1749 * @param  Value: Byte to be converted.
// 1750 * @retval Converted byte
// 1751 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1752 static uint8_t ByteToBcd2(uint8_t Value)
// 1753 {
ByteToBcd2:
        LD        S:?b1, A
// 1754   uint8_t bcdhigh = 0;
        CLR       S:?b0
        CP        A, #0xa
        JRC       L:??ByteToBcd2_0
        LD        A, #0xa
        CLRW      X
        RRWA      X, A
        LD        A, S:?b1
        RLWA      X, A
        DIV       X, A
        EXG       A, XL
        LD        S:?b0, A
        LD        A, #0xf6
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        ADD       A, S:?b1
        LD        S:?b1, A
// 1755 
// 1756   while (Value >= 10)
// 1757   {
// 1758     bcdhigh++;
// 1759     Value -= 10;
// 1760   }
// 1761 
// 1762   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
??ByteToBcd2_0:
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b1
        RET
// 1763 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1764 
// 1765 /**
// 1766 * @brief  Converts from 2 digit BCD to Binary format
// 1767 * @param  Value: BCD value to be converted.
// 1768 * @retval Converted word
// 1769 */
// 1770 static uint8_t Bcd2ToByte(uint8_t Value)
// 1771 {
// 1772   uint8_t tmp = 0;
// 1773 
// 1774   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
// 1775 
// 1776   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
// 1777 }
// 1778 /**
// 1779  * @}
// 1780  */
// 1781 /**
// 1782  * @}
// 1783  */
// 1784 
// 1785 /**
// 1786 * @}
// 1787 */
// 1788 
// 1789 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 1790 
// 
// 2 863 bytes in section .near_func.text
// 
// 2 863 bytes of CODE memory
//
//Errors: none
//Warnings: none
