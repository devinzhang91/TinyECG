///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Mar/2016  11:19:19 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_OLED\devices\afe4400.c       /
//    Command line =  D:\workspace\STM8\stm8l151_OLED\devices\afe4400.c -e    /
//                    -On --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o D:\workspace\STM8\stm8l151_OLED\ /
//                    iar\Debug\Obj\ --dlib_config                            /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l151_OLED\iar\Debug\List\ -I      /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\main\ -I         /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\fwlib\inc\ -I    /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\devices\ -I      /
//                    D:\workspace\STM8\stm8l151_OLED\iar\..\hardware\        /
//                    --vregs 16                                              /
//    List file    =  D:\workspace\STM8\stm8l151_OLED\iar\Debug\List\afe4400. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME afe4400

        EXTERN ?b0
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?load32_0x_l0
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_0x
        EXTERN ?load32_l0_dbsp
        EXTERN ?load32_l1_dbsp
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?or32_l0_l0_l1
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sll32_l0_l0_db
        EXTERN ?srl32_l0_l0_db
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_SetPinSensitivity
        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN SPI_Master_Conf
        EXTERN SPI_ReadByte
        EXTERN SPI_WriteByte

        PUBLIC AFE4400_Init
        PUBLIC AFE4400_Read_Register
        PUBLIC AFE4400_Set_READABLE
        PUBLIC AFE4400_Set_Register
        PUBLIC AFE4404_Set_Value
        PUBLIC EXTI0_IRQHandler
        PUBLIC Get_AFE_Data
        PUBLIC LED1_val
        PUBLIC LED2_val
        PUBLIC RollerHandler
        PUBLIC Send_AFE_Data32
        PUBLIC _interrupt_10

// D:\workspace\STM8\stm8l151_OLED\devices\afe4400.c
//    1 #include "afe4400.h"
//    2 
//    3 extern u8 TxBuffer[DATA_TO_TRANSFER];
//    4 extern u8 RxBuffer[DATA_TO_RECEIVE];

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    5 u32 LED1_val, LED2_val;
LED1_val:
        DS8 4

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
LED2_val:
        DS8 4
//    6 
//    7 //******************************************************************
//    8 //函数名：  AFE4400_Init
//    9 //功能：    AFE4400初始化
//   10 //输入参数：无
//   11 //返回值：  无
//   12 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   13 void AFE4400_Init(void)
//   14 {
//   15   disableInterrupts();
AFE4400_Init:
        sim
//   16   SPI_Master_Conf();	//SPI端口设置
        CALL      L:SPI_Master_Conf
//   17   
//   18   GPIO_Init(AFE_CS_PORT, AFE_CS_PIN, GPIO_Mode_Out_PP_High_Slow);	//片选IO
        MOV       S:?b0, #0xd0
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//   19   GPIO_Init(AFE_CTRL_PORT, AFE_PDN_PIN, GPIO_Mode_Out_PP_High_Slow);	//低功耗IO
        MOV       S:?b0, #0xd0
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   20   GPIO_Init(AFE_CTRL_PORT, AFE_ADC_RDY_PIN, GPIO_Mode_In_FL_IT);	//ADC_RDY 中断设置
        MOV       S:?b0, #0x20
        LD        A, #0x1
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   21   EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
        MOV       S:?b0, #0x1
        CLR       A
        CALL      L:EXTI_SetPinSensitivity
//   22   
//   23   AFE_CS_H;	//选中AFE4400
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_SetBits
//   24   AFE_PDN_H;	//低功耗关闭
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   25 }
        RET
//   26 
//   27 //******************************************************************
//   28 //功能：    AFE4400 ADC_RDY 信号中断处理
//   29 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   30 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
//   31 {
EXTI0_IRQHandler:
_interrupt_10:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//   32   disableInterrupts();
        sim
//   33   LED1_val = AFE4400_Read_Register(LED1_ALED1VAL);
        LD        A, #0x2f
        CALL      L:AFE4400_Read_Register
        LDW       X, #LED1_val
        CALL      L:?load32_0x_l0
//   34   LED2_val = AFE4400_Read_Register(LED2_ALED2VAL);
        LD        A, #0x2e
        CALL      L:AFE4400_Read_Register
        LDW       X, #LED2_val
        CALL      L:?load32_0x_l0
//   35 //  LED1_val = AFE4400_Read_Register(LED1VAL);
//   36 //  LED2_val = AFE4400_Read_Register(LED2VAL);
//   37   EXTI_ClearITPendingBit(EXTI_IT_Pin0); //清除中断标志位
        CLRW      X
        INCW      X
        CALL      L:EXTI_ClearITPendingBit
//   38   enableInterrupts();
        rim
//   39 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//   40 
//   41 /* 设置器件读写模式
//   42 * 0：写 1：读 
//   43 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 void AFE4400_Set_READABLE(u8 isReadable)
//   45 {
AFE4400_Set_READABLE:
        PUSH      S:?b8
        LD        S:?b8, A
//   46   SPI_WriteByte(CONTROL0);  //写入寄存器地址
        CLR       A
        CALL      L:SPI_WriteByte
//   47   SPI_WriteByte(0x00);
        CLR       A
        CALL      L:SPI_WriteByte
//   48   SPI_WriteByte(0x00);
        CLR       A
        CALL      L:SPI_WriteByte
//   49   SPI_WriteByte(isReadable);
        LD        A, S:?b8
        CALL      L:SPI_WriteByte
//   50 }
        POP       S:?b8
        RET
//   51 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   52 u32 AFE4400_Read_Register(u8 reg_address)
//   53 {
AFE4400_Read_Register:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      A
        SUB       SP, #0x8
//   54   u32 temp0=0, temp1=0, temp2=0;
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
        LDW       X, #0x0
        LDW       (0x5,SP), X
        LDW       X, #0x0
        LDW       (0x7,SP), X
//   55   u32 temp=0;
        LDW       X, #0x0
        LDW       (0x1,SP), X
        LDW       X, #0x0
        LDW       (0x3,SP), X
//   56   
//   57   AFE_CS_L;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_ResetBits
//   58   AFE4400_Set_READABLE(1);
        LD        A, #0x1
        CALL      L:AFE4400_Set_READABLE
//   59   
//   60   SPI_WriteByte(reg_address);  //写入寄存器地址
        LD        A, (0x9,SP)
        CALL      L:SPI_WriteByte
//   61   temp0 = SPI_ReadByte();
        CALL      L:SPI_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
//   62   temp1 = SPI_ReadByte();
        CALL      L:SPI_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l2_l0
//   63   temp2 = SPI_ReadByte();
        CALL      L:SPI_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x5
        CODE
//   64   AFE_CS_H;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_SetBits
//   65   
//   66   temp = temp0<<16 | temp1<<8 | temp2;
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x8
        CODE
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        CALL      L:?or32_l0_l0_l1
        CALL      L:?load32_l1_dbsp
        DATA
        DC8       0x5
        CODE
        CALL      L:?or32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x1
        CODE
//   67   return temp;
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x1
        CODE
        ADD       SP, #0x9
        JP        L:?epilogue_l2_l3
//   68 }
//   69 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   70 void AFE4400_Set_Register(u8 reg_address, u32 data)
//   71 {
AFE4400_Set_Register:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
        CALL      L:?mov_l2_l0
//   72   AFE_CS_L;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_ResetBits
//   73   AFE4400_Set_READABLE(0);
        CLR       A
        CALL      L:AFE4400_Set_READABLE
//   74   
//   75   SPI_WriteByte(reg_address);  //写入寄存器地址
        LD        A, S:?b12
        CALL      L:SPI_WriteByte
//   76   SPI_WriteByte((data>>16)&0xFF);
        CALL      L:?mov_l0_l2
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        LD        A, S:?b3
        CALL      L:SPI_WriteByte
//   77   SPI_WriteByte((data>>8)&0xFF);
        LDW       X, S:?w5
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:SPI_WriteByte
//   78   SPI_WriteByte((data)&0xFF);
        LD        A, S:?b11
        CALL      L:SPI_WriteByte
//   79   AFE_CS_H;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_SetBits
//   80 }
        POP       S:?b12
        JP        L:?epilogue_l2
//   81 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 void AFE4404_Set_Value(void)
//   83 {
//   84   //AFE4400_Set_Register(CONTROL0,        0x04);
//   85   AFE4400_Set_Register(LED2STC,         6050);
AFE4404_Set_Value:
        LDW       X, #0x17a2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x1
        CALL      L:AFE4400_Set_Register
//   86   AFE4400_Set_Register(LED2ENDC,        7998);
        LDW       X, #0x1f3e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x2
        CALL      L:AFE4400_Set_Register
//   87   AFE4400_Set_Register(LED2LEDSTC,      6000);
        LDW       X, #0x1770
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x3
        CALL      L:AFE4400_Set_Register
//   88   AFE4400_Set_Register(LED2LEDENDC,     7999);
        LDW       X, #0x1f3f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x4
        CALL      L:AFE4400_Set_Register
//   89   AFE4400_Set_Register(ALED2STC,        50);
        LDW       X, #0x32
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x5
        CALL      L:AFE4400_Set_Register
//   90   AFE4400_Set_Register(ALED2ENDC,       1998);
        LDW       X, #0x7ce
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x6
        CALL      L:AFE4400_Set_Register
//   91   AFE4400_Set_Register(LED1STC,         2050);
        LDW       X, #0x802
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x7
        CALL      L:AFE4400_Set_Register
//   92   AFE4400_Set_Register(LED1ENDC,        3998);
        LDW       X, #0xf9e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x8
        CALL      L:AFE4400_Set_Register
//   93   AFE4400_Set_Register(LED1LEDSTC,      2000);
        LDW       X, #0x7d0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x9
        CALL      L:AFE4400_Set_Register
//   94   AFE4400_Set_Register(LED1LEDENDC,     3999);
        LDW       X, #0xf9f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0xa
        CALL      L:AFE4400_Set_Register
//   95   AFE4400_Set_Register(ALED1STC,        4050);
        LDW       X, #0xfd2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0xb
        CALL      L:AFE4400_Set_Register
//   96   AFE4400_Set_Register(ALED1ENDC,       5998);
        LDW       X, #0x176e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0xc
        CALL      L:AFE4400_Set_Register
//   97   AFE4400_Set_Register(LED2CONVST,      4);
        LDW       X, #0x4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0xd
        CALL      L:AFE4400_Set_Register
//   98   AFE4400_Set_Register(LED2CONVEND,     1999);
        LDW       X, #0x7cf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0xe
        CALL      L:AFE4400_Set_Register
//   99   AFE4400_Set_Register(ALED2CONVST,     2004);
        LDW       X, #0x7d4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0xf
        CALL      L:AFE4400_Set_Register
//  100   AFE4400_Set_Register(ALED2CONVEND,    3999);
        LDW       X, #0xf9f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x10
        CALL      L:AFE4400_Set_Register
//  101   AFE4400_Set_Register(LED1CONVST,      4004);
        LDW       X, #0xfa4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x11
        CALL      L:AFE4400_Set_Register
//  102   AFE4400_Set_Register(LED1CONVEND,     5999);
        LDW       X, #0x176f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x12
        CALL      L:AFE4400_Set_Register
//  103   AFE4400_Set_Register(ALED1CONVST,     6004);
        LDW       X, #0x1774
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x13
        CALL      L:AFE4400_Set_Register
//  104   AFE4400_Set_Register(ALED1CONVEND,    7999);
        LDW       X, #0x1f3f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x14
        CALL      L:AFE4400_Set_Register
//  105   
//  106   AFE4400_Set_Register(ADCRSTSTCT0,     0);
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        LD        A, #0x15
        CALL      L:AFE4400_Set_Register
//  107   AFE4400_Set_Register(ADCRSTENDCT0,    3);
        LDW       X, #0x3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x16
        CALL      L:AFE4400_Set_Register
//  108   AFE4400_Set_Register(ADCRSTSTCT1,     2000);
        LDW       X, #0x7d0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x17
        CALL      L:AFE4400_Set_Register
//  109   AFE4400_Set_Register(ADCRSTENDCT1,    2003);
        LDW       X, #0x7d3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x18
        CALL      L:AFE4400_Set_Register
//  110   AFE4400_Set_Register(ADCRSTSTCT2,     4000);
        LDW       X, #0xfa0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x19
        CALL      L:AFE4400_Set_Register
//  111   AFE4400_Set_Register(ADCRSTENDCT2,    4003);
        LDW       X, #0xfa3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x1a
        CALL      L:AFE4400_Set_Register
//  112   AFE4400_Set_Register(ADCRSTSTCT3,     6000);
        LDW       X, #0x1770
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x1b
        CALL      L:AFE4400_Set_Register
//  113   AFE4400_Set_Register(ADCRSTENDCT3,    6003);
        LDW       X, #0x1773
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x1c
        CALL      L:AFE4400_Set_Register
//  114   
//  115   AFE4400_Set_Register(PRPCOUNT,        7999);
        LDW       X, #0x1f3f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x1d
        CALL      L:AFE4400_Set_Register
//  116   
//  117   AFE4400_Set_Register(CONTROL1,        0x100);
        CLRW      X
        LDW       S:?w0, X
        INCW      X
        SWAPW     X
        LDW       S:?w1, X
        LD        A, #0x1e
        CALL      L:AFE4400_Set_Register
//  118   AFE4400_Set_Register(TIA_AMB_GAIN,    0x004411);
        LDW       X, #0x4411
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x21
        CALL      L:AFE4400_Set_Register
//  119   AFE4400_Set_Register(LEDCNTRL,        0xEFEF);
        LDW       X, #0xefef
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LD        A, #0x22
        CALL      L:AFE4400_Set_Register
//  120   AFE4400_Set_Register(CONTROL2,        0x100);
        CLRW      X
        LDW       S:?w0, X
        INCW      X
        SWAPW     X
        LDW       S:?w1, X
        LD        A, #0x23
        CALL      L:AFE4400_Set_Register
//  121 }
        RET
//  122 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  123 u8 Get_AFE_Data(u8 type)
//  124 {
Get_AFE_Data:
        LD        S:?b5, A
//  125   u8 led_data = 0;
        CLR       S:?b4
//  126   switch(type)
        LD        A, S:?b5
        SUB       A, #0x81
        JREQ      L:??Get_AFE_Data_0
        DEC       A
        JREQ      L:??Get_AFE_Data_1
        JRA       L:??Get_AFE_Data_2
//  127   {
//  128   case LED1 :
//  129     led_data = 4096-((LED1_val^0x200000)>>10)&0xFFF;
??Get_AFE_Data_0:
        LDW       X, #LED1_val
        CALL      L:?load32_l0_0x
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0xa
        CODE
        LD        A, #0x0
        SUB       A, S:?b3
        LD        S:?b4, A
//  130     //led_data = ((LED1_val^0x200000)>>14)&0xFF;
//  131     break;
        JRA       L:??Get_AFE_Data_2
//  132   case LED2 :
//  133     led_data = 4096-((LED2_val^0x200000)>>10)&0xFFF;
??Get_AFE_Data_1:
        LDW       X, #LED2_val
        CALL      L:?load32_l0_0x
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0xa
        CODE
        LD        A, #0x0
        SUB       A, S:?b3
        LD        S:?b4, A
//  134     //led_data = ((LED2_val^0x200000)>>14)&0xFF;
//  135     break;
//  136   }
//  137   return led_data;
??Get_AFE_Data_2:
        LD        A, S:?b4
        RET
//  138 }
//  139 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  140 void RollerHandler()
//  141 {
//  142   
//  143 }
RollerHandler:
        RET
//  144 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  145 void Send_AFE_Data32(void)
//  146 {
//  147   //TxBuffer[];   //装载数据
//  148 }
Send_AFE_Data32:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//   8 bytes in section .near.bss
// 830 bytes in section .near_func.text
// 
// 830 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none
