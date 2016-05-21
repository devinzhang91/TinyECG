///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:44 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_beep.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_beep.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_beep.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_beep

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b3
        EXTERN ?mul16_x_x_w0
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC BEEP_Cmd
        PUBLIC BEEP_DeInit
        PUBLIC BEEP_Init
        PUBLIC BEEP_LSClockToTIMConnectCmd
        PUBLIC BEEP_LSICalibrationConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_beep.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_beep.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the BEEP firmware functions.
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
//   22 #include "stm8l15x_beep.h"
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
//   36 /**
//   37   * @addtogroup BEEP_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Deinitializes the BEEP peripheral registers to their default
//   43   *         reset values.
//   44   * @param  None
//   45   * @retval None
//   46   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void BEEP_DeInit(void)
//   48 {
//   49   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
BEEP_DeInit:
        CLR       A
        LD        L:0x50f0, A
//   50   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
        LD        A, #0x1f
        LD        L:0x50f3, A
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Initializes the BEEP function according to the specified parameters.
//   55   * @note   The LS RC calibration must be performed before calling this function.
//   56   * @param  BEEP_Frequency Frequency selection.
//   57   *         This parameter can be one of the values of @ref BEEP_Frequency_TypeDef.
//   58   * @retval None
//   59   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
//   61 {
BEEP_Init:
        LD        S:?b0, A
//   62 
//   63   /* Check parameter */
//   64   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
//   65 
//   66   /* Set a default calibration value if no calibration is done */
//   67   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
        LD        A, #0x1f
        AND       A, L:0x50f3
        CP        A, #0x1f
        JRNE      L:??BEEP_Init_0
//   68   {
//   69     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
        LD        A, #0xe0
        AND       A, L:0x50f3
        LD        L:0x50f3, A
//   70     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
        BSET      L:0x50f3, #0x0
//   71   }
//   72 
//   73   /* Select the output frequency */
//   74   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
??BEEP_Init_0:
        LD        A, #0x3f
        AND       A, L:0x50f3
        LD        L:0x50f3, A
//   75   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
        LD        A, S:?b0
        OR        A, L:0x50f3
        LD        L:0x50f3, A
//   76 
//   77 }
        RET
//   78 
//   79 /**
//   80   * @brief  Enable or disable the BEEP function.
//   81   * @note   Initialisation of BEEP and LS RC calibration must be done before.
//   82   * @param  NewState Indicates the new state of the BEEP function.
//   83   * @retval None
//   84   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void BEEP_Cmd(FunctionalState NewState)
//   86 {
//   87   /* Check the parameters */
//   88   assert_param(IS_FUNCTIONAL_STATE(NewState));
//   89 
//   90   if (NewState != DISABLE)
BEEP_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??BEEP_Cmd_0
//   91   {
//   92     /* Enable the BEEP peripheral */
//   93     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
        BSET      L:0x50f3, #0x5
        RET
//   94   }
//   95   else
//   96   {
//   97     /* Disable the BEEP peripheral */
//   98     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
??BEEP_Cmd_0:
        BRES      L:0x50f3, #0x5
//   99   }
//  100 }
        RET
//  101 
//  102 /**
//  103   * @brief  Enable or disable the LS clock source connection to TIM for measurement.
//  104   * @param  NewState Indicates the new state of the LS clcok to TIM connection
//  105   * @retval None
//  106   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  107 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
//  108 {
//  109   /* Check the parameters */
//  110   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  111 
//  112   if (NewState != DISABLE)
BEEP_LSClockToTIMConnectCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??BEEP_LSClockToTIMConnectCmd_0
//  113   {
//  114     /* Connect LS clock to TIM for meeasurement */
//  115     BEEP->CSR1 |= BEEP_CSR1_MSR;
        BSET      L:0x50f0, #0x0
        RET
//  116   }
//  117   else
//  118   {
//  119     /* Disconnect LS clock to TIM */
//  120     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
??BEEP_LSClockToTIMConnectCmd_0:
        BRES      L:0x50f0, #0x0
//  121   }
//  122 }
        RET
//  123 /**
//  124   * @brief  Update CSR register with the measured LSI frequency.
//  125   * @note   BEEP must be disabled to avoid unwanted interrupts.
//  126   * @note   Prescaler calculation:
//  127   *         A is the integer part of LSIFreqkHz/4 and x the decimal part.
//  128   *         x <= A/(1+2A) is equivalent to A >= x(1+2A)
//  129   *         and also to 4A >= 4x(1+2A) [F1]
//  130   *         but we know that A + x = LSIFreqkHz/4 ==> 4x = LSIFreqkHz-4A
//  131   *         so [F1] can be written :
//  132   *         4A >= (LSIFreqkHz-4A)(1+2A)
//  133   * @param  LSIFreqHz Low Speed RC frequency measured by timer (in Hz).
//  134   * @retval None
//  135   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  136 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
//  137 {
//  138   uint16_t lsifreqkhz;
//  139   uint16_t A;
//  140 
//  141   /* Check parameter */
//  142   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
//  143 
//  144   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
BEEP_LSICalibrationConfig:
        LDW       X, #0x3e8
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?udiv32_l0_l0_l1
        LDW       Y, S:?w1
//  145 
//  146   /* Calculation of BEEPER calibration value */
//  147 
//  148   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
        LD        A, #0xe0
        AND       A, L:0x50f3
        LD        L:0x50f3, A
//  149 
//  150   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
        LDW       X, Y
        SRLW      X
        SRLW      X
        SRLW      X
        LDW       S:?w1, X
//  151 
//  152   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
        SLLW      X
        SLLW      X
        SLLW      X
        LDW       S:?w2, X
        LDW       X, S:?w1
        SLLW      X
        INCW      X
        LDW       S:?w0, X
        SUBW      Y, L:?w2
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, S:?w2
        CPW       X, S:?w0
        LD        A, S:?b3
        JRC       L:??BEEP_LSICalibrationConfig_0
//  153   {
//  154     BEEP->CSR2 |= (uint8_t)(A - 2U);
        ADD       A, #0xfe
        OR        A, L:0x50f3
        LD        L:0x50f3, A
        RET
//  155   }
//  156   else
//  157   {
//  158     BEEP->CSR2 |= (uint8_t)(A - 1U);
??BEEP_LSICalibrationConfig_0:
        ADD       A, #0xff
        OR        A, L:0x50f3
        LD        L:0x50f3, A
//  159   }
//  160 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  161 
//  162 /**
//  163   * @}
//  164   */
//  165 
//  166 /**
//  167   * @}
//  168   */
//  169 
//  170 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 165 bytes in section .near_func.text
// 
// 165 bytes of CODE memory
//
//Errors: none
//Warnings: none
