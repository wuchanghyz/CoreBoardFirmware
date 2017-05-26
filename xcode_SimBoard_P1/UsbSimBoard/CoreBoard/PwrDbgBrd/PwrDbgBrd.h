//
//  PwrDbgBrd.h
//  PwrDbgBrd
//
//  Created by AndersonHan on 16/7/6.
//  Copyright © 2016年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRS232.h"
#import "Cat9555.h"
#import "DacAd5667.h"
#import "PowerBoard.h"
#import "DmmBoard.h"

class cPwrDbgBrd
{
public:
    cPwrDbgBrd(){}
    ~cPwrDbgBrd(){}
public:
    char * SystemInit(char *Dev);
    char * PowerOn(void);
    char * PowerOff(void);
    char * ItemSet(unsigned char Items);
    char * CurrentSet(float InputDataMv);
    float ReadVoltage(unsigned char Channel);
    char * ReadPowerEeprom(unsigned char Address, unsigned char Len);
    char * WritePowerEeprom(unsigned char Address, char * pData);
    char * SetPowerOutputVoltage(unsigned char Channel, float SetData);

   
private:
    cSerCoreBoard SerPort;
    cCat9555 IOExt1;
    cCat9555 IOExt2;
    cDmmBoard Dmm;
    cDacAd5667 Dac;
    cPowerBoard PowerBoard;
    uint16_t  IoStatue1,IoStatue2;
};