----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sat Oct 08 15:06:21 2016
-- Parameters for CORESPI
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FAMILY : integer := 15;
    constant HDL_license : string( 1 to 1 ) := "U";
    constant testbench : string( 1 to 4 ) := "User";
    constant USE_MASTER : integer := 1;
    constant USE_SLAVE : integer := 1;
end coreparameters;
