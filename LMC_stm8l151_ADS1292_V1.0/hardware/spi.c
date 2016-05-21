#include "spi.h"

//******************************************************************
//函数名：  SPI_Master_Conf
//功能：    硬件SPI主设备初始化
//输入参数：无
//返回值：  无
//******************************************************************
void SPI_Master_Conf(void)
{
#if USE_HARDWARE_SPI
  CLK_PeripheralClockConfig(SPI_CLK, ENABLE);           //设置硬件SPI接口
  GPIO_ExternalPullUpConfig(SPI_GPIO_PORT, SPI_SCK_PIN | SPI_MISO_PIN | SPI_MOSI_PIN, ENABLE);
  SPI_Init(SPI, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,
           SPI_CPOL_High, SPI_CPHA_2Edge, SPI_Direction_2Lines_FullDuplex,
           SPI_NSS_Soft, 0x07);
  SPI_Cmd(SPI, ENABLE);
#else
  GPIO_Init(SPI_GPIO_PORT, SPI_SCK_PIN | SPI_MOSI_PIN, GPIO_Mode_Out_PP_High_Slow);	//模拟spi IO
  GPIO_Init(SPI_GPIO_PORT, SPI_MISO_PIN, GPIO_Mode_In_PU_No_IT);	//模拟spi IO

#endif
}

#if USE_HARDWARE_SPI
//******************************************************************
//函数名：  SPI_ReadByte
//功能：    硬件SPI读一个字节数据
//输入参数：byte:数据
//返回值：  无
//******************************************************************
u8 SPI_ReadByte(void)
{
  return (SPI_WriteByte(0xFF));
}
//******************************************************************
//函数名：  SPI_WriteByte
//功能：    硬件SPI读写一个字节数据
//输入参数：byte:数据
//返回值：  无
//******************************************************************
u8 SPI_WriteByte(u8 byte)
{
  while (SPI_GetFlagStatus(SPI, SPI_FLAG_TXE) == RESET);
  SPI_SendData(SPI, byte);
  while (SPI_GetFlagStatus(SPI, SPI_FLAG_RXNE) == RESET);
  return SPI_ReceiveData(SPI);           
}

#else
//******************************************************************
//函数名：  SPI_ReadByte
//功能：    软件SPI读一个字节数据
//输入参数：byte:数据
//返回值：  无
//******************************************************************
u8 SPI_ReadByte(void)
{
  return (SPI_WriteByte(0xFF));
}
//******************************************************************
//函数名：  SPI_WriteByte
//功能：    软件SPI读写一个字节数据
//输入参数：byte:数据
//返回值：  无
//******************************************************************
u8 SPI_WriteByte(u8 byte)  
{       
  u8 i = 0;  
  u8 rec_data = 0;   
  for(i=0;i<8;i++)
  {
    if(byte & 0x80)  
      MOSI_H;  
    else  
      MOSI_L;  
    byte <<= 1;
    SCLK_H;
    rec_data<<=1;  
    if(MISO_G)
      rec_data++;
    SCLK_L;
  }  
  return rec_data;
}
#endif

