local _ModuleSimBoard_ = {}
package.cpath = package.cpath ..";" .. "/Users/anderson/Desktop/xcode/SimBoard_P1/?.dylib"
require "libIA863_SimBoard"
print("loading PwrDbgBrd success!! :)\r\n")

local _Channel_ = 3
local _TempPro_ = nil

function _ModuleSimBoard_.DP_Control()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:BoardInit();
print(ReturnData);

ReturnData = _TempPro_:DP_Init(_Channel_);
print(ReturnData);

ReturnData = _TempPro_:CCLogicSwitch(_Channel_,0);
print(ReturnData);

ReturnData = _TempPro_:DP_SendHpd(_Channel_);
print(ReturnData);
end

_ModuleSimBoard_.DP_Control();


return _ModuleSimBoard_
