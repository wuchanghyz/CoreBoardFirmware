//
//  ArmDl.m
//  TCPIP
//
//  Created by IvanGan on 15/5/25.
//  Copyright (c) 2015年 IA. All rights reserved.
//

#include "PwrDbgBrdInterface.h"
#include "tolua++.h"
#include <Foundation/Foundation.h>

TOLUA_API int tolua_PwrDbgBrd_open (lua_State* tolua_S);

extern "C" int luaopen_libPwrDbgBrd(lua_State * state)
{
    NSLog(@"Load Test_IF Dylib\r\n");
    tolua_PwrDbgBrd_open(state);
    return 0;
}