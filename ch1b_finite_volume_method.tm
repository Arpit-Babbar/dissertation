<TeXmacs|2.1>

<project|main.tm>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <chapter|Flux Reconstruction><label|ch:fvm.dg>

  In this chapter, we discuss the flux reconstruction scheme and its
  corresponding finite element basis that will be used in the subsequent
  chapters. The same basis is used to describe the discontinuous Galerkin
  method. The finite volume method is also briefly reviewed.

  <section|Conservation law><label|sec:scl>

  Let us consider a conservation law of the form

  <\equation>
    <value|uu><rsub|t>+<value|pf><around|(|<value|uu>|)><rsub|x>=<value|bzero><label|eq:con.law>
  </equation>

  where <math|<value|uu>> is some conserved quantity,
  <math|<value|pf><around|(|<value|uu>|)>> is the corresponding flux,
  together with some initial and boundary conditions. The physically
  correction solution to<nbsp><eqref|eq:con.law> is going to be in the
  admissible set <math|<Uad>><nbsp><eqref|eq:intro.u> whose detailed
  discussion is in Chapter<nbsp><reference|ch:lw.subcell.limiter>. In this
  chapter, we focus on description of the finite element grid and basis.

  We will divide the computational domain <math|\<Omega\>> into disjoint
  elements <math|\<Omega\><rsub|e>>, with

  <\equation*>
    \<Omega\><rsub|e>=<around|[|x<rsub|<emh>>,x<rsub|<eph>>|]><space|2em>and<space|2em>\<Delta\>x<rsub|e>=x<rsub|<eph>>-x<rsub|<emh>>
  </equation*>

  Let us map each element to a reference element,
  <math|\<Omega\><rsub|e>\<to\><around|[|0,1|]>>, by

  <\equation*>
    x\<to\>\<xi\>=<frac|x-x<rsub|<emh>>|\<Delta\>x<rsub|e>>
  </equation*>

  Inside each element, we approximate the solution by degree <math|N\<ge\>0>
  polynomials belonging to the set <math|<poly><rsub|N>>. For this, choose
  <math|N+1> distinct nodes

  <\equation>
    0\<le\>\<xi\><rsub|0>\<less\>\<xi\><rsub|1>\<less\>\<cdots\>\<less\>\<xi\><rsub|N>\<le\>1<label|eq:soln.points>
  </equation>

  which will be taken to be Gauss-Legendre (GL) or Gauss-Lobatto-Legendre
  (GLL) nodes, and will also be referred to as
  <with|font-shape|italic|solution points>. There are associated quadrature
  weights <math|w<rsub|j>> such that the quadrature rule is exact for
  polynomials of degree up to <math|2*N+1> for GL points and upto degree
  <math|2*N-1> for GLL points. Note that the nodes and weights we use are
  with respect to the interval <math|<around|[|0,1|]>> whereas they are
  usually defined for the interval <math|<around|[|-1,+1|]>>. The solution
  inside an element <math|\<Omega\><rsub|e>> is given by

  <\equation>
    x\<in\>\<Omega\><rsub|e>:<space|2em><value|uu><rsub|h><around|(|\<xi\>,t|)>=<big|sum><rsub|p=0><rsup|N><value|uep><around|(|t|)>*\<ell\><rsub|p><around|(|\<xi\>|)><label|eq:num.soln>
  </equation>

  where <math|<around*|{|\<ell\><rsub|p>|}>> are degree <math|N> Lagrange
  polynomials given by

  <\equation>
    \<ell\><rsub|p><around|(|\<xi\>|)>=<big|prod><rsub|q=0,q\<ne\>p><rsup|N><frac|\<xi\>-\<xi\><rsub|q>|\<xi\><rsub|p>-\<xi\><rsub|q>>\<in\><poly><rsub|N>,<space|2em>\<ell\><rsub|p><around|(|\<xi\><rsub|q>|)>=\<delta\><rsub|p\<nocomma\>q>,<space|2em>0\<leq\>p\<leq\>N<label|eq:lag.poly.1d>
  </equation>

  Figure<nbsp>(<reference|fig:solflux1>a) illustrates a piecewise polynomial
  solution at some time <math|t<rsub|n>> with discontinuities at the element
  boundaries. Note that the coefficients <math|<value|uep>> which are the
  basic unknowns or <with|font-shape|italic|degrees of freedom> (dof), are
  the solution values at the solution points.

  <\big-figure>
    <padded-center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|illustrations/sol|0.40par|||>>|<cell|<image|illustrations/flux.pdf|0.40par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>>

    <label|fig:solflux1>
  </big-figure|<caption-detailed|(a) Piecewise polynomial solution at time
  <math|t<rsub|n>>, and (b) discontinuous and continuous flux.|Piecewise
  solutions and flux polynomials>>

  The numerical method will require spatial derivatives of certain
  quantities. We can compute the spatial derivatives on the reference
  interval using a differentiation matrix
  <math|<vD>=<around|[|D<rsub|p\<nocomma\>q>|]>> whose entries are given by

  <\equation>
    D<rsub|p\<nocomma\>q>=\<ell\><rsub|q><rprime|'><around|(|\<xi\><rsub|p>|)>,<space|2em>0\<le\>p,q\<le\>N<label|eq:diff.matrix>
  </equation>

  For example, we can obtain the spatial derivatives of the solution
  <math|<value|uu><rsub|h>> at all the solution points by a matrix-vector
  product as follows

  <\equation*>
    <around*|[|<tabular*|<tformat|<table|<row|<cell|\<partial\><rsub|x>*<value|uu><rsub|h><around|(|\<xi\><rsub|0>,t|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<partial\><rsub|x>*<value|uu><rsub|h><around|(|\<xi\><rsub|N>,t|)>>>>>>|]>=<frac|1|\<Delta\>x<rsub|e>>*<vD><vu><around|(|t|)>,<space|2em><vu>=<around*|[|<tabular*|<tformat|<table|<row|<cell|<value|uez>>>|<row|<cell|\<vdots\>>>|<row|<cell|<value|ueN>>>>>>|]>
  </equation*>

  We will use symbols in sans serif font like <math|<vD>,<vu>>, etc. to
  denote matrices or vectors defined with respect to the solution points. The
  entries of the differentiation matrix are given by

  <\equation*>
    D<rsub|p*q>=<frac|W<rsub|q>|W<rsub|p>>*<frac|1|<around|(|\<xi\><rsub|p>-\<xi\><rsub|q>|)>>,<space|2em>p\<ne\>q<space|2em>and<space|2em>D<rsub|p\<nocomma\>p>=-<big|sum><rsub|q=0,q\<ne\>p><rsup|N>D<rsub|p*q>
  </equation*>

  where the <math|W<rsub|p>> are barycentric weights given by

  <\equation*>
    W<rsub|p>=<frac|1|<big|prod><rsub|q=0,q\<ne\>p><rsup|N><around|(|\<xi\><rsub|p>-\<xi\><rsub|q>|)>>,<space|2em>0\<le\>p\<le\>N
  </equation*>

  Define the Vandermonde matrices corresponding to the left and right
  boundaries of a cell by

  <\equation>
    <vV><rsub|L>=<around|[|\<ell\><rsub|0><around|(|0|)>,\<ell\><rsub|1><around|(|0|)>,\<ldots\>,\<ell\><rsub|N><around|(|0|)>|]><rsup|\<top\>>,<space|2em><vV><rsub|R>=<around|[|\<ell\><rsub|0><around|(|1|)>,\<ell\><rsub|1><around|(|1|)>,\<ldots\>,\<ell\><rsub|N><around|(|1|)>|]><rsup|\<top\>><label|eq:VlVr>
  </equation>

  which is used to extrapolate the solution and/or flux to the cell faces for
  the computation of inter-cell fluxes.

  <section|Finite volume method>

  Define the cell center of an element <math|\<Omega\><rsub|e>=<around|[|x<rsub|<value|emh>>,x<rsub|<value|eph>>|]>>
  as

  <\equation*>
    <value|ax><rsub|e>=<frac|1|2>*<around|(|x<rsub|<value|emh>>+x<rsub|<value|eph>>|)>
  </equation*>

  In a finite volume method, the unknowns to solve for are the
  <with|font-shape|italic|element averages>
  <math|<au><rsub|e><around*|(|t|)>>

  <\equation*>
    <au><rsub|e><around*|(|t|)>\<approx\><frac|1|\<mathLaplace\>x<rsub|e>>*<big|int><rsub|\<Omega\><rsub|e>><value|uu><around*|(|x,t|)>
    <value|ud>x,<space|2em><au><rsub|e><rsup|n>\<assign\><au><rsub|e><around*|(|t<rsup|n>|)>
  </equation*>

  where <math|t<rsup|n>> is the current time level for <math|n\<geq\>0>.
  Integrating the conservation law<nbsp><eqref|eq:con.law> over the element
  <math|\<Omega\><rsub|e>> gives

  <\equation>
    <label|eq:fvm.mol><dv|<au><rsub|e>|t>+<frac|<value|pf><rsub|<value|eph>>-<value|pf><rsub|<value|emh>>|\<mathLaplace\>x<rsub|e>>=<value|bzero>
  </equation>

  where <math|<value|pf><rsub|<value|eph>>\<approx\><value|pf><around|(|<value|uu><around|(|x<rsub|<value|eph>>,t|)>|)>>
  is the <with|font-shape|italic|numerical flux> function which couples
  neighbouring elements. The fundamental case is the one where the numerical
  flux is computed using only the adjacent elements

  <\equation>
    <label|eq:fvm.numflux><value|pf><rsub|<value|eph>>=<value|pf><around*|(|<au><rsub|e>,<au><rsub|e+1>|)>
  </equation>

  In this case, the temporal discretization of<nbsp><eqref|eq:fvm.mol> can be
  performed by the forward Euler method to get a first order accurate method

  <\equation>
    <label|eq:forward.euler><au><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>-<frac|\<mathLaplace\>t<rsup|n>|\<mathLaplace\>x>*<around|(|<value|pf><rsub|<value|eph>>-<value|pf><rsub|<value|emh>>|)>,<space|2em>\<mathLaplace\>t<rsup|n>\<assign\>t<rsup|n+1>-t<rsup|n>
  </equation>

  The choice of numerical flux<nbsp><eqref|eq:fvm.numflux> is typically made
  taking the specific conservation law<nbsp><eqref|eq:con.law> into
  consideration. It is based on solution of a Riemann problem
  (Section<nbsp><reference|sec:riemann.problem>) of the conservation
  law<nbsp><eqref|eq:con.law>

  <\equation*>
    <value|uu><around*|(|x,0|)>=<choice|<tformat|<table|<row|<cell|<value|uu><rsub|l>,>|<cell|<space|2em>>|<cell|x\<leq\>0>>|<row|<cell|<value|uu><rsub|r>,>|<cell|>|<cell|x\<gtr\>0>>>>>
  </equation*>

  To be precise, recalling the self-similarity of solutions of Riemann
  problem, we denote the exact solution of the Riemann problem as as
  <math|<value|uu><around*|(|x/t;<value|uu><rsub|l>,<value|uu><rsub|r>|)>>.
  Then, the <with|font-shape|italic|Godunov's flux>
  for<nbsp><eqref|eq:fvm.numflux> is denoted by

  <\equation*>
    <value|pf><around*|(|<au><rsub|e>,<au><rsub|e+1>|)>=<value|pf><around*|(|<value|uu><around*|(|0;<au><rsub|e>,<au><rsub|e+1>|)>|)>
  </equation*>

  and an approximate Riemann solver is based on

  <\equation*>
    <value|pf><around*|(|<au><rsub|e>,<au><rsub|e+1>|)>=<value|pf><around*|(|<value|uu><rsup|approx><around*|(|0;<au><rsub|e>,<au><rsub|e+1>|)>|)>
  </equation*>

  Some numerical fluxes/approximate Riemann solvers for compressible Euler's
  equations<nbsp><eqref|eq:3deuler> like Roe, HLL and HLLC are discussed in
  Appendix<nbsp><reference|sec:lwfr.numfluxes>. A numerical flux that applies
  for general conservation law is the Lax-Friedrichs flux. For a general
  conservation law with uniform grid size
  <math|\<mathLaplace\>x=\<mathLaplace\>x<rsub|e>> for all <math|e>, the
  <with|font-shape|italic|global> Lax-Friedrichs flux<nbsp><cite|LeVeque1992>
  is given by

  <\equation>
    <label|eq:global.lf><value|pf><rsub|<value|eph>>=<frac|1|2>*<around*|(|<value|pf><around*|(|<au><rsub|e>|)>+<value|pf><around*|(|<au><rsub|e+1>|)>|)>-<frac|\<mathLaplace\>x|2*\<mathLaplace\>t<rsup|n>>*<around*|(|<au><rsub|e+1>-<au><rsub|e>|)>
  </equation>

  In the absence of <math|<au><rsub|e>,<au><rsub|e+1>>, the
  scheme<nbsp><eqref|eq:forward.euler> using<nbsp><eqref|eq:global.lf>
  becomes the Forward Time Central Scheme (FTCS) which is unconditional
  unstable. The terms with <math|<au><rsub|e>,<au><rsub|e+1>> are called the
  dissipation terms as their substitution into<nbsp><eqref|eq:forward.euler>
  gives a central approximation to <math|-\<partial\><rsub|x\<nocomma\>x>*<value|uu>>.
  Following a von Neumann stability analysis, the time step size
  <math|\<mathLaplace\>t<rsup|n>> of the scheme<nbsp>(<reference|eq:forward.euler>,<nbsp><reference|eq:global.lf>)
  is usually computed to satisfy

  <\equation*>
    \<mathLaplace\>t<rsup|n>*max<rsub|e>*<frac|1|\<mathLaplace\>x<rsub|e>>*\<sigma\><around*|(|<value|pf><rprime|'><around*|(|<au><rsub|e>|)>|)>\<leq\>1
  </equation*>

  where <math|\<sigma\><around*|(|A|)>> is the maximum eigenvalue of a matrix
  <math|A> in absolute values. In practice, the time step
  <math|\<mathLaplace\>t<rsup|n>> is taken to be close to the CFL limit and
  thus corresponding to each element <math|e>, we would like to have
  <math|\<mathLaplace\>x<rsub|e>/\<mathLaplace\>t<rsup|n>\<approx\>\<sigma\><around*|(|<value|pf><rprime|'><around*|(|<au><rsub|e>|)>|)>>
  which motivates the <with|font-shape|italic|local Lax-Friedrichs>/Rusanov
  flux<nbsp><cite|Rusanov1962>

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<value|pf><rsub|<value|eph>>=<value|pf><rsup|Rusanov><around*|(|<au><rsub|e>,<au><rsub|e+1>|)>\<assign\><frac|1|2>*<around*|(|<value|pf><around*|(|<au><rsub|e>|)>+<value|pf><around*|(|<au><rsub|e+1>|)>|)>-<value|half>*\<lambda\><rsub|<value|eph>>*<around*|(|<au><rsub|e+1>-<au><rsub|e>|)>>>|<row|<cell|\<lambda\><rsub|<value|eph>>=max<around*|{|\<sigma\><around*|(|<value|pf><rprime|'><around*|(|<au><rsub|e>|)>|)>,\<sigma\><around*|(|<value|pf><rprime|'><around*|(|<au><rsub|e+1>|)>|)>|}>>>>>><label|eq:rusanov.fvm>
  </equation>

  A numerical flux can use more neighbouring elements and get higher order
  accuracy

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<value|pf><rsub|<value|eph>>=<value|pf><around*|(|<au><rsub|e-k>,\<ldots\>,<au><rsub|e-1>,<au><rsub|e>,<au><rsub|e+1>,\<ldots\>,<au><rsub|e+l>|)>>>|<row|<cell|<frac|<value|pf><rsub|<value|eph>>-<value|pf><rsub|<value|emh>>|\<mathLaplace\>x<rsub|e>>\<approx\>O<around*|(|\<mathLaplace\>x<rsub|e><rsup|k+l>|)>>>>>><label|eq:explicit.fvm.scheme>
  </equation>

  The approach where we obtain a semidiscrete scheme by discretizing only in
  space<nbsp><eqref|eq:fvm.mol> is called the <with|font-shape|italic|method
  of lines>. Once a high order flux is chosen as
  in<nbsp><eqref|eq:explicit.fvm.scheme>, in order to get high order accuracy
  in time, a multistage Runge-Kutta method for solving ODEs is used the solve
  the semidiscrete equation<nbsp><eqref|eq:fvm.mol>. There are many ways in
  which high order accuracy in space can be obtained. For second order
  accuracy, a MUSCL scheme<nbsp><cite|Colella1990> can be used that is based
  on performing linear reconstructions of the solution. For higher order
  accuracy, piecewise parabolic<nbsp><cite|Colella1984>,
  ENO<nbsp><cite|Harten1987> and WENO<nbsp><cite|Shu1989> schemes can be
  used. While maintaining accuracy, the finite volume methods need to be
  chosen to preserve the admissibility set
  <math|<Uad>><nbsp><eqref|eq:intro.u> of the conservation
  law<nbsp><eqref|eq:con.law> and thus we define admissibility preserving
  finite volume schemes as follows.

  <\definition>
    <label|defn:admissible.fvm>The finite volume method with
    flux<nbsp><eqref|eq:explicit.fvm.scheme> is said to be admissibility
    preserving if <math|<au><rsub|e-k-1><rsup|n>,<au><rsub|e-k><rsup|n>,\<ldots\>,<au><rsub|e-1><rsup|n>,<au><rsub|e><rsup|n>,<au><rsub|e+1><rsup|n>,\<ldots\>,<au><rsub|e+l><rsup|n>\<in\><Uad>>
    implies

    <\equation>
      <label|eq:fvm.admissibility><au><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>-<frac|\<mathLaplace\>t<rsup|n>|\<mathLaplace\>x>*<around|(|<value|pf><rsub|<value|eph>>-<value|pf><rsub|<value|emh>>|)>\<in\><Uad>
    </equation>

    Thus, if solution at current time level is admissible at all points in
    the stencil, its evolution under forward Euler
    method<nbsp><eqref|eq:forward.euler> will also be admissible.
  </definition>

  A finite volume scheme using an admissibility preserving finite volume flux
  will preserve admissibility of solutions if the system of
  ODE<nbsp><eqref|eq:fvm.mol> is solved with a <with|font-shape|italic|strong
  stability preserving Runge-Kutta (SSPRK)
  method><nbsp><cite|Shu1988|Shu1989>. This is because SSPRK methods are
  convex combinations of forward euler methods in each
  stage<nbsp><cite|Zhang2010b>.

  <section|Runge-Kutta DG>

  This section introduces the Discontinuous Galerkin (DG) method with
  Runge-Kutta discretization in time. We multiply the conservation
  law<nbsp><eqref|eq:con.law> by a test function
  <math|v\<in\><value|polyP><rsub|N>> and integrate over element
  <math|\<Omega\><rsub|e>>

  <\equation*>
    <big|int><rsub|\<Omega\><rsub|e>><around*|(|<pdv|<value|uu>|t>+<pdv|<value|pf>|x>|)>*v
    <value|ud>x=<value|bzero>
  </equation*>

  An integration by parts is performed on the flux derivative term to get

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Omega\><rsub|e>><pdv|<value|uu>|t>*v
    <value|ud>x-<big|int><rsub|\<Omega\><rsub|e>><value|pf><around*|(|<value|uu>|)>
    <pdv|v|x>*<value|ud>x>>|<row|<cell|<space|5em>+<value|pf><around|(|x<rsub|e+<frac|1|2>>,t|)>*v<around|(|x<rsub|e+<frac|1|2>><rsup|->|)>-<value|pf><around|(|x<rsub|<value|emh>>,t|)>*v<around|(|x<rsub|<value|emh>><rsup|+>|)>=<value|bzero>>>>>>
  </equation*>

  We now replace <math|<value|uu>> with the numerical approximation
  <math|<value|uu><rsub|h>><nbsp><eqref|eq:num.soln>. At
  <math|x=x<rsub|e+<frac|1|2>>>, <math|<value|uu><rsub|h>> may be
  discontinuous, i.e.,

  <\equation*>
    <value|uu><rsub|h><around|(|x<rsub|e+<frac|1|2>><rsup|->,t|)>\<neq\><value|uu><rsub|h><around|(|x<rsub|e+<frac|1|2>><rsup|+>,t|)>
  </equation*>

  Following the finite volume method, we will approximate the flux by a
  <with|font-shape|italic|numerical flux function><nbsp><eqref|eq:fvm.numflux>
  denoted as

  <\equation*>
    <value|pf><rsub|e+<frac|1|2>><around*|(|t|)>=<value|pf><around|(|<value|uu><rsub|h><around|(|x<rsub|e+<frac|1|2>><rsup|->,t|)>,<value|uu><rsub|h><around|(|x<rsub|e+<frac|1|2>><rsup|+>,t|)>|)>
  </equation*>

  For example, the numerical flux can be taken to be
  <math|<value|pf><rsub|e+<frac|1|2>><around*|(|t|)>=<value|pf><rsup|Rusanov><around|(|<value|uu><rsub|h><around|(|x<rsub|e+<frac|1|2>><rsup|->,t|)>,<value|uu><rsub|h><around|(|x<rsub|e+<frac|1|2>><rsup|+>,t|)>|)>><nbsp><eqref|eq:rusanov.fvm>.
  Thus, the semi-discrete DG scheme is given by

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<space|1.8spc><big|int><rsub|\<Omega\><rsub|e>><pdv|<value|uu><rsub|h>|t>*v
    <with|font-shape|right|<value|ud>>x-<big|int><rsub|\<Omega\><rsub|e>><value|pf><around*|(|<value|uu><rsub|h>|)>
    <pdv|v|x> <with|font-shape|right|<value|ud>>x>>|<row|<cell|<space|6em>+<value|pf><rsub|e+<frac|1|2>><around*|(|t|)>*v<around|(|x<rsub|e+<frac|1|2>><rsup|->|)>-<value|pf><rsub|<value|emh>>*v<around|(|x<rsub|<value|emh>><rsup|+>|)>=<value|bzero>>>>>><label|eq:semidiscrete.dg>
  </equation>

  The scheme<nbsp><eqref|eq:semidiscrete.dg> is implemented by performing
  quadrature in space. It is explicit in the sense that the quadrature in
  temporal derivative term will only require a <with|font-shape|italic|local
  mass matrix> to be inverted. If degree <math|N> quadrature with
  Gauss-Legendre points is performed, the integral on temporal derivative can
  be computed exactly. The integral on the flux term cannot be performed
  exactly because the flux <math|<value|pf>> is usually nonlinear. We define
  a <with|font-shape|italic|discontinuous flux approximation> taking flux
  values at solution points giving a degree <math|N> polynomial represented
  in Lagrange basis<nbsp><eqref|eq:lag.poly.1d> as

  <\equation>
    <value|pf><rsub|h><rsup|\<delta\>><around|(|\<xi\>,t|)>=<big|sum><rsub|p=0><rsup|N><value|pf><around|(|<value|uep><around|(|t|)>|)>*\<ell\><rsub|p><around|(|\<xi\>|)><label|eq:dg.discontinuous.flux>
  </equation>

  If quadrature is performed at the solution points, the
  equation<nbsp><eqref|eq:semidiscrete.dg> is equivalent to

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<space|1.8spc><big|int><rsub|\<Omega\><rsub|e>><pdv|<value|uu><rsub|h>|t>*v
    <with|font-shape|right|<value|ud>>x-<big|int><rsub|\<Omega\><rsub|e>><value|pf><rsub|h><rsup|\<delta\>>
    <pdv|v|x> <with|font-shape|right|<value|ud>>x>>|<row|<cell|<space|6em>+<value|pf><rsub|e+<frac|1|2>><around*|(|t|)>*v<around|(|x<rsub|e+<frac|1|2>><rsup|->|)>-<value|pf><rsub|<value|emh>>*v<around|(|x<rsub|<value|emh>><rsup|+>|)>=<value|bzero>>>>>>
  </equation*>

  Since we use Gauss-Legendre (GL) solution points or Gauss-Lobatto-Legendre
  (GLL), the integral on flux derivative is exact. Thus, we can perform an
  integration by parts in space to get the <with|font-shape|italic|strong
  form DG>

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<space|1.8spc><big|int><rsub|\<Omega\><rsub|e>><pdv|<value|uu><rsub|h>|t>*v
    <with|font-shape|right|<value|ud>>x+<big|int><rsub|\<Omega\><rsub|e>><dv|<value|pf><rsub|h><rsup|\<delta\>>|x>
    v <with|font-shape|right|<value|ud>>x>>|<row|<cell|<space|6em>+<around|(|<value|pf><rsub|e+<frac|1|2>><around*|(|t|)>-<value|pf><rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|->|)>|)>*v<around|(|x<rsub|e+<frac|1|2>><rsup|->|)>-<around|(|<value|pf><rsub|<value|emh>>-<value|pf><rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|emh>><rsup|+>|)>|)>*v<around|(|x<rsub|<value|emh>><rsup|+>|)>=<value|bzero>>>>>><label|eq:strong.form.dg.1d>
  </equation>

  The scheme<nbsp><eqref|eq:strong.form.dg.1d> is equivalent to the Flux
  Reconstruction (FR) scheme (Section<nbsp><reference|sec:rk>) when GL/GLL
  points are used as solution and quadrature points. The proof is detailed in
  Appendix<nbsp><reference|app:equiv.dg.fr>, but the crucial ideal is to take
  the test function to be <math|v=\<ell\><rsub|p>><nbsp><eqref|eq:lag.poly.1d>
  and use the identities<nbsp><eqref|eq:dg.is.fr.corr>.

  <section|Runge-Kutta FR><label|sec:rk>

  The Runge-Kutta Flux Reconstruction (RKFR) scheme is based on a FR spatial
  discretization leading to a system of ODE followed by application of an RK
  scheme to march forward in time. The key idea is to construct a continuous
  polynomial approximation of the flux which is then used in a collocation
  scheme to update the nodal solution values. At some time <math|t>, we have
  the piecewise polynomial solution defined inside each cell; the FR scheme
  can be described by the following steps.

  Step 1. In each element, we construct the flux approximation by
  interpolating the flux at the solution points leading to a polynomial of
  degree <math|N>, given by<nbsp><eqref|eq:dg.discontinuous.flux>. The
  flux<nbsp><eqref|eq:dg.discontinuous.flux> is in general discontinuous
  across the elements similar to the red curve in
  Figure<nbsp><reference|fig:solflux1>b.

  Step 2. We build a continuous flux approximation by adding some correction
  terms at the element boundaries

  <\equation*>
    <value|pf><rsub|h><around|(|\<xi\>,t|)>=<around*|[|<value|pf><rsub|<emh>><around|(|t|)>-<value|pf><rsub|h><rsup|\<delta\>><around|(|0,t|)>|]>*g<rsub|L><around|(|\<xi\>|)>+<value|pf><rsub|h><rsup|\<delta\>><around|(|\<xi\>,t|)>+<around*|[|<value|pf><rsub|<eph>><around|(|t|)>-<value|pf><rsub|h><rsup|\<delta\>><around|(|1,t|)>|]>*g<rsub|R><around|(|\<xi\>|)>
  </equation*>

  where

  <\equation*>
    <value|pf><rsub|<eph>><around|(|t|)>=<value|pf><around|(|<value|uu><rsub|h>*<around|(|x<rsub|<eph>><rsup|->,t|)>,<value|uu><rsub|h>*<around|(|x<rsub|<eph>><rsup|+>,t|)>|)>
  </equation*>

  is a numerical flux function that makes the flux unique across the cells.
  The continuous flux approximation is illustrated by the black curve in
  Figure<nbsp>(<reference|fig:solflux1>b). The functions
  <math|g<rsub|L>,g<rsub|R>> are the correction functions which must be
  chosen to obtain a stable scheme.

  Step 3. We obtain the system of ODE by collocating the PDE at the solution
  points

  <\equation*>
    <od|<value|uep>|t><around|(|t|)>=-<frac|1|\<Delta\>x<rsub|e>>*<pd|<value|pf><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>,t|)>,<space|2em>0\<le\>p\<le\>N
  </equation*>

  which is solved in time by a Runge-Kutta scheme.

  <paragraph|Correction functions.>The correction functions
  <math|g<rsub|L>,g<rsub|R>> should satisfy the end point conditions

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|g<rsub|L><around|(|0|)>=1,<space|2em>>|<cell|g<rsub|R><around|(|0|)>=0>>|<row|<cell|g<rsub|L><around|(|1|)>=0,<space|2em>>|<cell|g<rsub|R><around|(|1|)>=1>>>>><label|eq:fvm.fr.corr.functions>
  </equation>

  which ensures the continuity of the flux, i.e.,
  <math|<value|pf><rsub|h><around|(|x<rsub|<eph>><rsup|->,t|)>=<value|pf><rsub|h><around|(|x<rsub|<eph>><rsup|+>,t|)>=<value|pf><rsub|<eph>><around|(|t|)>>.
  Moreover, we want them to be close to zero inside the element. There is a
  wide family of correction functions available in the
  literature<nbsp><cite|Huynh2007|Vincent2011a>. A family of correction
  functions depending on a parameter <math|c> were developed
  in<nbsp><cite|Vincent2011a> based on stability in a Sobolev-type norm. Two
  of these functions, the Radau and <math|g<rsub|2>> correction functions,
  are of major interest since they correspond to commonly used DG
  formulations. The Radau correction function is a polynomial of degree
  <math|N+1> which belongs to the family of<nbsp><cite|Vincent2011a>
  corresponding to the parameter <math|c=0> and given by

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|g<rsub|L><around|(|\<xi\>|)>>|<cell|=>|<cell|<frac|<around|(|-1|)><rsup|N>|2>*<around|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>-L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|]>>>|<row|<cell|g<rsub|R><around|(|\<xi\>|)>>|<cell|=>|<cell|<frac|1|2>*<around|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>+L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|]>>>>>><label|eq:gradau>
  </equation>

  where <math|L<rsub|N>:<around|[|-1,1|]>\<to\><re>> is the Legendre
  polynomial of degree <math|N>. The resulting RKFR scheme can be shown to be
  identical to the nodal RKDG scheme using Gauss-Legendre nodes for solution
  points and quadrature. In the general class of<nbsp><cite|Vincent2011a>,
  <math|g<rsub|2>> correction function of degree <math|N+1> corresponds to
  <math|c=<frac|2*<around|(|N+1|)>|<around|(|2*N+1|)>*N*<around|(|a<rsub|N>*N!|)><rsup|2>>>
  where <math|a<rsub|N>> is the leading coefficient of <math|L<rsub|N>>; they
  are given by

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|g<rsub|L><around|(|\<xi\>|)>>|<cell|=>|<cell|<frac|<around|(|-1|)><rsup|N>|2>*<around*|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>-<frac|<around|(|N+1|)>*L<rsub|N-1>*<around|(|2*\<xi\>-1|)>+N*L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|2*N+1>|]>>>|<row|<cell|g<rsub|R><around|(|\<xi\>|)>>|<cell|=>|<cell|<value|half>*<around*|[|L<rsub|N>*<around|(|2*\<xi\>-1|)>+<frac|<around|(|N+1|)>*L<rsub|N-1>*<around|(|2*\<xi\>-1|)>+N*L<rsub|N+1>*<around|(|2*\<xi\>-1|)>|2*N+1>|]>>>>>><label|eq:g2>
  </equation>

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
    <associate|chapter-nr|2>
    <associate|font-base-size|12>
    <associate|info-flag|minimal>
    <associate|page-even|1in>
    <associate|page-first|37>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-sep|0.2fn>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|section-nr|3>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|3|37>>
    <associate|auto-2|<tuple|3.1|37>>
    <associate|auto-3|<tuple|3.1|38>>
    <associate|auto-4|<tuple|3.2|39>>
    <associate|auto-5|<tuple|3.3|41>>
    <associate|auto-6|<tuple|3.4|42>>
    <associate|ch:fvm.dg|<tuple|3|37>>
    <associate|defn:admissible.fvm|<tuple|3.1|40>>
    <associate|eq:VlVr|<tuple|3.6|38>>
    <associate|eq:con.law|<tuple|3.1|37>>
    <associate|eq:dg.discontinuous.flux|<tuple|3.15|41>>
    <associate|eq:diff.matrix|<tuple|3.5|38>>
    <associate|eq:explicit.fvm.scheme|<tuple|3.12|40>>
    <associate|eq:forward.euler|<tuple|3.9|39>>
    <associate|eq:fvm.admissibility|<tuple|3.13|40>>
    <associate|eq:fvm.fr.corr.functions|<tuple|3.17|42>>
    <associate|eq:fvm.mol|<tuple|3.7|39>>
    <associate|eq:fvm.numflux|<tuple|3.8|39>>
    <associate|eq:g2|<tuple|3.19|43>>
    <associate|eq:global.lf|<tuple|3.10|39>>
    <associate|eq:gradau|<tuple|3.18|43>>
    <associate|eq:lag.poly.1d|<tuple|3.4|37>>
    <associate|eq:num.soln|<tuple|3.3|37>>
    <associate|eq:rusanov.fvm|<tuple|3.11|40>>
    <associate|eq:semidiscrete.dg|<tuple|3.14|41>>
    <associate|eq:soln.points|<tuple|3.2|37>>
    <associate|eq:strong.form.dg.1d|<tuple|3.16|42>>
    <associate|fig:solflux1|<tuple|3.1|38>>
    <associate|sec:rk|<tuple|3.4|42>>
    <associate|sec:scl|<tuple|3.1|37>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      LeVeque1992

      Rusanov1962

      Colella1990

      Colella1984

      Harten1987

      Shu1989

      Shu1988

      Shu1989

      Zhang2010b

      Huynh2007

      Vincent2011a

      Vincent2011a

      Vincent2011a

      Vincent2011a
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|3.1>|>
        Piecewise solutions and flux polynomials
      </surround>|<pageref|auto-3>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|3.<space|2spc>Flux
      Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      3.1.<space|2spc>Conservation law <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      3.2.<space|2spc>Finite volume method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      3.3.<space|2spc>Runge-Kutta DG <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      3.4.<space|2spc>Runge-Kutta FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>
    </associate>
  </collection>
</auxiliary>