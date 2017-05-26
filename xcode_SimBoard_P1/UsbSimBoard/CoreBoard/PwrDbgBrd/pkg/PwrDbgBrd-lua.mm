/*
** Lua binding: PwrDbgBrd
** Generated automatically by tolua++-1.0.92 on Thu Jul  7 14:17:47 2016.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_PwrDbgBrd_open (lua_State* tolua_S);

#include "PwrDbgBrd.h"

/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"cPwrDbgBrd");
}

/* method: SystemInit of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_SystemInit00
static int tolua_PwrDbgBrd_cPwrDbgBrd_SystemInit00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'SystemInit'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->SystemInit();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'SystemInit'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: PowerOn of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_PowerOn00
static int tolua_PwrDbgBrd_cPwrDbgBrd_PowerOn00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'PowerOn'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->PowerOn();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'PowerOn'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: PowerOff of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_PowerOff00
static int tolua_PwrDbgBrd_cPwrDbgBrd_PowerOff00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'PowerOff'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->PowerOff();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'PowerOff'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ItemSet of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_ItemSet00
static int tolua_PwrDbgBrd_cPwrDbgBrd_ItemSet00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Items = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ItemSet'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->ItemSet(Items);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ItemSet'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: CurrentSet of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_CurrentSet00
static int tolua_PwrDbgBrd_cPwrDbgBrd_CurrentSet00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
  float InputDataMv = ((float)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'CurrentSet'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->CurrentSet(InputDataMv);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'CurrentSet'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ReadVoltage of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_ReadVoltage00
static int tolua_PwrDbgBrd_cPwrDbgBrd_ReadVoltage00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ReadVoltage'", NULL);
#endif
  {
   float tolua_ret = (float)  self->ReadVoltage(Channel);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ReadVoltage'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ReadPowerEeprom of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_ReadPowerEeprom00
static int tolua_PwrDbgBrd_cPwrDbgBrd_ReadPowerEeprom00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Address = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Len = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ReadPowerEeprom'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->ReadPowerEeprom(Address,Len);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ReadPowerEeprom'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: WritePowerEeprom of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_WritePowerEeprom00
static int tolua_PwrDbgBrd_cPwrDbgBrd_WritePowerEeprom00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Address = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  char* pData = ((char*)  tolua_tostring(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'WritePowerEeprom'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->WritePowerEeprom(Address,pData);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'WritePowerEeprom'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: SetPowerOutputVoltage of class  cPwrDbgBrd */
#ifndef TOLUA_DISABLE_tolua_PwrDbgBrd_cPwrDbgBrd_SetPowerOutputVoltage00
static int tolua_PwrDbgBrd_cPwrDbgBrd_SetPowerOutputVoltage00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cPwrDbgBrd",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cPwrDbgBrd* self = (cPwrDbgBrd*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  float SetData = ((float)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'SetPowerOutputVoltage'", NULL);
#endif
  {
   char* tolua_ret = (char*)  self->SetPowerOutputVoltage(Channel,SetData);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'SetPowerOutputVoltage'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_PwrDbgBrd_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  tolua_cclass(tolua_S,"cPwrDbgBrd","cPwrDbgBrd","",NULL);
  tolua_beginmodule(tolua_S,"cPwrDbgBrd");
   tolua_function(tolua_S,"SystemInit",tolua_PwrDbgBrd_cPwrDbgBrd_SystemInit00);
   tolua_function(tolua_S,"PowerOn",tolua_PwrDbgBrd_cPwrDbgBrd_PowerOn00);
   tolua_function(tolua_S,"PowerOff",tolua_PwrDbgBrd_cPwrDbgBrd_PowerOff00);
   tolua_function(tolua_S,"ItemSet",tolua_PwrDbgBrd_cPwrDbgBrd_ItemSet00);
   tolua_function(tolua_S,"CurrentSet",tolua_PwrDbgBrd_cPwrDbgBrd_CurrentSet00);
   tolua_function(tolua_S,"ReadVoltage",tolua_PwrDbgBrd_cPwrDbgBrd_ReadVoltage00);
   tolua_function(tolua_S,"ReadPowerEeprom",tolua_PwrDbgBrd_cPwrDbgBrd_ReadPowerEeprom00);
   tolua_function(tolua_S,"WritePowerEeprom",tolua_PwrDbgBrd_cPwrDbgBrd_WritePowerEeprom00);
   tolua_function(tolua_S,"SetPowerOutputVoltage",tolua_PwrDbgBrd_cPwrDbgBrd_SetPowerOutputVoltage00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_PwrDbgBrd (lua_State* tolua_S) {
 return tolua_PwrDbgBrd_open(tolua_S);
};
#endif

