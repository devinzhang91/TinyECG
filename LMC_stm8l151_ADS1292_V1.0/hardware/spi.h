#ifndef __SPI_H
#define __SPI_H

#include "main.h"

#define USE_HARDWARE_SPI  	0	//定义是否使用硬件SPI		0,不使用.1,使用.

#define SPI                         SPI1
#define SPI_CLK                     CLK_Peripheral_SPI1
#define SPI_GPIO_PORT               GPIOB
#define SPI_SCK_PIN                 GPIO_Pin_5
#define SPI_MOSI_PIN                GPIO_Pin_6
#define SPI_MISO_PIN                GPIO_Pin_7

#define SCLK_H          (GPIO_SetBits(SPI_GPIO_PORT, SPI_SCK_PIN))
#define SCLK_L          (GPIO_ResetBits(SPI_GPIO_PORT, SPI_SCK_PIN))
#define MOSI_H          (GPIO_SetBits(SPI_GPIO_PORT, SPI_MOSI_PIN))
#define MOSI_L          (GPIO_ResetBits(SPI_GPIO_PORT, SPI_MOSI_PIN))
#define MISO_G          (GPIO_ReadInputDataBit(SPI_GPIO_PORT, SPI_MISO_PIN))

void SPI_Master_Conf(void);
u8 SPI_ReadByte(void);
u8 SPI_WriteByte(u8 byte);

#endif 
