#include "clk.h"

void CLK_Config(void)  
{
  CLK_SYSCLKSourceSwitchCmd(ENABLE);
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);                 //16HMZ/1=16
  while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI);
  CLK_HSICmd(ENABLE);
}

void Switch_LSI_Config(void)  
{
  CLK_SYSCLKSourceSwitchCmd(ENABLE);                    //使能时钟切换
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);         //选择内部低速时钟作为时钟源
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);                 //设置系统时钟分频
  while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
  CLK_HSICmd(DISABLE);                                  //关闭原先的 CLK source
}

void Switch_HSI_Config(void)  
{
  CLK_SYSCLKSourceSwitchCmd(ENABLE);                    //使能时钟切换
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);         //选择内部低速时钟作为时钟源
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);                 //设置系统时钟分频
  while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI);//等待时钟稳定
  CLK_LSICmd(DISABLE);                                  //关闭原先的 CLK source
}

