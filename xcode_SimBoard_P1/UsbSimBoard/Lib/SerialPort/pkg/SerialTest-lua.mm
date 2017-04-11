/*
** Lua binding: SerialTest
** Generated automatically by tolua++-1.0.92 on Wed Jul  6 17:44:39 2016.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_SerialTest_open (lua_State* tolua_S);

#include "CRS232.h"

/* function to release collected object via destructor */
#ifdef __cplusplus

static int tolua_collect_CRS232 (lua_State* tolua_S)
{
 CRS232* self = (CRS232*) tolua_tousertype(tolua_S,1,0);
	Mtolua_delete(self);
	return 0;
}
#endif


/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"CRS232");
}

/* method: new of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_new00
static int tolua_SerialTest_CRS232_new00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   CRS232* tolua_ret = (CRS232*)  Mtolua_new((CRS232)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"CRS232");
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

/* method: new_local of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_new00_local
static int tolua_SerialTest_CRS232_new00_local(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   CRS232* tolua_ret = (CRS232*)  Mtolua_new((CRS232)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"CRS232");
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

/* method: delete of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_delete00
static int tolua_SerialTest_CRS232_delete00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
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

/* method: CreateIPC of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_CreateIPC00
static int tolua_SerialTest_CRS232_CreateIPC00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  const char* reply = ((const char*)  tolua_tostring(tolua_S,2,0));
  const char* publish = ((const char*)  tolua_tostring(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'CreateIPC'", NULL);
#endif
  {
   int tolua_ret = (int)  self->CreateIPC(reply,publish);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'CreateIPC'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: Open of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_Open00
static int tolua_SerialTest_CRS232_Open00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isstring(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  const char* dev = ((const char*)  tolua_tostring(tolua_S,2,0));
  const char* opt = ((const char*)  tolua_tostring(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'Open'", NULL);
#endif
  {
   int tolua_ret = (int)  self->Open(dev,opt);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
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

/* method: Close of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_Close00
static int tolua_SerialTest_CRS232_Close00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'Close'", NULL);
#endif
  {
   int tolua_ret = (int)  self->Close();
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
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

/* method: WriteString of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_WriteString00
static int tolua_SerialTest_CRS232_WriteString00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  const char* buffer = ((const char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'WriteString'", NULL);
#endif
  {
   int tolua_ret = (int)  self->WriteString(buffer);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'WriteString'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: WriteBytes of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_WriteBytes00
static int tolua_SerialTest_CRS232_WriteBytes00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  unsigned char* ucData = ((unsigned char*)  tolua_tostring(tolua_S,2,0));
  int len = ((int)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'WriteBytes'", NULL);
#endif
  {
   int tolua_ret = (int)  self->WriteBytes(ucData,len);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'WriteBytes'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: WriteStringBytes of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_WriteStringBytes00
static int tolua_SerialTest_CRS232_WriteStringBytes00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  const char* szData = ((const char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'WriteStringBytes'", NULL);
#endif
  {
   int tolua_ret = (int)  self->WriteStringBytes(szData);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'WriteStringBytes'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ReadString of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_ReadString00
static int tolua_SerialTest_CRS232_ReadString00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ReadString'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->ReadString();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ReadString'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ReadBytes of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_ReadBytes00
static int tolua_SerialTest_CRS232_ReadBytes00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ReadBytes'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->ReadBytes();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ReadBytes'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ReadStringBytes of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_ReadStringBytes00
static int tolua_SerialTest_CRS232_ReadStringBytes00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ReadStringBytes'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->ReadStringBytes();
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ReadStringBytes'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: ClearBuffer of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_ClearBuffer00
static int tolua_SerialTest_CRS232_ClearBuffer00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'ClearBuffer'", NULL);
#endif
  {
   self->ClearBuffer();
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'ClearBuffer'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: SetDetectString of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_SetDetectString00
static int tolua_SerialTest_CRS232_SetDetectString00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  const char* det = ((const char*)  tolua_tostring(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'SetDetectString'", NULL);
#endif
  {
   int tolua_ret = (int)  self->SetDetectString(det);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'SetDetectString'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: WaitDetect of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_WaitDetect00
static int tolua_SerialTest_CRS232_WaitDetect00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  int timeout = ((int)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'WaitDetect'", NULL);
#endif
  {
   int tolua_ret = (int)  self->WaitDetect(timeout);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'WaitDetect'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: WriteReadString of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_WriteReadString00
static int tolua_SerialTest_CRS232_WriteReadString00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isstring(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  const char* buffer = ((const char*)  tolua_tostring(tolua_S,2,0));
  int timeout = ((int)  tolua_tonumber(tolua_S,3,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'WriteReadString'", NULL);
#endif
  {
   const char* tolua_ret = (const char*)  self->WriteReadString(buffer,timeout);
   tolua_pushstring(tolua_S,(const char*)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'WriteReadString'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: SetRepOpt of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_SetRepOpt00
static int tolua_SerialTest_CRS232_SetRepOpt00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,1,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  int needReply = ((int)  tolua_tonumber(tolua_S,2,0));
  int timeout = ((int)  tolua_tonumber(tolua_S,3,3000));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'SetRepOpt'", NULL);
#endif
  {
   int tolua_ret = (int)  self->SetRepOpt(needReply,timeout);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'SetRepOpt'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: SetPubOpt of class  CRS232 */
#ifndef TOLUA_DISABLE_tolua_SerialTest_CRS232_SetPubOpt00
static int tolua_SerialTest_CRS232_SetPubOpt00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CRS232",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CRS232* self = (CRS232*)  tolua_tousertype(tolua_S,1,0);
  int needPub = ((int)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'SetPubOpt'", NULL);
#endif
  {
   int tolua_ret = (int)  self->SetPubOpt(needPub);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'SetPubOpt'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_SerialTest_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  #ifdef __cplusplus
  tolua_cclass(tolua_S,"CRS232","CRS232","",tolua_collect_CRS232);
  #else
  tolua_cclass(tolua_S,"CRS232","CRS232","",NULL);
  #endif
  tolua_beginmodule(tolua_S,"CRS232");
   tolua_function(tolua_S,"new",tolua_SerialTest_CRS232_new00);
   tolua_function(tolua_S,"new_local",tolua_SerialTest_CRS232_new00_local);
   tolua_function(tolua_S,".call",tolua_SerialTest_CRS232_new00_local);
   tolua_function(tolua_S,"delete",tolua_SerialTest_CRS232_delete00);
   tolua_function(tolua_S,"CreateIPC",tolua_SerialTest_CRS232_CreateIPC00);
   tolua_function(tolua_S,"Open",tolua_SerialTest_CRS232_Open00);
   tolua_function(tolua_S,"Close",tolua_SerialTest_CRS232_Close00);
   tolua_function(tolua_S,"WriteString",tolua_SerialTest_CRS232_WriteString00);
   tolua_function(tolua_S,"WriteBytes",tolua_SerialTest_CRS232_WriteBytes00);
   tolua_function(tolua_S,"WriteStringBytes",tolua_SerialTest_CRS232_WriteStringBytes00);
   tolua_function(tolua_S,"ReadString",tolua_SerialTest_CRS232_ReadString00);
   tolua_function(tolua_S,"ReadBytes",tolua_SerialTest_CRS232_ReadBytes00);
   tolua_function(tolua_S,"ReadStringBytes",tolua_SerialTest_CRS232_ReadStringBytes00);
   tolua_function(tolua_S,"ClearBuffer",tolua_SerialTest_CRS232_ClearBuffer00);
   tolua_function(tolua_S,"SetDetectString",tolua_SerialTest_CRS232_SetDetectString00);
   tolua_function(tolua_S,"WaitDetect",tolua_SerialTest_CRS232_WaitDetect00);
   tolua_function(tolua_S,"WriteReadString",tolua_SerialTest_CRS232_WriteReadString00);
   tolua_function(tolua_S,"SetRepOpt",tolua_SerialTest_CRS232_SetRepOpt00);
   tolua_function(tolua_S,"SetPubOpt",tolua_SerialTest_CRS232_SetPubOpt00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_SerialTest (lua_State* tolua_S) {
 return tolua_SerialTest_open(tolua_S);
};
#endif

