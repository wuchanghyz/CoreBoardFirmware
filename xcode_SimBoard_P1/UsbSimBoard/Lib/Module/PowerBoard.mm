
#include "PowerBoard.h"
#include "string.h"
void cPowerBoard::SetBatEn(uint8_t value)
{
    BitBatEn = value;
}
void cPowerBoard::SetVrectEn(uint8_t value)
{
    BitVrecten = value;
}
void cPowerBoard::SetMainEn(uint8_t value)
{
    BitMainEn = value;
}
void cPowerBoard::SetCat9555(cCat9555 *pData)
{
    pCat9555 = pData;
}
void cPowerBoard::SetDacAd5667(cDacAd5667 *pData)
{
    pDacAd5667 = pData;
}
void cPowerBoard::SetEepromAddress(uint8_t value)
{
    EepromAddress = value;
}
void cPowerBoard::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
void cPowerBoard::SetI2cNumber(I2cChannel_t value)
{
    I2cNumber = value;
}

uint8_t cPowerBoard::SetBattVoltage(float Voltage)
{
    return 0;
}
uint8_t cPowerBoard::SetMainVoltage(float Voltage)
{
    return 0;
}
uint8_t cPowerBoard::SetVrectVoltage(float Voltage)
{
    return 0;
}
uint8_t cPowerBoard::SetEloadCurrent(float Current)
{
    return 0;
}
uint8_t cPowerBoard::ReadBattCurrent(float Current)
{
    return 0;
}
uint8_t cPowerBoard::ReadMainCurrent(float Current)
{
    return 0;
}
uint8_t cPowerBoard::ReadVrectCurrent(float Current)
{
    return 0;
}
uint8_t cPowerBoard::ReadEloadCurrent(float Current)
{
    return 0;
}

char * cPowerBoard::WriteEeprom(uint8_t Address, uint8_t *pData, uint8_t Len)
{
    uint8_t buffer[256]={0};
    uint8_t i;
    buffer[0]=Address;
    for(i=1;i<Len+1;i++)
    {
        buffer[i] = *pData++;
        
    }
    return pSerialPort->I2cWrite(I2cNumber, EepromAddress, buffer, Len+1);
    
}
char * cPowerBoard::ReadEeprom(uint8_t Address, uint8_t *pData, uint8_t Len)
{
    return pSerialPort->I2cRead(I2cNumber, EepromAddress, &Address, 1, Len);
    
}


