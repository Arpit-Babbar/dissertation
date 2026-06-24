figs_dir=arpit@192.168.1.65:/home2/arpit/repositories/private_Tenkai.jl/figures/
src_dir=${figs_dir}burg1d/convergence
rsync --progress $src_dir/*pdf .
bash pdfbb *pdf

# rsync $figs_dir/burg1d_t2.0/soln.pdf soln_2.0.pdf
# rsync $figs_dir/burg1d_t4.5/soln.pdf soln_4.5.pdf
# rsync $figs_dir/burg1d_t8.0/soln.pdf soln_8.0.pdf
