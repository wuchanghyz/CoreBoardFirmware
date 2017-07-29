//
//  IA863_SimBoard.m
//  IA863_SimBoard
//
//  Created by anderson on 17/1/8.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import "IA863_SimBoard.h"
#import "string.h"



//Genal Function
/*
const char * cIA863_SimBoard::LogWrite(NSString *temp)
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
/*
uint16_t cIA863_SimBoard::IO_Read(uint8_t Address)
{
    char * InputData;
    uint16_t Indata;
    char * Result[6] = {0};
    char buffer[64];
    int i = 0;
    
    InputData = IoExpander[Address].GetInput(0x02);
    Result[0] = strtok(InputData,",");
    while(Result[i] != NULL)
    {
        i++;
        Result[i] = strtok(NULL,",");
    }
    buffer[0] = 0;
    buffer[1] = 0;
    strcat(buffer,Result[3]);
    i = String2Char(buffer);
    if((i == 2)||(i == 1))
    {
        Indata = ((uint16_t)buffer[1]<<8) + buffer[0];
    }
    else
    {
        Indata = 0;
    }
    return Indata;
}
 */
const uint16_t Tusb1002Table[14]=
{
    0x003f,0x003e,0x0038,0x003d,0x0037,0x0036,0x0030,0x0035,0x0007,0x0006,0x0000,0x0005,0x002f,0x002e
};
//------------------------------------

//cIA863_SimBoard::cIA863_SimBoard(void)
//{}
//cIA863_SimBoard::~cIA863_SimBoard(void)
//{}


const char * cIA863_SimBoard::CCLogicSwitch(unsigned char Channel, unsigned char Statue)
{
    char *data1;
    char *data2;
    char * buffers;
    if(Statue ==0)
    {
        data1="GPsl";
        data2="00";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        data1="GPsl";
        data2="06";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    else if(Statue == 1)
    {
        data1="GPsl";
        data2="06";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        //buffers=PD_Controller[Channel-1].ReadStatue();
        
        
        data1="GPsh";
        data2="00";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    else if(Statue == 2)
    {
        data1="GPsl";
        data2="00";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        //buffers=PD_Controller[Channel-1].ReadStatue();
        //buffers=PD_Controller[Channel-1].ReadStatue();
        data1="GPsh";
        data2="06";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        //buffers=PD_Controller[Channel-1].ReadStatue();
        //buffers=PD_Controller[Channel-1].ReadStatue();
    }
    else
    {
        return (char *)"Error.";
    }
    data1 = nullptr;
    free(data1);
    data2 = nullptr;
    free(data2);
    

    return buffers;
}

const char * cIA863_SimBoard::TypeCUsb2Switch(unsigned char Channel, unsigned char Statue)
{
    char *data1="GPsh";
    char *data2="02";
    char * buffers="Error Statue";
        
    if(Statue == 1)
    {
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    else
    {
        data1="GPsl";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    data1 = nullptr;
    free(data1);
    data2 = nullptr;
    free(data2);
   
    return buffers;
}
const char * cIA863_SimBoard::TypeC_EloadSwitch(unsigned char Channel,unsigned char Statue)
{
    char *data1="GPsh";
    char *data2="0E";
    char * buffers;
    if((Channel>0)&&(Channel<5))
    {
        if(Statue == 0)
        {
            data1="GPsl";
            buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                data1 = nullptr;
                free(data1);
                data2 = nullptr;
                free(data2);
                return buffers;
            }
        }
        else
        {
            buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                data1 = nullptr;
                free(data1);
                data2 = nullptr;
                free(data2);

                return buffers;
            }

        }
        data1 = nullptr;
        free(data1);
        data2 = nullptr;
        free(data2);

        return buffers;
    }
    else
    {
        data1 = nullptr;
        free(data1);
        data2 = nullptr;
        free(data2);

        return (char *)"Channel para error.";
    }
    
    
}
const char * cIA863_SimBoard::TypeC_ChargeSwitch(unsigned char Channel,unsigned char Statue)
{
    char *data1="GPsh";
    char *data2="07";
    char *data3="08";
    char *data4="03";
    char * buffers;
    
    if(Statue == 1)
    {
        buffers=PD_Controller[Channel-1].SendCommend(data1,data4);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        buffers=PD_Controller[Channel-1].SendCommend(data1,data3);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    else
    {
        data1="GPsl";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
        buffers=PD_Controller[Channel-1].SendCommend(data1,data3);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }
    }
    return buffers;
}
const char *cIA863_SimBoard::DP_Init(unsigned char Channel)
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
const char *cIA863_SimBoard::DP_Reset(unsigned char Channel)
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
const char *cIA863_SimBoard::DP_SendHpd(unsigned char Channel)
{
    const char * revs;
    unsigned short Hpd[2]={0x01,0xA002};
    return DP_ReceiverWrite(Channel, (uint8_t)Hpd[0], Hpd[1]);
}

const char *cIA863_SimBoard::DP_Status(unsigned char Channel)
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
const char * cIA863_SimBoard::DP_ReceiverWrite(unsigned char Channel,unsigned char Address, unsigned short InData)
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
const char * cIA863_SimBoard::DP_ReceiverRead(unsigned char Channel,unsigned char Address)
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
const char * cIA863_SimBoard::DP_SBU_Switch(unsigned char Channel, unsigned char Statue)
{
    char *data1;
    char *data2;
    char * buffers;
    if(Statue == 1)
    {
        data1="GPsh";
        data2="0F";

        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }

    }
    else
    {
        data1="GPsl";
        data2="0F";
        buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            return buffers;
        }

    }
    return buffers;

}


//type-A

#define _l_     0x00000007
#define _r_     0x00000006
#define _f_     0x00000000
#define _h_     0x00000005
const char * cIA863_SimBoard::TypeAUsb3RedriverWrite(unsigned char TxData, unsigned char RxData)
{
    char * buffer;
    unsigned long Tx_Tables[14] =
    {
        (_l_<<6)|(_l_<<9),(_r_<<6)|(_l_<<9),(_f_<<6)|(_l_<<9),(_h_<<6)|(_l_<<9),
        (_l_<<6)|(_r_<<9),(_r_<<6)|(_r_<<9),(_f_<<6)|(_r_<<9),(_h_<<6)|(_r_<<9),
        (_l_<<6)|(_f_<<9),(_r_<<6)|(_f_<<9),(_f_<<6)|(_f_<<9),(_h_<<6)|(_f_<<9),
        (_l_<<6)|(_h_<<9),(_r_<<6)|(_h_<<9)
    };
    unsigned long Rx_Tables[14] =
    {
        (_l_<<20)|(_l_<<23),(_r_<<20)|(_l_<<23),(_f_<<20)|(_l_<<23),(_h_<<20)|(_l_<<23),
        (_l_<<20)|(_r_<<23),(_r_<<20)|(_r_<<23),(_f_<<20)|(_r_<<23),(_h_<<20)|(_r_<<23),
        (_l_<<20)|(_f_<<23),(_r_<<20)|(_f_<<23),(_f_<<20)|(_f_<<23),(_h_<<20)|(_f_<<23),
        (_l_<<20)|(_h_<<23),(_r_<<20)|(_h_<<23)
    };
    

    IoData[0] = IoData[0]&0x803f;
    IoData[1] = IoData[1]&0xfc01;
    if((TxData>0)&&(TxData<15))
    {
        
        IoData[0] |= Tx_Tables[TxData]&0xffff;
        IoData[1] |= (Tx_Tables[TxData]>>16)&0xffff;
    }
    else
    {
        return (char *)"Error Tx Data Error!";
    }
    if((RxData>0)&&(RxData<15))
    {
        
        IoData[0] |= Rx_Tables[RxData]&0xffff;
        IoData[1] |= (Rx_Tables[RxData]>>16)&0xffff;
    }
    else
    {
        return (char *)"Error Rx Data Error!";
    }
    buffer = IoExpander[0].Setoutput(IoData[0]);
    if(StrCmp(buffer,gStringOK,4) == 0)
    {
        return buffer;
    }
    usleep(100000);
    buffer = IoExpander[1].Setoutput(IoData[1]);
    return buffer;
    
}
const char * cIA863_SimBoard::TypeAUsb3RedriverRead(void)
{
    return (char *)"Error,Function is On Going...";
}
const char * cIA863_SimBoard::TypeAPower(unsigned char Channel, unsigned char Statue)
{
    char *ReturnData;
    if((Channel>0)&&(Channel <5))
    {
        if(Statue == 1)
        {
            IoData[0] = IoData[0] |(0x01<<(Channel-1));
        }
        else
        {
            IoData[0] = IoData[0] & (~(0x01<<(Channel-1)));
        }
        ReturnData = IoExpander[0].Setoutput(IoData[0]);
        return ReturnData;
    }
    else
    {
        return (char *)"Channel Error";
    }
    
}
const char * cIA863_SimBoard::TypeAUsbSwitch(unsigned char Channel, unsigned char Statue)
{
    IoData[0] &= ~0x8000;
    IoData[1] &= ~0x0C01;
    char * buffer;
    
    switch (Channel) {
        case 1:
            if(Statue == 1) IoData[0] |= 0x8000;
            else            IoData[0] &= ~0x8000;
            break;
        case 2:
            if(Statue == 1) IoData[1] |= 0x0400;
            else            IoData[1] &= ~0x0400;

            break;
        case 3:
            if(Statue == 1) IoData[1] |= 0x0001;
            else            IoData[1] &= ~0x0001;

            break;
        case 4:
            if(Statue == 1) IoData[1] |= 0x0800;
            else            IoData[1] &= ~0x0800;
            
            break;
        default:
            return (char *)"Channel Error";
            break;
    }
    //Indata[0] |= 0x8000;
    //Indata[1] |=0x8401;
    buffer = IoExpander[0].Setoutput(IoData[0]);
    if(StrCmp(buffer,gStringOK,4) == 0)
    {
        return buffer;
    }
    usleep(100000);
    return IoExpander[1].Setoutput(IoData[1]);
}
const char * cIA863_SimBoard::TypeAEloadSwitch(unsigned char Channel)
{
    IoData[1] &= 0x0fff;
    char * buffer;
    if(Channel == 0)
    {
        return IoExpander[1].Setoutput(IoData[1]);

    }
    else if((Channel>0)&&(Channel <5))
    {
        IoData[1] = IoData[1] |0xf000;
        return IoExpander[1].Setoutput(IoData[1]);
    }
    else
    {
        return (char *)"Channel Error";
    }
}
const char * cIA863_SimBoard::TypeASdCardSwitch(unsigned char Statue)
{
    if(Statue == 0)
    {
        IoData[0] &= ~(Statue<<4);
        return IoExpander[0].Setoutput(IoData[0]);
    }
    else
    {
        IoData[0] |= (Statue<<4);
        return IoExpander[0].Setoutput(IoData[0]);
    }
}
//-----------------------------External Interface

cIA863_SimBoard::cIA863_SimBoard()
{
    LogInfo = [[NSMutableString alloc]init];
    VerInfo = [[NSMutableString alloc]init];

}

cIA863_SimBoard::~cIA863_SimBoard()
{
    if (LogInfo) {
        [LogInfo release];
    }
    if (VerInfo){
        [VerInfo release];
    }
    
    //[IoData[2] release];
}

const char * cIA863_SimBoard::GetLogInfo()
{
    [LogInfo appendString:@"GetLogInfo() Done.\r\n"];
    return [LogInfo UTF8String];
}
const char * cIA863_SimBoard::ClearLogInfo()
{
    [LogInfo setString:@""];
    [LogInfo appendString:@"ClearLogInfo() Done.\r\n"];
    return (char *)"Items Done.";
}
const char * cIA863_SimBoard::BoardInit(char * Items)
{
    uint8_t i;
    char * ReadData;
    
    
    ReadData = CoreBoard.Open("/dev/cu.usbmodemVer11");
    if(strcmp(ReadData,"Done.") != 0)
    {
        [LogInfo appendString:@"BoardInit() Error.\r\n"];
        LogWrite(@"BoardInit() Error.\r\n");
        return ReadData;
    }
    CoreBoard.SetDetectString("\r\n");
    sleep(1);
    //CoreBoard.GpioOut(0x00000000);
    for(i=0;i<2;i++)
    {
        //for usb A redriver
        IoExpander[i].SetAddress(0x20|(i+2));
        IoExpander[i].SetSerialPort(&CoreBoard);
        IoExpander[i].SetI2cNumber(I2C1);
    }
    //ReadData = IoExpander[0].Setoutput(0x0010);
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
    ReadData = (char *)ResetAll(Items);
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        [LogInfo appendString:@"ResetAll() Error.\r\n"];
        LogWrite(@"ResetAll() Error.\r\n");
        return ReadData;
    }
    [LogInfo appendString:@"BoardInit() Done.\r\n"];
    LogWrite(@"BoardInit() Done.\r\n");
    ReadData = nullptr;
    free(ReadData);
    return (char *)"Items Done.";
}
const char * cIA863_SimBoard::SelfTest(void)
{
    uint8_t i=0;
    char * ReadData;
    ReadData = CoreBoard.Open("/dev/cu.usbmodemVer11");
    if(strcmp(ReadData,"Done.") != 0)
    {
        [LogInfo appendString:@"BoardInit() Error.\r\n"];
        LogWrite(@"BoardInit() Error.\r\n");
        return ReadData;
    }
    CoreBoard.SetDetectString("\r\n");
    sleep(1);
    //CoreBoard.GpioOut(0x00000000);
    for(i=0;i<2;i++)
    {
        //for usb A redriver
        IoExpander[i].SetAddress(0x20|(i+2));
        IoExpander[i].SetSerialPort(&CoreBoard);
        IoExpander[i].SetI2cNumber(I2C1);
    }
    //ReadData = IoExpander[0].Setoutput(0x0010);
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
    i =0;
    ReadData = IoExpander[0].Setoutput(0x0000);
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        i++;
        printf("USBA cat9555 CH1 Connect fail, please check connection\r\n");
    }
    ReadData = IoExpander[1].Setoutput(0x0000);
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        i++;
        printf("USBA cat9555 CH2 Connect fail, please check connection\r\n");
    }
    ReadData=PD_Controller[0].SendCommend("GPsh","0F");
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        i++;
        printf("USBC CH1 Connect fail, please check connection\r\n");
    }
    ReadData=PD_Controller[1].SendCommend("GPsh","0F");
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        i++;
        printf("USBC CH2 Connect fail, please check connection\r\n");
    }
    ReadData=PD_Controller[2].SendCommend("GPsh","0F");
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        i++;
        printf("USBC CH3 Connect fail, please check connection\r\n");
    }
    ReadData=PD_Controller[3].SendCommend("GPsh","0F");
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        i++;
        printf("USBC CH4 Connect fail, please check connection\r\n");
    }
    if(i == 0)
    {
        printf("Self Test Pass. Fail Count %d\r\n", i);
        return "Done.";
    }
    
    else
    {
        printf("Self Test Fail! Fail Count %d\r\n", i);
        return "Fail";
    }
    
    
}
const char * cIA863_SimBoard::ResetAll(char * Items)
{
    uint8_t i;
    char * buffers="Done";
    CoreBoard.ClearBuffer();
    if((StrCmp(Items,"BOTH",4) == 4)||(StrCmp(Items,"USBA",4) == 4))
    {
        for(i=0;i<2;i++)
        {
            usleep(100000);
            IoData[i] = 0;
            buffers = IoExpander[i].Setoutput(IoData[i]);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                printf("USBA Connect fail, please check connection\r\n");
                [LogInfo appendFormat:@"CH:%d Setoutput(0x0000) Error.\r\n",i];
                LogWrite([NSString stringWithFormat:@"CH:%d Setoutput(0x0000) Error.(%s)\r\n",i,buffers]);
                return buffers;
            }
            usleep(100000);
            buffers = IoExpander[i].Config(0x0000);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                printf("USBA Connect fail, please check connection\r\n");
                [LogInfo appendFormat:@"CH:%d Config(0x0000) Error.\r\n",i];
                LogWrite([NSString stringWithFormat:@"CH:%d Config(0x0000) Error.(%s)\r\n",i,buffers]);
                return buffers;
            }
        }
    }
    if((StrCmp(Items,"BOTH",4) == 4)||(StrCmp(Items,"USBC",4) == 4))
    {
        for(i=0;i<4;i++)
        {
            //sbu en
            usleep(100000);
            buffers=PD_Controller[i].SendCommend("GPsh","0F");
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
            buffers=PD_Controller[i].SendCommend("GPsl","00");
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
            buffers=PD_Controller[i].SendCommend("GPsl","10");
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
            buffers=PD_Controller[i].SendCommend("GPsl","08");
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
            buffers=PD_Controller[i].SendCommend("GPsh","02");
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
            buffers=PD_Controller[i].SendCommend("GPsl","0E");
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
            buffers=PD_Controller[i].SendCommend("GPsl","03");
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
            buffers=PD_Controller[i].SendCommend("GPsh","06");
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
            // usleep(100000);
            // buffers = (char *)DP_Reset(i+1);
            // if(StrCmp(buffers,gStringOK,4) == 0)
            // {
            //     [LogInfo appendFormat:@"DP_Reset(%s) Error.\r\n",i];
            //     return buffers;
            // }
        }

    }
    
    [LogInfo appendString:@"ResetAll() Done.\r\n"];
    LogWrite([NSString stringWithFormat:@"ResetAll() Done.\r\n"]);
    return buffers;

}


const char * cIA863_SimBoard::USBA_Items(unsigned char Channel, const char * Items, unsigned char Statue) //--Channel=1,2,3,4 --Item=2.0,3.0,ELOAD --Statue=0,1
{
    char *ReturnData;
    char i;
    ReturnData = (char *)ResetAll("USBA");
    if(StrCmp(ReturnData,gStringOK,4) == 0)
    {
        return ReturnData;
    }
    //sleep(5);
    if(StrCmp("2.0",Items,3)==3)
    {
        [LogInfo appendString:@"2.0\r\n"];
        LogWrite([NSString stringWithFormat:@"2.0\r\n"]);
        if(Statue == 0)
        {
        
        }
        else
        {
            usleep(100000);
            ReturnData = (char *)TypeAPower(Channel, 1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeAPower(%d,1) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"TypeAPower(%d,1) Error.\r\n",Channel]);
                return ReturnData;
            }
        }
        
    }
    else if(StrCmp("3.0",Items,3)==3)
    {
        [LogInfo appendString:@"3.0\r\n"];
        LogWrite([NSString stringWithFormat:@"3.0\r\n"]);
        if(Statue == 0)
        {
            
        }
        else
        {
            usleep(100000);
            ReturnData =(char *)TypeAUsb3RedriverWrite(14,1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendString:@"TypeAUsb3RedriverWrite(14,1) Error.\r\n"];
                LogWrite([NSString stringWithFormat:@"TypeAUsb3RedriverWrite(14,1) Error.\r\n"]);
                return ReturnData;
            }
            usleep(100000);
            ReturnData= (char *)TypeAUsbSwitch(Channel, 1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeAUsbSwitch(%d,1) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"TypeAUsbSwitch(%d,1) Error.\r\n",Channel]);
                return ReturnData;
            }
            usleep(100000);
            ReturnData = (char *)TypeAPower(Channel, 1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeAPower(%d,1) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"TypeAPower(%d,1) Error.\r\n",Channel]);
                return ReturnData;
            }
        }

        
    }
    else if(StrCmp("ELOAD",Items,5)==5)
    {
        [LogInfo appendString:@"ELOAD\r\n"];
        LogWrite([NSString stringWithFormat:@"ELOAD\r\n"]);
        if(Statue == 0)
        {
            
        }
        else
        {
            for (i=1;i<5;i++)
            {
                usleep(100000);
                ReturnData = (char *)TypeAEloadSwitch(i);
                if(StrCmp(ReturnData,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"TypeAEloadSwitch(%d) Error.\r\n",Channel];
                    LogWrite([NSString stringWithFormat:@"TypeAEloadSwitch(%d) Error.\r\n",Channel]);
                    return ReturnData;
                }
            
            }
            

        }
    }
    else if(StrCmp("SD",Items,2)==2)
    {
        [LogInfo appendString:@"SD\r\n"];
        LogWrite([NSString stringWithFormat:@"SD\r\n"]);
        if((Statue&0x03) == 0)
        {
            
        }
        else
        {
            usleep(100000);
            ReturnData = (char *)TypeASdCardSwitch(Statue&0x03);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendString:@"TypeASdCardSwitch(0x01) Error.\r\n"];
                LogWrite([NSString stringWithFormat:@"TypeASdCardSwitch(0x01) Error.\r\n"]);
                return ReturnData;
            }
        }
    }
    else
    {
       
        [LogInfo appendString:@"ERROR ITEMS\r\n"];
        LogWrite([NSString stringWithFormat:@"ERROR ITEMS\r\n"]);
        return (char *)"Items Error.";

    }
    [LogInfo appendString:@"USBA_Items() Done.\r\n"];
    LogWrite([NSString stringWithFormat:@"USBA_Items() Done.\r\n"]);
    return (char *)"Items Done.";
}

const char * cIA863_SimBoard::USBC_Items(unsigned char Channel, const char * Items, unsigned char Statue) //--Channel=1,2,3,4 --Item=2.0,DP,ELOAD --Statue=0,1,2
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
                [LogInfo appendFormat:@"DP_Init(%d) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"DP_Init(%d) Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            buffers = (char *)DP_SBU_Switch(Channel,1);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_SBU_Switch(%d,1) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"DP_SBU_Switch(%d,1) Error.\r\n",Channel]);
                return buffers;
            }
            usleep(100000);
            buffers = (char *)CCLogicSwitch(Channel,1);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CCLogicSwitch(%d,1) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"CCLogicSwitch(%d,1) Error.\r\n",Channel]);
                return buffers;
            }
            sleep(2);
            buffers = (char *)DP_SendHpd(Channel);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_SendHpd(%d) Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"DP_SendHpd(%d) Error.\r\n",Channel]);
                return buffers;
            }
            sleep(2);
            buffers = (char *)DP_Status(Channel);
            [LogInfo appendFormat:@"%s",buffers];
            LogWrite([NSString stringWithFormat:@"%s",buffers]);
            usleep(100000);
            buffers = (char *)DP_SendHpd(Channel);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_SendHpd(%d) Error.\r\n",Channel];
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
        [LogInfo appendString:@"ELOAD\r\n"];
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
                        [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",j+1];
                        LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"00\") Error.\r\n",j+1]);
                        return buffers;
                    }
                    usleep(100000);
                    //usb2.0 flip
                    buffers=PD_Controller[j].SendCommend("GPsh","10");
                    if(StrCmp(buffers,gStringOK,4) == 0)
                    {
                        [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",j+1];
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
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",j+1];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",j+1]);
                    return buffers;
                }
                buffers=PD_Controller[j].SendCommend("GPsh","0E");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",j+1];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"0E\") Error.\r\n",j+1]);
                    return buffers;
                }
                usleep(100000);
                //cc en
                buffers=PD_Controller[j].SendCommend("GPsl","06");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",j+1];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"06\") Error.\r\n",j+1]);
                    return buffers;
                }
            }
        }
        
    }
    else if(StrCmp("CHARGE",Items,6)==6)
    {
        [LogInfo appendString:@"CHARGE\r\n"];
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
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel];
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
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",Channel]);
                    return buffers;
                }
            }
            usleep(100000);
            //usb2.0 device select
            buffers=PD_Controller[Channel-1].SendCommend("GPsh","08");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",Channel];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",Channel]);
                return buffers;
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
        }
    }
    else if(StrCmp("POTASSIUM",Items,9)==9)
    {
        [LogInfo appendString:@"POTASSIUM\r\n"];
        LogWrite([NSString stringWithFormat:@"POTASSIUM\r\n"]);
        if(Statue ==0)
        {
        }
        else
        {
            if(Statue == 1)
            {
                //usb2.0 flip
                usleep(100000);
                buffers=PD_Controller[0].SendCommend("GPsl","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",1];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",1]);
                    return buffers;
                }
            }
            else if(Statue == 2)
            {
                //usb2.0 flip
                buffers=PD_Controller[0].SendCommend("GPsh","10");
                if(StrCmp(buffers,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",1];
                    LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"10\") Error.\r\n",1]);
                    return buffers;
                }
            }
            usleep(100000);
            //usb2.0 device select
            buffers=PD_Controller[0].SendCommend("GPsh","08");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsl\",\"08\") Error.\r\n",1]);
                return buffers;
            }
            usleep(100000);
            //usb2.0 en
            buffers=PD_Controller[0].SendCommend("GPsl","02");
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",1];
                LogWrite([NSString stringWithFormat:@"CH:%d SendCommend(\"GPsh\",\"02\") Error.\r\n",1]);
                return buffers;
            }
        }
    }
    else
    {
        [LogInfo appendString:@"Items Error.\r\n"];
        LogWrite([NSString stringWithFormat:@"Items Error.\r\n"]);
        return (char *)"Items Error.";
        
    }
    [LogInfo appendString:@"USBC_Items() Done.\r\n"];
    LogWrite([NSString stringWithFormat:@"USBC_Items() Done.\r\n"]);
    return (char *)"Items Done.";
}
const char * cIA863_SimBoard::Help(void)
{
    [VerInfo appendString:@"Version: For J137 EVT V1.42\r\n\r\n"];
    
    [VerInfo appendString:@"const char * BoardInit(void)  --Init Type A and Type C Module.\r\n"];
    [VerInfo appendString:@"const char * ResetAll(void) --Reset All Type A and Type C Moldule.\r\n"];
    [VerInfo appendString:@"const char * Help(void) --Get Help Infomation.\r\n"];
    [VerInfo appendString:@"const char * GetLogInfo(void) --Get All Debug Log Infomation, Can not Slef Cleared.\r\n"];
     [VerInfo appendString:@"const char * ClearLogInfo(void) --Clear All Preversely Debug Log Infomation\r\n\r\n"];
    
    [VerInfo appendString:@"const char * USBA_Items(unsigned char Channel, const char * Items, unsigned char Statue)  -- Type A Module Control Function\r\n"];
    [VerInfo appendString:@"    Items: \"2.0\": --Plug In and Out One Channel 2.0 U Disk.\r\n"];
    [VerInfo appendString:@"            Channel: USB A Channel Number 1,2,3,4\r\n"];
    [VerInfo appendString:@"            Status:  0 - USB A 2.0 Plug Out\r\n" ];
    [VerInfo appendString:@"                     1 - USB A 2.0 Plug In\r\n" ];
    [VerInfo appendString:@"    Items: \"3.0\": --Plug In and Out One Channel 3.0 U Disk.\r\n"];
    [VerInfo appendString:@"            Channel: USB A Channel Number 1,2,3,4\r\n"];
    [VerInfo appendString:@"            Status:  0 - USB A 3.0 Plug Out\r\n" ];
    [VerInfo appendString:@"                     1 - USB A 3.0 Plug In\r\n" ];
    [VerInfo appendString:@"    Items: \"ELOAD\": -- Enable All Channel Eload Path Switch.\r\n"];
    [VerInfo appendString:@"            Channel: Reserved, Write 1 By Default.\r\n"];
    [VerInfo appendString:@"            Status:  Reserved, Write 1 By Default.\r\n" ];
    [VerInfo appendString:@"    Items: \"SD\": -- Enable SD Card\r\n"];
    [VerInfo appendString:@"            Channel: Reserved, Write 1 By Default.\r\n"];
    [VerInfo appendString:@"            Status:  0 - Detect and WP Pin Disonnect To GND\r\n" ];
    [VerInfo appendString:@"                     1 - Detect Pin Connect To GND\r\n\r\n" ];
    [VerInfo appendString:@"                     2 - WP Pin Connect To GND\r\n\r\n" ];
    [VerInfo appendString:@"                     3 - WP and Detect Pin Connect To GND\r\n\r\n" ];
    
    [VerInfo appendString:@"const char * USBC_Items(unsigned char Channel, const char * Items, unsigned char Statue)  -- Type C Module Control Function\r\n"];
    [VerInfo appendString:@"    Items: \"2.0\": --Plug In and Out One Channel HID Keyboard\r\n"];
    [VerInfo appendString:@"            Channel: USB C Channel Number 1,2,3,4\r\n"];
    [VerInfo appendString:@"            Status:  0 - USB C HID Keyboard Plug Out\r\n" ];
    [VerInfo appendString:@"                     1 - USB C HID Keyboard Plug In\r\n" ];
    [VerInfo appendString:@"                     2 - USB C HID Keyboard Flip Plug In\r\n" ];
    [VerInfo appendString:@"    Items: \"DP\": --Plug In and Out Display Port Function\r\n"];
    [VerInfo appendString:@"            Channel: USB C Channel Number 1,2,3,4\r\n"];
    [VerInfo appendString:@"            Status:  0 -- Display Port Plug Out\r\n" ];
    [VerInfo appendString:@"                     1 -- Display Port Plug In\r\n" ];
    [VerInfo appendString:@"    Items: \"ELOAD\": -- Enable All Channel Eload Path Switch\r\n"];
    [VerInfo appendString:@"            Channel: Reserved\r\n"];
    [VerInfo appendString:@"            Status:  Reserved\r\n" ];
    [VerInfo appendString:@"    Items: \"CHARGE\": -- Enable Changer Path Switch\r\n"];
    [VerInfo appendString:@"            Channel: USB C Channel Number 1,2,3,4\r\n"];
    [VerInfo appendString:@"            Status:  0 - Charger Path Switch Off\r\n" ];
    [VerInfo appendString:@"                     1 - Charger Path Switch On With Top USB2.0\r\n" ];
    [VerInfo appendString:@"                     2 - Charger Path Switch On with Bottom USB2.0\r\n" ];
    [VerInfo appendString:@"    Items: \"POTASSIUM\": -- Enable Changer Path Switch\r\n"];
    [VerInfo appendString:@"            Channel: Reserved\r\n"];
    [VerInfo appendString:@"            Status:  0 - Charger Path Switch Off\r\n" ];
    [VerInfo appendString:@"                     1 - Charger Path Switch On With Top USB2.0\r\n" ];
    return [VerInfo UTF8String];

}

const char * cIA863_SimBoard::PD_IoControl(unsigned char Channel,char * Number, char *Statue)
{
    return PD_Controller[Channel-1].SendCommend(Statue,Number);
    
}
const char * cIA863_SimBoard::Cat9555_IoControl(unsigned char Channel,uint16_t IoData)
{
    return IoExpander[Channel-1].Setoutput(IoData);
}

const char * cIA863_SimBoard::I2cWrite(unsigned char I2cNum, unsigned char DeviceAdd, char *pData, unsigned char Len)
{
    NSString * str = [NSString stringWithFormat:@"%s", pData];
    return CoreBoard.I2cWrite((I2cChannel_t)I2cNum, DeviceAdd, str, Len);
    return pData;
}
const char * cIA863_SimBoard::I2cRead(unsigned char I2cNum, unsigned char DeviceAdd, char *pSendData, unsigned char SendLen, unsigned char RevLen)
{
    NSString * str = [NSString stringWithFormat:@"%s", pSendData];
    return CoreBoard.I2cRead((I2cChannel_t)I2cNum, DeviceAdd, str, SendLen, RevLen);
    return pSendData;
}
const char * cIA863_SimBoard::Open(char *Dev)
{
    return CoreBoard.Open(Dev);
}
const char * cIA863_SimBoard::Close(void)
{
    return CoreBoard.Close();
}

const char * cIA863_SimBoard::LogPathSet(const char * Paths)
{
    NSString *temp=@"Begin Write To Already Exist Files!";
    LogPath = [NSString stringWithUTF8String:Paths];
    f = [NSFileHandle fileHandleForWritingAtPath:LogPath];
    
    if (f)
    {
        [f seekToEndOfFile];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss.SSS"];
        NSString * strTime = [dateFormatter stringFromDate:[NSDate date]];
        NSString * strCont = [NSString stringWithFormat:@"\r\n%@ : \t %@",strTime,temp];
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
            NSString *str3 = @"CoreBoard(A1.0) Debug Infomation(Dylib V1.42):\r\n";
            [str3 writeToFile:LogPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
            f=[NSFileHandle fileHandleForWritingAtPath:LogPath];
            [f closeFile];
        }
    }
    return "Done";
 }
