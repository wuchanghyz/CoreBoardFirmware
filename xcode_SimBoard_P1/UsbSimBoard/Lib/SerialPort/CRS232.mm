//
//  CRS232.cpp
//  RS232
//
//  Created by anderon on 16/4/9.
//  Copyright © 2016年 IvanGan. All rights reserved.
//
//

#include "CRS232.h"

#include "zmq.h"

#include <iostream>
#include <sstream>

#include <unistd.h>
//#include "get_hash.h"

NSLock * g_LockCB = [[NSLock alloc]init];

CRS232::CRS232()
{
    NSError *error;
    NSString *Paths = @"/vault/Intelli_log/CoreBoard.txt";
    NSString *str3 = @"CoreBoard Debug Infomation:\r\n";
    [str3 writeToFile:Paths atomically:YES encoding:NSUTF8StringEncoding error:nil];
    fh=[NSFileHandle fileHandleForWritingAtPath:Paths];
    if (error){
        //[error localizedDescription]  会打印出主要的错误信息
        NSLog(@"Write Fail!\r\n");
        
    }else{
        NSLog(@"Wrige Success!\r\n");
    }
    pthread_mutex_init(&m_mutex,nil);
    pthread_mutex_init(&m_lockOperate, nil);
    m_strBuffer = [[NSMutableString alloc]init];
    m_DataBuffer = [[NSMutableData alloc]init];
    m_strDetect = [[NSMutableString alloc]init];
    m_Return = [[NSMutableString alloc]init];
    
    bNeedZmq = false;
    bNeedReply = false;
    bNeedPub = false;
    iTimeout = 3000;
}

CRS232::~CRS232()
{
    pthread_mutex_destroy(&m_mutex);
    pthread_mutex_destroy(&m_lockOperate);
    [m_strDetect release];
    [m_strBuffer release];
    [m_DataBuffer release];
    [m_Return release];
}

int CRS232::CreateIPC(const char * reply, const char * publish)
{
    CPubliser::bind(publish);
    CReplier::bind(reply);
    bNeedZmq = true;
    return 0;
}

void * CRS232::didReceiveData(void * data, long len)
{
    if(len < 0)
        return nullptr;
    pthread_mutex_lock(&m_mutex);
    if(bNeedZmq)
        Pulish(data, len);
    [m_DataBuffer appendBytes:(Byte*)data length:len];
    char * p = (char *)data;
    for(int i=0; i<len; i++)
    {
        if(p[i] == '\0')
            p[i] = '.';
    }
    NSString * str = [[NSString alloc]initWithBytes:data length:len encoding:NSUTF8StringEncoding];
    if(str)
       [m_strBuffer appendString:str];
    [str release];
    pthread_mutex_unlock(&m_mutex);
    return nullptr;
}

int CRS232::SetRepOpt(int needReply, int timeout)
{
    bNeedReply = (needReply>0) ? YES : NO;
    iTimeout = timeout;
    return 0;
}

int CRS232::SetPubOpt(int needPub)
{
    bNeedPub = (needPub>0) ? YES : NO;
    return 0;
}

void * CRS232::OnRequest(void * pData, long len)
{
    pthread_mutex_lock(&m_lockOperate);
    if(bNeedPub)
        Pulish(pData,len);
    int err = CSerialPort::write(pData, len);
    if(bNeedReply == NO)
        CReplier::SendStrig((err>=0)?"OK":"Fail");
    else
    {
        if([m_strDetect length]>0)
            WaitDetect(iTimeout);
        CReplier::SendStrig(ReadString());
    }
    pthread_mutex_unlock(&m_lockOperate);
    return nullptr;
}
int CRS232::LogWrite(NSString *temp)
{
    [fh seekToEndOfFile];
    [fh writeData:[temp dataUsingEncoding:NSUTF8StringEncoding]];
    return 0;
}

int CRS232::Open(const char * dev, const char * opt)//opt:"9600,8,n,1"
{
    //int set_opt(int nSpeed, int nBits, char nEvent, int nStop);
    NSString * str = [NSString stringWithUTF8String:opt];
    NSLog(@"%@",str);
    NSArray * arr = [str componentsSeparatedByString:@","];
    int nSpeed = 9600;
    int nBits = 8;
    char nEvent = 'n';
    int nStop = 1;
    if([arr count]==4)
    {
        nSpeed = [[arr objectAtIndex:0]intValue];
        nBits = [[arr objectAtIndex:1]intValue];
        const char * tmp = [[arr objectAtIndex:2]UTF8String];
        nEvent = tmp[0];
        nStop = [[arr objectAtIndex:3]intValue];
    }
    int ret = CSerialPort::connect(dev);
    if (ret<0)
    {
        return ret;
    }
    ret = CSerialPort::set_opt(nSpeed, nBits, nEvent, nStop);
    return ret;
}

int CRS232::WriteString(const char * buffer)
{
    NSString * str = [NSString stringWithFormat:@"%s", buffer];
    if(bNeedZmq && bNeedPub)
        Pulish((void*)[str UTF8String], [str length]);
    [str release];
    return CSerialPort::write((void*)[str UTF8String], [str length]);
}

int CRS232::WriteBytes(unsigned char * ucData, int len)
{
    if(bNeedZmq && bNeedPub)
        Pulish((void*)ucData, len);
    return CSerialPort::write((void*)ucData, len);
}

int CRS232::WriteStringBytes(const char * szData)//"0xFF,0xFE,..."
{
    if(szData == NULL) return -1;
    if(strlen(szData)<=0) return -2;
    NSArray * arr = [[NSString stringWithUTF8String:szData] componentsSeparatedByString:@","];
    if([arr count]< 1) return -3;
    int size = [arr count];
    unsigned char * ucData = new unsigned char [size];
    for(int i=0; i<size; i++)
    {
        NSScanner * scanner = [NSScanner scannerWithString:[arr objectAtIndex:i]];
        unsigned int tmp;
        [scanner scanHexInt:&tmp];
        ucData[i] = tmp;
    }
    if(bNeedZmq && bNeedPub)
        Pulish((void*)ucData, size);
    CSerialPort::write((void*)ucData, size);
    return 0;
}

void CRS232::ClearBuffer()
{
    [m_strBuffer setString:@""];
}

const char * CRS232::ReadString()
{
    [NSThread sleepForTimeInterval:0.01];
    pthread_mutex_lock(&m_mutex);
    if(m_strBuffer && [m_strBuffer length]>0)
    {
        [m_Return setString:m_strBuffer];
        [m_strBuffer setString:@""];
    }
    else
        [m_Return setString:@""];
    [m_DataBuffer setLength:0];
    pthread_mutex_unlock(&m_mutex);
    return [m_Return UTF8String];
}

const char * CRS232::ReadBytes()
{
    if([m_DataBuffer length]>0)
    {
        NSData * data = [NSData dataWithData:m_DataBuffer];
        [m_DataBuffer setLength:0];
        [m_strBuffer setString:@""];
        return (const char*)[data bytes];
    }
    else
        return NULL;
    
}

const char * CRS232::ReadStringBytes()
{
    NSUInteger len = [m_DataBuffer length];
    if(len>0)
    {
        Byte * pByte = (Byte*)[m_DataBuffer bytes];
        [m_Return setString:@""];
        for(int i= 0; i<[m_DataBuffer length]-1; i++)
        {
            [m_Return appendFormat:@"0x%02X,",pByte[i]];
        }
        [m_Return appendFormat:@"0x%02X",pByte[len -1]] ;
        [m_DataBuffer setLength:0];
        [m_strBuffer setString:@""];
        return [m_Return UTF8String];
    }
    else
        return NULL;
}


int CRS232::WaitDetect(int timeout)
{
    int r = -1;
    NSTimeInterval now;
    //    NSLog(@" * * * * * \ndylib Detect :%@ * * * * * \n",m_strStringToDetect);
    NSTimeInterval starttime = [[NSDate date]timeIntervalSince1970];
    double tm = (double)timeout/1000.0;
    //NSLog(@"starting is : %f",starttime);
//    NSLog(@"end time : %f",starttime+tm);
    while (1)
    {
        now = [[NSDate date]timeIntervalSince1970];
        //NSLog(@"end time : %f\r\n",now);
        if ((now-starttime)>=tm)
        {
            r = -2;
            break;
        }
        
        pthread_testcancel();       //if is cancel,exist current loop.
        
        //if([m_strBuffer containsString:m_MutableDetect])
        pthread_mutex_lock(&m_mutex);
        NSRange range  = [m_strBuffer rangeOfString:m_strDetect];
        pthread_mutex_unlock(&m_mutex);
        
        if (range.location != NSNotFound)
        {
            r = 0;
            break;
        }
        
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate date]];
        [NSThread sleepForTimeInterval:0.01];
    }
    //NSLog(@"end %f\r",now);
    //NSLog(@"%d\r",r);
    return r;  //cancel
}

int CRS232::SetDetectString(const char * det)
{
    [m_strDetect setString:[NSString stringWithUTF8String:det]];
    return 0;
}

const char * CRS232::WriteReadString(const char * buffer,int timeout)
{
    pthread_mutex_lock(&m_lockOperate);
    WriteString(buffer);
    WaitDetect(timeout);
    NSString * str = [NSString stringWithUTF8String:ReadString()];
    pthread_mutex_unlock(&m_lockOperate);
    return [str UTF8String];
}

int CRS232::Close()
{
    CPubliser::close();
    CReplier::close();
    CSerialPort::close();
    return 0;
}
/**********************************SerCoreBoard************************************************/
//Function

cSerCoreBoard::cSerCoreBoard()
{
    int i;
    GPIOSendBuffer = [[NSMutableString alloc]init];
    GPIORevBuffer = [[NSMutableString alloc]init];
    for(i=0;i<8;i++)
    {
        I2CSendBuffer[i] = [[NSMutableString alloc]init];
        I2CRevBuffer[i] = [[NSMutableString alloc]init];
    }
}
cSerCoreBoard::~cSerCoreBoard()
{
    int i;
    
    [GPIOSendBuffer release];
    [GPIORevBuffer release];
    for(i=0;i<8;i++)
    {
        [I2CSendBuffer[i] release];
        [I2CRevBuffer[i] release];
    }
}
char * cSerCoreBoard::Open(char *Dev)
{
    int ret;
    ret = CRS232::Open(Dev,"9600,8,n,1");
    if (ret < 0 )
    {
        return (char *)"Connect To Core Board Error!\r\n.";
    }
    CRS232::SetDetectString("\r");
    return (char *)"Done.";
}
char *  cSerCoreBoard::Close(void)
{
    CRS232::Close();
    return (char *)"Done.";
}
char * cSerCoreBoard::I2cInit(I2cChannel_t I2cNum, i2c_clock_divider_t Divede)
{
    uint8_t i;
    
    if((int)I2cNum > 9 )
    {
        return (char *)"Error I2cNum Out Of Range.";
    }
    [I2CSendBuffer[I2cNum] setString:@""];
    [I2CSendBuffer[I2cNum] appendFormat:@"[],I2C,%d,3 1 0 %d,\r\n",(uint8_t)I2cNum, (uint8_t)Divede];
    for(i=0;i<RETRY_TIME;i++)
    {
        if(CRS232::WriteString([I2CSendBuffer[I2cNum] UTF8String]) >= 0)
        {
            break;
        }
        else
        {
            sleep(1);
            LogWrite(@"I2C Write Fail");
        }
    }
    if(i<RETRY_TIME)
    {
        for(i=0;i<RETRY_TIME;i++)
        {
            if(CRS232::WaitDetect(READ_TIME_OUT) == 0)
            {
                return (char *)CRS232::ReadString();
            }
            else
            {
                LogWrite(@"I2C WaitDetect Fail");
            }
        }
    }
    return (char *)"Error Communicat with HW";
    
}
char * cSerCoreBoard::I2cWrite(I2cChannel_t I2cNum, uint8_t DeviceAdd, NSString *pData, uint8_t Len)
{
    uint8_t i;
    if((int)I2cNum > 9 )
    {
        return (char *)"Error I2cNum Out Of Range.";
    }
    [I2CSendBuffer[I2cNum] setString:@""];
    [I2CSendBuffer[I2cNum] appendFormat:@"[],I2C,%d,10 %02x 00 %02x ",(uint8_t)I2cNum, Len, DeviceAdd];
    [I2CSendBuffer[I2cNum] appendString:pData];
    [I2CSendBuffer[I2cNum] appendString:@",\r\n"];
    for(i=0;i<RETRY_TIME;i++)
    {
        if(CRS232::WriteString([I2CSendBuffer[I2cNum] UTF8String]) >= 0)
        {
            break;
        }
        else
        {
            sleep(1);
        }
    }
    if(i<RETRY_TIME)
    {
        for(i=0;i<RETRY_TIME;i++)
        {
            if(CRS232::WaitDetect(READ_TIME_OUT) == 0)
            {
                return (char *)CRS232::ReadString();
            }
        }
    }    return (char *)"Error Communicat with HW";
}
char * cSerCoreBoard::I2cRead(I2cChannel_t I2cNum, uint8_t DeviceAdd, NSString *pSendData, uint8_t SendLen,
                              uint8_t RevLen)
{
    uint8_t i;
    
    if((int)I2cNum > 9 )
    {
        return (char *)"Error I2cNum Out Of Range.";
    }
    [I2CSendBuffer[I2cNum] setString:@""];
    [I2CSendBuffer[I2cNum] appendFormat:@"[],I2C,%d,11 %02x %02x %02x ",(uint8_t)I2cNum, SendLen,RevLen,DeviceAdd];
    [I2CSendBuffer[I2cNum] appendString:pSendData];
    [I2CSendBuffer[I2cNum] appendString:@",\r\n"];
    for(i=0;i<RETRY_TIME;i++)
    {
        if(CRS232::WriteString([I2CSendBuffer[I2cNum] UTF8String]) >= 0)
        {
            break;
        }
        else
        {
            sleep(1);
        }
    }
    if(i<RETRY_TIME)
    {
        for(i=0;i<RETRY_TIME;i++)
        {
            if(CRS232::WaitDetect(READ_TIME_OUT) == 0)
            {
                return (char *)CRS232::ReadString();
            }
        }
    }
    return (char *)"Error Communicat with HW";
}

char * cSerCoreBoard::GpioOut(uint32_t OutData)
{
    uint8_t i;
    
    [GPIOSendBuffer setString:@""];
    [GPIOSendBuffer appendFormat:@"[],GPIO,0,10 %02x %02x %02x %02x ",(uint8_t)(OutData&0XFF),
    (uint8_t)((OutData>>8)&0XFF), (uint8_t)((OutData>>16)&0XFF), (uint8_t)((OutData>>24)&0XFF)];
    [GPIOSendBuffer appendString:@",\r\n"];
    for(i=0;i<RETRY_TIME;i++)
    {
        if(CRS232::WriteString([GPIOSendBuffer UTF8String]) >= 0)
        {
            break;
        }
        else
        {
            sleep(1);
        }
    }
    if(i<RETRY_TIME)
    {
        for(i=0;i<RETRY_TIME;i++)
        {
            if(CRS232::WaitDetect(READ_TIME_OUT) == 0)
            {
                return (char *)CRS232::ReadString();
            }
        }
    }
    return (char *)"Error Communicat with HW";
}
char * cSerCoreBoard::GpioInput(void)
{
    uint8_t i;
    
    [GPIOSendBuffer setString:@""];
    [GPIOSendBuffer appendFormat:@"[],GPIO,0,11 00 ,\r\n"];
    for(i=0;i<RETRY_TIME;i++)
    {
        if(CRS232::WriteString([GPIOSendBuffer UTF8String]) >= 0)
        {
            break;
        }
        else
        {
            sleep(1);
        }
    }
    if(i<RETRY_TIME)
    {
        for(i=0;i<RETRY_TIME;i++)
        {
            if(CRS232::WaitDetect(READ_TIME_OUT) == 0)
            {
                return (char *)CRS232::ReadString();
            }
        }
    }
    return (char *)"Error Communicat with HW";
}
/*
char * cSerCoreBoard::SpiInit(SpiChannel_t SpiNum, SPI_protocol_mode_t Mode, SPI_pclk_div_t Divede)
{
    uint16_t i;
    for(i = 0; i < 1024; i++)
    {
        SPI_RevBuffer[SpiNum][i] = 0;
    }
    SPI_SendBuffer[SpiNum][0] = 0x10|SpiNum;
    SPI_SendBuffer[SpiNum][1] = 0;
    SPI_SendBuffer[SpiNum][2] = 0x01;
    SPI_SendBuffer[SpiNum][3] = 0x02;
    SPI_SendBuffer[SpiNum][4] = Mode;
    SPI_SendBuffer[SpiNum][5] = Divede;
    
    CRS232::WriteBytes((unsigned char *)&SPI_SendBuffer[SpiNum][0], 6);
    CRS232::WaitDetect(READ_TIME_OUT);
    return (char *)CRS232::ReadBytes();
}
char * cSerCoreBoard::SpiWrite(SpiChannel_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t *SendData, uint8_t SendLen)
{
    uint16_t i;
    SPI_SendBuffer[SpiNum][0] = 0x10|SpiNum;
    SPI_SendBuffer[SpiNum][1] = 0x00;
    SPI_SendBuffer[SpiNum][2] = 0x10;
    SPI_SendBuffer[SpiNum][3] = SendLen;
    SPI_SendBuffer[SpiNum][4] = CmdLen;
    for(i = 0; i < 1024; i++)
    {
        SPI_RevBuffer[SpiNum][i] = 0;
    }
    for(i=0;i<CmdLen;i++)
    {
        SPI_SendBuffer[SpiNum][5+i] = *pData++;
    }
    for(;i<CmdLen+SendLen;i++)
    {
        SPI_SendBuffer[SpiNum][5+i] = *SendData++;
    }
    
    CRS232::WriteBytes((unsigned char *)&SPI_SendBuffer[SpiNum][0], SendLen+CmdLen+5);
    CRS232::WaitDetect(READ_TIME_OUT);
    return (char *)CRS232::ReadBytes();
}
char * cSerCoreBoard::SpiRead(SpiChannel_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t RevLen)
{
    uint16_t i;
    SPI_SendBuffer[SpiNum][0] = 0x10|SpiNum;
    SPI_SendBuffer[SpiNum][1] = 0x00;
    SPI_SendBuffer[SpiNum][2] = 0x11;
    SPI_SendBuffer[SpiNum][3] = RevLen;
    SPI_SendBuffer[SpiNum][4] = CmdLen;
    for(i = 0; i < 1024; i++)
    {
        SPI_RevBuffer[SpiNum][i] = 0;
    }
    for(i=0;i<CmdLen;i++)
    {
        SPI_SendBuffer[SpiNum][5+i] = *pData++;
    }
    CRS232::WriteBytes((unsigned char *)&SPI_SendBuffer[SpiNum][0], CmdLen+5);
    CRS232::WaitDetect(READ_TIME_OUT);
    return (char *)CRS232::ReadBytes();
}
*/
