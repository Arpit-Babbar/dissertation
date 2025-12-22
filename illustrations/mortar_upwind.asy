import graph;

import geometry;

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

pen sqr_pen = linewidth(1.5);

draw(square((lsqr_strt,-0.5),(lsqr_end,-0.5))); // Left square
draw(square((rsqr_strt,-0.5),(rsqr_end,-0.5))); // Right big square
draw(square((rssqr1_strt,0.0),(rssqr1_end,0.0))); // Right small square 1
draw(square((rssqr2_strt,-0.5),(rssqr2_end,-0.5))); // Right small square 2

real ystrt  = -0.25;
real yend   =  0.25;

pen arrow_pen = black+linewidth(1.0);

draw((lsqr_end-0.5,ystrt)--(lsqr_end,ystrt), arrow_pen, Arrow);
draw((lsqr_end-0.5,yend)--(lsqr_end,yend), arrow_pen, Arrow);

