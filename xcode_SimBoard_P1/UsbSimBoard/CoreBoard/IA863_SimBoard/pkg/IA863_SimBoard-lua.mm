/*
** Lua binding: IA863_SimBoard
** Generated automatically by tolua++-1.0.92 on Mon Apr 10 15:14:09 2017.
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

/* method: BoardInit of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_BoardInit00
static int tolua_IA863_SimBoard_cIA863_SimBoard_BoardInit00(lua_State* tolua_S)
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
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'BoardInit'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->BoardInit();
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

/* method: ResetAll of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_ResetAll00
static int tolua_IA863_SimBoard_cIA863_SimBoard_ResetAll00(lua_State* tolua_S)
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
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ResetAll'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->ResetAll();
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

/* method: CCLogicSwitch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_CCLogicSwitch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_CCLogicSwitch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'CCLogicSwitch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->CCLogicSwitch(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'CCLogicSwitch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeCUsb2Switch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeCUsb2Switch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeCUsb2Switch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeCUsb2Switch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeCUsb2Switch(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeCUsb2Switch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeC_EloadSwitch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeC_EloadSwitch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeC_EloadSwitch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeC_EloadSwitch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeC_EloadSwitch(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeC_EloadSwitch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeC_ChargeSwitch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeC_ChargeSwitch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeC_ChargeSwitch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeC_ChargeSwitch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeC_ChargeSwitch(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeC_ChargeSwitch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: DP_Reset of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_Reset00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_Reset00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
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

/* method: DP_Init of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_Init00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_Init00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
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

/* method: DP_SendHpd of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_SendHpd00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_SendHpd00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
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

/* method: DP_Status of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_Status00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_Status00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
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

/* method: DP_ReceiverWrite of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_ReceiverWrite00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_ReceiverWrite00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,4,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
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

/* method: DP_ReceiverRead of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_ReceiverRead00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_ReceiverRead00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
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

/* method: DP_SBU_Switch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_DP_SBU_Switch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_DP_SBU_Switch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'DP_SBU_Switch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->DP_SBU_Switch(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'DP_SBU_Switch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeAUsb3RedriverWrite of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsb3RedriverWrite00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsb3RedriverWrite00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char TxData = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char RxData = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeAUsb3RedriverWrite'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeAUsb3RedriverWrite(TxData,RxData);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeAUsb3RedriverWrite'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeAUsb3RedriverRead of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsb3RedriverRead00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsb3RedriverRead00(lua_State* tolua_S)
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
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeAUsb3RedriverRead'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeAUsb3RedriverRead();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeAUsb3RedriverRead'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeAPower of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeAPower00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeAPower00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeAPower'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeAPower(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeAPower'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeAUsbSwitch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsbSwitch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsbSwitch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeAUsbSwitch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeAUsbSwitch(Channel,Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeAUsbSwitch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeAEloadSwitch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeAEloadSwitch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeAEloadSwitch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Channel = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeAEloadSwitch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeAEloadSwitch(Channel);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeAEloadSwitch'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: TypeASdCardSwitch of class  cIA863_SimBoard */
#ifndef TOLUA_DISABLE_tolua_IA863_SimBoard_cIA863_SimBoard_TypeASdCardSwitch00
static int tolua_IA863_SimBoard_cIA863_SimBoard_TypeASdCardSwitch00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"cIA863_SimBoard",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  cIA863_SimBoard* self = (cIA863_SimBoard*)  tolua_tousertype(tolua_S,1,0);
  unsigned char Statue = ((unsigned char)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'TypeASdCardSwitch'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->TypeASdCardSwitch(Statue);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'TypeASdCardSwitch'.",&tolua_err);
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
   tolua_function(tolua_S,"BoardInit",tolua_IA863_SimBoard_cIA863_SimBoard_BoardInit00);
   tolua_function(tolua_S,"USBA_Items",tolua_IA863_SimBoard_cIA863_SimBoard_USBA_Items00);
   tolua_function(tolua_S,"USBC_Items",tolua_IA863_SimBoard_cIA863_SimBoard_USBC_Items00);
   tolua_function(tolua_S,"GetLogInfo",tolua_IA863_SimBoard_cIA863_SimBoard_GetLogInfo00);
   tolua_function(tolua_S,"ClearLogInfo",tolua_IA863_SimBoard_cIA863_SimBoard_ClearLogInfo00);
   tolua_function(tolua_S,"ResetAll",tolua_IA863_SimBoard_cIA863_SimBoard_ResetAll00);
   tolua_function(tolua_S,"CCLogicSwitch",tolua_IA863_SimBoard_cIA863_SimBoard_CCLogicSwitch00);
   tolua_function(tolua_S,"TypeCUsb2Switch",tolua_IA863_SimBoard_cIA863_SimBoard_TypeCUsb2Switch00);
   tolua_function(tolua_S,"TypeC_EloadSwitch",tolua_IA863_SimBoard_cIA863_SimBoard_TypeC_EloadSwitch00);
   tolua_function(tolua_S,"TypeC_ChargeSwitch",tolua_IA863_SimBoard_cIA863_SimBoard_TypeC_ChargeSwitch00);
   tolua_function(tolua_S,"DP_Reset",tolua_IA863_SimBoard_cIA863_SimBoard_DP_Reset00);
   tolua_function(tolua_S,"DP_Init",tolua_IA863_SimBoard_cIA863_SimBoard_DP_Init00);
   tolua_function(tolua_S,"DP_SendHpd",tolua_IA863_SimBoard_cIA863_SimBoard_DP_SendHpd00);
   tolua_function(tolua_S,"DP_Status",tolua_IA863_SimBoard_cIA863_SimBoard_DP_Status00);
   tolua_function(tolua_S,"DP_ReceiverWrite",tolua_IA863_SimBoard_cIA863_SimBoard_DP_ReceiverWrite00);
   tolua_function(tolua_S,"DP_ReceiverRead",tolua_IA863_SimBoard_cIA863_SimBoard_DP_ReceiverRead00);
   tolua_function(tolua_S,"DP_SBU_Switch",tolua_IA863_SimBoard_cIA863_SimBoard_DP_SBU_Switch00);
   tolua_function(tolua_S,"TypeAUsb3RedriverWrite",tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsb3RedriverWrite00);
   tolua_function(tolua_S,"TypeAUsb3RedriverRead",tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsb3RedriverRead00);
   tolua_function(tolua_S,"TypeAPower",tolua_IA863_SimBoard_cIA863_SimBoard_TypeAPower00);
   tolua_function(tolua_S,"TypeAUsbSwitch",tolua_IA863_SimBoard_cIA863_SimBoard_TypeAUsbSwitch00);
   tolua_function(tolua_S,"TypeAEloadSwitch",tolua_IA863_SimBoard_cIA863_SimBoard_TypeAEloadSwitch00);
   tolua_function(tolua_S,"TypeASdCardSwitch",tolua_IA863_SimBoard_cIA863_SimBoard_TypeASdCardSwitch00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_IA863_SimBoard (lua_State* tolua_S) {
 return tolua_IA863_SimBoard_open(tolua_S);
};
#endif

