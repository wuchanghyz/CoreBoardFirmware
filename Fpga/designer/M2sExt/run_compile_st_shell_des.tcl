set_device \
    -family  SmartFusion2 \
    -die     PA4M1000_N \
    -package fg484 \
    -speed   STD \
    -tempr   {IND} \
    -voltr   {IND}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def USE_TCGEN 1
set_def NETLIST_TYPE EDIF
set_name M2sExt
set_workdir {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt}
set_log     {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt_sdc.log}
set_design_state pre_layout
