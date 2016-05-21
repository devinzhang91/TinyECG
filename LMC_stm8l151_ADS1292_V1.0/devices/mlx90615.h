#ifndef __MLX90615_H
#define __MLX90615_H

#include "main.h"

//#define MLX90615_DEVICE_ADDRESS_BASE_VALUE 0x5B      //定义器件在IIC总线中的从地址

/*寄存器读取命令*/
#define	RROM		0X10	//读取EEPROM 0001 rrrr 这里定义的只有高4位，低4位在发送命令时设置
#define	RRAM		0X20	//读取EEPROM 0010 rrrr 这里定义的只有高4位，低4位在发送命令时设置
#define SLEEP		0XC6	//休眠模式 1100 0110

#define SA              0x00
#define TA              0x06
#define TO              0x07

void MLX90615_Init(void);
void MLX90615_Write_Byte(u8 Address, u16 Data);
u16 MLX90615_Read_Byte(u8 Address);
u8 PEC_calculation(u8 pec[]);
u16 MLX90615_Read_Temp(void);

#endif