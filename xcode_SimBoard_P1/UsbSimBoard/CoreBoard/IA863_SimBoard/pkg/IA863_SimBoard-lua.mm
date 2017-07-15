/*
** Lua binding: IA863_SimBoard
** Generated automatically by tolua++-1.0.92 on Fri Jul 14 14:23:56 2017.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_IA863_SimBoard_open (lua_State* tolua_S);

#include "IA863_SimBoard.h"

/* function to release collected object via destructor */
#ifdef __cplusplus

static int tolua_collect_cIA863_SimBoard (lua_State* tolua_S)
{
 cIA863_SimBoard* self = (cIA863_SimBoard*) tolua_tousertype(tolua_S,1,0);
	Mtolua_delete(self);
	return 0;
}
#endif


/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"cIA863_SimBoard");
 tolua_usertype(tolua_S,"uint16_t");
}

/* method: new of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_new00
static int tolua_IA863_SimBoard_cIA863_SimBoard_new00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   cIA863_SimBoard* tolua_ret = (cIA863_SimBoard*)  Mtolua_new((cIA863_SimBoard)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"cIA863_SimBoard");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'new'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: new_local of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_new00_local
static int tolua_IA863_SimBoard_cIA863_SimBoard_new00_local(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   cIA863_SimBoard* tolua_ret = (cIA863_SimBoard*)  Mtolua_new((cIA863_SimBoard)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"cIA863_SimBoard");
    tolua_register_gc(tolua_S,lua_gettop(tolua_S));
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'new'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: delete of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_delete00
static int tolua_IA863_SimBoard_cIA863_SimBoard_delete00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'delete'", NULL);
#endif
  Mtolua_delete(self);
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'delete'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: SelfTest of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_SelfTest00
static int tolua_IA863_SimBoard_cIA863_SimBoard_SelfTest00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'SelfTest'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->SelfTest();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'SelfTest'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: BoardInit of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_BoardInit00
static int tolua_IA863_SimBoard_cIA863_SimBoard_BoardInit00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  char* Items = ((char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'BoardInit'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->BoardInit(Items);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'BoardInit'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: USBA_Items of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_USBA_Items00
static int tolua_IA863_SimBoard_cIA863_SimBoard_USBA_Items00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,4,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  const char* Items = ((const char*)  tolua_tostring(tolua_S,3,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,4,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'USBA_Items'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->USBA_Items(Channel,Items,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'USBA_Items'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: USBC_Items of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_USBC_Items00
static int tolua_IA863_SimBoard_cIA863_SimBoard_USBC_Items00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,4,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  const char* Items = ((const char*)  tolua_tostring(tolua_S,3,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,4,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'USBC_Items'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->USBC_Items(Channel,Items,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'USBC_Items'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ResetAll of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_ResetAll00
static int tolua_IA863_SimBoard_cIA863_SimBoard_ResetAll00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  char* Items = ((char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ResetAll'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->ResetAll(Items);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ResetAll'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: GetLogInfo of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_GetLogInfo00
static int tolua_IA863_SimBoard_cIA863_SimBoard_GetLogInfo00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'GetLogInfo'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->GetLogInfo();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'GetLogInfo'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ClearLogInfo of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_ClearLogInfo00
static int tolua_IA863_SimBoard_cIA863_SimBoard_ClearLogInfo00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ClearLogInfo'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->ClearLogInfo();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ClearLogInfo'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: Help of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_Help00
static int tolua_IA863_SimBoard_cIA863_SimBoard_Help00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'Help'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->Help();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'Help'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: PD_IoControl of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_PD_IoControl00
static int tolua_IA863_SimBoard_cIA863_SimBoard_PD_IoControl00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isstring(tolua_S,4,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  char* Number = ((char*)  tolua_tostring(tolua_S,3,0));
  char* Statue = ((char*)  tolua_tostring(tolua_S,4,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'PD_IoControl'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->PD_IoControl(Channel,Number,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'PD_IoControl'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: Cat9555_IoControl of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_Cat9555_IoControl00
static int tolua_IA863_SimBoard_cIA863_SimBoard_Cat9555_IoControl00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,3,&tolua_err) || !tolua_isusertype(tolua_S,3,"uint16_t",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  uint16_t IoData = *((uint16_t*)  tolua_tousertype(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'Cat9555_IoControl'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->Cat9555_IoControl(Channel,IoData);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'Cat9555_IoControl'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: I2cWrite of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_I2cWrite00
static int tolua_IA863_SimBoard_cIA863_SimBoard_I2cWrite00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isstring(tolua_S,4,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,5,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,6,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char I2cNum = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char DeviceAdd = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
  char* pData = ((char*)  tolua_tostring(tolua_S,4,0));
  unsigned char Len = ((unsigned char)  tolua_tonumber(tolua_S,5,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'I2cWrite'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->I2cWrite(I2cNum,DeviceAdd,pData,Len);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'I2cWrite'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: I2cRead of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_I2cRead00
static int tolua_IA863_SimBoard_cIA863_SimBoard_I2cRead00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isstring(tolua_S,4,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,5,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,6,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,7,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char I2cNum = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char DeviceAdd = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
  char* pSendData = ((char*)  tolua_tostring(tolua_S,4,0));
  unsigned char SendLen = ((unsigned char)  tolua_tonumber(tolua_S,5,0));
  unsigned char RevLen = ((unsigned char)  tolua_tonumber(tolua_S,6,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'I2cRead'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->I2cRead(I2cNum,DeviceAdd,pSendData,SendLen,RevLen);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'I2cRead'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_IA863_SimBoard_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  #ifdef __cplusplus
  tolua_cclass(tolua_S,"cIA863_SimBoard","cIA863_SimBoard","",tolua_collect_cIA863_SimBoard);
  #else
  tolua_cclass(tolua_S,"cIA863_SimBoard","cIA863_SimBoard","",NULL);
  #endif
  tolua_beginmodule(tolua_S,"cIA863_SimBoard");
   tolua_function(tolua_S,"new",tolua_IA863_SimBoard_cIA863_SimBoard_new00);
   tolua_function(tolua_S,"new_local",tolua_IA863_SimBoard_cIA863_SimBoard_new00_local);
   tolua_function(tolua_S,".call",tolua_IA863_SimBoard_cIA863_SimBoard_new00_local);
   tolua_function(tolua_S,"delete",tolua_IA863_SimBoard_cIA863_SimBoard_delete00);
   tolua_function(tolua_S,"SelfTest",tolua_IA863_SimBoard_cIA863_SimBoard_SelfTest00);
   tolua_function(tolua_S,"BoardInit",tolua_IA863_SimBoard_cIA863_SimBoard_BoardInit00);
   tolua_function(tolua_S,"USBA_Items",tolua_IA863_SimBoard_cIA863_SimBoard_USBA_Items00);
   tolua_function(tolua_S,"USBC_Items",tolua_IA863_SimBoard_cIA863_SimBoard_USBC_Items00);
   tolua_function(tolua_S,"ResetAll",tolua_IA863_SimBoard_cIA863_SimBoard_ResetAll00);
   tolua_function(tolua_S,"GetLogInfo",tolua_IA863_SimBoard_cIA863_SimBoard_GetLogInfo00);
   tolua_function(tolua_S,"ClearLogInfo",tolua_IA863_SimBoard_cIA863_SimBoard_ClearLogInfo00);
   tolua_function(tolua_S,"Help",tolua_IA863_SimBoard_cIA863_SimBoard_Help00);
   tolua_function(tolua_S,"PD_IoControl",tolua_IA863_SimBoard_cIA863_SimBoard_PD_IoControl00);
   tolua_function(tolua_S,"Cat9555_IoControl",tolua_IA863_SimBoard_cIA863_SimBoard_Cat9555_IoControl00);
   tolua_function(tolua_S,"I2cWrite",tolua_IA863_SimBoard_cIA863_SimBoard_I2cWrite00);
   tolua_function(tolua_S,"I2cRead",tolua_IA863_SimBoard_cIA863_SimBoard_I2cRead00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_IA863_SimBoard (lua_State* tolua_S) {
 return tolua_IA863_SimBoard_open(tolua_S);
};
#endif

