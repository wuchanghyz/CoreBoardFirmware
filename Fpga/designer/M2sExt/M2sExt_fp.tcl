new_project \
         -name {M2sExt} \
         -location {C:\Users\AndersonHan\Documents\CoreBoardExt\designer\M2sExt\M2sExt_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
