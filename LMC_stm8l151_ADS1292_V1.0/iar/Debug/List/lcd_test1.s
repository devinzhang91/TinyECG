///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Mar/2011  18:17:06 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l15x_io\main\lcd_test1.c                  /
//    Command line =  E:\HWT\io\stm8l15x_io\main\lcd_test1.c -e -Ohs          /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o E:\HWT\io\stm8l15x_io\iar\Debug\ /
//                    Obj\ --dlib_config "D:\Program Files\IAR                /
//                    Systems\Embedded Workbench 6.0                          /
//                    Evaluation\stm8\LIB\dlstm8smn.h" -lB                    /
//                    E:\HWT\io\stm8l15x_io\iar\Debug\List\ -I                /
//                    E:\HWT\io\stm8l15x_io\iar\..\main\ -I                   /
//                    E:\HWT\io\stm8l15x_io\iar\..\fwlib\inc\ -I              /
//                    E:\HWT\io\stm8l15x_io\iar\..\periph\ -I                 /
//                    E:\HWT\io\stm8l15x_io\iar\..\utility\ --vregs 16        /
//    List file    =  E:\HWT\io\stm8l15x_io\iar\Debug\List\lcd_test1.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME lcd_test1

        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?w4
        EXTERN LCD_DispNumber
        EXTERN LCD_Open
        EXTERN delay

        PUBLIC main

// E:\HWT\io\stm8l15x_io\main\lcd_test1.c
//    1 #include "stm8l15x.h"
//    2 #include "uni_int.h"
//    3 #include "delay.h"
//    4 #include "periph_lcd.h"
//    5 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    6 int main()
//    7 {  
main:
        PUSH      L:?b9
        PUSH      L:?b8
//    8    LCD_Open();
        CALL      L:LCD_Open
//    9    
//   10   uint16 num=100;
        LDW       X, #0x64
        LDW       S:?w4, X
//   11    
//   12     while(1)
//   13     {          
//   14          num--;
??main_0:
        LDW       X, S:?w4
        DECW      X
        LDW       S:?w4, X
//   15          LCD_DispNumber(num,LCD_CHAR_OFF);
        LD        A, #0x10
        CALL      L:LCD_DispNumber
//   16          delay();                              
        CALL      L:delay
        JRA       L:??main_0
//   17     }
//   18 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 29 bytes in section .near_func.text
// 
// 29 bytes of CODE memory
//
//Errors: none
//Warnings: none
