import graph;
size(350,0);

real a = 2.5;
real xmin = -0.5;

xaxis("$x$", xmin, a, red, Arrow);
yaxis("$t$", 0, 1.8, red, Arrow);

real t1 = 0.5;
real t2 = 1.0;
real t3 = 1.5;

draw((xmin,t3)--(a,t3), blue);
draw((xmin,t2)--(a,t2), blue);
draw((xmin,t1)--(a,t1), blue);

label("$t_{n+1}$", (0,t3), NW, red);
label("$t_{n}$", (0,t2), NW, red);
label("$t_{n-1}$", (0,t1), NW, red);

real x1 = 0.5;
real x2 = 1.0;
real x3 = 1.5;
real x4 = 2.0;

draw((x2,t2)--(x3,t2)--(x3,t3)--(x2,t3)--cycle, linewidth(2.0));
draw((x2,t2)--(x1,t2)--(x1,t3)--(x2,t3), linewidth(1.5));
draw((x3,t2)--(x4,t2)--(x4,t3)--(x3,t3), linewidth(1.5));
draw((x2,t2)--(x2,t1)--(x3,t1)--(x3,t2), linewidth(1.5));

label("$\mathcal{K}_i^n$", (0.5*(x2+x3),0.5*(t2+t3)), blue);
label("$\mathcal{K}_{i-1}^n$", (0.5*(x1+x2),0.5*(t2+t3)), blue);
label("$\mathcal{K}_{i+1}^n$", (0.5*(x3+x4),0.5*(t2+t3)), blue);
label("$\mathcal{K}_{i}^{n-1}$", (0.5*(x2+x3),0.5*(t1+t2)), blue);

pen dp = red + linewidth(4);
real xs = 0.02;
dot((x2+xs,t2+xs), dp);
dot(((x2+x3)/2,t2+xs), dp);
dot((x3-xs,t2+xs), dp);

dot((x2+xs,t3-xs), dp);
dot(((x2+x3)/2,t3-xs), dp);
dot((x3-xs,t3-xs), dp);

pen dp2 = blue + linewidth(4);

dot((x3+xs,t2+xs), dp2);
dot(((x3+x4)/2,t2+xs), dp2);
dot((x4-xs,t2+xs), dp2);

dot((x3+xs,t3-xs), dp2);
dot(((x3+x4)/2,t3-xs), dp2);
dot((x4-xs,t3-xs), dp2);

dot((x1+xs,t2+xs), dp2);
dot(((x1+x2)/2,t2+xs), dp2);
dot((x2-xs,t2+xs), dp2);

dot((x1+xs,t3-xs), dp2);
dot(((x1+x2)/2,t3-xs), dp2);
dot((x2-xs,t3-xs), dp2);

pen dp3 = magenta + linewidth(4);

dot((x2+xs,t1+xs), dp3);
dot(((x2+x3)/2,t1+xs), dp3);
dot((x3-xs,t1+xs), dp3);

dot((x2+xs,t2-xs), dp3);
dot(((x2+x3)/2,t2-xs), dp3);
dot((x3-xs,t2-xs), dp3);

label("Nodal basis locations: $p=1$, $k=2$", ((x2+x3)/2, t1/2), N);
/*
draw((x1,0)--(x1,1.5), black);
draw((1.5,0)--(1.5,1.5), black);

pair ps = (0.5,0);

pair p1 = ps + (0.5, 0.5);
pair p2 = ps + (0.5, 1.0);
pair p3 = ps + (1.5, 0.5);
pair p4 = ps + (1.5, 1.0);
draw(p1--p2--p4--p3--cycle, black+linewidth(2));


label("$x_{i-\frac{1}{2}}$", (x1 ,0), S, black);
label("$x_{i+\frac{1}{2}}$", (1.5,0), S, black);

label("$K_i$", (1,0), S, red);
//label("$K_i^{n+1}$", 0.5*(p2+p4), N, red);

//label("$Q_{i-\frac{1}{2}}^n$", 0.5*(p1+p2), E, red);
//label("$Q_{i+\frac{1}{2}}^{n}$", 0.5*(p3+p4), E, red);
*/
