#include "exit.h"

void EXIT_Button_Init(void)
{
  GPIO_Init( EXIT_BTN_PORT, EXIT_BTN_PIN, GPIO_Mode_In_FL_IT);
  EXTI_SetPinSensitivity(EXIT_BTN_EXIT,EXTI_Trigger_Falling_Low);
}

INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
{
  disableInterrupts();
  delay_ms(100);
  EXTI_ClearITPendingBit(EXTI_IT_Pin1); //清除中断标志位
  enableInterrupts();
}

