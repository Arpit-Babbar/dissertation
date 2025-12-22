import graph;


from "./refine_coarsen_base.asy" access *;

texpreamble("\usepackage{amsmath}\usepackage{amsfonts}\usepackage{amsbsy}\usepackage{amssymb}");

label(scale(1.2)*"$u_e$", (0.5*(lsqr_strt + lsqr_end), -0.1));

label(scale(1.2)*"$u_{e_1}(\xi, \eta)=u_{e_1,ij} \ell_{i}(\xi) \ell_{j}(\eta)$", (0.5*(rssqr1_strt + rssqr1_end), 0.15 ));

label(scale(1.2)*"$u_{e_2}$", (0.5*(rssqr2_strt + rssqr2_end), 0.15 ));

label(scale(1.2)*"$u_{e_3}$", (0.5*(rssqr1_strt + rssqr1_end),-0.35 ));

label(scale(1.2)*"$u_{e_4}$", (0.5*(rssqr2_strt + rssqr2_end),-0.35 ));
