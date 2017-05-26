//
//  ArmDl.m
//  TCPIP
//
//  Created by IvanGan on 15/5/25.
//  Copyright (c) 2015年 IA. All rights reserved.
//

#include "IA863_SimBoardInterface.h"
#include "tolua++.h"
#include <Foundation/Foundation.h>

TOLUA_API int tolua_IA863_SimBoard_open (lua_State* tolua_S);

extern "C" int luaopen_libIA863_SimBoard(lua_State * state)
{
    NSLog(@"Load libIA863_SimBoard Dylib\r\n");
    tolua_IA863_SimBoard_open(state);
    return 0;
}
