-- Version: v11.7 11.7.0.119

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity M2sExt_IO_0_IO is

    port( PAD_IN : in    std_logic_vector(0 to 0);
          Y      : out   std_logic_vector(0 to 0)
        );

end M2sExt_IO_0_IO;

architecture DEF_ARCH of M2sExt_IO_0_IO is 

  component INBUF
    generic (IOSTD:string := "");

    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;


begin 


    U0_0 : INBUF
      generic map(IOSTD => "LVCMOS18")

      port map(PAD => PAD_IN(0), Y => Y(0));
    

end DEF_ARCH; 
