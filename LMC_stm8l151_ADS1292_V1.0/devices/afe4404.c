#include "afe4404.h"

void AFE4404_Init(void)
{
  GPIO_Init( RESETZ_PORT, RESETZ_PIN, GPIO_Mode_Out_PP_High_Fast);
//  GPIO_Init( ADC_RDY_PORT, ADC_RDY_PIN, GPIO_Mode_In_FL_IT);
//  EXTI_SetPinSensitivity(ADC_RDY_EXIT,EXTI_Trigger_Falling_Low);
  
  GPIO_SetBits(RESETZ_PORT,RESETZ_PIN);
}

u32 AFE4404_ReadData(u8 Address)
{
  u32 temp0=0, temp1=0, temp2=0;
  u32 res;
  
  sIIC_Start();
  sIIC_WriteByte(AFE4404_ADDRESS & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  
  sIIC_Start();
  sIIC_WriteByte(AFE4404_ADDRESS | 0x01);   //进入接收模式
  sIIC_WaitAck();
  temp0 = sIIC_ReadByte(1);
  sIIC_WaitAck();
  temp1 = sIIC_ReadByte(1);
  sIIC_WaitAck();
  temp2 = sIIC_ReadByte(0);
  sIIC_Stop();//产生一个停止条件
  
  res = temp0<<16 | temp1<<8 | temp2;
  return res;
}



void AFE4404_WirteData(u8 Address, u32 Data)
{
  sIIC_Start();
  sIIC_WriteByte(AFE4404_ADDRESS & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  sIIC_WriteByte((Data>>16) & 0xFF);
  sIIC_WaitAck();
  sIIC_WriteByte((Data>>8) & 0xFF);
  sIIC_WaitAck();
  sIIC_WriteByte((Data) & 0xFF);
  sIIC_WaitAck();
  sIIC_Stop();//产生一个停止条件
}

u32 AFE4404_Read_LED2STC(void)
{
  return AFE4404_ReadData(0x01);
}

void AFE4404_Wirte_LED2STC(u32 data)
{
  AFE4404_WirteData(0x01, data);
}


