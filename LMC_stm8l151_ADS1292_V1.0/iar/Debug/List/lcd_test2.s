///////////////////////////////////////////////////////////////////////////////
//                                                                            /
//                                                      22/Mar/2011  16:43:07 /
// IAR C/C++ Compiler V1.20.1.20031 [Evaluation] for STM8                     /
// Copyright 2010 IAR Systems AB.                                             /
//                                                                            /
//    Source file  =  E:\HWT\io\stm8l15x_io\main\lcd_test2.c                  /
//    Command line =  E:\HWT\io\stm8l15x_io\main\lcd_test2.c -e -Ohs          /
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
//    List file    =  E:\HWT\io\stm8l15x_io\iar\Debug\List\lcd_test2.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME lcd_test2

        EXTERN ?b0
        EXTERN LCD_DispNumOnAllIndex
        EXTERN LCD_Open
        EXTERN delay

        PUBLIC main
        PUBLIC num_tab

// E:\HWT\io\stm8l15x_io\main\lcd_test2.c
//    1 #include "stm8l15x.h"
//    2 #include "uni_int.h"
//    3 #include "delay.h"
//    4 #include "periph_lcd.h"
//    5 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//    6 uint8 num_tab[LCD_INDEX_MAX_COUNT]={0,1,2,3,4,};
num_tab:
        DC8 0, 1, 2, 3, 4
//    7 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    8 int main()
//    9 {  
//   10     LCD_Open();     
main:
        CALL      L:LCD_Open
//   11     while(1)
//   12     {   
//   13         LCD_DispNumOnAllIndex(num_tab);
??main_0:
        LDW       X, #num_tab
        CALL      L:LCD_DispNumOnAllIndex
//   14         for(uint8 i=0;i<LCD_INDEX_MAX_COUNT;i++)
        LDW       X, #num_tab
        LD        A, #0x5
        LD        S:?b0, A
//   15         {
//   16           if(++num_tab[i]>=LCD_INDEX_MAX_COUNT)
??main_1:
        LD        A, #0x1
        ADD       A, (X)
        LD        (X), A
        CP        A, #0x5
        JRC       L:??main_2
//   17           {
//   18             num_tab[i]=0;
        CLR       A
        LD        (X), A
//   19           }
//   20         }
??main_2:
        INCW      X
        LD        A, S:?b0
        ADD       A, #0xff
        LD        S:?b0, A
        CLR       A
        CP        A, S:?b0
        JRNE      L:??main_1
//   21         
//   22         delay();
        CALL      L:delay
//   23         delay();                         
        CALL      L:delay
        JRA       L:??main_0
//   24     }
//   25 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
//  5 bytes in section .near.data
// 46 bytes in section .near_func.text
// 
// 46 bytes of CODE memory
//  5 bytes of DATA memory
//
//Errors: none
//Warnings: none
