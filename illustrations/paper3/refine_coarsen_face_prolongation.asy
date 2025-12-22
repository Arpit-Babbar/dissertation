
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

label(scale(scaling_factor)*"$\Gamma$", (lsqr_end, 0.6 ));

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

pen arrow_pen = purple+linewidth(0.72);

draw(mortar1_base--mortar1_tip, mortar1_pen); // Draw first mortar
draw_uniform_points(yb, yb + 0.5, xcenter, xcenter, 4, small_pen_up_right);

draw(mortar2_base--mortar2_tip, mortar2_pen);  // Draw second mortar
draw_uniform_points(ym, ym + 0.5, xcenter, xcenter, 4, small_pen_down_right);

real u_scal = 1.12;

pen blue_pen = blue;
pen red_pen = red;

pen mortar2_flux_pen = blue;
pen mortar1_flux_pen = red;

label(rotate(90) * scale(u_scal) * "$u_\Gamma^-, U_\Gamma^-, F_\Gamma^-$",(lsqr_end - 0.1,0.00));
// label(scale(u_scal) * "$\Gamma$",(lsqr_end - 0.1,-0.05));

real xi_labelx = 0.1;
real xi_label_y1 = ystrt + 0.6;
real xi_label_y2 = ystrt + 0.1;

real mortar_x = mortar1_base.x;
real mortar1_ycenter = 0.5 * (mortar1_base.y + mortar1_tip.y);
real mortar2_ycenter = 0.5 * (mortar2_base.y + mortar2_tip.y);

// lsqr_end already here
real lsqr_ycenter = 0.0;


label(scale(u_scal) * "$\Xi_1$", (mortar_x + 0.01, mortar2_tip.y + 0.08), mortar1_flux_pen);
label(scale(u_scal) * "$\Xi_2$", (mortar_x + 0.01, mortar1_base.y - 0.09), mortar2_flux_pen);


pair arrow2mortar1P = (lsqr_end + 0.05, lsqr_ycenter - 0.01);
pair arrow2mortar1Q = (mortar_x - 0.05, mortar1_ycenter - 0.01);
guide arrow2mortar1 =  arrow2mortar1P--arrow2mortar1Q ;
draw(arrow2mortar1, arrow_pen, Arrow);
label(Label("$u_{\Xi_2}^-, U_{\Xi_2}^-, F_{\Xi_2}^-$", Rotate(arrow2mortar1Q - arrow2mortar1P) ), arrow2mortar1);
pair arrow2mortar2P = (lsqr_end + 0.05, lsqr_ycenter + 0.01);
pair arrow2mortar2Q = (mortar_x - 0.05, mortar2_ycenter + 0.01);
guide arrow2mortar2 = arrow2mortar2P -- arrow2mortar2Q ;
draw(arrow2mortar2, arrow_pen, Arrow);
label(Label("$u_{\Xi_1}^-, U_{\Xi_1}^-, F_{\Xi_1}^-$", Rotate(arrow2mortar2Q - arrow2mortar2P) ), reverse(arrow2mortar2));

real rsqr_1_start_x = rssqr1_strt;

guide mortar1_arrow = (rsqr_1_start_x - 0.05, mortar1_ycenter)--(mortar_x + 0.05,mortar1_ycenter);
label("$u_{\Xi_2}^+, U_{\Xi_2}^+, F_{\Xi_2}^+$", mortar1_arrow);
draw(mortar1_arrow, arrow_pen, Arrow);

guide mortar2_arrow = (rsqr_1_start_x - 0.05, mortar2_ycenter)--(mortar_x + 0.05,mortar2_ycenter);
label("$u_{\Xi_1}^+, U_{\Xi_1}^+, F_{\Xi_1}^+$", mortar2_arrow);
draw(mortar2_arrow, arrow_pen, Arrow);

label(scale(u_scal) * "$F_{\Gamma_2}^+$",(rsqr_1_start_x+0.1,mortar1_ycenter), blue_pen);
label(scale(u_scal) * "$F_{\Gamma_1}^+$",(rsqr_1_start_x+0.1,mortar2_ycenter), red_pen);

label(scale(u_scal) * "$\Gamma_2$",(rsqr_1_start_x,-0.65), blue_pen);

label(scale(u_scal) * "$\Gamma_1$",(rsqr_1_start_x,0.65), red_pen);
