----------------------------------------------------------------------
-- Created by SmartDesign Sat Oct 08 15:06:24 2016
-- Version: v11.7 11.7.0.119
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAHBLITE_LIB;
use COREAHBLITE_LIB.all;
use COREAHBLITE_LIB.components.all;
library COREAHBTOAPB3_LIB;
use COREAHBTOAPB3_LIB.all;
use COREAHBTOAPB3_LIB.components.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
library COREGPIO_LIB;
use COREGPIO_LIB.all;
use COREGPIO_LIB.components.all;
library COREI2C_LIB;
use COREI2C_LIB.all;
library CORESPI_LIB;
use CORESPI_LIB.all;
use CORESPI_LIB.components.all;
library COREUARTAPB_LIB;
use COREUARTAPB_LIB.all;
use COREUARTAPB_LIB.M2sExt_sb_CoreUARTapb_0_9_components.all;
----------------------------------------------------------------------
-- M2sExt_sb entity declaration
----------------------------------------------------------------------
entity M2sExt_sb is
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
end M2sExt_sb;
----------------------------------------------------------------------
-- M2sExt_sb architecture body
----------------------------------------------------------------------
architecture RTL of M2sExt_sb is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- BIBUF
component BIBUF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        D   : in    std_logic;
        E   : in    std_logic;
        -- Outputs
        Y   : out   std_logic;
        -- Inouts
        PAD : inout std_logic
        );
end component;
-- M2sExt_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.200
component M2sExt_sb_CCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        CLK0 : in  std_logic;
        -- Outputs
        GL0  : out std_logic;
        LOCK : out std_logic
        );
end component;
-- CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
-- using entity instantiation for component CoreAHBLite
-- COREAHBTOAPB3   -   Actel:DirectCore:COREAHBTOAPB3:3.1.100
-- using entity instantiation for component COREAHBTOAPB3
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
-- using entity instantiation for component CoreAPB3
-- CoreGPIO   -   Actel:DirectCore:CoreGPIO:3.0.120
-- using entity instantiation for component CoreGPIO
-- COREI2C   -   Actel:DirectCore:COREI2C:7.0.102
component COREI2C
    generic( 
        ADD_SLAVE1_ADDRESS_EN   : integer := 0 ;
        BAUD_RATE_FIXED         : integer := 0 ;
        BAUD_RATE_VALUE         : integer := 0 ;
        BCLK_ENABLED            : integer := 1 ;
        FIXED_SLAVE0_ADDR_EN    : integer := 0 ;
        FIXED_SLAVE0_ADDR_VALUE : integer := 16#0# ;
        FIXED_SLAVE1_ADDR_EN    : integer := 0 ;
        FIXED_SLAVE1_ADDR_VALUE : integer := 16#0# ;
        FREQUENCY               : integer := 30 ;
        GLITCHREG_NUM           : integer := 3 ;
        I2C_NUM                 : integer := 1 ;
        IPMI_EN                 : integer := 0 ;
        OPERATING_MODE          : integer := 0 ;
        SMB_EN                  : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        BCLK        : in  std_logic;
        PADDR       : in  std_logic_vector(8 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        SCLI        : in  std_logic_vector(0 to 0);
        SDAI        : in  std_logic_vector(0 to 0);
        SMBALERT_NI : in  std_logic_vector(0 to 0);
        SMBSUS_NI   : in  std_logic_vector(0 to 0);
        -- Outputs
        INT         : out std_logic_vector(0 to 0);
        PRDATA      : out std_logic_vector(7 downto 0);
        SCLO        : out std_logic_vector(0 to 0);
        SDAO        : out std_logic_vector(0 to 0);
        SMBALERT_NO : out std_logic_vector(0 to 0);
        SMBA_INT    : out std_logic_vector(0 to 0);
        SMBSUS_NO   : out std_logic_vector(0 to 0);
        SMBS_INT    : out std_logic_vector(0 to 0)
        );
end component;
-- CoreInterrupt   -   Actel:DirectCore:CoreInterrupt:1.1.101
component CoreInterrupt
    generic( 
        FIQPOLARITY : integer := 0 ;
        IRQPOLARITY : integer := 1 ;
        NUMFIQSRC   : integer := 0 ;
        NUMIRQSRC   : integer := 32 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(5 downto 2);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETn     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(31 downto 0);
        PWRITE      : in  std_logic;
        fiqSource0  : in  std_logic;
        fiqSource1  : in  std_logic;
        fiqSource2  : in  std_logic;
        fiqSource3  : in  std_logic;
        fiqSource4  : in  std_logic;
        fiqSource5  : in  std_logic;
        fiqSource6  : in  std_logic;
        fiqSource7  : in  std_logic;
        irqSource0  : in  std_logic;
        irqSource1  : in  std_logic;
        irqSource10 : in  std_logic;
        irqSource11 : in  std_logic;
        irqSource12 : in  std_logic;
        irqSource13 : in  std_logic;
        irqSource14 : in  std_logic;
        irqSource15 : in  std_logic;
        irqSource16 : in  std_logic;
        irqSource17 : in  std_logic;
        irqSource18 : in  std_logic;
        irqSource19 : in  std_logic;
        irqSource2  : in  std_logic;
        irqSource20 : in  std_logic;
        irqSource21 : in  std_logic;
        irqSource22 : in  std_logic;
        irqSource23 : in  std_logic;
        irqSource24 : in  std_logic;
        irqSource25 : in  std_logic;
        irqSource26 : in  std_logic;
        irqSource27 : in  std_logic;
        irqSource28 : in  std_logic;
        irqSource29 : in  std_logic;
        irqSource3  : in  std_logic;
        irqSource30 : in  std_logic;
        irqSource31 : in  std_logic;
        irqSource4  : in  std_logic;
        irqSource5  : in  std_logic;
        irqSource6  : in  std_logic;
        irqSource7  : in  std_logic;
        irqSource8  : in  std_logic;
        irqSource9  : in  std_logic;
        -- Outputs
        FIQ         : out std_logic;
        IRQ         : out std_logic;
        PRDATA      : out std_logic_vector(31 downto 0)
        );
end component;
-- CoreResetP   -   Actel:DirectCore:CoreResetP:7.0.104
component CoreResetP
    generic( 
        DDR_WAIT            : integer := 200 ;
        DEVICE_090          : integer := 0 ;
        DEVICE_VOLTAGE      : integer := 2 ;
        ENABLE_SOFT_RESETS  : integer := 0 ;
        EXT_RESET_CFG       : integer := 0 ;
        FDDR_IN_USE         : integer := 0 ;
        MDDR_IN_USE         : integer := 0 ;
        SDIF0_IN_USE        : integer := 0 ;
        SDIF0_PCIE          : integer := 0 ;
        SDIF0_PCIE_HOTRESET : integer := 1 ;
        SDIF0_PCIE_L2P2     : integer := 1 ;
        SDIF1_IN_USE        : integer := 0 ;
        SDIF1_PCIE          : integer := 0 ;
        SDIF1_PCIE_HOTRESET : integer := 1 ;
        SDIF1_PCIE_L2P2     : integer := 1 ;
        SDIF2_IN_USE        : integer := 0 ;
        SDIF2_PCIE          : integer := 0 ;
        SDIF2_PCIE_HOTRESET : integer := 1 ;
        SDIF2_PCIE_L2P2     : integer := 1 ;
        SDIF3_IN_USE        : integer := 0 ;
        SDIF3_PCIE          : integer := 0 ;
        SDIF3_PCIE_HOTRESET : integer := 1 ;
        SDIF3_PCIE_L2P2     : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        CLK_BASE                       : in  std_logic;
        CLK_LTSSM                      : in  std_logic;
        CONFIG1_DONE                   : in  std_logic;
        CONFIG2_DONE                   : in  std_logic;
        FAB_RESET_N                    : in  std_logic;
        FIC_2_APB_M_PRESET_N           : in  std_logic;
        FPLL_LOCK                      : in  std_logic;
        POWER_ON_RESET_N               : in  std_logic;
        RCOSC_25_50MHZ                 : in  std_logic;
        RESET_N_M2F                    : in  std_logic;
        SDIF0_PERST_N                  : in  std_logic;
        SDIF0_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF0_PSEL                     : in  std_logic;
        SDIF0_PWRITE                   : in  std_logic;
        SDIF0_SPLL_LOCK                : in  std_logic;
        SDIF1_PERST_N                  : in  std_logic;
        SDIF1_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF1_PSEL                     : in  std_logic;
        SDIF1_PWRITE                   : in  std_logic;
        SDIF1_SPLL_LOCK                : in  std_logic;
        SDIF2_PERST_N                  : in  std_logic;
        SDIF2_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF2_PSEL                     : in  std_logic;
        SDIF2_PWRITE                   : in  std_logic;
        SDIF2_SPLL_LOCK                : in  std_logic;
        SDIF3_PERST_N                  : in  std_logic;
        SDIF3_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF3_PSEL                     : in  std_logic;
        SDIF3_PWRITE                   : in  std_logic;
        SDIF3_SPLL_LOCK                : in  std_logic;
        SOFT_EXT_RESET_OUT             : in  std_logic;
        SOFT_FDDR_CORE_RESET           : in  std_logic;
        SOFT_M3_RESET                  : in  std_logic;
        SOFT_MDDR_DDR_AXI_S_CORE_RESET : in  std_logic;
        SOFT_RESET_F2M                 : in  std_logic;
        SOFT_SDIF0_0_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_1_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_CORE_RESET          : in  std_logic;
        SOFT_SDIF0_PHY_RESET           : in  std_logic;
        SOFT_SDIF1_CORE_RESET          : in  std_logic;
        SOFT_SDIF1_PHY_RESET           : in  std_logic;
        SOFT_SDIF2_CORE_RESET          : in  std_logic;
        SOFT_SDIF2_PHY_RESET           : in  std_logic;
        SOFT_SDIF3_CORE_RESET          : in  std_logic;
        SOFT_SDIF3_PHY_RESET           : in  std_logic;
        -- Outputs
        DDR_READY                      : out std_logic;
        EXT_RESET_OUT                  : out std_logic;
        FDDR_CORE_RESET_N              : out std_logic;
        INIT_DONE                      : out std_logic;
        M3_RESET_N                     : out std_logic;
        MDDR_DDR_AXI_S_CORE_RESET_N    : out std_logic;
        MSS_HPMS_READY                 : out std_logic;
        RESET_N_F2M                    : out std_logic;
        SDIF0_0_CORE_RESET_N           : out std_logic;
        SDIF0_1_CORE_RESET_N           : out std_logic;
        SDIF0_CORE_RESET_N             : out std_logic;
        SDIF0_PHY_RESET_N              : out std_logic;
        SDIF1_CORE_RESET_N             : out std_logic;
        SDIF1_PHY_RESET_N              : out std_logic;
        SDIF2_CORE_RESET_N             : out std_logic;
        SDIF2_PHY_RESET_N              : out std_logic;
        SDIF3_CORE_RESET_N             : out std_logic;
        SDIF3_PHY_RESET_N              : out std_logic;
        SDIF_READY                     : out std_logic;
        SDIF_RELEASED                  : out std_logic
        );
end component;
-- CORESPI   -   Actel:DirectCore:CORESPI:3.0.156
-- using entity instantiation for component CORESPI
-- OR3
component OR3
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_0_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_0_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_1_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_1_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_2_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_2_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_3_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_3_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_4_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_4_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_5_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_5_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_6_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_6_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_7_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_7_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_8_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_8_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_CoreUARTapb_0_9_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
component M2sExt_sb_CoreUARTapb_0_9_CoreUARTapb
    generic( 
        BAUD_VAL_FRCTN    : integer := 0 ;
        BAUD_VAL_FRCTN_EN : integer := 0 ;
        BAUD_VALUE        : integer := 1 ;
        FAMILY            : integer := 19 ;
        FIXEDMODE         : integer := 0 ;
        PRG_BIT8          : integer := 0 ;
        PRG_PARITY        : integer := 0 ;
        RX_FIFO           : integer := 1 ;
        RX_LEGACY_MODE    : integer := 0 ;
        TX_FIFO           : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        PADDR       : in  std_logic_vector(4 downto 0);
        PCLK        : in  std_logic;
        PENABLE     : in  std_logic;
        PRESETN     : in  std_logic;
        PSEL        : in  std_logic;
        PWDATA      : in  std_logic_vector(7 downto 0);
        PWRITE      : in  std_logic;
        RX          : in  std_logic;
        -- Outputs
        FRAMING_ERR : out std_logic;
        OVERFLOW    : out std_logic;
        PARITY_ERR  : out std_logic;
        PRDATA      : out std_logic_vector(7 downto 0);
        PREADY      : out std_logic;
        PSLVERR     : out std_logic;
        RXRDY       : out std_logic;
        TX          : out std_logic;
        TXRDY       : out std_logic
        );
end component;
-- M2sExt_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component M2sExt_sb_FABOSC_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
-- M2sExt_sb_MSS
component M2sExt_sb_MSS
    -- Port list
    port(
        -- Inputs
        FIC_0_AHB_M_HRDATA     : in    std_logic_vector(31 downto 0);
        FIC_0_AHB_M_HREADY     : in    std_logic;
        FIC_0_AHB_M_HRESP      : in    std_logic;
        FIC_2_APB_M_PRDATA     : in    std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY     : in    std_logic;
        FIC_2_APB_M_PSLVERR    : in    std_logic;
        MCCC_CLK_BASE          : in    std_logic;
        MCCC_CLK_BASE_PLL_LOCK : in    std_logic;
        MSS_INT_F2M            : in    std_logic_vector(15 downto 0);
        MSS_RESET_N_F2M        : in    std_logic;
        USB_ULPI_DIR           : in    std_logic;
        USB_ULPI_NXT           : in    std_logic;
        USB_ULPI_XCLK          : in    std_logic;
        -- Outputs
        FIC_0_AHB_M_HADDR      : out   std_logic_vector(31 downto 0);
        FIC_0_AHB_M_HSIZE      : out   std_logic_vector(1 downto 0);
        FIC_0_AHB_M_HTRANS     : out   std_logic_vector(1 downto 0);
        FIC_0_AHB_M_HWDATA     : out   std_logic_vector(31 downto 0);
        FIC_0_AHB_M_HWRITE     : out   std_logic;
        FIC_2_APB_M_PADDR      : out   std_logic_vector(15 downto 2);
        FIC_2_APB_M_PCLK       : out   std_logic;
        FIC_2_APB_M_PENABLE    : out   std_logic;
        FIC_2_APB_M_PRESET_N   : out   std_logic;
        FIC_2_APB_M_PSEL       : out   std_logic;
        FIC_2_APB_M_PWDATA     : out   std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE     : out   std_logic;
        MSS_RESET_N_M2F        : out   std_logic;
        USB_ULPI_STP           : out   std_logic;
        -- Inouts
        USB_ULPI_DATA          : inout std_logic_vector(7 downto 0)
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal BIBUF_COREI2C_0_0_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_0_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_1_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_1_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_2_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_2_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_3_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_3_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_4_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_4_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_5_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_5_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_6_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_6_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_7_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_7_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_8_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_8_SDA_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_9_SCL_IO_Y                  : std_logic;
signal BIBUF_COREI2C_0_9_SDA_IO_Y                  : std_logic;
signal CoreAHBLite_0_AHBmslave0_HADDR              : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HBURST             : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave0_HMASTLOCK          : std_logic;
signal CoreAHBLite_0_AHBmslave0_HPROT              : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave0_HRDATA             : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HREADY             : std_logic;
signal CoreAHBLite_0_AHBmslave0_HREADYOUT          : std_logic;
signal CoreAHBLite_0_AHBmslave0_HRESP              : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave0_HSELx              : std_logic;
signal CoreAHBLite_0_AHBmslave0_HSIZE              : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave0_HTRANS             : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave0_HWDATA             : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HWRITE             : std_logic;
signal CoreAHBLite_0_AHBmslave1_HADDR              : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave1_HBURST             : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave1_HMASTLOCK          : std_logic;
signal CoreAHBLite_0_AHBmslave1_HPROT              : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave1_HRDATA             : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave1_HREADY             : std_logic;
signal CoreAHBLite_0_AHBmslave1_HREADYOUT          : std_logic;
signal CoreAHBLite_0_AHBmslave1_HRESP              : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave1_HSELx              : std_logic;
signal CoreAHBLite_0_AHBmslave1_HSIZE              : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave1_HTRANS             : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave1_HWDATA             : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave1_HWRITE             : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PADDR             : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PENABLE           : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PRDATA            : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PREADY            : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PSELx             : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PSLVERR           : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PWDATA            : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PWRITE            : std_logic;
signal COREAHBTOAPB3_1_APBmaster_PADDR             : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_1_APBmaster_PENABLE           : std_logic;
signal COREAHBTOAPB3_1_APBmaster_PRDATA            : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_1_APBmaster_PREADY            : std_logic;
signal COREAHBTOAPB3_1_APBmaster_PSELx             : std_logic;
signal COREAHBTOAPB3_1_APBmaster_PSLVERR           : std_logic;
signal COREAHBTOAPB3_1_APBmaster_PWDATA            : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_1_APBmaster_PWRITE            : std_logic;
signal CoreAPB3_0_APBmslave0_PENABLE               : std_logic;
signal CoreAPB3_0_APBmslave0_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave0_PWRITE                : std_logic;
signal CoreAPB3_0_APBmslave1_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave2_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave3_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave4_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave5_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave6_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave7_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave8_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave9_PSELx                 : std_logic;
signal CoreAPB3_0_APBmslave10_PSELx                : std_logic;
signal CoreAPB3_0_APBmslave11_PSELx                : std_logic;
signal CoreAPB3_0_APBmslave12_PSELx                : std_logic;
signal CoreAPB3_0_APBmslave13_PSELx                : std_logic;
signal CoreAPB3_0_APBmslave14_PSELx                : std_logic;
signal CoreAPB3_0_APBmslave15_PSELx                : std_logic;
signal CoreAPB3_1_APBmslave0_PENABLE               : std_logic;
signal CoreAPB3_1_APBmslave0_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave0_PWRITE                : std_logic;
signal CoreAPB3_1_APBmslave1_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave2_PRDATA                : std_logic_vector(31 downto 0);
signal CoreAPB3_1_APBmslave2_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave2_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave2_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave3_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave3_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave3_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave4_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave4_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave4_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave5_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave5_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave5_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave6_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave6_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave6_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave7_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave7_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave7_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave8_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave8_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave8_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave9_PREADY                : std_logic;
signal CoreAPB3_1_APBmslave9_PSELx                 : std_logic;
signal CoreAPB3_1_APBmslave9_PSLVERR               : std_logic;
signal CoreAPB3_1_APBmslave10_PREADY               : std_logic;
signal CoreAPB3_1_APBmslave10_PSELx                : std_logic;
signal CoreAPB3_1_APBmslave10_PSLVERR              : std_logic;
signal CoreAPB3_1_APBmslave11_PREADY               : std_logic;
signal CoreAPB3_1_APBmslave11_PSELx                : std_logic;
signal CoreAPB3_1_APBmslave11_PSLVERR              : std_logic;
signal CoreAPB3_1_APBmslave12_PREADY               : std_logic;
signal CoreAPB3_1_APBmslave12_PSELx                : std_logic;
signal CoreAPB3_1_APBmslave12_PSLVERR              : std_logic;
signal CoreAPB3_1_APBmslave13_PRDATA               : std_logic_vector(31 downto 0);
signal CoreAPB3_1_APBmslave13_PSELx                : std_logic;
signal COREI2C_0_0_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_0_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_0_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_1_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_1_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_1_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_2_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_2_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_2_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_3_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_3_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_3_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_4_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_4_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_4_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_5_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_5_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_5_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_6_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_6_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_6_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_7_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_7_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_7_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_8_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_8_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_8_SDAO                            : std_logic_vector(0 to 0);
signal COREI2C_0_9_INT                             : std_logic_vector(0 to 0);
signal COREI2C_0_9_SCLO                            : std_logic_vector(0 to 0);
signal COREI2C_0_9_SDAO                            : std_logic_vector(0 to 0);
signal CoreInterrupt_0_IRQ                         : std_logic;
signal CORERESETP_0_RESET_N_F2M                    : std_logic;
signal CORESPI_0_0_interrupt                       : std_logic;
signal CORESPI_0_0_intr_or_0_Y                     : std_logic;
signal CORESPI_0_0_rx_data_ready                   : std_logic;
signal CORESPI_0_0_tx_reg_empty                    : std_logic;
signal CORESPI_0_1_interrupt                       : std_logic;
signal CORESPI_0_1_intr_or_0_Y                     : std_logic;
signal CORESPI_0_1_rx_data_ready                   : std_logic;
signal CORESPI_0_1_tx_reg_empty                    : std_logic;
signal CORESPI_0_2_interrupt                       : std_logic;
signal CORESPI_0_2_intr_or_0_Y                     : std_logic;
signal CORESPI_0_2_rx_data_ready                   : std_logic;
signal CORESPI_0_2_tx_reg_empty                    : std_logic;
signal CORESPI_0_3_interrupt                       : std_logic;
signal CORESPI_0_3_intr_or_0_Y                     : std_logic;
signal CORESPI_0_3_rx_data_ready                   : std_logic;
signal CORESPI_0_3_tx_reg_empty                    : std_logic;
signal CORESPI_0_4_interrupt                       : std_logic;
signal CORESPI_0_4_intr_or_0_Y                     : std_logic;
signal CORESPI_0_4_rx_data_ready                   : std_logic;
signal CORESPI_0_4_tx_reg_empty                    : std_logic;
signal CORESPI_0_5_interrupt                       : std_logic;
signal CORESPI_0_5_intr_or_0_Y                     : std_logic;
signal CORESPI_0_5_rx_data_ready                   : std_logic;
signal CORESPI_0_5_tx_reg_empty                    : std_logic;
signal CORESPI_0_6_interrupt                       : std_logic;
signal CORESPI_0_6_intr_or_0_Y                     : std_logic;
signal CORESPI_0_6_rx_data_ready                   : std_logic;
signal CORESPI_0_6_tx_reg_empty                    : std_logic;
signal CORESPI_0_7_interrupt                       : std_logic;
signal CORESPI_0_7_intr_or_0_Y                     : std_logic;
signal CORESPI_0_7_rx_data_ready                   : std_logic;
signal CORESPI_0_7_tx_reg_empty                    : std_logic;
signal CoreUARTapb_0_0_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_0_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_0_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_0_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_0_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_0_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_0_RXRDY                       : std_logic;
signal CoreUARTapb_0_0_TXRDY                       : std_logic;
signal CoreUARTapb_0_1_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_1_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_1_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_1_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_1_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_1_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_1_RXRDY                       : std_logic;
signal CoreUARTapb_0_1_TXRDY                       : std_logic;
signal CoreUARTapb_0_2_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_2_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_2_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_2_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_2_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_2_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_2_RXRDY                       : std_logic;
signal CoreUARTapb_0_2_TXRDY                       : std_logic;
signal CoreUARTapb_0_3_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_3_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_3_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_3_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_3_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_3_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_3_RXRDY                       : std_logic;
signal CoreUARTapb_0_3_TXRDY                       : std_logic;
signal CoreUARTapb_0_4_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_4_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_4_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_4_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_4_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_4_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_4_RXRDY                       : std_logic;
signal CoreUARTapb_0_4_TXRDY                       : std_logic;
signal CoreUARTapb_0_5_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_5_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_5_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_5_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_5_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_5_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_5_RXRDY                       : std_logic;
signal CoreUARTapb_0_5_TXRDY                       : std_logic;
signal CoreUARTapb_0_6_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_6_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_6_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_6_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_6_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_6_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_6_RXRDY                       : std_logic;
signal CoreUARTapb_0_6_TXRDY                       : std_logic;
signal CoreUARTapb_0_7_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_7_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_7_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_7_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_7_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_7_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_7_RXRDY                       : std_logic;
signal CoreUARTapb_0_7_TXRDY                       : std_logic;
signal CoreUARTapb_0_8_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_8_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_8_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_8_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_8_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_8_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_8_RXRDY                       : std_logic;
signal CoreUARTapb_0_8_TXRDY                       : std_logic;
signal CoreUARTapb_0_9_FRAMING_ERR                 : std_logic;
signal CoreUARTapb_0_9_intr_or_0_Y                 : std_logic;
signal CoreUARTapb_0_9_intr_or_1_Y                 : std_logic;
signal CoreUARTapb_0_9_intr_or_2_Y                 : std_logic;
signal CoreUARTapb_0_9_OVERFLOW                    : std_logic;
signal CoreUARTapb_0_9_PARITY_ERR                  : std_logic;
signal CoreUARTapb_0_9_RXRDY                       : std_logic;
signal CoreUARTapb_0_9_TXRDY                       : std_logic;
signal enable_master_net_0                         : std_logic;
signal enable_master_0_net_0                       : std_logic;
signal enable_master_1_net_0                       : std_logic;
signal enable_master_2_net_0                       : std_logic;
signal enable_master_3_net_0                       : std_logic;
signal enable_master_4_net_0                       : std_logic;
signal enable_master_5_net_0                       : std_logic;
signal enable_master_6_net_0                       : std_logic;
signal enable_slave_net_0                          : std_logic;
signal enable_slave_0_net_0                        : std_logic;
signal enable_slave_1_net_0                        : std_logic;
signal enable_slave_2_net_0                        : std_logic;
signal enable_slave_3_net_0                        : std_logic;
signal enable_slave_4_net_0                        : std_logic;
signal enable_slave_5_net_0                        : std_logic;
signal enable_slave_6_net_0                        : std_logic;
signal FAB_CCC_GL0_net_0                           : std_logic;
signal FAB_CCC_LOCK_net_0                          : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_O2F                 : std_logic;
signal GPIO_OE_net_0                               : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_0                              : std_logic_vector(31 downto 0);
signal INT_net_0                                   : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR  : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS : std_logic_vector(1 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N    : std_logic;
signal M2sExt_sb_MSS_TMP_0_MSS_RESET_N_M2F         : std_logic;
signal m_mosi_net_0                                : std_logic;
signal m_mosi_0_net_0                              : std_logic;
signal m_mosi_1_net_0                              : std_logic;
signal m_mosi_2_net_0                              : std_logic;
signal m_mosi_3_net_0                              : std_logic;
signal m_mosi_4_net_0                              : std_logic;
signal m_mosi_5_net_0                              : std_logic;
signal m_mosi_6_net_0                              : std_logic;
signal m_sck_net_0                                 : std_logic;
signal m_sck_0_net_0                               : std_logic;
signal m_sck_1_net_0                               : std_logic;
signal m_sck_2_net_0                               : std_logic;
signal m_sck_3_net_0                               : std_logic;
signal m_sck_4_net_0                               : std_logic;
signal m_sck_5_net_0                               : std_logic;
signal m_sck_6_net_0                               : std_logic;
signal m_ss_net_0                                  : std_logic_vector(7 downto 0);
signal m_ss_0_net_0                                : std_logic_vector(7 downto 0);
signal m_ss_1_net_0                                : std_logic_vector(7 downto 0);
signal m_ss_2_net_0                                : std_logic_vector(7 downto 0);
signal m_ss_3_net_0                                : std_logic_vector(7 downto 0);
signal m_ss_4_net_0                                : std_logic_vector(7 downto 0);
signal m_ss_5_net_0                                : std_logic_vector(7 downto 0);
signal m_ss_6_net_0                                : std_logic_vector(7 downto 0);
signal MSS_READY_net_0                             : std_logic;
signal POWER_ON_RESET_N_net_0                      : std_logic;
signal s_miso_net_0                                : std_logic;
signal s_miso_0_net_0                              : std_logic;
signal s_miso_1_net_0                              : std_logic;
signal s_miso_2_net_0                              : std_logic;
signal s_miso_3_net_0                              : std_logic;
signal s_miso_4_net_0                              : std_logic;
signal s_miso_5_net_0                              : std_logic;
signal s_miso_6_net_0                              : std_logic;
signal TX_net_0                                    : std_logic;
signal TX_0_net_0                                  : std_logic;
signal TX_1_net_0                                  : std_logic;
signal TX_2_net_0                                  : std_logic;
signal TX_3_net_0                                  : std_logic;
signal TX_4_net_0                                  : std_logic;
signal TX_5_net_0                                  : std_logic;
signal TX_6_net_0                                  : std_logic;
signal TX_7_net_0                                  : std_logic;
signal TX_8_net_0                                  : std_logic;
signal USB_ULPI_STP_net_0                          : std_logic;
signal USB_ULPI_STP_net_1                          : std_logic;
signal POWER_ON_RESET_N_net_1                      : std_logic;
signal FAB_CCC_GL0_net_1                           : std_logic;
signal FAB_CCC_LOCK_net_1                          : std_logic;
signal MSS_READY_net_1                             : std_logic;
signal INT_net_1                                   : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_1                              : std_logic_vector(31 downto 0);
signal GPIO_OE_net_1                               : std_logic_vector(31 downto 0);
signal enable_master_net_1                         : std_logic;
signal enable_slave_net_1                          : std_logic;
signal m_mosi_net_1                                : std_logic;
signal m_sck_net_1                                 : std_logic;
signal m_ss_net_1                                  : std_logic_vector(7 downto 0);
signal s_miso_net_1                                : std_logic;
signal enable_master_0_net_1                       : std_logic;
signal enable_slave_0_net_1                        : std_logic;
signal m_mosi_0_net_1                              : std_logic;
signal m_sck_0_net_1                               : std_logic;
signal m_ss_0_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_0_net_1                              : std_logic;
signal enable_master_1_net_1                       : std_logic;
signal enable_slave_1_net_1                        : std_logic;
signal m_mosi_1_net_1                              : std_logic;
signal m_sck_1_net_1                               : std_logic;
signal m_ss_1_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_1_net_1                              : std_logic;
signal enable_master_2_net_1                       : std_logic;
signal enable_slave_2_net_1                        : std_logic;
signal m_mosi_2_net_1                              : std_logic;
signal m_sck_2_net_1                               : std_logic;
signal m_ss_2_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_2_net_1                              : std_logic;
signal enable_master_3_net_1                       : std_logic;
signal enable_slave_3_net_1                        : std_logic;
signal m_mosi_3_net_1                              : std_logic;
signal m_sck_3_net_1                               : std_logic;
signal m_ss_3_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_3_net_1                              : std_logic;
signal enable_master_4_net_1                       : std_logic;
signal enable_slave_4_net_1                        : std_logic;
signal m_mosi_4_net_1                              : std_logic;
signal m_sck_4_net_1                               : std_logic;
signal m_ss_4_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_4_net_1                              : std_logic;
signal enable_master_5_net_1                       : std_logic;
signal enable_slave_5_net_1                        : std_logic;
signal m_mosi_5_net_1                              : std_logic;
signal m_sck_5_net_1                               : std_logic;
signal m_ss_5_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_5_net_1                              : std_logic;
signal enable_master_6_net_1                       : std_logic;
signal enable_slave_6_net_1                        : std_logic;
signal m_mosi_6_net_1                              : std_logic;
signal m_sck_6_net_1                               : std_logic;
signal m_ss_6_net_1                                : std_logic_vector(7 downto 0);
signal s_miso_6_net_1                              : std_logic;
signal TX_net_1                                    : std_logic;
signal TX_0_net_1                                  : std_logic;
signal TX_1_net_1                                  : std_logic;
signal TX_2_net_1                                  : std_logic;
signal TX_3_net_1                                  : std_logic;
signal TX_4_net_1                                  : std_logic;
signal TX_5_net_1                                  : std_logic;
signal TX_6_net_1                                  : std_logic;
signal TX_7_net_1                                  : std_logic;
signal TX_8_net_1                                  : std_logic;
signal MSS_INT_F2M_net_0                           : std_logic_vector(15 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                     : std_logic;
signal VCC_net                                     : std_logic;
signal PADDR_const_net_0                           : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                          : std_logic_vector(7 downto 0);
signal IADDR_const_net_0                           : std_logic_vector(31 downto 0);
signal IADDR_const_net_1                           : std_logic_vector(31 downto 0);
signal SDIF0_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal HBURST_M0_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M0_const_net_0                        : std_logic_vector(3 downto 0);
signal HADDR_M1_const_net_0                        : std_logic_vector(31 downto 0);
signal HTRANS_M1_const_net_0                       : std_logic_vector(1 downto 0);
signal HSIZE_M1_const_net_0                        : std_logic_vector(2 downto 0);
signal HBURST_M1_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M1_const_net_0                        : std_logic_vector(3 downto 0);
signal HWDATA_M1_const_net_0                       : std_logic_vector(31 downto 0);
signal HADDR_M2_const_net_0                        : std_logic_vector(31 downto 0);
signal HTRANS_M2_const_net_0                       : std_logic_vector(1 downto 0);
signal HSIZE_M2_const_net_0                        : std_logic_vector(2 downto 0);
signal HBURST_M2_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M2_const_net_0                        : std_logic_vector(3 downto 0);
signal HWDATA_M2_const_net_0                       : std_logic_vector(31 downto 0);
signal HADDR_M3_const_net_0                        : std_logic_vector(31 downto 0);
signal HTRANS_M3_const_net_0                       : std_logic_vector(1 downto 0);
signal HSIZE_M3_const_net_0                        : std_logic_vector(2 downto 0);
signal HBURST_M3_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M3_const_net_0                        : std_logic_vector(3 downto 0);
signal HWDATA_M3_const_net_0                       : std_logic_vector(31 downto 0);
signal HRDATA_S2_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S2_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S3_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S3_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S4_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S4_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S5_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S5_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S6_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S6_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S7_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S7_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S8_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S8_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S9_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S9_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S10_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S10_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S11_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S11_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S12_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S12_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S13_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S13_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S14_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S14_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S15_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S15_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S16_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S16_const_net_0                       : std_logic_vector(1 downto 0);
signal PRDATAS16_const_net_0                       : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0                       : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0                       : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_1                       : std_logic_vector(31 downto 0);
signal FIC_2_APB_M_PRDATA_const_net_0              : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal E_IN_POST_INV0_0                            : std_logic;
signal E_IN_POST_INV1_0                            : std_logic;
signal E_IN_POST_INV2_0                            : std_logic;
signal E_IN_POST_INV3_0                            : std_logic;
signal E_IN_POST_INV4_0                            : std_logic;
signal E_IN_POST_INV5_0                            : std_logic;
signal E_IN_POST_INV6_0                            : std_logic;
signal E_IN_POST_INV7_0                            : std_logic;
signal E_IN_POST_INV8_0                            : std_logic;
signal E_IN_POST_INV9_0                            : std_logic;
signal E_IN_POST_INV10_0                           : std_logic;
signal E_IN_POST_INV11_0                           : std_logic;
signal E_IN_POST_INV12_0                           : std_logic;
signal E_IN_POST_INV13_0                           : std_logic;
signal E_IN_POST_INV14_0                           : std_logic;
signal E_IN_POST_INV15_0                           : std_logic;
signal E_IN_POST_INV16_0                           : std_logic;
signal E_IN_POST_INV17_0                           : std_logic;
signal E_IN_POST_INV18_0                           : std_logic;
signal E_IN_POST_INV19_0                           : std_logic;
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CoreAPB3_0_APBmslave0_PADDR_0_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_3_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_3               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR                 : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_12_3to0         : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_12              : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_13_3to0         : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_13              : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_14_3to0         : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_14              : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_15_3to0         : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_15              : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_7_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_7               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_8_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_8               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_10_3to0         : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_10              : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_9_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_9               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_11_3to0         : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_11              : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_4_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_4               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_5_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_5               : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_6_8to0          : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_6               : std_logic_vector(8 downto 0);

signal CoreAPB3_0_APBmslave0_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave0_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave0_PWDATA_3_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_3              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_11_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_11             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_12_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_12             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_13_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_13             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_14_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_14             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_15_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_15             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA                : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_1_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_1              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_2_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_2              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_7_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_7              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_8_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_8              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_10_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_10             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_9_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_9              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_4_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_4              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_5_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_5              : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_6_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_6              : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave1_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave1_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave1_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave1_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave2_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave2_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave2_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave2_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave3_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave3_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave3_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave3_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave4_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave4_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave4_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave4_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave5_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave5_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave5_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave5_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave6_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave6_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave6_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave6_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave7_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave7_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave7_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave7_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave8_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave8_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave8_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave8_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave9_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave9_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave9_PRDATA_0              : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave9_PRDATA                : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave10_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave10_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave10_PRDATA_0             : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave10_PRDATA               : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave11_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave11_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave11_PRDATA_0             : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave11_PRDATA               : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave12_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave12_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave12_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave12_PRDATA_0             : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave13_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave13_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave13_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave13_PRDATA_0             : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave14_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave14_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave14_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave14_PRDATA_0             : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave15_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave15_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave15_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave15_PRDATA_0             : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave0_PADDR_0_3to0          : std_logic_vector(3 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_0               : std_logic_vector(3 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_5_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_5               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_6_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_6               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_2_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_2               : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_1_3to0          : std_logic_vector(3 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_1               : std_logic_vector(3 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_3_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_3               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_4_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_4               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_7_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_7               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_8_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_8               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_9_4to0          : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_9               : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_10_4to0         : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_10              : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_11_4to0         : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_11              : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_12_4to0         : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_12              : std_logic_vector(4 downto 0);
signal CoreAPB3_1_APBmslave0_PADDR_13_5to2         : std_logic_vector(5 downto 2);
signal CoreAPB3_1_APBmslave0_PADDR_13              : std_logic_vector(5 downto 2);
signal CoreAPB3_1_APBmslave0_PADDR                 : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave0_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave0_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave0_PWDATA                : std_logic_vector(31 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_4_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_4              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_5_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_5              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_0              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_1_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_1              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_3_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_3              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_2_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_2              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_6_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_6              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_7_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_7              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_8_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_8              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_9_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_9              : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_10_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_10             : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_11_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave0_PWDATA_11             : std_logic_vector(7 downto 0);

signal CoreAPB3_1_APBmslave1_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave1_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave1_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave1_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave3_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave3_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave3_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave3_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave4_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave4_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave4_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave4_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave5_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave5_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave5_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave5_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave6_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave6_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave6_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave6_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave7_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave7_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave7_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave7_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave8_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave8_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave8_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave8_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave9_PRDATA                : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave9_PRDATA_0_31to8        : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave9_PRDATA_0_7to0         : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave9_PRDATA_0              : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave10_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave10_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave10_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave10_PRDATA_0             : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave11_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave11_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave11_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave11_PRDATA_0             : std_logic_vector(31 downto 0);

signal CoreAPB3_1_APBmslave12_PRDATA               : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave12_PRDATA_0_31to8       : std_logic_vector(31 downto 8);
signal CoreAPB3_1_APBmslave12_PRDATA_0_7to0        : std_logic_vector(7 downto 0);
signal CoreAPB3_1_APBmslave12_PRDATA_0             : std_logic_vector(31 downto 0);

signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0: std_logic_vector(0 to 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0: std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP  : std_logic_vector(1 downto 0);

signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE  : std_logic_vector(1 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2: std_logic_vector(2 to 2);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0: std_logic_vector(1 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0: std_logic_vector(2 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                        <= '0';
 VCC_net                        <= '1';
 PADDR_const_net_0              <= B"000000";
 PWDATA_const_net_0             <= B"00000000";
 IADDR_const_net_0              <= B"00000000000000000000000000000000";
 IADDR_const_net_1              <= B"00000000000000000000000000000000";
 SDIF0_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 HBURST_M0_const_net_0          <= B"000";
 HPROT_M0_const_net_0           <= B"0000";
 HADDR_M1_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M1_const_net_0          <= B"00";
 HSIZE_M1_const_net_0           <= B"000";
 HBURST_M1_const_net_0          <= B"000";
 HPROT_M1_const_net_0           <= B"0000";
 HWDATA_M1_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M2_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M2_const_net_0          <= B"00";
 HSIZE_M2_const_net_0           <= B"000";
 HBURST_M2_const_net_0          <= B"000";
 HPROT_M2_const_net_0           <= B"0000";
 HWDATA_M2_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M3_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M3_const_net_0          <= B"00";
 HSIZE_M3_const_net_0           <= B"000";
 HBURST_M3_const_net_0          <= B"000";
 HPROT_M3_const_net_0           <= B"0000";
 HWDATA_M3_const_net_0          <= B"00000000000000000000000000000000";
 HRDATA_S2_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S2_const_net_0           <= B"00";
 HRDATA_S3_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S3_const_net_0           <= B"00";
 HRDATA_S4_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S4_const_net_0           <= B"00";
 HRDATA_S5_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S5_const_net_0           <= B"00";
 HRDATA_S6_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S6_const_net_0           <= B"00";
 HRDATA_S7_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S7_const_net_0           <= B"00";
 HRDATA_S8_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S8_const_net_0           <= B"00";
 HRDATA_S9_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S9_const_net_0           <= B"00";
 HRDATA_S10_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S10_const_net_0          <= B"00";
 HRDATA_S11_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S11_const_net_0          <= B"00";
 HRDATA_S12_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S12_const_net_0          <= B"00";
 HRDATA_S13_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S13_const_net_0          <= B"00";
 HRDATA_S14_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S14_const_net_0          <= B"00";
 HRDATA_S15_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S15_const_net_0          <= B"00";
 HRDATA_S16_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S16_const_net_0          <= B"00";
 PRDATAS16_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_1          <= B"00000000000000000000000000000000";
 FIC_2_APB_M_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Inversions
----------------------------------------------------------------------
 E_IN_POST_INV0_0  <= NOT COREI2C_0_0_SCLO(0);
 E_IN_POST_INV1_0  <= NOT COREI2C_0_0_SDAO(0);
 E_IN_POST_INV2_0  <= NOT COREI2C_0_1_SCLO(0);
 E_IN_POST_INV3_0  <= NOT COREI2C_0_1_SDAO(0);
 E_IN_POST_INV4_0  <= NOT COREI2C_0_2_SCLO(0);
 E_IN_POST_INV5_0  <= NOT COREI2C_0_2_SDAO(0);
 E_IN_POST_INV6_0  <= NOT COREI2C_0_3_SCLO(0);
 E_IN_POST_INV7_0  <= NOT COREI2C_0_3_SDAO(0);
 E_IN_POST_INV8_0  <= NOT COREI2C_0_4_SCLO(0);
 E_IN_POST_INV9_0  <= NOT COREI2C_0_4_SDAO(0);
 E_IN_POST_INV10_0 <= NOT COREI2C_0_5_SCLO(0);
 E_IN_POST_INV11_0 <= NOT COREI2C_0_5_SDAO(0);
 E_IN_POST_INV12_0 <= NOT COREI2C_0_6_SCLO(0);
 E_IN_POST_INV13_0 <= NOT COREI2C_0_6_SDAO(0);
 E_IN_POST_INV14_0 <= NOT COREI2C_0_7_SCLO(0);
 E_IN_POST_INV15_0 <= NOT COREI2C_0_7_SDAO(0);
 E_IN_POST_INV16_0 <= NOT COREI2C_0_8_SCLO(0);
 E_IN_POST_INV17_0 <= NOT COREI2C_0_8_SDAO(0);
 E_IN_POST_INV18_0 <= NOT COREI2C_0_9_SCLO(0);
 E_IN_POST_INV19_0 <= NOT COREI2C_0_9_SDAO(0);
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 USB_ULPI_STP_net_1     <= USB_ULPI_STP_net_0;
 USB_ULPI_STP           <= USB_ULPI_STP_net_1;
 POWER_ON_RESET_N_net_1 <= POWER_ON_RESET_N_net_0;
 POWER_ON_RESET_N       <= POWER_ON_RESET_N_net_1;
 FAB_CCC_GL0_net_1      <= FAB_CCC_GL0_net_0;
 FAB_CCC_GL0            <= FAB_CCC_GL0_net_1;
 FAB_CCC_LOCK_net_1     <= FAB_CCC_LOCK_net_0;
 FAB_CCC_LOCK           <= FAB_CCC_LOCK_net_1;
 MSS_READY_net_1        <= MSS_READY_net_0;
 MSS_READY              <= MSS_READY_net_1;
 INT_net_1              <= INT_net_0;
 INT(31 downto 0)       <= INT_net_1;
 GPIO_OUT_net_1         <= GPIO_OUT_net_0;
 GPIO_OUT(31 downto 0)  <= GPIO_OUT_net_1;
 GPIO_OE_net_1          <= GPIO_OE_net_0;
 GPIO_OE(31 downto 0)   <= GPIO_OE_net_1;
 enable_master_net_1    <= enable_master_net_0;
 enable_master          <= enable_master_net_1;
 enable_slave_net_1     <= enable_slave_net_0;
 enable_slave           <= enable_slave_net_1;
 m_mosi_net_1           <= m_mosi_net_0;
 m_mosi                 <= m_mosi_net_1;
 m_sck_net_1            <= m_sck_net_0;
 m_sck                  <= m_sck_net_1;
 m_ss_net_1             <= m_ss_net_0;
 m_ss(7 downto 0)       <= m_ss_net_1;
 s_miso_net_1           <= s_miso_net_0;
 s_miso                 <= s_miso_net_1;
 enable_master_0_net_1  <= enable_master_0_net_0;
 enable_master_0        <= enable_master_0_net_1;
 enable_slave_0_net_1   <= enable_slave_0_net_0;
 enable_slave_0         <= enable_slave_0_net_1;
 m_mosi_0_net_1         <= m_mosi_0_net_0;
 m_mosi_0               <= m_mosi_0_net_1;
 m_sck_0_net_1          <= m_sck_0_net_0;
 m_sck_0                <= m_sck_0_net_1;
 m_ss_0_net_1           <= m_ss_0_net_0;
 m_ss_0(7 downto 0)     <= m_ss_0_net_1;
 s_miso_0_net_1         <= s_miso_0_net_0;
 s_miso_0               <= s_miso_0_net_1;
 enable_master_1_net_1  <= enable_master_1_net_0;
 enable_master_1        <= enable_master_1_net_1;
 enable_slave_1_net_1   <= enable_slave_1_net_0;
 enable_slave_1         <= enable_slave_1_net_1;
 m_mosi_1_net_1         <= m_mosi_1_net_0;
 m_mosi_1               <= m_mosi_1_net_1;
 m_sck_1_net_1          <= m_sck_1_net_0;
 m_sck_1                <= m_sck_1_net_1;
 m_ss_1_net_1           <= m_ss_1_net_0;
 m_ss_1(7 downto 0)     <= m_ss_1_net_1;
 s_miso_1_net_1         <= s_miso_1_net_0;
 s_miso_1               <= s_miso_1_net_1;
 enable_master_2_net_1  <= enable_master_2_net_0;
 enable_master_2        <= enable_master_2_net_1;
 enable_slave_2_net_1   <= enable_slave_2_net_0;
 enable_slave_2         <= enable_slave_2_net_1;
 m_mosi_2_net_1         <= m_mosi_2_net_0;
 m_mosi_2               <= m_mosi_2_net_1;
 m_sck_2_net_1          <= m_sck_2_net_0;
 m_sck_2                <= m_sck_2_net_1;
 m_ss_2_net_1           <= m_ss_2_net_0;
 m_ss_2(7 downto 0)     <= m_ss_2_net_1;
 s_miso_2_net_1         <= s_miso_2_net_0;
 s_miso_2               <= s_miso_2_net_1;
 enable_master_3_net_1  <= enable_master_3_net_0;
 enable_master_3        <= enable_master_3_net_1;
 enable_slave_3_net_1   <= enable_slave_3_net_0;
 enable_slave_3         <= enable_slave_3_net_1;
 m_mosi_3_net_1         <= m_mosi_3_net_0;
 m_mosi_3               <= m_mosi_3_net_1;
 m_sck_3_net_1          <= m_sck_3_net_0;
 m_sck_3                <= m_sck_3_net_1;
 m_ss_3_net_1           <= m_ss_3_net_0;
 m_ss_3(7 downto 0)     <= m_ss_3_net_1;
 s_miso_3_net_1         <= s_miso_3_net_0;
 s_miso_3               <= s_miso_3_net_1;
 enable_master_4_net_1  <= enable_master_4_net_0;
 enable_master_4        <= enable_master_4_net_1;
 enable_slave_4_net_1   <= enable_slave_4_net_0;
 enable_slave_4         <= enable_slave_4_net_1;
 m_mosi_4_net_1         <= m_mosi_4_net_0;
 m_mosi_4               <= m_mosi_4_net_1;
 m_sck_4_net_1          <= m_sck_4_net_0;
 m_sck_4                <= m_sck_4_net_1;
 m_ss_4_net_1           <= m_ss_4_net_0;
 m_ss_4(7 downto 0)     <= m_ss_4_net_1;
 s_miso_4_net_1         <= s_miso_4_net_0;
 s_miso_4               <= s_miso_4_net_1;
 enable_master_5_net_1  <= enable_master_5_net_0;
 enable_master_5        <= enable_master_5_net_1;
 enable_slave_5_net_1   <= enable_slave_5_net_0;
 enable_slave_5         <= enable_slave_5_net_1;
 m_mosi_5_net_1         <= m_mosi_5_net_0;
 m_mosi_5               <= m_mosi_5_net_1;
 m_sck_5_net_1          <= m_sck_5_net_0;
 m_sck_5                <= m_sck_5_net_1;
 m_ss_5_net_1           <= m_ss_5_net_0;
 m_ss_5(7 downto 0)     <= m_ss_5_net_1;
 s_miso_5_net_1         <= s_miso_5_net_0;
 s_miso_5               <= s_miso_5_net_1;
 enable_master_6_net_1  <= enable_master_6_net_0;
 enable_master_6        <= enable_master_6_net_1;
 enable_slave_6_net_1   <= enable_slave_6_net_0;
 enable_slave_6         <= enable_slave_6_net_1;
 m_mosi_6_net_1         <= m_mosi_6_net_0;
 m_mosi_6               <= m_mosi_6_net_1;
 m_sck_6_net_1          <= m_sck_6_net_0;
 m_sck_6                <= m_sck_6_net_1;
 m_ss_6_net_1           <= m_ss_6_net_0;
 m_ss_6(7 downto 0)     <= m_ss_6_net_1;
 s_miso_6_net_1         <= s_miso_6_net_0;
 s_miso_6               <= s_miso_6_net_1;
 TX_net_1               <= TX_net_0;
 TX                     <= TX_net_1;
 TX_0_net_1             <= TX_0_net_0;
 TX_0                   <= TX_0_net_1;
 TX_1_net_1             <= TX_1_net_0;
 TX_1                   <= TX_1_net_1;
 TX_2_net_1             <= TX_2_net_0;
 TX_2                   <= TX_2_net_1;
 TX_3_net_1             <= TX_3_net_0;
 TX_3                   <= TX_3_net_1;
 TX_4_net_1             <= TX_4_net_0;
 TX_4                   <= TX_4_net_1;
 TX_5_net_1             <= TX_5_net_0;
 TX_5                   <= TX_5_net_1;
 TX_6_net_1             <= TX_6_net_0;
 TX_6                   <= TX_6_net_1;
 TX_7_net_1             <= TX_7_net_0;
 TX_7                   <= TX_7_net_1;
 TX_8_net_1             <= TX_8_net_0;
 TX_8                   <= TX_8_net_1;
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 MSS_INT_F2M_net_0 <= ( CoreInterrupt_0_IRQ & CORESPI_0_4_intr_or_0_Y & CORESPI_0_3_intr_or_0_Y & CORESPI_0_2_intr_or_0_Y & CORESPI_0_1_intr_or_0_Y & CORESPI_0_0_intr_or_0_Y & COREI2C_0_9_INT(0) & COREI2C_0_8_INT(0) & COREI2C_0_7_INT(0) & COREI2C_0_6_INT(0) & COREI2C_0_5_INT(0) & COREI2C_0_4_INT(0) & COREI2C_0_3_INT(0) & COREI2C_0_2_INT(0) & COREI2C_0_1_INT(0) & COREI2C_0_0_INT(0) );
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CoreAPB3_0_APBmslave0_PADDR_0_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_0 <= ( CoreAPB3_0_APBmslave0_PADDR_0_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_3_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_3 <= ( CoreAPB3_0_APBmslave0_PADDR_3_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_12_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_12 <= ( CoreAPB3_0_APBmslave0_PADDR_12_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_13_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_13 <= ( CoreAPB3_0_APBmslave0_PADDR_13_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_14_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_14 <= ( CoreAPB3_0_APBmslave0_PADDR_14_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_15_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_15 <= ( CoreAPB3_0_APBmslave0_PADDR_15_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_1_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_1 <= ( CoreAPB3_0_APBmslave0_PADDR_1_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_2_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_2 <= ( CoreAPB3_0_APBmslave0_PADDR_2_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_7_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_7 <= ( CoreAPB3_0_APBmslave0_PADDR_7_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_8_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_8 <= ( CoreAPB3_0_APBmslave0_PADDR_8_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_10_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_10 <= ( CoreAPB3_0_APBmslave0_PADDR_10_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_9_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_9 <= ( CoreAPB3_0_APBmslave0_PADDR_9_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_11_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_11 <= ( CoreAPB3_0_APBmslave0_PADDR_11_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_4_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_4 <= ( CoreAPB3_0_APBmslave0_PADDR_4_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_5_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_5 <= ( CoreAPB3_0_APBmslave0_PADDR_5_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_6_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_6 <= ( CoreAPB3_0_APBmslave0_PADDR_6_8to0(8 downto 0) );

 CoreAPB3_0_APBmslave0_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave0_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PRDATA_0 <= ( CoreAPB3_0_APBmslave0_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave0_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave0_PWDATA_3_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_3 <= ( CoreAPB3_0_APBmslave0_PWDATA_3_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_11_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_11 <= ( CoreAPB3_0_APBmslave0_PWDATA_11_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_12_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_12 <= ( CoreAPB3_0_APBmslave0_PWDATA_12_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_13_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_13 <= ( CoreAPB3_0_APBmslave0_PWDATA_13_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_14_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_14 <= ( CoreAPB3_0_APBmslave0_PWDATA_14_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_15_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_15 <= ( CoreAPB3_0_APBmslave0_PWDATA_15_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_0 <= ( CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_1_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_1 <= ( CoreAPB3_0_APBmslave0_PWDATA_1_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_2_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_2 <= ( CoreAPB3_0_APBmslave0_PWDATA_2_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_7_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_7 <= ( CoreAPB3_0_APBmslave0_PWDATA_7_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_8_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_8 <= ( CoreAPB3_0_APBmslave0_PWDATA_8_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_10_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_10 <= ( CoreAPB3_0_APBmslave0_PWDATA_10_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_9_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_9 <= ( CoreAPB3_0_APBmslave0_PWDATA_9_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_4_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_4 <= ( CoreAPB3_0_APBmslave0_PWDATA_4_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_5_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_5 <= ( CoreAPB3_0_APBmslave0_PWDATA_5_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_6_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_6 <= ( CoreAPB3_0_APBmslave0_PWDATA_6_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave1_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave1_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave1_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave1_PRDATA_0 <= ( CoreAPB3_0_APBmslave1_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave1_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave2_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave2_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave2_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave2_PRDATA_0 <= ( CoreAPB3_0_APBmslave2_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave2_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave3_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave3_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave3_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave3_PRDATA_0 <= ( CoreAPB3_0_APBmslave3_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave3_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave4_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave4_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave4_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave4_PRDATA_0 <= ( CoreAPB3_0_APBmslave4_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave4_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave5_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave5_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave5_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave5_PRDATA_0 <= ( CoreAPB3_0_APBmslave5_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave5_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave6_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave6_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave6_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave6_PRDATA_0 <= ( CoreAPB3_0_APBmslave6_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave6_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave7_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave7_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave7_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave7_PRDATA_0 <= ( CoreAPB3_0_APBmslave7_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave7_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave8_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave8_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave8_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave8_PRDATA_0 <= ( CoreAPB3_0_APBmslave8_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave8_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave9_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave9_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave9_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave9_PRDATA_0 <= ( CoreAPB3_0_APBmslave9_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave9_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave10_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave10_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave10_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave10_PRDATA_0 <= ( CoreAPB3_0_APBmslave10_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave10_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave11_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave11_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave11_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave11_PRDATA_0 <= ( CoreAPB3_0_APBmslave11_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave11_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave12_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave12_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave12_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave12_PRDATA_0 <= ( CoreAPB3_0_APBmslave12_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave12_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave13_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave13_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave13_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave13_PRDATA_0 <= ( CoreAPB3_0_APBmslave13_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave13_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave14_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave14_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave14_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave14_PRDATA_0 <= ( CoreAPB3_0_APBmslave14_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave14_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave15_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave15_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave15_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave15_PRDATA_0 <= ( CoreAPB3_0_APBmslave15_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave15_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave0_PADDR_0_3to0(3 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_0 <= ( CoreAPB3_1_APBmslave0_PADDR_0_3to0(3 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_5_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_5 <= ( CoreAPB3_1_APBmslave0_PADDR_5_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_6_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_6 <= ( CoreAPB3_1_APBmslave0_PADDR_6_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_2_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_2 <= ( CoreAPB3_1_APBmslave0_PADDR_2_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_1_3to0(3 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_1 <= ( CoreAPB3_1_APBmslave0_PADDR_1_3to0(3 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_3_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_3 <= ( CoreAPB3_1_APBmslave0_PADDR_3_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_4_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_4 <= ( CoreAPB3_1_APBmslave0_PADDR_4_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_7_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_7 <= ( CoreAPB3_1_APBmslave0_PADDR_7_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_8_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_8 <= ( CoreAPB3_1_APBmslave0_PADDR_8_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_9_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_9 <= ( CoreAPB3_1_APBmslave0_PADDR_9_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_10_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_10 <= ( CoreAPB3_1_APBmslave0_PADDR_10_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_11_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_11 <= ( CoreAPB3_1_APBmslave0_PADDR_11_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_12_4to0(4 downto 0) <= CoreAPB3_1_APBmslave0_PADDR(4 downto 0);
 CoreAPB3_1_APBmslave0_PADDR_12 <= ( CoreAPB3_1_APBmslave0_PADDR_12_4to0(4 downto 0) );
 CoreAPB3_1_APBmslave0_PADDR_13_5to2(5 downto 2) <= CoreAPB3_1_APBmslave0_PADDR(5 downto 2);
 CoreAPB3_1_APBmslave0_PADDR_13 <= ( CoreAPB3_1_APBmslave0_PADDR_13_5to2(5 downto 2) );

 CoreAPB3_1_APBmslave0_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave0_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PRDATA_0 <= ( CoreAPB3_1_APBmslave0_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave0_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave0_PWDATA_4_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_4 <= ( CoreAPB3_1_APBmslave0_PWDATA_4_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_5_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_5 <= ( CoreAPB3_1_APBmslave0_PWDATA_5_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_0 <= ( CoreAPB3_1_APBmslave0_PWDATA_0_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_1_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_1 <= ( CoreAPB3_1_APBmslave0_PWDATA_1_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_3_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_3 <= ( CoreAPB3_1_APBmslave0_PWDATA_3_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_2_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_2 <= ( CoreAPB3_1_APBmslave0_PWDATA_2_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_6_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_6 <= ( CoreAPB3_1_APBmslave0_PWDATA_6_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_7_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_7 <= ( CoreAPB3_1_APBmslave0_PWDATA_7_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_8_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_8 <= ( CoreAPB3_1_APBmslave0_PWDATA_8_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_9_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_9 <= ( CoreAPB3_1_APBmslave0_PWDATA_9_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_10_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_10 <= ( CoreAPB3_1_APBmslave0_PWDATA_10_7to0(7 downto 0) );
 CoreAPB3_1_APBmslave0_PWDATA_11_7to0(7 downto 0) <= CoreAPB3_1_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_1_APBmslave0_PWDATA_11 <= ( CoreAPB3_1_APBmslave0_PWDATA_11_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave1_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave1_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave1_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave1_PRDATA_0 <= ( CoreAPB3_1_APBmslave1_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave1_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave3_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave3_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave3_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave3_PRDATA_0 <= ( CoreAPB3_1_APBmslave3_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave3_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave4_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave4_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave4_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave4_PRDATA_0 <= ( CoreAPB3_1_APBmslave4_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave4_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave5_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave5_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave5_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave5_PRDATA_0 <= ( CoreAPB3_1_APBmslave5_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave5_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave6_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave6_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave6_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave6_PRDATA_0 <= ( CoreAPB3_1_APBmslave6_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave6_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave7_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave7_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave7_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave7_PRDATA_0 <= ( CoreAPB3_1_APBmslave7_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave7_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave8_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave8_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave8_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave8_PRDATA_0 <= ( CoreAPB3_1_APBmslave8_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave8_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave9_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave9_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave9_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave9_PRDATA_0 <= ( CoreAPB3_1_APBmslave9_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave9_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave10_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave10_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave10_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave10_PRDATA_0 <= ( CoreAPB3_1_APBmslave10_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave10_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave11_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave11_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave11_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave11_PRDATA_0 <= ( CoreAPB3_1_APBmslave11_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave11_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_1_APBmslave12_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_1_APBmslave12_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_1_APBmslave12_PRDATA(7 downto 0);
 CoreAPB3_1_APBmslave12_PRDATA_0 <= ( CoreAPB3_1_APBmslave12_PRDATA_0_31to8(31 downto 8) & CoreAPB3_1_APBmslave12_PRDATA_0_7to0(7 downto 0) );

 M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0(0) <= M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP(0);
 M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0 <= ( M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0(0) );

 M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2(2) <= '0';
 M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0(1 downto 0) <= M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE(1 downto 0);
 M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0 <= ( M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2(2) & M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0(1 downto 0) );

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- BIBUF_COREI2C_0_0_SCL_IO
BIBUF_COREI2C_0_0_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV0_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_0_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_0_SCL_IO 
        );
-- BIBUF_COREI2C_0_0_SDA_IO
BIBUF_COREI2C_0_0_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV1_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_0_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_0_SDA_IO 
        );
-- BIBUF_COREI2C_0_1_SCL_IO
BIBUF_COREI2C_0_1_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV2_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_1_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_1_SCL_IO 
        );
-- BIBUF_COREI2C_0_1_SDA_IO
BIBUF_COREI2C_0_1_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV3_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_1_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_1_SDA_IO 
        );
-- BIBUF_COREI2C_0_2_SCL_IO
BIBUF_COREI2C_0_2_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV4_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_2_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_2_SCL_IO 
        );
-- BIBUF_COREI2C_0_2_SDA_IO
BIBUF_COREI2C_0_2_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV5_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_2_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_2_SDA_IO 
        );
-- BIBUF_COREI2C_0_3_SCL_IO
BIBUF_COREI2C_0_3_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV6_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_3_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_3_SCL_IO 
        );
-- BIBUF_COREI2C_0_3_SDA_IO
BIBUF_COREI2C_0_3_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV7_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_3_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_3_SDA_IO 
        );
-- BIBUF_COREI2C_0_4_SCL_IO
BIBUF_COREI2C_0_4_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV8_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_4_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_4_SCL_IO 
        );
-- BIBUF_COREI2C_0_4_SDA_IO
BIBUF_COREI2C_0_4_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV9_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_4_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_4_SDA_IO 
        );
-- BIBUF_COREI2C_0_5_SCL_IO
BIBUF_COREI2C_0_5_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV10_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_5_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_5_SCL_IO 
        );
-- BIBUF_COREI2C_0_5_SDA_IO
BIBUF_COREI2C_0_5_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV11_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_5_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_5_SDA_IO 
        );
-- BIBUF_COREI2C_0_6_SCL_IO
BIBUF_COREI2C_0_6_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV12_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_6_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_6_SCL_IO 
        );
-- BIBUF_COREI2C_0_6_SDA_IO
BIBUF_COREI2C_0_6_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV13_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_6_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_6_SDA_IO 
        );
-- BIBUF_COREI2C_0_7_SCL_IO
BIBUF_COREI2C_0_7_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV14_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_7_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_7_SCL_IO 
        );
-- BIBUF_COREI2C_0_7_SDA_IO
BIBUF_COREI2C_0_7_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV15_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_7_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_7_SDA_IO 
        );
-- BIBUF_COREI2C_0_8_SCL_IO
BIBUF_COREI2C_0_8_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV16_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_8_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_8_SCL_IO 
        );
-- BIBUF_COREI2C_0_8_SDA_IO
BIBUF_COREI2C_0_8_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV17_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_8_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_8_SDA_IO 
        );
-- BIBUF_COREI2C_0_9_SCL_IO
BIBUF_COREI2C_0_9_SCL_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV18_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_9_SCL_IO_Y,
        -- Inouts
        PAD => COREI2C_0_9_SCL_IO 
        );
-- BIBUF_COREI2C_0_9_SDA_IO
BIBUF_COREI2C_0_9_SDA_IO : BIBUF
    port map( 
        -- Inputs
        D   => GND_net,
        E   => E_IN_POST_INV19_0,
        -- Outputs
        Y   => BIBUF_COREI2C_0_9_SDA_IO_Y,
        -- Inouts
        PAD => COREI2C_0_9_SDA_IO 
        );
-- CCC_0   -   Actel:SgCore:FCCC:2.0.200
CCC_0 : M2sExt_sb_CCC_0_FCCC
    port map( 
        -- Inputs
        CLK0 => CLK0,
        -- Outputs
        GL0  => FAB_CCC_GL0_net_0,
        LOCK => FAB_CCC_LOCK_net_0 
        );
-- CoreAHBLite_0   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite_0 : entity COREAHBLITE_LIB.CoreAHBLite
    generic map( 
        FAMILY             => ( 19 ),
        HADDR_SHG_CFG      => ( 1 ),
        M0_AHBSLOT0ENABLE  => ( 1 ),
        M0_AHBSLOT1ENABLE  => ( 1 ),
        M0_AHBSLOT2ENABLE  => ( 0 ),
        M0_AHBSLOT3ENABLE  => ( 0 ),
        M0_AHBSLOT4ENABLE  => ( 0 ),
        M0_AHBSLOT5ENABLE  => ( 0 ),
        M0_AHBSLOT6ENABLE  => ( 0 ),
        M0_AHBSLOT7ENABLE  => ( 0 ),
        M0_AHBSLOT8ENABLE  => ( 0 ),
        M0_AHBSLOT9ENABLE  => ( 0 ),
        M0_AHBSLOT10ENABLE => ( 0 ),
        M0_AHBSLOT11ENABLE => ( 0 ),
        M0_AHBSLOT12ENABLE => ( 0 ),
        M0_AHBSLOT13ENABLE => ( 0 ),
        M0_AHBSLOT14ENABLE => ( 0 ),
        M0_AHBSLOT15ENABLE => ( 0 ),
        M0_AHBSLOT16ENABLE => ( 0 ),
        M1_AHBSLOT0ENABLE  => ( 0 ),
        M1_AHBSLOT1ENABLE  => ( 0 ),
        M1_AHBSLOT2ENABLE  => ( 0 ),
        M1_AHBSLOT3ENABLE  => ( 0 ),
        M1_AHBSLOT4ENABLE  => ( 0 ),
        M1_AHBSLOT5ENABLE  => ( 0 ),
        M1_AHBSLOT6ENABLE  => ( 0 ),
        M1_AHBSLOT7ENABLE  => ( 0 ),
        M1_AHBSLOT8ENABLE  => ( 0 ),
        M1_AHBSLOT9ENABLE  => ( 0 ),
        M1_AHBSLOT10ENABLE => ( 0 ),
        M1_AHBSLOT11ENABLE => ( 0 ),
        M1_AHBSLOT12ENABLE => ( 0 ),
        M1_AHBSLOT13ENABLE => ( 0 ),
        M1_AHBSLOT14ENABLE => ( 0 ),
        M1_AHBSLOT15ENABLE => ( 0 ),
        M1_AHBSLOT16ENABLE => ( 0 ),
        M2_AHBSLOT0ENABLE  => ( 0 ),
        M2_AHBSLOT1ENABLE  => ( 0 ),
        M2_AHBSLOT2ENABLE  => ( 0 ),
        M2_AHBSLOT3ENABLE  => ( 0 ),
        M2_AHBSLOT4ENABLE  => ( 0 ),
        M2_AHBSLOT5ENABLE  => ( 0 ),
        M2_AHBSLOT6ENABLE  => ( 0 ),
        M2_AHBSLOT7ENABLE  => ( 0 ),
        M2_AHBSLOT8ENABLE  => ( 0 ),
        M2_AHBSLOT9ENABLE  => ( 0 ),
        M2_AHBSLOT10ENABLE => ( 0 ),
        M2_AHBSLOT11ENABLE => ( 0 ),
        M2_AHBSLOT12ENABLE => ( 0 ),
        M2_AHBSLOT13ENABLE => ( 0 ),
        M2_AHBSLOT14ENABLE => ( 0 ),
        M2_AHBSLOT15ENABLE => ( 0 ),
        M2_AHBSLOT16ENABLE => ( 0 ),
        M3_AHBSLOT0ENABLE  => ( 0 ),
        M3_AHBSLOT1ENABLE  => ( 0 ),
        M3_AHBSLOT2ENABLE  => ( 0 ),
        M3_AHBSLOT3ENABLE  => ( 0 ),
        M3_AHBSLOT4ENABLE  => ( 0 ),
        M3_AHBSLOT5ENABLE  => ( 0 ),
        M3_AHBSLOT6ENABLE  => ( 0 ),
        M3_AHBSLOT7ENABLE  => ( 0 ),
        M3_AHBSLOT8ENABLE  => ( 0 ),
        M3_AHBSLOT9ENABLE  => ( 0 ),
        M3_AHBSLOT10ENABLE => ( 0 ),
        M3_AHBSLOT11ENABLE => ( 0 ),
        M3_AHBSLOT12ENABLE => ( 0 ),
        M3_AHBSLOT13ENABLE => ( 0 ),
        M3_AHBSLOT14ENABLE => ( 0 ),
        M3_AHBSLOT15ENABLE => ( 0 ),
        M3_AHBSLOT16ENABLE => ( 0 ),
        MEMSPACE           => ( 2 ),
        SC_0               => ( 0 ),
        SC_1               => ( 0 ),
        SC_2               => ( 0 ),
        SC_3               => ( 0 ),
        SC_4               => ( 0 ),
        SC_5               => ( 0 ),
        SC_6               => ( 0 ),
        SC_7               => ( 0 ),
        SC_8               => ( 0 ),
        SC_9               => ( 0 ),
        SC_10              => ( 0 ),
        SC_11              => ( 0 ),
        SC_12              => ( 0 ),
        SC_13              => ( 0 ),
        SC_14              => ( 0 ),
        SC_15              => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK          => FAB_CCC_GL0_net_0,
        HRESETN       => MSS_READY_net_0,
        REMAP_M0      => GND_net,
        HADDR_M0      => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR,
        HMASTLOCK_M0  => GND_net, -- tied to '0' from definition
        HSIZE_M0      => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0,
        HTRANS_M0     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS,
        HWRITE_M0     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE,
        HWDATA_M0     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA,
        HBURST_M0     => HBURST_M0_const_net_0, -- tied to X"0" from definition
        HPROT_M0      => HPROT_M0_const_net_0, -- tied to X"0" from definition
        HADDR_M1      => HADDR_M1_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M1  => GND_net, -- tied to '0' from definition
        HSIZE_M1      => HSIZE_M1_const_net_0, -- tied to X"0" from definition
        HTRANS_M1     => HTRANS_M1_const_net_0, -- tied to X"0" from definition
        HWRITE_M1     => GND_net, -- tied to '0' from definition
        HWDATA_M1     => HWDATA_M1_const_net_0, -- tied to X"0" from definition
        HBURST_M1     => HBURST_M1_const_net_0, -- tied to X"0" from definition
        HPROT_M1      => HPROT_M1_const_net_0, -- tied to X"0" from definition
        HADDR_M2      => HADDR_M2_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M2  => GND_net, -- tied to '0' from definition
        HSIZE_M2      => HSIZE_M2_const_net_0, -- tied to X"0" from definition
        HTRANS_M2     => HTRANS_M2_const_net_0, -- tied to X"0" from definition
        HWRITE_M2     => GND_net, -- tied to '0' from definition
        HWDATA_M2     => HWDATA_M2_const_net_0, -- tied to X"0" from definition
        HBURST_M2     => HBURST_M2_const_net_0, -- tied to X"0" from definition
        HPROT_M2      => HPROT_M2_const_net_0, -- tied to X"0" from definition
        HADDR_M3      => HADDR_M3_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M3  => GND_net, -- tied to '0' from definition
        HSIZE_M3      => HSIZE_M3_const_net_0, -- tied to X"0" from definition
        HTRANS_M3     => HTRANS_M3_const_net_0, -- tied to X"0" from definition
        HWRITE_M3     => GND_net, -- tied to '0' from definition
        HWDATA_M3     => HWDATA_M3_const_net_0, -- tied to X"0" from definition
        HBURST_M3     => HBURST_M3_const_net_0, -- tied to X"0" from definition
        HPROT_M3      => HPROT_M3_const_net_0, -- tied to X"0" from definition
        HRDATA_S0     => CoreAHBLite_0_AHBmslave0_HRDATA,
        HREADYOUT_S0  => CoreAHBLite_0_AHBmslave0_HREADYOUT,
        HRESP_S0      => CoreAHBLite_0_AHBmslave0_HRESP,
        HRDATA_S1     => CoreAHBLite_0_AHBmslave1_HRDATA,
        HREADYOUT_S1  => CoreAHBLite_0_AHBmslave1_HREADYOUT,
        HRESP_S1      => CoreAHBLite_0_AHBmslave1_HRESP,
        HRDATA_S2     => HRDATA_S2_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S2  => VCC_net, -- tied to '1' from definition
        HRESP_S2      => HRESP_S2_const_net_0, -- tied to X"0" from definition
        HRDATA_S3     => HRDATA_S3_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S3  => VCC_net, -- tied to '1' from definition
        HRESP_S3      => HRESP_S3_const_net_0, -- tied to X"0" from definition
        HRDATA_S4     => HRDATA_S4_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S4  => VCC_net, -- tied to '1' from definition
        HRESP_S4      => HRESP_S4_const_net_0, -- tied to X"0" from definition
        HRDATA_S5     => HRDATA_S5_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S5  => VCC_net, -- tied to '1' from definition
        HRESP_S5      => HRESP_S5_const_net_0, -- tied to X"0" from definition
        HRDATA_S6     => HRDATA_S6_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S6  => VCC_net, -- tied to '1' from definition
        HRESP_S6      => HRESP_S6_const_net_0, -- tied to X"0" from definition
        HRDATA_S7     => HRDATA_S7_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S7  => VCC_net, -- tied to '1' from definition
        HRESP_S7      => HRESP_S7_const_net_0, -- tied to X"0" from definition
        HRDATA_S8     => HRDATA_S8_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S8  => VCC_net, -- tied to '1' from definition
        HRESP_S8      => HRESP_S8_const_net_0, -- tied to X"0" from definition
        HRDATA_S9     => HRDATA_S9_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S9  => VCC_net, -- tied to '1' from definition
        HRESP_S9      => HRESP_S9_const_net_0, -- tied to X"0" from definition
        HRDATA_S10    => HRDATA_S10_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S10 => VCC_net, -- tied to '1' from definition
        HRESP_S10     => HRESP_S10_const_net_0, -- tied to X"0" from definition
        HRDATA_S11    => HRDATA_S11_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S11 => VCC_net, -- tied to '1' from definition
        HRESP_S11     => HRESP_S11_const_net_0, -- tied to X"0" from definition
        HRDATA_S12    => HRDATA_S12_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S12 => VCC_net, -- tied to '1' from definition
        HRESP_S12     => HRESP_S12_const_net_0, -- tied to X"0" from definition
        HRDATA_S13    => HRDATA_S13_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S13 => VCC_net, -- tied to '1' from definition
        HRESP_S13     => HRESP_S13_const_net_0, -- tied to X"0" from definition
        HRDATA_S14    => HRDATA_S14_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S14 => VCC_net, -- tied to '1' from definition
        HRESP_S14     => HRESP_S14_const_net_0, -- tied to X"0" from definition
        HRDATA_S15    => HRDATA_S15_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S15 => VCC_net, -- tied to '1' from definition
        HRESP_S15     => HRESP_S15_const_net_0, -- tied to X"0" from definition
        HRDATA_S16    => HRDATA_S16_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S16 => VCC_net, -- tied to '1' from definition
        HRESP_S16     => HRESP_S16_const_net_0, -- tied to X"0" from definition
        -- Outputs
        HRESP_M0      => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP,
        HRDATA_M0     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA,
        HREADY_M0     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY,
        HRESP_M1      => OPEN,
        HRDATA_M1     => OPEN,
        HREADY_M1     => OPEN,
        HRESP_M2      => OPEN,
        HRDATA_M2     => OPEN,
        HREADY_M2     => OPEN,
        HRESP_M3      => OPEN,
        HRDATA_M3     => OPEN,
        HREADY_M3     => OPEN,
        HSEL_S0       => CoreAHBLite_0_AHBmslave0_HSELx,
        HADDR_S0      => CoreAHBLite_0_AHBmslave0_HADDR,
        HSIZE_S0      => CoreAHBLite_0_AHBmslave0_HSIZE,
        HTRANS_S0     => CoreAHBLite_0_AHBmslave0_HTRANS,
        HWRITE_S0     => CoreAHBLite_0_AHBmslave0_HWRITE,
        HWDATA_S0     => CoreAHBLite_0_AHBmslave0_HWDATA,
        HREADY_S0     => CoreAHBLite_0_AHBmslave0_HREADY,
        HMASTLOCK_S0  => CoreAHBLite_0_AHBmslave0_HMASTLOCK,
        HBURST_S0     => CoreAHBLite_0_AHBmslave0_HBURST,
        HPROT_S0      => CoreAHBLite_0_AHBmslave0_HPROT,
        HSEL_S1       => CoreAHBLite_0_AHBmslave1_HSELx,
        HADDR_S1      => CoreAHBLite_0_AHBmslave1_HADDR,
        HSIZE_S1      => CoreAHBLite_0_AHBmslave1_HSIZE,
        HTRANS_S1     => CoreAHBLite_0_AHBmslave1_HTRANS,
        HWRITE_S1     => CoreAHBLite_0_AHBmslave1_HWRITE,
        HWDATA_S1     => CoreAHBLite_0_AHBmslave1_HWDATA,
        HREADY_S1     => CoreAHBLite_0_AHBmslave1_HREADY,
        HMASTLOCK_S1  => CoreAHBLite_0_AHBmslave1_HMASTLOCK,
        HBURST_S1     => CoreAHBLite_0_AHBmslave1_HBURST,
        HPROT_S1      => CoreAHBLite_0_AHBmslave1_HPROT,
        HSEL_S2       => OPEN,
        HADDR_S2      => OPEN,
        HSIZE_S2      => OPEN,
        HTRANS_S2     => OPEN,
        HWRITE_S2     => OPEN,
        HWDATA_S2     => OPEN,
        HREADY_S2     => OPEN,
        HMASTLOCK_S2  => OPEN,
        HBURST_S2     => OPEN,
        HPROT_S2      => OPEN,
        HSEL_S3       => OPEN,
        HADDR_S3      => OPEN,
        HSIZE_S3      => OPEN,
        HTRANS_S3     => OPEN,
        HWRITE_S3     => OPEN,
        HWDATA_S3     => OPEN,
        HREADY_S3     => OPEN,
        HMASTLOCK_S3  => OPEN,
        HBURST_S3     => OPEN,
        HPROT_S3      => OPEN,
        HSEL_S4       => OPEN,
        HADDR_S4      => OPEN,
        HSIZE_S4      => OPEN,
        HTRANS_S4     => OPEN,
        HWRITE_S4     => OPEN,
        HWDATA_S4     => OPEN,
        HREADY_S4     => OPEN,
        HMASTLOCK_S4  => OPEN,
        HBURST_S4     => OPEN,
        HPROT_S4      => OPEN,
        HSEL_S5       => OPEN,
        HADDR_S5      => OPEN,
        HSIZE_S5      => OPEN,
        HTRANS_S5     => OPEN,
        HWRITE_S5     => OPEN,
        HWDATA_S5     => OPEN,
        HREADY_S5     => OPEN,
        HMASTLOCK_S5  => OPEN,
        HBURST_S5     => OPEN,
        HPROT_S5      => OPEN,
        HSEL_S6       => OPEN,
        HADDR_S6      => OPEN,
        HSIZE_S6      => OPEN,
        HTRANS_S6     => OPEN,
        HWRITE_S6     => OPEN,
        HWDATA_S6     => OPEN,
        HREADY_S6     => OPEN,
        HMASTLOCK_S6  => OPEN,
        HBURST_S6     => OPEN,
        HPROT_S6      => OPEN,
        HSEL_S7       => OPEN,
        HADDR_S7      => OPEN,
        HSIZE_S7      => OPEN,
        HTRANS_S7     => OPEN,
        HWRITE_S7     => OPEN,
        HWDATA_S7     => OPEN,
        HREADY_S7     => OPEN,
        HMASTLOCK_S7  => OPEN,
        HBURST_S7     => OPEN,
        HPROT_S7      => OPEN,
        HSEL_S8       => OPEN,
        HADDR_S8      => OPEN,
        HSIZE_S8      => OPEN,
        HTRANS_S8     => OPEN,
        HWRITE_S8     => OPEN,
        HWDATA_S8     => OPEN,
        HREADY_S8     => OPEN,
        HMASTLOCK_S8  => OPEN,
        HBURST_S8     => OPEN,
        HPROT_S8      => OPEN,
        HSEL_S9       => OPEN,
        HADDR_S9      => OPEN,
        HSIZE_S9      => OPEN,
        HTRANS_S9     => OPEN,
        HWRITE_S9     => OPEN,
        HWDATA_S9     => OPEN,
        HREADY_S9     => OPEN,
        HMASTLOCK_S9  => OPEN,
        HBURST_S9     => OPEN,
        HPROT_S9      => OPEN,
        HSEL_S10      => OPEN,
        HADDR_S10     => OPEN,
        HSIZE_S10     => OPEN,
        HTRANS_S10    => OPEN,
        HWRITE_S10    => OPEN,
        HWDATA_S10    => OPEN,
        HREADY_S10    => OPEN,
        HMASTLOCK_S10 => OPEN,
        HBURST_S10    => OPEN,
        HPROT_S10     => OPEN,
        HSEL_S11      => OPEN,
        HADDR_S11     => OPEN,
        HSIZE_S11     => OPEN,
        HTRANS_S11    => OPEN,
        HWRITE_S11    => OPEN,
        HWDATA_S11    => OPEN,
        HREADY_S11    => OPEN,
        HMASTLOCK_S11 => OPEN,
        HBURST_S11    => OPEN,
        HPROT_S11     => OPEN,
        HSEL_S12      => OPEN,
        HADDR_S12     => OPEN,
        HSIZE_S12     => OPEN,
        HTRANS_S12    => OPEN,
        HWRITE_S12    => OPEN,
        HWDATA_S12    => OPEN,
        HREADY_S12    => OPEN,
        HMASTLOCK_S12 => OPEN,
        HBURST_S12    => OPEN,
        HPROT_S12     => OPEN,
        HSEL_S13      => OPEN,
        HADDR_S13     => OPEN,
        HSIZE_S13     => OPEN,
        HTRANS_S13    => OPEN,
        HWRITE_S13    => OPEN,
        HWDATA_S13    => OPEN,
        HREADY_S13    => OPEN,
        HMASTLOCK_S13 => OPEN,
        HBURST_S13    => OPEN,
        HPROT_S13     => OPEN,
        HSEL_S14      => OPEN,
        HADDR_S14     => OPEN,
        HSIZE_S14     => OPEN,
        HTRANS_S14    => OPEN,
        HWRITE_S14    => OPEN,
        HWDATA_S14    => OPEN,
        HREADY_S14    => OPEN,
        HMASTLOCK_S14 => OPEN,
        HBURST_S14    => OPEN,
        HPROT_S14     => OPEN,
        HSEL_S15      => OPEN,
        HADDR_S15     => OPEN,
        HSIZE_S15     => OPEN,
        HTRANS_S15    => OPEN,
        HWRITE_S15    => OPEN,
        HWDATA_S15    => OPEN,
        HREADY_S15    => OPEN,
        HMASTLOCK_S15 => OPEN,
        HBURST_S15    => OPEN,
        HPROT_S15     => OPEN,
        HSEL_S16      => OPEN,
        HADDR_S16     => OPEN,
        HSIZE_S16     => OPEN,
        HTRANS_S16    => OPEN,
        HWRITE_S16    => OPEN,
        HWDATA_S16    => OPEN,
        HREADY_S16    => OPEN,
        HMASTLOCK_S16 => OPEN,
        HBURST_S16    => OPEN,
        HPROT_S16     => OPEN 
        );
-- COREAHBTOAPB3_0   -   Actel:DirectCore:COREAHBTOAPB3:3.1.100
COREAHBTOAPB3_0 : entity COREAHBTOAPB3_LIB.COREAHBTOAPB3
    generic map( 
        FAMILY => ( 19 )
        )
    port map( 
        -- Inputs
        HCLK      => FAB_CCC_GL0_net_0,
        HRESETN   => MSS_READY_net_0,
        HADDR     => CoreAHBLite_0_AHBmslave0_HADDR,
        HTRANS    => CoreAHBLite_0_AHBmslave0_HTRANS,
        HWRITE    => CoreAHBLite_0_AHBmslave0_HWRITE,
        HWDATA    => CoreAHBLite_0_AHBmslave0_HWDATA,
        HSEL      => CoreAHBLite_0_AHBmslave0_HSELx,
        HREADY    => CoreAHBLite_0_AHBmslave0_HREADY,
        PRDATA    => COREAHBTOAPB3_0_APBmaster_PRDATA,
        PREADY    => COREAHBTOAPB3_0_APBmaster_PREADY,
        PSLVERR   => COREAHBTOAPB3_0_APBmaster_PSLVERR,
        -- Outputs
        HRDATA    => CoreAHBLite_0_AHBmslave0_HRDATA,
        HREADYOUT => CoreAHBLite_0_AHBmslave0_HREADYOUT,
        HRESP     => CoreAHBLite_0_AHBmslave0_HRESP,
        PWDATA    => COREAHBTOAPB3_0_APBmaster_PWDATA,
        PENABLE   => COREAHBTOAPB3_0_APBmaster_PENABLE,
        PADDR     => COREAHBTOAPB3_0_APBmaster_PADDR,
        PWRITE    => COREAHBTOAPB3_0_APBmaster_PWRITE,
        PSEL      => COREAHBTOAPB3_0_APBmaster_PSELx 
        );
-- COREAHBTOAPB3_1   -   Actel:DirectCore:COREAHBTOAPB3:3.1.100
COREAHBTOAPB3_1 : entity COREAHBTOAPB3_LIB.COREAHBTOAPB3
    generic map( 
        FAMILY => ( 19 )
        )
    port map( 
        -- Inputs
        HCLK      => FAB_CCC_GL0_net_0,
        HRESETN   => MSS_READY_net_0,
        HADDR     => CoreAHBLite_0_AHBmslave1_HADDR,
        HTRANS    => CoreAHBLite_0_AHBmslave1_HTRANS,
        HWRITE    => CoreAHBLite_0_AHBmslave1_HWRITE,
        HWDATA    => CoreAHBLite_0_AHBmslave1_HWDATA,
        HSEL      => CoreAHBLite_0_AHBmslave1_HSELx,
        HREADY    => CoreAHBLite_0_AHBmslave1_HREADY,
        PRDATA    => COREAHBTOAPB3_1_APBmaster_PRDATA,
        PREADY    => COREAHBTOAPB3_1_APBmaster_PREADY,
        PSLVERR   => COREAHBTOAPB3_1_APBmaster_PSLVERR,
        -- Outputs
        HRDATA    => CoreAHBLite_0_AHBmslave1_HRDATA,
        HREADYOUT => CoreAHBLite_0_AHBmslave1_HREADYOUT,
        HRESP     => CoreAHBLite_0_AHBmslave1_HRESP,
        PWDATA    => COREAHBTOAPB3_1_APBmaster_PWDATA,
        PENABLE   => COREAHBTOAPB3_1_APBmaster_PENABLE,
        PADDR     => COREAHBTOAPB3_1_APBmaster_PADDR,
        PWRITE    => COREAHBTOAPB3_1_APBmaster_PWRITE,
        PSEL      => COREAHBTOAPB3_1_APBmaster_PSELx 
        );
-- CoreAPB3_0   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 1 ),
        APBSLOT2ENABLE  => ( 1 ),
        APBSLOT3ENABLE  => ( 1 ),
        APBSLOT4ENABLE  => ( 1 ),
        APBSLOT5ENABLE  => ( 1 ),
        APBSLOT6ENABLE  => ( 1 ),
        APBSLOT7ENABLE  => ( 1 ),
        APBSLOT8ENABLE  => ( 1 ),
        APBSLOT9ENABLE  => ( 1 ),
        APBSLOT10ENABLE => ( 1 ),
        APBSLOT11ENABLE => ( 1 ),
        APBSLOT12ENABLE => ( 1 ),
        APBSLOT13ENABLE => ( 1 ),
        APBSLOT14ENABLE => ( 1 ),
        APBSLOT15ENABLE => ( 1 ),
        FAMILY          => ( 19 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 16 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 3 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PADDR      => COREAHBTOAPB3_0_APBmaster_PADDR,
        PWRITE     => COREAHBTOAPB3_0_APBmaster_PWRITE,
        PENABLE    => COREAHBTOAPB3_0_APBmaster_PENABLE,
        PWDATA     => COREAHBTOAPB3_0_APBmaster_PWDATA,
        PSEL       => COREAHBTOAPB3_0_APBmaster_PSELx,
        PRDATAS0   => CoreAPB3_0_APBmslave0_PRDATA_0,
        PREADYS0   => VCC_net, -- tied to '1' from definition
        PSLVERRS0  => GND_net, -- tied to '0' from definition
        PRDATAS1   => CoreAPB3_0_APBmslave1_PRDATA_0,
        PREADYS1   => VCC_net, -- tied to '1' from definition
        PSLVERRS1  => GND_net, -- tied to '0' from definition
        PRDATAS2   => CoreAPB3_0_APBmslave2_PRDATA_0,
        PREADYS2   => VCC_net, -- tied to '1' from definition
        PSLVERRS2  => GND_net, -- tied to '0' from definition
        PRDATAS3   => CoreAPB3_0_APBmslave3_PRDATA_0,
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PRDATAS4   => CoreAPB3_0_APBmslave4_PRDATA_0,
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PRDATAS5   => CoreAPB3_0_APBmslave5_PRDATA_0,
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PRDATAS6   => CoreAPB3_0_APBmslave6_PRDATA_0,
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PRDATAS7   => CoreAPB3_0_APBmslave7_PRDATA_0,
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PRDATAS8   => CoreAPB3_0_APBmslave8_PRDATA_0,
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PRDATAS9   => CoreAPB3_0_APBmslave9_PRDATA_0,
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PRDATAS10  => CoreAPB3_0_APBmslave10_PRDATA_0,
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PRDATAS11  => CoreAPB3_0_APBmslave11_PRDATA_0,
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PRDATAS12  => CoreAPB3_0_APBmslave12_PRDATA_0,
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PRDATAS13  => CoreAPB3_0_APBmslave13_PRDATA_0,
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PRDATAS14  => CoreAPB3_0_APBmslave14_PRDATA_0,
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PRDATAS15  => CoreAPB3_0_APBmslave15_PRDATA_0,
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PRDATA     => COREAHBTOAPB3_0_APBmaster_PRDATA,
        PREADY     => COREAHBTOAPB3_0_APBmaster_PREADY,
        PSLVERR    => COREAHBTOAPB3_0_APBmaster_PSLVERR,
        PADDRS     => CoreAPB3_0_APBmslave0_PADDR,
        PWRITES    => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLES   => CoreAPB3_0_APBmslave0_PENABLE,
        PWDATAS    => CoreAPB3_0_APBmslave0_PWDATA,
        PSELS0     => CoreAPB3_0_APBmslave0_PSELx,
        PSELS1     => CoreAPB3_0_APBmslave1_PSELx,
        PSELS2     => CoreAPB3_0_APBmslave2_PSELx,
        PSELS3     => CoreAPB3_0_APBmslave3_PSELx,
        PSELS4     => CoreAPB3_0_APBmslave4_PSELx,
        PSELS5     => CoreAPB3_0_APBmslave5_PSELx,
        PSELS6     => CoreAPB3_0_APBmslave6_PSELx,
        PSELS7     => CoreAPB3_0_APBmslave7_PSELx,
        PSELS8     => CoreAPB3_0_APBmslave8_PSELx,
        PSELS9     => CoreAPB3_0_APBmslave9_PSELx,
        PSELS10    => CoreAPB3_0_APBmslave10_PSELx,
        PSELS11    => CoreAPB3_0_APBmslave11_PSELx,
        PSELS12    => CoreAPB3_0_APBmslave12_PSELx,
        PSELS13    => CoreAPB3_0_APBmslave13_PSELx,
        PSELS14    => CoreAPB3_0_APBmslave14_PSELx,
        PSELS15    => CoreAPB3_0_APBmslave15_PSELx,
        PSELS16    => OPEN 
        );
-- CoreAPB3_1   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_1 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 1 ),
        APBSLOT2ENABLE  => ( 1 ),
        APBSLOT3ENABLE  => ( 1 ),
        APBSLOT4ENABLE  => ( 1 ),
        APBSLOT5ENABLE  => ( 1 ),
        APBSLOT6ENABLE  => ( 1 ),
        APBSLOT7ENABLE  => ( 1 ),
        APBSLOT8ENABLE  => ( 1 ),
        APBSLOT9ENABLE  => ( 1 ),
        APBSLOT10ENABLE => ( 1 ),
        APBSLOT11ENABLE => ( 1 ),
        APBSLOT12ENABLE => ( 1 ),
        APBSLOT13ENABLE => ( 1 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        FAMILY          => ( 19 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 16 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 3 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PADDR      => COREAHBTOAPB3_1_APBmaster_PADDR,
        PWRITE     => COREAHBTOAPB3_1_APBmaster_PWRITE,
        PENABLE    => COREAHBTOAPB3_1_APBmaster_PENABLE,
        PWDATA     => COREAHBTOAPB3_1_APBmaster_PWDATA,
        PSEL       => COREAHBTOAPB3_1_APBmaster_PSELx,
        PRDATAS0   => CoreAPB3_1_APBmslave0_PRDATA_0,
        PREADYS0   => VCC_net, -- tied to '1' from definition
        PSLVERRS0  => GND_net, -- tied to '0' from definition
        PRDATAS1   => CoreAPB3_1_APBmslave1_PRDATA_0,
        PREADYS1   => VCC_net, -- tied to '1' from definition
        PSLVERRS1  => GND_net, -- tied to '0' from definition
        PRDATAS2   => CoreAPB3_1_APBmslave2_PRDATA,
        PREADYS2   => CoreAPB3_1_APBmslave2_PREADY,
        PSLVERRS2  => CoreAPB3_1_APBmslave2_PSLVERR,
        PRDATAS3   => CoreAPB3_1_APBmslave3_PRDATA_0,
        PREADYS3   => CoreAPB3_1_APBmslave3_PREADY,
        PSLVERRS3  => CoreAPB3_1_APBmslave3_PSLVERR,
        PRDATAS4   => CoreAPB3_1_APBmslave4_PRDATA_0,
        PREADYS4   => CoreAPB3_1_APBmslave4_PREADY,
        PSLVERRS4  => CoreAPB3_1_APBmslave4_PSLVERR,
        PRDATAS5   => CoreAPB3_1_APBmslave5_PRDATA_0,
        PREADYS5   => CoreAPB3_1_APBmslave5_PREADY,
        PSLVERRS5  => CoreAPB3_1_APBmslave5_PSLVERR,
        PRDATAS6   => CoreAPB3_1_APBmslave6_PRDATA_0,
        PREADYS6   => CoreAPB3_1_APBmslave6_PREADY,
        PSLVERRS6  => CoreAPB3_1_APBmslave6_PSLVERR,
        PRDATAS7   => CoreAPB3_1_APBmslave7_PRDATA_0,
        PREADYS7   => CoreAPB3_1_APBmslave7_PREADY,
        PSLVERRS7  => CoreAPB3_1_APBmslave7_PSLVERR,
        PRDATAS8   => CoreAPB3_1_APBmslave8_PRDATA_0,
        PREADYS8   => CoreAPB3_1_APBmslave8_PREADY,
        PSLVERRS8  => CoreAPB3_1_APBmslave8_PSLVERR,
        PRDATAS9   => CoreAPB3_1_APBmslave9_PRDATA_0,
        PREADYS9   => CoreAPB3_1_APBmslave9_PREADY,
        PSLVERRS9  => CoreAPB3_1_APBmslave9_PSLVERR,
        PRDATAS10  => CoreAPB3_1_APBmslave10_PRDATA_0,
        PREADYS10  => CoreAPB3_1_APBmslave10_PREADY,
        PSLVERRS10 => CoreAPB3_1_APBmslave10_PSLVERR,
        PRDATAS11  => CoreAPB3_1_APBmslave11_PRDATA_0,
        PREADYS11  => CoreAPB3_1_APBmslave11_PREADY,
        PSLVERRS11 => CoreAPB3_1_APBmslave11_PSLVERR,
        PRDATAS12  => CoreAPB3_1_APBmslave12_PRDATA_0,
        PREADYS12  => CoreAPB3_1_APBmslave12_PREADY,
        PSLVERRS12 => CoreAPB3_1_APBmslave12_PSLVERR,
        PRDATAS13  => CoreAPB3_1_APBmslave13_PRDATA,
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PRDATAS16  => PRDATAS16_const_net_1, -- tied to X"0" from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        IADDR      => IADDR_const_net_1, -- tied to X"0" from definition
        -- Outputs
        PRDATA     => COREAHBTOAPB3_1_APBmaster_PRDATA,
        PREADY     => COREAHBTOAPB3_1_APBmaster_PREADY,
        PSLVERR    => COREAHBTOAPB3_1_APBmaster_PSLVERR,
        PADDRS     => CoreAPB3_1_APBmslave0_PADDR,
        PWRITES    => CoreAPB3_1_APBmslave0_PWRITE,
        PENABLES   => CoreAPB3_1_APBmslave0_PENABLE,
        PWDATAS    => CoreAPB3_1_APBmslave0_PWDATA,
        PSELS0     => CoreAPB3_1_APBmslave0_PSELx,
        PSELS1     => CoreAPB3_1_APBmslave1_PSELx,
        PSELS2     => CoreAPB3_1_APBmslave2_PSELx,
        PSELS3     => CoreAPB3_1_APBmslave3_PSELx,
        PSELS4     => CoreAPB3_1_APBmslave4_PSELx,
        PSELS5     => CoreAPB3_1_APBmslave5_PSELx,
        PSELS6     => CoreAPB3_1_APBmslave6_PSELx,
        PSELS7     => CoreAPB3_1_APBmslave7_PSELx,
        PSELS8     => CoreAPB3_1_APBmslave8_PSELx,
        PSELS9     => CoreAPB3_1_APBmslave9_PSELx,
        PSELS10    => CoreAPB3_1_APBmslave10_PSELx,
        PSELS11    => CoreAPB3_1_APBmslave11_PSELx,
        PSELS12    => CoreAPB3_1_APBmslave12_PSELx,
        PSELS13    => CoreAPB3_1_APBmslave13_PSELx,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PSELS16    => OPEN 
        );
-- CoreGPIO_0_0   -   Actel:DirectCore:CoreGPIO:3.0.120
CoreGPIO_0_0 : entity COREGPIO_LIB.CoreGPIO
    generic map( 
        APB_WIDTH       => ( 32 ),
        FAMILY          => ( 15 ),
        FIXED_CONFIG_0  => ( 0 ),
        FIXED_CONFIG_1  => ( 0 ),
        FIXED_CONFIG_2  => ( 0 ),
        FIXED_CONFIG_3  => ( 0 ),
        FIXED_CONFIG_4  => ( 0 ),
        FIXED_CONFIG_5  => ( 0 ),
        FIXED_CONFIG_6  => ( 0 ),
        FIXED_CONFIG_7  => ( 0 ),
        FIXED_CONFIG_8  => ( 0 ),
        FIXED_CONFIG_9  => ( 0 ),
        FIXED_CONFIG_10 => ( 0 ),
        FIXED_CONFIG_11 => ( 0 ),
        FIXED_CONFIG_12 => ( 0 ),
        FIXED_CONFIG_13 => ( 0 ),
        FIXED_CONFIG_14 => ( 0 ),
        FIXED_CONFIG_15 => ( 0 ),
        FIXED_CONFIG_16 => ( 0 ),
        FIXED_CONFIG_17 => ( 0 ),
        FIXED_CONFIG_18 => ( 0 ),
        FIXED_CONFIG_19 => ( 0 ),
        FIXED_CONFIG_20 => ( 0 ),
        FIXED_CONFIG_21 => ( 0 ),
        FIXED_CONFIG_22 => ( 0 ),
        FIXED_CONFIG_23 => ( 0 ),
        FIXED_CONFIG_24 => ( 0 ),
        FIXED_CONFIG_25 => ( 0 ),
        FIXED_CONFIG_26 => ( 0 ),
        FIXED_CONFIG_27 => ( 0 ),
        FIXED_CONFIG_28 => ( 0 ),
        FIXED_CONFIG_29 => ( 0 ),
        FIXED_CONFIG_30 => ( 0 ),
        FIXED_CONFIG_31 => ( 0 ),
        INT_BUS         => ( 0 ),
        IO_INT_TYPE_0   => ( 7 ),
        IO_INT_TYPE_1   => ( 7 ),
        IO_INT_TYPE_2   => ( 7 ),
        IO_INT_TYPE_3   => ( 7 ),
        IO_INT_TYPE_4   => ( 7 ),
        IO_INT_TYPE_5   => ( 7 ),
        IO_INT_TYPE_6   => ( 7 ),
        IO_INT_TYPE_7   => ( 7 ),
        IO_INT_TYPE_8   => ( 7 ),
        IO_INT_TYPE_9   => ( 7 ),
        IO_INT_TYPE_10  => ( 7 ),
        IO_INT_TYPE_11  => ( 7 ),
        IO_INT_TYPE_12  => ( 7 ),
        IO_INT_TYPE_13  => ( 7 ),
        IO_INT_TYPE_14  => ( 7 ),
        IO_INT_TYPE_15  => ( 7 ),
        IO_INT_TYPE_16  => ( 7 ),
        IO_INT_TYPE_17  => ( 7 ),
        IO_INT_TYPE_18  => ( 7 ),
        IO_INT_TYPE_19  => ( 7 ),
        IO_INT_TYPE_20  => ( 7 ),
        IO_INT_TYPE_21  => ( 7 ),
        IO_INT_TYPE_22  => ( 7 ),
        IO_INT_TYPE_23  => ( 7 ),
        IO_INT_TYPE_24  => ( 7 ),
        IO_INT_TYPE_25  => ( 7 ),
        IO_INT_TYPE_26  => ( 7 ),
        IO_INT_TYPE_27  => ( 7 ),
        IO_INT_TYPE_28  => ( 7 ),
        IO_INT_TYPE_29  => ( 7 ),
        IO_INT_TYPE_30  => ( 7 ),
        IO_INT_TYPE_31  => ( 7 ),
        IO_NUM          => ( 32 ),
        IO_TYPE_0       => ( 0 ),
        IO_TYPE_1       => ( 0 ),
        IO_TYPE_2       => ( 0 ),
        IO_TYPE_3       => ( 0 ),
        IO_TYPE_4       => ( 0 ),
        IO_TYPE_5       => ( 0 ),
        IO_TYPE_6       => ( 0 ),
        IO_TYPE_7       => ( 0 ),
        IO_TYPE_8       => ( 0 ),
        IO_TYPE_9       => ( 0 ),
        IO_TYPE_10      => ( 0 ),
        IO_TYPE_11      => ( 0 ),
        IO_TYPE_12      => ( 0 ),
        IO_TYPE_13      => ( 0 ),
        IO_TYPE_14      => ( 0 ),
        IO_TYPE_15      => ( 0 ),
        IO_TYPE_16      => ( 0 ),
        IO_TYPE_17      => ( 0 ),
        IO_TYPE_18      => ( 0 ),
        IO_TYPE_19      => ( 0 ),
        IO_TYPE_20      => ( 0 ),
        IO_TYPE_21      => ( 0 ),
        IO_TYPE_22      => ( 0 ),
        IO_TYPE_23      => ( 0 ),
        IO_TYPE_24      => ( 0 ),
        IO_TYPE_25      => ( 0 ),
        IO_TYPE_26      => ( 0 ),
        IO_TYPE_27      => ( 0 ),
        IO_TYPE_28      => ( 0 ),
        IO_TYPE_29      => ( 0 ),
        IO_TYPE_30      => ( 0 ),
        IO_TYPE_31      => ( 0 ),
        IO_VAL_0        => ( 0 ),
        IO_VAL_1        => ( 0 ),
        IO_VAL_2        => ( 0 ),
        IO_VAL_3        => ( 0 ),
        IO_VAL_4        => ( 0 ),
        IO_VAL_5        => ( 0 ),
        IO_VAL_6        => ( 0 ),
        IO_VAL_7        => ( 0 ),
        IO_VAL_8        => ( 0 ),
        IO_VAL_9        => ( 0 ),
        IO_VAL_10       => ( 0 ),
        IO_VAL_11       => ( 0 ),
        IO_VAL_12       => ( 0 ),
        IO_VAL_13       => ( 0 ),
        IO_VAL_14       => ( 0 ),
        IO_VAL_15       => ( 0 ),
        IO_VAL_16       => ( 0 ),
        IO_VAL_17       => ( 0 ),
        IO_VAL_18       => ( 0 ),
        IO_VAL_19       => ( 0 ),
        IO_VAL_20       => ( 0 ),
        IO_VAL_21       => ( 0 ),
        IO_VAL_22       => ( 0 ),
        IO_VAL_23       => ( 0 ),
        IO_VAL_24       => ( 0 ),
        IO_VAL_25       => ( 0 ),
        IO_VAL_26       => ( 0 ),
        IO_VAL_27       => ( 0 ),
        IO_VAL_28       => ( 0 ),
        IO_VAL_29       => ( 0 ),
        IO_VAL_30       => ( 0 ),
        IO_VAL_31       => ( 0 ),
        OE_TYPE         => ( 0 )
        )
    port map( 
        -- Inputs
        PRESETN  => MSS_READY_net_0,
        PCLK     => FAB_CCC_GL0_net_0,
        PSEL     => CoreAPB3_1_APBmslave2_PSELx,
        PENABLE  => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE   => CoreAPB3_1_APBmslave0_PWRITE,
        PADDR    => CoreAPB3_1_APBmslave0_PADDR_2,
        PWDATA   => CoreAPB3_1_APBmslave0_PWDATA,
        GPIO_IN  => GPIO_IN,
        -- Outputs
        PSLVERR  => CoreAPB3_1_APBmslave2_PSLVERR,
        PREADY   => CoreAPB3_1_APBmslave2_PREADY,
        PRDATA   => CoreAPB3_1_APBmslave2_PRDATA,
        INT      => INT_net_0,
        INT_OR   => OPEN,
        GPIO_OUT => GPIO_OUT_net_0,
        GPIO_OE  => GPIO_OE_net_0 
        );
-- COREI2C_0_0   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_0 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_0,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave0_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_0,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_0_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_0_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_0_INT,
        PRDATA         => CoreAPB3_0_APBmslave0_PRDATA,
        SCLO           => COREI2C_0_0_SCLO,
        SDAO           => COREI2C_0_0_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_1   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_1 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_1,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave1_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_1,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_1_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_1_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_1_INT,
        PRDATA         => CoreAPB3_0_APBmslave1_PRDATA,
        SCLO           => COREI2C_0_1_SCLO,
        SDAO           => COREI2C_0_1_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_2   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_2 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_2,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave2_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_2,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_2_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_2_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_2_INT,
        PRDATA         => CoreAPB3_0_APBmslave2_PRDATA,
        SCLO           => COREI2C_0_2_SCLO,
        SDAO           => COREI2C_0_2_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_3   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_3 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_3,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave3_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_3,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_3_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_3_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_3_INT,
        PRDATA         => CoreAPB3_0_APBmslave3_PRDATA,
        SCLO           => COREI2C_0_3_SCLO,
        SDAO           => COREI2C_0_3_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_4   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_4 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_4,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave4_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_4,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_4_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_4_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_4_INT,
        PRDATA         => CoreAPB3_0_APBmslave4_PRDATA,
        SCLO           => COREI2C_0_4_SCLO,
        SDAO           => COREI2C_0_4_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_5   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_5 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_5,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave5_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_5,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_5_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_5_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_5_INT,
        PRDATA         => CoreAPB3_0_APBmslave5_PRDATA,
        SCLO           => COREI2C_0_5_SCLO,
        SDAO           => COREI2C_0_5_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_6   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_6 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_6,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave6_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_6,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_6_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_6_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_6_INT,
        PRDATA         => CoreAPB3_0_APBmslave6_PRDATA,
        SCLO           => COREI2C_0_6_SCLO,
        SDAO           => COREI2C_0_6_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_7   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_7 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_7,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave7_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_7,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_7_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_7_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_7_INT,
        PRDATA         => CoreAPB3_0_APBmslave7_PRDATA,
        SCLO           => COREI2C_0_7_SCLO,
        SDAO           => COREI2C_0_7_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_8   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_8 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_8,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave8_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_8,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_8_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_8_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_8_INT,
        PRDATA         => CoreAPB3_0_APBmslave8_PRDATA,
        SCLO           => COREI2C_0_8_SCLO,
        SDAO           => COREI2C_0_8_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- COREI2C_0_9   -   Actel:DirectCore:COREI2C:7.0.102
COREI2C_0_9 : COREI2C
    generic map( 
        ADD_SLAVE1_ADDRESS_EN   => ( 0 ),
        BAUD_RATE_FIXED         => ( 0 ),
        BAUD_RATE_VALUE         => ( 0 ),
        BCLK_ENABLED            => ( 1 ),
        FIXED_SLAVE0_ADDR_EN    => ( 0 ),
        FIXED_SLAVE0_ADDR_VALUE => ( 16#0# ),
        FIXED_SLAVE1_ADDR_EN    => ( 0 ),
        FIXED_SLAVE1_ADDR_VALUE => ( 16#0# ),
        FREQUENCY               => ( 30 ),
        GLITCHREG_NUM           => ( 3 ),
        I2C_NUM                 => ( 1 ),
        IPMI_EN                 => ( 0 ),
        OPERATING_MODE          => ( 0 ),
        SMB_EN                  => ( 0 )
        )
    port map( 
        -- Inputs
        BCLK           => FAB_CCC_GL0_net_0,
        PADDR          => CoreAPB3_0_APBmslave0_PADDR_9,
        PCLK           => FAB_CCC_GL0_net_0,
        PENABLE        => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN        => MSS_READY_net_0,
        PSEL           => CoreAPB3_0_APBmslave9_PSELx,
        PWDATA         => CoreAPB3_0_APBmslave0_PWDATA_9,
        PWRITE         => CoreAPB3_0_APBmslave0_PWRITE,
        SCLI(0)        => BIBUF_COREI2C_0_9_SCL_IO_Y,
        SDAI(0)        => BIBUF_COREI2C_0_9_SDA_IO_Y,
        SMBALERT_NI(0) => GND_net, -- tied to '0' from definition
        SMBSUS_NI(0)   => GND_net, -- tied to '0' from definition
        -- Outputs
        INT            => COREI2C_0_9_INT,
        PRDATA         => CoreAPB3_0_APBmslave9_PRDATA,
        SCLO           => COREI2C_0_9_SCLO,
        SDAO           => COREI2C_0_9_SDAO,
        SMBALERT_NO    => OPEN,
        SMBA_INT       => OPEN,
        SMBSUS_NO      => OPEN,
        SMBS_INT       => OPEN 
        );
-- CoreInterrupt_0   -   Actel:DirectCore:CoreInterrupt:1.1.101
CoreInterrupt_0 : CoreInterrupt
    generic map( 
        FIQPOLARITY => ( 0 ),
        IRQPOLARITY => ( 1 ),
        NUMFIQSRC   => ( 0 ),
        NUMIRQSRC   => ( 32 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETn     => MSS_READY_net_0,
        PSEL        => CoreAPB3_1_APBmslave13_PSELx,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_13,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA,
        fiqSource0  => GND_net,
        fiqSource1  => GND_net,
        fiqSource2  => GND_net,
        fiqSource3  => GND_net,
        fiqSource4  => GND_net,
        fiqSource5  => GND_net,
        fiqSource6  => GND_net,
        fiqSource7  => GND_net,
        irqSource0  => CORESPI_0_5_intr_or_0_Y,
        irqSource1  => CORESPI_0_6_intr_or_0_Y,
        irqSource2  => CORESPI_0_7_intr_or_0_Y,
        irqSource3  => CoreUARTapb_0_0_intr_or_2_Y,
        irqSource4  => CoreUARTapb_0_1_intr_or_2_Y,
        irqSource5  => CoreUARTapb_0_2_intr_or_2_Y,
        irqSource6  => CoreUARTapb_0_3_intr_or_2_Y,
        irqSource7  => CoreUARTapb_0_4_intr_or_2_Y,
        irqSource8  => CoreUARTapb_0_5_intr_or_2_Y,
        irqSource9  => CoreUARTapb_0_6_intr_or_2_Y,
        irqSource10 => CoreUARTapb_0_7_intr_or_2_Y,
        irqSource11 => CoreUARTapb_0_8_intr_or_2_Y,
        irqSource12 => CoreUARTapb_0_9_intr_or_2_Y,
        irqSource13 => GND_net,
        irqSource14 => GND_net,
        irqSource15 => GND_net,
        irqSource16 => GND_net,
        irqSource17 => GND_net,
        irqSource18 => GND_net,
        irqSource19 => GND_net,
        irqSource20 => GND_net,
        irqSource21 => GND_net,
        irqSource22 => GND_net,
        irqSource23 => GND_net,
        irqSource24 => GND_net,
        irqSource25 => GND_net,
        irqSource26 => GND_net,
        irqSource27 => GND_net,
        irqSource28 => GND_net,
        irqSource29 => GND_net,
        irqSource30 => GND_net,
        irqSource31 => GND_net,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave13_PRDATA,
        FIQ         => OPEN,
        IRQ         => CoreInterrupt_0_IRQ 
        );
-- CORERESETP_0   -   Actel:DirectCore:CoreResetP:7.0.104
CORERESETP_0 : CoreResetP
    generic map( 
        DDR_WAIT            => ( 200 ),
        DEVICE_090          => ( 0 ),
        DEVICE_VOLTAGE      => ( 2 ),
        ENABLE_SOFT_RESETS  => ( 0 ),
        EXT_RESET_CFG       => ( 0 ),
        FDDR_IN_USE         => ( 0 ),
        MDDR_IN_USE         => ( 0 ),
        SDIF0_IN_USE        => ( 0 ),
        SDIF0_PCIE          => ( 0 ),
        SDIF0_PCIE_HOTRESET => ( 1 ),
        SDIF0_PCIE_L2P2     => ( 1 ),
        SDIF1_IN_USE        => ( 0 ),
        SDIF1_PCIE          => ( 0 ),
        SDIF1_PCIE_HOTRESET => ( 1 ),
        SDIF1_PCIE_L2P2     => ( 1 ),
        SDIF2_IN_USE        => ( 0 ),
        SDIF2_PCIE          => ( 0 ),
        SDIF2_PCIE_HOTRESET => ( 1 ),
        SDIF2_PCIE_L2P2     => ( 1 ),
        SDIF3_IN_USE        => ( 0 ),
        SDIF3_PCIE          => ( 0 ),
        SDIF3_PCIE_HOTRESET => ( 1 ),
        SDIF3_PCIE_L2P2     => ( 1 )
        )
    port map( 
        -- Inputs
        RESET_N_M2F                    => M2sExt_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        FIC_2_APB_M_PRESET_N           => M2sExt_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        POWER_ON_RESET_N               => POWER_ON_RESET_N_net_0,
        FAB_RESET_N                    => FAB_RESET_N,
        RCOSC_25_50MHZ                 => FABOSC_0_RCOSC_25_50MHZ_O2F,
        CLK_BASE                       => FAB_CCC_GL0_net_0,
        CLK_LTSSM                      => GND_net, -- tied to '0' from definition
        FPLL_LOCK                      => VCC_net, -- tied to '1' from definition
        SDIF0_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF1_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF2_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF3_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        CONFIG1_DONE                   => VCC_net,
        CONFIG2_DONE                   => VCC_net,
        SDIF0_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF1_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF2_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF3_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF0_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF0_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF0_PRDATA                   => SDIF0_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF1_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF1_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF1_PRDATA                   => SDIF1_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF2_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF2_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF2_PRDATA                   => SDIF2_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF3_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF3_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF3_PRDATA                   => SDIF3_PRDATA_const_net_0, -- tied to X"0" from definition
        SOFT_EXT_RESET_OUT             => GND_net, -- tied to '0' from definition
        SOFT_RESET_F2M                 => GND_net, -- tied to '0' from definition
        SOFT_M3_RESET                  => GND_net, -- tied to '0' from definition
        SOFT_MDDR_DDR_AXI_S_CORE_RESET => GND_net, -- tied to '0' from definition
        SOFT_FDDR_CORE_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_0_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_1_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_CORE_RESET          => GND_net, -- tied to '0' from definition
        -- Outputs
        MSS_HPMS_READY                 => MSS_READY_net_0,
        DDR_READY                      => OPEN,
        SDIF_READY                     => OPEN,
        RESET_N_F2M                    => CORERESETP_0_RESET_N_F2M,
        M3_RESET_N                     => OPEN,
        EXT_RESET_OUT                  => OPEN,
        MDDR_DDR_AXI_S_CORE_RESET_N    => OPEN,
        FDDR_CORE_RESET_N              => OPEN,
        SDIF0_CORE_RESET_N             => OPEN,
        SDIF0_0_CORE_RESET_N           => OPEN,
        SDIF0_1_CORE_RESET_N           => OPEN,
        SDIF0_PHY_RESET_N              => OPEN,
        SDIF1_CORE_RESET_N             => OPEN,
        SDIF1_PHY_RESET_N              => OPEN,
        SDIF2_CORE_RESET_N             => OPEN,
        SDIF2_PHY_RESET_N              => OPEN,
        SDIF3_CORE_RESET_N             => OPEN,
        SDIF3_PHY_RESET_N              => OPEN,
        SDIF_RELEASED                  => OPEN,
        INIT_DONE                      => OPEN 
        );
-- CORESPI_0_0   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_0 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_10,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave10_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_10,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso,
        s_mosi        => s_mosi,
        s_sck         => s_sck,
        s_ss          => s_ss,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave10_PRDATA,
        enable_master => enable_master_net_0,
        enable_slave  => enable_slave_net_0,
        interrupt     => CORESPI_0_0_interrupt,
        m_mosi        => m_mosi_net_0,
        m_sck         => m_sck_net_0,
        m_ss          => m_ss_net_0,
        rx_data_ready => CORESPI_0_0_rx_data_ready,
        s_miso        => s_miso_net_0,
        tx_reg_empty  => CORESPI_0_0_tx_reg_empty 
        );
-- CORESPI_0_0_intr_or_0
CORESPI_0_0_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_0_tx_reg_empty,
        B => CORESPI_0_0_rx_data_ready,
        C => CORESPI_0_0_interrupt,
        -- Outputs
        Y => CORESPI_0_0_intr_or_0_Y 
        );
-- CORESPI_0_1   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_1 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_11,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave11_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_11,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso_0,
        s_mosi        => s_mosi_0,
        s_sck         => s_sck_0,
        s_ss          => s_ss_0,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave11_PRDATA,
        enable_master => enable_master_0_net_0,
        enable_slave  => enable_slave_0_net_0,
        interrupt     => CORESPI_0_1_interrupt,
        m_mosi        => m_mosi_0_net_0,
        m_sck         => m_sck_0_net_0,
        m_ss          => m_ss_0_net_0,
        rx_data_ready => CORESPI_0_1_rx_data_ready,
        s_miso        => s_miso_0_net_0,
        tx_reg_empty  => CORESPI_0_1_tx_reg_empty 
        );
-- CORESPI_0_1_intr_or_0
CORESPI_0_1_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_1_tx_reg_empty,
        B => CORESPI_0_1_rx_data_ready,
        C => CORESPI_0_1_interrupt,
        -- Outputs
        Y => CORESPI_0_1_intr_or_0_Y 
        );
-- CORESPI_0_2   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_2 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_12,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave12_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_12,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso_1,
        s_mosi        => s_mosi_1,
        s_sck         => s_sck_1,
        s_ss          => s_ss_1,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave12_PRDATA,
        enable_master => enable_master_1_net_0,
        enable_slave  => enable_slave_1_net_0,
        interrupt     => CORESPI_0_2_interrupt,
        m_mosi        => m_mosi_1_net_0,
        m_sck         => m_sck_1_net_0,
        m_ss          => m_ss_1_net_0,
        rx_data_ready => CORESPI_0_2_rx_data_ready,
        s_miso        => s_miso_1_net_0,
        tx_reg_empty  => CORESPI_0_2_tx_reg_empty 
        );
-- CORESPI_0_2_intr_or_0
CORESPI_0_2_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_2_tx_reg_empty,
        B => CORESPI_0_2_rx_data_ready,
        C => CORESPI_0_2_interrupt,
        -- Outputs
        Y => CORESPI_0_2_intr_or_0_Y 
        );
-- CORESPI_0_3   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_3 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_13,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave13_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_13,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso_2,
        s_mosi        => s_mosi_2,
        s_sck         => s_sck_2,
        s_ss          => s_ss_2,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave13_PRDATA,
        enable_master => enable_master_2_net_0,
        enable_slave  => enable_slave_2_net_0,
        interrupt     => CORESPI_0_3_interrupt,
        m_mosi        => m_mosi_2_net_0,
        m_sck         => m_sck_2_net_0,
        m_ss          => m_ss_2_net_0,
        rx_data_ready => CORESPI_0_3_rx_data_ready,
        s_miso        => s_miso_2_net_0,
        tx_reg_empty  => CORESPI_0_3_tx_reg_empty 
        );
-- CORESPI_0_3_intr_or_0
CORESPI_0_3_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_3_tx_reg_empty,
        B => CORESPI_0_3_rx_data_ready,
        C => CORESPI_0_3_interrupt,
        -- Outputs
        Y => CORESPI_0_3_intr_or_0_Y 
        );
-- CORESPI_0_4   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_4 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_14,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave14_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_14,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso_3,
        s_mosi        => s_mosi_3,
        s_sck         => s_sck_3,
        s_ss          => s_ss_3,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave14_PRDATA,
        enable_master => enable_master_3_net_0,
        enable_slave  => enable_slave_3_net_0,
        interrupt     => CORESPI_0_4_interrupt,
        m_mosi        => m_mosi_3_net_0,
        m_sck         => m_sck_3_net_0,
        m_ss          => m_ss_3_net_0,
        rx_data_ready => CORESPI_0_4_rx_data_ready,
        s_miso        => s_miso_3_net_0,
        tx_reg_empty  => CORESPI_0_4_tx_reg_empty 
        );
-- CORESPI_0_4_intr_or_0
CORESPI_0_4_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_4_tx_reg_empty,
        B => CORESPI_0_4_rx_data_ready,
        C => CORESPI_0_4_interrupt,
        -- Outputs
        Y => CORESPI_0_4_intr_or_0_Y 
        );
-- CORESPI_0_5   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_5 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_15,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave15_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_15,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso_4,
        s_mosi        => s_mosi_4,
        s_sck         => s_sck_4,
        s_ss          => s_ss_4,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave15_PRDATA,
        enable_master => enable_master_4_net_0,
        enable_slave  => enable_slave_4_net_0,
        interrupt     => CORESPI_0_5_interrupt,
        m_mosi        => m_mosi_4_net_0,
        m_sck         => m_sck_4_net_0,
        m_ss          => m_ss_4_net_0,
        rx_data_ready => CORESPI_0_5_rx_data_ready,
        s_miso        => s_miso_4_net_0,
        tx_reg_empty  => CORESPI_0_5_tx_reg_empty 
        );
-- CORESPI_0_5_intr_or_0
CORESPI_0_5_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_5_tx_reg_empty,
        B => CORESPI_0_5_rx_data_ready,
        C => CORESPI_0_5_interrupt,
        -- Outputs
        Y => CORESPI_0_5_intr_or_0_Y 
        );
-- CORESPI_0_6   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_6 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_1_APBmslave0_PADDR_0,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_1_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_1_APBmslave0_PSELx,
        PWDATA        => CoreAPB3_1_APBmslave0_PWDATA_0,
        PWRITE        => CoreAPB3_1_APBmslave0_PWRITE,
        m_miso        => m_miso_5,
        s_mosi        => s_mosi_5,
        s_sck         => s_sck_5,
        s_ss          => s_ss_5,
        -- Outputs
        PRDATA        => CoreAPB3_1_APBmslave0_PRDATA,
        enable_master => enable_master_5_net_0,
        enable_slave  => enable_slave_5_net_0,
        interrupt     => CORESPI_0_6_interrupt,
        m_mosi        => m_mosi_5_net_0,
        m_sck         => m_sck_5_net_0,
        m_ss          => m_ss_5_net_0,
        rx_data_ready => CORESPI_0_6_rx_data_ready,
        s_miso        => s_miso_5_net_0,
        tx_reg_empty  => CORESPI_0_6_tx_reg_empty 
        );
-- CORESPI_0_6_intr_or_0
CORESPI_0_6_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_6_tx_reg_empty,
        B => CORESPI_0_6_rx_data_ready,
        C => CORESPI_0_6_interrupt,
        -- Outputs
        Y => CORESPI_0_6_intr_or_0_Y 
        );
-- CORESPI_0_7   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_7 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_1_APBmslave0_PADDR_1,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_1_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_1_APBmslave1_PSELx,
        PWDATA        => CoreAPB3_1_APBmslave0_PWDATA_1,
        PWRITE        => CoreAPB3_1_APBmslave0_PWRITE,
        m_miso        => m_miso_6,
        s_mosi        => s_mosi_6,
        s_sck         => s_sck_6,
        s_ss          => s_ss_6,
        -- Outputs
        PRDATA        => CoreAPB3_1_APBmslave1_PRDATA,
        enable_master => enable_master_6_net_0,
        enable_slave  => enable_slave_6_net_0,
        interrupt     => CORESPI_0_7_interrupt,
        m_mosi        => m_mosi_6_net_0,
        m_sck         => m_sck_6_net_0,
        m_ss          => m_ss_6_net_0,
        rx_data_ready => CORESPI_0_7_rx_data_ready,
        s_miso        => s_miso_6_net_0,
        tx_reg_empty  => CORESPI_0_7_tx_reg_empty 
        );
-- CORESPI_0_7_intr_or_0
CORESPI_0_7_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_7_tx_reg_empty,
        B => CORESPI_0_7_rx_data_ready,
        C => CORESPI_0_7_interrupt,
        -- Outputs
        Y => CORESPI_0_7_intr_or_0_Y 
        );
-- CoreUARTapb_0_0   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_0 : M2sExt_sb_CoreUARTapb_0_0_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_3,
        PSEL        => CoreAPB3_1_APBmslave3_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_2,
        RX          => RX,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave3_PRDATA,
        TXRDY       => CoreUARTapb_0_0_TXRDY,
        RXRDY       => CoreUARTapb_0_0_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_0_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_0_OVERFLOW,
        TX          => TX_net_0,
        PREADY      => CoreAPB3_1_APBmslave3_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave3_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_0_FRAMING_ERR 
        );
-- CoreUARTapb_0_0_intr_or_0
CoreUARTapb_0_0_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_0_FRAMING_ERR,
        B => CoreUARTapb_0_0_OVERFLOW,
        C => CoreUARTapb_0_0_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_0_intr_or_0_Y 
        );
-- CoreUARTapb_0_0_intr_or_1
CoreUARTapb_0_0_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_0_RXRDY,
        B => CoreUARTapb_0_0_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_0_intr_or_1_Y 
        );
-- CoreUARTapb_0_0_intr_or_2
CoreUARTapb_0_0_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_0_intr_or_1_Y,
        B => CoreUARTapb_0_0_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_0_intr_or_2_Y 
        );
-- CoreUARTapb_0_1   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_1 : M2sExt_sb_CoreUARTapb_0_1_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_4,
        PSEL        => CoreAPB3_1_APBmslave4_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_3,
        RX          => RX_0,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave4_PRDATA,
        TXRDY       => CoreUARTapb_0_1_TXRDY,
        RXRDY       => CoreUARTapb_0_1_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_1_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_1_OVERFLOW,
        TX          => TX_0_net_0,
        PREADY      => CoreAPB3_1_APBmslave4_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave4_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_1_FRAMING_ERR 
        );
-- CoreUARTapb_0_1_intr_or_0
CoreUARTapb_0_1_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_1_FRAMING_ERR,
        B => CoreUARTapb_0_1_OVERFLOW,
        C => CoreUARTapb_0_1_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_1_intr_or_0_Y 
        );
-- CoreUARTapb_0_1_intr_or_1
CoreUARTapb_0_1_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_1_RXRDY,
        B => CoreUARTapb_0_1_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_1_intr_or_1_Y 
        );
-- CoreUARTapb_0_1_intr_or_2
CoreUARTapb_0_1_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_1_intr_or_1_Y,
        B => CoreUARTapb_0_1_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_1_intr_or_2_Y 
        );
-- CoreUARTapb_0_2   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_2 : M2sExt_sb_CoreUARTapb_0_2_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_5,
        PSEL        => CoreAPB3_1_APBmslave5_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_4,
        RX          => RX_1,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave5_PRDATA,
        TXRDY       => CoreUARTapb_0_2_TXRDY,
        RXRDY       => CoreUARTapb_0_2_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_2_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_2_OVERFLOW,
        TX          => TX_1_net_0,
        PREADY      => CoreAPB3_1_APBmslave5_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave5_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_2_FRAMING_ERR 
        );
-- CoreUARTapb_0_2_intr_or_0
CoreUARTapb_0_2_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_2_FRAMING_ERR,
        B => CoreUARTapb_0_2_OVERFLOW,
        C => CoreUARTapb_0_2_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_2_intr_or_0_Y 
        );
-- CoreUARTapb_0_2_intr_or_1
CoreUARTapb_0_2_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_2_RXRDY,
        B => CoreUARTapb_0_2_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_2_intr_or_1_Y 
        );
-- CoreUARTapb_0_2_intr_or_2
CoreUARTapb_0_2_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_2_intr_or_1_Y,
        B => CoreUARTapb_0_2_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_2_intr_or_2_Y 
        );
-- CoreUARTapb_0_3   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_3 : M2sExt_sb_CoreUARTapb_0_3_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_6,
        PSEL        => CoreAPB3_1_APBmslave6_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_5,
        RX          => RX_2,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave6_PRDATA,
        TXRDY       => CoreUARTapb_0_3_TXRDY,
        RXRDY       => CoreUARTapb_0_3_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_3_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_3_OVERFLOW,
        TX          => TX_2_net_0,
        PREADY      => CoreAPB3_1_APBmslave6_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave6_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_3_FRAMING_ERR 
        );
-- CoreUARTapb_0_3_intr_or_0
CoreUARTapb_0_3_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_3_FRAMING_ERR,
        B => CoreUARTapb_0_3_OVERFLOW,
        C => CoreUARTapb_0_3_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_3_intr_or_0_Y 
        );
-- CoreUARTapb_0_3_intr_or_1
CoreUARTapb_0_3_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_3_RXRDY,
        B => CoreUARTapb_0_3_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_3_intr_or_1_Y 
        );
-- CoreUARTapb_0_3_intr_or_2
CoreUARTapb_0_3_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_3_intr_or_1_Y,
        B => CoreUARTapb_0_3_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_3_intr_or_2_Y 
        );
-- CoreUARTapb_0_4   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_4 : M2sExt_sb_CoreUARTapb_0_4_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_7,
        PSEL        => CoreAPB3_1_APBmslave7_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_6,
        RX          => RX_3,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave7_PRDATA,
        TXRDY       => CoreUARTapb_0_4_TXRDY,
        RXRDY       => CoreUARTapb_0_4_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_4_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_4_OVERFLOW,
        TX          => TX_3_net_0,
        PREADY      => CoreAPB3_1_APBmslave7_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave7_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_4_FRAMING_ERR 
        );
-- CoreUARTapb_0_4_intr_or_0
CoreUARTapb_0_4_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_4_FRAMING_ERR,
        B => CoreUARTapb_0_4_OVERFLOW,
        C => CoreUARTapb_0_4_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_4_intr_or_0_Y 
        );
-- CoreUARTapb_0_4_intr_or_1
CoreUARTapb_0_4_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_4_RXRDY,
        B => CoreUARTapb_0_4_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_4_intr_or_1_Y 
        );
-- CoreUARTapb_0_4_intr_or_2
CoreUARTapb_0_4_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_4_intr_or_1_Y,
        B => CoreUARTapb_0_4_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_4_intr_or_2_Y 
        );
-- CoreUARTapb_0_5   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_5 : M2sExt_sb_CoreUARTapb_0_5_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_8,
        PSEL        => CoreAPB3_1_APBmslave8_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_7,
        RX          => RX_4,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave8_PRDATA,
        TXRDY       => CoreUARTapb_0_5_TXRDY,
        RXRDY       => CoreUARTapb_0_5_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_5_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_5_OVERFLOW,
        TX          => TX_4_net_0,
        PREADY      => CoreAPB3_1_APBmslave8_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave8_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_5_FRAMING_ERR 
        );
-- CoreUARTapb_0_5_intr_or_0
CoreUARTapb_0_5_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_5_FRAMING_ERR,
        B => CoreUARTapb_0_5_OVERFLOW,
        C => CoreUARTapb_0_5_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_5_intr_or_0_Y 
        );
-- CoreUARTapb_0_5_intr_or_1
CoreUARTapb_0_5_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_5_RXRDY,
        B => CoreUARTapb_0_5_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_5_intr_or_1_Y 
        );
-- CoreUARTapb_0_5_intr_or_2
CoreUARTapb_0_5_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_5_intr_or_1_Y,
        B => CoreUARTapb_0_5_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_5_intr_or_2_Y 
        );
-- CoreUARTapb_0_6   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_6 : M2sExt_sb_CoreUARTapb_0_6_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_9,
        PSEL        => CoreAPB3_1_APBmslave9_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_8,
        RX          => RX_5,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave9_PRDATA,
        TXRDY       => CoreUARTapb_0_6_TXRDY,
        RXRDY       => CoreUARTapb_0_6_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_6_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_6_OVERFLOW,
        TX          => TX_5_net_0,
        PREADY      => CoreAPB3_1_APBmslave9_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave9_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_6_FRAMING_ERR 
        );
-- CoreUARTapb_0_6_intr_or_0
CoreUARTapb_0_6_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_6_FRAMING_ERR,
        B => CoreUARTapb_0_6_OVERFLOW,
        C => CoreUARTapb_0_6_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_6_intr_or_0_Y 
        );
-- CoreUARTapb_0_6_intr_or_1
CoreUARTapb_0_6_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_6_RXRDY,
        B => CoreUARTapb_0_6_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_6_intr_or_1_Y 
        );
-- CoreUARTapb_0_6_intr_or_2
CoreUARTapb_0_6_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_6_intr_or_1_Y,
        B => CoreUARTapb_0_6_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_6_intr_or_2_Y 
        );
-- CoreUARTapb_0_7   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_7 : M2sExt_sb_CoreUARTapb_0_7_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_10,
        PSEL        => CoreAPB3_1_APBmslave10_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_9,
        RX          => RX_6,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave10_PRDATA,
        TXRDY       => CoreUARTapb_0_7_TXRDY,
        RXRDY       => CoreUARTapb_0_7_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_7_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_7_OVERFLOW,
        TX          => TX_6_net_0,
        PREADY      => CoreAPB3_1_APBmslave10_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave10_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_7_FRAMING_ERR 
        );
-- CoreUARTapb_0_7_intr_or_0
CoreUARTapb_0_7_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_7_FRAMING_ERR,
        B => CoreUARTapb_0_7_OVERFLOW,
        C => CoreUARTapb_0_7_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_7_intr_or_0_Y 
        );
-- CoreUARTapb_0_7_intr_or_1
CoreUARTapb_0_7_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_7_RXRDY,
        B => CoreUARTapb_0_7_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_7_intr_or_1_Y 
        );
-- CoreUARTapb_0_7_intr_or_2
CoreUARTapb_0_7_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_7_intr_or_1_Y,
        B => CoreUARTapb_0_7_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_7_intr_or_2_Y 
        );
-- CoreUARTapb_0_8   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_8 : M2sExt_sb_CoreUARTapb_0_8_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_11,
        PSEL        => CoreAPB3_1_APBmslave11_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_10,
        RX          => RX_7,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave11_PRDATA,
        TXRDY       => CoreUARTapb_0_8_TXRDY,
        RXRDY       => CoreUARTapb_0_8_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_8_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_8_OVERFLOW,
        TX          => TX_7_net_0,
        PREADY      => CoreAPB3_1_APBmslave11_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave11_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_8_FRAMING_ERR 
        );
-- CoreUARTapb_0_8_intr_or_0
CoreUARTapb_0_8_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_8_FRAMING_ERR,
        B => CoreUARTapb_0_8_OVERFLOW,
        C => CoreUARTapb_0_8_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_8_intr_or_0_Y 
        );
-- CoreUARTapb_0_8_intr_or_1
CoreUARTapb_0_8_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_8_RXRDY,
        B => CoreUARTapb_0_8_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_8_intr_or_1_Y 
        );
-- CoreUARTapb_0_8_intr_or_2
CoreUARTapb_0_8_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_8_intr_or_1_Y,
        B => CoreUARTapb_0_8_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_8_intr_or_2_Y 
        );
-- CoreUARTapb_0_9   -   Actel:DirectCore:CoreUARTapb:5.2.2
CoreUARTapb_0_9 : M2sExt_sb_CoreUARTapb_0_9_CoreUARTapb
    generic map( 
        BAUD_VAL_FRCTN    => ( 0 ),
        BAUD_VAL_FRCTN_EN => ( 0 ),
        BAUD_VALUE        => ( 1 ),
        FAMILY            => ( 19 ),
        FIXEDMODE         => ( 0 ),
        PRG_BIT8          => ( 0 ),
        PRG_PARITY        => ( 0 ),
        RX_FIFO           => ( 1 ),
        RX_LEGACY_MODE    => ( 0 ),
        TX_FIFO           => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK        => FAB_CCC_GL0_net_0,
        PRESETN     => MSS_READY_net_0,
        PADDR       => CoreAPB3_1_APBmslave0_PADDR_12,
        PSEL        => CoreAPB3_1_APBmslave12_PSELx,
        PENABLE     => CoreAPB3_1_APBmslave0_PENABLE,
        PWRITE      => CoreAPB3_1_APBmslave0_PWRITE,
        PWDATA      => CoreAPB3_1_APBmslave0_PWDATA_11,
        RX          => RX_8,
        -- Outputs
        PRDATA      => CoreAPB3_1_APBmslave12_PRDATA,
        TXRDY       => CoreUARTapb_0_9_TXRDY,
        RXRDY       => CoreUARTapb_0_9_RXRDY,
        PARITY_ERR  => CoreUARTapb_0_9_PARITY_ERR,
        OVERFLOW    => CoreUARTapb_0_9_OVERFLOW,
        TX          => TX_8_net_0,
        PREADY      => CoreAPB3_1_APBmslave12_PREADY,
        PSLVERR     => CoreAPB3_1_APBmslave12_PSLVERR,
        FRAMING_ERR => CoreUARTapb_0_9_FRAMING_ERR 
        );
-- CoreUARTapb_0_9_intr_or_0
CoreUARTapb_0_9_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_9_FRAMING_ERR,
        B => CoreUARTapb_0_9_OVERFLOW,
        C => CoreUARTapb_0_9_PARITY_ERR,
        -- Outputs
        Y => CoreUARTapb_0_9_intr_or_0_Y 
        );
-- CoreUARTapb_0_9_intr_or_1
CoreUARTapb_0_9_intr_or_1 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_9_RXRDY,
        B => CoreUARTapb_0_9_TXRDY,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_9_intr_or_1_Y 
        );
-- CoreUARTapb_0_9_intr_or_2
CoreUARTapb_0_9_intr_or_2 : OR3
    port map( 
        -- Inputs
        A => CoreUARTapb_0_9_intr_or_1_Y,
        B => CoreUARTapb_0_9_intr_or_0_Y,
        C => GND_net,
        -- Outputs
        Y => CoreUARTapb_0_9_intr_or_2_Y 
        );
-- FABOSC_0   -   Actel:SgCore:OSC:2.0.101
FABOSC_0 : M2sExt_sb_FABOSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => FABOSC_0_RCOSC_25_50MHZ_O2F,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
        );
-- M2sExt_sb_MSS_0
M2sExt_sb_MSS_0 : M2sExt_sb_MSS
    port map( 
        -- Inputs
        MCCC_CLK_BASE          => FAB_CCC_GL0_net_0,
        USB_ULPI_DIR           => USB_ULPI_DIR,
        USB_ULPI_NXT           => USB_ULPI_NXT,
        USB_ULPI_XCLK          => USB_ULPI_XCLK,
        MCCC_CLK_BASE_PLL_LOCK => FAB_CCC_LOCK_net_0,
        MSS_RESET_N_F2M        => CORERESETP_0_RESET_N_F2M,
        FIC_0_AHB_M_HREADY     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY,
        FIC_0_AHB_M_HRESP      => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0,
        FIC_2_APB_M_PREADY     => VCC_net, -- tied to '1' from definition
        FIC_2_APB_M_PSLVERR    => GND_net, -- tied to '0' from definition
        MSS_INT_F2M            => MSS_INT_F2M_net_0,
        FIC_0_AHB_M_HRDATA     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA,
        FIC_2_APB_M_PRDATA     => FIC_2_APB_M_PRDATA_const_net_0, -- tied to X"0" from definition
        -- Outputs
        USB_ULPI_STP           => USB_ULPI_STP_net_0,
        MSS_RESET_N_M2F        => M2sExt_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        FIC_0_AHB_M_HWRITE     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE,
        FIC_2_APB_M_PRESET_N   => M2sExt_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK       => OPEN,
        FIC_2_APB_M_PWRITE     => OPEN,
        FIC_2_APB_M_PENABLE    => OPEN,
        FIC_2_APB_M_PSEL       => OPEN,
        FIC_0_AHB_M_HADDR      => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR,
        FIC_0_AHB_M_HWDATA     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA,
        FIC_0_AHB_M_HSIZE      => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE,
        FIC_0_AHB_M_HTRANS     => M2sExt_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS,
        FIC_2_APB_M_PADDR      => OPEN,
        FIC_2_APB_M_PWDATA     => OPEN,
        -- Inouts
        USB_ULPI_DATA          => USB_ULPI_DATA 
        );
-- SYSRESET_POR
SYSRESET_POR : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => POWER_ON_RESET_N_net_0 
        );

end RTL;
