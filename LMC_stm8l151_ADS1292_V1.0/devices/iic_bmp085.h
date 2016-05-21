#ifndef __IIC_BMP085_H
#define __IIC_BMP085_H

#include "main.h"

//BMP180校正参数(calibration param)
typedef struct {
	short int AC1 ;
	short int AC2 ;
	short int AC3 ;
	unsigned short int AC4 ;
	unsigned short int AC5 ;
	unsigned short int AC6 ;
	short int B1 ;
	short int B2 ;
	short int MB ;
	short int MC ;
	short int MD ;
}BMP180_cal_param;

typedef struct {
	unsigned char  ExistFlag ;  //存在标志

	BMP180_cal_param  cal_param;//修正系数

	unsigned char Version ;		//版本

	long UnsetTemperature ;		//未校正的温度值
	long UnsetGasPress	  ;		//未校正的气压值

	long Temperature ;			/*校正后的温度值*/
	long GasPress ;			/*校正后的气压值*/

	float Altitude ;				/*海拔*/
	
}BMP180_info ;

#define BMP180_NOT_EXISTENCE 0	/*不存在*/
#define BMP180_EXISTENCE     1	/*存在*/

#define BMP180_DEVICE_ADDRESS_BASE_VALUE 0xEE      //定义器件在IIC总线中的从地址
#define BMP180_ID_REGISTER_ADDRESS		0xd0 /*ID编号寄存器(0x55固定)*/
#define BMP180_VERSION_REGISTER_ADDRESS	0XD1 /*版本编号*/
#define BMP180_ID_FIXED_VALUE		0x55 /*id固定编号(0x55)*/

#define OSS 0	// Oversampling Setting (note: code is not set up to use other OSS values)

void IIC_BMP085_Init(void);
void IIC_BMP085_Write_Byte(u8 Address, u8 Data);
uint16_t IIC_BMP085_Read_Byte(u8 Address);
uint16_t IIC_BMP085_Read_Multiple(u8 ST_Address);

long BMP085_Read_Temp(void);
long BMP085_Read_Pressure(void);
void BMP085_Display(void);

#endif

