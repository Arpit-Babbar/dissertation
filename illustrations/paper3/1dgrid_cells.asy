size(500,500);

real xmin = 0.0;
real xmax = 1.0;
real ymax = 0.05;
int nc = 1;    //number of cells
int nf = nc+1; //number of faces

pen thick = linewidth(1.5);
pen bface = linewidth(2.0);
draw((xmin,0)--(xmax,0), thick);

// Makes an 'almost equispaced' grid between two points a,b
// of size n
void make_grid(real a, real b, int n, bool to_label)
{
   real xmin = a , xmax = b;
   real dx = xmax-xmin;
   real x = xmin + 0.3*dx;
   dot(x);
   label("$x_{i}$", (x,-0.02)); // Put label slightly below
}

real xf = 0;
real dx=(xmax-xmin)/(nf-1);
pair[] zf = new pair[nf];
for(int i=0; i<nf; ++i){
   zf[i] = (xf,0);
   draw( (xf,-ymax)--(xf,+ymax) );
   int ndofs = 2;
   if (i<nf-1) // Not the last cell
   {
      if (i==0) // middle point
         make_grid(xf,xf+dx,ndofs, true);
      else
         make_grid(xf,xf+dx,ndofs, false);
   }
   xf = xf + dx;
}

// label("$\frac{1}{2}$", (xmin,-ymax), S);
// label("$M-\frac{1}{2}$", (xmax,-ymax), S);
//draw(Label("Boundary face", BeginPoint), (-0.2,-0.2)--(0.0,-0.05), Arrow);
//draw(Label("Boundary face", BeginPoint), (xmax+0.2,-0.2)--(xmax,-0.05), Arrow);

pair[] zc = new pair[nc];
for(int i=0; i<nc; ++i)
   zc[i] = 0.5*(zf[i] + zf[i+1]);

int j = 0; // Centre most cell
label("$i-\frac{1}{2}$", zc[j]+(-dx/2,-ymax), S);
label("$i+\frac{1}{2}$", zc[j]+(+dx/2,-ymax), S);
label("$I_e$", zc[j]+(0,ymax), N);
// draw(zc[j]+(-dx/2,+ymax)--zc[j]+(+dx/2,+ymax), Arrows );

