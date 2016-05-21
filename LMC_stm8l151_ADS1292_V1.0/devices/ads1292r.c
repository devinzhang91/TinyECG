#include "ads1292r.h"

extern u8 TxBuffer[DATA_TO_TRANSFER];
extern u8 RxBuffer[DATA_TO_RECEIVE];
u8 data_buff[9]={0};
//u16 DATA_CH1 = 0;
//u16 DATA_CH2 = 0;
u16 test_data = 0;

void ADS1292R_Init(void)
{
  SPI_Master_Conf();	//SPI端口设置
  
  GPIO_Init(ADS1292R_CS_PORT, ADS1292R_CS_PIN, GPIO_Mode_Out_PP_High_Slow);	        //片选IO
  GPIO_Init(ADS1292R_PWDN_PORT, ADS1292R_PWDN_PIN , GPIO_Mode_Out_PP_High_Slow);	//低功耗IO
  GPIO_Init(ADS1292R_START_PORT, ADS1292R_START_PIN, GPIO_Mode_Out_PP_High_Slow);	//启动IO
  GPIO_Init(ADS1292R_ADC_RDY_PORT, ADS1292R_ADC_RDY_PIN, GPIO_Mode_In_PU_IT);	        //ADC_RDY 中断设置
  EXTI_SetPinSensitivity(ADS1292R_ADC_RDY_EXIT, EXTI_Trigger_Rising);
  
  ADS1292R_PowerOnInit();	//初始化ADS1292R
}

/**ADS1292R上电复位 **/
void ADS1292R_PowerOnInit(void)
{
  ADS1292R_START_H;
  ADS1292R_CS_H;
  ADS1292R_PWDN_L;//进入掉电模式
  delay_ms(1000);
  ADS1292R_PWDN_H;//退出掉电模式
  delay_ms(1000);//等待稳定
  ADS1292R_PWDN_L;//发出复位脉冲 
  delay_10us(1);
  ADS1292R_PWDN_H;
  delay_ms(1000);//等待稳定，可以开始使用ADS1292R
  ADS1292R_START_L;
  ADS1292R_CS_L;
  SPI_WriteByte(SDATAC);//发送停止连续读取数据命令
  ADS1292R_REG(WREG|CONFIG2,    0XE0);	//使用内部参考电压
  delay_ms(10);//等待内部参考电压稳定
//  ADS1292R_REG(WREG|CONFIG1,    0X02);	//设置转换速率为500SPS
  ADS1292R_REG(WREG|CONFIG1,    0X00);	//设置转换速率为125SPS
  ADS1292R_REG(WREG|LOFF,       0XF0);
  ADS1292R_REG(WREG|CH1SET,     0X60);
  ADS1292R_REG(WREG|CH2SET,     0x60);
  ADS1292R_REG(WREG|RLD_SENS,   0x2C);
  ADS1292R_REG(WREG|LOFF_SENS,  0x0C);
  ADS1292R_REG(WREG|LOFF_STAT,  0X00);
  ADS1292R_REG(WREG|RESP1,      0xDE);
  ADS1292R_REG(WREG|RESP2,      0x07);
  ADS1292R_REG(WREG|GPIO,       0x0C);
  
  test_data = ADS1292R_REG(RREG|ID,     0Xff);
  
//  TxBuffer[0]=ADS1292R_REG(RREG|ID,0X00);
//  TxBuffer[1]=ADS1292R_REG(RREG|CONFIG1,0X00);
//  TxBuffer[2]=ADS1292R_REG(RREG|CH1SET,0X00);
//  TxBuffer[3]=ADS1292R_REG(RREG|CH2SET,0X00);
//  
//  DMA_USART_TX_Enable();
  
  SPI_WriteByte(RDATAC);//回到连续读取数据模式，检测噪声数据
  ADS1292R_START_H;//启动转换
}

/**对ADS1292R内部寄存器进行操作 **/
u8 ADS1292R_REG(u8 cmd, u8 data)	//只读一个数据
{
  SPI_WriteByte(cmd);	//读写指令
  SPI_WriteByte(0X00);	//需要写几个数据（n+1个）
  if((cmd&0x20)==0x20)	//判断是否为读寄存器指令
    return SPI_WriteByte(0X00);	//返回寄存器值
  else
    return SPI_WriteByte(data);	//写入数值
}

/*读取72位的数据1100+LOFF_STAT[4:0]+GPIO[1:0]+13个0+2CHx24位，共9字节*/	
void ADS1292R_ReadData(u8 *data)
{
  u8 i;
  for(i=0;i<9;i++)
  {
    *data=SPI_WriteByte(0X00);
    data++;		
  }
}

//******************************************************************
//功能：    ADS1292 ADC_RDY 信号中断处理
//******************************************************************
INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
{
  disableInterrupts();
  ADS1292R_ReadData(data_buff);
//  DATA_CH1 = (data_buff[3]<<8) | data_buff[4];  //转存数据
//  DATA_CH2 = (data_buff[6]<<8) | data_buff[7];
  EXTI_ClearITPendingBit(EXTI_IT_Pin4); //清除中断标志位
  enableInterrupts();
}

