#ifndef __DAC_AD5667_H__
#define __DAC_AD5667_H__

#include "stdint.h"
#include "CRS232.h"
#include "Cat9555.h"

class cDacAd5667
{
public:
    cDacAd5667(){}
    ~cDacAd5667(){}
public:
    void SetLdac(uint8_t value);
    void SetClr(uint8_t value);
    void SetAddress(uint8_t value);
    void SetCat9555(cCat9555 *pData);
    void SetSerialPort(cSerCoreBoard *pData);
    void SetI2cNumber(I2cChannel_t InputData);
public:
    //function
    char * SetVoltage(float VlotageMv, uint8_t Channel);
    char * Close(void);
private:
    uint8_t Address;
    uint8_t Ldac;
    uint8_t Clr;
    cCat9555 *pCat9555;
    
    I2cChannel_t I2cNumber;
    cSerCoreBoard *pSerialPort;
};

#endif
