//
//  main.m
//  PwrDbgBrd
//
//  Created by AndersonHan on 16/7/8.
//  Copyright © 2016年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "PwrDbgBrd.h"
#import "CRS232.h"
#import "Cat9555.h"

int main(int argc, const char * argv[]) {
   char * ReadData;
/*   cSerCoreBoard *p = new cSerCoreBoard();
    
    cSerCoreBoard *p2 = new cSerCoreBoard();
    cCat9555 *p1 = new cCat9555();
    
    
    p->Open("/dev/cu.usbmodemVCP1231");
    p->SetDetectString("\r");
    p->WriteString("Hello World\r");
    p->WaitDetect(1000);
    ReadData = (char *)p->ReadString();
    NSLog(@"@%s",ReadData);

    p2->Open("/dev/cu.usbmodemVCP1231");
    p1->SetSerialPort(p2);
    p1->SetAddress(Cat9555_1_ADDRESS);
    p1->SetAddress(Cat9555_2_ADDRESS);
    p1->SetI2cNumber(CAT9555_1_I2C_NUMBER);
    p1->SetI2cNumber(CAT9555_2_I2C_NUMBER);
    while(1)
    {
        ReadData = p1->Config(0x0000);
        NSLog(@"@%s",ReadData);
    }
 */
    cPwrDbgBrd *p = new cPwrDbgBrd();
    
    ReadData = p->SystemInit("/dev/cu.usbmodemVer11");
    NSLog(@"@%s",ReadData);
    
    
    return 0;
}
