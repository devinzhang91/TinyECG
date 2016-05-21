///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            10/Jan/2016  16:00:46 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l152_LCM\utility\util_bcd.c       /
//    Command line =  D:\workspace\STM8\stm8l152_LCM\utility\util_bcd.c -e    /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o D:\workspace\STM8\stm8l152_LCM\i /
//                    ar\Debug\Obj\ --dlib_config                             /
//                    D:\IAR\stm8\LIB\dlstm8smn.h -D STM8L15X_MDP -lB         /
//                    D:\workspace\STM8\stm8l152_LCM\iar\Debug\List\ -I       /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\main\ -I          /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\fwlib\inc\ -I     /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\periph\ -I        /
//                    D:\workspace\STM8\stm8l152_LCM\iar\..\utility\ --vregs  /
//                    16                                                      /
//    List file    =  D:\workspace\STM8\stm8l152_LCM\iar\Debug\List\util_bcd. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME util_bcd

        EXTERN ?w0
        EXTERN ?w1

        PUBLIC u16_to_bcd_5

// D:\workspace\STM8\stm8l152_LCM\utility\util_bcd.c
//    1 #include "util_bcd.h"
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void u16_to_bcd_5(uint16 val_16,uint8 *bcd) 
//    4 {
u16_to_bcd_5:
        LDW       S:?w1, X
        LDW       S:?w0, Y
//    5   // uint8 temp;
//    6   // uint8 val_8;
//    7    bcd[3]=(val_16/1000);
        LDW       Y, #0x3e8
        DIVW      X, Y
        LD        A, XL
        LDW       X, S:?w0
        ADDW      X, #0x3
        LD        (X), A
//    8    bcd[2]=(val_16%1000)/100;
        LDW       Y, #0x3e8
        LDW       X, S:?w1
        DIVW      X, Y
        LDW       S:?w1, Y
        LDW       Y, #0x64
        LDW       X, S:?w1
        DIVW      X, Y
        LD        A, XL
        LDW       X, S:?w0
        ADDW      X, #0x2
        LD        (X), A
//    9    bcd[1]=((val_16%1000)%100)/10;
        LDW       Y, #0x64
        LDW       X, S:?w1
        DIVW      X, Y
        LDW       S:?w1, Y
        LDW       Y, #0xa
        LDW       X, S:?w1
        DIVW      X, Y
        LD        A, XL
        LDW       X, S:?w0
        INCW      X
        LD        (X), A
//   10    bcd[0]=((val_16%1000)%100)%10;
        LDW       Y, #0xa
        LDW       X, S:?w1
        DIVW      X, Y
        LD        A, YL
        LD        [S:?w0.w], A
//   11 
//   12 /*  
//   13    temp=0;
//   14    if( val_16>=40000 ) {temp+=4;val_16-=40000;}
//   15    if( val_16>=20000 ) {temp+=2;val_16-=20000;}   
//   16    if( val_16>=10000 ) {temp+=1;val_16-=10000;} 
//   17    bcd[4]=temp;
//   18    
//   19    temp=0;
//   20    if( val_16>=8000 ) {temp+=8;val_16-=8000;}
//   21    if( val_16>=4000 ) {temp+=4;val_16-=4000;}
//   22    if( val_16>=2000 ) {temp+=2;val_16-=2000;}   
//   23    if( val_16>=1000 ) {temp+=1;val_16-=1000;} 
//   24    bcd[3]=temp;
//   25 
//   26    temp=0;
//   27    if( val_16>=800 ) {temp+=8;val_16-=800;}
//   28    if( val_16>=400 ) {temp+=4;val_16-=400;}
//   29    if( val_16>=200 ) {temp+=2;val_16-=200;}   
//   30    if( val_16>=100 ) {temp+=1;val_16-=100;} 
//   31    bcd[2]=temp;
//   32    
//   33    val_8=val_16;
//   34    temp=0;
//   35    if(val_8>=80) {temp+=8;val_8-=80;}
//   36    if(val_8>=40) {temp+=4;val_8-=40;}
//   37    if(val_8>=20) {temp+=2;val_8-=20;}
//   38    if(val_8>=10) {temp+=1;val_8-=10;}
//   39    bcd[1]=temp;
//   40    
//   41    bcd[0]=val_8; 
//   42 */
//   43 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 76 bytes in section .near_func.text
// 
// 76 bytes of CODE memory
//
//Errors: none
//Warnings: none
