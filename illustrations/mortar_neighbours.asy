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

pen thick_pen = linewidth(2.0);

draw((lsqr_end,-0.5)--(lsqr_end,0.5), thick_pen);

pen big_pen = linewidth(10.0) + red;
void draw_uniform_points(real xloc, real ystart, real yend, int npoints, pen p)
{
  real dy = (yend - ystart);
  // real gll_pts(npoints);
  // if(npoints == 5){
  //  real[] gll_pts = {0.0,  0.1726731646460114, 0.5, 0.8273268353539887, 1.0};
  //  }
  //else if(npoints == 4){
    real [] gll_pts = {0.0,   0.27639320225002106, 0.7236067977499789, 1.0};
  //  }
  for (int i=0; i<npoints; ++i)
  {
    real y = ystart + gll_pts[i]*dy;
    dot((xloc,y), p);
  };
};
draw_uniform_points(lsqr_end, -0.5, 0.5, 4, big_pen);
pen small_pen_up = linewidth(8.0) + blue;
pen small_pen_down = linewidth(8.0) + yellow;
draw_uniform_points(lsqr_end, -0.5, 0.0, 4, small_pen_down);
draw_uniform_points(lsqr_end,  0.0, 0.5, 4, small_pen_up);

// dot((lsqr_end, 0.5), big_pen);
// dot((lsqr_end, 0.25), big_pen);
// dot((lsqr_end, 0.0), big_pen);
// dot((lsqr_end, -0.25), big_pen);
// dot((lsqr_end, -0.5), big_pen);
