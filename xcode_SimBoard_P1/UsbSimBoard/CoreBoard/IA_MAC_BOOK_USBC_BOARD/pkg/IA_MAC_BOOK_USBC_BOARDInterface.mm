//
//  ArmDl.m
//  TCPIP
//
//  Created by IvanGan on 15/5/25.
//  Copyright (c) 2015年 IA. All rights reserved.
//

#include "IA_MAC_BOOK_USBC_BOARDInterface.h"
#include "tolua++.h"
#include <Foundation/Foundation.h>

TOLUA_API int tolua_IA_MAC_BOOK_USBC_BOARD_open (lua_State* tolua_S);

extern "C" int luaopen_libIA_MAC_BOOK_USBC_BOARD(lua_State * state)
{
    NSLog(@"Load libIA_MAC_BOOK_USBC_BOARD Dylib\r\n");
    tolua_IA_MAC_BOOK_USBC_BOARD_open(state);
    return 0;
}
