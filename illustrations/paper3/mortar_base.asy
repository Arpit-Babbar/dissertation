import graph;

import geometry;

size(500,500);

real len = 1.0;
real lsqr_strt = -1.7;
real lsqr_end = lsqr_strt + len;
real rsqr_strt = 0.7;
real rsqr_end = rsqr_strt + len;
real rssqr1_strt = rsqr_strt;
real rssqr2_strt = rsqr_strt + 0.5*len;
real rssqr1_end = rssqr1_strt + 0.5 * len;
real rssqr2_end = rssqr2_strt + 0.5 * len;

pen sqr_pen = linewidth(1.0);

draw(square((lsqr_strt,-0.5),(lsqr_end,-0.5))); // Left square
draw(square((rsqr_strt,-0.5),(rsqr_end,-0.5))); // Right big square
draw(square((rssqr1_strt,0.0),(rssqr1_end,0.0))); // Right small square 1
draw(square((rssqr2_strt,-0.5),(rssqr2_end,-0.5))); // Right small square 2

dot((lsqr_strt, -0.5));
dot((lsqr_strt, 0.5));
dot((lsqr_strt, 0.0));
label("$-1$", (lsqr_strt+0.1, -0.45));
label("$+1$", (lsqr_strt+0.1, 0.45));
label("$0$", (lsqr_strt+0.08, 0.0));

pen mortar_thickness = linewidth(2);

real dL = 0.03;

pair mortar1_base = (0,-0.5+dL);
pair mortar1_tip  = (0,0-dL);
pair mortar2_base = (0,0+dL);
pair mortar2_tip  = (0,0.5-dL);

pen mortar1_pen = red+linewidth(2);
pen mortar2_pen = blue+linewidth(2);

pen arrow_pen = purple+linewidth(0.5);

draw(mortar1_base--mortar1_tip, mortar1_pen); // Draw first mortar
draw(mortar2_base--mortar2_tip, mortar2_pen);  // Draw second mortar

pair small_face1_base = (rsqr_strt, -0.5);
pair small_face1_tip  = (rsqr_strt, 0);
pair small_face2_base = (rsqr_strt, 0);
pair small_face2_tip  = (rsqr_strt, 0.5);
pair big_face_base = (lsqr_end, -0.5);
pair big_face_tip = (lsqr_end, 0.5);

real face_width = 1.4;
pen face1_pen = red+linewidth(face_width);
pen face2_pen = blue+linewidth(face_width);
pen big_face_pen = linewidth(face_width);

draw(small_face1_base--small_face1_tip, face1_pen); // Mark small face 1
draw(small_face2_base--small_face2_tip, face2_pen);  // Mark small face 2
draw(big_face_base--big_face_tip, big_face_pen);  // Mark big face

real xstrtl  = lsqr_end + 0.05;
real xendl   = -0.05;
real xstrtr = xstrtl + rsqr_strt;
real xendr  = xendl + rsqr_strt;
real ystrt  = -0.25;
real yend   =  0.25;



real u_scal = 1.12;

pen blue_pen = blue;
pen red_pen = red;

label(scale(u_scal) * "$\Gamma_1$",(xendr+0.125,yend), blue_pen);
label(scale(u_scal) * "$\Gamma_2$",(xendr+0.125,ystrt), red_pen);
label(scale(u_scal) * "$\Gamma$",(xstrtl - 0.1,0.0));



real xi_labelx = 0.1;
real xi_label_y1 = ystrt + 0.6;
real xi_label_y2 = ystrt + 0.1;



label(scale(u_scal) * "$\Xi_1$", (xi_labelx, xi_label_y1), blue_pen);
label(scale(u_scal) * "$\Xi_2$", (xi_labelx, xi_label_y2), red_pen);

