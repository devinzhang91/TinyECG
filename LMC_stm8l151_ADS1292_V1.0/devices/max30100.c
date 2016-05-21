#include "max30100.h"

void MAX30100_Init(void)
{
  IIC_SOFT_Init();
}

void MAX30100_Write_Byte(u8 Address, u8 Data)
{
  sIIC_Start();  
  sIIC_WriteByte(MAX30100_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  sIIC_WriteByte(Data);
  sIIC_WaitAck();
  sIIC_Stop();//产生一个停止条件
}

u8 MAX30100_Read_Byte(u8 Address)
{
  u8 data;
  
  sIIC_Start();
  sIIC_WriteByte(MAX30100_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  
  sIIC_Start();  	 	   
  sIIC_WriteByte(MAX30100_DEVICE_ADDRESS_BASE_VALUE | 0x01);   //进入接收模式
  sIIC_WaitAck();
  data = sIIC_ReadByte(0);
  sIIC_Stop();//产生一个停止条件	  
  
  return data;
}