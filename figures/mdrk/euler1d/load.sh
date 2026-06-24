src_dir=arpit@192.168.1.65:/home2/arpit/repositories/private_Tenkai.jl/figures
for test in blast sedov1d
do 
	for variable in density pressure
	do 
		echo downloading test=$test,  variable=$variable
		rsync $src_dir/$test/$variable.pdf ${test}_${variable}.pdf
	done
done

# rsync $src_dir/shuosher_zoomed/density.pdf shuosher_density_zoomed.pdf
