import graph;

import geometry;

size(500,500);

real len = 1.0;
real lsqr_strt = -1.7;
real lsqr_end = lsqr_strt + len;
real rsqr_strt = lsqr_end + len;
real rsqr_end = rsqr_strt + len;
real rssqr1_strt = rsqr_strt;
real rssqr2_strt = rsqr_strt + 0.5*len;
real rssqr1_end = rssqr1_strt + 0.5 * len;
real rssqr2_end = rssqr2_strt + 0.5 * len;

real scaling_factor = 1.3;

label(scale(scaling_factor)*"$\Omega_e$", (0.5*(lsqr_strt + lsqr_end), 0.1));
label(scale(scaling_factor)*"$u_e$", (0.5*(lsqr_strt + lsqr_end), -0.1));

pen sqr_pen = linewidth(1.5);

draw(square((lsqr_strt,-0.5),(lsqr_end,-0.5))); // Left square
draw(square((rsqr_strt,-0.5),(rsqr_end,-0.5))); // Right big square
draw(square((rssqr1_strt,0.0),(rssqr1_end,0.0))); // Right small square 1
draw(square((rssqr2_strt,-0.5),(rssqr2_end,-0.5))); // Right small square 2

pen thick_pen = linewidth(2.0);

pen arrow_pen = purple+linewidth(0.5);

real xstrtl  = lsqr_end + 0.05;
real xendl   = -0.05;
real xstrtr = xstrtl + rsqr_strt;
real xendr  = xendl + rsqr_strt;
real ystrt  = -0.1;
real yend   =  0.1;

draw((xstrtl,yend)--(xendr,yend), arrow_pen, Arrow);
label(scale(1.2)*"Refine and interpolate", (0.5 * (xstrtl + xendr), 0.2));

draw((xendr,ystrt)--(xstrtl,ystrt), arrow_pen, Arrow);
label(scale(1.2)*"Coarsen and project", (0.5 * (xstrtl + xendr), -0.2));
