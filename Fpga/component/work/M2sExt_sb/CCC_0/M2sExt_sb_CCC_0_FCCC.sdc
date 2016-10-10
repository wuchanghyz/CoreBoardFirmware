set_component M2sExt_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2016-Oct-08 15:06:17
#

create_clock -period 50 [ get_pins { CCC_INST/CLK0 } ]
create_generated_clock -multiply_by 5 -divide_by 4 -source [ get_pins { CCC_INST/CLK0 } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
