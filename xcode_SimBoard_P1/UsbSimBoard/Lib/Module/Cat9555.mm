#include "Cat9555.h"
void cCat9555::SetAddress(uint8_t InputData)
{
    DeviceAddress = InputData;
}
void cCat9555::SetI2cNumber(I2cChannel_t InputData)
{
    I2cNumber = InputData;
}
void cCat9555::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}


char * cCat9555::Config(uint16_t CfgData)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x %02x",6,(uint8_t)CfgData&0x00ff,
                        (uint8_t)(CfgData>>8)&0xff];
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);
}
char * cCat9555::Setoutput(uint16_t InputData)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x %02x",2,(uint8_t)InputData&0xff,
                        (uint8_t)(InputData>>8)&0xff];
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);
}
char * cCat9555::GetInput(uint8_t Address)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x",Address];
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, Buffer, 1, 2);
}
