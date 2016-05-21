///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:52 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_gpio.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_gpio.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_gpio.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_gpio

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b4
        EXTERN ?w1

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ExternalPullUpConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_ToggleBits
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_gpio.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the GPIO firmware functions.
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
//   22 #include "stm8l15x_gpio.h"
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
//   36   * @addtogroup GPIO_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
//   42   * @param  GPIOx: Select the GPIO peripheral number (x = A to I).
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
//   46 {
//   47   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
GPIO_DeInit:
        LDW       Y, X
        ADDW      Y, #0x4
        CLR       A
        LD        (Y), A
//   48   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
        LD        (X), A
//   49   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//   50   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
        ADDW      X, #0x3
        LD        (X), A
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Initializes the GPIOx according to the specified parameters.
//   55   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//   56   * @param  GPIO_Pin : This parameter contains the pin number, it can be any value
//   57   *         of the @ref GPIO_Pin_TypeDef enumeration.
//   58   * @param  GPIO_Mode : This parameter can be a value of the
//   59   *         @Ref GPIO_Mode_TypeDef enumeration.
//   60   * @retval None
//   61   */
//   62 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   63 void GPIO_Init(GPIO_TypeDef* GPIOx,
//   64                uint8_t GPIO_Pin,
//   65                GPIO_Mode_TypeDef GPIO_Mode)
//   66 {
GPIO_Init:
        LD        S:?b4, A
//   67   /*----------------------*/
//   68   /* Check the parameters */
//   69   /*----------------------*/
//   70 
//   71   assert_param(IS_GPIO_MODE(GPIO_Mode));
//   72   assert_param(IS_GPIO_PIN(GPIO_Pin));
//   73 
//   74   /* Reset crresponding bit to GPIO_Pin in CR2 register */
//   75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
        MOV       S:?b1, S:?b4
        CPL       S:?b1
        LDW       Y, X
        ADDW      Y, #0x4
        LDW       S:?w1, Y
        LD        A, S:?b1
        AND       A, [S:?w1.w]
        LD        [S:?w1.w], A
//   76 
//   77   /*-----------------------------*/
//   78   /* Input/Output mode selection */
//   79   /*-----------------------------*/
//   80 
//   81   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
        LD        A, S:?b0
        AND       A, #0x80
        JREQ      L:??GPIO_Init_0
//   82   {
//   83     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
        LD        A, S:?b0
        AND       A, #0x10
        JREQ      L:??GPIO_Init_1
//   84     {
//   85       GPIOx->ODR |= GPIO_Pin;
        LD        A, S:?b4
        OR        A, (X)
        LD        (X), A
        JRA       L:??GPIO_Init_2
//   86     } else /* Low level */
//   87     {
//   88       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_1:
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//   89     }
//   90     /* Set Output mode */
//   91     GPIOx->DDR |= GPIO_Pin;
??GPIO_Init_2:
        LDW       Y, X
        ADDW      Y, #0x2
        LD        A, S:?b4
        OR        A, (Y)
        LD        (Y), A
        JRA       L:??GPIO_Init_3
//   92   } else /* Input mode */
//   93   {
//   94     /* Set Input mode */
//   95     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_0:
        LDW       Y, X
        ADDW      Y, #0x2
        LD        A, S:?b1
        AND       A, (Y)
        LD        (Y), A
//   96   }
//   97 
//   98   /*------------------------------------------------------------------------*/
//   99   /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
//  100   /*------------------------------------------------------------------------*/
//  101 
//  102   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
??GPIO_Init_3:
        ADDW      X, #0x3
        LD        A, S:?b0
        AND       A, #0x40
        JREQ      L:??GPIO_Init_4
//  103   {
//  104     GPIOx->CR1 |= GPIO_Pin;
        LD        A, S:?b4
        OR        A, (X)
        LD        (X), A
        JRA       L:??GPIO_Init_5
//  105   } else /* Float or Open-Drain */
//  106   {
//  107     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_4:
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  108   }
//  109 
//  110   /*-----------------------------------------------------*/
//  111   /* Interrupt (Input) or Slope (Output) modes selection */
//  112   /*-----------------------------------------------------*/
//  113 
//  114   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
??GPIO_Init_5:
        LD        A, S:?b0
        AND       A, #0x20
        JREQ      L:??GPIO_Init_6
//  115   {
//  116     GPIOx->CR2 |= GPIO_Pin;
        LD        A, S:?b4
        OR        A, [S:?w1.w]
        LD        [S:?w1.w], A
        RET
//  117   } else /* No external interrupt or No slope control */
//  118   {
//  119     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_6:
        LD        A, S:?b1
        AND       A, [S:?w1.w]
        LD        [S:?w1.w], A
//  120   }
//  121 
//  122 }
        RET
//  123 
//  124 /**
//  125   * @brief  Writes data to the specified GPIO data port.
//  126   * @note   The port must be configured in output mode.
//  127   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  128   * @param  GPIO_PortVal : Specifies the value to be written to the port output
//  129   *         data register.
//  130   * @retval None
//  131   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  132 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
//  133 {
//  134   GPIOx->ODR = GPIO_PortVal;
GPIO_Write:
        LD        (X), A
//  135 }
        RET
//  136 
//  137 /**
//  138   * @brief  Sets or clears the selected data port bit.
//  139   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  140   * @param  GPIO_Pin: Specifies the port bit to be written.
//  141   *         This parameter can be a value of GPIO_Pin_TypeDef enumeration.
//  142   * @param  GPIO_BitVal: specifies the desired status to be written.
//  143   *         This parameter can be a value of @ref BitAction enumeration.
//  144   * @retval None
//  145   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  146 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
//  147 {
GPIO_WriteBit:
        LD        S:?b1, A
//  148   /* Check the parameters */
//  149   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  150   assert_param(IS_STATE_VALUE(GPIO_BitVal));
//  151 
//  152   if (GPIO_BitVal != RESET)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??GPIO_WriteBit_0
//  153   {
//  154     GPIOx->ODR |= GPIO_Pin;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        RET
//  155 
//  156   }
//  157   else
//  158   {
//  159     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
??GPIO_WriteBit_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  160   }
//  161 }
        RET
//  162 
//  163 /**
//  164   * @brief  Writes high level to the specified GPIO pins.
//  165   * @note   The port must be configured in output mode.
//  166   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  167   * @param  GPIO_Pin : Specifies the pins to be turned high.
//  168   * @retval None
//  169   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  170 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  171 {
//  172   GPIOx->ODR |= GPIO_Pin;
GPIO_SetBits:
        OR        A, (X)
        LD        (X), A
//  173 }
        RET
//  174 
//  175 /**
//  176   * @brief  Writes low level to the specified GPIO pins.
//  177   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  178   * @param  GPIO_Pin : Specifies the pins to be turned low
//  179   * @retval None
//  180   * @par    Required preconditions:
//  181   *   The port must be configured in output mode.
//  182   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  183 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  184 {
//  185   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
GPIO_ResetBits:
        CPL       A
        AND       A, (X)
        LD        (X), A
//  186 }
        RET
//  187 
//  188 /**
//  189   * @brief  Toggles the specified GPIO pins.
//  190   * @note   The port must be configured in output mode.
//  191   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  192   * @param  GPIO_Pin : Specifies the pins to be toggled.
//  193   * @retval None
//  194   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  195 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  196 {
//  197   GPIOx->ODR ^= GPIO_Pin;
GPIO_ToggleBits:
        XOR       A, (X)
        LD        (X), A
//  198 }
        RET
//  199 
//  200 /**
//  201   * @brief  Reads the specified GPIO input data port.
//  202   * @note   The port must be configured in input mode.
//  203   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  204   * @retval The GPIOx input data port value.
//  205   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  206 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
//  207 {
//  208   return ((uint8_t)GPIOx->IDR);
GPIO_ReadInputData:
        INCW      X
        LD        A, (X)
        RET
//  209 }
//  210 
//  211 /**
//  212   * @brief  Reads the specified GPIO output data port.
//  213   * @note   The port must be configured in input mode.
//  214   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  215   * @retval The GPIOx  output data port value.
//  216   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  217 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
//  218 {
//  219   return ((uint8_t)GPIOx->ODR);
GPIO_ReadOutputData:
        LD        A, (X)
        RET
//  220 }
//  221 
//  222 /**
//  223   * @brief  Reads the specified GPIO input data pin.
//  224   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  225   * @param  GPIO_Pin : Specifies the pin number.
//  226   * @retval BitStatus : GPIO input pin status.
//  227   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  228 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
//  229 {
//  230   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
GPIO_ReadInputDataBit:
        INCW      X
        AND       A, (X)
        JREQ      L:??GPIO_ReadInputDataBit_0
        LD        A, #0x1
        RET
??GPIO_ReadInputDataBit_0:
        CLR       A
        RET
//  231 }
//  232 
//  233 /**
//  234   * @brief  Reads the specified GPIO Output data pin.
//  235   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  236   * @param  GPIO_Pin : Specifies the pin number
//  237   * @retval BitStatus : GPIO output pin status.
//  238   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  239 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
//  240 {
//  241   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
GPIO_ReadOutputDataBit:
        AND       A, (X)
        JREQ      L:??GPIO_ReadOutputDataBit_0
        LD        A, #0x1
        RET
??GPIO_ReadOutputDataBit_0:
        CLR       A
        RET
//  242 }
//  243 
//  244 /**
//  245   * @brief  Configures the external pull-up on GPIOx pins.
//  246   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  247   * @param  GPIO_Pin : Specifies the pin number
//  248   * @param  NewState : The new state of the pull up pin.
//  249   * @retval None
//  250   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  251 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
//  252 {
GPIO_ExternalPullUpConfig:
        LD        S:?b1, A
//  253   /* Check the parameters */
//  254   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  255   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  256 
//  257   if (NewState != DISABLE) /* External Pull-Up Set*/
        ADDW      X, #0x3
        CLR       A
        CP        A, S:?b0
        JREQ      L:??GPIO_ExternalPullUpConfig_0
//  258   {
//  259     GPIOx->CR1 |= GPIO_Pin;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        RET
//  260   } else /* External Pull-Up Reset*/
//  261   {
//  262     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_ExternalPullUpConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  263   }
//  264 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  265 
//  266 /**
//  267   * @}
//  268   */
//  269 
//  270 /**
//  271   * @}
//  272   */
//  273 
//  274 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 213 bytes in section .near_func.text
// 
// 213 bytes of CODE memory
//
//Errors: none
//Warnings: none
