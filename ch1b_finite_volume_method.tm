<TeXmacs|2.1>

<project|main.tm>

<style|<tuple|tmbook|style_common>>

<\body>
  <chapter|Finite volume method, Discontinuous Galerkin and Flux
  Reconstruction><label|ch:fvm.dg>

  Plan for this chapter

  1. Finite volume method including MUSCL, MUSCL-Hancock

  2. Discontinuous Galerkin and Flux Reconstruction for 1-D

  <section|Scalar conservation law><label|sec:scl>

  Let us consider a scalar conservation law of the form

  <\equation*>
    u<rsub|t>+f<around|(|u|)><rsub|x>=0
  </equation*>

  where <math|u> is some conserved quantity, <math|f<around|(|u|)>> is the
  corresponding flux, together with some initial and boundary conditions. We
  will divide the computational domain <math|\<Omega\>> into disjoint
  elements <math|\<Omega\><rsub|e>>, with

  <\equation*>
    \<Omega\><rsub|e>=<around|[|x<rsub|<emh>>,x<rsub|<eph>>|]><space|2em><math-up|and><space|2em>\<Delta\>x<rsub|e>=x<rsub|<eph>>-x<rsub|<emh>>
  </equation*>

  Let us map each element to a reference element,
  <math|\<Omega\><rsub|e>\<to\><around|[|0,1|]>>, by

  <\equation*>
    x\<to\>\<xi\>=<frac|x-x<rsub|<emh>>|\<Delta\>*x<rsub|e>>
  </equation*>

  Inside each element, we approximate the solution by degree <math|N\<ge\>0>
  polynomials belonging to the set <math|<poly><rsub|N>>. For this, choose
  <math|N+1> distinct nodes

  <\equation*>
    0\<le\>\<xi\><rsub|0>\<less\>\<xi\><rsub|1>\<less\>\<cdots\>\<less\>\<xi\><rsub|N>\<le\>1
  </equation*>

  which will be taken to be Gauss-Legendre (GL) or Gauss-Lobatto-Legendre
  (GLL) nodes, and will also be referred to as
  <with|font-shape|italic|solution points>. There are associated quadrature
  weights <math|w<rsub|j>> such that the quadrature rule is exact for
  polynomials of degree up to <math|2*N+1> for GL points and upto degree
  <math|2*N-1> for GLL points. Note that the nodes and weights we use are
  with respect to the interval <math|<around|[|0,1|]>> whereas they are
  usually defined for the interval <math|<around|[|-1,+1|]>>. The solution
  inside an element is given by

  <\equation*>
    x\<in\>\<Omega\><rsub|e>:<space|2em>u<rsub|h>*<around|(|\<xi\>,t|)>=<big|sum><rsub|j=0><rsup|N>u<rsub|j><rsup|e><around|(|t|)>*\<ell\><rsub|j><around|(|\<xi\>|)>
  </equation*>

  where each <math|\<ell\><rsub|j>> is a Lagrange polynomial of degree
  <math|N> given by

  <\equation*>
    \<ell\><rsub|j><around|(|\<xi\>|)>=<big|prod><rsub|i=0,i\<ne\>j><rsup|N><frac|\<xi\>-\<xi\><rsub|i>|\<xi\><rsub|j>-\<xi\><rsub|i>>\<in\><poly><rsub|N>,<space|2em>\<ell\><rsub|j><around|(|\<xi\><rsub|i>|)>=\<delta\><rsub|i*j>
  </equation*>

  Figure<nbsp>(<reference|fig:solflux1>a) illustrates a piecewise polynomial
  solution at some time <math|t<rsub|n>> with discontinuities at the element
  boundaries. Note that the coefficients <math|u<rsub|j><rsup|e>> which are
  the basic unknowns or <with|font-shape|italic|degrees of freedom> (dof),
  are the solution values at the solution points.

  <\big-figure>
    <padded-center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|illustrations/sol|0.40par|||>>|<cell|<image|illustrations/flux.pdf|0.40par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>>

    <label|fig:solflux1>
  </big-figure|(a) Piecewise polynomial solution at time <math|t<rsub|n>>,
  and (b) discontinuous and continuous flux.>

  The numerical method will require spatial derivatives of certain
  quantities. We can compute the spatial derivatives on the reference
  interval using a differentiation matrix
  <math|<vD>=<around|[|D<rsub|i*j>|]>> whose entries are given by

  <\equation*>
    D<rsub|i*j>=\<ell\><rsub|j><rprime|'><around|(|\<xi\><rsub|i>|)>,<space|2em>0\<le\>i,j\<le\>N
  </equation*>

  For example, we can obtain the spatial derivatives of the solution
  <math|u<rsub|h>> at all the solution points by a matrix-vector product as
  follows

  <\equation*>
    <around*|[|<tabular*|<tformat|<table|<row|<cell|\<partial\><rsub|x>*u<rsub|h>*<around|(|\<xi\><rsub|0>,t|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<partial\><rsub|x>*u<rsub|h>*<around|(|\<xi\><rsub|N>,t|)>>>>>>|]>=<frac|1|\<Delta\>*x<rsub|e>><vD><vu><around|(|t|)>,<space|2em><vu>=<around*|[|<tabular*|<tformat|<table|<row|<cell|u<rsub|0><rsup|e>>>|<row|<cell|\<vdots\>>>|<row|<cell|u<rsub|N><rsup|e>>>>>>|]>
  </equation*>

  We will use symbols in sans serif font like <math|<vD>,<vu>>, etc. to
  denote matrices or vectors defined with respect to the solution points. The
  entries of the differentiation matrix are given by

  <\equation*>
    D<rsub|i*j>=<frac|W<rsub|j>|W<rsub|i>>*<frac|1|<around|(|\<xi\><rsub|i>-\<xi\><rsub|j>|)>>,<space|2em>i\<ne\>j<space|2em><math-up|and><space|2em>D<rsub|i*i>=-<big|sum><rsub|j=0,j\<ne\>i><rsup|N>D<rsub|i*j>
  </equation*>

  where the <math|W<rsub|i>> are barycentric weights given by

  <\equation*>
    W<rsub|i>=<frac|1|<big|prod><rsub|j=0,j\<ne\>i><rsup|N><around|(|\<xi\><rsub|i>-\<xi\><rsub|j>|)>>,<space|2em>0\<le\>i\<le\>N
  </equation*>

  Define the Vandermonde matrices corresponding to the left and right
  boundaries of a cell by

  <\equation>
    <vV><rsub|L>=<around|[|\<ell\><rsub|0><around|(|0|)>,\<ell\><rsub|1><around|(|0|)>,\<ldots\>,\<ell\><rsub|N><around|(|0|)>|]><rsup|\<top\>>,<space|2em><vV><rsub|R>=<around|[|\<ell\><rsub|0><around|(|1|)>,\<ell\><rsub|1><around|(|1|)>,\<ldots\>,\<ell\><rsub|N><around|(|1|)>|]><rsup|\<top\>><label|eq:VlVr>
  </equation>

  which is used to extrapolate the solution and/or flux to the cell faces for
  the computation of inter-cell fluxes.

  <section|Runge-Kutta FR><label|sec:rk>

  The RKFR scheme is based on a FR spatial discretization leading to a system
  of ODE followed by application of an RK scheme to march forward in time.
  The key idea is to construct a continuous polynomial approximation of the
  flux which is then used in a collocation scheme to update the nodal
  solution values. At some time <math|t>, we have the piecewise polynomial
  solution defined inside each cell; the FR scheme can be described by the
  following steps.

  Step 1. In each element, we construct the flux approximation by
  interpolating the flux at the solution points leading to a polynomial of
  degree <math|N>, given by

  <\equation*>
    f<rsub|h><rsup|\<delta\>><around|(|\<xi\>,t|)>=<big|sum><rsub|j=0><rsup|N>f<around|(|u<rsub|j><rsup|e><around|(|t|)>|)>*\<ell\><rsub|j><around|(|\<xi\>|)>
  </equation*>

  The above flux is in general discontinuous across the elements similar to
  the red curve in Figure<nbsp>(<reference|fig:solflux1>b).

  Step 2. We build a continuous flux approximation by adding some correction
  terms at the element boundaries

  <\equation*>
    f<rsub|h><around|(|\<xi\>,t|)>=<around*|[|f<rsub|<emh>><around|(|t|)>-f<rsub|h><rsup|\<delta\>><around|(|0,t|)>|]>*g<rsub|L><around|(|\<xi\>|)>+f<rsub|h><rsup|\<delta\>><around|(|\<xi\>,t|)>+<around*|[|f<rsub|<eph>><around|(|t|)>-f<rsub|h><rsup|\<delta\>><around|(|1,t|)>|]>*g<rsub|R><around|(|\<xi\>|)>
  </equation*>

  where

  <\equation*>
    f<rsub|<eph>><around|(|t|)>=f<around|(|u<rsub|h>*<around|(|x<rsub|<eph>><rsup|->,t|)>,u<rsub|h>*<around|(|x<rsub|<eph>><rsup|+>,t|)>|)>
  </equation*>

  is a numerical flux function that makes the flux unique across the cells.
  The continuous flux approximation is illustrated by the black curve in
  Figure<nbsp>(<reference|fig:solflux1>b). The functions
  <math|g<rsub|L>,g<rsub|R>> are the correction functions which must be
  chosen to obtain a stable scheme.

  Step 3. We obtain the system of ODE by collocating the PDE at the solution
  points

  <\equation*>
    <od|u<rsub|j><rsup|e>|t><around|(|t|)>=-<frac|1|\<Delta\>*x<rsub|e>><pd|f<rsub|h>|\<xi\>><around|(|\<xi\><rsub|j>,t|)>,<space|2em>0\<le\>j\<le\>N
  </equation*>

  which is solved in time by a Runge-Kutta scheme.

  <paragraph|Correction functions.>The correction functions
  <math|g<rsub|L>,g<rsub|R>> should satisfy the end point conditions

  <\align*>
    <tformat|<table|<row|<cell|g<rsub|L><around|(|0|)>=1,<space|2em>>|<cell|g<rsub|R><around|(|0|)>=0>>|<row|<cell|g<rsub|L><around|(|1|)>=0,<space|2em>>|<cell|g<rsub|R><around|(|1|)>=1>>>>
  </align*>

  which ensures the continuity of the flux, i.e.,
  <math|f<rsub|h><around|(|x<rsub|<eph>><rsup|->,t|)>=f<rsub|h><around|(|x<rsub|<eph>><rsup|+>,t|)>=f<rsub|<eph>><around|(|t|)>>.
  Moreover, we want them to be close to zero inside the element. There is a
  wide family of correction functions available in the
  literature<nbsp><cite|Huynh2007|Vincent2011a>. A family of correction
  functions depending on a parameter <math|c> were developed
  in<nbsp><cite|Vincent2011a> based on stability in a Sobolev-type norm. Two
  of these functions, the Radau and g2 correction functions, are of major
  interest since they correspond to commonly used DG formulations. The Radau
  correction function is a polynomial of degree <math|N+1> which belongs to
  the family of<nbsp><cite|Vincent2011a> corresponding to the parameter
  <math|c=0> and given by

  <\equation*>
    g<rsub|L><around|(|\<xi\>|)>=<frac|<around|(|-1|)><rsup|N>|2>*<around|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>-L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|]>,<space|2em>g<rsub|R><around|(|\<xi\>|)>=<frac|1|2>*<around|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>+L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|]>
  </equation*>

  where <math|L<rsub|N>:<around|[|-1,1|]>\<to\><re>> is the Legendre
  polynomial of degree <math|N>. The resulting RKFR scheme can be shown to be
  identical to the nodal RKDG scheme using Gauss-Legendre nodes for solution
  points and quadrature. In the general class of<nbsp><cite|Vincent2011a>,
  <math|g<rsub|2>> correction function of degree <math|N+1> corresponds to
  <math|c=<frac|2*<around|(|N+1|)>|<around|(|2*N+1|)>*N*<around|(|a<rsub|N>*N!|)><rsup|2>>>
  where <math|a<rsub|N>> is the leading coefficient of <math|L<rsub|N>>; they
  are given by

  <\align*>
    <tformat|<table|<row|<cell|g<rsub|L><around|(|\<xi\>|)>>|<cell|=<frac|<around|(|-1|)><rsup|N>|2>*<around*|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>-<frac|<around|(|N+1|)>*L<rsub|N-1>*<around|(|2*\<xi\>-1|)>+N*L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|2*N+1>|]>>>|<row|<cell|g<rsub|R><around|(|\<xi\>|)>>|<cell|=<frac|1|2>*<around*|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>+<frac|<around|(|N+1|)>*L<rsub|N-1>*<around|(|2*\<xi\>-1|)>+N*L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|2*N+1>|]>>>>>
  </align*>

  The resulting RKFR scheme can be shown to be identical to the nodal RKDG
  scheme using Gauss-Lobatto-Legendre points as solution points and for
  quadrature. We will perform Fourier stability analysis of the Lax-Wendroff
  scheme based on these correction functions in a later section. Note that
  the correction functions are usually defined in the interval
  <math|<around|[|-1,1|]>> but here we have written them for our reference
  interval which is <math|<around|[|0,1|]>>.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|1>
    <associate|info-flag|minimal>
    <associate|page-first|17>
    <associate|page-medium|paper>
    <associate|preamble|false>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|2|17>>
    <associate|auto-2|<tuple|2.1|17>>
    <associate|auto-3|<tuple|2.1|17>>
    <associate|auto-4|<tuple|2.2|18>>
    <associate|ch:fvm.dg|<tuple|2|17>>
    <associate|eq:VlVr|<tuple|2.1|18>>
    <associate|fig:solflux1|<tuple|2.1|17>>
    <associate|sec:rk|<tuple|2.2|18>>
    <associate|sec:scl|<tuple|2.1|17>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Huynh2007

      Vincent2011a

      Vincent2011a

      Vincent2011a

      Vincent2011a
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|2.1>||(a) Piecewise
      polynomial solution at time <with|mode|<quote|math>|t<rsub|n>>, and (b)
      discontinuous and continuous flux.>|<pageref|auto-3>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|2.<space|2spc>Finite
      volume method, Discontinuous Galerkin and Flux Reconstruction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      2.1.<space|2spc>Scalar conservation law
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      2.2.<space|2spc>Runge-Kutta FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>
    </associate>
  </collection>
</auxiliary>