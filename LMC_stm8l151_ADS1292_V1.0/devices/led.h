#ifndef __LED_H
#define __LED_H

#include "main.h"

#define LED_BLUE_PORT		GPIOB
#define LED_BLUE_PIN		GPIO_Pin_1

#define LED_BLUE_ON		GPIO_SetBits(LED_BLUE_PORT,LED_BLUE_PIN)
#define LED_BLUE_OFF		GPIO_ResetBits(LED_BLUE_PORT,LED_BLUE_PIN)
#define LED_BLUE_REVERSE	GPIO_ToggleBits(LED_BLUE_PORT, LED_BLUE_PIN)


void LED_Init(void);


#endif
