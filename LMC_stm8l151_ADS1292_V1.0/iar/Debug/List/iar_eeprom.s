///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.41.1.50116 for STM8            04/Jan/2015  14:46:04 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  G:\stm8\stm8l资料\stm8l152_demo\periph\iar_eeprom.c     /
//    Command line =  G:\stm8\stm8l资料\stm8l152_demo\periph\iar_eeprom.c -e  /
//                    -Ohs --no_cross_call --debug --code_model small         /
//                    --data_model medium -o G:\stm8\stm8l资料\stm8l152_demo\ /
//                    iar\Debug\Obj\ --dlib_config "C:\Program Files          /
//                    (x86)\IAR Systems\Embedded Workbench                    /
//                    6.5\stm8\LIB\dlstm8smn.h" -D STM8L15X_MDP -lB           /
//                    G:\stm8\stm8l资料\stm8l152_demo\iar\Debug\List\ -I      /
//                    G:\stm8\stm8l资料\stm8l152_demo\iar\..\main\ -I         /
//                    G:\stm8\stm8l资料\stm8l152_demo\iar\..\fwlib\inc\ -I    /
//                    G:\stm8\stm8l资料\stm8l152_demo\iar\..\periph\ -I       /
//                    G:\stm8\stm8l资料\stm8l152_demo\iar\..\utility\         /
//                    --vregs 16                                              /
//    List file    =  G:\stm8\stm8l资料\stm8l152_demo\iar\Debug\List\iar_eepr /
//                    om.s                                                    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME iar_eeprom

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN FLASH_Lock
        EXTERN FLASH_ProgramByte
        EXTERN FLASH_Unlock
        EXTERN FLASH_WaitForLastOperation

        PUBLIC __eeprom_write_16
        PUBLIC __eeprom_write_32
        PUBLIC __eeprom_write_8
        PUBLIC __eeprom_write_many

// G:\stm8\stm8l资料\stm8l152_demo\periph\iar_eeprom.c
//    1 #include "stm8l15x_conf.h" 
//    2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//    3 void __eeprom_write_8(unsigned short addr_eep,unsigned char data) 
//    4 { 
__eeprom_write_8:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        LDW       S:?w5, X
        LD        S:?b8, A
//    5   FLASH_WaitForLastOperation(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//    6   FLASH_Unlock(FLASH_MemType_Data); 
        LD        A, #0xf7
        CALL      L:FLASH_Unlock
//    7    
//    8   FLASH_ProgramByte(addr_eep, data);  
        LD        A, S:?b8
        CLRW      X
        LDW       S:?w4, X
        MOV       S:?b3, S:?b11
        MOV       S:?b2, S:?b10
        MOV       S:?b1, S:?b9
        MOV       S:?b0, S:?b8
        CALL      L:FLASH_ProgramByte
//    9    
//   10   FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   11   FLASH_Lock(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_Lock
//   12 } 
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET
//   13 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   14 void __eeprom_write_16(unsigned short addr_eep,unsigned short data) 
//   15 { 
__eeprom_write_16:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        LDW       S:?w5, X
        LDW       S:?w4, Y
//   16   FLASH_WaitForLastOperation(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   17   FLASH_Unlock(FLASH_MemType_Data); 
        LD        A, #0xf7
        CALL      L:FLASH_Unlock
//   18    
//   19   FLASH_ProgramByte(addr_eep,   data/256);  
        LDW       X, S:?w4
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        MOV       S:?b3, S:?b11
        MOV       S:?b2, S:?b10
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   20   FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   21    
//   22   FLASH_ProgramByte(addr_eep+1, data%256); 
        LD        A, S:?b9
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   23   FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   24    
//   25   FLASH_Lock(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_Lock
//   26 } 
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET
//   27 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   28 void __eeprom_write_32(unsigned short addr_eep,unsigned long data) 
//   29 { 
__eeprom_write_32:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        PUSH      S:?b13
        PUSH      S:?b12
        LDW       S:?w6, X
        MOV       S:?b11, S:?b3
        MOV       S:?b10, S:?b2
        MOV       S:?b9, S:?b1
        MOV       S:?b8, S:?b0
//   30   FLASH_WaitForLastOperation(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   31   FLASH_Unlock(FLASH_MemType_Data); 
        LD        A, #0xf7
        CALL      L:FLASH_Unlock
//   32    
//   33   FLASH_ProgramByte(addr_eep,   (unsigned char)(data>>24));  
        MOV       S:?b0, S:?b8
        MOV       S:?b3, S:?b0
        LD        A, S:?b3
        MOV       S:?b3, S:?b13
        MOV       S:?b2, S:?b12
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   34   FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   35    
//   36   FLASH_ProgramByte(addr_eep+1, (unsigned char)(data>>16)); 
        MOV       S:?b1, S:?b9
        MOV       S:?b3, S:?b1
        LD        A, S:?b3
        LDW       X, S:?w6
        INCW      X
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   37   FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   38    
//   39   FLASH_ProgramByte(addr_eep+2,   (unsigned char)(data>>8));  
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
        LDW       X, S:?w6
        ADDW      X, #0x2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   40   FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   41    
//   42   FLASH_ProgramByte(addr_eep+3, (unsigned char)(data>>0)); 
        LD        A, S:?b11
        LDW       X, S:?w6
        ADDW      X, #0x3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   43   FLASH_WaitForLastOperation(FLASH_MemType_Data); 
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   44    
//   45   FLASH_Lock(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_Lock
//   46 } 
        POP       S:?b12
        POP       S:?b13
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET
//   47 
//   48 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   49 void __eeprom_write_many(unsigned short addr_eep,unsigned short size,unsigned short dummy,unsigned short addr_ram) 
//   50 {   
__eeprom_write_many:
        PUSH      S:?b11
        PUSH      S:?b10
        PUSH      S:?b9
        PUSH      S:?b8
        PUSH      S:?b15
        PUSH      S:?b14
        PUSH      S:?b13
        PUSH      S:?b12
        LDW       S:?w7, X
        LDW       S:?w6, Y
        MOV       S:?b11, S:?b3
        MOV       S:?b10, S:?b2
//   51   FLASH_WaitForLastOperation(FLASH_MemType_Data);   
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   52   FLASH_Unlock(FLASH_MemType_Data); 
        LD        A, #0xf7
        CALL      L:FLASH_Unlock
//   53    
//   54   for(unsigned short i=0;i<size;i++) 
        CLR       S:?b9
        CLR       S:?b8
        LDW       X, S:?w6
        JREQ      L:??__eeprom_write_many_0
//   55   { 
//   56      FLASH_ProgramByte(addr_eep+i,   *((unsigned char *)(addr_ram)+i));  
??__eeprom_write_many_1:
        LD        A, [S:?w5.w]
        LDW       X, S:?w4
        ADDW      X, S:?w7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:FLASH_ProgramByte
//   57      FLASH_WaitForLastOperation(FLASH_MemType_Data);  
        LD        A, #0xf7
        CALL      L:FLASH_WaitForLastOperation
//   58   } 
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        CPW       X, S:?w6
        JRC       L:??__eeprom_write_many_1
//   59      
//   60   FLASH_Lock(FLASH_MemType_Data);     
??__eeprom_write_many_0:
        LD        A, #0xf7
        CALL      L:FLASH_Lock
//   61 } 
        POP       S:?b12
        POP       S:?b13
        POP       S:?b14
        POP       S:?b15
        POP       S:?b8
        POP       S:?b9
        POP       S:?b10
        POP       S:?b11
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 445 bytes in section .near_func.text
// 
// 445 bytes of CODE memory
//
//Errors: none
//Warnings: none
