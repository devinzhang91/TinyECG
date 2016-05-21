#ifndef __AFE4404_H
#define __AFE4404_H

#include "main.h" 

#define AFE4404_ADDRESS 0x58

#define ADC_RDY_PORT		GPIOD
#define ADC_RDY_PIN		GPIO_Pin_4
#define ADC_RDY_EXIT		EXTI_Pin_4
#define RESETZ_PORT		GPIOD
#define RESETZ_PIN		GPIO_Pin_5

void AFE4404_Init(void);
u32 AFE4404_ReadData(u8 Address);
void AFE4404_WirteData(u8 Address, u32 Data);

u32 AFE4404_Read_LED2STC(void);
void AFE4404_Wirte_LED2STC(u32 data);

#endif