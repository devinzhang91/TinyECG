///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            26/Jan/2016  19:33:46 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l152_spi_LCD\devices\afe4404.c    /
//    Command line =  D:\workspace\STM8\stm8l152_spi_LCD\devices\afe4404.c    /
//                    -e -Ol --no_cse --no_unroll --no_inline                 /
//                    --no_code_motion --no_tbaa --no_cross_call --debug      /
//                    --code_model small --data_model medium -o               /
//                    D:\workspace\STM8\stm8l152_spi_LCD\iar\Debug\Obj\       /
//                    --dlib_config D:\IAR\stm8\LIB\dlstm8smn.h -D            /
//                    STM8L15X_MDP -lB D:\workspace\STM8\stm8l152_spi_LCD\iar /
//                    \Debug\List\ -I D:\workspace\STM8\stm8l152_spi_LCD\iar\ /
//                    ..\main\ -I D:\workspace\STM8\stm8l152_spi_LCD\iar\..\f /
//                    wlib\inc\ -I D:\workspace\STM8\stm8l152_spi_LCD\iar\..\ /
//                    devices\ -I D:\workspace\STM8\stm8l152_spi_LCD\iar\..\h /
//                    ardware\ --vregs 16                                     /
//    List file    =  D:\workspace\STM8\stm8l152_spi_LCD\iar\Debug\List\afe44 /
//                    04.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME afe4404

        EXTERN ?b0
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b3
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l1_dbsp
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?or32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sll32_l0_l0_db
        EXTERN ?srl32_l0_l0_db
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN GPIO_Init
        EXTERN GPIO_SetBits
        EXTERN sIIC_ReadByte
        EXTERN sIIC_Start
        EXTERN sIIC_Stop
        EXTERN sIIC_WaitAck
        EXTERN sIIC_WriteByte

        PUBLIC AFE4404_Init
        PUBLIC AFE4404_ReadData
        PUBLIC AFE4404_Read_LED2STC
        PUBLIC AFE4404_WirteData
        PUBLIC AFE4404_Wirte_LED2STC

// D:\workspace\STM8\stm8l152_spi_LCD\devices\afe4404.c
//    1 #include "afe4404.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void AFE4404_Init(void)
//    4 {
//    5   GPIO_Init( RESETZ_PORT, RESETZ_PIN, GPIO_Mode_Out_PP_High_Fast);
AFE4404_Init:
        MOV       S:?b0, #0xf0
        LD        A, #0x20
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//    6 //  GPIO_Init( ADC_RDY_PORT, ADC_RDY_PIN, GPIO_Mode_In_FL_IT);
//    7 //  EXTI_SetPinSensitivity(ADC_RDY_EXIT,EXTI_Trigger_Falling_Low);
//    8   
//    9   GPIO_SetBits(RESETZ_PORT,RESETZ_PIN);
        LD        A, #0x20
        LDW       X, #0x500f
        JP        L:GPIO_SetBits
//   10 }

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
AFE4404_Wirte_LED2STC:
        LD        A, #0x1
        JP        L:AFE4404_WirteData

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
AFE4404_Read_LED2STC:
        LD        A, #0x1
        JP        L:AFE4404_ReadData

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
AFE4404_WirteData:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
        CALL      L:?mov_l2_l0
        CALL      L:sIIC_Start
        LD        A, #0x58
        CALL      L:sIIC_WriteByte
        CALL      L:sIIC_WaitAck
        LD        A, S:?b12
        CALL      L:sIIC_WriteByte
        CALL      L:sIIC_WaitAck
        CALL      L:?mov_l0_l2
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        LD        A, S:?b3
        CALL      L:sIIC_WriteByte
        CALL      L:sIIC_WaitAck
        LDW       X, S:?w5
        CLR       A
        RRWA      X, A
        LD        A, XL
        CALL      L:sIIC_WriteByte
        CALL      L:sIIC_WaitAck
        LD        A, S:?b11
        CALL      L:sIIC_WriteByte
        CALL      L:sIIC_WaitAck
        CALL      L:sIIC_Stop
        POP       S:?b12
        JP        L:?epilogue_l2
//   11 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   12 u32 AFE4404_ReadData(u8 Address)
//   13 {
AFE4404_ReadData:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSH      A
        SUB       SP, #0x4
//   14   u32 temp0=0, temp1=0, temp2=0;
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
        LDW       X, #0x0
        LDW       (0x1,SP), X
        LDW       X, #0x0
        LDW       (0x3,SP), X
//   15   u32 res;
//   16   
//   17   sIIC_Start();
        CALL      L:sIIC_Start
//   18   sIIC_WriteByte(AFE4404_ADDRESS & 0xFE);   //发送写命令
        LD        A, #0x58
        CALL      L:sIIC_WriteByte
//   19   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   20   sIIC_WriteByte(Address);//发送寄存器地址
        LD        A, (0x5,SP)
        CALL      L:sIIC_WriteByte
//   21   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   22   
//   23   sIIC_Start();
        CALL      L:sIIC_Start
//   24   sIIC_WriteByte(AFE4404_ADDRESS | 0x01);   //进入接收模式
        LD        A, #0x59
        CALL      L:sIIC_WriteByte
//   25   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   26   temp0 = sIIC_ReadByte(1);
        LD        A, #0x1
        CALL      L:sIIC_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
//   27   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   28   temp1 = sIIC_ReadByte(1);
        LD        A, #0x1
        CALL      L:sIIC_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l2_l0
//   29   sIIC_WaitAck();
        CALL      L:sIIC_WaitAck
//   30   temp2 = sIIC_ReadByte(0);
        CLR       A
        CALL      L:sIIC_ReadByte
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x1
        CODE
//   31   sIIC_Stop();//产生一个停止条件
        CALL      L:sIIC_Stop
//   32   
//   33   res = temp0<<16 | temp1<<8 | temp2;
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x8
        CODE
        CALL      L:?mov_l1_l0
        CALL      L:?mov_l0_l3
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x10
        CODE
        CALL      L:?or32_l0_l0_l1
        CALL      L:?load32_l1_dbsp
        DATA
        DC8       0x1
        CODE
        CALL      L:?or32_l0_l0_l1
//   34   return res;
        ADD       SP, #0x5
        JP        L:?epilogue_l2_l3
//   35 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   36 
//   37 
//   38 
//   39 void AFE4404_WirteData(u8 Address, u32 Data)
//   40 {
//   41   sIIC_Start();
//   42   sIIC_WriteByte(AFE4404_ADDRESS & 0xFE);   //发送写命令
//   43   sIIC_WaitAck();
//   44   sIIC_WriteByte(Address);//发送寄存器地址
//   45   sIIC_WaitAck();
//   46   sIIC_WriteByte((Data>>16) & 0xFF);
//   47   sIIC_WaitAck();
//   48   sIIC_WriteByte((Data>>8) & 0xFF);
//   49   sIIC_WaitAck();
//   50   sIIC_WriteByte((Data) & 0xFF);
//   51   sIIC_WaitAck();
//   52   sIIC_Stop();//产生一个停止条件
//   53 }
//   54 
//   55 u32 AFE4404_Read_LED2STC(void)
//   56 {
//   57   return AFE4404_ReadData(0x01);
//   58 }
//   59 
//   60 void AFE4404_Wirte_LED2STC(u32 data)
//   61 {
//   62   AFE4404_WirteData(0x01, data);
//   63 }
//   64 
//   65 
// 
// 248 bytes in section .near_func.text
// 
// 248 bytes of CODE memory
//
//Errors: none
//Warnings: none
