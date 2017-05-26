//
//  RE_MUX.h
//  CoreBoard
//
//  Created by anderson on 17/1/7.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#ifndef RE_MUX_h
#define RE_MUX_h

#include "stdint.h"
#include "CRS232.h"

class cReMux
{
public:
    cReMux(){}
    ~cReMux(){}
public:
    void SetAddress(uint8_t InputData);
    void SetI2cNumber(I2cChannel_t InputData);
    void SetSerialPort(cSerCoreBoard *pData);
public:
    //set output
    char * Setoutput(uint16_t InputData);
    char * GetInput(void);
    
private:
    uint8_t DeviceAddress;
    I2cChannel_t I2cNumber;
    cSerCoreBoard *pSerialPort;
};

class cDP_Redriver
{
    
    //0XE0
    public:
    cDP_Redriver(){}
    ~cDP_Redriver(){}
    public:
    void SetAddress(uint8_t InputData);
    void SetI2cNumber(I2cChannel_t InputData);
    void SetSerialPort(cSerCoreBoard *pData);
    public:
    //set output
    char * Setoutput(uint8_t InputData);
    char * GetInput(void);
    
    private:
    uint8_t DeviceAddress;
    I2cChannel_t I2cNumber;
    cSerCoreBoard *pSerialPort;
};

#endif /* RE_MUX_h */
