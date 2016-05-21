#include "delay.h"

/**
  * @brief  delay for some time in ms unit
  * @caller auto_test
  * @param  n_ms is how many ms of time to delay
  * @retval None
  */
void delay_ms(u16 n_ms)
{
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
/* Init TIMER 4 prescaler: / (2^6) = /64 */
  TIM4->PSCR = 6;
/* HSI div by 1 --> Auto-Reload value: 16M / 64 = 1/4M, 1/4M / 1k = 250*/
  TIM4->ARR = 250;
/* Counter value: 2, to compensate the initialization of TIMER*/
  TIM4->CNTR = 2;
  
  TIM4->SR1 &= ~TIM4_SR1_UIF;
  TIM4->CR1 |= TIM4_CR1_CEN;
  while(n_ms--)
  {
    while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
    TIM4->SR1 &= ~TIM4_SR1_UIF;
  }
  TIM4->CR1 &= ~TIM4_CR1_CEN;
}

/**
  * @brief  delay for some time in 10us unit(partial accurate)
  * @caller auto_test
  * @param n_10us is how many 10us of time to delay
  * @retval None
  */
void delay_10us(u16 n_10us)
{
/* Init TIMER 4 */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);

/* prescaler: / (2^0) = /1 */
  TIM4->PSCR = 0;

/* SYS_CLK_HSI_DIV1 Auto-Reload value: 16M / 1 = 16M, 16M / 100k = 160 */
  TIM4->ARR = 160;

/* Counter value: 10, to compensate the initialization of TIMER */
  TIM4->CNTR = 10;

/* clear update flag */
  TIM4->SR1 &= ~TIM4_SR1_UIF;

/* Enable Counter */
  TIM4->CR1 |= TIM4_CR1_CEN;

  while(n_10us--)
  {
    while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
    TIM4->SR1 &= ~TIM4_SR1_UIF;
  }

/* Disable Counter */
  TIM4->CR1 &= ~TIM4_CR1_CEN;
 CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);

}

/**
  * @brief  delay for some time in 1us unit(partial accurate)
  * @caller auto_test
  * @param n_us is how many 1us of time to delay
  * @retval None
  */
void delay_nus(u16 n_us)
{
/* Init TIMER 4 */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);

/* prescaler: / (2^0) = /1 */
  TIM4->PSCR = 0;

/* SYS_CLK_HSI_DIV1 Auto-Reload value: 16M / 1 = 16M, 16M / 1M = 16 */
  TIM4->ARR = 16;

/* Counter value: 10, to compensate the initialization of TIMER */
  TIM4->CNTR = 10;

/* clear update flag */
  TIM4->SR1 &= ~TIM4_SR1_UIF;

/* Enable Counter */
  TIM4->CR1 |= TIM4_CR1_CEN;

  while(n_us--)
  {
    while((TIM4->SR1 & TIM4_SR1_UIF) == 0) ;
    TIM4->SR1 &= ~TIM4_SR1_UIF;
  }

/* Disable Counter */
  TIM4->CR1 &= ~TIM4_CR1_CEN;
 CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);

}
