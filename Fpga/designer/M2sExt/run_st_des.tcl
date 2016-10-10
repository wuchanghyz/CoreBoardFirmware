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
set_def USE_CONSTRAINTS_FLOW 0
set_def USE_TCGEN 1
set_name M2sExt
set_workdir {C:\Users\AndersonHan\Desktop\BentoBox\CoreBoardExt\designer\M2sExt}
set_design_state post_layout
