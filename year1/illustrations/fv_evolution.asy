import graph;
size(500,0);
texpreamble("\usepackage{amsmath}\usepackage{amsfonts}\usepackage{xcolor}\newcommand{\cred}[1]{\textcolor{red}{#1}}");

defaultpen(fontsize(15pt));

real a = 1;

real xmin = 0.0;
real xmax = 40.0;

real dx = xmax - xmin;

real xi = 0.38 * xmax;

real m1 = (xmax - xi) / (xmax - xmin);
real m2 = 1.0 - m1;


pen axis = linewidth(0.5) + linecap(2);
draw( (xmin-0.27*dx,0)--(xmax+0.5*dx,0), axis, Arrow);

pen pd = dashed;

real T = 30.0;

real ceiling_height = 0.8;

draw( (xmin + 0.5*m1*dx, 0.0)--(xmin + 0.5*m1*dx, ceiling_height*T), pd );
label("$\frac{\cred{\mu^-}}{2}\Delta x_i$", (xmin + 0.25*m1*dx, 0.1*T));
label("$\boldsymbol u_i^{n+\frac{1}{2},-}$", (xmin + 0.25*m1*dx, 0.3*T));
label("$\boldsymbol u_{i-1}^{n+\frac{1}{2},+}$", (xmin - 0.18*m1*dx, 0.3*T));
draw( (xmin + 0.25*m1*dx, 0.38*T)--(xmin + 0.25*m1*dx, 0.6*T), Arrow );
label( "$\boldsymbol u_i^{n+1,-}$", (xmin + 0.25*m1*dx, 0.65*T));

draw( (xmax - 0.5*m2*dx, 0.0)--(xmax - 0.5*m2*dx, ceiling_height*T), pd );
label("$\frac{\cred{\mu^+}}{2}\Delta x_i$", (xmax - 0.25*m2*dx, 0.1*T));
label("$\boldsymbol u_i^{n+\frac{1}{2},+}$", (xmax - 0.25*m2*dx, 0.3*T));
label("$\boldsymbol u_{i+1}^{n+\frac{1}{2},-}$", (xmax + 0.3*m2*dx, 0.3*T));
draw( (xmax - 0.25*m2*dx, 0.38*T)--(xmax - 0.25*m2*dx, 0.6*T), Arrow );
label( "$\boldsymbol u_i^{n+1,+}$", (xmax - 0.25*m2*dx, 0.65*T));

label("$\frac{\Delta x_i}{2}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), 0.1*T) );
label("$\boldsymbol u_i^{n+\frac{1}{2},*}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), 0.3*T) );
draw( (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), 0.38*T)--(0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), 0.6*T), Arrow );
label( "$\boldsymbol u_i^{n+1,*}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ), 0.65*T));

label( "$\boldsymbol u_i^{n+1}$", (0.5*(xmin + 0.5*m1*dx + xmax - 0.5*m2*dx ) + 1.0, 0.9*T));

draw( (xmin-0.27*dx,ceiling_height*T)--(xmax+0.5*dx,ceiling_height*T), axis);
// draw( Label("$x_i$",BeginPoint), (xi,0)--(xi,ceiling_height*T), axis+dashed);
draw( (xmin-0.25*dx,0)--( xmin-0.25*dx,(ceiling_height+0.1)*T), axis, Arrow);
label("$t^{n+1}$",  ( xmin-0.3*dx,(ceiling_height+0.03)*T));
draw(( xmin-0.25*dx,-1.0)--( xmin-0.25*dx,(ceiling_height+0.1)*T), axis);
label("$t^n$",  ( xmin-0.3*dx,0.02*T));

draw( Label("$x_{i-1/2}$",BeginPoint), ( xmin,-0.6)--( xmin,(ceiling_height+0.1)*T), axis);
draw( Label("$x_{i+1/2}$",BeginPoint), ( xmax,-0.6)--( xmax,(ceiling_height+0.1)*T), axis);
