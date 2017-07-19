//
//  CRS232.h
//  RS232
//
//  Created by IvanGan on 16/4/9.
//  Copyright © 2016年 IvanGan. All rights reserved.
//

#ifndef CRS232_h
#define CRS232_h

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include <stdio.h>
#include "SerialPort.h"
#include <string>

#import <pthread.h>

#include "Publisher.hpp"
#include "Replier.hpp"

#import "Config.h"

#define READ_TIME_OUT   1000  //1 second
#define RETRY_TIME      3


extern const char * gStringOK;
extern NSString * LogPath;
extern NSFileHandle *f;
int LogWrite(NSString *temp);
int StrCmp(char *Indata, const char *Strs, int size);
//
//  RS232.h
//  RS232
//
//  Created by IvanGan on 16/4/9.
//  Copyright © 2016年 IvanGan. All rights reserved.
//
#include <stdio.h>
#include <string.h>
#include <pthread.h>

typedef int (*OnReceiveData)(void * data, size_t len, void * context);

class CRS232 : CPubliser, CReplier, CSerialPort
{
public:
    CRS232();
    ~CRS232();
public:
    int CreateIPC(const char * reply, const char * publish);
    int Open(const char * dev, const char * opt);//opt:"9600,8,n,1"
    int Close();
    
    int WriteString(const char * buffer);
    int WriteBytes(unsigned char * ucData, int len);
    int WriteStringBytes(const char * szData);//"0xFF,0xFE,..."
    
    const char * ReadString();
    const char * ReadBytes();
    const char * ReadStringBytes();
    const char * ReadPowerString();             //Read data without '\0'
    
    void ClearBuffer();
    int SetDetectString(const char * det);
    int WaitDetect(int timeout);//msec
    
    const char * WriteReadString(const char * buffer,int timeout);
    
    int SetRepOpt(int needReply, int timeout=3000);//set bNeedReplay
    int SetPubOpt(int needPub);//it will publish command which is from function writeXXX
    
protected:
    virtual void * OnRequest(void * pdata, long len);
    virtual void * didReceiveData(void * data, long len);
    
private:
    pthread_mutex_t m_mutex;
    pthread_mutex_t m_lockOperate;
    
    NSMutableString * m_strBuffer;
    NSMutableData * m_DataBuffer;
    NSMutableString * m_strDetect;
    NSMutableString * m_Return;
    NSLock* m_lockBuffer;
    
    bool bNeedZmq;  //YES: will pub data from COM
    //this will initial in "CreatIPC".
    
    bool bNeedReply; // YES: will reply data from data, or it will return "OK" or "Fail"
    int iTimeout;//msec
    bool bNeedPub;
    
    bool bFilterUnreadable;
    bool bFilterColorCode;
};



class cSerCoreBoard : public CRS232
{
public:
    cSerCoreBoard();
    ~cSerCoreBoard();
public:
    //Function
    char * Open(char *Dev);
    char * Close(void);
    char * I2cInit(I2cChannel_t I2cNum, i2c_clock_divider_t Divede);
    char * I2cWrite(I2cChannel_t I2cNum, uint8_t DeviceAdd, NSString *pData, uint8_t Len);
    char * I2cRead(I2cChannel_t I2cNum, uint8_t DeviceAdd, NSString *pSendData, uint8_t SendLen, uint8_t RevLen);
    
    char * SpiInit(SpiChannel_t SpiNum, SPI_protocol_mode_t Mode, SPI_pclk_div_t Divede);
    char * SpiWrite(SpiChannel_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t *SendData, uint8_t SendLen);
    char * SpiRead(SpiChannel_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t RevLen);
    
    
    char * GpioOut(uint32_t OutData);
    char * GpioInput(void);
    //char * UartInit(UartChannel_t SpiNum, uint16_t Divede);
    //char * UartWrite(UartChannel_t UartNum, uint8_t *pData, uint16_t Len);
    //char * UartRead(UartChannel_t UartNum, uint8_t *pData, uint8_t *Len);
    
private:
    int fileDescriptor;
    NSMutableString *I2CSendBuffer[8];
    NSMutableString *I2CRevBuffer[8];
    NSMutableString *GPIOSendBuffer;
    NSMutableString *GPIORevBuffer;
    //char SPI_SendBuffer[8][1024];
    //char SPI_RevBuffer[8][1024];
    //uint8_t UART_SendBuffer[8][1024];
    //uint8_t UART_RevBuffer[8][1024];
    
};

#endif /* CRS232_hpp */
