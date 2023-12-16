import graph;

size(200,200);

real dx = 1.0;
real dy = 0.1;

pair p1 = (0,0);
pair p2 = (dx,0);
pair p3 = (2*dx,0);
pair p4 = (3*dx,0);

pen thick = linewidth(2);
draw(p1--p4, thick);

draw( (0,-dy)--(0,dy) );
draw( (dx,-dy)--(dx,dy) );
draw( (2*dx,-dy)--(2*dx,dy) );
draw( (3*dx,-dy)--(3*dx,dy) );

real dot_height = 1.4;

draw( (0.,0.0)--(0.0,dot_height), dotted );
draw( (dx,0.0)--(dx,dot_height), dotted );
draw( (2.0*dx,0)--(2.0*dx,dot_height), dotted );
draw( (3.0*dx,0)--(3.0*dx,dot_height), dotted );

label("$\Omega_{e-1}$",0.5*(p1+p2), S);
label("$\Omega_{e}$",0.5*(p2+p3), S);
label("$\Omega_{e+1}$",0.5*(p3+p4), S);

real u1(real x)
{
   return 1.0 + 0.5*x - 0.1*x*x;
}

real u2(real x)
{
   return 1.2 - 0.1*x*x;
}

real u3(real x)
{
   return 1.4 - 0.6*x + 0.1*x*x;
}

pen gp = linewidth(2)+red;
draw(graph(u1,0,dx), gp);
draw(graph(u2,dx,2*dx), gp);
draw(graph(u3,2*dx,3*dx), gp);

pen pd = linewidth(5) + magenta;
int n = 3; // number of solution points
for(int i=0; i<n; ++i)
{
   real x = 0.5*dx/n + i*dx/n;
   dot((x,0),pd);
   dot((x,u1(x)), pd+blue);

   x = x + dx;
   dot((x,0),pd);
   dot((x,u2(x)), pd+blue);

   x = x + dx;
   dot((x,0),pd);
   dot((x,u3(x)), pd+blue);
}

label("${\color{red}u_h}$", (1.5,1.65));
