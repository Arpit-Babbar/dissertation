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

real square_translater = 0.05;
real rssqr1_strt = rssqr1_strt - square_translater;
real rssqr1_end = rssqr1_end - square_translater;
real rssqr2_strt = rssqr2_strt + square_translater;
real rssqr2_end = rssqr2_end + square_translater;
real yb = -0.5 - square_translater; // y bottom
real ym =  square_translater; // y middle

draw(square((rssqr1_strt ,ym),(rssqr1_end,ym))); // Right small square 1
draw(square((rssqr2_strt,ym),(rssqr2_end,ym))); // Right small square 2
draw(square((rssqr1_strt, yb),(rssqr1_end, yb))); // Right small square 3
draw(square((rssqr2_strt, yb),(rssqr2_end, yb))); // Right small square 4

pen thick_pen = linewidth(2.0);

pen arrow_pen = purple+linewidth(0.5);

real xstrtl  = lsqr_end + 0.1;
real xendl   = -0.1;
real xstrtr = xstrtl + rsqr_strt;
real xendr  = xendl + rsqr_strt;
real ystrt  = -0.1;
real yend   =  0.1;

// draw((xstrtl,yend)--(xendr,yend), arrow_pen, Arrow);
// label(scale(1.2)*"Refine and interpolate", (0.5 * (xstrtl + xendr), 0.2));

// draw((xendr,ystrt)--(xstrtl,ystrt), arrow_pen, Arrow);
// label(scale(1.2)*"Coarsen and project", (0.5 * (xstrtl + xendr), -0.2));
label(scale(scaling_factor)*"$\Omega_{e_1}$", (0.5*(rssqr1_strt + rssqr1_end), 0.35 + square_translater ));
label(scale(scaling_factor)*"$u_{e_1}$", (0.5*(rssqr1_strt + rssqr1_end), 0.15  + square_translater ));

label(scale(scaling_factor)*"$\Omega_{e_2}$", (0.5*(rssqr2_strt + rssqr2_end), 0.35  + square_translater ));
label(scale(scaling_factor)*"$u_{e_2}$", (0.5*(rssqr2_strt + rssqr2_end), 0.15  + square_translater));

label(scale(scaling_factor)*"$\Omega_{e_3}$", (0.5*(rssqr1_strt + rssqr1_end),-0.15  - square_translater));
label(scale(scaling_factor)*"$u_{e_3}$", (0.5*(rssqr1_strt + rssqr1_end),-0.35 - square_translater));

label(scale(scaling_factor)*"$\Omega_{e_4}$", (0.5*(rssqr2_strt + rssqr2_end),-0.15 - square_translater));
label(scale(scaling_factor)*"$u_{e_4}$", (0.5*(rssqr2_strt + rssqr2_end),-0.35 - square_translater));



// Solution points now


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
    for (int j=0; j<npoints; ++j)
    {
      real x = xstart + gll_pts[0]*dx;
      real y = ystart + gll_pts[j]*dy;
      dot((x,y), p);
    };
};


pen big_pen = linewidth(9.0) + deepgreen;
pen small_pen_up_right = linewidth(8.0) + blue;
pen small_pen_up_left = linewidth(7.5) + deepcyan;
pen small_pen_down_right = linewidth(7.0) + red;
pen small_pen_down_left = linewidth(6.5) + heavymagenta;

draw_uniform_points(-0.5, 0.5,lsqr_end, lsqr_end, 4, big_pen);

draw_uniform_points(yb, yb + 0.5, rssqr1_strt, rssqr1_end, 4, small_pen_up_right);
// draw_uniform_points(ym, ym + 0.5, rssqr2_strt, rssqr2_end, 4, small_pen_up_left);
draw_uniform_points(ym, ym + 0.5, rssqr1_strt, rssqr1_end, 4, small_pen_down_right);
// draw_uniform_points(yb, yb + 0.5, rssqr2_strt, rssqr2_end, 4, small_pen_down_left);
// draw_uniform_points(yb, yb + 0.5, lsqr_end, rssqr1_end, 4, small_pen_down_left);




// draw(square((rssqr1_strt ,ym),(rssqr1_end,ym))); // Right small square 1
// draw(square((rssqr2_strt,ym),(rssqr2_end,ym))); // Right small square 2
// draw(square((rssqr1_strt, yb),(rssqr1_end, yb))); // Right small square 3
// draw(square((rssqr2_strt, yb),(rssqr2_end, yb))); // Right small square 4

real dL = 0.03;

real xcenter = 0.5 * (lsqr_end + rssqr1_strt);

pair mortar1_base = (xcenter,yb);
pair mortar1_tip  = (xcenter,yb + 0.5);
pair mortar2_base = (xcenter,ym);
pair mortar2_tip  = (xcenter,ym + 0.5);

real mortar_thickness = 2.5;

pen mortar1_pen = linewidth(mortar_thickness);
pen mortar2_pen = linewidth(mortar_thickness);

pen arrow_pen = purple+linewidth(0.5);

draw(mortar1_base--mortar1_tip, mortar1_pen); // Draw first mortar
draw_uniform_points(yb, yb + 0.5, xcenter, xcenter, 4, small_pen_up_right);

draw(mortar2_base--mortar2_tip, mortar2_pen);  // Draw second mortar
draw_uniform_points(ym, ym + 0.5, xcenter, xcenter, 4, small_pen_down_right);
