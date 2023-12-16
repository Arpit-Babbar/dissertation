<TeXmacs|2.1>

<project|main.tm>

<style|<tuple|tmbook|old-lengths|preview-ref|comment|style_common>>

<\body>
  <chapter|Lax-Wendroff Flux Reconstruction><label|ch:lwfr>

  <section|Lax-Wendroff FR scheme><label|sec:lw>\ 

  The Lax-Wendroff scheme combines the spatial and temporal discretization
  into a single step. The starting point is a Taylor expansion in time
  following the Cauchy-Kowalewski procedure where the PDE is used to rewrite
  some of the time derivatives in the Taylor expansion as spatial
  derivatives. Using Taylor expansion in time around <math|t=t<rsub|n>>, we
  can write the solution at the next time level as

  <\equation*>
    <value|uu><rsup|n+1>=<value|uu><rsup|n>+<big|sum><rsub|m=1><rsup|N+1><frac|\<Delta\>t<rsup|m>|m!>*\<partial\><rsub|t><rsup|m>*<value|uu><rsup|n>+O<around|(|\<Delta\>*t<rsup|N+2>|)>
  </equation*>

  Since the spatial error is expected to be of
  <math|O<around|(|\<Delta\>x<rsup|N+1>|)>>, we retain terms up to
  <math|O<around|(|\<Delta\>t<rsup|N+1>|)>> in the Taylor expansion, so that
  the over all accuracy is of order <math|N+1> both space and time. Using the
  PDE, <math|\<partial\><rsub|t>*<value|uu>=-\<partial\><rsub|x>*f>, we
  re-write time derivatives of the solution in terms of spatial derivatives
  of the flux

  <\equation*>
    \<partial\><rsub|t><rsup|m>*<value|uu>=-\<partial\><rsub|t><rsup|m-1>*\<partial\><rsub|x>*<value|pf>=-<around|(|\<partial\><rsub|t><rsup|m-1>*<value|pf>|)><rsub|x>,<space|2em>m=1,2,\<ldots\>
  </equation*>

  so that

  <\eqnarray>
    <tformat|<table|<row|<cell|<value|uu><rsup|n+1>>|<cell|=>|<cell|<value|uu><rsup|n>-<big|sum><rsub|m=1><rsup|N+1><frac|\<Delta\>*t<rsup|m>|m!>*<around|(|\<partial\><rsub|t><rsup|m-1>*f|)><rsub|x>+O<around|(|\<Delta\>t<rsup|N+2>|)>>>|<row|<cell|>|<cell|=>|<cell|<value|uu><rsup|n>-\<Delta\>t*<around*|[|<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>*t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*f|]><rsub|x>+O<around|(|\<Delta\>t<rsup|N+2>|)>>>|<row|<cell|>|<cell|=>|<cell|<value|uu><rsup|n>-\<Delta\>t*<pd|<value|F>|x><around|(|<value|uu><rsup|n>|)>+O<around|(|\<Delta\>t<rsup|N+2>|)><eq-number><label|eq:lwtay>>>>>
  </eqnarray>

  where

  <\equation>
    <label|eq:tavgflux><value|F><around|(|<value|uu>|)>=<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>*t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*<value|pf><around|(|<value|uu>|)>=<value|pf><around|(|<value|uu>|)>+<frac|\<Delta\>*t|2>*\<partial\><rsub|t>*<value|pf><around|(|<value|uu>|)>+\<ldots\>+<frac|\<Delta\>*t<rsup|N>|<around|(|N+1|)>!>*\<partial\><rsub|t><rsup|N>*<value|pf><around|(|<value|uu>|)>
  </equation>

  Note that <math|<value|F><around|(|<clr|r*e*d|<value|uu><rsup|n>>|)>> is an
  approximation to the time average fl<value|uu>x in the interval
  <math|<around|[|t<rsub|n>,t<rsub|n+1>|]>> since it can be written as

  <\equation*>
    \;
  </equation*>

  <\equation>
    <value|F><around|(|<clr|r*e*d|<value|uu><rsup|n>>|)>=<frac|1|\<Delta\>t>*<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><around*|[|<value|pf><around|(|<clr|r*e*d|<value|uu><rsup|n>>|)>+<around|(|t-t<rsub|n>|)>*\<partial\><rsub|t>*<value|pf><around|(|<clr|r*e*d|<value|uu><rsup|n>>|)>+\<ldots\>+<frac|<around|(|t-t<rsub|n>|)><rsup|N>|N!>*\<partial\><rsub|t><rsup|N>*<value|pf><around|(|<clr|r*e*d|<value|uu><rsup|n>>|)>|]>*<ud>t<label|eq:tvgproperty>
  </equation>

  where the quantity inside the square brackets is the truncated Taylor
  expansion of the flux <math|f> in time. Equation<nbsp><eqref|eq:lwtay> is
  the basis for the construction of the Lax-Wendroff method. Following the
  ideas in the RKFR scheme, we will first reconstruct the time average flux
  <math|<value|F>> inside each element by a continuous polynomial
  <math|<value|F><rsub|h><around|(|\<xi\>|)>>. Then truncating
  equation<nbsp><eqref|eq:lwtay>, the solution at the nodes is updated by a
  collocation scheme as follows

  <\equation>
    <value|uep><rsup|n+1>=<value|uep><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<od|<value|F><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>|)>,<space|2em>0\<le\>p\<le\>N<label|eq:uplwfr>
  </equation>

  This is the single step Lax-Wendroff update scheme for any order of
  accuracy. The major work in the above scheme is involved in the
  construction of the time average flux approximation
  <math|<value|F><rsub|h>> which is explained in subsequent sections.

  <subsection|Conservation property>

  The computation of correct weak solutions for non-linear conservation laws
  in the presence of discontinuous solutions requires the use of conservative
  numerical schemes. The Lax-Wendroff theorem shows that if a consistent,
  conservative method converges, then the limit is a weak solution. The
  method<nbsp><eqref|eq:uplwfr> is also conservative though it is not
  directly apparent; to see this multiply<nbsp><eqref|eq:uplwfr> by the
  quadrature weights associated with the solution points and sum over all the
  points in the <math|e>'th element,

  <\equation*>
    <big|sum><rsub|p=0><rsup|N>w<rsub|p>*<value|uep><rsup|n+1>=<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<value|uep><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<pd|<value|F><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>|)>
  </equation*>

  The correction functions are of degree <math|N+1> and the flux
  <math|<value|F><rsub|h>> is a polynomial of degree <math|\<le\>N+1>. If the
  quadrature is exact for polynomials of degree atleast <math|N>, which is
  true for both GLL and GL points, then the quadrature is exact for the flux
  derivative term and we can write it as an integral, which leads to

  <\equation>
    <big|int><rsub|\<Omega\><rsub|e>><value|uu><rsub|h><rsup|n+1>*<ud>x=<big|int><rsub|\<Omega\><rsub|e>><value|uu><rsub|h><rsup|n>*<ud>x-\<Delta\>t*<around|[|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|]><label|eq:upmean>
  </equation>

  This shows that the total mass inside the cell changes only due to the
  boundary fluxes and the scheme is hence conservative.

  <subsection|Reconstruction of the time average
  flux<label|sec:reconstruction>>

  To complete the description of the LW method<nbsp><eqref|eq:uplwfr>, we
  must explain the method for the computation of the time average flux
  <math|<value|F><rsub|h>>. The flux reconstruction
  <math|<value|F><rsub|h><around|(|\<xi\>|)>> for a time interval
  <math|<around|[|t<rsub|n>,t<rsub|n+1>|]>> is performed in three steps.

  <paragraph|Step 1.>Use the approximate Lax-Wendroff procedure to compute
  the time average flux <math|<value|F>> at all the solution points

  <\equation*>
    <value|F><rsub|p><rsup|e>\<approx\><value|F><around|(|\<xi\><rsub|p>|)>,<space|2em>0\<le\>p\<le\>N
  </equation*>

  The approximate LW procedure is explained in a subsequent section.

  <paragraph|Step 2.>Build a local approximation of the time average flux
  inside each element by interpolating at the solution points

  <\equation*>
    <value|F><rsub|h><rsup|\<delta\>><around|(|\<xi\>|)>=<big|sum><rsub|j=0><rsup|N><value|F><rsub|j><rsup|e>*\<ell\><rsub|p><around|(|\<xi\>|)>
  </equation*>

  which however may not be continuous across the elements. This is
  illustrated in Figure<nbsp>(<reference|fig:solflux1>b).

  <paragraph|Step 3.> Modify the flux approximation
  <math|<value|F><rsub|h><rsup|\<delta\>><around|(|\<xi\>|)>> so that it
  becomes continuous across the elements. Let <math|<value|F><rsub|<eph>>> be
  some numerical flux function that approximates the flux <math|<value|F>> at
  <math|x=x<rsub|<eph>>>. Then the continuous flux approximation is given by

  <\equation*>
    <value|F><rsub|h><around|(|\<xi\>|)>=<around*|[|<value|F><rsub|<emh>>-<value|F><rsub|h><rsup|\<delta\>><around|(|0|)>|]>*g<rsub|L><around|(|\<xi\>|)>+<value|F><rsub|h><rsup|\<delta\>><around|(|\<xi\>|)>+<around*|[|<value|F><rsub|<eph>>-<value|F><rsub|h><rsup|\<delta\>><around|(|1|)>|]>*g<rsub|R><around|(|\<xi\>|)>
  </equation*>

  which is illustrated in Figure<nbsp><reference|fig:solflux1>b. The
  correction functions <math|g<rsub|L>,g<rsub|R>> are chosen from the FR
  literature.

  <paragraph|Step 4.>The derivatives of the continuous flux approximation at
  the solution points can be obtained as

  <\equation*>
    <myvector|\<partial\><rsub|\<xi\>>F<rsub|h>>=<around*|[|<value|F><rsub|<emh>>-<vV><rsub|L><rsup|\<top\>><vF>|]><vb><rsub|L>+<vD><vF>+<around*|[|<value|F><rsub|<eph>>-<vV><rsub|R><rsup|\<top\>><vF>|]><vb><rsub|R>,<space|2em><vb><rsub|L>=<around*|[|<tabular*|<tformat|<table|<row|<cell|g<rsub|L><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|g<rsub|L><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>,<space|2em><vb><rsub|R>=<around*|[|<tabular*|<tformat|<table|<row|<cell|g<rsub|R><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|g<rsub|R><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>
  </equation*>

  which can also be written as

  <\equation>
    <label|eq:fder><myvector|\<partial\><rsub|\<xi\>>F<rsub|h>>=<value|F><rsub|<emh>>*<vb><rsub|L>+<vD><rsub|1>*<vF>+<value|F><rsub|<eph>>*<vb><rsub|R>,<space|2em><vD><rsub|1>=<vD>-<vb><rsub|L>*<vV><rsub|L><rsup|\<top\>>-<vb><rsub|R>*<vV><rsub|R><rsup|\<top\>>
  </equation>

  where <math|<vV><rsub|L>,<vV><rsub|R>> are Vandermonde matrices which are
  defined in<nbsp><eqref|eq:VlVr>. The quantities
  <math|<vb><rsub|L>,<vb><rsub|R>,<vV><rsub|L>,<vV><rsub|R>,<vD>,<vD><rsub|1>>
  can be computed once and re-used in all subsequent computations. They do
  not depend on the element and are computed on the reference element.
  Equation<nbsp><eqref|eq:fder> contains terms that can be computed inside a
  single cell (middle term) and those computed at the faces (first and third
  terms) where it is required to use the data from two adjacent cells. The
  computation of the flux derivatives can thus be performed by looping over
  cells and then the faces.

  <subsection|Direct flux reconstruction (DFR) scheme<label|sec:DFR>>

  An alternate approach to flux reconstruction which does not require the
  choice of a correction function is based on the idea of direct flux
  reconstruction<nbsp><cite|Romero2016>, which we adopt in the Lax-Wendroff
  scheme as follows. Let us take the solution points to be the <math|N+1>
  Gauss-Legendre nodes, and define

  <\equation*>
    \<xi\><rsub|-1>=0,<space|2em>\<xi\><rsub|N+1>=1
  </equation*>

  The Lagrange polynomials corresponding to the <math|N+3> points
  <math|<around|{|\<xi\><rsub|i>,i=-1,0,\<ldots\>,N+1|}>> are given by

  <\equation*>
    <wide|\<ell\>|~><rsub|j><around|(|\<xi\>|)>=<big|prod><rsub|i=-1,i\<ne\>j><rsup|N+1><frac|\<xi\>-\<xi\><rsub|i>|\<xi\><rsub|j>-\<xi\><rsub|i>>\<in\><poly><rsub|N+2>
  </equation*>

  We approximate the continuous flux in terms of these polynomials

  <\equation*>
    <value|F><rsub|h><around|(|\<xi\>|)>=<value|F><rsub|<emh>>*<wide|\<ell\>|~><rsub|-1><around|(|\<xi\>|)>+<big|sum><rsub|p=0><rsup|N><value|F><rsub|p><rsup|e>*<wide|\<ell\>|~><rsub|p><around|(|\<xi\>|)>+<value|F><rsub|<eph>>*<wide|\<ell\>|~><rsub|N+1><around|(|\<xi\>|)>
  </equation*>

  We can compute the spatial derivatives using a differentiation matrix
  <math|<wide|<vD>|~>\<in\><re><rsup|<around|(|N+1|)>\<times\><around|(|N+3|)>>>

  <\equation*>
    <wide|D|~><rsub|p*q>=<wide|\<ell\>|~><rsub|q><rprime|'><around|(|\<xi\><rsub|p>|)>,<space|2em>0\<le\>p\<le\>N,<space|1em>-1\<le\>q\<le\>N+1
  </equation*>

  Define <math|<vb><rsub|L>,<vb><rsub|R>> to be the first and last column of
  the matrix <math|<wide|<vD>|~>> and <math|<vD><rsub|1>> to be the remaining
  columns

  <\equation*>
    <vb><rsub|L>=<wide|<vD>|~><text|<with|font-family|tt|(:,-1)>>,<space|2em><vb><rsub|R>=<wide|<vD>|~><text|<with|font-family|tt|(:,N+1)>>,<space|2em><vD><rsub|1>=<wide|<vD>|~><text|<with|font-family|tt|(0:N,
    0:N)>>
  </equation*>

  The flux derivatives at all the solution points can be computed as follows

  <\equation*>
    <myvector|\<partial\><rsub|\<xi\>>F<rsub|h>>=<value|F><rsub|<emh>>*<vb><rsub|L>+<vD><rsub|1><vF>+<value|F><rsub|<eph>>*<vb><rsub|R>
  </equation*>

  Note that the above equation has the same structure as<nbsp><eqref|eq:fder>
  from the FR procedure but <math|<vb><rsub|L>,<vb><rsub|R>,<vD><rsub|1>> are
  obtained using different idea. In this DFR approach, we cannot use GLL
  points since then the boundary points <math|\<xi\><rsub|-1>=\<xi\><rsub|0>>,
  <math|\<xi\><rsub|N+1>=\<xi\><rsub|N>> would be repeated and the Lagrange
  interpolation is not well-defined; if we use GL points, the resulting
  scheme is identical to the LWFR approach using Radau correction function in
  combination with GL points as solution points, as shown in
  Appendix<nbsp><reference|sec:frdfr>.

  <subsection|Approximate Lax-Wendroff procedure<label|sec:alw>>

  The time average flux at the solution points
  <math|<value|F><rsub|p><rsup|e>> must be computed
  using<nbsp><eqref|eq:tavgflux>. The usual approach is to use the PDE and
  replace time derivatives with spatial derivatives, but this leads to large
  amount of algebraic computations since we need to evaluate the flux
  Jacobian and its higher tensor versions. To avoid this process, we follow
  the ideas in<nbsp><cite|Zorio2017|Burger2017> and adopt an approximate
  Lax-Wendroff procedure. To present this idea in a concise and efficient
  form, we introduce the notation

  <\equation*>
    <value|uu><rsup|<around|(|m|)>>=\<Delta\>t<rsup|m>*\<partial\><rsub|t><rsup|m>*<value|uu>,<space|2em><value|pf><rsup|<around|(|m|)>>=\<Delta\>t<rsup|m>*\<partial\><rsub|t><rsup|m>*<value|pf>,<space|2em>m=1,2,\<ldots\>
  </equation*>

  The time derivatives of the solution are computed using the PDE

  <\equation*>
    <value|uu><rsup|<around|(|m|)>>=-\<Delta\>t*\<partial\><rsub|x>*<value|pf><rsup|<around|(|m-1|)>>,<space|2em>m=1,2,\<ldots\>
  </equation*>

  The approximate Lax-Wendroff procedure uses a finite difference
  approximation applied at the solution points to compute the time
  derivatives of the fluxes. For example, a second order approximation is
  given by

  <\equation*>
    <value|pf><rsub|t><around|(|\<xi\>,t|)>\<approx\><frac|<value|pf><around|(|<value|uu><around|(|\<xi\>,t+\<Delta\>t|)>|)>-<value|pf><around|(|<value|uu><around|(|\<xi\>,t-\<Delta\>t|)>|)>|2*\<Delta\>t>
  </equation*>

  The arguments to the flux are in turn approximated by a Taylor expansion in
  time

  <\equation*>
    <value|uu><around|(|\<xi\>,t\<pm\>\<Delta\>t|)>\<approx\><value|uu>*<around|(|\<xi\>,t|)>\<pm\><value|uu><rsub|t><around|(|\<xi\>,t|)>*\<Delta\>t
  </equation*>

  Using this approximation at the <math|p<rsup|th>> solution point in an
  element, we get

  <\equation*>
    <value|pf><rsub|p><rsup|<around|(|1|)>>=<value|pf><rsub|t><around|(|\<xi\><rsub|p>,t|)>*\<Delta\>t\<approx\><half><around|[|<value|pf><around|(|<value|uu><rsub|p>+<value|uu><rsub|p><rsup|<around|(|1|)>>|)>-<value|pf><around|(|<value|uu><rsub|p>-<value|uu><rsub|p><rsup|<around|(|1|)>>|)>|]>,<space|1em><value|uu><rsub|p><rsup|<around|(|1|)>>=<value|uu><rsub|t><around|(|\<xi\><rsub|p>,t|)>*\<Delta\>t=-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<value|pf><rsub|\<xi\>><around|(|\<xi\><rsub|p>,t|)>\<approx\>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>><around|(|<vD><vf>|)><rsub|p>
  </equation*>

  It can be shown that the above approximation to <math|f<rsub|t>> is second
  order accurate in <math|\<Delta\>*t>. Such approximations can be written
  for higher accuracy and for higher time
  derivatives<nbsp><cite|Zorio2017|Burger2017>, and we summarize them below
  at different orders of accuracy which are used in the paper. The neglected
  term in the Taylor expansion<nbsp><eqref|eq:tavgflux> is of
  <math|O<around|(|\<Delta\>*t<rsup|N+1>|)>>, and hence the derivative
  approximation <math|\<partial\><rsub|t><rsup|m>*f> must be computed to at
  least <math|O<around|(|\<Delta\>*t<rsup|N+1-m>|)>> accuracy. The
  Lax-Wendroff procedure is applied in each element and so for simplicity of
  notation, we do not show the element index in the following
  sub-sections.<with|font|Microsoft|>

  <subsubsection|Second order scheme, <math|N=1>>

  The time average flux at the solution points is given by

  <\equation*>
    <vF>=<vf> +<frac|1|2>*<vf><rsup|<around|(|1|)>>
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|<vu><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>><vD><vf>>>|<row|<cell|<vf><rsup|<around|(|1|)>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|f*<around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-f*<around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>|]>>>>>
  </eqnarray*>

  <subsubsection|Third order scheme, <math|N=2>>

  The time average flux at the solution points is given by

  <\equation*>
    <vF>=<vf> +<frac|1|2>*<vf><rsup|<around|(|1|)>>+<frac|1|6>*<vf><rsup|<around|(|2|)>>
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|<vu><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf>>>|<row|<cell|<vf><rsup|<around|(|1|)>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>|]>>>|<row|<cell|<vu><rsup|<around|(|2|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|1|)>>>>|<row|<cell|<vf><rsup|<around|(|2|)>>>|<cell|=>|<cell|f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>-2*f<around|(|<vu>|)>+f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>>>>>
  </eqnarray*>

  <subsubsection|Fourth order scheme, <math|N=3>>

  For the fourth order scheme, the time average flux at the solution points
  reads as

  <\equation*>
    <vF>=<vf>+<frac|1|2>*<vf><rsup|<around|(|1|)>>+<frac|1|6>*<vf><rsup|<around|(|2|)>>+<frac|1|24>*<vf><rsup|<around|(|3|)>>
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|<vu><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf>>>|<row|<cell|<vf><rsup|<around|(|1|)>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-f<around*|(|<vu>+2*<vu><rsup|<around|(|1|)>>|)>+8f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-8*f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>+f<around*|(|<vu>-2*<vu><rsup|<around|(|1|)>>|)>|]>>>|<row|<cell|<vu><rsup|<around|(|2|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|1|)>>>>|<row|<cell|<vf><rsup|<around|(|2|)>>>|<cell|=>|<cell|f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>-2*f<around|(|<vu>|)>+f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>>>|<row|<cell|<vu><rsup|<around|(|3|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|2|)>>>>|<row|<cell|<vf><rsup|<around|(|3|)>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|f<around*|(|<vu>+2*<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!>*<vu><rsup|<around|(|2|)>>+<frac|2<rsup|3>|3!>*<vu><rsup|<around|(|3|)>>|)>-2*f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<frac|1|2!>*<vu><rsup|<around|(|2|)>>+<frac|1|3!>*<vu><rsup|<around|(|3|)>>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|>|<cell|<space|1em><around*|\<nobracket\>|+2*f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<frac|1|2!>*<vu><rsup|<around|(|2|)>>-<frac|1|3!>*<vu><rsup|<around|(|3|)>>|)>-f<around*|(|<vu>-2*<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!>*<vu><rsup|<around|(|2|)>>-<frac|2<rsup|3>|3!>*<vu><rsup|<around|(|3|)>>|)>|]>>>>>
  </eqnarray*>

  <subsubsection|Fifth order scheme, <math|N=4>>

  The time average flux at the solution points for the fifth order scheme
  takes the form

  <\equation*>
    <vF>=<vf>+<frac|1|2>*<vf><rsup|<around|(|1|)>>+<frac|1|6>*<vf><rsup|<around|(|2|)>>+<frac|1|24>*<vf><rsup|<around|(|3|)>>+<frac|1|120>*<vf><rsup|<around|(|4|)>>
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|<vu><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf>>>|<row|<cell|<vf><rsup|<around|(|1|)>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-f<around*|(|<vu>+2*<vu><rsup|<around|(|1|)>>|)>+8*f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-8*f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>+f<around*|(|<vu>-2*<vu><rsup|<around|(|1|)>>|)>|]>>>|<row|<cell|<vu><rsup|<around|(|2|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|1|)>>>>|<row|<cell|<vf><rsup|<around|(|2|)>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-f<around*|(|<vu>+2<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!><vu><rsup|<around|(|2|)>>|)>+16*f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<frac|1|2!><vu><rsup|<around|(|2|)>>|)>-30*f<around|(|<vu>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|>|<cell|<space|2em><around*|\<nobracket\>|+16*f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<frac|1|2!><vu><rsup|<around|(|2|)>>|)>-f<around*|(|<vu>-2<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!><vu><rsup|<around|(|2|)>>|)>|]>>>|<row|<cell|<vu><rsup|<around|(|3|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|2|)>>>>|<row|<cell|<vf><rsup|<around|(|3|)>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|f<around*|(|<vu>+2*<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!>*<vu><rsup|<around|(|2|)>>+<frac|2<rsup|3>|3!>*<vu><rsup|<around|(|3|)>>|)>-2*f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<frac|1|2!>*<vu><rsup|<around|(|2|)>>+<frac|1|3!>*<vu><rsup|<around|(|3|)>>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|>|<cell|<space|1em><around*|\<nobracket\>|+2*f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<frac|1|2!>*<vu><rsup|<around|(|2|)>>-<frac|1|3!>*<vu><rsup|<around|(|3|)>>|)>-f<around*|(|<vu>-2*<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!>*<vu><rsup|<around|(|2|)>>-<frac|2<rsup|3>|3!>*<vu><rsup|<around|(|3|)>>|)>|]>>>|<row|<cell|<vu><rsup|<around|(|4|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|3|)>>>>|<row|<cell|<vf><rsup|<around|(|4|)>>>|<cell|=>|<cell|<around*|[|f<around*|(|<vu>+2*<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!>*<vu><rsup|<around|(|2|)>>+<frac|2<rsup|3>|3!>*<vu><rsup|<around|(|3|)>>+<frac|2<rsup|4>|4!>*<vu><rsup|<around|(|4|)>>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|>|<cell|<around*|\<nobracket\>|-4*f<around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<frac|1|2!>*<vu><rsup|<around|(|2|)>>+<frac|1|3!>*<vu><rsup|<around|(|3|)>>+<frac|1|4!>*<vu><rsup|<around|(|4|)>>|)>+6*f<around|(|<vu>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|>|<cell|<around*|\<nobracket\>|-4*f<around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<frac|1|2!>*<vu><rsup|<around|(|2|)>>-<frac|1|3!>*<vu><rsup|<around|(|3|)>>+<frac|1|4!>*<vu><rsup|<around|(|4|)>>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|>|<cell|+<around*|\<nobracket\>|f<around*|(|<vu>-2*<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!>*<vu><rsup|<around|(|2|)>>-<frac|2<rsup|3>|3!>*<vu><rsup|<around|(|3|)>>+<frac|2<rsup|4>|4!>*<vu><rsup|<around|(|4|)>>|)>|]>>>>>
  </eqnarray*>

  The above set of formulae shows the sequence of steps that have to be
  performed to compute the time average flux at various orders. The arguments
  of the fluxes used on the right hand side in these steps are built in a
  sequential manner. Note that all the equations are vectorial equations and
  are applied at each solution point.

  <section|Numerical flux><label|sec:numflux>

  \ The numerical flux couples the solution between two neighbouring cells in
  a discontinuous Galerkin type method. In RK methods, the numerical flux is
  a function of the trace values of the solution at the faces. In the
  Lax-Wendroff scheme, we have constructed the time average flux at all the
  solution points inside the element and we want to use this information to
  compute the time averaged numerical flux at the element faces. The simplest
  numerical flux is based on Lax-Friedrich type approximation and is given
  by<nbsp><cite|Qiu2005b>

  <\equation>
    <label|eq:nfdiss1><value|F><rsub|<eph>>=<half><around|[|<value|F><rsub|<eph>><rsup|->+<value|F><rsub|<eph>><rsup|+>|]>-<half>\<lambda\><rsub|<eph>>*<around|[|<value|uu><rsub|h>*<around|(|x<rsub|<eph>><rsup|+>,t<rsub|n>|)>-<value|uu><rsub|h>*<around|(|x<rsub|<eph>><rsup|->,t<rsub|n>|)>|]>
  </equation>

  which consists of a central flux and a dissipative part. For linear
  advection equation <math|<value|uu><rsub|t>+a*<value|uu><rsub|x>=0>, the
  coefficient in the dissipative part of the flux is taken as
  <math|\<lambda\><rsub|<eph>>=<around|\||a|\|>>, while for a non-linear PDE
  like Burger's equation, we take it to be

  <\equation*>
    \<lambda\><rsub|<eph>>=max <around|{|<around|\||<value|pf><rprime|'><around|(|<au><rsub|e><rsup|n>|)>|\|>,<around|\||<value|pf><rprime|'><around|(|<au><rsub|e+1><rsup|n>|)>|\|>|}>
  </equation*>

  where <math|<au><rsub|e><rsup|n>> is the cell average solution in element
  <math|\<Omega\><rsub|e>> at time <math|t<rsub|n>>, and will be referred to
  as Rusanov or local Lax-Friedrich<nbsp><cite|Rusanov1962> approximation.
  Note that the dissipation term in the above numerical flux is evaluated at
  time <math|t<rsub|n>> whereas the central part of the flux uses the time
  average flux. Since the dissipation term contains solution difference at
  faces, we still expect to obtain optimal convergence rates, which is
  verified in numerical experiments. This numerical flux depends on the
  following quantities: <math|<around|{|<au><rsub|e><rsup|n>,<au><rsub|e+1><rsup|n>,<value|uu><rsub|h>*<around|(|x<rsub|<eph>><rsup|->,t<rsub|n>|)>,<value|uu><rsub|h>*<around|(|x<rsub|<eph>><rsup|+>,t<rsub|n>|)>,<value|F><rsub|<eph>><rsup|->,<value|F><rsub|<eph>><rsup|+>|}>>.

  The numerical flux of the form<nbsp><eqref|eq:nfdiss1> leads to somewhat
  reduced CFL numbers as shown by Fourier stability analysis in a later
  section, and also does not have upwind property even for linear advection
  equation. An alternate form of the numerical flux is obtained by evaluating
  the dissipation term using the time average solution, leading to the
  formula

  <\equation>
    <label|eq:nfdiss2><value|F><rsub|<eph>>=<half>*<around|[|<value|F><rsub|<eph>><rsup|->+<value|F><rsub|<eph>><rsup|+>|]>-<half>*\<lambda\><rsub|<eph>>*<around|[|<value|uU><rsub|<eph>><rsup|+>-<value|uU><rsub|<eph>><rsup|->|]>
  </equation>

  where

  <\equation>
    <label|eq:tavgsol><value|uU>=<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*<value|uu>=<value|uu>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<value|uu>+\<ldots\>+<frac|\<Delta\>t<rsup|N>|<around|(|N+1|)>!>*\<partial\><rsub|t><rsup|N>*<value|uu>
  </equation>

  is the time average solution. In this case, the numerical flux depends on
  the following quantities: <math|<around|{|<au><rsub|e><rsup|n>,<au><rsub|e+1><rsup|n>,<value|uU><rsub|<eph>><rsup|->,<value|uU><rsub|<eph>><rsup|+>,<value|F><rsub|<eph>><rsup|->,<value|F><rsub|<eph>><rsup|+>|}>>.
  We will refer to the above two forms of dissipation as D1 and D2,
  respectively. The dissipation model D2 is not computationally expensive
  compared to the D1 model since all the quantities required to compute the
  time average solution <math|U> are available during the Lax-Wendroff
  procedure. Numerical fluxes for the case of systems of hyperbolic equations
  are described in the Appendix. It remains to explain how to compute
  <math|<value|F><rsub|<eph>><rsup|\<pm\>>> appearing in the central part of
  the numerical flux, which can be accomplished in two different ways, which
  we term AE and EA in the next two sub-sections.

  <\remark>
    In case of constant linear advection equation,
    <math|<value|uu><rsub|t>+a*<value|uu><rsub|x>=<value|bzero>>,
    <math|f<rsup|<around|(|m|)>>=a*<value|uu><rsup|<around|(|m|)>>> so that
    <math|<value|F><rsub|p><rsup|e>=a*<value|uU><rsub|p><rsup|e>>. Then,
    since <math|\<lambda\><rsub|<eph>>=<around|\||a|\|>>, the numerical
    flux<nbsp><eqref|eq:nfdiss2> becomes the upwind flux

    <\equation*>
      <value|F><rsub|<eph>>=<choice|<tformat|<table|<row|<cell|<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|->|)>,>|<cell|a\<ge\>0>>|<row|<cell|<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|+>|)>,>|<cell|a\<less\>0>>>>>
    </equation*>

    but the flux<nbsp><eqref|eq:nfdiss1> does not have this upwind property.
    For a variable coefficient advection problem with flux
    <math|f=a<around|(|x|)>*<value|uu>>, we get
    <math|<value|F><rsub|p><rsup|e>=a<around|(|x<rsub|p>|)>*<value|uU><rsub|p><rsup|e>>,
    the numerical flux<nbsp><eqref|eq:nfdiss2> is

    <\equation>
      <value|F><rsub|<eph>>=<half><around|[|<value|F><rsub|<eph>><rsup|->+<value|F><rsub|<eph>><rsup|+>|]>-<half><around|\||a<around|(|x<rsub|<eph>>|)>|\|>*<around|[|<value|uU><rsub|<eph>><rsup|+>-<value|uU><rsub|<eph>><rsup|->|]><label|eq:nflin1>
    </equation>

    which does not reduce to an upwind flux due to interpolation errors,
    though it will be close to it in the well resolved cases. In this case,
    we can define the upwind numerical flux as

    <\equation>
      <value|F><rsub|<eph>>=<choice|<tformat|<table|<row|<cell|<value|F><rsub|<eph>><rsup|->,>|<cell|<space|1em>>|<cell|a<around|(|x<rsub|<eph>>|)>\<ge\>0>>|<row|<cell|<value|F><rsub|<eph>><rsup|+>,>|<cell|>|<cell|a<around|(|x<rsub|<eph>>|)>\<less\>0>>>>><label|eq:nflin2>
    </equation>

    which is defined in terms of the time average flux only and does not make
    use of the solution.
  </remark>

  <\remark>
    For non-linear problems, we can also consider the global Lax-Friedrich
    and Roe type dissipation models which are given by

    <\equation*>
      \<lambda\><rsub|<eph>>=\<lambda\>=max<rsub|e><around|\||f<rprime|'><around|(|<au><rsub|e>|)>|\|>,<space|2em>\<lambda\><rsub|<eph>>=<around*|\||f<rprime|'><around*|(|<frac|<au><rsub|e>+<au><rsub|e+1>|2>|)>|\|>
    </equation*>

    respectively. In the global Lax-Friedrich flux, the maximum is taken over
    the whole grid. For Burger's equation, we can consider an Osher type
    flux<nbsp><cite|Engquist1981> which is given by

    <\equation*>
      <value|F><rsub|<eph>>=<choice|<tformat|<table|<row|<cell|<value|F><rsub|<eph>><rsup|->>|<cell|<au><rsub|e>,<au><rsub|e+1>\<gtr\>0>>|<row|<cell|<value|F><rsub|<eph>><rsup|+>>|<cell|<au><rsub|e>,<au><rsub|e+1>\<less\>0>>|<row|<cell|<value|F><rsub|<eph>><rsup|->+<value|F><rsub|<eph>><rsup|+>>|<cell|<au><rsub|e>\<ge\>0\<ge\><au><rsub|e+1>>>|<row|<cell|0>|<cell|<math-up|otherwise>>>>>>
    </equation*>
  </remark>

  <subsection|Numerical flux \U average and extrapolate to face (AE)>

  In each element, the time average flux <math|<value|F><rsub|h><rsup|\<delta\>>>
  has been constructed using the Lax-Wendroff procedure. The simplest
  approximation that can be used for <math|<value|F><rsub|<eph>><rsup|\<pm\>>>
  in the central part of the numerical flux is to extrapolate the flux
  <math|<value|F><rsub|h><rsup|\<delta\>>> to the faces,

  <\equation*>
    <value|F><rsub|<eph>><rsup|\<pm\>>=<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|\<pm\>>|)>
  </equation*>

  We will refer to this approach with the abbreviation <extrapolate>.
  However, as shown in the numerical results, this approximation can lead to
  sub-optimal convergence rates for some non-linear problems. Hence we
  propose another method for the computation of the inter-cell flux which
  overcomes this problem as explained next.

  <subsection|Numerical flux \U extrapolate to face and average (EA)>

  Instead of extrapolating the time average flux from the solution points to
  the faces, we can instead build the time average flux at the faces directly
  using the approximate Lax-Wendroff procedure that is used at the solution
  points. The flux at the faces is constructed after the solution is evolved
  at all the solution points. In the following equations, <math|\<alpha\>>
  denotes either the left face (<math|L>) or the right face (<math|R>) of a
  cell. For <math|\<alpha\>\<in\><around|{|L,R|}>>, we compute the time
  average flux at the faces of the <math|e>'th element by the following
  steps, where we suppress the element index since all the operations are
  performed inside one element.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <with|font-series|bold|Degree> <math|N=1>
    </cell>|<\cell>
      <with|font-series|bold|Degree> <math|N=2>
    </cell>>|<row|<\cell>
      <\eqnarray*>
        <tformat|<table|<row|<cell|u<rsub|\<alpha\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><vu>>>|<row|<cell|u<rsub|\<alpha\>><rsup|\<pm\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<vu>\<pm\><vu><rsup|<around|(|1|)>>|)>>>|<row|<cell|f<rsup|<around|(|1|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>-f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>|]>>>|<row|<cell|F<rsub|\<alpha\>>>|<cell|=>|<cell|f<around|(|u<rsub|\<alpha\>>|)>+<frac|1|2>*f<rsup|<around|(|1|)>><rsub|\<alpha\>>>>>>
      </eqnarray*>
    </cell>|<\cell>
      <\eqnarray*>
        <tformat|<table|<row|<cell|u<rsub|\<alpha\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><vu>>>|<row|<cell|u<rsub|\<alpha\>><rsup|\<pm\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around|(|<vu>\<pm\><vu><rsup|<around|(|1|)>>+<frac|1|2>*<vu><rsup|<around*|(|2|)>>|)>>>|<row|<cell|f<rsup|<around|(|1|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>-f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>|]>>>|<row|<cell|f<rsup|<around|(|2|)>><rsub|\<alpha\>>>|<cell|=>|<cell|*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>-2*f<around*|(|u<rsub|\<alpha\>>|)>+f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>>>|<row|<cell|F<rsub|\<alpha\>>>|<cell|=>|<cell|f<around|(|u<rsub|\<alpha\>>|)>+<frac|1|2>*f<rsup|<around|(|1|)>><rsub|\<alpha\>>+<frac|1|6>*f<rsub|\<alpha\>><rsup|<around*|(|2|)>>>>>>
      </eqnarray*>
    </cell>>>>
  </wide-tabular>

  <paragraph|Degree <math|N=3>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|u<rsub|\<alpha\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><vu>>>|<row|<cell|u<rsub|\<alpha\>><rsup|\<pm\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<vu>\<pm\><vu><rsup|<around|(|1|)>>+<frac|1|2!><vu><rsup|<around|(|2|)>>\<pm\><frac|1|3!><vu><rsup|<around|(|3|)>>|)>>>|<row|<cell|u<rsub|\<alpha\>><rsup|\<pm\>2>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<vu>\<pm\>2<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!><vu><rsup|<around|(|2|)>>\<pm\><frac|2<rsup|3>|3!><vu><rsup|<around|(|3|)>>|)>>>|<row|<cell|f<rsup|<around|(|1|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-f<around*|(|u<rsup|+2><rsub|\<alpha\>>|)>+8*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>-8*f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>+f<around*|(|u<rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|f<rsup|<around|(|2|)>><rsub|\<alpha\>>>|<cell|=>|<cell|f<around|(|u<rsub|\<alpha\>><rsup|->|)>-2*f<around|(|u<rsub|\<alpha\>>|)>+f<around|(|u<rsub|\<alpha\>><rsup|+>|)>>>|<row|<cell|f<rsup|<around|(|3|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|f<around*|(|u<rsup|+2><rsub|\<alpha\>>|)>-2*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>+2*f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>-f<around*|(|u<rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|F<rsub|\<alpha\>>>|<cell|=>|<cell|f<around|(|u<rsub|\<alpha\>>|)>+<frac|1|2>*f<rsup|<around|(|1|)>><rsub|\<alpha\>>+<frac|1|6>*f<rsub|\<alpha\>><rsup|<around|(|2|)>>+<frac|1|24>*f<rsub|\<alpha\>><rsup|<around|(|3|)>>>>>>
  </eqnarray*>

  <paragraph|Degree <math|N=4>>

  <\eqnarray*>
    <tformat|<table|<row|<cell|u<rsub|\<alpha\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><vu>>>|<row|<cell|u<rsub|\<alpha\>><rsup|\<pm\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<vu>\<pm\><vu><rsup|<around|(|1|)>>+<frac|1|2!><vu><rsup|<around|(|2|)>>\<pm\><frac|1|3!><vu><rsup|<around|(|3|)>>+<frac|1|4!><vu><rsup|<around|(|4|)>>|)>>>|<row|<cell|u<rsub|\<alpha\>><rsup|\<pm\>2>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<vu>\<pm\>2<vu><rsup|<around|(|1|)>>+<frac|2<rsup|2>|2!><vu><rsup|<around|(|2|)>>\<pm\><frac|2<rsup|3>|3!><vu><rsup|<around|(|3|)>>+<frac|2<rsup|3>|3!><vu><rsup|<around|(|3|)>>|)>>>|<row|<cell|f<rsup|<around|(|1|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-f<around*|(|u<rsup|+2><rsub|\<alpha\>>|)>+8*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>-8*f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>+f<around*|(|u<rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|f<rsup|<around|(|2|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-f<around*|(|u<rsup|+2><rsub|\<alpha\>>|)>+16*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>-30*f<around*|(|u<rsub|\<alpha\>>|)>+16*f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>-f<around*|(|u<rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|f<rsup|<around|(|3|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|f<around*|(|u<rsup|+2><rsub|\<alpha\>>|)>-2*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>+2*f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>-f<around*|(|u<rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|f<rsup|<around|(|4|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<around*|[|f<around*|(|u<rsup|+2><rsub|\<alpha\>>|)>-4*f<around*|(|u<rsup|+><rsub|\<alpha\>>|)>+6*f<around*|(|u<rsub|\<alpha\>>|)>-4*f<around*|(|u<rsup|-><rsub|\<alpha\>>|)>+f<around*|(|u<rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|F<rsub|\<alpha\>>>|<cell|=>|<cell|f<around|(|u<rsub|\<alpha\>>|)>+<frac|1|2>*f<rsup|<around|(|1|)>><rsub|\<alpha\>>+<frac|1|6>*f<rsub|\<alpha\>><rsup|<around|(|2|)>>+<frac|1|24>*f<rsub|\<alpha\>><rsup|<around|(|3|)>>+<frac|1|120>*f<rsub|\<alpha\>><rsup|<around|(|4|)>>>>>>
  </eqnarray*>

  We see that the solution is first extrapolated to the cell faces and the
  same finite difference formulae for the time derivatives of the flux which
  are used at the solution points, are also used at the faces. The numerical
  flux is computed using the time average flux built as above at the faces;
  the central part of the flux <math|F<rsub|<eph>><rsup|\<pm\>>> in
  equations<nbsp><eqref|eq:nfdiss1>,<nbsp><eqref|eq:nfdiss2> are computed as

  <\equation*>
    F<rsub|<eph>><rsup|->=<around|(|F<rsub|R>|)><rsub|e>,<space|2em>F<rsub|<eph>><rsup|+>=<around|(|F<rsub|L>|)><rsub|e+1>
  </equation*>

  We will refer to this method with the abbreviation
  <with|font-series|bold|EA>. The dissipative part of the flux is computed
  using either the solution at time <math|t<rsub|n>> or the time average
  solution, which are extrapolated to the faces, leading to the D1 and D2
  models, respectively.

  <\remark>
    The two methods AE and EA are different only when there are no solution
    points at the faces. E.g., if we use GLL solution points, then the two
    methods yield the same result since there is no interpolation error. For
    the constant coefficient advection equation, the above two schemes for
    the numerical flux lead to the same approximation but they differ in case
    of variable coefficient advection problems and when the flux is
    non-linear with respect to <math|u>. The effect of this non-linearity and
    the performance of the two methods are shown later using some numerical
    experiments.
  </remark>

  <section|Fourier stability analysis in 1-D><label|sec:four1d>

  <with|color|red|Bold face or no bold face?>

  We now perform Fourier stability analysis of the LW schemes applied to the
  linear advection equation <math|u<rsub|t>+a*u<rsub|x>=0> where <math|a> is
  the constant advection speed. We will assume that the advection speed
  <math|a> is positive and denote the CFL number by

  <\equation*>
    \<sigma\>=<frac|a*\<Delta\>t|\<Delta\>x>
  </equation*>

  Since <math|f<rsup|<around|(|m|)>>=a*<value|uu><rsup|<around|(|m|)>>>, the
  time average flux at all the solution points is given by

  <\equation*>
    <vF><rsub|e>=a<vU><rsub|e><space|1em><math-up|where><space|1em><vU><rsub|e>=<vT><vu><rsub|e><space|1em><math-up|and><space|1em><vT>=<big|sum><rsub|m=0><rsup|N><frac|1|<around|(|m+1|)>!>*<around|(|-\<sigma\><vD>|)><rsup|m>
  </equation*>

  Then the discontinuous flux at the cell boundaries are given by

  <\equation*>
    F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<emh>><rsup|+>|)>=<vV><rsub|L><rsup|\<top\>><vF><rsub|e>,<space|2em>F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|->|)>=<vV><rsub|R><rsup|\<top\>><vF><rsub|e>
  </equation*>

  We can write the update equation in the form

  <\equation>
    <label|eq:laup><vu><rsub|e><rsup|n+1>=-\<sigma\><vA><rsub|-1><vu><rsub|e-1><rsup|n>+<around|(|<vI>-\<sigma\><vA><rsub|0>|)><vu><rsub|e><rsup|n>-\<sigma\><vA><rsub|+1><vu><rsub|e+1><rsup|n>
  </equation>

  where the matrices <math|<vA><rsub|-1>,<vA><rsub|0>,<vA><rsub|+1>> depend
  on the choice of the dissipation model in the numerical flux. The EA and AE
  schemes for the flux are identical for this linear problem, and hence we do
  not make any distinction between them for Fourier stability analysis.

  Dissipation model D1. The numerical flux is given by

  <\equation*>
    <value|F><rsub|<eph>>=<half>[<vV><rsub|R><rsup|\<top\>><vF><rsub|e>+<vV><rsub|L><rsup|\<top\>><vF><rsub|e+1>]-<half>a*<around|(|<vV><rsub|L><rsup|\<top\>><vu><rsub|e+1>-<vV><rsub|R><rsup|\<top\>><vu><rsub|e>|)>
  </equation*>

  Since the flux difference at the faces is

  <\equation*>
    <value|F><rsub|<emh>>-<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<emh>><rsup|+>|)>=<half>a<vV><rsub|R><rsup|\<top\>>(<vT>+<vI>)<vu><rsub|e-1>-<half>a*<vV><rsub|L><rsup|\<top\>><around|(|<vT>+<vI>|)><vu><rsub|e>
  </equation*>

  <\equation*>
    <value|F><rsub|<eph>>-<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|->|)>=<half>a<vV><rsub|L><rsup|\<top\>>(<vT>-<vI>)<vu><rsub|e+1>-<half>a*<vV><rsub|R><rsup|\<top\>><around|(|<vT>-<vI>|)><vu><rsub|e>
  </equation*>

  the flux derivative at the solution points is given by

  <\equation*>
    \<partial\><rsub|\<xi\>><vF><rsub|h>=<half>a<vb><rsub|L><vV><rsub|R><rsup|\<top\>>(<vT>+<vI>)<vu><rsub|e-1>+<around*|[|a<vD><vT>-<half>a<vb><rsub|L><vV><rsub|L><rsup|\<top\>>(<vT>+<vI>)-<half>a<vb><rsub|R><vV><rsub|R><rsup|\<top\>>(<vT>-<vI><around*|)||]><vu><rsub|e>+<half>a*<vb><rsub|R><vV><rsub|L><rsup|\<top\>><around|(|<vT>-<vI>|)><vu><rsub|e+1>|\<nobracket\>>
  </equation*>

  Thus the matrices in<nbsp><eqref|eq:laup> are given by

  <\equation*>
    <vA><rsub|-1>=<half><vb><rsub|L><vV><rsub|R><rsup|\<top\>><around|(|<vT>+<vI>|)>,<space|2em><vA><rsub|+1>=<half><vb><rsub|R><vV><rsub|L><rsup|\<top\>><around|(|<vT>-<vI>|)>,<space|2em><vA><rsub|0>=<vD><vT>-<half><vb><rsub|L><vV><rsub|L><rsup|\<top\>>(<vT>+<vI>)-<half><vb><rsub|R><vV><rsub|R><rsup|\<top\>><around|(|<vT>-<vI>|)>
  </equation*>

  <paragraph|Dissipation model D2>. The numerical flux is given by

  <\equation*>
    <value|F><rsub|<eph>>=<vV><rsub|R><rsup|\<top\>><vF><rsub|e>=a*<vV><rsub|R><rsup|\<top\>><vT><vu><rsub|e>
  </equation*>

  and the flux differences at the face are

  <\equation*>
    <value|F><rsub|<emh>>-<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<emh>><rsup|+>|)>=a<vV><rsub|R><rsup|\<top\>><vT><vu><rsub|e-1>-a<vV><rsub|L><rsup|\<top\>><vT><vu><rsub|e>,<space|2em><value|F><rsub|<eph>>-<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|->|)>=0
  </equation*>

  so that the flux derivative at the solution points is given by

  <\equation*>
    \<partial\><rsub|\<xi\>><vF><rsub|h>=<around|(|a<vV><rsub|R><rsup|\<top\>><vT><vu><rsub|e-1>-a<vV><rsub|L><rsup|\<top\>><vT><vu><rsub|e>|)><vb><rsub|L>+a<vD><vT><vu><rsub|e>=a<vb><rsub|L><vV><rsub|R><rsup|\<top\>><vT><vu><rsub|e-1>+a*<around|(|<vD><vT>-<vb><rsub|L><vV><rsub|L><rsup|\<top\>><vT>|)><vu><rsub|e>
  </equation*>

  Thus the matrices in<nbsp><eqref|eq:laup> are given by

  <\equation*>
    <vA><rsub|-1>=<vb><rsub|L><vV><rsub|R><rsup|\<top\>><vT>,<space|2em><vA><rsub|0>=<vD><vT>-<vb><rsub|L><vV><rsub|L><rsup|\<top\>><vT>,<space|2em><vA><rsub|+1>=0
  </equation*>

  The upwind character of the flux leads to <math|<vA><rsub|+>=0> and the
  right cell does not appear in the update equation.

  <paragraph|Stability analysis.> We assume a solution of the form
  <math|<vu><rsub|e><rsup|n>=<wide|<vu>|^><rsub|k><rsup|n>exp
  <around|(|<im>k*x<rsub|e>|)>> where <math|<im>=<sqrt|-1>>, <math|k> is the
  wave number which is an integer and <math|<wide|<vu>|^><rsub|k><rsup|n>\<in\><re><rsup|N+1>>
  are the Fourier amplitudes; substituting this ansatz
  in<nbsp><eqref|eq:laup>, we find that the amplitudes evolve according to
  the equation

  <\equation*>
    <wide|<vu>|^><rsub|k><rsup|n+1>=<vH><around|(|\<sigma\>,\<kappa\>|)><wide|<vu>|^><rsub|k><rsup|n>,<space|2em><vH>=<vI>-\<sigma\><vA><rsub|0>-\<sigma\>*<vA><rsub|-1>exp
    <around|(|-<im>\<kappa\>|)>-\<sigma\>*<vA><rsub|+1>exp
    <around|(|<im>\<kappa\>|)>,<space|2em>\<kappa\>=k*\<Delta\>*x
  </equation*>

  <\clr|red>
    where <math|\<kappa\>> is the non-dimensional wave number. The
    eigenvalues of <math|<vH>> depend on the CFL number <math|\<sigma\>> and
    wave number <math|\<kappa\>>, i.e., <math|\<lambda\>=\<lambda\><around|(|\<sigma\>,\<kappa\>|)>>;
    for stability, all the eigenvalues of <math|<vH>> must have magnitude
    less than or equal to one for all <math|\<kappa\>\<in\><around|[|0,2*\<pi\>|]>>,
    i.e.,

    <\equation*>
      \<lambda\><around|(|\<sigma\>|)>=max<rsub|\<kappa\>><around|\||\<lambda\><around|(|\<sigma\>,\<kappa\>|)>|\|>\<le\>1
    </equation*>

    The CFL number is the maximum value of <math|\<sigma\>> for which above
    stability condition is satisfied. This CFL number is determined
    approximately by sampling in the wave number space; we partition
    <math|\<kappa\>\<in\><around|[|0,2*\<pi\>|]>> into a large number of
    uniformly spaced points <math|\<kappa\><rsub|p>> and determine

    <\equation*>
      \<lambda\><around|(|\<sigma\>|)>=max<rsub|p><around|\||\<lambda\><around|(|\<sigma\>,\<kappa\><rsub|p>|)>|\|>
    </equation*>

    The values of <math|\<sigma\>> are also sampled in some interval
    <math|<around|[|\<sigma\><rsub|min>,\<sigma\><rsub|max>|]>> and the
    largest value of <math|\<sigma\><rsub|l>\<in\><around|[|\<sigma\><rsub|min>,\<sigma\><rsub|max>|]>>
    for which <math|\<lambda\><around|(|\<sigma\><rsub|l>|)>\<le\>1> is
    determined in a Python code. We start with a large interval
    <math|<around|[|\<sigma\><rsub|min>,\<sigma\><rsub|max>|]>> and then
    progressively reduce the size of this interval so that the CFL number is
    determined to about three decimal places. The results of this numerical
    investigation of stability are shown in Table<nbsp><eqref|tab:cfl> for
    two correction functions and different polynomial degrees.
  </clr>

  <big-table|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|c>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|c>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|7|7|cell-halign|c>|<cwith|1|-1|7|7|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|2|2|cell-col-span|3>|<cwith|1|1|1|1|cell-rborder|1ln>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-rborder|1ln>|<cwith|1|1|5|5|cell-col-span|3>|<cwith|1|1|4|4|cell-rborder|1ln>|<cwith|1|1|5|5|cell-halign|c>|<cwith|1|1|5|5|cell-rborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|6|6|1|-1|cell-bborder|1ln>|<table|<row|<cell|<math|N>>|<cell|Radau>|<cell|>|<cell|>|<cell|<math|g<rsub|2>>>|<cell|>|<cell|>>|<row|<cell|>|<cell|D1>|<cell|D2>|<cell|Ratio>|<cell|D1>|<cell|D2>|<cell|Ratio>>|<row|<cell|1>|<cell|0.226>|<cell|0.333>|<cell|1.47>|<cell|0.465>|<cell|1.000>|<cell|2.15>>|<row|<cell|2>|<cell|0.117>|<cell|0.170>|<cell|1.45>|<cell|0.204>|<cell|0.333>|<cell|1.63>>|<row|<cell|3>|<cell|0.072>|<cell|0.103>|<cell|1.43>|<cell|0.116>|<cell|0.170>|<cell|1.47>>|<row|<cell|4>|<cell|0.049>|<cell|0.069>|<cell|1.40>|<cell|0.060>|<cell|0.103>|<cell|1.72>>>>><label|tab:cfl>>|CFL
  numbers for 1-D LWFR using the two dissipation models and correction
  functions>

  We see that dissipation model D2 has a higher CFL number compared to
  dissipation model D1. The CFL numbers for the <math|g<rsub|2>> correction
  function are also significantly higher than those for the Radau correction
  function. The LWFR scheme with Radau correction function is identical to DG
  scheme and the CFL numbers found here agree with those from the ADER-DG
  scheme<nbsp><cite|Dumbser2008|Gassner2011a>. The optimality of these CFL
  numbers has been verified by experiment on the linear advection test
  case<nbsp>(Section<nbsp><reference|sec:cla>), i.e., the solution eventually
  blows up if the time step is slightly higher than what is allowed by the
  CFL condition.

  <\remark>
    (Dirichlet boundary condition) The boundary conditions for hyperbolic
    problems are usually implemented in a weak manner through the fluxes. The
    boundary condition on the solution can be specified only at inflow
    boundaries, i.e., where the characteristics are entering the domain. For
    example, at the left boundary of the domain, say <math|x=0>, the boundary
    condition can be specified if <math|f<rprime|'>\<gtr\>0>. Assuming this
    is the case for our problem, let the boundary condition be given as
    <math|<value|uu><around|(|0,t|)>=<bg><around|(|t|)>>. It will be enforced
    by defining an upwind numerical flux at the boundary face, which is given
    by

    <\equation*>
      <value|F><rsub|l*b>=<value|F><rsub|l*b><rsup|->\<approx\><frac|1|\<Delta\>*t>*<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><value|pf><around|(|<bg><around|(|t|)>|)><ud>t
    </equation*>

    If the integral cannot be computed analytically, then it is approximated
    by quadrature in time. From<nbsp><eqref|eq:tvgproperty>, we see that
    integral must be at least accurate to
    <math|O<around|(|\<Delta\>*t<rsup|N+1>|)>> which is of the same order as
    the neglected terms in<nbsp><eqref|eq:tvgproperty>. In the numerical
    tests, we use <math|<around|(|N+1|)>>-point Gauss-Legendre quadrature
    which ensures the required accuracy. If the right boundary is an outflow
    boundary, i.e., <math|f<rprime|'>\<gtr\>0>, then the flux across the
    right boundary is computed in an upwind manner using the interior
    solution, i.e., <math|<value|F><rsub|r*b>=<value|F><rsub|r*b><rsup|->>
    where <math|<value|F><rsub|r*b><rsup|->> is obtained from the
    Lax-Wendroff procedure.
  </remark>

  <section|TVD limiter><label|sec:lim>\ 

  The computation of discontinuous solutions with high order methods can give
  oscillatory solutions which must be limited by some non-linear process. The
  a posteriori limiters developed in the context of RKDG
  schemes<nbsp><cite|Cockburn1991|Cockburn1989a> can be adopted in the
  framework of LWFR schemes. The limiter is applied in a post-processing step
  after the solution is updated to the new time level. The limiter is thus
  applied only once for each time step unlike in RKDG scheme where it has to
  be applied after each RK stage update. Let
  <math|<value|uu><rsub|h><around|(|x|)>> denote the solution at time
  <math|t<rsub|n+1>>. In element <math|\<Omega\><rsub|e>>, let the average
  solution be <math|<au><rsub|e>>; define the backward and forward
  differences of the solution and cell averages by

  <\equation*>
    \<Delta\><rsup|-><value|uu><rsub|e>=<au><rsub|e>-<value|uu><rsub|h><around|(|x<rsub|<emh>><rsup|+>|)>,<space|2em>\<Delta\><rsup|+><value|uu><rsub|e>=<value|uu><rsub|h><around|(|x<rsub|<eph>><rsup|->|)>-<au><rsub|e>
  </equation*>

  <\equation*>
    \<Delta\><rsup|-><au><rsub|e>=<au><rsub|e>-<au><rsub|e-1>,<space|2em>\<Delta\><rsup|+><au><rsub|e>=<au><rsub|e+1>-<au><rsub|e>
  </equation*>

  We limit the solution by comparing its variation within the cell with the
  difference of the neighbouring cell averages through a limiter function,

  <\equation*>
    \<Delta\><rsup|-><value|uu><rsub|e><rsup|m>=<minmod><around|(|\<Delta\><rsup|-><value|uu><rsub|e>,\<Delta\><rsup|-><au><rsub|e>,\<Delta\><rsup|+><au><rsub|e>|)>,<space|2em>\<Delta\><rsup|+><value|uu><rsub|e><rsup|m>=<minmod><around|(|\<Delta\><rsup|+><value|uu><rsub|e>,\<Delta\><rsup|-><au><rsub|e>,\<Delta\><rsup|+><au><rsub|e>|)>
  </equation*>

  which is component-wise given by

  <\equation*>
    <minmod><around|(|a,b,c|)>=<choice|<tformat|<table|<row|<cell|s*min
    <around|(|<around|\||a|\|>,<around|\||b|\|>,<around|\||c|\|>|)>,>|<cell|<math-up|if
    >s=<sign><around|(|a|)>=<sign><around|(|b|)>=<sign><around|(|c|)>>>|<row|<cell|0,>|<cell|<math-up|otherwise>>>>>>
  </equation*>

  If <math|\<Delta\><rsup|-><value|uu><rsub|e><rsup|m>\<ne\>\<Delta\><rsup|-><value|uu><rsub|e>>
  or <math|\<Delta\><rsup|+><value|uu><rsub|e><rsup|m>\<ne\>\<Delta\><rsup|+><value|uu><rsub|e>>,
  then the solution is deemed to be locally oscillatory and we modify the
  solution inside the cell by replacing it as a linear polynomial with a
  limited slope, which is taken to be the average limited slope. The limited
  solution polynomial in cell <math|\<Omega\><rsub|e>> is given by

  <\equation*>
    <value|uu><rsub|h>\|<rsub|\<Omega\><rsub|e>>=<wide|<value|uu>|\<wide-bar\>><rsub|e>+<frac|\<Delta\><rsup|-><value|uu><rsub|e><rsup|m>+\<Delta\><rsup|+><value|uu><rsub|e><rsup|m>|2>*<around|(|2*\<xi\>-1|)>,<space|2em>\<xi\>\<in\><around|[|0,1|]>
  </equation*>

  This limiter is known to clip smooth extrema since it cannot distinguish
  them from jump discontinuities. A small modification based on the idea of
  TVB limiters<nbsp><cite|Cockburn1991> can be used to relax the amount of
  limiting that is performed which leads to improved resolution of smooth
  extrema. The <math|<minmod>> function is replaced by

  <\equation*>
    <wide|<minmod>|\<bar\>><around|(|a,b,c|)>=<choice|<tformat|<table|<row|<cell|a,>|<cell|<around|\||a|\|>\<le\>M*\<Delta\>x<rsup|2>>>|<row|<cell|<minmod><around|(|a,b,c|)>,>|<cell|<math-up|otherwise>>>>>>
  </equation*>

  which requires the choice of a parameter <math|M>, which is an estimate of
  the second derivative of the solution at smooth extrema. In the case of
  systems of equations, the limiter is applied to the characteristic
  variables, which is known to yield better control on the spurious numerical
  oscillations<nbsp><cite|Cockburn1989>. The limiters used in this work are
  not able to provide high order accuracy and the development of better
  limiters for LW schemes is deferred to future work. Here we would like to
  show that with the use of TVD-type limiters, the LW and RK schemes provides
  similar resolution.

  <section|Numerical results in 1-D: scalar problems>

  In this section, we present some numerical results to show the convergence
  rates and the comparison of different scheme parameters like correction
  function, solution points and dissipation model. For each problem in this
  section, the corresponding CFL number is chosen from
  Table<nbsp><reference|tab:cfl>. Here after, when we use the CFL numbers
  obtained using the Fourier stability analysis, we multiply it with a safety
  factor of 0.95. When D1 and D2 schemes are compared together, the CFL
  numbers of D1 schemes are used as these are lower; the same CFL numbers are
  used for the RKFR schemes. Up to degree <math|N=3>, RKFR schemes use
  Runge-Kutta time integration of order <math|N+1> with <math|N+1> stages. In
  the <math|N=4> case, for non-linear problems there is no five stage
  Runge-Kutta method of order 5, see Chapter 32 of<nbsp><cite|Butcher2016>.
  However, for linear, autonomous problems, the five stage SSPRK method
  in<nbsp><cite|Gottlieb2001> is fifth order accurate, and we make use of it
  for the constant advection test cases with periodic boundary conditions and
  refer to it as SSPRK55. For non-linear or non-periodic problems, to make a
  fair comparison of LW and RK, we make use of the six stage, fifth order
  Runge-Kutta (RK65) time integration introduced
  in<nbsp><cite|Tsitouras2011>.

  The RKFR and LWFR schemes are illustrated at a high level in
  Algorithm<nbsp><reference|alg:rkfr.paper1> and
  Algorithm<nbsp><reference|alg:lwfr.paper1>, respectively, for solving a
  hyperbolic conservation law in a time interval <math|<around|[|0,T|]>>.
  Here we assume that an a posteriori limiter like a TVD/TVB limiter and a
  positivity limiter are applied in a post-processing step after the solution
  is updated. The LWFR scheme requires the application of the limiter only
  once per time step while the RKFR scheme requires multiple applications of
  the limiter depending on the number of RK stages. The limiter can be costly
  to apply for systems of equations where a characteristic approach and/or
  WENO-type limiter is used. In the present work, we use a simple TVD/TVB
  limiter but use characteristic limiting for systems.

  <\specified-algorithm|<label|alg:rkfr.paper1>RKFR scheme>
    <math|t=0>

    <surround|| |<\algo-while|<math|t\<less\>T>>
      <\algo-for|each RK stage>
        Loop over cells and assemble rhs

        Loop over faces and assemble rhs

        Update solution to next RK stage

        Apply a posteriori limiter

        Apply positivity limiter
      </algo-for>

      <math|t=t+\<Delta\>t>
    </algo-while>>
  </specified-algorithm>

  <\specified-algorithm|<label|alg:lwfr.paper1>LWFR scheme>
    <math|t=0>

    <surround|| |<\algo-while|<math|t\<less\>T>>
      Loop over cells and assemble rhs

      Loop over faces and assemble rhs

      Update solution to next time level

      Apply a posteriori limiter

      Apply positivity limiter

      <math|t=t+\<Delta\>t>
    </algo-while>>
  </specified-algorithm>

  <subsection|Linear advection equation: constant speed<label|sec:cla>>

  We first consider the 1-D linear advection equation
  <math|u<rsub|t>+a*u<rsub|x>=0> with speed <math|a=1> and periodic boundary
  condition.

  <subsubsection|Smooth solutions>

  For the initial condition <math|u<around|(|x,0|)>=sin<around|(|2*\<pi\>*x|)>>
  with periodic boundaries on <math|<around|[|0,1|]>>, we perform grid
  convergence studies using various parameters like correction functions and
  solution points. The error norms are computed at time <math|t=2> units. In
  Figure<nbsp><reference|fig:cla1> we compare the convergence behaviour for
  Radau and <math|<value|g2>> correction functions and for both choices of
  solution points using the D2 dissipation model. It is clear that the errors
  due to Radau are consistently smaller than those with <math|<value|g2>>
  correction function. The choice of the solution points does not
  significantly affect the error in the solution.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|3|3|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/cla/linear_lwfr2_gl_tf2|0.45par|||>>|<cell|<space|1em>>|<cell|<image|figures/cla/linear_lwfr2_gll_tf2|0.45par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>><label|fig:cla1>>|Error
  convergence for constant linear advection; (a) GL points, (b) GLL points.
  The different colors correspond to degrees <math|N=1,2,3,4> from top to
  bottom.>

  Figure<nbsp><reference|fig:cla2> shows the comparison of LW and RK schemes
  using Radau correction and two types of solution points. There is a small
  difference in the error levels between the two dissipation models, with the
  D2 model performing better for odd <math|N>. The RK scheme has slightly
  smaller errors than the LW scheme. We can see this more clearly by plotting
  the error norm versus time as shown in Figure<nbsp><reference|fig:cla3>,
  where all the four degrees consist of the same number of total dofs which
  is 200. We see that the error growth with time is higher for the LW scheme
  than for the RK scheme. The superior performance of the RK scheme is
  already known in the literature<nbsp><cite|Guo2015> and is due to its
  super-convergence properties. It is possible to construct LW schemes which
  are also super-convergent as done in<nbsp><cite|Guo2015> but the resulting
  schemes are computationally more expensive as they involve a stronger
  coupling with the neighbouring cell solutions, than what is used in the
  standard LW schemes. Hence we do not pursue that approach for our LW
  schemes. Note that this super-convergence occurs for constant coefficient
  linear problems on uniform grids and these advantages of RK schemes are not
  present when we consider non-linear problems, as shown in later results.

  Figure<nbsp><reference|fig:cla4> analyzes the behaviour of <math|L<rsup|2>>
  norm of the solution where we plot the relative change in the
  <math|L<rsup|2>> norm with respect to the initial value, defined as
  <math|<around|\<\|\|\>|u<rsub|h><around|(|t|)>|\<\|\|\>><rsub|2><rsup|\<ast\>>=<frac|<around|\<\|\|\>|u<rsub|h><around|(|t|)>|\<\|\|\>><rsub|2>-<around|\<\|\|\>|u<rsub|h><around|(|0|)>|\<\|\|\>><rsub|2>|<around|\<\|\|\>|u<rsub|h><around|(|0|)>|\<\|\|\>><rsub|2>>>.
  For <math|N=1>, we see that LW is less dissipative than RK and thus better
  at conserving energy while for <math|N=2,3>, RK schemes perform better. For
  <math|N=4>, we see a mild instability for both LWFR and RKFR schemes. For
  <math|N=4>, we compare LW with SSPRK55 which is fifth order only for linear
  problems and SSPRK54<nbsp><cite|Spiteri2002>, which is more relevant for
  non-linear problems and is fourth order accurate. Choosing time step size
  by CFL numbers of the LW-D1 scheme, we observe the mild instability for
  both the time integration schemes. The instability of RKDG scheme has been
  studied in<nbsp><cite|Xu2019> which can be remedied by using an RK scheme
  with different number of stages; however the use of six stage RK65 method
  with a limiter may dampen the solution too much, as we discuss later in
  Figure<nbsp><reference|fig:hat3>. The solution norm grows linearly, with a
  very small slope for both LW-D1 and LW-D2 (approximately 6.177e-10 and
  5.415e-10) schemes, and also for SSPRK54 and SSPRK55 (approximately
  2.862e-13, 1.908e-13) schemes. This mild instability does not affect the
  error convergence rates for finite time problems, but it might lead to
  problems for very long time simulations with periodic boundary conditions,
  especially for non-linear problems and needs to be investigated further.
  This type of mild instability for <math|N=4> seems to be present in other
  single step methods like ADER-DG schemes also.

  We now solve the problem with the same initial condition but using
  Dirichlet boundary condition at the left side of the domain; the exact
  solution remains same as before. The fifth order SSPRK scheme
  of<nbsp><cite|Gottlieb2001> is only for autonomous systems, so here we use
  RK65<nbsp><cite|Tsitouras2011> for <math|N=4>.
  Figure<nbsp><reference|fig:cla2_dirichlet>a shows the error convergence
  when we use the CFL of LW-D1 scheme for all schemes, since this is the
  smallest. All the schemes show optimal convergence rates with the LW-D2 and
  RK schemes showing very similar errors. In
  Figure<nbsp><reference|fig:cla2_dirichlet>b, we perform the same error
  convergence study but using the stable CFL number of each scheme; we still
  observe optimal convergence rates in each scheme, but the RK scheme shows
  slightly larger errors at degrees <math|N=3,4>, when the error level has
  become small. The issue with RK schemes may be related with the way
  Dirichlet conditions are implemented inside the RK stages as studied
  in<nbsp><cite|Carpenter1995>. Figure<nbsp><reference|fig:cla5> shows the
  time history of the relative change in <math|L<rsup|2>> norm of the
  numerical solution; for degrees <math|N=1,2> the norm does not increase
  relative to the initial value but for degrees <math|N=3,4>, there is some
  increase in the norm at initial times for some schemes. In
  Figure<nbsp><reference|fig:cla5>, we also make comparison of LW and RK for
  <math|N=4>, with RK time integration performed with
  SSPRK54<nbsp><cite|Spiteri2002>. However, in all cases, the norm does not
  grow monotonically but reaches a periodic oscillatory behaviour. Unlike the
  case of periodic boundary conditions, the inflow and outflow boundary
  conditions may lead to increase and decrease in energy respectively; if the
  two mechanisms aren't exactly balanced, we can observe the oscillatory
  behaviour in the solution norm.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/la_rk_vs_lw_gl_tf2|0.40par|||>>|<cell|>|<cell|<image|figures/cla/la_rk_vs_lw_gll_tf2|0.40par|||>>>|<row|<cell|(b)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Error convergence for constant linear advection; (a) GL points
  , (b) GLL points. The different colors correspond to degrees
  <math|N=1,2,3,4> from top to bottom.<label|fig:cla2>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/error_1_la_15_NDOFS200|0.40par|||>>|<cell|>|<cell|<image|figures/cla/error_2_la_15_NDOFS200|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>|<row|<cell|<image|figures/cla/error_3_la_15_NDOFS200|0.40par|||>>|<cell|>|<cell|<image|figures/cla/error_4_la_15_NDOFS200|0.40par|||>>>|<row|<cell|(c)>|<cell|>|<cell|(d)>>>>>

    \;
  </big-figure|Error versus time for constant linear advection, initial
  condition <math|u(x, 0) = \\sin(2 \<pi\> x)>, <math|x\<in\> [0,1]>, for
  different polynomial degrees, each with 200 dofs; GL solution points and
  Radau correction. (a) <math|N=1>, (b) <math|N=2>, (c) <math|N=3>, (d)
  <math|N=4>.<label|fig:cla3>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/energy_1_la_15_NDOFS200|0.40par|||>>|<cell|>|<cell|<image|figures/cla/energy_2_la_15_NDOFS200|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>|<row|<cell|<image|figures/cla/energy_3_la_15_NDOFS200|0.40par|||>>|<cell|>|<cell|<image|figures/cla/energy_4_la_15_NDOFS200|0.40par|||>>>|<row|<cell|(c)>|<cell|>|<cell|(d)>>>>>

    \;
  </big-figure| Semi-log plot of relative change in L2 norm versus time for
  constant linear advection with the initial condition <math|u(x, 0) =
  sin(2\<pi\>x), x \<in\> [0, 1]> for different polynomial degrees, each with
  200 dofs; GL solution points and Radau correction.<label|fig:cla4>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/sin2pi_dirichlet|0.40par|||>>|<cell|>|<cell|<image|figures/cla/sin2pi_dirichlet_optimal_cfl|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Convergence for constant linear advection with Dirichlet
  boundary conditions; (a) using CFL numbers of LW-D1 for all schemes, (b)
  using corresponding CFL number for each scheme. The different colors
  correspond to degrees N = 1, 2, 3, 4 from top to
  bottom.<label|fig:cla2_dirichlet>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/energy_1_la_15_dirichlet_NDOFS200|0.40par|||>>|<cell|>|<cell|<image|figures/cla/energy_2_la_15_dirichlet_NDOFS200|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>|<row|<cell|<image|figures/cla/energy_3_la_15_dirichlet_NDOFS200|0.40par|||>>|<cell|>|<cell|<image|figures/cla/energy_4_la_15_dirichlet_NDOFS200|0.40par|||>>>|<row|<cell|(c)>|<cell|>|<cell|(d)>>>>>

    \;
  </big-figure| Semi-log plot of relative change in <math|L<rsub|2>> norm
  versus time for constant linear advection, with initial condition
  <math|u(x, 0) = sin(2\<pi\>x), x \<in\> [0, 1]> together with Dirichlet
  boundary conditions, for different polynomial degrees, each with 200 dofs;
  GL solution points and Radau correction.<label|fig:cla5>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/wpack_N3_ptwise|0.40par|||>>|<cell|>|<cell|<image|figures/cla/wpack_N4_ptwise|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Constant linear advection of a wave packet; solution at time
  <math|t = 1> with 160 dofs using polynomial degree (a) <math|N = 3>, (b)
  <math|N = 4>.<label|fig:wp1>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/wpack_min_cfl|0.40par|||>>|<cell|>|<cell|<image|figures/cla/wpack_gll_min_cfl|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Error convergence for constant linear advection of a wave
  packet; (a) GL points, (b) GLL points. The different colors correspond to
  degrees N = 1, 2, 3, 4 from top to bottom.<label|fig:wp2>>

  <subsubsection|Non-smooth solutions>

  If the initial condition is not smooth and has a jump discontinuity, then
  high order methods will generate oscillatory solutions due to the
  non-monotone property of the schemes as shown by Godunov. For such
  problems, we need some form of limiter to control the oscillations and we
  use the TVB-type limiters which are applied in a posteriori manner as
  explained in Section<nbsp><reference|sec:lim>. Consider the initial
  condition consisting of a square hat function,

  <\equation*>
    u*<around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|1,>|<cell|x\<in\><around|(|0.25,0.75|)>>>|<row|<cell|0,>|<cell|x\<in\><around|[|0,0.25|)>\<cup\><around|(|0.75,1|]>>>>>>
  </equation*>

  and which is extended by periodicity. We compute the solution upto the time
  <math|t=1> unit when the solution returns to its initial position.
  Figure<nbsp><reference|fig:hat1> shows the solutions obtained with degree
  <math|N=3,4> and without applying any limiter. We observe oscillations in
  case of <math|N=3> but no significant oscillations are seen for the
  <math|N=4> case. The oscillations are however localized around the
  discontinuity and do not corrupt the rest of the solution. When TVB limiter
  is applied, these oscillations disappear as seen in
  Figure<nbsp>(<reference|fig:hat2>) but the jumps are smeared over more
  cells. If we use the RK65 scheme which is fifth order accurate but has six
  stages, then the results are shown in Figure<nbsp>(<reference|fig:hat3>)
  where we observe increased smearing of the jump in the RK scheme. Overall,
  we see that the limiter smears the discontinuity over a few cells in case
  of both LW and RK schemes; but we also observe that the solutions obtained
  with the LW schemes are very similar to the RK schemes.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/linear_hat_deg3_unlimited|0.40par|||>>|<cell|>|<cell|<image|figures/cla/linear_hat_deg4_unlimited_ssprk54|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure| Constant linear advection of hat profile without limiter. The
  solution is shown at time t = 1 with 200 dofs using polynomial degree (a)
  <math|N = 3>, (b) <math|N = 4>.<label|fig:hat1>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/linear_hat_deg3_limited|0.40par|||>>|<cell|>|<cell|<image|figures/cla/linear_hat_deg4_limited_ssprk54|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure| Constant linear advection of hat profile with TVB limiter
  (<math|M = 100>). The solution is shown at time <math|t = 1> and 200 dofs
  using polynomial degree (a) <math|N = 3>, (b) <math|N =
  4>.<label|fig:hat2>>

  <\big-figure>
    <image|figures/cla/linear_hat_deg4_limited|0.40par|||>
  </big-figure| Constant linear advection of hat profile with TVB limiter
  (<math|M = 100>) where Runge-Kutta time integration is performed using
  RK65<nbsp><cite|Tsitouras2011>. The solution is shown at time <math|t = 1>
  and 200 dofs using polynomial degree <math|N = 4>.<label|fig:hat3>>

  We next consider a composite signal consisting of profiles with different
  levels of smoothness whose initial condition is a slightly different
  version of<nbsp><cite|Jiang1996> given by

  <\equation*>
    u*<around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|G*<around|(|x,\<beta\>,z|)>,>|<cell|-0.8\<le\>x\<le\>-0.6,>>|<row|<cell|1,>|<cell|-0.4\<le\>x\<le\>-0.2>>|<row|<cell|1-<around|\||10*<around|(|x-0.1|)>|\|>,>|<cell|0\<le\>x\<le\>0.2>>|<row|<cell|F*<around|(|x,\<alpha\>,a|)>,>|<cell|0.4\<le\>x\<le\>0.6>>|<row|<cell|0,>|<cell|<math-up|elsewhere>>>>>>
  </equation*>

  where <math|G*<around|(|x,\<beta\>,z|)>=<math-up|e><rsup|-\<beta\>*<around|(|x-z|)><rsup|2>>>,
  <math|F*<around|(|x,\<alpha\>,a|)>=<sqrt|1-\<alpha\><rsup|2>*<around|(|x-a|)><rsup|2>>>
  with the constants <math|a=0.5>, <math|z=-0.7>, <math|\<delta\>=0.005>,
  <math|\<alpha\>=10> and <math|\<beta\>=<frac|log 2|36*\<delta\><rsup|2>>>.
  This initial condition is composed of the succession of a Gaussian,
  rectangular, triangular and parabolic signals. We compute the numerical
  solutions at <math|t=8> (after <math|4> periods) and for degrees
  <math|N=3,4> but with 400 dofs in total for each case. The results without
  any limiter are shown in Figure<nbsp><reference|fig:mult1>; the profiles
  which are more regular are captured accurately by the numerical schemes,
  while the hat profile shows some oscillations. These oscillations are
  larger for <math|N=3> than for <math|N=4> case. When the TVB limiter is
  used, the corresponding solutions are shown in
  Figure<nbsp><reference|fig:mult2>. Now the oscillations in the hat profile
  are controlled but there is more numerical dissipation as is evident in the
  reduced amplitude of the smooth profiles. We observe that the results from
  the LW scheme are very similar to those of the RK scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/linear_mult_deg3_unlimited|0.40par|||>>|<cell|>|<cell|<image|figures/cla/linear_mult_deg4_unlimited_ssprk54|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Constant linear advection of a composite profile without
  limiter. The solution is shown at time <math|t = 8> using 400 dofs in each
  case and polynomial degree (a) <math|N = 3>, (b) <math|N =
  4>.<label|fig:mult1>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/cla/linear_mult_deg3_unlimited|0.40par|||>>|<cell|>|<cell|<image|figures/cla/linear_mult_deg4_unlimited_ssprk54|0.40par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Constant linear advection of a composite profile with TVB
  limiter (<math|M = 50>). The solution is shown at time <math|t = 8> using
  400 dofs in each case and polynomial degree (a) <math|N = 3>, (b) <math|N =
  4>.<label|fig:mult2>>

  <subsection|Linear advection equation: variable speed<label|sec: vla>>

  Now we consider the linear advection equation with spatially varying speed
  which is given by

  <\equation*>
    u<rsub|t>+f<around|(|x,u|)><rsub|x>=0,<space|2em>f<around|(|x,u|)>=a<around|(|x|)>*u
  </equation*>

  This problem is non-linear in the spatial variable, i.e., if
  <math|I<rsub|h>> is the interpolation operator, then
  <math|I<rsub|h>*<around|(|a*<value|uu><rsub|h>|)>\<ne\>I<rsub|h><around|(|a|)>*I<rsub|h><around|(|u<rsub|h>|)>>.
  This can lead to different behaviour of the numerical schemes compared to
  the linear case, depending on AE and EA methods for the numerical flux. To
  study the effect of non-linearity, we consider different types of speeds
  with different degree of non-linearity from <cite|Offner2019>.

  Figure<nbsp><reference|fig:vla1> shows the error convergence for the AE and
  EA schemes, and for the speed <math|a<around|(|x|)>=x> with initial
  condition <math|u<rsub|0><around|(|x|)>=sin<around|(|12*<around|(|x-0.1|)>|)>>.
  The domain is <math|<around|[|0.1,2*\<pi\>|]>> and we use Dirichlet
  boundary conditions at <math|x=0.1> and outflow condition at
  <math|x=2*\<pi\>> so that the exact solution is given by
  <math|u*<around|(|x,t|)>=e<rsup|-t>*<value|uu><rsub|0>*<around|(|x*e<rsup|-t>|)>>.
  As mentioned earlier, upwind flux is used to enforce the boundary condition
  at inflow boundaries. The LW scheme with either AE or EA method yields
  correct convergence rates, while the RK scheme exhibits a small
  super-convergence. The right most figure shows that the error levels with
  AE and EA are nearly same. The non-linearity in this problem is small
  enough that it does not spoil the error and convergence behaviour of the LW
  schemes, for both AE and EA methods.

  Figure<nbsp>(<reference|fig:vla2>) shows the error convergence for the AE
  and EA schemes, and for the non-linear speed
  <math|a<around|(|x|)>=x<rsup|2>>, with initial condition
  <math|u<rsub|0><around|(|x|)>=cos<around|(|\<pi\>*x/2|)>>. The domain is
  <math|<around|[|0.1,1|]>>, and we use Dirichlet boundary conditions at
  <math|x=0.1> which is an inflow boundary, and outflow condition at
  <math|x=1> so that the exact solution is given by
  <math|u<around|(|x,t|)>=u<rsub|0><around|(|x/<around|(|1+t*x|)>|)>/<around|(|1+t*x|)><rsup|2>>.
  For odd degrees, the LW scheme with AE shows larger errors compared to the
  RK scheme though the convergence rate is optimal. The LW scheme with EA
  shown in the middle figure, is as accurate as the RK scheme at all degrees.
  The last figure compares AE and EA schemes using GL solution points, Radau
  correction function and D2 dissipation; we clearly see that EA scheme has
  smaller errors than AE scheme at odd degrees, while they are very similar
  for even degrees. Figure<nbsp><reference|fig:vla3> shows the error versus
  time plots for degrees <math|N=3,4>; we see that the LW and RK schemes have
  very similar error levels and the superior performance of RK schemes
  observed for constant linear advection is not realized in this non-linear
  case.

  We have observed the same behaviour in all other non-linear test cases
  given in<nbsp><cite|Offner2019> but the results are not shown here, i.e.,
  the LW schemes with EA perform at par with RK schemes for non-linear
  problems.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|2|2|5|5|cell-halign|c>|<table|<row|<cell|<image|figures/vla/or1_rk_vs_lw_ae_tf1|0.30par|||>>|<cell|>|<cell|<image|figures/vla/or1_rk_vs_lw_ea_tf1|0.30par|||>>|<cell|>|<cell|<image|figures/vla/or1_eval_vs_extrap_tf1|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>|<cell|>|<cell|(c)>>>>>

    \;
  </big-figure| Error convergence for variable linear advection with
  <math|a(x) = x>: (a) AE scheme, (b) EA scheme, (c) AE vs
  EA.<label|fig:vla1>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|2|2|5|5|cell-halign|c>|<table|<row|<cell|<image|figures/vla/or2_extrap_Tf1|0.30par|||>>|<cell|>|<cell|<image|figures/vla/or2_eval_1_min_cfl|0.30par|||>>|<cell|>|<cell|<image|figures/vla/or2_1_min_cfl|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>|<cell|>|<cell|(c)>>>>>

    \;
  </big-figure| Error convergence for variable linear advection with
  <math|a(x) = x<rsup|2>>: (a) AE scheme, (b) EA scheme, (c) AE vs
  EA.<label|fig:vla2>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/vla/or2_eval_3_dofs160_tf50|0.30par|||>>|<cell|>|<cell|<image|figures/vla/or2_eval_4_dofs160_tf50|0.30par|||>>>|<row|<cell|(a)
    <math|N=3>>|<cell|>|<cell|(b) <math|N=4>>>>>>

    \;
  </big-figure| Error versus time for linear advection with wave speed
  <math|a(x) = x<rsup|2>> for different polynomial degrees; GL solution
  points, Radau correction and polynomial degree (a) <math|N = 3>, (b)
  <math|N = 4>.<label|fig:vla3>>

  <subsection|Inviscid Burgers' equation>

  The one dimensional Burger's equation is a conservation law of the form
  <math|u<rsub|t>+f<around|(|u|)><rsub|x>=0> with the quadratic flux
  <math|f<around|(|u|)>=u<rsup|2>/2>. For the smooth initial condition
  <math|u*<around|(|x,0|)>=0.2*sin <around|(|x|)>>, we compute the numerical
  solution at different times <math|t\<in\><around|{|2.0,4.5,8.0|}>> with
  periodic boundary condition in the domain <math|<around|[|0,2*\<pi\>|]>>.
  The TVB limiter with parameter <math|M=1> is used. A stationary
  discontinuity is formed at <math|x=\<pi\>> and time <math|t<rsub|c>=5.0>.
  The solutions are shown in Figure<nbsp><reference|fig:burg1> for degree
  <math|N=3> and compared with the results from the RK method. We see that
  the discontinuity is captured accurately and without any oscillations, and
  the LW results compare very well with the RK results. At time <math|t=2>,
  the solution is still smooth and we can obtain the exact solution, using
  which, error norms and convergence rates can be estimated, see
  Figure<nbsp><reference|fig:burg2>.

  Figure<nbsp><reference|fig:burg2>a compares the error norms for the AE and
  EA methods for the Rusanov numerical flux, and using GL solution points,
  Radau correction and D2 dissipation; at odd degrees, the convergence rate
  of AE is less than optimal and close to <math|O<around|(|h<rsup|N+1/2>|)>>,
  while at even degrees, we obtain the optimal
  <math|O<around|(|h<rsup|N+1>|)>> rate. In
  Figure<nbsp><reference|fig:burg2>b, we see that error norms of LW-EA and RK
  schemes are very close. In Figure<nbsp><reference|fig:burg2>c, we compare
  the two correction functions using the EA scheme and Rusanov flux; it is
  clear that the errors with Radau correction are significantly smaller than
  those with <math|<value|g2>> correction.

  Next, we study the effect of different numerical fluxes in
  Figure<nbsp><reference|fig:burg4> for odd degrees <math|N=1,3>. With the AE
  scheme, only the global Lax-Friedrich flux is able to achieve the correct
  convergence rates and has the smallest errors compared to other fluxes
  which is a surprising result since it is a very dissipative flux. When the
  EA scheme is used as shown in the right of
  Figure<nbsp><reference|fig:burg4>, all the numerical fluxes perform very
  similarly and achieve the optimal convergence rate. An examination of the
  error distribution in space shows that the AE scheme in combination with
  any numerical flux other than global Lax-Friedrich, produces large errors
  around the region of sonic points where <math|f<rprime|'><around|(|u|)>=0>;
  however this happens only for odd degrees and the reason for this behaviour
  is not known at present. For initial data where the solution does not have
  a sonic point as in Example 2 of<nbsp><cite|Lou2020>, we get optimal
  convergence rates for all degrees even with the AE scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|2|2|5|5|cell-halign|c>|<table|<row|<cell|<image|figures/burg1d/burger_sin_Tf2_ndofs400_deg3|0.30par|||>>|<cell|>|<cell|<image|figures/burg1d/burger_sin_Tf4.5_ndofs400_deg3.pdf|0.30par|||>>|<cell|>|<cell|<image|figures/burg1d/burger_sin_Tf8_ndofs400_deg3|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>|<cell|>|<cell|(c)>>>>>

    \;
  </big-figure|Solution of 1-D Burger's equation with <math|N=3> and 100
  cells at different time instants. TVB limiter <math|(M=1)> is used. The
  reference solution is computed using RKFR, degree <math|N=1>, on a mesh of
  3500 cells.<label|fig:burg1>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|2|2|5|5|cell-halign|c>|<table|<row|<cell|<image|figures/burg1d/burger_sin_2_min_cfl|0.30par|||>>|<cell|>|<cell|<image|figures/burg1d/burger_sin_eval_2_min_cfl|0.30par|||>>|<cell|>|<cell|<image|figures/burg1d/burger_sin_eval_2_g2_vs_gll_min_cfl|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>|<cell|>|<cell|(c)>>>>>

    \;
  </big-figure|Error convergence for 1-D Burger's equation at time
  <math|t=2>. (a) AE vs EA, (b) Radau vs g2, EA scheme, (c) LW-EA vs
  RK.<label|fig:burg2>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/burg1d/burger_sin_extrap_2_min_cfl_N13|0.30par|||>>|<cell|>|<cell|<image|figures/burg1d/burger_sin_eval_2_min_cfl_N13|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Error convergence for 1-D Burger's equation at time
  <math|t=2>; effect of numerical fluxes for <math|N=1,3>. (a) AE scheme, (b)
  EA scheme.<label|fig:burg4>>

  <subsection|Non-convex problem: Buckley-Leverett equation>

  We consider the Buckley-Leverett equation
  <math|u<rsub|t>+f<around|(|u|)><rsub|x>=0>, where the flux
  <math|f<around|(|u|)>=<dfrac|4*u<rsup|2>|4*u<rsup|2>+<around|(|1-u|)><rsup|2>>>
  is convex and concave in different regions of the solution space. The
  numerical solution is computed up to the time <math|t=0.4> with the initial
  condition

  <\equation*>
    u*<around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|1,>|<cell|x\<in\><around|[|-1/2,0|]>>>|<row|<cell|0,>|<cell|<math-up|elsewhere>>>>>>
  </equation*>

  At <math|t=0.4>, the characteristics that originate from the two
  discontinuities do not intersect, and thus we only have to deal with the
  two uncoupled Riemann problems. Solutions to Riemann problems for piecewise
  strictly convex-concave fluxes can be computed explicitly. In case of the
  Buckley-Leverett model, we can split the state-space
  <math|<around|[|0,1|]>> into <math|<around|[|0,u<rsub|*<text|buck>>|]>> and
  <math|<around|[|u<rsub|*<text|buck>>,1|]>> so that <math|f> is strictly
  convex in <math|<around|(|0,u<rsub|*buck>|)>> and strictly concave in
  <math|<around|(|u<rsub|*buck>,1|)>>. Thus, the solution to a Riemann
  problem with states <math|0,1> would compose of a rarefaction and shock,
  and the exact solution corresponding to the above defined initial condition
  is composed of two rarefaction-shock combinations. Since the solution
  measures saturation of displacing fluid, it should lie in the interval
  <math|<around|[|0,1|]>> and we try to enforce this by applying a positivity
  preserving scaling limiter<nbsp><cite|Zhang2010b>. For the LW schemes, we
  cannot strictly prove the positivity of the resulting scheme but numerical
  results show that this holds in practice, with slightly reduced CFL number
  compared to the Fourier CFL number. For <math|N=4>, the optimal CFL
  conditions preserve the bounds, while a slightly reduced CFL of 0.079 was
  needed for <math|N=3>. Figure<nbsp>(<reference|fig:bucklev1>) shows the
  results at the final time obtained using degree <math|N=3,4>, respectively.
  Since the flux is monotone in solution space, an upwind numerical flux is
  used at cell interfaces, i.e., <math|F<rsub|<eph>>=F<rsub|<eph>><rsup|->>.
  The numerical solutions are able to resolve all the waves well including
  correct shock location, and they compare well with the results from the RK
  scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/bucklev/hatbuck_N3|0.30par|||>>|<cell|>|<cell|<image|figures/bucklev/hatbuck_N4|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|Solution of 1-D Burger's equation with <math|N=3> and 100
  cells at different time instants. TVB limiter <math|(M=1)> is used. The
  reference solution is computed using RKFR, degree <math|N=1>, on a mesh of
  3500 cells.<label|fig:bucklev1>>

  <section|Numerical results in 1-D: Euler equations ><label|sec:res1dsys>

  As an example of system of non-linear hyperbolic equations, we consider the
  one-dimensional Euler equations of gas dynamics given by

  <\equation>
    <label|eq:1deuler><pd||t><matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*u>>|<row|<cell|E>>>>>+<pd||x>*<matrix|<tformat|<table|<row|<cell|\<rho\>*u>>|<row|<cell|p+\<rho\>*u<rsup|2>>>|<row|<cell|<around*|(|E+p|)>*u>>>>>=0
  </equation>

  where <math|\<rho\>,u,p> and <math|E> denote the density, velocity,
  pressure and total energy of the gas, respectively. For a polytropic gas,
  an equation of state <math|E=E<around|(|\<rho\>,u,p|)>> which leads to a
  closed system is given by

  <\equation>
    <label|eq:state>E=E<around|(|\<rho\>,u,p|)>=<frac|p|\<gamma\>-1>+<frac|1|2>*\<rho\>*u<rsup|2>
  </equation>

  where <math|\<gamma\>\<gtr\>1> is the adiabatic constant, that will be
  taken as <math|1.4> which is the value for air. The numerical fluxes for
  Euler equations are explained in the Appendix<nbsp><reference|apendix:numfluxes>.
  In the following results, wherever it is not mentioned, we use the Rusanov
  flux.

  In the scalar results, we see that the LW scheme with Radau correction
  function is superior to that with <math|g<rsub|2>> correction function in
  terms of error reduction. In light of this, for the 1-D Euler case we
  compare the performance of LW scheme with RK scheme using the Radau
  correction function. It is also observed that the EA scheme is more
  accurate than AE in the scalar case. So, for the 1-D Euler case we present
  only those results obtained using EA schemes.

  Note that wherever it is not specified we use the CFL numbers of
  Table<nbsp>(<reference|tab:cfl>) and whenever we compare the numerical
  solutions of LW scheme with that of RK scheme, both are run with the CFL
  numbers of LW scheme. In the time integration of the RK schemes, for degree
  <math|N=1> and <math|2>, we use <math|<around|(|N+1|)>>-stage SSPRK method
  of order <math|N+1>. For <math|N=3>, we use a five stage, SSPRK method of
  order four<nbsp><cite|Spiteri2002> as there is no four stage SSPRK method.
  In smooth test cases and for <math|N=4>, we use a six stage Runge-Kutta
  method of order five<nbsp><cite|Tsitouras2011>. In those test cases where
  the solution is not sufficiently smooth, the SSP property of the RK time
  integration is useful in obtaining non-oscillatory solutions. As we do not
  have SSPRK method of order five with positive
  coefficients<nbsp><cite|Ruuth2002>, we use the SSPRK
  method<nbsp><cite|Spiteri2002> of order four when <math|N=4>.

  <subsection|Smooth solution>

  To verify the accuracy of the proposed scheme, we solve the Euler equations
  <eqref|eq:1deuler>,<nbsp><eqref|eq:state> with a smooth initial condition

  <\equation*>
    \<rho\>*<around|(|x,0|)>=1+0.5*sin <around|(|2*\<pi\>*x|)>,<space|2em>u<around|(|x,0|)>=1,<space|2em>p*<around|(|x,0|)>=1
  </equation*>

  in the domain <math|<around|[|0,1|]>> with periodic boundary condition for
  all the variables. The corresponding exact solution is a density wave,
  i.e., it consists of a translation of the initial density at constant speed
  of one, and is given by

  <\equation*>
    \<rho\>*<around|(|x,t|)>=1+0.5*sin <around|(|2*\<pi\>*<around|(|x-t|)>|)>,<space|2em>u<around|(|x,t|)>=1,<space|2em>p*<around|(|x,t|)>=1
  </equation*>

  We compute the solution up to the time <math|t=1> and estimate the error
  norms. The linear nature of this test case makes EA and AE schemes
  equivalent, and we show only the EA results. We plot the error in the
  density obtained using the LW and RK schemes and the corresponding results
  are given in Figure<nbsp>(<reference|fig:dwave>). In each case we observe
  the expected order of accuracy and the error reduction is close to that of
  RK scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/euler1d/dwave/gl_radau_eval_tf1|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/dwave/gll_radau_eval_tf1|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  <|big-figure>
    Density error convergence for 1-D Euler's equation at time <math|t=1>.
    The different colors correspond to degrees <math|N=1,2,3,4> from top to
    bottom. (a) GL points, (b) GLL points.<label|fig:dwave>
  </big-figure>

  <\remark>
    Based on the scalar test cases and the above smooth test case for Euler
    equations, in all the remaining 1-D Euler test cases, we present only the
    results obtained using D2 scheme since it is advantageous in terms of
    having higher CFL number and performs as well as or better than the D1
    scheme.
  </remark>

  <subsection|Sod's shock tube problem>

  The Sod's shock tube problem<nbsp><cite|Sod1978> is a Riemann problem which
  models a shock tube where gas at two different conditions initially is
  allowed to interact, with the formation of many waves including shock,
  contact and rarefaction waves. The Euler equations<nbsp><eqref|eq:1deuler>
  are solved with the initial condition

  <\equation>
    <label|eq:sod><around|(|\<rho\>,u,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1,0,1|)>,>|<cell|<space|2em>>|<cell|if
    x\<less\>0.5>>|<row|<cell|<around*|(|0.125,0,0.1|)>,>|<cell|>|<cell|if
    x\<gtr\>0.5>>>>>
  </equation>

  for which the exact solution is composed of a left rarefaction, a contact
  discontinuity and a right shock wave. The approximated solution is computed
  in the domain <math|<around|[|0,1|]>> with the outflow boundary conditions
  on both the ends <math|x=0> and <math|x=1>. We run the numerical scheme up
  to time <math|t=0.2> with 100 cells using the TVB limiter with parameter
  <math|M=10>. The density profile obtained using the LW and RK schemes for
  <math|N=3> and <math|N=4> are shown in Figure<nbsp><reference|fig:sod>
  together with the exact solution. From the plots it is visible that the
  results obtained using the LW scheme agree very well with that of RK
  scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/sodk3Rgl|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/sodk4Rgl|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|Numerical solutions of 1-D Euler equations (Sod's test case)
  obtained by LW and RK schemes for polynomial degree (a) <math|N=3> and (b)
  <math|N=4> using Radau correction function and GL solution points. The
  solutions are shown at time <math|t=0.2> on a mesh of <math|100> cells with
  Rusanov flux and D2 dissipation. The TVB limiter is used with the parameter
  <math|M=10>.<label|fig:sod>>

  <subsection|Lax problem>

  We consider the Lax problem given in<nbsp><cite|Lax1954|Hirsch1990> which
  solves a Riemann problem for the system of equations <eqref|eq:1deuler>
  with initial condition

  <\equation>
    <around|(|\<rho\>,u,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|0.445,0.698,3.528|)>,>|<cell|<space|2em>>|<cell|if
    x\<less\>0>>|<row|<cell|<around*|(|0.5,0,0.571|)>,>|<cell|>|<cell|if
    x\<gtr\>0>>>>>
  </equation>

  where, unlike the Sod's shock tube problem, the initial velocity is not
  zero. The exact solution of this Riemann problem is known and it consists
  of a rarefaction, a right moving contact discontinuity and shock. For a
  detailed description of this problem, see<nbsp><cite|Hirsch1990>. This is a
  demanding test case in the sense that, high order schemes are prone to
  produce oscillations near the contact discontinuity. The numerical solution
  is computed up to time <math|t=1.3> in the domain <math|<around|[|-5,5|]>>
  using 100 cells and using TVB limiter with parameter <math|M=1>. The
  approximate solutions are computed for polynomial degrees <math|N=3> and
  <math|N=4>, and the corresponding density profiles are shown in
  Figure<nbsp>(<reference|fig:lax>) along with the exact solution. We observe
  that the LW scheme captures the wave structures accurately without
  oscillations and the numerical solutions are very close to that of RK
  scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/laxk3Rgl|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/laxk4Rgl|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure| Numerical solutions of 1-D Euler equations (Lax's test case)
  obtained by LW and RK schemes for polynomial degree (a) <math|N = 3> and
  (b) <math|N = 4> with Radau correction function and GL solution points. The
  solutions are computed on a mesh of 200 cells with dissipation model D2 and
  Rusanov numerical flux and are shown at time <math|t = 1.3>. The TVB
  limiter is used with parameter <math|M = 1>.<label|fig:lax>>

  <subsection|Shu-Osher problem>

  This problem was developed in<nbsp><cite|Shu1989> to test the numerical
  scheme's capability to accurately capture a shock wave and its interaction
  with a smooth density field, which then propagates downstream of the shock.
  Here, we compute the numerical solution of<nbsp><eqref|eq:1deuler> with
  initial condition

  <\equation>
    <label|eq:shuosher><around|(|\<rho\>,u,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|3.857143,
    2.629369, 10.333333|)>,>|<cell|<space|2em>>|<cell|if
    x\<less\>-4>>|<row|<cell|(1+0.2*sin(5x),0,1),>|<cell|>|<cell|if
    x\<geq\>-4>>>>>
  </equation>

  prescribed in the domain <math|<around|[|-5,5|]>> at time <math|t=1.8>. The
  smooth density profile passes through the shock and appears on the other
  side, and its accurate computation is challenging due to numerical
  dissipation. We discretize the spatial domain with 400 cells and to control
  the spurious oscillations we use the TVB limiter with parameter
  <math|M=300><nbsp><cite|Qiu2005b>. The density component of the approximate
  solutions computed using LW and RK schemes for <math|N=3> and <math|N=4>
  are plotted against a reference solution obtained using a very fine mesh,
  and are given in Figure<nbsp>(<reference|fig:ShuOsher>). We observe that
  the complicated wave patterns are accurately captured by the proposed LW
  scheme. Furthermore, the enlarged plots of the oscillatory portion indicate
  that the numerical solutions corresponding to LW scheme are comparable with
  that of RK schemes.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-rborder|0ln>|<cwith|3|3|1|3|cell-valign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/shuosherk3Rgl|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/shuosherk4Rgl|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>|<row|<cell|<image|figures/euler1d/evaluate/zoom_shuosherk3Rgl|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/zoom_shuosherk4Rgl|0.30par|||>>>>>>

    \;
  </big-figure|Numerical solutions of 1-D Euler equations (Shu-Osher problem)
  obtained by LW and RK schemes for (a, c) <math|N=3> and (b, d) <math|N=4>
  with Radau correction function and GL solution points. The enlarged plot of
  the oscillatory portion is given in the bottom row. The solutions are shown
  at time <math|t=1.8> on a mesh of 400 cells with dissipation model D2 and
  Rusanov numerical flux. \ The TVB limiter is used with parameter
  <math|M=300>.<label|fig:ShuOsher>>

  <subsection|Blast wave>

  In this test case the Euler equations<nbsp><eqref|eq:1deuler> are solved
  with the initial condition

  <\equation*>
    <around|(|\<rho\>,u,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1,0,1000|)>,>|<cell|<space|2em>>|<cell|if
    x\<less\>0.1>>|<row|<cell|<around*|(|1,0,0.01|)>,>|<cell|>|<cell|if
    0.1\<less\>x\<less\>0.9>>|<row|<cell|<around*|(|1,0,100|)>,>|<cell|>|<cell|if
    x\<gtr\>0.9>>>>>
  </equation*>

  in the domain <math|<around|[|0,1|]>>. It is originally introduced
  in<nbsp><cite|Woodward1984> to check the capability of the numerical scheme
  to accurately capture the shock-shock interaction scenario. The boundaries
  are set as solid walls by imposing the reflecting boundary conditions at
  <math|x=0> and <math|x=1>. The solution consists of reflection of shocks
  and expansion waves off the boundary wall and several wave interactions
  inside the domain. With a grid of 400 cells, we run the simulation till the
  time <math|t=0.038> where a high density peak profile is produced. The TVB
  limiter as in<nbsp><cite|Qiu2005b> with parameter <math|M=300> is used
  along with a positivity preserving limiter<nbsp><cite|Zhang2010b>. We
  compare the performance of the LW scheme with the RK scheme and analyse how
  well they predict the density profile and its peak amplitude. For
  <math|N=3> and <math|N=4> cases, the results are given in
  Figure<nbsp>(<reference|fig:blast>) where the approximated density profiles
  are compared with a reference solution computed using a very fine mesh.
  From the plots it is evident that the computed density profile obtained
  using LW scheme are close to that of RK scheme.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/zoom_blastk3Rgl|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/zoom_blastk4Rgl|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>

    \;
  </big-figure|. Numerical solutions of 1-D Euler equations (Blast wave)
  obtained by LWFR and RKFR schemes for (a) <math|N = 3> and (b) <math|N = 4>
  using Radau correction function and GL solution points. The solutions are
  plotted at time <math|t = 0.038> on a mesh of 400 cells with dissipation
  model D2 and Rusanov numerical flux. The corresponding CFL numbers of LWFR
  scheme are chosen from the Table<nbsp><reference|tab:cfl> and kept same for
  the RKFR schemes. TVB limiter is used with the parameter <math|M = 300> and
  the EA scheme is used for numerical flux.<label|fig:blast>>

  <subsection|Numerical fluxes: LF, Roe, HLL and HLLC>

  The previous Euler results used Rusanov flux. In the LW scheme, we can also
  use other numerical fluxes like HLL, HLLC, Roe and global Lax-Friedrichs
  and compare its performance with the standard Rusanov flux. A description
  of these fluxes is given in the Appendix<nbsp>apendix:numfluxes. Fluxes
  like HLL, HLLC and Roe may be desirable in some problems due to their
  upwind character, unlike Lax-Friedrich/Rusanov type fluxes. Moreover HLLC
  and Roe fluxes also model the linear contact and shear waves which can lead
  to better approximations of these waves. We have tested the numerical
  fluxes in all the test cases, however to save space we present only the
  blast test case for <math|N=3>. The results are given in
  Figure<nbsp><reference|fig:numflx> which compare these fluxes with Rusanov
  flux. The high density peak region is better approximated by the LW schemes
  using HLL, HLLC and Roe fluxes, as compared to the Rusanov flux. The global
  LF flux is found to be less accurate in this respect when compared to the
  Rusanov flux, which is expected due to the larger amount of numerical
  dissipation in the global Lax-Friedrich flux.

  Since HLLC and Roe schemes contain more information about the wave
  structure, they are better at resolving contact discontinuities which are
  linearly degenerate waves that can be severely affected by numerical
  dissipation. We illustrate this through two Riemann problems containing
  stationary contact waves. The first one consists of an initial density jump
  that leads to a stationary contact wave, with initial condition given by,

  <\equation*>
    <around|(|\<rho\>,u,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1,0,1|)>,>|<cell|<space|2em>>|<cell|if
    x\<less\>0.5>>|<row|<cell|<around*|(|2,0,1|)>,>|<cell|>|<cell|if
    x\<gtr\>0.5>>>>>
  </equation*>

  In Figure<nbsp><reference|fig:numflux_toro5_contact>a, we show the
  comparison of numerical fluxes for this stationary solution test case,
  zoomed near the discontinuity, at <math|t=1.0> using LW schemes with D2
  dissipation model for degree <math|N=4> on a grid of 100 cells together
  with TVB (<math|M=1>) limiter. As expected, we see that Roe and HLLC fluxes
  are able to resolve the contact discontinuity exactly, while the other
  fluxes smear the jump over two cells.

  The second Riemann problem is a tough test case with respect to maintaining
  positivity of pressure and is taken from<nbsp><cite|Toro2009>. The initial
  condition is given by

  <\equation*>
    <around|(|\<rho\>,u,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1,-19.59745,1000|)>,>|<cell|<space|2em>>|<cell|if
    x\<less\>0.8>>|<row|<cell|<around*|(|1,-19.59745,0.01|)>,>|<cell|>|<cell|if
    x\<gtr\>0.8>>>>>
  </equation*>

  The solution develops a stationary contact at the location of the initial
  discontinuity <math|x=0.8> and a right moving shock wave. In
  Figure<nbsp><reference|fig:numflux_toro5_contact>b, we show the comparison
  of numerical fluxes, zoomed near the contact discontinuity, at
  <math|t=0.012> obtained using LW scheme with D2 dissipation model for
  polynomial degree <math|N=4> on a grid of 100 cells and TVB (<math|M=1>)
  limiter. As in the previous case, the HLLC flux captures the contact
  discontinuity more accurately than the other fluxes.

  <big-figure|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/fc_zoom_blastk3Rglglxf|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/fc_zoom_blastk3Rglhll|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>|<row|<cell|<image|figures/euler1d/evaluate/fc_zoom_blastk3Rglhllc|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/fc_zoom_blastk3Rglroe|0.30par|||>>>|<row|<cell|(c)>|<cell|>|<cell|(d)>>>>>|Numerical
  solutions of 1-D Euler equations (Blast wave) obtained by LW schemes with
  different numerical fluxes (a) LF, (b) HLL, (c) HLLC and (d) ROE compared
  with Rusanov flux, for <math|N=3> using Radau correction function and GL
  solution points. All other parameters remain the same as in
  Figure<nbsp><reference|fig:blast>.<label|fig:numflx>>

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/contact4|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/toro5_allfluxes|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>|Numerical
  solutions of 1-D Euler's equations for (a) stationary contact test, (b)
  Toro's Test 5 obtained by LW schemes with different numerical fluxes for
  polynomial degree <math|N=4> using Radau correction function and GL
  solution points, TVB <math|<around|(|M=1|)>> limiter on a grid of 100
  cells.<label|fig:numflux_toro5_contact>>

  <subsection|Comparison of correction functions>

  We compare the robustness and accuracy of the two correction functions,
  Radau and g2, in the LW scheme when applied to the Euler
  equations<nbsp><eqref|eq:1deuler> with GL solution points. The numerical
  experiments are conducted for the Shu-Osher test case and the corresponding
  results are obtained with the HLLC numerical flux for polynomial degrees
  <math|N=1,2,3,4>, see Figure<nbsp><reference|fig:ShuOsherCorr>. For this
  test case, it is observed that the LW scheme with g2 correction function
  fails to work for <math|N=1> with the optimal CFL of
  Table<nbsp><reference|tab:cfl> due to loss of positivity of pressure. So,
  we use a smaller CFL number of <math|0.44> to compute the <math|N=1> case
  in Figure<nbsp><reference|fig:ShuOsherCorr>. For <math|N\<ge\>2>, the
  solutions computed using the <math|g<rsub|2>> correction function are found
  to be close to that of Radau correction function. However, it fails to
  perform consistently, as we see in the <math|N=1> case. With this
  observation and also the behaviour for other problems, we see that it is
  desirable to use the Radau correction function in the LW scheme.

  <big-figure|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/euler1d/evaluate/zoom_shuosherk1g2R|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/zoom_shuosherk2g2R|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>|<row|<cell|<image|figures/euler1d/evaluate/zoom_shuosherk3g2R|0.30par|||>>|<cell|>|<cell|<image|figures/euler1d/evaluate/zoom_shuosherk4g2R|0.30par|||>>>|<row|<cell|(c)>|<cell|>|<cell|(d)>>>>>|Numerical
  solutions of 1-D Euler equations (Shu-Osher problem) for (a) <math|N=1>,
  (b) <math|N=2>, (c) <math|N=3>, (d) <math|N=4>. Comparison of LW scheme
  with GL solution points for two correction functions, Radau and g2, with
  their own CFL numbers chosen from Table<nbsp><reference|tab:cfl>, except
  for <math|<value|g2>> correction function with <math|N=1>, where we choose
  CFL=0.44. The enlarged oscillatory portion of the solutions are shown. The
  solutions are computed at time <math|t=1.8> on a mesh of 400 cells with
  dissipation model D2 and HLLC numerical flux. The TVB limiter is used with
  parameter <math|M=300>.<label|fig:ShuOsherCorr>>

  <big-figure|<with|par-mode|center|<image|illustrations/dofs2d|0.7par|||><label|fig:dofs2d>>|Location
  of solution points and flux points. Numerical flux is required at the blue
  points on the faces.>

  <section|Two dimensional scheme>

  The extension of the 1-D scheme to two dimensions is performed by applying
  the 1-D ideas along each coordinate direction. Consider a 2-D conservation
  law of the form

  <\equation>
    <value|uu><rsub|t>+<value|pf><around|(|<value|uu>|)><rsub|x>+<bg><around|(|<value|uu>|)><rsub|y>=<value|bzero>
  </equation>

  where <math|<around|(|<value|pf>,<value|pg>|)>> are Cartesian components of
  the flux vector. Using Taylor expansion in time, we can write the solution
  at <math|t=t<rsub|n+1>> as

  <\equation*>
    <value|pf><rsup|n+1>=<value|uu><rsup|n>-\<Delta\>t*<around*|[|<pd|<value|F>|x><around|(|<value|uu><rsup|n>|)>+<pd|<bG>|y><around|(|<value|uu><rsup|n>|)>|]>+O<around|(|\<Delta\>t<rsup|N+2>|)>
  </equation*>

  where <math|<value|F>,<bG>> are time average fluxes given by

  <\equation*>
    <value|F><around|(|<value|uu>|)>=<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*<value|pf><around|(|<value|uu>|)>,<space|2em><bG><around|(|<value|uu>|)>=<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*<bg><around|(|<value|uu>|)>
  </equation*>

  We will consider a Cartesian mesh and map each element
  <math|\<Omega\><rsub|e>> to the reference element
  <math|<Kref>=<around|[|0,1|]>\<times\><around|[|0,1|]>>. Inside the
  reference element, the solution points are chosen to be tensor product of
  1-D solution points, which may be either GL or GLL points.
  Figure<nbsp><reference|fig:dofs2d> shows an example of 2-D solution points
  based on tensor product of 1-D GL points. The solution inside an element
  <math|\<Omega\><rsub|e>> is approximated by a tensor product polynomial of
  degree <math|N>,

  <\equation*>
    <around|(|x,y|)>\<in\>\<Omega\><rsub|e>:<space|2em><value|uu><rsub|h>=<big|sum><rsub|p=0><rsup|N><big|sum><rsub|q=0><rsup|N><value|uu><rsub|e,p*q>*\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|\<eta\>|)>
  </equation*>

  where <math|<around|(|\<xi\>,\<eta\>|)>> are coordinates in the reference
  element, and <math|\<ell\><rsub|p><around|(|\<xi\>|)>,\<ell\><rsub|q><around|(|\<eta\>|)>>
  are the 1-D Lagrange polynomials based on the solution points. The
  discontinuous fluxes are approximated by interpolating at the solution
  points,

  <\equation*>
    <value|F><rsub|h><rsup|\<delta\>>*<around|(|\<xi\>,\<eta\>|)>=<big|sum><rsub|p=0><rsup|N><big|sum><rsub|q=0><rsup|N><value|F><rsub|p*q><rsup|e>*\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|\<eta\>|)>,<space|2em><bG><rsub|h><rsup|\<delta\>>*<around|(|\<xi\>,\<eta\>|)>=<big|sum><rsub|p=0><rsup|N><big|sum><rsub|q=0><rsup|N><bG><rsub|p*q><rsup|e>*\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|\<eta\>|)>
  </equation*>

  where <math|<value|F><rsub|p*q><rsup|e>,<bG><rsub|p*q><rsup|e>> are time
  average fluxes obtained from the Lax-Wendroff procedure applied at each
  solution point. The continuous flux along the <math|x> and <math|y> axes
  are constructed using the one dimensional algorithm along the
  <math|\<eta\>=\<xi\><rsub|q>=>constant and
  <math|\<xi\>=\<xi\><rsub|p>=>constant lines, respectively, see
  Figure<nbsp><reference|fig:dofs2d>,

  <\equation*>
    <value|F><rsub|h>*<around|(|\<xi\>,\<xi\><rsub|q>|)>=<around|[|<value|F><rsub|<emh>,q>-<value|F><rsub|h><rsup|\<delta\>>*<around|(|0,\<xi\><rsub|q>|)>|]>*g<rsub|L><around|(|\<xi\>|)>+<value|F><rsub|h><rsup|\<delta\>><around|(|\<xi\>,\<xi\><rsub|q>|)>+<around|[|<value|F><rsub|<eph>,q>-<value|F><rsub|h><rsup|\<delta\>>*<around|(|1,\<xi\><rsub|q>|)>|]>*g<rsub|R><around|(|\<xi\>|)>,<space|2em>0\<le\>q\<le\>N
  </equation*>

  <\equation*>
    <bG><rsub|h><around|(|\<xi\><rsub|p>,\<eta\>|)>=<around|[|<bG><rsub|<emh>,p>-<bG><rsub|h><rsup|\<delta\>>*<around|(|\<xi\><rsub|p>,0|)>|]>*g<rsub|L><around|(|\<eta\>|)>+<bG><rsub|h><rsup|\<delta\>>*<around|(|\<xi\><rsub|p>,\<eta\>|)>+<around|[|<bG><rsub|<eph>,p>-<bG><rsub|h><rsup|\<delta\>>*<around|(|\<xi\><rsub|p>,1|)>|]>*g<rsub|R><around|(|\<eta\>|)>,<space|2em>0\<le\>p\<le\>N
  </equation*>

  Note that the above equations are obtained by applying the FR idea along
  the horizontal and vertical lines in Figure<nbsp><reference|fig:dofs2d>.
  The quantities <math|<value|F><rsub|<emh>>,<value|F><rsub|<eph>>> are
  <math|x>-directional numerical fluxes on the left and right faces, while
  <math|<bG><rsub|<emh>>,<bG><rsub|<eph>>> are the <math|y>-directional
  numerical fluxes across the bottom and top faces, respectively. The update
  equation is given by a collocation procedure at each solution point,

  <\equation>
    <value|uu><rsub|e,p*q><rsup|n+1>=<value|uu><rsub|e,p*q><rsup|n>-\<Delta\>t*<around*|[|<frac|1|\<Delta\>x<rsub|e>>*<pd|<value|F><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>,\<xi\><rsub|q>|)>+<frac|1|\<Delta\>y<rsub|e>>*<pd|<bG><rsub|h>|\<eta\>><around|(|\<xi\><rsub|p>,\<xi\><rsub|q>|)>|]>,<space|2em>0\<le\>p,q\<le\>N
  </equation>

  where the flux derivatives can be computed from

  <\equation*>
    \<partial\><rsub|\<xi\>>*<value|F><rsub|h>(:,\<xi\><rsub|q>)=<around*|[|<value|F><rsub|<emh>,q>-<value|F><rsub|h><rsup|\<delta\>>*<around|(|0,\<xi\><rsub|q>|)>|]><vb><rsub|L>+\<partial\><rsub|\<xi\>>*<value|F><rsub|h><rsup|\<delta\>>(:,\<xi\><rsub|q>)+<around*|[|<value|F><rsub|<eph>,q>-<value|F><rsub|h><rsup|\<delta\>>*<around|(|1,\<xi\><rsub|q>|)>|]>*<vb><rsub|R>,<space|2em>0\<le\>q\<le\>N
  </equation*>

  <\equation*>
    \<partial\><rsub|\<eta\>>*<bG><rsub|h>*<around|(|\<xi\><rsub|p>,:|)>=<around*|[|<bG><rsub|<emh>,p>-<bG><rsub|h><rsup|\<delta\>>*<around|(|\<xi\><rsub|p>,0|)>|]><vb><rsub|L>+\<partial\><rsub|\<eta\>>*<bG><rsub|h><rsup|\<delta\>>(\<xi\><rsub|p>,:)+<around*|[|<bG><rsub|<eph>,p>-<bG><rsub|h><rsup|\<delta\>>*<around|(|\<xi\><rsub|p>,1|)>|]>*<vb><rsub|R>,<space|2em>0\<le\>p\<le\>N
  </equation*>

  We can cast the update equation in matrix form. For this, define the flux
  matrices

  <\equation*>
    <vF><rsub|e><around|(|p,q|)>=<value|F><rsub|p*q><rsup|e>,<space|2em><vG><rsub|e><around|(|p,q|)>=<bG><rsub|p*q><rsup|e>,<space|2em>0\<le\>p,q\<le\>N
  </equation*>

  <with|color|red|<math|<vF><rsub|e><around|(|p,q|)>> contains a vector of
  variables. Mention how that is handled? Explain that in the dimension
  independent way at the beginning using Trixi's <verbatim|node_vars> stuff.>

  Then we can compute the derivatives of the discontinuous flux at all the
  solution points by a matrix-matrix product

  <\equation*>
    \<partial\><rsub|\<xi\>>*<value|F><rsub|h><rsup|\<delta\>>(:,:)=<vD><vF><rsub|e>,<space|2em>\<partial\><rsub|\<eta\>>*<bG><rsub|h><rsup|\<delta\>>(:,:)=<vG><rsub|e><vD><rsup|\<top\>>
  </equation*>

  where <math|<vD>> is the 1-D differentiation matrix. The update equation
  can be written in matrix form,

  <\equation>
    <vu><rsub|e><rsup|n+1>=<vu><rsub|e><rsup|n>-<around*|[|<frac|\<Delta\>t|\<Delta\>x<rsub|e>><vD><rsub|1><vF><rsub|e>+<frac|\<Delta\>t|\<Delta\>y<rsub|e>><vG><rsub|e><vD><rsub|1><rsup|\<top\>>|]>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around*|[|<vb><rsub|L><vF><rsub|<emh>><rsup|\<top\>>+<vb><rsub|R><vF><rsub|<eph>><rsup|\<top\>>|]>-<frac|\<Delta\>t|\<Delta\>y<rsub|e>>*<around*|[|<vG><rsub|<emh>><vb><rsub|L><rsup|\<top\>>+<vG><rsub|<eph>><vb><rsub|R><rsup|\<top\>>|]><label|eq:up2d>
  </equation>

  where the quantities <math|<vD><rsub|1>,<vb><rsub|L>,<vb><rsub|R>> have
  been defined before in the description of the 1-D scheme.

  The time average fluxes are computed by the approximate Lax-Wendroff
  procedure. To describe this, let us define the flux matrices

  <\equation*>
    <vf><rsub|e><around|(|p,q|)>=<value|pf><around|(|<value|uu><rsub|p*q><rsup|e>|)>,<space|2em><vg><rsub|e><around|(|p,q|)>=<bg><around|(|<value|uu><rsub|p*q><rsup|e>|)>,<space|2em>0\<le\>p,q\<le\>N
  </equation*>

  The time derivatives of the solution at all solution points are obtained
  from the PDE by the following matrix equation,

  <\equation*>
    <vu><rsup|<around|(|m|)>><rsub|e>=-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|m-1|)>><rsub|e>-<frac|\<Delta\>t|\<Delta\>y<rsub|e>>*<vg><rsup|<around|(|m-1|)>><rsub|e><vD><rsup|\<top\>>,<space|2em>m=1,2,\<ldots\>,N
  </equation*>

  and the time average solution and fluxes are given by

  <\equation*>
    <vU><rsub|e>=<big|sum><rsub|m=0><rsup|N><frac|<vu><rsub|e><rsup|<around|(|m|)>>|<around|(|m+1|)>!>,<space|2em><vF><rsub|e>=<big|sum><rsub|m=0><rsup|N><frac|<vf><rsub|e><rsup|<around|(|m|)>>|<around|(|m+1|)>!>,<space|2em><vG><rsub|e>=<big|sum><rsub|m=0><rsup|N><frac|<vg><rsub|e><rsup|<around|(|m|)>>|<around|(|m+1|)>!>
  </equation*>

  The time derivatives of the fluxes <math|<vf><rsub|e><rsup|<around|(|m|)>>>,
  <math|<vg><rsub|e><rsup|<around|(|m|)>>> are approximated using finite
  differences in time as in the 1-D case given in
  Section<nbsp><reference|sec:alw>; those formulae are applied to both
  components of the flux. The stable time step is determined by considering
  the linear advection equation in 2-D and applying Fourier stability
  analysis to the LW scheme, see Appendix<nbsp><reference|sec:fourier2d>.

  <section|Numerical results in 2D: scalar problems>

  We present results to test the error convergence properties of the LW
  schemes for some 2-D problems and compare them to RK scheme. For each
  problem in this section, the corresponding CFL numbers are chosen based on
  Fourier stability analysis which are given in
  Table<nbsp><reference|tab:2Dcfl>. We compare Lax-Wendroff scheme with D2
  dissipation model and Runge-Kutta schemes in this section, and the CFL
  numbers of the former are used for both schemes. For the RKFR scheme, we
  use SSP Runge-Kutta time integration<nbsp><cite|Gottlieb2001> for
  <math|N=1> and 2, the classical four stage Runge-Kutta method of order four
  for <math|N=3>, and six-stage, fifth order Runge-Kutta (RK65) time
  integration for <math|N=4><nbsp><cite|Tsitouras2011> implemented in
  <with|font-family|tt|DifferentialEquations.jl><nbsp><cite|Rackauckas2017>.
  All the results in this section are produced using code written in
  Julia<nbsp><cite|Bezanson2017>; the design and optimization of the code was
  inspired by <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022>.

  <subsection|Advection of a smooth signal>

  We consider the advection equation in two dimensions

  <\equation>
    <label|eq:2dvaradv>u<rsub|t>+\<nabla\>\<cdot\><around|[|\<b-a\><around|(|x,y|)>*u|]>=0,
  </equation>

  with two types of divergence-free advection velocity, namely a constant
  velocity <math|\<b-a\>=<around|(|1,1|)>> and a variable velocity
  <math|\<b-a\>=<around|(|-y,x|)>>. For the second velocity, the flux
  components are <math|<around|(|f,g|)>=<around|(|-y*u,x*u|)>> so that
  <math|F<rsub|h><rsup|\<delta\>>> is of degree <math|N> in <math|x> and
  <math|G<rsub|h><rsup|\<delta\>>> is of degree <math|N> in <math|y>
  variable. Since <math|F<rsub|h><rsup|\<delta\>>> is interpolated along
  <math|x> direction and <math|G<rsub|h><rsup|\<delta\>>> is interpolated
  along <math|y> direction, there is no interpolation error due to
  non-linearity of the flux and the EA and AE schemes are equivalent. Due to
  this reason, we only show the results with EA scheme. In order to verify
  the accuracy of the LWFR scheme we consider the
  equation<nbsp><eqref|eq:2dvaradv> with a smooth initial condition and
  perform the simulation for both the advection velocities. For the velocity
  <math|\<b-a\>=<around|(|1,1|)>>, the characteristic curves are straight
  lines and we use periodic boundary conditions on the domain
  <math|<around|[|0,1|]>\<times\><around|[|0,1|]>> with initial condition
  <math|u<rsub|0><around|(|x,y|)>=sin <around|(|2*\<pi\>*x|)>*sin
  <around|(|2*\<pi\>*y|)>>. The error convergence plots are shown in
  Figure<nbsp><reference|fig:conv linear adv 2d> using Radau correction
  function. The optimal convergence rate is attained by both LW and RK
  schemes and there is no significant difference between GL and GLL points.
  The errors of RK scheme are slightly smaller than those of the LW scheme,
  similar to the 1-D case.

  For the variable velocity <math|<ba>=<around|(|-y,x|)>>, the characteristic
  curves are circles whose center is at the origin and we take the domain
  <math|\<Omega\>=<around|[|0,1|]>\<times\><around|[|0,1|]>>. The exact
  solution is given by <math|u<around|(|x,y,t|)>=u<rsub|0><around|(|x*cos<around|(|t|)>+y*sin<around|(|t|)>,-x*sin<around|(|t|)>+y*cos<around|(|t|)>|)>>
  with the initial condition <math|u<rsub|0><around|(|x,y|)>=1+exp<around|(|-50*<around|(|<around|(|x-1/2|)><rsup|2>+y<rsup|2>|)>|)>>.
  At the bottom and right boundaries, we use inflow conditions while on top
  and left side of the boundary, we use outflow conditions. The initial
  condition advects along the circular characteristic curves in the counter
  clock-wise direction. A contour plot of the numerical solution is
  visualized in Figure<nbsp><reference|fig:lin2d_rotate_soln>, and the error
  convergence analysis is made in Figure<nbsp><reference|fig:conv linear
  rotate 2d>. The error convergence agrees with the optimal convergence rates
  and the error values of the LW scheme are comparable to those from the RK
  scheme at all orders shown in the figures.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/lin2d/la2d_gl_radau_Tf1|0.30par|||>>|<cell|>|<cell|<image|figures/lin2d/la2d_gll_radau_Tf1|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|Error convergence test for 2-D linear advection equation with
  velocity <math|\<b-a\>=<around|(|1,1|)>> at <math|t=1.0>, initial data
  <math|u<rsub|0>*<around|(|x,y|)>=sin <around|(|2*\<pi\>*x|)>*sin
  <around|(|2*\<pi\>*y|)>>; (a) GL points, (b) GLL points. The different
  colors correspond to degrees <math|N=1,2,3,4> from top to
  bottom.<label|fig:conv linear adv 2d>>

  <subsection|Rotation of a composite signal>

  In this example, we consider a classical test case<nbsp><cite|LeVeque1996>
  where the equation<nbsp><eqref|eq:2dvaradv> is solved with a divergence
  free velocity field <math|<with|font-series|bold|a>=<around|(|<frac|1|2>-y,x-<frac|1|2>|)>>
  and an initial condition which consists of a slotted disc, a cone and a
  smooth hump, given as follows

  <\align*>
    <tformat|<table|<row|<cell|u*<around|(|x,y,0|)>>|<cell|=u<rsub|1>*<around|(|x,y|)>+u<rsub|2>*<around|(|x,y|)>+u<rsub|3>*<around|(|x,y|)>,<space|1em><around|(|x,y|)>\<in\><around|[|0,1|]>\<times\><around|[|0,1|]>>>|<row|<cell|u<rsub|1>*<around|(|x,y|)>>|<cell|=<frac|1|4>*<around|(|1+cos
    <around|(|\<pi\>*q<around|(|x,y|)>|)>|)>,<space|1em>q<around|(|x,y|)>=min
    <around|(|<sqrt|<around|(|x-<wide|x|\<bar\>>|)><rsup|2>+<around|(|y-<wide|y|\<bar\>>|)><rsup|2>>,r<rsub|0>|)>/r<rsub|0>,<around|(|<wide|x|\<bar\>>,<wide|y|\<bar\>>|)>=<around|(|0.25,0.5|)>,r<rsub|0>=0.15>>|<row|<cell|u<rsub|2>*<around|(|x,y|)>>|<cell|=<choice|<tformat|<table|<row|<cell|1-<dfrac|1|r<rsub|0>><sqrt|<around|(|x-<wide|x|\<bar\>>|)><rsup|2>+<around|(|y-<wide|y|\<bar\>>|)><rsup|2>>>|<cell|<text|if
    ><around|(|x-<wide|x|\<bar\>>|)><rsup|2>+<around|(|y-<wide|y|\<bar\>>|)><rsup|2>\<le\>r<rsub|0><rsup|2>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>,<space|1em><around|(|<wide|x|\<bar\>>,<wide|y|\<bar\>>|)>=<around|(|0.5,0.25|)>,r<rsub|0>=0.15>>|<row|<cell|u<rsub|3>*<around|(|x,y|)>>|<cell|=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    ><around|(|x,y|)>\<in\><math-up|C>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>>>>>
  </align*>

  where <math|<math-up|C>> is a slotted disc with center at
  <math|<around|(|0.5,0.75|)>> and radius of <math|0.15>. The initial
  condition is shown in Figure<nbsp><reference|fig:interactions>a. The
  numerical solutions of LWFR and RKFR after one rotation, without limiter,
  degree <math|N=3> and <math|100\<times\>100> cells, are shown in
  Figures<nbsp><reference|fig:interactions>b,d respectively. The same with a
  TVB limiter (<math|M=100>) are shown in
  Figures<nbsp><reference|fig:interactions>c,e. Without the limiter, the
  solution is captured well but there are some oscillations which take the
  solution outside the initial range of values. With the TVB limiter, the
  oscillations are reduced though it is not completely eliminated and results
  in increased numerical dissipation that smears the discontinuous profiles.
  However, in all cases, LWFR scheme performs comparably with RKFR scheme
  with the same limiter settings.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|2|2|5|5|cell-halign|c>|<table|<row|<cell|<image|figures/lin2d/la_rotate_dirichlet_contour.png|0.30par|||>>|<cell|>|<cell|<image|figures/lin2d/la_rotate_dirichlet_contour_lwfr_N3_nc50.png|0.30par|||>>|<cell|>|<cell|<image|figures/lin2d/la_rotate_dirichlet_contour_rkfr_N3_nc50.png|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>|<cell|>|<cell|(c)>>>>>
  </big-figure|Linear advection with velocity
  <math|\<b-a\>=<around|(|-y,x|)>> on <math|<around|[|0,1|]>\<times\><around|[|0,1|]>>
  with inflow/outflow boundary condition. The solutions are shown on a mesh
  of <math|50\<times\>50> cells with polynomial degree <math|N=3>; (a)
  initial solution, (b) LWFR, <math|t=<frac|\<pi\>|2>> (c) RKFR,
  <math|t=<frac|\<pi\>|2>>.<label|fig:lin2d_rotate_soln>>

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/lin2d/la2d_rotate_gl_radau|0.30par|||>>|<cell|>|<cell|<image|figures/lin2d/la2d_rotate_gll_radau|0.30par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|Error convergence test for 2-D linear advection equation with
  velocity <math|\<b-a\>=<around|(|-y,x|)>> at <math|t=<frac|\<pi\>|2>>,
  initial data <math|u<rsub|0>*<around|(|x,y|)>=1+exp
  <around|(|-50*<around|(|<around|(|x-1/2|)><rsup|2>+y<rsup|2>|)>|)>> using
  (a) GL points, (b) GLL points.<label|fig:conv linear rotate 2d>>

  <big-figure|<tabular|<tformat|<table|<row|<cell|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/lin2d/la_rotate_comp_contour.png|0.3par|||>>>|<row|<cell|(a)
  Exact>>>>>>|<cell|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/lin2d/la_rotate_comp_contour_lwfr_N3_nc100_unlim.png|0.3par|||>>|<cell|>|<cell|<image|figures/lin2d/la_rotate_comp_contour_rkfr_N3_nc100_unlim.png|0.3par|||>>>|<row|<cell|(b)
  LWFR>|<cell|>|<cell|(d) RKFR>>|<row|<cell|<image|figures/lin2d/la_rotate_comp_contour_lwfr_N3_nc100_tvb100.png|0.3par|||>>|<cell|>|<image|figures/lin2d/la_rotate_comp_contour_rkfr_N3_nc100_tvb100.png|0.3par|||>>|<row|<cell|(c)
  LWFR>|<cell|>|<cell|(e) RKFR>>>>>>>>>>|Numerical solutions of composite
  signal with velocity <math|a=(<frac|1|2>-y,x-<frac|1|2>)> obtained for
  degree <math|N=3> using Radau correction function and GL solution points.
  The solutions are plotted after 1 period of rotation on a mesh of
  <math|100\<times\>100> cells; No limiter is used in (b), (c) and TVB
  limiter <math|(M=100)> is used in (d), (e). <label|fig:interactions>>

  <subsection|Inviscid Burgers' equation>

  We test the accuracy and robustness of the LWFR scheme for the two
  dimensional nonlinear scalar problem by considering a Burger-type
  equation<nbsp><cite|Qiu2005b>

  <\equation>
    <label|eq:2dburger>u<rsub|t>+<around*|(|<dfrac|u<rsup|2>|2>|)><rsub|x>+<around*|(|<dfrac|u<rsup|2>|2>|)><rsub|y>=0
  </equation>

  with an initial condition <math|u*<around|(|x,y,0|)>=<dfrac|1|4>+<dfrac|1|2>*sin<around|(|2*\<pi\>*<around|(|x+y|)>|)>>
  in the domain <math|\<Omega\>=<around|[|0,1|]>\<times\><around|[|0,1|]>>.
  The boundary conditions are set to be periodic in both directions. To test
  the error convergence, the solutions are computed up to time <math|t=0.1>
  as shown in Figure<nbsp><reference|fig:lineplot_burg2d>a, when the
  solutions are still smooth and the exact solution is available. The error
  convergence results up to degree four are given in
  Figure<nbsp><reference|fig:conv_burger2d> using D2 dissipation model and
  Radau correction function. Similar to that in the 1-D case, the AE scheme
  shows optimal convergence rate for even polynomial degrees but sub-optimal
  convergence rates for odd degrees. The EA scheme on the other hand shows
  optimal convergence rates at all degrees and the error values are also
  comparable to those of RK scheme. In order to show the robustness of the
  LWFR scheme, we compute the numerical solution at time <math|t=0.2> where
  the solution is discontinuous. The corresponding solution across the
  diagonal of the domain for mesh size <math|50\<times\>50> with <math|N=3>
  is shown in Figure<nbsp><reference|fig:lineplot_burg2d>b which shows that
  the shock is captured accurately and without spurious oscillations. In each
  case, when the interface fluxes are computed with EA scheme, the LWFR
  schemes perform at par with the RKFR schemes.

  <\big-figure|<tabular|<tformat|<cwith|1|2|1|1|cell-halign|c>|<cwith|1|2|1|1|cell-rborder|0ln>|<cwith|1|2|1|3|cell-valign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/burg2d/burg2d_lineout_tf01|0.4par|||>>|<cell|>|<cell|<image|figures/burg2d/burg2d_lineout_tf02|0.4par|||>>>|<row|<cell|(a)
  <math|t=0.1>>|<cell|>|<cell|(b) <math|t=0.2>>>>>>>
    Line plot across the diagonal of <math|[0, 1] \<times\> [0, 1]> of the
    solution of 2-D Burger's equation with 50 \<times\> 50 cells and degree
    <math|N = 3>. The reference solution for <math|t = 0.2> is computed using
    RKFR scheme with degree <math|N = 1> on a mesh of 1000 \<times\> 1000
    cells.<label|fig:lineplot_burg2d>
  </big-figure>

  <\big-figure>
    <tabular|<tformat|<cwith|1|2|1|1|cell-halign|c>|<cwith|1|2|1|1|cell-rborder|0ln>|<cwith|1|2|1|3|cell-valign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/burg2d/burg2d_AE|0.3par|||>>|<cell|>|<cell|<image|figures/burg2d/burg2d_EA|0.3par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|Error convergence test for 2-D Burger's equation with initial
  condition <math|u*<around|(|x,y,0|)>=<dfrac|1|4>+<dfrac|1|2>*sin<around|(|2*\<pi\>*<around|(|x+y|)>|)>>
  in the domain <math|<around|[|0,1|]>\<times\><around|[|0,1|]>> comparing
  the two boundary fluxes of LWFR (a) AE, (b) EA. The errors are computed at
  <math|t=0.1>.<label|fig:conv_burger2d>>

  <section|Numerical results in 2-D: Euler equations>

  We consider the two-dimensional Euler equations of gas dynamics given by

  <\equation>
    <label|eq:2deuler><pd||t>*<matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*u>>|<row|<cell|\<rho\>*v>>|<row|<cell|E>>>>>+<pd||x>*<around*|(|<tabular*|<tformat|<table|<row|<cell|\<rho\>*u>>|<row|<cell|p+\<rho\>*u<rsup|2>>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|<around*|(|E+p|)>*u>>>>>|)>+<pd||y>*<around*|(|<tabular*|<tformat|<table|<row|<cell|\<rho\>*v>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|p+\<rho\>*v<rsup|2>>>|<row|<cell|<around*|(|E+p|)>*v>>>>>|)>=<value|bzero>
  </equation>

  where <math|\<rho\>,p> and <math|E> denote the density, pressure and total
  energy of the gas, respectively and <math|<around|(|u,v|)>> are Cartesian
  components of the fluid velocity. For a polytropic gas, an equation of
  state <math|E=E<around|(|\<rho\>,u,v,p|)>> which leads to a closed system
  is given by

  <\equation>
    <label|eq:2dstate>E=E<around|(|\<rho\>,u,v,p|)>=<frac|p|\<gamma\>-1>+<frac|1|2>*\<rho\>*<around|(|u<rsup|2>+v<rsup|2>|)>
  </equation>

  where <math|\<gamma\>\<gtr\>1> is the adiabatic constant, that will be
  taken as <math|1.4> in the numerical tests, which is the typical value for
  air.

  We present results to test the accuracy and computational performance of
  the LW schemes for some 2-D problems and compare them to RK scheme. For
  each problem in this section, the corresponding CFL numbers of Lax-Wendroff
  schemes are chosen based on the Fourier stability analysis which are given
  in Table<nbsp><reference|tab:2Dcfl>. For a fair performance comparison, the
  Runge-Kutta schemes use their optimal CFL numbers<nbsp><cite|Gassner2011a>.
  The time averaged flux is always computed using the EA scheme. For RKFR, we
  use SSP Runge-Kutta time integration<nbsp><cite|Gottlieb2001> for degrees
  <math|N=1> and 2, the five stage SSP Runge-Kutta method of order four for
  <math|N=3><nbsp><cite|Spiteri2002>, and six-stage, fifth order Runge-Kutta
  (RK65) time integration for <math|N=4><nbsp><cite|Tsitouras2011>
  implemented in <with|font-family|tt|DifferentialEquations.jl><nbsp><cite|Rackauckas2017>.
  We make use of the HLLC flux with wave speeds from<nbsp><cite|Batten1997>.
  All the results in this section are produced using code written in
  Julia<nbsp><cite|Bezanson2017>.

  <subsection|Isentropic vortex>

  We perform error convergence and Wall Clock Time (WCT) analysis using the
  isentropic vortex test case<nbsp><cite|Yee1999|Spiegel2016>. This problem
  consists of a vortex that advects at a constant velocity while the entropy
  is constant in both space and time. The initial condition is given by

  <\equation*>
    \<rho\>=<around*|[|1-<frac|\<beta\><rsup|2>*<around|(|\<gamma\>-1|)>|8*\<gamma\>*\<pi\><rsup|2>>*exp
    <around|(|1-r<rsup|2>|)>|]><rsup|<frac|1|\<gamma\>-1>>,<space|2em>u=M*cos
    \<alpha\>-<frac|\<beta\>*<around|(|y-y<rsub|c>|)>|2*\<pi\>>*exp
    <around*|(|<frac|1-r<rsup|2>|2>|)>
  </equation*>

  <\equation*>
    v=M*sin \<alpha\>+<frac|\<beta\>*<around|(|x-x<rsub|c>|)>|2*\<pi\>>*exp
    <around*|(|<frac|1-r<rsup|2>|2>|)>,<space|2em>r<rsup|2>=<around|(|x-x<rsub|c>|)><rsup|2>+<around|(|y-y<rsub|c>|)><rsup|2>
  </equation*>

  and the pressure is given by <math|p=\<rho\><rsup|\<gamma\>>>. We choose
  the parameters <math|\<beta\>=5>, <math|M=0.5>,
  <math|\<alpha\>=45<rsup|o>>, <math|<around|(|x<rsub|c>,y<rsub|c>|)>=<around|(|0,0|)>>
  and the domain is taken to be <math|<around|[|-10,10|]>\<times\><around|[|-10,10|]>>
  with periodic boundary conditions. For this configuration, the vortex
  returns to its initial position after a time interval of
  <math|T=20*<sqrt|2>/M> units. We run the computations up to a time
  <math|t=T> when the vortex has crossed the domain once in the diagonal
  direction.

  The <math|L<rsup|2>> error and Wall Clock Time (WCT) against grid
  resolution is shown in Figure<nbsp><reference|fig:isentropic.convergence>.
  We observe optimal convergence rates for all new LW schemes proposed in
  this paper. The WCT scales as the total number of cells to the power of
  1.5, which is the expected rate and the LW-D2 scheme shows smallest time as
  seen in Figure<nbsp><reference|fig:isentropic.convergence>b. We denote by
  WCT(LW-D1) the Wall Clock Time corresponding to LW-D1 scheme, and similarly
  for other schemes.

  The WCT versus <math|L<rsup|2>> error comparison has been made in
  Figure<nbsp><reference|fig:isentropic.time.vs.error> and the ratios
  WCT(LW-D1)/WCT(LW-D2) and WCT(RK)/WCT(LW-D2) are plotted against grid
  resolution in Figures<nbsp><reference|fig:isentropic.ratios.vs.grid.1.2.3.4>a
  and<nbsp><reference|fig:isentropic.ratios.vs.grid.1.2.3.4>b, respectively.
  We see that the newly proposed LW-D2 scheme is more efficient in comparison
  to the LW-D1 scheme since it can use a larger CFL number. As we expect from
  Table<nbsp><reference|tab:cfl> comparing the CFL ratios, the explicit time
  ratios of LW-D1 and LW-D2 are consistently in the range of 1.4 and 1.5 for
  <math|N\<gtr\>1>, as shown in Figure<nbsp><reference|fig:isentropic.ratios.vs.grid.1.2.3.4>a.

  Figure<nbsp><reference|fig:isentropic.time.vs.error> shows that LW-D2 has
  smaller Wall Clock Time than RK for all degrees and
  Figure<nbsp><reference|fig:isentropic.ratios.vs.grid.1.2.3.4>b shows that
  the WCT ratio WCT(RK)/WCT(LW-D2) is close to <math|1.1,1.4,1.7> for
  <math|N=1,2,3> respectively. Thus, the ratio improves as we increase the
  degree up to 3. However, at <math|N=4>, the ratio deteriorates to
  approximately <math|1.2>. The low CFL number of LW at <math|N=4> relative
  to the RK scheme plays a role in this loss of performance. The amount of
  computations in assembling the right hand side per cell at <math|N=4> is
  high in the LW scheme as compared to RK scheme, and it is possible that the
  performance of LW can be improved by a more careful implementation of the
  code to exploit modern CPU hardware. Figure<nbsp>(<reference|fig:isentropic.time.vs.error>)
  shows that when the error levels are small, the higher order schemes are
  more efficient in terms of WCT than lower order methods.

  <\big-figure>
    <tabular|<tformat|<cwith|1|2|1|1|cell-halign|c>|<cwith|1|2|1|1|cell-rborder|0ln>|<cwith|1|2|1|3|cell-valign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/euler2d/isentropic_D1_RK/grid_vs_error|0.45par|||>>|<cell|>|<cell|<image|figures/euler2d/isentropic_D1_RK/grid_vs_time|0.45par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|<math|L<rsup|2>> error and Wall Clock Time (WCT) analysis of
  2-D Euler equations (isentropic vortex) against grid resolution comparing
  LW-D1, LW-D2 and RK is shown in (a) and (b) respectively. The error is
  computed after one period. The time step size of each scheme is computed
  using its optimal CFL from Fourier stability
  analysis.<label|fig:isentropic.convergence>>

  <\big-figure>
    <padded-center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/euler2d/isentropic_many_nodes_error_vs_t|0.65par|||>>>>>>>

    \;
  </big-figure|Wall Clock Time (WCT) versus <math|L<rsup|2>> error for 2-D
  Euler equations (isentropic vortex) comparing LW-D1, LW-D2 and RK for
  degrees <math|N=1,2,3,4>. The different colors correspond to different
  degrees, with the degree increasing from right to left. The error is
  computed after one period. The time step size of each scheme is computed
  using its optimal CFL number from Fourier stability
  analysis.<label|fig:isentropic.time.vs.error>>

  <\big-figure>
    <tabular|<tformat|<cwith|1|2|1|1|cell-halign|c>|<cwith|1|2|1|1|cell-rborder|0ln>|<cwith|1|2|1|3|cell-valign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/euler2d/isentropic_D1_D2_/grid_vs_ratios|0.45par|||>>|<cell|>|<cell|<image|figures/euler2d/isentropic_D2_/grid_vs_ratios|0.45par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|Wall Clock Time (WCT) ratios versus grid resolution for 2-D
  Euler equations (isentropic vortex). (a) WCT ratio of LW-D1 and LW-D2, (b)
  WCT ratio of RK and LW-D2. The error is computed after one period. The time
  step size of each scheme is computed using its optimal CFL number from
  Fourier stability analysis.<label|fig:isentropic.ratios.vs.grid.1.2.3.4>>

  <subsection|Double Mach reflection>

  We now test the double Mach reflection problem which was originally
  proposed by Woodward and Colella<nbsp><cite|Woodward1984>. The problem
  consists of a shock impinging on a wedge/ramp which is inclined by 30
  degrees. The solution consists of a self similar shock structure with two
  triple points. The situation is simulated in the rectangular domain
  <math|\<Omega\>=<around|[|0,4|]>\<times\><around|[|0,1|]>>, where the
  wedge/ramp is positioned at <math|x=1/6,y=0>. Defining
  <math|<value|uu><rsub|b>=<value|uu><rsub|b><around|(|x,y,t|)>> with
  primitive variables given by

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|8,
    8.25 cos<around*|(|<frac|\<pi\>|6>|)>, -8.25
    sin<around*|(|<frac|\<pi\>|6>|)>, 116.5|)>>|<cell|<space|2em>>|<cell|if
    x\<less\><frac|1|6>+<frac|y+20*t|<sqrt|3>>>>|<row|<cell|<around*|(|1.4,0,0,1|)>>|<cell|>|<cell|if
    x\<gtr\><frac|1|6>+<frac|y+20*t|<sqrt|3>>>>>>>
  </equation*>

  we define the initial condition to be <math|<math-bf|<math|<value|uu>>><rsub|0><around|(|x,y|)>=<math|<value|uu>><rsub|b><around|(|x,y,0|)>>.
  With <math|<math|<value|uu>><rsub|b>>, we impose inflow boundary conditions
  at the left side <math|<around|{|0|}>\<times\><around|[|0,1|]>>, outflow
  boundary conditions both at <math|<around|[|0,1/6|]>\<times\><around|{|0|}>>
  and <math|<around|{|4|}>\<times\><around|[|0,1|]>>, reflecting boundary
  conditions at <math|<around|[|1/6,4|]>\<times\><around|{|0|}>> and inflow
  boundary conditions at the upper side <math|<around|[|0,4|]>\<times\><around|{|1|}>>.
  In Figure<nbsp>(<reference|fig:dmr.plot>), we compare the density plots
  obtained using the LWFR and RKFR schemes for <math|N=2> at a resolution of
  <math|960\<times\>240> cells at <math|t=0.2>. The non-linear TVB limiter is
  used with the parameter <math|M=100><nbsp><cite|Qiu2005b>. The Lax-Wendroff
  solution is computed using D2 dissipation and EA scheme. We use GL points
  and Radau corrector in both LW and RK schemes. We observe similar
  resolution for both schemes; the similarity holds for other degrees also,
  which we have not shown to save space. In
  Figure<nbsp>(<reference|fig:dmr.wct>a), we plot grid resolution against the
  Wall Clock Time for degrees <math|N=1,2,3,4> which shows the expected
  dependence of time with grid size. Figure<nbsp>(<reference|fig:dmr.wct>b)
  shows the ratio of WCT for RK and LW-D2 schemes, indicating better
  efficiency of LW scheme, and these results are similar to what is observed
  in<nbsp><cite|Qiu2005b>.

  <big-figure|<tabular|<tformat|<table|<row|<cell|>>>>><tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/euler2d/dmr/lwfr_2_240|0.8par|||>>>|<row|<cell|(a)
  LWFR-D2 with EA scheme>>|<row|<cell|<image|figures/euler2d/dmr/rkfr_2_240|0.8par|||>>>|<row|<cell|(b)
  RKFR>>>>>|Density profile of numerical solutions of 2-D Euler equations
  (double Mach reflection problem) at <math|t=0.2> for <math|N=2>, with
  <math|\<Delta\>*x=\<Delta\>*y=1/240>. Contours of 30 steps from 1.4 to 22.5
  are printed.<label|fig:dmr.plot>>

  <\big-figure>
    <tabular|<tformat|<cwith|1|2|1|1|cell-halign|c>|<cwith|1|2|1|1|cell-rborder|0ln>|<cwith|1|2|1|3|cell-valign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/euler2d/dmr/contour_lwfr_2_240|0.45par|||>>|<cell|>|<cell|<image|figures/euler2d/dmr/contour_rkfr_2_240|0.45par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|Wall Clock Time (WCT) ratios versus grid resolution for 2-D
  Euler equations (isentropic vortex). (a) WCT ratio of LW-D1 and LW-D2, (b)
  WCT ratio of RK and LW-D2. The error is computed after one period. The time
  step size of each scheme is computed using its optimal CFL number from
  Fourier stability analysis.<label|fig:dmr.plot.zoom>>

  <\big-figure>
    <tabular|<tformat|<cwith|1|2|1|1|cell-halign|c>|<cwith|1|2|1|1|cell-rborder|0ln>|<cwith|1|2|1|3|cell-valign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<image|figures/euler2d/dmr/grid_vs_time|0.45par|||>>|<cell|>|<cell|<image|figures/euler2d/dmr/grid_vs_ratios|0.45par|||>>>|<row|<cell|(a)>|<cell|>|<cell|(b)>>>>>
  </big-figure|<math|L<rsup|2>> error and Wall Clock Time (WCT) analysis of
  2-D Euler equations (isentropic vortex) against grid resolution comparing
  LW-D1, LW-D2 and RK is shown in (a) and (b) respectively. The error is
  computed after one period. The time step size of each scheme is computed
  using its optimal CFL from Fourier stability analysis.<label|fig:dmr.wct>>

  <section|Summary and conclusions ><label|sec:sum>

  A conservative, Jacobian-free and single step, explicit Lax-Wendroff method
  has been constructed in flux reconstruction context, and its implementation
  has been demonstrated for solving hyperbolic conservation laws in one and
  two dimensions. The Jacobian-free property is achieved by using a finite
  difference approach to compute time derivatives of the fluxes that are
  needed in the Taylor expansion. The method requires only the time average
  flux and its corresponding numerical fluxes. It is written in matrix-vector
  form that is useful for computer implementation. We have studied the effect
  of two commonly used correction functions and solution points. The stable
  CFL numbers are computed using Fourier stability analysis in one and two
  dimensions. The numerical fluxes are computed using both the time average
  flux and the time average solution which leads to improved CFL numbers
  compared to other existing methods which use the solution at previous time
  level to compute the dissipative part of the numerical flux. At fifth order
  (<math|N=4>), there is a mild linear instability for periodic problems,
  which seems to be present in other single step methods and also in RKDG
  schemes. For non-linear problems, we identify a loss of optimal convergence
  rate when a simple average-extrapolate (AE) approach is used to compute the
  central part of the numerical flux. We show that this can be improved to
  optimal rates by using an extrapolate-average procedure, and the resulting
  schemes perform comparably with RK schemes in terms of their error levels.
  The performance of the method is also demonstrated on 1-D and 2-D
  non-linear systems like Euler equations, where it is able to resolve all
  the waves at comparable accuracy to RK schemes. Many commonly used
  numerical fluxes based on approximate Riemann solvers and modeling even
  contact waves can be developed and used in these schemes. These studies
  show that the Radau correction function in combination with Gauss-Legendre
  solution points and the extrapolate-average (EA) technique leads to
  uniformly accurate LW scheme for non-linear problems. The method has a
  simple structure which makes it easy to develop a general code that can be
  used to solve any conservation law; the user has to supply subroutines for
  the flux, numerical flux and maximum wave speed estimate used in the CFL
  condition.

  <appendix|Numerical flux><label|apendix:numfluxes>

  We describe the procedure to compute the numerical flux for systems at one
  single face <math|<eph>>. The numerical flux for LWFR is computed using the
  trace values of the solution <math|U<rsub|l>=U<rsub|<eph>><rsup|->>,
  <math|U<rsub|r>=U<rsub|<eph>><rsup|+>> and fluxes
  <math|<value|F><rsub|l>=<value|F><rsub|<eph>><rsup|->>,
  <math|<value|F><rsub|r>=<value|F><rsub|<eph>><rsup|+>>. Here
  <math|<value|uU><rsub|l>,<value|uU><rsub|r>> may be the solution values at
  time <math|t<rsub|n>> for dissipation model D1 or the time average value in
  case of dissipation model D2. Further, we use the cell average values at
  time <math|t=t<rsub|n>>, <math|<wide|<value|uU>|\<bar\>><rsub|l>=<au><rsub|e><rsup|n>>,
  <math|<wide|<value|uU>|\<bar\>><rsub|r>=<au><rsub|e+1><rsup|n>>, to compute
  the dissipation coefficients. In the following sub-sections, we described
  different numerical fluxes which are functions of the quantities:
  <math|<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>,<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>>.

  <section|Some numerical fluxes>

  <subsection|Rusanov flux>

  The Rusanov flux <cite|Rusanov1962> is a local version of the
  Lax-Friedrichs flux with the the wave speed being estimated locally. The
  flux approximation is given by

  <\equation*>
    <value|F>*<around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<half>*<around|(|<value|F><rsub|l>+<value|F><rsub|r>|)>-<half>*\<lambda\>*<around|(|<value|uU><rsub|r>-<value|uU><rsub|l>|)>
  </equation*>

  where <math|\<lambda\>> is an estimate of the maximum wave speed in the two
  states

  <\equation*>
    \<lambda\>=max <around|{|\<sigma\><around|(|<wide|<value|uU>|\<bar\>><rsub|l>|)>,\<sigma\><around|(|<wide|<value|uU>|\<bar\>><rsub|r>|)>|}>
  </equation*>

  and <math|\<sigma\>> denotes the spectral radius of the flux
  jacobian.<with|color|red|Should this be
  <math|\<sigma\><around*|(|U<rsub|l>,U<rsub|r>|)>> as defined in the next
  paper?>

  <subsection|Roe flux>

  The Roe flux <cite|Roe1981> is built on a local linearization of the
  hyperbolic conservation law and solving the Riemann problem exactly. The
  Roe flux is given by

  <\equation*>
    <value|F>*<around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<half>*<around|(|<value|F><rsub|l>+<value|F><rsub|r>|)>-<half>*R<around|\||\<Lambda\>|\|>*L*<around|(|<value|uU><rsub|r>-<value|uU><rsub|l>|)>
  </equation*>

  where <math|R,\<Lambda\>,L> are the right eigenvector matrix, diagonal
  matrix of eigenvalues and left eigenvector matrix corresponding to the flux
  Jacobian at the face, computed using the Roe average based on cell average
  values <math|<wide|<value|uU>|\<bar\>><rsub|l>>,
  <math|<wide|<value|uU>|\<bar\>><rsub|r>>.

  <subsection|HLL flux>

  The HLL Riemann solver<nbsp><cite|Harten1983a> models the solution of the
  Riemann problem using only the slowest and fastest waves with an
  intermediate state. Let the slowest and fastest speeds, denoted by
  <math|S<rsub|l>\<less\>S<rsub|r>>, be assumed to be known. We can determine
  the intermediate state and flux by writing the jump conditions across the
  two waves,

  <\equation*>
    <value|F><rsub|\<ast\>>-<value|F><rsub|l>=S<rsub|l>*<around|(|<value|uU><rsub|\<ast\>>-<value|uU><rsub|l>|)>,<space|2em><value|F><rsub|r>-<value|F><rsub|\<ast\>>=S<rsub|r>*<around|(|<value|uU><rsub|r>-<value|uU><rsub|\<ast\>>|)>
  </equation*>

  whose solution is given by

  <\equation*>
    <value|uU><rsub|\<ast\>>=<frac|S<rsub|r>*<value|uU><rsub|r>-S<rsub|l>*<value|uU><rsub|l>-<around|(|<value|F><rsub|r>-<value|F><rsub|l>|)>|S<rsub|r>-S<rsub|l>>,<space|2em><value|F><rsub|\<ast\>>=<frac|S<rsub|r>*<value|F><rsub|l>-S<rsub|l>*<value|F><rsub|r>+S<rsub|l>*S<rsub|r>*<around|(|<value|uU><rsub|r>-<value|uU><rsub|l>|)>|S<rsub|r>-S<rsub|l>>
  </equation*>

  The numerical flux is given by

  <\equation*>
    <value|F>*<around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<choice|<tformat|<table|<row|<cell|<value|F><rsub|l>,>|<cell|S<rsub|l>\<gtr\>0>>|<row|<cell|<value|F><rsub|r>,>|<cell|S<rsub|r>\<less\>0>>|<row|<cell|<value|F><rsub|\<ast\>>,>|<cell|<math-up|otherwise>>>>>>
  </equation*>

  The speeds <math|S<rsub|l>,S<rsub|r>> are computed using the cell average
  values <math|<wide|<value|uU>|\<bar\>><rsub|l>>,
  <math|<wide|<value|uU>|\<bar\>><rsub|r>> and there are various methods
  available<nbsp><cite|Einfeldt1988|Batten1997|Toro2009|Guermond2016|Toro2020>.
  In the numerical tests, we use the method from<nbsp><cite|Toro2009> to
  estimate the slowest and fastest speeds.

  <subsection|HLLC flux>

  The HLLC Riemann solver<nbsp><cite|Toro1994> uses a three wave model with
  three wave speeds <math|S<rsub|l>\<less\>S<rsub|\<ast\>>\<less\>S<rsub|r>>
  and two intermediate states <math|U<rsub|\<ast\>l>> and
  <math|U<rsub|\<ast\>r>>. The pressure and normal velocity are continuous
  across the contact wave, i.e.,

  <\equation*>
    p<rsub|\<ast\>l>=p<rsub|\<ast\>r>=p<rsub|\<ast\>>,<space|1em>u<rsub|\<ast\>l>=u<rsub|\<ast\>r>=u<rsub|\<ast\>>
  </equation*>

  and the speed of the contact wave coincides with the intermediate velocity
  <math|S<rsub|\<ast\>>=u<rsub|\<ast\>>>. The jump condition across the
  <math|S<rsub|l>> and <math|S<rsub|r>> wave reads as

  <\equation*>
    F<rsub|\<ast\>\<alpha\>>-F<rsub|\<alpha\>>=S<rsub|\<alpha\>>*<around|(|U<rsub|\<ast\>\<alpha\>>-U<rsub|\<alpha\>>|)>,<space|1em>\<alpha\>=l,r
  </equation*>

  In the full form, the jump conditions are given by

  <\equation*>
    <around*|[|<tabular*|<tformat|<table|<row|<cell|\<rho\><rsub|\<ast\>\<alpha\>>*u<rsub|\<ast\>>>>|<row|<cell|p<rsub|\<ast\>>+\<rho\><rsub|\<ast\>\<alpha\>>*u<rsub|\<ast\>><rsup|2>>>|<row|<cell|<around*|(|E<rsub|\<ast\>\<alpha\>>+p<rsub|\<ast\>>|)>*u<rsub|\<ast\>>>>>>>|]>-S<rsub|\<alpha\>><around*|[|<tabular*|<tformat|<table|<row|<cell|\<rho\><rsub|\<ast\>\<alpha\>>>>|<row|<cell|\<rho\><rsub|\<ast\>\<alpha\>>*u<rsub|\<ast\>>>>|<row|<cell|E<rsub|\<ast\>\<alpha\>>>>>>>|]>=<around*|[|<tabular*|<tformat|<table|<row|<cell|F<rsub|\<alpha\>><rsup|\<rho\>>>>|<row|<cell|F<rsub|\<alpha\>><rsup|m>>>|<row|<cell|F<rsub|\<alpha\>><rsup|E>>>>>>|]>-S<rsub|\<alpha\>><around*|[|<tabular*|<tformat|<table|<row|<cell|\<rho\><rsub|\<alpha\>>>>|<row|<cell|m<rsub|\<alpha\>>>>|<row|<cell|E<rsub|\<alpha\>>>>>>>|]>
  </equation*>

  Using this expression we determine the unknown variables
  <math|\<rho\><rsub|\<ast\>>,u<rsub|\<ast\>>,p<rsub|\<ast\>>> and
  <math|E<rsub|\<ast\>>>. From the first jump condition we get

  <\equation*>
    \<rho\><rsub|\<ast\>\<alpha\>>=<frac|S<rsub|\<alpha\>>*\<rho\><rsub|\<alpha\>>-F<rsub|\<alpha\>><rsup|\<rho\>>|S<rsub|\<alpha\>>-u<rsub|\<ast\>>>
  </equation*>

  From the second equation we write the intermediate pressure

  <\equation>
    <label|eq:pstar>p<rsub|\<ast\>>=F<rsub|\<alpha\>><rsup|m>-S<rsub|\<alpha\>>*m<rsub|\<alpha\>>+\<rho\><rsub|\<ast\>\<alpha\>>*<value|uu><rsub|\<ast\>>*<around|(|S<rsub|\<alpha\>>-u<rsub|\<ast\>>|)>=F<rsub|\<alpha\>><rsup|m>-S<rsub|\<alpha\>>*m<rsub|\<alpha\>>+u<rsub|\<ast\>>*<around|(|S<rsub|\<alpha\>>*\<rho\><rsub|\<alpha\>>-F<rsub|\<alpha\>><rsup|\<rho\>>|)>
  </equation>

  We get two estimates of pressure <math|p<rsub|\<ast\>>> from the <math|l,r>
  states, and equating these two values

  <\eqnarray*>
    <tformat|<table|<row|<cell|F<rsub|l><rsup|m>-S<rsub|l>*m<rsub|l>+u<rsub|\<ast\>>*<around|(|S<rsub|l>*\<rho\><rsub|l>-F<rsub|l><rsup|\<rho\>>|)>>|<cell|=>|<cell|F<rsub|r><rsup|m>-S<rsub|r>*m<rsub|r>+u<rsub|\<ast\>>*<around|(|S<rsub|r>*\<rho\><rsub|r>-F<rsub|r><rsup|\<rho\>>|)>>>>>
  </eqnarray*>

  we obtain the intermediate velocity

  <\equation*>
    u<rsub|\<ast\>>=<frac|<around|(|S<rsub|r>*m<rsub|r>-F<rsub|r><rsup|m>|)>-<around|(|S<rsub|l>*m<rsub|l>-F<rsub|l><rsup|m>|)>|<around|(|S<rsub|r>*\<rho\><rsub|r>-F<rsub|r><rsup|\<rho\>>|)>-<around|(|S<rsub|l>*\<rho\><rsub|l>-F<rsub|l><rsup|\<rho\>>|)>>
  </equation*>

  The intermediate pressure can be computed from <eqref|eq:pstar> or from the
  following

  <\equation*>
    p<rsub|\<ast\>>=<frac|<around|(|S<rsub|r>*m<rsub|r>-F<rsub|r><rsup|m>|)>*<around|(|S<rsub|l>*\<rho\><rsub|l>-F<rsub|l><rsup|\<rho\>>|)>-<around|(|S<rsub|l>*m<rsub|l>-F<rsub|l><rsup|m>|)>*<around|(|S<rsub|r>*\<rho\><rsub|r>-F<rsub|r><rsup|\<rho\>>|)>|<around|(|S<rsub|r>*\<rho\><rsub|r>-F<rsub|r><rsup|\<rho\>>|)>-<around|(|S<rsub|l>*\<rho\><rsub|l>-F<rsub|l><rsup|\<rho\>>|)>>
  </equation*>

  From the last jump condition we obtain

  <\equation*>
    E<rsub|\<ast\>\<alpha\>>=<frac|p<rsub|\<ast\>>*<value|uu><rsub|\<ast\>>+S<rsub|\<alpha\>>*E<rsub|\<alpha\>>-F<rsub|\<alpha\>><rsup|E>|S<rsub|\<alpha\>>-u<rsub|\<ast\>>>
  </equation*>

  The flux is now given by

  <\equation*>
    F*<around|(|U<rsub|l>,U<rsub|r>,F<rsub|l>,F<rsub|r>;<wide|U|\<bar\>><rsub|l>,<wide|U|\<bar\>><rsub|r>|)>=<choice|<tformat|<table|<row|<cell|F<rsub|l>,>|<cell|S<rsub|l>\<gtr\>0>>|<row|<cell|F<rsub|r>,>|<cell|S<rsub|r>\<less\>0>>|<row|<cell|F<rsub|\<ast\>l>=F<rsub|l>+S<rsub|l>*<around|(|U<rsub|\<ast\>l>-U<rsub|l>|)>,>|<cell|S<rsub|l>\<less\>0\<less\>u<rsub|\<ast\>>>>|<row|<cell|F<rsub|\<ast\>r>=F<rsub|r>+S<rsub|r>*<around|(|U<rsub|\<ast\>r>-U<rsub|r>|)>,>|<cell|u<rsub|\<ast\>>\<less\>0\<less\>S<rsub|r>>>>>>
  </equation*>

  where the wave speeds <math|S<rsub|l>> and <math|S<rsub|r>> are computed
  using the cell average values <math|<wide|U|\<bar\>><rsub|l>,<wide|U|\<bar\>><rsub|r>>.

  <appendix|Fourier stability analysis in 2-D><label|sec:fourier2d>

  Consider the linear advection equation

  <\equation>
    <label|eq:2dadv><value|uu><rsub|t>+a<rsub|1>*<value|uu><rsub|x>+a<rsub|2>*<value|uu><rsub|y>=0
  </equation>

  where <math|<around|(|a<rsub|1>,a<rsub|2>|)>> is a constant velocity. We
  first write the LW scheme in matrix form which helps to derive the Fourier
  amplification term. Let us define the matrix of solution and flux values by

  <\equation*>
    <vu><rsub|e><around|(|p,q|)>=u<rsub|p*q><rsup|e>,<space|2em><vf><rsub|e><around|(|p,q|)>=a<rsub|1>*<value|uu><rsub|p*q><rsup|e>,<space|2em><vg><rsub|e><around|(|p,q|)>=a<rsub|2>*<value|uu><rsub|p*q><rsup|e>
  </equation*>

  In the Lax-Wendroff procedure, the time derivative of the solution at all
  the solution points is given by

  <\equation*>
    <vu><rsup|<around|(|m|)>><rsub|e>=-\<sigma\><rsub|1><vD><vu><rsup|<around|(|m-1|)>><rsub|e>-\<sigma\><rsub|2><vu><rsup|<around|(|m-1|)>><rsub|e><vD><rsup|\<top\>>,<space|1em>m=1,2,\<ldots\>,N
  </equation*>

  where <math|\<sigma\><rsub|1>,\<sigma\><rsub|2>> are the CFL numbers along
  <math|x,y> directions, respectively, which are given by

  <\equation*>
    \<sigma\><rsub|1>=<frac|a<rsub|1>*\<Delta\>t|\<Delta\>x<rsub|e>>,<space|2em>\<sigma\><rsub|2>=<frac|a<rsub|2>*\<Delta\>t|\<Delta\>y<rsub|e>>
  </equation*>

  Then the time average solution and fluxes are given by

  <\equation*>
    <vU><rsub|e>=<big|sum><rsub|m=0><rsup|N><frac|<vu><rsub|e><rsup|<around|(|m|)>>|<around|(|m+1|)>!>,<space|2em><vF><rsub|e>=a<rsub|1><vU><rsub|e>,<space|2em><vG><rsub|e>=a<rsub|2><vU><rsub|e>
  </equation*>

  To perform the Fourier analysis, we must write the scheme in matrix-vector
  form. To do this, let us renumber the two dimensional indices
  <math|<around|(|p,q|)>> which denote solution points, into the one
  dimensional numbering by the following transformation

  <\equation*>
    k=p+<around|(|N+1|)>*q,<space|2em>0\<le\>p,q\<le\>N
  </equation*>

  Then <math|k> takes the values <math|0> to
  <math|M=<around|(|N+1|)><rsup|2>-1>. If
  <math|\<phi\><rsub|e>\<in\><re><rsup|<around|(|N+1|)>\<times\><around|(|N+1|)>>>
  is some quantity defined at the solution points, we let
  <math|<rnum|\<phi\><rsub|e>>\<in\><re><rsup|M+1>> denote the same
  renumbered as above. After renumbering, the matrix-matrix products become

  <\equation*>
    <rnum|<vA>\<phi\><rsub|e>>=R<rsub|1><around|(|<vA>|)><rnum|\<phi\><rsub|e>>,<space|2em><rnum|\<phi\><rsub|e><vA>>=R<rsub|2><around|(|<vA>|)><rnum|\<phi\><rsub|e>>
  </equation*>

  where

  <\equation*>
    R<rsub|1><around|(|<vA>|)>=<vI>\<otimes\><vA>,<space|2em>R<rsub|2><around|(|<vA>|)>=<vA><rsup|\<top\>>\<otimes\><vI>
  </equation*>

  with <math|\<otimes\>> denoting the kronecker product. Then the renumbering
  of the solution time derivatives and time average solution and fluxes are
  given by

  <\equation*>
    <rnum|<vu><rsup|<around|(|m|)>><rsub|e>>=<around*|(|-\<sigma\><rsub|1>*R<rsub|1><around|(|<vD>|)>-\<sigma\><rsub|2>*R<rsub|2><around|(|<vD><rsup|\<top\>>|)>|)><rnum|<vu><rsub|e><rsup|<around|(|m-1|)>>>=:<vH><rsub|1><rnum|<vu><rsub|e><rsup|<around|(|m-1|)>>>,<space|1em>m=1,2,\<ldots\>,N
  </equation*>

  <\equation*>
    <rnum|<vU><rsub|e>>=<around*|(|<big|sum><rsub|m=0><rsup|N><frac|<vH><rsub|1><rsup|m>|<around|(|m+1|)>!>|)><rnum|<vu><rsub|e>>=:<vT><rnum|<vu><rsub|e>>,<space|2em><rnum|<vF><rsub|e>>=a<rsub|1><rnum|<vU><rsub|e>>,<space|2em><rnum|<vG><rsub|e>>=a<rsub|2><rnum|<vU><rsub|e>>
  </equation*>

  Finally, the renumbered terms in the update equation<nbsp><eqref|eq:up2d>
  are given by

  <\equation*>
    <rnum|<vD><rsub|1><vF><rsub|e>>=R<rsub|1><around|(|<vD><rsub|1>|)><rnum|<vF><rsub|e>>=a<rsub|1>*R<rsub|1><around|(|<vD><rsub|1>|)><vT><rnum|<vu><rsub|e>>,<space|2em><rnum|<vG><rsub|e><vD><rsub|1><rsup|\<top\>>>=R<rsub|2><around|(|<vD><rsub|1><rsup|\<top\>>|)><rnum|<vG><rsub|e>>=a<rsub|2>*R<rsub|2><around|(|<vD><rsub|1><rsup|\<top\>>|)><vT><rnum|<vu><rsub|e>>
  </equation*>

  so that the cell terms can be written as

  <\equation*>
    <rnum|<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>><vD><rsub|1><vF><rsub|e>+<frac|\<Delta\>*t|\<Delta\>*y<rsub|e>><vG><rsub|e><vD><rsub|1><rsup|\<top\>>>=<around*|(|\<sigma\><rsub|1>*R<rsub|1><around|(|<vD><rsub|1>|)><vT>+\<sigma\><rsub|2>*R<rsub|2><around|(|<vD><rsub|1><rsup|\<top\>>|)><vT>|)><rnum|<vu><rsub|e>>
  </equation*>

  For the terms involving the numerical flux, let us consider the case
  <math|a<rsub|1>\<ge\>0>, <math|a<rsub|2>\<ge\>0>. Let
  <math|<vu><rsub|l>,<vu><rsub|r>,<vu><rsub|b>> denote the solution in the
  elements to the left, right and bottom of the <math|e>'th element. Then,
  for the upwind flux which is obtained for dissipation model D2, we can
  renumber the terms involving the numerical flux as follows

  <\equation*>
    <frac|\<Delta\>*t|\<Delta\>*x<rsub|e>><rnum|<vb><rsub|L><vF><rsub|<emh>><rsup|\<top\>>+<vb><rsub|R><vF><rsub|<eph>><rsup|\<top\>>>=<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>><rnum|a<rsub|1><vb><rsub|L><vV><rsub|R><rsup|\<top\>><vU><rsub|l>+a<rsub|1><vb><rsub|R><vV><rsub|R><rsup|\<top\>><vU><rsub|e>>=\<sigma\><rsub|1>*R<rsub|1><around|(|<vb><rsub|L><vV><rsub|R><rsup|\<top\>>|)><vT><rnum|<vu><rsub|l>>+\<sigma\><rsub|1>*R<rsub|1><around|(|<vb><rsub|R><vV><rsub|R><rsup|\<top\>>|)><vT><rnum|<vu><rsub|e>>
  </equation*>

  <\equation*>
    <frac|\<Delta\>*t|\<Delta\>*y<rsub|e>><rnum|<vG><rsub|<emh>><vb><rsub|L><rsup|\<top\>>+<vG><rsub|<eph>><vb><rsub|R><rsup|\<top\>>>=<frac|\<Delta\>*t|\<Delta\>*y<rsub|e>><rnum|a<rsub|2><vU><rsub|b><vV><rsub|R><vb><rsub|L><rsup|\<top\>>+a<rsub|2><vU><rsub|e><vV><rsub|R><vb><rsub|R><rsup|\<top\>>>=\<sigma\><rsub|2>*R<rsub|2><around|(|<vV><rsub|R><vb><rsub|L><rsup|\<top\>>|)><vT><rnum|<vu><rsub|b>>+\<sigma\><rsub|2>*R<rsub|2><around|(|<vV><rsub|R><vb><rsub|R><rsup|\<top\>>|)><vT><rnum|<vu><rsub|e>>
  </equation*>

  The update equation can be written as

  <\equation*>
    <rnum|<vu><rsub|e><rsup|n+1>>=<vA><rsub|l><rnum|<vu><rsub|l><rsup|n>>+<vA><rsub|e><rnum|<vu><rsub|e><rsup|n>>+<vA><rsub|b><rnum|<vu><rsub|b><rsup|n>>
  </equation*>

  where the coefficient matrices are given by

  <\equation*>
    <vA><rsub|l>=-\<sigma\><rsub|1>*R<rsub|1><around|(|<vb><rsub|L><vV><rsub|R><rsup|\<top\>>|)><vT>,<space|1em><space|1em><vA><rsub|b>=-\<sigma\><rsub|2>*R<rsub|2><around|(|<vV><rsub|R><vb><rsub|L><rsup|\<top\>>|)><vT>
  </equation*>

  <\equation*>
    <vA><rsub|e>=I-\<sigma\><rsub|1>*R<rsub|1><around|(|<vD><rsub|1>|)><vT>-\<sigma\><rsub|2>*R<rsub|2><around|(|<vD><rsub|1><rsup|\<top\>>|)><vT>-\<sigma\><rsub|1>*R<rsub|1><around|(|<vb><rsub|R><vV><rsub|R><rsup|\<top\>>|)><vT>-\<sigma\><rsub|2>*R<rsub|2><around|(|<vV><rsub|R><vb><rsub|R><rsup|\<top\>>|)><vT>
  </equation*>

  Assuming a solution of the form <math|<vu><rsub|e><rsup|n>=<wide|<vu>|^><rsub|k><rsup|n>exp
  <around|(|<im>*<around|(|k<rsub|1>*x<rsub|e>+k<rsub|2>*y<rsub|e>|)>|)>>, we
  get the amplification equation

  <\equation*>
    <rnum|<wide|<vu>|^><rsub|k><rsup|n+1>>=<around|(|<vA><rsub|l>exp
    <around|(|-<im>*\<kappa\><rsub|1>|)>+<vA><rsub|e>+<vA><rsub|b>exp
    <around|(|-<im>*\<kappa\><rsub|2>|)>|)><rnum|<wide|<vu>|^><rsub|k><rsup|n>>=:H<around|(|\<sigma\><rsub|1>,\<sigma\><rsub|2>;\<kappa\><rsub|1>,\<kappa\><rsub|2>|)><rnum|<wide|<vu>|^><rsub|k><rsup|n>>
  </equation*>

  where <math|\<kappa\><rsub|1>=k<rsub|1>*\<Delta\>*x> and
  <math|\<kappa\><rsub|2>=k<rsub|2>*\<Delta\>*y>. For stability, it is
  required that the spectral radius of the matrix
  <math|H<around|(|\<sigma\><rsub|1>,\<sigma\><rsub|2>;\<kappa\><rsub|1>,\<kappa\><rsub|2>|)>>
  is less than or equal to one for all wave numbers
  <math|\<kappa\><rsub|1>,\<kappa\><rsub|2>\<in\><around|[|0,2*\<pi\>|]>>.
  Numerically, we compute the region consisting of the pairs
  <math|<around|(|\<sigma\><rsub|1>,\<sigma\><rsub|2>|)>> that ensures the
  stability. These regions for different degrees with dissipation model D2
  are given in Figures<nbsp>(<reference|fig:2dcfl_radau>) and
  (<reference|fig:2dcfl_g2>) for the Radau and g2 correction functions,
  respectively. We set CFL<math|=2*c>, where <math|c\<assign\>max
  <around|{|\<sigma\>:<around|(|\<sigma\>,\<sigma\>|)><text|is a stable
  pair>|}>> which is the CFL limit when the advection velocity is in the
  direction <math|<around|(|1,1|)>>. These CFL numbers for different degrees
  are given in Table<nbsp><reference|tab:2Dcfl>. We see from the figures that
  the stable domain is bounded by a straight line except in case of degree
  <math|N=1> so that this region is given by

  <\equation>
    <label|eq:2dcfldom><around|\||\<sigma\><rsub|1>|\|>+<around|\||\<sigma\><rsub|2>|\|>\<le\><cfl>
  </equation>

  If the advection velocity is along the <math|x> or <math|y> axis, the CFL
  corresponds to that of the 1-D case, but if the velocity is at an angle to
  the grid, then the allowed time step is reduced. This is because of the one
  dimensional numerical fluxes employed at the cell faces which couple each
  cell only to its left/right and bottom/top cells, without any coupling with
  the diagonal neighbours.

  <\big-figure>
    <tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|2|2|4|4|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/2dcfl/radau_k1_fourier|0.24par|||>>|<cell|<image|figures/2dcfl/radau_k2_fourier|0.24par|||>>|<cell|<image|figures/2dcfl/radau_k3_fourier|0.24par|||>>|<cell|<image|figures/2dcfl/radau_k4_fourier|0.24par|||>>>|<row|<cell|(a)>|<cell|(b)>|<cell|(c)>|<cell|(d)>>>>>
  </big-figure|Stability regions of LWFR scheme with the Radau correction
  function and D2 dissipation model in two dimensions. (a) <math|N=1>, (b)
  <math|N=2>, (c) <math|N=3>, (d) <math|N=4>.<label|fig:2dcfl_radau>>

  <\big-figure>
    <tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|2|2|4|4|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/2dcfl/g2_k1_fourier|0.24par|||>>|<cell|<image|figures/2dcfl/g2_k2_fourier|0.24par|||>>|<cell|<image|figures/2dcfl/g2_k3_fourier|0.24par|||>>|<cell|<image|figures/2dcfl/g2_k4_fourier|0.24par|||>>>|<row|<cell|(a)>|<cell|(b)>|<cell|(c)>|<cell|(d)>>>>>
  </big-figure|Stability regions of LWFR scheme with the Radau correction
  function and D2 dissipation model in two dimensions. (a) <math|N=1>, (b)
  <math|N=2>, (c) <math|N=3>, (d) <math|N=4>.<label|fig:2dcfl_g2>>

  <big-table|<block|<tformat|<table|<row|<cell|<math|N>>|<cell|1>|<cell|2>|<cell|3>|<cell|4>>|<row|<cell|Radau>|<cell|0.259>|<cell|0.166>|<cell|0.101>|<cell|0.067>>|<row|<cell|<math|g<rsub|2>>>|<cell|0.511>|<cell|0.348>|<cell|0.178>|<cell|0.108>>>>>|Two
  dimensional CFL condition defined in equation<nbsp><eqref|eq:2dcfldom> for
  LWFR method with the dissipation model D2 and two correction
  functions<label|tab:2Dcfl>>

  <appendix|equivalence with direct flux reconstruction
  (DFR)><label|sec:frdfr>

  The direct flux reconstruction method does not require the choice of
  correction function. Following the ideas of<nbsp><cite|Romero2016>, we will
  prove that the LWFR scheme using Gauss-Legendre points and Radau correction
  function described in Section<nbsp><reference|sec:reconstruction> is
  equivalent to the LWDFR scheme described in
  Section<nbsp><reference|sec:DFR>, by showing that the
  <math|<vb><rsub|L>,<vb><rsub|R>,<vD><rsub|1>> are same for both.

  <paragraph|Equivalence of <math|<vb><rsub|L>>>We begin by proving the claim
  for <math|<vb><rsub|L>>. For the FR scheme, we have

  <\equation*>
    <vb><rsub|L><rsup|FR>=<around*|[|<tabular*|<tformat|<table|<row|<cell|g<rsub|L><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|g<rsub|L><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>
  </equation*>

  where <math|g<rsub|L>> is the Radau correction function and
  <math|<around|{|\<xi\><rsub|p>,0\<le\>p\<le\>N|}>> are Gauss-Legendre
  quadrature points on the interval <math|<around|[|0,1|]>>. For the DFR
  scheme, we have

  <\equation*>
    <vb><rsub|L><rsup|FR>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>
  </equation*>

  where <math|<wide|\<ell\>|~><rsub|p>>'s are Lagrange polynomials associated
  to the points <math|<around|{|\<xi\><rsub|p>,-1\<le\>p\<le\>N+1|}>> where
  <math|\<xi\><rsub|-1>=0> and <math|\<xi\><rsub|N+1>=1>. Since the
  <math|N+1> zeros of <math|L<rsub|N+1>> are also zeros of
  <math|<wide|\<ell\>|~><rsub|-1>> and <math|<wide|\<ell\>|~><rsub|-1><around|(|0|)>=1>,
  <math|<wide|\<ell\>|~><rsub|-1><around|(|1|)>=0>, we must have

  <\equation*>
    <wide|\<ell\>|~><rsub|-1><around|(|\<xi\>|)>=<around|(|-1|)><rsup|N>*<around|(|\<xi\>-1|)>*L<rsub|N+1>*<around|(|2*\<xi\>-1|)>
  </equation*>

  To prove our claim, we need to prove

  <\equation*>
    <od||\<xi\>><around|(|g<rsub|L>-<wide|\<ell\>|~><rsub|-1>|)><around|(|\<xi\><rsub|p>|)>=0,<space|2em>p=0,1,\<ldots\>,N
  </equation*>

  i.e.,

  <\equation*>
    L<rsub|N><rprime|'>*<around|(|2*\<xi\><rsub|p>-1|)>-L<rsub|N+1>*<around|(|2*\<xi\><rsub|p>-1|)>-<around|(|2*\<xi\><rsub|p>-1|)>*L<rsub|N+1><rprime|'>*<around|(|2*\<xi\><rsub|p>-1|)>=0,<space|2em>p=0,1,\<ldots\>,N
  </equation*>

  To work in <math|<around|[|-1,1|]>> which is the natural domain of Legendre
  polynomials, we define the residual <math|R<around|(|\<eta\>|)>=L<rsub|N><rprime|'><around|(|\<eta\>|)>-L<rsub|N+1><around|(|\<eta\>|)>-\<eta\>*L<rsub|N+1><rprime|'><around|(|\<eta\>|)>>
  so we have to show

  <\equation*>
    R<around|(|\<eta\><rsub|p>|)>=0,<space|2em>p=0,1,\<ldots\>,N
  </equation*>

  where <math|\<eta\><rsub|p>=2*\<xi\><rsub|p>-1> are the Gauss-Legendre
  points in <math|<around|[|-1,+1|]>>. Using the recurrence relations

  <\align*>
    <tformat|<table|<row|<cell|<around|(|1-\<eta\><rsup|2>|)>*L<rsub|N+1><rprime|'><around|(|\<eta\>|)>>|<cell|=<around|(|N+1|)>*<around|[|L<rsub|N><around|(|\<eta\>|)>-\<eta\>*L<rsub|N+1><around|(|\<eta\>|)>|]>>>|<row|<cell|L<rsub|N><rprime|'><around|(|\<eta\>|)>>|<cell|=<around|(|N+1|)>*<around|[|\<eta\>*L<rsub|N><around|(|\<eta\>|)>-L<rsub|N+1><around|(|\<eta\>|)>|]>>>>>
  </align*>

  we get

  <\equation*>
    R<around|(|\<eta\>|)>=-<around|(|N+2|)>*L<rsub|N+1><around|(|\<eta\>|)>
  </equation*>

  proving that <math|R<around|(|\<eta\><rsub|p>|)>=0> for all
  <math|p=0,1,\<ldots\>,N> since these <math|\<eta\><rsub|p>> are the zeros
  of <math|L<rsub|N+1>>. Thus, <math|<vb><rsub|L><rsup|FR>=<vb><rsub|L><rsup|DFR>>.
  The claim for right correction follows analogously.

  <paragraph|Equivalence of <math|<vD><rsub|1>>>Writing
  <math|<vb><rsub|L>=<vb><rsup|FR><rsub|L>=<vb><rsup|DFR><rsub|L>> and
  <math|<vb><rsub|R>=<vb><rsup|FR><rsub|R>=<vb><rsup|DFR><rsub|R>>, proving
  that the <math|<vD><rsub|1>> matrices are same for both schemes is
  equivalent to showing that

  <\equation*>
    <vD>=<vD><rsub|1><rsup|DFR>+<vb><rsub|L><vV><rsub|L><rsup|\<top\>>+<vb><rsub|R><vV><rsub|R><rsup|\<top\>>,
  </equation*>

  where <math|<vD>> is the differentiation matrix on Gauss-Legendre points.
  Further, to show that these two matrices are equal, it is enough to prove
  that their action on a set of <math|N+1> linearly independent column
  vectors is the same. For this, we consider an arbitrary polynomial
  <math|p<around|(|\<xi\>|)>> of degree less than or equal to <math|N>, and
  let <math|<vp>=<around|[|p<around|(|\<xi\><rsub|0>|)>,\<cdots\>,p<around|(|\<xi\><rsub|N>|)>|]><rsup|\<top\>>>
  and <math|<vp><rprime|'>=<around|[|p<rprime|'><around|(|\<xi\><rsub|0>|)>,\<cdots\>,p<rprime|'><around|(|\<xi\><rsub|N>|)>|]><rsup|\<top\>>=<vD><vp>>.
  We have

  <\equation*>
    <vb><rsub|L><vV><rsub|L><rsup|\<top\>><vp>=<vb><rsub|L><big|sum><rsub|p=0><rsup|N>p<around|(|\<xi\><rsub|p>|)>*\<ell\><rsub|p><around|(|0|)>=<vb><rsub|L>p<around|(|0|)>=p<around|(|0|)><around|[|<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|0>|)>,\<cdots\>,<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|N>|)>|]><rsup|\<top\>>
  </equation*>

  and

  <\equation*>
    <vb><rsub|R><vV><rsub|R><rsup|\<top\>><vp>=<vb><rsub|R><big|sum><rsub|p=0><rsup|N>p<around|(|\<xi\><rsub|p>|)>*\<ell\><rsub|p><around|(|1|)>=<vb><rsub|R>p<around|(|1|)>=p<around|(|1|)><around|[|<wide|\<ell\>|~><rsub|N+1><rprime|'><around|(|\<xi\><rsub|0>|)>,\<cdots\>,<wide|\<ell\>|~><rsub|N+1><rprime|'><around|(|\<xi\><rsub|N>|)>|]><rsup|\<top\>>
  </equation*>

  As <math|p> is a polynomial of degree less than or equal to <math|N>, we
  can write

  <\equation*>
    p<around|(|\<xi\>|)>=<big|sum><rsub|p=-1><rsup|N+1>p<around|(|\<xi\><rsub|p>|)>*<wide|\<ell\>|~><rsub|p><around|(|\<xi\>|)>,<space|2em>p<rprime|'><around|(|\<xi\>|)>=<big|sum><rsub|p=-1><rsup|N+1>p<around|(|\<xi\><rsub|p>|)>*<wide|\<ell\>|~><rprime|'><rsub|p><around|(|\<xi\>|)>
  </equation*>

  We get

  <\equation*>
    <around|(|<vD><rsub|1><rsup|DFR>+<vb><rsub|L><vV><rsub|L><rsup|\<top\>>+<vb><rsub|R><vV><rsub|R><rsup|\<top\>>|)><vp>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<big|sum><rsub|q=0><rsup|N>p<around|(|\<xi\><rsub|0>|)>*<wide|\<ell\>|~><rprime|'><rsub|q><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|<big|sum><rsub|q=0><rsup|N>p<around|(|\<xi\><rsub|N>|)>*<wide|\<ell\>|~><rprime|'><rsub|q><around|(|\<xi\><rsub|N>|)>>>>>>|]>+<around*|[|<tabular*|<tformat|<table|<row|<cell|p<around|(|0|)>*<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|p<around|(|0|)>*<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>+<around*|[|<tabular*|<tformat|<table|<row|<cell|p<around|(|1|)>*<wide|\<ell\>|~><rsub|N+1><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|p<around|(|1|)>*<wide|\<ell\>|~><rsub|N+1><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>=<vp><rprime|'>=<vD><vp>
  </equation*>

  for all <math|<vp>\<in\><re><rsup|N+1>>, which proves the claim.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|2>
    <associate|page-first|21>
    <associate|page-medium|paper>
    <associate|section-nr|2>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:lwfr.paper1|<tuple|3.2|32>>
    <associate|alg:rkfr.paper1|<tuple|3.1|32>>
    <associate|apendix:numfluxes|<tuple|A|61>>
    <associate|auto-1|<tuple|3|21>>
    <associate|auto-10|<tuple|3.1.4.4|25>>
    <associate|auto-11|<tuple|3.2|26>>
    <associate|auto-12|<tuple|3.2.1|27>>
    <associate|auto-13|<tuple|3.2.2|27>>
    <associate|auto-14|<tuple|3.3|29>>
    <associate|auto-15|<tuple|3.1|30>>
    <associate|auto-16|<tuple|3.4|31>>
    <associate|auto-17|<tuple|3.5|32>>
    <associate|auto-18|<tuple|3.5.1|33>>
    <associate|auto-19|<tuple|3.5.1.1|33>>
    <associate|auto-2|<tuple|3.1|21>>
    <associate|auto-20|<tuple|3.1|33>>
    <associate|auto-21|<tuple|3.2|34>>
    <associate|auto-22|<tuple|3.3|35>>
    <associate|auto-23|<tuple|3.4|35>>
    <associate|auto-24|<tuple|3.5|36>>
    <associate|auto-25|<tuple|3.6|36>>
    <associate|auto-26|<tuple|3.7|37>>
    <associate|auto-27|<tuple|3.8|37>>
    <associate|auto-28|<tuple|3.5.1.2|37>>
    <associate|auto-29|<tuple|3.9|38>>
    <associate|auto-3|<tuple|3.1.1|22>>
    <associate|auto-30|<tuple|3.10|38>>
    <associate|auto-31|<tuple|3.11|38>>
    <associate|auto-32|<tuple|3.12|39>>
    <associate|auto-33|<tuple|3.13|39>>
    <associate|auto-34|<tuple|3.5.2|39>>
    <associate|auto-35|<tuple|3.14|40>>
    <associate|auto-36|<tuple|3.15|41>>
    <associate|auto-37|<tuple|3.16|41>>
    <associate|auto-38|<tuple|3.5.3|41>>
    <associate|auto-39|<tuple|3.17|42>>
    <associate|auto-4|<tuple|3.1.2|22>>
    <associate|auto-40|<tuple|3.18|42>>
    <associate|auto-41|<tuple|3.19|42>>
    <associate|auto-42|<tuple|3.5.4|42>>
    <associate|auto-43|<tuple|3.20|43>>
    <associate|auto-44|<tuple|3.6|43>>
    <associate|auto-45|<tuple|3.6.1|44>>
    <associate|auto-46|<tuple|3.21|44>>
    <associate|auto-47|<tuple|3.6.2|45>>
    <associate|auto-48|<tuple|3.22|45>>
    <associate|auto-49|<tuple|3.6.3|45>>
    <associate|auto-5|<tuple|3.1.3|23>>
    <associate|auto-50|<tuple|3.23|46>>
    <associate|auto-51|<tuple|3.6.4|46>>
    <associate|auto-52|<tuple|3.24|46>>
    <associate|auto-53|<tuple|3.6.5|47>>
    <associate|auto-54|<tuple|3.25|47>>
    <associate|auto-55|<tuple|3.6.6|47>>
    <associate|auto-56|<tuple|3.26|48>>
    <associate|auto-57|<tuple|3.27|48>>
    <associate|auto-58|<tuple|3.6.7|49>>
    <associate|auto-59|<tuple|3.28|49>>
    <associate|auto-6|<tuple|3.1.4|23>>
    <associate|auto-60|<tuple|3.29|49>>
    <associate|auto-61|<tuple|3.7|49>>
    <associate|auto-62|<tuple|3.8|51>>
    <associate|auto-63|<tuple|3.8.1|51>>
    <associate|auto-64|<tuple|3.30|52>>
    <associate|auto-65|<tuple|3.8.2|52>>
    <associate|auto-66|<tuple|3.31|53>>
    <associate|auto-67|<tuple|3.32|53>>
    <associate|auto-68|<tuple|3.33|54>>
    <associate|auto-69|<tuple|3.8.3|54>>
    <associate|auto-7|<tuple|3.1.4.1|24>>
    <associate|auto-70|<tuple|3.34|55>>
    <associate|auto-71|<tuple|3.35|55>>
    <associate|auto-72|<tuple|3.9|55>>
    <associate|auto-73|<tuple|3.9.1|56>>
    <associate|auto-74|<tuple|3.36|57>>
    <associate|auto-75|<tuple|3.37|57>>
    <associate|auto-76|<tuple|3.38|58>>
    <associate|auto-77|<tuple|3.9.2|58>>
    <associate|auto-78|<tuple|3.39|59>>
    <associate|auto-79|<tuple|3.40|59>>
    <associate|auto-8|<tuple|3.1.4.2|24>>
    <associate|auto-80|<tuple|3.41|60>>
    <associate|auto-81|<tuple|3.10|60>>
    <associate|auto-82|<tuple|A|61>>
    <associate|auto-83|<tuple|A.1|61>>
    <associate|auto-84|<tuple|A.1.1|61>>
    <associate|auto-85|<tuple|A.1.2|61>>
    <associate|auto-86|<tuple|A.1.3|61>>
    <associate|auto-87|<tuple|A.1.4|62>>
    <associate|auto-88|<tuple|B|63>>
    <associate|auto-89|<tuple|B.1|64>>
    <associate|auto-9|<tuple|3.1.4.3|24>>
    <associate|auto-90|<tuple|B.2|65>>
    <associate|auto-91|<tuple|B.1|65>>
    <associate|auto-92|<tuple|C|67>>
    <associate|ch:lwfr|<tuple|3|21>>
    <associate|eq:1deuler|<tuple|3.13|43>>
    <associate|eq:2dadv|<tuple|B.1|63>>
    <associate|eq:2dburger|<tuple|3.22|54>>
    <associate|eq:2dcfldom|<tuple|B.2|64>>
    <associate|eq:2deuler|<tuple|3.23|55>>
    <associate|eq:2dstate|<tuple|3.24|56>>
    <associate|eq:2dvaradv|<tuple|3.21|51>>
    <associate|eq:fder|<tuple|3.6|23>>
    <associate|eq:laup|<tuple|3.12|29>>
    <associate|eq:lwtay|<tuple|3.1|21>>
    <associate|eq:nfdiss1|<tuple|3.7|26>>
    <associate|eq:nfdiss2|<tuple|3.8|26>>
    <associate|eq:nflin1|<tuple|3.10|27>>
    <associate|eq:nflin2|<tuple|3.11|27>>
    <associate|eq:pstar|<tuple|A.1|62>>
    <associate|eq:shuosher|<tuple|3.17|46>>
    <associate|eq:sod|<tuple|3.15|45>>
    <associate|eq:state|<tuple|3.14|43>>
    <associate|eq:tavgflux|<tuple|3.2|21>>
    <associate|eq:tavgsol|<tuple|3.9|26>>
    <associate|eq:tvgproperty|<tuple|3.3|21>>
    <associate|eq:up2d|<tuple|3.20|51>>
    <associate|eq:uplwfr|<tuple|3.4|21>>
    <associate|eq:upmean|<tuple|3.5|22>>
    <associate|fig:2dcfl_g2|<tuple|B.2|65>>
    <associate|fig:2dcfl_radau|<tuple|B.1|64>>
    <associate|fig:ShuOsher|<tuple|3.24|46>>
    <associate|fig:ShuOsherCorr|<tuple|3.28|49>>
    <associate|fig:blast|<tuple|3.25|47>>
    <associate|fig:bucklev1|<tuple|3.20|43>>
    <associate|fig:burg1|<tuple|3.17|42>>
    <associate|fig:burg2|<tuple|3.18|42>>
    <associate|fig:burg4|<tuple|3.19|42>>
    <associate|fig:cla1|<tuple|3.1|33>>
    <associate|fig:cla2|<tuple|3.2|34>>
    <associate|fig:cla2_dirichlet|<tuple|3.5|36>>
    <associate|fig:cla3|<tuple|3.3|35>>
    <associate|fig:cla4|<tuple|3.4|35>>
    <associate|fig:cla5|<tuple|3.6|36>>
    <associate|fig:conv linear adv 2d|<tuple|3.30|52>>
    <associate|fig:conv linear rotate 2d|<tuple|3.32|53>>
    <associate|fig:conv_burger2d|<tuple|3.35|55>>
    <associate|fig:dmr.plot|<tuple|3.39|59>>
    <associate|fig:dmr.plot.zoom|<tuple|3.40|59>>
    <associate|fig:dmr.wct|<tuple|3.41|60>>
    <associate|fig:dofs2d|<tuple|3.29|49>>
    <associate|fig:dwave|<tuple|3.21|44>>
    <associate|fig:hat1|<tuple|3.9|38>>
    <associate|fig:hat2|<tuple|3.10|38>>
    <associate|fig:hat3|<tuple|3.11|38>>
    <associate|fig:interactions|<tuple|3.33|54>>
    <associate|fig:isentropic.convergence|<tuple|3.36|57>>
    <associate|fig:isentropic.ratios.vs.grid.1.2.3.4|<tuple|3.38|58>>
    <associate|fig:isentropic.time.vs.error|<tuple|3.37|57>>
    <associate|fig:lax|<tuple|3.23|46>>
    <associate|fig:lin2d_rotate_soln|<tuple|3.31|53>>
    <associate|fig:lineplot_burg2d|<tuple|3.34|55>>
    <associate|fig:mult1|<tuple|3.12|39>>
    <associate|fig:mult2|<tuple|3.13|39>>
    <associate|fig:numflux_toro5_contact|<tuple|3.27|48>>
    <associate|fig:numflx|<tuple|3.26|48>>
    <associate|fig:sod|<tuple|3.22|45>>
    <associate|fig:vla1|<tuple|3.14|40>>
    <associate|fig:vla2|<tuple|3.15|41>>
    <associate|fig:vla3|<tuple|3.16|41>>
    <associate|fig:wp1|<tuple|3.7|37>>
    <associate|fig:wp2|<tuple|3.8|37>>
    <associate|sec: vla|<tuple|3.5.2|39>>
    <associate|sec:DFR|<tuple|3.1.3|23>>
    <associate|sec:alw|<tuple|3.1.4|23>>
    <associate|sec:cla|<tuple|3.5.1|33>>
    <associate|sec:four1d|<tuple|3.3|29>>
    <associate|sec:fourier2d|<tuple|B|63>>
    <associate|sec:frdfr|<tuple|C|67>>
    <associate|sec:lim|<tuple|3.4|31>>
    <associate|sec:lw|<tuple|3.1|21>>
    <associate|sec:numflux|<tuple|3.2|26>>
    <associate|sec:reconstruction|<tuple|3.1.2|22>>
    <associate|sec:res1dsys|<tuple|3.6|43>>
    <associate|sec:sum|<tuple|3.10|60>>
    <associate|tab:2Dcfl|<tuple|B.1|65>>
    <associate|tab:cfl|<tuple|3.1|30>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Romero2016

      Zorio2017

      Burger2017

      Zorio2017

      Burger2017

      Qiu2005b

      Rusanov1962

      Engquist1981

      Dumbser2008

      Gassner2011a

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989

      Butcher2016

      Gottlieb2001

      Tsitouras2011

      Guo2015

      Guo2015

      Spiteri2002

      Xu2019

      Gottlieb2001

      Tsitouras2011

      Carpenter1995

      Spiteri2002

      Tsitouras2011

      Jiang1996

      Offner2019

      Offner2019

      Lou2020

      Zhang2010b

      Spiteri2002

      Tsitouras2011

      Ruuth2002

      Spiteri2002

      Sod1978

      Lax1954

      Hirsch1990

      Hirsch1990

      Shu1989

      Qiu2005b

      Woodward1984

      Qiu2005b

      Zhang2010b

      Toro2009

      Gottlieb2001

      Tsitouras2011

      Rackauckas2017

      Bezanson2017

      Ranocha2022

      LeVeque1996

      Qiu2005b

      Gassner2011a

      Gottlieb2001

      Spiteri2002

      Tsitouras2011

      Rackauckas2017

      Batten1997

      Bezanson2017

      Yee1999

      Spiegel2016

      Woodward1984

      Qiu2005b

      Qiu2005b

      Rusanov1962

      Roe1981

      Harten1983a

      Einfeldt1988

      Batten1997

      Toro2009

      Guermond2016

      Toro2020

      Toro2009

      Toro1994

      Romero2016
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|3.1>||Error convergence
      for constant linear advection; (a) GL points, (b) GLL points. The
      different colors correspond to degrees
      <with|mode|<quote|math>|N=1,2,3,4> from top to
      bottom.>|<pageref|auto-20>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.2>||Error convergence
      for constant linear advection; (a) GL points , (b) GLL points. The
      different colors correspond to degrees
      <with|mode|<quote|math>|N=1,2,3,4> from top to
      bottom.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.3>||Error versus time
      for constant linear advection, initial condition
      <with|mode|<quote|math>|u(x, 0) = \\sin(2 \<pi\> x)>,
      <with|mode|<quote|math>|x\<in\> [0,1]>, for different polynomial
      degrees, each with 200 dofs; GL solution points and Radau correction.
      (a) <with|mode|<quote|math>|N=1>, (b) <with|mode|<quote|math>|N=2>, (c)
      <with|mode|<quote|math>|N=3>, (d) <with|mode|<quote|math>|N=4>.>|<pageref|auto-22>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.4>|| Semi-log plot of
      relative change in L2 norm versus time for constant linear advection
      with the initial condition <with|mode|<quote|math>|u(x, 0) =
      sin(2\<pi\>x), x \<in\> [0, 1]> for different polynomial degrees, each
      with 200 dofs; GL solution points and Radau
      correction.>|<pageref|auto-23>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.5>||Convergence for
      constant linear advection with Dirichlet boundary conditions; (a) using
      CFL numbers of LW-D1 for all schemes, (b) using corresponding CFL
      number for each scheme. The different colors correspond to degrees N =
      1, 2, 3, 4 from top to bottom.>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.6>|| Semi-log plot of
      relative change in <with|mode|<quote|math>|L<rsub|2>> norm versus time
      for constant linear advection, with initial condition
      <with|mode|<quote|math>|u(x, 0) = sin(2\<pi\>x), x \<in\> [0, 1]>
      together with Dirichlet boundary conditions, for different polynomial
      degrees, each with 200 dofs; GL solution points and Radau
      correction.>|<pageref|auto-25>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.7>||Constant linear
      advection of a wave packet; solution at time <with|mode|<quote|math>|t
      = 1> with 160 dofs using polynomial degree (a)
      <with|mode|<quote|math>|N = 3>, (b) <with|mode|<quote|math>|N =
      4>.>|<pageref|auto-26>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.8>||Error convergence
      for constant linear advection of a wave packet; (a) GL points, (b) GLL
      points. The different colors correspond to degrees N = 1, 2, 3, 4 from
      top to bottom.>|<pageref|auto-27>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.9>|| Constant linear
      advection of hat profile without limiter. The solution is shown at time
      t = 1 with 200 dofs using polynomial degree (a)
      <with|mode|<quote|math>|N = 3>, (b) <with|mode|<quote|math>|N =
      4>.>|<pageref|auto-29>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.10>|| Constant linear
      advection of hat profile with TVB limiter (<with|mode|<quote|math>|M =
      100>). The solution is shown at time <with|mode|<quote|math>|t = 1> and
      200 dofs using polynomial degree (a) <with|mode|<quote|math>|N = 3>,
      (b) <with|mode|<quote|math>|N = 4>.>|<pageref|auto-30>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.11>|| Constant linear
      advection of hat profile with TVB limiter (<with|mode|<quote|math>|M =
      100>) where Runge-Kutta time integration is performed using RK65
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>[<write|bib|Tsitouras2011><reference|bib-Tsitouras2011>].
      The solution is shown at time <with|mode|<quote|math>|t = 1> and 200
      dofs using polynomial degree <with|mode|<quote|math>|N =
      4>.>|<pageref|auto-31>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.12>||Constant linear
      advection of a composite profile without limiter. The solution is shown
      at time <with|mode|<quote|math>|t = 8> using 400 dofs in each case and
      polynomial degree (a) <with|mode|<quote|math>|N = 3>, (b)
      <with|mode|<quote|math>|N = 4>.>|<pageref|auto-32>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.13>||Constant linear
      advection of a composite profile with TVB limiter
      (<with|mode|<quote|math>|M = 50>). The solution is shown at time
      <with|mode|<quote|math>|t = 8> using 400 dofs in each case and
      polynomial degree (a) <with|mode|<quote|math>|N = 3>, (b)
      <with|mode|<quote|math>|N = 4>.>|<pageref|auto-33>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.14>|| Error
      convergence for variable linear advection with
      <with|mode|<quote|math>|a(x) = x>: (a) AE scheme, (b) EA scheme, (c) AE
      vs EA.>|<pageref|auto-35>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.15>|| Error
      convergence for variable linear advection with
      <with|mode|<quote|math>|a(x) = x<rsup|2>>: (a) AE scheme, (b) EA
      scheme, (c) AE vs EA.>|<pageref|auto-36>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.16>|| Error versus
      time for linear advection with wave speed <with|mode|<quote|math>|a(x)
      = x<rsup|2>> for different polynomial degrees; GL solution points,
      Radau correction and polynomial degree (a) <with|mode|<quote|math>|N =
      3>, (b) <with|mode|<quote|math>|N = 4>.>|<pageref|auto-37>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.17>||Solution of 1-D
      Burger's equation with <with|mode|<quote|math>|N=3> and 100 cells at
      different time instants. TVB limiter <with|mode|<quote|math>|(M=1)> is
      used. The reference solution is computed using RKFR, degree
      <with|mode|<quote|math>|N=1>, on a mesh of 3500
      cells.>|<pageref|auto-39>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.18>||Error
      convergence for 1-D Burger's equation at time
      <with|mode|<quote|math>|t=2>. (a) AE vs EA, (b) Radau vs g2, EA scheme,
      (c) LW-EA vs RK.>|<pageref|auto-40>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.19>||Error
      convergence for 1-D Burger's equation at time
      <with|mode|<quote|math>|t=2>; effect of numerical fluxes for
      <with|mode|<quote|math>|N=1,3>. (a) AE scheme, (b) EA
      scheme.>|<pageref|auto-41>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.20>||Solution of 1-D
      Burger's equation with <with|mode|<quote|math>|N=3> and 100 cells at
      different time instants. TVB limiter <with|mode|<quote|math>|(M=1)> is
      used. The reference solution is computed using RKFR, degree
      <with|mode|<quote|math>|N=1>, on a mesh of 3500
      cells.>|<pageref|auto-43>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|3.21>|>
        Density error convergence for 1-D Euler's equation at time
        <with|mode|<quote|math>|t=1>. The different colors correspond to
        degrees <with|mode|<quote|math>|N=1,2,3,4> from top to bottom. (a) GL
        points, (b) GLL points.
      </surround>|<pageref|auto-46>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.22>||Numerical
      solutions of 1-D Euler equations (Sod's test case) obtained by LW and
      RK schemes for polynomial degree (a) <with|mode|<quote|math>|N=3> and
      (b) <with|mode|<quote|math>|N=4> using Radau correction function and GL
      solution points. The solutions are shown at time
      <with|mode|<quote|math>|t=0.2> on a mesh of
      <with|mode|<quote|math>|100> cells with Rusanov flux and D2
      dissipation. The TVB limiter is used with the parameter
      <with|mode|<quote|math>|M=10>.>|<pageref|auto-48>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.23>|| Numerical
      solutions of 1-D Euler equations (Lax's test case) obtained by LW and
      RK schemes for polynomial degree (a) <with|mode|<quote|math>|N = 3> and
      (b) <with|mode|<quote|math>|N = 4> with Radau correction function and
      GL solution points. The solutions are computed on a mesh of 200 cells
      with dissipation model D2 and Rusanov numerical flux and are shown at
      time <with|mode|<quote|math>|t = 1.3>. The TVB limiter is used with
      parameter <with|mode|<quote|math>|M = 1>.>|<pageref|auto-50>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.24>||Numerical
      solutions of 1-D Euler equations (Shu-Osher problem) obtained by LW and
      RK schemes for (a, c) <with|mode|<quote|math>|N=3> and (b, d)
      <with|mode|<quote|math>|N=4> with Radau correction function and GL
      solution points. The enlarged plot of the oscillatory portion is given
      in the bottom row. The solutions are shown at time
      <with|mode|<quote|math>|t=1.8> on a mesh of 400 cells with dissipation
      model D2 and Rusanov numerical flux. \ The TVB limiter is used with
      parameter <with|mode|<quote|math>|M=300>.>|<pageref|auto-52>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.25>||. Numerical
      solutions of 1-D Euler equations (Blast wave) obtained by LWFR and RKFR
      schemes for (a) <with|mode|<quote|math>|N = 3> and (b)
      <with|mode|<quote|math>|N = 4> using Radau correction function and GL
      solution points. The solutions are plotted at time
      <with|mode|<quote|math>|t = 0.038> on a mesh of 400 cells with
      dissipation model D2 and Rusanov numerical flux. The corresponding CFL
      numbers of LWFR scheme are chosen from the Table
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|tab:cfl>
      and kept same for the RKFR schemes. TVB limiter is used with the
      parameter <with|mode|<quote|math>|M = 300> and the EA scheme is used
      for numerical flux.>|<pageref|auto-54>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.26>||Numerical
      solutions of 1-D Euler equations (Blast wave) obtained by LW schemes
      with different numerical fluxes (a) LF, (b) HLL, (c) HLLC and (d) ROE
      compared with Rusanov flux, for <with|mode|<quote|math>|N=3> using
      Radau correction function and GL solution points. All other parameters
      remain the same as in Figure <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|fig:blast>.>|<pageref|auto-56>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.27>||Numerical
      solutions of 1-D Euler's equations for (a) stationary contact test, (b)
      Toro's Test 5 obtained by LW schemes with different numerical fluxes
      for polynomial degree <with|mode|<quote|math>|N=4> using Radau
      correction function and GL solution points, TVB
      <with|mode|<quote|math>|<around|(|M=1|)>> limiter on a grid of 100
      cells.>|<pageref|auto-57>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.28>||Numerical
      solutions of 1-D Euler equations (Shu-Osher problem) for (a)
      <with|mode|<quote|math>|N=1>, (b) <with|mode|<quote|math>|N=2>, (c)
      <with|mode|<quote|math>|N=3>, (d) <with|mode|<quote|math>|N=4>.
      Comparison of LW scheme with GL solution points for two correction
      functions, Radau and g2, with their own CFL numbers chosen from Table
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|tab:cfl>,
      except for <with|mode|<quote|math>|g<rsub|2>> correction function with
      <with|mode|<quote|math>|N=1>, where we choose CFL=0.44. The enlarged
      oscillatory portion of the solutions are shown. The solutions are
      computed at time <with|mode|<quote|math>|t=1.8> on a mesh of 400 cells
      with dissipation model D2 and HLLC numerical flux. The TVB limiter is
      used with parameter <with|mode|<quote|math>|M=300>.>|<pageref|auto-59>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.29>||Location of
      solution points and flux points. Numerical flux is required at the blue
      points on the faces.>|<pageref|auto-60>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.30>||Error
      convergence test for 2-D linear advection equation with velocity
      <with|mode|<quote|math>|\<b-a\>=<around|(|1,1|)>> at
      <with|mode|<quote|math>|t=1.0>, initial data
      <with|mode|<quote|math>|u<rsub|0>*<around|(|x,y|)>=sin
      <around|(|2*\<pi\>*x|)>*sin <around|(|2*\<pi\>*y|)>>; (a) GL points,
      (b) GLL points. The different colors correspond to degrees
      <with|mode|<quote|math>|N=1,2,3,4> from top to
      bottom.>|<pageref|auto-64>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.31>||Linear advection
      with velocity <with|mode|<quote|math>|\<b-a\>=<around|(|-y,x|)>> on
      <with|mode|<quote|math>|<around|[|0,1|]>\<times\><around|[|0,1|]>> with
      inflow/outflow boundary condition. The solutions are shown on a mesh of
      <with|mode|<quote|math>|50\<times\>50> cells with polynomial degree
      <with|mode|<quote|math>|N=3>; (a) initial solution, (b) LWFR,
      <with|mode|<quote|math>|t=<frac|\<pi\>|2>> (c) RKFR,
      <with|mode|<quote|math>|t=<frac|\<pi\>|2>>.>|<pageref|auto-66>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.32>||Error
      convergence test for 2-D linear advection equation with velocity
      <with|mode|<quote|math>|\<b-a\>=<around|(|-y,x|)>> at
      <with|mode|<quote|math>|t=<frac|\<pi\>|2>>, initial data
      <with|mode|<quote|math>|u<rsub|0>*<around|(|x,y|)>=1+exp
      <around|(|-50*<around|(|<around|(|x-1/2|)><rsup|2>+y<rsup|2>|)>|)>>
      using (a) GL points, (b) GLL points.>|<pageref|auto-67>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.33>||Numerical
      solutions of composite signal with velocity
      <with|mode|<quote|math>|a=(<frac|1|2>-y,x-<frac|1|2>)> obtained for
      degree <with|mode|<quote|math>|N=3> using Radau correction function and
      GL solution points. The solutions are plotted after 1 period of
      rotation on a mesh of <with|mode|<quote|math>|100\<times\>100> cells;
      No limiter is used in (b), (c) and TVB limiter
      <with|mode|<quote|math>|(M=100)> is used in (d), (e).
      >|<pageref|auto-68>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|3.34>|>
        Line plot across the diagonal of <with|mode|<quote|math>|[0, 1]
        \<times\> [0, 1]> of the solution of 2-D Burger's equation with 50
        \<times\> 50 cells and degree <with|mode|<quote|math>|N = 3>. The
        reference solution for <with|mode|<quote|math>|t = 0.2> is computed
        using RKFR scheme with degree <with|mode|<quote|math>|N = 1> on a
        mesh of 1000 \<times\> 1000 cells.
      </surround>|<pageref|auto-70>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.35>||Error
      convergence test for 2-D Burger's equation with initial condition
      <with|mode|<quote|math>|u*<around|(|x,y,0|)>=<with|mode|<quote|math>|<with|math-display|<quote|true>|<frac|1|4>>>+<with|mode|<quote|math>|<with|math-display|<quote|true>|<frac|1|2>>>*sin<around|(|2*\<pi\>*<around|(|x+y|)>|)>>
      in the domain <with|mode|<quote|math>|<around|[|0,1|]>\<times\><around|[|0,1|]>>
      comparing the two boundary fluxes of LWFR (a) AE, (b) EA. The errors
      are computed at <with|mode|<quote|math>|t=0.1>.>|<pageref|auto-71>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.36>||<with|mode|<quote|math>|L<rsup|2>>
      error and Wall Clock Time (WCT) analysis of 2-D Euler equations
      (isentropic vortex) against grid resolution comparing LW-D1, LW-D2 and
      RK is shown in (a) and (b) respectively. The error is computed after
      one period. The time step size of each scheme is computed using its
      optimal CFL from Fourier stability analysis.>|<pageref|auto-74>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.37>||Wall Clock Time
      (WCT) versus <with|mode|<quote|math>|L<rsup|2>> error for 2-D Euler
      equations (isentropic vortex) comparing LW-D1, LW-D2 and RK for degrees
      <with|mode|<quote|math>|N=1,2,3,4>. The different colors correspond to
      different degrees, with the degree increasing from right to left. The
      error is computed after one period. The time step size of each scheme
      is computed using its optimal CFL number from Fourier stability
      analysis.>|<pageref|auto-75>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.38>||Wall Clock Time
      (WCT) ratios versus grid resolution for 2-D Euler equations (isentropic
      vortex). (a) WCT ratio of LW-D1 and LW-D2, (b) WCT ratio of RK and
      LW-D2. The error is computed after one period. The time step size of
      each scheme is computed using its optimal CFL number from Fourier
      stability analysis.>|<pageref|auto-76>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.39>||Density profile
      of numerical solutions of 2-D Euler equations (double Mach reflection
      problem) at <with|mode|<quote|math>|t=0.2> for
      <with|mode|<quote|math>|N=2>, with <with|mode|<quote|math>|\<Delta\>*x=\<Delta\>*y=1/240>.
      Contours of 30 steps from 1.4 to 22.5 are printed.>|<pageref|auto-78>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.40>||Wall Clock Time
      (WCT) ratios versus grid resolution for 2-D Euler equations (isentropic
      vortex). (a) WCT ratio of LW-D1 and LW-D2, (b) WCT ratio of RK and
      LW-D2. The error is computed after one period. The time step size of
      each scheme is computed using its optimal CFL number from Fourier
      stability analysis.>|<pageref|auto-79>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.41>||<with|mode|<quote|math>|L<rsup|2>>
      error and Wall Clock Time (WCT) analysis of 2-D Euler equations
      (isentropic vortex) against grid resolution comparing LW-D1, LW-D2 and
      RK is shown in (a) and (b) respectively. The error is computed after
      one period. The time step size of each scheme is computed using its
      optimal CFL from Fourier stability analysis.>|<pageref|auto-80>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|B.1>||Stability regions
      of LWFR scheme with the Radau correction function and D2 dissipation
      model in two dimensions. (a) <with|mode|<quote|math>|N=1>, (b)
      <with|mode|<quote|math>|N=2>, (c) <with|mode|<quote|math>|N=3>, (d)
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-89>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|B.2>||Stability regions
      of LWFR scheme with the Radau correction function and D2 dissipation
      model in two dimensions. (a) <with|mode|<quote|math>|N=1>, (b)
      <with|mode|<quote|math>|N=2>, (c) <with|mode|<quote|math>|N=3>, (d)
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-90>>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|3.1>||CFL numbers for
      1-D LWFR using the two dissipation models and correction
      functions>|<pageref|auto-15>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|B.1>||Two dimensional
      CFL condition defined in equation <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:2dcfldom>)
      for LWFR method with the dissipation model D2 and two correction
      functions>|<pageref|auto-91>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|3.<space|2spc>Lax-Wendroff
      Flux Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      3.1.<space|2spc>Lax-Wendroff FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <with|par-left|<quote|1tab>|3.1.1.<space|2spc>Conservation property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|3.1.2.<space|2spc>Reconstruction of the
      time average flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.1.3.<space|2spc>Direct flux
      reconstruction (DFR) scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|3.1.4.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|3.1.4.1.<space|2spc>Second order scheme,
      <with|mode|<quote|math>|N=1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|3.1.4.2.<space|2spc>Third order scheme,
      <with|mode|<quote|math>|N=2> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|3.1.4.3.<space|2spc>Fourth order scheme,
      <with|mode|<quote|math>|N=3> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|3.1.4.4.<space|2spc>Fifth order scheme,
      <with|mode|<quote|math>|N=4> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      3.2.<space|2spc>Numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      <with|par-left|<quote|1tab>|3.2.1.<space|2spc>Numerical flux \U average
      and extrapolate to face (AE) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|3.2.2.<space|2spc>Numerical flux \U
      extrapolate to face and average (EA)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      3.3.<space|2spc>Fourier stability analysis in 1-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      3.4.<space|2spc>TVD limiter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      3.5.<space|2spc>Numerical results in 1-D: scalar problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      <with|par-left|<quote|1tab>|3.5.1.<space|2spc>Linear advection
      equation: constant speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|2tab>|3.5.1.1.<space|2spc>Smooth solutions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|2tab>|3.5.1.2.<space|2spc>Non-smooth solutions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|3.5.2.<space|2spc>Linear advection
      equation: variable speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|1tab>|3.5.3.<space|2spc>Inviscid Burgers'
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|1tab>|3.5.4.<space|2spc>Non-convex problem:
      Buckley-Leverett equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      3.6.<space|2spc>Numerical results in 1-D: Euler equations
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      <with|par-left|<quote|1tab>|3.6.1.<space|2spc>Smooth solution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>>

      <with|par-left|<quote|1tab>|3.6.2.<space|2spc>Sod's shock tube problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>>

      <with|par-left|<quote|1tab>|3.6.3.<space|2spc>Lax problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>>

      <with|par-left|<quote|1tab>|3.6.4.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>>

      <with|par-left|<quote|1tab>|3.6.5.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      <with|par-left|<quote|1tab>|3.6.6.<space|2spc>Numerical fluxes: LF,
      Roe, HLL and HLLC <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>>

      <with|par-left|<quote|1tab>|3.6.7.<space|2spc>Comparison of correction
      functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>

      3.7.<space|2spc>Two dimensional scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>

      3.8.<space|2spc>Numerical results in 2D: scalar problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62>

      <with|par-left|<quote|1tab>|3.8.1.<space|2spc>Advection of a smooth
      signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63>>

      <with|par-left|<quote|1tab>|3.8.2.<space|2spc>Rotation of a composite
      signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-65>>

      <with|par-left|<quote|1tab>|3.8.3.<space|2spc>Inviscid Burgers'
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-69>>

      3.9.<space|2spc>Numerical results in 2-D: Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-72>

      <with|par-left|<quote|1tab>|3.9.1.<space|2spc>Isentropic vortex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-73>>

      <with|par-left|<quote|1tab>|3.9.2.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-77>>

      3.10.<space|2spc>Summary and conclusions
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-81>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      A.<space|2spc>Numerical flux> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-82><vspace|0.5fn>

      A.1.<space|2spc>Some numerical fluxes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-83>

      <with|par-left|<quote|1tab>|A.1.1.<space|2spc>Rusanov flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-84>>

      <with|par-left|<quote|1tab>|A.1.2.<space|2spc>Roe flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-85>>

      <with|par-left|<quote|1tab>|A.1.3.<space|2spc>HLL flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-86>>

      <with|par-left|<quote|1tab>|A.1.4.<space|2spc>HLLC flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-87>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      B.<space|2spc>Fourier stability analysis in 2-D>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-88><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      C.<space|2spc>equivalence with direct flux reconstruction (DFR)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-92><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>