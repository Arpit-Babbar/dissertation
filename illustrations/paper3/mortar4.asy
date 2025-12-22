from "./mortar_base.asy" access *;

pen mortar2_flux_pen = red;
pen mortar1_flux_pen = blue;

label(scale(u_scal) * "$F_{\Xi_1}$", (xi_labelx, xi_label_y1+0.1), mortar1_flux_pen);
label(scale(u_scal) * "$F_{\Xi_2}$", (xi_labelx, xi_label_y2+0.1), mortar2_flux_pen);

draw(reverse((xstrtl,ystrt)--(xendl,ystrt)), arrow_pen, Arrow);
draw(reverse((xstrtl,yend)--(xendl,yend)), arrow_pen, Arrow);
draw(reverse((xendr,ystrt)--(xstrtr,ystrt)), arrow_pen, Arrow);
draw(reverse((xendr,yend)--(xstrtr,yend)), arrow_pen, Arrow);


label(scale(u_scal) * "$F_{\Gamma_1}$",(xendr+0.125,yend+0.1), blue_pen);
label(scale(u_scal) * "$F_{\Gamma_2}$",(xendr+0.125,ystrt+0.1), red_pen);
label(scale(u_scal) * "$F_\Gamma$",(xstrtl - 0.12,0.1));
