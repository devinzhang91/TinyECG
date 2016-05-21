#ifndef __UART_H__
#define __UART_H__

#include "main.h"

#define USART_DMA_CHANNEL_RX   DMA1_Channel2
#define USART_DMA_CHANNEL_TX   DMA1_Channel1
#define USART_DMA_FLAG_TCRX    (uint16_t)DMA1_FLAG_TC2
#define USART_DMA_FLAG_TCTX    (uint16_t)DMA1_FLAG_TC1
#define USART_DR_ADDRESS       (uint16_t)0x5231  /* USART1 Data register Address */

#define DATA_TO_TRANSFER       20       //发送的字节长度
#define DATA_TO_RECEIVE        20       //接收的字节长度


void UART_Init(u32 baudrate);
void DMA_USART_Config(void);

void DMA_USART_TX_Enable(void);
void DMA_USART_RX_Enable(void);

#endif