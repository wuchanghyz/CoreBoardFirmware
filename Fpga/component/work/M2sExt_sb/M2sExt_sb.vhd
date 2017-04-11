----------------------------------------------------------------------
-- Created by SmartDesign Tue Jan 10 22:22:08 2017
-- Version: v11.7 11.7.0.119
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
library COREGPIO_LIB;
use COREGPIO_LIB.all;
use COREGPIO_LIB.components.all;
library COREI2C_LIB;
use COREI2C_LIB.all;
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
        FIC_0_APB_M_PRDATA     : in    std_logic_vector(31 downto 0);
        FIC_0_APB_M_PREADY     : in    std_logic;
        FIC_0_APB_M_PSLVERR    : in    std_logic;
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
        FIC_0_APB_M_PADDR      : out   std_logic_vector(31 downto 0);
        FIC_0_APB_M_PENABLE    : out   std_logic;
        FIC_0_APB_M_PSEL       : out   std_logic;
        FIC_0_APB_M_PWDATA     : out   std_logic_vector(31 downto 0);
        FIC_0_APB_M_PWRITE     : out   std_logic;
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
signal BIBUF_COREI2C_0_0_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_0_SDA_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_1_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_1_SDA_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_2_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_2_SDA_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_3_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_3_SDA_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_4_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_4_SDA_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_5_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_5_SDA_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_6_SCL_IO_Y                   : std_logic;
signal BIBUF_COREI2C_0_6_SDA_IO_Y                   : std_logic;
signal CoreAPB3_0_APBmslave0_PENABLE                : std_logic;
signal CoreAPB3_0_APBmslave0_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave0_PWRITE                 : std_logic;
signal CoreAPB3_0_APBmslave1_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave2_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave3_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave4_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave5_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave6_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave7_PRDATA                 : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave7_PREADY                 : std_logic;
signal CoreAPB3_0_APBmslave7_PSELx                  : std_logic;
signal CoreAPB3_0_APBmslave7_PSLVERR                : std_logic;
signal COREI2C_0_0_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_0_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_0_SDAO                             : std_logic_vector(0 to 0);
signal COREI2C_0_1_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_1_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_1_SDAO                             : std_logic_vector(0 to 0);
signal COREI2C_0_2_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_2_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_2_SDAO                             : std_logic_vector(0 to 0);
signal COREI2C_0_3_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_3_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_3_SDAO                             : std_logic_vector(0 to 0);
signal COREI2C_0_4_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_4_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_4_SDAO                             : std_logic_vector(0 to 0);
signal COREI2C_0_5_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_5_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_5_SDAO                             : std_logic_vector(0 to 0);
signal COREI2C_0_6_INT                              : std_logic_vector(0 to 0);
signal COREI2C_0_6_SCLO                             : std_logic_vector(0 to 0);
signal COREI2C_0_6_SDAO                             : std_logic_vector(0 to 0);
signal CORERESETP_0_RESET_N_F2M                     : std_logic;
signal FAB_CCC_GL0_net_0                            : std_logic;
signal FAB_CCC_LOCK_net_0                           : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_O2F                  : std_logic;
signal GPIO_OE_net_0                                : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_0                               : std_logic_vector(31 downto 0);
signal INT_net_0                                    : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR   : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA  : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY  : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx   : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA  : std_logic_vector(31 downto 0);
signal M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE  : std_logic;
signal M2sExt_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N     : std_logic;
signal M2sExt_sb_MSS_TMP_0_MSS_RESET_N_M2F          : std_logic;
signal MSS_READY_net_0                              : std_logic;
signal POWER_ON_RESET_N_net_0                       : std_logic;
signal USB_ULPI_STP_net_0                           : std_logic;
signal USB_ULPI_STP_net_1                           : std_logic;
signal POWER_ON_RESET_N_net_1                       : std_logic;
signal FAB_CCC_GL0_net_1                            : std_logic;
signal FAB_CCC_LOCK_net_1                           : std_logic;
signal MSS_READY_net_1                              : std_logic;
signal INT_net_1                                    : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_1                               : std_logic_vector(31 downto 0);
signal GPIO_OE_net_1                                : std_logic_vector(31 downto 0);
signal MSS_INT_F2M_net_0                            : std_logic_vector(15 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                      : std_logic;
signal VCC_net                                      : std_logic;
signal PADDR_const_net_0                            : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                           : std_logic_vector(7 downto 0);
signal IADDR_const_net_0                            : std_logic_vector(31 downto 0);
signal SDIF0_PRDATA_const_net_0                     : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_0                     : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_0                     : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_0                     : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0                         : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0                         : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0                        : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0                        : std_logic_vector(31 downto 0);
signal PRDATAS12_const_net_0                        : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0                        : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0                        : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0                        : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_0                        : std_logic_vector(31 downto 0);
signal FIC_2_APB_M_PRDATA_const_net_0               : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal E_IN_POST_INV0_0                             : std_logic;
signal E_IN_POST_INV1_0                             : std_logic;
signal E_IN_POST_INV2_0                             : std_logic;
signal E_IN_POST_INV3_0                             : std_logic;
signal E_IN_POST_INV4_0                             : std_logic;
signal E_IN_POST_INV5_0                             : std_logic;
signal E_IN_POST_INV6_0                             : std_logic;
signal E_IN_POST_INV7_0                             : std_logic;
signal E_IN_POST_INV8_0                             : std_logic;
signal E_IN_POST_INV9_0                             : std_logic;
signal E_IN_POST_INV10_0                            : std_logic;
signal E_IN_POST_INV11_0                            : std_logic;
signal E_IN_POST_INV12_0                            : std_logic;
signal E_IN_POST_INV13_0                            : std_logic;
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CoreAPB3_0_APBmslave0_PADDR_6_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_6                : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_4_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_4                : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_7_7to0           : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_7                : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR                  : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0                : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2                : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_5_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_5                : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_3_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_3                : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1_8to0           : std_logic_vector(8 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1                : std_logic_vector(8 downto 0);

signal CoreAPB3_0_APBmslave0_PRDATA                 : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave0_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PRDATA_0               : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave0_PWDATA_6_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_6               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_4_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_4               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_3_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_3               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA                 : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_2_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_2               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_5_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_5               : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_1_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_1               : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave1_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave1_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave1_PRDATA_0               : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave1_PRDATA                 : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave2_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave2_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave2_PRDATA_0               : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave2_PRDATA                 : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave3_PRDATA                 : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave3_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave3_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave3_PRDATA_0               : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave4_PRDATA                 : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave4_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave4_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave4_PRDATA_0               : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave5_PRDATA                 : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave5_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave5_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave5_PRDATA_0               : std_logic_vector(31 downto 0);

signal CoreAPB3_0_APBmslave6_PRDATA                 : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave6_PRDATA_0_31to8         : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave6_PRDATA_0_7to0          : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave6_PRDATA_0               : std_logic_vector(31 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                        <= '0';
 VCC_net                        <= '1';
 PADDR_const_net_0              <= B"000000";
 PWDATA_const_net_0             <= B"00000000";
 IADDR_const_net_0              <= B"00000000000000000000000000000000";
 SDIF0_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS12_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_0          <= B"00000000000000000000000000000000";
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
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 MSS_INT_F2M_net_0 <= ( '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & COREI2C_0_6_INT(0) & COREI2C_0_5_INT(0) & COREI2C_0_4_INT(0) & COREI2C_0_3_INT(0) & COREI2C_0_2_INT(0) & COREI2C_0_1_INT(0) & COREI2C_0_0_INT(0) );
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CoreAPB3_0_APBmslave0_PADDR_6_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_6 <= ( CoreAPB3_0_APBmslave0_PADDR_6_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_4_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_4 <= ( CoreAPB3_0_APBmslave0_PADDR_4_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_7_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_7 <= ( CoreAPB3_0_APBmslave0_PADDR_7_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_0_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_0 <= ( CoreAPB3_0_APBmslave0_PADDR_0_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_2_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_2 <= ( CoreAPB3_0_APBmslave0_PADDR_2_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_5_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_5 <= ( CoreAPB3_0_APBmslave0_PADDR_5_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_3_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_3 <= ( CoreAPB3_0_APBmslave0_PADDR_3_8to0(8 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_1_8to0(8 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(8 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_1 <= ( CoreAPB3_0_APBmslave0_PADDR_1_8to0(8 downto 0) );

 CoreAPB3_0_APBmslave0_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave0_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PRDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PRDATA_0 <= ( CoreAPB3_0_APBmslave0_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave0_PRDATA_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave0_PWDATA_6_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_6 <= ( CoreAPB3_0_APBmslave0_PWDATA_6_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_4_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_4 <= ( CoreAPB3_0_APBmslave0_PWDATA_4_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_3_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_3 <= ( CoreAPB3_0_APBmslave0_PWDATA_3_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_0 <= ( CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_2_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_2 <= ( CoreAPB3_0_APBmslave0_PWDATA_2_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_5_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_5 <= ( CoreAPB3_0_APBmslave0_PWDATA_5_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_1_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);
 CoreAPB3_0_APBmslave0_PWDATA_1 <= ( CoreAPB3_0_APBmslave0_PWDATA_1_7to0(7 downto 0) );

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
-- CCC_0   -   Actel:SgCore:FCCC:2.0.200
CCC_0 : M2sExt_sb_CCC_0_FCCC
    port map( 
        -- Inputs
        CLK0 => CLK0,
        -- Outputs
        GL0  => FAB_CCC_GL0_net_0,
        LOCK => FAB_CCC_LOCK_net_0 
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
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 0 ),
        APBSLOT13ENABLE => ( 0 ),
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
        PADDR      => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR,
        PWRITE     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE,
        PENABLE    => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE,
        PWDATA     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA,
        PSEL       => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx,
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
        PRDATAS7   => CoreAPB3_0_APBmslave7_PRDATA,
        PREADYS7   => CoreAPB3_0_APBmslave7_PREADY,
        PSLVERRS7  => CoreAPB3_0_APBmslave7_PSLVERR,
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PRDATAS12  => PRDATAS12_const_net_0, -- tied to X"0" from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PRDATA     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA,
        PREADY     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY,
        PSLVERR    => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR,
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
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => OPEN,
        PSELS13    => OPEN,
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
        IO_TYPE_0       => ( 1 ),
        IO_TYPE_1       => ( 1 ),
        IO_TYPE_2       => ( 1 ),
        IO_TYPE_3       => ( 1 ),
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
        PSEL     => CoreAPB3_0_APBmslave7_PSELx,
        PENABLE  => CoreAPB3_0_APBmslave0_PENABLE,
        PWRITE   => CoreAPB3_0_APBmslave0_PWRITE,
        PADDR    => CoreAPB3_0_APBmslave0_PADDR_7,
        PWDATA   => CoreAPB3_0_APBmslave0_PWDATA,
        GPIO_IN  => GPIO_IN,
        -- Outputs
        PSLVERR  => CoreAPB3_0_APBmslave7_PSLVERR,
        PREADY   => CoreAPB3_0_APBmslave7_PREADY,
        PRDATA   => CoreAPB3_0_APBmslave7_PRDATA,
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
        FIC_0_APB_M_PREADY     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PREADY,
        FIC_0_APB_M_PSLVERR    => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSLVERR,
        FIC_2_APB_M_PREADY     => VCC_net, -- tied to '1' from definition
        FIC_2_APB_M_PSLVERR    => GND_net, -- tied to '0' from definition
        MSS_INT_F2M            => MSS_INT_F2M_net_0,
        FIC_0_APB_M_PRDATA     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PRDATA,
        FIC_2_APB_M_PRDATA     => FIC_2_APB_M_PRDATA_const_net_0, -- tied to X"0" from definition
        -- Outputs
        USB_ULPI_STP           => USB_ULPI_STP_net_0,
        MSS_RESET_N_M2F        => M2sExt_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        FIC_0_APB_M_PSEL       => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PSELx,
        FIC_0_APB_M_PWRITE     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWRITE,
        FIC_0_APB_M_PENABLE    => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PENABLE,
        FIC_2_APB_M_PRESET_N   => M2sExt_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK       => OPEN,
        FIC_2_APB_M_PWRITE     => OPEN,
        FIC_2_APB_M_PENABLE    => OPEN,
        FIC_2_APB_M_PSEL       => OPEN,
        FIC_0_APB_M_PADDR      => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PADDR,
        FIC_0_APB_M_PWDATA     => M2sExt_sb_MSS_TMP_0_FIC_0_APB_MASTER_PWDATA,
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
