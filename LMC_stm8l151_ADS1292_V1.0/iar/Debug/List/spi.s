///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:14 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\spi.c       /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\spi.c -e    /
//                    -On --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o D:\workspace\STM8\stm8l151_ADS12 /
//                    92\iar\Debug\Obj\ --dlib_config                         /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\ -I   /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\..\main\ -I      /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\..\fwlib\inc\    /
//                    -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\devices\   /
//                    -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\hardware\  /
//                    --vregs 16                                              /
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\spi.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME spi

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits

        PUBLIC SPI_Master_Conf
        PUBLIC SPI_ReadByte
        PUBLIC SPI_WriteByte

// D:\workspace\STM8\stm8l151_ADS1292\hardware\spi.c
//    1 #include "spi.h"
//    2 
//    3 //******************************************************************
//    4 //函数名：  SPI_Master_Conf
//    5 //功能：    硬件SPI主设备初始化
//    6 //输入参数：无
//    7 //返回值：  无
//    8 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void SPI_Master_Conf(void)
//   10 {
//   11 #if USE_HARDWARE_SPI
//   12   CLK_PeripheralClockConfig(SPI_CLK, ENABLE);           //设置硬件SPI接口
//   13   GPIO_ExternalPullUpConfig(SPI_GPIO_PORT, SPI_SCK_PIN | SPI_MISO_PIN | SPI_MOSI_PIN, ENABLE);
//   14   SPI_Init(SPI, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,
//   15            SPI_CPOL_High, SPI_CPHA_2Edge, SPI_Direction_2Lines_FullDuplex,
//   16            SPI_NSS_Soft, 0x07);
//   17   SPI_Cmd(SPI, ENABLE);
//   18 #else
//   19   GPIO_Init(SPI_GPIO_PORT, SPI_SCK_PIN | SPI_MOSI_PIN, GPIO_Mode_Out_PP_High_Slow);	//模拟spi IO
SPI_Master_Conf:
        MOV       S:?b0, #0xd0
        LD        A, #0x60
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   20   GPIO_Init(SPI_GPIO_PORT, SPI_MISO_PIN, GPIO_Mode_In_PU_No_IT);	//模拟spi IO
        MOV       S:?b0, #0x40
        LD        A, #0x80
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   21 
//   22 #endif
//   23 }
        RET
//   24 
//   25 #if USE_HARDWARE_SPI
//   26 //******************************************************************
//   27 //函数名：  SPI_ReadByte
//   28 //功能：    硬件SPI读一个字节数据
//   29 //输入参数：byte:数据
//   30 //返回值：  无
//   31 //******************************************************************
//   32 u8 SPI_ReadByte(void)
//   33 {
//   34   return (SPI_WriteByte(0xFF));
//   35 }
//   36 //******************************************************************
//   37 //函数名：  SPI_WriteByte
//   38 //功能：    硬件SPI读写一个字节数据
//   39 //输入参数：byte:数据
//   40 //返回值：  无
//   41 //******************************************************************
//   42 u8 SPI_WriteByte(u8 byte)
//   43 {
//   44   while (SPI_GetFlagStatus(SPI, SPI_FLAG_TXE) == RESET);
//   45   SPI_SendData(SPI, byte);
//   46   while (SPI_GetFlagStatus(SPI, SPI_FLAG_RXNE) == RESET);
//   47   return SPI_ReceiveData(SPI);           
//   48 }
//   49 
//   50 #else
//   51 //******************************************************************
//   52 //函数名：  SPI_ReadByte
//   53 //功能：    软件SPI读一个字节数据
//   54 //输入参数：byte:数据
//   55 //返回值：  无
//   56 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 u8 SPI_ReadByte(void)
//   58 {
//   59   return (SPI_WriteByte(0xFF));
SPI_ReadByte:
        LD        A, #0xff
        CALL      L:SPI_WriteByte
        RET
//   60 }
//   61 //******************************************************************
//   62 //函数名：  SPI_WriteByte
//   63 //功能：    软件SPI读写一个字节数据
//   64 //输入参数：byte:数据
//   65 //返回值：  无
//   66 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 u8 SPI_WriteByte(u8 byte)  
//   68 {       
SPI_WriteByte:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
//   69   u8 i = 0;  
        CLR       S:?b9
//   70   u8 rec_data = 0;   
        CLR       S:?b8
//   71   for(i=0;i<8;i++)
        CLR       A
        LD        S:?b9, A
??SPI_WriteByte_0:
        LD        A, S:?b9
        CP        A, #0x8
        JRNC      L:??SPI_WriteByte_1
//   72   {
//   73     if(byte & 0x80)  
        LD        A, S:?b10
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??SPI_WriteByte_2
//   74       MOSI_H;  
        LD        A, #0x40
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        JRA       L:??SPI_WriteByte_3
//   75     else  
//   76       MOSI_L;  
??SPI_WriteByte_2:
        LD        A, #0x40
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   77     byte <<= 1;
??SPI_WriteByte_3:
        LD        A, S:?b10
        SLL       A
        LD        S:?b10, A
//   78     SCLK_H;
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   79     rec_data<<=1;  
        LD        A, S:?b8
        SLL       A
        LD        S:?b8, A
//   80     if(MISO_G)
        LD        A, #0x80
        LDW       X, #0x5005
        CALL      L:GPIO_ReadInputDataBit
        CP        A, #0x0
        JREQ      L:??SPI_WriteByte_4
//   81       rec_data++;
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
//   82     SCLK_L;
??SPI_WriteByte_4:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   83   }  
        LD        A, S:?b9
        ADD       A, #0x1
        LD        S:?b9, A
        JRA       L:??SPI_WriteByte_0
//   84   return rec_data;
??SPI_WriteByte_1:
        LD        A, S:?b8
        POP       S:?b10
        JP        L:?epilogue_w4
//   85 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   86 #endif
//   87 
// 
// 138 bytes in section .near_func.text
// 
// 138 bytes of CODE memory
//
//Errors: none
//Warnings: none
