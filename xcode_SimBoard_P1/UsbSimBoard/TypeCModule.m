//
//  TypeCModule.m
//  CoreBoard
//
//  Created by anderson on 17/2/18.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>

//Genal Function
const char ConvTable[16]=
{
    '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
};
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
    strcat(buffer, Result[3]);
    i = String2Char(buffer);
    if(i == 2)
    {
        Indata = (buffer[1]<<8) + buffer[0];
    }
    else
    {
        Indata = 0;
    }
    return Indata;
}
const uint8_t Tusb1002Table[14]=
{
    0x3f,0x3e,0x38,0x3d,0x37,0x36,0x30,0x35,0x07,0x06,0x00,0x05,0x2f,0x2e
};
//------------------------------------

//cIA863_SimBoard::cIA863_SimBoard(void)
//{}
//cIA863_SimBoard::~cIA863_SimBoard(void)
//{}



const char * cIA863_SimBoard::BoardInit(void)
{
    uint8_t i;
    char * ReadData;
    CoreBoard.Open("/dev/cu.usbmodemVer11");
    CoreBoard.SetDetectString("\r\n");
    CoreBoard.GpioOut(0x00000000);
    for(i=0;i<2;i++)
    {
        //for usb A redriver
        IoExpander[i].SetAddress(0x20|(i+2));
        IoExpander[i].SetSerialPort(&CoreBoard);
        IoExpander[i].SetI2cNumber(I2C1);
        ReadData = IoExpander[i].Setoutput(0x0000);
        ReadData = IoExpander[i].Config(0x0000);
    }
    for(i=0;i<4;i++)
    {
        STDP4020[i].SetAddress(0x73|i);
        STDP4020[i].SetI2cNumber(I2C4);
        STDP4020[i].SetSerialPort(&CoreBoard);
    }
    return (char *)"Done";
}

const char * cIA863_SimBoard::PotassiumPower(unsigned char Statue)
{
    /*    uint16_t Indata;
     Indata = IO_Read(4);
     if(Statue == 0)
     {
     IoExpander[4].Setoutput(Indata&0xefff);
     }
     else
     {
     IoExpander[4].Setoutput(Indata|0x1000);
     }
     */
    return (char *)"No need this function any more!";}
const char * cIA863_SimBoard::PotassiumSwitch(unsigned char Statue)
{
    uint16_t Indata;
    Indata = IO_Read(0);
    if(Statue == 0)
    {
        IoExpander[0].Setoutput(Indata&0xfff0);
    }
    else
    {
        IoExpander[0].Setoutput(Indata|0x000f);
    }
    return (char *)"Done";
}
const char * cIA863_SimBoard::CCLogicSwitch(unsigned char Channel, unsigned char Statue)
{
    uint16_t Indata;
    if((Channel>0)&&(Channel<5))
    {
        Indata = IO_Read(0);
        Indata = (Indata&0xf0ff)|(0x0080<<Channel);
        if(Statue == 0)
        {
            Indata = Indata&0xff0f;
        }
        else
        {
            Indata = Indata|(0x0008<<Channel);
        }
        IoExpander[0].Setoutput(Indata);
        return (char *)"Done";
    }
    else
    {
        return (char *)"Error Channel Error!";
    }
}
const char * cIA863_SimBoard::VbusSelect(unsigned char Channel)
{
    uint16_t Indata;
    
    if((Channel>=0)&&(Channel<5))
    {
        Indata = IO_Read(5);
        Indata = (Indata&0xfff0)|(0x0007+Channel);
        IoExpander[5].Setoutput(Indata);
        return (char *)"Done";
    }
    else
    {
        return (char *)"Error Channel Par!";
    }
}
const char * cIA863_SimBoard::GPIO_Ctl(unsigned char Statue)
{
    CoreBoard.GpioOut((0x00000000&0xfffffff0)|Statue);
    return (char *)"Done";
}
const char * cIA863_SimBoard::TypeCMuxSelectWrige(unsigned char Channel, unsigned short Statue)
{
    char *buffer;
    if(Channel>0 &&Channel<5)
    {
        buffer = Redriver_Mux[Channel-1].Setoutput(Statue);
        return (char *)"Done";
        
    }
    else
    {
        return (char *)"Error Channel Error!";
    }
}
const char * cIA863_SimBoard::TypeCMuxSelectRead(unsigned char Channel)
{
    char *buffer;
    if(Channel>0 &&Channel<5)
    {
        buffer = Redriver_Mux[Channel-1].GetInput();
        return buffer;
        
    }
    else
    {
        return (char *)"Error Channel Error!";
    }
}
const char * cIA863_SimBoard::TypeCUsb3RedriverWrite(unsigned char TxData, unsigned char RxData)
{
    uint16_t Indata[2];
    
    Indata[0] = IO_Read(0);
    Indata[1] = IO_Read(1);
    Indata[0] = Indata[0]&0x0fff;
    Indata[1] = Indata[1]&0x8020;
    if((TxData>0)&&(TxData<15))
    {
        Indata[0] |= (Tusb1002Table[TxData-1]&0x0f)<<12;
        Indata[1] |= (Tusb1002Table[TxData-1]&0xf0)>>4;
    }
    else
    {
        return (char *)"Error Channel Error!";
    }
    if((RxData>0)&&(RxData<15))
    {
        Indata[1] |= (Tusb1002Table[RxData-1]&0x0f)<<6;
        Indata[1] |= (Tusb1002Table[RxData-1]&0xf0)<<6;
    }
    else
    {
        return (char *)"Error Channel Error!";
    }
    IoExpander[0].Setoutput(Indata[0]);
    IoExpander[1].Setoutput(Indata[1]);
    return (char *)"Done";
}
const char * cIA863_SimBoard::TypeCUsb3RedriverRead(void)
{
    return (char *)"Error,Function is On Going...";
}
const char * cIA863_SimBoard::Usb2Switch(unsigned char Channel, unsigned char Statue)
{
    uint16_t Indata;
    switch(Channel)
    {
        case 1:
            Indata = IO_Read(1);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0020;
            }
            else
            {
                Indata |= Indata | 0x0020;
            }
            IoExpander[1].Setoutput(Indata);
            break;
        case 2:
            Indata = IO_Read(1);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x8000;
            }
            else
            {
                Indata = Indata | 0x8000;
            }
            IoExpander[1].Setoutput(Indata);
            break;
        case 3:
            Indata = IO_Read(2);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0001;
            }
            else
            {
                Indata |= Indata | 0x0001;
            }
            IoExpander[2].Setoutput(Indata);
            break;
        case 4:
            Indata = IO_Read(2);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0002;
            }
            else
            {
                Indata |= Indata | 0x0002;
            }
            IoExpander[2].Setoutput(Indata);
            break;
        case 5:
            Indata = IO_Read(2);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x8000;
            }
            else
            {
                Indata |= Indata | 0x8000;
            }
            IoExpander[2].Setoutput(Indata);
            break;
        case 6:
            Indata = IO_Read(3);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0400;
            }
            else
            {
                Indata |= Indata | 0x0400;
            }
            IoExpander[3].Setoutput(Indata);
            break;
        case 7:
            Indata = IO_Read(3);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0001;
            }
            else
            {
                Indata |= Indata | 0x0001;
            }
            IoExpander[3].Setoutput(Indata);
            break;
        case 8:
            Indata = IO_Read(3);
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0800;
            }
            else
            {
                Indata |= Indata | 0x0800;
            }
            IoExpander[3].Setoutput(Indata);
            break;
        default:
            return (char *)"Error Channel Error!";
            break;
    }
    return (char *)"Done";
}
const char * cIA863_SimBoard::UsbPower(unsigned char Channel, unsigned char Statue)
{
    uint16_t Indata;
    
    Indata = IO_Read(4);
    switch(Channel)
    {
        case 1:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x2000;
            }
            else
            {
                Indata |= Indata | 0x2000;
            }
            
            break;
        case 2:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x4000;
            }
            else
            {
                Indata = Indata | 0x4000;
            }
            
            break;
        case 3:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x8000;
            }
            else
            {
                Indata |= Indata | 0x8000;
            }
            
            break;
        case 4:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0010;
            }
            else
            {
                Indata |= Indata | 0x0010;
            }
            
            break;
        case 5:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0020;
            }
            else
            {
                Indata |= Indata | 0x0020;
            }
            
            break;
        case 6:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0040;
            }
            else
            {
                Indata |= Indata | 0x0040;
            }
            
            break;
        case 7:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0080;
            }
            else
            {
                Indata |= Indata | 0x0080;
            }
            break;
        case 8:
            if(Statue ==0)
            {
                Indata &= Indata& ~0x0100;
            }
            else
            {
                Indata |= Indata | 0x0100;
            }
            
            break;
        default:
            return (char *)"Error Channel Error!";
            break;
    }
    IoExpander[4].Setoutput(Indata);
    return (char *)"Done";
}

const char * cIA863_SimBoard::HPD_Mux(unsigned char Channel)
{
    uint16_t Indata;
    if((Channel>0)&&(Channel<5))
    {
        Indata = IO_Read(4);
        Indata = (Indata&0xf1ff) | ((0x03+Channel)<<9);
        IoExpander[4].Setoutput(Indata);
        return (char *)"Done";
    }
    else
    {
        return (char *)"Error Chanel";
    }
}
const char * cIA863_SimBoard::DP_RedriverWrite(unsigned char Channel,unsigned char TxData)
{
    
    return (char *)"Error,Function is On Going...";
}
const char * cIA863_SimBoard::DP_RedriverRead(unsigned char Channel,unsigned char TxData)
{
    return (char *)"Error,Function is On Going...";
}

const char * cIA863_SimBoard::TypeAUsb3RedriverWrite(unsigned char TxData, unsigned char RxData)
{
    uint16_t Indata[2];
    
    if((TxData>0)&&(TxData<15))
    {
        Indata[0] = IO_Read(2);
        Indata[0] = Indata[0]&0x803f;
        Indata[0] |= Tusb1002Table[TxData-1]<<6;
        IoExpander[2].Setoutput(Indata[0]);
    }
    else
    {
        return (char *)"Error Tx Data Error!";
    }
    if((RxData>0)&&(RxData<15))
    {
        Indata[1] = IO_Read(3);
        Indata[1] = Indata[1]&0xfc01;
        Indata[1] |= Tusb1002Table[RxData-1]<<1;
        IoExpander[3].Setoutput(Indata[1]);
        return (char *)"Done";
    }
    else
    {
        return (char *)"Error Rx Data Error!";
    }
}
const char * cIA863_SimBoard::TypeAUsb3RedriverRead(void)
{
    return (char *)"Error,Function is On Going...";
}

const char * cIA863_SimBoard::EloadSelect(unsigned char Channel)
{
    return (char *)"Error,Function is On Going...";
}

const char * cIA863_SimBoard::DP_ReceiverWrite(unsigned char Channel,unsigned char Address, unsigned            short InData)
{
    uint16_t IoData;
    IoData = IO_Read(2);
    if((Channel > 0)&&(Channel < 5))
    {
        IoData |= (0x0002<<Channel);
        IoExpander[2].Setoutput(IoData);
        return STDP4020[Channel-1].Setoutput(Address, InData);
    }
    else
    {
        return (char *)"Error Channel Par!";
        
    }
    return (char *)"ok";
}
const char * cIA863_SimBoard::DP_ReceiverRead(unsigned char Channel,unsigned char Address)
{
    uint16_t IoData;
    IoData = IO_Read(2);
    if((Channel > 0)&&(Channel < 5))
    {
        IoData |= (0x0002<<Channel);
        IoExpander[2].Setoutput(IoData);
        return STDP4020[Channel-1].GetInput(Address);
    }
    else
    {
        return (char *)"Error Channel Par!";
    }
}

const char *cIA863_SimBoard::DP_Init(unsigned char Channel)
{
    unsigned short InitData[5][2]=
    {
        //{0x01,0x0102},{0x08,0x0000},{0x09,0x0086},{0x0A,0x0000},{0x0E,0x0041}
        {0x01,0x0102},{0x08,0x0300},{0x09,0x01ee},{0x0A,0x0000},{0x0E,0x0041}
    };
    unsigned char i;
    for(i=0;i<5;i++)
    {
        DP_ReceiverWrite(Channel, (uint8_t)InitData[i][0], InitData[i][1]);
    }
    return (char *)"ok";
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
    NSLog(@"%@",Result);
    Result = @"\r\n The Read Data is :\r";
    for(i=0;i<8;i++)
    {
        Temp = DP_ReceiverRead(Channel, InitData[i]);
        Result = [Result stringByAppendingFormat:@"%02x:",InitData[i]];
        Result = [Result stringByAppendingString:[NSString stringWithUTF8String:Temp]];
        Result = [Result stringByAppendingString:@"\r"];
    }
    NSLog(@"%@",Result);
    return [Result UTF8String];
}



//Reserved
const char * cIA863_SimBoard::DacOut(float Current_mA)
{
    return (char *)"Error,Function is On Going...";
}
const char * cIA863_SimBoard::ImageSample(unsigned char Channel)
{
    return (char *)"Error,Function is On Going...";
}
const char * cIA863_SimBoard::ExternalEload(float Current_mA)
{
    return (char *)"Error,Function is On Going...";
}
