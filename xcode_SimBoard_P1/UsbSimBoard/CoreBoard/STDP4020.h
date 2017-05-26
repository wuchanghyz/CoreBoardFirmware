//
//  STDP4020.h
//  CoreBoard
//
//  Created by anderson on 17/1/7.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#ifndef STDP4020_h
#define STDP4020_h

#include "stdint.h"
#include "CRS232.h"

class cStdp4020
{
public:
    cStdp4020(){}
    ~cStdp4020(){}
public:
    void SetAddress(uint8_t InputData);
    void SetI2cNumber(I2cChannel_t InputData);
    void SetSerialPort(cSerCoreBoard *pData);
public:
    //set output
    char * Setoutput(uint8_t Address, uint16_t InData);

    //get input
    char * GetInput(uint8_t Address);

private:
    uint8_t DeviceAddress;
    I2cChannel_t I2cNumber;
    cSerCoreBoard *pSerialPort;
};

#endif /* STDP4020_h */
