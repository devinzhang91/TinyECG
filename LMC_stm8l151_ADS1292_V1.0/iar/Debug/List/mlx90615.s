///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            22/Apr/2016  11:30:14 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l151_ADS1292\devices\mlx90615.c   /
//    Command line =  D:\workspace\STM8\stm8l151_ADS1292\devices\mlx90615.c   /
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
//    List file    =  D:\workspace\STM8\stm8l151_ADS1292\iar\Debug\List\mlx90 /
//                    615.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mlx90615

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?sra16_x_x_a
        EXTERN ?w0
        EXTERN ?w3
        EXTERN ?w4
        EXTERN IIC_SOFT_Init
        EXTERN sIIC_ReadByte
        EXTERN sIIC_Start
        EXTERN sIIC_Stop
        EXTERN sIIC_WaitAck
        EXTERN sIIC_WriteByte

        PUBLIC MLX90615_Init
        PUBLIC MLX90615_Read_Byte
        PUBLIC MLX90615_Read_Temp
        PUBLIC MLX90615_Write_Byte
        PUBLIC PEC_calculation
        PUBLIC slaveaddress

// D:\workspace\STM8\stm8l151_ADS1292\devices\mlx90615.c
//    1 #include "mlx90615.h"
//    2 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    3 u8 slaveaddress = 0;
slaveaddress:
        DS8 1
//    4 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    5 void MLX90615_Init(void)
//    6 {
//    7   IIC_SOFT_Init();
MLX90615_Init:
        CALL      L:IIC_SOFT_Init
//    8   slaveaddress = 0;
        MOV       L:slaveaddress, #0x0
//    9   slaveaddress = (MLX90615_Read_Byte(RROM|SA))<<1;
        LD        A, #0x10
        CALL      L:MLX90615_Read_Byte
        LD        A, XL
        SLL       A
        LD        L:slaveaddress, A
//   10 }
        RET
//   11 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   12 void MLX90615_Write_Byte(u8 Address, u16 Data)
//   13 {
MLX90615_Write_Byte:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        LDW       S:?w4, X
//   14   sIIC_Start();  
        CALL      L:sIIC_Start
//   15   sIIC_WriteByte(slaveaddress & 0xFE);   //发送写命令
        LD        A, L:slaveaddress
        AND       A, #0xfe
        CALL      L:sIIC_WriteByte
//   16   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   17   sIIC_WriteByte(Address);//发送寄存器地址
        LD        A, S:?b10
        CALL      L:sIIC_WriteByte
//   18   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   19   sIIC_WriteByte(Data&0xFF);		//先发送低8位，有点奇葩
        LD        A, S:?b9
        CALL      L:sIIC_WriteByte
//   20   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   21   sIIC_WriteByte((Data>>8)&0xFF);	//发送高8位
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:sIIC_WriteByte
//   22   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   23   sIIC_WriteByte(Data);				//发送PEC错误报告
        LD        A, S:?b9
        CALL      L:sIIC_WriteByte
//   24   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   25   sIIC_Stop();//产生一个停止条件
        CALL      L:sIIC_Stop
//   26 }
        POP       S:?b10
        JP        L:?epilogue_w4
//   27 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   28 u16 MLX90615_Read_Byte(u8 Address)
//   29 {
MLX90615_Read_Byte:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LD        S:?b13, A
//   30   u8 msb=0, lsb=0, pec=0;
        CLR       S:?b10
        CLR       S:?b11
        CLR       S:?b12
//   31   u8 arr[6];		//发送的数据
//   32   u16 data;
//   33   
//   34   sIIC_Start();
        CALL      L:sIIC_Start
//   35   sIIC_WriteByte(slaveaddress & 0xFE);   //发送写命令
        LD        A, L:slaveaddress
        AND       A, #0xfe
        CALL      L:sIIC_WriteByte
//   36   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   37   sIIC_WriteByte(Address);//发送寄存器地址
        LD        A, S:?b13
        CALL      L:sIIC_WriteByte
//   38   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   39   
//   40   sIIC_Start();  	 	   
        CALL      L:sIIC_Start
//   41   sIIC_WriteByte(slaveaddress | 0x01);   //进入接收模式
        LD        A, L:slaveaddress
        OR        A, #0x1
        CALL      L:sIIC_WriteByte
//   42   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   43   lsb = sIIC_ReadByte(1);	//先接收低8位
        LD        A, #0x1
        CALL      L:sIIC_ReadByte
        LD        S:?b11, A
//   44   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   45   msb = sIIC_ReadByte(1);
        LD        A, #0x1
        CALL      L:sIIC_ReadByte
        LD        S:?b10, A
//   46   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   47   pec = sIIC_ReadByte(0);	//接收PEC错误报告
        CLR       A
        CALL      L:sIIC_ReadByte
        LD        S:?b12, A
//   48   sIIC_Stop();//产生一个停止条件	  
        CALL      L:sIIC_Stop
//   49   
//   50 //  arr[5]=slaveaddress;
//   51 //  arr[4]=Address;
//   52 //  arr[3]=slaveaddress;		//Load array arr 
//   53 //  arr[2]=lsb;
//   54 //  arr[1]=msb;
//   55 //  arr[0]=0;
//   56 //  if(pec == PEC_calculation(arr));	//Calculate CRC
//   57   
//   58   data = msb << 8 | lsb;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w4, X
//   59   
//   60   return data;
        LDW       X, S:?w4
        JP        L:?epilogue_l2_w6
//   61 }
//   62 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   63 u8 PEC_calculation(u8 pec[])
//   64 {
PEC_calculation:
        CALL      L:?push_w4
        SUB       SP, #0x6
        LDW       S:?w3, X
//   65   u8 crc[6];
//   66   u8 BitPosition=47;
        MOV       S:?b0, #0x2f
//   67   u8 shift;
//   68   u8 i;
//   69   u8 j;
//   70   u8 temp;
//   71   
//   72   do{
//   73     crc[5]=0;				/* Load CRC value 0x000000000107 */
??PEC_calculation_0:
        CLR       A
        LD        (0x6,SP), A
//   74     crc[4]=0;
        CLR       A
        LD        (0x5,SP), A
//   75     crc[3]=0;
        CLR       A
        LD        (0x4,SP), A
//   76     crc[2]=0;
        CLR       A
        LD        (0x3,SP), A
//   77     crc[1]=0x01;
        LD        A, #0x1
        LD        (0x2,SP), A
//   78     crc[0]=0x07;
        LD        A, #0x7
        LD        (0x1,SP), A
//   79     BitPosition=47;			/* Set maximum bit position at 47 */
        LD        A, #0x2f
        LD        S:?b0, A
//   80     shift=0;	
        CLR       A
        LD        S:?b4, A
//   81     //Find first 1 in the transmited message
//   82     i=5;					/* Set highest index */
        LD        A, #0x5
        LD        S:?b3, A
//   83     j=0;
        CLR       A
        LD        S:?b2, A
//   84     while((pec[i]&(0x80>>j))==0 && i>0){
??PEC_calculation_1:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        ADDW      X, S:?w3
        LDW       Y, X
        LDW       X, #0x80
        LD        A, S:?b2
        CALL      L:?sra16_x_x_a
        LD        A, XL
        AND       A, (Y)
        CP        A, #0x0
        JRNE      L:??PEC_calculation_2
        TNZ       S:?b3
        JREQ      L:??PEC_calculation_2
//   85       BitPosition--;
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
//   86       if(j<7){
        LD        A, S:?b2
        CP        A, #0x7
        JRNC      L:??PEC_calculation_3
//   87         j++;
        LD        A, S:?b2
        ADD       A, #0x1
        LD        S:?b2, A
        JRA       L:??PEC_calculation_1
//   88       }
//   89       else{
//   90         j=0x00;
??PEC_calculation_3:
        CLR       A
        LD        S:?b2, A
//   91         i--;
        LD        A, S:?b3
        ADD       A, #0xff
        LD        S:?b3, A
        JRA       L:??PEC_calculation_1
//   92       }
//   93     }/*End of while */
//   94     shift=BitPosition-8;	/*Get shift value for crc value*/
??PEC_calculation_2:
        LD        A, S:?b0
        ADD       A, #0xf8
        LD        S:?b4, A
//   95     //Shift crc value 
//   96     while(shift){
??PEC_calculation_4:
        TNZ       S:?b4
        JRNE      ??lb_0
        JP        L:??PEC_calculation_5
//   97       for(i=5; i<0xFF; i--){
??lb_0:
        LD        A, #0x5
        LD        S:?b3, A
??PEC_calculation_6:
        LD        A, S:?b3
        CP        A, #0xff
        JREQ      L:??PEC_calculation_7
//   98         if((crc[i-1]&0x80) && (i>0)){
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w4, X
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w4
        DECW      X
        LD        A, (X)
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??PEC_calculation_8
        TNZ       S:?b3
        JREQ      L:??PEC_calculation_8
//   99           temp=1;
        LD        A, #0x1
        LD        S:?b1, A
        JRA       L:??PEC_calculation_9
//  100         }
//  101         else{
//  102           temp=0;
??PEC_calculation_8:
        CLR       A
        LD        S:?b1, A
//  103         }
//  104         crc[i]<<=1;
??PEC_calculation_9:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w4, X
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w4
        LD        A, (X)
        SLL       A
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w4, X
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w4
        LD        (X), A
//  105         crc[i]+=temp;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w4, X
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w4
        LD        A, S:?b1
        ADD       A, (X)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w4, X
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w4
        LD        (X), A
//  106       }/*End of for*/
        LD        A, S:?b3
        ADD       A, #0xff
        LD        S:?b3, A
        JRA       L:??PEC_calculation_6
//  107       shift--;
??PEC_calculation_7:
        LD        A, S:?b4
        ADD       A, #0xff
        LD        S:?b4, A
        JP        L:??PEC_calculation_4
//  108     }/*End of while*/
//  109     //Exclusive OR between pec and crc		
//  110     for(i=0; i<=5; i++){
??PEC_calculation_5:
        CLR       A
        LD        S:?b3, A
??PEC_calculation_10:
        LD        A, S:?b3
        CP        A, #0x6
        JRNC      L:??PEC_calculation_11
//  111       pec[i] ^=crc[i];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        ADDW      X, S:?w3
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w4, X
        LDW       X, SP
        ADDW      X, #0x1
        ADDW      X, S:?w4
        LD        A, (X)
        XOR       A, (Y)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        ADDW      X, S:?w3
        LD        (X), A
//  112     }/*End of for*/
        LD        A, S:?b3
        ADD       A, #0x1
        LD        S:?b3, A
        JRA       L:??PEC_calculation_10
//  113   }while(BitPosition>8);/*End of do-while*/
??PEC_calculation_11:
        LD        A, S:?b0
        CP        A, #0x9
        JRC       ??lb_1
        JP        L:??PEC_calculation_0
//  114   return pec[0];
??lb_1:
        LD        A, [S:?w3.w]
        ADD       SP, #0x6
        JP        L:?epilogue_w4
//  115 }/*End of PEC_calculation*/
//  116 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  117 u16 MLX90615_Read_Temp(void)
//  118 {
MLX90615_Read_Temp:
        CALL      L:?push_w4
//  119   u16 temp = 0;
        CLR       S:?b9
        CLR       S:?b8
//  120   temp = MLX90615_Read_Byte(RRAM|TO);
        LD        A, #0x27
        CALL      L:MLX90615_Read_Byte
        LDW       S:?w4, X
//  121   temp = temp*2-27315;
        LDW       X, S:?w4
        SLLW      X
        ADDW      X, #0x954d
        LDW       S:?w4, X
//  122   return temp;
        LDW       X, S:?w4
        JP        L:?epilogue_w4
//  123 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  124 
//  125 
//  126 
// 
//   1 byte  in section .near.bss
// 545 bytes in section .near_func.text
// 
// 545 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: 2
