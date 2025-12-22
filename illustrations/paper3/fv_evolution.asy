import graph;
size(500,0);
texpreamble("\usepackage{amsmath}\usepackage{amsfonts}");

real a = 1;

real xmin = 0.0;
real xmax = 40.0;

real dx = xmax - xmin;

real xi = 0.45 * xmax;

real m1 = (xmax - xi) / (xmax - xmin);
real m2 = 1.0 - m1;


pen axis = linewidth(0.5) + linecap(2);
draw( (xmin-0.27*dx,0)--(xmax+0.5*dx,0), axis, Arrow);

pen pd = dashed;

real T = 30.0;

real ceiling_height = 0.8;

real tn_height = 0.02*T;
real tnp1_height = (ceiling_height+0.03)*T;

// real nph_height = 0.1*T;
real mid_height = 0.5*(tn_height + tnp1_height);
real nph_height = mid_height;
// real evol_arrow_start_height = 0.38*T;
real evol_arrow_start_height = 0.48*T;
// real evol_arrow_end_height = 0.6*T;
real evol_arrow_end_height = 0.7*T;

// real np1_psm_height = 0.65*T;
real np1_psm_height = 0.75*T;

draw( (xmin + 0.5*m1*dx, 0.0)--(xmin + 0.5*m1*dx, ceiling_height*T), pd );
label("$\frac{\mu_-}{2}\Delta x_j$", (xmin + 0.25*m1*dx, 0.1*T));
draw( (xmin + 0.35*m1*dx,0.1*T)--(xmin + 0.48*m1*dx,0.1*T), axis, Arrow);
draw( (xmin + 0.12*m1*dx,0.1*T)--(xmin + 0.02*m1*dx,0.1*T), axis, Arrow);
label("$ u_j^{n+\frac{1}{2},-}$", (xmin + 0.25*m1*dx, nph_height));
label("$ u_{j-1}^{n+\frac{1}{2},+}$", (xmin - 0.18*m1*dx, nph_height));
draw( (xmin + 0.25*m1*dx, evol_arrow_start_height)--(xmin + 0.25*m1*dx, evol_arrow_end_height), Arrow );
label( "$u_j^{n+1,-}$", (xmin + 0.25*m1*dx, np1_psm_height));

draw( (xmax - 0.5*m2*dx, 0.0)--(xmax - 0.5*m2*dx, ceiling_height*T), pd );
label("$\frac{\mu_+}{2}\Delta x_j$", (xmax - 0.25*m2*dx, 0.1*T));
draw( (xmax - 0.39*m2*dx,0.1*T)--(xmax - 0.49*m2*dx,0.1*T), axis, Arrow);
draw( (xmax - 0.11*m2*dx, 0.1*T)--(xmax- 0.01*m2*dx,0.1*T), axis, Arrow);

label("$u_j^{n+\frac{1}{2},+}$", (xmax - 0.25*m2*dx, nph_height));
label("$u_{j+1}^{n+\frac{1}{2},-}$", (xmax + 0.25*m2*dx, nph_height));
draw( (xmax - 0.25*m2*dx, evol_arrow_start_height)--(xmax - 0.25*m2*dx, evol_arrow_end_height), Arrow );
label( "$u_j^{n+1,+}$", (xmax - 0.25*m2*dx, np1_psm_height));

label("$\frac{1}{2} \Delta x_j$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), 0.1*T) );
// HERE
draw( (0.5*(xmin + 0.3*m1*dx + xmax - 0.5*m2*dx ), 0.1*T)--(xmin + 0.52*m1*dx,0.1*T), axis, Arrow);
draw( (0.5*(xmin + 0.7*m1*dx + xmax - 0.5*m2*dx ),0.1*T)--(xmax - 0.52*m2*dx,0.1*T), axis, Arrow);
label("$u_j^{n+\frac{1}{2},*}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), nph_height) );
draw( (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), evol_arrow_start_height)--(0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), evol_arrow_end_height), Arrow );
label( "$u_j^{n+1,*}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), np1_psm_height));

label( "$u_j^{n+1}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ) + 1.0, 0.9*T));

draw( (xmin-0.27*dx,ceiling_height*T)--(xmax+0.5*dx,ceiling_height*T), axis);
// draw( Label("$x_i$",BeginPoint), (xi,0)--(xi,ceiling_height*T), axis+dashed);
draw( (xmin-0.25*dx,0)--( xmin-0.25*dx,(ceiling_height+0.1)*T), axis, Arrow);
label("$t^{n+1}$",  ( xmin-0.3*dx,tnp1_height));
draw(( xmin-0.25*dx,-1.0)--( xmin-0.25*dx,(ceiling_height+0.1)*T), axis);
label("$t^n$",  ( xmin-0.3*dx,tn_height));

draw( Label("$x_{j-1/2}$",BeginPoint), ( xmin,-0.6)--( xmin,(ceiling_height+0.1)*T), axis);
draw( Label("$x_{j+1/2}$",BeginPoint), ( xmax,-0.6)--( xmax,(ceiling_height+0.1)*T), axis);

