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
real dx = top_right.x - bottom_left.x;
real dy = top_right.y - bottom_left.y;

draw(box(bottom_left, top_right), bdry_pen);

// Inner lines in reference square
real face = 0.0;
for(int i = 0; i < 4; ++i){
draw((-2.5, face) -- (-1.5, face), innerx_pen);
face += wg[i];
}
draw((-2.5, face) -- (-1.5, face), innerx_pen);

real face = -2.5;
for(int i = 0; i < 4; ++i){
draw((face, 0.0) -- (face, 1.0), innery_pen);
face += dy * wg[i];
}
draw((face, 0.0) -- (face, 1.0), innery_pen);

int dot_width = 15;
for(int j=0; j < 4; ++j){
for(int i=0; i < 4; ++i){
real x = -2.5 + dx*xg[i];
real y = dy*xg[j];
dot((x,y), linewidth(dot_width));
}
}
real point_scal = 4.0;
real x = -2.5 + dx*xg[2];
real y = dy*xg[2];
label(scale(point_scal)*"$\boldsymbol \xi_{(2,2)}$", (x,y) + (0.05,-0.1));
real x = -2.5 + dx*xg[0];
real y = dy*xg[0];
label(scale(point_scal)*"$\boldsymbol \xi_{\boldsymbol 0}$", (x,y) + (0.05,-0.1));
// Arrow between the two quadrilateral
pen arrow_pen = linewidth(5);
pen arrow_pen_font = linewidth(2);
pair ref_curve(real t) {
return (t,0.5);
}
draw(scale(4.5)*"$ \Theta_e(\whitehat \xi^1, \whitehat \xi^2)$", graph(ref_curve, -1.4, -0.5), arrow_pen, EndArrow(13));

// Reference normal

// plot_normal((-1.5,2/3), (1.0,0.0), bdry_pen, "$\qquad \quad \hat{ \boldsymbol n}_1 (=\hat{ \boldsymbol n}_{R,1}) $" );

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
path down = graph(Fd, 0.0,1.0); // Straight line from (0,0) to (1,1)
path up = graph(Fu, -0.5,0.5); // Straight line from (-0.5,1) to (0.5,1.0)
draw(left, bdry_pen);
draw(right, bdry_pen);
draw(down, bdry_pen);
draw(up, bdry_pen);

// Draw inner curves of quadrilateral

pair F1x(real t) {
  return Fl(-0.5*(2/3+1/6)) + (t,0.0);
}
pair F2x(real t) {
  return Fl(-0.5 * (2/3-1/6)) + (t,0.0);
}
real face = 0.0;
for(int i = 0; i < 4; ++i){
  pair Fy(real t) {
    return F0(t,face);
  }
  path curve_y = graph(Fy, -0.5,0.0);
  draw(curve_y, innery_pen);
  face += wg[i];
}
pair Fy(real t) {
  return F0(t,face);
}
path curve_y = graph(Fy, -0.5,0.0);
draw(curve_y, innery_pen);

real facex = -0.5;
for(int i = 0; i < 4; ++i){
  pair Fx(real t) {
    return Fl(facex) + (t,0.0);
  }
  path curve_x = graph(Fx, 0.0,1.0);
  draw(curve_x, innerx_pen);
  facex += wg[i]*(1/3 + 1/6);
}
pair Fx(real t) {
  return Fl(facex) + (t,0.0);
}
path curve_x = graph(Fx, 0.0,1.0);
draw(curve_x, innerx_pen);

for(int i = 0; i < 4; ++i){
  for(int j = 0; j < 4; ++j){
    real x_ = xg[i];
    real y_ = -0.5 * xg[j];
    real y = Fl(y_).y;
    real x = y_ + dx * x_;
    dot((x,y), linewidth(dot_width));
  }
}
real x_ = xg[0];
real y_ = -0.5 * xg[0];
real y = Fl(y_).y;
real x = y_ + dx * x_;
label(scale(point_scal)*"$\boldsymbol x_{e,\boldsymbol 0}$", (x,y) + (0.05,-0.1));

real x_ = xg[2];
real y_ = -0.5 * xg[2];
real y = Fl(y_).y;
real x = y_ + dx * x_;
label(scale(point_scal)*"$\boldsymbol x_{e, (2,2)}$", (x,y) + (0.08,-0.1));
