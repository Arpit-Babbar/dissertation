size(500,500);

real xmin = 0.0;
real xmax = 1.0;
real ymax = 0.05;
int nc = 5; //number of cells
int nf = nc+1; //number of faces

pen thick = linewidth(1.5);
pen bface = linewidth(2.0);
draw((xmin,0)--(xmax,0), thick);

void mark_dofs(real a, real b, int e, int n, bool to_label)
{
   pen pd = blue+linewidth(4);
   real dxx = (b-a)/(n-1);
   real xmin = a + 0.15*dxx, xmax = b  - 0.15*dxx;
   real dx = (xmax-xmin)/(n-1);
   for (int i=0; i<n; ++i)
   {
      real x = xmin + i*dx;
      dot(x, pd);
      if (to_label==true)
      {
         string si = (string)i, se = (string)e;
         label("$x_{"+se+","+si+"}$", (x,-0.02)); // Put label slightly below
      }
   }
}

void make_grid(real a, real b, int n, bool to_label)
{
   real xmin = a , xmax = b;
   real dx = xmax-xmin;
   real ii = sqrt(2.0) * 0.1 * (n*n + 1 ) % 1.0;
   real x = xmin + ii*dx;
   pen pd = red+linewidth(6);
   dot(x, pd);
   if (to_label == true)
   label("$x_{p}$", (x,-0.02)); // Put label slightly below
}

int label_index = 2;
real xf = 0;
real dx=(xmax-xmin)/(nf-1);
pair[] zf = new pair[nf];
bool to_label;
for(int i=0; i<nf; ++i){
   zf[i] = (xf,0);
   if(i==0)
      draw( (xf,-ymax)--(xf,+ymax), bface );
   else if(i==nf-1)
   {
      real xf = xmax;
      draw( (xf,-ymax)--(xf,+ymax), bface );
   }
   else
      draw( (xf,-ymax)--(xf,+ymax) );
   write("xf = ", xf);
   // write("i = ", i)//, "nf = ", nf);
    
   if (i == label_index)
     to_label = true;
   else
     to_label = false;
   if (i < nf-1)
     make_grid(xf, xf+dx, i, to_label);
   real power = 0.3;
   real coeff = (i+1)^power / (nf-3)^power;
   // write(coeff);
   xf = xf + coeff*dx;
}

// label("$\frac{1}{2}$", (xmin,-ymax), S);
// label("$M-\frac{1}{2}$", (xmax,-ymax), S);

//draw(Label("Boundary face", BeginPoint), (-0.2,-0.2)--(0.0,-0.05), Arrow);
//draw(Label("Boundary face", BeginPoint), (xmax+0.2,-0.2)--(xmax,-0.05), Arrow);

pair[] zc = new pair[nc];
for(int i=0; i<nc; ++i)
   zc[i] = 0.5*(zf[i] + zf[i+1]);



int j = label_index;
label("$p-\frac{1}{2}$", zc[j]+(-dx/2,-ymax), S);
label("$p+\frac{1}{2}$", zc[j]+(+dx/2,-ymax), S);

