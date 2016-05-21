#ifndef _OLED_H
#define _OLED_H

#include "main.h"

#define OLED_XLevelL    0x00
#define OLED_XLevelH    0x10
#define OLED_XLevel     ((XLevelH&0x0F)*16+XLevelL)
#define OLED_Max_Column	128
#define OLED_Max_Row    64
#define	OLED_Brightness	0xCF 
#define OLED_X_WIDTH    128
#define OLED_Y_WIDTH    64

#define LCD_GPIO_PORT                  GPIOB
#define LCD_CLK_PIN                    GPIO_Pin_3
#define LCD_SDI_PIN                    GPIO_Pin_4
#define LCD_RS_PIN                     GPIO_Pin_2
#define LCD_RST_PORT                   GPIOA
#define LCD_RST_PIN                    GPIO_Pin_5

//液晶控制口置1操作语句宏定义
#define	LCD_CLK_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_CLK_PIN)
#define	LCD_SDI_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_SDI_PIN)
#define	LCD_RS_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_RS_PIN)
#define	LCD_RST_SET  	GPIO_SetBits(LCD_RST_PORT,  LCD_RST_PIN)

//液晶控制口置0操作语句宏定义
#define	LCD_CLK_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_CLK_PIN)
#define	LCD_SDI_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_SDI_PIN)
#define	LCD_RS_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_RS_PIN)
#define	LCD_RST_CLR  	GPIO_ResetBits(LCD_RST_PORT,  LCD_RST_PIN)

void OLED_GPIO_Init(void);
void OLED_Init(void);
void OLED_WriteData(u8 sendData);
void OLED_WriteCmd(u8 sendData);
void OLED_SetPos(u8 IndexX, u8 IndexY);

void OLED_Fill(u8 fillData);
void OLED_ClearScreen(void);
void OLED_PrintfChar6x8(u8 IndexX, u8 IndexY, u8 pData);
void OLED_PrintfString(u16 x,u16 y,u8 *p);
void OLED_PrintfNum(u8 IndexX, u8 IndexY, u32 Num, u8 Len);


void OLED_DrawPoint(u8 IndexX, u8 IndexY);

#endif

