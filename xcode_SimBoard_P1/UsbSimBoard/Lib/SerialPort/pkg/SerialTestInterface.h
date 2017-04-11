//
//  ArmDl.h
//  TCPIP
//
//  Created by IvanGan on 15/5/25.
//  Copyright (c) 2015年 IA. All rights reserved.
//

#ifndef _POWER_DEBUG_BOARD_INTERFACE_H_
#define _POWER_DEBUG_BOARD_INTERFACE_H_

#include "lua.hpp"

//#define DL_EXPORT __attribute__((visibility("default")))

#include <stdio.h>

extern "C" int luaopen_libSerialTest(lua_State * state);

#endif
