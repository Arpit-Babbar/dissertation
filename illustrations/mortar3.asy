from "./mortar_base.asy" access *;

real offset = 0.17;
label(scale(u_scal)*"$u_{\Xi_1}^+, U_{\Xi_1}^+, F_{\Xi_1}^+$",(xi_labelx+offset, yend - 0.1));
label(scale(u_scal)*"$u_{\Xi_2}^+, U_{\Xi_2}^+, F_{\Xi_2}^+$",(xi_labelx+offset, ystrt - 0.1));
label(scale(u_scal)*"$u_{\Xi_1}^-, U_{\Xi_1}^-, F_{\Xi_1}^-$",(-xi_labelx-offset, yend - 0.1));
label(scale(u_scal)*"$u_{\Xi_2}^-, U_{\Xi_2}^-, F_{\Xi_2}^-$",(-xi_labelx-offset, ystrt - 0.1));

pen mortar2_flux_pen = red;
pen mortar1_flux_pen = blue;

label(scale(u_scal) * "$F_{\Xi_1}$", (xi_labelx, xi_label_y1+0.1), mortar1_flux_pen);
label(scale(u_scal) * "$F_{\Xi_2}$", (xi_labelx, xi_label_y2+0.1), mortar2_flux_pen);

