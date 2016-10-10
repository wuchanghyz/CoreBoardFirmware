open_project -project {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt_fp\M2sExt.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt.map} \
    -header {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt.hdr} \
    -envm {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt.efc}  \
    -spm {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt.spm} \
    -dca {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\M2sExt.dca}
export_single_stapl \
    -name {M2S010} \
    -file {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\export\M2sExt.stp} \
    -secured
export_spi_master \
    -name {M2S010} \
    -file {C:\Users\AndersonHan\Desktop\BentoBox\Fpga\designer\M2sExt\export\M2sExt.spi} \
    -secured
set_programming_file -name {M2S010} -no_file
save_project
close_project
