local _ModuleSimBoard_ = {}
package.cpath = package.cpath ..";" .. "/Users/anderson/Desktop/xcode/SimBoard_P1/?.dylib"
require "libIA863_SimBoard"
print("loading PwrDbgBrd success!! :)\r\n")

local _Channel_ = 3
local _TempPro_ = nil

function _ModuleSimBoard_.USBA3()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:BoardInit();
print(ReturnData);
ReturnData = _TempPro_:TypeAUsb3RedriverWrite(1,1);
print(ReturnData);
ReturnData = _TempPro_:TypeAUsbSwitch(_Channel_,1);
print(ReturnData);
ReturnData = _TempPro_:UsbPower(_Channel_,1);
print(ReturnData)

end

function _ModuleSimBoard_.USBA2()

_TempPro_ = cIA863_SimBoard:new();
ReturnData = _TempPro_:BoardInit();
print(ReturnData);
ReturnData = _TempPro_:TypeAUsbSwitch(_Channel_,0);
print(ReturnData);
ReturnData = _TempPro_:UsbPower(_Channel_,1);
print(ReturnData)

end


_ModuleSimBoard_.USBA3();
return _ModuleSimBoard_
