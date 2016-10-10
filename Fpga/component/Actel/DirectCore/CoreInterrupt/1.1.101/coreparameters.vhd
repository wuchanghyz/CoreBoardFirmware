----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sat Oct 08 15:06:21 2016
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
