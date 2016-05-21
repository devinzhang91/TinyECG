///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            10/Jan/2016  16:35:46 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  D:\workspace\STM8\stm8l152_LCM\periph\periph_lcd.c      /
//    Command line =  D:\workspace\STM8\stm8l152_LCM\periph\periph_lcd.c -e   /
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
//    List file    =  D:\workspace\STM8\stm8l152_LCM\iar\Debug\List\periph_lc /
//                    d.s                                                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME periph_lcd

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?move1616_v_x_y_a
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN CLK_PeripheralClockConfig
        EXTERN CLK_RTCClockConfig
        EXTERN LCD_Cmd
        EXTERN LCD_ContrastConfig
        EXTERN LCD_DeadTimeConfig
        EXTERN LCD_Init
        EXTERN LCD_PortMaskConfig
        EXTERN LCD_PulseOnDurationConfig
        EXTERN bit_arry_clr_bit
        EXTERN bit_arry_set_bit
        EXTERN u16_to_bcd_5

        PUBLIC LCD_CODE_TAB
        PUBLIC LCD_CODE_TAB_DOT
        PUBLIC LCD_DispCharOnIndex
        PUBLIC LCD_DispOffOnAllIndex
        PUBLIC LCD_DispOffOnIndex
        PUBLIC LCD_DispUint16
        PUBLIC LCD_Open

// D:\workspace\STM8\stm8l152_LCM\periph\periph_lcd.c
//    1 #include "periph_lcd.h"
//    2 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//    3 lcd_code_item_t LCD_CODE_TAB[]=
LCD_CODE_TAB:
        DC8 123, 40, 94, 110, 45, 103, 119, 42, 127, 111, 0, 0, 0, 0, 0, 0, 0
//    4 {              
//    5   [LCD_CHAR_0]  ={.COM0_L=1,.COM0_H=1,.COM1_L=0,.COM1_H=1,.COM2_L=1,.COM2_H=1,.COM3_L=1,.COM3_H=0,},//0
//    6   [LCD_CHAR_1]  ={.COM0_L=0,.COM0_H=0,.COM1_L=0,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=0,.COM3_H=0,},//1
//    7   [LCD_CHAR_2]  ={.COM0_L=0,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=1,.COM2_H=0,.COM3_L=1,.COM3_H=0,},//2
//    8   [LCD_CHAR_3]  ={.COM0_L=0,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=1,.COM3_H=0,},//3
//    9   [LCD_CHAR_4]  ={.COM0_L=1,.COM0_H=0,.COM1_L=1,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=0,.COM3_H=0,},//4
//   10   [LCD_CHAR_5]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=0,.COM2_L=0,.COM2_H=1,.COM3_L=1,.COM3_H=0,},//5
//   11   [LCD_CHAR_6]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=0,.COM2_L=1,.COM2_H=1,.COM3_L=1,.COM3_H=0,},//6
//   12   [LCD_CHAR_7]  ={.COM0_L=0,.COM0_H=1,.COM1_L=0,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=0,.COM3_H=0,},//7
//   13   [LCD_CHAR_8]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=1,.COM2_H=1,.COM3_L=1,.COM3_H=0,},//8
//   14   [LCD_CHAR_9]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=1,.COM3_H=0,},//9
//   15   [LCD_CHAR_OFF]={.COM0_L=0,.COM0_H=0,.COM1_L=0,.COM1_H=0,.COM2_L=0,.COM2_H=0,.COM3_L=0,.COM3_H=0,},
//   16 };
//   17 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   18 lcd_code_item_t LCD_CODE_TAB_DOT[]=
LCD_CODE_TAB_DOT:
        DC8 251, 168, 222, 238, 173, 231, 247, 170, 255, 239, 0, 0, 0, 0, 0, 0
        DC8 0
//   19 {              
//   20   [LCD_CHAR_0]  ={.COM0_L=1,.COM0_H=1,.COM1_L=0,.COM1_H=1,.COM2_L=1,.COM2_H=1,.COM3_L=1,.COM3_H=1,},//0
//   21   [LCD_CHAR_1]  ={.COM0_L=0,.COM0_H=0,.COM1_L=0,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=0,.COM3_H=1,},//1
//   22   [LCD_CHAR_2]  ={.COM0_L=0,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=1,.COM2_H=0,.COM3_L=1,.COM3_H=1,},//2
//   23   [LCD_CHAR_3]  ={.COM0_L=0,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=1,.COM3_H=1,},//3
//   24   [LCD_CHAR_4]  ={.COM0_L=1,.COM0_H=0,.COM1_L=1,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=0,.COM3_H=1,},//4
//   25   [LCD_CHAR_5]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=0,.COM2_L=0,.COM2_H=1,.COM3_L=1,.COM3_H=1,},//5
//   26   [LCD_CHAR_6]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=0,.COM2_L=1,.COM2_H=1,.COM3_L=1,.COM3_H=1,},//6
//   27   [LCD_CHAR_7]  ={.COM0_L=0,.COM0_H=1,.COM1_L=0,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=0,.COM3_H=1,},//7
//   28   [LCD_CHAR_8]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=1,.COM2_H=1,.COM3_L=1,.COM3_H=1,},//8
//   29   [LCD_CHAR_9]  ={.COM0_L=1,.COM0_H=1,.COM1_L=1,.COM1_H=1,.COM2_L=0,.COM2_H=1,.COM3_L=1,.COM3_H=1,},//9
//   30   [LCD_CHAR_OFF]={.COM0_L=0,.COM0_H=0,.COM1_L=0,.COM1_H=0,.COM2_L=0,.COM2_H=0,.COM3_L=0,.COM3_H=0,},
//   31 };
//   32 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   33 void LCD_Open(void)
//   34 {
//   35   /*
//   36   CLK_PeripheralClockConfig(CLK_Peripheral_LCD,ENABLE);
//   37   CLK_RTCClockConfig(CLK_RTCCLKSource_HSI,CLK_RTCCLKDiv_64);  
//   38   LCD_Init(LCD_Prescaler_8 ,LCD_Divider_18,LCD_Duty_1_4,LCD_Bias_1_3,LCD_VoltageSource_External);//LCD_VoltageSource_Internal,LCD_VoltageSource_External
//   39   LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xff);
//   40   LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0x01);
//   41   LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0X00); 
//   42   LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0X00);
//   43   LCD_ContrastConfig(LCD_Contrast_3V0);             
//   44   LCD_DeadTimeConfig(LCD_DeadTime_0);                 
//   45   LCD_PulseOnDurationConfig(LCD_PulseOnDuration_7);
//   46   LCD_Cmd(ENABLE);
//   47   */
//   48   
//   49   CLK_PeripheralClockConfig(CLK_Peripheral_LCD,ENABLE);
LCD_Open:
        MOV       S:?b0, #0x1
        LD        A, #0x13
        CALL      L:CLK_PeripheralClockConfig
//   50   CLK_RTCClockConfig(CLK_RTCCLKSource_HSI,CLK_RTCCLKDiv_64);  
        MOV       S:?b0, #0xc0
        LD        A, #0x2
        CALL      L:CLK_RTCClockConfig
//   51   LCD_Init(LCD_Prescaler_8 ,LCD_Divider_18,LCD_Duty_1_4,LCD_Bias_1_3,LCD_VoltageSource_External);//LCD_VoltageSource_Internal,LCD_VoltageSource_External
        MOV       S:?b3, #0x1
        CLR       S:?b2
        MOV       S:?b1, #0x6
        MOV       S:?b0, #0x2
        LD        A, #0x30
        CALL      L:LCD_Init
//   52   LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
        MOV       S:?b0, #0xff
        CLR       A
        CALL      L:LCD_PortMaskConfig
//   53   LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);
        MOV       S:?b0, #0xff
        LD        A, #0x1
        CALL      L:LCD_PortMaskConfig
//   54   LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xFF);
        MOV       S:?b0, #0xff
        LD        A, #0x2
        CALL      L:LCD_PortMaskConfig
//   55   LCD_ContrastConfig(LCD_Contrast_3V0);             
        LD        A, #0x8
        CALL      L:LCD_ContrastConfig
//   56   LCD_DeadTimeConfig(LCD_DeadTime_0);                 
        CLR       A
        CALL      L:LCD_DeadTimeConfig
//   57   LCD_PulseOnDurationConfig(LCD_PulseOnDuration_7);
        LD        A, #0xe0
        CALL      L:LCD_PulseOnDurationConfig
//   58   LCD_Cmd(ENABLE);
        LD        A, #0x1
        JP        L:LCD_Cmd
//   59 }

        SECTION `.near_func.text`:CODE:NOROOT(0)
        CODE
LCD_DispOffOnIndex:
        MOV       S:?b1, #0x4
        LD        S:?b0, A
        LD        A, #0x10
        REQUIRE LCD_DispCharOnIndex
        ;               // Fall through to label LCD_DispCharOnIndex
//   60 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   61 void LCD_DispCharOnIndex(uint8 ch, uint8 index,uint8 tod)
//   62 { uint8 lcd_code;
LCD_DispCharOnIndex:
        PUSH      S:?b9
        PUSH      S:?b8
        LD        S:?b3, A
        MOV       S:?b4, S:?b0
        MOV       S:?b2, S:?b1
//   63 if(index>=LCD_INDEX_MAX_COUNT)
        LD        A, S:?b4
        CP        A, #0x4
        JRC       ??lb_1
        JP        L:??LCD_DispCharOnIndex_0
//   64 {
//   65   return ;
//   66 }
//   67 if(index==3-tod) lcd_code=LCD_CODE_TAB_DOT[ch].Byte;  
??lb_1:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b3
        EXG       A, XL
        LDW       S:?w0, X
        EXG       A, XL
        LD        A, S:?b2
        EXG       A, XL
        LDW       S:?w1, X
        LDW       X, #0x3
        SUBW      X, S:?w1
        CLRW      Y
        EXG       A, YL
        LDW       S:?w1, Y
        CPW       X, S:?w1
        JRNE      L:??LCD_DispCharOnIndex_1
        LDW       X, S:?w0
        LD        A, (L:LCD_CODE_TAB_DOT,X)
        LD        S:?b8, A
        JRA       L:??LCD_DispCharOnIndex_2
//   68 else lcd_code=LCD_CODE_TAB[ch].Byte;
??LCD_DispCharOnIndex_1:
        LDW       X, S:?w0
        LD        A, (L:LCD_CODE_TAB,X)
        LD        S:?b8, A
//   69 
//   70 if(lcd_code & BIT_MAST_COM0_L)   
??LCD_DispCharOnIndex_2:
        LD        A, S:?b4
        SLL       A
        LD        S:?b9, A
        LD        A, S:?b8
        BCP       A, #0x1
        JREQ      L:??LCD_DispCharOnIndex_3
//   71 { 
//   72   bit_arry_set_bit((void *)LCD->RAM,28*0+index*2);  
        LD        A, S:?b9
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_4
//   73 } 
//   74 else
//   75 {
//   76   bit_arry_clr_bit((void *)LCD->RAM,28*0+index*2); 
??LCD_DispCharOnIndex_3:
        LD        A, S:?b9
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//   77 }
//   78 
//   79 if(lcd_code & BIT_MAST_COM0_H)  
??LCD_DispCharOnIndex_4:
        LD        A, S:?b9
        INC       A
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x2
        JREQ      L:??LCD_DispCharOnIndex_5
//   80 { 
//   81   bit_arry_set_bit((void *)LCD->RAM,28*0+index*2+1);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_6
//   82 } 
//   83 else
//   84 {
//   85   bit_arry_clr_bit((void *)LCD->RAM,28*0+index*2+1); 
??LCD_DispCharOnIndex_5:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//   86 }
//   87 
//   88 if(lcd_code & BIT_MAST_COM1_L) 
??LCD_DispCharOnIndex_6:
        LD        A, S:?b9
        ADD       A, #0x1c
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x4
        JREQ      L:??LCD_DispCharOnIndex_7
//   89 { 
//   90   bit_arry_set_bit((void *)LCD->RAM,28*1+index*2);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_8
//   91 } 
//   92 else
//   93 {
//   94   bit_arry_clr_bit((void *)LCD->RAM,28*1+index*2); 
??LCD_DispCharOnIndex_7:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//   95 } 
//   96 
//   97 if(lcd_code & BIT_MAST_COM1_H)  
??LCD_DispCharOnIndex_8:
        LD        A, S:?b9
        ADD       A, #0x1d
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x8
        JREQ      L:??LCD_DispCharOnIndex_9
//   98 { 
//   99   bit_arry_set_bit((void *)LCD->RAM,28*1+index*2+1);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_10
//  100 } 
//  101 else
//  102 {
//  103   bit_arry_clr_bit((void *)LCD->RAM,28*1+index*2+1); 
??LCD_DispCharOnIndex_9:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//  104 } 
//  105 
//  106 if(lcd_code & BIT_MAST_COM2_L) 
??LCD_DispCharOnIndex_10:
        LD        A, S:?b9
        ADD       A, #0x38
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x10
        JREQ      L:??LCD_DispCharOnIndex_11
//  107 { 
//  108   bit_arry_set_bit((void *)LCD->RAM,28*2+index*2);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_12
//  109 } 
//  110 else
//  111 {
//  112   bit_arry_clr_bit((void *)LCD->RAM,28*2+index*2); 
??LCD_DispCharOnIndex_11:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//  113 } 
//  114 
//  115 if(lcd_code & BIT_MAST_COM2_H)  
??LCD_DispCharOnIndex_12:
        LD        A, S:?b9
        ADD       A, #0x39
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x20
        JREQ      L:??LCD_DispCharOnIndex_13
//  116 { 
//  117   bit_arry_set_bit((void *)LCD->RAM,28*2+index*2+1);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_14
//  118 } 
//  119 else
//  120 {
//  121   bit_arry_clr_bit((void *)LCD->RAM,28*2+index*2+1); 
??LCD_DispCharOnIndex_13:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//  122 } 
//  123 
//  124 if(lcd_code & BIT_MAST_COM3_L) 
??LCD_DispCharOnIndex_14:
        LD        A, S:?b9
        ADD       A, #0x54
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x40
        JREQ      L:??LCD_DispCharOnIndex_15
//  125 { 
//  126   bit_arry_set_bit((void *)LCD->RAM,28*3+index*2);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_16
//  127 } 
//  128 else
//  129 {
//  130   bit_arry_clr_bit((void *)LCD->RAM,28*3+index*2); 
??LCD_DispCharOnIndex_15:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//  131 }   
//  132 if(lcd_code & BIT_MAST_COM3_H)  
??LCD_DispCharOnIndex_16:
        LD        A, S:?b9
        ADD       A, #0x55
        LD        S:?b0, A
        LD        A, S:?b8
        BCP       A, #0x80
        JREQ      L:??LCD_DispCharOnIndex_17
//  133 { 
//  134   bit_arry_set_bit((void *)LCD->RAM,28*3+index*2+1);  
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispCharOnIndex_0
//  135 } 
//  136 else
//  137 {
//  138   bit_arry_clr_bit((void *)LCD->RAM,28*3+index*2+1); 
??LCD_DispCharOnIndex_17:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//  139 }    
//  140 }
??LCD_DispCharOnIndex_0:
        POP       S:?b8
        POP       S:?b9
        RET
//  141 
//  142 void LCD_DispOffOnIndex(uint8 index)
//  143 {
//  144   LCD_DispCharOnIndex(LCD_CHAR_OFF,index,4);
//  145 }
//  146 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  147 void LCD_DispOffOnAllIndex(void)
//  148 {
LCD_DispOffOnAllIndex:
        PUSH      S:?b9
        PUSH      S:?b8
        PUSH      S:?b10
//  149   for(uint8 i=0;i<LCD_INDEX_MAX_COUNT;i++)
        CLR       S:?b8
        MOV       S:?b9, #0x1
//  150   {
//  151     LCD_DispCharOnIndex(LCD_CHAR_OFF,i,4);
??LCD_DispOffOnAllIndex_0:
        LD        A, L:LCD_CODE_TAB + 16
        LD        S:?b10, A
        LD        A, S:?b8
        SLL       A
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x1
        JREQ      L:??LCD_DispOffOnAllIndex_1
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_2
??LCD_DispOffOnAllIndex_1:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_2:
        LD        A, S:?b10
        BCP       A, #0x2
        JREQ      L:??LCD_DispOffOnAllIndex_3
        LD        A, S:?b9
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_4
??LCD_DispOffOnAllIndex_3:
        LD        A, S:?b9
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_4:
        LD        A, S:?b9
        ADD       A, #0x1b
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x4
        JREQ      L:??LCD_DispOffOnAllIndex_5
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_6
??LCD_DispOffOnAllIndex_5:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_6:
        LD        A, S:?b9
        ADD       A, #0x1c
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x8
        JREQ      L:??LCD_DispOffOnAllIndex_7
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_8
??LCD_DispOffOnAllIndex_7:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_8:
        LD        A, S:?b9
        ADD       A, #0x37
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x10
        JREQ      L:??LCD_DispOffOnAllIndex_9
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_10
??LCD_DispOffOnAllIndex_9:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_10:
        LD        A, S:?b9
        ADD       A, #0x38
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x20
        JREQ      L:??LCD_DispOffOnAllIndex_11
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_12
??LCD_DispOffOnAllIndex_11:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_12:
        LD        A, S:?b9
        ADD       A, #0x53
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x40
        JREQ      L:??LCD_DispOffOnAllIndex_13
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_14
??LCD_DispOffOnAllIndex_13:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
??LCD_DispOffOnAllIndex_14:
        LD        A, S:?b9
        ADD       A, #0x54
        LD        S:?b0, A
        LD        A, S:?b10
        BCP       A, #0x80
        JREQ      L:??LCD_DispOffOnAllIndex_15
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_set_bit
        JRA       L:??LCD_DispOffOnAllIndex_16
??LCD_DispOffOnAllIndex_15:
        LD        A, S:?b0
        LDW       X, #0x540c
        CALL      L:bit_arry_clr_bit
//  152   }
??LCD_DispOffOnAllIndex_16:
        LD        A, S:?b8
        INC       A
        LD        S:?b8, A
        LD        A, S:?b9
        ADD       A, #0x2
        LD        S:?b9, A
        LD        A, S:?b8
        CP        A, #0x4
        JRNC      ??lb_0
        JP        L:??LCD_DispOffOnAllIndex_0
//  153 }
??lb_0:
        POP       S:?b10
        POP       S:?b8
        POP       S:?b9
        RET
//  154 /****************************************************************************
//  155 uint16 num:要显示的数字
//  156 uint8 blank：屏蔽位
//  157 uint8 dot：小数点位数：0：显示中间冒号
//  158 1：显示十位数小数点（从右到左第2位）
//  159 2：显示百位数小数点（从右到左第3位）
//  160 3：显示千位数小数点（从右到左第4位）
//  161 >3 :不显示
//  162 ****************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  163 void LCD_DispUint16(uint16 num, uint8 blank,uint8 dot)
//  164 {
LCD_DispUint16:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        SUB       SP, #0x4
        LDW       S:?w1, X
        MOV       S:?b10, S:?b0
//  165   uint8 bcd[__MAX(4,LCD_INDEX_MAX_COUNT)]={0};
        LDW       Y, #`?<Constant {0}>`
        LDW       X, SP
        INCW      X
        PUSHW     X
        LD        A, #0x4
        CALL      L:?move1616_v_x_y_a
        POPW      X
//  166   uint8 bcd_index;
//  167   uint8 lcd_index;
//  168   uint8 index_max_count=__MAX(4,LCD_INDEX_MAX_COUNT);
//  169   
//  170   u16_to_bcd_5(num,bcd);
        LDW       Y, SP
        INCW      Y
        LDW       X, S:?w1
        CALL      L:u16_to_bcd_5
//  171   
//  172   bcd_index=index_max_count-1;
        MOV       S:?b11, #0x3
        LDW       X, SP
        ADDW      X, #0x4
        LDW       S:?w4, X
        JRA       L:??LCD_DispUint16_0
//  173   
//  174   for(;(bcd[bcd_index]==0)&&(bcd_index!=0);bcd_index--)
??LCD_DispUint16_1:
        TNZ       S:?b11
        JREQ      L:??LCD_DispUint16_2
//  175   {
//  176     lcd_index=index_max_count-1-bcd_index;   
//  177     LCD_DispCharOnIndex(LCD_CHAR_OFF,lcd_index,dot);
        MOV       S:?b1, S:?b10
        LD        A, #0x3
        SUB       A, S:?b11
        LD        S:?b0, A
        LD        A, #0x10
        CALL      L:LCD_DispCharOnIndex
//  178   }   
        LD        A, S:?b11
        DEC       A
        LD        S:?b11, A
        LDW       X, S:?w4
        DECW      X
        LDW       S:?w4, X
??LCD_DispUint16_0:
        TNZ       [S:?w4.w]
        JREQ      L:??LCD_DispUint16_1
//  179   for(;bcd_index!=0xff;bcd_index--)
        LD        A, S:?b11
        CP        A, #0xff
        JREQ      L:??LCD_DispUint16_3
//  180   {
//  181     lcd_index=index_max_count-1-bcd_index;  
//  182     LCD_DispCharOnIndex(bcd[bcd_index],lcd_index,dot);
??LCD_DispUint16_2:
        MOV       S:?b1, S:?b10
        LD        A, #0x3
        SUB       A, S:?b11
        LD        S:?b0, A
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b11
        EXG       A, YL
        LDW       X, SP
        INCW      X
        LDW       S:?w1, Y
        ADDW      X, S:?w1
        LD        A, (X)
        CALL      L:LCD_DispCharOnIndex
//  183   }   
        LD        A, S:?b11
        DEC       A
        LD        S:?b11, A
        CP        A, #0xff
        JRNE      L:??LCD_DispUint16_2
//  184   
//  185 }
??LCD_DispUint16_3:
        ADD       SP, #0x4
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {0}>`:
        DC8 0, 0, 0, 0

        END
// 
//  34 bytes in section .near.data
//   4 bytes in section .near.rodata
// 831 bytes in section .near_func.text
// 
// 831 bytes of CODE  memory
//   4 bytes of CONST memory
//  34 bytes of DATA  memory
//
//Errors: none
//Warnings: none
