import graph;
import geometry;
texpreamble("\usepackage{amsmath}\usepackage{amsfonts}\usepackage{amsbsy}");

size(500,500);

real len = 1.0;
real lsqr_strt = -1.7;
real lsqr_end = lsqr_strt + len;
real rsqr_strt = lsqr_end;
real rsqr_end = rsqr_strt + len;
real rssqr1_strt = rsqr_strt;
real rssqr2_strt = rsqr_strt + 0.5*len;
real rssqr1_end = rssqr1_strt + 0.5 * len;
real rssqr2_end = rssqr2_strt + 0.5 * len;

pen bigsqr_pen = green;
pen small_sqrs_pen = lightblue;

filldraw(square((lsqr_strt,-0.5),(lsqr_end,-0.5)), bigsqr_pen); // Left square
filldraw(square((rsqr_strt,-0.5),(rsqr_end,-0.5)), small_sqrs_pen); // Right big square
filldraw(square((rssqr1_strt,0.0),(rssqr1_end,0.0)), small_sqrs_pen); // Right small square 1
filldraw(square((rssqr2_strt,-0.5),(rssqr2_end,-0.5)), small_sqrs_pen); // Right small square 2

pen thick_pen = linewidth(4.0)+black;

label(scale(2.0)*"\large ${ \boldsymbol{F}_\Gamma} $", (lsqr_end-0.12, 0.0), thick_pen);
label(scale(2.0)*"\large ${ \boldsymbol{F}_{\Xi_1}} $", (lsqr_end+0.12, 0.25), thick_pen);
label(scale(2.0)*"\large ${ \boldsymbol{F}_{\Xi_2}} $", (lsqr_end+0.12, -0.25), thick_pen);

draw((lsqr_end,-0.5)--(lsqr_end,0.5), thick_pen);

