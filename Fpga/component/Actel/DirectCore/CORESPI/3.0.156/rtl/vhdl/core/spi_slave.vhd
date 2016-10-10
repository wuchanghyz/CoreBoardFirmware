-------------------------------------------------------------------------------
-- (c) Copyright 2005 Actel Corporation
--
-- name:		spi_slave.vhd
-- function:	SPI (Serial Peripheral Interface) Slave
-- comments:	best viewed with tabstops set to "4"
-- history:		8/01/03  - TFB created
--				2/07/04  - TFB modified count_en logic slightly
--				3/18/04  - TFB changed reset name to nreset, changed error
--				name to rx_error, other minor cleanups
--
-- Rev:			2.1 24Jan05 TFB - Production
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity spi_slave is
port (
-- control signals
sysclk			:	in	std_logic;	-- Global clock
nreset			:	in	std_logic;	-- Act.low asynchronous reset
enable			:	in	std_logic;	-- Synchronous Enable
-- SPI interface signals
sck				:	in	std_logic;	-- SPI Serial Clock signal
miso			:	out	std_logic;	-- SPI master input/slave output signal
mosi			:	in	std_logic;	-- SPI master output/slave input signal
ss				:	in	std_logic;	-- SPI slave select output
-- SPI Slave internal signals
cpol			:	in	std_logic;	-- SPI Serial Clock Polarity
cpha			:	in	std_logic;	-- SPI Serial Clock Phase
rx_data_reg		:	out	std_logic_vector(7 downto 0);	-- Rx data register
rx_data_ready	:	out	std_logic;	-- Status signal: rx data ready to read
rx_reg_re		:	in	std_logic;	-- Read Enable for rx_data_reg
tx_data_reg		:	in	std_logic_vector(7 downto 0);	-- Tx data register
tx_reg_we		:	in	std_logic;	-- Write enable for tx data register
tx_reg_empty	:	out	std_logic;	-- Status signal: tx reg can be written
clear_error		:	in	std_logic;	-- Syncronous reset for clearing rx error
rx_error		:	out	std_logic	-- Rx error (unread rx data overwritten)
);
end spi_slave;

architecture behv of spi_slave is

-- internal signals
signal i_sck			:std_logic;
signal d_sck			:std_logic;
signal i_mosi			:std_logic;
signal t_mosi			:std_logic;
signal i_ss				:std_logic;
signal t_ss				:std_logic;
signal di_ss			:std_logic;
signal rxtx_shift_reg	:std_logic_vector(7 downto 0);
signal rx_ready			:std_logic;
signal rx_data_waiting	:std_logic;
signal rx_error_i		:std_logic;
signal count			:std_logic_vector(3 downto 0);
signal count_en			:std_logic;

begin


   ------------------------------------------------
   -- Synchronize SPI interface input signals with
   -- the system clock to avoid metastability problems.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         i_sck <= '0';
         d_sck <= '0';
         i_mosi <= '0';
         t_mosi <= '0';
         i_ss <= '1';
         t_ss  <= '1';
      elsif rising_edge(sysclk) then
         if enable = '1' then
            t_mosi <= mosi;
            t_ss   <= ss;
            if    cpol = '0' and cpha = '0' then
               i_sck <= sck;
            elsif cpol = '0' and cpha = '1' then
               i_sck <= not sck;
            elsif cpol = '1' and cpha = '0' then
               i_sck <= not sck;
            else
               i_sck <= sck;
            end if;
            d_sck  <= i_sck;
            i_mosi <= t_mosi;
            i_ss   <= t_ss;
         else
            t_ss <= '1';
         end if;
      end if;
   end process;


   -------------------------------------------
   -- Receive / Transmit Data Shift register.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         rxtx_shift_reg <= (others=>'0');
         count_en <= '0';
      elsif rising_edge(sysclk) then
         -- TFB 2/7/04
         --count_en <= '0';
         if i_ss = '1' then
            rxtx_shift_reg <= tx_data_reg;
         elsif i_sck = '1' and d_sck = '0' then
            rxtx_shift_reg(0) <= i_mosi;
            rxtx_shift_reg(7 downto 1) <= rxtx_shift_reg(6 downto 0);
            -- TFB 2/7/04
            --count_en <= '1';
         end if;
         -- TFB added 2/7/04
         if i_sck='1' and d_sck='0' and i_ss='0' then
            count_en <= '1';
         else
            count_en <= '0';
         end if;
      end if;
   end process;
   miso <= rxtx_shift_reg(7);
      
   ---------------------------------
   -- Count shift cycles.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         count <= "0000";
      elsif rising_edge(sysclk) then
         if i_ss = '1' or count = "1000" then
            count <= "0000";
         elsif count_en = '1' then
            count <= count + "0001";
         end if;
      end if;
   end process;

	rx_ready <= count(3) and (not count(2)) and (not count(1)) and
				(not count(0));

   -------------------------------
   -- Generate TX_reg_empty flag.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         tx_reg_empty <= '1';
         di_ss <= '0';
      elsif rising_edge(sysclk) then
         if i_ss = '0' and di_ss = '1' then
            tx_reg_empty <= '1';
         elsif tx_reg_we = '1' then
            tx_reg_empty <= '0';
         end if;
         di_ss <= i_ss;
      end if;
   end process;

   -------------------------------
   -- Generate RX_data_ready flag.
   rx_data_ready <= rx_data_waiting;
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         rx_data_waiting <= '0';
         rx_error_i <= '0';
      elsif rising_edge(sysclk) then
         if clear_error = '1' then
            rx_data_waiting <= '0';
            rx_error_i <= '0';
         elsif rx_ready = '1' then
            if rx_data_waiting = '1' then
               rx_error_i <= '1';
            end if;
            rx_data_waiting <= '1';
         elsif rx_reg_re = '1' then
            rx_data_waiting <= '0';
         end if;
      end if;
   end process;
   rx_error <= rx_error_i;

   --------------------------------------------------
   -- Transfer received data from the shift register
   -- to the receive data register.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         rx_data_reg  <= "00000000";
      elsif rising_edge(sysclk) then
         if enable = '1' then
            if rx_ready = '1' then
               rx_data_reg  <= rxtx_shift_reg;
            end if;
         end if;
      end if;
   end process;


end behv;
