///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            29/Jan/2016  11:21:53 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_AFE\devices\iic_bmp085.c     /
//    Command line =  D:\workspace\STM8\stm8l151_AFE\devices\iic_bmp085.c -e  /
//                    -Ol --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_cross_call --debug --code_model small    /
//                    --data_model medium -o D:\workspace\STM8\stm8l151_AFE\i /
//                    ar\Debug\Obj\ --dlib_config                             /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l151_AFE\iar\Debug\List\ -I       /
//                    D:\workspace\STM8\stm8l151_AFE\iar\..\main\ -I          /
//                    D:\workspace\STM8\stm8l151_AFE\iar\..\fwlib\inc\ -I     /
//                    D:\workspace\STM8\stm8l151_AFE\iar\..\devices\ -I       /
//                    D:\workspace\STM8\stm8l151_AFE\iar\..\hardware\         /
//                    --vregs 16                                              /
//    List file    =  D:\workspace\STM8\stm8l151_AFE\iar\Debug\List\iic_bmp08 /
//                    5.s                                                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME iic_bmp085

        EXTERN ?add32_l0_l0_dl
        EXTERN ?add32_l0_l0_l1
        EXTERN ?and32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?load32_0x_l0
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_0x
        EXTERN ?load32_l1_dbsp
        EXTERN ?mov_l0_l1
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l1_l2
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sdiv32_l0_l0_dl
        EXTERN ?sdiv32_l0_l0_l1
        EXTERN ?sext32_l0_x
        EXTERN ?sll32_l0_l0_db
        EXTERN ?smod32_l1_l0_dl
        EXTERN ?sra32_l0_l0_db
        EXTERN ?srl32_l0_l0_db
        EXTERN ?sub32_l0_l0_l1
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN LCD_Fill
        EXTERN LCD_ShowNum
        EXTERN LCD_ShowOneChar
        EXTERN POINT_COLOR
        EXTERN delay_ms
        EXTERN sIIC_ReadByte
        EXTERN sIIC_Start
        EXTERN sIIC_Stop
        EXTERN sIIC_WaitAck
        EXTERN sIIC_WriteByte

        PUBLIC BMP085_Display
        PUBLIC BMP085_Read_Pressure
        PUBLIC BMP085_Read_Temp
        PUBLIC IIC_BMP085_Init
        PUBLIC IIC_BMP085_Read_Byte
        PUBLIC IIC_BMP085_Read_Multiple
        PUBLIC IIC_BMP085_Write_Byte
        PUBLIC mInfo

// D:\workspace\STM8\stm8l151_AFE\devices\iic_bmp085.c
//    1 #include "iic_bmp085.h"
//    2 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    3 BMP180_info mInfo ;
mInfo:
        DS8 44
//    4 extern u8 DataMessage[];
//    5 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    6 void IIC_BMP085_Init(void)
//    7 {
//    8   //IIC_SOFT_Init();
//    9   if(IIC_BMP085_Read_Byte(BMP180_ID_REGISTER_ADDRESS)== BMP180_ID_FIXED_VALUE)
IIC_BMP085_Init:
        LD        A, #0xd0
        CALL      L:IIC_BMP085_Read_Byte
        CPW       X, #0x55
        JRNE      L:??IIC_BMP085_Init_0
//   10   {//存在
//   11     mInfo.ExistFlag = BMP180_EXISTENCE ;
        MOV       L:mInfo, #0x1
//   12     mInfo.cal_param.AC1= IIC_BMP085_Read_Multiple(0xAA);
        LD        A, #0xaa
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 1, X
//   13     mInfo.cal_param.AC2= IIC_BMP085_Read_Multiple(0xAC);
        LD        A, #0xac
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 3, X
//   14     mInfo.cal_param.AC3= IIC_BMP085_Read_Multiple(0xAE);
        LD        A, #0xae
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 5, X
//   15     mInfo.cal_param.AC4= IIC_BMP085_Read_Multiple(0xB0);
        LD        A, #0xb0
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 7, X
//   16     mInfo.cal_param.AC5= IIC_BMP085_Read_Multiple(0xB2);
        LD        A, #0xb2
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 9, X
//   17     mInfo.cal_param.AC6= IIC_BMP085_Read_Multiple(0xB4);
        LD        A, #0xb4
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 11, X
//   18     mInfo.cal_param.B1=  IIC_BMP085_Read_Multiple(0xB6);
        LD        A, #0xb6
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 13, X
//   19     mInfo.cal_param.B2=  IIC_BMP085_Read_Multiple(0xB8);
        LD        A, #0xb8
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 15, X
//   20     mInfo.cal_param.MB=  IIC_BMP085_Read_Multiple(0xBA);
        LD        A, #0xba
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 17, X
//   21     mInfo.cal_param.MC=  IIC_BMP085_Read_Multiple(0xBC);
        LD        A, #0xbc
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 19, X
//   22     mInfo.cal_param.MD=  IIC_BMP085_Read_Multiple(0xBE);
        LD        A, #0xbe
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       L:mInfo + 21, X
//   23     mInfo.Version = IIC_BMP085_Read_Byte(BMP180_VERSION_REGISTER_ADDRESS);
        LD        A, #0xd1
        CALL      L:IIC_BMP085_Read_Byte
        LD        A, XL
        LD        L:mInfo + 23, A
        RET
//   24   }
//   25   else
//   26   {//不存在
//   27     mInfo.ExistFlag = BMP180_NOT_EXISTENCE ;
??IIC_BMP085_Init_0:
        MOV       L:mInfo, #0x0
//   28   }
//   29 }
        RET
//   30 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   31 void IIC_BMP085_Write_Byte(u8 Address, u8 Data)
//   32 {
IIC_BMP085_Write_Byte:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//   33   sIIC_Start();  
        CALL      L:sIIC_Start
//   34   sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
        LD        A, #0xee
        CALL      L:sIIC_WriteByte
//   35   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   36   sIIC_WriteByte(Address);//发送寄存器地址
        LD        A, S:?b8
        CALL      L:sIIC_WriteByte
//   37   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   38   sIIC_WriteByte(Data);
        LD        A, S:?b9
        CALL      L:sIIC_WriteByte
//   39   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   40   sIIC_Stop();//产生一个停止条件
        CALL      L:sIIC_Stop
//   41 }
        JP        L:?epilogue_w4
//   42 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   43 uint16_t IIC_BMP085_Read_Byte(u8 Address)
//   44 {
IIC_BMP085_Read_Byte:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
//   45   short read_data = 0;
        CLR       S:?b9
        CLR       S:?b8
//   46   
//   47   sIIC_Start();
        CALL      L:sIIC_Start
//   48   sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
        LD        A, #0xee
        CALL      L:sIIC_WriteByte
//   49   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   50   sIIC_WriteByte(Address);//发送寄存器地址
        LD        A, S:?b10
        CALL      L:sIIC_WriteByte
//   51   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   52   
//   53   sIIC_Start();  	 	   
        CALL      L:sIIC_Start
//   54   sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE | 0x01);   //进入接收模式
        LD        A, #0xef
        CALL      L:sIIC_WriteByte
//   55   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   56   read_data = sIIC_ReadByte(0);
        CLR       A
        CALL      L:sIIC_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w4, X
//   57   sIIC_Stop();//产生一个停止条件	  
        CALL      L:sIIC_Stop
//   58   
//   59   return read_data;
        LDW       X, S:?w4
        POP       S:?b10
        JP        L:?epilogue_w4
//   60 }
//   61 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   62 uint16_t IIC_BMP085_Read_Multiple(u8 ST_Address)
//   63 {
IIC_BMP085_Read_Multiple:
        CALL      L:?push_w4
        LD        S:?b8, A
//   64   uint8_t msb, lsb;
//   65   uint16_t data;
//   66   
//   67   sIIC_Start();  
        CALL      L:sIIC_Start
//   68   sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE & 0xFE);   //发送写命令
        LD        A, #0xee
        CALL      L:sIIC_WriteByte
//   69   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   70   sIIC_WriteByte(ST_Address);//发送寄存器地址
        LD        A, S:?b8
        CALL      L:sIIC_WriteByte
//   71   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   72   
//   73   sIIC_Start();  	 	   
        CALL      L:sIIC_Start
//   74   sIIC_WriteByte(BMP180_DEVICE_ADDRESS_BASE_VALUE | 0x01);   //进入接收模式			   
        LD        A, #0xef
        CALL      L:sIIC_WriteByte
//   75   sIIC_WaitAck();	 
        CALL      L:sIIC_WaitAck
//   76   msb = sIIC_ReadByte(1);
        LD        A, #0x1
        CALL      L:sIIC_ReadByte
        LD        S:?b8, A
//   77   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   78   lsb = sIIC_ReadByte(0);
        CLR       A
        CALL      L:sIIC_ReadByte
        LD        S:?b9, A
//   79   sIIC_Stop();//产生一个停止条件	   
        CALL      L:sIIC_Stop
//   80   
//   81   data = msb << 8 | lsb;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        CLR       A
        RLWA      X, A
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b9
        EXG       A, YL
        LDW       S:?w0, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
//   82   return data;
        JP        L:?epilogue_w4
//   83 }
//   84 
//   85 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   86 long BMP085_Read_Temp(void)
//   87 {
//   88   long temp;
//   89   IIC_BMP085_Write_Byte(0xF4, 0x2E);
BMP085_Read_Temp:
        MOV       S:?b0, #0x2e
        LD        A, #0xf4
        CALL      L:IIC_BMP085_Write_Byte
//   90   delay_ms(10);			// max time is 4.5ms
        LDW       X, #0xa
        CALL      L:delay_ms
//   91   temp = IIC_BMP085_Read_Multiple(0xF6);
        LD        A, #0xf6
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
//   92   return temp;
        RET
//   93 }
//   94 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   95 long BMP085_Read_Pressure(void)
//   96 {
BMP085_Read_Pressure:
        CALL      L:?push_l2
//   97   long pressure = 0;
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//   98   IIC_BMP085_Write_Byte(0xF4, 0x34+(OSS<<6));
        MOV       S:?b0, #0x34
        LD        A, #0xf4
        CALL      L:IIC_BMP085_Write_Byte
//   99   delay_ms(10);    	              // max time is 4.5ms
        LDW       X, #0xa
        CALL      L:delay_ms
//  100   pressure = IIC_BMP085_Read_Multiple(0xF6);
        LD        A, #0xf6
        CALL      L:IIC_BMP085_Read_Multiple
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l2_l0
//  101   //pressure = ((pressure <<8) + IIC_BMP085_Read_Byte(0xf8)) >>(8-OSS) ;
//  102   pressure &= 0x0000FFFF;
        CLRW      X
        LDW       S:?w2, X
        DECW      X
        LDW       S:?w3, X
        CALL      L:?mov_l0_l2
        CALL      L:?and32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  103   return pressure;
        CALL      L:?mov_l0_l2
        JP        L:?epilogue_l2
//  104 }
//  105 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  106 void BMP085_Display(void)
//  107 {
BMP085_Display:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x4
//  108   long x1, x2, B5, B6, x3, B3, p;
//  109   unsigned long b4, b7;
//  110   
//  111   //未校正的温度值
//  112   mInfo.UnsetTemperature = BMP085_Read_Temp();
        CALL      L:BMP085_Read_Temp
        LDW       X, #mInfo + 24
        CALL      L:?load32_0x_l0
//  113   //未校正的气压值
//  114   mInfo.UnsetGasPress = BMP085_Read_Pressure();
        CALL      L:BMP085_Read_Pressure
        LDW       X, #mInfo + 28
        CALL      L:?load32_0x_l0
//  115   
//  116   //温度校正
//  117   x1 = ((mInfo.UnsetTemperature) - mInfo.cal_param.AC6) * (mInfo.cal_param.AC5) >> 15;
        LDW       X, L:mInfo + 9
        LDW       S:?w5, X
        CLRW      X
        LDW       S:?w4, X
        LDW       X, L:mInfo + 11
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        LDW       X, #mInfo + 24
        CALL      L:?load32_l0_0x
        CALL      L:?sub32_l0_l0_l1
        CALL      L:?mov_l1_l2
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0xf
        CODE
        CALL      L:?mov_l2_l0
//  118   x2 = ((long)(mInfo.cal_param.MC) << 11) / (x1 + mInfo.cal_param.MD);
        LDW       X, L:mInfo + 21
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l1_l0
        LDW       X, L:mInfo + 19
        CALL      L:?sext32_l0_x
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0xb
        CODE
        CALL      L:?sdiv32_l0_l0_l1
//  119   B5 = x1 + x2;
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l1_l0
//  120   mInfo.Temperature= (B5 + 8) >> 4;
        CALL      L:?mov_l0_l1
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x8
        CODE
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        LDW       X, #mInfo + 32
        CALL      L:?load32_0x_l0
//  121   
//  122   //气压校正
//  123   B6 = B5- 4000;
        CALL      L:?mov_l0_l1
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0xfffffffffffff060
        CODE
        CALL      L:?mov_l3_l0
//  124   x1 = ((long)(mInfo.cal_param.B2) * (B6 * B6 >> 12)) >> 11;
        CALL      L:?mov_l1_l3
        CALL      L:?mov_l0_l3
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0xc
        CODE
        CALL      L:?mov_l1_l0
        LDW       X, L:mInfo + 15
        CALL      L:?sext32_l0_x
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0xb
        CODE
        CALL      L:?mov_l2_l0
//  125   x2 = ((long)mInfo.cal_param.AC2) * B6 >> 11;
        LDW       X, L:mInfo + 3
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l3
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0xb
        CODE
//  126   x3 = x1 + x2;
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  127   B3 = ((((long)(mInfo.cal_param.AC1) * 4 + x3)<<OSS) + 2)/4;
        LDW       X, L:mInfo + 1
        CALL      L:?sext32_l0_x
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x4
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x2
        CODE
        CALL      L:?sdiv32_l0_l0_dl
        DATA
        DC32      0x4
        CODE
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x1
        CODE
//  128   x1 = ((long)mInfo.cal_param.AC3) * B6 >> 13;
        LDW       X, L:mInfo + 5
        CALL      L:?sext32_l0_x
        CALL      L:?mov_l1_l3
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0xd
        CODE
        CALL      L:?mov_l2_l0
//  129   x2 = ((long)(mInfo.cal_param.B1) * (B6 * B6 >> 12)) >> 16;
        CALL      L:?mov_l0_l3
        CALL      L:?mov_l1_l3
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0xc
        CODE
        CALL      L:?mov_l1_l0
        LDW       X, L:mInfo + 13
        CALL      L:?sext32_l0_x
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x10
        CODE
//  130   x3 = ((x1 + x2) + 2) >> 2;
        CALL      L:?mov_l1_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x2
        CODE
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x2
        CODE
        CALL      L:?mov_l2_l0
//  131   b4 = ((long)(mInfo.cal_param.AC4) * (unsigned long) (x3 + 32768)) >> 15;
        LDW       X, L:mInfo + 7
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?mov_l0_l2
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x8000
        CODE
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0xf
        CODE
        CALL      L:?mov_l2_l0
//  132   b7 = ((unsigned long)(mInfo.UnsetGasPress) - B3) * (50000 >> OSS);
        CALL      L:?load32_l1_dbsp
        DATA
        DC8       0x1
        CODE
        LDW       X, #mInfo + 28
        CALL      L:?load32_l0_0x
        CALL      L:?sub32_l0_l0_l1
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xc350
        CODE
//  133   if( b7 < 0x80000000)
        LDW       X, S:?w0
        CPW       X, #0x8000
        JRNE      L:??BMP085_Display_0
        LDW       X, S:?w1
        CPW       X, #0x0
??BMP085_Display_0:
        JRNC      L:??BMP085_Display_1
//  134   {
//  135     p = (b7 * 2) / b4 ;
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x2
        CODE
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mov_l3_l0
        JRA       L:??BMP085_Display_2
//  136   }
//  137   else
//  138   {
//  139     p = (b7 / b4) * 2;
??BMP085_Display_1:
        CALL      L:?mov_l1_l2
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x2
        CODE
        CALL      L:?mov_l3_l0
//  140   }
//  141   x1 = (p >> 8) * (p >> 8);
??BMP085_Display_2:
        CALL      L:?mov_l0_l3
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x8
        CODE
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x8
        CODE
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  142   x1 = ((long)x1 * 3038) >> 16;
        CALL      L:?mov_l0_l2
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xbde
        CODE
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        CALL      L:?mov_l2_l0
//  143   x2 = (-7357 * p) >> 16;
        CALL      L:?mov_l0_l3
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0xffffffffffffe343
        CODE
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x10
        CODE
//  144   mInfo.GasPress= p + ((x1 + x2 + 3791) >> 4);
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l2
        CALL      L:?add32_l0_l0_l1
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0xecf
        CODE
        CALL      L:?sra32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?mov_l1_l3
        CALL      L:?add32_l0_l0_l1
        LDW       X, #mInfo + 36
        CALL      L:?load32_0x_l0
//  145   
//  146   LCD_Fill(50,65,128,80,BLACK);
        CLR       S:?b5
        CLR       S:?b4
        LDW       X, #0x50
        LDW       S:?w1, X
        LDW       X, #0x80
        LDW       S:?w0, X
        LDW       Y, #0x41
        LDW       X, #0x32
        CALL      L:LCD_Fill
//  147   POINT_COLOR=YELLOW;
        LDW       X, #0xffe0
        LDW       L:POINT_COLOR, X
//  148   //  LCD_ShowNum(85,65, (mInfo.Temperature)/10, 3);
//  149   LCD_ShowNum(50,65, (mInfo.GasPress)/100, 3);
        LD        A, #0x3
        PUSH      A
        LDW       X, #mInfo + 36
        CALL      L:?load32_l0_0x
        CALL      L:?sdiv32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        POP       A
        LDW       Y, #0x41
        LDW       X, #0x32
        CALL      L:LCD_ShowNum
//  150   //  LCD_ShowOneChar(103,65,'.');
//  151   LCD_ShowOneChar(68,65,'.');
        LD        A, #0x2e
        LDW       Y, #0x41
        LDW       X, #0x44
        CALL      L:LCD_ShowOneChar
//  152   //  LCD_ShowNum(109,65, (mInfo.Temperature)%10, 1);
//  153   LCD_ShowNum(74,65, (mInfo.GasPress)%100, 2);
        LD        A, #0x2
        PUSH      A
        LDW       X, #mInfo + 36
        CALL      L:?load32_l0_0x
        CALL      L:?smod32_l1_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?mov_l0_l1
        POP       A
        LDW       Y, #0x41
        LDW       X, #0x4a
        CALL      L:LCD_ShowNum
//  154   
//  155 }
        ADD       SP, #0x4
        JP        L:?epilogue_l2_l3

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  156 
//  157 
// 
//  44 bytes in section .near.bss
// 967 bytes in section .near_func.text
// 
// 967 bytes of CODE memory
//  44 bytes of DATA memory
//
//Errors: none
//Warnings: none
