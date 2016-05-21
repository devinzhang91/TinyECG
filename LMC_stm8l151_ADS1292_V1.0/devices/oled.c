#include "oled.h"
#include "oled_codetab.h"
/*------------------------------------------------------------------------------
| 函数名称: OLED_GPIO_Init()
| 输入参数: void
| 输出参数: void
| 功    能: 初始化IO
------------------------------------------------------------------------------*/
void OLED_GPIO_Init(void)
{
  GPIO_Init(LCD_GPIO_PORT, LCD_RS_PIN , GPIO_Mode_Out_PP_High_Slow);
  GPIO_Init(LCD_GPIO_PORT, LCD_CLK_PIN | LCD_SDI_PIN, GPIO_Mode_Out_PP_High_Slow);	//模拟spi IO
  GPIO_Init(LCD_RST_PORT, LCD_RST_PIN , GPIO_Mode_Out_PP_High_Slow);
  
  LCD_CLK_CLR;
  LCD_SDI_CLR;
  LCD_RS_CLR;
  LCD_RST_CLR;
  LCD_CLK_SET;
  LCD_SDI_SET;
  LCD_RS_SET;
  LCD_RST_SET;
}

/*------------------------------------------------------------------------------
| 函数名称: OLED_Init()
| 输入参数: void
| 输出参数: void
| 功    能: 初始化
------------------------------------------------------------------------------*/
void OLED_Init(void)
{
  OLED_GPIO_Init();
  LCD_RST_CLR;
  delay_ms(30); 
  LCD_RST_SET;
  OLED_WriteCmd(0xae);//--turn off oled panel
  OLED_WriteCmd(0x00);//---set low column address
  OLED_WriteCmd(0x10);//---set high column address
  OLED_WriteCmd(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
  OLED_WriteCmd(0x81);//--set contrast control register
  OLED_WriteCmd(0xcf); // Set SEG Output Current Brightness
  OLED_WriteCmd(0xa1);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
  OLED_WriteCmd(0xc8);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
  OLED_WriteCmd(0xa6);//--set normal display
  OLED_WriteCmd(0xa8);//--set multiplex ratio(1 to 64)
  OLED_WriteCmd(0x3f);//--1/64 duty
  OLED_WriteCmd(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
  OLED_WriteCmd(0x00);//-not offset
  OLED_WriteCmd(0xd5);//--set display clock divide ratio/oscillator frequency
  OLED_WriteCmd(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
  OLED_WriteCmd(0xd9);//--set pre-charge period
  OLED_WriteCmd(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
  OLED_WriteCmd(0xda);//--set com pins hardware configuration
  OLED_WriteCmd(0x12);
  OLED_WriteCmd(0xdb);//--set vcomh
  OLED_WriteCmd(0x40);//Set VCOM Deselect Level
  OLED_WriteCmd(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
  OLED_WriteCmd(0x02);//
  OLED_WriteCmd(0x8d);//--set Charge Pump enable/disable
  OLED_WriteCmd(0x14);//--set(0x10) disable
  OLED_WriteCmd(0xa4);// Disable Entire Display On (0xa4/0xa5)
  OLED_WriteCmd(0xa6);// Disable Inverse Display On (0xa6/a7) 
  OLED_WriteCmd(0xaf);//--turn on oled panel
  
  OLED_Fill(0x00);  //初始清屏
  OLED_SetPos(0,0);  
}
/*------------------------------------------------------------------------------
| 函数名：  LCD_WriteByte
| 功能：    LCD数据写入  (模拟SPI)
| 输入参数：byte：写入的字节
| 返回值：  无
------------------------------------------------------------------------------*/
void OLED_WriteByte(u8 byte)
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
/*------------------------------------------------------------------------------
| 函数名称: OLED_WriteData()
| 输入参数: u8 sendData
| 输出参数: void
| 功    能: 发送1Byte数据
------------------------------------------------------------------------------*/
void OLED_WriteData(u8 sendData)
{
  LCD_RS_SET;  
  OLED_WriteByte(sendData);
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_WriteCmd()
| 输入参数: u8 sendData
| 输出参数: void
| 功    能: 发送1Byte指令
------------------------------------------------------------------------------*/
void OLED_WriteCmd(u8 sendData)
{
  LCD_RS_CLR;  
  OLED_WriteByte(sendData);  
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_SetPos()
| 输入参数: u8 IndexX , u8 IndexY
| 输出参数: void
| 功    能: 设置坐标
------------------------------------------------------------------------------*/
void OLED_SetPos(u8 IndexX , u8 IndexY)
{
  OLED_WriteCmd(0xB0 + IndexY);
  OLED_WriteCmd(((IndexX&0xF0)>> 4)|0x10);
  OLED_WriteCmd((IndexX&0x0F) | 0x00);   
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_Fill()
| 输入参数: u8 fillData
| 输出参数: void
| 功    能: 全屏填充
------------------------------------------------------------------------------*/
void OLED_Fill(u8 fillData)
{
  u8 IndexX,IndexY;
  for(IndexY = 0 ; IndexY < 8; IndexY++)
  {
    OLED_SetPos(0x00 , IndexY);
    for(IndexX = 0 ; IndexX < OLED_X_WIDTH ; IndexX++)
      OLED_WriteData(fillData);
  }  
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_ClearScreen()
| 输入参数: void
| 输出参数: void
| 功    能: 清屏
------------------------------------------------------------------------------*/
void OLED_ClearScreen(void)
{
  OLED_Fill(0x00);
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_PrintfChar6x8()
| 输入参数: u8 IndexX , u8 IndexY , u8 pData
| 输出参数: void
| 功    能: 显示6x8标准ASCII字符， X坐标0-122，Y坐标0-7，pData显示字符
------------------------------------------------------------------------------*/
void OLED_PrintfChar6x8(u8 IndexX, u8 IndexY, u8 pData)
{
  u8 i;
  if(IndexX > 122)
  {
    IndexX = 0;
    IndexY++;
  }
  OLED_SetPos(IndexX, IndexY);
  for(i = 0; i < 6; i++)
  {     
    OLED_WriteData(CODETAB_ASCII_6x8[ (pData-32) ][i]);  
  }
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_PrintfString()
| 输入参数: u8 IndexX , u8 IndexY , u8 *p
| 输出参数: void
| 功    能: 显示6x8标准ASCII字符， X坐标0-122，Y坐标0-7，*p显示字符串
------------------------------------------------------------------------------*/
void OLED_PrintfString(u16 x,u16 y,u8 *p)
{         
  //while((*p<='~')&&(*p>=' '))//判断是不是非法字符!
  while(*p)
  {
    if((*p<='~')&&(*p>=' '))
    {
      if(x>122||y>7) 
        return;     
      if((*p<='~')&&(*p>=' '))
      {
        OLED_PrintfChar6x8(x, y, *p);
        x+=6;
      }
    }
    p++;
  }
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_NumPow()
| 输入参数: u8 base , u8 logarithm 
| 输出参数: void
| 功    能: 求指定对数的幂次方
------------------------------------------------------------------------------*/
u32 OLED_NumPow(u8 base, u8 logarithm)
{
  u32 temp_Num=1;
  while(logarithm--){
    temp_Num*=base;
  }
  return temp_Num;
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_PrintfNum()
| 输入参数: u8 IndexX , u8 IndexY , u32 Num ,  u8 len 
| 输出参数: void
| 功    能: IndexX 起始坐标点X,  IndexY 起始坐标点Y,  Num 要显示的数字,
|           len 要显示的位数
------------------------------------------------------------------------------*/
void OLED_PrintfNum(u8 IndexX, u8 IndexY, u32 Num, u8 Len)
{
  u8 temp_len;
  u8 temp_data;
  u8 temp_HighBlack=0;
  
  for(temp_len = 0;temp_len < Len ; temp_len++){
    
    temp_data=(Num/OLED_NumPow(10,Len-temp_len-1))%10;
    
    if(temp_HighBlack==0&&temp_len<(Len-1)){
      if(temp_data==0){
        OLED_PrintfChar6x8(IndexX+temp_len*6,IndexY,' ');                
        continue;
      }else 
        temp_HighBlack=1;
    }
    OLED_PrintfChar6x8(IndexX+temp_len*6,IndexY,temp_data+'0'); 
  }
  
}
/*------------------------------------------------------------------------------
| 函数名称: OLED_DrawPoint()
| 输入参数: u8 IndexX , u8 IndexY , u8 Mode
| 输出参数: void
| 功    能: IndexX -->X点坐标，IndexY -->Y点坐标
------------------------------------------------------------------------------*/
void OLED_DrawPoint(u8 IndexX, u8 IndexY)
{
  u8 pos,bx,bais=0;
  if(IndexX>127||IndexY>63) return;//超出范围了
  pos=7-IndexY/8;
  bx=IndexY%8;
  bais=1<<(7-bx);
  OLED_SetPos(IndexX, pos);
  OLED_WriteData(bais);
}

