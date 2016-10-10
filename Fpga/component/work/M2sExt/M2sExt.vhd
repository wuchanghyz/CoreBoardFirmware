----------------------------------------------------------------------
-- Created by SmartDesign Sat Oct 08 15:07:36 2016
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
        PAD_IN             : in    std_logic_vector(0 to 0);
        RX                 : in    std_logic;
        RX_0               : in    std_logic;
        RX_1               : in    std_logic;
        RX_2               : in    std_logic;
        RX_3               : in    std_logic;
        RX_4               : in    std_logic;
        RX_5               : in    std_logic;
        RX_6               : in    std_logic;
        RX_7               : in    std_logic;
        RX_8               : in    std_logic;
        USB_ULPI_DIR       : in    std_logic;
        USB_ULPI_NXT       : in    std_logic;
        USB_ULPI_XCLK      : in    std_logic;
        m_miso             : in    std_logic;
        m_miso_0           : in    std_logic;
        m_miso_1           : in    std_logic;
        m_miso_2           : in    std_logic;
        m_miso_3           : in    std_logic;
        m_miso_4           : in    std_logic;
        m_miso_5           : in    std_logic;
        m_miso_6           : in    std_logic;
        -- Outputs
        GPIO_OUT           : out   std_logic_vector(7 downto 0);
        TX                 : out   std_logic;
        TX_0               : out   std_logic;
        TX_1               : out   std_logic;
        TX_2               : out   std_logic;
        TX_3               : out   std_logic;
        TX_4               : out   std_logic;
        TX_5               : out   std_logic;
        TX_6               : out   std_logic;
        TX_7               : out   std_logic;
        TX_8               : out   std_logic;
        USB_RST            : out   std_logic;
        USB_ULPI_STP       : out   std_logic;
        m_mosi             : out   std_logic;
        m_mosi_0           : out   std_logic;
        m_mosi_1           : out   std_logic;
        m_mosi_2           : out   std_logic;
        m_mosi_3           : out   std_logic;
        m_mosi_4           : out   std_logic;
        m_mosi_5           : out   std_logic;
        m_mosi_6           : out   std_logic;
        m_sck              : out   std_logic;
        m_sck_0            : out   std_logic;
        m_sck_1            : out   std_logic;
        m_sck_2            : out   std_logic;
        m_sck_3            : out   std_logic;
        m_sck_4            : out   std_logic;
        m_sck_5            : out   std_logic;
        m_sck_6            : out   std_logic;
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
        COREI2C_0_7_SCL_IO : inout std_logic;
        COREI2C_0_7_SDA_IO : inout std_logic;
        COREI2C_0_8_SCL_IO : inout std_logic;
        COREI2C_0_8_SDA_IO : inout std_logic;
        COREI2C_0_9_SCL_IO : inout std_logic;
        COREI2C_0_9_SDA_IO : inout std_logic;
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
        RX                 : in    std_logic;
        RX_0               : in    std_logic;
        RX_1               : in    std_logic;
        RX_2               : in    std_logic;
        RX_3               : in    std_logic;
        RX_4               : in    std_logic;
        RX_5               : in    std_logic;
        RX_6               : in    std_logic;
        RX_7               : in    std_logic;
        RX_8               : in    std_logic;
        USB_ULPI_DIR       : in    std_logic;
        USB_ULPI_NXT       : in    std_logic;
        USB_ULPI_XCLK      : in    std_logic;
        m_miso             : in    std_logic;
        m_miso_0           : in    std_logic;
        m_miso_1           : in    std_logic;
        m_miso_2           : in    std_logic;
        m_miso_3           : in    std_logic;
        m_miso_4           : in    std_logic;
        m_miso_5           : in    std_logic;
        m_miso_6           : in    std_logic;
        s_mosi             : in    std_logic;
        s_mosi_0           : in    std_logic;
        s_mosi_1           : in    std_logic;
        s_mosi_2           : in    std_logic;
        s_mosi_3           : in    std_logic;
        s_mosi_4           : in    std_logic;
        s_mosi_5           : in    std_logic;
        s_mosi_6           : in    std_logic;
        s_sck              : in    std_logic;
        s_sck_0            : in    std_logic;
        s_sck_1            : in    std_logic;
        s_sck_2            : in    std_logic;
        s_sck_3            : in    std_logic;
        s_sck_4            : in    std_logic;
        s_sck_5            : in    std_logic;
        s_sck_6            : in    std_logic;
        s_ss               : in    std_logic;
        s_ss_0             : in    std_logic;
        s_ss_1             : in    std_logic;
        s_ss_2             : in    std_logic;
        s_ss_3             : in    std_logic;
        s_ss_4             : in    std_logic;
        s_ss_5             : in    std_logic;
        s_ss_6             : in    std_logic;
        -- Outputs
        FAB_CCC_GL0        : out   std_logic;
        FAB_CCC_LOCK       : out   std_logic;
        GPIO_OE            : out   std_logic_vector(31 downto 0);
        GPIO_OUT           : out   std_logic_vector(31 downto 0);
        INT                : out   std_logic_vector(31 downto 0);
        MSS_READY          : out   std_logic;
        POWER_ON_RESET_N   : out   std_logic;
        TX                 : out   std_logic;
        TX_0               : out   std_logic;
        TX_1               : out   std_logic;
        TX_2               : out   std_logic;
        TX_3               : out   std_logic;
        TX_4               : out   std_logic;
        TX_5               : out   std_logic;
        TX_6               : out   std_logic;
        TX_7               : out   std_logic;
        TX_8               : out   std_logic;
        USB_ULPI_STP       : out   std_logic;
        enable_master      : out   std_logic;
        enable_master_0    : out   std_logic;
        enable_master_1    : out   std_logic;
        enable_master_2    : out   std_logic;
        enable_master_3    : out   std_logic;
        enable_master_4    : out   std_logic;
        enable_master_5    : out   std_logic;
        enable_master_6    : out   std_logic;
        enable_slave       : out   std_logic;
        enable_slave_0     : out   std_logic;
        enable_slave_1     : out   std_logic;
        enable_slave_2     : out   std_logic;
        enable_slave_3     : out   std_logic;
        enable_slave_4     : out   std_logic;
        enable_slave_5     : out   std_logic;
        enable_slave_6     : out   std_logic;
        m_mosi             : out   std_logic;
        m_mosi_0           : out   std_logic;
        m_mosi_1           : out   std_logic;
        m_mosi_2           : out   std_logic;
        m_mosi_3           : out   std_logic;
        m_mosi_4           : out   std_logic;
        m_mosi_5           : out   std_logic;
        m_mosi_6           : out   std_logic;
        m_sck              : out   std_logic;
        m_sck_0            : out   std_logic;
        m_sck_1            : out   std_logic;
        m_sck_2            : out   std_logic;
        m_sck_3            : out   std_logic;
        m_sck_4            : out   std_logic;
        m_sck_5            : out   std_logic;
        m_sck_6            : out   std_logic;
        m_ss               : out   std_logic_vector(7 downto 0);
        m_ss_0             : out   std_logic_vector(7 downto 0);
        m_ss_1             : out   std_logic_vector(7 downto 0);
        m_ss_2             : out   std_logic_vector(7 downto 0);
        m_ss_3             : out   std_logic_vector(7 downto 0);
        m_ss_4             : out   std_logic_vector(7 downto 0);
        m_ss_5             : out   std_logic_vector(7 downto 0);
        m_ss_6             : out   std_logic_vector(7 downto 0);
        s_miso             : out   std_logic;
        s_miso_0           : out   std_logic;
        s_miso_1           : out   std_logic;
        s_miso_2           : out   std_logic;
        s_miso_3           : out   std_logic;
        s_miso_4           : out   std_logic;
        s_miso_5           : out   std_logic;
        s_miso_6           : out   std_logic;
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
        COREI2C_0_7_SCL_IO : inout std_logic;
        COREI2C_0_7_SDA_IO : inout std_logic;
        COREI2C_0_8_SCL_IO : inout std_logic;
        COREI2C_0_8_SDA_IO : inout std_logic;
        COREI2C_0_9_SCL_IO : inout std_logic;
        COREI2C_0_9_SDA_IO : inout std_logic;
        USB_ULPI_DATA      : inout std_logic_vector(7 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal GPIO_OUT_1         : std_logic_vector(7 downto 0);
signal IO_0_Y             : std_logic_vector(0 to 0);
signal m_mosi_0_2         : std_logic;
signal m_mosi_1_1         : std_logic;
signal m_mosi_2_1         : std_logic;
signal m_mosi_3_net_0     : std_logic;
signal m_mosi_3_2         : std_logic;
signal m_mosi_4_1         : std_logic;
signal m_mosi_5_1         : std_logic;
signal m_mosi_6_1         : std_logic;
signal m_sck_0_2          : std_logic;
signal m_sck_1_1          : std_logic;
signal m_sck_2_1          : std_logic;
signal m_sck_3_net_0      : std_logic;
signal m_sck_3_2          : std_logic;
signal m_sck_4_1          : std_logic;
signal m_sck_5_1          : std_logic;
signal m_sck_6_1          : std_logic;
signal TX_0_1             : std_logic;
signal TX_1_1             : std_logic;
signal TX_2_1             : std_logic;
signal TX_3_1             : std_logic;
signal TX_4_1             : std_logic;
signal TX_5_1             : std_logic;
signal TX_6_1             : std_logic;
signal TX_7_net_0         : std_logic;
signal TX_7_0             : std_logic;
signal TX_8_net_0         : std_logic;
signal USB_RST_net_0      : std_logic_vector(31 to 31);
signal USB_ULPI_STP_net_0 : std_logic;
signal USB_ULPI_STP_net_1 : std_logic;
signal m_mosi_3_net_1     : std_logic;
signal m_sck_3_net_1      : std_logic;
signal TX_6_1_net_0       : std_logic;
signal TX_2_1_net_0       : std_logic;
signal TX_0_1_net_0       : std_logic;
signal TX_3_1_net_0       : std_logic;
signal TX_5_1_net_0       : std_logic;
signal TX_1_1_net_0       : std_logic;
signal TX_7_net_1         : std_logic;
signal TX_4_1_net_0       : std_logic;
signal m_sck_0_2_net_0    : std_logic;
signal m_mosi_0_2_net_0   : std_logic;
signal m_sck_1_1_net_0    : std_logic;
signal m_mosi_1_1_net_0   : std_logic;
signal m_sck_2_1_net_0    : std_logic;
signal m_mosi_2_1_net_0   : std_logic;
signal m_sck_3_2_net_0    : std_logic;
signal m_mosi_3_2_net_0   : std_logic;
signal m_sck_4_1_net_0    : std_logic;
signal m_mosi_4_1_net_0   : std_logic;
signal m_sck_5_1_net_0    : std_logic;
signal m_mosi_5_1_net_0   : std_logic;
signal m_sck_6_1_net_0    : std_logic;
signal m_mosi_6_1_net_0   : std_logic;
signal TX_7_0_net_0       : std_logic;
signal TX_8_net_1         : std_logic;
signal USB_RST_net_1      : std_logic;
signal GPIO_OUT_1_net_0   : std_logic_vector(7 downto 0);
signal GPIO_OUT_slice_0   : std_logic_vector(30 downto 8);
signal GPIO_OUT_net_0     : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal VCC_net            : std_logic;
signal GPIO_IN_const_net_0: std_logic_vector(31 downto 0);
signal GND_net            : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 VCC_net             <= '1';
 GPIO_IN_const_net_0 <= B"00000000000000000000000000000000";
 GND_net             <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 USB_ULPI_STP_net_1   <= USB_ULPI_STP_net_0;
 USB_ULPI_STP         <= USB_ULPI_STP_net_1;
 m_mosi_3_net_1       <= m_mosi_3_net_0;
 m_mosi               <= m_mosi_3_net_1;
 m_sck_3_net_1        <= m_sck_3_net_0;
 m_sck                <= m_sck_3_net_1;
 TX_6_1_net_0         <= TX_6_1;
 TX_6                 <= TX_6_1_net_0;
 TX_2_1_net_0         <= TX_2_1;
 TX_2                 <= TX_2_1_net_0;
 TX_0_1_net_0         <= TX_0_1;
 TX_0                 <= TX_0_1_net_0;
 TX_3_1_net_0         <= TX_3_1;
 TX_3                 <= TX_3_1_net_0;
 TX_5_1_net_0         <= TX_5_1;
 TX_5                 <= TX_5_1_net_0;
 TX_1_1_net_0         <= TX_1_1;
 TX_1                 <= TX_1_1_net_0;
 TX_7_net_1           <= TX_7_net_0;
 TX                   <= TX_7_net_1;
 TX_4_1_net_0         <= TX_4_1;
 TX_4                 <= TX_4_1_net_0;
 m_sck_0_2_net_0      <= m_sck_0_2;
 m_sck_0              <= m_sck_0_2_net_0;
 m_mosi_0_2_net_0     <= m_mosi_0_2;
 m_mosi_0             <= m_mosi_0_2_net_0;
 m_sck_1_1_net_0      <= m_sck_1_1;
 m_sck_1              <= m_sck_1_1_net_0;
 m_mosi_1_1_net_0     <= m_mosi_1_1;
 m_mosi_1             <= m_mosi_1_1_net_0;
 m_sck_2_1_net_0      <= m_sck_2_1;
 m_sck_2              <= m_sck_2_1_net_0;
 m_mosi_2_1_net_0     <= m_mosi_2_1;
 m_mosi_2             <= m_mosi_2_1_net_0;
 m_sck_3_2_net_0      <= m_sck_3_2;
 m_sck_3              <= m_sck_3_2_net_0;
 m_mosi_3_2_net_0     <= m_mosi_3_2;
 m_mosi_3             <= m_mosi_3_2_net_0;
 m_sck_4_1_net_0      <= m_sck_4_1;
 m_sck_4              <= m_sck_4_1_net_0;
 m_mosi_4_1_net_0     <= m_mosi_4_1;
 m_mosi_4             <= m_mosi_4_1_net_0;
 m_sck_5_1_net_0      <= m_sck_5_1;
 m_sck_5              <= m_sck_5_1_net_0;
 m_mosi_5_1_net_0     <= m_mosi_5_1;
 m_mosi_5             <= m_mosi_5_1_net_0;
 m_sck_6_1_net_0      <= m_sck_6_1;
 m_sck_6              <= m_sck_6_1_net_0;
 m_mosi_6_1_net_0     <= m_mosi_6_1;
 m_mosi_6             <= m_mosi_6_1_net_0;
 TX_7_0_net_0         <= TX_7_0;
 TX_7                 <= TX_7_0_net_0;
 TX_8_net_1           <= TX_8_net_0;
 TX_8                 <= TX_8_net_1;
 USB_RST_net_1        <= USB_RST_net_0(31);
 USB_RST              <= USB_RST_net_1;
 GPIO_OUT_1_net_0     <= GPIO_OUT_1;
 GPIO_OUT(7 downto 0) <= GPIO_OUT_1_net_0;
----------------------------------------------------------------------
-- Slices assignments
----------------------------------------------------------------------
 GPIO_OUT_1        <= GPIO_OUT_net_0(7 downto 0);
 USB_RST_net_0(31) <= GPIO_OUT_net_0(31);
 GPIO_OUT_slice_0  <= GPIO_OUT_net_0(30 downto 8);
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
        GPIO_IN            => GPIO_IN_const_net_0,
        m_miso             => m_miso,
        s_mosi             => GND_net,
        s_sck              => GND_net,
        s_ss               => GND_net,
        m_miso_0           => m_miso_0,
        s_mosi_0           => GND_net,
        s_sck_0            => GND_net,
        s_ss_0             => GND_net,
        m_miso_1           => m_miso_1,
        s_mosi_1           => GND_net,
        s_sck_1            => GND_net,
        s_ss_1             => GND_net,
        m_miso_2           => m_miso_2,
        s_mosi_2           => GND_net,
        s_sck_2            => GND_net,
        s_ss_2             => GND_net,
        m_miso_3           => m_miso_3,
        s_mosi_3           => GND_net,
        s_sck_3            => GND_net,
        s_ss_3             => GND_net,
        m_miso_4           => m_miso_4,
        s_mosi_4           => GND_net,
        s_sck_4            => GND_net,
        s_ss_4             => GND_net,
        m_miso_5           => m_miso_5,
        s_mosi_5           => GND_net,
        s_sck_5            => GND_net,
        s_ss_5             => GND_net,
        m_miso_6           => m_miso_6,
        s_mosi_6           => GND_net,
        s_sck_6            => GND_net,
        s_ss_6             => GND_net,
        RX                 => RX,
        RX_0               => RX_0,
        RX_1               => RX_1,
        RX_2               => RX_2,
        RX_3               => RX_3,
        RX_4               => RX_4,
        RX_5               => RX_5,
        RX_6               => RX_6,
        RX_7               => RX_7,
        RX_8               => RX_8,
        -- Outputs
        USB_ULPI_STP       => USB_ULPI_STP_net_0,
        POWER_ON_RESET_N   => OPEN,
        FAB_CCC_GL0        => OPEN,
        FAB_CCC_LOCK       => OPEN,
        MSS_READY          => OPEN,
        INT                => OPEN,
        GPIO_OUT           => GPIO_OUT_net_0,
        GPIO_OE            => OPEN,
        enable_master      => OPEN,
        enable_slave       => OPEN,
        m_mosi             => m_mosi_3_net_0,
        m_sck              => m_sck_3_net_0,
        m_ss               => OPEN,
        s_miso             => OPEN,
        enable_master_0    => OPEN,
        enable_slave_0     => OPEN,
        m_mosi_0           => m_mosi_0_2,
        m_sck_0            => m_sck_0_2,
        m_ss_0             => OPEN,
        s_miso_0           => OPEN,
        enable_master_1    => OPEN,
        enable_slave_1     => OPEN,
        m_mosi_1           => m_mosi_1_1,
        m_sck_1            => m_sck_1_1,
        m_ss_1             => OPEN,
        s_miso_1           => OPEN,
        enable_master_2    => OPEN,
        enable_slave_2     => OPEN,
        m_mosi_2           => m_mosi_2_1,
        m_sck_2            => m_sck_2_1,
        m_ss_2             => OPEN,
        s_miso_2           => OPEN,
        enable_master_3    => OPEN,
        enable_slave_3     => OPEN,
        m_mosi_3           => m_mosi_3_2,
        m_sck_3            => m_sck_3_2,
        m_ss_3             => OPEN,
        s_miso_3           => OPEN,
        enable_master_4    => OPEN,
        enable_slave_4     => OPEN,
        m_mosi_4           => m_mosi_4_1,
        m_sck_4            => m_sck_4_1,
        m_ss_4             => OPEN,
        s_miso_4           => OPEN,
        enable_master_5    => OPEN,
        enable_slave_5     => OPEN,
        m_mosi_5           => m_mosi_5_1,
        m_sck_5            => m_sck_5_1,
        m_ss_5             => OPEN,
        s_miso_5           => OPEN,
        enable_master_6    => OPEN,
        enable_slave_6     => OPEN,
        m_mosi_6           => m_mosi_6_1,
        m_sck_6            => m_sck_6_1,
        m_ss_6             => OPEN,
        s_miso_6           => OPEN,
        TX                 => TX_7_net_0,
        TX_0               => TX_0_1,
        TX_1               => TX_1_1,
        TX_2               => TX_2_1,
        TX_3               => TX_3_1,
        TX_4               => TX_4_1,
        TX_5               => TX_5_1,
        TX_6               => TX_6_1,
        TX_7               => TX_7_0,
        TX_8               => TX_8_net_0,
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
        COREI2C_0_6_SCL_IO => COREI2C_0_6_SCL_IO,
        COREI2C_0_7_SDA_IO => COREI2C_0_7_SDA_IO,
        COREI2C_0_7_SCL_IO => COREI2C_0_7_SCL_IO,
        COREI2C_0_8_SDA_IO => COREI2C_0_8_SDA_IO,
        COREI2C_0_8_SCL_IO => COREI2C_0_8_SCL_IO,
        COREI2C_0_9_SDA_IO => COREI2C_0_9_SDA_IO,
        COREI2C_0_9_SCL_IO => COREI2C_0_9_SCL_IO 
        );

end RTL;
