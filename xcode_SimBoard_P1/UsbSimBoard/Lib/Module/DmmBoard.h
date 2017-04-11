#ifndef __DMM_BOARD_H__
#define __DMM_BOARD_H__

#include "stdint.h"
#include "CRS232.h"
#include "Cat9555.h"
#include "DacAd5667.h"

class cDmmBoard
{
public:
    cDmmBoard(){}
    ~cDmmBoard(){}
public:
    void SetBit1(uint8_t value);
    void SetBit2(uint8_t value);
    void SetBit3(uint8_t value);
    void SetCat9555(cCat9555 *pData);
    void SetEepromAddress(uint8_t value);
    void SetSerialPort(cSerCoreBoard *pData);
    void SetI2cNumber(I2cChannel_t value);
    void SetSpiNumber(SpiChannel_t value);
public:
    char * DmmInit(void);
    char * WriteEeprom(uint8_t Address, uint8_t *pData, uint8_t Len);
    char * ReadDmmEeprom(uint8_t Address, uint8_t Len);
    char * ReadVoltage(float *VoltageMv);
    char * ReadCurrentLow(float *CurrentMv);
    char * ReadCurrentHigh(float *CurrentMv);
private:
    cCat9555 *pCat9555;
    uint8_t Bit1;
    uint8_t Bit2;
    uint8_t Bit3;
    
    float VoltageGain;
    float VoltageOffset;
    float CurrentHighGain;
    float CurrentLowGain;
    float CurrentHighOffset;
    float CurrentLowOffset;
    uint8_t I2cAddress;
    cSerCoreBoard *pSerialPort;
    I2cChannel_t I2cNumber;
    SpiChannel_t SpiNum;
    
    
};

#endif
