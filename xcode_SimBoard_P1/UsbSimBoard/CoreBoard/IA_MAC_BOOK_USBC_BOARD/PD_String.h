//
//  PD_String.h
//  CoreBoard
//
//  Created by anderson on 17/10/13.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#ifndef PD_String_h
#define PD_String_h

#include <stdio.h>
char * PD_Version(char * Inputdata, unsigned char Channel);
char * PD_Mode(char * Inputdata);
char * CC_State(char * Inputdata, unsigned char Channel);
char * ActiveRDO(char * Inputdata);
char * ActivePDO(char * Inputdata);
char * GPIO_State(char * Inputdata);

#endif /* PD_String_h */
