import graph;

size(300,300);

real dx = 1.0;
real dy = 0.1;

pair p1_low = (-0.1,0);
pair p2_low = (4.1*dx,0);
pen thick = linewidth(2);
draw( p1_low--p2_low, thick );
label("$t_n$", (4.3*dx, 0.0));

real height = 2.5*dx;
pair p1_high = (-0.1,height);
pair p2_high = (4.1*dx, height);
draw( p1_high--p2_high, thick );
label("$t_{n+1}$", (4.3*dx, height));

draw( (0,-dy)--(0,dy) );
label("$x_{e-\frac{1}{2}}$", (0, -2.0*dy));
draw( (dx,-dy)--(dx,dy) );
draw( (2*dx,-dy)--(2*dx,dy) );
draw( (3*dx,-dy)--(3*dx,dy) );
draw( (4*dx,-dy)--(4*dx,dy) );
label("$x_{e+\frac{1}{2}}$", (4.0*dx, -2.0*dy));

pen pd = linewidth(1)+red;
real lower_height = 0.42*height;
real upper_height = 0.58*height;
draw( (0.,0.0)--(0.0,lower_height), solid );
draw( (0.,upper_height)--(0.0,height), solid );
draw( (4.0*dx,0)--(4.0*dx,lower_height), solid );
draw( (4.0*dx,upper_height)--(4.0*dx,height), solid );
draw( (dx,0.0)--(dx,lower_height), pd, Arrow );
label("${\color{blue}F_0^e}$", (dx,0.5*height));
draw( (dx,upper_height)--(dx,height), pd );
draw( (2.0*dx,0)--(2.0*dx,lower_height), pd, Arrow );
label("${\color{blue}F_1^e}$", (2.0*dx,0.5*height));
draw( (3.0*dx,0)--(3.0*dx,lower_height), pd, Arrow );
label("${\color{blue}F_2^e}$", (3.0*dx,0.5*height));
draw( (3.0*dx,upper_height)--(3.0*dx,height), pd );
draw( (2.0*dx,upper_height)--(2.0*dx,height), pd );

real eps = 0.1;
draw( (0.7*dx,0.5*height)--(0.3*dx+eps,0.5*height), Arrow);
draw( (3.3*dx,0.5*height)--(3.7*dx-eps,0.5*height), Arrow);
label("${\color{black}F_{e-\frac{1}{2}}^+}$", (0.0,0.5*height));
label("${\color{black}F_{e+\frac{1}{2}}^-}$", (4.0*dx,0.5*height));


