///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:56:49 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_dma.c        /
//    Command line =  E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_dma.c -e     /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ --vregs 16    /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\stm8l15x_dma.s   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8l15x_dma

        EXTERN ?b0
        EXTERN ?b1
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
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w7

        PUBLIC DMA_ClearFlag
        PUBLIC DMA_ClearITPendingBit
        PUBLIC DMA_Cmd
        PUBLIC DMA_DeInit
        PUBLIC DMA_GetCurrDataCounter
        PUBLIC DMA_GetFlagStatus
        PUBLIC DMA_GetITStatus
        PUBLIC DMA_GlobalCmd
        PUBLIC DMA_GlobalDeInit
        PUBLIC DMA_ITConfig
        PUBLIC DMA_Init
        PUBLIC DMA_SetCurrDataCounter
        PUBLIC DMA_SetTimeOut

// E:\HWT\io\stm8l152_demo\fwlib\src\stm8l15x_dma.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_dma.c
//    4   * @author  MCD Application Team
//    5   * @version V1.4.0
//    6   * @date    09/24/2010
//    7   * @brief   This file provides all the DMA firmware functions.
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
//   22 #include "stm8l15x_dma.h"
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
//   36     * @addtogroup DMA_Public_Functions
//   37     * @{
//   38     */
//   39 
//   40 /**
//   41   * @brief  Deinitializes the DMA Global & Status register to its default reset
//   42   *         values.
//   43   * @param  None
//   44   * @retval None
//   45   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   46 void DMA_GlobalDeInit(void)
//   47 {
//   48   /* Disable the  DMA    */
//   49   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
DMA_GlobalDeInit:
        BRES      L:0x5070, #0x0
//   50 
//   51   /* Reset DMA Channelx control register */
//   52   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
        LD        A, #0xfc
        LD        L:0x5070, A
//   53 }
        RET
//   54 
//   55 /**
//   56   * @brief  Deinitializes the DMA Channelx registers to their default reset values.
//   57   * @param  DMA_Channelx : selects the DMA Channelx where x can be 0 to 3
//   58   * @retval None
//   59   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
//   61 {
//   62   /* Check the parameters */
//   63   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
//   64 
//   65   /* Disable the selected DMA Channelx */
//   66   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
DMA_DeInit:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//   67 
//   68   /* Reset DMA Channelx control register */
//   69   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
        CLR       A
        LD        (X), A
//   70 
//   71   /* Reset DMA Channelx remaining bytes register */
//   72   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//   73 
//   74   /* Reset DMA Channelx peripheral address register */
//   75   if (DMA_Channelx == DMA1_Channel3)
        CPW       X, #0x5093
        JRNE      L:??DMA_DeInit_0
//   76   {
//   77     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
        LD        A, #0x40
        LD        L:0x5096, A
//   78     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
        CLR       A
        LD        L:0x5098, A
        JRA       L:??DMA_DeInit_1
//   79   }
//   80   else
//   81   {
//   82     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
??DMA_DeInit_0:
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, #0x52
        LD        (Y), A
//   83   }
//   84   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
??DMA_DeInit_1:
        LDW       Y, X
        ADDW      Y, #0x4
        CLR       A
        LD        (Y), A
//   85 
//   86   /* Reset DMA Channelx memory address register */
//   87   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x6
        LD        (Y), A
//   88   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
        LDW       Y, X
        ADDW      Y, #0x7
        LD        (Y), A
//   89 
//   90   /* Reset interrupt pending bits for DMA Channel */
//   91   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
        INCW      X
        LD        (X), A
//   92 }
        RET
//   93 
//   94 
//   95 /**
//   96   * @brief  Initializes the DMA Channelx according to the specified parameters.
//   97   * @param  DMA_Channelx : selects the DMA Channelx where x can be 0 to 3
//   98   * @param  DMA_Memory0BaseAddr : Specifies  Memory 0 Base Address
//   99   * @param  DMA_PeripheralMemory1BaseAddr : Specifies DMA channelx Peripheral Base
//  100   *         Address (if data is from/to  peripheral) or DMA channelx Memory1 Base
//  101   *         Address (if data is from Memory0 to Memory1).
//  102   * @param  DMA_BufferSize : Specifies the size of the DMA channelx Buffer.
//  103   *         This parameter must be a value greater than 0.
//  104   * @param  DMA_DIR : Specifies the DMA channelx transfer direction.
//  105   *         This parameter can be a value of @ref DMA_DIR_TypeDef.
//  106   * @param  DMA_Mode : Specifies the DMA channelx mode.
//  107   *         This parameter can be a value of @ref DMA_Mode_TypeDef
//  108   * @param  DMA_MemoryIncMode : Specifies the DMA channelx memory
//  109   *         Incrementation/Decrementation mode, this parameter can be a value of
//  110   *         @ref DMA_MemoryIncMode_TypeDef.
//  111   * @param  DMA_Priority : Specifies the DMA channelx priority.
//  112   *         This parameter can be a value of @ref  DMA_Priority_TypeDef
//  113   * @param  DMA_MemoryDataSize : Specifies the DMA channelx transfer Data size.
//  114   *         This parameter can be a value of @ref DMA_MemoryDataSize_TypeDef.
//  115   * @retval None
//  116   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  117 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
//  118               uint32_t DMA_Memory0BaseAddr,
//  119               uint16_t DMA_PeripheralMemory1BaseAddr,
//  120               uint8_t DMA_BufferSize,
//  121               DMA_DIR_TypeDef DMA_DIR,
//  122               DMA_Mode_TypeDef DMA_Mode,
//  123               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
//  124               DMA_Priority_TypeDef DMA_Priority,
//  125               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
//  126 {
DMA_Init:
        PUSH      L:?b15
        PUSH      L:?b14
        PUSH      L:?b13
        PUSH      L:?b12
        PUSH      L:?b9
        PUSH      L:?b8
        LDW       S:?w4, X
        MOV       S:?b15, S:?b3
        MOV       S:?b14, S:?b2
        MOV       S:?b13, S:?b1
        LD        S:?b0, A
        LD        A, (0x9,SP)
        LD        S:?b1, A
//  127   /* Check the parameters */
//  128   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
//  129   assert_param(IS_DMA_DIR(DMA_DIR));
//  130   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
//  131   assert_param(IS_DMA_MODE(DMA_Mode));
//  132   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
//  133   assert_param(IS_DMA_PRIORITY(DMA_Priority));
//  134 
//  135   /*--------------------------- DMA Channelx CCR Configuration -----------------*/
//  136   /* Disable the selected DMA Channelx */
//  137   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
        LD        A, #0xfe
        AND       A, [S:?w4.w]
        LD        [S:?w4.w], A
//  138 
//  139   /* Reset DMA Channelx control register */
//  140   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
        CLR       A
        LD        [S:?w4.w], A
//  141 
//  142   /* Set DMA direction & Mode & Incremantal Memory mode */
//  143   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | (uint8_t)DMA_Mode) | (uint8_t)DMA_MemoryIncMode);
        LD        A, S:?b5
        OR        A, S:?b4
        OR        A, S:?b6
        OR        A, [S:?w4.w]
        LD        [S:?w4.w], A
//  144 
//  145   /*Clear old priority and memory data size  option */
//  146   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
        INCW      X
        LD        A, #0xc7
        AND       A, (X)
        LD        (X), A
//  147 
//  148   /* Set old priority and memory data size  option */
//  149   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | (uint8_t)DMA_MemoryDataSize);
        LD        A, S:?b1
        OR        A, S:?b7
        OR        A, (X)
        LD        (X), A
//  150 
//  151   /*--------------------------- DMA Channelx CNDTR Configuration ---------------*/
//  152   /* Write to DMA Channelx CNDTR */
//  153   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
        LDW       X, S:?w4
        ADDW      X, #0x2
        LD        A, S:?b0
        LD        (X), A
//  154 
//  155   /*--------------------------- DMA Channelx CPAR Configuration ----------------*/
//  156   /* Write to DMA Channelx (0, 1 or 2)  Peripheral address  or  Write to DMA Channel 3 Memory 1 address  */
//  157   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
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
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  158   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, YL
        LD        (X), A
//  159 
//  160   /*--------------------------- DMA Channelx CMAR Configuration ----------------*/
//  161   /* Write to DMA Channelx Memory address */
//  162   if (DMA_Channelx == DMA1_Channel3)
        LDW       X, S:?w4
        CPW       X, #0x5093
        JRNE      L:??DMA_Init_0
//  163   {
//  164     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
        MOV       S:?b1, S:?b13
        MOV       S:?b3, S:?b1
        LD        A, S:?b3
        LD        L:0x5098, A
//  165   }
//  166   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
??DMA_Init_0:
        LDW       X, S:?w7
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        (X), A
//  167   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
        LD        A, S:?b15
        LDW       X, S:?w4
        ADDW      X, #0x7
        LD        (X), A
//  168 
//  169 }
        POP       L:?b8
        POP       L:?b9
        POP       L:?b12
        POP       L:?b13
        POP       L:?b14
        POP       L:?b15
        RET
//  170 
//  171 /**
//  172   * @brief  Enables or disables All the DMA.
//  173   * @param  NewState: new state of the DMA. This parameter can be: ENABLE or DISABLE.
//  174   * @retval None
//  175   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  176 void DMA_GlobalCmd(FunctionalState NewState)
//  177 {
//  178   /* Check the parameters */
//  179   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  180 
//  181   if (NewState != DISABLE)
DMA_GlobalCmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??DMA_GlobalCmd_0
//  182   {
//  183     /* Enable the  DMA      */
//  184     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
        BSET      L:0x5070, #0x0
        RET
//  185   }
//  186   else
//  187   {
//  188     /* Disable the DMA */
//  189     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
??DMA_GlobalCmd_0:
        BRES      L:0x5070, #0x0
//  190   }
//  191 }
        RET
//  192 
//  193 /**
//  194   * @brief  Enables or disables the specified DMA Channelx.
//  195   * @note   DMA_GlobalCmd function must be called first to enable or disable
//  196   *         the global DMA.
//  197   * @param  DMA_Channelx : selects the DMA Channelx where x can be 0 to 3
//  198   * @param  NewState: new state of the DMA Channelx.
//  199   *         This parameter can be: ENABLE or DISABLE.
//  200   * @retval None
//  201   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  202 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
//  203 {
//  204   /* Check the parameters */
//  205   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
//  206   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  207 
//  208   if (NewState != DISABLE)
DMA_Cmd:
        CLR       S:?b0
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, S:?b1
        JREQ      L:??DMA_Cmd_0
//  209   {
//  210     /* Enable the selected DMA Channelx */
//  211     DMA_Channelx->CCR |= DMA_CCR_CE;
        LD        A, #0x1
        OR        A, (X)
        LD        (X), A
        RET
//  212   }
//  213   else
//  214   {
//  215     /* Disable the selected DMA Channelx */
//  216     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
??DMA_Cmd_0:
        LD        A, #0xfe
        AND       A, (X)
        LD        (X), A
//  217   }
//  218 }
        RET
//  219 
//  220 /**
//  221   * @brief  Enables or disables the specified DMA Channelx interrupts.
//  222   * @param  DMA_Channelx : selects the DMA Channelx where x can be 0 to 3
//  223   * @param  DMA_ITx: specifies the DMA interrupts sources to be enabled or disabled.
//  224   *         This parameter can be any combination of values of @ref DMA_ITx_TypeDef.
//  225   * @param  NewState: new state of the specified DMA interrupts.
//  226     *       This parameter can be: ENABLE or DISABLE.
//  227   * @retval None
//  228   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  229 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, DMA_ITx_TypeDef DMA_ITx,
//  230                   FunctionalState NewState)
//  231 {
DMA_ITConfig:
        LD        S:?b1, A
//  232   /* Check the parameters */
//  233   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
//  234   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
//  235   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  236 
//  237   if (NewState != DISABLE)
        CLR       A
        CP        A, S:?b0
        JREQ      L:??DMA_ITConfig_0
//  238   {
//  239     /* Enable the selected DMA interrupts */
//  240     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        RET
//  241   }
//  242   else
//  243   {
//  244     /* Disable the selected DMA interrupts */
//  245     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
??DMA_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
        LD        (X), A
//  246   }
//  247 }
        RET
//  248 
//  249 /**
//  250   * @brief  Sets the Time out Value.
//  251   * @param  DMA_TimeOut: an integer from 0 to 63
//  252   *         If DMA_TimeOut = 0, TimeOut functionnality is disactived
//  253   * @retval None
//  254   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  255 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
//  256 {
DMA_SetTimeOut:
        LD        S:?b0, A
//  257   /* Check the parameters */
//  258   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
//  259 
//  260   /* set the time out ,  GB and GE must be = 0 */
//  261   DMA1->GCSR = 0;
        CLR       A
        LD        L:0x5070, A
//  262   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
        LD        A, S:?b0
        SLL       A
        SLL       A
        LD        L:0x5070, A
//  263 }
        RET
//  264 /**
//  265   * @brief  Set the number of data units to transfer for DMA Channelx.
//  266   * @param  DMA_Channelx : selects the DMA Channelx where x can be 0 to 3
//  267   * @param  DMA_Counter :  The number of  data units to transfer,
//  268   *         it can be any value from 0 to 255
//  269   * @retval None
//  270   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  271 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DMA_Counter)
//  272 {
//  273   /* Check the parameters */
//  274   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
//  275 
//  276   /*Set the number of data units for DMA Channelx */
//  277   DMA_Channelx->CNBTR = DMA_Counter;
DMA_SetCurrDataCounter:
        ADDW      X, #0x2
        LD        (X), A
//  278 }
        RET
//  279 
//  280 /**
//  281   * @brief  Returns the number of remaining data units in the current DMA
//  282   *         Channelx transfer.
//  283   * @param  DMA_Channelx : selects the DMA Channelx where x can be 0 to 3
//  284   * @retval The number of remaining data units in the current DMA Channelx
//  285   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  286 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
//  287 {
//  288   /* Check the parameters */
//  289   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
//  290 
//  291   /* Return the number of remaining data units for DMA Channelx */
//  292   return ((uint8_t)(DMA_Channelx->CNBTR));
DMA_GetCurrDataCounter:
        ADDW      X, #0x2
        LD        A, (X)
        RET
//  293 }
//  294 
//  295 /**
//  296   * @brief  Checks whether the specified DMA Channelx flag is set or not.
//  297   * @param  DMA_FLAG: specifies the flag to check.
//  298   *         This parameter can be a value of @ref DMA_FLAG_TypeDef
//  299   * @retval FlagStatus: The status of DMA_FLAG (SET or RESET).
//  300   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  301 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
//  302 {
//  303   FlagStatus flagstatus = RESET;
//  304   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
//  305   uint8_t tmpgir1 = 0;
//  306   uint8_t tmpgcsr = 0;
//  307 
//  308   /* Check the parameters */
//  309   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
//  310 
//  311   /* Get flags registers values*/
//  312   tmpgcsr = DMA1->GCSR;
DMA_GetFlagStatus:
        LD        A, L:0x5070
        LD        S:?b0, A
//  313   tmpgir1 = DMA1->GIR1;
        LD        A, L:0x5071
//  314 
//  315   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
        LDW       Y, X
        RLWA      X, A
        AND       A, #0xf
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        LDW       Y, X
        JREQ      L:??DMA_GetFlagStatus_0
//  316   {
//  317     /* find  the used DMA  channel */
//  318     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        JREQ      L:??DMA_GetFlagStatus_1
//  319     {
//  320       DMA_Channelx = DMA1_Channel0;
        LDW       Y, #0x5075
        JRA       L:??DMA_GetFlagStatus_2
//  321     }
//  322     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
??DMA_GetFlagStatus_1:
        LDW       Y, X
        RLWA      X, A
        AND       A, #0x2
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        JREQ      L:??DMA_GetFlagStatus_3
//  323     {
//  324       DMA_Channelx = DMA1_Channel1;
        LDW       Y, #0x507f
        JRA       L:??DMA_GetFlagStatus_2
//  325     }
//  326     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
??DMA_GetFlagStatus_3:
        LDW       Y, X
        RLWA      X, A
        AND       A, #0x4
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        JREQ      L:??DMA_GetFlagStatus_4
//  327     {
//  328       DMA_Channelx = DMA1_Channel2;
        LDW       Y, #0x5089
        JRA       L:??DMA_GetFlagStatus_2
//  329     }
//  330     else
//  331     {
//  332       DMA_Channelx = DMA1_Channel3;
??DMA_GetFlagStatus_4:
        LDW       Y, #0x5093
//  333     }
//  334 
//  335     /*   Get the specified DMA Channelx flag status. */
//  336     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
??DMA_GetFlagStatus_2:
        INCW      Y
        LD        A, XL
        AND       A, (Y)
        JREQ      L:??DMA_GetFlagStatus_5
??DMA_GetFlagStatus_6:
        LD        A, #0x1
        RET
//  337   }
//  338   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
??DMA_GetFlagStatus_0:
        RLWA      X, A
        AND       A, #0x10
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        JREQ      L:??DMA_GetFlagStatus_7
//  339   {
//  340     /*   Get the specified DMA Channelx flag status. */
//  341     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, S:?b1
        JRNE      L:??DMA_GetFlagStatus_6
??DMA_GetFlagStatus_5:
        CLR       A
        RET
//  342   }
//  343   else /*if ((DMA_FLAG & DMA_FLAG_GB) != (uint16_t)RESET)*/
//  344   {
//  345     /*   Get the specified DMA Channelx flag status. */
//  346     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
??DMA_GetFlagStatus_7:
        LD        A, S:?b0
        AND       A, #0x2
        JREQ      L:??DMA_GetFlagStatus_8
        LD        A, #0x1
        RET
??DMA_GetFlagStatus_8:
        CLR       A
//  347   }
//  348 
//  349   /*  Return the specified DMA Channelx flag status. */
//  350   return (flagstatus);
        RET
//  351 }
//  352 
//  353 /**
//  354   * @brief  Clears the DMA Channels selected flags.
//  355   * @param  DMA_FLAG: specifies the flag to clear.
//  356   *         This parameter can be a value of (or a combination for the same DMA
//  357   *         channel) of @ref DMA_FLAG_TypeDef
//  358   * @retval None
//  359   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  360 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
//  361 {
DMA_ClearFlag:
        LDW       S:?w0, X
//  362   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
        LDW       X, #0x5075
//  363 
//  364   /* Check the parameters */
//  365   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
//  366 
//  367   /* Identify  the used DMA  channel */
//  368   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
        LDW       Y, S:?w0
        EXGW      X, Y
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        TNZW      Y
        JRNE      L:??DMA_ClearFlag_0
//  369   {
//  370     DMA_Channelx = DMA1_Channel0;
//  371   }
//  372   else
//  373   {
//  374     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
        LDW       X, S:?w0
        RLWA      X, A
        AND       A, #0x2
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        JREQ      L:??DMA_ClearFlag_1
//  375     {
//  376       DMA_Channelx = DMA1_Channel1;
        LDW       X, #0x507f
        JRA       L:??DMA_ClearFlag_0
//  377     }
//  378     else
//  379     {
//  380       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
??DMA_ClearFlag_1:
        LDW       X, S:?w0
        RLWA      X, A
        AND       A, #0x4
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        JREQ      L:??DMA_ClearFlag_2
//  381       {
//  382         DMA_Channelx = DMA1_Channel2;
        LDW       X, #0x5089
        JRA       L:??DMA_ClearFlag_0
//  383       }
//  384       else
//  385       {
//  386         DMA_Channelx = DMA1_Channel3;
??DMA_ClearFlag_2:
        LDW       X, #0x5093
//  387       }
//  388     }
//  389   }
//  390 
//  391   /*Clears the DMA flags.*/
//  392   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
??DMA_ClearFlag_0:
        INCW      X
        LD        A, S:?b1
        AND       A, #0x6
        CPL       A
        AND       A, (X)
        LD        (X), A
//  393 }
        RET
//  394 
//  395 /**
//  396   * @brief  Checks whether the specified DMA Channelx interrupt has occurred or not.
//  397   * @param  DMA_IT: specifies the DMA interrupt source to check.
//  398   *         This parameter can be a value of @ref DMA_IT_TypeDef
//  399   * @retval ITStatus: The status of DMA_IT (SET or RESET).
//  400   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  401 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
//  402 {
DMA_GetITStatus:
        LD        S:?b1, A
//  403   ITStatus itstatus = RESET;
//  404   uint8_t tmpreg = 0;
//  405   uint8_t tmp2 = 0;
//  406   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
//  407 
//  408   /* Check the parameters */
//  409   assert_param(IS_DMA_GET_IT(DMA_IT));
//  410 
//  411   /* Identify  the used DMA  channel */
//  412   if ((DMA_IT & 0x10) != (uint8_t)RESET)
        AND       A, #0x10
        JREQ      L:??DMA_GetITStatus_0
//  413   {
//  414     DMA_Channelx = DMA1_Channel0;
        LDW       X, #0x5075
        JRA       L:??DMA_GetITStatus_1
//  415   }
//  416   else
//  417   {
//  418     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
??DMA_GetITStatus_0:
        LD        A, S:?b1
        AND       A, #0x20
        JREQ      L:??DMA_GetITStatus_2
//  419     {
//  420       DMA_Channelx = DMA1_Channel1;
        LDW       X, #0x507f
        JRA       L:??DMA_GetITStatus_1
//  421     }
//  422     else
//  423     {
//  424       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
??DMA_GetITStatus_2:
        LD        A, S:?b1
        AND       A, #0x40
        JREQ      L:??DMA_GetITStatus_3
//  425       {
//  426         DMA_Channelx = DMA1_Channel2;
        LDW       X, #0x5089
        JRA       L:??DMA_GetITStatus_1
//  427       }
//  428       else
//  429       {
//  430         DMA_Channelx = DMA1_Channel3;
??DMA_GetITStatus_3:
        LDW       X, #0x5093
//  431       }
//  432     }
//  433   }
//  434   /*   Get the specified DMA Channelx interrupt status. */
//  435   tmpreg =  DMA_Channelx->CSPR ;
??DMA_GetITStatus_1:
        LDW       Y, X
        INCW      Y
        LD        A, (Y)
        LD        S:?b0, A
//  436   tmpreg &= DMA_Channelx->CCR ;
        LD        A, (X)
//  437   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
//  438   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
        AND       A, S:?b0
        AND       A, S:?b1
        AND       A, #0x6
        JREQ      L:??DMA_GetITStatus_4
        LD        A, #0x1
        RET
??DMA_GetITStatus_4:
        CLR       A
//  439 
//  440   /*   Return the specified DMA Channelx interrupt status. */
//  441   return (itstatus);
        RET
//  442 }
//  443 
//  444 /**
//  445   * @brief  Clears the DMA Channelx’s interrupt pending bits.
//  446   * @param  DMA_IT: specifies the DMA interrupt pending bit to clear.
//  447   *         This parameter can be a value of (or a combination for the same
//  448   *         DMA channel) of @ref DMA_IT_TypeDef
//  449   * @retval None
//  450   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  451 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
//  452 {
DMA_ClearITPendingBit:
        LD        S:?b0, A
//  453   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
        LDW       X, #0x5075
//  454 
//  455   /* Check the parameters */
//  456   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
//  457   /* Identify  the used DMA  channel */
//  458   if ((DMA_IT & 0x10) != (uint8_t)RESET)
        AND       A, #0x10
        JRNE      L:??DMA_ClearITPendingBit_0
//  459   {
//  460     DMA_Channelx = DMA1_Channel0;
//  461   }
//  462   else
//  463   {
//  464     if ((DMA_IT & 0x20) != (uint8_t)RESET)
        LD        A, S:?b0
        AND       A, #0x20
        JREQ      L:??DMA_ClearITPendingBit_1
//  465     {
//  466       DMA_Channelx = DMA1_Channel1;
        LDW       X, #0x507f
        JRA       L:??DMA_ClearITPendingBit_0
//  467     }
//  468     else
//  469     {
//  470       if ((DMA_IT & 0x40) != (uint8_t)RESET)
??DMA_ClearITPendingBit_1:
        LD        A, S:?b0
        AND       A, #0x40
        JREQ      L:??DMA_ClearITPendingBit_2
//  471       {
//  472         DMA_Channelx = DMA1_Channel2;
        LDW       X, #0x5089
        JRA       L:??DMA_ClearITPendingBit_0
//  473       }
//  474       else
//  475       {
//  476         DMA_Channelx = DMA1_Channel3;
??DMA_ClearITPendingBit_2:
        LDW       X, #0x5093
//  477       }
//  478     }
//  479   }
//  480   /*Clears the DMA Channelx’s interrupt pending bits*/
//  481   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
??DMA_ClearITPendingBit_0:
        INCW      X
        LD        A, S:?b0
        AND       A, #0x6
        CPL       A
        AND       A, (X)
        LD        (X), A
//  482 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  483 
//  484 /**
//  485     * @}
//  486     */
//  487 
//  488 /**
//  489   * @}
//  490   */
//  491 
//  492 /******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
// 
// 618 bytes in section .near_func.text
// 
// 618 bytes of CODE memory
//
//Errors: none
//Warnings: none
