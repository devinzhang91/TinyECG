///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:51 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_comp.c       /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_comp.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_comp.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_comp

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2

        PUBLIC COMP_ClearFlag
        PUBLIC COMP_ClearITPendingBit
        PUBLIC COMP_DeInit
        PUBLIC COMP_EdgeConfig
        PUBLIC COMP_GetFlagStatus
        PUBLIC COMP_GetITStatus
        PUBLIC COMP_GetOutputLevel
        PUBLIC COMP_ITConfig
        PUBLIC COMP_Init
        PUBLIC COMP_SchmittTriggerCmd
        PUBLIC COMP_TriggerConfig
        PUBLIC COMP_VrefintOutputCmd
        PUBLIC COMP_VrefintToCOMP1Connect
        PUBLIC COMP_WindowCmd

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_comp.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_comp.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the COMP firmware functions.
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
//   22 #include "stm8l15x_comp.h"
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
//   36   * @addtogroup COMP_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the COMPx peripheral registers to their default reset values.
//   42   * @param  None.
//   43   * @retval None.
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void COMP_DeInit(void)
//   46 {
//   47   /* Set COMP->CSR1 to reset value 0x00 */
//   48   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
COMP_DeInit:
        CLR       A
        LD        L:0x5440, A
//   49 
//   50   /* Set COMP->CSR2 to reset value 0x00 */
//   51   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
        LD        L:0x5441, A
//   52 
//   53   /* Set COMP->CSR3 to reset value 0xC0 */
//   54   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
        LD        A, #0xc0
        LD        L:0x5442, A
//   55 
//   56   /* Set COMP->CSR4 to reset value 0x00 */
//   57   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
        CLR       A
        LD        L:0x5443, A
//   58 
//   59   /* Set COMP->CSR5 to reset value 0x00 */
//   60   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
        LD        L:0x5444, A
//   61 }
        RET
//   62 
//   63 /**
//   64   * @brief  Initializes the comparator inverting input, output and speed.
//   65   * @note   This function configures only COMP2.
//   66   * @param  COMP_InvertingInput : selects the comparator inverting input and can
//   67   *         be any of the @ref COMP_InvertingInput_Typedef enumeration.
//   68   * @param  COMP_OutputSelect : selects the comparator output and can be any of
//   69   *         the @ref COMP_OutputSelect_Typedef enumeation.
//   70   * @param  COMP_Speed selects the comparator speed and can be any of the
//   71   *         @ref COMP_Speed_TypeDef enumeration.
//   72   * @retval None.
//   73   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
//   75                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
//   76 {
COMP_Init:
        LD        S:?b2, A
//   77   /* Check the parameters */
//   78   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
//   79   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
//   80   assert_param(IS_COMP_SPEED(COMP_Speed));
//   81 
//   82   /* Reset the INSEL[2:0] bits in CSR3 register */
//   83   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
        LD        A, #0xc7
        AND       A, L:0x5442
        LD        L:0x5442, A
//   84   /* Select the comparator inverting input */
//   85   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
        LD        A, S:?b2
        OR        A, L:0x5442
        LD        L:0x5442, A
//   86 
//   87   /* Reset the OUTSEL[1:0] bits in CSR3 register */
//   88   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
        LD        A, #0x3f
        AND       A, L:0x5442
        LD        L:0x5442, A
//   89   /* Redirect the comparator output */
//   90   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
        LD        A, S:?b0
        OR        A, L:0x5442
        LD        L:0x5442, A
//   91 
//   92   /* Reset the comparator speed bit */
//   93   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
        BRES      L:0x5441, #0x2
//   94   /* Select the comparator speed */
//   95   COMP->CSR2 |= (uint8_t) COMP_Speed;
        LD        A, S:?b1
        OR        A, L:0x5441
        LD        L:0x5441, A
//   96 }
        RET
//   97 
//   98 /**
//   99   * @brief  Enables or disables connection between VREFINT and COMP1 inverting input.
//  100   * @param  NewState new state of the VREFINT connection to COMP1 inverting input.
//  101   *         This parameter can be ENABLE or DISABLE.
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
//  105 {
//  106   /* Check the parameters */
//  107   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  108 
//  109   if (NewState != DISABLE)
COMP_VrefintToCOMP1Connect:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??COMP_VrefintToCOMP1Connect_0
//  110   {
//  111     /* Enable the comparator */
//  112     COMP->CSR3 |= COMP_CSR3_VREFEN;
        BSET      L:0x5442, #0x2
        RET
//  113   }
//  114   else
//  115   {
//  116     /* Disable the comparator */
//  117     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
??COMP_VrefintToCOMP1Connect_0:
        BRES      L:0x5442, #0x2
//  118   }
//  119 }
        RET
//  120 
//  121 /**
//  122   * @brief  Configures the COMP edge detection.
//  123   * @param  COMP_Selection : selects the comparator and can be any of the
//  124   *         @ref COMP_Selection_TypeDef enum.
//  125   * @param  COMP_Edge : can be any of the @ref COMP_Edge_TypeDef enumeration
//  126   * @retval None.
//  127   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  128 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
//  129 {
//  130   /* Check the parameters */
//  131   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  132   assert_param(IS_COMP_EDGE(COMP_Edge));
//  133 
//  134   /* Check if comparator 1 is selected */
//  135   if (COMP_Selection == COMP_Selection_COMP1)
COMP_EdgeConfig:
        CP        A, #0x1
        JRNE      L:??COMP_EdgeConfig_0
//  136   {
//  137     /* Reset the comparator 1 edge control bits */
//  138     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
        LD        A, #0xfc
        AND       A, L:0x5440
        LD        L:0x5440, A
//  139 
//  140     /* Select the edge detection of comparator 1 output */
//  141     COMP->CSR1 |= (uint8_t) COMP_Edge;
        LD        A, S:?b0
        OR        A, L:0x5440
        LD        L:0x5440, A
        RET
//  142   }
//  143   /* The comparator 2 is selected */
//  144   else
//  145   {
//  146     /* Reset the comparator 2 edge control bits */
//  147     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
??COMP_EdgeConfig_0:
        LD        A, #0xfc
        AND       A, L:0x5441
        LD        L:0x5441, A
//  148 
//  149     /* Select the edge detection of comparator 2 output */
//  150     COMP->CSR2 |= (uint8_t) COMP_Edge;
        LD        A, S:?b0
        OR        A, L:0x5441
        LD        L:0x5441, A
//  151   }
//  152 }
        RET
//  153 
//  154 /**
//  155   * @brief  Returns the output level of the comparator.
//  156   * @param  COMP_Selection : selects the comparator and can be any of the
//  157   *         @ref COMP_Selection_TypeDef enum.
//  158   * @retval Returns the comparator output level and can be any of the
//  159   *         @ref COMP_OutputLevel_TypeDef enum.
//  160   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  161 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
//  162 {
//  163   uint8_t compout;
//  164 
//  165   /* Check the parameters */
//  166   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  167 
//  168   /* Check if Comparator 1 is selected */
//  169   if (COMP_Selection == COMP_Selection_COMP1)
COMP_GetOutputLevel:
        CP        A, #0x1
        JRNE      L:??COMP_GetOutputLevel_0
//  170   {
//  171     /* Check if comparator 1 output level is high */
//  172     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
        LD        A, L:0x5440
//  173     {
//  174       /* Get Comparator 1 output level */
//  175       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
//  176     }
//  177     /* comparator 1 output level is low */
//  178     else
//  179     {
//  180       /* Get Comparator 1 output level */
//  181       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
        AND       A, #0x8
        JREQ      L:??COMP_GetOutputLevel_1
        LD        A, #0x1
        RET
??COMP_GetOutputLevel_1:
        CLR       A
        RET
//  182     }
//  183   }
//  184   /* Comparator 2 is selected */
//  185   else
//  186   {
//  187     /* Check if comparator 2 output level is high */
//  188     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
??COMP_GetOutputLevel_0:
        LD        A, L:0x5441
//  189     {
//  190       /* Get Comparator output level */
//  191       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
//  192     }
//  193     /* comparator 2 output level is low */
//  194     else
//  195     {
//  196       /* Get Comparator 2 output level */
//  197       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
        AND       A, #0x8
        JREQ      L:??COMP_GetOutputLevel_2
        LD        A, #0x1
        RET
??COMP_GetOutputLevel_2:
        CLR       A
//  198     }
//  199   }
//  200 
//  201   /* Return the comparator output level */
//  202   return (COMP_OutputLevel_TypeDef)(compout);
        RET
//  203 }
//  204 
//  205 /**
//  206   * @brief  Enables or disables the window mode.
//  207   * @param  NewState new state of the window mode.
//  208   *         This parameter can be ENABLE or DISABLE.
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 void COMP_WindowCmd(FunctionalState NewState)
//  212 {
//  213   /* Check the parameters */
//  214   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  215 
//  216   if (NewState != DISABLE)
COMP_WindowCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??COMP_WindowCmd_0
//  217   {
//  218     /* Enable the window mode */
//  219     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
        BSET      L:0x5442, #0x1
        RET
//  220   }
//  221   else
//  222   {
//  223     /* Disable the window mode */
//  224     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
??COMP_WindowCmd_0:
        BRES      L:0x5442, #0x1
//  225   }
//  226 }
        RET
//  227 
//  228 /**
//  229   * @brief  Enables or disables the interrupt generation when an event is detected.
//  230   * @param  COMP_Selection : selects the comparator and can be any of the
//  231   *         @ref COMP_Selection_TypeDef enum.
//  232   * @param  NewState : new state of the COMPx peripheral.
//  233   *         This parameter can be: ENABLE or DISABLE.
//  234   * @retval None
//  235   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  236 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
//  237 {
//  238   /* Check the parameters */
//  239   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  240   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  241 
//  242   /* Check if Comparator 1 is selected */
//  243   if (COMP_Selection == COMP_Selection_COMP1)
COMP_ITConfig:
        CP        A, #0x1
        JRNE      L:??COMP_ITConfig_0
//  244   {
//  245     if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??COMP_ITConfig_1
//  246     {
//  247       /* Enable the COMP1 Interrupt source */
//  248       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
        BSET      L:0x5440, #0x5
        RET
//  249     }
//  250     else
//  251     {
//  252       /* Disable the COMP1 Interrupt source */
//  253       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
??COMP_ITConfig_1:
        BRES      L:0x5440, #0x5
        RET
//  254     }
//  255   }
//  256   else /* Comparator 2 is selected */
//  257   {
//  258     if (NewState != DISABLE)
??COMP_ITConfig_0:
        CLR       A
        CP        A, S:?b0
        JREQ      L:??COMP_ITConfig_2
//  259     {
//  260       /* Enable the COMP2 Interrupt source */
//  261       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
        BSET      L:0x5441, #0x5
        RET
//  262     }
//  263     else
//  264     {
//  265       /* Disable the COMP2 Interrupt source */
//  266       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
??COMP_ITConfig_2:
        BRES      L:0x5441, #0x5
//  267     }
//  268   }
//  269 }
        RET
//  270 
//  271 /**
//  272   * @brief  Enables or disables trigger on the specified input/output group.
//  273   * @param  COMP_TriggerGroup : specifies the input/output group
//  274   *         This parameter can be a value @ref COMP_TriggerGroup_TypeDef
//  275   * @param  COMP_TriggerPin : specifies the pin(s) within the input/output group
//  276   *         This parameter can be a value @ref COMP_TriggerPin_TypeDef
//  277   * @param  NewState : enable or disable the trigger on the selected pin(s)
//  278   *         This parameter can be: ENABLE or DISABLE.
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
//  282                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
//  283                         FunctionalState NewState)
//  284 {
//  285   /* Check the parameters */
//  286   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
//  287   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
//  288 
//  289   switch (COMP_TriggerGroup)
COMP_TriggerConfig:
        CP        A, #0x1
        JREQ      L:??COMP_TriggerConfig_0
        CP        A, #0x2
        JREQ      L:??COMP_TriggerConfig_1
        CP        A, #0x3
        JREQ      L:??COMP_TriggerConfig_2
        CP        A, #0x4
        JREQ      L:??COMP_TriggerConfig_3
        RET
//  290   {
//  291     case COMP_TriggerGroup_InvertingInput:
//  292 
//  293       if (NewState != DISABLE)
??COMP_TriggerConfig_0:
        CLR       A
        CP        A, S:?b1
        JREQ      L:??COMP_TriggerConfig_4
//  294       {
//  295         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5443
        LD        L:0x5443, A
        RET
//  296       }
//  297       else
//  298       {
//  299         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
??COMP_TriggerConfig_4:
        LD        A, S:?b0
        OR        A, L:0x5443
        LD        L:0x5443, A
        RET
//  300       }
//  301       break;
//  302 
//  303     case COMP_TriggerGroup_NonInvertingInput:
//  304       if (NewState != DISABLE)
??COMP_TriggerConfig_1:
        LD        A, S:?b0
        SLL       A
        SLL       A
        SLL       A
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b1
        JREQ      L:??COMP_TriggerConfig_5
//  305       {
//  306         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5443
        LD        L:0x5443, A
        RET
//  307       }
//  308       else
//  309       {
//  310         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
??COMP_TriggerConfig_5:
        LD        A, S:?b0
        OR        A, L:0x5443
        LD        L:0x5443, A
        RET
//  311       }
//  312       break;
//  313 
//  314     case COMP_TriggerGroup_VREFINTOutput:
//  315       if (NewState != DISABLE)
??COMP_TriggerConfig_2:
        CLR       A
        CP        A, S:?b1
        JREQ      L:??COMP_TriggerConfig_6
//  316       {
//  317         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5444
        LD        L:0x5444, A
        RET
//  318       }
//  319       else
//  320       {
//  321         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
??COMP_TriggerConfig_6:
        LD        A, S:?b0
        OR        A, L:0x5444
        LD        L:0x5444, A
        RET
//  322       }
//  323       break;
//  324 
//  325     case COMP_TriggerGroup_DACOutput:
//  326       if (NewState != DISABLE)
??COMP_TriggerConfig_3:
        LD        A, S:?b0
        SLL       A
        SLL       A
        SLL       A
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b1
        JREQ      L:??COMP_TriggerConfig_7
//  327       {
//  328         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, L:0x5444
        LD        L:0x5444, A
        RET
//  329       }
//  330       else
//  331       {
//  332         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
??COMP_TriggerConfig_7:
        LD        A, S:?b0
        OR        A, L:0x5444
        LD        L:0x5444, A
//  333       }
//  334       break;
//  335 
//  336     default:
//  337       break;
//  338   }
//  339 }
        RET
//  340 
//  341 /**
//  342   * @brief  Enables or disables the output of the internal reference voltage.
//  343   * @param  NewState : new state of the Vrefint output.
//  344   *         This parameter can be: ENABLE or DISABLE.
//  345   * @retval None
//  346   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  347 void COMP_VrefintOutputCmd(FunctionalState NewState)
//  348 {
//  349   /* Check the parameters */
//  350   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  351 
//  352   if (NewState != DISABLE)
COMP_VrefintOutputCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??COMP_VrefintOutputCmd_0
//  353   {
//  354     /* Enable the output of internal reference voltage */
//  355     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
        BSET      L:0x5442, #0x0
        RET
//  356   }
//  357   else
//  358   {
//  359     /* Disable the output of internal reference voltage */
//  360     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
??COMP_VrefintOutputCmd_0:
        BRES      L:0x5442, #0x0
//  361   }
//  362 }
        RET
//  363 
//  364 /**
//  365   * @brief  Enables or disables the schmitt trigger.
//  366   * @param  NewState : new state of the schmitt trigger.
//  367   *         This parameter can be: ENABLE or DISABLE.
//  368   * @retval None
//  369   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  370 void COMP_SchmittTriggerCmd(FunctionalState NewState)
//  371 {
//  372   /* Check the parameters */
//  373   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  374 
//  375   if (NewState != DISABLE)
COMP_SchmittTriggerCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??COMP_SchmittTriggerCmd_0
//  376   {
//  377     /* Enable Schmitt trigger on Input Output switches Channels */
//  378     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
        BSET      L:0x5440, #0x2
        RET
//  379   }
//  380   else
//  381   {
//  382     /* Enable Schmitt trigger on Input Output switches Channels */
//  383     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
??COMP_SchmittTriggerCmd_0:
        BRES      L:0x5440, #0x2
//  384   }
//  385 }
        RET
//  386 
//  387 /**
//  388   * @brief  Checks whether the comparator flag is set or not.
//  389   * @param  COMP_Selection : selects the comparator and can be any of the
//  390   *         @ref COMP_Selection_TypeDef enum.
//  391   * @retval The new state of COMPx event flag (SET or RESET).
//  392   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  393 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
//  394 {
//  395   FlagStatus bitstatus = RESET;
//  396 
//  397   /* Check the parameters */
//  398   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  399 
//  400   /* Check if COMP1 is selected */
//  401   if (COMP_Selection == COMP_Selection_COMP1)
COMP_GetFlagStatus:
        CP        A, #0x1
        JRNE      L:??COMP_GetFlagStatus_0
//  402   {
//  403     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
        LD        A, L:0x5440
//  404     {
//  405       /* The comparator 1 event flag is set */
//  406       bitstatus = SET;
//  407     }
//  408     else
//  409     {
//  410       /* The comparator 1 event flag is reset */
//  411       bitstatus = RESET;
        AND       A, #0x10
        JREQ      L:??COMP_GetFlagStatus_1
        LD        A, #0x1
        RET
??COMP_GetFlagStatus_1:
        CLR       A
        RET
//  412     }
//  413   }
//  414   else   /* COMP2 is selected */
//  415   {
//  416     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
??COMP_GetFlagStatus_0:
        LD        A, L:0x5441
//  417     {
//  418       /* The comparator 2 event flag is set */
//  419       bitstatus = SET;
//  420     }
//  421     else
//  422     {
//  423       /* The comparator 2 event flag is reset */
//  424       bitstatus = RESET;
        AND       A, #0x10
        JREQ      L:??COMP_GetFlagStatus_2
        LD        A, #0x1
        RET
??COMP_GetFlagStatus_2:
        CLR       A
//  425     }
//  426   }
//  427 
//  428   /* return the comparator event flag status */
//  429   return (FlagStatus)(bitstatus);
        RET
//  430 }
//  431 
//  432 /**
//  433   * @brief  Clears the comparator’s pending flag.
//  434   * @param  COMP_Selection : selects the comparator and can be any of the
//  435   *         @ref COMP_Selection_TypeDef enum.
//  436   * @retval None.
//  437   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  438 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
//  439 {
//  440   /* Check the parameters */
//  441   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  442 
//  443   if (COMP_Selection == COMP_Selection_COMP1)
COMP_ClearFlag:
        CP        A, #0x1
        JRNE      L:??COMP_ClearFlag_0
//  444   {
//  445     /* Clear the flag EF1 (rc_w0) clear this bit by writing 0. */
//  446     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
        BRES      L:0x5440, #0x4
        RET
//  447   }
//  448   else
//  449   {
//  450     /* Clear the flag EF2 (rc_w0) clear this bit by writing 0. */
//  451     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
??COMP_ClearFlag_0:
        BRES      L:0x5441, #0x4
//  452   }
//  453 }
        RET
//  454 
//  455 /**
//  456   * @brief  Checks whether the comparator interrupt has occurred or not.
//  457   * @param  COMP_Selection : selects the comparator and can be any of the
//  458   *         @ref COMP_Selection_TypeDef enum.
//  459   * @retval ITStatus : The state of the COMPx event flag (SET or RESET).
//  460   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  461 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
//  462 {
//  463   ITStatus bitstatus = RESET;
//  464   uint8_t itstatus = 0x00, itenable = 0x00;
//  465 
//  466   /* Check the parameters */
//  467   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  468 
//  469   if (COMP_Selection == COMP_Selection_COMP1)
COMP_GetITStatus:
        CP        A, #0x1
        JRNE      L:??COMP_GetITStatus_0
//  470   {
//  471     /* Get the EF1 comparator event falg status */
//  472     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
        LD        A, L:0x5440
        LD        S:?b0, A
//  473 
//  474     /* Get the IE1 interrupt enable bit status */
//  475     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
        LD        A, L:0x5440
        LD        S:?b1, A
//  476 
//  477     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
//  478     {
//  479       /* the EF1 and IE1 are set */
//  480       bitstatus = SET;
//  481     }
//  482     else
//  483     {
//  484       /* the EF1 or IE1 is reset */
//  485       bitstatus = RESET;
        LD        A, S:?b0
        AND       A, #0x10
        JREQ      L:??COMP_GetITStatus_1
        LD        A, S:?b1
        AND       A, #0x20
        JREQ      L:??COMP_GetITStatus_1
        LD        A, #0x1
        RET
??COMP_GetITStatus_1:
        CLR       A
        RET
//  486     }
//  487   }
//  488   else
//  489   {
//  490     /* Get the EF2 comparator event falg value */
//  491     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
??COMP_GetITStatus_0:
        LD        A, L:0x5441
        LD        S:?b0, A
//  492 
//  493     /* Get the IE2 interrupt enable bit value */
//  494     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
        LD        A, L:0x5441
        LD        S:?b1, A
//  495 
//  496     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
//  497     {
//  498       /* The EF2 and IE2 are set */
//  499       bitstatus = SET;
//  500     }
//  501     else
//  502     {
//  503       /* The EF2 or IE2 is reset */
//  504       bitstatus = RESET;
        LD        A, S:?b0
        AND       A, #0x10
        JREQ      L:??COMP_GetITStatus_2
        LD        A, S:?b1
        AND       A, #0x20
        JREQ      L:??COMP_GetITStatus_2
        LD        A, #0x1
        RET
??COMP_GetITStatus_2:
        CLR       A
//  505     }
//  506   }
//  507 
//  508   /* Return the COMP interrupt status */
//  509   return (ITStatus) bitstatus;
        RET
//  510 }
//  511 
//  512 /**
//  513   * @brief  Clears the interrupt pending bits of the comparator.
//  514   * @param  COMP_Selection : selects the comparator and can be any of the
//  515   *         @ref COMP_Selection_TypeDef enum.
//  516   * @retval None
//  517   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  518 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
//  519 {
//  520   /* Check the parameters */
//  521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
//  522 
//  523   if (COMP_Selection == COMP_Selection_COMP1)
COMP_ClearITPendingBit:
        CP        A, #0x1
        JRNE      L:??COMP_ClearITPendingBit_0
//  524   {
//  525     /* Clear the flag EF1 (rc_w0) clear this bit by writing 0. */
//  526     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
        BRES      L:0x5440, #0x4
        RET
//  527   }
//  528   else
//  529   {
//  530     /* Clear the flag EF2 (rc_w0) clear this bit by writing 0. */
//  531     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
??COMP_ClearITPendingBit_0:
        BRES      L:0x5441, #0x4
//  532   }
//  533 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  534 
//  535 /**
//  536   * @}
//  537   */
//  538 
//  539 /**
//  540   * @}
//  541   */
//  542 
//  543 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 492 bytes in section .near_func.text
// 
// 492 bytes of CODE memory
//
//Errors: none
//Warnings: none
