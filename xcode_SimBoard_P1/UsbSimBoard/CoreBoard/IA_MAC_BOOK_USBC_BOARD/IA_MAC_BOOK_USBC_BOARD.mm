//
//  IA863_SimBoard.m
//  IA863_SimBoard
//
//  Created by anderson on 17/1/8.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import "IA_MAC_BOOK_USBC_BOARD.h"
#import "string.h"



//Genal Function
/*
 const char * cIA_MAC_BOOK_USBC_BOARD::LogWrite(NSString *temp)
 {
 [fh seekToEndOfFile];
 [fh writeData:[temp dataUsingEncoding:NSUTF8StringEncoding]];
 return "ok";
 }
 */

uint8_t atox(char * String)
{
    uint8_t i;
    if(strlen(String) == 2)
    {
        if((String[0] > 0x2f)&&(String[0] <0x3a))
        {
            i = (String[0]-0x30)<<4;
        }
        else if((String[0] > 0x40)&&(String[0] <0x47))
        {
            i = (String[0]-0x37)<<4;
        }
        else if((String[0] > 0x60)&&(String[0] <0x67))
        {
            i = (String[0]-0x57)<<4;
        }
        else
        {}
        if((String[1] > 0x2f)&&(String[1] <0x3a))
        {
            i += (String[1]-0x30);
        }
        else if((String[1] > 0x40)&&(String[1] <0x47))
        {
            i += (String[1]-0x37);
        }
        else if((String[1] > 0x60)&&(String[1] <0x67))
        {
            i += (String[1]-0x57);
        }
        else
        {}
    }
    else if(strlen(String) == 1)
    {
        if((String[0] > 0x2f)&&(String[0] <0x3a))
        {
            i = (String[0]-0x30);
        }
        else if((String[0] > 0x40)&&(String[0] <0x47))
        {
            i = (String[0]-0x37);
        }
        else if((String[0] > 0x60)&&(String[0] <0x67))
        {
            i = (String[0]-0x57);
        }
    }
    else
    {}
    return i;
}
int String2Char(char *InputData)
{
    char del1[]=" ";
    char * String;
    int i = 0;
    char *p = InputData;
    String = strtok(InputData,del1);
    while(String != NULL)
    {
        *p++ = (uint8_t)atox(String);
        String = strtok(NULL,del1);
        i++;
    }
    String = nullptr;
    free(String);
    return i;
}
const char *cIA_MAC_BOOK_USBC_BOARD::DP_Init(unsigned char Channel)
{
    char * buffers;
    unsigned short InitData[5][2]=
    {
        //{0x01,0x0102},{0x08,0x0000},{0x09,0x0086},{0x0A,0x0000},{0x0E,0x0041}
        //{0x01,0x0001},
        {0x01,0x0002},
        {0x08,0x0000},
        {0x09,0x00f0},
        {0x0A,0x0000},
        {0x0E,0x0000}
    };
    unsigned char i;
    for(i=0;i<5;i++)
    {
        buffers =  (char *)DP_ReceiverWrite(Channel, (uint8_t)InitData[i][0], InitData[i][1]);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    return buffers;
}
const char *cIA_MAC_BOOK_USBC_BOARD::DP_Reset(unsigned char Channel)
{
    char * buffers;
    unsigned short Hpd[2]={0x01,0x0001};
    buffers =  (char *)DP_ReceiverWrite(Channel, (uint8_t)Hpd[0], Hpd[1]);
    if(StrCmp(buffers,gStringOK,4) == 0)
    {
        return buffers;
    }
    
    return buffers;
}
const char *cIA_MAC_BOOK_USBC_BOARD::DP_SendHpd(unsigned char Channel)
{
    const char * revs;
    unsigned short Hpd[2]={0x01,0xA002};
    return DP_ReceiverWrite(Channel, (uint8_t)Hpd[0], Hpd[1]);
}

const char *cIA_MAC_BOOK_USBC_BOARD::DP_Status(unsigned char Channel)
{
    NSString *Result = @"\r\nThe ReadBack Data is:\r";
    const char *Temp;
    unsigned short BackData[5]={0x01,0x08,0x09,0x0A,0x0E};
    unsigned short InitData[8]={0x0D,0x1D,0x1E,0x1F,0x20,0x21,0x22,0x23};
    unsigned char i;
    
    for(i=0;i<5;i++)
    {
        Temp = DP_ReceiverRead(Channel, BackData[i]);
        Result = [Result stringByAppendingFormat:@"%02x:",BackData[i]];
        Result = [Result stringByAppendingString:[NSString stringWithUTF8String:Temp]];
        Result = [Result stringByAppendingString:@"\r"];
    }
    Result = @"\r\n The Read Data is :\r";
    for(i=0;i<8;i++)
    {
        Temp = DP_ReceiverRead(Channel, InitData[i]);
        Result = [Result stringByAppendingFormat:@"%02x:",InitData[i]];
        Result = [Result stringByAppendingString:[NSString stringWithUTF8String:Temp]];
        Result = [Result stringByAppendingString:@"\r"];
    }
    return [Result UTF8String];
}
const char * cIA_MAC_BOOK_USBC_BOARD::DP_ReceiverWrite(unsigned char Channel,unsigned char Address, unsigned short InData)
{
    //uint16_t IoData;
    //    IoData = IO_Read(2);
    //if((Channel > 0)&&(Channel < 5))
    //{
    //  IoData |= (0x0002<<Channel);
    //IoExpander[2].Setoutput(IoData);
    return STDP4020[Channel-1].Setoutput(Address, InData);
    //}
    //else
    //{
    //    return (char *)"Error Channel Par!";
    
    //}
}
const char * cIA_MAC_BOOK_USBC_BOARD::DP_ReceiverRead(unsigned char Channel,unsigned char Address)
{
    if((Channel > 0)&&(Channel < 5))
    {
        return STDP4020[Channel-1].GetInput(Address);
    }
    else
    {
        return (char *)"Error Channel Par!";
    }
}

//-----------------------------External Interface

cIA_MAC_BOOK_USBC_BOARD::cIA_MAC_BOOK_USBC_BOARD()
{
    LogInfo = [[NSMutableString alloc]init];
    VerInfo = [[NSMutableString alloc]init];
    [VerInfo appendString:@"Version: For Macbook V1.0\r\n\r\n"];
    
    [VerInfo appendString:@"const char * BoardInit(void)  --Init Type A and Type C Module.\r\n"];
    [VerInfo appendString:@"const char * ResetAll(void) --Reset All Type A and Type C Moldule.\r\n"];
    [VerInfo appendString:@"const char * Help(void) --Get Help Infomation.\r\n"];
    [VerInfo appendString:@"const char * GetLogInfo(void) --Get All Debug Log Infomation, Can not Slef Cleared.\r\n"];
    [VerInfo appendString:@"const char * ClearLogInfo(void) --Clear All Preversely Debug Log Infomation\r\n\r\n"];
    
}

cIA_MAC_BOOK_USBC_BOARD::~cIA_MAC_BOOK_USBC_BOARD()
{
    if (LogInfo) {
        [LogInfo release];
    }
    if (VerInfo){
        [VerInfo release];
    }
    
    //[IoData[2] release];
}
const char * cIA_MAC_BOOK_USBC_BOARD::BoardInit(char *Dev)
{
    uint8_t i,j;
    const char * ReadData;
    ReadData = CoreBoard.Open(Dev);
    if(strcmp(ReadData,"Done.") != 0)
    {
        LogWrite(@"BoardInit() Error.\r\n");
        return ReadData;
    }
    CoreBoard.SetDetectString("\r\n");
    sleep(1);
    for(i=0;i<2;i++)
    {
        STDP4020[i].SetAddress(0x73-i);
        STDP4020[i].SetI2cNumber(I2C4);
        STDP4020[i].SetSerialPort(&CoreBoard);
        
        PD_Controller[i].SetAddress(0x38|i);
        PD_Controller[i].SetI2cNumber(I2C4);
        PD_Controller[i].SetSerialPort(&CoreBoard);
    }
    
    for(i=0;i<2;i++)
    {
        STDP4020[i+2].SetAddress(0x73-i);
        STDP4020[i+2].SetI2cNumber(I2C6);
        STDP4020[i+2].SetSerialPort(&CoreBoard);
        
        PD_Controller[i+2].SetAddress(0x38|i);
        PD_Controller[i+2].SetI2cNumber(I2C6);
        PD_Controller[i+2].SetSerialPort(&CoreBoard);
        
    }
    //self test
    
    i=0;
    for(j=0;j<4;j++)
    {
    /*    ReadData=PD_Controller[j].SendCommend("GPsl","0F");
        if(StrCmp((char *)ReadData,gStringOK,4) == 0)
        {
            i++;
            LogWrite([NSString stringWithFormat:@"USBC CH%d PD Connect fail, please check connection\r\n",j+1]);
        }
        ReadData=DP_Init(j+1);
        if(StrCmp((char *)ReadData,gStringOK,4) == 0)
        {
            i++;
            LogWrite([NSString stringWithFormat:@"USBC CH%d DP Connect fail, please check connection\r\n",j+1]);
        }
*/
    
    }
    LogWrite([NSString stringWithFormat:@"Self Test Complete! Fail Count %d\r\n", i]);
    LogWrite(@"BoardInit() Done.\r\n");
    //ReadData = nullptr;
    //free(&ReadData);
    return (char *)"Items Done.";
}
/*
const char * cIA_MAC_BOOK_USBC_BOARD::ResetAll(char * Items)
{
    uint8_t i;
    char * buffers="Done";
    if((StrCmp(Items,"CH1",3) == 3)||(StrCmp(Items,"ALL",3) == 3))
    {
            usleep(100000);
            buffers=PD_Controller[i].SendCommend("GPsl","00");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                printf("USBC CH:%d Connect fail, please check connection\r\n",i+1);
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"0F\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"0F\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_1",i+1]);
            }
            usleep(100000);
            //cc flip
            buffers=PD_Controller[i].SendCommend("GPsl","01");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_2",i+1]);
            }
            usleep(100000);
            //usb2.0 flip
            buffers=PD_Controller[i].SendCommend("GPsl","02");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_3",i+1]);
            }
            usleep(100000);
            //usb2.0 device select
            buffers=PD_Controller[i].SendCommend("GPsl","03");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_4",i+1]);
            }
            usleep(100000);
            //usb2.0 en
            buffers=PD_Controller[i].SendCommend("GPsl","06");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_5",i+1]);
            }
            usleep(100000);
            //vbus to pd controller en
            buffers=PD_Controller[i].SendCommend("GPsh","0C");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_6",i+1]);
            }
            usleep(100000);
            //vbus to charge en
            buffers=PD_Controller[i].SendCommend("GPsl","0D");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"03\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"03\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_7",i+1]);
            }
            usleep(100000);
            //cc en
            buffers=PD_Controller[i].SendCommend("GPsl","0E");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_8 ",i+1]);
            }
            buffers=PD_Controller[i].SendCommend("GPsl","0F");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_8 ",i+1]);
            }
            buffers=PD_Controller[i].SendCommend("GPsh","10");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_8 ",i+1]);
            }
            buffers=PD_Controller[i].SendCommend("GPsl","11");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_8 ",i+1]);
            }
            buffers=PD_Controller[i].SendCommend("GPsh","07");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"07\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_8 ",i+1]);
            }
            
            buffers=PD_Controller[i].SendCommend("GPsl","08");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",i+1]);
                return buffers;
            }
            else
            {
                LogWrite([NSString stringWithFormat:@" CH:%d_8 ",i+1]);
            }
    }
    
    [LogInfo appendString:@"ResetAll() Done.\r\n"];
    LogWrite([NSString stringWithFormat:@"ResetAll() Done.\r\n"]);
    return buffers;
    
}

const char * cIA_MAC_BOOK_USBC_BOARD::USBC_Items(unsigned char Channel, const char * Items, unsigned char Statue) //--Channel=1,2,3,4 --Item=2.0,DP,ELOAD --Statue=0,1,2
{
    char * buffers;
    uint8_t j;
    buffers = (char *)ResetAll("USBC");
    if(StrCmp(buffers,gStringOK,4) == 0)
    {
        [LogInfo appendString:@"ResetAll() Error.\r\n"];
        LogWrite([NSString stringWithFormat:@"ResetAll() Error.\r\n"]);
        return buffers;
    }
    
    sleep(5);
    if(StrCmp("2.0",Items,3)==3)
    {
        [LogInfo appendString:@"2.0\r\n"];
        LogWrite([NSString stringWithFormat:@"2.0\r\n"]);
        if(Statue == 0)
        {
        }
        else
        {
            if(Statue == 1)
            {
                
                //cc flip
                usleep(100000);
                buffers=PD_Controller[Channel-1].SendCommend("GPsl","00");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",Channel];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",Channel]);
                    return buffers;
                }
                usleep(100000);
                //usb2.0 flip
                buffers=PD_Controller[Channel-1].SendCommend("GPsl","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel]);
                    return buffers;
                }
                
            }
            else if(Statue == 2)
            {
                //cc flip
                usleep(100000);
                buffers=PD_Controller[Channel-1].SendCommend("GPsh","00");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",Channel];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",Channel]);
                    return buffers;
                }
                usleep(100000);
                //usb2.0 flip
                buffers=PD_Controller[Channel-1].SendCommend("GPsh","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel]);
                    return buffers;
                }
            }
            usleep(100000);
            //usb2.0 en
            buffers=PD_Controller[Channel-1].SendCommend("GPsl","02");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            //vbus to pd controller en
            buffers=PD_Controller[Channel-1].SendCommend("GPsh","0E");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            //cc en
            buffers=PD_Controller[Channel-1].SendCommend("GPsl","06");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",Channel]);
                return buffers;
            }
            
        }
    }
    else if(StrCmp("DP",Items,2)==2)
    {
        [LogInfo appendString:@"DP\r\n"];
        LogWrite([NSString stringWithFormat:@"DP\r\n"]);
        if(Statue == 0)
        {
            
        }
        else
        {
            usleep(100000);
            buffers = (char *)DP_Init(Channel);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"DP_Init(%d) Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            buffers = (char *)DP_SBU_Switch(Channel,1);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"DP_SBU_Switch(%d,1) Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            buffers = (char *)CCLogicSwitch(Channel,1);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"CCLogicSwitch(%d,1) Error.\r\n",Channel]);
                return buffers;
            }
            sleep(2);
            buffers = (char *)DP_SendHpd(Channel);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"DP_SendHpd(%d) Error.\r\n",Channel]);
                return buffers;
            }
            sleep(2);
            buffers = (char *)DP_Status(Channel);
            LogWrite([NSString stringWithFormat:@"%s",buffers]);
            usleep(100000);
            buffers = (char *)DP_SendHpd(Channel);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"DP_SendHpd(%d) Error.\r\n",Channel]);
                return buffers;
            }
            sleep(2);
            
        }
        //buffer = (char *)IA863_SimBoard.DP_SendHpd(3);
        //buffer = (char *)IA863_SimBoard.DP_Init(3);
    }
    else if(StrCmp("ELOAD",Items,5)==5)
    {
        LogWrite([NSString stringWithFormat:@"ELOAD\r\n"]);
        if(Statue == 0)
        {
        }
        else
        {
            for(j=0;j<4;j++)
            {
                if(Statue == 1)
                {
                    
                    //cc flip
                    usleep(100000);
                    buffers=PD_Controller[j].SendCommend("GPsl","00");
                    if(StrCmp(buffers,gStringOK,4) == 0)
                    {
                        [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",j+1];
                        LogWrite([NSString stringWithFormat:@"ResetAll() Error.\r\n"@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",j+1]);
                        return buffers;
                    }
                    usleep(100000);
                    //usb2.0 flip
                    buffers=PD_Controller[j].SendCommend("GPsl","10");
                    if(StrCmp(buffers,gStringOK,4) == 0)
                    {
                        [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",j+1];
                        LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",j+1]);
                        return buffers;
                    }
                    
                }
                else if(Statue == 2)
                {
                    //cc flip
                    usleep(100000);
                    buffers=PD_Controller[j].SendCommend("GPsh","00");
                    if(StrCmp(buffers,gStringOK,4) == 0)
                    {
                        LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",j+1]);
                        return buffers;
                    }
                    usleep(100000);
                    //usb2.0 flip
                    buffers=PD_Controller[j].SendCommend("GPsh","10");
                    if(StrCmp(buffers,gStringOK,4) == 0)
                    {
                        LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",j+1]);
                        return buffers;
                    }
                }
                usleep(100000);
                //usb2.0 en
                //buffers=PD_Controller[i].SendCommend("GPsl","02");
                //if(StrCmp(buffers,gStringOK,4) == 0)
                //{
                //    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",i+1];
                //    return buffers;
                //}
                usleep(100000);
                //vbus to pd controller en
                buffers=PD_Controller[j].SendCommend("GPsh","03");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",j+1]);
                    return buffers;
                }
                buffers=PD_Controller[j].SendCommend("GPsh","0E");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",j+1]);
                    return buffers;
                }
                usleep(100000);
                //cc en
                buffers=PD_Controller[j].SendCommend("GPsl","06");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",j+1]);
                    return buffers;
                }
            }
        }
        
    }
    else if(StrCmp("CHARGE",Items,6)==6)
    {
        LogWrite([NSString stringWithFormat:@"ResetAll() Error.\r\n"]);
        if(Statue ==0)
        {
        }
        else
        {
            if(Statue == 1)
            {
                //usb2.0 flip
                usleep(100000);
                buffers=PD_Controller[Channel-1].SendCommend("GPsl","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel]);
                    return buffers;
                }
            }
            else if(Statue == 2)
            {
                //usb2.0 flip
                usleep(100000);
                buffers=PD_Controller[Channel-1].SendCommend("GPsh","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel]);
                    return buffers;
                }
            }
            usleep(100000);
            //usb2.0 device select
            buffers=PD_Controller[Channel-1].SendCommend("GPsh","08");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            //usb2.0 en
            buffers=PD_Controller[Channel-1].SendCommend("GPsl","02");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",Channel]);
                return buffers;
            }
        }
    }
    else if(StrCmp("POTASSIUM",Items,9)==9)
    {
        LogWrite([NSString stringWithFormat:@"POTASSIUM\r\n"]);
        if(Statue ==0)
        {
        }
        else
        {
            if(Statue == 1)
            {
                usleep(100000);
                //vbus to pd controller en
                buffers=PD_Controller[0].SendCommend("GPsh","0C");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",1]);
                    return buffers;
                }
                else
                {
                    LogWrite([NSString stringWithFormat:@" CH:%d_6",1]);
                }
                usleep(100000);
                //vbus to charge en
                buffers=PD_Controller[0].SendCommend("GPsl","0D");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"03\") Error.\r\n",1]);
                    return buffers;
                }
            }
            else if(Statue == 2)
            {
                usleep(100000);
                //vbus to pd controller en
                buffers=PD_Controller[0].SendCommend("GPsh","0F");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",1]);
                    return buffers;
                }
                else
                {
                    LogWrite([NSString stringWithFormat:@" CH:%d_6",1]);
                }
                usleep(100000);
                //vbus to charge en
                buffers=PD_Controller[0].SendCommend("GPsl","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"03\") Error.\r\n",1]);
                    return buffers;
                }
            }
            
        }
    }
    else
    {
        LogWrite([NSString stringWithFormat:@"Items Error.\r\n"]);
        return (char *)"Items Error.";
        
    }
    LogWrite([NSString stringWithFormat:@"USBC_Items() Done.\r\n"]);
    return (char *)"Items Done.";
}
const char * cIA_MAC_BOOK_USBC_BOARD::Help(void)
{
    
    
    return [VerInfo UTF8String];
    
}
*/
const char * cIA_MAC_BOOK_USBC_BOARD::PD_IoControl(unsigned char Channel,char * Number, char *Statue)
{
    return PD_Controller[Channel-1].SendCommend(Statue,Number);
    
}
/*
const char * cIA_MAC_BOOK_USBC_BOARD::Cat9555_IoControl(unsigned char Channel,uint16_t IoData)
{
    return IoExpander[Channel-1].Setoutput(IoData);
}
*/
const char * cIA_MAC_BOOK_USBC_BOARD::I2cWrite(unsigned char I2cNum, unsigned char DeviceAdd, char *pData, unsigned char Len)
{
    NSString * str = [NSString stringWithFormat:@"%s", pData];
    return CoreBoard.I2cWrite((I2cChannel_t)I2cNum, DeviceAdd, str, Len);
    return pData;
}
const char * cIA_MAC_BOOK_USBC_BOARD::I2cRead(unsigned char I2cNum, unsigned char DeviceAdd, char *pSendData, unsigned char SendLen, unsigned char RevLen)
{
    NSString * str = [NSString stringWithFormat:@"%s", pSendData];
    return CoreBoard.I2cRead((I2cChannel_t)I2cNum, DeviceAdd, str, SendLen, RevLen);
    return pSendData;
}
const char * cIA_MAC_BOOK_USBC_BOARD::Open(char *Dev)
{
    return CoreBoard.Open(Dev);
}
const char * cIA_MAC_BOOK_USBC_BOARD::Close(void)
{
    return CoreBoard.Close();
}
const char * cIA_MAC_BOOK_USBC_BOARD::VersionRead(unsigned char Channel)
{
    //need debug
    char * buffers = PD_Controller[Channel-1].GetInput(0x06, 8);
    
    return buffers;
}
const char * cIA_MAC_BOOK_USBC_BOARD::DumpStatue(unsigned char Channel)
{
    //need debug
    char * buffers = PD_Controller[Channel-1].GetInput(0x03, 4);
    LogWrite([NSString stringWithFormat:@"CH%d Mode: %s\r\n",Channel,buffers]);
    buffers = PD_Controller[Channel-1].GetInput(0x34, 6);
    LogWrite([NSString stringWithFormat:@"CH%d Active PDO: %s\r\n",Channel,buffers]);
    buffers = PD_Controller[Channel-1].GetInput(0x35, 4);
    LogWrite([NSString stringWithFormat:@"CH%d Active RDO: %s\r\n",Channel,buffers]);
    buffers = PD_Controller[Channel-1].GetInput(0x72, 8);
    LogWrite([NSString stringWithFormat:@"CH%d GPIO Statue: %s\r\n",Channel,buffers]);
    buffers = PD_Controller[Channel-1].GetInput(0x69, 4);
    LogWrite([NSString stringWithFormat:@"CH%d CC Statue: %s\r\n",Channel,buffers]);

    return "Done";
}
const char * cIA_MAC_BOOK_USBC_BOARD::LogPathSet(const char * Paths)
{
    LogPath = [NSString stringWithUTF8String:Paths];
    f = [NSFileHandle fileHandleForWritingAtPath:LogPath];
    
    if (f)
    {
        [f seekToEndOfFile];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss.SSS"];
        NSString * strTime = [dateFormatter stringFromDate:[NSDate date]];
        NSString * strCont = [NSString stringWithFormat:@"\r\n%@ : \t %@",strTime,VerInfo];
        [f writeData:[strCont dataUsingEncoding:NSASCIIStringEncoding]];
        [f closeFile];
        
    }
    else
    {
        if(LogPath == NULL)
        {
            return "The Path is Error";
        }
        else
        {
            [VerInfo writeToFile:LogPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
            f=[NSFileHandle fileHandleForWritingAtPath:LogPath];
            [f closeFile];
        }
    }
    return "Done";
}
