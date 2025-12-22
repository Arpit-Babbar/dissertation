import graph;

from "./refine_coarsen_base.asy" access *;

import geometry;

label(scale(scaling_factor)*"$\Omega_{e_1}$", (0.5*(rssqr1_strt + rssqr1_end), 0.35 ));
label(scale(scaling_factor)*"$u_{e_1}$", (0.5*(rssqr1_strt + rssqr1_end), 0.15 ));

label(scale(scaling_factor)*"$\Omega_{e_2}$", (0.5*(rssqr2_strt + rssqr2_end), 0.35 ));
label(scale(scaling_factor)*"$u_{e_2}$", (0.5*(rssqr2_strt + rssqr2_end), 0.15 ));

label(scale(scaling_factor)*"$\Omega_{e_3}$", (0.5*(rssqr1_strt + rssqr1_end),-0.15 ));
label(scale(scaling_factor)*"$u_{e_3}$", (0.5*(rssqr1_strt + rssqr1_end),-0.35 ));

label(scale(scaling_factor)*"$\Omega_{e_4}$", (0.5*(rssqr2_strt + rssqr2_end),-0.15 ));
label(scale(scaling_factor)*"$u_{e_4}$", (0.5*(rssqr2_strt + rssqr2_end),-0.35 ));


