#include "main.h"

extern u8 RxBuffer[DATA_TO_RECEIVE];

int main()
{
  CLK_Config();
  LED_Init();
  UART_Init(115200);
  ADS1292R_Init();
  MLX90615_Init();
  TIM2_Config(625);     //128*625 /16M = 5ms
  
  enableInterrupts();
  
  while(1)
  {
    delay_ms(500);
    MLX90615_Read_Temp();
    LED_BLUE_REVERSE;
  }
}
