//
//  STDP4020.m
//  CoreBoard
//
//  Created by anderson on 17/1/7.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDP4020.h"

//0X73

void cStdp4020::SetAddress(uint8_t InputData)
{
    DeviceAddress = InputData;
}
void cStdp4020::SetI2cNumber(I2cChannel_t InputData)
{
    I2cNumber = InputData;
}
void cStdp4020::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
char * cStdp4020::Setoutput(uint8_t Address, uint16_t InData)
{

    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x %02x",Address,(uint8_t)((InData>>8)&0x00ff),(uint8_t)InData&0x00ff];
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);
}
char * cStdp4020::GetInput(uint8_t Address)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x",Address];
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, Buffer, 1, 2);
    return (char *)"ok";
}
