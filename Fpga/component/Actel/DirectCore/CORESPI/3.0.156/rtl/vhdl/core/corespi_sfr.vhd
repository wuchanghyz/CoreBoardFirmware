-------------------------------------------------------------------------------
-- (c) Copyright 2005 Actel Corporation
--
-- name:		corespi_sfr.vhd
-- function:	top-level description for CoreSPI (Serial Peripheral Interface)
-- comments:	best viewed with tabstops set to "4", all port signals are
--				active high, unless otherwise noted
-- history:		8/01/03  - TFB created
--				3/18/04  - TFB changed reset name to nreset, changed error
--				name to rx_error, other minor cleanups
--
-- Rev:			2.1 24Jan05 TFB - Production
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity CORESPI_SFR is
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
end CORESPI_SFR;

architecture behv of CORESPI_SFR is

	component spi_master
	port (
		sysclk			:	in	std_logic;
		nreset			:	in	std_logic;
		enable			:	in	std_logic;
		sck				:	out	std_logic;
		miso			:	in	std_logic;
		mosi			:	out	std_logic;
		ss				:	out	std_logic;
		cpol			:	in	std_logic;
		cpha			:	in	std_logic;
		clocksel		:	in	std_logic_vector(2 downto 0);
		rx_data_reg		:	out	std_logic_vector(7 downto 0);
		rx_data_ready	:	out	std_logic;
		rx_reg_re		:	in	std_logic;
		tx_data_reg		:	in	std_logic_vector(7 downto 0);
		tx_reg_empty	:	out	std_logic;
		busy			:	out	std_logic;
		tx_reg_we		:	in	std_logic;
		clear_error		:	in	std_logic;
		rx_error		:	out	std_logic
	);
	end component;

	component spi_slave
	port (
		sysclk			:	in	std_logic;
		nreset			:	in	std_logic;
		enable			:	in	std_logic;
		sck				:	in	std_logic;
		miso			:	out	std_logic;
		mosi			:	in	std_logic;
		ss				:	in	std_logic;
		cpol			:	in	std_logic;
		cpha			:	in	std_logic;
		rx_data_reg		:	out	std_logic_vector(7 downto 0);
		rx_data_ready	:	out	std_logic;
		rx_reg_re		:	in	std_logic;
		tx_data_reg		:	in	std_logic_vector(7 downto 0);
		tx_reg_we		:	in	std_logic;
		tx_reg_empty	:	out	std_logic;
		clear_error		:	in	std_logic;
		rx_error		:	out	std_logic
	);
	end component;

   signal cpol            : std_logic;
   signal cpha            : std_logic;
   signal control_we      : std_logic;
   signal control_re      : std_logic;
   signal control2_we     : std_logic;
   signal control_reg     : std_logic_vector(7 downto 0);
   signal status_reg      : std_logic_vector(7 downto 0);
   signal status_re       : std_logic;
   signal ss_reg_we       : std_logic;
   signal ss_reg_re       : std_logic;
   signal tx_reg_we       : std_logic;
   signal rx_reg_re       : std_logic;
   signal i_enable_spi    : std_logic;
   signal scksel          : std_logic_vector(2 downto 0);
   signal spi_ordr        : std_logic;
   signal spi_ms          : std_logic;
   signal spi_ie          : std_logic;
   signal i_rx_data_reg   : std_logic_vector(7 downto 0);
   signal rx_data_reg_m   : std_logic_vector(7 downto 0);
   signal rx_data_reg_s   : std_logic_vector(7 downto 0);
   signal lsb_rx_data_reg : std_logic_vector(7 downto 0);
   signal rx_data_ready_m : std_logic;
   signal i_rx_data_ready : std_logic;
   signal rx_data_ready_s : std_logic;
   signal tx_data_reg     : std_logic_vector(7 downto 0);
   signal i_tx_reg_empty  : std_logic;
   signal tx_reg_empty_m  : std_logic;
   signal tx_reg_empty_s  : std_logic;
   signal master_busy     : std_logic;
   signal clear_error     : std_logic;
   signal m_rx_error      : std_logic;
   signal s_rx_error      : std_logic;
   signal rx_error        : std_logic;
   signal m_enable        : std_logic;
   signal s_enable        : std_logic;
   signal ss_reg          : std_logic_vector(7 downto 0);
   signal m_ss_int        : std_logic;
   
begin
   
   -------------------------
   -- I/O Port assignments.
   enable_master <= m_enable;
   enable_slave  <= s_enable;
   tx_reg_empty  <= i_tx_reg_empty;
   rx_data_ready <= i_rx_data_ready;
   
-- TFB 2/8/04, these are static high, if slave-only is used ...
--   m_ss(0) <= m_ss_int or (not ss_reg(0));
--   m_ss(1) <= m_ss_int or (not ss_reg(1));
--   m_ss(2) <= m_ss_int or (not ss_reg(2));
--   m_ss(3) <= m_ss_int or (not ss_reg(3));
--   m_ss(4) <= m_ss_int or (not ss_reg(4));
--   m_ss(5) <= m_ss_int or (not ss_reg(5));
--   m_ss(6) <= m_ss_int or (not ss_reg(6));
--   m_ss(7) <= m_ss_int or (not ss_reg(7));
   
	----------------------
	-- Address Decoder
	----------------------
	-- write transmit data register
	tx_reg_we	<= '1' when we = '1' and addrbus = "00" else '0';
	-- read receive data register
	rx_reg_re	<= '1' when re = '1' and addrbus = "00" else '0';
	-- write control register
	control_we	<= '1' when we = '1' and addrbus = "01" else '0';
	-- read control register
	control_re	<= '1' when re = '1' and addrbus = "01" else '0';
	-- write 2nd control register
	control2_we	<= '1' when we = '1' and addrbus = "10" else '0';
	-- read status register
	status_re	<= '1' when re = '1' and addrbus = "10" else '0';
	-- write slave select register
	ss_reg_we	<= '1' when we = '1' and addrbus = "11" else '0';
	-- read slave select register
	ss_reg_re	<= '1' when re = '1' and addrbus = "11" else '0';

   ----------------------
   -- Write Control reg.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         control_reg <= (others=>'0');
      elsif rising_edge(sysclk) then
         if control_we = '1' then
            control_reg <= data_in;
         end if;
      end if;
   end process;

	-------------------------
	-- Control register bits
	-------------------------
	-- control_reg(2:0) - Clock selector:
	-- 000 = /2   | 010 = /8   | 100 = /32  | 110 = /128
	-- 001 = /4   | 011 = /16  | 101 = /64  | 111 = /256
	scksel(0)	<= control_reg(0);
	scksel(1)	<= control_reg(1);
	scksel(2)	<= control_reg(2);
	-- clock polarity (0 = active high, 1 = active low)
	cpol		<= control_reg(3);
	-- clock phase (0 = 0 degree delay, 1 = 90 degree delay)
	cpha		<= control_reg(4);
	-- Select data transfer order (1 = LSB first, 0 = MSB first)
	spi_ordr	<= control_reg(5);

g0: if USE_MASTER=1 and USE_SLAVE=1 generate
	-- master or slave select (1 = master, 0 = slave)
	spi_ms		<= control_reg(6);
end generate;
g1: if USE_MASTER=1 and USE_SLAVE=0 generate
	-- for master only implementation, static high
	spi_ms		<= '1';
end generate;
g2: if USE_MASTER=0 and USE_SLAVE=1 generate
	-- for slave only implementation, static low
	spi_ms		<= '0';
end generate;
	-- Interrupt enable (1 = enable interrupts, 0 = disable interrupts)
	spi_ie		<= control_reg(7);

   ------------------------
   -- Write Control reg 2.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         clear_error <= '0';
         i_enable_spi  <= '0';
      elsif rising_edge(sysclk) then
         if control2_we = '1' then
            clear_error <= data_in(0);
            i_enable_spi  <= data_in(7);
         elsif clear_error = '1' then
            clear_error <= '0';
         end if;
      end if;
   end process;

   ---------------------
   -- Read operations.
   data_out <= i_rx_data_reg   when rx_reg_re  = '1' and spi_ordr = '0' else
               lsb_rx_data_reg when rx_reg_re  = '1' and spi_ordr = '1' else
               control_reg     when control_re = '1' else
               status_reg      when status_re  = '1' else
               ss_reg          when ss_reg_re  = '1' else
               (others=>'0');
   
   i_rx_data_reg <= rx_data_reg_m when m_enable = '1' else
                    rx_data_reg_s;
   
   status_reg(0) <= rx_error;
   status_reg(1) <= i_rx_data_ready;
   status_reg(2) <= i_tx_reg_empty;
   -- SPI master is busy transmitting byte
   status_reg(3) <= master_busy when spi_ms = '1' else '0';
   status_reg(6 downto 4) <= "000";
   status_reg(7) <= i_enable_spi;

   rx_error <= m_rx_error or s_rx_error;

   -- flip order for LSB first operation
   lsb_rx_data_reg(0) <= i_rx_data_reg(7);
   lsb_rx_data_reg(1) <= i_rx_data_reg(6);
   lsb_rx_data_reg(2) <= i_rx_data_reg(5);
   lsb_rx_data_reg(3) <= i_rx_data_reg(4);
   lsb_rx_data_reg(4) <= i_rx_data_reg(3);
   lsb_rx_data_reg(5) <= i_rx_data_reg(2);
   lsb_rx_data_reg(6) <= i_rx_data_reg(1);
   lsb_rx_data_reg(7) <= i_rx_data_reg(0);

   ----------------------
   -- tx data reg.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         tx_data_reg <= (others=>'0');
      elsif rising_edge(sysclk) then
         if tx_reg_we = '1' then
            if spi_ordr = '0' then
               tx_data_reg <= data_in;
            else
               tx_data_reg(0) <= data_in(7);
               tx_data_reg(1) <= data_in(6);
               tx_data_reg(2) <= data_in(5);
               tx_data_reg(3) <= data_in(4);
               tx_data_reg(4) <= data_in(3);
               tx_data_reg(5) <= data_in(2);
               tx_data_reg(6) <= data_in(1);
               tx_data_reg(7) <= data_in(0);
            end if;
         end if;
      end if;
   end process;

   -------------------------
   -- interrupt generation.
   interrupt <= i_enable_spi and
                (spi_ie and (i_tx_reg_empty or i_rx_data_ready));

   i_tx_reg_empty  <= tx_reg_empty_m when m_enable = '1' else
                      tx_reg_empty_s when s_enable = '1' else
                      '0';
   i_rx_data_ready <= rx_data_ready_m when m_enable = '1' else
                      rx_data_ready_s when s_enable = '1' else
                      '0';


	u_m1: if USE_MASTER=1 generate
		----------------------------------------------------
		-- slave select lines. (not used in slave-only mode)
		process(sysclk, nreset)
		begin
			if nreset = '0' then
				ss_reg <= (others=>'0');
			elsif rising_edge(sysclk) then
				if ss_reg_we = '1' then
					ss_reg <= data_in;
				end if;
			end if;
		end process;
		------------------------------------------
		-- instantiation of SPI master
		u_master: spi_master
		port map(
			sysclk			=> sysclk,
			nreset			=> nreset,
			enable			=> m_enable,
			sck				=> m_sck,
			miso			=> m_miso,
			mosi			=> m_mosi,
			ss				=> m_ss_int,
			cpol			=> cpol,
			cpha			=> cpha,
			clocksel		=> scksel,
			rx_data_reg		=> rx_data_reg_m,
			rx_data_ready	=> rx_data_ready_m,
			rx_reg_re		=> rx_reg_re,
			tx_data_reg		=> tx_data_reg,
			tx_reg_empty	=> tx_reg_empty_m,
			busy			=> master_busy,
			tx_reg_we		=> tx_reg_we,
			clear_error		=> clear_error,
			rx_error		=> m_rx_error
		);
		-- TFB 2/8/04
		m_ss(0) <= m_ss_int or (not ss_reg(0));
		m_ss(1) <= m_ss_int or (not ss_reg(1));
		m_ss(2) <= m_ss_int or (not ss_reg(2));
		m_ss(3) <= m_ss_int or (not ss_reg(3));
		m_ss(4) <= m_ss_int or (not ss_reg(4));
		m_ss(5) <= m_ss_int or (not ss_reg(5));
		m_ss(6) <= m_ss_int or (not ss_reg(6));
		m_ss(7) <= m_ss_int or (not ss_reg(7));
	end generate;
	u_m0: if USE_MASTER=0 generate
		ss_reg			<= "00000000";
		m_sck			<= '0';
		m_mosi			<= '0';
		m_ss_int		<= '0';
		rx_data_reg_m	<= "00000000";
		rx_data_ready_m	<= '0';
		tx_reg_empty_m	<= '0';
		master_busy		<= '0';
		m_rx_error		<= '0';
		-- TFB 2/8/04, these are static high, if slave-only is used ...
		m_ss			<= "11111111";
	end generate;

   m_enable <= i_enable_spi and spi_ms;

	u_s1: if USE_SLAVE=1 generate
		------------------------------------------
		-- instantiation of SPI slave
		u_slave: spi_slave
		port map(
			sysclk			=> sysclk,
			nreset			=> nreset,
			enable			=> s_enable,
			sck				=> s_sck,
			miso			=> s_miso,
			mosi			=> s_mosi,
			ss				=> s_ss,
			cpol			=> cpol,
			cpha			=> cpha,
			rx_data_reg		=> rx_data_reg_s,
			rx_data_ready	=> rx_data_ready_s,
			rx_reg_re		=> rx_reg_re,
			tx_data_reg		=> tx_data_reg,
			tx_reg_we		=> tx_reg_we,
			tx_reg_empty	=> tx_reg_empty_s,
			clear_error		=> clear_error,
			rx_error		=> s_rx_error
		);
	end generate;
	u_s0: if USE_SLAVE=0 generate
		s_miso			<= '0';
		rx_data_reg_s	<= "00000000";
		rx_data_ready_s	<= '0';
		tx_reg_empty_s	<= '0';
		s_rx_error		<= '0';
	end generate;

   s_enable <= i_enable_spi and (not spi_ms);

end behv;
