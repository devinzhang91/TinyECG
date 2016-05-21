#include "timer2.h"

//******************************************************************
//函数名：  TIM2_Config
//功能：    TIMER2初始化
//输入参数：period：定时器周期
//返回值：  无
//******************************************************************
void TIM2_Config(u16 period)
{
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  TIM2_TimeBaseInit(TIM2_Prescaler_128, TIM2_CounterMode_Down, period);
  TIM2_ClearFlag(TIM2_FLAG_Update);
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
//  enableInterrupts();
  TIM2_Cmd(ENABLE);
}

//extern u16 DATA_CH1;
//extern u16 DATA_CH2;
extern u8 data_buff[9];
extern u8 TxBuffer[DATA_TO_TRANSFER];
u16 temp_data = 0;
u8 timer2_looper = 0;
u8 temp_looper = 0;

INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
{
  if(temp_looper==200)
  {
    //disableInterrupts();        //添加温度
    temp_data = MLX90615_Read_Temp();
    //enableInterrupts();
    TxBuffer[16]=(temp_data>>8)&0xff;       //数据装载 温度
    TxBuffer[17]=(temp_data)&0xff;
    temp_looper = 0;
  }
  if(timer2_looper==4)
  {
    DMA_USART_TX_Enable();              //发送数据
    timer2_looper = 0;
  }
//  TxBuffer[timer2_looper*4+0]=data_buff[3]^0x80;       //数据装载 CH1
//  TxBuffer[timer2_looper*4+1]=data_buff[4];           
  TxBuffer[timer2_looper*4+2]=data_buff[6]^0x80;        //CH2
  TxBuffer[timer2_looper*4+3]=data_buff[7];
  
  TxBuffer[timer2_looper*4+0]=data_buff[4];       //数据装载 CH1
  TxBuffer[timer2_looper*4+1]=data_buff[5];
//  TxBuffer[timer2_looper*4+2]=data_buff[7];     //CH2
//  TxBuffer[timer2_looper*4+3]=data_buff[8];
  
  timer2_looper++;
  temp_looper++;
  TIM2_ClearITPendingBit(TIM2_IT_Update);
}
