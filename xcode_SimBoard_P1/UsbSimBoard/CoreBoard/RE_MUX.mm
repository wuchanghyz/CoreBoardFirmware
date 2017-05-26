//
//  RE_MUX.m
//  CoreBoard
//
//  Created by anderson on 17/1/7.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RE_MUX.h"

void cReMux::SetAddress(uint8_t InputData)
{
    DeviceAddress = InputData;
}
void cReMux::SetI2cNumber(I2cChannel_t InputData)
{
    I2cNumber = InputData;
}
void cReMux::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
char * cReMux::Setoutput(uint16_t InputData)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x",(uint8_t)(InputData>>8)&0xff,
                        (uint8_t)InputData&0x00ff];
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 2);}
char * cReMux::GetInput(void)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x",0];
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, Buffer, 0, 2);
    
}

//DP Redriver

void cDP_Redriver::SetAddress(uint8_t InputData)
{
    DeviceAddress = InputData;
}
void cDP_Redriver::SetI2cNumber(I2cChannel_t InputData)
{
    I2cNumber = InputData;
}
void cDP_Redriver::SetSerialPort(cSerCoreBoard *pData)
{
    pSerialPort = pData;
}
char * cDP_Redriver::Setoutput(uint8_t InputData)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x %02x",(uint8_t)(InputData>>8)&0xff,
                        (uint8_t)InputData&0x00ff];
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 2);}
char * cDP_Redriver::GetInput(void)
{
    NSString *Buffer = [NSString stringWithFormat:@"%02x",0];
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, Buffer, 0, 2);
    
}
