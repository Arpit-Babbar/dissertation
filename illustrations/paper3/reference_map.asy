texpreamble("\usepackage{amsmath}\usepackage{amsfonts}");
texpreamble("\usepackage{xcolor}");
texpreamble("\newcommand\whitehat[1]{\colorlet{temp}{.}\color{white}\hat{\color{temp}#1}\color{temp}}");
unitsize(15cm);
import graph;
import x11colors;
import texcolors;

// Some common functions

real[] xg={0.0, 0.27639320225002106, 0.7236067977499789, 1.0};
real[] wg={0.08333333333333333, 0.41666666666666663, 0.41666666666666663, 0.08333333333333333};
real blen = 4.0;
real end_arrow_size = 13.0;
pen bdry_pen = linewidth(blen);
pen innery_pen = linewidth(blen)+red;
pen innerx_pen = linewidth(blen)+blue;
real point_scal = 4.0;

real xmin = -3.0;
real xmax = -2.0;

void plot_normal(pair start_point, pair normal, pen p, string label)
{
pair end_point = start_point + 0.3*normal;
draw(scale(point_scal)*label, start_point -- end_point, p, EndArrow(end_arrow_size));
}

/* Reference square */

pair bottom_left = (xmin, 0.0);
pair top_right = (xmax, 1.0);
real dx = top_right.x - bottom_left.x;
real dy = top_right.y - bottom_left.y;



draw(box(bottom_left, top_right), bdry_pen);

// Inner lines in reference square
draw((xmin, xg[1]) -- (xmax, xg[1]), innerx_pen);
draw((xmin, xg[2]) -- (xmax, xg[2]), innerx_pen);
draw((xmin+xg[1], 0.0) -- (xmin+xg[1], 1.0), innery_pen);
draw((xmin+xg[2], 0.0) -- (xmin+xg[2], 1.0), innery_pen);

// Solution points in the reference square
pair distance = (0.1,0.1);
int dot_width = 15;



real x = xmin + dx*xg[2];
real y = dy*xg[2];
dot((x,y), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi$", (x, y) - distance + (0.02,0.02));

dot((x,1.0), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_2^R$", (x, 1.0) - distance);
dot((x,0.0), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_2^L$", (x, 0.0) - (distance.x, -distance.y));
dot((xmin,y), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_1^L$", (xmin, y) - (-distance.x, distance.y));
dot((xmax,y), linewidth(dot_width));
label(scale(point_scal)*"$\boldsymbol \xi_1^R$", (xmax, y) - distance);

// Arrow between the two quadrilateral
pen arrow_pen = linewidth(blen);
pen arrow_pen_font = linewidth(blen);
pair ref_curve(real t) {
return (t,0.5);
}
draw(scale(point_scal)*"$ \Theta_e(\whitehat \xi^1, \whitehat \xi^2)$", graph(ref_curve, -1.6, -0.8), arrow_pen, EndArrow(end_arrow_size));

// Reference normal

plot_normal((xmax,xg[2]), (1.0,0.0), bdry_pen, "$\quad \hat{ \boldsymbol n}_{R,1} $" );
plot_normal((xmin,xg[2]), (-1.0,0.0), bdry_pen, "$\hat{ \boldsymbol n}_{L,1} $" );

plot_normal((xmin + dx*xg[2],1.0), (0.0,1.0), bdry_pen, "$\hat{ \boldsymbol n}_{R,2} $" );
plot_normal((xmin + dx*xg[2],0.0), (0.0,-1.0), bdry_pen, "$\hat{ \boldsymbol n}_{L,2} $" );

/* Curved quadrilateral */
// The a in (-at^3-t) is chosen so that it hits (0,0) and (-0.5,1.0)
real power = 3.0;
real x = -0.5;
real y = 1.0;
real a = (-y - x) / abs(x)^power * sgn(x);

pair F0(real t, real c) {
x = abs(t)^power * sgn(t);
return (t+c, -a*x - t);
}
pair normal_F0(real t){
x = abs(t)^(power-1)*sgn(t);
return (power*a*x + 1, 1) / sqrt(1 + (power*a*x+1)^2);
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
return F0(t,xg[1]);
}
pair F2y(real t) {
return F0(t,xg[2]);
}
pair F1x(real t) {
return Fl(-0.5*(xg[2] + 1/10)) + (t,0.0);
}
pair F2x(real t) {
return Fl(-0.5 * xg[1]) + (t,0.0);
}
path curve_y1 = graph(F1y, -0.5,0.0);
path curve_y2 = graph(F2y, -0.5,0.0);
path curve_x1 = graph(F1x, 0.0, 1.0);
path curve_x2 = graph(F2x, 0.0, 1.0);
draw(curve_y1, innery_pen);
draw(curve_y2, innery_pen);
draw(curve_x1, innerx_pen);
draw(curve_x2, innerx_pen);

plot_normal(F1x(1.0), normal_F0(1.0), bdry_pen, "\hspace{1 mm}  $\boldsymbol{\whitehat n}_{R, 1}$" ); // Put invisible hat to increase spacing
pair n = normal_F0(-1.0);
plot_normal(F1x(0.0), (n.x, -n.y), bdry_pen, "$\boldsymbol{\whitehat n}_{L, 1}$" ); // Put invisible hat to increase spacing


plot_normal(F2y(-0.5), (0.0,1.0), bdry_pen, "$\boldsymbol{\whitehat n}_{R,2}$" ); // Put invisible hat to increase spacing
plot_normal(F2y(0.0), (0.0,-1.0), bdry_pen, "$\boldsymbol{n}_{L,2}$" ); // Put invisible hat to increase spacing

// Mark interfaces

pen interface_pen = linewidth(4.5)+purple;

// For square
draw((xmax, 1.0) -- (xmax, 0.0), interface_pen);
pair label_loc = (xmax, 0.5 * (2/3 + 1)) + (0.2,0.0);
label(scale(point_scal) * "$\partial \Omega_{o,i}^R$", label_loc, interface_pen);

// For curved quadrilateral
draw(right, interface_pen); // Right boundary
pair label_loc = Fr(-0.47) + (0.2,0.0);
label(scale(point_scal) * "$\partial \Omega_i^R$", label_loc, interface_pen);

dot((xmax,xg[2]), linewidth(dot_width)); // dot was being drawn over
