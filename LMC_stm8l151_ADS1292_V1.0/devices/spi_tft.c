/* 此 spi_tft.c 稍作修改
* 使用模拟SPI控制TFT
* CS引脚默认在硬件选中
*/

#include "spi_tft.h"
#include "spi_tft_FONT.h"

u8 RxBuf[64];
u8 cnt=0;

//管理LCD重要参数
//默认为竖屏
_lcd_dev lcddev;

//画笔颜色,背景颜色
u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
u16 DeviceCode;

//******************************************************************
//函数名：  LCD_GPIO_Init
//功能：    LCD管脚初始化
//输入参数：无
//返回值：  无
//******************************************************************
void LCD_GPIO_Init(void)
{
  GPIO_Init(LCD_GPIO_PORT, LCD_RS_PIN , GPIO_Mode_Out_PP_High_Slow);
  GPIO_Init(LCD_GPIO_PORT, LCD_CLK_PIN | LCD_SDI_PIN, GPIO_Mode_Out_PP_High_Slow);	//模拟spi IO
}

//******************************************************************
//函数名：  LCD_WriteByte
//功能：    LCD数据写入  (模拟SPI)
//输入参数：byte：写入的字节
//返回值：  无
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
//函数名：  LCD_WR_REG
//功能：    向液晶屏总线写入写16位指令
//输入参数：Reg:待写入的指令值
//返回值：  无
//******************************************************************
void LCD_WR_REG(u16 data)
{ 
  //  LCD_CS_CLR;
  LCD_RS_CLR;
  LCD_WriteByte(data);
  //  LCD_CS_SET;
}
//******************************************************************
//函数名：  LCD_WR_DATA
//功能：    向液晶屏总线写入写8位数据
//输入参数：Data:待写入的数据
//返回值：  无
//******************************************************************
void LCD_WR_DATA(u8 data)
{
  //  LCD_CS_CLR;
  LCD_RS_SET;
  LCD_WriteByte(data);
  //  LCD_CS_SET;
}
//******************************************************************
//函数名：  LCD_DrawPoint_16Bit
//功能：    8位总线下如何写入一个16位数据
//输入参数：(x,y):光标坐标
//返回值：  无
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
//函数名：  LCD_WriteReg
//功能：    写寄存器数据
//输入参数：LCD_Reg:寄存器地址
//			LCD_RegValue:要写入的数据
//返回值：  无
//******************************************************************
void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue)
{	
  LCD_WR_REG(LCD_Reg);  
  LCD_WR_DATA(LCD_RegValue);	    		 
}
//******************************************************************
//函数名：  LCD_WriteRAM_Prepare
//功能：    开始写GRAM
//			在给液晶屏传送RGB数据前，应该发送写GRAM指令
//输入参数：无
//返回值：  无
//******************************************************************
void LCD_WriteRAM_Prepare(void)
{
  LCD_WR_REG(lcddev.wramcmd);
}
//******************************************************************
//函数名：  LCD_DrawPoint
//功能：    在指定位置写入一个像素点数据
//输入参数：(x,y):光标坐标
//返回值：  无
//******************************************************************
void LCD_DrawPoint(u16 x,u16 y)
{
  LCD_SetCursor(x,y);//设置光标位置 
  LCD_WR_DATA_16Bit(POINT_COLOR);
}
////******************************************************************
////函数名：  LCD_Reset
////功能：    LCD复位函数，液晶初始化前要调用此函数
////输入参数：无
////返回值：  无
////******************************************************************
//void LCD_RESET(void)
//{
//  LCD_RST_CLR;
//  delay_ms(10);	
//  LCD_RST_SET;
//  delay_ms(5);
//}

//******************************************************************
//函数名：  LCD_Init
//功能：    LCD初始化
//输入参数：无
//返回值：  无
//******************************************************************
void LCD_Init(void)
{
  //  SPI_Master_Conf();	//硬件SPI禁用
  //  LCD_RESET(); 	//液晶屏复位，这里使用NRST复位
  LCD_GPIO_Init();
  
  //************* Start Initial Sequence **********//		
  //开始初始化液晶屏
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
  
  LCD_SetParam();//设置LCD参数
  LCD_Clear(BLACK);
}
//******************************************************************
//函数名：  LCD_Clear
//功能：    LCD全屏填充清屏函数
//输入参数：Color:要清屏的填充色
//返回值：  无
//******************************************************************
void LCD_Clear(u16 Color)
{
  u16 i,j;      
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);	  
  for(i=0;i<lcddev.width;i++)
  {
    for(j=0;j<lcddev.height;j++)
      LCD_WR_DATA_16Bit(Color);	//写入数据 	 
  }
}   		  
//*************************************************
//函数名：LCD_SetWindows
//功能：设置lcd显示窗口，在此区域写点数据自动换行
//入口参数：xy起点和终点
//返回值：无
//*************************************************
void LCD_SetWindows(u16 xStar, u16 yStar,u16 xEnd,u16 yEnd)
{
#if USE_HORIZONTAL==1	//使用横屏
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
  
  LCD_WriteRAM_Prepare();	//开始写入GRAM				
}   

//*************************************************
//函数名：LCD_SetCursor
//功能：设置光标位置
//入口参数：xy坐标
//返回值：无
//*************************************************/
void LCD_SetCursor(u16 Xpos, u16 Ypos)
{	  	    			
  LCD_SetWindows(Xpos,Ypos,Xpos,Ypos);
} 

//*************************************************
//函数名：LCD_SetParam
//功能：设置LCD参数
//入口参数：无
//返回值：无
//*************************************************/
void LCD_SetParam(void)
{
  lcddev.wramcmd=0x2C;
#if USE_HORIZONTAL==1	//使用横屏	  
  lcddev.dir=1;//横屏
  lcddev.width=128;
  lcddev.height=128;
  lcddev.setxcmd=0x2A;
  lcddev.setycmd=0x2B;			
  LCD_WriteReg(0x36,0xA8);
  
#else//竖屏
  lcddev.dir=0;//竖屏				 	 		
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
//函数名：  GUI_DrawPoint
//功能：    GUI描绘一个点
//输入参数：x:光标位置x坐标
//        	y:光标位置y坐标
//			color:要填充的颜色
//返回值：  无
//修改记录：无
//******************************************************************
void GUI_DrawPoint(u16 x,u16 y,u16 color)
{
  LCD_SetCursor(x,y);//设置光标位置 
  LCD_WR_DATA_16Bit(color); 
}

//******************************************************************
//函数名：  LCD_Fill
//功能：    在指定区域内填充颜色
//输入参数：sx:指定区域开始点x坐标
//        	sy:指定区域开始点y坐标
//			ex:指定区域结束点x坐标
//			ey:指定区域结束点y坐标
//        	color:要填充的颜色
//返回值：  无
//修改记录：无
//******************************************************************
void LCD_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 color)
{  	
  
  u16 i,j;			
  u16 width=ex-sx+1; 		//得到填充的宽度
  u16 height=ey-sy+1;		//高度
  LCD_SetWindows(sx,sy,ex-1,ey-1);//设置显示窗口
  for(i=0;i<height;i++)
  {
    for(j=0;j<width;j++)
      LCD_WR_DATA_16Bit(color);	//写入数据 	 
  }
  
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复窗口设置为全屏
}

//******************************************************************
//函数名：  LCD_DrawLine
//功能：    GUI画线
//输入参数：x1,y1:起点坐标
//        	x2,y2:终点坐标 
//返回值：  无
//修改记录：无
//****************************************************************** 
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2)
{
  u16 t; 
  int xerr=0,yerr=0,delta_x,delta_y,distance; 
  int incx,incy,uRow,uCol; 
  
  delta_x=x2-x1; //计算坐标增量 
  delta_y=y2-y1; 
  uRow=x1; 
  uCol=y1; 
  if(delta_x>0)incx=1; //设置单步方向 
  else if(delta_x==0)incx=0;//垂直线 
  else {incx=-1;delta_x=-delta_x;} 
  if(delta_y>0)incy=1; 
  else if(delta_y==0)incy=0;//水平线 
  else{incy=-1;delta_y=-delta_y;} 
  if( delta_x>delta_y)distance=delta_x; //选取基本增量坐标轴 
  else distance=delta_y; 
  for(t=0;t<=distance+1;t++ )//画线输出 
  {  
    LCD_DrawPoint(uRow,uCol);//画点 
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
//函数名：  LCD_DrawRectangle
//功能：    GUI画矩形(非填充)
//输入参数：(x1,y1),(x2,y2):矩形的对角坐标
//返回值：  无
//修改记录：无
//******************************************************************  
void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
{
  LCD_DrawLine(x1,y1,x2,y1);
  LCD_DrawLine(x1,y1,x1,y2);
  LCD_DrawLine(x1,y2,x2,y2);
  LCD_DrawLine(x2,y1,x2,y2);
}  

//******************************************************************
//函数名：  LCD_DrawFillRectangle
//功能：    GUI画矩形(填充)
//输入参数：(x1,y1),(x2,y2):矩形的对角坐标
//返回值：  无
//修改记录：无
//******************************************************************   
void LCD_DrawFillRectangle(u16 x1, u16 y1, u16 x2, u16 y2)
{
  LCD_Fill(x1,y1,x2,y2,POINT_COLOR);
}

//******************************************************************
//函数名：  _draw_circle_8
//功能：    8对称性画圆算法(内部调用)
//输入参数：(xc,yc) :圆中心坐标
// 			(x,y):光标相对于圆心的坐标
//         	c:填充的颜色
//返回值：  无
//修改记录：无
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
//函数名：  LCD_Circle
//功能：    在指定位置画一个指定大小的圆(填充)
//输入参数：(xc,yc) :圆中心坐标
//         	c:填充的颜色
//		 	r:圆半径
//		 	fill:填充判断标志，1-填充，0-不填充
//返回值：  无
//修改记录：无
//******************************************************************  
void LCD_Circle(int xc, int yc,u16 c,int r, int fill)
{
  int x = 0, y = r, yi, d;
  d = 3 - 2 * r;
  if (fill) 
  {
    // 如果填充（画实心圆）
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
    // 如果不填充（画空心圆）
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
//函数名：  LCD_ShowChar
//功能：    显示单个英文字符
//输入参数：(x,y):字符显示位置起始坐标
//        	fc:前置画笔颜色
//			bc:背景颜色
//			num:数值（0-94）
//			mode:模式  0,填充模式;1,叠加模式
//返回值：  无
//修改记录：无
//******************************************************************  
void LCD_ShowChar(u16 x,u16 y,u16 fc, u16 bc, u8 num)
{  
  u8 temp;
  u8 pos,t;
  u16 colortemp=POINT_COLOR;      
  
  num=num-' ';//得到偏移后的值
  LCD_SetWindows(x,y,x+5,y+11);//设置单个文字显示窗口	
  for(pos=0;pos<12;pos++)
  {
    temp=asc2_1206[num][pos];//调用1206字体
    for(t=0;t<6;t++)
    {   
      POINT_COLOR=fc;              
      if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//画一个点    
      temp>>=1; 
    }
  }
  POINT_COLOR=colortemp;	
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复窗口为全屏    	   	 	  
} 

//******************************************************************
//函数名：  LCD_ShowOneChar
//功能：    显示单个英文字符
//输入参数：(x,y):字符显示位置起始坐标
//			ch:ascii数值（0-94）
//返回值：  无
//修改记录：无
//******************************************************************  
void LCD_ShowOneChar(u16 x,u16 y, u8 ch)
{  
  u8 temp;
  u8 pos,t; 
  
  ch=ch-' ';//得到偏移后的值
  LCD_SetWindows(x,y,x+5,y+11);//设置单个文字显示窗口
  for(pos=0;pos<12;pos++)
  {
    temp=asc2_1206[ch][pos];//调用1206字体
    for(t=0;t<6;t++)
    {
      if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//画一个点    
      temp>>=1; 
    }
  }
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复窗口为全屏    	   	 	  
} 

//******************************************************************
//函数名：  LCD_ShowString
//功能：    显示英文字符串
//输入参数：x,y :起点坐标	 
//			*p:字符串起始地址
//			mode:模式	0,填充模式;1,叠加模式
//返回值：  无
//修改记录：无
//******************************************************************  	  
void LCD_ShowString(u16 x,u16 y,u8 *p)
{         
  //while((*p<='~')&&(*p>=' '))//判断是不是非法字符!
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
//函数名：  mypow
//功能：    求m的n次方(gui内部调用)
//输入参数：m:乘数
//	        n:幂
//返回值：  m的n次方
//修改记录：无
//******************************************************************  
u16 mypow(u8 m,u8 n)
{
  u16 result=1;	 
  while(n--)result*=m;    
  return result;
}

//******************************************************************
//函数名：  LCD_ShowNum
//功能：    显示单个数字变量值
//输入参数：x,y :起点坐标	 
//			len :指定显示数字的位数
//			color:颜色
//			num:数值(0~4294967295)
//返回值：  无
//修改记录：无
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
//函数名：  LCD_Drawbmp16
//功能：    显示一副16位BMP图像
//输入参数：x,y :起点坐标
// 			*p :图像数组起始地址
//返回值：  无
//修改记录：无
//******************************************************************  
void LCD_Drawbmp16(u16 x,u16 y,const unsigned char *p) //显示40*40 QQ图片
{
  int i; 
  unsigned char picH,picL; 
  LCD_SetWindows(x,y,x+40-1,y+40-1);//窗口设置
  for(i=0;i<40*40;i++)
  {	
    picL=*(p+i*2);	//数据低位在前
    picH=*(p+i*2+1);				
    LCD_WR_DATA_16Bit(picH<<8|picL);  						
  }	
  LCD_SetWindows(0,0,lcddev.width-1,lcddev.height-1);//恢复显示窗口为全屏	
  
}






