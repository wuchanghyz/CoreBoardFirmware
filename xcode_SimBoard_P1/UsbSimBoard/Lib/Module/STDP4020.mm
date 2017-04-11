//
//  STDP4020.m
//  CoreBoard
//
//  Created by anderson on 17/1/7.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDP4020.h"
/*
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
    uint8_t Buffer[3];
    Buffer[0] = 0x06;
    Buffer[1] =CfgData&0x00ff;
    Buffer[2] = (CfgData>>8)&0xff;
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);
}
char * cCat9555::Setoutput(uint16_t InputData)
{
    uint8_t Buffer[3];
    Buffer[0] = 0x02;
    Buffer[1] =InputData&0x00ff;
    Buffer[2] = (InputData>>8)&0xff;
    return pSerialPort->I2cWrite(I2cNumber, DeviceAddress, Buffer, 3);
}
char * cCat9555::GetInput(uint16_t *DataStatue)
{
    uint8_t i = 0x00;
    
    return pSerialPort->I2cRead(I2cNumber, DeviceAddress, &i, 1, 2);
    
}

*/
