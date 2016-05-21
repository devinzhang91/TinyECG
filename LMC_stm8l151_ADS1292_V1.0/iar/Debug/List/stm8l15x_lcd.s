///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:48 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_lcd.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_lcd.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_lcd.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_lcd

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4

        PUBLIC LCD_BlinkConfig
        PUBLIC LCD_ClearFlag
        PUBLIC LCD_ClearITPendingBit
        PUBLIC LCD_Cmd
        PUBLIC LCD_ContrastConfig
        PUBLIC LCD_DeInit
        PUBLIC LCD_DeadTimeConfig
        PUBLIC LCD_GetFlagStatus
        PUBLIC LCD_GetITStatus
        PUBLIC LCD_HighDriveCmd
        PUBLIC LCD_ITConfig
        PUBLIC LCD_Init
        PUBLIC LCD_PageSelect
        PUBLIC LCD_PortMaskConfig
        PUBLIC LCD_PulseOnDurationConfig
        PUBLIC LCD_WriteRAM

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_lcd.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_lcd.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the LCD firmware functions.
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
//   22 #include "stm8l15x_lcd.h"
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
//   36 /** @addtogroup LCD_Public_Functions
//   37   * @{
//   38   */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the LCD Controller registers to their default reset values.
//   42   * @param  None
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void LCD_DeInit(void)
//   46 {
//   47   uint8_t counter = 0;
//   48 
//   49   LCD->CR1 = LCD_CR1_RESET_VALUE;
LCD_DeInit:
        CLR       A
        LD        L:0x5400, A
//   50   LCD->CR2 = LCD_CR2_RESET_VALUE;
        LD        L:0x5401, A
//   51   LCD->CR3 = LCD_CR3_RESET_VALUE;
        LD        L:0x5402, A
//   52   LCD->FRQ = LCD_FRQ_RESET_VALUE;
        LD        L:0x5403, A
//   53 
//   54   for (counter = 0;counter < 0x05; counter++)
        LDW       X, #0x5404
        LD        A, #0x5
        LD        S:?b0, A
//   55   {
//   56     LCD->PM[counter] = LCD_PM_RESET_VALUE;
??LCD_DeInit_0:
        CLR       A
        LD        (X), A
//   57   }
        INCW      X
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b0
        JRNE      L:??LCD_DeInit_0
//   58 
//   59   for (counter = 0;counter < 0x16; counter++)
        LDW       X, #0x540c
        LD        A, #0x16
        LD        S:?b0, A
//   60   {
//   61     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
??LCD_DeInit_1:
        CLR       A
        LD        (X), A
//   62   }
        INCW      X
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b0
        JRNE      L:??LCD_DeInit_1
//   63 
//   64   LCD->CR4 = LCD_CR4_RESET_VALUE;
        LD        L:0x542f, A
//   65 
//   66 }
        RET
//   67 
//   68 /**
//   69   * @brief  Initializes the LCD according to the specified parameters.
//   70   * @param  LCD_CLKPrescalerDiv : This parameter can be any of the  @ref LCD_Divider_TypeDef enumeration.
//   71   * @param  LCD_Divider : This parameter can be any of the @ref LCD_Divider_TypeDef enumeration.
//   72   * @param  LCD_Duty : This parameter can be any of the @ref LCD_Duty_TypeDef enumeration.
//   73   * @param  LCD_Bias : This parameter can be any of the @ref LCD_Bias_TypeDef enumeration.
//   74   * @param  LCD_VoltageSource : This parameter can be any of the @ref LCD_VoltageSource_TypeDef enumeration.
//   75   * @retval None
//   76   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   77 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
//   78               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
//   79               LCD_VoltageSource_TypeDef LCD_VoltageSource)
//   80 {
LCD_Init:
        LD        S:?b4, A
//   81   /* Check function parameters */
//   82   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
//   83   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
//   84   assert_param(IS_LCD_DUTY(LCD_Duty));
//   85   assert_param(IS_LCD_BIAS(LCD_Bias));
//   86   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
//   87 
//   88   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
        LD        A, #0xf
        AND       A, L:0x5403
        LD        L:0x5403, A
//   89   LCD->FRQ |= LCD_Prescaler;
        LD        A, S:?b4
        OR        A, L:0x5403
        LD        L:0x5403, A
//   90 
//   91   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
        LD        A, #0xf0
        AND       A, L:0x5403
        LD        L:0x5403, A
//   92   LCD->FRQ |= LCD_Divider;
        LD        A, S:?b0
        OR        A, L:0x5403
        LD        L:0x5403, A
//   93 
//   94   /* Configure the Duty cycle */
//   95   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
        LD        A, #0xf9
        AND       A, L:0x5400
        LD        L:0x5400, A
//   96   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
        BRES      L:0x542f, #0x1
//   97 
//   98   if (LCD_Duty == LCD_Duty_1_8)
        LD        A, S:?b1
        CP        A, #0x20
        JRNE      L:??LCD_Init_0
//   99   {
//  100     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
        BSET      L:0x542f, #0x1
        JRA       L:??LCD_Init_1
//  101   }
//  102   else
//  103   {
//  104     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
??LCD_Init_0:
        AND       A, #0xf
        OR        A, L:0x5400
        LD        L:0x5400, A
//  105   }
//  106 
//  107   /* Configure the Bias */
//  108   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
??LCD_Init_1:
        BRES      L:0x5400, #0x0
//  109   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
        BRES      L:0x542f, #0x0
//  110 
//  111   if (LCD_Bias == LCD_Bias_1_4)
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??LCD_Init_2
//  112   {
//  113     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
        LD        A, L:0x5400
        LD        L:0x5400, A
//  114     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
        BSET      L:0x542f, #0x0
        JRA       L:??LCD_Init_3
//  115   }
//  116   else
//  117   {
//  118     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
??LCD_Init_2:
        AND       A, #0xf
        OR        A, L:0x5400
        LD        L:0x5400, A
//  119   }
//  120 
//  121   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
??LCD_Init_3:
        BRES      L:0x5401, #0x0
//  122   LCD->CR2 |= LCD_VoltageSource;
        LD        A, S:?b3
        OR        A, L:0x5401
        LD        L:0x5401, A
//  123 
//  124 }
        RET
//  125 
//  126 /**
//  127   * @brief  Enables or disables the LCD Controller.
//  128   * @param  NewState: New state of the LCD peripheral.
//  129   *         This parameter can be: ENABLE or DISABLE
//  130   * @retval None
//  131   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  132 void LCD_Cmd(FunctionalState NewState)
//  133 {
//  134   /* Check function parameters */
//  135   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  136 
//  137   if (NewState != DISABLE)
LCD_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??LCD_Cmd_0
//  138   {
//  139     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
        BSET      L:0x5402, #0x6
        RET
//  140   }
//  141   else
//  142   {
//  143     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
??LCD_Cmd_0:
        BRES      L:0x5402, #0x6
//  144   }
//  145 
//  146 }
        RET
//  147 
//  148 /**
//  149   * @brief  Enables or disables the interrupt.
//  150   * @param  NewState: The new state of the LCD interrupt.
//  151   *         This parameter can be: ENABLE or DISABLE
//  152   * @retval None
//  153   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  154 void LCD_ITConfig(FunctionalState NewState)
//  155 {
//  156   /* Check function parameters */
//  157   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  158 
//  159   if (NewState != DISABLE)
LCD_ITConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??LCD_ITConfig_0
//  160   {
//  161     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
        BSET      L:0x5402, #0x5
        RET
//  162   }
//  163   else
//  164   {
//  165     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
??LCD_ITConfig_0:
        BRES      L:0x5402, #0x5
//  166   }
//  167 
//  168 }
        RET
//  169 /**
//  170   * @brief  Enables or disables the low resistance divider.
//  171   * @param  NewState: The state of the low resistance divider.
//  172   *         This parameter can be: ENABLE or DISABLE
//  173   * @retval None
//  174   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  175 void LCD_HighDriveCmd(FunctionalState NewState)
//  176 {
//  177   /* Check function parameters */
//  178   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  179 
//  180   if (NewState != DISABLE)
LCD_HighDriveCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??LCD_HighDriveCmd_0
//  181   {
//  182     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
        BSET      L:0x5401, #0x4
        RET
//  183   }
//  184   else
//  185   {
//  186     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
??LCD_HighDriveCmd_0:
        BRES      L:0x5401, #0x4
//  187   }
//  188 
//  189 }
        RET
//  190 /**
//  191   * @brief  Configures the pulses on duration.
//  192   * @note   The pulses on duration have a sense only when enabling the High drive
//  193   * @param  LCD_PulseOnDuration : This parameter can be any of the
//  194   *         @ref LCD_PulseOnDuration_TypeDef enumeration.
//  195   * @retval None
//  196   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  197 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
//  198 {
LCD_PulseOnDurationConfig:
        LD        S:?b0, A
//  199   /* Check function parameters */
//  200   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
//  201 
//  202   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
        LD        A, #0x1f
        AND       A, L:0x5401
        LD        L:0x5401, A
//  203   LCD->CR2 |= LCD_PulseOnDuration;
        LD        A, S:?b0
        OR        A, L:0x5401
        LD        L:0x5401, A
//  204 
//  205 }
        RET
//  206 /**
//  207   * @brief  Configures the LCD dead time.
//  208   * @param  LCD_DeadTime : This parameter can be any of the
//  209   *         @ref LCD_DeadTime_TypeDef enumeration.
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
//  213 {
LCD_DeadTimeConfig:
        LD        S:?b0, A
//  214   /* Check function parameters */
//  215   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
//  216 
//  217   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
        LD        A, #0xf8
        AND       A, L:0x5402
        LD        L:0x5402, A
//  218 
//  219   LCD->CR3 |= LCD_DeadTime;
        LD        A, S:?b0
        OR        A, L:0x5402
        LD        L:0x5402, A
//  220 
//  221 }
        RET
//  222 
//  223 /**
//  224   * @brief  Configures the LCD Blink mode.
//  225   * @param  LCD_BlinkMode: Specifies the LCD blink mode.
//  226   *         This parameter can be any of the @ref LCD_BlinkMode_TypeDef
//  227   *         enumeration.
//  228   * @param  LCD_BlinkFrequency: Specifies the LCD blink frequency.
//  229   *         This parameter can be any of the @ref LCD_BlinkFrequency_TypeDef
//  230   *         enumeration.
//  231   * @retval None
//  232   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  233 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode,
//  234                      LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
//  235 {
LCD_BlinkConfig:
        LD        S:?b1, A
//  236   /* Check function parameters */
//  237   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
//  238   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
//  239 
//  240   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
        LD        A, #0x3f
        AND       A, L:0x5400
        LD        L:0x5400, A
//  241   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
        LD        A, S:?b1
        OR        A, L:0x5400
        LD        L:0x5400, A
//  242 
//  243   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
        LD        A, #0xc7
        AND       A, L:0x5400
        LD        L:0x5400, A
//  244   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
        LD        A, S:?b0
        OR        A, L:0x5400
        LD        L:0x5400, A
//  245 
//  246 }
        RET
//  247 
//  248 /**
//  249   * @brief  Configures the LCD Contrast.
//  250   * @param  LCD_Contrast: Specifies the LCD contrast.
//  251   *         This parameter can be any of the @ref LCD_Contrast_TypeDef enumeration.
//  252   * @retval None
//  253   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  254 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
//  255 {
LCD_ContrastConfig:
        LD        S:?b0, A
//  256   /* Check function parameters */
//  257   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
//  258 
//  259   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
        LD        A, #0xf1
        AND       A, L:0x5401
        LD        L:0x5401, A
//  260   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
        LD        A, S:?b0
        OR        A, L:0x5401
        LD        L:0x5401, A
//  261 
//  262 }
        RET
//  263 
//  264 /**
//  265   * @brief  Configures the LCD Port Mask.
//  266   * @param  LCD_PortMaskRegister: The LCD register index in the port mask matrix.
//  267   *         This parameter can be any of the @ref LCD_PortMaskRegister_TypeDef
//  268   *         enumeration.
//  269   * @param  LCD_Mask : Value to be written
//  270   * @retval None
//  271   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  272 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
//  273 {
//  274   /* Check function parameters */
//  275   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
//  276 
//  277   /* Copy data bytes to Port mask register */
//  278   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
LCD_PortMaskConfig:
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5404
        LD        A, S:?b0
        LD        (X), A
//  279 
//  280 }
        RET
//  281 
//  282 /**
//  283   * @brief  Writes a byte in the specific LCD RAM .
//  284   * @param  LCD_RAMRegister: The LCD register index in the RAM matrix.
//  285   *         This parameter can be any of the @ref LCD_RAMRegister_TypeDef
//  286   *         enumeration.
//  287   * @param  LCD_Data : Value to be written
//  288   * @retval None
//  289   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  290 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
//  291 {
//  292   /* Check function parameters */
//  293   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
//  294 
//  295   /* Copy data bytes to RAM register */
//  296   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
LCD_WriteRAM:
        CLRW      X
        LD        XL, A
        ADDW      X, #0x540c
        LD        A, S:?b0
        LD        (X), A
//  297 
//  298 }
        RET
//  299 
//  300 /**
//  301   * @brief  Select the LCD page where the data will be writen.
//  302   * @param  LCD_Page: The accessed LCD page.
//  303   *         This parameter can be any of the @ref LCD_PageSelection_TypeDef
//  304   *         enumeration.
//  305   * @retval None
//  306   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  307 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
//  308 {
//  309   /* Check function parameters */
//  310   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
//  311 
//  312   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
LCD_PageSelect:
        BRES      L:0x542f, #0x2
//  313   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
        OR        A, L:0x542f
        LD        L:0x542f, A
//  314 
//  315 }
        RET
//  316 
//  317 /**
//  318   * @brief  Checks whether the LCD start of new frame flag is set or not.
//  319   * @retval FlagStatus : Indicates the state of SPI_FLAG (SET or RESET).
//  320   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  321 FlagStatus LCD_GetFlagStatus(void)
//  322 {
//  323   FlagStatus status = RESET;
//  324 
//  325   /* Check the status of the start of new frame LCD flag */
//  326   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
LCD_GetFlagStatus:
        LD        A, L:0x5402
//  327   {
//  328     status = SET; /* Flag is set */
//  329   }
//  330   else
//  331   {
//  332     status = RESET; /* Flag is reset*/
//  333   }
//  334   /* Return the FLAG status */
//  335   return status;
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        RET
//  336 
//  337 }
//  338 
//  339 /**
//  340   * @brief  Clears the start of frame LCD flag.
//  341   * @param  None
//  342   * @retval None
//  343   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  344 void LCD_ClearFlag(void)
//  345 {
//  346   /* Clear the flag bit */
//  347   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
LCD_ClearFlag:
        BSET      L:0x5402, #0x3
//  348 
//  349 }
        RET
//  350 
//  351 /**
//  352   * @brief  Checks whether the start of frame interrupt has occurred or not.
//  353   * @param  None
//  354   * @retval ITStatus : Indicates the state of the start of frame interrupt (SET or RESET).
//  355   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  356 ITStatus LCD_GetITStatus(void)
//  357 {
//  358   ITStatus pendingbitstatus = RESET;
//  359   uint8_t enablestatus = 0;
//  360 
//  361   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
LCD_GetITStatus:
        LD        A, L:0x5402
        LD        S:?b0, A
//  362   /* Check the status of the start of frame interrupt */
//  363   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
        LD        A, L:0x5402
        LD        S:?b1, A
//  364   {
//  365     /* ITPENDINGBIT is set */
//  366     pendingbitstatus = SET;
//  367   }
//  368   else
//  369   {
//  370     /* ITPENDINGBIT is reset */
//  371     pendingbitstatus = RESET;
//  372   }
//  373   /* Return the ITPENDINGBIT status */
//  374   return  pendingbitstatus;
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        LD        S:?b0, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        AND       A, S:?b0
        RET
//  375 
//  376 }
//  377 
//  378 /**
//  379   * @brief  Clears the start of frame interrupt pending bits.
//  380   * @param  None
//  381   * @retval None
//  382   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  383 void LCD_ClearITPendingBit(void)
//  384 {
//  385   /* Clear the flag bit */
//  386   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
LCD_ClearITPendingBit:
        BSET      L:0x5402, #0x3
//  387 
//  388 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  389 
//  390 /**
//  391   * @}
//  392   */
//  393 
//  394 /**
//  395   * @}
//  396   */
//  397 
//  398 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 402 bytes in section .near_func.text
// 
// 402 bytes of CODE memory
//
//Errors: none
//Warnings: none
