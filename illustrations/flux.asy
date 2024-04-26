import graph;

size(200,200);

real dx = 1.0;
real dy = 0.1;

pair p1 = (0,0);
pair p2 = (dx,0);
pair p3 = (2*dx,0);
pair p4 = (3*dx,0);

pen thick = linewidth(2);

pen dotted=linetype(new real[] {0,4});
draw(p1--p4, thick);


draw( (0,-dy)--(0,dy) );
draw( (dx,-dy)--(dx,dy) );
draw( (2*dx,-dy)--(2*dx,dy) );
draw( (3*dx,-dy)--(3*dx,dy) );

draw( (0.,0.0)--(0.0,1.25), dotted );
draw( (dx,0.0)--(dx,1.25), dotted );
draw( (2.0*dx,0)--(2.0*dx,1.25), dotted );
draw( (3.0*dx,0)--(3.0*dx,1.25), dotted );


label("$\Omega_{e-1}$",0.5*(p1+p2), S);
label("$\Omega_{e}$",0.5*(p2+p3), S);
label("$\Omega_{e+1}$",0.5*(p3+p4), S);

real xi(real a, real b, real x) // Reference map from interval [a,b] to [0,1]
{
   return (x-a)/(b-a);
}

real gl(real x) // Left g2 corrector function in reference interval [0,1]
{
   return x*x - 2.0*x + 1.0;
}

real gr(real x)  // right g2 correct function in reference interval [0,1]
{
   return x*x;
}


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

real flux(real u)
{
   return 1.0 - 0.2*u*u + 0.5*sin(2.0*pi*u);
}

real f1(real x)
{
   return flux(u1(x));
}

real f2(real x)
{
   return flux(u2(x));
}

real f3(real x)
{
   return flux(u3(x));
}


// Corrected continuous flux function
real cts_flux(real x)
{
   // real dx = 1.0; // hack fix
   real fnph; // f_{n+1/2}
   real fnmh; // f_{n-1/2}
   real xi_x; // reference co-ordinate value \xi corresponding to x
   if (x <= dx)
   {
      fnmh = 0.9 * f1(0.0); // Push left interface value slightly below
      fnph = 0.5 * ( f1(dx)+f2(dx) );
      xi_x = xi(0,dx,x);
      return gl(xi_x)*(fnmh-f1(0.0))+f1(x)
              + gr(xi_x)*(fnph-f1(dx));
   }
   else if ( (x >= dx) && (x <= 2.0*dx) )
   {
      fnmh = 0.5 * ( f1(dx)+f2(dx) );
      fnph = 0.5 * ( f2(2.0*dx) + f3(2.0*dx));
      xi_x = xi(dx,2.0*dx,x);
      return gl(xi_x)*(fnmh-f2(dx)) + flux(u2(x))
             + gr(xi_x)*(fnph-f2(2.0*dx));
   }
   else
   {
      fnmh = 0.5 * ( f2(2.0*dx)+f3(2.0*dx) );
      fnph = 1.08 * f3(3.0*dx); // Push right interface value slightly above
      xi_x = xi(2.0*dx,3.0*dx,x);
      return gl(xi_x)*(fnmh-f3(2.0*dx))+flux(u3(x))
             + gr(xi_x)*(fnph-f3(3.0*dx));
   }
}

pen gp_dis_cts = linewidth(2)+red;
draw(graph(f1,0,dx), gp_dis_cts);
draw(graph(f2,dx,2*dx), gp_dis_cts);
draw(graph(f3,2*dx,3*dx), gp_dis_cts);

pen gp_cts = linewidth(2)+black;
draw(graph(cts_flux,0,3.0*dx),gp_cts);


pen pd = linewidth(5)+magenta;
int n = 3; // number of solution points
for(int i=0; i<n; ++i)
{
   real x = 0.5*dx/n + i*dx/n;
   dot((x,0),pd);
   dot((x,f1(x)), pd+blue);

   x = x + dx;
   dot((x,0),pd);
   dot((x,f2(x)), pd+blue);

   x = x + dx;
   dot((x,0),pd);
   dot((x,f3(x)), pd+blue);
}

label("${\color{red}f_h^\delta}, {\color{black}f_h}$", (1.5,1.5));
