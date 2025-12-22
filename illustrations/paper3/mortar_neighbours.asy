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

void draw_uniform_points(real ystart, real yend, real xstart, real xend,
                         int npoints, pen p)
{
  real dy = (yend - ystart);
  real dx = (xend - xstart);
  // real gll_pts(npoints);
  // if(npoints == 5){
  //  real[] gll_pts = {0.0,  0.1726731646460114, 0.5, 0.8273268353539887, 1.0};
  //  }
  //else if(npoints == 4){
    real [] gll_pts = {0.0,   0.27639320225002106, 0.7236067977499789, 1.0};
  //  }
  for (int i=0; i<npoints; ++i)
  {
    for (int j=0; j<npoints; ++j)
    {
      real x = xstart + gll_pts[i]*dx;
      real y = ystart + gll_pts[j]*dy;
      dot((x,y), p);
    }
  };
};

real yb = -0.5;
real ym = 0.0;
real dot_width = 11.0;
pen big_pen = linewidth(dot_width) + black;
pen small_pen_up_right = linewidth(dot_width - 1.0) + blue;
pen small_pen_up_left = linewidth(dot_width - 1.0) + blue;
pen small_pen_down_right = linewidth(dot_width - 1.0) +blue ;
pen small_pen_down_left = linewidth(dot_width - 1.0) + blue;

draw_uniform_points(-0.5, 0.5,lsqr_strt, lsqr_end, 4, big_pen);

draw_uniform_points(yb, yb + 0.5, rssqr1_strt, rssqr1_end, 4, small_pen_up_right);
draw_uniform_points(ym, ym + 0.5, rssqr2_strt, rssqr2_end, 4, small_pen_up_left);
draw_uniform_points(ym, ym + 0.5, rssqr1_strt, rssqr1_end, 4, small_pen_down_right);
draw_uniform_points(yb, yb + 0.5, rssqr2_strt, rssqr2_end, 4, small_pen_down_left);
