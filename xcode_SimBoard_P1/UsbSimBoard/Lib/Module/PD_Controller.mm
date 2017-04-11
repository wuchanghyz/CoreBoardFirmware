//
//  PD_Controller.m
//  CoreBoard
//
//  Created by anderson on 17/2/18.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PD_Controller.h"


//0X73

void cPD_Controller::SetAddress(uint8_t InputData)
{
    DeviceAddress = InputData;
}
void cPD_Controller::SetI2cNumber(I2cChannel_t InputData)
{
    I2cNumber = InputData;
}
void cPD_Controller::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
char * cPD_Controller::Setoutput(uint8_t Address, uint16_t InData)
{
    
    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x %02x",Address,(uint8_t)((InData>>8)&0x00ff),(uint8_t)InData&0x00ff];
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);
}
char * cPD_Controller::GetInput(uint8_t Address)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x",Address];
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, Buffer, 1, 2);
    return (char *)"ok";
}
char * cPD_Controller::SendCommend(char * pCmd, char * pData)
{
    uint8_t i;
    
    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x %@",0x09,1,[NSString stringWithUTF8String:pData]];
    pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);

    Buffer = [NSString stringWithFormat:@"%02x %02x",0x08,4];
    for(i=0;i<4;i++)
    {
        Buffer = [Buffer stringByAppendingFormat:@" %02x",(uint8_t)*pCmd++];
    }
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 6);
    
}
char * cPD_Controller::ReadStatue(void)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x",0x09];
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, Buffer, 1, 65);
}
