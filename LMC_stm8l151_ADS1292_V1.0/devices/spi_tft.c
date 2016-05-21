/* �� spi_tft.c �����޸�
* ʹ��ģ��SPI����TFT
* CS����Ĭ����Ӳ��ѡ��
*/

#include "spi_tft.h"
#include "spi_tft_FONT.h"

u8 RxBuf[64];
u8 cnt=0;

//����LCD��Ҫ����
//Ĭ��Ϊ����
_lcd_dev lcddev;

//������ɫ,������ɫ
u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
u16 DeviceCode;

//******************************************************************
//��������  LCD_GPIO_Init
//���ܣ�    LCD�ܽų�ʼ��
//�����������
//����ֵ��  ��
//******************************************************************
void LCD_GPIO_Init(void)
{
  GPIO_Init(LCD_GPIO_PORT, LCD_RS_PIN , GPIO_Mode_Out_PP_High_Slow);
  GPIO_Init(LCD_GPIO_PORT, LCD_CLK_PIN | LCD_SDI_PIN, GPIO_Mode_Out_PP_High_Slow);	//ģ��spi IO
}

//******************************************************************
//��������  LCD_WriteByte
//���ܣ�    LCD����д��  (ģ��SPI)
//���������byte��д����ֽ�
//����ֵ��  ��
//******************************************************************
void LCD_WriteByte(u8 byte)
{
  u8 i = 0;   
  for(i=0;i<8;i++)
  {
    if(byte & 0x80)  
      LCD_SDI_SET;  
    else  
      LCD_SDI_CLR;  
    byte <<= 1;
    LCD_CLK_SET;
    LCD_CLK_CLR;
  }
}

//******************************************************************
//��������  LCD_WR_REG
//���ܣ�    ��Һ��������д��д16λָ��
//���������Reg:��д���ָ��ֵ
//����ֵ��  ��
//******************************************************************
void LCD_WR_REG(u16 data)
{ 
  //  LCD_CS_CLR;
  LCD_RS_CLR;
  LCD_WriteByte(data);
  //  LCD_CS_SET;
}
//******************************************************************
//��������  LCD_WR_DATA
//���ܣ�    ��Һ��������д��д8λ����
//���������Data:��д�������
//����ֵ��  ��
//******************************************************************
void LCD_WR_DATA(u8 data)
{
  //  LCD_CS_CLR;
  LCD_RS_SET;
  LCD_WriteByte(data);
  //  LCD_CS_SET;
}
//******************************************************************
//��������  LCD_DrawPoint_16Bit
//���ܣ�    8λ���������д��һ��16λ����
//���������(x,y):�������
//����ֵ��  ��
//******************************************************************
void LCD_WR_DATA_16Bit(u16 data)
{	
  //  LCD_CS_CLR;
  LCD_RS_SET; 
  LCD_WriteByte(data>>8);
  LCD_WriteByte(data);
  //  LCD_CS_SET;
}
//******************************************************************
//��������  LCD_WriteReg
//���ܣ�    д�Ĵ�������
//���������LCD_Reg:�Ĵ�����ַ
//			LCD_RegValue:Ҫд�������
//����ֵ��  ��
//******************************************************************
void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
{	
  LCD_WR_REG(LCD_Reg);  
  LCD_WR_DATA(LCD_RegValue);	    		 
}
//******************************************************************
//��������  LCD_WriteRAM_Prepare
//���ܣ�    ��ʼдGRAM
//			�ڸ�Һ��������RGB����ǰ��Ӧ�÷���дGRAMָ��
//�����������
//����ֵ��  ��
//******************************************************************
void LCD_WriteRAM_Prepare(void)
{
  LCD_WR_REG(lcddev.wramcmd);
}
//******************************************************************
//��������  LCD_DrawPoint
//���ܣ�    ��ָ��λ��д��һ�����ص�����
//���������(x,y):�������
//����ֵ��  ��
//******************************************************************
void LCD_DrawPoint(u16 x,u16 y)
{
  LCD_SetCursor(x,y);//���ù��λ�� 
  LCD_WR_DATA_16Bit(POINT_COLOR);
}
////******************************************************************
////��������  LCD_Reset
////���ܣ�    LCD��λ������Һ����ʼ��ǰҪ���ô˺���
////�����������
////����ֵ��  ��
////******************************************************************
//void LCD_RESET(void)
//{
//  LCD_RST_CLR;
//  delay_ms(10);	
//  LCD_RST_SET;
//  delay_ms(5);
//}

//******************************************************************
//��������  LCD_Init
//���ܣ�    LCD��ʼ��
//�����������
//����ֵ��  ��
//******************************************************************
void LCD_Init(void)
{
  //  SPI_Master_Conf();	//Ӳ��SPI����
  //  LCD_RESET(); 	//Һ������λ������ʹ��NRST��λ
  LCD_GPIO_Init();
  
  //************* Start Initial Sequence **********//		
  //��ʼ��ʼ��Һ����
  LCD_WR_REG(0x11);//Sleep exit 
  delay_ms(10);		
  //ST7735R Frame Rate
  
  LCD_WR_REG(0xB1); 
  LCD_WR_DATA(0x01); 
  LCD_WR_DATA(0x2C); 
  LCD_WR_DATA(0x2D); 
  
  LCD_WR_REG(0xB2); 
  LCD_WR_DATA(0x01); 
  LCD_WR_DATA(0x2C); 
  LCD_WR_DATA(0x2D); 
  
  LCD_WR_REG(0xB3); 
  LCD_WR_DATA(0x01); 
  LCD_WR_DATA(0x2C); 
  LCD_WR_DATA(0x2D); 
  LCD_WR_DATA(0x01); 
  LCD_WR_DATA(0x2C); 
  LCD_WR_DATA(0x2D); 
  
  LCD_WR_REG(0xB4); //Column inversion 
  LCD_WR_DATA(0x07); 
  
  //ST7735R Power Sequence
  LCD_WR_REG(0xC0); 
  LCD_WR_DATA(0xA2); 
  LCD_WR_DATA(0x02); 
  LCD_WR_DATA(0x84); 
  LCD_WR_REG(0xC1); 
  LCD_WR_DATA(0xC5); 
  
  LCD_WR_REG(0xC2); 
  LCD_WR_DATA(0x0A); 
  LCD_WR_DATA(0x00); 
  
  LCD_WR_REG(0xC3); 
  LCD_WR_DATA(0x8A); 
  LCD_WR_DATA(0x2A); 
  LCD_WR_REG(0xC4); 
  LCD_WR_DATA(0x8A); 
  LCD_WR_DATA(0xEE); 
  
  LCD_WR_REG(0xC5); //VCOM 
  LCD_WR_DATA(0x0E); 
  
  LCD_WR_REG(0x36); //MX, MY, RGB mode 				 
  LCD_WR_DATA(0xC8); 
  
  //ST7735R Gamma Sequence
  LCD_WR_REG(0xe0); 
  LCD_WR_DATA(0x0f); 
  LCD_WR_DATA(0x1a); 
  LCD_WR_DATA(0x0f); 
  LCD_WR_DATA(0x18); 
  LCD_WR_DATA(0x2f); 
  LCD_WR_DATA(0x28); 
  LCD_WR_DATA(0x20); 
  LCD_WR_DATA(0x22); 
  LCD_WR_DATA(0x1f); 
  LCD_WR_DATA(0x1b); 
  LCD_WR_DATA(0x23); 
  LCD_WR_DATA(0x37); 
  LCD_WR_DATA(0x00); 	
  LCD_WR_DATA(0x07); 
  LCD_WR_DATA(0x02); 
  LCD_WR_DATA(0x10); 
  
  LCD_WR_REG(0xe1); 
  LCD_WR_DATA(0x0f); 
  LCD_WR_DATA(0x1b); 
  LCD_WR_DATA(0x0f); 
  LCD_WR_DATA(0x17); 
  LCD_WR_DATA(0x33); 
  LCD_WR_DATA(0x2c); 
  LCD_WR_DATA(0x29); 
  LCD_WR_DATA(0x2e); 
  LCD_WR_DATA(0x30); 
  LCD_WR_DATA(0x30); 
  LCD_WR_DATA(0x39); 
  LCD_WR_DATA(0x3f); 
  LCD_WR_DATA(0x00); 
  LCD_WR_DATA(0x07); 
  LCD_WR_DATA(0x03); 
  LCD_WR_DATA(0x10);  
  
  LCD_WR_REG(0x2a);
  LCD_WR_DATA(0x00);
  LCD_WR_DATA(0x00);
  LCD_WR_DATA(0x00);
  LCD_WR_DATA(0x7f);
  
  LCD_WR_REG(0x2b);
  LCD_WR_DATA(0x00);
  LCD_WR_DATA(0x00);
  LCD_WR_DATA(0x00);
  LCD_WR_DATA(0x9f);
  
  LCD_WR_REG(0xF0); //Enable test command  
  LCD_WR_DATA(0x01); 
  LCD_WR_REG(0xF6); //Disable ram power save mode 
  LCD_WR_DATA(0x00); 
  
  
  LCD_WR_REG(0x3A); //65k mode 
  LCD_WR_DATA(0x05); 	
  LCD_WR_REG(0x29);//Display on	
  
  LCD_SetParam();//����LCD����
  LCD_Clear(BLACK);
}
//******************************************************************
//��������  LCD_Clear
//���ܣ�    LCDȫ�������������
//���������Color:Ҫ���������ɫ
//����ֵ��  ��
//******************************************************************
void LCD_Clear(u16 Color)
{
  u16 i,j;      
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);	  
  for(i=0;i<lcddev.width;i++)
  {
    for(j=0;j<lcddev.height;j++)
      LCD_WR_DATA_16Bit(Color);	//д������ 	 
  }
}   		  
//*************************************************
//��������LCD_SetWindows
//���ܣ�����lcd��ʾ���ڣ��ڴ�����д�������Զ�����
//��ڲ�����xy�����յ�
//����ֵ����
//*************************************************
void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd)
{
#if USE_HORIZONTAL==1	//ʹ�ú���
  LCD_WR_REG(lcddev.setxcmd);	
  LCD_WR_DATA(xStar>>8);
  LCD_WR_DATA(0x00FF&xStar+3);		
  LCD_WR_DATA(xEnd>>8);
  LCD_WR_DATA(0x00FF&xEnd+3);
  
  LCD_WR_REG(lcddev.setycmd);	
  LCD_WR_DATA(yStar>>8);
  LCD_WR_DATA(0x00FF&yStar+2);		
  LCD_WR_DATA(yEnd>>8);
  LCD_WR_DATA(0x00FF&yEnd+2);	
#else
  LCD_WR_REG(lcddev.setxcmd);	
  LCD_WR_DATA(xStar>>8);
  LCD_WR_DATA(0x00FF&xStar+2);		
  LCD_WR_DATA(xEnd>>8);
  LCD_WR_DATA(0x00FF&xEnd+2);
  
  LCD_WR_REG(lcddev.setycmd);	
  LCD_WR_DATA(yStar>>8);
  LCD_WR_DATA(0x00FF&yStar+3);		
  LCD_WR_DATA(yEnd>>8);
  LCD_WR_DATA(0x00FF&yEnd+3);	
#endif
  
  LCD_WriteRAM_Prepare();	//��ʼд��GRAM				
}   

//*************************************************
//��������LCD_SetCursor
//���ܣ����ù��λ��
//��ڲ�����xy����
//����ֵ����
//*************************************************/
void LCD_SetCursor(u16 Xpos, u16 Ypos)
{	  	    			
  LCD_SetWindows(Xpos,Ypos,Xpos,Ypos);
} 

//*************************************************
//��������LCD_SetParam
//���ܣ�����LCD����
//��ڲ�������
//����ֵ����
//*************************************************/
void LCD_SetParam(void)
{
  lcddev.wramcmd=0x2C;
#if USE_HORIZONTAL==1	//ʹ�ú���	  
  lcddev.dir=1;//����
  lcddev.width=128;
  lcddev.height=128;
  lcddev.setxcmd=0x2A;
  lcddev.setycmd=0x2B;			
  LCD_WriteReg(0x36,0xA8);
  
#else//����
  lcddev.dir=0;//����				 	 		
  lcddev.width=128;
  lcddev.height=128;
  lcddev.setxcmd=0x2A;
  lcddev.setycmd=0x2B;	
  LCD_WriteReg(0x36,0xC8);
#endif
}


/******************************************************************/
/***************************GUI************************************/
/******************************************************************/

//******************************************************************
//��������  GUI_DrawPoint
//���ܣ�    GUI���һ����
//���������x:���λ��x����
//        	y:���λ��y����
//			color:Ҫ������ɫ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void GUI_DrawPoint(u16 x,u16 y,u16 color)
{
  LCD_SetCursor(x,y);//���ù��λ�� 
  LCD_WR_DATA_16Bit(color); 
}

//******************************************************************
//��������  LCD_Fill
//���ܣ�    ��ָ�������������ɫ
//���������sx:ָ������ʼ��x����
//        	sy:ָ������ʼ��y����
//			ex:ָ�����������x����
//			ey:ָ�����������y����
//        	color:Ҫ������ɫ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************
void LCD_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 color)
{  	
  
  u16 i,j;			
  u16 width=ex-sx+1; 		//�õ����Ŀ��
  u16 height=ey-sy+1;		//�߶�
  LCD_SetWindows(sx,sy,ex-1,ey-1);//������ʾ����
  for(i=0;i<height;i++)
  {
    for(j=0;j<width;j++)
      LCD_WR_DATA_16Bit(color);	//д������ 	 
  }
  
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//�ָ���������Ϊȫ��
}

//******************************************************************
//��������  LCD_DrawLine
//���ܣ�    GUI����
//���������x1,y1:�������
//        	x2,y2:�յ����� 
//����ֵ��  ��
//�޸ļ�¼����
//****************************************************************** 
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2)
{
  u16 t; 
  int xerr=0,yerr=0,delta_x,delta_y,distance; 
  int incx,incy,uRow,uCol; 
  
  delta_x=x2-x1; //������������ 
  delta_y=y2-y1; 
  uRow=x1; 
  uCol=y1; 
  if(delta_x>0)incx=1; //���õ������� 
  else if(delta_x==0)incx=0;//��ֱ�� 
  else {incx=-1;delta_x=-delta_x;} 
  if(delta_y>0)incy=1; 
  else if(delta_y==0)incy=0;//ˮƽ�� 
  else{incy=-1;delta_y=-delta_y;} 
  if( delta_x>delta_y)distance=delta_x; //ѡȡ�������������� 
  else distance=delta_y; 
  for(t=0;t<=distance+1;t++ )//������� 
  {  
    LCD_DrawPoint(uRow,uCol);//���� 
    xerr+=delta_x ; 
    yerr+=delta_y ; 
    if(xerr>distance) 
    { 
      xerr-=distance; 
      uRow+=incx; 
    } 
    if(yerr>distance) 
    { 
      yerr-=distance; 
      uCol+=incy; 
    } 
  }  
} 

//******************************************************************
//��������  LCD_DrawRectangle
//���ܣ�    GUI������(�����)
//���������(x1,y1),(x2,y2):���εĶԽ�����
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  
void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
{
  LCD_DrawLine(x1,y1,x2,y1);
  LCD_DrawLine(x1,y1,x1,y2);
  LCD_DrawLine(x1,y2,x2,y2);
  LCD_DrawLine(x2,y1,x2,y2);
}  

//******************************************************************
//��������  LCD_DrawFillRectangle
//���ܣ�    GUI������(���)
//���������(x1,y1),(x2,y2):���εĶԽ�����
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************   
void LCD_DrawFillRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
{
  LCD_Fill(x1,y1,x2,y2,POINT_COLOR);
}

//******************************************************************
//��������  _draw_circle_8
//���ܣ�    8�Գ��Ի�Բ�㷨(�ڲ�����)
//���������(xc,yc) :Բ��������
// 			(x,y):��������Բ�ĵ�����
//         	c:������ɫ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  
void _draw_circle_8(int xc, int yc, int x, int y, u16 c)
{
  GUI_DrawPoint(xc + x, yc + y, c);
  GUI_DrawPoint(xc - x, yc + y, c);
  GUI_DrawPoint(xc + x, yc - y, c);
  GUI_DrawPoint(xc - x, yc - y, c);
  GUI_DrawPoint(xc + y, yc + x, c);
  GUI_DrawPoint(xc - y, yc + x, c);
  GUI_DrawPoint(xc + y, yc - x, c);
  GUI_DrawPoint(xc - y, yc - x, c);
}

//******************************************************************
//��������  LCD_Circle
//���ܣ�    ��ָ��λ�û�һ��ָ����С��Բ(���)
//���������(xc,yc) :Բ��������
//         	c:������ɫ
//		 	r:Բ�뾶
//		 	fill:����жϱ�־��1-��䣬0-�����
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  
void LCD_Circle(int xc, int yc,u16 c,int r, int fill)
{
  int x = 0, y = r, yi, d;
  d = 3 - 2 * r;
  if (fill) 
  {
    // �����䣨��ʵ��Բ��
    while (x <= y) {
      for (yi = x; yi <= y; yi++)
        _draw_circle_8(xc, yc, x, yi, c);
      
      if (d < 0) {
        d = d + 4 * x + 6;
      } else {
        d = d + 4 * (x - y) + 10;
        y--;
      }
      x++;
    }
  } else 
  {
    // �������䣨������Բ��
    while (x <= y) {
      _draw_circle_8(xc, yc, x, y, c);
      if (d < 0) {
        d = d + 4 * x + 6;
      } else {
        d = d + 4 * (x - y) + 10;
        y--;
      }
      x++;
    }
  }
}

//******************************************************************
//��������  LCD_ShowChar
//���ܣ�    ��ʾ����Ӣ���ַ�
//���������(x,y):�ַ���ʾλ����ʼ����
//        	fc:ǰ�û�����ɫ
//			bc:������ɫ
//			num:��ֵ��0-94��
//			mode:ģʽ  0,���ģʽ;1,����ģʽ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  
void LCD_ShowChar(u16 x,u16 y,u16 fc, u16 bc, u8 num)
{  
  u8 temp;
  u8 pos,t;
  u16 colortemp=POINT_COLOR;      
  
  num=num-' ';//�õ�ƫ�ƺ��ֵ
  LCD_SetWindows(x,y,x+5,y+11);//���õ���������ʾ����	
  for(pos=0;pos<12;pos++)
  {
    temp=asc2_1206[num][pos];//����1206����
    for(t=0;t<6;t++)
    {   
      POINT_COLOR=fc;              
      if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//��һ����    
      temp>>=1; 
    }
  }
  POINT_COLOR=colortemp;	
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//�ָ�����Ϊȫ��    	   	 	  
} 

//******************************************************************
//��������  LCD_ShowOneChar
//���ܣ�    ��ʾ����Ӣ���ַ�
//���������(x,y):�ַ���ʾλ����ʼ����
//			ch:ascii��ֵ��0-94��
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  
void LCD_ShowOneChar(u16 x,u16 y, u8 ch)
{  
  u8 temp;
  u8 pos,t; 
  
  ch=ch-' ';//�õ�ƫ�ƺ��ֵ
  LCD_SetWindows(x,y,x+5,y+11);//���õ���������ʾ����
  for(pos=0;pos<12;pos++)
  {
    temp=asc2_1206[ch][pos];//����1206����
    for(t=0;t<6;t++)
    {
      if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//��һ����    
      temp>>=1; 
    }
  }
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//�ָ�����Ϊȫ��    	   	 	  
} 

//******************************************************************
//��������  LCD_ShowString
//���ܣ�    ��ʾӢ���ַ���
//���������x,y :�������	 
//			*p:�ַ�����ʼ��ַ
//			mode:ģʽ	0,���ģʽ;1,����ģʽ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  	  
void LCD_ShowString(u16 x,u16 y,u8 *p)
{         
  //while((*p<='~')&&(*p>=' '))//�ж��ǲ��ǷǷ��ַ�!
  while(*p)
  {
    if((*p<='~')&&(*p>=' '))
    {
      if(x>(lcddev.width-1)||y>(lcddev.height-1)) 
        return;     
      if((*p<='~')&&(*p>=' '))
      {
        LCD_ShowChar(x,y,POINT_COLOR,BACK_COLOR,*p);
        x+=6;
      }
    }
    p++;
  }
}

//******************************************************************
//��������  mypow
//���ܣ�    ��m��n�η�(gui�ڲ�����)
//���������m:����
//	        n:��
//����ֵ��  m��n�η�
//�޸ļ�¼����
//******************************************************************  
u16 mypow(u8 m,u8 n)
{
  u16 result=1;	 
  while(n--)result*=m;    
  return result;
}

//******************************************************************
//��������  LCD_ShowNum
//���ܣ�    ��ʾ�������ֱ���ֵ
//���������x,y :�������	 
//			len :ָ����ʾ���ֵ�λ��
//			color:��ɫ
//			num:��ֵ(0~4294967295)
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  			 
void LCD_ShowNum(u16 x,u16 y,u32 num,u8 len)
{         	
  u8 t,temp;
  u8 enshow=0;						   
  for(t=0;t<len;t++)
  {
    temp=(num/mypow(10,len-t-1))%10;
    if(enshow==0&&t<(len-1))
    {
      if(temp==0)
      {
        LCD_ShowChar(x+(6)*t,y,POINT_COLOR,BACK_COLOR,' ');
        continue;
      }else enshow=1; 
    }
    LCD_ShowChar(x+(6)*t,y,POINT_COLOR,BACK_COLOR,temp+'0'); 
  }
}

//******************************************************************
//��������  LCD_Drawbmp16
//���ܣ�    ��ʾһ��16λBMPͼ��
//���������x,y :�������
// 			*p :ͼ��������ʼ��ַ
//����ֵ��  ��
//�޸ļ�¼����
//******************************************************************  
void LCD_Drawbmp16(u16 x,u16 y,const unsigned char *p) //��ʾ40*40 QQͼƬ
{
  int i; 
  unsigned char picH,picL; 
  LCD_SetWindows(x,y,x+40-1,y+40-1);//��������
  for(i=0;i<40*40;i++)
  {	
    picL=*(p+i*2);	//���ݵ�λ��ǰ
    picH=*(p+i*2+1);				
    LCD_WR_DATA_16Bit(picH<<8|picL);  						
  }	
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//�ָ���ʾ����Ϊȫ��	
  
}






