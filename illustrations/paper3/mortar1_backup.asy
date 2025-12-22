import graph;
import geometry;

size(300,300);

draw(square((-1.5,-0.5),(-0.5,-0.5))); // Left square

draw(square((0.5,-0.5),(1.5,-0.5))); // Right big square
draw(square((0.5,0.0),(1.0,0.0))); // Right small square 1
draw(square((1.0,-0.5),(1.5,-0.5))); // Right small square 2

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
draw(mortar2_base--mortar2_tip, mortar2_pen);  // Draw first mortar

pair small_face1_base = (0.5, -0.5);
pair small_face1_tip  = (0.5, 0);
pair small_face2_base = (0.5, 0);
pair small_face2_tip  = (0.5, 0.5);
pair big_face_base = (-0.5, -0.5);
pair big_face_tip = (-0.5, 0.5);

pen face1_pen = red+linewidth(1.2);
pen face2_pen = blue+linewidth(1.2);
pen big_face_pen = linewidth(1.2);

draw(small_face1_base--small_face1_tip, face1_pen); // Mark small face 1
draw(small_face2_base--small_face2_tip, face2_pen);  // Mark small face 2
draw(big_face_base--big_face_tip, big_face_pen);  // Mark big face

real xstrtl  = -0.450;
real xendl   = -0.05;
real xstrtr = xstrtl + 0.5;
real xendr  = xendl + 0.5;
real ystrt  = -0.25;
real yend   =  0.25;

draw((xstrtl,ystrt)--(xendl,ystrt), arrow_pen, Arrows);
draw((xstrtl,yend)--(xendl,yend), arrow_pen, Arrows);
draw((xstrtr,ystrt)--(xendr,ystrt), arrow_pen, Arrows);
draw((xstrtr,yend)--(xendr,yend), arrow_pen, Arrows);

label("$\Gamma_1$",(xendr+0.15,yend));
label("$\Gamma_2$",(xendr+0.15,ystrt));
label("$\Gamma$",(-0.6,0.0));

real xi_labelx = 0.1;
real xi_label_y1 = ystrt + 0.6;
real xi_label_y2 = ystrt + 0.1;
label("$\Xi_1$", (xi_labelx, xi_label_y1));
label("$\Xi_2$", (xi_labelx, xi_label_y2));
