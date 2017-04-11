#include "DmmBoard.h"
#include "unistd.h"
static uint8_t DmmInitTable[]=
{
    0x01, 0x27, 0x0c,
    0x02, 0x09, 0x00,
    0x06, 0x08, 0x00,
    //CH REG
    0x10, 0x00, 0x01,
    0x11, 0x90, 0x62,
    0x12, 0x00, 0x01,
    0x13, 0x00, 0x01,
    //CFG REG
    0x20, 0x13, 0x20,
    0x21, 0x0f, 0x00,
    0x22, 0x13, 0x20,
    0x23, 0x13, 0x20,
    //FILT
    0x28, 0x05, 0x00,
    0x29, 0x0e, 0x14,
    0x2a, 0x05, 0x00,
    0x2b, 0x05, 0x00,
/*
    0x10, 0x00, 0x01,
    0x11, 0x90, 0x62,
    0x12, 0x00, 0x01,
    0x13, 0x00, 0x01,
    //CFG REG
    0x20, 0x1f, 0x00,
    0x21, 0x1f, 0x00,
    0x22, 0x1f, 0x00,
    0x23, 0x1f, 0x00,
    //FILT
    0x28, 0x05, 0x00,
    0x29, 0x05, 0x14,
    0x2a, 0x05, 0x00,
    0x2b, 0x05, 0x00,
*/
};

void cDmmBoard::SetBit1(uint8_t value)
{
    Bit1 = value;
}
void cDmmBoard::SetBit2(uint8_t value)
{
    Bit2 = value;
}
void cDmmBoard::SetBit3(uint8_t value)
{
    Bit3 = value;
}
void cDmmBoard::SetCat9555(cCat9555 *pData)
{
    pCat9555 = pData;
}
void cDmmBoard::SetEepromAddress(uint8_t value)
{
    I2cAddress = value;
}
void cDmmBoard::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
void cDmmBoard::SetI2cNumber(I2cChannel_t value)
{
    I2cNumber = value;
}
void cDmmBoard::SetSpiNumber(SpiChannel_t value)
{
    SpiNum = value;
}

//
char * cDmmBoard::WriteEeprom(uint8_t Address, uint8_t *pData, uint8_t Len)
{
    uint8_t buffer[256]={0};
    uint8_t i;
    buffer[0]=Address;
    for(i=1;i<Len+1;i++)
    {
        buffer[i] = *pData++;
    
    }
    return pSerialPort->I2cWrite(I2cNumber, I2cAddress, buffer, Len+1);
}
char * cDmmBoard::ReadDmmEeprom(uint8_t Address, uint8_t Len)
{
    
    return pSerialPort->I2cRead(I2cNumber, I2cAddress, &Address, 1, Len);
}

char * cDmmBoard::DmmInit(void)
{
    uint8_t i,j=0;
    char *ReturnData;
    uint8_t temp = 0;
    uint8_t Buffer[12] = {0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff};
    //reset
    ReturnData = pSerialPort->SpiWrite(SpiNum, Buffer, 1, &Buffer[1],7);
    
    if(strncmp(ReturnData, "Done.", 5))
    {
        NSLog(@"%s",ReturnData);
    }
    for(i=0;i<15;i++)
    {
        for(j=0;j<3;j++)
        {
            ReturnData = pSerialPort->SpiWrite(SpiNum, &DmmInitTable[i*3], 1, &DmmInitTable[i*3+1], 2);
            //NSLog(@"%s\r",ReturnData);
            temp = DmmInitTable[i*3]|0x40;
            ReturnData = pSerialPort->SpiRead(SpiNum, &temp, 1, 4);
            //NSLog(@"%s\r",ReturnData);
            if(((uint8_t)ReturnData[0] != DmmInitTable[i*3+1])||((uint8_t)ReturnData[1] != DmmInitTable[i*3+2]))
            {
                NSLog(@"DMM init Error\r");
            }
            else
            {
                break;
            }
            
        }
    
    }
    ReturnData[0] = 0;
    ReturnData =  this->ReadDmmEeprom(0x80, 14);
    if((uint8_t)ReturnData[0] == 1)
    {
        VoltageOffset = *(float *)&ReturnData[4];
        VoltageGain = *(float *)&ReturnData[8];
    }
    else
    {
        VoltageOffset = 0;
        VoltageGain = 1;
    }
    //ReturnData = ReadEeprom(0x8c, 14);
    if((uint8_t)ReturnData[0] == 1)
    {
        CurrentLowOffset = *(float *)&ReturnData[4];
        CurrentLowGain = *(float *)&ReturnData[8];
    }
    else
    {
        CurrentLowOffset = 0;
        CurrentLowGain = 1;
    }
    //ReturnData = ReadEeprom(0x98, 14);
    if((uint8_t)ReturnData[0] == 1)
    {
        CurrentHighOffset = *(float *)&ReturnData[4];
        CurrentHighGain = *(float *)&ReturnData[8];
    }
    else
    {
        CurrentHighOffset = 0;
        CurrentHighGain = 1;
    }
    return 0;
}
char * cDmmBoard::ReadVoltage(float *VoltageMv)
{
    uint8_t temp = 0x40;
    uint8_t WriteData[3] = {0x01, 0x80, 0x1c};
    char  *InputData;
    uint32_t a;
//    temp = 0x41;
//    if(pSerialPort->SpiRead(SpiNum, &temp, 1, InputData, 4))
//    {
//        return 2;
//    }
//    usleep(70);
    pSerialPort->SpiWrite(SpiNum, WriteData, 1, &WriteData[1], 2);
    sleep(1);
    temp = 0x44;
    InputData = pSerialPort->SpiRead(SpiNum, &temp, 1, 5);
    InputData[3] = InputData[0];
    InputData[0] = InputData[2];
    InputData[2] = InputData[3];
    InputData[3] = 0;
    a = *(uint32_t *)InputData;
    *VoltageMv = ((float)a/0xffffff)*5000;
//    *VoltageMv = ((*(uint32_t *)InputData)*5000*VoltageGain/0xffffff) + VoltageOffset;
    
    return (char *)"ok";
}
char * cDmmBoard::ReadCurrentLow(float *CurrentMv)
{
    return (char *)"none";
}
char * cDmmBoard::ReadCurrentHigh(float *CurrentMv)
{
    return (char *)"none";
}