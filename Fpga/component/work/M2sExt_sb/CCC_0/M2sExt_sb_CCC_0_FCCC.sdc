set_component M2sExt_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2017-Jan-10 22:22:04
#

create_clock -period 50 [ get_pins { CCC_INST/CLK0 } ]
create_generated_clock -multiply_by 5 -divide_by 4 -source [ get_pins { CCC_INST/CLK0 } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
