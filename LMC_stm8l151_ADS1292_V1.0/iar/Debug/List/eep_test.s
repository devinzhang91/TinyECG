///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      26/Mar/2011  20:54:20 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l152_demo\main\eep_test.c                 /
//    Command line =  E:\HWT\io\stm8l152_demo\main\eep_test.c -e -Ohs         /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o E:\HWT\io\stm8l152_demo\iar\Debu /
//                    g\Obj\ --dlib_config "D:\Program Files\IAR              /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB    /
//                    E:\HWT\io\stm8l152_demo\iar\Debug\List\ -I              /
//                    E:\HWT\io\stm8l152_demo\iar\..\main\ -I                 /
//                    E:\HWT\io\stm8l152_demo\iar\..\fwlib\inc\ -I            /
//                    E:\HWT\io\stm8l152_demo\iar\..\periph\ -I               /
//                    E:\HWT\io\stm8l152_demo\iar\..\utility\ --vregs 16      /
//    List file    =  E:\HWT\io\stm8l152_demo\iar\Debug\List\eep_test.s       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME eep_test

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?load32_l0_0x
        EXTERN ?w0
        EXTERN ?w1
        EXTERN __eeprom_write_16
        EXTERN __eeprom_write_32
        EXTERN __eeprom_write_8

        PUBLIC eep_u16
        PUBLIC eep_u32
        PUBLIC eep_u8
        PUBLIC main
        PUBLIC ram_u16
        PUBLIC ram_u32
        PUBLIC ram_u8


        SECTION `.eeprom.noinit`:DATA:REORDER:NOROOT(0)
// E:\HWT\io\stm8l152_demo\main\eep_test.c
//    1 volatile __eeprom __no_init char  eep_u8;
eep_u8:
        DS8 1

        SECTION `.eeprom.noinit`:DATA:REORDER:NOROOT(0)
//    2 volatile __eeprom __no_init short eep_u16;
eep_u16:
        DS8 2

        SECTION `.eeprom.noinit`:DATA:REORDER:NOROOT(0)
//    3 volatile __eeprom __no_init long  eep_u32;
eep_u32:
        DS8 4
//    4 

        SECTION `.near.noinit`:DATA:REORDER:NOROOT(0)
//    5 volatile  __no_init char  ram_u8;
ram_u8:
        DS8 1

        SECTION `.near.noinit`:DATA:REORDER:NOROOT(0)
//    6 volatile  __no_init short  ram_u16;
ram_u16:
        DS8 2

        SECTION `.near.noinit`:DATA:REORDER:NOROOT(0)
//    7 volatile  __no_init long  ram_u32;
ram_u32:
        DS8 4
//    8 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    9 void main( void )
//   10 {
//   11   eep_u8=123;
main:
        LD        A, #0x7b
        LDW       X, #eep_u8
        CALL      L:__eeprom_write_8
//   12   eep_u16=12345;
        LDW       Y, #0x3039
        LDW       X, #eep_u16
        CALL      L:__eeprom_write_16
//   13   eep_u32=123456789;
        LDW       X, #0xcd15
        LDW       S:?w1, X
        LDW       X, #0x75b
        LDW       S:?w0, X
        LDW       X, #eep_u32
        CALL      L:__eeprom_write_32
//   14   
//   15   ram_u8=eep_u8;
        LD        A, L:eep_u8
        LD        L:ram_u8, A
//   16   ram_u16=eep_u16;
        LDW       X, L:eep_u16
        LDW       L:ram_u16, X
//   17   ram_u32=eep_u32;
        LDW       X, #eep_u32
        CALL      L:?load32_l0_0x
        MOV       L:ram_u32, S:?b0
        MOV       L:ram_u32 + 1, S:?b1
        MOV       L:ram_u32 + 2, S:?b2
        MOV       L:ram_u32 + 3, S:?b3
//   18     
//   19   while(1);
??main_0:
        JRA       L:??main_0
//   20 
//   21 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//  7 bytes in section .eeprom.noinit
//  7 bytes in section .near.noinit
// 74 bytes in section .near_func.text
// 
// 74 bytes of CODE memory
// 14 bytes of DATA memory
//
//Errors: none
//Warnings: none
