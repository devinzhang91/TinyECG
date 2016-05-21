///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:53 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_usart.c      /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_usart.c -e   /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_usart.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_usart

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
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN CLK_GetClockFreq

        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_Cmd
        PUBLIC USART_DMACmd
        PUBLIC USART_DeInit
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_ReceiveData8
        PUBLIC USART_ReceiveData9
        PUBLIC USART_ReceiverWakeUpCmd
        PUBLIC USART_SendBreak
        PUBLIC USART_SendData8
        PUBLIC USART_SendData9
        PUBLIC USART_SetAddress
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_WakeUpConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_usart.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8l15x_usart.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the USART firmware functions.
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
//   22 #include "stm8l15x_usart.h"
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
//   36 /** @}
//   37   * @addtogroup USART_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief   Deinitializes the USART peripheral.
//   43   * @param  USARTx : where x can be 1, 2 or 3 to select the specified USART peripheral.
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void USART_DeInit(USART_TypeDef* USARTx)
//   47 {
//   48 
//   49   /* Clear the Idle Line Detected bit in the status rerister by a read
//   50       to the USART_SR register followed by a Read to the USART_DR register */
//   51   (void) USARTx->SR;
USART_DeInit:
        LD        A, (X)
//   52   (void) USARTx->DR;
        LDW       Y, X
        INCW      Y
        LD        A, (Y)
//   53 
//   54   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
        LDW       Y, X
        ADDW      Y, #0x3
        CLR       A
        LD        (Y), A
//   55   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//   56 
//   57   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
        LDW       Y, X
        ADDW      Y, #0x4
        LD        (Y), A
//   58   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
        LDW       Y, X
        ADDW      Y, #0x5
        LD        (Y), A
//   59   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
        LDW       Y, X
        ADDW      Y, #0x6
        LD        (Y), A
//   60   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
        ADDW      X, #0x7
        LD        (X), A
//   61 }
        RET
//   62 
//   63 /**
//   64   * @brief  Initializes the USART according to the specified parameters.
//   65   * @note   Configure in Push Pull or Open Drain mode the Tx pin by setting the
//   66   *         correct I/O Port register according the product package and line
//   67   *         configuration
//   68   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//   69   * @param  BaudRate : The baudrate.
//   70   * @param  USART_WordLength : This parameter can be any of the
//   71   *         @ref USART_WordLength_TypeDef enumeration.
//   72   * @param  USART_StopBits : This parameter can be any of the
//   73   *         @ref USART_StopBits_TypeDef enumeration.
//   74   * @param  USART_Parity : This parameter can be any of the
//   75   *         @ref USART_Parity_TypeDef enumeration.
//   76   * @param  USART_Mode : This parameter can be any of the @ref USART_Mode_TypeDef values
//   77   * @retval None
//   78   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   79 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
//   80                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
//   81                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
//   82 {
USART_Init:
        PUSH      L:?b11
        PUSH      L:?b10
        PUSH      L:?b9
        PUSH      L:?b8
        PUSH      L:?b15
        PUSH      L:?b14
        PUSH      L:?b13
        PUSH      L:?b12
        PUSH      L:?b6
        LDW       S:?w4, X
        MOV       S:?b15, S:?b3
        MOV       S:?b14, S:?b2
        MOV       S:?b13, S:?b1
        MOV       S:?b12, S:?b0
        LD        S:?b0, A
//   83   uint32_t BaudRate_Mantissa = 0;
//   84 
//   85   /* Check the parameters */
//   86   assert_param(IS_USART_BAUDRATE(BaudRate));
//   87 
//   88   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
//   89 
//   90   assert_param(IS_USART_STOPBITS(USART_StopBits));
//   91 
//   92   assert_param(IS_USART_PARITY(USART_Parity));
//   93 
//   94   assert_param(IS_USART_MODE(USART_Mode));
//   95 
//   96   /* Clear the word length and Parity Control bits */
//   97   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
        ADDW      X, #0x4
        LD        A, #0xe9
        AND       A, (X)
        LD        (X), A
//   98   /* Set the word length bit according to USART_WordLength value */
//   99   /* Set the Parity Control bit to USART_Parity value */
//  100   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
        LD        A, S:?b5
        OR        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  101 
//  102   /* Clear the STOP bits */
//  103   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        A, #0xcf
        AND       A, (X)
        LD        (X), A
//  104   /* Set the STOP bits number according to USART_StopBits value */
//  105   USARTx->CR3 |= (uint8_t)USART_StopBits;
        LD        A, S:?b4
        OR        A, (X)
        LD        (X), A
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x2
        CLR       A
        LD        (X), A
//  106 
//  107   /* Clear the LSB mantissa of USARTDIV */
//  108   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
//  109   /* Clear the MSB mantissa of USARTDIV */
//  110   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
        LDW       X, S:?w4
        ADDW      X, #0x3
        LDW       S:?w5, X
        LD        A, #0xf
        AND       A, [S:?w5.w]
        LD        [S:?w5.w], A
//  111   /* Clear the Fraction bits of USARTDIV */
//  112   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
        LD        A, #0xf0
        AND       A, [S:?w5.w]
        LD        [S:?w5.w], A
//  113 
//  114   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
        CALL      L:CLK_GetClockFreq
        MOV       S:?b7, S:?b15
        MOV       S:?b6, S:?b14
        MOV       S:?b5, S:?b13
        MOV       S:?b4, S:?b12
        CALL      L:?udiv32_l0_l0_l1
//  115   /* Set the fraction of USARTDIV */
//  116   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
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
        AND       A, #0xf0
        LD        [S:?w5.w], A
//  117   /* Set the MSB mantissa of USARTDIV */
//  118   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
        LD        A, S:?b3
        AND       A, #0xf
        OR        A, [S:?w5.w]
        LD        [S:?w5.w], A
//  119   /* Set the LSB mantissa of USARTDIV */
//  120   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
        LDW       X, S:?w1
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        (X), A
//  121 
//  122   /* Disable the Transmitter and Receiver */
//  123   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
        LDW       X, S:?w4
        ADDW      X, #0x5
        LD        A, #0xf3
        AND       A, (X)
        LD        (X), A
//  124   /* Set TEN and REN bits according to USART_Mode value */
//  125   USARTx->CR2 |= (uint8_t)USART_Mode;
        LD        A, (0x1,SP)
        OR        A, (X)
        LD        (X), A
//  126 }
        ADD       SP, #0x1
        POP       L:?b12
        POP       L:?b13
        POP       L:?b14
        POP       L:?b15
        POP       L:?b8
        POP       L:?b9
        POP       L:?b10
        POP       L:?b11
        RET
//  127 
//  128 /**
//  129   * @brief  Initializes the USART Clock according to the specified parameters.
//  130   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  131   * @param  USART_Clock : This parameter can be any of the @ref USART_Clock_TypeDef
//  132   *         enumeration.
//  133   * @param  USART_CPOL : This parameter can be any of the @ref USART_CPOL_TypeDef
//  134   *         enumeration.
//  135   * @param  USART_CPHA : This parameter can be any of the @ref USART_CPHA_TypeDef
//  136   *         enumeration.
//  137   * @param  USART_LastBit : This parameter can be any of the @ref USART_LastBit_TypeDef
//  138   *         enumeration.
//  139   * @retval None
//  140   */
//  141 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  142 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
//  143                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
//  144                      USART_LastBit_TypeDef USART_LastBit)
//  145 {
USART_ClockInit:
        LD        S:?b3, A
//  146   /* Check the parameters */
//  147   assert_param(IS_USART_CLOCK(USART_Clock));
//  148   assert_param(IS_USART_CPOL(USART_CPOL));
//  149   assert_param(IS_USART_CPHA(USART_CPHA));
//  150   assert_param(IS_USART_LASTBIT(USART_LastBit));
//  151 
//  152   /* Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  153   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
        ADDW      X, #0x6
        LD        A, #0xf8
        AND       A, (X)
        LD        (X), A
//  154   /* Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  155   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, S:?b2
        OR        A, (X)
        LD        (X), A
//  156 
//  157   if (USART_Clock != USART_Clock_Disable)
        CLR       A
        CP        A, S:?b3
        JREQ      L:??USART_ClockInit_0
//  158   {
//  159     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
        LD        A, #0x8
        OR        A, (X)
        LD        (X), A
        RET
//  160   }
//  161   else
//  162   {
//  163     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
??USART_ClockInit_0:
        LD        A, #0xf7
        AND       A, (X)
        LD        (X), A
//  164   }
//  165 }
        RET
//  166 
//  167 /**
//  168   * @brief  Enable the USART peripheral.
//  169   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  170   * @param  NewState : The new state of the USART Communication.
//  171   *         This parameter can be any of the @ref FunctionalState enumeration.
//  172   * @retval None
//  173   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  174 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  175 {
//  176   if (NewState != DISABLE)
USART_Cmd:
        ADDW      X, #0x4
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_Cmd_0
//  177   {
//  178     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
        LD        A, #0xdf
        AND       A, (X)
        LD        (X), A
        RET
//  179   }
//  180   else
//  181   {
//  182     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
??USART_Cmd_0:
        LD        A, #0x20
        OR        A, (X)
        LD        (X), A
//  183   }
//  184 }
        RET
//  185 
//  186 /**
//  187   * @brief  Enables or disables the specified USART interrupts.
//  188   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  189   * @param  USART_IT specifies the USART interrupt sources to be enabled or disabled.
//  190   *         This parameter can be one of the following values:
//  191   *         - USART_IT_TXE:  Tansmit Data Register empty interrupt
//  192   *         - USART_IT_TC:   Transmission complete interrupt
//  193   *         - USART_IT_RXNE: Receive Data register not empty interrupt
//  194   *         - USART_IT_OR: Overrun error interrupt
//  195   *         - USART_IT_IDLE: Idle line detection interrupt
//  196   *         - USART_IT_ERR:  Error interrupt
//  197   * @param  NewState new state of the specified USART interrupts.
//  198   *         This parameter can be: ENABLE or DISABLE.
//  199   * @retval None
//  200   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  201 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
//  202 {
USART_ITConfig:
        LDW       S:?w0, X
        LD        S:?b4, A
//  203   uint8_t usartreg, itpos = 0x00;
//  204   assert_param(IS_USART_CONFIG_IT(USART_IT));
//  205   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  206 
//  207   /* Get the USART register index */
//  208   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
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
        LD        S:?b3, A
//  209   /* Get the USART IT index */
//  210   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
        LD        A, YL
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b2, A
//  211 
//  212   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b4
        JREQ      L:??USART_ITConfig_0
//  213   {
//  214     /**< Enable the Interrupt bits according to USART_IT mask */
//  215     if (usartreg == 0x01)
        LD        A, S:?b3
        CP        A, #0x1
        JRNE      L:??USART_ITConfig_1
//  216     {
//  217       USARTx->CR1 |= itpos;
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        A, S:?b2
        OR        A, (X)
        LD        (X), A
        RET
//  218     }
//  219     else if (usartreg == 0x05)
??USART_ITConfig_1:
        CP        A, #0x5
        JRNE      L:??USART_ITConfig_2
//  220     {
//  221       USARTx->CR5 |= itpos;
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, S:?b2
        OR        A, (X)
        LD        (X), A
        RET
//  222     }
//  223     /*uartreg =0x02*/
//  224     else
//  225     {
//  226       USARTx->CR2 |= itpos;
??USART_ITConfig_2:
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        A, S:?b2
        OR        A, (X)
        LD        (X), A
        RET
//  227     }
//  228   }
//  229   else
//  230   {
//  231     /**< Disable the interrupt bits according to USART_IT mask */
//  232     if (usartreg == 0x01)
??USART_ITConfig_0:
        CPL       S:?b2
        LD        A, S:?b3
        CP        A, #0x1
        JRNE      L:??USART_ITConfig_3
//  233     {
//  234       USARTx->CR1 &= (uint8_t)(~itpos);
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        A, S:?b2
        AND       A, (X)
        LD        (X), A
        RET
//  235     }
//  236     else if (usartreg == 0x05)
??USART_ITConfig_3:
        CP        A, #0x5
        JRNE      L:??USART_ITConfig_4
//  237     {
//  238       USARTx->CR5 &= (uint8_t)(~itpos);
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, S:?b2
        AND       A, (X)
        LD        (X), A
        RET
//  239     }
//  240     /*uartreg =0x02*/
//  241     else
//  242     {
//  243       USARTx->CR2 &= (uint8_t)(~itpos);
??USART_ITConfig_4:
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        A, S:?b2
        AND       A, (X)
        LD        (X), A
//  244     }
//  245   }
//  246 
//  247 }
        RET
//  248 /**
//  249   * @brief  Enables or disables the USART’s Half Duplex communication.
//  250   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  251   * @param  NewState new state of the USART Communication.
//  252   *         This parameter can be: ENABLE or DISABLE.
//  253   * @retval None
//  254   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  255 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  256 {
//  257   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  258 
//  259   if (NewState != DISABLE)
USART_HalfDuplexCmd:
        ADDW      X, #0x8
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_HalfDuplexCmd_0
//  260   {
//  261     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
        LD        A, #0x8
        OR        A, (X)
        LD        (X), A
        RET
//  262   }
//  263   else
//  264   {
//  265     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
??USART_HalfDuplexCmd_0:
        LD        A, #0xf7
        AND       A, (X)
        LD        (X), A
//  266   }
//  267 }
        RET
//  268 
//  269 /**
//  270   * @brief  Configures the USART’s IrDA interface.
//  271   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  272   * @param  USART_IrDAMode specifies the IrDA mode.
//  273   *         This parameter can be any of the @ref USART_IrDAMode_TypeDef values.
//  274   * @retval None
//  275   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  276 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
//  277 {
//  278   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
//  279 
//  280   if (USART_IrDAMode != USART_IrDAMode_Normal)
USART_IrDAConfig:
        ADDW      X, #0x8
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_IrDAConfig_0
//  281   {
//  282     USARTx->CR5 |= USART_CR5_IRLP;
        LD        A, #0x4
        OR        A, (X)
        LD        (X), A
        RET
//  283   }
//  284   else
//  285   {
//  286     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
??USART_IrDAConfig_0:
        LD        A, #0xfb
        AND       A, (X)
        LD        (X), A
//  287   }
//  288 }
        RET
//  289 
//  290 /**
//  291   * @brief  Enables or disables the USART’s IrDA interface.
//  292   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  293   * @param  NewState new state of the IrDA mode.
//  294   *         This parameter can be: ENABLE or DISABLE.
//  295   * @retval None
//  296   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  297 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  298 {
//  299 
//  300   /* Check parameters */
//  301   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  302 
//  303   if (NewState != DISABLE)
USART_IrDACmd:
        ADDW      X, #0x8
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_IrDACmd_0
//  304   {
//  305     /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
//  306     USARTx->CR5 |= USART_CR5_IREN;
        LD        A, #0x2
        OR        A, (X)
        LD        (X), A
        RET
//  307   }
//  308   else
//  309   {
//  310     /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
//  311     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
??USART_IrDACmd_0:
        LD        A, #0xfd
        AND       A, (X)
        LD        (X), A
//  312   }
//  313 }
        RET
//  314 /**
//  315   * @brief  Enables or disables the USART Smart Card mode.
//  316   * @param  USARTx: Select the USARTx peripheral.
//  317   * @param  NewState: new state of the Smart Card mode.
//  318   *         This parameter can be: ENABLE or DISABLE.
//  319   * @retval None
//  320   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  321 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  322 {
//  323   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  324 
//  325   if (NewState != DISABLE)
USART_SmartCardCmd:
        ADDW      X, #0x8
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_SmartCardCmd_0
//  326   {
//  327     /* Enable the SC mode by setting the SCEN bit in the CR5 register */
//  328     USARTx->CR5 |= USART_CR5_SCEN;
        LD        A, #0x20
        OR        A, (X)
        LD        (X), A
        RET
//  329   }
//  330   else
//  331   {
//  332     /* Disable the SC mode by clearing the SCEN bit in the CR5 register */
//  333     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
??USART_SmartCardCmd_0:
        LD        A, #0xdf
        AND       A, (X)
        LD        (X), A
//  334   }
//  335 }
        RET
//  336 
//  337 /**
//  338   * @brief  Enables or disables NACK transmission.
//  339   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  340   * @param  NewState: new state of the Smart Card mode.
//  341   *         This parameter can be: ENABLE or DISABLE.
//  342   * @retval None
//  343   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  344 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  345 {
//  346   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  347 
//  348   if (NewState != DISABLE)
USART_SmartCardNACKCmd:
        ADDW      X, #0x8
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_SmartCardNACKCmd_0
//  349   {
//  350     /* Enable the NACK transmission by setting the NACK bit in the CR5 register */
//  351     USARTx->CR5 |= USART_CR5_NACK;
        LD        A, #0x10
        OR        A, (X)
        LD        (X), A
        RET
//  352   }
//  353   else
//  354   {
//  355     /* Disable the NACK transmission by clearing the NACK bit in the CR5 register */
//  356     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
??USART_SmartCardNACKCmd_0:
        LD        A, #0xef
        AND       A, (X)
        LD        (X), A
//  357   }
//  358 }
        RET
//  359 /**
//  360   * @brief  Sets the specified USART guard time.
//  361   * @note   SmartCard Mode should be Enabled
//  362   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  363   * @param  USART_GuardTime: specifies the guard time.
//  364   * @retval None
//  365   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  366 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
//  367 {
//  368   /* Set the USART guard time */
//  369   USARTx->GTR = USART_GuardTime;
USART_SetGuardTime:
        ADDW      X, #0x9
        LD        (X), A
//  370 }
        RET
//  371 
//  372 /**
//  373   * @brief  Sets the system clock prescaler.
//  374   * @note   IrDA Low Power mode or smartcard mode should be enabled
//  375   * @note   This function is related to SmartCard and IrDa mode.
//  376   * @param  USARTx: Select the USARTx peripheral.
//  377   * @param  USART_Prescaler: specifies the prescaler clock.
//  378   *         This parameter can be one of the following values:
//  379   *         @par IrDA Low Power Mode
//  380   *         The clock source is diveded by the value given in the register (8 bits)
//  381   *         - 0000 0000 Reserved
//  382   *         - 0000 0001 divides the clock source by 1
//  383   *         - 0000 0010 divides the clock source by 2
//  384   *         - ...........................................................
//  385   *        @par Smart Card Mode
//  386   *        The clock source is diveded by the value given in the register
//  387   *        (5 significant bits) multipied by 2
//  388   *         - 0 0000 Reserved
//  389   *         - 0 0001 divides the clock source by 2
//  390   *         - 0 0010 divides the clock source by 4
//  391   *         - 0 0011 divides the clock source by 6
//  392   *         - ...........................................................
//  393   * @retval None
//  394   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  395 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
//  396 {
//  397   /* Load the USART prescaler value*/
//  398   USARTx->PSCR = USART_Prescaler;
USART_SetPrescaler:
        ADDW      X, #0xa
        LD        (X), A
//  399 }
        RET
//  400 
//  401 /**
//  402   * @brief  Returns the most recent received data by the USART peripheral.
//  403   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  404   * @retval The received data.
//  405   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  406 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
//  407 {
//  408   return USARTx->DR;
USART_ReceiveData8:
        INCW      X
        LD        A, (X)
        RET
//  409 }
//  410 
//  411 
//  412 /**
//  413   * @brief  Returns the most recent received data by the USART peripheral.
//  414   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  415   * @retval The received data.
//  416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
//  418 {
USART_ReceiveData9:
        LDW       Y, X
//  419   uint16_t temp = 0;
//  420 
//  421   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
        ADDW      X, #0x4
        LD        A, (X)
//  422   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
        CLRW      X
        LD        XL, A
        RRWA      X, A
        AND       A, #0x80
        RLWA      X, A
        SLLW      X
        INCW      Y
        LD        A, (Y)
        CLRW      Y
        LD        YL, A
        LDW       S:?w0, X
        LDW       X, Y
        RLWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
//  423 }
//  424 
//  425 /**
//  426   * @brief  Determines if the USART is in mute mode or not.
//  427   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  428   * @param  NewState : The new state of the USART mode.
//  429   *         This parameter can be any of the @ref FunctionalState enumeration.
//  430   * @retval None
//  431   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  432 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  433 {
//  434   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  435 
//  436   if (NewState != DISABLE)
USART_ReceiverWakeUpCmd:
        ADDW      X, #0x5
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??USART_ReceiverWakeUpCmd_0
//  437   {
//  438     /* Enable the mute mode USART by setting the RWU bit in the CR2 register */
//  439     USARTx->CR2 |= USART_CR2_RWU;
        LD        A, #0x2
        OR        A, (X)
        LD        (X), A
        RET
//  440   }
//  441   else
//  442   {
//  443     /* Disable the mute mode USART by clearing the RWU bit in the CR1 register */
//  444     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
??USART_ReceiverWakeUpCmd_0:
        LD        A, #0xfd
        AND       A, (X)
        LD        (X), A
//  445   }
//  446 }
        RET
//  447 
//  448 /**
//  449   * @brief  Transmits break characters.
//  450   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  451   * @retval None
//  452   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  453 void USART_SendBreak(USART_TypeDef* USARTx)
//  454 {
//  455   USARTx->CR2 |= USART_CR2_SBK;
USART_SendBreak:
        ADDW      X, #0x5
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
//  456 }
        RET
//  457 
//  458 /**
//  459   * @brief  Transmits 8 bit data through the USART peripheral.
//  460   * @param  Data: The data to transmit.
//  461   * @retval None
//  462   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  463 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
//  464 {
//  465   /* Transmit Data */
//  466   USARTx->DR = Data;
USART_SendData8:
        INCW      X
        LD        (X), A
//  467 }
        RET
//  468 
//  469 /**
//  470   * @brief  Transmits 9 bit data through the USART peripheral.
//  471   * @param  USARTx: Select the USARTx peripheral.
//  472   * @param  Data : The data to transmit.
//  473   *         This parameter should be lower than 0x1FF.
//  474   * @retval None
//  475   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  476 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
//  477 {
USART_SendData9:
        LDW       S:?w1, X
        LDW       S:?w0, Y
//  478   assert_param(IS_USART_DATA_9BITS(Data));
//  479 
//  480   /* Clear the transmit data bit 8     */
//  481   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
        ADDW      X, #0x4
        LDW       Y, X
        LD        A, #0xbf
        AND       A, (Y)
        LD        (Y), A
//  482 
//  483   /* Write the transmit data bit [8]   */
//  484   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
        LDW       X, S:?w0
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        OR        A, (Y)
        LD        (Y), A
//  485 
//  486   /* Write the transmit data bit [0:7] */
//  487   USARTx->DR   = (uint8_t)(Data);
        LDW       X, S:?w1
        INCW      X
        LD        A, S:?b1
        LD        (X), A
//  488 }
        RET
//  489 
//  490 /**
//  491   * @brief  Sets the address of the USART node.
//  492   * @param  USARTx: Select the USARTx peripheral.
//  493   * @param  Address : Indicates the address of the USART node.
//  494   *         This parameter should be lower than 16
//  495   * @retval None
//  496   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  497 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
//  498 {
USART_SetAddress:
        LD        S:?b0, A
//  499   /* assert_param for USART_Address */
//  500   assert_param(IS_USART_ADDRESS(USART_Address));
//  501 
//  502   /* Clear the USART address */
//  503   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
        ADDW      X, #0x7
        LD        A, #0xf0
        AND       A, (X)
        LD        (X), A
//  504   /* Set the USART address node */
//  505   USARTx->CR4 |= USART_Address;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  506 }
        RET
//  507 
//  508 /**
//  509   * @brief  Selects the USART WakeUp method.
//  510   * @param  USART_WakeUp : Specifies the USART wakeup method.
//  511   *         This parameter can be any of the @ref USART_WakeUp_TypeDef values
//  512   * @retval None
//  513   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  514 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
//  515 {
USART_WakeUpConfig:
        LD        S:?b0, A
//  516   assert_param(IS_USART_WAKEUP(USART_WakeUp));
//  517 
//  518   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
        ADDW      X, #0x4
        LD        A, #0xf7
        AND       A, (X)
        LD        (X), A
//  519   USARTx->CR1 |= (uint8_t)USART_WakeUp;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  520 }
        RET
//  521 
//  522 /**
//  523   * @brief  Enables or disables the USART DMA interface.
//  524   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  525   * @param  USART_DMAReq Specifies the USART DMA transfer request to be enabled or disabled.
//  526   *         This parameter can be any of the @ref USART_DMAReq_TypeDef enumeration.
//  527   * @param  NewState Indicates the new state of the USART DMA request.
//  528   *         This parameter can be any of the @ref FunctionalState enumeration.
//  529   * @retval None
//  530   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  531 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
//  532                   FunctionalState NewState)
//  533 {
USART_DMACmd:
        LD        S:?b1, A
//  534   /* Check the parameters */
//  535   assert_param(IS_USART_DMAREQ(USART_DMAReq));
//  536   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  537 
//  538   if (NewState != DISABLE)
        ADDW      X, #0x8
        CLR       A
        CP        A, S:?b0
        JREQ      L:??USART_DMACmd_0
//  539   {
//  540     /* Enable the DMA transfer for selected requests by setting the DMAT and/or
//  541        DMAR bits in the USART CR5 register */
//  542     USARTx->CR5 |= (uint8_t) USART_DMAReq;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        RET
//  543   }
//  544   else
//  545   {
//  546     /* Disable the DMA transfer for selected requests by clearing the DMAT and/or
//  547        DMAR bits in the USART CR5 register */
//  548     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
??USART_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  549   }
//  550 }
        RET
//  551 
//  552 /**
//  553   * @brief  Checks whether the specified USART flag is set or not.
//  554   * @param  USARTx: Select the USARTx peripheral.
//  555   * @param  USART_FLAG specifies the flag to check.
//  556   *         This parameter can be any of the @ref USART_FLAG_TypeDef enumeration.
//  557   * @retval FlagStatus (SET or RESET)
//  558   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  559 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
//  560 {
//  561   FlagStatus status = RESET;
//  562 
//  563   /* Check parameters */
//  564   assert_param(IS_USART_FLAG(USART_FLAG));
//  565 
//  566   if (USART_FLAG == USART_FLAG_SBK)
USART_GetFlagStatus:
        CPW       Y, #0x101
        JRNE      L:??USART_GetFlagStatus_0
//  567   {
//  568     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
        ADDW      X, #0x5
        LD        A, #0x1
        AND       A, (X)
        JREQ      L:??USART_GetFlagStatus_1
//  569     {
//  570       /* USART_FLAG is set*/
//  571       status = SET;
??USART_GetFlagStatus_2:
        LD        A, #0x1
//  572     }
//  573     else
//  574     {
//  575       /* USART_FLAG is reset*/
//  576       status = RESET;
//  577     }
//  578   }
//  579   else
//  580   {
//  581     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
//  582     {
//  583       /* USART_FLAG is set*/
//  584       status = SET;
//  585     }
//  586     else
//  587     {
//  588       /* USART_FLAG is reset*/
//  589       status = RESET;
//  590     }
//  591   }
//  592   /* Return the USART_FLAG status*/
//  593   return status;
        RET
??USART_GetFlagStatus_0:
        LD        A, YL
        AND       A, (X)
        JRNE      L:??USART_GetFlagStatus_2
??USART_GetFlagStatus_1:
        CLR       A
        RET
//  594 }
//  595 
//  596 /**
//  597   * @brief  Clears the USARTx's pending flags.
//  598   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  599   * @param  USART_FLAG: specifies the flag to clear.
//  600   *         This parameter can be any combination of the following values:
//  601   *         USART_FLAG_TC:   Transmission Complete flag.
//  602   *         USART_FLAG_RXNE: Receive data register not empty flag.
//  603   *
//  604   * @Note
//  605   *     - PE (Parity error), FE (Framing error), NE (Noise error), OR (OverRun error)
//  606   *       and IDLE (Idle line detected) flags are cleared by software sequence: a read
//  607   *       operation to USART_SR register (USART_GetFlagStatus())followed by a read
//  608   *       operation to USART_DR register(USART_ReceiveData8() or USART_ReceiveData9()).
//  609   *
//  610   *     - RXNE flag can be also cleared by a read to the USART_DR register
//  611   *       (USART_ReceiveData8()or USART_ReceiveData9()).
//  612   *
//  613   *     - TC flag can be also cleared by software sequence: a read operation to USART_SR
//  614   *       register (USART_GetFlagStatus()) followed by a write operation to USART_DR
//  615   *       register (USART_SendData8() or USART_SendData9()).
//  616   *
//  617   *     - TXE flag is cleared only by a write to the USART_DR register
//  618   *       (USART_SendData8() or USART_SendData9()).
//  619   *
//  620   *     - SBK flag is cleared during the stop bit of break.
//  621   *
//  622   * @retval None
//  623   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  624 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
//  625 {
//  626   /* Check the parameters */
//  627   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
//  628   /*< Clear RXNE or TC flags */
//  629   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
USART_ClearFlag:
        LD        A, YL
        CPL       A
        LD        (X), A
//  630 }
        RET
//  631 
//  632 /**
//  633   * @brief  Checks whether the specified USART interrupt has occurred or not.
//  634   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  635   * @param  USART_IT: Specifies the USART interrupt pending bit to check.
//  636   *         This parameter can be one of the following values:
//  637   *         - USART_IT_TXE: Transmit Data Register empty interrupt
//  638   *         - USART_IT_TC: Transmission complete interrupt
//  639   *         - USART_IT_RXNE: Receive Data register not empty interrupt
//  640   *         - USART_IT_IDLE: Idle line detection interrupt
//  641   *         - USART_IT_OR: OverRun Error interrupt
//  642   *         - USART_IT_PE: Parity Error interrupt
//  643   *         - USART_IT_FE: Frame Error interrupt
//  644   *         - USART_IT_NF: Noise Flag Error interrupt
//  645   * @retval ITStatus The new state of USART_IT (SET or RESET).
//  646   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  647 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
//  648 {
USART_GetITStatus:
        LDW       S:?w0, X
//  649   ITStatus pendingbitstatus = RESET;
//  650   uint8_t temp = 0;
//  651   uint8_t itpos = 0;
//  652   uint8_t itmask1 = 0;
//  653   uint8_t itmask2 = 0;
//  654   uint8_t enablestatus = 0;
//  655 
//  656   /* Check parameters */
//  657   assert_param(IS_USART_GET_IT(USART_IT));
//  658 
//  659   /* Get the USART IT index */
//  660   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
        LD        A, YL
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b2, A
//  661   /* Get the USART IT index */
//  662   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
//  663   /* Set the IT mask*/
//  664   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
        LD        A, YL
        SWAP      A
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
//  665 
//  666   /* Check the status of the specified USART pending bit*/
//  667   if (USART_IT == USART_IT_PE)
        CPW       Y, #0x100
        JRNE      L:??USART_GetITStatus_0
//  668   {
//  669     /* Get the USART_IT enable bit status*/
//  670     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
        LDW       X, S:?w0
        ADDW      X, #0x4
        AND       A, (X)
        LD        S:?b3, A
//  671     /* Check the status of the specified USART interrupt*/
//  672 
//  673     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, S:?b2
        AND       A, [S:?w0.w]
        JREQ      L:??USART_GetITStatus_1
??USART_GetITStatus_2:
        CLR       A
        CP        A, S:?b3
        JREQ      L:??USART_GetITStatus_1
//  674     {
//  675       /* Interrupt occurred*/
//  676       pendingbitstatus = SET;
??USART_GetITStatus_3:
        LD        A, #0x1
//  677     }
//  678     else
//  679     {
//  680       /* Interrupt not occurred*/
//  681       pendingbitstatus = RESET;
//  682     }
//  683   }
//  684 
//  685   else if (USART_IT == USART_IT_OR)
//  686   {
//  687     /* Get the USART_IT enable bit status*/
//  688     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
//  689     /* Check the status of the specified USART interrupt*/
//  690 
//  691     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
//  692 
//  693     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
//  694     {
//  695       /* Interrupt occurred*/
//  696       pendingbitstatus = SET;
//  697     }
//  698     else
//  699     {
//  700       /* Interrupt not occurred*/
//  701       pendingbitstatus = RESET;
//  702     }
//  703   }
//  704 
//  705   else
//  706   {
//  707     /* Get the USART_IT enable bit status*/
//  708     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
//  709     /* Check the status of the specified USART interrupt*/
//  710     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
//  711     {
//  712       /* Interrupt occurred*/
//  713       pendingbitstatus = SET;
//  714     }
//  715     else
//  716     {
//  717       /* Interrupt not occurred*/
//  718       pendingbitstatus = RESET;
//  719     }
//  720   }
//  721 
//  722   /* Return the USART_IT status*/
//  723   return  pendingbitstatus;
        RET
??USART_GetITStatus_0:
        LDW       X, S:?w0
        ADDW      X, #0x5
        CPW       Y, #0x235
        JRNE      L:??USART_GetITStatus_4
        AND       A, (X)
        LD        S:?b3, A
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, #0x1
        AND       A, (X)
        LD        S:?b4, A
        LD        A, S:?b2
        AND       A, [S:?w0.w]
        JREQ      L:??USART_GetITStatus_1
        CLR       A
        CP        A, S:?b3
        JRNE      L:??USART_GetITStatus_3
        CP        A, S:?b4
        JRNE      L:??USART_GetITStatus_3
??USART_GetITStatus_1:
        CLR       A
        RET
??USART_GetITStatus_4:
        AND       A, (X)
        LD        S:?b3, A
        LD        A, S:?b2
        AND       A, [S:?w0.w]
        JRNE      L:??USART_GetITStatus_2
        JRA       L:??USART_GetITStatus_1
//  724 }
//  725 
//  726 /**
//  727   * @brief  Clears the USARTx’s interrupt pending bits.
//  728   * @param  USARTx : where x can be 1 to select the specified USART peripheral.
//  729   * @param  USART_IT: specifies the interrupt pending bit to clear.
//  730   *         This parameter can be one of the following values:
//  731   *         USART_IT_RXNE: Receive Data register not empty interrupt.
//  732   *         USART_IT_TC:   Transmission complete interrupt.
//  733   *
//  734   * @note
//  735   *         - PE (Parity error), FE (Framing error), NE (Noise error),
//  736   *         OR (OverRun error) and IDLE (Idle line detected) pending bits are
//  737   *         cleared by software sequence: a read operation to USART_SR register
//  738   *         (USART_GetITStatus()) followed by a read operation to USART_DR
//  739   *         register (USART_ReceiveData8() or USART_ReceiveData9()).
//  740   *
//  741   *         - RXNE pending bit can be also cleared by a read to the USART_DR register
//  742   *         (USART_ReceiveData8() or USART_ReceiveData9()).
//  743   *
//  744   *         - TC (Transmit complet) pending bit can be also cleared by software
//  745   *         sequence: a read operation to USART_SR register (USART_GetITStatus())
//  746   *         followed by a write operation to USART_DR register (USART_SendData8()
//  747   *         or USART_SendData9()).
//  748   *
//  749   *         - TXE pending bit is cleared only by a write to the USART_DR register
//  750   *         (USART_SendData8() or USART_SendData9()).
//  751   *
//  752   * @retval None
//  753   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  754 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
//  755 {
USART_ClearITPendingBit:
        LDW       S:?w0, X
//  756   uint8_t bitpos = 0x00, itmask = 0x00;
//  757   assert_param(IS_USART_CLEAR_IT(USART_IT));
//  758   bitpos = (uint8_t)( (uint8_t)((uint8_t)USART_IT & (uint8_t)0xF0) >> 0x04);
//  759   itmask = (uint8_t)( (uint8_t)0x01 << bitpos);
//  760   /*< Clear RXNE or TC pending bit */
//  761   USARTx->SR = (uint8_t)~itmask;
        LD        A, YL
        SWAP      A
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        LD        [S:?w0.w], A
//  762 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  763 
//  764 
//  765 /**
//  766   * @}
//  767   */
//  768 
//  769 /**
//  770   * @}
//  771   */
//  772 
//  773 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 855 bytes in section .near_func.text
// 
// 855 bytes of CODE memory
//
//Errors: none
//Warnings: none
