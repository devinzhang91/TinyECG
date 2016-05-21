#include "timer4.h"

void DrawMap(void);

//******************************************************************
//函数名：  TIM4_Config
//功能：    TIMER4初始化
//输入参数：period：定时器周期
//返回值：  无
//******************************************************************
void TIM4_Config(u8 period)
{
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  TIM4_TimeBaseInit(TIM4_Prescaler_128, period);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);
  enableInterrupts();
  TIM4_Cmd(ENABLE);
}

u8 timer_cnt = 31;

INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
{
//  if(timer_cnt==0)
//  {
//    //DrawMap();
//    timer_cnt = 31;
//  }
//  timer_cnt--;
//  DMA_USART_Enable();
  TIM4_ClearITPendingBit(TIM4_IT_Update);
}

u8 map_buff0[128];
u8 map_buff1[128];
u8 buff_cnt = 0;

void DrawMap(void)
{
//  GUI_DrawPoint(buff_cnt, 256-map_buff0[buff_cnt], BLACK);
//  GUI_DrawPoint(buff_cnt, 256-map_buff1[buff_cnt], BLACK);
//  GUI_DrawPoint(buff_cnt, 256-(map_buff0[buff_cnt]-map_buff1[buff_cnt]), RED);
  
  map_buff0[buff_cnt] = Get_AFE_Data(LED1);
  map_buff1[buff_cnt] = Get_AFE_Data(LED2);
  
//  GUI_DrawPoint(buff_cnt, 256-map_buff0[buff_cnt], RED);
//  GUI_DrawPoint(buff_cnt, 256-map_buff1[buff_cnt], BLUE);
//  GUI_DrawPoint(buff_cnt, 256-(map_buff0[buff_cnt]-map_buff1[buff_cnt]), RED);
  
  buff_cnt++;
  buff_cnt = buff_cnt % 128;
   
}
