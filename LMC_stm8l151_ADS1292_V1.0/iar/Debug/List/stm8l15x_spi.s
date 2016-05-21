///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:45 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_spi.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_spi.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_spi.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_spi

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?sll16_x_x_a

        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRCCmd
        PUBLIC SPI_ClearFlag
        PUBLIC SPI_ClearITPendingBit
        PUBLIC SPI_Cmd
        PUBLIC SPI_DMACmd
        PUBLIC SPI_DeInit
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_GetFlagStatus
        PUBLIC SPI_GetITStatus
        PUBLIC SPI_ITConfig
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareCmd
        PUBLIC SPI_ReceiveData
        PUBLIC SPI_ResetCRC
        PUBLIC SPI_SendData
        PUBLIC SPI_TransmitCRC

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_spi.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_spi.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the SPI firmware functions.
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
//   22 #include "stm8l15x_spi.h"
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
//   35 /** @addtogroup SPI_Public_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Deinitializes the SPI peripheral registers to their default reset values.
//   41   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//   42   * @param  None
//   43   * @retval None
//   44   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   45 void SPI_DeInit(SPI_TypeDef* SPIx)
//   46 {
//   47   SPIx->CR1    = SPI_CR1_RESET_VALUE;
SPI_DeInit:
        CLR       A
        LD        (X), A
//   48   SPIx->CR2    = SPI_CR2_RESET_VALUE;
        LDW       Y, X
        INCW      Y
        LD        (Y), A
//   49   SPIx->CR3    = SPI_CR3_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//   50   SPIx->SR     = SPI_SR_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, #0x2
        LD        (Y), A
//   51   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
        ADDW      X, #0x5
        LD        A, #0x7
        LD        (X), A
//   52 }
        RET
//   53 
//   54 /**
//   55   * @brief  Initializes the SPI according to the specified parameters.
//   56   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//   57   * @param  SPI_FirstBit : This parameter can be any of the
//   58   *         @ref SPI_FirstBit_TypeDef enumeration.
//   59   * @param  SPI_BaudRatePrescaler : This parameter can be any of the
//   60   *         @ref SPI_BaudRatePrescaler_TypeDef enumeration.
//   61   * @param  SPI_Mode : This parameter can be any of the  @ref SPI_Mode_TypeDef
//   62   *         enumeration.
//   63   * @param  SPI_CPOL : This parameter can be any of the @ref SPI_CPOL_TypeDef
//   64   *         enumeration.
//   65   * @param  SPI_CPHA : This parameter can be any of the @ref SPI_CPHA_TypeDef
//   66   *         enumeration.
//   67   * @param  SPI_Data_Direction : This parameter can be any of the
//   68   *         @ref SPI_DirectionMode_TypeDef enumeration.
//   69   * @param  SPI_Slave_Management : This parameter can be any of the
//   70   *         @ref SPI_NSS_TypeDef enumeration.
//   71   * @param  CRCPolynomial : Configures the CRC polynomial.
//   72   * @retval None
//   73   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
//   75               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
//   76               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
//   77               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
//   78               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
//   79 {
SPI_Init:
        LDW       Y, X
        LD        S:?b7, A
        LD        A, S:?b0
//   80   /* Check structure elements */
//   81   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
//   82   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
//   83   assert_param(IS_SPI_MODE(SPI_Mode));
//   84   assert_param(IS_SPI_POLARITY(SPI_CPOL));
//   85   assert_param(IS_SPI_PHASE(SPI_CPHA));
//   86   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
//   87   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
//   88   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
//   89 
//   90   /* Frame Format, BaudRate, Clock Polarity and Phase configuration */
//   91   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
//   92                                   (uint8_t)SPI_BaudRatePrescaler) |
//   93                         (uint8_t)((uint8_t)SPI_CPOL |
//   94                                   SPI_CPHA));
        OR        A, S:?b7
        OR        A, S:?b2
        OR        A, S:?b3
        LD        (Y), A
//   95 
//   96   /* Data direction configuration: BDM, BDOE and RXONLY bits */
//   97   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
        INCW      X
        LD        A, S:?b5
        OR        A, S:?b4
        LD        (X), A
//   98 
//   99   if (SPI_Mode == SPI_Mode_Master)
        LD        A, S:?b1
        CP        A, #0x4
        JRNE      L:??SPI_Init_0
//  100   {
//  101     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        JRA       L:??SPI_Init_1
//  102   }
//  103   else
//  104   {
//  105     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
??SPI_Init_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  106   }
//  107 
//  108   /* Master/Slave mode configuration */
//  109   SPIx->CR1 |= (uint8_t)(SPI_Mode);
??SPI_Init_1:
        LD        A, S:?b1
        OR        A, (Y)
        LD        (Y), A
//  110 
//  111   /* CRC configuration */
//  112   SPIx->CRCPR = (uint8_t)CRCPolynomial;
        ADDW      Y, #0x5
        LD        A, S:?b6
        LD        (Y), A
//  113 }
        RET
//  114 
//  115 /**
//  116   * @brief  Enables or disables the SPI peripheral.
//  117   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  118   * @param  NewState New state of the SPI peripheral.
//  119   *         This parameter can be: ENABLE or DISABLE
//  120   * @retval None
//  121   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  122 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
//  123 {
//  124   /* Check function parameters */
//  125   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  126 
//  127   if (NewState != DISABLE)
SPI_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??SPI_Cmd_0
//  128   {
//  129     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
        LD        A, #0x40
        OR        A, (X)
        LD        (X), A
        RET
//  130   }
//  131   else
//  132   {
//  133     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
??SPI_Cmd_0:
        LD        A, #0xbf
        AND       A, (X)
        LD        (X), A
//  134   }
//  135 }
        RET
//  136 
//  137 /**
//  138   * @brief  Enables or disables the specified interrupts.
//  139   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  140   * @param  SPI_IT Specifies the SPI interrupts sources to be enabled or disabled.
//  141   * @param  NewState: The new state of the specified SPI interrupts.
//  142   *         This parameter can be: ENABLE or DISABLE.
//  143   * @retval None
//  144   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  145 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
//  146 {
SPI_ITConfig:
        LDW       Y, X
//  147   uint8_t itpos = 0;
//  148   /* Check function parameters */
//  149   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
//  150   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  151 
//  152   /* Get the SPI IT index */
//  153   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
//  154 
//  155   if (NewState != DISABLE)
        ADDW      Y, #0x2
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SPI_ITConfig_0
//  156   {
//  157     SPIx->CR3 |= itpos; /* Enable interrupt*/
        LD        A, S:?b1
        OR        A, (Y)
        LD        (Y), A
        RET
//  158   }
//  159   else
//  160   {
//  161     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
??SPI_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (Y)
        LD        (Y), A
//  162   }
//  163 }
        RET
//  164 /**
//  165   * @brief  Transmits a Data through the SPI peripheral.
//  166   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  167   * @param  Data : Byte to be transmitted.
//  168   * @retval None
//  169   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  170 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
//  171 {
//  172   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
SPI_SendData:
        ADDW      X, #0x4
        LD        (X), A
//  173 }
        RET
//  174 
//  175 /**
//  176   * @brief  Returns the most recent received data by the SPI peripheral.
//  177   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  178   * @retval The value of the received data.
//  179   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  180 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
//  181 {
//  182   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
SPI_ReceiveData:
        ADDW      X, #0x4
        LD        A, (X)
        RET
//  183 }
//  184 
//  185 /**
//  186   * @brief  Configures internally by software the NSS pin.
//  187   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  188   * @param  NewState Indicates the new state of the SPI Software slave management.
//  189   *         This parameter can be: ENABLE or DISABLE.
//  190   * @retval None
//  191   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  192 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
//  193 {
//  194   /* Check function parameters */
//  195   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  196 
//  197   if (NewState != DISABLE)
SPI_NSSInternalSoftwareCmd:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??SPI_NSSInternalSoftwareCmd_0
//  198   {
//  199     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  200   }
//  201   else
//  202   {
//  203     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
??SPI_NSSInternalSoftwareCmd_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  204   }
//  205 }
        RET
//  206 
//  207 /**
//  208   * @brief  Enables the transmit of the CRC value.
//  209   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
//  213 {
//  214   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
SPI_TransmitCRC:
        INCW      X
        LD        A, #0x10
        OR        A, (X)
        LD        (X), A
//  215 }
        RET
//  216 
//  217 /**
//  218   * @brief  Enables or disables the CRC value calculation of the transfered bytes.
//  219   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  220   * @param  NewState Indicates the new state of the SPI CRC value calculation.
//  221   *         This parameter can be: ENABLE or DISABLE.
//  222   * @retval None
//  223   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  224 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
//  225 {
//  226   /* Check function parameters */
//  227   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  228 
//  229   /* SPI must be disable forcorrect operation od Hardware CRC calculation */
//  230   SPI_Cmd(SPI1, DISABLE);
SPI_CalculateCRCCmd:
        BRES      L:0x5200, #0x6
//  231 
//  232   if (NewState != DISABLE)
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??SPI_CalculateCRCCmd_0
//  233   {
//  234     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
        LD        A, #0x20
        OR        A, (X)
        LD        (X), A
        RET
//  235   }
//  236   else
//  237   {
//  238     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
??SPI_CalculateCRCCmd_0:
        LD        A, #0xdf
        AND       A, (X)
        LD        (X), A
//  239   }
//  240 }
        RET
//  241 
//  242 /**
//  243   * @brief  Returns the transmit or the receive CRC register value.
//  244   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  245   * @param  SPI_CRC Specifies the CRC register to be read.
//  246   * @retval The selected CRC register value.
//  247   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  248 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
//  249 {
//  250   uint8_t crcreg = 0;
//  251 
//  252   /* Check function parameters */
//  253   assert_param(IS_SPI_CRC(SPI_CRC));
//  254 
//  255   if (SPI_CRC != SPI_CRC_RX)
SPI_GetCRC:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??SPI_GetCRC_0
//  256   {
//  257     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
        ADDW      X, #0x7
        LD        A, (X)
        RET
//  258   }
//  259   else
//  260   {
//  261     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
??SPI_GetCRC_0:
        ADDW      X, #0x6
        LD        A, (X)
//  262   }
//  263 
//  264   /* Return the selected CRC register status*/
//  265   return crcreg;
        RET
//  266 }
//  267 
//  268 /**
//  269   * @brief  Reset the Rx CRCR and Tx CRCR registers.
//  270   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  271   * @retval None
//  272   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  273 void SPI_ResetCRC(SPI_TypeDef* SPIx)
//  274 {
SPI_ResetCRC:
        LDW       Y, X
//  275   /* Rx CRCR & Tx CRCR registers are reset when CRCEN (hardware calculation)
//  276      bit in SPI_CR2 is written to 1 (enable) */
//  277   SPI_CalculateCRCCmd(SPIx, ENABLE);
        LD        A, #0x1
        CALL      L:SPI_CalculateCRCCmd
//  278 
//  279   /* Previous function disable the SPI */
//  280   SPI_Cmd(SPIx, ENABLE);
        LD        A, #0x40
        OR        A, (Y)
        LD        (Y), A
//  281 }
        RET
//  282 
//  283 /**
//  284   * @brief  Returns the CRC Polynomial register value.
//  285   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  286   * @retval uint8_t The CRC Polynomial register value.
//  287   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  288 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
//  289 {
//  290   return SPIx->CRCPR; /* Return the CRC polynomial register */
SPI_GetCRCPolynomial:
        ADDW      X, #0x5
        LD        A, (X)
        RET
//  291 }
//  292 
//  293 /**
//  294   * @brief  Selects the data transfer direction in bi-directional mode.
//  295   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  296   * @param  SPI_Direction Specifies the data transfer direction in bi-directional mode.
//  297   * @retval None
//  298   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  299 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
//  300 {
//  301   /* Check function parameters */
//  302   assert_param(IS_SPI_DIRECTION(SPI_Direction));
//  303 
//  304   if (SPI_Direction != SPI_Direction_Rx)
SPI_BiDirectionalLineConfig:
        INCW      X
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??SPI_BiDirectionalLineConfig_0
//  305   {
//  306     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
        LD        A, #0x40
        OR        A, (X)
        LD        (X), A
        RET
//  307   }
//  308   else
//  309   {
//  310     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
??SPI_BiDirectionalLineConfig_0:
        LD        A, #0xbf
        AND       A, (X)
        LD        (X), A
//  311   }
//  312 }
        RET
//  313 /**
//  314   * @brief  Enables or disables the SPI DMA interface.
//  315   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  316   * @param  SPI_DMAReq Specifies the SPI DMA transfer request to be enabled or disabled.
//  317   *         This parameter can be any of the @ref SPI_DMAReq_TypeDef enumeration.
//  318   * @param  NewState Indicates the new state of the SPI DMA request.
//  319   *         This parameter can be any of the @ref FunctionalState enumeration.
//  320   * @retval None
//  321   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  322 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
//  323 {
SPI_DMACmd:
        LD        S:?b1, A
//  324   /* Check the parameters */
//  325   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  326   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
//  327 
//  328   if (NewState != DISABLE)
        ADDW      X, #0x2
        CLR       A
        CP        A, S:?b0
        JREQ      L:??SPI_DMACmd_0
//  329   {
//  330     /* Enable the selected SPI DMA requests */
//  331     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        RET
//  332   }
//  333   else
//  334   {
//  335     /* Disable the selected SPI DMA requests */
//  336     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
??SPI_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  337   }
//  338 }
        RET
//  339 /**
//  340   * @brief  Checks whether the specified SPI flag is set or not.
//  341   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  342   * @param  SPI_FLAG : Specifies the flag to check.
//  343   *         This parameter can be any of the @ref SPI_FLAG_TypeDef enumeration.
//  344   * @retval FlagStatus : Indicates the state of SPI_FLAG.
//  345   *         This parameter can be any of the @ref FlagStatus enumeration.
//  346   */
//  347 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  348 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
//  349 {
//  350   FlagStatus status = RESET;
//  351   /* Check parameters */
//  352   assert_param(IS_SPI_FLAG(SPI_FLAG));
//  353 
//  354   /* Check the status of the specified SPI flag */
//  355   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
SPI_GetFlagStatus:
        ADDW      X, #0x3
        AND       A, (X)
        JREQ      L:??SPI_GetFlagStatus_0
//  356   {
//  357     status = SET; /* SPI_FLAG is set */
        LD        A, #0x1
        RET
//  358   }
//  359   else
//  360   {
//  361     status = RESET; /* SPI_FLAG is reset*/
??SPI_GetFlagStatus_0:
        CLR       A
//  362   }
//  363 
//  364   /* Return the SPI_FLAG status */
//  365   return status;
        RET
//  366 }
//  367 
//  368 /**
//  369   * @brief  Clears the SPI flags.
//  370   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  371   * @param  SPI_FLAG : Specifies the flag to clear.
//  372   *         This parameter can be one of the following values:
//  373   *         - SPI_FLAG_CRCERR
//  374   *         - SPI_FLAG_WKUP
//  375   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software
//  376   *         sequence:
//  377   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  378   *         a read operation to SPI_SR register (SPI_GetFlagStatus()).
//  379   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  380   *         a read/write operation to SPI_SR register (SPI_GetFlagStatus()) followed by
//  381   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  382   * @retval None
//  383   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  384 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
//  385 {
//  386   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
//  387   /* Clear the flag bit */
//  388   SPIx->SR = (uint8_t)(~SPI_FLAG);
SPI_ClearFlag:
        ADDW      X, #0x3
        CPL       A
        LD        (X), A
//  389 }
        RET
//  390 
//  391 /**
//  392   * @brief  Checks whether the specified interrupt has occurred or not.
//  393   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  394   * @param  SPI_IT: Specifies the SPI interrupt pending bit to check.
//  395   *         This parameter can be one of the following values:
//  396   *         - SPI_IT_CRCERR
//  397   *         - SPI_IT_WKUP
//  398   *         - SPI_IT_OVR
//  399   *         - SPI_IT_MODF
//  400   *         - SPI_IT_RXNE
//  401   *         - SPI_IT_TXE
//  402   * @retval ITStatus : Indicates the state of the SPI_IT.
//  403   *         This parameter can be any of the @ref ITStatus enumeration.
//  404   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  405 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
//  406 {
SPI_GetITStatus:
        SUB       SP, #0x1
        LDW       Y, X
        LD        S:?b0, A
//  407   ITStatus pendingbitstatus = RESET;
//  408   uint8_t itpos = 0;
//  409   uint8_t itmask1 = 0;
//  410   uint8_t itmask2 = 0;
//  411   __IO uint8_t enablestatus = 0;
        CLR       A
        LD        (0x1,SP), A
//  412   assert_param(IS_SPI_GET_IT(SPI_IT));
//  413   /* Get the SPI IT index */
//  414   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
//  415 
//  416   /* Get the SPI IT mask */
//  417   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
//  418   /* Set the IT mask */
//  419   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
//  420   /* Get the SPI_IT enable bit status */
//  421   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LDW       X, Y
        ADDW      X, #0x3
        AND       A, (X)
        LD        (0x1,SP), A
//  422   /* Check the status of the specified SPI interrupt */
//  423   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
        LD        A, S:?b0
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        ADDW      Y, #0x2
        AND       A, (Y)
        JREQ      L:??SPI_GetITStatus_0
        CLR       A
        CP        A, (0x1,SP)
        JREQ      L:??SPI_GetITStatus_0
//  424   {
//  425     /* SPI_IT is set */
//  426     pendingbitstatus = SET;
        LD        A, #0x1
        JRA       L:??SPI_GetITStatus_1
//  427   }
//  428   else
//  429   {
//  430     /* SPI_IT is reset */
//  431     pendingbitstatus = RESET;
??SPI_GetITStatus_0:
        CLR       A
//  432   }
//  433   /* Return the SPI_IT status */
//  434   return  pendingbitstatus;
??SPI_GetITStatus_1:
        ADD       SP, #0x1
        RET
//  435 }
//  436 
//  437 /**
//  438   * @brief  Clears the interrupt pending bits.
//  439   * @param  SPIx : where x can be 1 to select the specified SPI peripheral.
//  440   * @param  SPI_IT: Specifies the interrupt pending bit to clear.
//  441   *         This parameter can be one of the following values:
//  442   *         - SPI_IT_CRCERR
//  443   *         - SPI_IT_WKUP
//  444   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software sequence:
//  445   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  446   *         a read operation to SPI_SR register (SPI_GetITStatus()).
//  447   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  448   *         a read/write operation to SPI_SR register (SPI_GetITStatus()) followed by
//  449   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  450   * @retval None
//  451   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  452 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
//  453 {
SPI_ClearITPendingBit:
        LDW       Y, X
//  454   uint8_t itpos = 0;
//  455   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
//  456 
//  457   /* Clear  SPI_IT_CRCERR or SPI_IT_WKUP interrupt pending bits */
//  458 
//  459   /* Get the SPI pending bit index */
//  460   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
//  461   /* Clear the pending bit */
//  462   SPIx->SR = (uint8_t)(~itpos);
        SWAP      A
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        ADDW      Y, #0x3
        LD        (Y), A
//  463 
//  464 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  465 /**
//  466   * @}
//  467   */
//  468 
//  469 /**
//  470   * @}
//  471   */
//  472 
//  473 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 379 bytes in section .near_func.text
// 
// 379 bytes of CODE memory
//
//Errors: none
//Warnings: none
