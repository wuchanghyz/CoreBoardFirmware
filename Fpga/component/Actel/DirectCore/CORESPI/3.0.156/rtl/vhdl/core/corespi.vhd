-------------------------------------------------------------------------------
-- (c) Copyright 2005 Actel Corporation
--
-- name:		corespi.vhd
-- function:	top-level description for CoreSPI (Serial Peripheral Interface)
--              contains APB wrapper of SFR interface
-- history:		8/01/03  - AS created
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity CORESPI is
generic (
-- master+slave	: set USE_MASTER=1, USE_SLAVE=1 (default)
-- master only	: set USE_MASTER=1, USE_SLAVE=0
-- slave only	: set USE_MASTER=0, USE_SLAVE=1
FAMILY                  : integer := 17;
USE_MASTER		: integer := 1;
USE_SLAVE		: integer := 1
);
port (
PCLK			:	in	std_logic;	-- Global clock
PRESETN			:	in	std_logic;	-- Act.low asynchronous reset
-- SPI interface signals
m_sck			:	out	std_logic;	-- SPI master generated Serial Clock
m_miso			:	in	std_logic;	-- SPI serial data (master in/slave out)
m_mosi			:	out	std_logic;	-- SPI serial data (master out/slave in)
-- SPI master generated slave select lines
m_ss			:	out	std_logic_vector(7 downto 0);
s_sck			:	in	std_logic;	-- SPI slave, Serial Clock input
s_miso			:	out	std_logic;	-- SPI serial data (master in/slave out)
s_mosi			:	in	std_logic;	-- SPI serial data (master out/slave in)
s_ss			:	in	std_logic;	-- SPI slave, act.low slave select input
enable_master	        :	out	std_logic;	-- CoreSPI operating in master mode
enable_slave	        :	out	std_logic;	-- CoreSPI operating in slave mode
-- generic microcontroller interface signals
PWDATA			:	in	std_logic_vector(7 downto 0);	-- APB write data
PRDATA	        	:	out	std_logic_vector(7 downto 0);	-- APB read data
PADDR			:	in	std_logic_vector(3 downto 0);	-- APB Address
PENABLE			:	in	std_logic;	-- APB Enable
PSEL			:	in	std_logic;	-- APB Select
PWRITE			:	in	std_logic;	-- APB Write enable
interrupt		:	out	std_logic;	-- Masked interrupt output
-- Unmasked interrupt outputs
tx_reg_empty	        :	out	std_logic;	-- transmit register empty
rx_data_ready	        :	out	std_logic	-- data received and ready to be read
);
end CORESPI;

architecture behv of CORESPI is
-- architecture of CORESPI, component declaration, etc.

component CORESPI_SFR
generic (
-- master+slave	: set USE_MASTER=1, USE_SLAVE=1 (default)
-- master only	: set USE_MASTER=1, USE_SLAVE=0
-- slave only	: set USE_MASTER=0, USE_SLAVE=1
USE_MASTER		: integer := 1;
USE_SLAVE		: integer := 1
);
port (
sysclk			:	in	std_logic;	-- Global clock
nreset			:	in	std_logic;	-- Act.low asynchronous reset
-- SPI interface signals
m_sck			:	out	std_logic;	-- SPI master generated Serial Clock
m_miso			:	in	std_logic;	-- SPI serial data (master in/slave out)
m_mosi			:	out	std_logic;	-- SPI serial data (master out/slave in)
-- SPI master generated slave select lines
m_ss			:	out	std_logic_vector(7 downto 0);
s_sck			:	in	std_logic;	-- SPI slave, Serial Clock input
s_miso			:	out	std_logic;	-- SPI serial data (master in/slave out)
s_mosi			:	in	std_logic;	-- SPI serial data (master out/slave in)
s_ss			:	in	std_logic;	-- SPI slave, act.low slave select input
enable_master	:	out	std_logic;	-- CoreSPI operating in master mode
enable_slave	:	out	std_logic;	-- CoreSPI operating in slave mode
-- generic microcontroller interface signals
data_in			:	in	std_logic_vector(7 downto 0);	-- Input data bus
data_out		:	out	std_logic_vector(7 downto 0);	-- Output data bus
addrbus			:	in	std_logic_vector(1 downto 0);	-- Address bus
we				:	in	std_logic;	-- Write enable
re				:	in	std_logic;	-- Read enable
interrupt		:	out	std_logic;	-- Masked interrupt output
-- Unmasked interrupt outputs
tx_reg_empty	:	out	std_logic;	-- transmit register empty
rx_data_ready	:	out	std_logic	-- data received and ready to be read
);
end component;

  -- CPU i/f signals
  signal cpu_data_in    :       std_logic_vector(7 downto 0);
  signal cpu_data_out   :       std_logic_vector(7 downto 0);
  signal cpu_addr_bus   :       std_logic_vector(1 downto 0);
  signal cpu_we         :       std_logic;
  signal cpu_re         :       std_logic;

begin
  -- cpu signal assignments
  cpu_we <= PWRITE and PSEL and PENABLE;
  cpu_re <= (not PWRITE) and PSEL and PENABLE;
  cpu_data_in <= PWDATA;
  cpu_addr_bus <= PADDR (3 downto 2);
  -- output signal assignment
  PRDATA <= cpu_data_out;

  -- CoreSPI_SFR instance

  uCORESPI_SFR : CORESPI_SFR
    -- generics
    generic map (
      USE_MASTER => USE_MASTER,
      USE_SLAVE => USE_SLAVE
    )
    -- ports
    port map (
      sysclk => PCLK,
      nreset => PRESETN,
      m_sck => m_sck,
      m_miso => m_miso,
      m_mosi => m_mosi,
      m_ss => m_ss,
      s_sck => s_sck,
      s_miso => s_miso,
      s_mosi => s_mosi,
      s_ss => s_ss,
      enable_master => enable_master,
      enable_slave => enable_slave,
      data_in => cpu_data_in,
      data_out => cpu_data_out,
      addrbus => cpu_addr_bus,
      we => cpu_we,
      re => cpu_re,
      interrupt => interrupt,
      tx_reg_empty => tx_reg_empty,
      rx_data_ready => rx_data_ready
    );

end behv;
