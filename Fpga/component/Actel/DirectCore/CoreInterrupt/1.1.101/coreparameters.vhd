----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sun Jan 08 14:30:18 2017
-- Parameters for CoreInterrupt
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FIQPOLARITY : integer := 0;
    constant HDL_license : string( 1 to 1 ) := "U";
    constant IRQPOLARITY : integer := 1;
    constant NUMFIQSRC : integer := 0;
    constant NUMIRQSRC : integer := 32;
end coreparameters;
