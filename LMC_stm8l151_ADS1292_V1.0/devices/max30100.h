#ifndef __MLX90615_H
#define __MLX90615_H

#include "main.h"

#define MAX30100_DEVICE_ADDRESS_BASE_VALUE 0xAE      //定义器件在IIC总线中的从地址

#define INT_SAT		0x00
#define INT_EN		0x01
#define FIFO_WP		0x02
#define OVF_CNT		0x03
#define FIFO_RP		0x04
#define DATA_REG	0x05
#define MODE_SET	0x06
#define SPO2_SET	0x07
#define LED_SET		0x09
#define TEMP_INT	0x16
#define TEMP_FRA	0x17
#define VER_ID		0xFE
#define PAT_ID		0xFF

void MAX30100_Init(void);
void MAX30100_Write_Byte(u8 Address, u16 Data);
u16 MAX30100_Read_Byte(u8 Address);

#endif
