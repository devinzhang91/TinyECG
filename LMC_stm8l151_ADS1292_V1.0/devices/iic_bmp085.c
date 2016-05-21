#include "iic_bmp085.h"

BMP180_info mInfo ;
extern u8 DataMessage[];

void IIC_BMP085_Init(void)
{
  //IIC_SOFT_Init();
  if(IIC_BMP085_Read_Byte(BMP180_ID_REGISTER_ADDRESS)== BMP180_ID_FIXED_VALUE)
  {//存在
    mInfo.ExistFlag = BMP180_EXISTENCE ;
    mInfo.cal_param.AC1= IIC_BMP085_Read_Multiple(0xAA);
    mInfo.cal_param.AC2= IIC_BMP085_Read_Multiple(0xAC);
    mInfo.cal_param.AC3= IIC_BMP085_Read_Multiple(0xAE);
    mInfo.cal_param.AC4= IIC_BMP085_Read_Multiple(0xB0);
    mInfo.cal_param.AC5= IIC_BMP085_Read_Multiple(0xB2);
    mInfo.cal_param.AC6= IIC_BMP085_Read_Multiple(0xB4);
    mInfo.cal_param.B1=  IIC_BMP085_Read_Multiple(0xB6);
    mInfo.cal_param.B2=  IIC_BMP085_Read_Multiple(0xB8);
    mInfo.cal_param.MB=  IIC_BMP085_Read_Multiple(0xBA);
    mInfo.cal_param.MC=  IIC_BMP085_Read_Multiple(0xBC);
    mInfo.cal_param.MD=  IIC_BMP085_Read_Multiple(0xBE);
    mInfo.Version = IIC_BMP085_Read_Byte(BMP180_VERSION_REGISTER_ADDRESS);
  }
  else
  {//不存在
    mInfo.ExistFlag = BMP180_NOT_EXISTENCE ;
  }
}

void IIC_BMP085_Write_Byte(u8 Address, u8 Data)
{
  sIIC_Start();  
  sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  sIIC_WriteByte(Data);
  sIIC_WaitAck();
  sIIC_Stop();//产生一个停止条件
}

uint16_t IIC_BMP085_Read_Byte(u8 Address)
{
  short read_data = 0;
  
  sIIC_Start();
  sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  
  sIIC_Start();  	 	   
  sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE | 0x01);   //进入接收模式
  sIIC_WaitAck();
  read_data = sIIC_ReadByte(0);
  sIIC_Stop();//产生一个停止条件	  
  
  return read_data;
}

uint16_t IIC_BMP085_Read_Multiple(u8 ST_Address)
{
  uint8_t msb, lsb;
  uint16_t data;
  
  sIIC_Start();  
  sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(ST_Address);//发送寄存器地址
  sIIC_WaitAck();
  
  sIIC_Start();  	 	   
  sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE | 0x01);   //进入接收模式			   
  sIIC_WaitAck();	 
  msb = sIIC_ReadByte(1);
  sIIC_WaitAck();
  lsb = sIIC_ReadByte(0);
  sIIC_Stop();//产生一个停止条件	   
  
  data = msb << 8 | lsb;
  return data;
}


long BMP085_Read_Temp(void)
{
  long temp;
  IIC_BMP085_Write_Byte(0xF4, 0x2E);
  delay_ms(10);			// max time is 4.5ms
  temp = IIC_BMP085_Read_Multiple(0xF6);
  return temp;
}

long BMP085_Read_Pressure(void)
{
  long pressure = 0;
  IIC_BMP085_Write_Byte(0xF4, 0x34+(OSS<<6));
  delay_ms(10);    	              // max time is 4.5ms
  pressure = IIC_BMP085_Read_Multiple(0xF6);
  //pressure = ((pressure <<8) + IIC_BMP085_Read_Byte(0xf8)) >>(8-OSS) ;
  pressure &= 0x0000FFFF;
  return pressure;
}

void BMP085_Display(void)
{
  long x1, x2, B5, B6, x3, B3, p;
  unsigned long b4, b7;
  
  //未校正的温度值
  mInfo.UnsetTemperature = BMP085_Read_Temp();
  //未校正的气压值
  mInfo.UnsetGasPress = BMP085_Read_Pressure();
  
  //温度校正
  x1 = ((mInfo.UnsetTemperature) - mInfo.cal_param.AC6) * (mInfo.cal_param.AC5) >> 15;
  x2 = ((long)(mInfo.cal_param.MC) << 11) / (x1 + mInfo.cal_param.MD);
  B5 = x1 + x2;
  mInfo.Temperature= (B5 + 8) >> 4;
  
  //气压校正
  B6 = B5- 4000;
  x1 = ((long)(mInfo.cal_param.B2) * (B6 * B6 >> 12)) >> 11;
  x2 = ((long)mInfo.cal_param.AC2) * B6 >> 11;
  x3 = x1 + x2;
  B3 = ((((long)(mInfo.cal_param.AC1) * 4 + x3)<<OSS) + 2)/4;
  x1 = ((long)mInfo.cal_param.AC3) * B6 >> 13;
  x2 = ((long)(mInfo.cal_param.B1) * (B6 * B6 >> 12)) >> 16;
  x3 = ((x1 + x2) + 2) >> 2;
  b4 = ((long)(mInfo.cal_param.AC4) * (unsigned long) (x3 + 32768)) >> 15;
  b7 = ((unsigned long)(mInfo.UnsetGasPress) - B3) * (50000 >> OSS);
  if( b7 < 0x80000000)
  {
    p = (b7 * 2) / b4 ;
  }
  else
  {
    p = (b7 / b4) * 2;
  }
  x1 = (p >> 8) * (p >> 8);
  x1 = ((long)x1 * 3038) >> 16;
  x2 = (-7357 * p) >> 16;
  mInfo.GasPress= p + ((x1 + x2 + 3791) >> 4);
  
  LCD_Fill(50,65,128,80,BLACK);
  POINT_COLOR=YELLOW;
  //  LCD_ShowNum(85,65, (mInfo.Temperature)/10, 3);
  LCD_ShowNum(50,65, (mInfo.GasPress)/100, 3);
  //  LCD_ShowOneChar(103,65,'.');
  LCD_ShowOneChar(68,65,'.');
  //  LCD_ShowNum(109,65, (mInfo.Temperature)%10, 1);
  LCD_ShowNum(74,65, (mInfo.GasPress)%100, 2);
  
}


