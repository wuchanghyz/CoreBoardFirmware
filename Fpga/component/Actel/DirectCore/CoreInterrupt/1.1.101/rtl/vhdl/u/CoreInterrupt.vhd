--============================================================================
--
--  CoreInterrupt
--
--============================================================================

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity CoreInterrupt is
    generic(
        NUMIRQSRC   : integer   := 8;   -- Number of IRQ source inputs. Range 0 to 32.
        NUMFIQSRC   : integer   := 0;   -- Number of FIQ source inputs. Range 0 to 8.
        -- IRQPOLARITY determines polarity of IRQ output
        --      1 = active high
        --      0 = active low
        IRQPOLARITY : integer   := 0;
        -- FIQPOLARITY determines polarity of FIQ output
        --      1 = active high
        --      0 = active low
        FIQPOLARITY : integer   := 0
    );
    port(
        PCLK        : in  std_logic;                        -- APB clock
        PRESETn     : in  std_logic;                        -- APB reset
        PENABLE     : in  std_logic;                        -- APB enable
        PSEL        : in  std_logic;                        -- APB periph select
        PADDR       : in  std_logic_vector(5 downto 2);     -- APB address bus
        PWRITE      : in  std_logic;                        -- APB write
        PWDATA      : in  std_logic_vector(31 downto 0);    -- APB write data
        PRDATA      : out std_logic_vector(31 downto 0);    -- APB read data
        fiqSource7  : in  std_logic;
        fiqSource6  : in  std_logic;
        fiqSource5  : in  std_logic;
        fiqSource4  : in  std_logic;
        fiqSource3  : in  std_logic;
        fiqSource2  : in  std_logic;
        fiqSource1  : in  std_logic;
        fiqSource0  : in  std_logic;
        irqSource31 : in  std_logic;
        irqSource30 : in  std_logic;
        irqSource29 : in  std_logic;
        irqSource28 : in  std_logic;
        irqSource27 : in  std_logic;
        irqSource26 : in  std_logic;
        irqSource25 : in  std_logic;
        irqSource24 : in  std_logic;
        irqSource23 : in  std_logic;
        irqSource22 : in  std_logic;
        irqSource21 : in  std_logic;
        irqSource20 : in  std_logic;
        irqSource19 : in  std_logic;
        irqSource18 : in  std_logic;
        irqSource17 : in  std_logic;
        irqSource16 : in  std_logic;
        irqSource15 : in  std_logic;
        irqSource14 : in  std_logic;
        irqSource13 : in  std_logic;
        irqSource12 : in  std_logic;
        irqSource11 : in  std_logic;
        irqSource10 : in  std_logic;
        irqSource9  : in  std_logic;
        irqSource8  : in  std_logic;
        irqSource7  : in  std_logic;
        irqSource6  : in  std_logic;
        irqSource5  : in  std_logic;
        irqSource4  : in  std_logic;
        irqSource3  : in  std_logic;
        irqSource2  : in  std_logic;
        irqSource1  : in  std_logic;
        irqSource0  : in  std_logic;
        IRQ         : out std_logic;    -- Interrupt request
        FIQ         : out std_logic     -- Fast interrupt request
    );
end CoreInterrupt;

architecture synth of CoreInterrupt is

    -------------------------------------------------------------------------------
    -- Constant declarations
    -------------------------------------------------------------------------------
    -- Register addresses
    constant FIQSOFTA       : std_logic_vector(5 downto 2) := x"0";
    constant FIQSOFTCLEARA  : std_logic_vector(5 downto 2) := x"1";
    constant FIQENABLEA     : std_logic_vector(5 downto 2) := x"2";
    constant FIQENCLEARA    : std_logic_vector(5 downto 2) := x"3";
    constant FIQRAWSTATUSA  : std_logic_vector(5 downto 2) := x"4";
    constant FIQSTATUSA     : std_logic_vector(5 downto 2) := x"5";
    constant IRQSOFTA       : std_logic_vector(5 downto 2) := x"6";
    constant IRQSOFTCLEARA  : std_logic_vector(5 downto 2) := x"7";
    constant IRQENABLEA     : std_logic_vector(5 downto 2) := x"8";
    constant IRQENCLEARA    : std_logic_vector(5 downto 2) := x"9";
    constant IRQRAWSTATUSA  : std_logic_vector(5 downto 2) := x"a";
    constant IRQSTATUSA     : std_logic_vector(5 downto 2) := x"b";

    -------------------------------------------------------------------------------
    -- Signal declarations
    -------------------------------------------------------------------------------
    signal WriteEn          : std_logic;

    signal PrdataNext       : std_logic_vector(31 downto 0);    -- Internal PRDATA
    signal iPRDATA          : std_logic_vector(31 downto 0);    -- Regd PrdataNext
    signal PrdataNextEn     : std_logic;                        -- PRDATAEn register input
    signal DataOut          : std_logic_vector(31 downto 0);

    signal fiqSource        : std_logic_vector( 7 downto 0);
    signal irqSource        : std_logic_vector(31 downto 0);

    signal fiqConfigMask    : std_logic_vector( 7 downto 0);
    signal irqConfigMask    : std_logic_vector(31 downto 0);

    signal iFiqSource       : std_logic_vector( 7 downto 0);
    signal fiqRawStatus     : std_logic_vector( 7 downto 0);
    signal fiqStatus        : std_logic_vector( 7 downto 0);
    signal fiqSoft          : std_logic_vector( 7 downto 0);
    signal fiqEnable        : std_logic_vector( 7 downto 0);

    signal iIrqSource       : std_logic_vector(31 downto 0);
    signal irqRawStatus     : std_logic_vector(31 downto 0);
    signal irqStatus        : std_logic_vector(31 downto 0);
    signal irqSoft          : std_logic_vector(31 downto 0);
    signal irqEnable        : std_logic_vector(31 downto 0);

    signal iFIQ             : std_logic;
    signal iIRQ             : std_logic;

    signal iFiqPwdata       : std_logic_vector( 7 downto 0);
    signal iIrqPwdata       : std_logic_vector(31 downto 0);

    -------------------------------------------------------------------------------
    -- Beginning of main code
    -------------------------------------------------------------------------------
    begin

    -- Consolidate FIQ sources into a single 8 bit signal
    fiqSource <= (  fiqSource7
                    & fiqSource6
                    & fiqSource5
                    & fiqSource4
                    & fiqSource3
                    & fiqSource2
                    & fiqSource1
                    & fiqSource0);

    -- Consolidate IRQ sources into a single 32 bit signal
    irqSource <= (  irqSource31
                    & irqSource30
                    & irqSource29
                    & irqSource28
                    & irqSource27
                    & irqSource26
                    & irqSource25
                    & irqSource24
                    & irqSource23
                    & irqSource22
                    & irqSource21
                    & irqSource20
                    & irqSource19
                    & irqSource18
                    & irqSource17
                    & irqSource16
                    & irqSource15
                    & irqSource14
                    & irqSource13
                    & irqSource12
                    & irqSource11
                    & irqSource10
                    & irqSource9
                    & irqSource8
                    & irqSource7
                    & irqSource6
                    & irqSource5
                    & irqSource4
                    & irqSource3
                    & irqSource2
                    & irqSource1
                    & irqSource0);

    -- APB write enable
    writeEn <= '1' when (PWRITE = '1' and PSEL = '1' and PENABLE = '0') else '0';

    --------------------------------------------------------------------------------
    -- Configuration based on number of IRQ and FIQ sources
    --------------------------------------------------------------------------------

    -- IRQ related configuration
    irqConfigMask <= x"ffffffff" when (NUMIRQSRC = 32) else
                     x"7fffffff" when (NUMIRQSRC = 31) else
                     x"3fffffff" when (NUMIRQSRC = 30) else
                     x"1fffffff" when (NUMIRQSRC = 29) else
                     x"0fffffff" when (NUMIRQSRC = 28) else
                     x"07ffffff" when (NUMIRQSRC = 27) else
                     x"03ffffff" when (NUMIRQSRC = 26) else
                     x"01ffffff" when (NUMIRQSRC = 25) else
                     x"00ffffff" when (NUMIRQSRC = 24) else
                     x"007fffff" when (NUMIRQSRC = 23) else
                     x"003fffff" when (NUMIRQSRC = 22) else
                     x"001fffff" when (NUMIRQSRC = 21) else
                     x"000fffff" when (NUMIRQSRC = 20) else
                     x"0007ffff" when (NUMIRQSRC = 19) else
                     x"0003ffff" when (NUMIRQSRC = 18) else
                     x"0001ffff" when (NUMIRQSRC = 17) else
                     x"0000ffff" when (NUMIRQSRC = 16) else
                     x"00007fff" when (NUMIRQSRC = 15) else
                     x"00003fff" when (NUMIRQSRC = 14) else
                     x"00001fff" when (NUMIRQSRC = 13) else
                     x"00000fff" when (NUMIRQSRC = 12) else
                     x"000007ff" when (NUMIRQSRC = 11) else
                     x"000003ff" when (NUMIRQSRC = 10) else
                     x"000001ff" when (NUMIRQSRC =  9) else
                     x"000000ff" when (NUMIRQSRC =  8) else
                     x"0000007f" when (NUMIRQSRC =  7) else
                     x"0000003f" when (NUMIRQSRC =  6) else
                     x"0000001f" when (NUMIRQSRC =  5) else
                     x"0000000f" when (NUMIRQSRC =  4) else
                     x"00000007" when (NUMIRQSRC =  3) else
                     x"00000003" when (NUMIRQSRC =  2) else
                     x"00000001" when (NUMIRQSRC =  1) else
                     x"00000000" when (NUMIRQSRC =  0) else
                     x"00000000";

    iIrqSource <= irqSource and irqConfigMask;
    iIrqPwdata <= PWDATA and irqConfigMask;

    -- FIQ related configuration
    fiqConfigMask <= x"ff" when (NUMFIQSRC = 8) else
                     x"7f" when (NUMFIQSRC = 7) else
                     x"3f" when (NUMFIQSRC = 6) else
                     x"1f" when (NUMFIQSRC = 5) else
                     x"0f" when (NUMFIQSRC = 4) else
                     x"07" when (NUMFIQSRC = 3) else
                     x"03" when (NUMFIQSRC = 2) else
                     x"01" when (NUMFIQSRC = 1) else
                     x"00" when (NUMFIQSRC = 0) else
                     x"00";

    iFiqSource <= fiqSource and fiqConfigMask;
    iFiqPwdata <= PWDATA(7 downto 0) and fiqConfigMask;

    --------------------------------------------------------------------------------
    -- FIQ
    --------------------------------------------------------------------------------
    fiqRawStatus <= iFiqSource or fiqSoft;
    fiqStatus <= fiqRawStatus and fiqEnable;

    -- bitwise OR
    process (fiqStatus)
    begin
        iFIQ <= '0';
        for index in 0 to 7 loop
            if (fiqStatus(index) = '1') then
                iFIQ <= '1';
            end if;
        end loop;
    end process;

    FIQ <= iFIQ when (FIQPOLARITY = 1) else not(iFIQ);

    --------------------------------------------------------------------------------
    -- IRQ
    --------------------------------------------------------------------------------
    irqRawStatus <= iIrqSource or irqSoft;
    irqStatus <= irqRawStatus and irqEnable;

    -- bitwise OR
    process (irqStatus)
    begin
        iIRQ <= '0';
        for index in 0 to 31 loop
            if (irqStatus(index) = '1') then
                iIRQ <= '1';
            end if;
        end loop;
    end process;

    IRQ <= iIRQ when (IRQPOLARITY = 1) else not(iIRQ);

    --------------------------------------------------------------------------------
    -- FIQ soft interrupt register
    --------------------------------------------------------------------------------
    process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            fiqSoft <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (writeEn = '1') then
                case PADDR is
                    when FIQSOFTA      => fiqSoft <= (fiqSoft or iFiqPwdata);       -- set
                    when FIQSOFTCLEARA => fiqSoft <= (fiqSoft and not(iFiqPwdata)); -- clear
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- FIQ enable register
    --------------------------------------------------------------------------------
    process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            fiqEnable <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (writeEn = '1') then
                case PADDR is
                    when FIQENABLEA  => fiqEnable <= (fiqEnable or iFiqPwdata);       -- set
                    when FIQENCLEARA => fiqEnable <= (fiqEnable and not(iFiqPwdata)); -- clear
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- IRQ soft interrupt register
    --------------------------------------------------------------------------------
    process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            irqSoft <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (writeEn = '1') then
                case PADDR is
                    when IRQSOFTA      => irqSoft <= (irqSoft or iIrqPwdata);       -- set
                    when IRQSOFTCLEARA => irqSoft <= (irqSoft and not(iIrqPwdata)); -- clear
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- IRQ enable register
    --------------------------------------------------------------------------------
    process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            irqEnable <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (writeEn = '1') then
                case PADDR is
                    when IRQENABLEA  => irqEnable <= (irqEnable or iIrqPwdata);       -- set
                    when IRQENCLEARA => irqEnable <= (irqEnable and not(iIrqPwdata)); -- clear
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------------
    -- Output data generation
    --------------------------------------------------------------------------------
    -- Zero data is used as padding for register reads

    process (PSEL, PWRITE, PADDR,
             fiqSoft, fiqEnable, fiqRawStatus, fiqStatus,
             irqSoft, irqEnable, irqRawStatus, irqStatus
            )
    begin
        DataOut <= (others => '0'); -- Drive zeros by default
        if (PWRITE = '0' and PSEL = '1') then
            case PADDR is
                when FIQSOFTA       => DataOut( 7 downto 0) <= fiqSoft;
                when FIQENABLEA     => DataOut( 7 downto 0) <= fiqEnable;
                when FIQRAWSTATUSA  => DataOut( 7 downto 0) <= fiqRawStatus;
                when FIQSTATUSA     => DataOut( 7 downto 0) <= fiqStatus;
                when IRQSOFTA       => DataOut(31 downto 0) <= irqSoft;
                when IRQENABLEA     => DataOut(31 downto 0) <= irqEnable;
                when IRQRAWSTATUSA  => DataOut(31 downto 0) <= irqRawStatus;
                when IRQSTATUSA     => DataOut(31 downto 0) <= irqStatus;
                when others => DataOut <= (others => '0');
            end case;
        else
            DataOut <= (others => '0');
        end if;
    end process;

    -- Enable for output data.
    PrdataNextEn <= '1' when (PSEL = '1' and PWRITE ='0' and PENABLE = '0')
                    else '0';

    PrdataNext <=   DataOut when (PrdataNextEn = '1') else (others => '0');

    -- Register used to reduce output delay during reads.
    p_iPRDATASeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            iPRDATA <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            iPRDATA <= PrdataNext;
        end if;
    end process p_iPRDATASeq;

    -- Drive output with internal version.
    PRDATA <= iPRDATA;

end synth;

--================================= End ===================================--
