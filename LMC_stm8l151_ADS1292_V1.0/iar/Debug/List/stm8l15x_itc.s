///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:39 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_itc.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_itc.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_itc.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_itc

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?sll8_a_a_b0
        EXTERN ?srl8_a_a_b0

        PUBLIC ITC_DeInit
        PUBLIC ITC_GetCPUCC
        PUBLIC ITC_GetSoftIntStatus
        PUBLIC ITC_GetSoftwarePriority
        PUBLIC ITC_SetSoftwarePriority

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_itc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_itc.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the ITC firmware functions.
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
//   22 #include "stm8l15x_itc.h"
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
//   35 /** @addtogroup ITC_Private_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Utility function used to read CC register.
//   41   * @param  None
//   42   * @retval CPU CC register value
//   43   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 uint8_t ITC_GetCPUCC(void)
//   45 {
//   46 #ifdef _COSMIC_
//   47   _asm("push cc");
//   48   _asm("pop a");
//   49   return; /* Ignore compiler warning, the returned value is in A register */
//   50 #elif defined _RAISONANCE_ /* _RAISONANCE_ */
//   51   return _getCC_();
//   52 #else /* _IAR_ */
//   53   asm("push cc");
ITC_GetCPUCC:
        push cc
//   54   asm("pop a");
        pop a
//   55   return 0;
        CLR       A
        RET
//   56 #endif /* _COSMIC_*/
//   57 }
//   58 
//   59 /**
//   60   * @}
//   61   */
//   62 
//   63 /** @addtogroup ITC_Public_Functions
//   64   * @{
//   65   */
//   66 
//   67 /**
//   68   * @brief  Deinitializes the ITC registers to their default reset value.
//   69   * @param  None
//   70   * @retval None
//   71  */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 void ITC_DeInit(void)
//   73 {
//   74   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
ITC_DeInit:
        LD        A, #0xff
        LD        L:0x7f70, A
//   75   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f71, A
//   76   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f72, A
//   77   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f73, A
//   78   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f74, A
//   79   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f75, A
//   80   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f76, A
//   81   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
        LD        L:0x7f77, A
//   82 }
        RET
//   83 
//   84 /**
//   85   * @brief  Gets the interrupt software priority bits (I1, I0) value from CPU CC register.
//   86   * @param  None
//   87   * @retval The interrupt software priority bits value.
//   88  */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   89 uint8_t ITC_GetSoftIntStatus(void)
//   90 {
//   91   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
ITC_GetSoftIntStatus:
        CALL      L:ITC_GetCPUCC
        AND       A, #0x28
        RET
//   92 }
//   93 
//   94 /**
//   95   * @brief  Gets the software priority of the specified interrupt source.
//   96   * @param  IRQn : Specifies the peripheral interrupt source.
//   97   * @retval ITC_PriorityLevel_TypeDef : Specifies the software priority of the interrupt source.
//   98  */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
//  100 {
ITC_GetSoftwarePriority:
        LD        S:?b3, A
//  101   uint8_t Value = 0;
        CLR       S:?b2
//  102   uint8_t Mask = 0;
//  103 
//  104   /* Check function parameters */
//  105   assert_param(IS_ITC_IRQ(IRQn));
//  106 
//  107   /* Define the mask corresponding to the bits position in the SPR register */
//  108   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
        AND       A, #0x3
        SLL       A
        LD        S:?b1, A
        LD        A, #0x3
        MOV       S:?b0, S:?b1
        CALL      L:?sll8_a_a_b0
        LD        S:?b0, A
//  109 
//  110   switch (IRQn)
        LD        A, S:?b3
        CP        A, #0x1
        JREQ      L:??ITC_GetSoftwarePriority_0
        CP        A, #0x2
        JREQ      L:??ITC_GetSoftwarePriority_0
        CP        A, #0x3
        JREQ      L:??ITC_GetSoftwarePriority_0
        CP        A, #0x4
        JREQ      L:??ITC_GetSoftwarePriority_1
        CP        A, #0x5
        JREQ      L:??ITC_GetSoftwarePriority_1
        CP        A, #0x6
        JREQ      L:??ITC_GetSoftwarePriority_1
        CP        A, #0x7
        JREQ      L:??ITC_GetSoftwarePriority_1
        CP        A, #0x8
        JREQ      L:??ITC_GetSoftwarePriority_2
        CP        A, #0x9
        JREQ      L:??ITC_GetSoftwarePriority_2
        CP        A, #0xa
        JREQ      L:??ITC_GetSoftwarePriority_2
        CP        A, #0xb
        JREQ      L:??ITC_GetSoftwarePriority_2
        CP        A, #0xc
        JREQ      L:??ITC_GetSoftwarePriority_3
        CP        A, #0xd
        JREQ      L:??ITC_GetSoftwarePriority_3
        CP        A, #0xe
        JREQ      L:??ITC_GetSoftwarePriority_3
        CP        A, #0xf
        JREQ      L:??ITC_GetSoftwarePriority_3
        CP        A, #0x10
        JREQ      L:??ITC_GetSoftwarePriority_4
        CP        A, #0x11
        JREQ      L:??ITC_GetSoftwarePriority_4
        CP        A, #0x12
        JREQ      L:??ITC_GetSoftwarePriority_4
        CP        A, #0x13
        JREQ      L:??ITC_GetSoftwarePriority_4
        CP        A, #0x14
        JREQ      L:??ITC_GetSoftwarePriority_5
        CP        A, #0x15
        JREQ      L:??ITC_GetSoftwarePriority_5
        CP        A, #0x16
        JREQ      L:??ITC_GetSoftwarePriority_5
        CP        A, #0x17
        JREQ      L:??ITC_GetSoftwarePriority_5
        CP        A, #0x18
        JREQ      L:??ITC_GetSoftwarePriority_6
        CP        A, #0x19
        JREQ      L:??ITC_GetSoftwarePriority_6
        CP        A, #0x1a
        JREQ      L:??ITC_GetSoftwarePriority_6
        CP        A, #0x1b
        JREQ      L:??ITC_GetSoftwarePriority_6
        CP        A, #0x1c
        JREQ      L:??ITC_GetSoftwarePriority_7
        CP        A, #0x1d
        JREQ      L:??ITC_GetSoftwarePriority_7
        JRA       L:??ITC_GetSoftwarePriority_8
//  111   {
//  112     case FLASH_IRQn:
//  113     case DMA1_CHANNEL0_1_IRQn:
//  114     case DMA1_CHANNEL2_3_IRQn:
//  115       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_0:
        LD        A, S:?b0
        AND       A, L:0x7f70
        LD        S:?b2, A
//  116       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  117 
//  118     case EXTIE_F_PVD_IRQn:
//  119 #ifdef STM8L15X_MD
//  120     case RTC_IRQn:
//  121     case EXTIB_IRQn:
//  122     case EXTID_IRQn:
//  123 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  124     case RTC_CSSLSE_IRQn:
//  125     case EXTIB_G_IRQn:
//  126     case EXTID_H_IRQn:
//  127 #endif  /* STM8L15X_MD */
//  128       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_1:
        LD        A, S:?b0
        AND       A, L:0x7f71
        LD        S:?b2, A
//  129       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  130 
//  131     case EXTI0_IRQn:
//  132     case EXTI1_IRQn:
//  133     case EXTI2_IRQn:
//  134     case EXTI3_IRQn:
//  135       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_2:
        LD        A, S:?b0
        AND       A, L:0x7f72
        LD        S:?b2, A
//  136       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  137 
//  138     case EXTI4_IRQn:
//  139     case EXTI5_IRQn:
//  140     case EXTI6_IRQn:
//  141     case EXTI7_IRQn:
//  142       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_3:
        LD        A, S:?b0
        AND       A, L:0x7f73
        LD        S:?b2, A
//  143       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  144 
//  145 
//  146     case SWITCH_CSS_BREAK_DAC_IRQn:
//  147     case ADC1_COMP_IRQn:
//  148 #ifdef STM8L15X_MD
//  149     case LCD_IRQn:
//  150     case TIM2_UPD_OVF_TRG_BRK_IRQn:
//  151 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  152     case LCD_AES_IRQn:
//  153     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
//  154 #endif  /* STM8L15X_MD */
//  155       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_4:
        LD        A, S:?b0
        AND       A, L:0x7f74
        LD        S:?b2, A
//  156       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  157 
//  158     case TIM1_UPD_OVF_TRG_IRQn:
//  159 #ifdef STM8L15X_MD
//  160     case TIM2_CC_IRQn:
//  161     case TIM3_UPD_OVF_TRG_BRK_IRQn :
//  162     case TIM3_CC_IRQn:
//  163 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  164     case TIM2_CC_USART2_RX_IRQn:
//  165     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
//  166     case TIM3_CC_USART3_RX_IRQn:
//  167 #endif  /* STM8L15X_MD */
//  168       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_5:
        LD        A, S:?b0
        AND       A, L:0x7f75
        LD        S:?b2, A
//  169       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  170 
//  171     case TIM1_CC_IRQn:
//  172     case TIM4_UPD_OVF_TRG_IRQn:
//  173     case SPI1_IRQn:
//  174 #ifdef STM8L15X_MD
//  175     case USART1_TX_IRQn:
//  176 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  177     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
//  178 #endif  /* STM8L15X_MD */
//  179       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_6:
        LD        A, S:?b0
        AND       A, L:0x7f76
        LD        S:?b2, A
//  180       break;
        JRA       L:??ITC_GetSoftwarePriority_8
//  181 
//  182 #ifdef STM8L15X_MD
//  183     case USART1_RX_IRQn:
//  184     case I2C1_IRQn:
//  185 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  186     case USART1_RX_TIM5_CC_IRQn:
//  187     case I2C1_SPI2_IRQn:
//  188 #endif  /* STM8L15X_MD */
//  189       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_7:
        LD        A, S:?b0
        AND       A, L:0x7f77
        LD        S:?b2, A
//  190       break;
//  191 
//  192     default:
//  193       break;
//  194   }
//  195 
//  196   Value >>= (uint8_t)((IRQn % 4u) * 2u);
//  197 
//  198   return((ITC_PriorityLevel_TypeDef)Value);
??ITC_GetSoftwarePriority_8:
        MOV       S:?b0, S:?b1
        LD        A, S:?b2
        JP        L:?srl8_a_a_b0
//  199 
//  200 }
//  201 
//  202 /**
//  203   * @brief  Sets the software priority of the specified interrupt source.
//  204   * @note   - The modification of the software priority is only possible when
//  205   *         the interrupts are disabled.
//  206   *         - The normal behavior is to disable the interrupt before calling
//  207   *         this function, and re-enable it after.
//  208   *         - The priority level 0 cannot be set (see product specification
//  209   *         for more details).
//  210   * @param  IRQn : Specifies the peripheral interrupt source.
//  211   * @param  ITC_PriorityLevel : Specifies the software priority value to set,
//  212   *         can be a value of @ref  ITC_PriorityLevel_TypeDef .
//  213   * @retval None
//  214   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  215 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
//  216 {
ITC_SetSoftwarePriority:
        LD        S:?b3, A
        MOV       S:?b4, S:?b0
//  217   uint8_t Mask = 0;
//  218   uint8_t NewPriority = 0;
//  219 
//  220   /* Check function parameters */
//  221   assert_param(IS_ITC_IRQ(IRQn));
//  222   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
//  223 
//  224   /* Check if interrupts are disabled */
//  225   assert_param(IS_ITC_INTERRUPTS_DISABLED);
//  226 
//  227   /* Define the mask corresponding to the bits position in the SPR register */
//  228   /* The mask is reversed in order to clear the 2 bits after more easily */
//  229   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
        AND       A, #0x3
        SLL       A
        LD        S:?b1, A
        LD        A, #0x3
        MOV       S:?b0, S:?b1
        CALL      L:?sll8_a_a_b0
        LD        S:?b2, A
        CPL       S:?b2
//  230   /* Define the new priority to write */
//  231   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
        MOV       S:?b0, S:?b1
        LD        A, S:?b4
        CALL      L:?sll8_a_a_b0
        LD        S:?b0, A
//  232 
//  233   switch (IRQn)
        LD        A, S:?b3
        CP        A, #0x1
        JREQ      L:??ITC_SetSoftwarePriority_0
        CP        A, #0x2
        JREQ      L:??ITC_SetSoftwarePriority_0
        CP        A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_0
        CP        A, #0x4
        JREQ      L:??ITC_SetSoftwarePriority_1
        CP        A, #0x5
        JREQ      L:??ITC_SetSoftwarePriority_1
        CP        A, #0x6
        JREQ      L:??ITC_SetSoftwarePriority_1
        CP        A, #0x7
        JREQ      L:??ITC_SetSoftwarePriority_1
        CP        A, #0x8
        JREQ      L:??ITC_SetSoftwarePriority_2
        CP        A, #0x9
        JREQ      L:??ITC_SetSoftwarePriority_2
        CP        A, #0xa
        JREQ      L:??ITC_SetSoftwarePriority_2
        CP        A, #0xb
        JREQ      L:??ITC_SetSoftwarePriority_2
        CP        A, #0xc
        JREQ      L:??ITC_SetSoftwarePriority_3
        CP        A, #0xd
        JREQ      L:??ITC_SetSoftwarePriority_3
        CP        A, #0xe
        JREQ      L:??ITC_SetSoftwarePriority_3
        CP        A, #0xf
        JREQ      L:??ITC_SetSoftwarePriority_3
        CP        A, #0x10
        JREQ      L:??ITC_SetSoftwarePriority_4
        CP        A, #0x11
        JREQ      L:??ITC_SetSoftwarePriority_4
        CP        A, #0x12
        JREQ      L:??ITC_SetSoftwarePriority_4
        CP        A, #0x13
        JREQ      L:??ITC_SetSoftwarePriority_4
        CP        A, #0x14
        JREQ      L:??ITC_SetSoftwarePriority_5
        CP        A, #0x15
        JREQ      L:??ITC_SetSoftwarePriority_5
        CP        A, #0x16
        JREQ      L:??ITC_SetSoftwarePriority_5
        CP        A, #0x17
        JREQ      L:??ITC_SetSoftwarePriority_5
        CP        A, #0x18
        JREQ      L:??ITC_SetSoftwarePriority_6
        CP        A, #0x19
        JREQ      L:??ITC_SetSoftwarePriority_6
        CP        A, #0x1a
        JREQ      L:??ITC_SetSoftwarePriority_6
        CP        A, #0x1b
        JREQ      L:??ITC_SetSoftwarePriority_6
        CP        A, #0x1c
        JREQ      L:??ITC_SetSoftwarePriority_7
        CP        A, #0x1d
        JREQ      L:??ITC_SetSoftwarePriority_7
        RET
//  234   {
//  235     case FLASH_IRQn:
//  236     case DMA1_CHANNEL0_1_IRQn:
//  237     case DMA1_CHANNEL2_3_IRQn:
//  238       ITC->ISPR1 &= Mask;
??ITC_SetSoftwarePriority_0:
        LD        A, S:?b2
        AND       A, L:0x7f70
        LD        L:0x7f70, A
//  239       ITC->ISPR1 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f70
        LD        L:0x7f70, A
//  240       break;
        RET
//  241 
//  242     case EXTIE_F_PVD_IRQn:
//  243 #ifdef STM8L15X_MD
//  244     case RTC_IRQn:
//  245     case EXTIB_IRQn:
//  246     case EXTID_IRQn:
//  247 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  248     case RTC_CSSLSE_IRQn:
//  249     case EXTIB_G_IRQn:
//  250     case EXTID_H_IRQn:
//  251 #endif  /* STM8L15X_MD */
//  252       ITC->ISPR2 &= Mask;
??ITC_SetSoftwarePriority_1:
        LD        A, S:?b2
        AND       A, L:0x7f71
        LD        L:0x7f71, A
//  253       ITC->ISPR2 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f71
        LD        L:0x7f71, A
//  254       break;
        RET
//  255 
//  256     case EXTI0_IRQn:
//  257     case EXTI1_IRQn:
//  258     case EXTI2_IRQn:
//  259     case EXTI3_IRQn:
//  260       ITC->ISPR3 &= Mask;
??ITC_SetSoftwarePriority_2:
        LD        A, S:?b2
        AND       A, L:0x7f72
        LD        L:0x7f72, A
//  261       ITC->ISPR3 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f72
        LD        L:0x7f72, A
//  262       break;
        RET
//  263 
//  264     case EXTI4_IRQn:
//  265     case EXTI5_IRQn:
//  266     case EXTI6_IRQn:
//  267     case EXTI7_IRQn:
//  268       ITC->ISPR4 &= Mask;
??ITC_SetSoftwarePriority_3:
        LD        A, S:?b2
        AND       A, L:0x7f73
        LD        L:0x7f73, A
//  269       ITC->ISPR4 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f73
        LD        L:0x7f73, A
//  270       break;
        RET
//  271 
//  272     case SWITCH_CSS_BREAK_DAC_IRQn:
//  273     case ADC1_COMP_IRQn:
//  274 #ifdef STM8L15X_MD
//  275     case LCD_IRQn:
//  276     case TIM2_UPD_OVF_TRG_BRK_IRQn:
//  277 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  278     case LCD_AES_IRQn:
//  279     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
//  280 #endif  /* STM8L15X_MD */
//  281       ITC->ISPR5 &= Mask;
??ITC_SetSoftwarePriority_4:
        LD        A, S:?b2
        AND       A, L:0x7f74
        LD        L:0x7f74, A
//  282       ITC->ISPR5 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f74
        LD        L:0x7f74, A
//  283       break;
        RET
//  284 
//  285     case TIM1_UPD_OVF_TRG_IRQn:
//  286 #ifdef STM8L15X_MD
//  287     case TIM2_CC_IRQn:
//  288     case TIM3_UPD_OVF_TRG_BRK_IRQn :
//  289     case TIM3_CC_IRQn:
//  290 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  291     case TIM2_CC_USART2_RX_IRQn:
//  292     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
//  293     case TIM3_CC_USART3_RX_IRQn:
//  294 #endif  /* STM8L15X_MD */
//  295       ITC->ISPR6 &= Mask;
??ITC_SetSoftwarePriority_5:
        LD        A, S:?b2
        AND       A, L:0x7f75
        LD        L:0x7f75, A
//  296       ITC->ISPR6 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f75
        LD        L:0x7f75, A
//  297       break;
        RET
//  298 
//  299 
//  300     case TIM1_CC_IRQn:
//  301     case TIM4_UPD_OVF_TRG_IRQn:
//  302     case SPI1_IRQn:
//  303 #ifdef STM8L15X_MD
//  304     case USART1_TX_IRQn:
//  305 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  306     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
//  307 #endif  /* STM8L15X_MD */
//  308       ITC->ISPR7 &= Mask;
??ITC_SetSoftwarePriority_6:
        LD        A, S:?b2
        AND       A, L:0x7f76
        LD        L:0x7f76, A
//  309       ITC->ISPR7 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f76
        LD        L:0x7f76, A
//  310       break;
        RET
//  311 
//  312 #ifdef STM8L15X_MD
//  313     case USART1_RX_IRQn:
//  314     case I2C1_IRQn:
//  315 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
//  316     case USART1_RX_TIM5_CC_IRQn:
//  317     case I2C1_SPI2_IRQn:
//  318 #endif  /* STM8L15X_MD */
//  319       ITC->ISPR8 &= Mask;
??ITC_SetSoftwarePriority_7:
        LD        A, S:?b2
        AND       A, L:0x7f77
        LD        L:0x7f77, A
//  320       ITC->ISPR8 |= NewPriority;
        LD        A, S:?b0
        OR        A, L:0x7f77
        LD        L:0x7f77, A
//  321       break;
//  322 
//  323     default:
//  324       break;
//  325   }
//  326 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  327 
//  328 /**
//  329   * @}
//  330   */
//  331 
//  332 /**
//  333   * @}
//  334   */
//  335 
//  336 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 541 bytes in section .near_func.text
// 
// 541 bytes of CODE memory
//
//Errors: none
//Warnings: none
