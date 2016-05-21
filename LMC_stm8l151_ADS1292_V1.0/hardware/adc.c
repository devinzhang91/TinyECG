#include "adc.h"

void ADC_Config(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
	
	ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_2);
	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
	ADC_Cmd(ADC1, ENABLE);
	
	ADC_ChannelCmd(ADC1, ADC_Channel_24, ENABLE); //设置ADC通道
	
	SYSCFG_REMAPDMAChannelConfig(REMAP_DMA1Channel_ADC1ToChannel0);
	
	DMA_Init(DMA1_Channel0, 
		BUFFER_ADDRESS,
		ADC1_DR_ADDRESS,
		BUFFER_SIZE,
		DMA_DIR_PeripheralToMemory,
		DMA_Mode_Circular,
		DMA_MemoryIncMode_Inc,
		DMA_Priority_High,
		DMA_MemoryDataSize_HalfWord);
	
	DMA_Cmd(DMA1_Channel0, ENABLE);
	DMA_ITConfig(DMA1_Channel0, DMA_ITx_TC, ENABLE);
	DMA_GlobalCmd(ENABLE);
}        

void ADC_Start(void)
{
	//ADC_VrefintCmd(ENABLE);	//启用内部参考电压
	ADC_DMACmd(ADC1, ENABLE);
	ADC_SoftwareStartConv(ADC1);	
}


