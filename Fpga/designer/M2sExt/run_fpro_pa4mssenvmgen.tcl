set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg fg484
set_input_cfg \
	-path {C:/Users/AndersonHan/Desktop/BentoBox/Fpga/component/work/M2sExt_sb_MSS/ENVM.cfg}
set_output_efc \
    -path {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt.efc}
set_proj_dir \
    -path {C:\Users\AndersonHan\Desktop\BentoBox\Fpga}
gen_prg -use_init false
