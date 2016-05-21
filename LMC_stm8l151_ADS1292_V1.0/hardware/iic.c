#include "iic.h"

void IIC_SOFT_Init(void)
{
  GPIO_Init(IIC_GPIO_PORT, IIC_SDA_PIN | IIC_SCL_PIN, GPIO_Mode_Out_PP_High_Slow);
  //   GPIO_Init(GPIOC,GPIO_Pin_0,GPIO_Mode_In_PU_No_IT);    
}

void sIIC_Start(void)
{
  sSDA_out();
  delay_nus(1);
  sSDA_H();
  sSCL_H();
  delay_nus(5);
  sSDA_L();
  delay_nus(5);
  sSCL_L();
  delay_nus(5);     
}

void sIIC_Stop(void)
{
  sSDA_out();
  sSCL_L();		//1
  delay_nus(5);	// 2
  sSDA_L();		// 3. 1,2,3�����в���ȱ��
  delay_nus(5);
  sSCL_H();
  delay_nus(5);
  sSDA_H();
  delay_nus(5);
  
}

u8 sIIC_WaitAck(void)
{ 	   
  u8 ucErrTime=0;
  
  sSDA_in();   //�ı䷽��///   
  sSDA_H();delay_nus(1);	   
  sSCL_H();delay_nus(1);	 
  while(sRead_SDA())
  {
    ucErrTime++;
    if(ucErrTime>250)
    {
      sIIC_Stop();
      return 1;
    }
  }
  sSCL_L();//ʱ�����0 
  return 0;             
}

void sI2C_Ack(void)
{
  sSDA_out();//�ı䷽��// 
  sSCL_L();
  delay_nus(5);
  sSDA_L();
  delay_nus(5);
  sSCL_H();
  delay_nus(5);
  sSCL_L();
  delay_nus(5);
}

void sI2C_NoAck(void)
{
  sSDA_out();//�ı䷽��// 
  sSCL_L();
  delay_nus(5);
  sSDA_H();
  delay_nus(5);
  sSCL_H();
  delay_nus(5);
  sSCL_L();
  delay_nus(5);
}

void sIIC_WriteByte(u8 byte)
{
  u8 i = 0;
  sSDA_out();
  for(i = 0; i < 8; i++)
  {
    sSCL_L();
    delay_nus(5);
    if(byte & 0x80)
    {
      sSDA_H();
    }
    else
    {
      sSDA_L();
    }
    delay_nus(5);
    sSCL_H();
    delay_nus(5);
    byte<<=1;
  }
  sSCL_L();
  delay_nus(5);
}

//��1���ֽڣ�ack=1ʱ������ACK��ack=0������nACK   
u8 sIIC_ReadByte(u8 ack)
{
  u8 i,ReadByte;
  sSDA_out();       
  sSDA_H();
  sSDA_in();//�ı䷽��//
  for(i = 0; i < 8; i++)
  {	
    ReadByte <<= 1;
    sSCL_L();
    delay_nus(5);
    sSCL_H();
    delay_nus(5);
    if(sRead_SDA())
    {
      ReadByte |= 0x01;
    }
    else
    {
      ReadByte &= ~(0x01);	
    }
    
  }
  if (!ack)
    sI2C_NoAck();//����nACK
  else
    sI2C_Ack(); //����ACK   
  sSDA_out();//�ı䷽��//
  return ReadByte;
}
