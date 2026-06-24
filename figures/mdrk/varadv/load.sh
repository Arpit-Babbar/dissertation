src_dir=arpit@192.168.1.65:/home2/arpit/repositories/private_Tenkai.jl/figures/or2/convergence
rsync --progress $src_dir/*pdf .
bash pdfbb *pdf
