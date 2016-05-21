#ifndef __IIC_H__
#define __IIC_H__

#include "main.h"

#define IIC_GPIO_PORT	GPIOC
#define IIC_SDA_PIN     GPIO_Pin_0
#define IIC_SCL_PIN     GPIO_Pin_1

#define sSCL_H()        (GPIO_SetBits(IIC_GPIO_PORT, IIC_SCL_PIN))
#define sSCL_L()        (GPIO_ResetBits(IIC_GPIO_PORT, IIC_SCL_PIN))

#define sSDA_H()        (GPIO_SetBits(IIC_GPIO_PORT, IIC_SDA_PIN))
#define sSDA_L()        (GPIO_ResetBits(IIC_GPIO_PORT, IIC_SDA_PIN))

#define sSDA_out()      (GPIO_Init(IIC_GPIO_PORT, IIC_SDA_PIN,GPIO_Mode_Out_PP_High_Slow))
#define sSDA_in()       (GPIO_Init(IIC_GPIO_PORT, IIC_SDA_PIN,GPIO_Mode_In_PU_No_IT))
#define sRead_SDA()     (GPIO_ReadInputDataBit(IIC_GPIO_PORT, IIC_SDA_PIN))

#define true  1
#define false 0

void IIC_SOFT_Init(void);
u8 sIIC_ReadByte(u8 ack);
void sIIC_WriteByte(u8 byte);

u8 sIIC_WaitAck(void);
void sIIC_Stop(void);
void sIIC_Start(void);
void sI2C_Ack(void);
void sI2C_NoAck(void);

#endif


