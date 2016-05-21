///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.41.1.50116 for STM8            26/Feb/2015  16:48:40 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  G:\QQQ\17-lcm-wx2516\main\flash.c                       /
//    Command line =  G:\QQQ\17-lcm-wx2516\main\flash.c -e -Ohs               /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o G:\QQQ\17-lcm-wx2516\iar\Debug\O /
//                    bj\ --dlib_config "C:\Program Files (x86)\IAR           /
//                    Systems\Embedded Workbench 6.5\stm8\LIB\dlstm8smn.h"    /
//                    -D STM8L15X_MDP -lB G:\QQQ\17-lcm-wx2516\iar\Debug\List /
//                    \ -I G:\QQQ\17-lcm-wx2516\iar\..\main\ -I               /
//                    G:\QQQ\17-lcm-wx2516\iar\..\fwlib\inc\ -I               /
//                    G:\QQQ\17-lcm-wx2516\iar\..\periph\ -I                  /
//                    G:\QQQ\17-lcm-wx2516\iar\..\utility\ --vregs 16         /
//    List file    =  G:\QQQ\17-lcm-wx2516\iar\Debug\List\flash.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME flash

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?w4
        EXTERN ?w5
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits

        PUBLIC W25X16_CHECK_BUSY
        PUBLIC W25X16_INIT
        PUBLIC W25X16_READ_BUF
        PUBLIC W25X16_READ_BYTE
        PUBLIC W25X16_READ_DATA
        PUBLIC W25X16_READ_STATUS
        PUBLIC W25X16_SEND_BUF
        PUBLIC W25X16_WRITE_BYTE
        PUBLIC W25X16_WRITE_DATA
        PUBLIC W25X16_WRITE_DISABLE
        PUBLIC W25X16_WRITE_ENABLE

// G:\QQQ\17-lcm-wx2516\main\flash.c
//    1 #ifndef FLASH_C
//    2 #define FLASH_C
//    3 #include "flash.h"
//    4 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    5 u8 W25X16_READ_BUF[W25X16_READ_LENGTH];
W25X16_READ_BUF:
        DS8 250

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//    6 u8 W25X16_SEND_BUF[W25X16_SEND_LENGTH];
W25X16_SEND_BUF:
        DS8 250
//    7 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    8 void W25X16_INIT(void)
//    9 {
//   10     GPIO_Init(GPIOB,GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_5,GPIO_Mode_Out_PP_High_Slow);
W25X16_INIT:
        MOV       S:?b0, #0xd0
        LD        A, #0x34
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   11     GPIO_Init(GPIOB,GPIO_Pin_3,GPIO_Mode_In_PU_No_IT);    
        MOV       S:?b0, #0x40
        LD        A, #0x8
        LDW       X, #0x5005
        JP        L:GPIO_Init
//   12 }
//   13 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   14 void W25X16_WRITE_BYTE(u8 dat)
//   15 {
W25X16_WRITE_BYTE:
        PUSH      S:?b9
        PUSH      S:?b8
        LD        S:?b9, A
//   16     u8 i;
//   17     for(i = 0;i < 8;i ++)
        MOV       S:?b8, #0x8
//   18     {
//   19         CLK_L();
??W25X16_WRITE_BYTE_0:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   20         if(dat & 0x80)
        LD        A, S:?b9
        BCP       A, #0x80
        JREQ      L:??W25X16_WRITE_BYTE_1
//   21         {
//   22             DIO_H();
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        JRA       L:??W25X16_WRITE_BYTE_2
//   23         }
//   24         else
//   25         {
//   26             DIO_L();
??W25X16_WRITE_BYTE_1:
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   27         }
//   28         CLK_H();
??W25X16_WRITE_BYTE_2:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   29         dat <<= 1;
        LD        A, S:?b9
        SLL       A
        LD        S:?b9, A
//   30     }  
        LD        A, S:?b8
        DEC       A
        LD        S:?b8, A
        JRNE      L:??W25X16_WRITE_BYTE_0
//   31 }
        POP       S:?b8
        POP       S:?b9
        RET
//   32 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   33 u8 W25X16_READ_BYTE(void)
//   34 {
W25X16_READ_BYTE:
        PUSH      S:?b9
        PUSH      S:?b8
//   35     u8 temp = 0,i;
        CLR       S:?b9
//   36     
//   37     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   38     for(i = 0;i < 8;i ++)
        MOV       S:?b8, #0x8
//   39     {
//   40         temp <<= 1;
??W25X16_READ_BYTE_0:
        LD        A, S:?b9
        SLL       A
        LD        S:?b9, A
//   41         CLK_L();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   42         if(DO_READ())
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_ReadInputDataBit
        CP        A, #0x0
        JREQ      L:??W25X16_READ_BYTE_1
//   43         {
//   44             temp |= 1;
        LD        A, S:?b9
        OR        A, #0x1
        LD        S:?b9, A
//   45         }
//   46         CLK_H();
??W25X16_READ_BYTE_1:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   47     }
        LD        A, S:?b8
        DEC       A
        LD        S:?b8, A
        JRNE      L:??W25X16_READ_BYTE_0
//   48     return temp;
        LD        A, S:?b9
        POP       S:?b8
        POP       S:?b9
        RET
//   49 }
//   50 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51 void W25X16_WRITE_DISABLE(void)
//   52 {
//   53     CLK_H();
W25X16_WRITE_DISABLE:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   54     CS_L();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   55     W25X16_WRITE_BYTE(0x04);
        LD        A, #0x4
        CALL      L:W25X16_WRITE_BYTE
//   56     CS_H();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   57     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        JP        L:GPIO_SetBits
//   58 }
//   59 
//   60 
//   61 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   62 void W25X16_WRITE_ENABLE(void)
//   63 {
//   64     CLK_H();
W25X16_WRITE_ENABLE:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   65     CS_L();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   66     W25X16_WRITE_BYTE(0x06);
        LD        A, #0x6
        CALL      L:W25X16_WRITE_BYTE
//   67     CS_H();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   68     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        JP        L:GPIO_SetBits
//   69 }
//   70 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   71 u8 W25X16_READ_STATUS(void)
//   72 {
W25X16_READ_STATUS:
        PUSH      S:?b8
//   73     u8 temp = 0;
//   74     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   75     CS_L();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//   76     W25X16_WRITE_BYTE(0x05);
        LD        A, #0x5
        CALL      L:W25X16_WRITE_BYTE
//   77     temp = W25X16_READ_BYTE();
        CALL      L:W25X16_READ_BYTE
        LD        S:?b8, A
//   78     CS_H();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   79     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   80     return temp;
        LD        A, S:?b8
        POP       S:?b8
        RET
//   81 }
//   82 
//   83 
//   84 /*************************************************
//   85 返回值temp = 0：不忙
//   86       temp = 1：忙
//   87 *************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   88 u8 W25X16_CHECK_BUSY(void)
//   89 {
W25X16_CHECK_BUSY:
        PUSH      S:?b8
//   90     u8 temp;
//   91     temp = W25X16_READ_STATUS();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, #0x5
        CALL      L:W25X16_WRITE_BYTE
        CALL      L:W25X16_READ_BYTE
        LD        S:?b8, A
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//   92     temp &= 0x01;
//   93     return temp;
        LD        A, S:?b8
        AND       A, #0x1
        POP       S:?b8
        RET
//   94 }
//   95 
//   96 
//   97 /*************************************************
//   98 num <256
//   99 *************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  100 void W25X16_READ_DATA(u32 addr,u8 num)
//  101 {
W25X16_READ_DATA:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        PUSH      S:?b13
        PUSH      S:?b12
        MOV       S:?b11, S:?b3
        MOV       S:?b10, S:?b2
        MOV       S:?b9, S:?b1
        LD        S:?b12, A
//  102     u8 addr1,addr2,addr3,i;
//  103     while(W25X16_CHECK_BUSY());            //忙等待
??W25X16_READ_DATA_0:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, #0x5
        CALL      L:W25X16_WRITE_BYTE
        CALL      L:W25X16_READ_BYTE
        LD        S:?b13, A
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, S:?b13
        BCP       A, #0x1
        JRNE      L:??W25X16_READ_DATA_0
//  104     addr3 = addr & 0xff;
        MOV       S:?b13, S:?b11
//  105     addr >>= 8;
        MOV       S:?b2, S:?b10
        MOV       S:?b1, S:?b9
        MOV       S:?b3, S:?b2
        MOV       S:?b2, S:?b1
        MOV       S:?b11, S:?b3
        MOV       S:?b10, S:?b2
//  106     addr2 = addr & 0xff;
//  107     addr >>= 8;
//  108     addr1 = addr;
//  109     
//  110     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  111     CS_L();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//  112     W25X16_WRITE_BYTE(0x03);
        LD        A, #0x3
        CALL      L:W25X16_WRITE_BYTE
//  113     W25X16_WRITE_BYTE(addr1);
        LDW       X, S:?w5
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        CALL      L:W25X16_WRITE_BYTE
//  114     W25X16_WRITE_BYTE(addr2);
        LD        A, S:?b11
        CALL      L:W25X16_WRITE_BYTE
//  115     W25X16_WRITE_BYTE(addr3);
        LD        A, S:?b13
        CALL      L:W25X16_WRITE_BYTE
//  116     
//  117     for(i = 0;i < num;i ++)
        TNZ       S:?b12
        JREQ      L:??W25X16_READ_DATA_1
        LDW       X, #W25X16_READ_BUF
        LDW       S:?w4, X
//  118     {
//  119         W25X16_READ_BUF[i] = W25X16_READ_BYTE();
??W25X16_READ_DATA_2:
        CLR       S:?b10
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        MOV       S:?b11, #0x8
??W25X16_READ_DATA_3:
        LD        A, S:?b10
        SLL       A
        LD        S:?b10, A
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, #0x8
        LDW       X, #0x5005
        CALL      L:GPIO_ReadInputDataBit
        CP        A, #0x0
        JREQ      L:??W25X16_READ_DATA_4
        LD        A, S:?b10
        OR        A, #0x1
        LD        S:?b10, A
??W25X16_READ_DATA_4:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, S:?b11
        DEC       A
        LD        S:?b11, A
        JRNE      L:??W25X16_READ_DATA_3
//  120     }
        LD        A, S:?b10
        LD        [S:?w4.w], A
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        LD        A, S:?b12
        DEC       A
        LD        S:?b12, A
        JRNE      L:??W25X16_READ_DATA_2
//  121     CS_H();
??W25X16_READ_DATA_1:
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  122     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  123 }
        POP       S:?b12
        POP       S:?b13
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET
//  124 
//  125 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  126 void W25X16_WRITE_DATA(u32 addr,u8 num)
//  127 {
W25X16_WRITE_DATA:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        PUSH      S:?b13
        PUSH      S:?b12
        MOV       S:?b11, S:?b3
        MOV       S:?b10, S:?b2
        MOV       S:?b9, S:?b1
        LD        S:?b12, A
//  128     u8 addr1,addr2,addr3,i;
//  129     while(W25X16_CHECK_BUSY());
??W25X16_WRITE_DATA_0:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, #0x5
        CALL      L:W25X16_WRITE_BYTE
        CALL      L:W25X16_READ_BYTE
        LD        S:?b13, A
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, S:?b13
        BCP       A, #0x1
        JRNE      L:??W25X16_WRITE_DATA_0
//  130     W25X16_WRITE_ENABLE();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, #0x6
        CALL      L:W25X16_WRITE_BYTE
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  131     addr3 = addr & 0xff;
        MOV       S:?b13, S:?b11
//  132     addr >>= 8;
        MOV       S:?b2, S:?b10
        MOV       S:?b1, S:?b9
        MOV       S:?b3, S:?b2
        MOV       S:?b2, S:?b1
        MOV       S:?b11, S:?b3
        MOV       S:?b10, S:?b2
//  133     addr2 = addr & 0xff;
//  134     addr >>= 8;
//  135     addr1 = addr;
//  136     
//  137     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  138     CS_L();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
//  139     W25X16_WRITE_BYTE(0x02);
        LD        A, #0x2
        CALL      L:W25X16_WRITE_BYTE
//  140     W25X16_WRITE_BYTE(addr1);
        LDW       X, S:?w5
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        CALL      L:W25X16_WRITE_BYTE
//  141     W25X16_WRITE_BYTE(addr2);
        LD        A, S:?b11
        CALL      L:W25X16_WRITE_BYTE
//  142     W25X16_WRITE_BYTE(addr3);
        MOV       S:?b8, #0x8
??W25X16_WRITE_DATA_1:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, S:?b13
        BCP       A, #0x80
        JREQ      L:??W25X16_WRITE_DATA_2
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        JRA       L:??W25X16_WRITE_DATA_3
??W25X16_WRITE_DATA_2:
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
??W25X16_WRITE_DATA_3:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, S:?b13
        SLL       A
        LD        S:?b13, A
        LD        A, S:?b8
        DEC       A
        LD        S:?b8, A
        JRNE      L:??W25X16_WRITE_DATA_1
//  143     
//  144     for(i = 0;i < num;i ++)
        TNZ       S:?b12
        JREQ      L:??W25X16_WRITE_DATA_4
        LDW       X, #W25X16_SEND_BUF
        LDW       S:?w4, X
//  145     {
//  146         W25X16_WRITE_BYTE(W25X16_SEND_BUF[i]);
??W25X16_WRITE_DATA_5:
        LD        A, [S:?w4.w]
        LD        S:?b11, A
        MOV       S:?b10, #0x8
??W25X16_WRITE_DATA_6:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
        LD        A, S:?b11
        BCP       A, #0x80
        JREQ      L:??W25X16_WRITE_DATA_7
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        JRA       L:??W25X16_WRITE_DATA_8
??W25X16_WRITE_DATA_7:
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_ResetBits
??W25X16_WRITE_DATA_8:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
        LD        A, S:?b11
        SLL       A
        LD        S:?b11, A
        LD        A, S:?b10
        DEC       A
        LD        S:?b10, A
        JRNE      L:??W25X16_WRITE_DATA_6
//  147     }
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        LD        A, S:?b12
        DEC       A
        LD        S:?b12, A
        JRNE      L:??W25X16_WRITE_DATA_5
//  148     CS_H();
??W25X16_WRITE_DATA_4:
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  149     CLK_H();
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_SetBits
//  150 }
        POP       S:?b12
        POP       S:?b13
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  151 #endif
// 
// 500 bytes in section .near.bss
// 960 bytes in section .near_func.text
// 
// 960 bytes of CODE memory
// 500 bytes of DATA memory
//
//Errors: none
//Warnings: none
