///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:44 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_exti.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_exti.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_exti.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_exti

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?sll16_x_x_a
        EXTERN ?sra16_x_x_a

        PUBLIC EXTI_ClearITPendingBit
        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GetITStatus
        PUBLIC EXTI_GetPinSensitivity
        PUBLIC EXTI_GetPortSensitivity
        PUBLIC EXTI_SelectPort
        PUBLIC EXTI_SetHalfPortSelection
        PUBLIC EXTI_SetPinSensitivity
        PUBLIC EXTI_SetPortSensitivity

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_exti.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_exti.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the EXTI firmware functions.
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
//   22 #include "stm8l15x_exti.h"
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
//   35 
//   36 /**
//   37   * @addtogroup EXTI_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Deinitializes the EXTI registers to their default reset value.
//   43   * @param  None
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void EXTI_DeInit(void)
//   47 {
//   48   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
EXTI_DeInit:
        CLR       A
        LD        L:0x50a0, A
//   49   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
        LD        L:0x50a1, A
//   50   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
        LD        L:0x50a2, A
//   51   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
        LD        L:0x50aa, A
//   52   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
        LD        A, #0xff
        LD        L:0x50a3, A
//   53   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
        LD        L:0x50a4, A
//   54   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
        CLR       A
        LD        L:0x50a5, A
//   55   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
        LD        L:0x50ab, A
//   56 }
        RET
//   57 
//   58 /**
//   59   * @brief  Sets the external interrupt sensitivity of the selected port.
//   60   * @note   - Global interrupts must be disabled before calling this function.
//   61   * @note   - The modification of external interrupt sensitivity is only possible
//   62   *         when the interrupts are disabled.
//   63   *         - The normal behavior is to disable the interrupts before calling this
//   64   *         function, and re-enable them after.
//   65   * @param  EXTI_Port : The port number to access.
//   66   *         This parameter can be a value of @ref EXTI_Port_TypeDef
//   67   * @param  EXTI_Trigger : The external interrupt sensitivity value to set.
//   68   *         This parameter can be a value of @ref EXTI_Trigger_TypeDef
//   69   * @retval None
//   70   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   71 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
//   72                              EXTI_Trigger_TypeDef EXTI_Trigger)
//   73 {
EXTI_SetPortSensitivity:
        LD        S:?b1, A
//   74   /* Check function parameters */
//   75   assert_param(IS_EXTI_PORT(EXTI_Port));
//   76   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
//   77 
//   78   /* Ceck if selected port is in EXTI_CR3 register */
//   79   if ((EXTI_Port & 0xF0) == 0x00)
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b0
        EXG       A, YL
        AND       A, #0xf0
        JRNE      L:??EXTI_SetPortSensitivity_0
//   80   {
//   81     /* Reset the trigger bits corresponding to EXTI_Port */
//   82     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
        LDW       X, #0x3
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50a2
        LD        L:0x50a2, A
//   83     /* Write EXTI port trigger */
//   84     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
        LD        A, S:?b1
        LDW       X, Y
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50a2
        LD        L:0x50a2, A
        RET
//   85   }
//   86   else /* selected port is in EXTI_CR4 register */
//   87   {
//   88     /* Reset the trigger bits corresponding to EXTI_Port */
//   89     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
??EXTI_SetPortSensitivity_0:
        LD        A, S:?b1
        AND       A, #0xf
        LD        S:?b0, A
        LDW       X, #0x3
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50aa
        LD        L:0x50aa, A
//   90     /* Write EXTI port trigger */
//   91     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
        LD        A, S:?b0
        LDW       X, Y
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50aa
        LD        L:0x50aa, A
//   92   }
//   93 }
        RET
//   94 
//   95 /**
//   96   * @brief  Sets the external interrupt sensitivity of the selected pin.
//   97   * @note   - Global interrupts must be disabled before calling this function.
//   98   * @note   - The modification of external interrupt sensitivity is only possible
//   99   *         when he interrupts are disabled.
//  100   *         - The normal behavior is to disable the interrupts before calling this
//  101   *         function, and re-enable them after.
//  102   * @param  EXTI_Pin : The pin to configure.
//  103   *         This parameter can be a value of @ref EXTI_Pin_TypeDef
//  104   * @param  EXTI_Trigger : The external interrupt sensitivity value to set.
//  105   *         This parameter can be a value of @ref EXTI_Trigger_TypeDef
//  106   * @retval None
//  107   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin,
//  109                             EXTI_Trigger_TypeDef EXTI_Trigger)
//  110 {
//  111 
//  112   /* Check function parameters */
//  113   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
//  114   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
//  115 
//  116   /* Clear port sensitivity bits */
//  117   switch (EXTI_Pin)
EXTI_SetPinSensitivity:
        CP        A, #0x0
        JREQ      L:??EXTI_SetPinSensitivity_0
        CP        A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_1
        CP        A, #0x4
        JREQ      L:??EXTI_SetPinSensitivity_2
        CP        A, #0x6
        JREQ      L:??EXTI_SetPinSensitivity_3
        CP        A, #0x10
        JREQ      L:??EXTI_SetPinSensitivity_4
        CP        A, #0x12
        JREQ      L:??EXTI_SetPinSensitivity_5
        CP        A, #0x14
        JREQ      L:??EXTI_SetPinSensitivity_6
        CP        A, #0x16
        JRNE      ??lb_0
        JP        L:??EXTI_SetPinSensitivity_7
??lb_0:
        RET
//  118   {
//  119     case EXTI_Pin_0:
//  120       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
??EXTI_SetPinSensitivity_0:
        LD        A, #0xfc
        AND       A, L:0x50a0
        LD        L:0x50a0, A
//  121       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
        LD        A, S:?b0
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//  122       break;
        RET
//  123     case EXTI_Pin_1:
//  124       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
??EXTI_SetPinSensitivity_1:
        LD        A, #0xf3
        AND       A, L:0x50a0
        LD        L:0x50a0, A
//  125       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
        LD        A, S:?b0
        SLL       A
        SLL       A
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//  126       break;
        RET
//  127     case EXTI_Pin_2:
//  128       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
??EXTI_SetPinSensitivity_2:
        LD        A, #0xcf
        AND       A, L:0x50a0
        LD        L:0x50a0, A
//  129       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//  130       break;
        RET
//  131     case EXTI_Pin_3:
//  132       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
??EXTI_SetPinSensitivity_3:
        LD        A, #0x3f
        AND       A, L:0x50a0
        LD        L:0x50a0, A
//  133       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        SLL       A
        SLL       A
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//  134       break;
        RET
//  135     case EXTI_Pin_4:
//  136       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
??EXTI_SetPinSensitivity_4:
        LD        A, #0xfc
        AND       A, L:0x50a1
        LD        L:0x50a1, A
//  137       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
        LD        A, S:?b0
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  138       break;
        RET
//  139     case EXTI_Pin_5:
//  140       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
??EXTI_SetPinSensitivity_5:
        LD        A, #0xf3
        AND       A, L:0x50a1
        LD        L:0x50a1, A
//  141       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
        LD        A, S:?b0
        SLL       A
        SLL       A
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  142       break;
        RET
//  143     case EXTI_Pin_6:
//  144       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
??EXTI_SetPinSensitivity_6:
        LD        A, #0xcf
        AND       A, L:0x50a1
        LD        L:0x50a1, A
//  145       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  146       break;
        RET
//  147     case EXTI_Pin_7:
//  148       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
??EXTI_SetPinSensitivity_7:
        LD        A, #0x3f
        AND       A, L:0x50a1
        LD        L:0x50a1, A
//  149       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        SLL       A
        SLL       A
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  150       break;
//  151     default:
//  152       break;
//  153   }
//  154 }
        RET
//  155 
//  156 /**
//  157   * @brief  Selects the port interrupt selection.
//  158   * @param  EXTI_Port : The port number to access.
//  159   *         This parameter can be a value of @ref EXTI_Port_TypeDef
//  160   * @retval None
//  161   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  162 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
//  163 {
EXTI_SelectPort:
        LD        S:?b0, A
//  164   /* Check function parameter */
//  165   assert_param(IS_EXTI_PORT(EXTI_Port));
//  166 
//  167   if (EXTI_Port == EXTI_Port_B)
        CLR       A
        CP        A, S:?b0
        JRNE      L:??EXTI_SelectPort_0
//  168   {
//  169     /* Select Port B by resetting PGBS bit in CONF2 register */
//  170     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
        BRES      L:0x50ab, #0x5
        RET
//  171   }
//  172   else if (EXTI_Port == EXTI_Port_D)
??EXTI_SelectPort_0:
        LD        A, S:?b0
        CP        A, #0x2
        JRNE      L:??EXTI_SelectPort_1
//  173   {
//  174     /* Select Port D by resetting PHDS bit in CONF2 register */
//  175     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
        BRES      L:0x50ab, #0x6
        RET
//  176   }
//  177   else if (EXTI_Port == EXTI_Port_E)
??EXTI_SelectPort_1:
        CP        A, #0x4
        JRNE      L:??EXTI_SelectPort_2
//  178   {
//  179     /* Select Port E by resetting PFES bit in CONF1 register */
//  180     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
        BRES      L:0x50a5, #0x7
        RET
//  181   }
//  182   else if (EXTI_Port == EXTI_Port_F)
??EXTI_SelectPort_2:
        CP        A, #0x6
        JRNE      L:??EXTI_SelectPort_3
//  183   {
//  184     /* Select Port F by setting PFES bit in CONF1 register */
//  185     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
        BSET      L:0x50a5, #0x7
        RET
//  186   }
//  187   else if (EXTI_Port == EXTI_Port_G)
??EXTI_SelectPort_3:
        CP        A, #0x10
        JRNE      L:??EXTI_SelectPort_4
//  188   {
//  189     /* Select Port G by setting PGBS bit in CONF2 register */
//  190     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
        BSET      L:0x50ab, #0x5
        RET
//  191   }
//  192   else /* EXTI_Port is EXTI_Port_H */
//  193   {
//  194     /* Select Port H by setting PHDS bit in CONF2 register */
//  195     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
??EXTI_SelectPort_4:
        BSET      L:0x50ab, #0x6
//  196   }
//  197 }
        RET
//  198 
//  199 /**
//  200   * @brief  Configures the half port interrupt selection.
//  201   * @note   - This function should be called once the port sensitivity configured,
//  202   *         otherwise it will not have any effect on the port external interrupt.
//  203   *         - This function should be called after EXTI_SelectPort() function which
//  204   *         selects the port to be used otherwise ports are selected by default
//  205   * @param  EXTI_HalfPort : The port part to access (MSB or LSB).
//  206   *         This parameter can be a value of @ref EXTI_HalfPort_TypeDef
//  207   * @param  NewState : The external interrupt new state.
//  208   *         This parameter can be a value of @ref FunctionalState.
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
//  212                                FunctionalState NewState)
//  213 {
EXTI_SetHalfPortSelection:
        LD        S:?b1, A
//  214   /* Check function parameters */
//  215   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
//  216   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  217 
//  218   if ((EXTI_HalfPort & 0x80) == 0x00)
        AND       A, #0x80
        JRNE      L:??EXTI_SetHalfPortSelection_0
//  219   {
//  220     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??EXTI_SetHalfPortSelection_1
//  221     {
//  222       /* Enable port interrupt selector */
//  223       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
        LD        A, S:?b1
        OR        A, L:0x50a5
        LD        L:0x50a5, A
        RET
//  224     }
//  225     else /*NewState == DISABLE */
//  226     {
//  227       /* Disable port interrupt selector */
//  228       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
??EXTI_SetHalfPortSelection_1:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50a5
        LD        L:0x50a5, A
        RET
//  229     }
//  230   }
//  231   else
//  232   {
//  233     if (NewState != DISABLE)
??EXTI_SetHalfPortSelection_0:
        LD        A, S:?b1
        AND       A, #0x7f
        LD        S:?b1, A
        CLR       A
        CP        A, S:?b0
        JREQ      L:??EXTI_SetHalfPortSelection_2
//  234     {
//  235       /* Enable port interrupt selector */
//  236       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
        LD        A, S:?b1
        OR        A, L:0x50ab
        LD        L:0x50ab, A
        RET
//  237     }
//  238     else /*NewState == DISABLE */
//  239     {
//  240       /* Disable port interrupt selector */
//  241       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
??EXTI_SetHalfPortSelection_2:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50ab
        LD        L:0x50ab, A
//  242     }
//  243   }
//  244 }
        RET
//  245 
//  246 /**
//  247   * @brief  Gets the external interrupt sensitivity of the selected port.
//  248   * @param  EXTI_Port : The port number to access.
//  249   *         This parameter can be a value of @ref EXTI_Port_TypeDef
//  250   * @retval EXTI_Trigger_TypeDef : The external interrupt sensitivity of the selected port.
//  251   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  252 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
//  253 {
EXTI_GetPortSensitivity:
        LD        S:?b0, A
//  254   uint8_t portsensitivity = 0;
//  255 
//  256   /* Check function parameters */
//  257   assert_param(IS_EXTI_PORT(EXTI_Port));
//  258 
//  259   /* Check if selected port is in EXTI_CR3 */
//  260   if ((EXTI_Port & 0xF0) == 0x00)
        AND       A, #0xf0
        JRNE      L:??EXTI_GetPortSensitivity_0
//  261   {
//  262     /* Get port sensitivity */
//  263     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
        LD        A, L:0x50a2
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        CALL      L:?sra16_x_x_a
        LD        A, XL
        AND       A, #0x3
        RET
//  264   }
//  265   /* selected port is in EXTI_CR4 */
//  266   else
//  267   {
//  268     /* Get port sensitivity */
//  269     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
??EXTI_GetPortSensitivity_0:
        LD        A, S:?b0
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, L:0x50aa
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        CALL      L:?sra16_x_x_a
        LD        A, XL
        AND       A, #0x3
//  270   }
//  271 
//  272   return((EXTI_Trigger_TypeDef)portsensitivity);
        RET
//  273 }
//  274 
//  275 /**
//  276   * @brief  Gets the external interrupt sensitivity of the selected pin.
//  277   * @param  EXTI_Pin : The pin number to access.
//  278   *         This parameter can be a value of @ref EXTI_Pin_TypeDef
//  279   * @retval EXTI_Trigger_TypeDef : The external interrupt sensitivity of the selected port.
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
//  282 {
//  283   uint8_t value = 0;
EXTI_GetPinSensitivity:
        CLR       S:?b0
//  284 
//  285   /* Check function parameters */
//  286   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
//  287 
//  288   switch (EXTI_Pin)
        CP        A, #0x0
        JREQ      L:??EXTI_GetPinSensitivity_0
        CP        A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_1
        CP        A, #0x4
        JREQ      L:??EXTI_GetPinSensitivity_2
        CP        A, #0x6
        JREQ      L:??EXTI_GetPinSensitivity_3
        CP        A, #0x10
        JREQ      L:??EXTI_GetPinSensitivity_4
        CP        A, #0x12
        JREQ      L:??EXTI_GetPinSensitivity_5
        CP        A, #0x14
        JREQ      L:??EXTI_GetPinSensitivity_6
        CP        A, #0x16
        JREQ      L:??EXTI_GetPinSensitivity_7
        JRA       L:??EXTI_GetPinSensitivity_8
//  289   {
//  290     case EXTI_Pin_0:
//  291       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
??EXTI_GetPinSensitivity_0:
        LD        A, #0x3
        AND       A, L:0x50a0
        LD        S:?b0, A
//  292       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  293     case EXTI_Pin_1:
//  294       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
??EXTI_GetPinSensitivity_1:
        LD        A, L:0x50a0
        SRL       A
        SRL       A
        AND       A, #0x3
        LD        S:?b0, A
//  295       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  296     case EXTI_Pin_2:
//  297       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
??EXTI_GetPinSensitivity_2:
        LD        A, L:0x50a0
        SWAP      A
        AND       A, #0xf
        AND       A, #0x3
        LD        S:?b0, A
//  298       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  299     case EXTI_Pin_3:
//  300       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
??EXTI_GetPinSensitivity_3:
        LD        A, L:0x50a0
        SWAP      A
        AND       A, #0xf
        SRL       A
        SRL       A
        LD        S:?b0, A
//  301       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  302     case EXTI_Pin_4:
//  303       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
??EXTI_GetPinSensitivity_4:
        LD        A, #0x3
        AND       A, L:0x50a1
        LD        S:?b0, A
//  304       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  305     case EXTI_Pin_5:
//  306       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
??EXTI_GetPinSensitivity_5:
        LD        A, L:0x50a1
        SRL       A
        SRL       A
        AND       A, #0x3
        LD        S:?b0, A
//  307       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  308     case EXTI_Pin_6:
//  309       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
??EXTI_GetPinSensitivity_6:
        LD        A, L:0x50a1
        SWAP      A
        AND       A, #0xf
        AND       A, #0x3
        LD        S:?b0, A
//  310       break;
        JRA       L:??EXTI_GetPinSensitivity_8
//  311     case EXTI_Pin_7:
//  312       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
??EXTI_GetPinSensitivity_7:
        LD        A, L:0x50a1
        SWAP      A
        AND       A, #0xf
        SRL       A
        SRL       A
        LD        S:?b0, A
//  313       break;
//  314     default:
//  315       break;
//  316   }
//  317   return((EXTI_Trigger_TypeDef)value);
??EXTI_GetPinSensitivity_8:
        LD        A, S:?b0
        RET
//  318 }
//  319 
//  320 /**
//  321   * @brief  Gets the external interrupt status.
//  322   * @param  EXTI_IT : Specifies the interrupt to read.
//  323   *         This parameter can be a value of @ref EXTI_IT_TypeDef
//  324   * @retval ITStatus : The status of the specified interrupt.
//  325   *         This parameter can be a value of @ref ITStatus.
//  326   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  327 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
//  328 {
//  329   ITStatus status = RESET;
//  330   /* Check function parameters */
//  331   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
//  332 
//  333   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
EXTI_GetITStatus:
        LDW       Y, X
        RRWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        CPW       Y, #0x100
        LD        A, XL
        JRNE      L:??EXTI_GetITStatus_0
//  334   {
//  335     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
        AND       A, L:0x50a4
        JREQ      L:??EXTI_GetITStatus_1
??EXTI_GetITStatus_2:
        LD        A, #0x1
//  336   }
//  337   else
//  338   {
//  339     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
//  340   }
//  341   return((ITStatus)status);
        RET
??EXTI_GetITStatus_0:
        AND       A, L:0x50a3
        JRNE      L:??EXTI_GetITStatus_2
??EXTI_GetITStatus_1:
        CLR       A
        RET
//  342 }
//  343 
//  344 /**
//  345   * @brief  Clears the specified interrupt pending bit
//  346   * @param  EXTI_IT : Specifies the interrupt to clear
//  347   *         This parameter can be a value of @ref EXTI_IT_TypeDef
//  348   * @retval None
//  349   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  350 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
//  351 {
//  352   uint16_t tempvalue = 0;
//  353 
//  354   /* Check function parameters */
//  355   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
//  356 
//  357   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
//  358 
//  359   if ( tempvalue == 0x0100)
EXTI_ClearITPendingBit:
        LDW       Y, X
        RRWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        CPW       Y, #0x100
        LD        A, XL
        JRNE      L:??EXTI_ClearITPendingBit_0
//  360   {
//  361     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
        LD        L:0x50a4, A
        RET
//  362   }
//  363   else
//  364   {
//  365     EXTI->SR1 = (uint8_t) (EXTI_IT);
??EXTI_ClearITPendingBit_0:
        LD        L:0x50a3, A
//  366   }
//  367 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  368 /**
//  369   * @}
//  370   */
//  371 
//  372 /**
//  373   * @}
//  374   */
//  375 
//  376 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 628 bytes in section .near_func.text
// 
// 628 bytes of CODE memory
//
//Errors: none
//Warnings: none
