#include "mlx90615.h"

u8 slaveaddress = 0;

void MLX90615_Init(void)
{
  IIC_SOFT_Init();
  slaveaddress = 0;
  slaveaddress = (MLX90615_Read_Byte(RROM|SA))<<1;
}

void MLX90615_Write_Byte(u8 Address, u16 Data)
{
  sIIC_Start();  
  sIIC_WriteByte(slaveaddress & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  sIIC_WriteByte(Data&0xFF);		//先发送低8位，有点奇葩
  sIIC_WaitAck();
  sIIC_WriteByte((Data>>8)&0xFF);	//发送高8位
  sIIC_WaitAck();
  sIIC_WriteByte(Data);				//发送PEC错误报告
  sIIC_WaitAck();
  sIIC_Stop();//产生一个停止条件
}

u16 MLX90615_Read_Byte(u8 Address)
{
  u8 msb=0, lsb=0, pec=0;
  u8 arr[6];		//发送的数据
  u16 data;
  
  sIIC_Start();
  sIIC_WriteByte(slaveaddress & 0xFE);   //发送写命令
  sIIC_WaitAck();
  sIIC_WriteByte(Address);//发送寄存器地址
  sIIC_WaitAck();
  
  sIIC_Start();  	 	   
  sIIC_WriteByte(slaveaddress | 0x01);   //进入接收模式
  sIIC_WaitAck();
  lsb = sIIC_ReadByte(1);	//先接收低8位
  sIIC_WaitAck();
  msb = sIIC_ReadByte(1);
  sIIC_WaitAck();
  pec = sIIC_ReadByte(0);	//接收PEC错误报告
  sIIC_Stop();//产生一个停止条件	  
  
//  arr[5]=slaveaddress;
//  arr[4]=Address;
//  arr[3]=slaveaddress;		//Load array arr 
//  arr[2]=lsb;
//  arr[1]=msb;
//  arr[0]=0;
//  if(pec == PEC_calculation(arr));	//Calculate CRC
  
  data = msb << 8 | lsb;
  
  return data;
}

u8 PEC_calculation(u8 pec[])
{
  u8 crc[6];
  u8 BitPosition=47;
  u8 shift;
  u8 i;
  u8 j;
  u8 temp;
  
  do{
    crc[5]=0;				/* Load CRC value 0x000000000107 */
    crc[4]=0;
    crc[3]=0;
    crc[2]=0;
    crc[1]=0x01;
    crc[0]=0x07;
    BitPosition=47;			/* Set maximum bit position at 47 */
    shift=0;	
    //Find first 1 in the transmited message
    i=5;					/* Set highest index */
    j=0;
    while((pec[i]&(0x80>>j))==0 && i>0){
      BitPosition--;
      if(j<7){
        j++;
      }
      else{
        j=0x00;
        i--;
      }
    }/*End of while */
    shift=BitPosition-8;	/*Get shift value for crc value*/
    //Shift crc value 
    while(shift){
      for(i=5; i<0xFF; i--){
        if((crc[i-1]&0x80) && (i>0)){
          temp=1;
        }
        else{
          temp=0;
        }
        crc[i]<<=1;
        crc[i]+=temp;
      }/*End of for*/
      shift--;
    }/*End of while*/
    //Exclusive OR between pec and crc		
    for(i=0; i<=5; i++){
      pec[i] ^=crc[i];
    }/*End of for*/
  }while(BitPosition>8);/*End of do-while*/
  return pec[0];
}/*End of PEC_calculation*/

u16 MLX90615_Read_Temp(void)
{
  u16 temp = 0;
  temp = MLX90615_Read_Byte(RRAM|TO);
  temp = temp*2-27315;
  return temp;
}



