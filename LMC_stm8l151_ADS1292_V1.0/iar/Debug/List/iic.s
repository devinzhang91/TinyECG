///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:13 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\hardware\iic.c       /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\hardware\iic.c -e    /
//                    -On --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o D:\workspace\STM8\stm8l151_ADS12 /
//                    92\iar\Debug\Obj\ --dlib_config                         /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\ -I   /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\..\main\ -I      /
//                    D:\workspace\STM8\stm8l151_ADS1292\iar\..\fwlib\inc\    /
//                    -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\devices\   /
//                    -I D:\workspace\STM8\stm8l151_ADS1292\iar\..\hardware\  /
//                    --vregs 16                                              /
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\iic.s /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME iic

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN delay_nus

        PUBLIC IIC_SOFT_Init
        PUBLIC sI2C_Ack
        PUBLIC sI2C_NoAck
        PUBLIC sIIC_ReadByte
        PUBLIC sIIC_Start
        PUBLIC sIIC_Stop
        PUBLIC sIIC_WaitAck
        PUBLIC sIIC_WriteByte

// D:\workspace\STM8\stm8l151_ADS1292\hardware\iic.c
//    1 #include "iic.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void IIC_SOFT_Init(void)
//    4 {
//    5   GPIO_Init(IIC_GPIO_PORT, IIC_SDA_PIN | IIC_SCL_PIN, GPIO_Mode_Out_PP_High_Slow);
IIC_SOFT_Init:
        MOV       S:?b0, #0xd0
        LD        A, #0x3
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//    6   //   GPIO_Init(GPIOC,GPIO_Pin_0,GPIO_Mode_In_PU_No_IT);    
//    7 }
        RET
//    8 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void sIIC_Start(void)
//   10 {
//   11   sSDA_out();
sIIC_Start:
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   12   delay_nus(1);
        CLRW      X
        INCW      X
        CALL      L:delay_nus
//   13   sSDA_H();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   14   sSCL_H();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   15   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   16   sSDA_L();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   17   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   18   sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   19   delay_nus(5);     
        LDW       X, #0x5
        CALL      L:delay_nus
//   20 }
        RET
//   21 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   22 void sIIC_Stop(void)
//   23 {
//   24   sSDA_out();
sIIC_Stop:
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   25   sSCL_L();		//1
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   26   delay_nus(5);	// 2
        LDW       X, #0x5
        CALL      L:delay_nus
//   27   sSDA_L();		// 3. 1,2,3这三行不可缺少
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   28   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   29   sSCL_H();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   30   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   31   sSDA_H();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   32   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   33   
//   34 }
        RET
//   35 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   36 u8 sIIC_WaitAck(void)
//   37 { 	   
sIIC_WaitAck:
        PUSH      S:?b8
//   38   u8 ucErrTime=0;
        CLR       S:?b8
//   39   
//   40   sSDA_in();   //改变方向///   
        MOV       S:?b0, #0x40
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   41   sSDA_H();delay_nus(1);	   
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
        CLRW      X
        INCW      X
        CALL      L:delay_nus
//   42   sSCL_H();delay_nus(1);	 
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
        CLRW      X
        INCW      X
        CALL      L:delay_nus
//   43   while(sRead_SDA())
??sIIC_WaitAck_0:
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_ReadInputDataBit
        CP        A, #0x0
        JREQ      L:??sIIC_WaitAck_1
//   44   {
//   45     ucErrTime++;
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
//   46     if(ucErrTime>250)
        LD        A, S:?b8
        CP        A, #0xfb
        JRC       L:??sIIC_WaitAck_0
//   47     {
//   48       sIIC_Stop();
        CALL      L:sIIC_Stop
//   49       return 1;
        LD        A, #0x1
        JRA       L:??sIIC_WaitAck_2
//   50     }
//   51   }
//   52   sSCL_L();//时钟输出0 
??sIIC_WaitAck_1:
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   53   return 0;             
        CLR       A
??sIIC_WaitAck_2:
        POP       S:?b8
        RET
//   54 }
//   55 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   56 void sI2C_Ack(void)
//   57 {
//   58   sSDA_out();//改变方向// 
sI2C_Ack:
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   59   sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   60   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   61   sSDA_L();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   62   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   63   sSCL_H();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   64   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   65   sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   66   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   67 }
        RET
//   68 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   69 void sI2C_NoAck(void)
//   70 {
//   71   sSDA_out();//改变方向// 
sI2C_NoAck:
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   72   sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   73   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   74   sSDA_H();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   75   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   76   sSCL_H();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//   77   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   78   sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   79   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   80 }
        RET
//   81 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 void sIIC_WriteByte(u8 byte)
//   83 {
sIIC_WriteByte:
        CALL      L:?push_w4
        LD        S:?b9, A
//   84   u8 i = 0;
        CLR       S:?b8
//   85   sSDA_out();
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//   86   for(i = 0; i < 8; i++)
        CLR       A
        LD        S:?b8, A
??sIIC_WriteByte_0:
        LD        A, S:?b8
        CP        A, #0x8
        JRNC      L:??sIIC_WriteByte_1
//   87   {
//   88     sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   89     delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//   90     if(byte & 0x80)
        LD        A, S:?b9
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??sIIC_WriteByte_2
//   91     {
//   92       sSDA_H();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
        JRA       L:??sIIC_WriteByte_3
//   93     }
//   94     else
//   95     {
//   96       sSDA_L();
??sIIC_WriteByte_2:
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//   97     }
//   98     delay_nus(5);
??sIIC_WriteByte_3:
        LDW       X, #0x5
        CALL      L:delay_nus
//   99     sSCL_H();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//  100     delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//  101     byte<<=1;
        LD        A, S:?b9
        SLL       A
        LD        S:?b9, A
//  102   }
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??sIIC_WriteByte_0
//  103   sSCL_L();
??sIIC_WriteByte_1:
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//  104   delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//  105 }
        JP        L:?epilogue_w4
//  106 
//  107 //读1个字节，ack=1时，发送ACK，ack=0，发送nACK   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  108 u8 sIIC_ReadByte(u8 ack)
//  109 {
sIIC_ReadByte:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
//  110   u8 i,ReadByte;
//  111   sSDA_out();       
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//  112   sSDA_H();
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//  113   sSDA_in();//改变方向//
        MOV       S:?b0, #0x40
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//  114   for(i = 0; i < 8; i++)
        CLR       A
        LD        S:?b9, A
??sIIC_ReadByte_0:
        LD        A, S:?b9
        CP        A, #0x8
        JRNC      L:??sIIC_ReadByte_1
//  115   {	
//  116     ReadByte <<= 1;
        LD        A, S:?b10
        SLL       A
        LD        S:?b10, A
//  117     sSCL_L();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_ResetBits
//  118     delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//  119     sSCL_H();
        LD        A, #0x2
        LDW       X, #0x500a
        CALL      L:GPIO_SetBits
//  120     delay_nus(5);
        LDW       X, #0x5
        CALL      L:delay_nus
//  121     if(sRead_SDA())
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_ReadInputDataBit
        CP        A, #0x0
        JREQ      L:??sIIC_ReadByte_2
//  122     {
//  123       ReadByte |= 0x01;
        LD        A, S:?b10
        OR        A, #0x1
        LD        S:?b10, A
        JRA       L:??sIIC_ReadByte_3
//  124     }
//  125     else
//  126     {
//  127       ReadByte &= ~(0x01);	
??sIIC_ReadByte_2:
        LD        A, S:?b10
        AND       A, #0xfe
        LD        S:?b10, A
//  128     }
//  129     
//  130   }
??sIIC_ReadByte_3:
        LD        A, S:?b9
        ADD       A, #0x1
        LD        S:?b9, A
        JRA       L:??sIIC_ReadByte_0
//  131   if (!ack)
??sIIC_ReadByte_1:
        TNZ       S:?b8
        JRNE      L:??sIIC_ReadByte_4
//  132     sI2C_NoAck();//发送nACK
        CALL      L:sI2C_NoAck
        JRA       L:??sIIC_ReadByte_5
//  133   else
//  134     sI2C_Ack(); //发送ACK   
??sIIC_ReadByte_4:
        CALL      L:sI2C_Ack
//  135   sSDA_out();//改变方向//
??sIIC_ReadByte_5:
        MOV       S:?b0, #0xd0
        LD        A, #0x1
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//  136   return ReadByte;
        LD        A, S:?b10
        POP       S:?b10
        JP        L:?epilogue_w4
//  137 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 641 bytes in section .near_func.text
// 
// 641 bytes of CODE memory
//
//Errors: none
//Warnings: none
