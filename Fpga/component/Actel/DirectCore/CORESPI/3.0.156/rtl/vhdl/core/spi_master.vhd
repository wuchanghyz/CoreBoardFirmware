-------------------------------------------------------------------------------
-- (c) Copyright 2005 Actel Corporation
--
-- name:		spi_master.vhd
-- function:	SPI (Serial Peripheral Interface) Master
-- comments:	best viewed with tabstops set to "4"
-- history:		8/01/03  - TFB created
--				3/18/04  - TFB changed reset name to nreset, changed error
--				name to rx_error, other minor cleanups
--
-- Rev:			2.1 24Jan05 TFB - Production
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity spi_master is
port (
-- control signals
sysclk			:	in	std_logic;	-- Global clock
nreset			:	in	std_logic;	-- Act.low asynchronous reset
enable			:	in	std_logic;	-- Synchronous Enable
-- SPI interface signals
sck				:	out	std_logic;	-- SPI Serial Clock signal
miso			:	in	std_logic;	-- SPI master input/slave output signal
mosi			:	out	std_logic;	-- SPI master output/slave input signal
ss				:	out	std_logic;	-- SPI slave select output
-- SPI Master internal signals
cpol			:	in	std_logic;	-- SPI Serial Clock Polarity
cpha			:	in	std_logic;	-- SPI Serial Clock Phase
-- SPI Serial Clock divisor select input
clocksel		:	in	std_logic_vector(2 downto 0);
rx_data_reg		:	out	std_logic_vector(7 downto 0);	-- Rx data register
rx_data_ready	:	out	std_logic;	-- Status signal: rx data ready to read
rx_reg_re		:	in	std_logic;	-- Read Enable for rx_data_reg
tx_data_reg		:	in	std_logic_vector(7 downto 0);	-- Tx data register
tx_reg_empty	:	out	std_logic;	-- Status signal: tx reg can be written
-- Status signal: SPI Master is busy transmitting data or has data in the
-- tx_data_reg to be transmitted
busy			:	out	std_logic;
tx_reg_we		:	in	std_logic;	-- Write enable for tx data register
clear_error		:	in	std_logic;	-- Syncronous reset for clearing rx error
rx_error		:	out	std_logic	-- Rx error (unread rx data overwritten)
);
end spi_master;

architecture behv of spi_master is

-- internal signals
type fsm_type is (IDLE,D7,D6,D5,D4,D3,D2,D1,D0,FINAL_CYCLE,LOAD_SHIFT_REG);
   signal state                : fsm_type;
   signal next_state           : fsm_type;
   signal i_sck                : std_logic;
   signal d_sck                : std_logic;
   signal c_sck                : std_logic;
   signal tsck                 : std_logic;
   signal i_ss                 : std_logic;
   signal tss                  : std_logic;
   signal i_tx_reg_empty       : std_logic;
   signal clock_count          : std_logic_vector(7 downto 0);
   signal tx_data_ready        : std_logic;
   signal clear_tx_data_ready  : std_logic;
   signal tx_shift_reg         : std_logic_vector(7 downto 0);
   signal rx_shift_reg         : std_logic_vector(7 downto 0);
   signal shift_enable         : std_logic;
-- TFB 2/5/04, not used
-- signal rx_shift_enable      : std_logic;
-- signal t_rx_shift_enable    : std_logic;
-- signal d_rx_shift_enable    : std_logic;
   signal tx_shift_reg_load    : std_logic;
   signal d_tx_shift_reg_load  : std_logic;
   signal sck_enable           : std_logic;
   signal load_rx_data_reg     : std_logic;
   signal rx_error_i           : std_logic;
   signal rx_data_waiting      : std_logic;
	-- TFB 2/8/04
   signal rx_shift_enable1:		std_logic;
   signal rx_shift_enable2:		std_logic;
   signal rx_shift_enable:		std_logic;

begin

   --------------------------------------
   -- Serial Data Clock Generation.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         clock_count <= (others=>'0');
         i_sck <= '0';
         d_sck <= '0';
      elsif rising_edge(sysclk) then
         if enable = '1' then
            clock_count <= clock_count + "00000001";
         end if;
         case clocksel is
            when "000"  => i_sck <= clock_count(0); -- SysClk /2
            when "001"  => i_sck <= clock_count(1); -- SysClk /4
            when "010"  => i_sck <= clock_count(2); -- SysClk /8
            when "011"  => i_sck <= clock_count(3); -- SysClk /16
            when "100"  => i_sck <= clock_count(4); -- SysClk /32
            when "101"  => i_sck <= clock_count(5); -- SysClk /64
            when "110"  => i_sck <= clock_count(6); -- SysClk /128
            when "111"  => i_sck <= clock_count(7); -- SysClk /256
			-- TFB 2/5/04
            --when others => i_sck <= '0';
            when others => i_sck <= clock_count(0);
         end case;
         d_sck <= i_sck;
      end if;
   end process;

   c_sck <= sck_enable and d_sck       when cpha = '1' and cpol = '0' else
            sck_enable nand d_sck      when cpha = '1' and cpol = '1' else
            sck_enable and (not d_sck) when cpha = '0' and cpol = '0' else
            sck_enable nand (not d_sck);

-- TFB modified 2/5/04, cpol is reset to '0' at higher level, so sync. reset
-- not necessary here ...
-------------------------------------------------
--   process (sysclk)
--   begin
--      if rising_edge(sysclk) then
--         if nreset = '0' then
--            tsck <= cpol;
--         else
--            tsck <= c_sck;
--         end if;
--      end if;
--   end process;
-------------------------------------------------
   process(sysclk, nreset)
   begin
      if nreset = '0' then
            tsck <= '0';
      elsif rising_edge(sysclk) then
            tsck <= c_sck;
      end if;
   end process;
-------------------------------------------------

   process(sysclk, nreset)
   begin
      if nreset = '0' then
         tss  <= '1';
      elsif rising_edge(sysclk) then
         tss  <= i_ss;
      end if;
   end process;

   sck <= tsck;
   ss  <= tss;

   -----------------
   -- Control FSM.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         state <= IDLE;
      elsif rising_edge(sysclk) then
         if enable = '1' then
            state <= next_state;
         else
            state <= IDLE;
         end if;
      end if;
   end process;

   process(state, tx_data_ready, i_sck, d_sck)
   begin
      clear_tx_data_ready <= '0';
      shift_enable <= '0';
      tx_shift_reg_load <= '0';
      i_ss <= '1';
      sck_enable <= '0';
      load_rx_data_reg <= '0';

      case state is
         when IDLE =>
            if tx_data_ready = '1' and i_sck = '1' and d_sck = '0' then
               clear_tx_data_ready <= '1';
               next_state <= LOAD_SHIFT_REG;
            else
               next_state <= IDLE;
            end if;

         when LOAD_SHIFT_REG =>
            tx_shift_reg_load <= '1';
            if d_sck = '0' then
               i_ss <= '0';
               if i_sck = '1' then
                  next_state <= D7;
               else
                  next_state <= LOAD_SHIFT_REG;
               end if;
            else
               next_state <= LOAD_SHIFT_REG;
            end if;

         when D7 =>
            i_ss <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= D6;
            else
               next_state <= D7;
            end if;

         when D6 =>
            i_ss <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= D5;
            else
               next_state <= D6;
            end if;

         when D5 =>
            i_SS <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= D4;
            else
               next_state <= D5;
            end if;

         when D4 =>
            i_SS <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= d3;
            else
               next_state <= D4;
            end if;

         when D3 =>
            i_SS <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= D2;
            else
               next_state <= D3;
            end if;

         when D2 =>
            i_ss <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= D1;
            else
               next_state <= D2;
            end if;

         when D1 =>
            i_ss <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= D0;
            else
               next_state <= D1;
            end if;

         when D0 =>
            i_ss <= '0';
            sck_enable <= '1';
            if i_sck = '1' and d_sck = '0' then
               shift_enable <= '1';
               next_state <= FINAL_CYCLE;
            else
               next_state <= D0;
            end if;

         when FINAL_CYCLE =>
            if d_sck = '1' then
               i_ss <= '0';
               next_state <= FINAL_CYCLE;
            else
               load_rx_data_reg <= '1';
               i_ss <= '1';
               if tx_data_ready = '1' and i_sck = '1' then
                  clear_tx_data_ready <= '1';
                  next_state <= LOAD_SHIFT_REG;
               else
                  next_state <= IDLE;
               end if;
            end if;

      end case;
   end process;

-- TFB 2/5/04, not used
--   ----------------------
--   -- RX shift register.
--   process(sysclk, nreset)
--   begin
--      if nreset = '0' then
--         d_rx_shift_enable <= '0';
--      elsif rising_edge(sysclk) then
--         d_rx_shift_enable <= t_rx_shift_enable;
--      end if;
--   end process;
--   t_rx_shift_enable <= (not i_ss) and (not i_sck) and d_sck;

	------------------------------------------------------------
	-- TFB added 2/8/04
	process(i_ss, c_sck, tsck, cpol, cpha)
	begin
		if i_ss='0' then
			if (cpol xor cpha)='0' then
				rx_shift_enable1	<= c_sck and (not tsck);
			else
				rx_shift_enable1	<= (not c_sck) and tsck;
			end if;
		else
			rx_shift_enable1	<= '0';
		end if;
	end process;
	-- delay rx_shift_enable by 1 cycle for fastest clock rate (clocksel="000")
	process(sysclk, nreset)
	begin
		if nreset='0' then
			rx_shift_enable2	<= '0';
		elsif rising_edge(sysclk) then
			rx_shift_enable2	<= rx_shift_enable1;
		end if;
	end process;
	rx_shift_enable	<= rx_shift_enable2 when (clocksel="000") else
						rx_shift_enable1;
	------------------------------------------------------------

   process(sysclk, nreset)
   begin
      if nreset = '0' then
         rx_shift_reg <= (others=>'0');
      elsif rising_edge(sysclk) then
		-- TFB modified 2/8/04 to correct for CLKSEL=0
         --if d_rx_shift_enable = '1' then
         --if t_rx_shift_enable = '1' then
		if rx_shift_enable = '1' then
            rx_shift_reg(0) <= miso;
            rx_shift_reg(7 downto 1) <= rx_shift_reg(6 downto 0);
         end if;
      end if;
   end process;


   ---------------------
   -- TX Shift register.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         tx_shift_reg <= (others=>'0');
         mosi <= '0';
      elsif rising_edge(sysclk) then
         if tx_shift_reg_load = '1' then
            tx_shift_reg <= tx_data_reg;
         elsif shift_enable = '1' then  -- data transfer cycles.
            tx_shift_reg(7 downto 1) <= tx_shift_reg(6 downto 0);
         end if;
         mosi <= tx_shift_reg(7);
      end if;
   end process;

   -----------------------
   -- RX data register.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         rx_data_reg <= (others=>'0');
      elsif rising_edge(sysclk) then
         if enable = '1' then
            if load_rx_data_reg = '1' then
               rx_data_reg <= rx_shift_reg;
            end if;
         end if;
      end if;
   end process;

   ----------------------------------
   -- Generate rx_data_waiting flag.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         rx_data_waiting <= '0';
         rx_error_i <= '0';
      elsif rising_edge(sysclk) then
         if rx_reg_re = '1' then
            rx_data_waiting <= '0';
         elsif clear_error = '1' then
            rx_error_i <= '0';
         elsif load_rx_data_reg = '1' then
            if rx_data_waiting = '1' then
               rx_error_i <= '1';
            else
               rx_data_waiting <= '1';
            end if;
         end if;
      end if;
   end process;
   rx_error <= rx_error_i;
   rx_data_ready <= rx_data_waiting;

   ----------------------------------
   -- Generate tx_data_ready flag.
   process(sysclk, nreset)
   begin
      if nreset = '0' then
         tx_data_ready <= '0';
         i_tx_reg_empty <= '1';
         d_tx_shift_reg_load <= '0';
      elsif rising_edge(sysclk) then
         if tx_reg_we = '1' then
            tx_data_ready <= '1';
            i_tx_reg_empty <= '0';
         elsif clear_tx_data_ready = '1' then
            tx_data_ready <= '0';
         elsif tx_shift_reg_load = '0' and d_tx_shift_reg_load = '1' then
            i_tx_reg_empty <= '1';
         end if;
         d_tx_shift_reg_load <= tx_shift_reg_load;
      end if;
   end process;
   tx_reg_empty <= i_tx_reg_empty;

   -----------------------
   -- Generate Busy flag.
   busy <= '1' when tss = '0' or (not i_tx_reg_empty) = '1' or
           state /= IDLE else '0';

end behv;
