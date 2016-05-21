#ifndef __SPI_TFT_H
#define __SPI_TFT_H

#include "main.h"

extern u8 RxBuf[64];

//LCD重要参数集
typedef struct  
{										    
	u16 width;			//LCD 宽度
	u16 height;			//LCD 高度
	u16 id;				//LCD ID
	u8  dir;			//横屏还是竖屏控制：0，竖屏；1，横屏。	
	u16 wramcmd;		//开始写gram指令
	u16 setxcmd;		//设置x坐标指令
	u16 setycmd;		//设置y坐标指令	 
}_lcd_dev; 	

//LCD参数
extern _lcd_dev lcddev;	//管理LCD重要参数
/////////////////////////////////////用户配置区///////////////////////////////////	 
//支持横竖屏快速定义切换，支持8/16位模式切换
#define USE_HORIZONTAL  	1	//定义是否使用横屏 		0,不使用.1,使用.
//////////////////////////////////////////////////////////////////////////////////	  
//定义LCD的尺寸
#if USE_HORIZONTAL==1	//使用横屏
#define LCD_W 320
#define LCD_H 240
#else
#define LCD_W 240
#define LCD_H 320
#endif

//TFTLCD部分外要调用的函数		   
extern u16  POINT_COLOR;//默认红色    
extern u16  BACK_COLOR; //背景颜色.默认为白色

#define LCD_GPIO_PORT                  GPIOD
#define LCD_CLK_PIN                    GPIO_Pin_0
#define LCD_SDI_PIN                    GPIO_Pin_1
#define LCD_RS_PIN                     GPIO_Pin_2

//液晶控制口置1操作语句宏定义
#define	LCD_CLK_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_CLK_PIN)
#define	LCD_SDI_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_SDI_PIN)
#define	LCD_RS_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_RS_PIN)

//液晶控制口置0操作语句宏定义
#define	LCD_CLK_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_CLK_PIN)
#define	LCD_SDI_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_SDI_PIN)
#define	LCD_RS_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_RS_PIN)

//画笔颜色
#define WHITE           0xFFFF
#define BLACK           0x0000	  
#define BLUE            0x001F  
#define BRED            0XF81F
#define GRED            0XFFE0
#define GBLUE           0X07FF
#define RED             0xF800
#define MAGENTA         0xF81F
#define GREEN           0x07E0
#define CYAN            0x7FFF
#define YELLOW          0xFFE0
#define BROWN 		0XBC40 //棕色
#define BRRED 		0XFC07 //棕红色
#define GRAY  		0X8430 //灰色
//GUI颜色

#define DARKBLUE      	 0X01CF	//深蓝色
#define LIGHTBLUE      	 0X7D7C	//浅蓝色  
#define GRAYBLUE       	 0X5458 //灰蓝色
//以上三色为PANEL的颜色 
 
#define LIGHTGREEN     	0X841F //浅绿色
//#define LIGHTGRAY     0XEF5B //浅灰色(PANNEL)
#define LGRAY 			 		0XC618 //浅灰色(PANNEL),窗体背景色

#define LGRAYBLUE      	0XA651 //浅灰蓝色(中间层颜色)
#define LBBLUE          0X2B12 //浅棕蓝色(选择条目的反色)
	    															  
extern u16 BACK_COLOR, POINT_COLOR ;  

void LCD_Init(void);
void LCD_GPIO_Init(void);
void LCD_WriteByte(u8 byte);
void LCD_WR_DATA(u8 data);
void LCD_WR_DATA_16Bit(u16 data);
void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue);
void LCD_WriteRAM_Prepare(void);

void LCD_DrawPoint_16Bit(u16 color);
void LCD_Clear(u16 Color);	
void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd);
void LCD_SetCursor(u16 Xpos, u16 Ypos);
void LCD_SetParam(void);
u16 mypow(u8 m,u8 n);

void GUI_DrawPoint(u16 x,u16 y,u16 color);
void LCD_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 color);
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2);
void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2);
void LCD_ShowChar(u16 x,u16 y,u16 fc, u16 bc, u8 num);
void LCD_ShowOneChar(u16 x,u16 y, u8 ch);
void LCD_ShowNum(u16 x,u16 y,u32 num,u8 len);
//void LCD_ShowNumString(u16 x,u16 y,u16 num);   //导入库使用的flash太大，弃用
void LCD_ShowString(u16 x,u16 y,u8 *p);
void LCD_Drawbmp16(u16 x,u16 y,const unsigned char *p);
void LCD_Circle(int xc, int yc,u16 c,int r, int fill);
void LCD_DrawFillRectangle(u16 x1, u16 y1, u16 x2, u16 y2);
				
#endif  

