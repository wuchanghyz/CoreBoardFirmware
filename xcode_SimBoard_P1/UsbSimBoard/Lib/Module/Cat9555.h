#ifndef __CAT9555_H__
#define __CAT9555_H__

#include "stdint.h"
#include "CRS232.h"
#include "Config.h"

class cCat9555
{
public:
    cCat9555(){}
    ~cCat9555(){}
public:
    void SetAddress(uint8_t InputData);
    void SetI2cNumber(I2cChannel_t InputData);
    void SetSerialPort(cSerCoreBoard *pData);
public:
    //config io as input or output
    char * Config(uint16_t CfgData);
    //set output
    char * Setoutput(uint16_t InputData);
    //get input
    char * GetInput(uint8_t Address);
private:
    uint8_t DeviceAddress;
    I2cChannel_t I2cNumber;
    cSerCoreBoard *pSerialPort;
};

#endif
