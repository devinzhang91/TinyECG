#include "led.h"

void LED_Init(void)
{
  GPIO_Init( LED_BLUE_PORT, LED_BLUE_PIN, GPIO_Mode_Out_PP_High_Fast);
  
  LED_BLUE_OFF;
}


