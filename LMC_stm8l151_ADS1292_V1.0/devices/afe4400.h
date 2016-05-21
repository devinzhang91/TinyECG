#ifndef __AFE4400_H
#define __AFE4400_H

#include "main.h"

#define AFE_CS_PORT                     GPIOA
#define AFE_CS_PIN                      GPIO_Pin_5
#define AFE_CTRL_PORT                   GPIOB
#define AFE_ADC_RDY_PIN                 GPIO_Pin_0
#define AFE_PDN_PIN                     GPIO_Pin_1
#define EXIT_ADC_RDY_EXIT	        EXTI_Pin_0

#define AFE_CS_H			GPIO_SetBits(AFE_CS_PORT, AFE_CS_PIN)
#define AFE_CS_L			GPIO_ResetBits(AFE_CS_PORT, AFE_CS_PIN)
#define AFE_PDN_H			GPIO_SetBits(AFE_CTRL_PORT, AFE_PDN_PIN)
#define AFE_PDN_L			GPIO_ResetBits(AFE_CTRL_PORT, AFE_PDN_PIN)

#define CONTROL0		0x00

#define LED2STC			0x01
#define LED2ENDC		0x02
#define LED2LEDSTC		0x03
#define LED2LEDENDC		0x04
#define ALED2STC		0x05
#define ALED2ENDC		0x06
#define LED1STC			0x07
#define LED1ENDC		0x08
#define LED1LEDSTC		0x09
#define LED1LEDENDC		0x0A
#define ALED1STC		0x0B
#define ALED1ENDC		0x0C
#define LED2CONVST		0x0D
#define LED2CONVEND		0x0E
#define ALED2CONVST		0x0F
#define ALED2CONVEND	        0x10
#define LED1CONVST		0x11
#define LED1CONVEND		0x12
#define ALED1CONVST		0x13
#define ALED1CONVEND	        0x14

#define ADCRSTSTCT0		0x15
#define ADCRSTENDCT0	        0x16
#define ADCRSTSTCT1		0x17
#define ADCRSTENDCT1	        0x18
#define ADCRSTSTCT2		0x19
#define ADCRSTENDCT2	        0x1A
#define ADCRSTSTCT3		0x1B
#define ADCRSTENDCT3	        0x1C

#define PRPCOUNT		0x1D

#define CONTROL1		0x1E
#define TIA_AMB_GAIN	        0x21
#define LEDCNTRL		0x22
#define CONTROL2		0x23
#define ALARM			0x29
#define DIAG			0x30

#define LED2VAL			0x2A
#define ALED2VAL		0x2B
#define LED1VAL			0x2C
#define ALED1VAL		0x2D
#define LED2_ALED2VAL	        0x2E
#define LED1_ALED1VAL	        0x2F

#define LED1	                0x81
#define LED2	                0x82
#define ALED1	                0x83
#define ALED2	                0x84


void AFE4400_Init(void);
void AFE4400_Set_READABLE(u8 isReadable);
u32 AFE4400_Read_Register(u8 reg_address);
void AFE4400_Set_Register(u8 reg_address, u32 data);
void AFE4404_Set_Value(void);
u8 Get_AFE_Data(u8 type);
void Send_AFE_Data32(void);

#endif