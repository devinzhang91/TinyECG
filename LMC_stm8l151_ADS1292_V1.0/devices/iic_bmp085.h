#ifndef __IIC_BMP085_H
#define __IIC_BMP085_H

#include "main.h"

//BMP180У������(calibration param)
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
	unsigned char  ExistFlag ;  //���ڱ�־

	BMP180_cal_param  cal_param;//����ϵ��

	unsigned char Version ;		//�汾

	long UnsetTemperature ;		//δУ�����¶�ֵ
	long UnsetGasPress	  ;		//δУ������ѹֵ

	long Temperature ;			/*У������¶�ֵ*/
	long GasPress ;			/*У�������ѹֵ*/

	float Altitude ;				/*����*/
	
}BMP180_info ;

#define BMP180_NOT_EXISTENCE 0	/*������*/
#define BMP180_EXISTENCE     1	/*����*/

#define BMP180_DEVICE_ADDRESS_BASE_VALUE 0xEE      //����������IIC�����еĴӵ�ַ
#define BMP180_ID_REGISTER_ADDRESS		0xd0 /*ID��żĴ���(0x55�̶�)*/
#define BMP180_VERSION_REGISTER_ADDRESS	0XD1 /*�汾���*/
#define BMP180_ID_FIXED_VALUE		0x55 /*id�̶����(0x55)*/

#define OSS 0	// Oversampling Setting (note: code is not set up to use other OSS values)

void IIC_BMP085_Init(void);
void IIC_BMP085_Write_Byte(u8 Address, u8 Data);
uint16_t IIC_BMP085_Read_Byte(u8 Address);
uint16_t IIC_BMP085_Read_Multiple(u8 ST_Address);

long BMP085_Read_Temp(void);
long BMP085_Read_Pressure(void);
void BMP085_Display(void);

#endif

