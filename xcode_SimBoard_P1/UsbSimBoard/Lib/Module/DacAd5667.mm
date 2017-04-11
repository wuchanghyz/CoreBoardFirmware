#include "DacAd5667.h"

void cDacAd5667::SetLdac(uint8_t value)
{
    Ldac = value;
}
void cDacAd5667::SetClr(uint8_t value)
{
    Clr = value;
}
void  cDacAd5667::SetAddress(uint8_t value)
{
    Address = value;
}
void cDacAd5667::SetCat9555(cCat9555 *pData)
{
    pCat9555 = pData;
}
void cDacAd5667::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
void cDacAd5667::SetI2cNumber(I2cChannel_t InputData)
{
    I2cNumber = InputData;
}

char * cDacAd5667::SetVoltage(float VlotageMv, uint8_t Channel)
{
    uint16_t temp;
    uint8_t InputData[3];
    InputData[0] = 0x18|Channel;
    temp = VlotageMv*0xffff/(2500*2.1);
    InputData[1] = (uint8_t)((temp>>8)&0xff);
    InputData[2] = (uint8_t)(temp&0xff);
    return pSerialPort->I2cWrite(I2cNumber, Address, InputData, 3);
}
char * cDacAd5667::Close(void)
{
    uint8_t InputData[3];
    InputData[0] = 0x18;
    InputData[1] = 0x00;
    InputData[2] = 0x00;
    pSerialPort->I2cWrite(I2cNumber, Address, InputData, 3);
    InputData[0] = 0x19;
    return pSerialPort->I2cWrite(I2cNumber, Address, InputData, 3);
}
