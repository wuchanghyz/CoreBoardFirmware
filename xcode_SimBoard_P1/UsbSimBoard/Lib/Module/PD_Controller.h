//
//  PD_Controller.h
//  CoreBoard
//
//  Created by anderson on 17/2/18.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#ifndef PD_Controller_h
#define PD_Controller_h

#include "stdint.h"
#include "CRS232.h"

class cPD_Controller
{
public:
    cPD_Controller(){}
    ~cPD_Controller(){}
public:
    void SetAddress(uint8_t InputData);
    void SetI2cNumber(I2cChannel_t InputData);
    void SetSerialPort(cSerCoreBoard *pData);
public:
    //set output
    char * Setoutput(uint8_t Address, uint16_t InData);
    
    //get input
    char * GetInput(uint8_t Address, uint8_t Len);
    
    char * SendCommend(char * Cmd, char * Data);
    char * ReadStatue(void);
    
private:
    uint8_t DeviceAddress;
    I2cChannel_t I2cNumber;
    cSerCoreBoard *pSerialPort;
};

#endif /* PD_Controller_h */
