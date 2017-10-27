//
//  main.m
//  MAC_MAIN
//
//  Created by anderson on 17/10/13.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "PD_String.h"




int main(int argc, const char * argv[]) {
   char *buffers = "[],I2C,4,04 00 00 05,\r\n";
    char *versons="[],I2C,4,08 30 31 32 33 34 35 36 37 38,\r\n";
    printf(PD_Version(versons));
    
    printf(CC_State(buffers));
    return 0;
}
