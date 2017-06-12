



//
//  main.m
//  CoreBoard
//
//  Created by AndersonHan on 16/7/8.
//  Copyright © 2016年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRS232.h"
#import "Cat9555.h"
#import "STDP4020.h"
//#import "RE_MUX.h"
#import "IA863_SimBoard.h"

int StrCmps(char *Indata, const char *Strs, int size)
{
    int i;
    int j=0;
    while(*Indata != NULL)
    {
        for(i=0;i<size;i++)
        {
            if(*(Indata+i) == *(Strs+i))
            {
                j++;
                
            }
            else
            {
                j=0;
                break;
            }
            
        }
        if(j == size)
        {
            return j;
        }
        else
        {
            Indata++;
        }
    }
    return 0;
    
}

//DP 上电时序会影响闪不闪
int main(int argc, const char * argv[]) {
    cIA863_SimBoard IA863_SimBoard;
    char *buffer;
    char i;
    int j;
    
    
    //A-eload
    buffer = (char *)IA863_SimBoard.BoardInit();
    if(StrCmps(buffer,gStringOK,4) == 0)
    {
        buffer = (char *)IA863_SimBoard.GetLogInfo();
        printf("%s", buffer);
        return -1;
    }
    buffer = (char *)IA863_SimBoard.Help();
    printf(buffer);
    buffer = (char *)IA863_SimBoard.USBA_Items(1,"SD",1);

    buffer = (char *)IA863_SimBoard.USBA_Items(1,"SD",3);
   // buffer = (char *)IA863_SimBoard.USBA_Items(1,"SD",0x03);
    //buffer = (char *)IA863_SimBoard.USBC_Items(1,"CHARGE",2);
   // if(StrCmps(buffer,gStringOK,4) == 0)
   // {
   //     buffer = (char *)IA863_SimBoard.GetLogInfo();
   //     printf("%s", buffer);
   //     return -1;
   // }
    //buffer = (char *)IA863_SimBoard.USBC_Items(3, "2.0", 1);
/*    for(i=1;i<5;i++)
    {
        //buffer = (char *)IA863_SimBoard.TypeCUsb2Switch(i,1);
        //sleep(1);
        buffer = (char *)IA863_SimBoard.CCLogicSwitch(i, 1);
        //sleep(0);
        //buffer = (char *)IA863_SimBoard.TypeCUsb2Switch(i,0);
    }
 */
    for(j=0;j<100;j++)
    {
        buffer = (char *)IA863_SimBoard.USBC_Items(3, "DP", 1);
        if(StrCmps(buffer,gStringOK,4) == 0)
        {
            return -1;
        }
        buffer = (char *)IA863_SimBoard.GetLogInfo();
        printf(buffer);
        buffer = (char *)IA863_SimBoard.USBC_Items(4, "DP", 1);
        if(StrCmps(buffer,gStringOK,4) == 0)
        {
            return -1;
        }
   //     for(i=1;i<5;i++)
   //     {
           // buffer = (char *)IA863_SimBoard.USBA_Items(i, "2.0", 1);
          //  buffer = (char *)IA863_SimBoard.USBA_Items(i, "3.0", 1);
            
    //    }

        //    buffer = (char *)IA863_SimBoard.USBC_Items(1, "2.0", 1);
/*        buffer = (char *)IA863_SimBoard.USBC_Items(2, "2.0", 1);
        if(StrCmps(buffer,gStringOK) == 0)
        {
            buffer = (char *)IA863_SimBoard.GetLogInfo();
            printf("%s", buffer);
            
            return -1;
        }
        buffer = (char *)IA863_SimBoard.USBC_Items(3, "2.0", 1);
        if(StrCmps(buffer,gStringOK) == 0)
        {
            buffer = (char *)IA863_SimBoard.GetLogInfo();
            printf("%s", buffer);
            
            return -1;
        }
        buffer = (char *)IA863_SimBoard.USBC_Items(4, "2.0", 1);
        if(StrCmps(buffer,gStringOK) == 0)
        {
            buffer = (char *)IA863_SimBoard.GetLogInfo();
            printf("%s", buffer);
            
            return -1;
        }
 
      for(i=2;i<5;i++)
        {
            buffer = (char *)IA863_SimBoard.USBC_Items(i, "2.0", 1);
            if(StrCmps(buffer,gStringOK,4) == 0)
            {
                return -1;
            }
            buffer = (char *)IA863_SimBoard.USBC_Items(i, "2.0", 0);
            if(StrCmps(buffer,gStringOK) == 0)
            {
                return -1;
            }
            buffer = (char *)IA863_SimBoard.USBC_Items(i, "2.0", 2);
            if(StrCmps(buffer,gStringOK) == 0)
            {
                return -1;
            }
*/
        }

        //buffer = (char *)IA863_SimBoard.TypeASdCardSwitch(1);
        //buffer = (char *)IA863_SimBoard.TypeASdCardSwitch(0);
        //buffer = (char *)IA863_SimBoard.USBC_Items(3,"2.0",1);
        //A-eload
        //buffer = (char *)IA863_SimBoard.USBA_Items(1, "ELOAD", 1);
       // if(StrCmps(buffer,gStringOK) == 0)
       // {
       //     return -1;
       // }
       //buffer = (char *)IA863_SimBoard.USBC_Items(1, "ELOAD", 1);
       // if(StrCmps(buffer,gStringOK,4) == 0)
       // {
       //     return -1;
       // }
        
        
        //C-eload
        //    buffer = (char *)IA863_SimBoard.CCLogicSwitch(3,1);
        //    buffer = (char *)IA863_SimBoard.CCLogicSwitch(4,0);
        //    buffer = (char *)IA863_SimBoard.TypeC_EloadSwitch(3,1);
        //    buffer = (char *)IA863_SimBoard.TypeC_EloadSwitch(3,0);
        //    buffer = (char *)IA863_SimBoard.TypeC_EloadSwitch(4,1);
        //buffer = (char *)IA863_SimBoard.TypeC_EloadSwitch(4,0);
        //buffer = (char *)IA863_SimBoard.GetLogInfo();
        //printf("%s", buffer);
    //}
     //   buffer = (char *)IA863_SimBoard.TypeAUsb3RedriverWrite(14,1);
 //   buffer = (char *)IA863_SimBoard.TypeAUsbSwitch(1,0);
 //   buffer = (char *)IA863_SimBoard.TypeAPower(1,1);
    
//    buffer = (char *)IA863_SimBoard.TypeAPower(1,0);
//    buffer = (char *)IA863_SimBoard.TypeAUsbSwitch(1,1);
//    buffer = (char *)IA863_SimBoard.TypeAPower(1,1);

  //    buffer = (char *)IA863_SimBoard.CCLogicSwitch(3,0);
//    buffer = (char *)IA863_SimBoard.DP_SBU_Switch(3,0);
//    buffer = (char *)IA863_SimBoard.TypeCUsb2Switch(3,0);
//    buffer = (char *)IA863_SimBoard.DP_Reset(3);
    
    

//    buffer = (char *)IA863_SimBoard.DP_Init(4);
//    buffer = (char *)IA863_SimBoard.DP_SBU_Switch(4,1);
//    buffer = (char *)IA863_SimBoard.TypeCUsb2Switch(4,0);
//    buffer = (char *)IA863_SimBoard.CCLogicSwitch(4,1);
//    buffer = (char *)IA863_SimBoard.DP_Status(4);
 //   buffer = (char *)IA863_SimBoard.TypeC_EloadSwitch(3,1);
    //buffer = (char *)IA863_SimBoard.DP_SendHpd(3);
    //buffer = (char *)IA863_SimBoard.DP_Init(3);
   while(1)
    {
        buffer = (char *)IA863_SimBoard.DP_SendHpd(3);
       // buffer = (char *)IA863_SimBoard.DP_SendHpd(3);
        buffer = (char *)IA863_SimBoard.DP_Status(3);
       // buffer = (char *)IA863_SimBoard.DP_Init(3);
        //buffer = (char *)IA863_SimBoard.DP_SendHpd(3);
        
        

    }
    
    while(1);
    return 0;
}
