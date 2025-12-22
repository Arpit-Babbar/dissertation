texpreamble("\usepackage{amsmath}\usepackage{amsfonts}");
texpreamble("\usepackage{xcolor}");
texpreamble("\newcommand\whitehat[1]{\colorlet{temp}{.}\color{white}\hat{\color{temp}#1}\color{temp}}");
unitsize(15cm);
import graph;
import x11colors;
import texcolors;

// Some common functions

int blen = 4;
pen bdry_pen = linewidth(blen);
pen innery_pen = linewidth(blen)+red;
pen innerx_pen = linewidth(blen)+blue;

void plot_normal(pair start_point, pair normal, pen p, string label)
{
pair end_point = start_point + 0.3*normal;
draw(scale(4.0)*label, start_point -- end_point, p, EndArrow(13));
}

/* Reference square */

pair bottom_left = (-2.5, 0.0);
pair top_right = (-1.5, 1.0);



draw(box(bottom_left, top_right), bdry_pen);

// Inner lines in reference square
draw((-2.5, 1/3) -- (-1.5, 1/3), innerx_pen);
draw((-2.5, 2/3) -- (-1.5, 2/3), innerx_pen);
draw((-2.5+1/3, 0.0) -- (-2.5+1/3, 1.0), innery_pen);
draw((-2.5+2/3, 0.0) -- (-2.5+2/3, 1.0), innery_pen);

// Solution points in the reference square
real point_scal = 4.5;
pair distance = (0.1,0.1);
int dot_width = 15;
dot((-2.5+2/3,2/3), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi$", (-2.5 + 2/3, 2/3) - distance + (0.02,0.02));
dot((-2.5+2/3,1.0), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_2^R$", (-2.5 + 2/3, 1.0) - distance);
dot((-2.5+2/3,0.0), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_2^L$", (-2.5 + 2/3, 0.0) - (distance.x, -distance.y));
dot((-2.5,2/3), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_1^L$", (-2.5, 2/3) - (-distance.x, distance.y));
dot((-1.5,2/3), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_1^R$", (-1.5, 2/3) - distance);

// Arrow between the two quadrilateral
pen arrow_pen = linewidth(5);
pen arrow_pen_font = linewidth(2);
pair ref_curve(real t) {
return (t,0.5);
}
draw(scale(4.5)*"$ \Theta_e(\whitehat \xi^1, \whitehat \xi^2)$", graph(ref_curve, -1.25, -0.5), arrow_pen, EndArrow(13));

// Reference normal

plot_normal((-1.5,2/3), (1.0,0.0), bdry_pen, "$\qquad \quad \hat{ \boldsymbol n}_1 (=\hat{ \boldsymbol n}_{R,1}) $" );

/* Curved quadrilateral */
// The a in (-at^3-t) is chosen so that it hits (0,0) and (-0.5,1.0)
real x = -0.5;
real y = 1.0;
real a = (-y - x) / x^3;

pair F0(real t, real c) {
return (t+c, -a*t^3 - t);
}
pair normal_F0(real t){
return (3*t^2 + 1, 1) / sqrt(1 + (3*t^2+1)^2);
}
pair Fl(real t) {
return F0(t,0);
}
pair Fr(real t) {
return F0(t,1);
}
pair Fd(real t) {
return (t,0);
}
pair Fu(real t) {
return (t,1);
}

// Draw boundaries of quadrilateral
path left = graph(Fl, -0.5,0.0);
path right = graph(Fr, -0.5,0.0);
path down = graph(Fd, 0.0,1.0);
path up = graph(Fu, -0.5,0.5);
draw(left, bdry_pen);
draw(right, bdry_pen);
draw(down, bdry_pen);
draw(up, bdry_pen);

// Draw inner curves of quadrilateral

pair F1y(real t) {
return F0(t,1/3);
}
pair F2y(real t) {
return F0(t,2/3);
}
pair F1x(real t) {
return Fl(-0.5*(2/3+1/6)) + (t,0.0);
}
pair F2x(real t) {
return Fl(-0.5 * (2/3-1/6)) + (t,0.0);
}
path curve_y1 = graph(F1y, -0.5,0.0);
path curve_y2 = graph(F2y, -0.5,0.0);
path curve_x1 = graph(F1x, 0.0, 1.0);
path curve_x2 = graph(F2x, 0.0, 1.0);
draw(curve_y1, innery_pen);
draw(curve_y2, innery_pen);
draw(curve_x1, innerx_pen);
draw(curve_x2, innerx_pen);

plot_normal(F1x(1.0), normal_F0(1.0), bdry_pen, "$\boldsymbol{\whitehat n}_1$" ); // Put invisible hat to increase spacing

// Mark interfaces

pen interface_pen = linewidth(4.5)+purple;

// For square
draw((-1.5, 1.0) -- (-1.5, 0.0), interface_pen);
pair label_loc = (-1.5, 0.5 * (2/3 + 1)) + (0.2,0.0);
label(scale(4.5) * "$\partial \Omega_{o,i}^R$", label_loc, interface_pen);

// For curved quadrilateral
draw(right, interface_pen); // Right boundary
pair label_loc = Fr(-0.47) + (0.2,0.0);
label(scale(4.5) * "$\partial \Omega_i^R$", label_loc, interface_pen);

dot((-1.5,2/3), linewidth(dot_width)); // dot was being drawn over
