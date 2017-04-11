//
//  ArmDl.m
//  TCPIP
//
//  Created by IvanGan on 15/5/25.
//  Copyright (c) 2015年 IA. All rights reserved.
//

#include "SerialTestInterface.h"
#include "tolua++.h"
#include <Foundation/Foundation.h>

TOLUA_API int tolua_SerialTest_open (lua_State* tolua_S);

extern "C" int luaopen_libSerialTest(lua_State * state)
{
    NSLog(@"Load Test_IF Dylib\r\n");
    tolua_SerialTest_open(state);
    return 0;
}