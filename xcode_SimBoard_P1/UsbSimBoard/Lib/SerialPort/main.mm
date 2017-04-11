//
//  main.cpp
//  SerialPort
//
//  Created by AndersonHan on 16/7/6.
//  Copyright © 2016年 AndersonHan. All rights reserved.
//

//#include "SerialPort.h"
#include <unistd.h>
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "CRS232.h"


int main(int argc, const char * argv[]) {
    // insert code here...
    
//    CSerialPort MyPort;
//    char* WrigeString = "It is a good example!\r\n";
//    char ReadString[100] = {0};
//    int a = 0;
//    std::cout << "Hello, World!\n";
//    
//    MyPort.connect("/dev/cu.usbserial-UUT2");
//    MyPort.set_opt(9600,8,'n',1);
//    MyPort.write(WrigeString,12);
//    sleep(2);
//    MyPort.read(ReadString, 12);
//    
//    
//    
    
//    while(1);
//    return 0;
    char *InData;
    uint8_t OutData[6] = {0x11,0x00,0x10,0x02,0x03,0x0};
    CRS232 * p = new CRS232();
    p->Open("/dev/cu.usbmodemVCP1231","9600,8,n,1");
    p->SetDetectString("\r");
    while(1)
    {
        p->WriteBytes(OutData, 6);
        //p->WriteString("Hello\r");
        p->WaitDetect(1000);
        //InData = (char *)p->ReadString();
        InData = (char *)p->ReadBytes();
        NSLog(@"Input data is : %s\r", InData);
        //sleep(1);
    }
    
    
}
