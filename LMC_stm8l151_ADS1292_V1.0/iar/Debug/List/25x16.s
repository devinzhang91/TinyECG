///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.41.1.50116 for STM8            25/Feb/2015  12:19:17 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  G:\QQQ\17-lcm-wx2516\main\25x16.c                       /
//    Command line =  G:\QQQ\17-lcm-wx2516\main\25x16.c -e -Ohs               /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o G:\QQQ\17-lcm-wx2516\iar\Debug\O /
//                    bj\ --dlib_config "C:\Program Files (x86)\IAR           /
//                    Systems\Embedded Workbench 6.5\stm8\LIB\dlstm8smn.h"    /
//                    -D STM8L15X_MDP -lB G:\QQQ\17-lcm-wx2516\iar\Debug\List /
//                    \ -I G:\QQQ\17-lcm-wx2516\iar\..\main\ -I               /
//                    G:\QQQ\17-lcm-wx2516\iar\..\fwlib\inc\ -I               /
//                    G:\QQQ\17-lcm-wx2516\iar\..\periph\ -I                  /
//                    G:\QQQ\17-lcm-wx2516\iar\..\utility\ --vregs 16         /
//    List file    =  G:\QQQ\17-lcm-wx2516\iar\Debug\List\25x16.s             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME 25x16



        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// G:\QQQ\17-lcm-wx2516\main\25x16.c
//    1 #ifndef 25X16_C
//    2 #define 25X16_C
//    3 #include "25x16.h"
//    4 #include "discover_board.h"
//    5 
//    6 void W25X16_INIT(void)
//    7 {
//    8     GPIO_Init(GPIOB,GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_5,GPIO_Mode_Out_PP_High_Slow);
//    9     GPIO_Init(GPIOB,GPIO_Pin_3,GPIO_Mode_In_PU_No_IT);    
//   10 }
//   11 
//   12 void W25X16_WRITE_BYTE(u8 dat)
//   13 {
//   14     u8 i;
//   15     for(i = 0;i < 8;i ++)
//   16     {
//   17         CLK_L();
//   18         if(dat & 0x80)
//   19         {
//   20             DIO_H();
//   21         }
//   22         else
//   23         {
//   24             DIO_L();
//   25         }
//   26         CLK_H();
//   27         dat <<= 1;
//   28     }  
//   29 }
//   30 
//   31 u8 W25X16_READ_BYTE(void)
//   32 {
//   33     u8 temp = 0,i;
//   34     
//   35     CLK_H();
//   36     for(i = 0;i < 8;i ++)
//   37     {
//   38         temp <<= 1;
//   39         CLK_L();
//   40         if(DO_READ())
//   41         {
//   42             temp |= 1;
//   43         }
//   44         CLK_H();
//   45     }
//   46     return temp;
//   47 }
//   48 
//   49 void W25X16_WRITE_DISABLE(void)
//   50 {
//   51     CLK_H();
//   52     CS_L();
//   53     W25X16_WRITE_BYTE(0x04);
//   54     CS_H();
//   55     CLK_H();
//   56 }
//   57 
//   58 
//   59 
//   60 void W25X16_WRITE_ENABLE(void)
//   61 {
//   62     CLK_H();
//   63     CS_L();
//   64     W25X16_WRITE_BYTE(0x06);
//   65     CS_H();
//   66     CLK_H();
//   67 }
//   68 
//   69 u8 W25X16_READ_STATUS(void)
//   70 {
//   71     u8 temp = 0;
//   72     CLK_H();
//   73     CS_L();
//   74     W25X16_WRITE_BYTE(0x05);
//   75     temp = W25X16_READ_BYTE();
//   76     CS_H();
//   77     CLK_H();
//   78     return temp;
//   79 }
//   80 
//   81 
//   82 /*************************************************
//   83 返回值temp = 0：不忙
//   84       temp = 1：忙
//   85 *************************************************/
//   86 u8 W25X16_CHECK_BUSY(void)
//   87 {
//   88     u8 temp;
//   89     temp = W25X16_READ_STATUS();
//   90     temp &= 0x01;
//   91     return temp;
//   92 }
//   93 
//   94 
//   95 /*************************************************
//   96 num <256
//   97 *************************************************/
//   98 void W25X16_READ_DATA(u32 addr,u8 num)
//   99 {
//  100     u8 addr1,addr2,addr3,i;
//  101     while(W25X16_CHECK_BUSY());            //忙等待
//  102     addr3 = addr & 0xff;
//  103     addr >>= 8;
//  104     addr2 = addr & 0xff;
//  105     addr >>= 8;
//  106     addr1 = addr;
//  107     
//  108     CLK_H();
//  109     CS_L();
//  110     W25X16_WRITE_BYTE(0x03);
//  111     W25X16_WRITE_BYTE(addr1);
//  112     W25X16_WRITE_BYTE(addr2);
//  113     W25X16_WRITE_BYTE(addr3);
//  114     
//  115     for(i = 0;i < num;i ++)
//  116     {
//  117         W25X16_READ_BUF[i] = W25X16_READ_BYTE();
//  118     }
//  119     CS_H();
//  120     CLK_H();
//  121 }
//  122 
//  123 
//  124 void W25X16_WRITE_DATA(u32 addr,u8 num)
//  125 {
//  126     u8 addr1,addr2,addr3,i;
//  127     while(W25X16_CHECK_BUSY());
//  128     W25X16_WRITE_ENABLE();
//  129     addr3 = addr & 0xff;
//  130     addr >>= 8;
//  131     addr2 = addr & 0xff;
//  132     addr >>= 8;
//  133     addr1 = addr;
//  134     
//  135     CLK_H();
//  136     CS_L();
//  137     W25X16_WRITE_BYTE(0x02);
//  138     W25X16_WRITE_BYTE(addr1);
//  139     W25X16_WRITE_BYTE(addr2);
//  140     W25X16_WRITE_BYTE(addr3);
//  141     
//  142     for(i = 0;i < num;i ++)
//  143     {
//  144         W25X16_WRITE_BYTE(W25X16_SEND_BUF[i]);
//  145     }
//  146     CS_H();
//  147     CLK_H();
//  148 }
//  149 #endif
// 
//
// 
//
//
//Errors: none
//Warnings: 1
