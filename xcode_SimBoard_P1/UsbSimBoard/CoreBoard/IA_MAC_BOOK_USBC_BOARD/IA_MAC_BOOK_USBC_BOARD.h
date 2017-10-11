//
//  IA863_SimBoard.h
//  IA863_SimBoard
//
//  Created by anderson on 17/1/8.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "CRS232.h"
#import "STDP4020.h"
#import "Cat9555.h"
#import "PD_Controller.h"

extern const char * gStringOK;

class cIA_MAC_BOOK_USBC_BOARD
{
public:
    cIA_MAC_BOOK_USBC_BOARD(void);
    ~cIA_MAC_BOOK_USBC_BOARD(void);
public:
    const char * BoardInit(char *Dev);
    const char * Open(char *Dev);
    const char * Close(void);
    const char * PD_IoControl(unsigned char Channel,char * Number, char *Statue);
    const char * I2cWrite(unsigned char I2cNum, unsigned char DeviceAdd, char *pData, unsigned char Len);
    const char * I2cRead(unsigned char I2cNum, unsigned char DeviceAdd, char *pSendData, unsigned char SendLen, unsigned char RevLen);
    const char * LogPathSet(const char * Paths);
    const char * VersionRead(unsigned char Channel);
    const char * DumpStatue(unsigned char Channel);
    const char * DP_ReceiverWrite(unsigned char Channel,unsigned char Address, unsigned short InData);
    const char * DP_ReceiverRead(unsigned char Channel,unsigned char Address);
    const char * DP_Reset(unsigned char Channel);
    const char * DP_Init(unsigned char Channel);
    const char * DP_SendHpd(unsigned char Channel);
    const char * DP_Status(unsigned char Channel);
public:
    //uint16_t IO_Read(uint8_t Address);
    //const char * LogWrite(NSString *temp);
private:
    NSMutableString * VerInfo;
    NSMutableString * LogInfo;
    uint16_t IoData[2];
    //NSFileHandle * fh;
    cSerCoreBoard CoreBoard;
    cCat9555 IoExpander[2];
    cStdp4020 STDP4020[4];
    cPD_Controller PD_Controller[4];
};
