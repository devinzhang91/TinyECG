#include "lowpower.h"

void LowPower_Init(void)
{
  LowPower_CLK_Config();
  CLK_HaltConfig(CLK_Halt_FastWakeup,ENABLE);//快速唤醒
  LowPower_GPIO_Config(); 
  PWR_UltraLowPowerCmd(ENABLE);   
}

void LowPower_CLK_Config(void)
{
  CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能时钟切换
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//选择内部低速时钟作为时钟源
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//设置系统时钟分频
  while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
  CLK_HSICmd(DISABLE);                          //关闭原先的 CLK source
  CLK_HSEConfig(CLK_HSE_OFF);                   //关闭外部 CLK source
}

void LowPower_GPIO_Config(void)
{ 
  GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
}