from "./mortar_base.asy" access *;

draw((xstrtl,ystrt)--(xendl,ystrt), arrow_pen, Arrow);
draw((xstrtl,yend)--(xendl,yend), arrow_pen, Arrow);
draw((xendr,ystrt)--(xstrtr,ystrt), arrow_pen, Arrow);
draw((xendr,yend)--(xstrtr,yend), arrow_pen, Arrow);

label(scale(u_scal)*"$u_{\Gamma_1}^+, U_{\Gamma_1}^+, F_{\Gamma_1}^+$",(xendr+0.31,yend+0.15));
label(scale(u_scal)*"$u_{\Gamma_2}^+, U_{\Gamma_2}^+, F_{\Gamma_2}^+$",(xendr+0.31,ystrt+0.15));
label(scale(u_scal)*"$u_\Gamma^-, U_\Gamma^-, F_\Gamma^-$",(lsqr_end-0.24,+0.2));

real offset = 0.17;
label(scale(u_scal)*"$u_{\Xi_1}^+, U_{\Xi_1}^+, F_{\Xi_1}^+$",(xi_labelx+offset, yend - 0.1));
label(scale(u_scal)*"$u_{\Xi_2}^+, U_{\Xi_2}^+, F_{\Xi_2}^+$",(xi_labelx+offset, ystrt - 0.1));
label(scale(u_scal)*"$u_{\Xi_1}^-, U_{\Xi_1}^-, F_{\Xi_1}^-$",(-xi_labelx-offset, yend - 0.1));
label(scale(u_scal)*"$u_{\Xi_2}^-, U_{\Xi_2}^-, F_{\Xi_2}^-$",(-xi_labelx-offset, ystrt - 0.1));

pen mortar2_flux_pen = red;
pen mortar1_flux_pen = blue;

label(scale(u_scal) * "$F_{\Xi_1}$", (xi_labelx, xi_label_y1+0.1), mortar1_flux_pen);
label(scale(u_scal) * "$F_{\Xi_2}$", (xi_labelx, xi_label_y2+0.1), mortar2_flux_pen);
