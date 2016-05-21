///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\devices\ads1292r.c   /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\devices\ads1292r.c   /
//                    -e -On --no_cse --no_unroll --no_inline                 /
//                    --no_code_motion --no_tbaa --no_cross_call --debug      /
//                    --code_model small --data_model medium -o               /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\Obj\       /
//                    --dlib_config D:\IAR\stm8\LIB\dlstm8smn.h -D            /
//                    STM8L15X_MDP -lB D:\workspace\STM8\stm8l151_ADS1292\iar /
//                    \Debug\List\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\ /
//                    ..\main\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\f /
//                    wlib\inc\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\ /
//                    devices\ -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\h /
//                    ardware\ --vregs 16                                     /
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\ads12 /
//                    92r.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ads1292r

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN ?push_w4
        EXTERN ?w4
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_SetPinSensitivity
        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN SPI_Master_Conf
        EXTERN SPI_WriteByte
        EXTERN delay_10us
        EXTERN delay_ms

        PUBLIC ADS1292R_Init
        PUBLIC ADS1292R_PowerOnInit
        PUBLIC ADS1292R_REG
        PUBLIC ADS1292R_ReadData
        PUBLIC EXTI4_IRQHandler
        PUBLIC _interrupt_14
        PUBLIC data_buff
        PUBLIC test_data

// D:\workspace\STM8\stm8l151_ADS1292\devices\ads1292r.c
//    1 #include "ads1292r.h"
//    2 
//    3 extern u8 TxBuffer[DATA_TO_TRANSFER];
//    4 extern u8 RxBuffer[DATA_TO_RECEIVE];

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    5 u8 data_buff[9]={0};
data_buff:
        DS8 9
//    6 //u16 DATA_CH1 = 0;
//    7 //u16 DATA_CH2 = 0;

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    8 u16 test_data = 0;
test_data:
        DS8 2
//    9 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   10 void ADS1292R_Init(void)
//   11 {
//   12   SPI_Master_Conf();	//SPI端口设置
ADS1292R_Init:
        CALL      L:SPI_Master_Conf
//   13   
//   14   GPIO_Init(ADS1292R_CS_PORT, ADS1292R_CS_PIN, GPIO_Mode_Out_PP_High_Slow);	        //片选IO
        MOV       S:?b0, #0xd0
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   15   GPIO_Init(ADS1292R_PWDN_PORT, ADS1292R_PWDN_PIN , GPIO_Mode_Out_PP_High_Slow);	//低功耗IO
        MOV       S:?b0, #0xd0
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   16   GPIO_Init(ADS1292R_START_PORT, ADS1292R_START_PIN, GPIO_Mode_Out_PP_High_Slow);	//启动IO
        MOV       S:?b0, #0xd0
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   17   GPIO_Init(ADS1292R_ADC_RDY_PORT, ADS1292R_ADC_RDY_PIN, GPIO_Mode_In_PU_IT);	        //ADC_RDY 中断设置
        MOV       S:?b0, #0x60
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   18   EXTI_SetPinSensitivity(ADS1292R_ADC_RDY_EXIT, EXTI_Trigger_Rising);
        MOV       S:?b0, #0x1
        LD        A, #0x10
        CALL      L:EXTI_SetPinSensitivity
//   19   
//   20   ADS1292R_PowerOnInit();	//初始化ADS1292R
        CALL      L:ADS1292R_PowerOnInit
//   21 }
        RET
//   22 
//   23 /**ADS1292R上电复位 **/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   24 void ADS1292R_PowerOnInit(void)
//   25 {
//   26   ADS1292R_START_H;
ADS1292R_PowerOnInit:
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   27   ADS1292R_CS_H;
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   28   ADS1292R_PWDN_L;//进入掉电模式
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   29   delay_ms(1000);
        LDW       X, #0x3e8
        CALL      L:delay_ms
//   30   ADS1292R_PWDN_H;//退出掉电模式
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   31   delay_ms(1000);//等待稳定
        LDW       X, #0x3e8
        CALL      L:delay_ms
//   32   ADS1292R_PWDN_L;//发出复位脉冲 
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   33   delay_10us(1);
        CLRW      X
        INCW      X
        CALL      L:delay_10us
//   34   ADS1292R_PWDN_H;
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   35   delay_ms(1000);//等待稳定，可以开始使用ADS1292R
        LDW       X, #0x3e8
        CALL      L:delay_ms
//   36   ADS1292R_START_L;
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   37   ADS1292R_CS_L;
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   38   SPI_WriteByte(SDATAC);//发送停止连续读取数据命令
        LD        A, #0x11
        CALL      L:SPI_WriteByte
//   39   ADS1292R_REG(WREG|CONFIG2,    0XE0);	//使用内部参考电压
        MOV       S:?b0, #0xe0
        LD        A, #0x42
        CALL      L:ADS1292R_REG
//   40   delay_ms(10);//等待内部参考电压稳定
        LDW       X, #0xa
        CALL      L:delay_ms
//   41 //  ADS1292R_REG(WREG|CONFIG1,    0X02);	//设置转换速率为500SPS
//   42   ADS1292R_REG(WREG|CONFIG1,    0X00);	//设置转换速率为125SPS
        CLR       S:?b0
        LD        A, #0x41
        CALL      L:ADS1292R_REG
//   43   ADS1292R_REG(WREG|LOFF,       0XF0);
        MOV       S:?b0, #0xf0
        LD        A, #0x43
        CALL      L:ADS1292R_REG
//   44   ADS1292R_REG(WREG|CH1SET,     0X60);
        MOV       S:?b0, #0x60
        LD        A, #0x44
        CALL      L:ADS1292R_REG
//   45   ADS1292R_REG(WREG|CH2SET,     0x60);
        MOV       S:?b0, #0x60
        LD        A, #0x45
        CALL      L:ADS1292R_REG
//   46   ADS1292R_REG(WREG|RLD_SENS,   0x2C);
        MOV       S:?b0, #0x2c
        LD        A, #0x46
        CALL      L:ADS1292R_REG
//   47   ADS1292R_REG(WREG|LOFF_SENS,  0x0C);
        MOV       S:?b0, #0xc
        LD        A, #0x47
        CALL      L:ADS1292R_REG
//   48   ADS1292R_REG(WREG|LOFF_STAT,  0X00);
        CLR       S:?b0
        LD        A, #0x48
        CALL      L:ADS1292R_REG
//   49   ADS1292R_REG(WREG|RESP1,      0xDE);
        MOV       S:?b0, #0xde
        LD        A, #0x49
        CALL      L:ADS1292R_REG
//   50   ADS1292R_REG(WREG|RESP2,      0x07);
        MOV       S:?b0, #0x7
        LD        A, #0x4a
        CALL      L:ADS1292R_REG
//   51   ADS1292R_REG(WREG|GPIO,       0x0C);
        MOV       S:?b0, #0xc
        LD        A, #0x4b
        CALL      L:ADS1292R_REG
//   52   
//   53   test_data = ADS1292R_REG(RREG|ID,     0Xff);
        MOV       S:?b0, #0xff
        LD        A, #0x20
        CALL      L:ADS1292R_REG
        CLRW      X
        LD        XL, A
        LDW       L:test_data, X
//   54   
//   55 //  TxBuffer[0]=ADS1292R_REG(RREG|ID,0X00);
//   56 //  TxBuffer[1]=ADS1292R_REG(RREG|CONFIG1,0X00);
//   57 //  TxBuffer[2]=ADS1292R_REG(RREG|CH1SET,0X00);
//   58 //  TxBuffer[3]=ADS1292R_REG(RREG|CH2SET,0X00);
//   59 //  
//   60 //  DMA_USART_TX_Enable();
//   61   
//   62   SPI_WriteByte(RDATAC);//回到连续读取数据模式，检测噪声数据
        LD        A, #0x10
        CALL      L:SPI_WriteByte
//   63   ADS1292R_START_H;//启动转换
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   64 }
        RET
//   65 
//   66 /**对ADS1292R内部寄存器进行操作 **/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 u8 ADS1292R_REG(u8 cmd, u8 data)	//只读一个数据
//   68 {
ADS1292R_REG:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//   69   SPI_WriteByte(cmd);	//读写指令
        LD        A, S:?b8
        CALL      L:SPI_WriteByte
//   70   SPI_WriteByte(0X00);	//需要写几个数据（n+1个）
        CLR       A
        CALL      L:SPI_WriteByte
//   71   if((cmd&0x20)==0x20)	//判断是否为读寄存器指令
        LD        A, S:?b8
        AND       A, #0x20
        CP        A, #0x0
        JREQ      L:??ADS1292R_REG_0
//   72     return SPI_WriteByte(0X00);	//返回寄存器值
        CLR       A
        CALL      L:SPI_WriteByte
        JRA       L:??ADS1292R_REG_1
//   73   else
//   74     return SPI_WriteByte(data);	//写入数值
??ADS1292R_REG_0:
        LD        A, S:?b9
        CALL      L:SPI_WriteByte
??ADS1292R_REG_1:
        JP        L:?epilogue_w4
//   75 }
//   76 
//   77 /*读取72位的数据1100+LOFF_STAT[4:0]+GPIO[1:0]+13个0+2CHx24位，共9字节*/	

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void ADS1292R_ReadData(u8 *data)
//   79 {
ADS1292R_ReadData:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
//   80   u8 i;
//   81   for(i=0;i<9;i++)
        CLR       A
        LD        S:?b10, A
??ADS1292R_ReadData_0:
        LD        A, S:?b10
        CP        A, #0x9
        JRNC      L:??ADS1292R_ReadData_1
//   82   {
//   83     *data=SPI_WriteByte(0X00);
        CLR       A
        CALL      L:SPI_WriteByte
        LD        [S:?w4.w], A
//   84     data++;		
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
//   85   }
        LD        A, S:?b10
        ADD       A, #0x1
        LD        S:?b10, A
        JRA       L:??ADS1292R_ReadData_0
//   86 }
??ADS1292R_ReadData_1:
        POP       S:?b10
        JP        L:?epilogue_w4
//   87 
//   88 //******************************************************************
//   89 //功能：    ADS1292 ADC_RDY 信号中断处理
//   90 //******************************************************************

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   91 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
//   92 {
EXTI4_IRQHandler:
_interrupt_14:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//   93   disableInterrupts();
        sim
//   94   ADS1292R_ReadData(data_buff);
        LDW       X, #data_buff
        CALL      L:ADS1292R_ReadData
//   95 //  DATA_CH1 = (data_buff[3]<<8) | data_buff[4];  //转存数据
//   96 //  DATA_CH2 = (data_buff[6]<<8) | data_buff[7];
//   97   EXTI_ClearITPendingBit(EXTI_IT_Pin4); //清除中断标志位
        LDW       X, #0x10
        CALL      L:EXTI_ClearITPendingBit
//   98   enableInterrupts();
        rim
//   99 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  100 
// 
//  11 bytes in section .near.bss
// 400 bytes in section .near_func.text
// 
// 400 bytes of CODE memory
//  11 bytes of DATA memory
//
//Errors: none
//Warnings: none
