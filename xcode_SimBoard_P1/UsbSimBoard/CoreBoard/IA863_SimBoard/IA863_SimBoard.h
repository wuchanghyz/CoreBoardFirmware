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

class cIA863_SimBoard
{
public:
    cIA863_SimBoard(void);
    ~cIA863_SimBoard(void);
public:
    const char * BoardInit(void);
    const char * USBA_Items(unsigned char Channel, const char * Items, unsigned char Statue); //--Channel=1,2,3,4 --Item=2.0,3.0,SD,ELOAD --Statue=0,1
    const char * USBC_Items(unsigned char Channel, const char * Items, unsigned char Statue); //--Channel=1,2,3,4 --Item=2.0,DP,ELOAD --Statue=0,1,2
    const char * ResetAll(void);
    const char * GetLogInfo(void);
    const char * ClearLogInfo(void);
    const char * Help(void);
    const char * PD_IoControl(unsigned char Channel,char * Number, char *Statue);
    const char * Cat9555_IoControl(unsigned char Channel,uint16_t IoData);
    const char * I2cWrite(unsigned char I2cNum, unsigned char DeviceAdd, char *pData, unsigned char Len);
    const char * I2cRead(unsigned char I2cNum, unsigned char DeviceAdd, char *pSendData, unsigned char SendLen, unsigned char RevLen);

public:
    const char * CCLogicSwitch(unsigned char Channel, unsigned char Statue); //0-top 1-bottom
    const char * TypeCUsb2Switch(unsigned char Channel, unsigned char Statue); //0-disk 1-charger
    const char * TypeC_EloadSwitch(unsigned char Channel,unsigned char Statue);    //eload mosfet
    const char * TypeC_ChargeSwitch(unsigned char Channel,unsigned char Statue); //0-discharge 1 charge
    const char * DP_Reset(unsigned char Channel);
    const char * DP_Init(unsigned char Channel);
    const char * DP_SendHpd(unsigned char Channel);
    const char * DP_Status(unsigned char Channel);
    const char * DP_ReceiverWrite(unsigned char Channel,unsigned char Address, unsigned short InData);
    const char * DP_ReceiverRead(unsigned char Channel,unsigned char Address);
    const char * DP_SBU_Switch(unsigned char Channel, unsigned char Statue);
    
    const char * TypeAUsb3RedriverWrite(unsigned char TxData, unsigned char RxData);//usb3.0
    const char * TypeAUsb3RedriverRead(void);
    const char * TypeAPower(unsigned char Channel, unsigned char Statue); // 0-power off, 1-power on
    const char * TypeAUsbSwitch(unsigned char Channel, unsigned char Statue);  //0-usb2.0 1-usb3.0
    const char * TypeAEloadSwitch(unsigned char Channel);
    const char * TypeASdCardSwitch(unsigned char Statue);
private:
    uint16_t IO_Read(uint8_t Address);
private:
    NSMutableString * VerInfo;
    NSMutableString * LogInfo;
    cSerCoreBoard CoreBoard;
    cCat9555 IoExpander[2];
    cStdp4020 STDP4020[4];
    cPD_Controller PD_Controller[4];
    
};
