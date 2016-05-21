///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:14 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\devices\oled.c       /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\devices\oled.c -e    /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\oled. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME oled

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b4
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l3_l1
        EXTERN ?mov_w4_w0
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?umod32_l1_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN delay_ms

        PUBLIC CODETAB_ASCII_6x8
        PUBLIC OLED_ClearScreen
        PUBLIC OLED_DrawPoint
        PUBLIC OLED_Fill
        PUBLIC OLED_GPIO_Init
        PUBLIC OLED_Init
        PUBLIC OLED_NumPow
        PUBLIC OLED_PrintfChar6x8
        PUBLIC OLED_PrintfNum
        PUBLIC OLED_PrintfString
        PUBLIC OLED_SetPos
        PUBLIC OLED_WriteByte
        PUBLIC OLED_WriteCmd
        PUBLIC OLED_WriteData

// D:\workspace\STM8\stm8l151_ADS1292\devices\oled.c
//    1 #include "oled.h"
//    2 #include "oled_codetab.h"

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
// u8 CODETAB_ASCII_6x8[92][6]
CODETAB_ASCII_6x8:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 98, 100, 8, 19, 35, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 0, 160, 96, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 89, 81, 62, 0, 124, 18, 17, 18, 124, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 85, 42, 85, 42, 85, 0, 0, 65, 65
        DC8 127, 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0
        DC8 0, 32, 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68
        DC8 32, 0, 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1
        DC8 2, 0, 24, 164, 164, 164, 124, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125
        DC8 64, 0, 0, 64, 128, 132, 125, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65
        DC8 127, 64, 0, 0, 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68
        DC8 68, 68, 56, 0, 252, 36, 36, 36, 24, 0, 24, 36, 36, 24, 252, 0, 124
        DC8 8, 4, 4, 8, 0, 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64
        DC8 64, 32, 124, 0, 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68
        DC8 40, 16, 40, 68, 0, 28, 160, 160, 160, 124, 0, 68, 100, 84, 76, 68
        DC8 20, 20, 20, 20, 20, 20
//    3 /*------------------------------------------------------------------------------
//    4 | 函数名称: OLED_GPIO_Init()
//    5 | 输入参数: void
//    6 | 输出参数: void
//    7 | 功    能: 初始化IO
//    8 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void OLED_GPIO_Init(void)
//   10 {
//   11   GPIO_Init(LCD_GPIO_PORT, LCD_RS_PIN , GPIO_Mode_Out_PP_High_Slow);
OLED_GPIO_Init:
        MOV       S:?b0, #0xd0
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   12   GPIO_Init(LCD_GPIO_PORT, LCD_CLK_PIN | LCD_SDI_PIN, GPIO_Mode_Out_PP_High_Slow);	//模拟spi IO
        MOV       S:?b0, #0xd0
        LD        A, #0x18
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   13   GPIO_Init(LCD_RST_PORT, LCD_RST_PIN , GPIO_Mode_Out_PP_High_Slow);
        MOV       S:?b0, #0xd0
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//   14   
//   15   LCD_CLK_CLR;
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   16   LCD_SDI_CLR;
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   17   LCD_RS_CLR;
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   18   LCD_RST_CLR;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_ResetBits
//   19   LCD_CLK_SET;
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   20   LCD_SDI_SET;
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   21   LCD_RS_SET;
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   22   LCD_RST_SET;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_SetBits
//   23 }
        RET
//   24 
//   25 /*------------------------------------------------------------------------------
//   26 | 函数名称: OLED_Init()
//   27 | 输入参数: void
//   28 | 输出参数: void
//   29 | 功    能: 初始化
//   30 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   31 void OLED_Init(void)
//   32 {
//   33   OLED_GPIO_Init();
OLED_Init:
        CALL      L:OLED_GPIO_Init
//   34   LCD_RST_CLR;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_ResetBits
//   35   delay_ms(30); 
        LDW       X, #0x1e
        CALL      L:delay_ms
//   36   LCD_RST_SET;
        LD        A, #0x20
        LDW       X, #0x5000
        CALL      L:GPIO_SetBits
//   37   OLED_WriteCmd(0xae);//--turn off oled panel
        LD        A, #0xae
        CALL      L:OLED_WriteCmd
//   38   OLED_WriteCmd(0x00);//---set low column address
        CLR       A
        CALL      L:OLED_WriteCmd
//   39   OLED_WriteCmd(0x10);//---set high column address
        LD        A, #0x10
        CALL      L:OLED_WriteCmd
//   40   OLED_WriteCmd(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
        LD        A, #0x40
        CALL      L:OLED_WriteCmd
//   41   OLED_WriteCmd(0x81);//--set contrast control register
        LD        A, #0x81
        CALL      L:OLED_WriteCmd
//   42   OLED_WriteCmd(0xcf); // Set SEG Output Current Brightness
        LD        A, #0xcf
        CALL      L:OLED_WriteCmd
//   43   OLED_WriteCmd(0xa1);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
        LD        A, #0xa1
        CALL      L:OLED_WriteCmd
//   44   OLED_WriteCmd(0xc8);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
        LD        A, #0xc8
        CALL      L:OLED_WriteCmd
//   45   OLED_WriteCmd(0xa6);//--set normal display
        LD        A, #0xa6
        CALL      L:OLED_WriteCmd
//   46   OLED_WriteCmd(0xa8);//--set multiplex ratio(1 to 64)
        LD        A, #0xa8
        CALL      L:OLED_WriteCmd
//   47   OLED_WriteCmd(0x3f);//--1/64 duty
        LD        A, #0x3f
        CALL      L:OLED_WriteCmd
//   48   OLED_WriteCmd(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
        LD        A, #0xd3
        CALL      L:OLED_WriteCmd
//   49   OLED_WriteCmd(0x00);//-not offset
        CLR       A
        CALL      L:OLED_WriteCmd
//   50   OLED_WriteCmd(0xd5);//--set display clock divide ratio/oscillator frequency
        LD        A, #0xd5
        CALL      L:OLED_WriteCmd
//   51   OLED_WriteCmd(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
        LD        A, #0x80
        CALL      L:OLED_WriteCmd
//   52   OLED_WriteCmd(0xd9);//--set pre-charge period
        LD        A, #0xd9
        CALL      L:OLED_WriteCmd
//   53   OLED_WriteCmd(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
        LD        A, #0xf1
        CALL      L:OLED_WriteCmd
//   54   OLED_WriteCmd(0xda);//--set com pins hardware configuration
        LD        A, #0xda
        CALL      L:OLED_WriteCmd
//   55   OLED_WriteCmd(0x12);
        LD        A, #0x12
        CALL      L:OLED_WriteCmd
//   56   OLED_WriteCmd(0xdb);//--set vcomh
        LD        A, #0xdb
        CALL      L:OLED_WriteCmd
//   57   OLED_WriteCmd(0x40);//Set VCOM Deselect Level
        LD        A, #0x40
        CALL      L:OLED_WriteCmd
//   58   OLED_WriteCmd(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
        LD        A, #0x20
        CALL      L:OLED_WriteCmd
//   59   OLED_WriteCmd(0x02);//
        LD        A, #0x2
        CALL      L:OLED_WriteCmd
//   60   OLED_WriteCmd(0x8d);//--set Charge Pump enable/disable
        LD        A, #0x8d
        CALL      L:OLED_WriteCmd
//   61   OLED_WriteCmd(0x14);//--set(0x10) disable
        LD        A, #0x14
        CALL      L:OLED_WriteCmd
//   62   OLED_WriteCmd(0xa4);// Disable Entire Display On (0xa4/0xa5)
        LD        A, #0xa4
        CALL      L:OLED_WriteCmd
//   63   OLED_WriteCmd(0xa6);// Disable Inverse Display On (0xa6/a7) 
        LD        A, #0xa6
        CALL      L:OLED_WriteCmd
//   64   OLED_WriteCmd(0xaf);//--turn on oled panel
        LD        A, #0xaf
        CALL      L:OLED_WriteCmd
//   65   
//   66   OLED_Fill(0x00);  //初始清屏
        CLR       A
        CALL      L:OLED_Fill
//   67   OLED_SetPos(0,0);  
        CLR       S:?b0
        CLR       A
        CALL      L:OLED_SetPos
//   68 }
        RET
//   69 /*------------------------------------------------------------------------------
//   70 | 函数名：  LCD_WriteByte
//   71 | 功能：    LCD数据写入  (模拟SPI)
//   72 | 输入参数：byte：写入的字节
//   73 | 返回值：  无
//   74 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   75 void OLED_WriteByte(u8 byte)
//   76 {
OLED_WriteByte:
        CALL      L:?push_w4
        LD        S:?b9, A
//   77   u8 i = 0;   
        CLR       S:?b8
//   78   for(i=0;i<8;i++)
        CLR       A
        LD        S:?b8, A
??OLED_WriteByte_0:
        LD        A, S:?b8
        CP        A, #0x8
        JRNC      L:??OLED_WriteByte_1
//   79   {
//   80     if(byte & 0x80)  
        LD        A, S:?b9
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??OLED_WriteByte_2
//   81       LCD_SDI_SET;  
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        JRA       L:??OLED_WriteByte_3
//   82     else  
//   83       LCD_SDI_CLR;  
??OLED_WriteByte_2:
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   84     byte <<= 1;
??OLED_WriteByte_3:
        LD        A, S:?b9
        SLL       A
        LD        S:?b9, A
//   85     LCD_CLK_SET;
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   86     LCD_CLK_CLR;
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   87   }
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??OLED_WriteByte_0
//   88 }
??OLED_WriteByte_1:
        JP        L:?epilogue_w4
//   89 /*------------------------------------------------------------------------------
//   90 | 函数名称: OLED_WriteData()
//   91 | 输入参数: u8 sendData
//   92 | 输出参数: void
//   93 | 功    能: 发送1Byte数据
//   94 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   95 void OLED_WriteData(u8 sendData)
//   96 {
OLED_WriteData:
        PUSH      S:?b8
        LD        S:?b8, A
//   97   LCD_RS_SET;  
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   98   OLED_WriteByte(sendData);
        LD        A, S:?b8
        CALL      L:OLED_WriteByte
//   99 }
        POP       S:?b8
        RET
//  100 /*------------------------------------------------------------------------------
//  101 | 函数名称: OLED_WriteCmd()
//  102 | 输入参数: u8 sendData
//  103 | 输出参数: void
//  104 | 功    能: 发送1Byte指令
//  105 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  106 void OLED_WriteCmd(u8 sendData)
//  107 {
OLED_WriteCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  108   LCD_RS_CLR;  
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//  109   OLED_WriteByte(sendData);  
        LD        A, S:?b8
        CALL      L:OLED_WriteByte
//  110 }
        POP       S:?b8
        RET
//  111 /*------------------------------------------------------------------------------
//  112 | 函数名称: OLED_SetPos()
//  113 | 输入参数: u8 IndexX , u8 IndexY
//  114 | 输出参数: void
//  115 | 功    能: 设置坐标
//  116 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  117 void OLED_SetPos(u8 IndexX , u8 IndexY)
//  118 {
OLED_SetPos:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  119   OLED_WriteCmd(0xB0 + IndexY);
        LD        A, S:?b9
        ADD       A, #0xb0
        CALL      L:OLED_WriteCmd
//  120   OLED_WriteCmd(((IndexX&0xF0)>> 4)|0x10);
        LD        A, S:?b8
        SWAP      A
        AND       A, #0xf
        OR        A, #0x10
        CALL      L:OLED_WriteCmd
//  121   OLED_WriteCmd((IndexX&0x0F) | 0x00);   
        LD        A, S:?b8
        AND       A, #0xf
        CALL      L:OLED_WriteCmd
//  122 }
        JP        L:?epilogue_w4
//  123 /*------------------------------------------------------------------------------
//  124 | 函数名称: OLED_Fill()
//  125 | 输入参数: u8 fillData
//  126 | 输出参数: void
//  127 | 功    能: 全屏填充
//  128 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  129 void OLED_Fill(u8 fillData)
//  130 {
OLED_Fill:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
//  131   u8 IndexX,IndexY;
//  132   for(IndexY = 0 ; IndexY < 8; IndexY++)
        CLR       A
        LD        S:?b10, A
??OLED_Fill_0:
        LD        A, S:?b10
        CP        A, #0x8
        JRNC      L:??OLED_Fill_1
//  133   {
//  134     OLED_SetPos(0x00 , IndexY);
        MOV       S:?b0, S:?b10
        CLR       A
        CALL      L:OLED_SetPos
//  135     for(IndexX = 0 ; IndexX < OLED_X_WIDTH ; IndexX++)
        CLR       A
        LD        S:?b9, A
??OLED_Fill_2:
        LD        A, S:?b9
        CP        A, #0x80
        JRNC      L:??OLED_Fill_3
//  136       OLED_WriteData(fillData);
        LD        A, S:?b8
        CALL      L:OLED_WriteData
        LD        A, S:?b9
        ADD       A, #0x1
        LD        S:?b9, A
        JRA       L:??OLED_Fill_2
//  137   }  
??OLED_Fill_3:
        LD        A, S:?b10
        ADD       A, #0x1
        LD        S:?b10, A
        JRA       L:??OLED_Fill_0
//  138 }
??OLED_Fill_1:
        POP       S:?b10
        JP        L:?epilogue_w4
//  139 /*------------------------------------------------------------------------------
//  140 | 函数名称: OLED_ClearScreen()
//  141 | 输入参数: void
//  142 | 输出参数: void
//  143 | 功    能: 清屏
//  144 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  145 void OLED_ClearScreen(void)
//  146 {
//  147   OLED_Fill(0x00);
OLED_ClearScreen:
        CLR       A
        CALL      L:OLED_Fill
//  148 }
        RET
//  149 /*------------------------------------------------------------------------------
//  150 | 函数名称: OLED_PrintfChar6x8()
//  151 | 输入参数: u8 IndexX , u8 IndexY , u8 pData
//  152 | 输出参数: void
//  153 | 功    能: 显示6x8标准ASCII字符， X坐标0-122，Y坐标0-7，pData显示字符
//  154 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  155 void OLED_PrintfChar6x8(u8 IndexX, u8 IndexY, u8 pData)
//  156 {
OLED_PrintfChar6x8:
        CALL      L:?push_l2
        LD        S:?b8, A
        MOV       S:?b11, S:?b0
        MOV       S:?b9, S:?b1
//  157   u8 i;
//  158   if(IndexX > 122)
        LD        A, S:?b8
        CP        A, #0x7b
        JRC       L:??OLED_PrintfChar6x8_0
//  159   {
//  160     IndexX = 0;
        CLR       A
        LD        S:?b8, A
//  161     IndexY++;
        LD        A, S:?b11
        ADD       A, #0x1
        LD        S:?b11, A
//  162   }
//  163   OLED_SetPos(IndexX, IndexY);
??OLED_PrintfChar6x8_0:
        MOV       S:?b0, S:?b11
        LD        A, S:?b8
        CALL      L:OLED_SetPos
//  164   for(i = 0; i < 6; i++)
        CLR       A
        LD        S:?b10, A
??OLED_PrintfChar6x8_1:
        LD        A, S:?b10
        CP        A, #0x6
        JRNC      L:??OLED_PrintfChar6x8_2
//  165   {     
//  166     OLED_WriteData(CODETAB_ASCII_6x8[ (pData-32) ][i]);  
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        ADDW      X, #CODETAB_ASCII_6x8 - 192
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        LDW       S:?w1, X
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w1
        CALL      L:?mul16_x_x_w0
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LD        A, (X)
        CALL      L:OLED_WriteData
//  167   }
        LD        A, S:?b10
        ADD       A, #0x1
        LD        S:?b10, A
        JRA       L:??OLED_PrintfChar6x8_1
//  168 }
??OLED_PrintfChar6x8_2:
        JP        L:?epilogue_l2
//  169 /*------------------------------------------------------------------------------
//  170 | 函数名称: OLED_PrintfString()
//  171 | 输入参数: u8 IndexX , u8 IndexY , u8 *p
//  172 | 输出参数: void
//  173 | 功    能: 显示6x8标准ASCII字符， X坐标0-122，Y坐标0-7，*p显示字符串
//  174 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  175 void OLED_PrintfString(u16 x,u16 y,u8 *p)
//  176 {         
OLED_PrintfString:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w5, X
        LDW       S:?w6, Y
        CALL      L:?mov_w4_w0
//  177   //while((*p<='~')&&(*p>=' '))//判断是不是非法字符!
//  178   while(*p)
??OLED_PrintfString_0:
        TNZ       [S:?w4.w]
        JREQ      L:??OLED_PrintfString_1
//  179   {
//  180     if((*p<='~')&&(*p>=' '))
        LD        A, [S:?w4.w]
        CP        A, #0x7f
        JRNC      L:??OLED_PrintfString_2
        LD        A, [S:?w4.w]
        CP        A, #0x20
        JRC       L:??OLED_PrintfString_2
//  181     {
//  182       if(x>122||y>7) 
        LDW       X, S:?w5
        CPW       X, #0x7b
        JRNC      L:??OLED_PrintfString_3
        LDW       X, S:?w6
        CPW       X, #0x8
        JRC       L:??OLED_PrintfString_4
//  183         return;     
??OLED_PrintfString_3:
        JRA       L:??OLED_PrintfString_5
//  184       if((*p<='~')&&(*p>=' '))
??OLED_PrintfString_4:
        LD        A, [S:?w4.w]
        CP        A, #0x7f
        JRNC      L:??OLED_PrintfString_2
        LD        A, [S:?w4.w]
        CP        A, #0x20
        JRC       L:??OLED_PrintfString_2
//  185       {
//  186         OLED_PrintfChar6x8(x, y, *p);
        LD        A, [S:?w4.w]
        LD        S:?b1, A
        MOV       S:?b0, S:?b13
        LD        A, S:?b11
        CALL      L:OLED_PrintfChar6x8
//  187         x+=6;
        LDW       X, S:?w5
        ADDW      X, #0x6
        LDW       S:?w5, X
//  188       }
//  189     }
//  190     p++;
??OLED_PrintfString_2:
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??OLED_PrintfString_0
//  191   }
//  192 }
??OLED_PrintfString_1:
??OLED_PrintfString_5:
        JP        L:?epilogue_l2_w6
//  193 /*------------------------------------------------------------------------------
//  194 | 函数名称: OLED_NumPow()
//  195 | 输入参数: u8 base , u8 logarithm 
//  196 | 输出参数: void
//  197 | 功    能: 求指定对数的幂次方
//  198 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  199 u32 OLED_NumPow(u8 base, u8 logarithm)
//  200 {
OLED_NumPow:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  201   u32 temp_Num=1;
        CLRW      X
        LDW       S:?w0, X
        INCW      X
        LDW       S:?w1, X
//  202   while(logarithm--){
??OLED_NumPow_0:
        MOV       S:?b4, S:?b8
        LD        A, S:?b4
        ADD       A, #0xff
        LD        S:?b8, A
        TNZ       S:?b4
        JREQ      L:??OLED_NumPow_1
//  203     temp_Num*=base;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?mul32_l0_l0_l1
        JRA       L:??OLED_NumPow_0
//  204   }
//  205   return temp_Num;
??OLED_NumPow_1:
        JP        L:?epilogue_w4
//  206 }
//  207 /*------------------------------------------------------------------------------
//  208 | 函数名称: OLED_PrintfNum()
//  209 | 输入参数: u8 IndexX , u8 IndexY , u32 Num ,  u8 len 
//  210 | 输出参数: void
//  211 | 功    能: IndexX 起始坐标点X,  IndexY 起始坐标点Y,  Num 要显示的数字,
//  212 |           len 要显示的位数
//  213 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 void OLED_PrintfNum(u8 IndexX, u8 IndexY, u32 Num, u8 Len)
//  215 {
OLED_PrintfNum:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      A
        SUB       SP, #0x1
        MOV       S:?b9, S:?b0
        CALL      L:?mov_l3_l1
        MOV       S:?b10, S:?b1
//  216   u8 temp_len;
//  217   u8 temp_data;
//  218   u8 temp_HighBlack=0;
        CLR       S:?b11
//  219   
//  220   for(temp_len = 0;temp_len < Len ; temp_len++){
        CLR       A
        LD        S:?b8, A
??OLED_PrintfNum_0:
        LD        A, S:?b8
        CP        A, S:?b10
        JRNC      L:??OLED_PrintfNum_1
//  221     
//  222     temp_data=(Num/OLED_NumPow(10,Len-temp_len-1))%10;
        LD        A, S:?b10
        SUB       A, S:?b8
        ADD       A, #0xff
        LD        S:?b0, A
        LD        A, #0xa
        CALL      L:OLED_NumPow
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?umod32_l1_l0_dl
        DATA
        DC32      0xa
        CODE
        LD        A, S:?b7
        LD        (0x1,SP), A
//  223     
//  224     if(temp_HighBlack==0&&temp_len<(Len-1)){
        TNZ       S:?b11
        JRNE      L:??OLED_PrintfNum_2
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b10
        EXG       A, YL
        DECW      Y
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LDW       S:?w0, Y
        CPW       X, S:?w0
        JRSGE     L:??OLED_PrintfNum_2
//  225       if(temp_data==0){
        TNZ       (0x1,SP)
        JRNE      L:??OLED_PrintfNum_3
//  226         OLED_PrintfChar6x8(IndexX+temp_len*6,IndexY,' ');                
        MOV       S:?b1, #0x20
        MOV       S:?b0, S:?b9
        LD        A, #0x6
        LD        XL, A
        LD        A, S:?b8
        MUL       X, A
        LD        A, XL
        ADD       A, (0x2,SP)
        CALL      L:OLED_PrintfChar6x8
//  227         continue;
        JRA       L:??OLED_PrintfNum_4
//  228       }else 
//  229         temp_HighBlack=1;
??OLED_PrintfNum_3:
        LD        A, #0x1
        LD        S:?b11, A
//  230     }
//  231     OLED_PrintfChar6x8(IndexX+temp_len*6,IndexY,temp_data+'0'); 
??OLED_PrintfNum_2:
        LD        A, (0x1,SP)
        ADD       A, #0x30
        LD        S:?b1, A
        MOV       S:?b0, S:?b9
        LD        A, #0x6
        LD        XL, A
        LD        A, S:?b8
        MUL       X, A
        LD        A, XL
        ADD       A, (0x2,SP)
        CALL      L:OLED_PrintfChar6x8
//  232   }
??OLED_PrintfNum_4:
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??OLED_PrintfNum_0
//  233   
//  234 }
??OLED_PrintfNum_1:
        ADD       SP, #0x2
        JP        L:?epilogue_l2_l3
//  235 /*------------------------------------------------------------------------------
//  236 | 函数名称: OLED_DrawPoint()
//  237 | 输入参数: u8 IndexX , u8 IndexY , u8 Mode
//  238 | 输出参数: void
//  239 | 功    能: IndexX -->X点坐标，IndexY -->Y点坐标
//  240 ------------------------------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  241 void OLED_DrawPoint(u8 IndexX, u8 IndexY)
//  242 {
OLED_DrawPoint:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b10, A
        MOV       S:?b8, S:?b0
//  243   u8 pos,bx,bais=0;
        CLR       S:?b9
//  244   if(IndexX>127||IndexY>63) return;//超出范围了
        LD        A, S:?b10
        CP        A, #0x80
        JRNC      L:??OLED_DrawPoint_0
        LD        A, S:?b8
        CP        A, #0x40
        JRC       L:??OLED_DrawPoint_1
??OLED_DrawPoint_0:
        JRA       L:??OLED_DrawPoint_2
//  245   pos=7-IndexY/8;
??OLED_DrawPoint_1:
        LD        A, #0x8
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        LD        A, #0x7
        SUB       A, S:?b0
        LD        S:?b11, A
//  246   bx=IndexY%8;
        LD        A, #0x8
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        LD        S:?b12, A
//  247   bais=1<<(7-bx);
        LD        A, #0x7
        SUB       A, S:?b12
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b9, A
//  248   OLED_SetPos(IndexX, pos);
        MOV       S:?b0, S:?b11
        LD        A, S:?b10
        CALL      L:OLED_SetPos
//  249   OLED_WriteData(bais);
        LD        A, S:?b9
        CALL      L:OLED_WriteData
//  250 }
??OLED_DrawPoint_2:
        POP       S:?b12
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  251 
// 
// 552 bytes in section .near.data
// 958 bytes in section .near_func.text
// 
// 958 bytes of CODE memory
// 552 bytes of DATA memory
//
//Errors: none
//Warnings: none
