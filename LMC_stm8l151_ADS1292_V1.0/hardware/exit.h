#ifndef __EXIT_H
#define __EXIT_H

#include "main.h"

#define EXIT_BTN_PORT		GPIOC
#define EXIT_BTN_PIN		GPIO_Pin_1
#define EXIT_BTN_EXIT		EXTI_Pin_1
#define EXIT_BTN_IT		EXTI_IT_Pin1

void EXIT_Button_Init(void);

#endif


