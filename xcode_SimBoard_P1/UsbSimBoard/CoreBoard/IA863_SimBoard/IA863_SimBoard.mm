//
//  IA863_SimBoard.m
//  IA863_SimBoard
//
//  Created by anderson on 17/1/8.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import "IA863_SimBoard.h"
#import "string.h"

const char * gStringOK="Done";



//Genal Function
const char ConvTable[16]=
{
    '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
};

int StrCmp(char *Indata, const char *Strs, int size)
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
    return i;
}

uint16_t cIA863_SimBoard::IO_Read(uint8_t Address)
{
    char * InputData;
    uint16_t Indata;
    char * Result[6]= {0};
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
                return buffers;
            }
        }
        else
        {
            buffers=PD_Controller[Channel-1].SendCommend(data1,data2);
            if(StrCmp(buffers,gStringOK,4) == 0)
            {
                return buffers;
            }

        }
        return buffers;
    }
    else
    {
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
    CoreBoard.PulishString([Result UTF8String]);
    Result = @"\r\n The Read Data is :\r";
    for(i=0;i<8;i++)
    {
        Temp = DP_ReceiverRead(Channel, InitData[i]);
        Result = [Result stringByAppendingFormat:@"%02x:",InitData[i]];
        Result = [Result stringByAppendingString:[NSString stringWithUTF8String:Temp]];
        Result = [Result stringByAppendingString:@"\r"];
    }
    CoreBoard.PulishString([Result UTF8String]);
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
    uint16_t Indata[2];
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
    
    
    Indata[0] = IO_Read(0);
    Indata[0] = Indata[0]&0x803f;
    Indata[1] = IO_Read(1);
    Indata[1] = Indata[1]&0xfc01;
    if((TxData>0)&&(TxData<15))
    {
        
        Indata[0] |= Tx_Tables[TxData]&0xffff;
        Indata[1] |= (Tx_Tables[TxData]>>16)&0xffff;
    }
    else
    {
        return (char *)"Error Tx Data Error!";
    }
    if((RxData>0)&&(RxData<15))
    {
        
        Indata[0] |= Rx_Tables[RxData]&0xffff;
        Indata[1] |= (Rx_Tables[RxData]>>16)&0xffff;
    }
    else
    {
        return (char *)"Error Rx Data Error!";
    }
    buffer = IoExpander[0].Setoutput(Indata[0]);
    if(StrCmp(buffer,gStringOK,4) == 0)
    {
        return buffer;
    }
    buffer = IoExpander[1].Setoutput(Indata[1]);
    return buffer;
    
}
const char * cIA863_SimBoard::TypeAUsb3RedriverRead(void)
{
    return (char *)"Error,Function is On Going...";
}
const char * cIA863_SimBoard::TypeAPower(unsigned char Channel, unsigned char Statue)
{
    uint16_t Indata[2];
    char *ReturnData;
    Indata[0] = IO_Read(0);
    if((Channel>0)&&(Channel <5))
    {
        if(Statue == 1)
        {
            Indata[0] = Indata[0] |(0x01<<(Channel-1));
        }
        else
        {
            Indata[0] = Indata[0] & (~(0x01<<(Channel-1)));
        }
        ReturnData = IoExpander[0].Setoutput(Indata[0]);
        
        //Indata[0] = IO_Read(0);
        return ReturnData;
    }
    else
    {
        return (char *)"Channel Error";
    }
    
}
const char * cIA863_SimBoard::TypeAUsbSwitch(unsigned char Channel, unsigned char Statue)
{
    uint16_t Indata[2];
    Indata[0] = IO_Read(0);
    Indata[1] = IO_Read(1);
    Indata[0] &= ~0x8000;
    Indata[1] &= ~0x0C01;
    char * buffer;
    
    switch (Channel) {
        case 1:
            if(Statue == 1) Indata[0] |= 0x8000;
            else            Indata[0] &= ~0x8000;
            break;
        case 2:
            if(Statue == 1) Indata[1] |= 0x0400;
            else            Indata[1] &= ~0x0400;

            break;
        case 3:
            if(Statue == 1) Indata[1] |= 0x0001;
            else            Indata[1] &= ~0x0001;

            break;
        case 4:
            if(Statue == 1) Indata[1] |= 0x0800;
            else            Indata[1] &= ~0x0800;
            
            break;
        default:
            return (char *)"Channel Error";
            break;
    }
    //Indata[0] |= 0x8000;
    //Indata[1] |=0x8401;
    buffer = IoExpander[0].Setoutput(Indata[0]);
    if(StrCmp(buffer,gStringOK,4) == 0)
    {
        return buffer;
    }
    return IoExpander[1].Setoutput(Indata[1]);
}
const char * cIA863_SimBoard::TypeAEloadSwitch(unsigned char Channel)
{
    uint16_t Indata[2];
    Indata[0] = IO_Read(1);
    Indata[0] &= 0x0fff;
    char * buffer;
    if(Channel == 0)
    {
        return IoExpander[1].Setoutput(Indata[0]);

    }
    else if((Channel>0)&&(Channel <5))
    {
        Indata[0] = Indata[0] |0xf000;
        return IoExpander[1].Setoutput(Indata[0]);
    }
    else
    {
        return (char *)"Channel Error";
    }
}
const char * cIA863_SimBoard::TypeASdCardSwitch(unsigned char Statue)
{
    
    uint16_t Indata[2];
    Indata[0] = IO_Read(0);
    if(Statue == 0)
    {
        Indata[0] &= ~(Statue<<4);
        return IoExpander[0].Setoutput(Indata[0]);
    }
    else
    {
        Indata[0] |= (Statue<<4);
        return IoExpander[0].Setoutput(Indata[0]);
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
    [LogInfo release];
    [VerInfo release];
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
const char * cIA863_SimBoard::BoardInit(void)
{
    uint8_t i;
    char * ReadData;
    ReadData = CoreBoard.Open("/dev/cu.usbmodemVer11");
    if(strcmp(ReadData,"Done.") != 0)
    {
        [LogInfo appendString:@"BoardInit() Error.\r\n"];
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
    ReadData = (char *)ResetAll();
    if(StrCmp(ReadData,gStringOK,4) == 0)
    {
        [LogInfo appendString:@"ResetAll() Error.\r\n"];
        return ReadData;
    }
    [LogInfo appendString:@"BoardInit() Done.\r\n"];
    return (char *)"Items Done.";
}

const char * cIA863_SimBoard::ResetAll(void)
{
    uint8_t i;
    char *data1="GPsl";
    char *data2="00";
    char * buffers="Error";
    for(i=0;i<2;i++)
    {
        usleep(100000);
        buffers = IoExpander[i].Setoutput(0x0000);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d Setoutput(0x0000) Error.\r\n",i];
            return buffers;
        }
        buffers = IoExpander[i].Config(0x0000);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d Config(0x0000) Error.\r\n",i];
            return buffers;
        }
    }

    for(i=0;i<3;i++)
    {
        data2="00";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="01";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="02";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="03";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="06";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="07";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="08";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="0E";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        data2="0F";
        buffers=PD_Controller[i].SendCommend(data1,data2);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"CH:%d SendCommend(%s,%s) Error.\r\n",i+1,data1,data2];
            return buffers;
        }
        usleep(100000);
        buffers = (char *)DP_Reset(i+1);
        if(StrCmp(buffers,gStringOK,4) == 0)
        {
            [LogInfo appendFormat:@"DP_Reset(%s) Error.\r\n",i];
            return buffers;
        }
    }
   
    [LogInfo appendString:@"ResetAll() Done.\r\n"];
    return buffers;

}


const char * cIA863_SimBoard::USBA_Items(unsigned char Channel, const char * Items, unsigned char Statue) //--Channel=1,2,3,4 --Item=2.0,3.0,ELOAD --Statue=0,1
{
    char *ReturnData;
    char i;
    ReturnData = (char *)ResetAll();
    if(StrCmp(ReturnData,gStringOK,4) == 0)
    {
        return ReturnData;
    }
    sleep(5);
    if(strncmp(Items, "2.0", 3)==0)
    {
        [LogInfo appendString:@"2.0\r\n"];
        if(Statue == 0)
        {
        
        }
        else
        {
            ReturnData = (char *)TypeAPower(Channel, 1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeAPower(%d,1) Error.\r\n",Channel];
                return ReturnData;
            }
        }
        
    }
    else if(strncmp(Items, "3.0", 3)==0)
    {
        [LogInfo appendString:@"3.0\r\n"];
        if(Statue == 0)
        {
            
        }
        else
        {
            ReturnData =(char *)TypeAUsb3RedriverWrite(14,1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendString:@"TypeAUsb3RedriverWrite(14,1) Error.\r\n"];
                return ReturnData;
            }
            sleep(1);
            ReturnData= (char *)TypeAUsbSwitch(Channel, 1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeAUsbSwitch(%d,1) Error.\r\n",Channel];
                return ReturnData;
            }
            sleep(1);
            ReturnData = (char *)TypeAPower(Channel, 1);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeAPower(%d,1) Error.\r\n",Channel];
                return ReturnData;
            }
        }

        
    }
    else if(strncmp(Items, "ELOAD", 3)==0)
    {
        [LogInfo appendString:@"ELOAD\r\n"];
        if(Statue == 0)
        {
            
        }
        else
        {
            for (i=1;i<5;i++)
            {
                ReturnData = (char *)TypeAEloadSwitch(i);
                if(StrCmp(ReturnData,gStringOK,4) == 0)
                {
                    [LogInfo appendFormat:@"TypeAEloadSwitch(%d) Error.\r\n",Channel];
                    return ReturnData;
                }
            
            }
            

        }
    }
    else if(strncmp(Items, "SD", 2)==0)
    {
        [LogInfo appendString:@"SD\r\n"];

        if((Statue&0x03) == 0)
        {
            
        }
        else
        {
            ReturnData = (char *)TypeASdCardSwitch(Statue&0x03);
            if(StrCmp(ReturnData,gStringOK,4) == 0)
            {
                [LogInfo appendString:@"TypeASdCardSwitch(0x01) Error.\r\n"];
                return ReturnData;
            }
        }
    }
    else
    {
       
        [LogInfo appendString:@"ERROR ITEMS\r\n"];
        return (char *)"Items Error.";

    }
    [LogInfo appendString:@"USBA_Items() Done.\r\n"];
    return (char *)"Items Done.";
}

const char * cIA863_SimBoard::USBC_Items(unsigned char Channel, const char * Items, unsigned char Statue) //--Channel=1,2,3,4 --Item=2.0,DP,ELOAD --Statue=0,1,2
{
    char * buffer;
    char i;
    buffer = (char *)ResetAll();
    if(StrCmp(buffer,gStringOK,4) == 0)
    {
        [LogInfo appendString:@"ResetAll() Error.\r\n"];
        return buffer;
    }
        
    sleep(5);
    buffer = (char *)TypeC_EloadSwitch(Channel, 1);
    if(StrCmp(buffer,gStringOK,4) == 0)
    {
        [LogInfo appendFormat:@"TypeC_EloadSwitch(%d,1) Error.\r\n",Channel];
        return buffer;
    }
    usleep(100000);
    if(strncmp(Items, "2.0", 3)==0)
    {
        [LogInfo appendString:@"2.0\r\n"];
        if(Statue == 0)
        {
            buffer = (char *)TypeCUsb2Switch(Channel, 0);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeCUsb2Switch(%d,0) Error.\r\n",Channel];
                return buffer;
            }
            buffer = (char *)CCLogicSwitch(Channel, 0);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CCLogicSwitch(%d,0) Error.\r\n",Channel];
                return buffer;
            }
        }
        else if(Statue == 1)
        {
            buffer = (char *)TypeCUsb2Switch(Channel, 0);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeCUsb2Switch(%d,0) Error.\r\n",Channel];
                return buffer;
            }
            buffer = (char *)CCLogicSwitch(Channel, Statue);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CCLogicSwitch(%d,%d) Error.\r\n",Channel,Statue];
                return buffer;
            }

        }
        else if(Statue == 2)
        {
            buffer = (char *)TypeCUsb2Switch(Channel, 1);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeCUsb2Switch(%d,1) Error.\r\n",Channel];
                return buffer;
            }
            buffer = (char *)CCLogicSwitch(Channel, Statue);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CCLogicSwitch(%d,%d) Error.\r\n",Channel,Statue];
                return buffer;
            }
        }
    }
    else if(strncmp(Items, "DP", 2)==0)
    {
        [LogInfo appendString:@"DP\r\n"];
        if(Statue == 0)
        {
            
        }
        else
        {
            buffer = (char *)DP_Init(Channel);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_Init(%d) Error.\r\n",Channel];
                return buffer;
            }
            buffer = (char *)DP_SBU_Switch(Channel,1);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_SBU_Switch(%d,1) Error.\r\n",Channel];
                return buffer;
            }
            buffer = (char *)CCLogicSwitch(Channel,1);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"CCLogicSwitch(%d,1) Error.\r\n",Channel];
                return buffer;
            }
            sleep(2);
            buffer = (char *)DP_SendHpd(Channel);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_SendHpd(%d) Error.\r\n",Channel];
                return buffer;
            }
            sleep(2);
            buffer = (char *)DP_Status(Channel);
            [LogInfo appendFormat:@"%s",buffer];
            
            buffer = (char *)DP_SendHpd(Channel);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"DP_SendHpd(%d) Error.\r\n",Channel];
                return buffer;
            }
            sleep(2);
            
        }
        //buffer = (char *)IA863_SimBoard.DP_SendHpd(3);
        //buffer = (char *)IA863_SimBoard.DP_Init(3);
    }
    else if(strncmp(Items, "ELOAD", 5)==0)
    {
        [LogInfo appendString:@"ELOAD\r\n"];
        for(i=1;i<5;i++)
        {
            CCLogicSwitch(i, 1);
            
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeC_EloadSwitch(%d,1) Error.\r\n",Channel];
                return buffer;
            }
        
        }
        
    }
    else if(strncmp(Items, "CHARGE", 6)==0)
    {
        [LogInfo appendString:@"CHARGE\r\n"];
        if(Statue ==0)
        {
        }
        else
        {
            buffer = (char *)TypeC_EloadSwitch(Channel, 0);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeC_EloadSwitch(%d,1) Error.\r\n",Channel];
                return buffer;
            }
            usleep(100000);
            buffer = (char *)TypeCUsb2Switch(Channel, Statue-1);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeCUsb2Switch(%d,%d-1) Error.\r\n",Channel,Statue];
                return buffer;
            }
            buffer = (char *)TypeC_ChargeSwitch(Channel,1);
            if(StrCmp(buffer,gStringOK,4) == 0)
            {
                [LogInfo appendFormat:@"TypeC_ChargeSwitch(%d,1) Error.\r\n",Channel];
                return buffer;
            }
        }
    }
    else
    {
        [LogInfo appendString:@"Items Error.\r\n"];
        return (char *)"Items Error.";
        
    }
    [LogInfo appendString:@"USBC_Items() Done.\r\n"];
    return (char *)"Items Done.";
}
const char * cIA863_SimBoard::Help(void)
{
    [VerInfo appendString:@"Version: For J137 P1B V0.3\r\n\r\n"];
    
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
    return [VerInfo UTF8String];

}
