local _ModuleSimBoard_ = {}



local _TX_ = 3
local _RX_ = 1

local _l_ = 0x00000007
local _r_ = 0x00000006
local _f_ = 0x00000000
local _h_ = 0x00000005

local data22l =0;
local data22h =0;
local data23l =0;
local data23h =0;

print("TX is: ".._TX_.."\r")
print("RX is: ".._RX_.."\r\n")

local _tables_ = {}
--local _tables_ = {(_l_<<6)|(_l_<<9),(_r_<<6)|(_l_<<9),(_f_<<6)|(_l_<<9),(_h_<<6)|(_l_<<9),
--                  (_l_<<6)|(_r_<<9),(_r_<<6)|(_r_<<9),(_f_<<6)|(_r_<<9),(_h_<<6)|(_r_<<9),
--                  (_l_<<6)|(_f_<<9),(_r_<<6)|(_f_<<9),(_f_<<6)|(_f_<<9),(_h_<<6)|(_f_<<9),
--                  (_l_<<6)|(_h_<<9),(_r_<<6)|(_h_<<9)}

--print(_tables_)

_table_[1] =(_l_<<6)|(_l_<<9);
print(_table_);





print("Result is : %02x %02x %02x %02x\r\n", data22l,data22h,data23l,data23h)

return _ModuleSimBoard_
