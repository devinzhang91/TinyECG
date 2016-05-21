///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:45 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_flash.c      /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_flash.c -e   /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_flash.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_flash

        EXTERN ?add32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?dec32_l0_l0
        EXTERN ?sll32_l0_l0_db
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC FLASH_DeInit
        PUBLIC FLASH_EraseBlock
        PUBLIC FLASH_EraseByte
        PUBLIC FLASH_EraseOptionByte
        PUBLIC FLASH_GetBootSize
        PUBLIC FLASH_GetCodeSize
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetPowerStatus
        PUBLIC FLASH_GetProgrammingTime
        PUBLIC FLASH_GetReadOutProtectionStatus
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_PowerRunModeConfig
        PUBLIC FLASH_PowerWaitModeConfig
        PUBLIC FLASH_ProgramBlock
        PUBLIC FLASH_ProgramByte
        PUBLIC FLASH_ProgramOptionByte
        PUBLIC FLASH_ProgramWord
        PUBLIC FLASH_ReadByte
        PUBLIC FLASH_SetProgrammingTime
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_WaitForLastOperation

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_flash.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_flash.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the FLASH firmware functions.
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
//   22 #include "stm8l15x_flash.h"
//   23 
//   24 /** @addtogroup STM8L15x_StdPeriph_Driver
//   25   * @{
//   26   */
//   27 
//   28 /**
//   29 @code
//   30  This driver provides functions to configure and program the Flash memory of all
//   31  STM8L15x/16x devices.
//   32 
//   33  It includes as well functions that can be either executed from RAM or not, and
//   34  other functions that must be excuted from RAM otherwise useless.
//   35 
//   36  The table below lists the functions that can be executed from RAM.
//   37 
//   38  +--------------------------------------------------------------------------------|
//   39  |   Functions prototypes      |    RAM execution            |     Comments       |
//   40  ---------------------------------------------------------------------------------|
//   41  |                             | Mandatory in case of block  | Can be executed    |
//   42  | FLASH_WaitForLastOperation  | Operation:                  | from Flash in case |
//   43  |                             | - Block programming         | of byte and word   |
//   44  |                             | - Block erase               | Operations         |
//   45  |--------------------------------------------------------------------------------|
//   46  | FLASH_PowerRunModeConfig    |       Exclusively           | useless from Flash |
//   47  |--------------------------------------------------------------------------------|
//   48  | FLASH_GetPowerStatus        |       Exclusively           | useless from Flash |
//   49  |--------------------------------------------------------------------------------|
//   50  | FLASH_ProgramBlock          |       Exclusively           | useless from Flash |
//   51  |--------------------------------------------------------------------------------|
//   52  | FLASH_EraseBlock            |       Exclusively           | useless from Flash |
//   53  |--------------------------------------------------------------------------------|
//   54 
//   55  To be able to execute functions from RAM several steps have to be followed.
//   56  These steps may differ from one toolchain to another.
//   57  A detailed description is available below within this driver.
//   58  You can also refer to the Flash_DataProgram example provided within the
//   59  STM8L15x_StdPeriph_Lib package.
//   60 
//   61 @endcode
//   62 */
//   63 /* Private typedef -----------------------------------------------------------*/
//   64 /* Private define ------------------------------------------------------------*/
//   65 #define FLASH_CLEAR_BYTE   ((uint8_t)0x00)
//   66 #define FLASH_SET_BYTE     ((uint8_t)0xFF)
//   67 #define OPERATION_TIMEOUT  ((uint16_t)0xFFFF)
//   68 
//   69 /* Private macro -------------------------------------------------------------*/
//   70 /* Private variables ---------------------------------------------------------*/
//   71 /* Private function prototypes -----------------------------------------------*/
//   72 /* Private Constants ---------------------------------------------------------*/
//   73 /* Public functions ----------------------------------------------------------*/
//   74 
//   75 /** @addtogroup FLASH_Public_functions
//   76   * @{
//   77   */
//   78 
//   79 /**
//   80   * @brief  Unlocks the program or data EEPROM memory
//   81   * @param  FLASH_MemType : Memory type to unlock
//   82   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//   83   * @retval None
//   84   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
//   86 {
//   87   /* Check parameter */
//   88   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
//   89 
//   90   /* Unlock program memory */
//   91   if (FLASH_MemType == FLASH_MemType_Program)
FLASH_Unlock:
        CP        A, #0xfd
        JRNE      L:??FLASH_Unlock_0
//   92   {
//   93     FLASH->PUKR = FLASH_RASS_KEY1;
        LD        A, #0x56
        LD        L:0x5052, A
//   94     FLASH->PUKR = FLASH_RASS_KEY2;
        LD        A, #0xae
        LD        L:0x5052, A
        RET
//   95   }
//   96 
//   97   /* Unlock data memory */
//   98   if (FLASH_MemType == FLASH_MemType_Data)
??FLASH_Unlock_0:
        CP        A, #0xf7
        JRNE      L:??FLASH_Unlock_1
//   99   {
//  100     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
        LD        A, #0xae
        LD        L:0x5053, A
//  101     FLASH->DUKR = FLASH_RASS_KEY1;
        LD        A, #0x56
        LD        L:0x5053, A
//  102   }
//  103 }
??FLASH_Unlock_1:
        RET
//  104 
//  105 /**
//  106   * @brief  Locks the program or data EEPROM memory
//  107   * @param  FLASH_MemType : Memory type
//  108   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//  109   * @retval None
//  110   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  111 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
//  112 {
//  113   /* Check parameter */
//  114   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
//  115   /* Lock memory */
//  116   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
FLASH_Lock:
        AND       A, L:0x5054
        LD        L:0x5054, A
//  117 }
        RET
//  118 
//  119 /**
//  120   * @brief  Deinitializes the FLASH registers to their default reset values.
//  121   * @param  None
//  122   * @retval None
//  123   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  124 void FLASH_DeInit(void)
//  125 {
//  126   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
FLASH_DeInit:
        CLR       A
        LD        L:0x5050, A
//  127   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
        LD        L:0x5051, A
//  128   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
        LD        A, #0x40
        LD        L:0x5054, A
//  129   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
        LD        A, L:0x5054
//  130 }
        RET
//  131 
//  132 /**
//  133   * @brief  Enables or Disables the Flash interrupt mode
//  134   * @param  NewState : The new state of the flash interrupt mode
//  135   *         This parameter can be a value of @ref FunctionalState enumeration.
//  136   * @retval None
//  137   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  138 void FLASH_ITConfig(FunctionalState NewState)
//  139 {
//  140 
//  141   /* Check parameter */
//  142   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  143 
//  144   if (NewState != DISABLE)
FLASH_ITConfig:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??FLASH_ITConfig_0
//  145   {
//  146     /* Enables the interrupt sources */
//  147     FLASH->CR1 |= FLASH_CR1_IE;
        BSET      L:0x5050, #0x1
        RET
//  148   }
//  149   else
//  150   {
//  151     /* Disables the interrupt sources */
//  152     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
??FLASH_ITConfig_0:
        BRES      L:0x5050, #0x1
//  153   }
//  154 }
        RET
//  155 
//  156 /**
//  157   * @brief  Erases one byte in the program or data EEPROM memory
//  158   * @param  Address : Address of the byte to erase
//  159   * @retval None
//  160   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  161 void FLASH_EraseByte(uint32_t Address)
//  162 {
//  163   /* Check parameter */
//  164   assert_param(IS_FLASH_ADDRESS(Address));
//  165 
//  166   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
FLASH_EraseByte:
        CLR       A
        LD        [S:?w1.w], A
//  167 }
        RET
//  168 /**
//  169   * @brief  Programs one byte in program or data EEPROM memory
//  170   * @param  Address : Address where the byte will be programmed
//  171   * @param  Data : Value to be programmed
//  172   * @retval None
//  173   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  174 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
//  175 {
//  176   /* Check parameters */
//  177   assert_param(IS_FLASH_ADDRESS(Address));
//  178 
//  179   *(PointerAttr uint8_t*) (uint16_t)Address = Data;
FLASH_ProgramByte:
        LD        [S:?w1.w], A
//  180 }
        RET
//  181 
//  182 /**
//  183   * @brief  Programs one word (4 bytes) in program or data EEPROM memory
//  184   * @param  Address : The address where the data will be programmed
//  185   * @param  Data : Value to be programmed
//  186   * @retval None
//  187   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  188 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
//  189 {
FLASH_ProgramWord:
        PUSH      L:?b7
        PUSH      L:?b6
        PUSH      L:?b5
        PUSH      L:?b4
//  190   /* Check parameters */
//  191   assert_param(IS_FLASH_ADDRESS(Address));
//  192   /* Enable Word Write Once */
//  193   FLASH->CR2 |= FLASH_CR2_WPRG;
        BSET      L:0x5051, #0x6
//  194 
//  195   /* Write one byte - from lowest address*/
//  196   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
        LDW       X, S:?w1
        LD        A, (0x1,SP)
        LD        (X), A
//  197   /* Write one byte*/
//  198   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
        LD        A, (0x2,SP)
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//  199   /* Write one byte*/
//  200   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
        LD        A, (0x3,SP)
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//  201   /* Write one byte - from higher address*/
//  202   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
        LD        A, (0x4,SP)
        ADDW      X, #0x3
        LD        (X), A
//  203 }
        ADD       SP, #0x4
        RET
//  204 
//  205 /**
//  206   * @brief  Programs option byte
//  207   * @param  Address : option byte address to program
//  208   * @param  Data : Value to write
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
//  212 {
//  213   /* Check parameter */
//  214   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
//  215 
//  216   /* Enable write access to option bytes */
//  217   FLASH->CR2 |= FLASH_CR2_OPT;
FLASH_ProgramOptionByte:
        BSET      L:0x5051, #0x7
//  218 
//  219   /* Program option byte and his complement */
//  220   *((PointerAttr uint8_t*)Address) = Data;
        LD        (X), A
//  221 
//  222   FLASH_WaitForLastOperation(FLASH_MemType_Program);
        LD        A, #0xfd
        CALL      L:FLASH_WaitForLastOperation
//  223 
//  224   /* Disable write access to option bytes */
//  225   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
        BRES      L:0x5051, #0x7
//  226 }
        RET
//  227 
//  228 /**
//  229   * @brief  Erases option byte
//  230   * @param  Address : Option byte address to erase
//  231   * @retval None
//  232   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  233 void FLASH_EraseOptionByte(uint16_t Address)
//  234 {
//  235   /* Check parameter */
//  236   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
//  237 
//  238   /* Enable write access to option bytes */
//  239   FLASH->CR2 |= FLASH_CR2_OPT;
FLASH_EraseOptionByte:
        BSET      L:0x5051, #0x7
//  240 
//  241   /* Erase option byte and his complement */
//  242   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
        CLR       A
        LD        (X), A
//  243 
//  244   FLASH_WaitForLastOperation(FLASH_MemType_Program);
        LD        A, #0xfd
        CALL      L:FLASH_WaitForLastOperation
//  245 
//  246   /* Disable write access to option bytes */
//  247   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
        BRES      L:0x5051, #0x7
//  248 }
        RET
//  249 
//  250 /**
//  251   * @brief  Reads one byte from flash memory
//  252   * @param  Address : Address to read
//  253   * @retval Value of the byte
//  254   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  255 uint8_t FLASH_ReadByte(uint32_t Address)
//  256 {
//  257   /* Read byte */
//  258   return(*(PointerAttr uint8_t *) (uint16_t)Address);
FLASH_ReadByte:
        LDW       X, S:?w1
        LD        A, (X)
        RET
//  259 }
//  260 /**
//  261   * @brief  Sets the fixed programming time
//  262   * @param  FLASH_ProgTime : Indicates the programming time to be fixed
//  263   *         This parameter can be a value of @ref FLASH_ProgramTime_TypeDef
//  264   * @retval None
//  265   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  266 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
//  267 {
//  268   /* Check parameter */
//  269   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
//  270 
//  271   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
FLASH_SetProgrammingTime:
        BRES      L:0x5050, #0x0
//  272   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
        OR        A, L:0x5050
        LD        L:0x5050, A
//  273 }
        RET
//  274 
//  275 /**
//  276   * @brief  Configues the power state for Flash program and data EEPROM during
//  277   *          wait for interrupt mode
//  278   * @param  FLASH_Power: The power state for Flash program and data EEPROM during
//  279   *         wait for interrupt mode
//  280   *         This parameter can be a value of @ref FLASH_Power_TypeDef
//  281   * @retval None
//  282   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  283 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
//  284 {
//  285   /* Check parameter */
//  286   assert_param(IS_FLASH_POWER(FLASH_Power));
//  287 
//  288   /* Flash program and data EEPROM in IDDQ during wait for interrupt mode*/
//  289   if (FLASH_Power != FLASH_Power_On)
FLASH_PowerWaitModeConfig:
        CP        A, #0x1
        JREQ      L:??FLASH_PowerWaitModeConfig_0
//  290   {
//  291     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
        BSET      L:0x5050, #0x2
        RET
//  292   }
//  293   /* Flash program and data EEPROM not in IDDQ during wait for interrupt mode*/
//  294   else
//  295   {
//  296     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
??FLASH_PowerWaitModeConfig_0:
        BRES      L:0x5050, #0x2
//  297   }
//  298 }
        RET
//  299 
//  300 /**
//  301   * @brief  Returns the fixed programming time
//  302   * @param  None
//  303   * @retval Fixed programming time value
//  304   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  305 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
//  306 {
//  307   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
FLASH_GetProgrammingTime:
        LD        A, #0x1
        AND       A, L:0x5050
        RET
//  308 }
//  309 
//  310 /**
//  311   * @brief  Returns the Boot memory size in bytes
//  312   * @param  None
//  313   * @retval Boot memory size in bytes
//  314   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  315 uint16_t FLASH_GetBootSize(void)
//  316 {
//  317   uint16_t temp = 0;
//  318 
//  319   /* Calculates the number of bytes */
//  320   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
FLASH_GetBootSize:
        LD        A, L:0x4802
        CLRW      X
        LD        XL, A
        SRLW      X
        CLR       A
        RRC       A
        RLWA      X, A
//  321 
//  322   /* Correction because size upper 8kb doesn't exist */
//  323   if (OPT->UBC > 0x7F)
        LD        A, L:0x4802
        CP        A, #0x80
        JRC       L:??FLASH_GetBootSize_0
//  324   {
//  325     temp = 8192;
        LDW       X, #0x2000
//  326   }
//  327 
//  328   /* Return value */
//  329   return(temp);
??FLASH_GetBootSize_0:
        RET
//  330 
//  331 }
//  332 /**
//  333  *
//  334   * @brief  Returns the Code Area size in bytes
//  335   * @param  None
//  336   * @retval Code Area size in bytes
//  337   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  338 uint16_t FLASH_GetCodeSize(void)
//  339 {
//  340   uint16_t temp = 0;
//  341 
//  342   /* Calculates the number of bytes */
//  343   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
FLASH_GetCodeSize:
        LD        A, L:0x4807
        CLRW      X
        LD        XL, A
        SRLW      X
        CLR       A
        RRC       A
        RLWA      X, A
//  344 
//  345   /* Correction because size upper of 8kb doesn't exist */
//  346   if (OPT->PCODESIZE > 0x7F)
        LD        A, L:0x4807
        CP        A, #0x80
        JRC       L:??FLASH_GetCodeSize_0
//  347   {
//  348     temp = 8192;
        LDW       X, #0x2000
//  349   }
//  350 
//  351   /* Return value */
//  352   return(temp);
??FLASH_GetCodeSize_0:
        RET
//  353 }
//  354 
//  355 /**
//  356   * @brief  Returns the FLASH Read Out Protection Status.
//  357   * @param  None
//  358   * @retval FunctionalState: Indicates the FLASH Read Out Protection Status.
//  359   *   This parameter can be a ENABLE or DISABLE
//  360   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  361 FunctionalState FLASH_GetReadOutProtectionStatus(void)
//  362 {
//  363   FunctionalState state = DISABLE;
//  364 
//  365   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
FLASH_GetReadOutProtectionStatus:
        LD        A, #0xaa
        CP        A, L:0x4800
        JRNE      L:??FLASH_GetReadOutProtectionStatus_0
//  366   {
//  367     /* The status of the Flash read out protection is enabled*/
//  368     state =  ENABLE;
        LD        A, #0x1
        RET
//  369   }
//  370   else
//  371   {
//  372     /* The status of the Flash read out protection is disabled*/
//  373     state =  DISABLE;
??FLASH_GetReadOutProtectionStatus_0:
        CLR       A
//  374   }
//  375 
//  376   return state;
        RET
//  377 }
//  378 
//  379 /**
//  380   * @brief  Checks whether the specified FLASH flag is set or not.
//  381   * @param  Flash_FLAG : specifies the Flash Flag to check.
//  382   *         This parameter can be a value of @ref FLASH_FLAG_TypeDef
//  383   * @retval FlagStatus : Indicates the state of the Flash_FLAG.
//  384   *         This parameter can be a value of @ref FlagStatus enumeration.
//  385   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  386 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
//  387 {
//  388   FlagStatus status = RESET;
//  389   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
//  390 
//  391   /* Check the status of the specified flash flag*/
//  392   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
FLASH_GetFlagStatus:
        AND       A, L:0x5054
        JREQ      L:??FLASH_GetFlagStatus_0
//  393   {
//  394     status = SET; /* Flash_FLAG is set*/
        LD        A, #0x1
        RET
//  395   }
//  396   else
//  397   {
//  398     status = RESET; /* Flash_FLAG is reset*/
??FLASH_GetFlagStatus_0:
        CLR       A
//  399   }
//  400 
//  401   /* Return the Flash_FLAG status*/
//  402   return status;
        RET
//  403 }
//  404 
//  405 /**
//  406 @code
//  407  All the functions defined below must be executed from RAM exclusively, except
//  408  for the FLASH_WaitForLastOperation function which can be executed from Flash.
//  409 
//  410  Steps of the execution from RAM differs from one toolchain to another:
//  411  - For Cosmic Compiler:
//  412     1- Define a segement FLASH_CODE by the mean of " #pragma section (FLASH_CODE)".
//  413     This segment is defined in the stm8l15x_flash.c file, and it's conditionned by
//  414       COSMIC_RAM_EXECUTION definifition.
//  415   2- Uncomment the "#define COSMIC_RAM_EXECUTION  (1)" line in the stm8l15x.h file,
//  416     or define it in Cosmic compiler preprocessor to enable the FLASH_CODE segment
//  417    definition.
//  418   3- In STVD Select Project\Settings\Linker\Category "input" and in the RAM section
//  419     add the FLASH_CODE segment with "-ic" options.
//  420   4- In main.c file call the _fctcpy() function with first segment character as 
//  421     parameter "_fctcpy('F');" to load the declared moveable code segment
//  422     (FLASH_CODE) in RAM before execution.
//  423   5- By default the _fctcpy function is packaged in the Cosmic machine library,
//  424     so the function prototype "int _fctcopy(char name);" must be added in main.c
//  425     file.
//  426 
//  427   - For Raisonance Compiler
//  428    1- Use the inram keyword in the function declaration to specify that it can be
//  429     executed from RAM.
//  430      This is done within the stm8l15x_flash.c file, and it's conditionned by 
//  431      RAISONANCE_RAM_EXECUTION definifition.
//  432   2- Uncomment the "#define RAISONANCE_RAM_EXECUTION  (1)" line in the stm8l15x.h
//  433    file, or define it in Raisonance compiler preprocessor to enable the access 
//  434    for the inram functions.
//  435    3- An inram function code is copied from Flash to RAM by the C startup code. 
//  436    In some applications, the RAM area where the code was initially stored may be
//  437    erased or corrupted, so it may be desirable to perform the copy again. 
//  438    Depending for the application memory model, the memcpy() or fmemcpy() functions
//  439    should be used to perform the copy.
//  440       • In case your project uses the SMALL memory model (code smaller than 64K),
//  441        memcpy()function is recommended to perform the copy
//  442       • In case your project uses the LARGE memory model, functions can be 
//  443       everywhenre in the 24-bits address space (not limited to the first 64KB of
//  444       code), In this case, the use of memcpy() function will not be appropriate,
//  445       you need to use the specific fmemcpy() function (which copies objects with
//  446       24-bit addresses).
//  447       - The linker automatically defines 2 symbols for each inram function:
//  448            • __address__functionname is a symbol that holds the Flash address 
//  449            where the given function code is stored.
//  450            • __size__functionname is a symbol that holds the function size in bytes.
//  451      And we already have the function address (which is itself a pointer)
//  452   4- In main.c file these two steps should be performed for each inram function:
//  453      • Import the "__address__functionname" and "__size__functionname" symbols
//  454        as global variables:
//  455          extern int __address__functionname; // Symbol holding the flash address
//  456          extern int __size__functionname;    // Symbol holding the function size
//  457      • In case of SMALL memory model use, Call the memcpy() function to copy the
//  458       inram function to the RAM destination address:
//  459                 memcpy(functionname, // RAM destination address
//  460                       (void*)&__address__functionname, // Flash source address
//  461                       (int)&__size__functionname); // Code size of the function
//  462      • In case of LARGE memory model use, call the fmemcpy() function to copy 
//  463      the inram function to the RAM destination address:
//  464                  memcpy(functionname, // RAM destination address
//  465                       (void @far*)&__address__functionname, // Flash source address
//  466                       (int)&__size__functionname); // Code size of the function
//  467 
//  468  - For IAR Compiler:
//  469     1- Define a location FLASH_CODE before each code function by the mean of 
//  470     " #pragma location = "FLASH_CODE"".
//  471     This location is defined in the stm8l15x_flash.c file, and it's conditionned
//  472     by IAR_RAM_EXECUTION definifition.
//  473   2- Uncomment the "#define IAR_RAM_EXECUTION  (1)" line in the stm8l15x.h file,
//  474     or define it in IAR compiler preprocessor to enable the FLASH_CODE location 
//  475     definition.
//  476   3- Edit the linker file lnkstm8l15xxx.icf available under 
//  477     "$\IAR Systems\Embedded Workbench 6.0\stm8\config\lnkstm8l15xxx.icf"
//  478        by updating the line "initialize by copy { rw, ro section .tiny.rodata };"
//  479        with the the following one:
//  480        "initialize by copy { rw, ro section .tiny.rodata, section FLASH_CODE};".
//  481 
//  482   4- The speed optimization is required to ensure proper execution from RAM.
//  483     -> In IAR Embedded workbench IDE Select Project\Options\C/C++ Compiler\Optimizations
//  484     select speed optimization 
//  485     Note: There is no need to add any specific code in main.c file, everything 
//  486     is handled by the linker in the start up phase.
//  487 
//  488  The Flash_DataProgram example given within the STM8L15x_StdPeriph_Lib package,
//  489  details all the steps described above.
//  490 
//  491 @endcode
//  492 */
//  493 
//  494 /**
//  495   * @brief
//  496   *******************************************************************************
//  497   *                         Execution from RAM enable
//  498   *******************************************************************************
//  499   *
//  500   * To enable execution from RAM you can either uncomment the following defines 
//  501   * in the stm8l15x.h file or define them in your toolchain compiler preprocessor
//  502   * and though depending on the used toolchain.
//  503   * - #define COSMIC_RAM_EXECUTION  (1)    with Cosmic
//  504   * - #define RAISONANCE_RAM_EXECUTION (1) with Raisonance
//  505   * - #define IAR_RAM_EXECUTION  (1)       with IAR
//  506   */
//  507 
//  508 #ifdef COSMIC_RAM_EXECUTION
//  509  #pragma section (FLASH_CODE)
//  510 #endif
//  511 
//  512 /**
//  513   * @brief  Waits for a Flash operation to complete.
//  514   * @note   The call and executin of this function must be done from RAM in case
//  515   *         of Block operation, otherwise it can be executed from Flash
//  516   * @param  FLASH_MemType : Memory type
//  517   *         This parameter can be a value of @ref FLASH_MemType_TypeDef
//  518   * @retval FLASH status
//  519   */
//  520 #ifdef IAR_RAM_EXECUTION
//  521  #pragma location = "FLASH_CODE"
//  522 #endif
//  523 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  524 FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType) IN_RAM
//  525 {
//  526   uint32_t timeout = OPERATION_TIMEOUT;
FLASH_WaitForLastOperation:
        CLRW      X
        LDW       S:?w0, X
        DECW      X
        LDW       S:?w1, X
//  527   uint8_t flagstatus = 0x00;
//  528   /* Wait until operation completion or write protected page occured */
//  529   if (FLASH_MemType == FLASH_MemType_Program)
        CP        A, #0xfd
        JRNE      L:??FLASH_WaitForLastOperation_0
//  530   {
//  531   while ((flagstatus == 0x00) && (timeout != 0x00))
//  532     {
//  533       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
//  534                              FLASH_IAPSR_WR_PG_DIS));
??FLASH_WaitForLastOperation_1:
        LD        A, #0x5
        AND       A, L:0x5054
        LD        S:?b4, A
//  535       timeout--;
        CALL      L:?dec32_l0_l0
//  536     }
        CLR       A
        CP        A, S:?b4
        JRNE      L:??FLASH_WaitForLastOperation_2
        LDW       X, S:?w0
        JRNE      L:??FLASH_WaitForLastOperation_3
        LDW       X, S:?w1
??FLASH_WaitForLastOperation_3:
        JRNE      L:??FLASH_WaitForLastOperation_1
        JRA       L:??FLASH_WaitForLastOperation_4
//  537   }
//  538   else
//  539   {
//  540     while ((flagstatus == 0x00) && (timeout != 0x00))
??FLASH_WaitForLastOperation_5:
        LDW       X, S:?w0
        JRNE      L:??FLASH_WaitForLastOperation_6
        LDW       X, S:?w1
??FLASH_WaitForLastOperation_6:
        JREQ      L:??FLASH_WaitForLastOperation_4
//  541     {
//  542       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
//  543                              FLASH_IAPSR_WR_PG_DIS));
??FLASH_WaitForLastOperation_0:
        LD        A, #0x41
        AND       A, L:0x5054
        LD        S:?b4, A
//  544       timeout--;
        CALL      L:?dec32_l0_l0
//  545     }
        CLR       A
        CP        A, S:?b4
        JREQ      L:??FLASH_WaitForLastOperation_5
//  546   }
//  547   if (timeout == 0x00 )
??FLASH_WaitForLastOperation_2:
        LDW       X, S:?w0
        JRNE      L:??FLASH_WaitForLastOperation_7
        LDW       X, S:?w1
??FLASH_WaitForLastOperation_7:
        JRNE      L:??FLASH_WaitForLastOperation_8
//  548   {
//  549   flagstatus = FLASH_Status_TimeOut;
??FLASH_WaitForLastOperation_4:
        LD        A, #0x2
        LD        S:?b4, A
//  550   }
//  551 
//  552   return((FLASH_Status_TypeDef)flagstatus);
??FLASH_WaitForLastOperation_8:
        LD        A, S:?b4
        RET
//  553 }
//  554 
//  555 /**
//  556   * @brief  Configues the power state for Flash program and data EEPROM during
//  557   *         run, low power run and low power wait modes
//  558   * @note   This function must be called and executed from RAM.
//  559   * @param  FLASH_Power: power state of the Flash program and data EEPROM
//  560   *         This parameter can be a value of @ref FLASH_Power_TypeDef
//  561   * @retval None
//  562   */
//  563 #ifdef IAR_RAM_EXECUTION
//  564  #pragma location = "FLASH_CODE"
//  565 #endif
//  566 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  567 void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power) IN_RAM
//  568 {
//  569   /* Check parameter */
//  570   assert_param(IS_FLASH_POWER(FLASH_Power));
//  571 
//  572   if (FLASH_Power != FLASH_Power_On)
FLASH_PowerRunModeConfig:
        CP        A, #0x1
        JREQ      L:??FLASH_PowerRunModeConfig_0
//  573   {
//  574   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
        BSET      L:0x5050, #0x3
        RET
//  575   }
//  576   else
//  577   {
//  578     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
??FLASH_PowerRunModeConfig_0:
        BRES      L:0x5050, #0x3
//  579   }
//  580 }
        RET
//  581 
//  582 /**
//  583   * @brief  Checks the power status for Flash program and data EEPROM
//  584   * @note   This function should be called and executed from RAM.
//  585   * @param  None
//  586   * @retval Flash program and data EEPROM power status
//  587   *         This parameter can be a value of @ref FLASH_PowerStatus_TypeDef
//  588   */
//  589 #ifdef IAR_RAM_EXECUTION
//  590  #pragma location = "FLASH_CODE"
//  591 #endif
//  592 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  593 FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void) IN_RAM
//  594 {
//  595   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
FLASH_GetPowerStatus:
        LD        A, #0xc
        AND       A, L:0x5050
        RET
//  596 }
//  597 
//  598 /**
//  599   * @brief  Programs a memory block
//  600   * @note   This function should be called and executed from RAM.
//  601   * @param  FLASH_MemType : The type of memory to program
//  602   * @param  BlockNum : The block number
//  603   * @param  FLASH_ProgMode : The programming mode.
//  604   * @param  Buffer : Pointer to buffer containing source data.
//  605   * @retval None.
//  606   */
//  607 #ifdef IAR_RAM_EXECUTION
//  608  #pragma location = "FLASH_CODE"
//  609 #endif
//  610 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  611 void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
//  612                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer) IN_RAM
//  613 {
FLASH_ProgramBlock:
        PUSH      L:?b8
        LDW       S:?w1, X
        MOV       S:?b8, S:?b0
//  614   uint16_t Count = 0;
//  615   uint32_t startaddress = 0;
//  616 
//  617   /* Check parameters */
//  618   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
//  619   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
//  620   if (FLASH_MemType == FLASH_MemType_Program)
        CP        A, #0xfd
        JRNE      L:??FLASH_ProgramBlock_0
//  621   {
//  622   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
//  623     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
        LDW       X, #0x8000
        LDW       S:?w3, X
        SLLW      X
        LDW       S:?w2, X
        JRA       L:??FLASH_ProgramBlock_1
//  624   }
//  625   else
//  626   {
//  627     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
//  628     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
??FLASH_ProgramBlock_0:
        LDW       X, #0x1000
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
//  629   }
//  630 
//  631   /* Point to the first block address */
//  632   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
??FLASH_ProgramBlock_1:
        LDW       S:?w0, X
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x7
        CODE
        CALL      L:?add32_l0_l0_l1
//  633 
//  634   /* Selection of Standard or Fast programming mode */
//  635   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
        CLR       A
        CP        A, S:?b8
        JRNE      L:??FLASH_ProgramBlock_2
//  636   {
//  637   /* Standard programming mode */
//  638   FLASH->CR2 |= FLASH_CR2_PRG;
        BSET      L:0x5051, #0x0
        JRA       L:??FLASH_ProgramBlock_3
//  639   }
//  640   else
//  641   {
//  642   /* Fast programming mode */
//  643   FLASH->CR2 |= FLASH_CR2_FPRG;
??FLASH_ProgramBlock_2:
        BSET      L:0x5051, #0x4
//  644   }
//  645 
//  646   /* Copy data bytes from RAM to FLASH memory */
//  647   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
??FLASH_ProgramBlock_3:
        LDW       X, S:?w1
        LD        A, #0x80
        LD        S:?b0, A
//  648   {
//  649 #if defined (STM8L15X_MD) || defined (STM8L15X_MDP)
//  650   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
??FLASH_ProgramBlock_4:
        LD        A, (Y)
        LD        (X), A
//  651 #elif defined (STM8L15X_HD)
//  652   *((PointerAttr uint8_t*) (uint32_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
//  653 #endif
//  654   }
        INCW      Y
        INCW      X
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b0
        JRNE      L:??FLASH_ProgramBlock_4
//  655 }
        POP       L:?b8
        RET
//  656 
//  657 /**
//  658   * @brief  Erases a block in the program or data memory.
//  659   * @note   This function should be called and executed from RAM.
//  660   * @param  FLASH_MemType :  The type of memory to erase
//  661   * @param  BlockNum : Indicates the block number to erase
//  662   * @retval None.
//  663   */
//  664 #ifdef IAR_RAM_EXECUTION
//  665  #pragma location = "FLASH_CODE"
//  666 #endif
//  667 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  668 void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType) IN_RAM
//  669 {
FLASH_EraseBlock:
        LDW       Y, X
//  670   uint32_t startaddress = 0;
//  671 #if defined (STM8L15X_MD) || defined (STM8L15X_MDP)
//  672   uint32_t PointerAttr  *pwFlash;
//  673 #elif defined (STM8L15X_HD)
//  674   uint8_t PointerAttr  *pwFlash;
//  675 #endif
//  676 
//  677   /* Check parameters */
//  678   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
//  679   if (FLASH_MemType == FLASH_MemType_Program)
        CP        A, #0xfd
        JRNE      L:??FLASH_EraseBlock_0
//  680   {
//  681   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
//  682     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
        LDW       X, #0x8000
        LDW       S:?w1, X
        JRA       L:??FLASH_EraseBlock_1
//  683   }
//  684   else
//  685   {
//  686     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
//  687     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
??FLASH_EraseBlock_0:
        LDW       X, #0x1000
        LDW       S:?w1, X
//  688   }
//  689 
//  690   /* Point to the first block address */
//  691 #if defined (STM8L15X_MD) || defined (STM8L15X_MDP)
//  692   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
//  693 #elif defined (STM8L15X_HD)
//  694   pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
//  695 #endif
//  696 
//  697   /* Enable erase block mode */
//  698   FLASH->CR2 |= FLASH_CR2_ERASE;
??FLASH_EraseBlock_1:
        BSET      L:0x5051, #0x5
//  699 
//  700 #if defined (STM8L15X_MD) || defined (STM8L15X_MDP)
//  701   *pwFlash = (uint32_t)0;
        LDW       X, Y
        SRLW      X
        CLR       A
        RRC       A
        RLWA      X, A
        LDW       Y, S:?w1
        LDW       S:?w0, X
        ADDW      Y, L:?w0
        CLRW      X
        LDW       S:?w0, X
        LDW       X, Y
        LD        A, S:?b0
        LD        (X), A
        LD        (L:0x1,X), A
        LD        (L:0x2,X), A
        LD        (L:0x3,X), A
//  702 #elif defined (STM8L15X_HD)
//  703   *pwFlash = (uint8_t)0;
//  704   *(pwFlash + 1) = (uint8_t)0;
//  705   *(pwFlash + 2) = (uint8_t)0;
//  706   *(pwFlash + 3) = (uint8_t)0;
//  707 #endif
//  708 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  709 
//  710 
//  711 #ifdef COSMIC_RAM_EXECUTION
//  712  /* End of FLASH_CODE section */
//  713  #pragma section ()
//  714 #endif /* COSMIC_RAM_EXECUTION */
//  715 /**
//  716   * @}
//  717   */
//  718 
//  719 /**
//  720   * @}
//  721   */
//  722 
//  723 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 485 bytes in section .near_func.text
// 
// 485 bytes of CODE memory
//
//Errors: none
//Warnings: none
