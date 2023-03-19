import graph;
size(500,0);
texpreamble("\usepackage{amsmath}\usepackage{amsfonts}");

real a = 1;

real xmin = 0.0;
real xmax = 40.0;

real dx = xmax - xmin;

real xi = 0.38 * xmax;

real m1 = (xmax - xi) / (xmax - xmin);
real m2 = 1.0 - m1;

real right_centre = 0.5 * (xmax + xi);
real left_centre = 0.5 * (xmin + xi);

real right_rarefaction(real x)
{
   return 1.0*(x-right_centre)/a;
}

real right_contact(real x)
{
   return -7.0*(x-right_centre)/a;
}

real right_shock(real x)
{
	return -3.0(x-right_centre)/a;
}

real left_rarefaction(real x)
{
   return 1.1*(x-left_centre)/a;
}

real left_contact(real x)
{
   return -9.0*(x-left_centre)/a;
}

real left_shock(real x)
{
	return -5.0(x-left_centre)/a;
}

pen axis = linewidth(0.5) + linecap(2);
draw( (xmin,0)--(xmax,0), axis);

label("$\boldsymbol {u}_i^{*,*}$", (xi+5.5,5));
label("$\boldsymbol {u}_i^{*,*}$", (xi-1.5,5));
label("$\boldsymbol {u}_i^{n,-}$", (xmax-4.0,5));
label("$\boldsymbol {u}_i^{n,+}$", (xmin+3.5,5));

real T = 15.0;
real a1 = 0.5;
real a2 = 0.9;
int n = 6;
real da = (a2-a1)/(n-1);

for(a=a1; a<=a2; a+=da)
{
   draw(graph(right_rarefaction,right_centre,right_centre+a*0.5*T));
}

draw( Label("$x_{i+1/4}$", BeginPoint), graph(right_contact,right_centre,right_centre-0.07*T),dashed);
draw(graph(right_shock,right_centre,right_centre-0.16*T));


for(a=a1; a<=a2; a+=da)
{
   draw(graph(left_rarefaction,left_centre,left_centre+a*0.5*T));
}

draw(Label("$x_{i-1/4}$", BeginPoint), graph(left_contact,left_centre,left_centre-0.06*T),dashed);
draw(graph(left_shock,left_centre,left_centre-0.11*T));

draw((xmin,-1.5)--(xi,-1.5), Arrows );
label("$\mu^+ \Delta x_i$", (0.5*(xmin+xi), -2.5));

draw((xi,-1.5)--(xmax,-1.5), Arrows );
label("$\mu^- \Delta x_i$", (0.5*(xmax+xi), -2.5));

real ceiling_height = 0.8;

draw( Label("$\frac{\Delta t}{2}$",EndPoint), (xmin,ceiling_height*T)--(xmax,ceiling_height*T), axis);
draw( Label("$x_i$",BeginPoint), (xi,0)--(xi,ceiling_height*T), axis+dashed);
draw( Label("$x_{i-1/2}$",BeginPoint), ( xmin,0)--( xmin,ceiling_height*T), axis+dashed);
draw( Label("$x_{i+1/2}$",BeginPoint), ( xmax,0)--( xmax,ceiling_height*T), axis+dashed);
