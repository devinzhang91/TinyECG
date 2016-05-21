#include "uart.h"

u8 TxBuffer[DATA_TO_TRANSFER] = {0};
u8 RxBuffer[DATA_TO_RECEIVE] = {0};

void UART_Init(u32 baudrate)
{
  GPIO_Init(GPIOC, GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);
  GPIO_Init(GPIOC, GPIO_Pin_3,GPIO_Mode_Out_PP_Low_Fast);
  CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);	//一定要打开，上电默认是关闭，8S是默认打开
  USART_DeInit(USART1);
  USART_Init(USART1, baudrate, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_TypeDef)(USART_Mode_Rx | USART_Mode_Tx));
  //USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
  USART_Cmd(USART1, DISABLE);
  DMA_USART_Config();
  USART_Cmd(USART1, ENABLE);
}

void DMA_USART_Config(void)
{
  CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);       //开启DMA1时钟
  DMA_GlobalDeInit();   //复位DMA功能
  
  DMA_DeInit(USART_DMA_CHANNEL_RX);
  DMA_DeInit(USART_DMA_CHANNEL_TX);
  
  DMA_Init(USART_DMA_CHANNEL_RX, (uint16_t)RxBuffer, (uint16_t)USART_DR_ADDRESS,        //RX DMA配置
           DATA_TO_RECEIVE, DMA_DIR_PeripheralToMemory, DMA_Mode_Circular,
           DMA_MemoryIncMode_Inc, DMA_Priority_Low, DMA_MemoryDataSize_Byte);
  
  DMA_Init(USART_DMA_CHANNEL_TX, (uint16_t)TxBuffer, (uint16_t)USART_DR_ADDRESS,        //TX DMA配置
           DATA_TO_TRANSFER, DMA_DIR_MemoryToPeripheral, DMA_Mode_Normal,
           DMA_MemoryIncMode_Inc, DMA_Priority_High, DMA_MemoryDataSize_Byte);
  
  USART_DMACmd(USART1, USART_DMAReq_TX, ENABLE);        //USART DMA配置
  USART_DMACmd(USART1, USART_DMAReq_RX, ENABLE);
  DMA_GlobalCmd(ENABLE);
  
  //  DMA_Cmd(USART_DMA_CHANNEL_TX, ENABLE);      //开启传输
  DMA_Cmd(USART_DMA_CHANNEL_RX, ENABLE);        //开启接收
}

//开启一次DMA传输
void DMA_USART_TX_Enable(void)
{ 
  DMA_Cmd(USART_DMA_CHANNEL_TX, DISABLE);      //关闭USART1 TX DMA1 所指示的通道      
  DMA_SetCurrDataCounter(USART_DMA_CHANNEL_TX, DATA_TO_TRANSFER);//DMA通道的DMA缓存的大小
  DMA_Cmd(USART_DMA_CHANNEL_TX, ENABLE);      //开启传输 使能USART1 TX DMA1 所指示的通道 
}	  



