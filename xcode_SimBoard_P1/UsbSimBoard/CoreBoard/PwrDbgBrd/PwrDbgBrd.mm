//
//  PwrDbgBrd.m
//  PwrDbgBrd
//
//  Created by AndersonHan on 16/7/6.
//  Copyright © 2016年 AndersonHan. All rights reserved.
//
#import "PwrDbgBrd.h"
#import "Config.h"
/**********************************************public**********************************************/

char * cPwrDbgBrd::SystemInit(char * Dev)
{
    char *ReturnData;
    IOExt1.SetAddress(Cat9555_1_ADDRESS);
    IOExt2.SetAddress(Cat9555_2_ADDRESS);
    IOExt1.SetI2cNumber(CAT9555_1_I2C_NUMBER);
    IOExt2.SetI2cNumber(CAT9555_2_I2C_NUMBER);
    IOExt1.SetSerialPort(&SerPort);
    IOExt2.SetSerialPort(&SerPort);
    Dac.SetLdac(DAC_LDAC_NUMBER);
    Dac.SetClr(DAC_CLR_NUMBER);
    Dac.SetI2cNumber(DAC_I2C_NUMBER);
    Dac.SetAddress(DAC_ADDRESS);
    Dac.SetSerialPort(&SerPort);
    Dac.SetI2cNumber(DAC_I2C_NUMBER);
    Dmm.SetI2cNumber(DMM_I2C_NUMBER);
    Dmm.SetSerialPort(&SerPort);
    Dmm.SetBit1(DMM_BIT1);
    Dmm.SetBit2(DMM_BIT2);
    Dmm.SetBit3(DMM_BIT3);
    Dmm.SetCat9555(&IOExt1);
    Dmm.SetSpiNumber(DMM_SPI_NUMBER);
    Dmm.SetEepromAddress(DMM_EEPROM_ADDRESS);
    PowerBoard.SetEepromAddress(POW_BRD_EEPROM_ADDRESS);
    PowerBoard.SetCat9555(&IOExt1);
    PowerBoard.SetSerialPort(&SerPort);
    PowerBoard.SetI2cNumber(POW_BRD_I2C_NUMBER);
    PowerBoard.SetBatEn(POW_BRD_BAT_EN);
    PowerBoard.SetMainEn(POW_BRD_MAIN_EN);
    PowerBoard.SetVrectEn(POW_BRD_VRECT_EN);
    PowerBoard.SetDacAd5667(&Dac);
    //init
    IoStatue1 = 0x0800;
    IoStatue2 = 0x0400;
    SerPort.Open("/dev/cu.usbmodemVer11");
    
    ReturnData = IOExt1.Setoutput(IoStatue1);
    NSLog(@"%s\r",ReturnData);
    ReturnData = IOExt2.Setoutput(IoStatue2);
    NSLog(@"%s\r",ReturnData);
    sleep(1);
    ReturnData = IOExt1.Config(0x0000);    //POWER ON
    NSLog(@"%s\r",ReturnData);
    IOExt2.Config(0xF000);
    Dac.Close();
    return Dmm.DmmInit();
    
}
char * cPwrDbgBrd::PowerOn(void)
{
    
    return 0;
}
char * cPwrDbgBrd::PowerOff(void)
{

    return 0;
}
char * cPwrDbgBrd::ItemSet(unsigned char Items)
{

    return 0;
}
char * cPwrDbgBrd::CurrentSet(float InputDataMv)
{
    return 0;
}
float cPwrDbgBrd::ReadVoltage(unsigned char Channel)
{
    return 0;
}
char * cPwrDbgBrd::ReadPowerEeprom(unsigned char Address, unsigned char Len)
{
    return 0;
}
char * cPwrDbgBrd::WritePowerEeprom(unsigned char Address, char * pData)
{
    return 0;
}
char * cPwrDbgBrd::SetPowerOutputVoltage(unsigned char Channel, float SetData)
{
    return 0;
}
