#ifndef __POWER_BOARD_H__
#define __POWER_BOARD_H__

#include "stdint.h"
#include "CRS232.h"
#include "DacAd5667.h"
#include "Cat9555.h"

class cPowerBoard
{
public:
    cPowerBoard(){}
    ~cPowerBoard(){}
public:
    void SetBatEn(uint8_t value);
    void SetVrectEn(uint8_t value);
    void SetMainEn(uint8_t value);
    void SetCat9555(cCat9555 *pData);
    void SetDacAd5667(cDacAd5667 *pData);
    void SetEepromAddress(uint8_t value);
    void SetSerialPort(cSerCoreBoard *pData);
    void SetI2cNumber(I2cChannel_t value);
public:
    uint8_t SetBattVoltage(float Voltage);
    uint8_t SetMainVoltage(float Voltage);
    uint8_t SetVrectVoltage(float Voltage);
    uint8_t SetEloadCurrent(float Current);
    uint8_t ReadBattCurrent(float Current);
    uint8_t ReadMainCurrent(float Current);
    uint8_t ReadVrectCurrent(float Current);
    uint8_t ReadEloadCurrent(float Current);
    
    char * WriteEeprom(uint8_t Address, uint8_t *pData, uint8_t Len);
    char * ReadEeprom(uint8_t Address, uint8_t *pData, uint8_t Len);;
    
private:
    cSerCoreBoard *pSerialPort;
    cCat9555 *pCat9555;
    cDacAd5667 *pDacAd5667;
    uint8_t BitBatEn;
    uint8_t BitVrecten;
    uint8_t BitMainEn;
    uint8_t EepromAddress;
    I2cChannel_t I2cNumber;
    
};


#endif
