----------------------------------------------------------------------
-- Created by SmartDesign Tue Jan 10 22:41:15 2017
-- Version: v11.7 11.7.0.119
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- M2sExt entity declaration
----------------------------------------------------------------------
entity M2sExt is
    -- Port list
    port(
        -- Inputs
        DEVRST_N           : in    std_logic;
        GPIO_IN            : in    std_logic_vector(19 downto 4);
        PAD_IN             : in    std_logic_vector(0 to 0);
        USB_ULPI_DIR       : in    std_logic;
        USB_ULPI_NXT       : in    std_logic;
        USB_ULPI_XCLK      : in    std_logic;
        -- Outputs
        GPIO_OUT           : out   std_logic_vector(2 downto 1);
        USB_RST            : out   std_logic;
        USB_ULPI_STP       : out   std_logic;
        -- Inouts
        COREI2C_0_0_SCL_IO : inout std_logic;
        COREI2C_0_0_SDA_IO : inout std_logic;
        COREI2C_0_1_SCL_IO : inout std_logic;
        COREI2C_0_1_SDA_IO : inout std_logic;
        COREI2C_0_2_SCL_IO : inout std_logic;
        COREI2C_0_2_SDA_IO : inout std_logic;
        COREI2C_0_3_SCL_IO : inout std_logic;
        COREI2C_0_3_SDA_IO : inout std_logic;
        COREI2C_0_4_SCL_IO : inout std_logic;
        COREI2C_0_4_SDA_IO : inout std_logic;
        COREI2C_0_5_SCL_IO : inout std_logic;
        COREI2C_0_5_SDA_IO : inout std_logic;
        COREI2C_0_6_SCL_IO : inout std_logic;
        COREI2C_0_6_SDA_IO : inout std_logic;
        USB_ULPI_DATA      : inout std_logic_vector(7 downto 0)
        );
end M2sExt;
----------------------------------------------------------------------
-- M2sExt architecture body
----------------------------------------------------------------------
architecture RTL of M2sExt is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- M2sExt_IO_0_IO   -   Actel:SgCore:IO:1.0.101
component M2sExt_IO_0_IO
    -- Port list
    port(
        -- Inputs
        PAD_IN : in  std_logic_vector(0 to 0);
        -- Outputs
        Y      : out std_logic_vector(0 to 0)
        );
end component;
-- M2sExt_sb
component M2sExt_sb
    -- Port list
    port(
        -- Inputs
        CLK0               : in    std_logic;
        DEVRST_N           : in    std_logic;
        FAB_RESET_N        : in    std_logic;
        GPIO_IN            : in    std_logic_vector(31 downto 0);
        USB_ULPI_DIR       : in    std_logic;
        USB_ULPI_NXT       : in    std_logic;
        USB_ULPI_XCLK      : in    std_logic;
        -- Outputs
        FAB_CCC_GL0        : out   std_logic;
        FAB_CCC_LOCK       : out   std_logic;
        GPIO_OE            : out   std_logic_vector(31 downto 0);
        GPIO_OUT           : out   std_logic_vector(31 downto 0);
        INT                : out   std_logic_vector(31 downto 0);
        MSS_READY          : out   std_logic;
        POWER_ON_RESET_N   : out   std_logic;
        USB_ULPI_STP       : out   std_logic;
        -- Inouts
        COREI2C_0_0_SCL_IO : inout std_logic;
        COREI2C_0_0_SDA_IO : inout std_logic;
        COREI2C_0_1_SCL_IO : inout std_logic;
        COREI2C_0_1_SDA_IO : inout std_logic;
        COREI2C_0_2_SCL_IO : inout std_logic;
        COREI2C_0_2_SDA_IO : inout std_logic;
        COREI2C_0_3_SCL_IO : inout std_logic;
        COREI2C_0_3_SDA_IO : inout std_logic;
        COREI2C_0_4_SCL_IO : inout std_logic;
        COREI2C_0_4_SDA_IO : inout std_logic;
        COREI2C_0_5_SCL_IO : inout std_logic;
        COREI2C_0_5_SDA_IO : inout std_logic;
        COREI2C_0_6_SCL_IO : inout std_logic;
        COREI2C_0_6_SDA_IO : inout std_logic;
        USB_ULPI_DATA      : inout std_logic_vector(7 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal GPIO_OUT_0         : std_logic_vector(2 downto 1);
signal IO_0_Y             : std_logic_vector(0 to 0);
signal USB_RST_net_0      : std_logic_vector(31 to 31);
signal USB_ULPI_STP_net_0 : std_logic;
signal USB_ULPI_STP_net_1 : std_logic;
signal USB_RST_net_1      : std_logic;
signal GPIO_OUT_0_net_0   : std_logic_vector(2 downto 1);
signal GPIO_OUT_slice_0   : std_logic_vector(0 to 0);
signal GPIO_OUT_slice_1   : std_logic_vector(30 downto 3);
signal GPIO_IN_net_0      : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_0     : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net            : std_logic;
signal GPIO_IN_const_net_0: std_logic_vector(31 downto 20);
signal GPIO_IN_const_net_1: std_logic_vector(3 downto 0);
signal GND_net            : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net             <= '1';
 GPIO_IN_const_net_0 <= B"000000000000";
 GPIO_IN_const_net_1 <= B"0000";
 GND_net             <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 USB_ULPI_STP_net_1   <= USB_ULPI_STP_net_0;
 USB_ULPI_STP         <= USB_ULPI_STP_net_1;
 USB_RST_net_1        <= USB_RST_net_0(31);
 USB_RST              <= USB_RST_net_1;
 GPIO_OUT_0_net_0     <= GPIO_OUT_0;
 GPIO_OUT(2 downto 1) <= GPIO_OUT_0_net_0;
----------------------------------------------------------------------
-- Slices assignments
----------------------------------------------------------------------
 GPIO_OUT_0          <= GPIO_OUT_net_0(2 downto 1);
 USB_RST_net_0(31)   <= GPIO_OUT_net_0(31);
 GPIO_OUT_slice_0(0) <= GPIO_OUT_net_0(0);
 GPIO_OUT_slice_1    <= GPIO_OUT_net_0(30 downto 3);
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 GPIO_IN_net_0 <= ( B"000000000000" & GPIO_IN & B"0000" );
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- IO_0   -   Actel:SgCore:IO:1.0.101
IO_0 : M2sExt_IO_0_IO
    port map( 
        -- Inputs
        PAD_IN => PAD_IN,
        -- Outputs
        Y      => IO_0_Y 
        );
-- M2sExt_sb_0
M2sExt_sb_0 : M2sExt_sb
    port map( 
        -- Inputs
        USB_ULPI_DIR       => USB_ULPI_DIR,
        USB_ULPI_NXT       => USB_ULPI_NXT,
        USB_ULPI_XCLK      => USB_ULPI_XCLK,
        FAB_RESET_N        => VCC_net,
        DEVRST_N           => DEVRST_N,
        CLK0               => IO_0_Y(0),
        GPIO_IN            => GPIO_IN_net_0,
        -- Outputs
        USB_ULPI_STP       => USB_ULPI_STP_net_0,
        POWER_ON_RESET_N   => OPEN,
        FAB_CCC_GL0        => OPEN,
        FAB_CCC_LOCK       => OPEN,
        MSS_READY          => OPEN,
        INT                => OPEN,
        GPIO_OUT           => GPIO_OUT_net_0,
        GPIO_OE            => OPEN,
        -- Inouts
        USB_ULPI_DATA      => USB_ULPI_DATA,
        COREI2C_0_0_SDA_IO => COREI2C_0_0_SDA_IO,
        COREI2C_0_0_SCL_IO => COREI2C_0_0_SCL_IO,
        COREI2C_0_1_SDA_IO => COREI2C_0_1_SDA_IO,
        COREI2C_0_1_SCL_IO => COREI2C_0_1_SCL_IO,
        COREI2C_0_2_SDA_IO => COREI2C_0_2_SDA_IO,
        COREI2C_0_2_SCL_IO => COREI2C_0_2_SCL_IO,
        COREI2C_0_3_SDA_IO => COREI2C_0_3_SDA_IO,
        COREI2C_0_3_SCL_IO => COREI2C_0_3_SCL_IO,
        COREI2C_0_4_SDA_IO => COREI2C_0_4_SDA_IO,
        COREI2C_0_4_SCL_IO => COREI2C_0_4_SCL_IO,
        COREI2C_0_5_SDA_IO => COREI2C_0_5_SDA_IO,
        COREI2C_0_5_SCL_IO => COREI2C_0_5_SCL_IO,
        COREI2C_0_6_SDA_IO => COREI2C_0_6_SDA_IO,
        COREI2C_0_6_SCL_IO => COREI2C_0_6_SCL_IO 
        );

end RTL;
