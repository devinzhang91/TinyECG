///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:50 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_syscfg.c     /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_syscfg.c -e  /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_syscfg. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_syscfg

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?sll16_x_x_a

        PUBLIC SYSCFG_REMAPDMAChannelConfig
        PUBLIC SYSCFG_REMAPDeInit
        PUBLIC SYSCFG_REMAPPinConfig
        PUBLIC SYSCFG_RIAnalogSwitchConfig
        PUBLIC SYSCFG_RIDeInit
        PUBLIC SYSCFG_RIIOSwitchConfig
        PUBLIC SYSCFG_RIResistorConfig
        PUBLIC SYSCFG_RITIMInputCaptureConfig

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_syscfg.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_syscfg.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the SYSCFG firmware functions.
//    8   ******************************************************************************
//    9   *
//   10   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   11   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   12   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   13   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   14   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   15   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   16   *
//   17   * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
//   18   * @image html logo.bmp@ref
//   19   ******************************************************************************
//   20   */
//   21 
//   22 /* Includes ------------------------------------------------------------------*/
//   23 #include "stm8l15x_syscfg.h"
//   24 
//   25 /** @addtogroup STM8L15x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private define ------------------------------------------------------------*/
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 /* Private functions ---------------------------------------------------------*/
//   35 
//   36 /**
//   37   * @addtogroup SYSCFG_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 /**
//   42   * @brief  Deinitializes the RI registers to their default reset values.
//   43   * @param  None
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void SYSCFG_RIDeInit(void)
//   47 {
//   48   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
SYSCFG_RIDeInit:
        CLR       A
        LD        L:0x5431, A
//   49   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
        LD        L:0x5432, A
//   50   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
        LD        L:0x5439, A
//   51   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
        LD        L:0x543a, A
//   52   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
        LD        L:0x543b, A
//   53   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
        LD        L:0x543d, A
//   54   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
        LD        L:0x543e, A
//   55   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
        LD        L:0x543f, A
//   56 }
        RET
//   57 
//   58 /**
//   59   * @brief  Configures the routing interface to select which Input Output pin
//   60   *         to be routed to TIM1 Input Capture.
//   61   * @param  RI_InputCapture: selects the TIM1 input capture2 RI_InputCapture_IC2
//   62   *         or the TIM1 input capture3 RI_InputCapture_IC3
//   63   * @param  RI_InputCaptureRouting : selects the value to set in TIM1 Input Capture
//   64   *         routing register ICRx and can be from RI_InputCaptureRouting_0 to
//   65   *         RI_InputCaptureRouting_22.
//   66   * @retval None.
//   67   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   68 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
//   69                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
//   70 {
//   71   /* Check the parameters */
//   72   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
//   73   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
//   74 
//   75   /* Check whether Input Capture 2 is selected */
//   76   if (RI_InputCapture == RI_InputCapture_IC2)
SYSCFG_RITIMInputCaptureConfig:
        CP        A, #0x2
        JRNE      L:??SYSCFG_RITIMInputCaptureConfig_0
//   77   {
//   78     /* Set the value in ICR1 register to route TIM input Capture 2 */
//   79     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
        LD        A, S:?b0
        LD        L:0x5431, A
        RET
//   80   }
//   81 
//   82   else /* The Input Capture 3 is selected */
//   83   {
//   84     /* Set the value in ICR2 register to route TIM input capture 3 */
//   85     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
??SYSCFG_RITIMInputCaptureConfig_0:
        LD        A, S:?b0
        LD        L:0x5432, A
//   86   }
//   87 }
        RET
//   88 
//   89 /**
//   90   * @brief  Enables or disables the Routing Interface Analog switch.
//   91   * @param  RI_AnalogSwitch : can be one of @ref RI_AnalogSwitch_TypeDef
//   92   * @param  NewState : new state of the analog switch.
//   93   *         This parameter can be ENABLE or DISABLE.
//   94   * @retval None
//   95   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   96 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
//   97                                  FunctionalState NewState)
//   98 {
SYSCFG_RIAnalogSwitchConfig:
        LD        S:?b1, A
//   99   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
//  100 
//  101   /* Check the parameters */
//  102   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
//  103   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  104 
//  105   /* Get the analog switch register ASCR1 or ASCR2 */
//  106   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
        AND       A, #0xf0
        LD        S:?b2, A
//  107 
//  108   /* Get the analog switch bit index in ASCRx register */
//  109   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
        LD        A, S:?b1
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SYSCFG_RIAnalogSwitchConfig_0
//  110 
//  111   if (NewState != DISABLE)
//  112   {
//  113     if (AnalogSwitchRegister == (uint8_t) 0x10)
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIAnalogSwitchConfig_1
//  114     {
//  115       /* Enable the analog switch */
//  116       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
        LD        A, S:?b1
        OR        A, L:0x543d
        LD        L:0x543d, A
        RET
//  117     }
//  118     else
//  119     {
//  120       /* Enable the analog switch */
//  121       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
??SYSCFG_RIAnalogSwitchConfig_1:
        LD        A, S:?b1
        OR        A, L:0x543e
        LD        L:0x543e, A
        RET
//  122     }
//  123   }
//  124   else
//  125   {
//  126     if (AnalogSwitchRegister == (uint8_t) 0x10)
??SYSCFG_RIAnalogSwitchConfig_0:
        CPL       S:?b1
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIAnalogSwitchConfig_2
//  127     {
//  128       /* Disable the analog switch */
//  129       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
        LD        A, S:?b1
        AND       A, L:0x543d
        LD        L:0x543d, A
        RET
//  130     }
//  131     else
//  132     {
//  133       /* Disable the analog switch */
//  134       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
??SYSCFG_RIAnalogSwitchConfig_2:
        LD        A, S:?b1
        AND       A, L:0x543e
        LD        L:0x543e, A
//  135     }
//  136   }
//  137 }
        RET
//  138 
//  139 /**
//  140   * @brief  Closes or Opens the routing interface Input Output switchs.
//  141   * @param  RI_IOSwitch : can be one of RI_IOSwitch_1..RI_IOSwitch_24
//  142   * @param  NewState : new state of the Input Output Switch.
//  143   *         This parameter can be ENABLE or DISABLE.
//  144   * @retval None.
//  145   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  146 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
//  147                              FunctionalState NewState)
//  148 {
SYSCFG_RIIOSwitchConfig:
        LD        S:?b2, A
//  149   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
//  150 
//  151   /* Check the parameters */
//  152   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
//  153   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  154 
//  155   /* Get the Input Output switch bit index in IOSRx register */
//  156   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
        AND       A, #0xf
        LD        S:?b1, A
//  157 
//  158   /* Get the Input Output switch register IOSR1, IOSR2 or IOSR3 */
//  159   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
        LD        A, S:?b2
        AND       A, #0xf0
        LD        S:?b2, A
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIIOSwitchConfig_0
//  160 
//  161   /* Check whether the Input Output switch control bit is in the IOSR1 register */
//  162   if (IOSwitchRegsiter == (uint8_t) 0x10)
//  163   {
//  164     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_1
//  165     {
//  166       /* Close the Input Output switch */
//  167       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        LD        A, S:?b1
        OR        A, L:0x5439
        LD        L:0x5439, A
        RET
//  168     }
//  169     else
//  170     {
//  171       /* Open the Input Output switch */
//  172       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_1:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5439
        LD        L:0x5439, A
        RET
//  173     }
//  174   }
//  175 
//  176   /* Check whether the Input Output switch control bit is in the IOSR2 register */
//  177   else if (IOSwitchRegsiter == (uint8_t) 0x20)
??SYSCFG_RIIOSwitchConfig_0:
        CP        A, #0x20
        JRNE      L:??SYSCFG_RIIOSwitchConfig_2
//  178   {
//  179     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_3
//  180     {
//  181       /* Close the Input Output switch */
//  182       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        LD        A, S:?b1
        OR        A, L:0x543a
        LD        L:0x543a, A
        RET
//  183     }
//  184     else
//  185     {
//  186       /* Open the Input Output switch */
//  187       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_3:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x543a
        LD        L:0x543a, A
        RET
//  188     }
//  189   }
//  190 
//  191   /* The Input Output switch control bit is in the IOSR3 register */
//  192   else
//  193   {
//  194     if (NewState != DISABLE)
??SYSCFG_RIIOSwitchConfig_2:
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_4
//  195     {
//  196       /* Close the Input Output switch */
//  197       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        LD        A, S:?b1
        OR        A, L:0x543b
        LD        L:0x543b, A
        RET
//  198     }
//  199     else
//  200     {
//  201       /* Open the Input Output switch */
//  202       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_4:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x543b
        LD        L:0x543b, A
//  203     }
//  204   }
//  205 }
        RET
//  206 
//  207 /**
//  208   * @brief  Configures the Pull-up and Pull-down Resistors
//  209   * @param  RI_Resistor : selects the resistor to connect,
//  210   *         This parameter can be a value of @ref RI_Resistor_TypeDef
//  211   * @retval None
//  212   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  213 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
//  214 {
SYSCFG_RIResistorConfig:
        LD        S:?b1, A
//  215   /* Check the parameters */
//  216   assert_param(IS_RI_RESISTOR(RI_Resistor));
//  217   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  218 
//  219   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SYSCFG_RIResistorConfig_0
//  220   {
//  221     /* Enable the resistor */
//  222     RI->RCR |= (uint8_t) RI_Resistor;
        LD        A, S:?b1
        OR        A, L:0x543f
        LD        L:0x543f, A
        RET
//  223   }
//  224   else
//  225   {
//  226     /* Disable the Resistor */
//  227     RI->RCR &= (uint8_t) (~RI_Resistor);
??SYSCFG_RIResistorConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x543f
        LD        L:0x543f, A
//  228   }
//  229 }
        RET
//  230 
//  231 /**
//  232   * @brief  Deinitializes the Remapping registers to their default reset values.
//  233   * @param  None
//  234   * @retval None
//  235   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  236 void SYSCFG_REMAPDeInit(void)
//  237 {
//  238   /*!< Set RMPCR1 to reset value */
//  239   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
SYSCFG_REMAPDeInit:
        LD        A, #0xc
        LD        L:0x509e, A
//  240 
//  241   /*!< Set RMPCR2 to reset value */
//  242   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
        CLR       A
        LD        L:0x509f, A
//  243 
//  244   /*!< Set RMPCR3 to reset value */
//  245   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
        LD        L:0x509d, A
//  246 }
        RET
//  247 
//  248 /**
//  249   * @brief  Changes the mapping of the specified pins.
//  250   * @param  REMAP_Pin: selects the pin to remap.
//  251   *         This parameter can be a value of @ref REMAP_Pin_TypeDef
//  252   * @param  NewState: This parameter can be ENABLE or DISABLE.
//  253   * @retval None
//  254   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  255 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
//  256 {
SYSCFG_REMAPPinConfig:
        LDW       Y, X
        LD        S:?b0, A
//  257   uint8_t regindex = 0;
//  258   /* Check the parameters */
//  259   assert_param(IS_REMAP_PIN(REMAP_Pin));
//  260   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  261 
//  262   /* Read register index */
//  263   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
//  264 
//  265   /* Check if REMAP_Pin is in RMPCR1 register */
//  266   if (regindex == 0x01)
        CP        A, #0x1
        JRNE      L:??SYSCFG_REMAPPinConfig_0
//  267   {
//  268     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
        LD        A, YL
        SWAP      A
        AND       A, #0xf0
        OR        A, #0xf
        AND       A, L:0x509e
        LD        L:0x509e, A
//  269     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_1
//  270     {
//  271       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
        LD        A, YL
        AND       A, #0xf0
        OR        A, L:0x509e
        LD        L:0x509e, A
        RET
//  272     }
//  273   }
//  274   /* Check if REMAP_Pin is in RMPCR2 register */
//  275   else if (regindex == 0x02)
??SYSCFG_REMAPPinConfig_0:
        CP        A, #0x2
        JRNE      L:??SYSCFG_REMAPPinConfig_2
//  276   {
//  277     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        LD        A, YL
        JREQ      L:??SYSCFG_REMAPPinConfig_3
//  278     {
//  279       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
        OR        A, L:0x509f
        LD        L:0x509f, A
        RET
//  280     }
//  281     else
//  282     {
//  283       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
??SYSCFG_REMAPPinConfig_3:
        CPL       A
        AND       A, L:0x509f
        LD        L:0x509f, A
        RET
//  284     }
//  285   }
//  286   /* REMAP_Pin is in RMPCR3 register */
//  287   else
//  288   {
//  289     if (NewState != DISABLE)
??SYSCFG_REMAPPinConfig_2:
        CLR       A
        CP        A, S:?b0
        LD        A, YL
        JREQ      L:??SYSCFG_REMAPPinConfig_4
//  290     {
//  291       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
        OR        A, L:0x509d
        LD        L:0x509d, A
        RET
//  292     }
//  293     else
//  294     {
//  295       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
??SYSCFG_REMAPPinConfig_4:
        CPL       A
        AND       A, L:0x509d
        LD        L:0x509d, A
//  296     }
//  297   }
//  298 }
??SYSCFG_REMAPPinConfig_1:
        RET
//  299 
//  300 /**
//  301   * @brief  Remaps the DMA Channel to the specific peripheral (ADC or TIM4)
//  302   * @param  REMAP_DMAChannel: specifies the DMA Channel to remap.
//  303   *         This parameter can be one of @ref REMAP_DMAChannel_TypeDef
//  304   * @retval None
//  305   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  306 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
//  307 {
SYSCFG_REMAPDMAChannelConfig:
        LD        S:?b0, A
//  308   /* Check the parameters */
//  309   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
//  310 
//  311   /* Check if the TIM4 DMA channel is selected: bits 4 --> 7 are set */
//  312   if ((REMAP_DMAChannel & 0xF0) != RESET)
        AND       A, #0xf0
        JREQ      L:??SYSCFG_REMAPDMAChannelConfig_0
//  313   {
//  314     /* Reset the TIM4 DMA channels */
//  315     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
        LD        A, #0xf3
        AND       A, L:0x509e
        LD        L:0x509e, A
        JRA       L:??SYSCFG_REMAPDMAChannelConfig_1
//  316   }
//  317   /* ADC DMA channel is selected: bits 4 --> 7 are reset */
//  318   else
//  319   {
//  320     /* Reset the ADC DMA channels */
//  321     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
??SYSCFG_REMAPDMAChannelConfig_0:
        LD        A, #0xfc
        AND       A, L:0x509e
        LD        L:0x509e, A
//  322   }
//  323   /* Set the DMA Channels remapping */
//  324   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
??SYSCFG_REMAPDMAChannelConfig_1:
        LD        A, S:?b0
        AND       A, #0xf
        OR        A, L:0x509e
        LD        L:0x509e, A
//  325 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  326 
//  327 /**
//  328   * @}
//  329   */
//  330 
//  331 /**
//  332   * @}
//  333   */
//  334 
//  335 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 391 bytes in section .near_func.text
// 
// 391 bytes of CODE memory
//
//Errors: none
//Warnings: none
