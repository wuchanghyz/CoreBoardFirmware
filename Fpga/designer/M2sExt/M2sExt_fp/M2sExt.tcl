open_project -project {C:\Users\AndersonHan\Desktop\USBSimBoard\Fpga\designer\M2sExt\M2sExt_fp\M2sExt.pro}
set_programming_file -name {M2S010} -file {C:\Users\AndersonHan\Desktop\USBSimBoard\Fpga\designer\M2sExt\M2sExt.ipd}
enable_device -name {M2S010} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
set_programming_file -name {M2S010} -no_file
save_project
close_project
