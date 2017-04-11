local _ModuleSimBoard_ = {}
package.cpath = package.cpath ..";" .. "/Users/anderson/Desktop/xcode/SimBoard_P1/?.dylib"
require "libIA863_SimBoard"
print("loading PwrDbgBrd success!! :)\r\n")

local _Channel_ = 3
local _TempPro_ = nil

function _ModuleSimBoard_.TEST()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:BoardInit();
print(ReturnData);
ReturnData = _TempPro_:USBA_Items(1,"2.0",1);
print(ReturnData);
--ReturnData = _TempPro_:USBC_Items(1,"2.0",2);
--print(ReturnData);
--ReturnData = _TempPro_:USBC_Items(1,"DP",1);
--print(ReturnData);
--ReturnData = _TempPro_:USBC_Items(1,"ELOAD",1);
--print(ReturnData);
end


_ModuleSimBoard_.TEST();
return _ModuleSimBoard_
