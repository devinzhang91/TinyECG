///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            30/Mar/2016  22:33:55 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1299\devices\spi_tft.c    /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1299\devices\spi_tft.c    /
//                    -e -On --no_cse --no_unroll --no_inline                 /
//                    --no_code_motion --no_tbaa --no_cross_call --debug      /
//                    --code_model small --data_model medium -o               /
//                    D:\workspace\STM8\stm8l151_ADS1299\iar\Debug\Obj\       /
//                    --dlib_config D:\IAR\stm8\LIB\dlstm8smn.h -D            /
//                    STM8L15X_MDP -lB D:\workspace\STM8\stm8l151_ADS1299\iar /
//                    \Debug\List\ -I D:\workspace\STM8\stm8l151_ADS1299\iar\ /
//                    ..\main\ -I D:\workspace\STM8\stm8l151_ADS1299\iar\..\f /
//                    wlib\inc\ -I D:\workspace\STM8\stm8l151_ADS1299\iar\..\ /
//                    devices\ -I D:\workspace\STM8\stm8l151_ADS1299\iar\..\h /
//                    ardware\ --vregs 16                                     /
//    List file    =  D:\workspace\STM8\stm8l151_ADS1299\iar\Debug\List\spi_t /
//                    ft.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME spi_tft

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l3_l0
        EXTERN ?mov_w0_w4
        EXTERN ?mov_w0_w5
        EXTERN ?mov_w0_w7
        EXTERN ?mov_w1_w4
        EXTERN ?mov_w1_w5
        EXTERN ?mov_w1_w6
        EXTERN ?mov_w1_w7
        EXTERN ?mov_w4_w0
        EXTERN ?mov_w4_w1
        EXTERN ?mov_w4_w2
        EXTERN ?mov_w5_w0
        EXTERN ?mov_w5_w1
        EXTERN ?mov_w6_w0
        EXTERN ?mov_w6_w2
        EXTERN ?mov_w7_w1
        EXTERN ?mov_w7_w4
        EXTERN ?mul16_x_x_w0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w0
        EXTERN ?push_w1
        EXTERN ?push_w2
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?umod32_l1_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN delay_ms

        PUBLIC BACK_COLOR
        PUBLIC DeviceCode
        PUBLIC GUI_DrawPoint
        PUBLIC LCD_Circle
        PUBLIC LCD_Clear
        PUBLIC LCD_DrawFillRectangle
        PUBLIC LCD_DrawLine
        PUBLIC LCD_DrawPoint
        PUBLIC LCD_DrawRectangle
        PUBLIC LCD_Drawbmp16
        PUBLIC LCD_Fill
        PUBLIC LCD_GPIO_Init
        PUBLIC LCD_Init
        PUBLIC LCD_SetCursor
        PUBLIC LCD_SetParam
        PUBLIC LCD_SetWindows
        PUBLIC LCD_ShowChar
        PUBLIC LCD_ShowNum
        PUBLIC LCD_ShowOneChar
        PUBLIC LCD_ShowString
        PUBLIC LCD_WR_DATA
        PUBLIC LCD_WR_DATA_16Bit
        PUBLIC LCD_WR_REG
        PUBLIC LCD_WriteByte
        PUBLIC LCD_WriteRAM_Prepare
        PUBLIC LCD_WriteReg
        PUBLIC POINT_COLOR
        PUBLIC RxBuf
        PUBLIC _draw_circle_8
        PUBLIC asc2_1206
        PUBLIC cnt
        PUBLIC lcddev
        PUBLIC mypow

// D:\workspace\STM8\stm8l151_ADS1299\devices\spi_tft.c
//    1 /* 此 spi_tft.c 稍作修改
//    2 * 使用模拟SPI控制TFT
//    3 * CS引脚默认在硬件选中
//    4 */
//    5 
//    6 #include "spi_tft.h"
//    7 #include "spi_tft_FONT.h"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
// unsigned char const asc2_1206[95][12]
asc2_1206:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 0, 4, 0
        DC8 0, 0, 20, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 63, 20, 10
        DC8 63, 10, 10, 0, 0, 0, 4, 30, 21, 5, 6, 12, 20, 21, 15, 4, 0, 0, 0
        DC8 18, 21, 13, 10, 20, 44, 42, 18, 0, 0, 0, 0, 4, 10, 10, 30, 21, 21
        DC8 9, 54, 0, 0, 0, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 16, 8, 8, 8
        DC8 8, 8, 8, 16, 32, 0, 0, 2, 4, 8, 8, 8, 8, 8, 8, 4, 2, 0, 0, 0, 0, 4
        DC8 21, 14, 14, 21, 4, 0, 0, 0, 0, 0, 4, 4, 4, 31, 4, 4, 4, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 1, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 16, 8, 8, 8, 4, 4, 2, 2
        DC8 2, 1, 0, 0, 0, 14, 17, 17, 17, 17, 17, 17, 14, 0, 0, 0, 0, 4, 6, 4
        DC8 4, 4, 4, 4, 14, 0, 0, 0, 0, 14, 17, 17, 8, 4, 2, 1, 31, 0, 0, 0, 0
        DC8 14, 17, 16, 12, 16, 16, 17, 14, 0, 0, 0, 0, 8, 12, 10, 10, 9, 30, 8
        DC8 24, 0, 0, 0, 0, 31, 1, 1, 15, 16, 16, 17, 14, 0, 0, 0, 0, 14, 9, 1
        DC8 15, 17, 17, 17, 14, 0, 0, 0, 0, 31, 9, 8, 4, 4, 4, 4, 4, 0, 0, 0, 0
        DC8 14, 17, 17, 14, 17, 17, 17, 14, 0, 0, 0, 0, 14, 17, 17, 17, 30, 16
        DC8 18, 14, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4
        DC8 0, 0, 0, 4, 4, 0, 0, 32, 16, 8, 4, 2, 4, 8, 16, 32, 0, 0, 0, 0, 0
        DC8 0, 31, 0, 0, 31, 0, 0, 0, 0, 0, 2, 4, 8, 16, 32, 16, 8, 4, 2, 0, 0
        DC8 0, 0, 14, 17, 17, 8, 4, 4, 0, 4, 0, 0, 0, 0, 14, 17, 25, 21, 21, 29
        DC8 1, 30, 0, 0, 0, 0, 4, 4, 12, 10, 10, 30, 18, 51, 0, 0, 0, 0, 15, 18
        DC8 18, 14, 18, 18, 18, 15, 0, 0, 0, 0, 30, 17, 1, 1, 1, 1, 17, 14, 0
        DC8 0, 0, 0, 15, 18, 18, 18, 18, 18, 18, 15, 0, 0, 0, 0, 31, 18, 10, 14
        DC8 10, 2, 18, 31, 0, 0, 0, 0, 31, 18, 10, 14, 10, 2, 2, 7, 0, 0, 0, 0
        DC8 28, 18, 1, 1, 57, 17, 18, 12, 0, 0, 0, 0, 51, 18, 18, 30, 18, 18
        DC8 18, 51, 0, 0, 0, 0, 31, 4, 4, 4, 4, 4, 4, 31, 0, 0, 0, 0, 62, 8, 8
        DC8 8, 8, 8, 8, 9, 7, 0, 0, 0, 55, 18, 10, 6, 10, 10, 18, 55, 0, 0, 0
        DC8 0, 7, 2, 2, 2, 2, 2, 34, 63, 0, 0, 0, 0, 27, 27, 27, 27, 21, 21, 21
        DC8 21, 0, 0, 0, 0, 59, 18, 22, 22, 26, 26, 18, 23, 0, 0, 0, 0, 14, 17
        DC8 17, 17, 17, 17, 17, 14, 0, 0, 0, 0, 15, 18, 18, 14, 2, 2, 2, 7, 0
        DC8 0, 0, 0, 14, 17, 17, 17, 17, 23, 25, 14, 24, 0, 0, 0, 15, 18, 18
        DC8 14, 10, 18, 18, 55, 0, 0, 0, 0, 30, 17, 1, 6, 8, 16, 17, 15, 0, 0
        DC8 0, 0, 31, 21, 4, 4, 4, 4, 4, 14, 0, 0, 0, 0, 51, 18, 18, 18, 18, 18
        DC8 18, 12, 0, 0, 0, 0, 51, 18, 18, 10, 10, 12, 4, 4, 0, 0, 0, 0, 21
        DC8 21, 21, 14, 10, 10, 10, 10, 0, 0, 0, 0, 27, 10, 10, 4, 4, 10, 10
        DC8 27, 0, 0, 0, 0, 27, 10, 10, 4, 4, 4, 4, 14, 0, 0, 0, 0, 31, 9, 8, 4
        DC8 4, 2, 18, 31, 0, 0, 0, 28, 4, 4, 4, 4, 4, 4, 4, 4, 28, 0, 0, 2, 2
        DC8 2, 4, 4, 8, 8, 8, 16, 0, 0, 0, 14, 8, 8, 8, 8, 8, 8, 8, 8, 14, 0, 0
        DC8 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 63, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 18, 28
        DC8 18, 60, 0, 0, 0, 0, 3, 2, 2, 14, 18, 18, 18, 14, 0, 0, 0, 0, 0, 0
        DC8 0, 28, 18, 2, 2, 28, 0, 0, 0, 0, 24, 16, 16, 28, 18, 18, 18, 60, 0
        DC8 0, 0, 0, 0, 0, 0, 12, 18, 30, 2, 28, 0, 0, 0, 0, 56, 4, 4, 30, 4, 4
        DC8 4, 30, 0, 0, 0, 0, 0, 0, 0, 60, 18, 12, 2, 30, 34, 28, 0, 0, 3, 2
        DC8 2, 14, 18, 18, 18, 55, 0, 0, 0, 0, 4, 0, 0, 6, 4, 4, 4, 14, 0, 0, 0
        DC8 0, 8, 0, 0, 12, 8, 8, 8, 8, 8, 7, 0, 0, 3, 2, 2, 58, 10, 14, 18, 55
        DC8 0, 0, 0, 0, 7, 4, 4, 4, 4, 4, 4, 31, 0, 0, 0, 0, 0, 0, 0, 15, 21
        DC8 21, 21, 21, 0, 0, 0, 0, 0, 0, 0, 15, 18, 18, 18, 55, 0, 0, 0, 0, 0
        DC8 0, 0, 12, 18, 18, 18, 12, 0, 0, 0, 0, 0, 0, 0, 15, 18, 18, 18, 14
        DC8 2, 7, 0, 0, 0, 0, 0, 28, 18, 18, 18, 28, 16, 56, 0, 0, 0, 0, 0, 27
        DC8 6, 2, 2, 7, 0, 0, 0, 0, 0, 0, 0, 30, 2, 12, 16, 30, 0, 0, 0, 0, 0
        DC8 4, 4, 14, 4, 4, 4, 24, 0, 0, 0, 0, 0, 0, 0, 27, 18, 18, 18, 60, 0
        DC8 0, 0, 0, 0, 0, 0, 55, 18, 10, 12, 4, 0, 0, 0, 0, 0, 0, 0, 21, 21
        DC8 14, 10, 10, 0, 0, 0, 0, 0, 0, 0, 27, 10, 4, 10, 27, 0, 0, 0, 0, 0
        DC8 0, 0, 55, 18, 10, 12, 4, 4, 3, 0, 0, 0, 0, 0, 30, 8, 4, 4, 30, 0, 0
        DC8 0, 24, 8, 8, 8, 4, 8, 8, 8, 8, 24, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
        DC8 8, 8, 0, 6, 4, 4, 4, 8, 4, 4, 4, 4, 6, 0, 2, 37, 24, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0
//    8 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    9 u8 RxBuf[64];
RxBuf:
        DS8 64

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   10 u8 cnt=0;
cnt:
        DS8 1
//   11 
//   12 //管理LCD重要参数
//   13 //默认为竖屏

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   14 _lcd_dev lcddev;
lcddev:
        DS8 13
//   15 
//   16 //画笔颜色,背景颜色

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   17 u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
POINT_COLOR:
        DS8 2

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
BACK_COLOR:
        DC16 65535

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   18 u16 DeviceCode;
DeviceCode:
        DS8 2
//   19 
//   20 //******************************************************************
//   21 //函数名：  LCD_GPIO_Init
//   22 //功能：    LCD管脚初始化
//   23 //输入参数：无
//   24 //返回值：  无
//   25 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   26 void LCD_GPIO_Init(void)
//   27 {
//   28   GPIO_Init(LCD_GPIO_PORT, LCD_RS_PIN , GPIO_Mode_Out_PP_High_Slow);
LCD_GPIO_Init:
        MOV       S:?b0, #0xd0
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   29   GPIO_Init(LCD_GPIO_PORT, LCD_CLK_PIN | LCD_SDI_PIN, GPIO_Mode_Out_PP_High_Slow);	//模拟spi IO
        MOV       S:?b0, #0xd0
        LD        A, #0x3
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   30 }
        RET
//   31 
//   32 //******************************************************************
//   33 //函数名：  LCD_WriteByte
//   34 //功能：    LCD数据写入  (模拟SPI)
//   35 //输入参数：byte：写入的字节
//   36 //返回值：  无
//   37 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 void LCD_WriteByte(u8 byte)
//   39 {
LCD_WriteByte:
        CALL      L:?push_w4
        LD        S:?b9, A
//   40   u8 i = 0;   
        CLR       S:?b8
//   41   for(i=0;i<8;i++)
        CLR       A
        LD        S:?b8, A
??LCD_WriteByte_0:
        LD        A, S:?b8
        CP        A, #0x8
        JRNC      L:??LCD_WriteByte_1
//   42   {
//   43     if(byte & 0x80)  
        LD        A, S:?b9
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??LCD_WriteByte_2
//   44       LCD_SDI_SET;  
        LD        A, #0x2
        LDW       X, #0x500f
        CALL      L:GPIO_SetBits
        JRA       L:??LCD_WriteByte_3
//   45     else  
//   46       LCD_SDI_CLR;  
??LCD_WriteByte_2:
        LD        A, #0x2
        LDW       X, #0x500f
        CALL      L:GPIO_ResetBits
//   47     byte <<= 1;
??LCD_WriteByte_3:
        LD        A, S:?b9
        SLL       A
        LD        S:?b9, A
//   48     LCD_CLK_SET;
        LD        A, #0x1
        LDW       X, #0x500f
        CALL      L:GPIO_SetBits
//   49     LCD_CLK_CLR;
        LD        A, #0x1
        LDW       X, #0x500f
        CALL      L:GPIO_ResetBits
//   50   }
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??LCD_WriteByte_0
//   51 }
??LCD_WriteByte_1:
        JP        L:?epilogue_w4
//   52 
//   53 //******************************************************************
//   54 //函数名：  LCD_WR_REG
//   55 //功能：    向液晶屏总线写入写16位指令
//   56 //输入参数：Reg:待写入的指令值
//   57 //返回值：  无
//   58 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   59 void LCD_WR_REG(u16 data)
//   60 { 
LCD_WR_REG:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   61   //  LCD_CS_CLR;
//   62   LCD_RS_CLR;
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_ResetBits
//   63   LCD_WriteByte(data);
        LD        A, S:?b9
        CALL      L:LCD_WriteByte
//   64   //  LCD_CS_SET;
//   65 }
        JP        L:?epilogue_w4
//   66 //******************************************************************
//   67 //函数名：  LCD_WR_DATA
//   68 //功能：    向液晶屏总线写入写8位数据
//   69 //输入参数：Data:待写入的数据
//   70 //返回值：  无
//   71 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 void LCD_WR_DATA(u8 data)
//   73 {
LCD_WR_DATA:
        PUSH      S:?b8
        LD        S:?b8, A
//   74   //  LCD_CS_CLR;
//   75   LCD_RS_SET;
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_SetBits
//   76   LCD_WriteByte(data);
        LD        A, S:?b8
        CALL      L:LCD_WriteByte
//   77   //  LCD_CS_SET;
//   78 }
        POP       S:?b8
        RET
//   79 //******************************************************************
//   80 //函数名：  LCD_DrawPoint_16Bit
//   81 //功能：    8位总线下如何写入一个16位数据
//   82 //输入参数：(x,y):光标坐标
//   83 //返回值：  无
//   84 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   85 void LCD_WR_DATA_16Bit(u16 data)
//   86 {	
LCD_WR_DATA_16Bit:
        CALL      L:?push_w4
        LDW       S:?w4, X
//   87   //  LCD_CS_CLR;
//   88   LCD_RS_SET; 
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_SetBits
//   89   LCD_WriteByte(data>>8);
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:LCD_WriteByte
//   90   LCD_WriteByte(data);
        LD        A, S:?b9
        CALL      L:LCD_WriteByte
//   91   //  LCD_CS_SET;
//   92 }
        JP        L:?epilogue_w4
//   93 //******************************************************************
//   94 //函数名：  LCD_WriteReg
//   95 //功能：    写寄存器数据
//   96 //输入参数：LCD_Reg:寄存器地址
//   97 //			LCD_RegValue:要写入的数据
//   98 //返回值：  无
//   99 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  100 void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
//  101 {	
LCD_WriteReg:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LDW       S:?w5, Y
//  102   LCD_WR_REG(LCD_Reg);  
        LDW       X, S:?w4
        CALL      L:LCD_WR_REG
//  103   LCD_WR_DATA(LCD_RegValue);	    		 
        LD        A, S:?b11
        CALL      L:LCD_WR_DATA
//  104 }
        JP        L:?epilogue_l2
//  105 //******************************************************************
//  106 //函数名：  LCD_WriteRAM_Prepare
//  107 //功能：    开始写GRAM
//  108 //			在给液晶屏传送RGB数据前，应该发送写GRAM指令
//  109 //输入参数：无
//  110 //返回值：  无
//  111 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  112 void LCD_WriteRAM_Prepare(void)
//  113 {
//  114   LCD_WR_REG(lcddev.wramcmd);
LCD_WriteRAM_Prepare:
        LDW       X, L:lcddev + 7
        CALL      L:LCD_WR_REG
//  115 }
        RET
//  116 //******************************************************************
//  117 //函数名：  LCD_DrawPoint
//  118 //功能：    在指定位置写入一个像素点数据
//  119 //输入参数：(x,y):光标坐标
//  120 //返回值：  无
//  121 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  122 void LCD_DrawPoint(u16 x,u16 y)
//  123 {
LCD_DrawPoint:
        CALL      L:?push_l2
        LDW       S:?w5, X
        LDW       S:?w4, Y
//  124   LCD_SetCursor(x,y);//设置光标位置 
        LDW       Y, S:?w4
        LDW       X, S:?w5
        CALL      L:LCD_SetCursor
//  125   LCD_WR_DATA_16Bit(POINT_COLOR);
        LDW       X, L:POINT_COLOR
        CALL      L:LCD_WR_DATA_16Bit
//  126 }
        JP        L:?epilogue_l2
//  127 ////******************************************************************
//  128 ////函数名：  LCD_Reset
//  129 ////功能：    LCD复位函数，液晶初始化前要调用此函数
//  130 ////输入参数：无
//  131 ////返回值：  无
//  132 ////******************************************************************
//  133 //void LCD_RESET(void)
//  134 //{
//  135 //  LCD_RST_CLR;
//  136 //  delay_ms(10);	
//  137 //  LCD_RST_SET;
//  138 //  delay_ms(5);
//  139 //}
//  140 
//  141 //******************************************************************
//  142 //函数名：  LCD_Init
//  143 //功能：    LCD初始化
//  144 //输入参数：无
//  145 //返回值：  无
//  146 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  147 void LCD_Init(void)
//  148 {
//  149   //  SPI_Master_Conf();	//硬件SPI禁用
//  150   //  LCD_RESET(); 	//液晶屏复位，这里使用NRST复位
//  151   LCD_GPIO_Init();
LCD_Init:
        CALL      L:LCD_GPIO_Init
//  152   
//  153   //************* Start Initial Sequence **********//		
//  154   //开始初始化液晶屏
//  155   LCD_WR_REG(0x11);//Sleep exit 
        LDW       X, #0x11
        CALL      L:LCD_WR_REG
//  156   delay_ms(10);		
        LDW       X, #0xa
        CALL      L:delay_ms
//  157   //ST7735R Frame Rate
//  158   
//  159   LCD_WR_REG(0xB1); 
        LDW       X, #0xb1
        CALL      L:LCD_WR_REG
//  160   LCD_WR_DATA(0x01); 
        LD        A, #0x1
        CALL      L:LCD_WR_DATA
//  161   LCD_WR_DATA(0x2C); 
        LD        A, #0x2c
        CALL      L:LCD_WR_DATA
//  162   LCD_WR_DATA(0x2D); 
        LD        A, #0x2d
        CALL      L:LCD_WR_DATA
//  163   
//  164   LCD_WR_REG(0xB2); 
        LDW       X, #0xb2
        CALL      L:LCD_WR_REG
//  165   LCD_WR_DATA(0x01); 
        LD        A, #0x1
        CALL      L:LCD_WR_DATA
//  166   LCD_WR_DATA(0x2C); 
        LD        A, #0x2c
        CALL      L:LCD_WR_DATA
//  167   LCD_WR_DATA(0x2D); 
        LD        A, #0x2d
        CALL      L:LCD_WR_DATA
//  168   
//  169   LCD_WR_REG(0xB3); 
        LDW       X, #0xb3
        CALL      L:LCD_WR_REG
//  170   LCD_WR_DATA(0x01); 
        LD        A, #0x1
        CALL      L:LCD_WR_DATA
//  171   LCD_WR_DATA(0x2C); 
        LD        A, #0x2c
        CALL      L:LCD_WR_DATA
//  172   LCD_WR_DATA(0x2D); 
        LD        A, #0x2d
        CALL      L:LCD_WR_DATA
//  173   LCD_WR_DATA(0x01); 
        LD        A, #0x1
        CALL      L:LCD_WR_DATA
//  174   LCD_WR_DATA(0x2C); 
        LD        A, #0x2c
        CALL      L:LCD_WR_DATA
//  175   LCD_WR_DATA(0x2D); 
        LD        A, #0x2d
        CALL      L:LCD_WR_DATA
//  176   
//  177   LCD_WR_REG(0xB4); //Column inversion 
        LDW       X, #0xb4
        CALL      L:LCD_WR_REG
//  178   LCD_WR_DATA(0x07); 
        LD        A, #0x7
        CALL      L:LCD_WR_DATA
//  179   
//  180   //ST7735R Power Sequence
//  181   LCD_WR_REG(0xC0); 
        LDW       X, #0xc0
        CALL      L:LCD_WR_REG
//  182   LCD_WR_DATA(0xA2); 
        LD        A, #0xa2
        CALL      L:LCD_WR_DATA
//  183   LCD_WR_DATA(0x02); 
        LD        A, #0x2
        CALL      L:LCD_WR_DATA
//  184   LCD_WR_DATA(0x84); 
        LD        A, #0x84
        CALL      L:LCD_WR_DATA
//  185   LCD_WR_REG(0xC1); 
        LDW       X, #0xc1
        CALL      L:LCD_WR_REG
//  186   LCD_WR_DATA(0xC5); 
        LD        A, #0xc5
        CALL      L:LCD_WR_DATA
//  187   
//  188   LCD_WR_REG(0xC2); 
        LDW       X, #0xc2
        CALL      L:LCD_WR_REG
//  189   LCD_WR_DATA(0x0A); 
        LD        A, #0xa
        CALL      L:LCD_WR_DATA
//  190   LCD_WR_DATA(0x00); 
        CLR       A
        CALL      L:LCD_WR_DATA
//  191   
//  192   LCD_WR_REG(0xC3); 
        LDW       X, #0xc3
        CALL      L:LCD_WR_REG
//  193   LCD_WR_DATA(0x8A); 
        LD        A, #0x8a
        CALL      L:LCD_WR_DATA
//  194   LCD_WR_DATA(0x2A); 
        LD        A, #0x2a
        CALL      L:LCD_WR_DATA
//  195   LCD_WR_REG(0xC4); 
        LDW       X, #0xc4
        CALL      L:LCD_WR_REG
//  196   LCD_WR_DATA(0x8A); 
        LD        A, #0x8a
        CALL      L:LCD_WR_DATA
//  197   LCD_WR_DATA(0xEE); 
        LD        A, #0xee
        CALL      L:LCD_WR_DATA
//  198   
//  199   LCD_WR_REG(0xC5); //VCOM 
        LDW       X, #0xc5
        CALL      L:LCD_WR_REG
//  200   LCD_WR_DATA(0x0E); 
        LD        A, #0xe
        CALL      L:LCD_WR_DATA
//  201   
//  202   LCD_WR_REG(0x36); //MX, MY, RGB mode 				 
        LDW       X, #0x36
        CALL      L:LCD_WR_REG
//  203   LCD_WR_DATA(0xC8); 
        LD        A, #0xc8
        CALL      L:LCD_WR_DATA
//  204   
//  205   //ST7735R Gamma Sequence
//  206   LCD_WR_REG(0xe0); 
        LDW       X, #0xe0
        CALL      L:LCD_WR_REG
//  207   LCD_WR_DATA(0x0f); 
        LD        A, #0xf
        CALL      L:LCD_WR_DATA
//  208   LCD_WR_DATA(0x1a); 
        LD        A, #0x1a
        CALL      L:LCD_WR_DATA
//  209   LCD_WR_DATA(0x0f); 
        LD        A, #0xf
        CALL      L:LCD_WR_DATA
//  210   LCD_WR_DATA(0x18); 
        LD        A, #0x18
        CALL      L:LCD_WR_DATA
//  211   LCD_WR_DATA(0x2f); 
        LD        A, #0x2f
        CALL      L:LCD_WR_DATA
//  212   LCD_WR_DATA(0x28); 
        LD        A, #0x28
        CALL      L:LCD_WR_DATA
//  213   LCD_WR_DATA(0x20); 
        LD        A, #0x20
        CALL      L:LCD_WR_DATA
//  214   LCD_WR_DATA(0x22); 
        LD        A, #0x22
        CALL      L:LCD_WR_DATA
//  215   LCD_WR_DATA(0x1f); 
        LD        A, #0x1f
        CALL      L:LCD_WR_DATA
//  216   LCD_WR_DATA(0x1b); 
        LD        A, #0x1b
        CALL      L:LCD_WR_DATA
//  217   LCD_WR_DATA(0x23); 
        LD        A, #0x23
        CALL      L:LCD_WR_DATA
//  218   LCD_WR_DATA(0x37); 
        LD        A, #0x37
        CALL      L:LCD_WR_DATA
//  219   LCD_WR_DATA(0x00); 	
        CLR       A
        CALL      L:LCD_WR_DATA
//  220   LCD_WR_DATA(0x07); 
        LD        A, #0x7
        CALL      L:LCD_WR_DATA
//  221   LCD_WR_DATA(0x02); 
        LD        A, #0x2
        CALL      L:LCD_WR_DATA
//  222   LCD_WR_DATA(0x10); 
        LD        A, #0x10
        CALL      L:LCD_WR_DATA
//  223   
//  224   LCD_WR_REG(0xe1); 
        LDW       X, #0xe1
        CALL      L:LCD_WR_REG
//  225   LCD_WR_DATA(0x0f); 
        LD        A, #0xf
        CALL      L:LCD_WR_DATA
//  226   LCD_WR_DATA(0x1b); 
        LD        A, #0x1b
        CALL      L:LCD_WR_DATA
//  227   LCD_WR_DATA(0x0f); 
        LD        A, #0xf
        CALL      L:LCD_WR_DATA
//  228   LCD_WR_DATA(0x17); 
        LD        A, #0x17
        CALL      L:LCD_WR_DATA
//  229   LCD_WR_DATA(0x33); 
        LD        A, #0x33
        CALL      L:LCD_WR_DATA
//  230   LCD_WR_DATA(0x2c); 
        LD        A, #0x2c
        CALL      L:LCD_WR_DATA
//  231   LCD_WR_DATA(0x29); 
        LD        A, #0x29
        CALL      L:LCD_WR_DATA
//  232   LCD_WR_DATA(0x2e); 
        LD        A, #0x2e
        CALL      L:LCD_WR_DATA
//  233   LCD_WR_DATA(0x30); 
        LD        A, #0x30
        CALL      L:LCD_WR_DATA
//  234   LCD_WR_DATA(0x30); 
        LD        A, #0x30
        CALL      L:LCD_WR_DATA
//  235   LCD_WR_DATA(0x39); 
        LD        A, #0x39
        CALL      L:LCD_WR_DATA
//  236   LCD_WR_DATA(0x3f); 
        LD        A, #0x3f
        CALL      L:LCD_WR_DATA
//  237   LCD_WR_DATA(0x00); 
        CLR       A
        CALL      L:LCD_WR_DATA
//  238   LCD_WR_DATA(0x07); 
        LD        A, #0x7
        CALL      L:LCD_WR_DATA
//  239   LCD_WR_DATA(0x03); 
        LD        A, #0x3
        CALL      L:LCD_WR_DATA
//  240   LCD_WR_DATA(0x10);  
        LD        A, #0x10
        CALL      L:LCD_WR_DATA
//  241   
//  242   LCD_WR_REG(0x2a);
        LDW       X, #0x2a
        CALL      L:LCD_WR_REG
//  243   LCD_WR_DATA(0x00);
        CLR       A
        CALL      L:LCD_WR_DATA
//  244   LCD_WR_DATA(0x00);
        CLR       A
        CALL      L:LCD_WR_DATA
//  245   LCD_WR_DATA(0x00);
        CLR       A
        CALL      L:LCD_WR_DATA
//  246   LCD_WR_DATA(0x7f);
        LD        A, #0x7f
        CALL      L:LCD_WR_DATA
//  247   
//  248   LCD_WR_REG(0x2b);
        LDW       X, #0x2b
        CALL      L:LCD_WR_REG
//  249   LCD_WR_DATA(0x00);
        CLR       A
        CALL      L:LCD_WR_DATA
//  250   LCD_WR_DATA(0x00);
        CLR       A
        CALL      L:LCD_WR_DATA
//  251   LCD_WR_DATA(0x00);
        CLR       A
        CALL      L:LCD_WR_DATA
//  252   LCD_WR_DATA(0x9f);
        LD        A, #0x9f
        CALL      L:LCD_WR_DATA
//  253   
//  254   LCD_WR_REG(0xF0); //Enable test command  
        LDW       X, #0xf0
        CALL      L:LCD_WR_REG
//  255   LCD_WR_DATA(0x01); 
        LD        A, #0x1
        CALL      L:LCD_WR_DATA
//  256   LCD_WR_REG(0xF6); //Disable ram power save mode 
        LDW       X, #0xf6
        CALL      L:LCD_WR_REG
//  257   LCD_WR_DATA(0x00); 
        CLR       A
        CALL      L:LCD_WR_DATA
//  258   
//  259   
//  260   LCD_WR_REG(0x3A); //65k mode 
        LDW       X, #0x3a
        CALL      L:LCD_WR_REG
//  261   LCD_WR_DATA(0x05); 	
        LD        A, #0x5
        CALL      L:LCD_WR_DATA
//  262   LCD_WR_REG(0x29);//Display on	
        LDW       X, #0x29
        CALL      L:LCD_WR_REG
//  263   
//  264   LCD_SetParam();//设置LCD参数
        CALL      L:LCD_SetParam
//  265   LCD_Clear(BLACK);
        CLRW      X
        CALL      L:LCD_Clear
//  266 }
        RET
//  267 //******************************************************************
//  268 //函数名：  LCD_Clear
//  269 //功能：    LCD全屏填充清屏函数
//  270 //输入参数：Color:要清屏的填充色
//  271 //返回值：  无
//  272 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  273 void LCD_Clear(u16 Color)
//  274 {
LCD_Clear:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w6, X
//  275   u16 i,j;      
//  276   LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);	  
        LDW       X, L:lcddev + 2
        DECW      X
        LDW       S:?w1, X
        LDW       X, L:lcddev
        DECW      X
        LDW       S:?w0, X
        CLRW      Y
        CLRW      X
        CALL      L:LCD_SetWindows
//  277   for(i=0;i<lcddev.width;i++)
        CLRW      X
        LDW       S:?w5, X
??LCD_Clear_0:
        LDW       X, S:?w5
        CPW       X, L:lcddev
        JRNC      L:??LCD_Clear_1
//  278   {
//  279     for(j=0;j<lcddev.height;j++)
        CLRW      X
        LDW       S:?w4, X
??LCD_Clear_2:
        LDW       X, S:?w4
        CPW       X, L:lcddev + 2
        JRNC      L:??LCD_Clear_3
//  280       LCD_WR_DATA_16Bit(Color);	//写入数据 	 
        LDW       X, S:?w6
        CALL      L:LCD_WR_DATA_16Bit
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??LCD_Clear_2
//  281   }
??LCD_Clear_3:
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        JRA       L:??LCD_Clear_0
//  282 }   		  
??LCD_Clear_1:
        JP        L:?epilogue_l2_w6
//  283 //*************************************************
//  284 //函数名：LCD_SetWindows
//  285 //功能：设置lcd显示窗口，在此区域写点数据自动换行
//  286 //入口参数：xy起点和终点
//  287 //返回值：无
//  288 //*************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  289 void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd)
//  290 {
LCD_SetWindows:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w6, X
        LDW       S:?w7, Y
        CALL      L:?mov_w5_w0
        CALL      L:?mov_w4_w1
//  291 #if USE_HORIZONTAL==1	//使用横屏
//  292   LCD_WR_REG(lcddev.setxcmd);	
        LDW       X, L:lcddev + 9
        CALL      L:LCD_WR_REG
//  293   LCD_WR_DATA(xStar>>8);
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:LCD_WR_DATA
//  294   LCD_WR_DATA(0x00FF&xStar+3);		
        LD        A, S:?b13
        ADD       A, #0x3
        CALL      L:LCD_WR_DATA
//  295   LCD_WR_DATA(xEnd>>8);
        LDW       X, S:?w5
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:LCD_WR_DATA
//  296   LCD_WR_DATA(0x00FF&xEnd+3);
        LD        A, S:?b11
        ADD       A, #0x3
        CALL      L:LCD_WR_DATA
//  297   
//  298   LCD_WR_REG(lcddev.setycmd);	
        LDW       X, L:lcddev + 11
        CALL      L:LCD_WR_REG
//  299   LCD_WR_DATA(yStar>>8);
        LDW       X, S:?w7
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:LCD_WR_DATA
//  300   LCD_WR_DATA(0x00FF&yStar+2);		
        LD        A, S:?b15
        ADD       A, #0x2
        CALL      L:LCD_WR_DATA
//  301   LCD_WR_DATA(yEnd>>8);
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:LCD_WR_DATA
//  302   LCD_WR_DATA(0x00FF&yEnd+2);	
        LD        A, S:?b9
        ADD       A, #0x2
        CALL      L:LCD_WR_DATA
//  303 #else
//  304   LCD_WR_REG(lcddev.setxcmd);	
//  305   LCD_WR_DATA(xStar>>8);
//  306   LCD_WR_DATA(0x00FF&xStar+2);		
//  307   LCD_WR_DATA(xEnd>>8);
//  308   LCD_WR_DATA(0x00FF&xEnd+2);
//  309   
//  310   LCD_WR_REG(lcddev.setycmd);	
//  311   LCD_WR_DATA(yStar>>8);
//  312   LCD_WR_DATA(0x00FF&yStar+3);		
//  313   LCD_WR_DATA(yEnd>>8);
//  314   LCD_WR_DATA(0x00FF&yEnd+3);	
//  315 #endif
//  316   
//  317   LCD_WriteRAM_Prepare();	//开始写入GRAM				
        CALL      L:LCD_WriteRAM_Prepare
//  318 }   
        JP        L:?epilogue_l2_l3
//  319 
//  320 //*************************************************
//  321 //函数名：LCD_SetCursor
//  322 //功能：设置光标位置
//  323 //入口参数：xy坐标
//  324 //返回值：无
//  325 //*************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  326 void LCD_SetCursor(u16 Xpos, u16 Ypos)
//  327 {	  	    			
LCD_SetCursor:
        CALL      L:?push_l2
        LDW       S:?w5, X
        LDW       S:?w4, Y
//  328   LCD_SetWindows(Xpos,Ypos,Xpos,Ypos);
        CALL      L:?mov_w1_w4
        CALL      L:?mov_w0_w5
        LDW       Y, S:?w4
        LDW       X, S:?w5
        CALL      L:LCD_SetWindows
//  329 } 
        JP        L:?epilogue_l2
//  330 
//  331 //*************************************************
//  332 //函数名：LCD_SetParam
//  333 //功能：设置LCD参数
//  334 //入口参数：无
//  335 //返回值：无
//  336 //*************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  337 void LCD_SetParam(void)
//  338 {
//  339   lcddev.wramcmd=0x2C;
LCD_SetParam:
        LDW       X, #0x2c
        LDW       L:lcddev + 7, X
//  340 #if USE_HORIZONTAL==1	//使用横屏	  
//  341   lcddev.dir=1;//横屏
        MOV       L:lcddev + 6, #0x1
//  342   lcddev.width=128;
        LDW       X, #0x80
        LDW       L:lcddev, X
//  343   lcddev.height=128;
        LDW       X, #0x80
        LDW       L:lcddev + 2, X
//  344   lcddev.setxcmd=0x2A;
        LDW       X, #0x2a
        LDW       L:lcddev + 9, X
//  345   lcddev.setycmd=0x2B;			
        LDW       X, #0x2b
        LDW       L:lcddev + 11, X
//  346   LCD_WriteReg(0x36,0xA8);
        LDW       Y, #0xa8
        LDW       X, #0x36
        CALL      L:LCD_WriteReg
//  347   
//  348 #else//竖屏
//  349   lcddev.dir=0;//竖屏				 	 		
//  350   lcddev.width=128;
//  351   lcddev.height=128;
//  352   lcddev.setxcmd=0x2A;
//  353   lcddev.setycmd=0x2B;	
//  354   LCD_WriteReg(0x36,0xC8);
//  355 #endif
//  356 }
        RET
//  357 
//  358 
//  359 /******************************************************************/
//  360 /***************************GUI************************************/
//  361 /******************************************************************/
//  362 
//  363 //******************************************************************
//  364 //函数名：  GUI_DrawPoint
//  365 //功能：    GUI描绘一个点
//  366 //输入参数：x:光标位置x坐标
//  367 //        	y:光标位置y坐标
//  368 //			color:要填充的颜色
//  369 //返回值：  无
//  370 //修改记录：无
//  371 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  372 void GUI_DrawPoint(u16 x,u16 y,u16 color)
//  373 {
GUI_DrawPoint:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w5, X
        LDW       S:?w4, Y
        CALL      L:?mov_w6_w0
//  374   LCD_SetCursor(x,y);//设置光标位置 
        LDW       Y, S:?w4
        LDW       X, S:?w5
        CALL      L:LCD_SetCursor
//  375   LCD_WR_DATA_16Bit(color); 
        LDW       X, S:?w6
        CALL      L:LCD_WR_DATA_16Bit
//  376 }
        JP        L:?epilogue_l2_w6
//  377 
//  378 //******************************************************************
//  379 //函数名：  LCD_Fill
//  380 //功能：    在指定区域内填充颜色
//  381 //输入参数：sx:指定区域开始点x坐标
//  382 //        	sy:指定区域开始点y坐标
//  383 //			ex:指定区域结束点x坐标
//  384 //			ey:指定区域结束点y坐标
//  385 //        	color:要填充的颜色
//  386 //返回值：  无
//  387 //修改记录：无
//  388 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  389 void LCD_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 color)
//  390 {  	
LCD_Fill:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSHW     Y
        CALL      L:?push_w0
        SUB       SP, #0x4
        CALL      L:?mov_w7_w1
        CALL      L:?mov_w6_w2
//  391   
//  392   u16 i,j;			
//  393   u16 width=ex-sx+1; 		//得到填充的宽度
        LDW       X, (0x5,SP)
        SUBW      X, (0x9,SP)
        INCW      X
        LDW       (0x3,SP), X
//  394   u16 height=ey-sy+1;		//高度
        LDW       X, S:?w7
        SUBW      X, (0x7,SP)
        INCW      X
        LDW       (0x1,SP), X
//  395   LCD_SetWindows(sx,sy,ex-1,ey-1);//设置显示窗口
        LDW       X, S:?w7
        DECW      X
        LDW       S:?w1, X
        LDW       X, (0x5,SP)
        DECW      X
        LDW       S:?w0, X
        LDW       Y, (0x7,SP)
        LDW       X, (0x9,SP)
        CALL      L:LCD_SetWindows
//  396   for(i=0;i<height;i++)
        CLRW      X
        LDW       S:?w5, X
??LCD_Fill_0:
        LDW       X, S:?w5
        CPW       X, (0x1,SP)
        JRNC      L:??LCD_Fill_1
//  397   {
//  398     for(j=0;j<width;j++)
        CLRW      X
        LDW       S:?w4, X
??LCD_Fill_2:
        LDW       X, S:?w4
        CPW       X, (0x3,SP)
        JRNC      L:??LCD_Fill_3
//  399       LCD_WR_DATA_16Bit(color);	//写入数据 	 
        LDW       X, S:?w6
        CALL      L:LCD_WR_DATA_16Bit
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??LCD_Fill_2
//  400   }
??LCD_Fill_3:
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        JRA       L:??LCD_Fill_0
//  401   
//  402   LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复窗口设置为全屏
??LCD_Fill_1:
        LDW       X, L:lcddev + 2
        DECW      X
        LDW       S:?w1, X
        LDW       X, L:lcddev
        DECW      X
        LDW       S:?w0, X
        CLRW      Y
        CLRW      X
        CALL      L:LCD_SetWindows
//  403 }
        ADD       SP, #0xa
        JP        L:?epilogue_l2_l3
//  404 
//  405 //******************************************************************
//  406 //函数名：  LCD_DrawLine
//  407 //功能：    GUI画线
//  408 //输入参数：x1,y1:起点坐标
//  409 //        	x2,y2:终点坐标 
//  410 //返回值：  无
//  411 //修改记录：无
//  412 //****************************************************************** 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  413 void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2)
//  414 {
LCD_DrawLine:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSHW     Y
        CALL      L:?push_w0
        CALL      L:?push_w1
        SUB       SP, #0xc
//  415   u16 t; 
//  416   int xerr=0,yerr=0,delta_x,delta_y,distance; 
        CLR       S:?b15
        CLR       S:?b14
        CLR       S:?b13
        CLR       S:?b12
//  417   int incx,incy,uRow,uCol; 
//  418   
//  419   delta_x=x2-x1; //计算坐标增量 
        LDW       X, (0xf,SP)
        SUBW      X, (0x13,SP)
        LDW       S:?w5, X
//  420   delta_y=y2-y1; 
        LDW       X, (0xd,SP)
        SUBW      X, (0x11,SP)
        LDW       S:?w4, X
//  421   uRow=x1; 
        LDW       X, (0x13,SP)
        LDW       (0x5,SP), X
//  422   uCol=y1; 
        LDW       X, (0x11,SP)
        LDW       (0x3,SP), X
//  423   if(delta_x>0)incx=1; //设置单步方向 
        LDW       X, S:?w5
        CPW       X, #0x1
        JRSLT     L:??LCD_DrawLine_0
        CLRW      X
        INCW      X
        LDW       (0x9,SP), X
        JRA       L:??LCD_DrawLine_1
//  424   else if(delta_x==0)incx=0;//垂直线 
??LCD_DrawLine_0:
        LDW       X, S:?w5
        TNZW      X
        JRNE      L:??LCD_DrawLine_2
        CLRW      X
        LDW       (0x9,SP), X
        JRA       L:??LCD_DrawLine_1
//  425   else {incx=-1;delta_x=-delta_x;} 
??LCD_DrawLine_2:
        CLRW      X
        DECW      X
        LDW       (0x9,SP), X
        LDW       Y, S:?w5
        LDW       X, Y
        NEGW      X
        LDW       S:?w5, X
//  426   if(delta_y>0)incy=1; 
??LCD_DrawLine_1:
        LDW       X, S:?w4
        CPW       X, #0x1
        JRSLT     L:??LCD_DrawLine_3
        CLRW      X
        INCW      X
        LDW       (0x7,SP), X
        JRA       L:??LCD_DrawLine_4
//  427   else if(delta_y==0)incy=0;//水平线 
??LCD_DrawLine_3:
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??LCD_DrawLine_5
        CLRW      X
        LDW       (0x7,SP), X
        JRA       L:??LCD_DrawLine_4
//  428   else{incy=-1;delta_y=-delta_y;} 
??LCD_DrawLine_5:
        CLRW      X
        DECW      X
        LDW       (0x7,SP), X
        LDW       Y, S:?w4
        LDW       X, Y
        NEGW      X
        LDW       S:?w4, X
//  429   if( delta_x>delta_y)distance=delta_x; //选取基本增量坐标轴 
??LCD_DrawLine_4:
        LDW       X, S:?w4
        CPW       X, S:?w5
        JRSGE     L:??LCD_DrawLine_6
        LDW       X, S:?w5
        LDW       (0x1,SP), X
        JRA       L:??LCD_DrawLine_7
//  430   else distance=delta_y; 
??LCD_DrawLine_6:
        LDW       X, S:?w4
        LDW       (0x1,SP), X
//  431   for(t=0;t<=distance+1;t++ )//画线输出 
??LCD_DrawLine_7:
        CLRW      X
        LDW       (0xb,SP), X
??LCD_DrawLine_8:
        LDW       X, (0x1,SP)
        INCW      X
        CPW       X, (0xb,SP)
        JRC       L:??LCD_DrawLine_9
//  432   {  
//  433     LCD_DrawPoint(uRow,uCol);//画点 
        LDW       Y, (0x3,SP)
        LDW       X, (0x5,SP)
        CALL      L:LCD_DrawPoint
//  434     xerr+=delta_x ; 
        LDW       X, S:?w5
        ADDW      X, S:?w7
        LDW       S:?w7, X
//  435     yerr+=delta_y ; 
        LDW       X, S:?w4
        ADDW      X, S:?w6
        LDW       S:?w6, X
//  436     if(xerr>distance) 
        LDW       X, (0x1,SP)
        CPW       X, S:?w7
        JRSGE     L:??LCD_DrawLine_10
//  437     { 
//  438       xerr-=distance; 
        LDW       X, S:?w7
        SUBW      X, (0x1,SP)
        LDW       S:?w7, X
//  439       uRow+=incx; 
        LDW       X, (0x9,SP)
        ADDW      X, (0x5,SP)
        LDW       (0x5,SP), X
//  440     } 
//  441     if(yerr>distance) 
??LCD_DrawLine_10:
        LDW       X, (0x1,SP)
        CPW       X, S:?w6
        JRSGE     L:??LCD_DrawLine_11
//  442     { 
//  443       yerr-=distance; 
        LDW       X, S:?w6
        SUBW      X, (0x1,SP)
        LDW       S:?w6, X
//  444       uCol+=incy; 
        LDW       X, (0x7,SP)
        ADDW      X, (0x3,SP)
        LDW       (0x3,SP), X
//  445     } 
//  446   }  
??LCD_DrawLine_11:
        LDW       X, (0xb,SP)
        INCW      X
        LDW       (0xb,SP), X
        JRA       L:??LCD_DrawLine_8
//  447 } 
??LCD_DrawLine_9:
        ADD       SP, #0x14
        JP        L:?epilogue_l2_l3
//  448 
//  449 //******************************************************************
//  450 //函数名：  LCD_DrawRectangle
//  451 //功能：    GUI画矩形(非填充)
//  452 //输入参数：(x1,y1),(x2,y2):矩形的对角坐标
//  453 //返回值：  无
//  454 //修改记录：无
//  455 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  456 void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
//  457 {
LCD_DrawRectangle:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w7, X
        LDW       S:?w6, Y
        CALL      L:?mov_w5_w0
        CALL      L:?mov_w4_w1
//  458   LCD_DrawLine(x1,y1,x2,y1);
        CALL      L:?mov_w1_w6
        CALL      L:?mov_w0_w5
        LDW       Y, S:?w6
        LDW       X, S:?w7
        CALL      L:LCD_DrawLine
//  459   LCD_DrawLine(x1,y1,x1,y2);
        CALL      L:?mov_w1_w4
        CALL      L:?mov_w0_w7
        LDW       Y, S:?w6
        LDW       X, S:?w7
        CALL      L:LCD_DrawLine
//  460   LCD_DrawLine(x1,y2,x2,y2);
        CALL      L:?mov_w1_w4
        CALL      L:?mov_w0_w5
        LDW       Y, S:?w4
        LDW       X, S:?w7
        CALL      L:LCD_DrawLine
//  461   LCD_DrawLine(x2,y1,x2,y2);
        CALL      L:?mov_w1_w4
        CALL      L:?mov_w0_w5
        LDW       Y, S:?w6
        LDW       X, S:?w5
        CALL      L:LCD_DrawLine
//  462 }  
        JP        L:?epilogue_l2_l3
//  463 
//  464 //******************************************************************
//  465 //函数名：  LCD_DrawFillRectangle
//  466 //功能：    GUI画矩形(填充)
//  467 //输入参数：(x1,y1),(x2,y2):矩形的对角坐标
//  468 //返回值：  无
//  469 //修改记录：无
//  470 //******************************************************************   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  471 void LCD_DrawFillRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
//  472 {
LCD_DrawFillRectangle:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w7, X
        LDW       S:?w6, Y
        CALL      L:?mov_w5_w0
        CALL      L:?mov_w4_w1
//  473   LCD_Fill(x1,y1,x2,y2,POINT_COLOR);
        LDW       X, L:POINT_COLOR
        LDW       S:?w2, X
        CALL      L:?mov_w1_w4
        CALL      L:?mov_w0_w5
        LDW       Y, S:?w6
        LDW       X, S:?w7
        CALL      L:LCD_Fill
//  474 }
        JP        L:?epilogue_l2_l3
//  475 
//  476 //******************************************************************
//  477 //函数名：  _draw_circle_8
//  478 //功能：    8对称性画圆算法(内部调用)
//  479 //输入参数：(xc,yc) :圆中心坐标
//  480 // 			(x,y):光标相对于圆心的坐标
//  481 //         	c:填充的颜色
//  482 //返回值：  无
//  483 //修改记录：无
//  484 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  485 void _draw_circle_8(int xc, int yc, int x, int y, u16 c)
//  486 {
_draw_circle_8:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        LDW       S:?w7, Y
        CALL      L:?mov_w6_w0
        CALL      L:?mov_w5_w1
        CALL      L:?mov_w4_w2
//  487   GUI_DrawPoint(xc + x, yc + y, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w5
        ADDW      Y, S:?w7
        LDW       X, S:?w6
        ADDW      X, (0x1,SP)
        CALL      L:GUI_DrawPoint
//  488   GUI_DrawPoint(xc - x, yc + y, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w5
        ADDW      Y, S:?w7
        LDW       X, (0x1,SP)
        SUBW      X, S:?w6
        CALL      L:GUI_DrawPoint
//  489   GUI_DrawPoint(xc + x, yc - y, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w7
        SUBW      Y, S:?w5
        LDW       X, S:?w6
        ADDW      X, (0x1,SP)
        CALL      L:GUI_DrawPoint
//  490   GUI_DrawPoint(xc - x, yc - y, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w7
        SUBW      Y, S:?w5
        LDW       X, (0x1,SP)
        SUBW      X, S:?w6
        CALL      L:GUI_DrawPoint
//  491   GUI_DrawPoint(xc + y, yc + x, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w6
        ADDW      Y, S:?w7
        LDW       X, S:?w5
        ADDW      X, (0x1,SP)
        CALL      L:GUI_DrawPoint
//  492   GUI_DrawPoint(xc - y, yc + x, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w6
        ADDW      Y, S:?w7
        LDW       X, (0x1,SP)
        SUBW      X, S:?w5
        CALL      L:GUI_DrawPoint
//  493   GUI_DrawPoint(xc + y, yc - x, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w7
        SUBW      Y, S:?w6
        LDW       X, S:?w5
        ADDW      X, (0x1,SP)
        CALL      L:GUI_DrawPoint
//  494   GUI_DrawPoint(xc - y, yc - x, c);
        CALL      L:?mov_w0_w4
        LDW       Y, S:?w7
        SUBW      Y, S:?w6
        LDW       X, (0x1,SP)
        SUBW      X, S:?w5
        CALL      L:GUI_DrawPoint
//  495 }
        ADD       SP, #0x2
        JP        L:?epilogue_l2_l3
//  496 
//  497 //******************************************************************
//  498 //函数名：  LCD_Circle
//  499 //功能：    在指定位置画一个指定大小的圆(填充)
//  500 //输入参数：(xc,yc) :圆中心坐标
//  501 //         	c:填充的颜色
//  502 //		 	r:圆半径
//  503 //		 	fill:填充判断标志，1-填充，0-不填充
//  504 //返回值：  无
//  505 //修改记录：无
//  506 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  507 void LCD_Circle(int xc, int yc,u16 c,int r, int fill)
//  508 {
LCD_Circle:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSHW     Y
        CALL      L:?push_w0
        CALL      L:?push_w1
        CALL      L:?push_w2
//  509   int x = 0, y = r, yi, d;
        CLR       S:?b9
        CLR       S:?b8
        LDW       X, (0x3,SP)
        LDW       S:?w5, X
//  510   d = 3 - 2 * r;
        LDW       X, (0x3,SP)
        SLLW      X
        LDW       S:?w0, X
        LDW       X, #0x3
        SUBW      X, S:?w0
        LDW       S:?w6, X
//  511   if (fill) 
        LDW       X, (0x1,SP)
        TNZW      X
        JREQ      L:??LCD_Circle_0
//  512   {
//  513     // 如果填充（画实心圆）
//  514     while (x <= y) {
??LCD_Circle_1:
        LDW       X, S:?w5
        CPW       X, S:?w4
        JRSGE     ??lb_1
        JP        L:??LCD_Circle_2
//  515       for (yi = x; yi <= y; yi++)
??lb_1:
        CALL      L:?mov_w7_w4
??LCD_Circle_3:
        LDW       X, S:?w5
        CPW       X, S:?w7
        JRSLT     L:??LCD_Circle_4
//  516         _draw_circle_8(xc, yc, x, yi, c);
        LDW       X, (0x5,SP)
        LDW       S:?w2, X
        CALL      L:?mov_w1_w7
        CALL      L:?mov_w0_w4
        LDW       X, (0x7,SP)
        LDW       Y, X
        LDW       X, (0x9,SP)
        CALL      L:_draw_circle_8
        LDW       X, S:?w7
        INCW      X
        LDW       S:?w7, X
        JRA       L:??LCD_Circle_3
//  517       
//  518       if (d < 0) {
??LCD_Circle_4:
        LDW       X, S:?w6
        CPW       X, #0x0
        JRSGE     L:??LCD_Circle_5
//  519         d = d + 4 * x + 6;
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALL      L:?mul16_x_x_w0
        ADDW      X, #0x6
        ADDW      X, S:?w6
        LDW       S:?w6, X
        JRA       L:??LCD_Circle_6
//  520       } else {
//  521         d = d + 4 * (x - y) + 10;
??LCD_Circle_5:
        LDW       X, S:?w4
        SUBW      X, S:?w5
        LDW       Y, X
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #0xa
        ADDW      X, S:?w6
        LDW       S:?w6, X
//  522         y--;
        LDW       X, S:?w5
        DECW      X
        LDW       S:?w5, X
//  523       }
//  524       x++;
??LCD_Circle_6:
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??LCD_Circle_1
//  525     }
//  526   } else 
//  527   {
//  528     // 如果不填充（画空心圆）
//  529     while (x <= y) {
??LCD_Circle_0:
        LDW       X, S:?w5
        CPW       X, S:?w4
        JRSLT     L:??LCD_Circle_2
//  530       _draw_circle_8(xc, yc, x, y, c);
        LDW       X, (0x5,SP)
        LDW       S:?w2, X
        CALL      L:?mov_w1_w5
        CALL      L:?mov_w0_w4
        LDW       X, (0x7,SP)
        LDW       Y, X
        LDW       X, (0x9,SP)
        CALL      L:_draw_circle_8
//  531       if (d < 0) {
        LDW       X, S:?w6
        CPW       X, #0x0
        JRSGE     L:??LCD_Circle_7
//  532         d = d + 4 * x + 6;
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, S:?w4
        CALL      L:?mul16_x_x_w0
        ADDW      X, #0x6
        ADDW      X, S:?w6
        LDW       S:?w6, X
        JRA       L:??LCD_Circle_8
//  533       } else {
//  534         d = d + 4 * (x - y) + 10;
??LCD_Circle_7:
        LDW       X, S:?w4
        SUBW      X, S:?w5
        LDW       Y, X
        LDW       X, #0x4
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #0xa
        ADDW      X, S:?w6
        LDW       S:?w6, X
//  535         y--;
        LDW       X, S:?w5
        DECW      X
        LDW       S:?w5, X
//  536       }
//  537       x++;
??LCD_Circle_8:
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??LCD_Circle_0
//  538     }
//  539   }
//  540 }
??LCD_Circle_2:
        ADD       SP, #0xa
        JP        L:?epilogue_l2_l3
//  541 
//  542 //******************************************************************
//  543 //函数名：  LCD_ShowChar
//  544 //功能：    显示单个英文字符
//  545 //输入参数：(x,y):字符显示位置起始坐标
//  546 //        	fc:前置画笔颜色
//  547 //			bc:背景颜色
//  548 //			num:数值（0-94）
//  549 //			mode:模式  0,填充模式;1,叠加模式
//  550 //返回值：  无
//  551 //修改记录：无
//  552 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  553 void LCD_ShowChar(u16 x,u16 y,u16 fc, u16 bc, u8 num)
//  554 {  
LCD_ShowChar:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        CALL      L:?push_w1
        SUB       SP, #0x2
        LDW       S:?w7, Y
        CALL      L:?mov_w6_w0
        LD        S:?b8, A
//  555   u8 temp;
//  556   u8 pos,t;
//  557   u16 colortemp=POINT_COLOR;      
        LDW       X, L:POINT_COLOR
        LDW       (0x1,SP), X
//  558   
//  559   num=num-' ';//得到偏移后的值
        LD        A, S:?b8
        ADD       A, #0xe0
        LD        S:?b8, A
//  560   LCD_SetWindows(x,y,x+5,y+11);//设置单个文字显示窗口	
        LDW       X, S:?w7
        ADDW      X, #0xb
        LDW       S:?w1, X
        LDW       X, (0x5,SP)
        ADDW      X, #0x5
        LDW       S:?w0, X
        LDW       Y, S:?w7
        LDW       X, (0x5,SP)
        CALL      L:LCD_SetWindows
//  561   for(pos=0;pos<12;pos++)
        CLR       A
        LD        S:?b10, A
??LCD_ShowChar_0:
        LD        A, S:?b10
        CP        A, #0xc
        JRNC      L:??LCD_ShowChar_1
//  562   {
//  563     temp=asc2_1206[num][pos];//调用1206字体
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LDW       Y, X
        LDW       X, #0xc
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #asc2_1206
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LD        A, (X)
        LD        S:?b9, A
//  564     for(t=0;t<6;t++)
        CLR       A
        LD        S:?b11, A
??LCD_ShowChar_2:
        LD        A, S:?b11
        CP        A, #0x6
        JRNC      L:??LCD_ShowChar_3
//  565     {   
//  566       POINT_COLOR=fc;              
        LDW       X, S:?w6
        LDW       L:POINT_COLOR, X
//  567       if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//画一个点    
        LD        A, S:?b9
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??LCD_ShowChar_4
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b10
        EXG       A, YL
        ADDW      Y, S:?w7
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        ADDW      X, (0x5,SP)
        CALL      L:LCD_DrawPoint
//  568       temp>>=1; 
??LCD_ShowChar_4:
        LD        A, S:?b9
        SRL       A
        LD        S:?b9, A
//  569     }
        LD        A, S:?b11
        ADD       A, #0x1
        LD        S:?b11, A
        JRA       L:??LCD_ShowChar_2
//  570   }
??LCD_ShowChar_3:
        LD        A, S:?b10
        ADD       A, #0x1
        LD        S:?b10, A
        JRA       L:??LCD_ShowChar_0
//  571   POINT_COLOR=colortemp;	
??LCD_ShowChar_1:
        LDW       X, (0x1,SP)
        LDW       L:POINT_COLOR, X
//  572   LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复窗口为全屏    	   	 	  
        LDW       X, L:lcddev + 2
        DECW      X
        LDW       S:?w1, X
        LDW       X, L:lcddev
        DECW      X
        LDW       S:?w0, X
        CLRW      Y
        CLRW      X
        CALL      L:LCD_SetWindows
//  573 } 
        ADD       SP, #0x6
        JP        L:?epilogue_l2_l3
//  574 
//  575 //******************************************************************
//  576 //函数名：  LCD_ShowOneChar
//  577 //功能：    显示单个英文字符
//  578 //输入参数：(x,y):字符显示位置起始坐标
//  579 //			ch:ascii数值（0-94）
//  580 //返回值：  无
//  581 //修改记录：无
//  582 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  583 void LCD_ShowOneChar(u16 x,u16 y, u8 ch)
//  584 {  
LCD_ShowOneChar:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LDW       S:?w7, X
        LDW       S:?w6, Y
        LD        S:?b8, A
//  585   u8 temp;
//  586   u8 pos,t; 
//  587   
//  588   ch=ch-' ';//得到偏移后的值
        LD        A, S:?b8
        ADD       A, #0xe0
        LD        S:?b8, A
//  589   LCD_SetWindows(x,y,x+5,y+11);//设置单个文字显示窗口
        LDW       X, S:?w6
        ADDW      X, #0xb
        LDW       S:?w1, X
        LDW       X, S:?w7
        ADDW      X, #0x5
        LDW       S:?w0, X
        LDW       Y, S:?w6
        LDW       X, S:?w7
        CALL      L:LCD_SetWindows
//  590   for(pos=0;pos<12;pos++)
        CLR       A
        LD        S:?b10, A
??LCD_ShowOneChar_0:
        LD        A, S:?b10
        CP        A, #0xc
        JRNC      L:??LCD_ShowOneChar_1
//  591   {
//  592     temp=asc2_1206[ch][pos];//调用1206字体
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LDW       Y, X
        LDW       X, #0xc
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        ADDW      X, #asc2_1206
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LD        A, (X)
        LD        S:?b9, A
//  593     for(t=0;t<6;t++)
        CLR       A
        LD        S:?b11, A
??LCD_ShowOneChar_2:
        LD        A, S:?b11
        CP        A, #0x6
        JRNC      L:??LCD_ShowOneChar_3
//  594     {
//  595       if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//画一个点    
        LD        A, S:?b9
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??LCD_ShowOneChar_4
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b10
        EXG       A, YL
        ADDW      Y, S:?w6
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        ADDW      X, S:?w7
        CALL      L:LCD_DrawPoint
//  596       temp>>=1; 
??LCD_ShowOneChar_4:
        LD        A, S:?b9
        SRL       A
        LD        S:?b9, A
//  597     }
        LD        A, S:?b11
        ADD       A, #0x1
        LD        S:?b11, A
        JRA       L:??LCD_ShowOneChar_2
//  598   }
??LCD_ShowOneChar_3:
        LD        A, S:?b10
        ADD       A, #0x1
        LD        S:?b10, A
        JRA       L:??LCD_ShowOneChar_0
//  599   LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复窗口为全屏    	   	 	  
??LCD_ShowOneChar_1:
        LDW       X, L:lcddev + 2
        DECW      X
        LDW       S:?w1, X
        LDW       X, L:lcddev
        DECW      X
        LDW       S:?w0, X
        CLRW      Y
        CLRW      X
        CALL      L:LCD_SetWindows
//  600 } 
        JP        L:?epilogue_l2_l3
//  601 
//  602 //******************************************************************
//  603 //函数名：  LCD_ShowString
//  604 //功能：    显示英文字符串
//  605 //输入参数：x,y :起点坐标	 
//  606 //			*p:字符串起始地址
//  607 //			mode:模式	0,填充模式;1,叠加模式
//  608 //返回值：  无
//  609 //修改记录：无
//  610 //******************************************************************  	  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  611 void LCD_ShowString(u16 x,u16 y,u8 *p)
//  612 {         
LCD_ShowString:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w5, X
        LDW       S:?w6, Y
        CALL      L:?mov_w4_w0
//  613   //while((*p<='~')&&(*p>=' '))//判断是不是非法字符!
//  614   while(*p)
??LCD_ShowString_0:
        TNZ       [S:?w4.w]
        JREQ      L:??LCD_ShowString_1
//  615   {
//  616     if((*p<='~')&&(*p>=' '))
        LD        A, [S:?w4.w]
        CP        A, #0x7f
        JRNC      L:??LCD_ShowString_2
        LD        A, [S:?w4.w]
        CP        A, #0x20
        JRC       L:??LCD_ShowString_2
//  617     {
//  618       if(x>(lcddev.width-1)||y>(lcddev.height-1)) 
        LDW       X, L:lcddev
        DECW      X
        CPW       X, S:?w5
        JRC       L:??LCD_ShowString_3
        LDW       X, L:lcddev + 2
        DECW      X
        CPW       X, S:?w6
        JRNC      L:??LCD_ShowString_4
//  619         return;     
??LCD_ShowString_3:
        JRA       L:??LCD_ShowString_5
//  620       if((*p<='~')&&(*p>=' '))
??LCD_ShowString_4:
        LD        A, [S:?w4.w]
        CP        A, #0x7f
        JRNC      L:??LCD_ShowString_2
        LD        A, [S:?w4.w]
        CP        A, #0x20
        JRC       L:??LCD_ShowString_2
//  621       {
//  622         LCD_ShowChar(x,y,POINT_COLOR,BACK_COLOR,*p);
        LD        A, [S:?w4.w]
        LDW       X, L:BACK_COLOR
        LDW       S:?w1, X
        LDW       X, L:POINT_COLOR
        LDW       S:?w0, X
        LDW       Y, S:?w6
        LDW       X, S:?w5
        CALL      L:LCD_ShowChar
//  623         x+=6;
        LDW       X, S:?w5
        ADDW      X, #0x6
        LDW       S:?w5, X
//  624       }
//  625     }
//  626     p++;
??LCD_ShowString_2:
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??LCD_ShowString_0
//  627   }
//  628 }
??LCD_ShowString_1:
??LCD_ShowString_5:
        JP        L:?epilogue_l2_w6
//  629 
//  630 //******************************************************************
//  631 //函数名：  mypow
//  632 //功能：    求m的n次方(gui内部调用)
//  633 //输入参数：m:乘数
//  634 //	        n:幂
//  635 //返回值：  m的n次方
//  636 //修改记录：无
//  637 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  638 u16 mypow(u8 m,u8 n)
//  639 {
mypow:
        LD        S:?b2, A
        LD        A, S:?b0
//  640   u16 result=1;	 
        LDW       Y, #0x1
//  641   while(n--)result*=m;    
??mypow_0:
        LD        S:?b0, A
        LD        A, S:?b0
        ADD       A, #0xff
        TNZ       S:?b0
        JREQ      L:??mypow_1
        CLRW      X
        EXG       A, XL
        LD        A, S:?b2
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, X
        JRA       L:??mypow_0
//  642   return result;
??mypow_1:
        LDW       X, Y
        RET
//  643 }
//  644 
//  645 //******************************************************************
//  646 //函数名：  LCD_ShowNum
//  647 //功能：    显示单个数字变量值
//  648 //输入参数：x,y :起点坐标	 
//  649 //			len :指定显示数字的位数
//  650 //			color:颜色
//  651 //			num:数值(0~4294967295)
//  652 //返回值：  无
//  653 //修改记录：无
//  654 //******************************************************************  			 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  655 void LCD_ShowNum(u16 x,u16 y,u32 num,u8 len)
//  656 {         	
LCD_ShowNum:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        SUB       SP, #0x2
        LDW       S:?w5, Y
        CALL      L:?mov_l3_l0
        LD        S:?b9, A
//  657   u8 t,temp;
//  658   u8 enshow=0;						   
        CLR       A
        LD        (0x1,SP), A
//  659   for(t=0;t<len;t++)
        CLR       A
        LD        S:?b8, A
??LCD_ShowNum_0:
        LD        A, S:?b8
        CP        A, S:?b9
        JRC       ??lb_0
        JP        L:??LCD_ShowNum_1
//  660   {
//  661     temp=(num/mypow(10,len-t-1))%10;
??lb_0:
        LD        A, S:?b9
        SUB       A, S:?b8
        ADD       A, #0xff
        LD        S:?b0, A
        LD        A, #0xa
        CALL      L:mypow
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?mov_l0_l3
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?umod32_l1_l0_dl
        DATA
        DC32      0xa
        CODE
        LD        A, S:?b7
        LD        (0x2,SP), A
//  662     if(enshow==0&&t<(len-1))
        TNZ       (0x1,SP)
        JRNE      L:??LCD_ShowNum_2
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        DECW      X
        LDW       S:?w0, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        CPW       X, S:?w0
        JRSGE     L:??LCD_ShowNum_2
//  663     {
//  664       if(temp==0)
        TNZ       (0x2,SP)
        JRNE      L:??LCD_ShowNum_3
//  665       {
//  666         LCD_ShowChar(x+(6)*t,y,POINT_COLOR,BACK_COLOR,' ');
        LD        A, #0x20
        LDW       X, L:BACK_COLOR
        LDW       S:?w1, X
        LDW       X, L:POINT_COLOR
        LDW       S:?w0, X
        LDW       Y, S:?w5
        PUSHW     Y
        LDW       Y, S:?w0
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LDW       S:?w2, X
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALL      L:?mul16_x_x_w0
        ADDW      X, (0x5,SP)
        LDW       S:?w0, Y
        POPW      Y
        CALL      L:LCD_ShowChar
//  667         continue;
        JRA       L:??LCD_ShowNum_4
//  668       }else enshow=1; 
??LCD_ShowNum_3:
        LD        A, #0x1
        LD        (0x1,SP), A
//  669     }
//  670     LCD_ShowChar(x+(6)*t,y,POINT_COLOR,BACK_COLOR,temp+'0'); 
??LCD_ShowNum_2:
        LD        A, (0x2,SP)
        ADD       A, #0x30
        LDW       X, L:BACK_COLOR
        LDW       S:?w1, X
        LDW       X, L:POINT_COLOR
        LDW       S:?w0, X
        LDW       Y, S:?w5
        PUSHW     Y
        LDW       Y, S:?w0
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LDW       S:?w2, X
        LDW       X, #0x6
        LDW       S:?w0, X
        LDW       X, S:?w2
        CALL      L:?mul16_x_x_w0
        ADDW      X, (0x5,SP)
        LDW       S:?w0, Y
        POPW      Y
        CALL      L:LCD_ShowChar
//  671   }
??LCD_ShowNum_4:
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JP        L:??LCD_ShowNum_0
//  672 }
??LCD_ShowNum_1:
        ADD       SP, #0x4
        JP        L:?epilogue_l2_l3
//  673 
//  674 //******************************************************************
//  675 //函数名：  LCD_Drawbmp16
//  676 //功能：    显示一副16位BMP图像
//  677 //输入参数：x,y :起点坐标
//  678 // 			*p :图像数组起始地址
//  679 //返回值：  无
//  680 //修改记录：无
//  681 //******************************************************************  

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  682 void LCD_Drawbmp16(u16 x,u16 y,const unsigned char *p) //显示40*40 QQ图片
//  683 {
LCD_Drawbmp16:
        CALL      L:?push_l2
        CALL      L:?push_l3
        CALL      L:?push_w0
        LDW       S:?w7, X
        LDW       S:?w6, Y
//  684   int i; 
//  685   unsigned char picH,picL; 
//  686   LCD_SetWindows(x,y,x+40-1,y+40-1);//窗口设置
        LDW       X, S:?w6
        ADDW      X, #0x27
        LDW       S:?w1, X
        LDW       X, S:?w7
        ADDW      X, #0x27
        LDW       S:?w0, X
        LDW       Y, S:?w6
        LDW       X, S:?w7
        CALL      L:LCD_SetWindows
//  687   for(i=0;i<40*40;i++)
        CLRW      X
        LDW       S:?w4, X
??LCD_Drawbmp16_0:
        LDW       X, S:?w4
        CPW       X, #0x640
        JRSGE     L:??LCD_Drawbmp16_1
//  688   {	
//  689     picL=*(p+i*2);	//数据低位在前
        LDW       X, S:?w4
        SLLW      X
        ADDW      X, (0x1,SP)
        LD        A, (X)
        LD        S:?b10, A
//  690     picH=*(p+i*2+1);				
        LDW       X, S:?w4
        SLLW      X
        ADDW      X, (0x1,SP)
        INCW      X
        LD        A, (X)
        LD        S:?b11, A
//  691     LCD_WR_DATA_16Bit(picH<<8|picL);  						
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        CALL      L:LCD_WR_DATA_16Bit
//  692   }	
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??LCD_Drawbmp16_0
//  693   LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复显示窗口为全屏	
??LCD_Drawbmp16_1:
        LDW       X, L:lcddev + 2
        DECW      X
        LDW       S:?w1, X
        LDW       X, L:lcddev
        DECW      X
        LDW       S:?w0, X
        CLRW      Y
        CLRW      X
        CALL      L:LCD_SetWindows
//  694   
//  695 }
        ADD       SP, #0x2
        JP        L:?epilogue_l2_l3

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  696 
//  697 
//  698 
//  699 
//  700 
//  701 
// 
//    82 bytes in section .near.bss
//     2 bytes in section .near.data
// 1 140 bytes in section .near.rodata
// 2 648 bytes in section .near_func.text
// 
// 2 648 bytes of CODE  memory
// 1 140 bytes of CONST memory
//    84 bytes of DATA  memory
//
//Errors: none
//Warnings: 3
