local _ModuleSimBoard_ = {}
package.cpath = package.cpath ..";" .. "/Users/anderson/Desktop/xcode/SimBoard_P1/?.dylib"
require "libIA863_SimBoard"
print("loading PwrDbgBrd success!! :)\r\n")

function _ModuleSimBoard_.DP_Control()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:SelfTest();
print(ReturnData);
end

_ModuleSimBoard_.DP_Control();


return _ModuleSimBoard_
