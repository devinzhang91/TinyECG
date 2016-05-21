///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:51 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_i2c.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_i2c.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_i2c.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_i2c

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_dbsp
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?sdiv16_x_x_y
        EXTERN ?sll32_l0_l0_db
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w6
        EXTERN ?w7
        EXTERN CLK_GetClockFreq

        PUBLIC I2C_ARPCmd
        PUBLIC I2C_AckPositionConfig
        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_CalculatePEC
        PUBLIC I2C_CheckEvent
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_Cmd
        PUBLIC I2C_DMACmd
        PUBLIC I2C_DMALastTransferCmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_DualAddressCmd
        PUBLIC I2C_FastModeDutyCycleConfig
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetLastEvent
        PUBLIC I2C_GetPEC
        PUBLIC I2C_ITConfig
        PUBLIC I2C_Init
        PUBLIC I2C_OwnAddress2Config
        PUBLIC I2C_PECPositionConfig
        PUBLIC I2C_ReadRegister
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_SMBusAlertConfig
        PUBLIC I2C_Send7bitAddress
        PUBLIC I2C_SendData
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StretchClockCmd
        PUBLIC I2C_TransmitPEC

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_i2c.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_i2c.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the I2C firmware functions.
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
//   22 #include "stm8l15x_i2c.h"
//   23 #include "stm8l15x_clk.h"
//   24 
//   25 /** @addtogroup STM8L15x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /** @defgroup I2C
//   29   * @brief I2C driver modules
//   30   * @{
//   31   */
//   32 
//   33 /** @defgroup I2C_Private_TypesDefinitions
//   34   * @{
//   35   */
//   36 
//   37 /**
//   38   * @}
//   39   */
//   40 
//   41 /** @defgroup I2C_Private_Defines
//   42   * @{
//   43   */
//   44 /* I2C register mask */
//   45 #define REGISTER_Mask               ((uint16_t)0x3000)
//   46 #define REGISTER_SR1_Index          ((uint16_t)0x0100)
//   47 #define REGISTER_SR2_Index          ((uint16_t)0x0200)
//   48 /* I2C Interrupt Enable mask */
//   49 #define ITEN_Mask                   ((uint16_t)0x0700)
//   50 /* I2C FLAG mask */
//   51 #define FLAG_Mask                   ((uint16_t)0x00FF)
//   52 /* I2C ADD0 mask */
//   53 #define OAR1_ADD0_Set           ((uint8_t)0x01)
//   54 #define OAR1_ADD0_Reset         ((uint8_t)0xFE)
//   55 /**
//   56   * @}
//   57   */
//   58 
//   59 /** @defgroup I2C_Private_Macros
//   60   * @{
//   61   */
//   62 
//   63 /**
//   64   * @}
//   65   */
//   66 
//   67 /** @defgroup I2C_Private_Variables
//   68   * @{
//   69   */
//   70 
//   71 /**
//   72   * @}
//   73   */
//   74 
//   75 /** @defgroup I2C_Private_FunctionPrototypes
//   76   * @{
//   77   */
//   78 
//   79 /**
//   80   * @}
//   81   */
//   82 
//   83 /** @defgroup I2C_Private_Function
//   84   * @{
//   85   */
//   86 
//   87 /**
//   88   * @}
//   89   */
//   90 
//   91 /**
//   92   * @addtogroup I2C_Public_Functions
//   93   * @{
//   94   */
//   95 
//   96 /**
//   97   * @brief  Deinitializes the I2C peripheral registers to their default reset values.
//   98   * @param  None
//   99   * @retval None
//  100   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  101 void I2C_DeInit(I2C_TypeDef* I2Cx)
//  102 {
//  103   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
I2C_DeInit:
        CLR       A
        LD        (X), A
//  104   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//  105   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//  106   I2Cx->OARL = I2C_OARL_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x3
        LD        (Y), A
//  107   I2Cx->OARH = I2C_OARH_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x4
        LD        (Y), A
//  108   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x5
        LD        (Y), A
//  109   I2Cx->ITR = I2C_ITR_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xa
        LD        (Y), A
//  110   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xb
        LD        (Y), A
//  111   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0xc
        LD        (Y), A
//  112   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
        ADDW      X, #0xd
        LD        A, #0x2
        LD        (X), A
//  113 }
        RET
//  114 
//  115 /**
//  116   * @brief  Initializes the I2C according to the specified parameters in standard
//  117   *         or fast mode.
//  118   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  119   * @param  OutputClockFrequency : Specifies the output clock frequency in Hz.
//  120   * @param  OwnAddress : Specifies the own address.
//  121   * @param  I2C_Mode : Specifies the addressing mode to apply.
//  122   *         This parameter can be any of the  @ref I2C_AddMode_TypeDef enumeration.
//  123   * @param  I2C_DutyCycle : Specifies the duty cycle to apply in fast mode.
//  124   *         This parameter can be any of the  @ref I2C_DutyCycle_TypeDef enumeration.
//  125   * @note   This parameter don't have impact when the OutputClockFrequency lower
//  126   *         than 100KHz.
//  127   * @param  I2C_Ack : Specifies the acknowledge mode to apply.
//  128   *         This parameter can be any of the  @ref I2C_Ack_TypeDef enumeration.
//  129   * @param  I2C_AcknowledgedAddress : Specifies the acknowledge address to apply.
//  130   *         This parameter can be any of the  @ref I2C_AcknowledgedAddress enumeration.
//  131   * @retval None
//  132   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
//  134               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
//  135               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
//  136 {
I2C_Init:
        PUSH      L:?b11
        PUSH      L:?b10
        PUSH      L:?b9
        PUSH      L:?b8
        PUSH      L:?b15
        PUSH      L:?b14
        PUSH      L:?b13
        PUSH      L:?b12
        PUSHW     Y
        PUSH      A
        PUSH      L:?b4
        PUSH      L:?b5
        PUSH      L:?b6
        SUB       SP, #0x4
        LDW       S:?w4, X
        MOV       S:?b15, S:?b3
        MOV       S:?b14, S:?b2
        MOV       S:?b13, S:?b1
        MOV       S:?b12, S:?b0
//  137   uint32_t result = 0x0004;
//  138   uint16_t tmpval = 0;
//  139   uint8_t tmpccrh = 0;
        CLR       S:?b10
//  140   uint8_t input_clock = 0;
//  141 
//  142   /* Check the parameters */
//  143   assert_param(IS_I2C_MODE(I2C_Mode));
//  144   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
//  145   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
//  146   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
//  147   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
//  148   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
//  149 
//  150 
//  151   /* Get system clock frequency */
//  152   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
        CALL      L:CLK_GetClockFreq
        LDW       X, #0x4240
        LDW       S:?w3, X
        LDW       X, #0xf
        LDW       S:?w2, X
        CALL      L:?udiv32_l0_l0_l1
        MOV       S:?b11, S:?b3
//  153 
//  154   /*------------------------- I2C FREQ Configuration ------------------------*/
//  155   /* Clear frequency bits */
//  156   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        A, #0xc0
        AND       A, (X)
        LD        (X), A
//  157   /* Write new value */
//  158   I2Cx->FREQR |= input_clock;
        LD        A, S:?b11
        OR        A, (X)
        LD        (X), A
//  159 
//  160   /*--------------------------- I2C CCR Configuration ------------------------*/
//  161   /* Disable I2C to configure TRISER */
//  162   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
        LD        A, #0xfe
        AND       A, [S:?w4.w]
        LD        [S:?w4.w], A
        LDW       X, S:?w4
        ADDW      X, #0xc
        LD        A, #0x30
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0xc
        LD        (X), A
        LDW       X, S:?w4
        ADDW      X, #0xb
        LD        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0xb
        CLR       A
        LD        (X), A
//  163 
//  164   /* Clear CCRH & CCRL */
//  165   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
//  166   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
//  167 
//  168   /* Detect Fast or Standard mode depending on the Output clock frequency selected */
//  169   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
        CLRW      X
        LD        A, S:?b11
        EXG       A, XL
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0x4240
        LDW       S:?w3, X
        LDW       X, #0xf
        LDW       S:?w2, X
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x1
        CODE
        LDW       X, S:?w6
        CPW       X, #0x1
        JRNE      L:??I2C_Init_0
        LDW       X, S:?w7
        CPW       X, #0x86a1
??I2C_Init_0:
        JRNC      ??lb_0
        JP        L:??I2C_Init_1
//  170   {
//  171     /* Set F/S bit for fast mode */
//  172     tmpccrh = I2C_CCRH_FS;
??lb_0:
        LD        A, #0x80
        LD        S:?b10, A
//  173 
//  174     if (I2C_DutyCycle == I2C_DutyCycle_2)
        CLR       A
        CP        A, (0x7,SP)
        JRNE      L:??I2C_Init_2
//  175     {
//  176       /* Fast mode speed calculate: Tlow/Thigh = 2 */
//  177       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
        LDW       X, #0x3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        MOV       S:?b7, S:?b3
        MOV       S:?b6, S:?b2
        MOV       S:?b5, S:?b1
        MOV       S:?b3, S:?b15
        MOV       S:?b2, S:?b14
        MOV       S:?b1, S:?b13
        MOV       S:?b0, S:?b12
        CALL      L:?mul32_l0_l0_l1
        MOV       S:?b7, S:?b3
        MOV       S:?b6, S:?b2
        MOV       S:?b5, S:?b1
        MOV       S:?b4, S:?b0
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x1
        CODE
        CALL      L:?udiv32_l0_l0_l1
        MOV       S:?b7, S:?b3
        MOV       S:?b6, S:?b2
        MOV       S:?b5, S:?b1
        MOV       S:?b4, S:?b0
        JRA       L:??I2C_Init_3
//  178     }
//  179     else /* I2C_DUTYCYCLE_16_9 */
//  180     {
//  181       /* Fast mode speed calculate: Tlow/Thigh = 16/9 */
//  182       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
??I2C_Init_2:
        LDW       X, #0x19
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        MOV       S:?b3, S:?b15
        MOV       S:?b2, S:?b14
        MOV       S:?b1, S:?b13
        MOV       S:?b0, S:?b12
        CALL      L:?mul32_l0_l0_l1
        MOV       S:?b7, S:?b3
        MOV       S:?b6, S:?b2
        MOV       S:?b5, S:?b1
        MOV       S:?b4, S:?b0
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x1
        CODE
        CALL      L:?udiv32_l0_l0_l1
        MOV       S:?b7, S:?b3
        MOV       S:?b6, S:?b2
        MOV       S:?b5, S:?b1
        MOV       S:?b4, S:?b0
//  183       /* Set DUTY bit */
//  184       tmpccrh |= I2C_CCRH_DUTY;
        LD        A, #0xc0
        LD        S:?b10, A
//  185     }
//  186 
//  187     /* Verify and correct CCR value if below minimum value */
//  188     if (result < (uint16_t)0x01)
??I2C_Init_3:
        LDW       X, S:?w2
        JRNE      L:??I2C_Init_4
        LDW       X, S:?w3
??I2C_Init_4:
        JRNE      L:??I2C_Init_5
//  189     {
//  190       /* Set the minimum allowed value */
//  191       result = (uint16_t)0x0001;
        CLRW      X
        INCW      X
        LDW       S:?w3, X
//  192     }
//  193 
//  194     /* Set Maximum Rise Time: 300ns max in Fast Mode
//  195     = [300ns/(1/input_clock.10e6)]+1
//  196     = [(input_clock * 3)/10]+1 */
//  197     tmpval = ((input_clock * 3) / 10) + 1;
//  198     I2Cx->TRISER = (uint8_t)tmpval;
??I2C_Init_5:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        LDW       Y, X
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, #0xa
        CALL      L:?sdiv16_x_x_y
        LD        A, XL
        ADD       A, #0x1
        LDW       X, S:?w4
        ADDW      X, #0xd
        LD        (X), A
        JRA       L:??I2C_Init_6
//  199 
//  200   }
//  201   else /* STANDARD MODE */
//  202   {
//  203 
//  204     /* Calculate standard mode speed */
//  205     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
??I2C_Init_1:
        MOV       S:?b3, S:?b15
        MOV       S:?b2, S:?b14
        MOV       S:?b1, S:?b13
        MOV       S:?b0, S:?b12
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x1
        CODE
        MOV       S:?b7, S:?b3
        MOV       S:?b6, S:?b2
        MOV       S:?b5, S:?b1
        MOV       S:?b4, S:?b0
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x1
        CODE
        CALL      L:?udiv32_l0_l0_l1
        LDW       X, S:?w1
        LDW       S:?w3, X
        CLRW      X
//  206 
//  207     /* Verify and correct CCR value if below minimum value */
//  208     if (result < (uint16_t)0x0004)
        CPW       X, #0x0
        JRNE      L:??I2C_Init_7
        LDW       X, S:?w3
        CPW       X, #0x4
??I2C_Init_7:
        JRNC      L:??I2C_Init_8
//  209     {
//  210       /* Set the minimum allowed value */
//  211       result = (uint16_t)0x0004;
        LDW       X, #0x4
        LDW       S:?w3, X
//  212     }
//  213 
//  214     /* Set Maximum Rise Time: 1000ns max in Standard Mode
//  215     = [1000ns/(1/input_clock.10e6)]+1
//  216     = input_clock+1 */
//  217     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
??I2C_Init_8:
        LD        A, S:?b11
        ADD       A, #0x1
        LDW       X, S:?w4
        ADDW      X, #0xd
        LD        (X), A
//  218 
//  219   }
//  220 
//  221   /* Write CCR with new calculated value */
//  222   I2Cx->CCRL = (uint8_t)result;
??I2C_Init_6:
        LD        A, S:?b7
        LDW       X, S:?w4
        ADDW      X, #0xb
        LD        (X), A
//  223   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
        LDW       X, S:?w4
        ADDW      X, #0xc
        LD        A, S:?b10
        LD        (X), A
//  224 
//  225   /* Enable I2C and  Cofigure its mode*/
//  226   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
        LD        A, #0x1
        OR        A, (0x8,SP)
        OR        A, [S:?w4.w]
        LD        [S:?w4.w], A
//  227 
//  228   /* Configure I2C acknowledgement */
//  229   I2Cx->CR2 |= (uint8_t)I2C_Ack;
        LDW       X, S:?w4
        INCW      X
        LD        A, (0x6,SP)
        OR        A, (X)
        LD        (X), A
//  230 
//  231   /*--------------------------- I2C OAR Configuration ------------------------*/
//  232   I2Cx->OARL = (uint8_t)(OwnAddress);
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, (0xa,SP)
        LD        (X), A
//  233   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \ 
//  234                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
        LDW       X, (0x9,SP)
        SLLW      X
        CLR       A
        RLC       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0x6
        OR        A, (0x5,SP)
        OR        A, #0x40
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//  235 }
        ADD       SP, #0xa
        POP       L:?b12
        POP       L:?b13
        POP       L:?b14
        POP       L:?b15
        POP       L:?b8
        POP       L:?b9
        POP       L:?b10
        POP       L:?b11
        RET
//  236 
//  237 /**
//  238   * @brief  Enables or disables the I2C peripheral.
//  239   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  240   * @param  NewState : Indicate the new I2C peripheral state.
//  241   *         This parameter can be any of the @ref FunctionalState enumeration.
//  242   * @retval None
//  243   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  244 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  245 {
//  246 
//  247   /* Check function parameters */
//  248   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  249 
//  250   if (NewState != DISABLE)
I2C_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_Cmd_0
//  251   {
//  252     /* Enable I2C peripheral */
//  253     I2Cx->CR1 |= I2C_CR1_PE;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  254   }
//  255   else /* NewState == DISABLE */
//  256   {
//  257     /* Disable I2C peripheral */
//  258     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
??I2C_Cmd_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  259   }
//  260 }
        RET
//  261 /**
//  262   * @brief  Enables or disables the specified I2C interrupt.
//  263   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  264   * @param  I2C_IT : Name of the interrupt to enable or disable.
//  265   *         This parameter can be any of the  @ref I2C_IT_TypeDef enumeration.
//  266   * @param  NewState : State of the interrupt.
//  267   *         This parameter can be any of the @ref FunctionalState enumeration.
//  268   * @retval None
//  269   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  270 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
//  271 {
//  272   /* Check functions parameters */
//  273   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
//  274   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  275 
//  276   if (NewState != DISABLE)
I2C_ITConfig:
        ADDW      X, #0xa
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        LD        A, YL
        JREQ      L:??I2C_ITConfig_0
//  277   {
//  278     /* Enable the selected I2C interrupts */
//  279     I2Cx->ITR |= (uint8_t)I2C_IT;
        OR        A, (X)
        LD        (X), A
        RET
//  280   }
//  281   else /* NewState == DISABLE */
//  282   {
//  283     /* Disable the selected I2C interrupts */
//  284     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
??I2C_ITConfig_0:
        CPL       A
        AND       A, (X)
        LD        (X), A
//  285   }
//  286 }
        RET
//  287 /**
//  288   * @brief  Enables or disables the I2C DMA requests .
//  289   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  290   * @param  NewState : Indicate the new I2C DMA state.
//  291   *         This parameter can be any of the @ref FunctionalState enumeration.
//  292   * @retval None
//  293   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  294 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  295 {
//  296   /* Check the parameters */
//  297   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  298 
//  299   if (NewState != DISABLE)
I2C_DMACmd:
        ADDW      X, #0xa
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_DMACmd_0
//  300   {
//  301     /* Enable I2C DMA requests */
//  302     I2Cx->ITR |= I2C_ITR_DMAEN;
        LD        A, #0x8
        OR        A, (X)
        LD        (X), A
        RET
//  303   }
//  304   else
//  305   {
//  306     /* Disable I2C DMA requests */
//  307     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
??I2C_DMACmd_0:
        LD        A, #0xf7
        AND       A, (X)
        LD        (X), A
//  308   }
//  309 }
        RET
//  310 
//  311 /**
//  312   * @brief  Specifies that the next DMA transfer is the last one .
//  313   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  314   * @param  NewState : Indicate the new I2C DMA state.
//  315   *         This parameter can be any of the @ref FunctionalState enumeration.
//  316   * @retval None
//  317   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  318 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  319 {
//  320   /* Check the parameters */
//  321   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  322 
//  323   if (NewState != DISABLE)
I2C_DMALastTransferCmd:
        ADDW      X, #0xa
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_DMALastTransferCmd_0
//  324   {
//  325     /* Enable I2C DMA requests */
//  326     I2Cx->ITR |= I2C_ITR_LAST;
        LD        A, #0x10
        OR        A, (X)
        LD        (X), A
        RET
//  327   }
//  328   else
//  329   {
//  330     /* Disable I2C DMA requests */
//  331     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
??I2C_DMALastTransferCmd_0:
        LD        A, #0xef
        AND       A, (X)
        LD        (X), A
//  332   }
//  333 }
        RET
//  334 
//  335 /**
//  336   * @brief  Enables or disables the I2C General Call feature.
//  337   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  338   * @param  NewState : State of the General Call feature.
//  339   *         This parameter can be any of the @ref FunctionalState enumeration.
//  340   * @retval None
//  341   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  342 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  343 {
//  344 
//  345   /* Check function parameters */
//  346   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  347 
//  348   if (NewState != DISABLE)
I2C_GeneralCallCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_GeneralCallCmd_0
//  349   {
//  350     /* Enable General Call */
//  351     I2Cx->CR1 |= I2C_CR1_ENGC;
        LD        A, #0x40
        OR        A, (X)
        LD        (X), A
        RET
//  352   }
//  353   else /* NewState == DISABLE */
//  354   {
//  355     /* Disable General Call */
//  356     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
??I2C_GeneralCallCmd_0:
        LD        A, #0xbf
        AND       A, (X)
        LD        (X), A
//  357   }
//  358 }
        RET
//  359 
//  360 /**
//  361   * @brief  Generates I2C communication START condition.
//  362   * @note   CCR must be programmed, i.e. I2C_Init function must have been called
//  363   *         with a valid I2C_ClockSpeed
//  364   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  365   * @param  NewState : Enable or disable the start condition.
//  366   *         This parameter can be any of the @ref FunctionalState enumeration.
//  367   * @retval None
//  368   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  369 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  370 {
//  371 
//  372   /* Check function parameters */
//  373   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  374 
//  375   if (NewState != DISABLE)
I2C_GenerateSTART:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_GenerateSTART_0
//  376   {
//  377     /* Generate a START condition */
//  378     I2Cx->CR2 |= I2C_CR2_START;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  379   }
//  380   else /* NewState == DISABLE */
//  381   {
//  382     /* Disable the START condition generation */
//  383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
??I2C_GenerateSTART_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  384   }
//  385 }
        RET
//  386 
//  387 /**
//  388   * @brief  Generates I2C communication STOP condition.
//  389   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  390   * @param  NewState : Enable or disable the stop condition.
//  391   *         This parameter can be any of the @ref FunctionalState enumeration.
//  392   * @retval None
//  393   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  394 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  395 {
//  396 
//  397   /* Check function parameters */
//  398   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  399 
//  400   if (NewState != DISABLE)
I2C_GenerateSTOP:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_GenerateSTOP_0
//  401   {
//  402     /* Generate a STOP condition */
//  403     I2Cx->CR2 |= I2C_CR2_STOP;
        LD        A, #0x2
        OR        A, (X)
        LD        (X), A
        RET
//  404   }
//  405   else /* NewState == DISABLE */
//  406   {
//  407     /* Disable the STOP condition generation */
//  408     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
??I2C_GenerateSTOP_0:
        LD        A, #0xfd
        AND       A, (X)
        LD        (X), A
//  409   }
//  410 }
        RET
//  411 
//  412 /**
//  413   * @brief  Enables or disables I2C software reset.
//  414   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  415   * @param  NewState : Specifies the new state of the I2C software reset.
//  416   *         This parameter can be any of the @ref FunctionalState enumeration.
//  417   * @retval None
//  418   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  419 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  420 {
//  421   /* Check function parameters */
//  422   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  423 
//  424   if (NewState != DISABLE)
I2C_SoftwareResetCmd:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_SoftwareResetCmd_0
//  425   {
//  426     /* Peripheral under reset */
//  427     I2Cx->CR2 |= I2C_CR2_SWRST;
        LD        A, #0x80
        OR        A, (X)
        LD        (X), A
        RET
//  428   }
//  429   else /* NewState == DISABLE */
//  430   {
//  431     /* Peripheral not under reset */
//  432     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
??I2C_SoftwareResetCmd_0:
        LD        A, #0x7f
        AND       A, (X)
        LD        (X), A
//  433   }
//  434 }
        RET
//  435 
//  436 /**
//  437   * @brief  Enables or disables the I2C clock stretching.
//  438   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  439   * @param  NewState : Specifies the new state of the I2C Clock stretching.
//  440   *         This parameter can be any of the @ref FunctionalState enumeration.
//  441   * @retval None
//  442   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  443 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  444 {
//  445   /* Check function parameters */
//  446   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  447 
//  448   if (NewState != DISABLE)
I2C_StretchClockCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_StretchClockCmd_0
//  449   {
//  450     /* Clock Stretching Enable */
//  451     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
        LD        A, #0x7f
        AND       A, (X)
        LD        (X), A
        RET
//  452 
//  453   }
//  454   else /* NewState == DISABLE */
//  455   {
//  456     /* Clock Stretching Disable (Slave mode) */
//  457     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
??I2C_StretchClockCmd_0:
        LD        A, #0x80
        OR        A, (X)
        LD        (X), A
//  458   }
//  459 }
        RET
//  460 
//  461 /**
//  462   * @brief  Enables or disables the I2C ARP.
//  463   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  464   * @param  NewState : Specifies the new state of the I2C ARP
//  465   *         This parameter can be any of the @ref FunctionalState enumeration.
//  466   * @retval None
//  467   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  468 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  469 {
//  470   /* Check function parameters */
//  471   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  472 
//  473   if (NewState != DISABLE)
I2C_ARPCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_ARPCmd_0
//  474   {
//  475     /* ARP Enable */
//  476     I2Cx->CR1 |= I2C_CR1_ARP;
        LD        A, #0x10
        OR        A, (X)
        LD        (X), A
        RET
//  477 
//  478   }
//  479   else /* NewState == DISABLE */
//  480   {
//  481     /* ARP Disable  */
//  482     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
??I2C_ARPCmd_0:
        LD        A, #0xef
        AND       A, (X)
        LD        (X), A
//  483   }
//  484 }
        RET
//  485 
//  486 /**
//  487   * @brief  Enable or Disable the I2C acknowledge feature.
//  488   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  489   * @param  NewState : Specifies the new state of the I2C acknowledge.
//  490   *         This parameter can be any of the @ref FunctionalState enumeration.
//  491   * @retval None
//  492   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  493 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  494 {
//  495   /* Check function parameters */
//  496   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  497 
//  498   if (NewState != DISABLE)
I2C_AcknowledgeConfig:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_AcknowledgeConfig_0
//  499   {
//  500     /* Enable the acknowledgement */
//  501     I2Cx->CR2 |= I2C_CR2_ACK;
        LD        A, #0x4
        OR        A, (X)
        LD        (X), A
        RET
//  502   }
//  503   else
//  504   {
//  505     /* Disable the acknowledgement */
//  506     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
??I2C_AcknowledgeConfig_0:
        LD        A, #0xfb
        AND       A, (X)
        LD        (X), A
//  507   }
//  508 }
        RET
//  509 
//  510 /**
//  511   * @brief  Configures the specified I2C own address2.
//  512   * @param  I2Cx: where x can be 1 to select the specified I2C peripheral.
//  513   * @param  Address: specifies the 7bit I2C own address2.
//  514   * @retval None.
//  515   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  516 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
//  517 {
I2C_OwnAddress2Config:
        LD        S:?b0, A
//  518   uint8_t tmpreg = 0;
//  519 
//  520   /* Get the old register value */
//  521   tmpreg = I2Cx->OAR2;
//  522 
//  523   /* Reset I2Cx Own address2 bit [7:1] */
//  524   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
//  525 
//  526   /* Set I2Cx Own address2 */
//  527   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
//  528 
//  529   /* Store the new register value */
//  530   I2Cx->OAR2 = tmpreg;
        ADDW      X, #0x5
        LD        A, #0x1
        AND       A, (X)
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0xfe
        LD        S:?b0, A
        LD        A, S:?b1
        OR        A, S:?b0
        LD        (X), A
//  531 }
        RET
//  532 
//  533 /**
//  534   * @brief  Enables or disables the specified I2C dual addressing mode.
//  535   * @param  I2Cx: where x can be 1 or 2 to select the I2C peripheral.
//  536   * @param  NewState: new state of the I2C dual addressing mode.
//  537   *         This parameter can be: ENABLE or DISABLE.
//  538   * @retval None
//  539   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  540 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  541 {
//  542   /* Check the parameters */
//  543   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  544 
//  545   if (NewState != DISABLE)
I2C_DualAddressCmd:
        ADDW      X, #0x5
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_DualAddressCmd_0
//  546   {
//  547     /* Enable dual addressing mode */
//  548     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  549   }
//  550   else
//  551   {
//  552     /* Disable dual addressing mode */
//  553     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
??I2C_DualAddressCmd_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  554   }
//  555 }
        RET
//  556 
//  557 /**
//  558   * @brief  Selects the specified I2C Ack position.
//  559   * @note   This function must be called before data reception starts.
//  560   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  561   * @param  I2C_AckPosition: specifies the Ack position.
//  562   *         This parameter can be any of the @ref I2C_AckPosition_TypeDef enumeration.
//  563   * @retval None
//  564   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  565 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
//  566 {
I2C_AckPositionConfig:
        LD        S:?b0, A
//  567   /* Check function parameters */
//  568   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
//  569 
//  570   /* Clear the I2C Ack position */
//  571   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
        INCW      X
        LD        A, #0xf7
        AND       A, (X)
        LD        (X), A
//  572   /* Configure the specified I2C Ack position*/
//  573   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  574 }
        RET
//  575 
//  576 /**
//  577   * @brief  Selects I2C PEC position..
//  578   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  579   * @param  I2C_PECPosition :PEC position.
//  580   *         This parameter can be any of the  @ref I2C_PECPosition_TypeDef
//  581   *         enumeration.
//  582   * @retval None
//  583   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  584 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
//  585 {
I2C_PECPositionConfig:
        LD        S:?b0, A
//  586   /* Check the parameters */
//  587   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
//  588 
//  589   /* Clear the I2C PEC position */
//  590   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
        INCW      X
        LD        A, #0xf7
        AND       A, (X)
        LD        (X), A
//  591   /* Configure the specified I2C PEC position*/
//  592   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  593 }
        RET
//  594 /**
//  595   * @brief  Drives the SMBusAlert pin high or low.
//  596   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  597   * @param  I2C_SMBusAlert : SMBusAlert pin state.
//  598   *         This parameter can be any of the  @ref I2C_SMBusAlert_TypeDef
//  599   *         enumeration.
//  600   * @retval None
//  601   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  602 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
//  603 {
//  604 
//  605   /* Check functions parameters */
//  606   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
//  607 
//  608   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
I2C_SMBusAlertConfig:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_SMBusAlertConfig_0
//  609   {
//  610     /* SMBus Alert pin low */
//  611     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
        LD        A, #0x20
        OR        A, (X)
        LD        (X), A
        RET
//  612   }
//  613   else /*I2C_SMBusAlert = I2C_SMBusAlert_High */
//  614   {
//  615     /* SMBus Alert pin high */
//  616     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
??I2C_SMBusAlertConfig_0:
        LD        A, #0xdf
        AND       A, (X)
        LD        (X), A
//  617   }
//  618 }
        RET
//  619 
//  620 /**
//  621   * @brief  Enables or disables PEC transfer.
//  622   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  623   * @param  NewState : indicates the PEC  transfer state.
//  624   *         This parameter can be any of the @ref FunctionalState enumeration.
//  625   * @retval None
//  626   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  627 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  628 {
//  629   /* Check the parameters */
//  630   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  631 
//  632   if (NewState != DISABLE)
I2C_TransmitPEC:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_TransmitPEC_0
//  633   {
//  634     /* Enable the PEC transmission */
//  635     I2Cx->CR2 |= I2C_CR2_PEC;
        LD        A, #0x10
        OR        A, (X)
        LD        (X), A
        RET
//  636   }
//  637   else
//  638   {
//  639     /* Disable the PEC transmission */
//  640     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
??I2C_TransmitPEC_0:
        LD        A, #0xef
        AND       A, (X)
        LD        (X), A
//  641   }
//  642 }
        RET
//  643 
//  644 /**
//  645   * @brief  Enables or disables PEC calculation.
//  646   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  647   * @param  NewState : indicates the PEC  calculation state.
//  648   *         This parameter can be any of the @ref FunctionalState enumeration.
//  649   * @retval None
//  650   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  651 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
//  652 {
//  653   /* Check the parameters */
//  654   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  655 
//  656   if (NewState != DISABLE)
I2C_CalculatePEC:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??I2C_CalculatePEC_0
//  657   {
//  658     /* Enable PEC calculation */
//  659     I2Cx->CR1 |= I2C_CR1_ENPEC;
        LD        A, #0x20
        OR        A, (X)
        LD        (X), A
        RET
//  660   }
//  661   else
//  662   {
//  663     /* Disable PEC calculation */
//  664     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
??I2C_CalculatePEC_0:
        LD        A, #0xdf
        AND       A, (X)
        LD        (X), A
//  665   }
//  666 }
        RET
//  667 
//  668 /**
//  669   * @brief  Selects I2C fast mode duty cycle.
//  670   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  671   * @param  I2C_DutyCycle : Specifies the duty cycle to apply.
//  672   *         This parameter can be any of the @ref I2C_DutyCycle_TypeDef
//  673   *         enumeration.
//  674   * @retval None
//  675   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  676 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
//  677 {
//  678 
//  679   /* Check function parameters */
//  680   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
//  681 
//  682   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
I2C_FastModeDutyCycleConfig:
        ADDW      X, #0xc
        CP        A, #0x40
        JRNE      L:??I2C_FastModeDutyCycleConfig_0
//  683   {
//  684     /* I2C fast mode Tlow/Thigh = 16/9 */
//  685     I2Cx->CCRH |= I2C_CCRH_DUTY;
        LD        A, #0x40
        OR        A, (X)
        LD        (X), A
        RET
//  686   }
//  687   else /* I2C_DUTYCYCLE_2 */
//  688   {
//  689     /* I2C fast mode Tlow/Thigh = 2 */
//  690     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
??I2C_FastModeDutyCycleConfig_0:
        LD        A, #0xbf
        AND       A, (X)
        LD        (X), A
//  691   }
//  692 }
        RET
//  693 
//  694 /**
//  695   * @brief  Returns the most recent received data.
//  696   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  697   * @param  None
//  698   * @retval The value of the received byte data.
//  699   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  700 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
//  701 {
//  702   /* Return the data present in the DR register */
//  703   return ((uint8_t)I2Cx->DR);
I2C_ReceiveData:
        ADDW      X, #0x6
        LD        A, (X)
        RET
//  704 }
//  705 
//  706 /**
//  707   * @brief  Transmits the 7-bit address (to select the) slave device.
//  708   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  709   * @param  Address : Specifies the slave address which will be transmitted.
//  710   * @param  I2C_Direction : Specifies whether the I2C device will be a Transmitter
//  711   *         or a Receiver.
//  712   *         This parameter can be any of the @ref I2C_Direction_TypeDef enumeration.
//  713   * @retval None
//  714   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  715 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
//  716 {
I2C_Send7bitAddress:
        LD        S:?b1, A
//  717   /* Check function parameters */
//  718   assert_param(IS_I2C_ADDRESS(Address));
//  719   assert_param(IS_I2C_DIRECTION(I2C_Direction));
//  720 
//  721   /* Test on the direction to set/reset the read/write bit */
//  722   if (I2C_Direction != I2C_Direction_Transmitter)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??I2C_Send7bitAddress_0
//  723   {
//  724     /* Set the address bit0 for read */
//  725     Address |= OAR1_ADD0_Set;
        LD        A, S:?b1
        OR        A, #0x1
        JRA       L:??I2C_Send7bitAddress_1
//  726   }
//  727   else
//  728   {
//  729     /* Reset the address bit0 for write */
//  730     Address &= OAR1_ADD0_Reset;
??I2C_Send7bitAddress_0:
        LD        A, S:?b1
        AND       A, #0xfe
//  731   }
//  732   /* Send the address */
//  733   I2Cx->DR = Address;
??I2C_Send7bitAddress_1:
        ADDW      X, #0x6
        LD        (X), A
//  734 }
        RET
//  735 
//  736 /**
//  737   * @brief  Send a byte by writing in the DR register.
//  738   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  739   * @param  Data : Byte to be sent.
//  740   * @retval None
//  741   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  742 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
//  743 {
//  744   /* Write in the DR register the data to be sent */
//  745   I2Cx->DR = Data;
I2C_SendData:
        ADDW      X, #0x6
        LD        (X), A
//  746 }
        RET
//  747 
//  748 /**
//  749   * @brief  Returns PEC value.
//  750   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  751   * @param  None
//  752   * @retval The value of the PEC.
//  753   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  754 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
//  755 {
//  756   /* Return the PEC value */
//  757   return (I2Cx->PECR);
I2C_GetPEC:
        ADDW      X, #0xe
        LD        A, (X)
        RET
//  758 }
//  759 
//  760 /**
//  761   * @brief  Reads the specified I2C register and returns its value.
//  762   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  763   * @param  I2C_Register: specifies the register to read.
//  764   *         This parameter can be any of the @ref I2C_Register_TypeDef enumeration.
//  765   * @retval The value of the read register.
//  766   */
//  767 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  768 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
//  769 {
I2C_ReadRegister:
        SUB       SP, #0x2
//  770   __IO uint16_t tmp = 0;
        CLRW      Y
        LDW       (0x1,SP), Y
//  771   /* Check the parameters */
//  772   assert_param(IS_I2C_REGISTER(I2C_Register));
//  773 
//  774   tmp = (uint16_t) I2Cx;
        LDW       (0x1,SP), X
//  775   tmp += I2C_Register;
        CLRW      X
        LD        XL, A
        ADDW      X, (0x1,SP)
        LDW       (0x1,SP), X
//  776 
//  777   /* Return the selected register value */
//  778   return (*(__IO uint8_t *) tmp);
        LDW       X, (0x1,SP)
        LD        A, (X)
        ADD       SP, #0x2
        RET
//  779 }
//  780 /**
//  781  * @brief
//  782  ****************************************************************************************
//  783  *
//  784  *                         I2C State Monitoring Functions
//  785  *
//  786  ****************************************************************************************
//  787  * This I2C driver provides three different ways for I2C state monitoring
//  788  *  depending on the application requirements and constraints:
//  789  *
//  790  *
//  791  * 1) Basic state monitoring:
//  792  *    Using I2C_CheckEvent() function:
//  793  *    It compares the status registers (SR1, SR2 and SR3) content to a given event
//  794  *    (can be the combination of one or more flags).
//  795  *    It returns SUCCESS if the current status includes the given flags
//  796  *    and returns ERROR if one or more flags are missing in the current status.
//  797  *    - When to use:
//  798  *      - This function is suitable for most applications as well as for startup
//  799  *      activity since the events are fully described in the product reference manual
//  800  *      (RM0031).
//  801  *      - It is also suitable for users who need to define their own events.
//  802  *    - Limitations:
//  803  *      - If an error occurs (ie. error flags are set besides to the monitored flags),
//  804  *        the I2C_CheckEvent() function may return SUCCESS despite the communication
//  805  *        hold or corrupted real state.
//  806  *        In this case, it is advised to use error interrupts to monitor the error
//  807  *        events and handle them in the interrupt IRQ handler.
//  808  *
//  809  *        @note
//  810  *        For error management, it is advised to use the following functions:
//  811  *          - I2C_ITConfig() to configure and enable the error interrupts (I2C_IT_ERR).
//  812  *          - I2Cx_IRQHandler() which is called when the I2C interurpts occur.
//  813  *            Where x is the peripheral instance (I2C1,...)
//  814  *          - I2C_GetFlagStatus() or I2C_GetITStatus() to be called into the
//  815  *           I2Cx_IRQHandler() function in order to determine which error occured.
//  816  *          - I2C_ClearFlag() or I2C_ClearITPendingBit() and/or I2C_SoftwareResetCmd()
//  817  *            and/or I2C_GenerateStop() in order to clear the error flag and
//  818  *            source and return to correct communication status.
//  819  *
//  820  *
//  821  *  2) Advanced state monitoring:
//  822  *     Using the function I2C_GetLastEvent() which returns the image of both SR1
//  823  *     & SR3 status registers in a single word (uint16_t) (Status Register 3 value
//  824  *     is shifted left by 8 bits and concatenated to Status Register 1).
//  825  *     - When to use:
//  826  *       - This function is suitable for the same applications above but it allows to
//  827  *         overcome the limitations of I2C_GetFlagStatus() function (see below).
//  828  *         The returned value could be compared to events already defined in the
//  829  *         library (stm8l15x_i2c.h) or to custom values defined by user.
//  830  *       - This function is suitable when multiple flags are monitored at the same time.
//  831  *       - At the opposite of I2C_CheckEvent() function, this function allows user to
//  832  *         choose when an event is accepted (when all events flags are set and no
//  833  *         other flags are set or just when the needed flags are set like
//  834  *         I2C_CheckEvent() function).
//  835  *     - Limitations:
//  836  *       - User may need to define his own events.
//  837  *       - Same remark concerning the error management is applicable for this
//  838  *         function if user decides to check only regular communication flags (and
//  839  *         ignores error flags).
//  840  *
//  841  *
//  842  *  3) Flag-based state monitoring:
//  843  *     Using the function I2C_GetFlagStatus() which simply returns the status of
//  844  *     one single flag (ie. I2C_FLAG_RXNE ...).
//  845  *     - When to use:
//  846  *        - This function could be used for specific applications or in debug phase.
//  847  *        - It is suitable when only one flag checking is needed (most I2C events
//  848  *          are monitored through multiple flags).
//  849  *     - Limitations:
//  850  *        - When calling this function, the Status register is accessed. Some flags are
//  851  *          cleared when the status register is accessed. So checking the status
//  852  *          of one Flag, may clear other ones.
//  853  *        - Function may need to be called twice or more in order to monitor one
//  854  *          single event.
//  855  *
//  856  *  For detailed description of Events, please refer to section I2C_Events in
//  857  *  stm8l15x_i2c.h file.
//  858  *
//  859  */
//  860 /**
//  861  *
//  862  *  1) Basic state monitoring
//  863  *******************************************************************************
//  864  */
//  865 
//  866 /**
//  867   * @brief  Checks whether the last I2Cx Event is equal to the one passed
//  868   *   as parameter.
//  869   * @param  I2Cx: where x can be 1 to select the I2C peripheral.
//  870   * @param  I2C_EVENT: specifies the event to be checked.
//  871   *   This parameter can be one of the following values:
//  872   *     @arg I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED           : EV1
//  873   *     @arg I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED              : EV1
//  874   *     @arg I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED            : EV1
//  875   *     @arg I2C_EVENT_SLAVE_BYTE_RECEIVED                         : EV2
//  876   *     @arg (I2C_EVENT_SLAVE_BYTE_RECEIVED | I2C_FLAG_GENCALL)    : EV2
//  877   *     @arg I2C_EVENT_SLAVE_BYTE_TRANSMITTED                      : EV3
//  878   *     @arg (I2C_EVENT_SLAVE_BYTE_TRANSMITTED | I2C_FLAG_GENCALL) : EV3
//  879   *     @arg I2C_EVENT_SLAVE_ACK_FAILURE                           : EV3_2
//  880   *     @arg I2C_EVENT_SLAVE_STOP_DETECTED                         : EV4
//  881   *     @arg I2C_EVENT_MASTER_MODE_SELECT                          : EV5
//  882   *     @arg I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED            : EV6
//  883   *     @arg I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED               : EV6
//  884   *     @arg I2C_EVENT_MASTER_BYTE_RECEIVED                        : EV7
//  885   *     @arg I2C_EVENT_MASTER_BYTE_TRANSMITTING                    : EV8
//  886   *     @arg I2C_EVENT_MASTER_BYTE_TRANSMITTED                     : EV8_2
//  887   *     @arg I2C_EVENT_MASTER_MODE_ADDRESS10                       : EV9
//  888   *
//  889   * @note: For detailed description of Events, please refer to section
//  890   *    I2C_Events in stm8l15x_i2c.h file.
//  891   *
//  892   * @retval An ErrorStatus enumuration value:
//  893   * - SUCCESS: Last event is equal to the I2C_EVENT
//  894   * - ERROR: Last event is different from the I2C_EVENT
//  895   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  896 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
//  897 {
I2C_CheckEvent:
        SUB       SP, #0x2
        LDW       S:?w1, Y
//  898   __IO uint16_t lastevent = 0x00;
        CLRW      Y
        LDW       (0x1,SP), Y
//  899   uint8_t flag1 = 0x00 ;
//  900   uint8_t flag2 = 0x00;
//  901   ErrorStatus status = ERROR;
//  902 
//  903   /* Check the parameters */
//  904   assert_param(IS_I2C_EVENT(I2C_Event));
//  905 
//  906   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
        LDW       Y, S:?w1
        CPW       Y, #0x4
        JRNE      L:??I2C_CheckEvent_0
//  907   {
//  908     lastevent = I2Cx->SR2 & I2C_SR2_AF;
        ADDW      X, #0x8
        LD        A, (X)
        CLRW      X
        LD        XL, A
        RRWA      X, A
        AND       A, #0x4
        RLWA      X, A
        LDW       (0x1,SP), X
        JRA       L:??I2C_CheckEvent_1
//  909   }
//  910   else
//  911   {
//  912     flag1 = I2Cx->SR1;
??I2C_CheckEvent_0:
        LDW       Y, X
        ADDW      Y, #0x7
        LD        A, (Y)
        LD        S:?b0, A
//  913     flag2 = I2Cx->SR3;
        ADDW      X, #0x9
        LD        A, (X)
//  914     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
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
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        LDW       (0x1,SP), X
//  915   }
//  916   /* Check whether the last event is equal to I2C_EVENT */
//  917   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
??I2C_CheckEvent_1:
        LDW       X, (0x1,SP)
        RRWA      X, A
        AND       A, S:?b3
        RRWA      X, A
        AND       A, S:?b2
        RRWA      X, A
        CPW       X, S:?w1
        JRNE      L:??I2C_CheckEvent_2
//  918   {
//  919     /* SUCCESS: last event is equal to I2C_EVENT */
//  920     status = SUCCESS;
        LD        A, #0x1
        JRA       L:??I2C_CheckEvent_3
//  921   }
//  922   else
//  923   {
//  924     /* ERROR: last event is different from I2C_EVENT */
//  925     status = ERROR;
??I2C_CheckEvent_2:
        CLR       A
//  926   }
//  927 
//  928   /* Return status */
//  929   return status;
??I2C_CheckEvent_3:
        ADD       SP, #0x2
        RET
//  930 }
//  931 
//  932 /**
//  933  *
//  934  *  2) Advanced state monitoring
//  935  *******************************************************************************
//  936  */
//  937 /**
//  938   * @brief  Returns the last I2C Event.
//  939   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
//  940   *
//  941   * @note: For detailed description of Events, please refer to section
//  942   *    I2C_Events in stm8l15xx_i2c.h file.
//  943   *
//  944   * @retval The last event
//  945   *   This parameter can be any of the  @ref I2C_Event_TypeDef enumeration.
//  946   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  947 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
//  948 {
I2C_GetLastEvent:
        SUB       SP, #0x2
//  949   __IO uint16_t lastevent = 0;
        CLRW      Y
        LDW       (0x1,SP), Y
//  950   uint16_t flag1 = 0;
//  951   uint16_t flag2 = 0;
//  952 
//  953   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, #0x4
        AND       A, (Y)
        JREQ      L:??I2C_GetLastEvent_0
//  954   {
//  955     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
        LDW       X, #0x4
        LDW       (0x1,SP), X
        JRA       L:??I2C_GetLastEvent_1
//  956   }
//  957   else
//  958   {
//  959     /* Read the I2C status register */
//  960     flag1 = I2Cx->SR1;
??I2C_GetLastEvent_0:
        LDW       Y, X
        ADDW      Y, #0x7
        LD        A, (Y)
        LD        S:?b0, A
//  961     flag2 = I2Cx->SR3;
        ADDW      X, #0x9
        LD        A, (X)
//  962 
//  963     /* Get the last event value from I2C status register */
//  964     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
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
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        EXG       A, YL
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        LDW       (0x1,SP), X
//  965   }
//  966   /* Return status */
//  967   return (I2C_Event_TypeDef)lastevent;
??I2C_GetLastEvent_1:
        LDW       X, (0x1,SP)
        ADD       SP, #0x2
        RET
//  968 }
//  969 
//  970 /**
//  971  *
//  972  *  3) Flag-based state monitoring
//  973  *******************************************************************************
//  974  */
//  975 /**
//  976   * @brief  Checks whether the specified I2C flag is set or not.
//  977   * @param  I2Cx: where x can be 1 select the I2C peripheral.
//  978   * @param  I2C_FLAG: specifies the flag to check.
//  979   *   This parameter can be one of the following values:
//  980   *     @arg I2C_FLAG_SMBHOST: SMBus host header (Slave mode)
//  981   *     @arg I2C_FLAG_SMBDEFAULT: SMBus default header (Slave mode)
//  982   *     @arg I2C_FLAG_GENCALL: General call header flag (Slave mode)
//  983   *     @arg I2C_FLAG_TRA: Transmitter/Receiver flag
//  984   *     @arg I2C_FLAG_BUSY: Bus busy flag
//  985   *     @arg I2C_FLAG_MSL: Master/Slave flag
//  986   *     @arg I2C_FLAG_SMBALERT: SMBus Alert flag
//  987   *     @arg I2C_FLAG_TIMEOUT: Timeout or Tlow error flag
//  988   *     @arg I2C_FLAG_PECERR: PEC error in reception flag
//  989   *     @arg I2C_FLAG_OVR: Overrun/Underrun flag (Slave mode)
//  990   *     @arg I2C_FLAG_AF: Acknowledge failure flag
//  991   *     @arg I2C_FLAG_ARLO: Arbitration lost flag (Master mode)
//  992   *     @arg I2C_FLAG_BERR: Bus error flag
//  993   *     @arg I2C_FLAG_TXE: Data register empty flag (Transmitter)
//  994   *     @arg I2C_FLAG_RXNE: Data register not empty (Receiver) flag
//  995   *     @arg I2C_FLAG_STOPF: Stop detection flag (Slave mode)
//  996   *     @arg I2C_FLAG_ADD10: 10-bit header sent flag (Master mode)
//  997   *     @arg I2C_FLAG_BTF: Byte transfer finished flag
//  998   *     @arg I2C_FLAG_ADDR: Address sent flag (Master mode) “ADSL”
//  999   *   Address matched flag (Slave mode)”ENDAD”
// 1000   *     @arg I2C_FLAG_SB: Start bit flag (Master mode)
// 1001   * @retval The new state of I2C_FLAG (SET or RESET).
// 1002   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1003 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
// 1004 {
I2C_GetFlagStatus:
        LDW       S:?w0, X
// 1005   uint8_t tempreg = 0;
        CLR       S:?b2
// 1006   uint8_t regindex = 0;
// 1007   FlagStatus bitstatus = RESET;
// 1008 
// 1009   /* Check the parameters */
// 1010   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
// 1011 
// 1012   /* Read flag register index */
// 1013   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
// 1014   /* Check SRx index */
// 1015   switch (regindex)
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
        CP        A, #0x1
        JREQ      L:??I2C_GetFlagStatus_0
        CP        A, #0x2
        JREQ      L:??I2C_GetFlagStatus_1
        CP        A, #0x3
        JREQ      L:??I2C_GetFlagStatus_2
        JRA       L:??I2C_GetFlagStatus_3
// 1016   {
// 1017       /* Returns whether the status register to check is SR1 */
// 1018     case 0x01:
// 1019       tempreg = (uint8_t)I2Cx->SR1;
??I2C_GetFlagStatus_0:
        LDW       X, S:?w0
        ADDW      X, #0x7
        LD        A, (X)
        LD        S:?b2, A
// 1020       break;
        JRA       L:??I2C_GetFlagStatus_3
// 1021 
// 1022       /* Returns whether the status register to check is SR2 */
// 1023     case 0x02:
// 1024       tempreg = (uint8_t)I2Cx->SR2;
??I2C_GetFlagStatus_1:
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, (X)
        LD        S:?b2, A
// 1025       break;
        JRA       L:??I2C_GetFlagStatus_3
// 1026 
// 1027       /* Returns whether the status register to check is SR3 */
// 1028     case 0x03:
// 1029       tempreg = (uint8_t)I2Cx->SR3;
??I2C_GetFlagStatus_2:
        LDW       X, S:?w0
        ADDW      X, #0x9
        LD        A, (X)
        LD        S:?b2, A
// 1030       break;
// 1031 
// 1032     default:
// 1033       break;
// 1034   }
// 1035 
// 1036   /* Check the status of the specified I2C flag */
// 1037   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
??I2C_GetFlagStatus_3:
        LD        A, YL
        AND       A, S:?b2
        JREQ      L:??I2C_GetFlagStatus_4
// 1038   {
// 1039     /* Flag is set */
// 1040     bitstatus = SET;
        LD        A, #0x1
        RET
// 1041   }
// 1042   else
// 1043   {
// 1044     /* Flag is reset */
// 1045     bitstatus = RESET;
??I2C_GetFlagStatus_4:
        CLR       A
// 1046   }
// 1047   /* Return the flag status */
// 1048   return bitstatus;
        RET
// 1049 }
// 1050 /**
// 1051   * @brief  Clear flags
// 1052   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
// 1053   * @param  I2C_Flag : Specifies the flag to clear
// 1054   *   This parameter can be any combination of the following values:
// 1055   *                       - I2C_FLAG_SMBALERT: SMBus Alert flag
// 1056   *                       - I2C_FLAG_TIMEOUT: Timeout or Tlow error flag
// 1057   *                       - I2C_FLAG_PECERR: PEC error in reception flag
// 1058   *                       - I2C_FLAG_WUFH: Wakeup from Halt
// 1059   *                       - I2C_FLAG_OVR: Overrun/Underrun flag (Slave mode)
// 1060   *                       - I2C_FLAG_AF: Acknowledge failure flag
// 1061   *                       - I2C_FLAG_ARLO: Arbitration lost flag (Master mode)
// 1062   *                       - I2C_FLAG_BERR: Bus error flag.
// 1063   * @note Notes:
// 1064   *                       - STOPF (STOP detection) is cleared by software
// 1065   *                         sequence: a read operation to I2C_SR1 register
// 1066   *                         (I2C_GetFlagStatus()) followed by a write operation
// 1067   *                         to I2C_CR2 register.
// 1068   *                       - ADD10 (10-bit header sent) is cleared by software
// 1069   *                         sequence: a read operation to I2C_SR1
// 1070   *                         (I2C_GetFlagStatus()) followed by writing the
// 1071   *                         second byte of the address in DR register.
// 1072   *                       - BTF (Byte Transfer Finished) is cleared by software
// 1073   *                         sequence: a read operation to I2C_SR1 register
// 1074   *                         (I2C_GetFlagStatus()) followed by a read/write to
// 1075   *                         I2C_DR register (I2C_SendData()).
// 1076   *                       - ADDR (Address sent) is cleared by software sequence:
// 1077   *                         a read operation to I2C_SR1 register
// 1078   *                         (I2C_GetFlagStatus()) followed by a read operation to
// 1079   *                         I2C_SR3 register ((void)(I2Cx->SR3)).
// 1080   *                       - SB (Start Bit) is cleared software sequence: a read
// 1081   *                         operation to I2C_SR1 register (I2C_GetFlagStatus())
// 1082   *                         followed by a write operation to I2C_DR reigister
// 1083   *                         (I2C_SendData()).
// 1084   * @retval None
// 1085   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1086 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
// 1087 {
// 1088   uint16_t flagpos = 0;
// 1089   /* Check the parameters */
// 1090   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
// 1091 
// 1092   /* Get the I2C flag position */
// 1093   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
// 1094   /* Clear the selected I2C flag */
// 1095   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
I2C_ClearFlag:
        LD        A, YL
        CPL       A
        ADDW      X, #0x8
        LD        (X), A
// 1096 }
        RET
// 1097 
// 1098 /**
// 1099   * @brief  Checks whether the specified I2C interrupt has occurred or not.
// 1100   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
// 1101   * @param  I2C_IT: specifies the interrupt source to check.
// 1102   *            This parameter can be one of the following values:
// 1103   *               - I2C_IT_SMBALERT: SMBus Alert interrupt
// 1104   *               - I2C_IT_TIMEOUT: Timeout or Tlow error interrupt
// 1105   *               - I2C_IT_PECERR: PEC error in reception  interrupt
// 1106   *               - I2C_IT_WUFH: Wakeup from Halt
// 1107   *               - I2C_IT_OVR: Overrun/Underrun flag (Slave mode)
// 1108   *               - I2C_IT_AF: Acknowledge failure flag
// 1109   *               - I2C_IT_ARLO: Arbitration lost flag (Master mode)
// 1110   *               - I2C_IT_BERR: Bus error flag
// 1111   *               - I2C_IT_TXE: Data register empty flag (Transmitter)
// 1112   *               - I2C_IT_RXNE: Data register not empty (Receiver) flag
// 1113   *               - I2C_IT_STOPF: Stop detection flag (Slave mode)
// 1114   *               - I2C_IT_ADD10: 10-bit header sent flag (Master mode)
// 1115   *               - I2C_IT_BTF: Byte transfer finished flag
// 1116   *               - I2C_IT_ADDR: Address sent flag (Master mode) “ADSL”
// 1117   *                              Address matched flag (Slave mode)“ENDAD”
// 1118   *               - I2C_IT_SB: Start bit flag (Master mode)
// 1119   * @retval The new state of I2C_IT
// 1120   *   This parameter can be any of the @ref ITStatus enumeration.
// 1121   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1122 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
// 1123 {
I2C_GetITStatus:
        SUB       SP, #0x1
        LDW       S:?w0, X
// 1124   ITStatus bitstatus = RESET;
// 1125   __IO uint8_t enablestatus = 0;
        CLR       A
        LD        (0x1,SP), A
// 1126   uint16_t tempregister = 0;
// 1127 
// 1128   /* Check the parameters */
// 1129   assert_param(IS_I2C_GET_IT(I2C_IT));
// 1130 
// 1131   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
// 1132 
// 1133   /* Check if the interrupt source is enabled or not */
// 1134   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
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
        ADDW      X, #0xa
        AND       A, (X)
        AND       A, #0x7
        LD        (0x1,SP), A
// 1135 
// 1136   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
// 1137   {
// 1138     /* Check the status of the specified I2C flag */
// 1139     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
// 1140     {
// 1141       /* I2C_IT is set */
// 1142       bitstatus = SET;
// 1143     }
// 1144     else
// 1145     {
// 1146       /* I2C_IT is reset */
// 1147       bitstatus = RESET;
// 1148     }
// 1149   }
// 1150   else
// 1151   {
// 1152     /* Check the status of the specified I2C flag */
// 1153     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, YL
        AND       A, (X)
        JREQ      L:??I2C_GetITStatus_0
        CLR       A
        CP        A, (0x1,SP)
        JREQ      L:??I2C_GetITStatus_0
// 1154     {
// 1155       /* I2C_IT is set */
// 1156       bitstatus = SET;
        LD        A, #0x1
        JRA       L:??I2C_GetITStatus_1
// 1157     }
// 1158     else
// 1159     {
// 1160       /* I2C_IT is reset */
// 1161       bitstatus = RESET;
??I2C_GetITStatus_0:
        CLR       A
// 1162     }
// 1163   }
// 1164   /* Return the I2C_IT status */
// 1165   return  bitstatus;
??I2C_GetITStatus_1:
        ADD       SP, #0x1
        RET
// 1166 }
// 1167 /**
// 1168   * @brief  Clear IT pending bit
// 1169   * @param  I2Cx : where x can be 1 to select the specified I2C peripheral.
// 1170   * @param  I2C_IT: specifies the interrupt pending bit to clear.
// 1171   *            This parameter can be any combination of the following values:
// 1172   *                 - I2C_IT_SMBALERT: SMBus Alert interrupt
// 1173   *                 - I2C_IT_TIMEOUT: Timeout or Tlow error interrupt
// 1174   *                 - I2C_IT_PECERR: PEC error in reception  interrupt
// 1175   *                 - I2C_IT_WUFH: Wakeup from Halt
// 1176   *                 - I2C_IT_OVR: Overrun/Underrun interrupt (Slave mode)
// 1177   *                 - I2C_IT_AF: Acknowledge failure interrupt
// 1178   *                 - I2C_IT_ARLO: Arbitration lost interrupt (Master mode)
// 1179   *                 - I2C_IT_BERR: Bus error interrupt
// 1180   *
// 1181   *             Notes:
// 1182   *                  - STOPF (STOP detection) is cleared by software
// 1183   *                    sequence: a read operation to I2C_SR1 register
// 1184   *                    (I2C_GetITStatus()) followed by a write operation to
// 1185   *                    I2C_CR2 register (I2C_AcknowledgeConfig() to configure
// 1186   *                    the I2C peripheral Acknowledge).
// 1187   *                  - ADD10 (10-bit header sent) is cleared by software
// 1188   *                    sequence: a read operation to I2C_SR1
// 1189   *                    (I2C_GetITStatus()) followed by writing the second
// 1190   *                    byte of the address in I2C_DR register.
// 1191   *                  - BTF (Byte Transfer Finished) is cleared by software
// 1192   *                    sequence: a read operation to I2C_SR1 register
// 1193   *                    (I2C_GetITStatus()) followed by a read/write to
// 1194   *                    I2C_DR register (I2C_SendData()).
// 1195   *                  - ADDR (Address sent) is cleared by software sequence:
// 1196   *                    a read operation to I2C_SR1 register (I2C_GetITStatus())
// 1197   *                    followed by a read operation to I2C_SR3 register
// 1198   *                    ((void)(I2Cx->SR3)).
// 1199   *                  - SB (Start Bit) is cleared by software sequence: a
// 1200   *                    read operation to I2C_SR1 register (I2C_GetITStatus())
// 1201   *                    followed by a write operation to I2C_DR reigister
// 1202   *                    (I2C_SendData()).
// 1203   * @retval None
// 1204   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1205 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
// 1206 {
// 1207   uint16_t flagpos = 0;
// 1208 
// 1209   /* Check the parameters */
// 1210   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
// 1211 
// 1212   /* Get the I2C flag position */
// 1213   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
// 1214 
// 1215   /* Clear the selected I2C flag */
// 1216   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
I2C_ClearITPendingBit:
        LD        A, YL
        CPL       A
        ADDW      X, #0x8
        LD        (X), A
// 1217 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1218 /**
// 1219   * @}
// 1220   */
// 1221 
// 1222 /**
// 1223   * @}
// 1224   */
// 1225 
// 1226 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 1 300 bytes in section .near_func.text
// 
// 1 300 bytes of CODE memory
//
//Errors: none
//Warnings: none
