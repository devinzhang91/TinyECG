#ifndef __SPI_TFT_H
#define __SPI_TFT_H

#include "main.h"

extern u8 RxBuf[64];

//LCD��Ҫ������
typedef struct  
{										    
	u16 width;			//LCD ���
	u16 height;			//LCD �߶�
	u16 id;				//LCD ID
	u8  dir;			//���������������ƣ�0��������1��������	
	u16 wramcmd;		//��ʼдgramָ��
	u16 setxcmd;		//����x����ָ��
	u16 setycmd;		//����y����ָ��	 
}_lcd_dev; 	

//LCD����
extern _lcd_dev lcddev;	//����LCD��Ҫ����
/////////////////////////////////////�û�������///////////////////////////////////	 
//֧�ֺ��������ٶ����л���֧��8/16λģʽ�л�
#define USE_HORIZONTAL  	1	//�����Ƿ�ʹ�ú��� 		0,��ʹ��.1,ʹ��.
//////////////////////////////////////////////////////////////////////////////////	  
//����LCD�ĳߴ�
#if USE_HORIZONTAL==1	//ʹ�ú���
#define LCD_W 320
#define LCD_H 240
#else
#define LCD_W 240
#define LCD_H 320
#endif

//TFTLCD������Ҫ���õĺ���		   
extern u16  POINT_COLOR;//Ĭ�Ϻ�ɫ    
extern u16  BACK_COLOR; //������ɫ.Ĭ��Ϊ��ɫ

#define LCD_GPIO_PORT                  GPIOD
#define LCD_CLK_PIN                    GPIO_Pin_0
#define LCD_SDI_PIN                    GPIO_Pin_1
#define LCD_RS_PIN                     GPIO_Pin_2

//Һ�����ƿ���1�������궨��
#define	LCD_CLK_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_CLK_PIN)
#define	LCD_SDI_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_SDI_PIN)
#define	LCD_RS_SET  	GPIO_SetBits(LCD_GPIO_PORT, LCD_RS_PIN)

//Һ�����ƿ���0�������궨��
#define	LCD_CLK_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_CLK_PIN)
#define	LCD_SDI_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_SDI_PIN)
#define	LCD_RS_CLR  	GPIO_ResetBits(LCD_GPIO_PORT, LCD_RS_PIN)

//������ɫ
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
#define BROWN 		0XBC40 //��ɫ
#define BRRED 		0XFC07 //�غ�ɫ
#define GRAY  		0X8430 //��ɫ
//GUI��ɫ

#define DARKBLUE      	 0X01CF	//����ɫ
#define LIGHTBLUE      	 0X7D7C	//ǳ��ɫ  
#define GRAYBLUE       	 0X5458 //����ɫ
//������ɫΪPANEL����ɫ 
 
#define LIGHTGREEN     	0X841F //ǳ��ɫ
//#define LIGHTGRAY     0XEF5B //ǳ��ɫ(PANNEL)
#define LGRAY 			 		0XC618 //ǳ��ɫ(PANNEL),���屳��ɫ

#define LGRAYBLUE      	0XA651 //ǳ����ɫ(�м����ɫ)
#define LBBLUE          0X2B12 //ǳ����ɫ(ѡ����Ŀ�ķ�ɫ)
	    															  
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
//void LCD_ShowNumString(u16 x,u16 y,u16 num);   //�����ʹ�õ�flash̫������
void LCD_ShowString(u16 x,u16 y,u8 *p);
void LCD_Drawbmp16(u16 x,u16 y,const unsigned char *p);
void LCD_Circle(int xc, int yc,u16 c,int r, int fill);
void LCD_DrawFillRectangle(u16 x1, u16 y1, u16 x2, u16 y2);
				
#endif  

