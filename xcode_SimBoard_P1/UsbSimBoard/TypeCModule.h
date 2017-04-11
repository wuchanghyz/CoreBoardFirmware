//
//  TypeCModule.h
//  CoreBoard
//
//  Created by anderson on 17/2/18.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#ifndef TypeCModule_h
#define TypeCModule_h


#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "CRS232.h"
#import "STDP4020.h"
#import "PD_Controller.h"

class cTypeCModule
{
public:
    cTypeCModule(void);
    ~cTypeCModule(void);
public:
    void SetI2cNumber(I2cChannel_t InputData);
    void SetSerialPort(cSerCoreBoard *pData);

public:
    const char * BoardInit(void);
    const char * CCLogicSwitch(unsigned char Channel, unsigned char Statue); //0-top 1-bottom
    const char * Usb2Switch(unsigned char Channel, unsigned char Statue); //0-disk 1-charger
    const char * TypeC_EloadSwitch(unsigned char Channel);    //eload mosfet
    const char * DP_Init(unsigned char Channel);
    const char * DP_Status(unsigned char Channel);
    const char * DP_ReceiverWrite(unsigned char Channel,unsigned char Address, unsigned short InData);
    const char * DP_ReceiverRead(unsigned char Channel,unsigned char Address);
    const char * TypeC_ChargeSwitch(unsigned char Channel,unsigned char Address); //0-discharge 1 charge
    
    const char * TypeAUsb3RedriverWrite(unsigned char TxData, unsigned char RxData);//usb3.0
    const char * TypeAUsb3RedriverRead(void);
    const char * TypeAPower(unsigned char Channel, unsigned char Statue) // 0-power off, 1-power on
    const char * TypeAUsbSwitch(unsigned char Channel, unsigned char Statue)  //0-usb2.0 1-usb3.0
    const char * TypeAEloadSwitch(unsigned char Channel);
    
    
private:
    uint16_t IO_Read(uint8_t Address);
    
private:
    cSerCoreBoard *CoreBoard;
    cStdp4020 STDP4020[2];
    cPD_Controller PD_Controller[2];

};

#endif /* TypeCModule_h */
