#include "afe4400.h"

extern u8 TxBuffer[DATA_TO_TRANSFER];
extern u8 RxBuffer[DATA_TO_RECEIVE];
u32 LED1_val, LED2_val;

//******************************************************************
//函数名：  AFE4400_Init
//功能：    AFE4400初始化
//输入参数：无
//返回值：  无
//******************************************************************
void AFE4400_Init(void)
{
  disableInterrupts();
  SPI_Master_Conf();	//SPI端口设置
  
  GPIO_Init(AFE_CS_PORT, AFE_CS_PIN, GPIO_Mode_Out_PP_High_Slow);	//片选IO
  GPIO_Init(AFE_CTRL_PORT, AFE_PDN_PIN, GPIO_Mode_Out_PP_High_Slow);	//低功耗IO
  GPIO_Init(AFE_CTRL_PORT, AFE_ADC_RDY_PIN, GPIO_Mode_In_FL_IT);	//ADC_RDY 中断设置
  EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
  
  AFE_CS_H;	//选中AFE4400
  AFE_PDN_H;	//低功耗关闭
}

//******************************************************************
//功能：    AFE4400 ADC_RDY 信号中断处理
//******************************************************************
INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
{
  disableInterrupts();
  LED1_val = AFE4400_Read_Register(LED1_ALED1VAL);
  LED2_val = AFE4400_Read_Register(LED2_ALED2VAL);
//  LED1_val = AFE4400_Read_Register(LED1VAL);
//  LED2_val = AFE4400_Read_Register(LED2VAL);
  EXTI_ClearITPendingBit(EXTI_IT_Pin0); //清除中断标志位
  enableInterrupts();
}

/* 设置器件读写模式
* 0：写 1：读 
*/
void AFE4400_Set_READABLE(u8 isReadable)
{
  SPI_WriteByte(CONTROL0);  //写入寄存器地址
  SPI_WriteByte(0x00);
  SPI_WriteByte(0x00);
  SPI_WriteByte(isReadable);
}

u32 AFE4400_Read_Register(u8 reg_address)
{
  u32 temp0=0, temp1=0, temp2=0;
  u32 temp=0;
  
  AFE_CS_L;
  AFE4400_Set_READABLE(1);
  
  SPI_WriteByte(reg_address);  //写入寄存器地址
  temp0 = SPI_ReadByte();
  temp1 = SPI_ReadByte();
  temp2 = SPI_ReadByte();
  AFE_CS_H;
  
  temp = temp0<<16 | temp1<<8 | temp2;
  return temp;
}

void AFE4400_Set_Register(u8 reg_address, u32 data)
{
  AFE_CS_L;
  AFE4400_Set_READABLE(0);
  
  SPI_WriteByte(reg_address);  //写入寄存器地址
  SPI_WriteByte((data>>16)&0xFF);
  SPI_WriteByte((data>>8)&0xFF);
  SPI_WriteByte((data)&0xFF);
  AFE_CS_H;
}

void AFE4404_Set_Value(void)
{
  //AFE4400_Set_Register(CONTROL0,        0x04);
  AFE4400_Set_Register(LED2STC,         6050);
  AFE4400_Set_Register(LED2ENDC,        7998);
  AFE4400_Set_Register(LED2LEDSTC,      6000);
  AFE4400_Set_Register(LED2LEDENDC,     7999);
  AFE4400_Set_Register(ALED2STC,        50);
  AFE4400_Set_Register(ALED2ENDC,       1998);
  AFE4400_Set_Register(LED1STC,         2050);
  AFE4400_Set_Register(LED1ENDC,        3998);
  AFE4400_Set_Register(LED1LEDSTC,      2000);
  AFE4400_Set_Register(LED1LEDENDC,     3999);
  AFE4400_Set_Register(ALED1STC,        4050);
  AFE4400_Set_Register(ALED1ENDC,       5998);
  AFE4400_Set_Register(LED2CONVST,      4);
  AFE4400_Set_Register(LED2CONVEND,     1999);
  AFE4400_Set_Register(ALED2CONVST,     2004);
  AFE4400_Set_Register(ALED2CONVEND,    3999);
  AFE4400_Set_Register(LED1CONVST,      4004);
  AFE4400_Set_Register(LED1CONVEND,     5999);
  AFE4400_Set_Register(ALED1CONVST,     6004);
  AFE4400_Set_Register(ALED1CONVEND,    7999);
  
  AFE4400_Set_Register(ADCRSTSTCT0,     0);
  AFE4400_Set_Register(ADCRSTENDCT0,    3);
  AFE4400_Set_Register(ADCRSTSTCT1,     2000);
  AFE4400_Set_Register(ADCRSTENDCT1,    2003);
  AFE4400_Set_Register(ADCRSTSTCT2,     4000);
  AFE4400_Set_Register(ADCRSTENDCT2,    4003);
  AFE4400_Set_Register(ADCRSTSTCT3,     6000);
  AFE4400_Set_Register(ADCRSTENDCT3,    6003);
  
  AFE4400_Set_Register(PRPCOUNT,        7999);
  
  AFE4400_Set_Register(CONTROL1,        0x100);
  AFE4400_Set_Register(TIA_AMB_GAIN,    0x004411);
  AFE4400_Set_Register(LEDCNTRL,        0xEFEF);
  AFE4400_Set_Register(CONTROL2,        0x100);
}

u8 Get_AFE_Data(u8 type)
{
  u8 led_data = 0;
  switch(type)
  {
  case LED1 :
    led_data = 4096-((LED1_val^0x200000)>>10)&0xFFF;
    //led_data = ((LED1_val^0x200000)>>14)&0xFF;
    break;
  case LED2 :
    led_data = 4096-((LED2_val^0x200000)>>10)&0xFFF;
    //led_data = ((LED2_val^0x200000)>>14)&0xFF;
    break;
  }
  return led_data;
}

void RollerHandler()
{
  
}

void Send_AFE_Data32(void)
{
  //TxBuffer[];   //装载数据
}
