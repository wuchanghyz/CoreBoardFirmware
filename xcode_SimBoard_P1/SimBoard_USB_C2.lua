local _ModuleSimBoard_ = {}
package.cpath = package.cpath ..";" .. "/Users/anderson/Desktop/xcode/SimBoard_P1/?.dylib"
require "libIA863_SimBoard"
print("loading PwrDbgBrd success!! :)\r\n")

local _Channel_ = 3
local _TempPro_ = nil

function _ModuleSimBoard_.USBC2_TOP()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:BoardInit();
print(ReturnData);
ReturnData = _TempPro_:CCLogicSwitch(_Channel_,0);
print(ReturnData);
end

function _ModuleSimBoard_.USBC2_BOTTOM()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:BoardInit();
print(ReturnData);

ReturnData = _TempPro_:TypeCUsb2Switch(_Channel_,1);
print(ReturnData);

ReturnData = _TempPro_:CCLogicSwitch(_Channel_,1);
print(ReturnData);
end

_ModuleSimBoard_.USBC2_TOP();
--_ModuleSimBoard_.USBC2_BOTTOM();

return _ModuleSimBoard_
