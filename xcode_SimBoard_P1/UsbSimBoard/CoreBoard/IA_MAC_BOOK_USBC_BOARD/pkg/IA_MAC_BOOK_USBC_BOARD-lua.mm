/*
** Lua binding: IA_MAC_BOOK_USBC_BOARD
** Generated automatically by tolua++-1.0.92 on Sat Aug  5 14:22:32 2017.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_IA_MAC_BOOK_USBC_BOARD_open (lua_State* tolua_S);

#include "IA_MAC_BOOK_USBC_BOARD.h"

/* function to release collected object via destructor */
#ifdef __cplusplus

static int tolua_collect_cIA_MAC_BOOK_USBC_BOARD (lua_State* tolua_S)
{
 cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*) tolua_tousertype(tolua_S,1,0);
	Mtolua_delete(self);
	return 0;
}
#endif


/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"cIA_MAC_BOOK_USBC_BOARD");
}

/* method: new of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   cIA_MAC_BOOK_USBC_BOARD* tolua_ret = (cIA_MAC_BOOK_USBC_BOARD*)  Mtolua_new((cIA_MAC_BOOK_USBC_BOARD)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"cIA_MAC_BOOK_USBC_BOARD");
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

/* method: new_local of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00_local
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00_local(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   cIA_MAC_BOOK_USBC_BOARD* tolua_ret = (cIA_MAC_BOOK_USBC_BOARD*)  Mtolua_new((cIA_MAC_BOOK_USBC_BOARD)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"cIA_MAC_BOOK_USBC_BOARD");
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

/* method: delete of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_delete00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_delete00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
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

/* method: BoardInit of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_BoardInit00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_BoardInit00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  char* Dev = ((char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'BoardInit'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->BoardInit(Dev);
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

/* method: Open of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_Open00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_Open00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  char* Dev = ((char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'Open'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->Open(Dev);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'Open'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: Close of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_Close00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_Close00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'Close'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->Close();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'Close'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: PD_IoControl of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_PD_IoControl00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_PD_IoControl00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isstring(tolua_S,4,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
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

/* method: I2cWrite of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_I2cWrite00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_I2cWrite00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
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
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
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

/* method: I2cRead of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_I2cRead00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_I2cRead00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
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
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
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

/* method: LogPathSet of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_LogPathSet00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_LogPathSet00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  const char* Paths = ((const char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'LogPathSet'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->LogPathSet(Paths);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'LogPathSet'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_ReceiverWrite of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_ReceiverWrite00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_ReceiverWrite00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,4,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Address = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
  unsigned short InData = ((unsigned short)  tolua_tonumber(tolua_S,4,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_ReceiverWrite'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_ReceiverWrite(Channel,Address,InData);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_ReceiverWrite'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_ReceiverRead of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_ReceiverRead00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_ReceiverRead00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Address = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_ReceiverRead'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_ReceiverRead(Channel,Address);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_ReceiverRead'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_Reset of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Reset00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Reset00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_Reset'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_Reset(Channel);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_Reset'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_Init of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Init00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Init00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_Init'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_Init(Channel);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_Init'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_SendHpd of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_SendHpd00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_SendHpd00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_SendHpd'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_SendHpd(Channel);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_SendHpd'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_Status of class  cIA_MAC_BOOK_USBC_BOARD */
#ifndef TOLUA_DISABLE_tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Status00
static int tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Status00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA_MAC_BOOK_USBC_BOARD",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA_MAC_BOOK_USBC_BOARD* self = (cIA_MAC_BOOK_USBC_BOARD*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_Status'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_Status(Channel);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_Status'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_IA_MAC_BOOK_USBC_BOARD_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  #ifdef __cplusplus
  tolua_cclass(tolua_S,"cIA_MAC_BOOK_USBC_BOARD","cIA_MAC_BOOK_USBC_BOARD","",tolua_collect_cIA_MAC_BOOK_USBC_BOARD);
  #else
  tolua_cclass(tolua_S,"cIA_MAC_BOOK_USBC_BOARD","cIA_MAC_BOOK_USBC_BOARD","",NULL);
  #endif
  tolua_beginmodule(tolua_S,"cIA_MAC_BOOK_USBC_BOARD");
   tolua_function(tolua_S,"new",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00);
   tolua_function(tolua_S,"new_local",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00_local);
   tolua_function(tolua_S,".call",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_new00_local);
   tolua_function(tolua_S,"delete",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_delete00);
   tolua_function(tolua_S,"BoardInit",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_BoardInit00);
   tolua_function(tolua_S,"Open",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_Open00);
   tolua_function(tolua_S,"Close",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_Close00);
   tolua_function(tolua_S,"PD_IoControl",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_PD_IoControl00);
   tolua_function(tolua_S,"I2cWrite",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_I2cWrite00);
   tolua_function(tolua_S,"I2cRead",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_I2cRead00);
   tolua_function(tolua_S,"LogPathSet",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_LogPathSet00);
   tolua_function(tolua_S,"DP_ReceiverWrite",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_ReceiverWrite00);
   tolua_function(tolua_S,"DP_ReceiverRead",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_ReceiverRead00);
   tolua_function(tolua_S,"DP_Reset",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Reset00);
   tolua_function(tolua_S,"DP_Init",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Init00);
   tolua_function(tolua_S,"DP_SendHpd",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_SendHpd00);
   tolua_function(tolua_S,"DP_Status",tolua_IA_MAC_BOOK_USBC_BOARD_cIA_MAC_BOOK_USBC_BOARD_DP_Status00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_IA_MAC_BOOK_USBC_BOARD (lua_State* tolua_S) {
 return tolua_IA_MAC_BOOK_USBC_BOARD_open(tolua_S);
};
#endif

