<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|style_common>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <chapter|Admissibility preserving subcell based blending limiter for
  Lax-Wendroff Flux Reconstruction><label|ch:lw.subcell.limiter>

  <\with|color|red>
    TODO - WCT performance improvement by going for higher order methods.
    Maybe 2D Riemann problem?
  </with>

  <section|Lax-Wendroff FR scheme>

  Consider a conservation law of the form

  <\equation>
    <value|uu><rsub|t>+<ff><around|(|<value|bw>|)><rsub|x>=<value|bzero><label|eq:con.law>
  </equation>

  where <math|u\<in\><re><rsup|p>> is the vector of conserved quantities,
  <math|<ff><around|(|<value|bw>|)>> is the corresponding flux, together with
  some initial and boundary conditions. The solution that is physically
  correct is assumed to belong to an admissible set, denoted by <math|<Uad>>.
  For example in case of compressible flows, the density and pressure (or
  internal energy) must remain positive. In case of shallow water equations,
  the water depth must remain positive. In most of the models that are of
  interest, the admissible set is a convex subset of <math|<re><rsup|p>>, and
  can be written as

  <\equation>
    <label|eq:uad.form><Uad>=<around|{|<value|uu>\<in\><re><rsup|p>:p<rsub|k><around|(|<value|bw>|)>\<gtr\>0,1\<le\>k\<le\>K|}>
  </equation>

  where each admissibility constraint <math|p<rsub|k>> is concave if
  <math|p<rsub|j>\<gtr\>0> for all <math|j\<less\>k>. For Euler's equations,
  <math|K=2> and <math|p<rsub|1>,p<rsub|2>> are density, pressure functions
  respectively; if the density is positive then pressure is a concave
  function of the conserved variables.

  For the numerical solution, we will divide the computational domain
  <math|\<Omega\>> into disjoint elements <math|\<Omega\><rsub|e>>, with

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

  <\equation>
    <label|eq:xi0.defn>0\<le\>\<xi\><rsub|0>\<less\>\<xi\><rsub|1>\<less\>\<cdots\>\<less\>\<xi\><rsub|N>\<le\>1
  </equation>

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
    x\<in\>\<Omega\><rsub|e>:<space|2em><value|bw><rsub|h>*<around|(|\<xi\>,t|)>=<big|sum><rsub|p=0><rsup|N><value|uep><around|(|t|)>*\<ell\><rsub|p><around|(|\<xi\>|)>
  </equation*>

  where each <math|\<ell\><rsub|j>> is a Lagrange polynomial of degree
  <math|N> given by

  <\equation*>
    \<ell\><rsub|j><around|(|\<xi\>|)>=<big|prod><rsub|i=0,i\<ne\>j><rsup|N><frac|\<xi\>-\<xi\><rsub|i>|\<xi\><rsub|j>-\<xi\><rsub|i>>\<in\><poly><rsub|N>,<space|2em>\<ell\><rsub|j><around|(|\<xi\><rsub|i>|)>=\<delta\><rsub|\<nocomma\>>
  </equation*>

  Figure<nbsp>(<reference|fig:solflux1>a) illustrates a piecewise polynomial
  solution at some time <math|t<rsub|n>> with discontinuities at the element
  boundaries. Note that the coefficients <math|<value|uep>> which are the
  basic unknowns or <with|font-shape|italic|degrees of freedom> (dof), are
  the solution values at the solution points.

  Recall that the update equation is given by<nbsp><eqref|eq:uplwfr> which is
  a single-stage scheme at all orders of accuracy. The quantity
  <math|<value|F><rsub|h>> is a time average flux which is continuous in
  space and is computed using the flux reconstruction approach; it is given
  by

  <\equation>
    <label|eq:frcontflux><value|F><rsub|h><around|(|\<xi\>|)>=<around*|[|<value|F><rsub|<emh>>-<value|F><rsub|h><rsup|\<delta\>><around|(|0|)>|]>*g<rsub|L><around|(|\<xi\>|)>+<value|F><rsub|h><rsup|\<delta\>><around|(|\<xi\>|)>+<around*|[|<value|F><rsub|<eph>>-<value|F><rsub|h><rsup|\<delta\>><around|(|1|)>|]>*g<rsub|R><around|(|\<xi\>|)>
  </equation>

  where <math|<value|F><rsub|h><rsup|\<delta\>>> is the discontinuous flux
  obtained by interpolation at the solution points

  <\equation*>
    <value|F><rsub|h><rsup|\<delta\>><around|(|\<xi\>|)>=<big|sum><rsub|p=0><rsup|N><value|F><rsub|p><rsup|e>*\<ell\><rsub|p><around|(|\<xi\>|)>
  </equation*>

  The discontinuous and continuous fluxes are illustrated in
  Figure<nbsp>(<reference|fig:solflux1>b). The functions
  <math|g<rsub|L>,g<rsub|R>> are some polynomials that are chosen in the FR
  technique by linear stability analysis and <math|<value|F><rsub|<eph>>> are
  some numerical flux functions. The coefficients in the discontinuous flux
  <math|<value|F><rsub|h><rsup|\<delta\>>> provide approximations to the time
  average flux,

  <\equation*>
    <value|F><rsub|p><rsup|e>\<approx\><frac|1|\<Delta\>t>*<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>>f*<around|(|u*<around|(|\<xi\><rsub|p>,t|)>|)><ud>*t
  </equation*>

  and are computed by an approximate Lax-Wendroff procedure that uses finite
  differencing in time. The reader should consult<nbsp><cite|babbar2022> for
  more details on these aspects of the scheme.

  The element mean value is given by

  <\equation*>
    <au><rsub|e>=<big|sum><rsub|p=0><rsup|N><value|uep>*w<rsub|p>
  </equation*>

  where <math|w<rsub|j>> are the weights associated to the solution points.
  Then it is easy to show that the scheme is conservative in the sense that

  <\equation>
    <label|eq:fravgup><wide|<value|bw>|\<bar\>><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>
  </equation>

  The admissibility preserving property, also known as convex set
  preservation property since <math|<Uad>> is convex, of the conservation law
  can be written as

  <\equation>
    <label|eq:conv.pres.con.law><bw><around|(|\<cdummy\>,t<rsub|0>|)>\<in\><Uad><space|2em>\<Longrightarrow\><space|2em><bw><around|(|\<cdummy\>,t|)>\<in\><Uad>,<space|2em>t\<gtr\>t<rsub|0>
  </equation>

  and thus we define an admissibility preserving scheme to be

  <\definition>
    <label|defn:adm.pres>The flux reconstruction scheme is said to be
    admissibility preserving if

    <\equation*>
      <around|(|<bw><rsub|j><rsup|e>|)><rsup|n>\<in\><Uad><space|1em>\<forall\>e,j<space|2em>\<Longrightarrow\><space|2em><around|(|<bw><rsub|j><rsup|e>|)><rsup|n+1>\<in\><Uad><space|1em>\<forall\>e,j
    </equation*>

    where <math|<Uad>> is the admissibility set of the conservation law.
  </definition>

  To obtain an admissibility preserving scheme, we exploit the weaker
  admissibility preservation in means property defined as

  <\definition>
    <label|defn:mean.pres>The flux reconstruction scheme is said to be
    admissibility preserving in the means if

    <\equation*>
      <around|(|<bw><rsub|j><rsup|e>|)><rsup|n>\<in\><Uad><space|1em>\<forall\>e,j<space|2em>\<Longrightarrow\><space|2em><au><rsub|e><rsup|n+1>\<in\><Uad><space|1em>\<forall\>e
    </equation*>

    where <math|<Uad>> is the admissibility set of the conservation law.
  </definition>

  The focus of this work is to obtain the admissibility preservation in means
  property for the Lax-Wendroff Flux Reconstruction scheme. Once the scheme
  is admissibility preserving in means, the scaling limiter
  of<nbsp><cite|zhang2010c> can be used to obtain an admissibility preserving
  scheme.

  <section|On controlling oscillations><label|sec:controlling.oscillations>

  High order methods for hyperbolic problems necessarily produce Gibbs
  oscillations at discontinuities as shown by Godunov. The cure is to make
  the schemes to be non-linear even in the case of linear equations. For one
  dimensional problems, total variation diminishing approach provides a
  framework to construct non-oscillatory schemes. This is achieved by
  incorporating some non-linear limiting strategy into the scheme which
  locally reduces the order of the scheme when a discontinuity is detected.
  In discontinuous Galerkin type methods, the limiting is performed by
  modifying the solution in each element so as to ensure a TVD property for
  the element means. We first recall this strategy following Cockburn and
  Shu<nbsp><nbsp><cite|Cockburn1991|Cockburn1989a>.

  <subsection|TVD limiter><label|sec:tvd>

  The limiters developed in the context of RKDG
  schemes<nbsp><cite|Cockburn1991|Cockburn1989a> can be adopted in the
  framework of LWFR schemes. The limiter is applied in a post-processing step
  after the solution is updated to the new time level. The limiter is thus
  applied only once for each time step unlike in RKDG scheme where it has to
  be applied after each RK stage update. Let <math|u<rsub|h><around|(|x|)>>
  denote the solution at time <math|t<rsub|n+1>> obtained from the LWFR
  scheme. In element <math|\<Omega\><rsub|e>>, let the average solution be
  <math|<au><rsub|e>>; define the backward and forward differences of the
  solution and element means by

  <\equation*>
    \<Delta\><rsup|->*u<rsub|e>=<au><rsub|e>-u<rsub|h><around|(|x<rsub|<emh>><rsup|+>|)>,<space|2em>\<Delta\><rsup|+>*u<rsub|e>=u<rsub|h><around|(|x<rsub|<eph>><rsup|->|)>-<au><rsub|e>
  </equation*>

  <\equation*>
    \<Delta\><rsup|-><au><rsub|e>=<au><rsub|e>-<au><rsub|e-1>,<space|2em>\<Delta\><rsup|+><au><rsub|e>=<au><rsub|e+1>-<au><rsub|e>
  </equation*>

  We limit the solution by comparing its variation within the element with
  the difference of the neighbouring element means through a limiter
  function,

  <\equation*>
    \<Delta\><rsup|->u<rsub|e><rsup|m>=<minmod><around|(|\<Delta\><rsup|->*u<rsub|e>,\<Delta\><rsup|-><au><rsub|e>,\<Delta\><rsup|+><au><rsub|e>|)>,<space|2em>\<Delta\><rsup|+>u<rsub|e><rsup|m>=<minmod><around|(|\<Delta\><rsup|+>*u<rsub|e>,\<Delta\><rsup|-><au><rsub|e>,\<Delta\><rsup|+><au><rsub|e>|)>
  </equation*>

  where

  <\equation*>
    <minmod><around|(|a,b,c|)>=<choice|<tformat|<table|<row|<cell|s*min
    <around|(|<around|\||a|\|>,<around|\||b|\|>,<around|\||c|\|>|)>,>|<cell|<math-up|if
    >s=<sign><around|(|a|)>=<sign><around|(|b|)>=<sign><around|(|c|)>>>|<row|<cell|0,>|<cell|<math-up|otherwise>>>>>>
  </equation*>

  If <math|\<Delta\><rsup|->u<rsub|e><rsup|m>\<ne\>\<Delta\><rsup|->u<rsub|e>>
  or <math|\<Delta\><rsup|+>u<rsub|e><rsup|m>\<ne\>\<Delta\><rsup|+>u<rsub|e>>,
  then the solution is deemed to be locally oscillatory and we modify the
  solution inside the element by replacing it as a linear polynomial with a
  limited slope, which is taken to be the average limited slope. The limited
  solution polynomial in element <math|\<Omega\><rsub|e>> is given by

  <\equation*>
    u<rsub|h>\|<rsub|\<Omega\><rsub|e>>=<au><rsub|e>+<frac|\<Delta\><rsup|->*u<rsub|e><rsup|m>+\<Delta\><rsup|+>*u<rsub|e><rsup|m>|2>*<around|(|2*\<xi\>-1|)>,<space|2em>\<xi\>\<in\><around|[|0,1|]>
  </equation*>

  This limiter is known to clip smooth extrema since it cannot distinguish
  them from jump discontinuities. A small modification based on the idea of
  TVB limiters<nbsp><cite|Cockburn1991> can be used to relax the amount of
  limiting that is performed which leads to improved resolution of smooth
  extrema. The <math|<minmod>> function is replaced by

  <\equation*>
    <wide|<minmod>|~><around|(|a,b,c|)>=<choice|<tformat|<table|<row|<cell|a,>|<cell|<around|\||a|\|>\<le\>M*\<Delta\>x<rsup|2>>>|<row|<cell|<minmod><around|(|a,b,c|)>,>|<cell|<math-up|otherwise>>>>>>
  </equation*>

  where the parameter <math|M> has to be chosen by the user, which is an
  estimate of the second derivative of the solution at smooth extrema. In the
  case of systems of equations, the limiter is applied to the characteristic
  variables, which is known to yield better control on the spurious numerical
  oscillations<nbsp><cite|Cockburn1989>. Clearly, the performance of this
  limiter depends on the proper choice of the parameter <math|M> which is
  problem dependent.

  <subsection|Blending scheme><label|sec:blending.scheme>

  The TVD-type limiters used in DG methods lose a lot of information when the
  limiter is active, since the polynomial solution of degree <math|N> is
  replaced either by a solution of degree 1 or a constant solution if a
  strong discontinuity is detected in an element. This is especially
  problematic near smooth extrema which may be wrongly detected as a
  discontinuity. It would be desirable to use more information inside each
  element while applying some limiting process. Let us write the LWFR update
  equation<nbsp><eqref|eq:uplwfr> as

  <\equation*>
    <vu><rsup|H,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>><vR><rsup|H><rsub|e>
  </equation*>

  where <math|<vu><rsub|e>> is the vector of nodal values in the element.
  Suppose we also have a lower order and non-oscillatory scheme available to
  us in the form

  <\equation*>
    <vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>><vR><rsup|L><rsub|e>
  </equation*>

  Then a blended scheme is given by

  <\equation>
    <vu><rsup|n+1><rsub|e>=<around|(|1-\<alpha\><rsub|e>|)><vu><rsup|H,n+1><rsub|e>+\<alpha\><rsub|e><vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|[|<around|(|1-\<alpha\><rsub|e>|)><vR><rsup|H><rsub|e>+\<alpha\><rsub|e><vR><rsup|L><rsub|e>|]><label|eq:blended.scheme>
  </equation>

  where <math|\<alpha\><rsub|e>\<in\><around|[|0,1|]>> must be chosen based
  on some local smoothness indicator. If <math|\<alpha\><rsub|e>=0> then we
  obtain the high order LWFR scheme, while if <math|\<alpha\><rsub|e>=1> then
  the scheme becomes the low order scheme that is less oscillatory. In
  subsequent sections, we explain the details of the lower order scheme and
  the design of smoothness indicators. The lower order scheme will either be
  a first order finite volume scheme or a high resolution scheme based on
  MUSCL-Hancock idea. In either case, the common structure of the low order
  scheme can be explained as follows.

  <\big-figure>
    <padded-center|<image|illustrations/subcells_fvm|0.7par|||><label|fig:subcells>>
  </big-figure|Subcells used by lower order scheme for degree <math|N=4>.>

  Let us subdivide each element <math|\<Omega\><rsub|e>> into <math|N+1>
  subcells associated to the solution points
  <math|<around|{|x<rsup|e><rsub|j>,j=0,1,\<ldots\>,N|}>> of the LWFR scheme.
  Thus, we will have <math|N+2> subfaces denoted by
  <math|<around|{|x<rsup|e><rsub|<jph>>,j=-1,0,\<ldots\>,N|}>> with
  <math|x<rsup|e><rsub|-<half>>=x<rsub|<emh>>> and
  <math|x<rsup|e><rsub|<Nph>>=x<rsub|<eph>>>. For maintaining a conservative
  scheme, the <math|j<rsup|th>> subcell is chosen so that

  <\equation>
    <label|eq:subcell.defn>x<rsub|<jph>><rsup|e>-x<rsub|<jmh>><rsup|e>=w<rsub|j>*\<Delta\>*x<rsub|e>,<space|2em>0\<le\>j\<le\>N
  </equation>

  where <math|w<rsub|j>> is the <math|j<rsup|th>> quadrature weight
  associated with the solution points. Figure<nbsp><reference|fig:subcells>
  gives an illustration of the subcells for degree <math|N=4> case. The low
  order scheme is obtained by updating the solution in each of the subcells
  by a finite volume scheme,

  <\equation>
    <label|eq:low.order.update>

    <\eqsplit>
      <tformat|<table|<row|<cell|<around|(|u<rsub|0><rsup|e>|)><rsup|L,n+1>>|<cell|=<around|(|u<rsub|0><rsup|e>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|0>*\<Delta\>*x<rsub|e>>*<around|[|f<rsub|<half>><rsup|e>-<value|F><rsub|<emh>>|]>>>|<row|<cell|<around|(|u<rsub|j><rsup|e>|)><rsup|L,n+1>>|<cell|=<around|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|j>*\<Delta\>*x<rsub|e>>*<around|[|f<rsub|j+<frac|1|2>><rsup|e>-f<rsub|j-<frac|1|2>><rsup|e>|]>,<space|2em>1\<le\>j\<le\>N-1>>|<row|<cell|<around|(|u<rsub|N><rsup|e>|)><rsup|L,n+1>>|<cell|=<around|(|u<rsub|N><rsup|e>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|N>*\<Delta\>*x<rsub|e>>*<around|[|<value|F><rsub|<eph>>-f<rsub|<Nmh>><rsup|e>|]>>>>>
    </eqsplit>
  </equation>

  The inter-element fluxes <math|<value|F><rsub|<eph>>> used in the low order
  scheme are same as those used in the high order LWFR scheme in
  equation<nbsp><eqref|eq:frcontflux>. Usually, Rusanov's
  flux<nbsp><cite|Rusanov1962> will be used for the inter-element fluxes and
  in the lower order scheme. The element mean value obtained by the low order
  scheme satisfies

  <\equation>
    <label|eq:low.order.cell.avg.update><wide|u|\<bar\>><rsub|e><rsup|L,n+1>=<big|sum><rsub|j=0><rsup|N><around|(|<bw><rsub|j><rsup|e>|)><rsup|L,n+1>*w<rsub|j>=<wide|u|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>
  </equation>

  which is identical to the update equation by the LWFR scheme given in
  equation<nbsp><eqref|eq:fravgup>. The element mean in the blended scheme
  evolves according to

  <\eqnarray*>
    <tformat|<table|<row|<cell|<wide|u|\<bar\>><rsub|e><rsup|n+1>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)><around|(|<wide|u|\<bar\>><rsub|e>|)><rsup|H,n+1>+\<alpha\><rsub|e><around|(|<wide|u|\<bar\>><rsub|e>|)><rsup|L,n+1>>>|<row|<cell|>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<around*|[|<wide|u|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>|]>+\<alpha\><rsub|e>*<around*|[|<wide|u|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<wide|u|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>>>>>
  </eqnarray*>

  and hence the blended scheme is also conservative; all three schemes, i.e.,
  lower order, LWFR and the blended scheme, predict the same mean value.

  The inter-element flux <math|<value|F><rsub|<eph>>> is used both in the low
  and high order schemes. To achieve high order accuracy in smooth regions,
  this flux needs to be high order accurate, however it may produce numerical
  oscillations near discontinuities when used in the low order scheme. A
  natural choice to balance accuracy and oscillations is to take

  <\equation>
    <label|eq:Fblend><value|F><rsub|<eph>>=<around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsub|<eph>><rsup|LW>+\<alpha\><rsub|<eph>>*f<rsub|<eph>>,<space|2em>\<alpha\><rsub|<eph>>\<in\><around|[|0,1|]>
  </equation>

  where <math|<value|F><rsub|<eph>><rsup|LW>> is the high order inter-element
  time-averaged numerical flux of the LWFR scheme<nbsp><eqref|eq:frcontflux>
  and <math|f<rsub|<eph>>> is a lower order flux at the face
  <math|x<rsub|<eph>>> shared between FR elements and
  subcells<nbsp>(<reference|eq:fo.at.face>, <reference|eq:mh.at.face>). The
  blending coefficient <math|\<alpha\><rsub|<eph>>> will be based on a local
  smoothness indicator which will bias the flux towards the lower order flux
  <math|f<rsub|<eph>>> near regions of lower solution smoothness. However, to
  enforce admissibility in means (Definition<nbsp><reference|defn:mean.pres>),
  the flux has to be further corrected, as explained in
  Section<nbsp><reference|sec:admissibility.preservation>.

  <\remark>
    <label|rmk:why.same.flux>It is essential to use the same inter-element
    flux in both the low and high order schemes in order to have
    conservation. Suppose we use numerical fluxes
    <math|<value|F><rsub|<eph>><rsup|L>,<value|F><rsub|<eph>><rsup|H>> in the
    low and high order schemes, respectively; then the element mean in the
    blended scheme will become

    <\equation*>
      <wide|u|\<bar\>><rsub|e><rsup|n+1>=<wide|u|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|e>>*<around|[|<around|(|<around|(|1-\<alpha\><rsub|e>|)>*<value|F><rsub|<eph>><rsup|H>+\<alpha\><rsub|e>*<value|F><rsub|<eph>><rsup|L>|)>-<around|(|<around|(|1-\<alpha\><rsub|e>|)>*<value|F><rsub|<emh>><rsup|H>+\<alpha\><rsub|e>*<value|F><rsub|<emh>><rsup|L>|)>|]>
    </equation*>

    For conservation the flux leaving element <math|\<Omega\><rsub|e>>
    through <math|x<rsub|<eph>>> must enter the neighbouring element
    <math|\<Omega\><rsub|e+1>>, i.e.,

    <\equation*>
      <around|(|1-\<alpha\><rsub|e>|)>*<value|F><rsub|<eph>><rsup|H>+\<alpha\><rsub|e>*<value|F><rsub|<eph>><rsup|L>=<around|(|1-\<alpha\><rsub|e+1>|)>*<value|F><rsub|<eph>><rsup|H>+\<alpha\><rsub|e+1>*<value|F><rsub|<eph>><rsup|L>
    </equation*>

    i.e., <math|<around|(|\<alpha\><rsub|e>-\<alpha\><rsub|e+1>|)>*<value|F><rsub|<eph>><rsup|L>=<around|(|\<alpha\><rsub|e>-\<alpha\><rsub|e+1>|)>*<value|F><rsub|<eph>><rsup|H>>
    which must hold for all values of <math|\<alpha\><rsub|e>,\<alpha\><rsub|e+1>>
    and hence we need <math|<value|F><rsub|<eph>><rsup|L>=<value|F><rsub|<eph>><rsup|H>>.
  </remark>

  <subsection|Smoothness indicator><label|sec:smooth.ind>

  The numerical approximation of the PDE solution is in the form of piecewise
  polynomials of degree <math|N>. The polynomial can be written in terms of
  an orthogonal basis like Legendre polynomials. The smoothness of the
  solution can be assessed by analyzing the decay of the coefficients of the
  orthogonal expansion, a technique originally proposed by Persson and
  Peraire<nbsp><cite|Persson2006> and subsequently refined by Klöckner et
  al.<nbsp><cite|klockner2011> and Henemann et al.<nbsp><cite|henemann2021>.
  For a scalar problem, the solution <math|u> itself can be used to design a
  smoothness indicator. For a system of PDE, we can use any one or all
  components of the solution vector. Alternatively, some derived quantity
  that can indicate the smoothness of all solution components can be chosen.
  For the Euler equations, a good choice seems to be the product of density
  and pressure<nbsp><cite|henemann2021>.

  Let <math|q=q<around|(|u|)>> be the quantity used to measure the solution
  smoothness. We first project this onto Legendre polynomials,

  <\equation*>
    q<rsub|h><around|(|\<xi\>|)>=<big|sum><rsub|j=0><rsup|N><wide|q|^><rsub|j>*L<rsub|j>*<around|(|2*\<xi\>-1|)>,<space|1em>\<xi\>\<in\><around|[|0,1|]>,<space|2em><wide|q|^><rsub|j>=<big|int><rsub|0><rsup|1>q<around|(|u<rsub|h><around|(|\<xi\>|)>|)>*L<rsub|j>*<around|(|2*\<xi\>-1|)>*<ud>*\<xi\>
  </equation*>

  The Legendre coefficients <math|<wide|q|^><rsub|j>> are computed using the
  quadrature induced by the solution points,

  <\equation*>
    <wide|q|^><rsub|j>=<big|sum><rsub|q=0><rsup|N>q<around|(|u<rsub|q><rsup|e>|)>*L<rsub|j>*<around|(|2*\<xi\><rsub|q>-1|)>*w<rsub|q>
  </equation*>

  Then the energy contained in highest modes relative to the total energy of
  the polynomial is computed as follows,

  <\equation*>
    <en>=max <around*|(|<frac|<wide|q|^><rsub|N-1><rsup|2>|<big|sum><rsub|j=0><rsup|N-1><wide|q|^><rsub|j><rsup|2>>,<frac|<wide|q|^><rsub|N><rsup|2>|<big|sum><rsub|j=0><rsup|N><wide|q|^><rsub|j><rsup|2>>|)>
  </equation*>

  The <math|N<rsup|<text>>*t*h> Legendre coefficient
  <math|<wide|q|^><rsub|N>> of a function which is in the Sobolev space
  <math|H<rsup|2>> decays as <math|O<around|(|1/N<rsup|2>|)>> (see Chapter 5,
  Section 5.4.2 of<nbsp><cite|Canuto2007>). We consider smooth functions to
  be those whose Legendre coefficients <math|<wide|q|^><rsub|N>> decay at
  rate proportional to <math|1/N<rsup|2>> so that their squares decay
  proportional to <math|1/N<rsup|4>><nbsp><cite|Persson2006>. Thus, the
  following threshold for smoothness is proposed in<nbsp><cite|henemann2021>

  <\equation*>
    <thresh><around|(|N|)>=a\<cdot\>10<rsup|-c*<around|(|N+1|)><rsup|\<nosymbol\>>*14>
  </equation*>

  where parameters <math|a=<half>> and <math|c=1.8> are obtained through
  numerical experiments. To convert the highest mode energy indicator
  <math|<en>> and threshold value <math|<thresh>> into a value in
  <math|<around|[|0,1|]>>, the logistic function
  (Figure<nbsp><reference|fig:alpha.func>) is used

  <\equation*>
    <wide|\<alpha\>|~><around|(|<en>|)>=<frac|1|1+exp
    <around*|(|-<frac|s|<thresh>>*<around|(|<en>-<thresh>|)>|)>>
  </equation*>

  <\big-figure>
    <padded-center|<image|illustrations/alpha_func|0.5par|||><label|fig:alpha.func>>
  </big-figure|Logistic function used to map energy to a smoothness
  coefficient <math|\<alpha\>\<in\><around|[|0,1|]>> shown for various
  solution polynomial degrees <math|N>.>

  The sharpness factor <math|s> was chosen to be <math|s=9.21024> so that
  blending coefficient equals <math|\<alpha\>=0.0001> when highest energy
  indicator <math|<en>=0>. In regions where <math|<wide|\<alpha\>|~>=0> or
  <math|<wide|\<alpha\>|~>=1>, computational cost can be saved by performing
  only the lower order or higher order scheme respectively. Thus, the values
  of <math|\<alpha\>> are clipped as

  <\equation*>
    \<alpha\><rsub|e>\<assign\><choice|<tformat|<table|<row|<cell|0,<space|1em>>|<cell|<text|if
    ><wide|\<alpha\>|~>\<less\>\<alpha\><rsub|min>>>|<row|<cell|<wide|\<alpha\>|~>,>|<cell|<text|if
    >\<alpha\><rsub|min>\<le\><wide|\<alpha\>|~>\<le\>1-\<alpha\><rsub|min>>>|<row|<cell|1,>|<cell|<text|if
    >1-\<alpha\><rsub|min>\<less\><wide|\<alpha\>|~>>>>>>
  </equation*>

  with <math|\<alpha\><rsub|min>=0.001>. In <nbsp><cite|henemann2021>, the
  maximum value of <math|\<alpha\>> was clipped to
  <math|\<alpha\><rsub|max>=0.5>, but we use <math|\<alpha\><rsub|max>=1> for
  the LWFR scheme. There were no significant improvements observed by
  decreasing <math|\<alpha\><rsub|max>> in any of the tests; in some tests
  like Shu-Osher (Section<nbsp><reference|sec:shuosher.blend>), we observed a
  large number of oscillations when <math|\<alpha\><rsub|max>=0.5> was used.
  Finally, since shocks can spread to the neighbouring cells, smoothening of
  <math|\<alpha\>> is performed as

  <\equation>
    \<alpha\><rsub|e><rsup|final>=max<rsub|E\<in\>\<cal-E\><rsub|e>><around*|{|\<alpha\><rsub|e>,<half>*\<alpha\><rsub|E>|}><label|eq:smoothing>
  </equation>

  where <math|\<cal-E\><rsub|e>> denotes all elements sharing a face with
  <math|e>.

  <subsection|First order blending><label|sec:fo>

  The lower order scheme is taken to be a first order finite volume scheme,
  for which the subcell fluxes in <eqref|eq:low.order.update> are given by

  <\equation*>
    f<rsub|<jph>><rsup|e>=f*<around|(|u<rsub|j><rsup|e>,u<rsub|j+1><rsup|e>|)>
  </equation*>

  At the interfaces that are shared with FR elements, we define the lower
  order flux used in computing inter-element flux
  (Section<nbsp><reference|sec:admissibility.preservation>) as

  <\equation>
    f<rsub|<eph>>=f*<around|(|u<rsub|N><rsup|e>,u<rsub|0><rsup|e+1>|)><label|eq:fo.at.face>
  </equation>

  In this work, the numerical flux <math|f*<around|(|\<cdummy\>,\<cdummy\>|)>>
  is taken to be Rusanov's flux<nbsp><cite|Rusanov1962>, which is the same
  flux used by the higher order scheme at the element interfaces.

  <section|Higher order blending><label|sec:mh>

  The MUSCL-Hancock scheme is a single-stage and second order accurate
  scheme, originally introduced in<nbsp><cite|vanleer1984>, and proven to be
  robust under appropriate slope restrictions<nbsp><cite|Berthon2006>. We can
  expect better accuracy by blending the LWFR scheme with the MUSCL-Hancock
  scheme. Following the slope correction procedure of
  Berthon<nbsp><cite|Berthon2006>, the MUSCL-Hancock scheme can mimic the
  admissible set preservation of the solutions of conservation
  laws<nbsp><eqref|eq:conv.pres.con.law>. The extension of Berthon's work to
  non-cell centered grids<nbsp><eqref|eq:non.cell.centred.defn> which arise
  in the blending scheme is given in Theorem<nbsp><reference|thm:muscl.admissibility.theorem>
  whose proof is given in Appendix<nbsp><reference|sec:muscl.admissibility.proof>.
  In this section, we give algorithmic details of the 1-D procedure and
  details of the 2-D procedure can be found in
  Appendix<nbsp><reference|sec:2d.mh>.

  Essentially, the MUSCL-Hancock scheme provides a high order estimate of the
  subcell fluxes <math|f<rsub|<jph>><rsup|e>> used in the low order scheme
  <eqref|eq:low.order.update> and we now explain the procedure for estimating
  these fluxes. To simplify the notation, let us suppress the element index
  <math|e> and set

  <\equation*>
    u<rsub|-2>=u<rsub|N-1><rsup|e-1>,<space|2em>u<rsub|-1>=u<rsub|N><rsup|e-1>,<space|2em><around|{|u<rsub|j>=u<rsub|j><rsup|e>,<space|2em>0\<le\>j\<le\>N|}>,<space|2em>u<rsub|N+1>=u<rsub|0><rsup|e+1>,<space|2em>u<rsub|N+2>=u<rsub|1><rsup|e+1>
  </equation*>

  Using the mid-point rule in time to integrate the conservation
  law<nbsp><eqref|eq:con.law> over the space-time element
  <math|<around|[|x<rsub|<jmh>>,x<rsub|<jph>>|]>\<times\><around|[|t<rsup|n>,t<rsup|n+1>|]>>,
  we get

  <\equation>
    u<rsub|j><rsup|n+1>=u<rsub|j><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|j>>*<around|(|f<rsub|<jph>><rsup|<nph>>-f<rsub|<jmh>><rsup|<nph>>|)><label|eq:riemann.problem>
  </equation>

  where

  <\equation*>
    f<rsub|<jph>><rsup|<nph>>=f*<around|(|<bw><rsub|j-1><rsup|<nph>,+>,u<rsub|j><rsup|<nph>,->|)>
  </equation*>

  is obtained from a numerical flux function, usually Rusanov's
  flux<nbsp><cite|Rusanov1962>. The <math|<bw><rsub|j><rsup|<nph>,\<pm\>>>
  denote the approximations of solutions in subcell <math|j> at right, left
  faces respectively, evolved to time level <math|<nph>>. Aiming to first
  approximate the solution at <math|t<rsup|n>> on the faces, we create a
  linear approximation of the solution in each subcell as

  <\equation>
    <label|eq:delta.defn>r<rsub|j><rsup|n><around|(|x|)>=u<rsub|j><rsup|n>+<around|(|x-x<rsub|j>|)>*\<delta\><rsub|j><space|2em><slope><rsub|j>=<text|minmod><around*|(|\<beta\>*\<Delta\><rsub|+>*u<rsub|j>,\<Delta\><rsub|c>*u<rsub|j>,\<beta\>*\<Delta\><rsub|->*u<rsub|j>|)>
  </equation>

  where, for <math|h<rsub|1>=x<rsub|j>-x<rsub|j-1>>,
  <math|h<rsub|2>=x<rsub|j+1>-x<rsub|j>>,

  <\equation*>
    \<Delta\><rsub|+>*u<rsub|j>=<frac|u<rsub|j+1><rsup|n>-u<rsub|j><rsup|n>|h<rsub|2>>,<space|1em>\<Delta\><rsub|->*u<rsub|j>=<frac|u<rsub|j><rsup|n>-u<rsub|j-1><rsup|n>|h<rsub|1>>,<space|1em>\<Delta\><rsub|c>*u<rsub|j>=-<frac|h<rsub|2>|h<rsub|1>*<around|(|h<rsub|1>+h<rsub|2>|)>>*u<rsup|n><rsub|j-1>+<frac|h<rsub|2>-h<rsub|1>|h<rsub|1>*h<rsub|2>>*u<rsup|n><rsub|j>+<frac|h<rsub|1>|h<rsub|2>*<around|(|h<rsub|1>+h<rsub|2>|)>>*u<rsup|n><rsub|j+1>
  </equation*>

  The <math|\<Delta\><rsub|\<pm\>>*<bw><rsub|j>> are forward and backward
  approximations of slope respectively, and
  <math|\<Delta\><rsub|c>*<bw><rsub|j>> is the second order approximation of
  the slope. The value <math|\<beta\>> is chosen to lie between <math|1> and
  <math|2>; for <math|\<beta\>=1>, we reduce to the minmod limiter and
  <math|\<beta\>=2> corresponds to the limiter of van
  Leer<nbsp><cite|vanleer1977>. A higher value of <math|\<beta\>> tips the
  slope closer to the second order approximation, gaining accuracy but also
  increasing the risk of spurious oscillations. For all results in this work,
  the choice of <math|\<beta\>=2-\<alpha\><rsub|e>> is made. Thus,
  <math|\<beta\>> will be close to 2 in regions where smoothness indicator
  only detects mild irregularities in the solution, while it will be near
  <math|1> in regions with strong discontinuities. With the linear
  reconstructions, we can define

  <\equation>
    <label|eq:reconstruction><bw><rsub|j><rsup|n,->=r<rsup|n><rsub|j><around|(|x<rsub|<jmh>>|)>=u<rsub|j><rsup|n>+<slope><rsub|j><around|(|x<rsub|<jmh>>-x<rsub|j>|)>,<space|2em><bw><rsub|j><rsup|n,+>=r<rsup|n><rsub|j><around|(|x<rsub|<jph>>|)>=u<rsub|j><rsup|n>+<slope><rsub|j><around|(|x<rsub|<jph>>-x<rsub|j>|)>
  </equation>

  Using the conservation law, we approximate the temporal derivatives as

  <\equation*>
    \<partial\><rsub|t>*u<rsup|n><rsub|j>\<assign\>-<frac|f<around|(|u<rsup|n,+><rsub|j>|)>-f<around|(|u<rsup|n,-><rsub|j>|)>|x<rsub|<jph>>-x<rsub|<jmh>>>
  </equation*>

  and finally use Taylor's expansion to evolve the face values in time as

  <\equation>
    <label|eq:evolution><bw><rsub|j><rsup|<nph>,->=<bw><rsub|j><rsup|n,->+<frac|\<Delta\>*t|2>*\<partial\><rsub|t>*u<rsup|n><rsub|j>,<space|2em><bw><rsub|j><rsup|<nph>,+>=<bw><rsub|j><rsup|n,+>+<frac|\<Delta\>*t|2>*\<partial\><rsub|t>*u<rsup|n><rsub|j>
  </equation>

  At the interfaces shared with the FR elements, the lower order flux used in
  computing inter-element flux (Section<nbsp><reference|sec:admissibility.preservation>)
  is given by <math|f<rsub|<eph>>=f<rsub|<Nph>><rsup|<nph>>>; the dependence
  on neighbouring states can be made explicit as

  <\equation>
    f<rsub|<eph>>=f*<around|(|u<rsub|N-1><rsup|e>,u<rsub|N><rsup|e>,u<rsub|0><rsup|e+1>,u<rsub|1><rsup|e+1>|)><label|eq:mh.at.face>
  </equation>

  For admissibility of the lower order method, we rely on the following
  generalization of Berthon<nbsp><cite|Berthon2006>, proved in
  Appendix<nbsp><reference|sec:muscl.admissibility.proof>.

  <\theorem>
    <label|thm:muscl.admissibility.theorem>Consider a conservation law of the
    form<nbsp><eqref|eq:con.law> which preserves the admissibility set
    <math|<Uad>><nbsp><eqref|eq:conv.pres.con.law>. Let
    <math|<around*|{|<bw><rsub|j><rsup|n>|}><rsub|j>> be the approximate
    solution at time level <math|n> and assume that
    <math|<bw><rsub|j><rsup|n>\<in\><Uad>> for all <math|j>. Consider
    conservative reconstructions

    <\equation*>
      <bw><rsub|j><rsup|n,+>=<bw><rsub|j><rsup|n>+<around|(|x<rsub|j+<frac|1|2>>-x<rsub|j>|)><slope><rsub|j>,<space|2em><bw><rsub|j><rsup|n,->=<bw><rsub|j><rsup|n>+<around|(|x<rsub|j-<frac|1|2>>-x<rsub|j>|)><slope><rsub|j>
    </equation*>

    Define <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> by

    <\equation>
      <label|eq:us.defn.main><mum><bw><rsub|j><rsup|n,->+<bw><rsub|j><rsup|\<ast\>,\<pm\>>+<mup><bw><rsub|j><rsup|n,+>=2*<bw><rsub|j><rsup|n,\<pm\>>
    </equation>

    where

    <\equation*>
      <mum>=<frac|x<rsub|j+<frac|1|2>>-x<rsub|j>|x<rsub|j+<frac|1|2>>-x<rsub|j-<frac|1|2>>>,<space|2em><mup>=<frac|x<rsub|j>-x<rsub|j-<frac|1|2>>|x<rsub|j+<frac|1|2>>-x<rsub|j-<frac|1|2>>>
    </equation*>

    Assume that the slope <math|<slope><rsub|j>> is chosen so that

    <\equation>
      <bw><rsub|j><rsup|\<ast\>,\<pm\>>\<in\><Uad><label|eq:ustar.in.uad>
    </equation>

    Then, under appropriate time step restrictions<nbsp>(<reference|eq:new.cfl1>,<reference|eq:new.cfl2>,<reference|eq:new.cfl3.conservative>),
    the updated solution <math|<bw><rsub|j><rsup|n+1>> defined by the
    MUSCL-Hancock procedure<nbsp><eqref|eq:riemann.problem> is in
    <math|<Uad>>.
  </theorem>

  <subsection*|Slope limiting in practice>

  A problem-independent procedure for slope limiting to ensure admissibility
  preservation is proposed, in contrast to the original procedure for Euler's
  equations in<nbsp><cite|Berthon2006> that was extended to the 10-moment
  problem in<nbsp><cite|meena2017>. For the MUSCL-Hancock scheme to be
  admissibility preserving, the slope <math|<slope><rsub|j>> given by the
  minmod limiter<nbsp><eqref|eq:delta.defn> has to be further limited so that
  <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>=<bw><rsub|j><rsup|n>+2*<around|(|x<rsub|<jpmh>>-x<rsub|j>|)><slope><rsub|j>\<in\><Uad>><nbsp><eqref|eq:us.defn.main>.
  We explain the procedure with a <with|font-family|tt|for> loop over the
  admissibility constraints <math|<around|{|p<rsub|k>,k=1,\<ldots\>,K|}>>.

  <vspace|8pt><hrule><vspace|1.5pt> \ 

  <algo-state|<math|<slope><rsub|j>\<leftarrow\><text|minmod><around*|(|\<beta\>*\<Delta\><rsub|+>*u<rsub|j>,\<Delta\><rsub|c>*u<rsub|j>,\<beta\>*\<Delta\><rsub|->*u<rsub|j>|)>>>

  <algo-state|<math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<leftarrow\><bw><rsub|j><rsup|n>+2*<around|(|x<rsub|<jpmh>>-x<rsub|j>|)><slope><rsub|j>>>

  <\algo-for|<math|k>=1:<math|K>>
    <algo-state|<math|\<epsilon\><rsub|k>=<frac|1|10>*p<rsub|k><around|(|<bw><rsub|j><rsup|n>|)>>>

    <algo-state|<math|\<theta\><rsub|\<pm\>>\<leftarrow\>min
    <around*|{|<around*|\||<frac|\<epsilon\><rsub|k>-p<rsub|k><around*|(|<bw><rsub|j><rsup|n>|)>|p<rsub|k><around*|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)>-p<rsub|k><around*|(|<bw><rsub|j><rsup|n>|)>>|\|>,1|}>>>

    <algo-state|<math|\<theta\><rsub|k>\<leftarrow\>min
    <around|{|\<theta\><rsub|+>,\<theta\><rsub|->|}>>>

    <algo-state|<math|<slope><rsub|j>\<leftarrow\>\<theta\><rsub|k><slope><rsub|j>>>

    <algo-state|<math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<leftarrow\><bw><rsub|j><rsup|n>+2*<around|(|x<rsub|<jpmh>>-x<rsub|j>|)><slope><rsub|j>>>
  </algo-for>

  <hrule>

  At the <math|k<rsup|th>> iteration, by concavity of the admissibility
  constraint <math|p<rsub|k>>, the <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>>
  computed with the corrected slope <math|<slope><rsub|j>> will satisfy

  <\equation>
    <label|eq:pk.slope.correction>p<rsub|k><around|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)>=p<rsub|k>*<around|(|\<theta\><rsub|k><around|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)><rsup|prev>+<around|(|1-\<theta\><rsub|k>|)>*<bw><rsub|j><rsup|n>|)>\<ge\>\<theta\><rsub|k>*p<rsub|k>*<around|(|<around|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)><rsup|prev>|)>+<around|(|1-\<theta\><rsub|k>|)>*p<rsub|k><around|(|<bw><rsub|j><rsup|n>|)>\<ge\>\<epsilon\><rsub|k>
  </equation>

  so that the <math|k<rsup|<text>>*t*h> admissibility constraint is
  satisfied; here <math|<around|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)><rsup|prev>>
  denotes <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> before the
  <math|k<rsup|<text>>*t*h> correction. The choice of
  <math|\<epsilon\><rsub|k>=<frac|1|10>*p<rsub|k><around|(|<bw><rsub|j><rsup|n>|)>>
  was made following<nbsp><cite|ramirez2021> to allow only a certain
  deviation below the <with|font-shape|italic|safe solution>, imposing a
  stricter requirement than positivity. Note that this limiting is performed
  on the slope used for reconstruction in the MUSCL-Hancock scheme, and not
  on the updated solution. The previous admissibility constraints
  <math|p<rsub|l>> for <math|l\<less\>k> will also continue to be satisfied
  by using induction argument and concavity of the constraints,

  <\equation*>
    p<rsub|l><around|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)>\<ge\>\<theta\><rsub|k>*p<rsub|l>*<around|(|<around|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)><rsup|prev>|)>+<around|(|1-\<theta\><rsub|k>|)>*p<rsub|l><around|(|<bw><rsub|j><rsup|n>|)>\<ge\>\<theta\><rsub|k>*\<epsilon\><rsub|l>+<around|(|1-\<theta\><rsub|k>|)>*\<epsilon\><rsub|l>=\<epsilon\><rsub|l>
  </equation*>

  The slope <math|<slope><rsub|j>> obtained at the end of <math|K> iterations
  satisfies all admissibility constraints ensuring
  <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<in\><Uad>>.

  <section|Flux limiter for admissibility
  preservation><label|sec:admissibility.preservation>

  The first step in obtaining an admissibility preserving blending scheme is
  to ensure that the lower order scheme preserves the admissibility set
  <math|<Uad>>. This is always true if all the fluxes in the lower order
  method are computed with a finite volume method that is proven to be
  admissibility preserving. But the LWFR scheme uses a time average numerical
  flux and maintaining conservation requires that we use the same numerical
  flux at the element interfaces for both lower and higher order schemes (see
  Remark<nbsp><reference|rmk:why.same.flux>). To maintain accuracy and
  admissibility, we have to carefully choose a blended numerical flux
  <math|<value|F><rsub|<eph>>> as in<nbsp><eqref|eq:Fblend> but this choice
  may not ensure admissibility and further limitation is required. Our
  proposed procedure for choosing the blended numerical flux will give us an
  admissibility preserving lower order scheme. After this step, there are two
  possibilities for obtaining admissibility of the blending scheme. We could
  follow the procedure of<nbsp><cite|ramirez2021> to
  <with|font-shape|italic|a posteriori> modify the blending coefficient
  <math|\<alpha\>> to obtain admissibility relying directly on the
  admissibility of the lower order scheme. The other option which we take in
  this work is to note that, as a result of using the same numerical flux in
  both high and low order schemes, element means of both schemes are the same
  (Theorem<nbsp><reference|thm:lwfr.admissibility>). A consequence of this is
  that our scheme now preserves admissibility of element means and thus we
  can use the scaling limiter of<nbsp><cite|Zhang2010b>. The latter approach
  of correcting element means to obtain a positivity preserving Lax-Wendroff
  scheme has been used in<nbsp><cite|moe2017>, where the numerical flux is
  corrected to directly make element means admissible. In comparison
  to<nbsp><cite|moe2017>, our procedure for ensuring admissibility of element
  means requires less storage and loops.

  The theoretical basis for flux limiting can be summarised in the following
  Theorem<nbsp><reference|thm:lwfr.admissibility>.

  <\theorem>
    <label|thm:lwfr.admissibility>Consider the LWFR blending
    scheme<nbsp><eqref|eq:blended.scheme> where low and high order schemes
    use the same numerical flux <math|<value|F><rsub|<eph>>> at every element
    interface. Then the following can be said about admissibility preserving
    in means property (Definition<nbsp><reference|defn:mean.pres>) of the
    scheme:

    <\enumerate>
      <item>element means of both low and high order schemes are same and
      thus the blended scheme<nbsp><eqref|eq:blended.scheme> is admissibility
      preserving in means if and only if the lower order scheme is
      admissibility preserving in means;

      <item>if the finite volume method using the lower order flux
      <math|f<rsub|<eph>>> as the interface flux is admissibility preserving,
      such as the first-order finite volume method or the MUSCL-Hancock
      scheme with CFL restrictions and slope correction from
      Theorem<nbsp><reference|thm:muscl.admissibility.theorem>, and the
      blended numerical flux <math|<value|F><rsub|<eph>>> is chosen to
      preserve the admissibility of lower-order updates at solution points
      adjacent to the interfaces, then the blending
      scheme<nbsp><eqref|eq:blended.scheme> will preserve admissibility in
      means.
    </enumerate>
  </theorem>

  <\proof>
    By<nbsp>(<reference|eq:fravgup>, <reference|eq:low.order.cell.avg.update>),
    element means are the same for both low and high order schemes. Thus,
    admissibility in means of one implies the same for other, proving the
    first claim. For the second claim, note that our assumptions imply
    <math|<around|(|u<rsub|j><rsup|e>|)><rsup|L,n+1>> given
    by<nbsp><eqref|eq:low.order.update> is in <math|<Uad>> for
    <math|0\<le\>j\<le\>N> implying admissibility in means property of the
    lower order scheme by<nbsp><eqref|eq:low.order.cell.avg.update> and thus
    admissibility in means for the blended scheme.
  </proof>

  We now explain the procedure of ensuring that the update obtained by the
  lower order scheme will be admissible. The lower order scheme is computed
  with a first order finite volume method or MUSCL-Hancock with slope
  correction from Theorem<nbsp><reference|thm:muscl.admissibility.theorem> so
  that admissibility is already ensured for inner solution points; i.e., we
  already have

  <\equation*>
    <around|(|<bw><rsup|e><rsub|j>|)><rsup|L,n+1>\<in\><Uad>,<space|1em>1\<le\>j\<le\>N-1
  </equation*>

  The remaining admissibility constraints for the first (<math|j=0>) and last
  solution points (<math|j=N>) will be satisfied by appropriately choosing
  the inter-element flux <math|<value|F><rsub|<eph>>>. The first step is to
  choose a candidate for <math|<value|F><rsub|<eph>>> which is heuristically
  expected to give reasonable control on spurious oscillations, i.e.,

  <\equation*>
    <value|F><rsub|<eph>>=<around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsup|<text>>*L*W<rsub|<eph>>+\<alpha\><rsub|<eph>>*f<rsub|<eph>>,<space|1em>\<alpha\><rsub|<eph>>=<frac|\<alpha\><rsub|e>+\<alpha\><rsub|e+1>|2>
  </equation*>

  where <math|f<rsub|<eph>>> is the lower order flux at the face <math|<eph>>
  shared between FR elements and subcells<nbsp>(<reference|eq:fo.at.face>,
  <reference|eq:mh.at.face>), and <math|\<alpha\><rsub|e>> is the blending
  coefficient<nbsp><eqref|eq:blended.scheme> based on element-wise smoothness
  indicator (Section<nbsp><reference|sec:smooth.ind>).

  The next step is to correct <math|<value|F><rsub|<eph>>> to enforce the
  admissibility constraints. The guiding principle of our approach is to
  perform the correction within the face loops, minimizing storage
  requirements and additional memory reads. The lower order updates in
  subcells neighbouring the <math|<eph>> face with the candidate flux are

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|<wide|<bw>|~><rsub|0><rsup|n+1>>|<cell|=<around|(|<bw><rsup|e+1><rsub|0>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|0>*\<Delta\>*x<rsub|e+1>>*<around|(|f<rsup|e+1><rsub|<half>>-<value|F><rsub|<eph>>|)>>>|<row|<cell|<wide|<bw>|~><rsub|N><rsup|n+1>>|<cell|=<around|(|<bw><rsup|e><rsub|N>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|N>*\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-f<rsup|e><rsub|<Nmh>>|)>>>>>
    </eqsplit>

    <label|eq:low.order.tilde.update>
  </equation>

  To correct the interface flux, we will again use the fact that first order
  finite volume method and MUSCL-Hancock with slope correction from
  Theorem<nbsp><reference|thm:muscl.admissibility.theorem> preserve
  admissibility, i.e.,

  <\align*>
    <tformat|<table|<row|<cell|<utilow><rsub|0>>|<cell|=<around|(|<bw><rsup|e+1><rsub|0>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|0>*\<Delta\>*x<rsub|e+1>>*<around|(|f<rsup|e+1><rsub|<half>>-f<rsub|<eph>>|)>\<in\><Uad>>>|<row|<cell|<utilow><rsub|N>>|<cell|=<around|(|<bw><rsup|e><rsub|N>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|N>*\<Delta\>*x<rsub|e>>*<around|(|f<rsub|<eph>>-f<rsup|e><rsub|<Nmh>>|)>\<in\><Uad>>>>>
  </align*>

  Let <math|<around|{|p<rsub|k>,1\<le\>1\<le\>K|}>> be the admissibility
  constraints<nbsp><eqref|eq:uad.form> of the conservation law. The numerical
  flux is corrected by iterating over the admissibility constraints as
  follows

  <vspace|8pt><hrule><vspace|1.5pt> \ 

  <algo-state|<math|<value|F><rsub|<eph>>\<leftarrow\><around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsup|LW><rsub|<eph>>+\<alpha\><rsub|<eph>>*f<rsub|<eph>>>>

  <\algo-for|<math|k>=1:<math|K>>
    <algo-state|<math|\<epsilon\><rsub|0>,\<epsilon\><rsub|N>\<leftarrow\><frac|1|10>*p<rsub|k><around|(|<utilow><rsub|0>|)>,<frac|1|10>*p<rsub|k><around|(|<utilow><rsub|N>|)>>>

    <algo-state|<math|\<theta\>\<leftarrow\>min
    <around*|(|min<rsub|j=0,N><around*|\||<frac|\<epsilon\><rsub|j>-p<rsub|k><around|(|<wide|<bw>|~><rsub|j><rsup|n+1>|)>|p<rsub|k><around|(|<wide|<bw>|~><rsub|j><rsup|<text|low>,n+1>|)>-p<rsub|k><around|(|<wide|<bw>|~><rsub|j><rsup|n+1>|)>>|\|>,1|)>>>

    <algo-state|<math|<value|F><rsub|<eph>>\<leftarrow\>\<theta\>*<value|F><rsub|<eph>>+<around|(|1-\<theta\>|)>*f<rsub|<eph>>>>

    <algo-state|<math|<wide|<bw>|~><rsub|0><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e+1><rsub|0>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|0>*\<Delta\>*x<rsub|e+1>>*<around|(|f<rsup|e+1><rsub|<half>>-<value|F><rsub|<eph>>|)>>>

    <algo-state|<math|<wide|<bw>|~><rsub|N><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e><rsub|N>|)><rsup|n>-<frac|\<Delta\>*t|w<rsub|N>*\<Delta\>*x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-f<rsup|e><rsub|<Nmh>>|)>>>
  </algo-for>

  \ <hrule><vspace|5pt>

  By concavity of <math|p<rsub|k>>, after the <math|k<rsup|th>> iteration,
  the updates computed using flux <math|<value|F><rsub|<eph>>> will satisfy
  for <math|j=0,N>

  <\equation*>
    p<rsub|k><around|(|<wide|<bw>|~><rsub|j><rsup|n+1>|)>=p<rsub|k>*<around|(|\<theta\><around|(|<wide|<bw>|~><rsub|j><rsup|n+1>|)><rsup|prev>+<around|(|1-\<theta\>|)><utilow><rsub|j>|)>\<ge\>\<theta\>*p<rsub|k>*<around|(|<around|(|<wide|<bw>|~><rsub|j><rsup|n+1>|)><rsup|prev>|)>+<around|(|1-\<theta\>|)>*p<rsub|k><around|(|<utilow><rsub|j>|)>\<ge\>\<epsilon\><rsub|j>
  </equation*>

  satisfying the <math|k<rsup|th>> admissibility constraint; here
  <math|<around|(|<wide|<bw>|~><rsub|j><rsup|n+1>|)><rsup|prev>> denotes
  <math|<wide|<bw>|~><rsub|j><rsup|n+1>> before the <math|k<rsup|th>>
  correction and the choice of <math|\<epsilon\><rsub|j>=<frac|1|10>*p<rsub|k><around|(|<utilow><rsub|j>|)>>
  is made following<nbsp><cite|ramirez2021>. After the <math|K> iterations,
  all admissibility constraints will be satisfied and the resulting flux
  <math|<value|F><rsub|<eph>>> will be used as the interface flux keeping the
  lower order updates and thus the element means admissible. Thus, by
  Theorem<nbsp><reference|thm:lwfr.admissibility>, the choice of blended
  numerical flux gives us admissibility preservation in means. We now use the
  scaling limiter of<nbsp><cite|Zhang2010b> to obtain an admissibility
  preserving scheme as defined in Definition<nbsp><reference|defn:adm.pres>,
  an overview of the complete scheme can be found in
  Algorithm<nbsp><reference|alg:high.level.lw>. The above procedure is for
  1-D conservation laws; the extension to 2-D is performed by breaking the
  update into convex combinations of 1-D updates and adding additional time
  step restrictions; the details are given in
  Appendix<nbsp><reference|sec:2d.admissibility>.

  <section|Some implementation details><label|sec:alg>

  In Section<nbsp><reference|sec:admissibility.preservation>, the procedure
  for computing the blended numerical flux to achieve admissibility
  preservation in means for LWFR (Definition<nbsp><reference|defn:mean.pres>)
  was presented. In this section, we present an overview of the complete LWFR
  blended scheme which employs the computed blended flux and the scaling
  limiter of<nbsp><cite|Zhang2010b> to obtain an admissibility preserving
  scheme (Definition<nbsp><reference|defn:adm.pres>) in
  Algorithm<nbsp><reference|alg:high.level.lw>.

  The residual in<nbsp><eqref|eq:blended.scheme> is computed by performing an
  element loop and a face loop, incorporating blending within each of these
  loops. Within the element loop, we compute lower order fluxes on the
  subcell faces not shared by the FR elements. The fluxes for the faces
  shared by FR elements are computed within the face loop, and subsequently
  blended with the LW flux. This approach enables direct computation and use
  of each quantity, without the need for intermediate storage. However, to
  compute<nbsp><eqref|eq:low.order.tilde.update>, admissibility preservation
  requires storage of lower order fluxes <math|f<rsup|e><rsub|<half>>> and
  <math|f<rsup|e><rsub|<Nmh>>>, which are computed during the element loop.

  In Algorithm<nbsp><reference|alg:high.level.lw>, we give a high level
  overview of the LWFR with blending scheme. In practice, some operations
  could be reduced by computing only high or low order residuals in the cases
  where <math|\<alpha\><rsub|e>=0> or <math|\<alpha\><rsub|e>=1>, but we did
  not include this optimization in Algorithm<nbsp><reference|alg:high.level.lw>
  to maintain simplicity in our explanation. The correction procedure of
  numerical flux for admissibility preservation
  (Section<nbsp><reference|sec:admissibility.preservation>) is performed
  within the interface iteration. The contribution of numerical flux to the
  residual is added in a different element loop to avoid race conditions in a
  multi-threaded loop; only one loop would be needed in a serial code. After
  the solution update in Algorithm<nbsp><reference|alg:high.level.lw>, the
  blended flux will ensure that our purely low order update and the element
  means are admissible. However, the updates at solution points need not be
  admissible at this stage and must be corrected. The correction at solution
  points could now be performed as an <with|font-shape|italic|a posteriori>
  modification of the blending coefficients<nbsp><cite|ramirez2021> or using
  the scaling limiter of<nbsp><cite|Zhang2010b>; we use the scaling limiter
  for all results in this work.

  <\specified-algorithm|High-level overview of the Lax-Wendroff with blending
  scheme>
    <label|alg:high.level.lw>

    <\algo-while|<math|t\<less\>T>>
      <algo-state|Compute <math|<around|{|\<alpha\><rsub|e>|}>>
      (Section<nbsp><reference|sec:smooth.ind>)>

      <\algo-for|<math|e> in <with|font-family|tt|eachelement(mesh)>>
        <algo-comment|Assemble element residual> <algo-state|Add LW element
        residual to rhs scaled with <math|1-\<alpha\><rsub|e>>>

        <algo-state|Add FV subcell residual to rhs scaled with
        <math|\<alpha\><rsub|e>>>

        <algo-state|Store <math|f<rsup|e><rsub|<half>>,f<rsup|e><rsub|<Nmh>>><nbsp><eqref|eq:low.order.tilde.update>>
      </algo-for>

      <\algo-for>
        <math|<eph>> in <with|font-family|tt|eachinterface(mesh)>

        <algo-comment|Compute interface flux>
      <|algo-for>
        <algo-state|Compute <math|<value|F><rsub|<eph>><rsup|LW>>,
        <math|f<rsub|<eph>>> and blend them into <math|<value|F><rsub|<eph>>>
        (Section<nbsp><reference|sec:admissibility.preservation>)>
      </algo-for>

      <\algo-for>
        <math|e> in <with|font-family|tt|eachelement(mesh)>

        <algo-comment|Assemble face residual>
      <|algo-for>
        <algo-state|Add contribution of <math|<value|F><rsub|e\<pm\><half>>>
        to high, low order residual scaled with
        <math|1-\<alpha\><rsub|e>,\<alpha\><rsub|e>> respectively>
      </algo-for>

      <algo-state|Update solution>

      <algo-state|Apply positivity correction at solution points using
      <cite|Zhang2010b> or <cite|ramirez2021>>

      <algo-state|<math|t\<leftarrow\>t+\<Delta\>*t>>
    </algo-while>
  </specified-algorithm>

  <section|Numerical results><label|sec:num.results.chblend>

  We perform various tests to show the robustness and accuracy of the
  proposed blending scheme. The LWFR results are always obtained with D2
  dissipation and EA flux<nbsp><cite|babbar2022> with Rusanov's numerical
  flux using Gauss-Legendre solutions point and Radau correction functions.
  All numerical simulations were run with the first order blending
  (Section<nbsp><reference|sec:fo>), MUSCL-Hancock blending
  (Section<nbsp><reference|sec:mh>) and TVB limiter with fine-tuned parameter
  <math|M> plotted with legends FO, MH and TVB-M. We also made comparison
  with the results of first order blending scheme using
  Gauss-Legendre-Lobatto points of<nbsp><cite|henemann2021> implemented in
  <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022>. Our code is
  publically available at<nbsp><cite|tenkai>, and the scripts for reproducing
  results in this work are available at<nbsp><cite|paperrepo>. The user only
  needs to install <with|font-family|tt|Julia> and the remaining dependencies
  are automatically handled by <with|font-family|tt|Julia> environments and
  its package manager.

  <subsection|1-D Euler equations><label|sec:res1dsys.chblend>

  As an example of system of non-linear hyperbolic equations, consider the
  one-dimensional Euler equations of gas dynamics given
  by<nbsp><eqref|eq:1deuler>. Unless specified otherwise, the gas constant
  <math|\<gamma\>> will be taken as <math|1.4> which is the value for air.
  The time step size for polynomial degree <math|N> is computed as

  <\equation>
    \<Delta\>*t=C<rsub|s>*min<rsub|e><around*|(|<frac|\<Delta\>*x<rsub|e>|<around|\||<wide|v|\<bar\>><rsub|e>|\|>+<wide|c|\<bar\>><rsub|e>>|)><text|CFL><around|(|N|)><label|eq:dt.lw>
  </equation>

  where <math|e> is the element index, <math|<wide|v|\<bar\>><rsub|e>,<wide|c|\<bar\>><rsub|e>>
  are velocity and sound speed of element mean in element <math|e>,
  CFL<math|<around|(|N|)>> is the optimal CFL number obtained by Fourier
  stability analysis (Table 1 of<nbsp><cite|babbar2022>) and
  <math|C<rsub|s>\<le\>1> is a safety factor. The admissibility preservation
  of subcell based MUSCL-Hancock imposes a time restriction
  (Theorem<nbsp><reference|thm:muscl.admissibility.theorem>) which depends on
  several quantities other than cell averages, including some evolved
  quantities, see equations<nbsp>(<reference|eq:new.cfl1>,
  <reference|eq:new.cfl2>, <reference|eq:new.cfl3.conservative>). The CFL
  coefficient of MUSCL-Hancock admissibility is also smaller than
  CFL<math|<around|(|N|)>> in<nbsp><eqref|eq:dt.lw>, see
  Remark<nbsp><reference|rmk:mh.restriction.for.fr>. However, we have found
  the time step given by<nbsp><eqref|eq:dt.lw> with <math|C<rsub|s>=0.98> to
  be sufficient for admissibility preservation in all the simulations we have
  performed. Thus, we do not explicitly impose the CFL restrictions in
  Theorem<nbsp><reference|thm:muscl.admissibility.theorem> as they are more
  severe and expensive to compute. If the admissibility is violated in any
  cell, then the time update can be repeated in those cells by lowering the
  time step by some fraction.

  <subsubsection|Shu-Osher problem><label|sec:shuosher.blend>

  This problem was developed in<nbsp><cite|Shu1989> to test the numerical
  scheme's capability to accurately capture a shock wave and its interaction
  with a smooth density field, which then propagates downstream of the shock.
  Here, we compute the solution of<nbsp><eqref|eq:1deuler> up to time
  <math|t=1.8> with initial condition<nbsp><eqref|eq:shuosher> prescribed in
  the domain <math|<around|[|-5,5|]>> with transmissive boundary conditions.
  The smooth density profile passes through the shock and appears on the
  other side, and its accurate computation is challenging due to numerical
  dissipation. Due to presence of both spurious oscillations and smooth
  extremums, this becomes a good test for testing robustness and accuracy of
  limiters. We discretize the spatial domain with 400 cells using polynomial
  degree <math|N=4> and compare blending schemes and TVB limiter with
  parameter <math|M=300><nbsp><cite|Qiu2005b>. The density component of the
  approximate solutions computed for the compared limiters are plotted
  against a reference solution obtained using a very fine mesh, and are given
  in Figure<nbsp>(<reference|fig:ShuOsher>). The three limiters show similar
  performance in Figure<nbsp>(<reference|fig:ShuOsher>a) on the large scale.
  The enlarged plot in Figure<nbsp>(<reference|fig:ShuOsher>b) shows that the
  MUSCL-Hancock blending scheme is able to capture smooth extrema better than
  the first order blending and the TVB scheme.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/shuosher_unzoom|0.45par|||>>|<cell|<image|figures/paper2/euler1d/shuosher|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:ShuOsher.chblend>>|Shu-Osher
  problem, numerical solution with degree <math|N=4> using first order (FO)
  and MUSCL-Hancock (MH) blending schemes, and TVB limited scheme (TVB-300)
  with parameter <math|M=300>. (a) Full and (b) zoomed density profiles of
  numerical solutions are shown up to time <math|t=1.8> on a mesh of 400
  cells.>

  <subsubsection|Blast wave><label|sec:blast.chblend>

  The Euler equations <eqref|eq:1deuler> are solved with the initial
  condition

  <\equation*>
    <around|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|1,0,1000|)>,>|<cell|<text|if
    >x\<less\>0.1>>|<row|<cell|<around|(|1,0,0.01|)>,>|<cell|<text|if
    >0.1\<less\>x\<less\>0.9>>|<row|<cell|<around|(|1,0,100|)>,>|<cell|<text|if
    >x\<gtr\>0.9>>>>>
  </equation*>

  in the domain <math|<around|[|0,1|]>>. This test was originally introduced
  in<nbsp><cite|Woodward1984> to check the capability of the numerical scheme
  to accurately capture the shock-shock interaction scenario. The boundaries
  are set as solid walls by imposing the reflecting boundary conditions at
  <math|x=0> and <math|x=1>. The solution consists of reflection of shocks
  and expansion waves off the boundary wall and several wave interactions
  inside the domain. The numerical solutions are inadmissible if the
  positivity correction is not applied. With a grid of 400 cells using
  polynomial degree <math|N=4>, we run the simulation till the time
  <math|t=0.038> where a high density peak profile is produced. As in the
  previous test, we compare first order (FO) and MUSCL-Hancock (MH) blending
  schemes, and TVB limiter with parameter <math|M=300><nbsp><cite|Qiu2005b>
  (TVB-300). We compare the performance of limiters in
  Figure<nbsp>(<reference|fig:blast>) where the approximated density and
  pressure profiles are compared with a reference solution computed using a
  very fine mesh. Looking at the peak amplitude and contact discontinuity of
  the density profile which is also shown in the zoomed inset, it is clear
  that MUSCL-Hancock blending scheme gives the best resolution, especially
  when compared with the TVB limiter.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/blast|0.45par|||>>|<cell|<image|figures/paper2/euler1d/blast_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:blast.chblend>>|Blast
  wave problem, numerical solution with degree <math|N=4> using first order
  (FO) and MUSCL-Hancock (MH) blending schemes, and TVB limited scheme
  (TVB-300) with parameter <math|M=300>. (a) Density, (b) pressure profiles
  are shown at time <math|t=0.038> on a mesh of 400 cells.>

  <subsubsection|Sedov's blast wave><label|sec:sedov.blast.1d>

  To demonstrate the admissibility preserving property of our scheme, we
  simulate Sedov's blast wave<nbsp><cite|sedov1959>; the test describes the
  explosion of a point-like source of energy in a gas. The explosion
  generates a spherical shock wave that propagates outwards, compressing the
  gas and reaching extreme temperatures and pressures. The problem can be
  formulated in one dimension as a special case, where the explosion occurs
  at <math|x=0> and the gas is confined to the interval
  <math|<around|[|-1,1|]>> by solid walls. For the simulation, on a grid of
  201 cells with solid wall boundary conditions, we use the following initial
  data<nbsp><cite|zhang2012>,

  <\equation*>
    \<rho\>=1,<space|2em>v=0,<space|2em>E<around|(|x|)>=<choice|<tformat|<table|<row|<cell|<frac|3.2\<times\>10<rsup|6>|\<Delta\>*x>,<space|2em>>|<cell|<around|\||x|\|>\<le\><frac|\<Delta\>*x|2>>>|<row|<cell|10<rsup|-12>,<space|2em>>|<cell|<text|otherwise>>>>>>
  </equation*>

  where <math|\<Delta\>*x> is the element width. This is a difficult test for
  positivity preservation because of the high pressure ratios. Nonphysical
  solutions are obtained if the proposed admissibility preservation
  corrections are not applied. The density and pressure profiles at
  <math|t=0.001> are obtained using blending schemes are shown in
  Figure<nbsp><reference|fig:sedov.blast>. Results of TVD limiter are not
  shown as it fails to preserve positivity in this test because the
  admissibility correction of Lax-Wendroff scheme depends on the blended
  numerical flux (Section<nbsp><reference|sec:admissibility.preservation>).

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/sedov_density|0.45par|||>>|<cell|<image|figures/paper2/euler1d/sedov_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:sedov.blast>>|Sedov's
  blast wave problem, numerical solution with degree <math|N=4> using first
  order (FO) and MUSCL-Hancock blending schemes. (a) Density and (b) pressure
  profiles of numerical solutions are plotted at time <math|t=0.001> on a
  mesh of <math|201> cells.>

  <subsubsection|Riemann problems>

  We test two extreme Riemann problems from<nbsp><cite|Zhang2010b> to
  demonstrate admissibility preservation of our scheme. The first is a
  Riemann problem with no shocks and two rarefactions, which move away from
  each other leading to a near vacuum state in the exact solution. The low
  densities make it a challenging test, as the oscillations can easily cause
  negative density values. We run the simulation on the domain
  <math|<around|[|-1,1|]>> with initial data

  <\equation*>
    <around|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|7.0,-1.0,0.2|)>,<space|2em>>|<cell|-1\<le\>x\<le\>0>>|<row|<cell|<around|(|7.0,1.0,0.2|)>,>|<cell|<text|otherwise>>>>>>
  </equation*>

  The results obtained using blending schemes are shown in
  Figure<nbsp><reference|fig:double.rarefaction> on a mesh of <math|200>
  cells with transmissive boundary conditions at time <math|t=0.6>.

  The second test is a 1D Leblanc shock tube problem with initial data

  <\equation*>
    <around|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|2,0,10<rsup|9>|)>,<space|2em>>|<cell|-1\<le\>x\<le\>0>>|<row|<cell|<around|(|0.001,0,1|)>,>|<cell|<text|otherwise>>>>>>
  </equation*>

  The solution has extremely high density and pressure ratios across the
  shock and the numerical solutions give negative pressure if admissibility
  preservation is not applied. The log-scaled results obtained using blending
  schemes are shown in Figure<nbsp><reference|fig:leblanc> at time
  <math|t=0.001> on a mesh of <math|800> cells with transmissive boundary
  conditions.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/double_rarefaction|0.45par|||>>|<cell|<image|figures/paper2/euler1d/double_rarefaction_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:double.rarefaction>>|Double
  rarefaction problem, numerical solution with degree <math|N=4> using first
  order (FO) and MUSCL-Hancock (MH) blending. (a) Density and (b) pressure
  profiles of numerical solutions are plotted at <math|t=0.6> on a mesh of
  <math|200> cells.>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/leblanc|0.45par|||>>|<cell|<image|figures/paper2/euler1d/leblanc_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:leblanc>>|Leblanc's
  test, numerical solution with polynomial degree <math|N=4> using first
  order (FO) and MUSCL-Hancock (MH) blending. (a) Density and (b) pressure
  profiles of numerical solutions with log-scales are plotted at
  <math|t=0.001> on a mesh of <math|800> cells.>

  <section|2-D advection equation>

  We consider the advection equation in two dimensions

  <\equation>
    <label|eq:2dvaradv.chblend>u<rsub|t>+\<nabla\>\<cdot\><around|[|a*<around|(|x,y|)>*u|]>=0
  </equation>

  with a test case from<nbsp><cite|LeVeque1996> where the
  equation<nbsp><eqref|eq:2dvaradv> is solved with a divergence free velocity
  field, <math|a=<around|(|<frac|1|2>-y,x-<frac|1|2>|)>>, and an initial
  condition which consists of a slotted disc, a cone and a smooth hump, given
  as follows

  <\align*>
    <tformat|<table|<row|<cell|u*<around|(|x,y,0|)>>|<cell|=u<rsub|1>*<around|(|x,y|)>+u<rsub|2>*<around|(|x,y|)>+u<rsub|3>*<around|(|x,y|)>,<space|1em><around|(|x,y|)>\<in\><around|[|0,1|]>\<times\><around|[|0,1|]>>>|<row|<cell|u<rsub|1>*<around|(|x,y|)>>|<cell|=<frac|1|4>*<around|(|1+cos
    <around|(|\<pi\>*q<around|(|x,y|)>|)>|)>,<space|1em>q<around|(|x,y|)>=min
    <around|(|<sqrt|<around|(|x-<wide|x|\<bar\>>|)><rsup|2>+<around|(|y-<wide|y|\<bar\>>|)><rsup|2>>,r<rsub|0>|)>/r<rsub|0>,<around|(|<wide|x|\<bar\>>,<wide|y|\<bar\>>|)>=<around|(|0.25,0.5|)>,r<rsub|0>=0.15>>|<row|<cell|u<rsub|2>*<around|(|x,y|)>>|<cell|=<choice|<tformat|<table|<row|<cell|1-<dfrac|1|r<rsub|0>><sqrt|<around|(|x-<wide|x|\<bar\>>|)><rsup|2>+<around|(|y-<wide|y|\<bar\>>|)><rsup|2>>>|<cell|<text|if
    ><around|(|x-<wide|x|\<bar\>>|)><rsup|2>+<around|(|y-<wide|y|\<bar\>>|)><rsup|2>\<le\>r<rsub|0><rsup|2>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>,<space|1em><around|(|<wide|x|\<bar\>>,<wide|y|\<bar\>>|)>=<around|(|0.5,0.25|)>,r<rsub|0>=0.15>>|<row|<cell|u<rsub|3>*<around|(|x,y|)>>|<cell|=<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    ><around|(|x,y|)>\<in\><math-up|C>>>|<row|<cell|0>|<cell|<text|otherwise>>>>>>>>>>
  </align*>

  where <math|<math-up|C>> is a slotted disc with center at
  <math|<around|(|0.5,0.75|)>> and radius of <math|0.15>.

  The characteristics of the PDE are circles and the solution returns to its
  initial state after a period of time <math|t=2*\<pi\>>.
  Figure<nbsp>(<reference|fig:composite.signal.2d>) compares contour plots of
  polynomial solutions obtained using the LWFR method of degree <math|N=4>
  with TVB limiter and a fine-tuned parameter <math|M=100>, and with blending
  limiter and MUSCL-Hancock reconstruction, after one time period. The
  blending limiter with MUSCL-Hancock reconstruction is shown to produce more
  accurate solutions for all three profiles compared to the TVB limiter, as
  the TVB limiter results in greater smearing of the profile. The sharp
  features of slotted disc profile show the most notable improvement.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/la2d/rotate_composite/initial|0.24par|||>>|<cell|<image|figures/paper2/la2d/rotate_composite/tvb|0.24par|||>>|<cell|<image|figures/paper2/la2d/rotate_composite/blend_fo|0.25par|||>>|<cell|<image|figures/paper2/la2d/rotate_composite/blend_mh|0.24par|||>>>|<row|<cell|
  (a) Exact >|<cell|(b) TVB with <math|M=100> >|<cell|(c) FO blending
  >|<cell|(d) MH blending >>>>><label|fig:composite.signal.2d>>|Rotation of a
  composite signal with velocity <math|<math-bf|a>=<around|(|<frac|1|2>-y,x-<frac|1|2>|)>>,
  numerical solution with polynomial degree <math|N=4> on a mesh of
  <math|100<rsup|2>> elements.>

  <section|2-D Euler equations>

  We consider the two-dimensional Euler equations of gas dynamics given
  by<nbsp><eqref|eq:2deuler>. Unless specified otherwise, the adiabatic
  constant <math|\<gamma\>> will be taken as <math|1.4> in the numerical
  tests, which is the typical value for air.

  The time step size for polynomial degree <math|N> is computed as

  <\align>
    <tformat|<table|<row|<cell|\<Delta\>*t=C<rsub|s>*min<rsub|e><around*|(|<frac|<around|\||<wide|u|\<bar\>><rsub|e>|\|>+<wide|c|\<bar\>><rsub|e>|\<Delta\>*x<rsub|e>>+<frac|<around|\||<wide|v|\<bar\>><rsub|e>|\|>+<wide|c|\<bar\>><rsub|e>|\<Delta\>*y<rsub|e>>|)><rsup|-1><text|CFL><around|(|N|)><eq-number><label|eq:time.step.2d>>>>>
  </align>

  where <math|e> is the element index, <math|<around|(|<wide|u|\<bar\>><rsub|e>,<wide|v|\<bar\>><rsub|e>|)>,<wide|c|\<bar\>><rsub|e>>
  are velocity and sound speed of element mean in element <math|e>,
  CFL<math|<around|(|N|)>> is the optimal CFL number obtained by Fourier
  stability analysis (Table 1 of<nbsp><cite|babbar2022>) and
  <math|C<rsub|s>\<le\>1> is a safety factor. As in the 1-D
  case,<nbsp><eqref|eq:time.step.2d> will not guarantee that the time step
  restriction for admissibility of MUSCL-Hancock scheme on the subcells is
  satisfied. However, we have found all tests to work
  with<nbsp><eqref|eq:time.step.2d> using <math|C<rsub|s>=0.98> and the
  results are shown with that safety factor unless otherwise specified.

  For verification of numerical results and to demonstrate the accuracy gain
  of our proposed Lax-Wendroff blending scheme with MUSCL-Hancock
  reconstruction using Gauss-Legendre points, we will compare our results
  with the first order blending scheme using Gauss-Legendre-Lobatto (GLL)
  points of<nbsp><cite|henemann2021> available in
  <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022>. Both solvers use
  the same time step sizes in all results. We have also performed experiments
  using LWFR with first order blending scheme and Gauss-Legendre (GL) points,
  and observed lower accuracy than the MUSCL-Hancock blending scheme, but
  higher accuracy than the first order blending scheme implementation of
  <with|font-family|tt|Trixi.jl> using GLL points. These results are expected
  since GL points and quadrature are more accurate than GLL points, and
  MUSCL-Hancock is also more accurate than first order finite volume method.
  However, to save space, we have not presented the results of LWFR with
  first order blending.

  <subsection|Isentropic vortex convergence test>

  This problem<nbsp><cite|Yee1999|Spiegel2016> consists of a vortex that
  advects at a constant velocity while the entropy is constant in both space
  and time. The initial condition is given by

  <\equation*>
    \<rho\>=<around*|[|1-<frac|\<beta\><rsup|2>*<around|(|\<gamma\>-1|)>|8*\<gamma\>*\<pi\><rsup|2>>*exp
    <around|(|1-r<rsup|2>|)>|]><rsup|<frac|1|\<gamma\>-1>>,<space|2em>u=M<rsub|\<infty\>>*cos
    \<alpha\>-<frac|\<beta\>*<around|(|y-y<rsub|c>|)>|2*\<pi\>>*exp
    <around*|(|<frac|1-r<rsup|2>|2>|)>
  </equation*>

  <\equation*>
    v=M<rsub|\<infty\>>*sin \<alpha\>+<frac|\<beta\>*<around|(|x-x<rsub|c>|)>|2*\<pi\>>*exp
    <around*|(|<frac|1-r<rsup|2>|2>|)>,<space|2em>r<rsup|2>=<around|(|x-x<rsub|c>|)><rsup|2>+<around|(|y-y<rsub|c>|)><rsup|2>
  </equation*>

  and the pressure is given by <math|p=\<rho\><rsup|\<gamma\>>>. We choose
  the parameters <math|\<beta\>=5>, <math|M<rsub|\<infty\>>=0.5>,
  <math|\<alpha\>=45<rsup|o>>, <math|<around|(|x<rsub|c>,y<rsub|c>|)>=<around|(|0,0|)>>
  and the domain is taken to be <math|<around|[|-10,10|]>\<times\><around|[|-10,10|]>>
  with periodic boundary conditions. For this configuration, the vortex
  returns to its initial position after a time interval of
  <math|T=20*<sqrt|2>/M<rsub|\<infty\>>> units. We run the computations up to
  a time <math|t=T> when the vortex has crossed the domain once in the
  diagonal direction. Figure<nbsp>(<reference|fig:isentropic.convergence>a)
  compares the <math|L<rsup|2>> error of density sampled at <math|N+3>
  equispaced points against grid resolution when using the blending limiter.
  It can be seen that the limiter does not activate for adequately high
  resolution, yielding the same optimal convergence rates as those achieved
  without the limiter, as shown in Figure<nbsp>(<reference|fig:isentropic.convergence>b).

  <\big-figure>
    <padded-center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/isentropic_convergence_ndofs_blend|0.45par|||>>|<cell|<image|figures/paper2/euler2d/isentropic_convergence_ndofs_no_limiter|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>>

    <label|fig:isentropic.convergence.chblend>
  </big-figure|Convergence analysis of isentropic vortex test for polynomial
  degrees <math|N=3,4> when (a) the blending limiter is active (b) no limiter
  is active.>

  <subsection|2-D Riemann problem>

  2-D Riemann problems consist of four constant states and have been studied
  theoretically and numerically for gas dynamics in<nbsp><cite|Glimm1985>. We
  consider this problem in the square domain <math|<around|[|0,1|]><rsup|2>>
  where each of the four quadrants has one constant initial state and every
  jump in initial condition leads to an elementary planar wave, i.e., a
  shock, rarefaction or contact discontinuity. There are only 19 such
  genuinely different configurations possible<nbsp><cite|Zhang1990|Lax1998>.
  As studied in<nbsp><cite|Zhang1990>, a bounded region of subsonic flows is
  formed by interaction of different planar waves leading to appearance of
  many complex structures depending on the elementary planar flow. We
  consider configuration 12 of<nbsp><cite|Lax1998> consisting of 2 positive
  slip lines and two forward shocks, with initial condition

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|0.5313,0,0,0.4|)><space|2em>>|<cell|<text|if
    >x\<ge\>0.5,y\<ge\>0.5>>|<row|<cell|<around|(|1,0.7276,0,1|)>>|<cell|<text|if
    >x\<less\>0.5,y\<ge\>0.5>>|<row|<cell|<around|(|0.8,0,0,1|)>>|<cell|<text|if
    >x\<less\>0.5,y\<less\>0.5>>|<row|<cell|<around|(|1,0,0.7276,1|)>>|<cell|<text|if
    >x\<ge\>0.5,y\<less\>0.5>>>>>
  </equation*>

  The simulations are performed with transmissive boundary conditions on an
  enlarged domain. The density profiles obtained from the MUSCL-Hancock
  blending scheme and <with|font-family|tt|Trixi.jl> are shown in
  Figure<nbsp>(<reference|fig:rp2d>). We see that both schemes give similar
  resolution in most regions. The MUSCL-Hancock blending scheme gives better
  resolution of the small scale structures arising across the slip lines.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/rp2d/trixi|0.45par|||>>|<cell|<image|figures/paper2/euler2d/rp2d/lwfr|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b) LW-MH>>>>><label|fig:rp2d>>|2-D
  Riemann problem, density plots of numerical solution at <math|t=0.25> for
  degree <math|N=4> on a <math|256\<times\>256> mesh.>

  <subsection|Double Mach reflection><label|sec:dmr>

  This test case was originally proposed by Woodward and
  Colella<nbsp><cite|Woodward1984> and consists of a shock impinging on a
  wedge/ramp which is inclined by 30 degrees. The solution consists of a self
  similar shock structure with two triple points. By a change of coordinates,
  the situation is simulated in the rectangular domain
  <math|\<Omega\>=<around|[|0,4|]>\<times\><around|[|0,1|]>>, where the
  wedge/ramp is positioned at <math|x=1/6,y=0>. Defining
  <math|<math-bf|u><rsub|b>=<math-bf|u><rsub|b><around|(|x,y,t|)>> with
  primitive variables given by

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|8,8.25*cos
    <around*|(|<frac|\<pi\>|6>|)>,-8.25*sin
    <around*|(|<frac|\<pi\>|6>|)>,116.5|)>,>|<cell|<text|if
    >x\<less\><frac|1|6>+<frac|y+20*t|<sqrt|3>>>>|<row|<cell|<around|(|1.4,0,0,1|)>,>|<cell|<text|if
    >x\<gtr\><frac|1|6>+<frac|y+20*t|<sqrt|3>>>>>>>
  </equation*>

  we define the initial condition to be <math|<math-bf|u><rsub|0><around|(|x,y|)>=<math-bf|u><rsub|b><around|(|x,y,0|)>>.
  With <math|<math-bf|u><rsub|b>>, we impose inflow boundary conditions at
  the left side <math|<around|{|0|}>\<times\><around|[|0,1|]>>, outflow
  boundary conditions both at <math|<around|[|0,1/6|]>\<times\><around|{|0|}>>
  and <math|<around|{|4|}>\<times\><around|[|0,1|]>>, reflecting boundary
  conditions at <math|<around|[|1/6,4|]>\<times\><around|{|0|}>> and inflow
  boundary conditions at the upper side <math|<around|[|0,4|]>\<times\><around|{|1|}>>.

  The simulation is run on a mesh of <math|600\<times\>150> elements using
  degree <math|N=4> polynomials upto time <math|t=0.2>. In
  Figure<nbsp>(<reference|fig:dmr>), we compare the results of
  <with|font-family|tt|Trixi.jl> with the MUSCL-Hancock blended scheme zoomed
  near the primary triple point. As expected, the small scale structures are
  captured better by the MUSCL-Hancock blended scheme.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/dmr/trixi_zoomed|0.4par|||>>|<cell|mh_zoomed>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b) LW-MH>>>>><label|fig:dmr>>|Double
  Mach reflection problem, density plots of numerical solution at
  <math|t=0.2> using polynomial degree <math|N=4> on a <math|600\<times\>150>
  mesh zoomed near the primary triple point. >

  <subsection|Kelvin-Helmholtz instability>

  Fluid instabilities are essential for mixing processes and turbulence
  production, and play a significant role in many astrophysical phenomena.
  They are crucial for accurately modeling stripping of gas from satellite
  galaxies, as well as calculating the expected levels of turbulence and
  entropy in the intracluster gas of galaxy clusters<nbsp><cite|Volker2010>.
  The Kelvin-Helmholtz instability is a common fluid instability that occurs
  across contact discontinuities in the presence of a tangential shear flow.
  This instability leads to the formation of vortices that grow in amplitude
  and can eventually lead to the onset of turbulence. We adopt the initial
  conditions for this instability from<nbsp><cite|Volker2010>,

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<rho\>*<around|(|x,y|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|2,<space|1em>>|<cell|<text|if><space|1em>0.25\<less\>y\<less\>0.75>>|<row|<cell|1,<space|1em>>|<cell|<text|otherwise>>>>>>>>|<row|<cell|u*<around|(|x,y|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0.5,<space|1em>>|<cell|<text|if><space|1em>0.25\<less\>y\<less\>0.75>>|<row|<cell|-0.5,<space|1em>>|<cell|<text|otherwise>,>>>>>>>|<row|<cell|v<around|(|x,y|)>>|<cell|=>|<cell|w<rsub|0>*sin
    <around|(|4*\<pi\>*x|)>*<around*|{|exp
    <around*|[|-<frac|<around|(|y-0.25|)><rsup|2>|2*\<sigma\><rsup|2>>|]>+exp
    <around*|[|-<frac|<around|(|y-0.75|)><rsup|2>|2*\<sigma\><rsup|2>>|]>|}>>>|<row|<cell|p*<around|(|x,y|)>>|<cell|=>|<cell|2.5>>>>
  </eqnarray*>

  with <math|w<rsub|0>=0.1>, <math|\<sigma\>=0.05/<sqrt|2>> and the adiabatic
  index <math|\<gamma\>=7/5> corresponding to diatomic gases. The initial
  conditions consist of a single strongly excited mode in the <math|y>
  velocity concentrated near the interfaces. The wavelength is chosen to be
  equal to half the domain size so that the single mode dominates the linear
  growth of instability. This instability leads to shearing and small scale,
  self-similar vortex structures. We run this test using solution polynomial
  degree <math|N=4> on a mesh of <math|256<rsup|2>> elements with periodic
  boundary conditions. We compare the density profiles of
  <with|font-family|tt|Trixi.jl> and our MUSCL-Hancock blending scheme in
  Figure<nbsp>(<reference|fig:kh>). The presence of more vortex structures
  with the MUSCL-Hancock scheme suggests that the scheme has lesser
  dissipation errors and is capable of capturing small scale features.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|trixi>|<cell|<image|figures/paper2/euler2d/kh_schaal/lwfr|0.44par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>><label|fig:kh>>|Kelvin-Helmholtz instability, density plots of
  numerical solution at <math|t=0.4> using polynomial degree <math|N=4> with
  Rusanov flux on a <math|256<rsup|2>> element mesh.>

  <subsection|Astrophysical jet>

  In this test, a hypersonic jet is injected into a uniform medium with a
  Mach number of 2000 relative to the sound speed in the medium.
  Following<nbsp><cite|ha2005|zhang2010c>, the domain is taken to be
  <math|<around|[|0,1|]>\<times\><around|[|-0.5,0.5|]>>, the ambient gas in
  the interior has state <math|\<b-u\><rsub|a>> defined in primitive
  variables as

  <\equation*>
    <around|(|\<rho\>,u,v,p|)><rsub|a>=<around|(|0.5,0,0,0.4127|)>
  </equation*>

  and inflow state <math|\<b-u\><rsub|j>> is defined in primitive variables
  as

  <\equation*>
    <around|(|\<rho\>,u,v,p|)><rsub|j>=<around|(|5,800,0,0.4127|)>
  </equation*>

  On the left boundary, we impose the boundary conditions

  <\equation*>
    \<b-u\><rsub|b>=<choice|<tformat|<table|<row|<cell|\<b-u\><rsub|a>,>|<cell|<space|1em><text|if><space|1em>y\<in\><around|[|-0.05,0.05|]>>>|<row|<cell|\<b-u\><rsub|j>,>|<cell|<space|1em><text|otherwise>>>>>>
  </equation*>

  and outflow conditions on the right, top and bottom. The HLLC numerical
  flux was used in the left most cells to distinguish between characteristics
  entering and exiting the domain. To get better resolution of vortices, we
  used a smaller time step with <math|C<rsub|s>=0.5>
  in<nbsp><eqref|eq:time.step.2d> and included ghost elements in time step
  computation to handle the cold start. The high velocity makes the kinetic
  energy much higher than internal energy. Thus, it is very likely for
  numerical solvers to give negative pressures. At the same time, a
  Kelvin-Helmholtz instability arises before the bow shock. Thus, it is a
  good test both for admissibility preservation and capturing small scale
  structures. The simulation gives negative pressures if used without the
  proposed admissibility preservation techniques. While the large scale
  structures are captured similarly by both the schemes as seen in
  Figure<nbsp><reference|fig:astrophysical.jet>, the LWFR with MH blending
  scheme shows more small scales near the front of the jet.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/M2000/trixi|0.45par|||>>|<cell|<space|2em><image|figures/paper2/euler2d/M2000/lwfr|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>><label|fig:astrophysical.jet>>|Mach 2000 astrophysical jet,
  density plot of numerical solution in log scales on <math|400\<times\>400>
  mesh at time <math|t=0.001>.>

  <subsection|Sedov's blast case with periodic boundary conditions>

  Similar to Sedov's blast test in Sections<nbsp><reference|sec:sedov.blast.1d>
  this test from<nbsp><cite|ramirez2021> on domain
  <math|<around|[|-1.5,1.5|]><rsup|2>> has energy concentrated at the origin.
  More precisely, for the initial condition, we assume that the gas is at
  rest (<math|u=v=0>) with Gaussian distribution of density and pressure

  <\equation>
    \<rho\>*<around|(|x,y|)>=\<rho\><rsub|0>+<frac|1|4*\<pi\>*\<sigma\><rsub|\<rho\>><rsup|2>>*exp
    <around*|(|-<frac|r<rsup|2>|2*\<sigma\><rsub|\<rho\>><rsup|2>>|)>,<space|2em>p*<around|(|x,y|)>=p<rsub|0>+<frac|\<gamma\>-1|4*\<pi\>*\<sigma\><rsub|p><rsup|2>>*exp
    <around*|(|-<frac|r<rsup|2>|2*\<sigma\><rsub|p><rsup|2>>|)>,<space|2em>r<rsup|2>=x<rsup|2>+y<rsup|2>
  </equation>

  where <math|\<sigma\><rsub|\<rho\>>=0.25> and
  <math|\<sigma\><rsub|p>=0.15>. The ambient density and ambient pressure are
  set to <math|\<rho\><rsub|0>=1>, <math|p<rsub|0>=10<rsup|-5>>. There are
  two differences in this Sedov's test compared to the previous - the energy
  concentrated at the origin is lesser, and domain is assumed to be periodic.
  When shocks collide at the periodic boundaries, the resulting interaction
  leads to the formation of small scale structures. In
  Figure<nbsp>(<reference|fig:blast.periodic>), we compare the density
  profiles of the numerical solutions of polynomial degree <math|N=4> on a
  mesh of <math|64<rsup|2>> elements using <with|font-family|tt|Trixi.jl> and
  the proposed MUSCL-Hancock blending scheme in log scales. Looking at the
  reference solution on a finer <math|128<rsup|2>> element mesh
  (Figure<nbsp><reference|fig:blast.periodic.reference>), we see that the
  MUSCL-Hancock scheme resolves the small scale structures better.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/sedov_gassner/reference_t2|0.45par|||>>|<cell|<space|2em><image|figures/paper2/euler2d/sedov_gassner/reference|0.45par|||>>>|<row|<cell|(a)
  <math|t=2>>|<cell|(b) <math|t=20>>>>>><label|fig:blast.periodic.reference>>|Sedov's
  blast test with periodic domain, density plot of numerical solution on
  <math|128\<times\>128> mesh in log scales with degree <math|N=4> at (a)
  <math|t=2> and (b) <math|t=20> with polynomial degree <math|N=4> computed
  using <with|font-family|tt|Trixi.jl>.>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/sedov_gassner/trixi|0.45par|||>>|<cell|<space|2em><image|figures/paper2/euler2d/sedov_gassner/lwfr|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>><label|fig:blast.periodic>>|Sedov's blast test with periodic
  domain, density plot of numerical solution on <math|64\<times\>64> mesh in
  log scales at <math|t=20> with degree <math|N=4>.>

  <subsection|Detonation shock diffraction>

  This test<nbsp><cite|Takayama1991> involves a planar detonation wave that
  interacts with a wedge-shaped corner and diffracts around it, resulting in
  a complicated wave pattern comprising of transmitted and reflected shocks,
  as well as rarefaction waves. The computational domain is
  <math|\<Omega\>=<around|[|0,2|]><rsup|2>\<setminus\><around|(|<around|[|0,0.5|]>\<times\><around|[|0,1|]>|)>>
  and following<nbsp><cite|henemann2021>, the simulation is performed by
  taking the initial condition to be a pure right-moving shock with Mach
  number of 100 initially located at <math|x=0.5> and travelling through a
  channel of resting gas. The post shock states are computed by normal
  relations<nbsp><cite|naca1951>, so that the initial data is

  <alignat*|2|<tformat|<table|<row|<cell|\<rho\>*<around|(|x,y|)>>|<cell|=<choice|<tformat|<table|<row|<cell|5.9970,<space|2em>>|<cell|<text|if
  >x\<le\>0.5>>|<row|<cell|1,>|<cell|<text|if
  >x\<gtr\>0.5>>>>>,<space|2em>>|<cell|>|<cell|u*<around|(|x,y|)>=<choice|<tformat|<table|<row|<cell|98.5914,<space|2em>>|<cell|<text|if
  >x\<le\>0.5>>|<row|<cell|0,>|<cell|<text|if
  >x\<gtr\>0.5>>>>>>>|<row|<cell|v<around|(|x,y|)>>|<cell|=0,<space|2em>>|<cell|>|<cell|p*<around|(|x,y|)>=<choice|<tformat|<table|<row|<cell|11666.5,<space|2em>>|<cell|<text|if
  >x\<le\>0.5>>|<row|<cell|1,>|<cell|<text|if >x\<gtr\>0.5>>>>>>>>>>

  The left boundary is set as inflow and right boundary is set as outflow,
  all other boundaries are solid walls. The numerical results at
  <math|t=0.01> with polynomial degree <math|N=4> on a a Cartesian grid
  consisting of uniformly sized squares with
  <math|\<Delta\>*x=\<Delta\>*y=1/200> are shown in
  Figure<nbsp>(<reference|fig:shock.diffraction>). The results look similar
  to<nbsp><cite|henemann2021>; the strong shock makes this a tough test for
  the admissibility preservation and negative pressure values are obtained if
  the proposed admissibility correction is not applied.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/shock_diffraction/shock_diffraction_density_no_contour|0.4par|||>>|<cell|<space|2em>shock_diffraction_mach_no_contour.pdf>>|<row|<cell|(a)
  Density>|<cell|(b) Mach number>>>>><label|fig:shock.diffraction>>|Shock
  diffraction test, numerical solution at time <math|t=0.01> with degree
  <math|N=4>.>

  <subsection|Forward facing step>

  Forward facing step is a classical test case
  from<nbsp><cite|emery1968|Woodward1984> where a uniform supersonic flow
  passes through a channel with a forward facing step generating several
  phenomena like a strong bow shock, shock reflections and a Kelvin-Helmholtz
  instability. It is a good test for demonstrating a shock capturing scheme's
  capability of capturing small scale vortex structures while suppressing
  spurious oscillations arising from shocks. The step is simulated by taking
  the domain to be <math|\<Omega\>=<around|(|<around|[|0,3|]>\<times\><around|[|0,1|]>|)>\<setminus\><around|(|<around|[|0.6,3|]>\<times\><around|[|0,0.2|]>|)>>
  and the initial conditions are taken to be

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around|(|1.4,3,0,1|)>
  </equation*>

  The initial conditions are taken to be constant over the whole domain
  <math|\<Omega\>>. The left boundary condition is taken as an inflow and the
  right one is an outflow, the rest are solid walls. The corner
  <math|<around|(|0.6,0.2|)>> of the step is the center of a rarefaction fan
  and is thus a singular point leading to formation of a spurious boundary
  layer. The modern treatment of this issue is to use a more refined mesh
  near the corner point. Since we only have a Cartesian mesh, we obtain the
  same outcome by forming 1-D meshes in <math|<around|[|0,1|]>,<around|[|0,3|]>>
  with the same grid spacing <math|\<Delta\>x<rsub|max>> away from the
  singularity and the smaller grid spacing
  <math|\<Delta\>*x<rsub|min>=<frac|1|4>*\<Delta\>*x<rsub|max>> in
  <math|<around|[|0.15,0.25|]>,<around|[|0.45,0.75|]>>. Then, the 2-D mesh is
  formed by taking a tensor product of the two 1-D meshes with cells from
  <math|<around|[|0.6,3|]>\<times\><around|[|0.2,1|]>> removed. We show the
  density profile of numerical solutions in
  Figure<nbsp><reference|fig:forward.step> for degree <math|N=4> for various
  refinement levels. The scheme captures both the shock and the small scale
  vortices. The corner point singularity causes an artificial boundary layer
  and Mach stem to occur but these numerical artifacts decrease as we refine
  the mesh.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/forward_step/color_bar.png|0.5par|||>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/dy40.png|0.6par|||>>>|<row|<cell|(a)
  <math|\<Delta\>*x<rsub|max>=1/40>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/dy80.png|0.6par|||>>>|<row|<cell|(b)
  <math|\<mathLaplace\>x<rsub|max>=1/80>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/dy160.png|0.6par|||>>>|<row|<cell|(c)
  <math|\<Delta\>*x<rsub|max>=1/160>>>>>><label|fig:forward.step>>|Forward
  facing step, density plots of numerical solution at time <math|t=3.0>. The
  meshes are formed by taking grid spacing
  <math|\<Delta\>x<rsub|max>=\<Delta\>y<rsub|max>> away from the corner and
  smaller grid spacing <math|\<Delta\>x<rsub|min>=\<Delta\>y<rsub|min>=<frac|1|4>*\<Delta\>x<rsub|max>>
  near the corner.>

  \;

  <section|Summary and conclusions><label|sec:sum.blend>

  An admissibility preserving subcell-based blending limiter for the
  high-order Lax-Wendroff Flux Reconstruction (LWFR) scheme has been
  constructed by extending the LWFR scheme proposed in<nbsp><cite|babbar2022>
  using the blending limiter of<nbsp><cite|henemann2021>. The scheme uses a
  smoothness indicator to blend two single-stage solvers on the FR grid, one
  based on the high-order LWFR method and the other based on a finite volume
  update on the subcells. At the FR element interfaces, a
  <with|font-shape|italic|blended numerical flux> is constructed using the
  Lax-Wendroff time averaged flux and lower order numerical flux. The same
  blended numerical flux is used by both schemes at the element interfaces to
  maintain conservation. The crucial observation used for obtaining
  admissibility preservation was that admissibility preservation in means is
  a consequence of admissibility of the lower order updates. A simple and
  efficient procedure to obtain admissibility preservation in means was thus
  proposed, where lower-order updates are made admissible by appropriately
  constructing the blending numerical flux within the face loop. This
  approach eliminates the need for additional element or interface loops,
  minimizing storage requirements. The user only needs to provide the
  admissibility constraints <math|<around|{|p<rsub|k>,k=1,\<ldots\>,K|}>>
  which are concave functions of the conservative variables and whose
  positivity implies that the solution is in the admissibility set
  <math|<Uad>>, making the correction problem-independent. Once admissibility
  preservation in means is obtained, we use the scaling limiter
  of<nbsp><cite|zhang2010c> to enforce admissibility of the polynomial
  values. To enhance accuracy, we modified the blending scheme
  of<nbsp><cite|henemann2021> to use Gauss-Legendre solution points and used
  the second-order MUSCL-Hancock scheme to compute the lower-order residual.
  We extended the slope restriction criterion of<nbsp><cite|Berthon2006> for
  admissibility of the MUSCL-Hancock scheme to non-cell-centered grids that
  arise in the blending scheme to maintain the conservation property. We also
  proposed a problem-independent procedure to enforce the slope restriction.
  The scheme is robust and the higher resolution of MUSCL-Hancock is more
  superior in capturing small scale structures, as was demonstrated by
  numerical experiments on compressible Euler equations.

  <appendix|Admissibility of MUSCL-Hancock scheme for general
  grids><label|sec:muscl.admissibility.proof>

  For the conservation law<nbsp><eqref|eq:con.law>, define
  <math|\<sigma\><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>> as

  <\equation*>
    \<sigma\><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>=max
    <around|{|\<rho\><around|(|<ff><rprime|'><around|(|<bw><rsub|\<lambda\>>|)>|)>:<bw><rsub|\<lambda\>>=\<lambda\>*<bw><rsub|1>+<around|(|1-\<lambda\>|)>*<bw><rsub|2>,<space|1em>0\<le\>\<lambda\>\<le\>1|}>
  </equation*>

  where <math|\<rho\><around|(|A|)>> denotes the spectral radius of matrix
  <math|A>. For the 2-D hyperbolic conservation law

  <\equation>
    <label|eq:2d.hyp.con.law><bw><rsub|t>+<ff><rsub|x>+<value|fg><rsub|y>=<value|bzero>
  </equation>

  where <math|<around|(|<value|pf>,<value|pg>|)>> are Cartesian components of
  the flux vector; the wave speed estimates in <math|x,y> directions are
  defined as follows

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|\<sigma\><rsub|x><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>=max
    <around|{|\<rho\><around|(|<ff><rprime|'><around|(|<bw><rsub|\<lambda\>>|)>|)>:<bw><rsub|\<lambda\>>=\<lambda\>*<bw><rsub|1>+<around|(|1-\<lambda\>|)>*<bw><rsub|2>,<space|1em>0\<le\>\<lambda\>\<le\>1|}>>>|<row|<cell|\<sigma\><rsub|y><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>=max
    <around|{|\<rho\><around|(|<value|fg><rprime|'><around|(|<bw><rsub|\<lambda\>>|)>|)>:<bw><rsub|\<lambda\>>=\<lambda\>*<bw><rsub|1>+<around|(|1-\<lambda\>|)>*<bw><rsub|2>,<space|1em>0\<le\>\<lambda\>\<le\>1|}>>>>>>
  </equation*>

  We assume that the admissible set <math|<Uad>> of the conservation law is a
  convex subset of <math|<re><rsup|d>> which can be written
  as<nbsp><eqref|eq:uad.form>. The following assumption is made concerning
  the admissibility of first order finite volume scheme.

  <paragraph|Admissibility of first order finite volume scheme.>Under the
  time step restriction

  <\equation>
    <label|eq:numflux.admissibility.cfl>max<rsub|j>
    <frac|\<Delta\>t|\<Delta\>x<rsub|j>>*\<sigma\><around|(|<bw><rsub|j>,<bw><rsub|j+1>|)>\<le\>1
  </equation>

  the first order finite volume method

  <\equation*>
    <bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|j>>*<around*|(|<ff><around|(|<bw><rsub|j><rsup|n>,<bw><rsub|j+1><rsup|n>|)>-<ff><around|(|<bw><rsub|j-1><rsup|n>,<bw><rsub|j><rsup|n>|)>|)>
  </equation*>

  is admissibility preserving, i.e., <math|<bw><rsub|j><rsup|n>\<in\><Uad>>
  for all <math|j> implies that <math|<bw><rsub|j><rsup|n+1>\<in\><Uad>> for
  all <math|j>.

  <section|Review of MUSCL-Hancock scheme>

  Here we review the MUSCL-Hancock scheme for general uniform grids that need
  not be cell-centered (Figure<nbsp>(<reference|fig:general.grid>)) in the
  sense that

  <\equation>
    <label|eq:non.cell.centred.defn>x<rsub|<jph>>-x<rsub|j>\<ne\>x<rsub|j>-x<rsub|<jmh>>,
  </equation>

  for some <math|j> where <math|x<rsub|j>> is the solution point in finite
  volume element <math|<around|(|x<rsub|<jmh>>,x<rsub|<jph>>|)>>. The grid
  used in the blending limiter (Figure<nbsp><reference|fig:subcells>) is a
  special case of<nbsp><eqref|eq:non.cell.centred.defn>.

  <\big-figure>
    <padded-center|<image|illustrations/non_cell_centred_grid|0.7par|||><label|fig:general.grid>>
  </big-figure|Non-uniform, non-cell-centered finite volume grid>

  For the <math|j<rsup|th>> finite volume element
  <math|<around|(|x<rsub|j-<frac|1|2>>,x<rsub|j+<frac|1|2>>|)>>, the constant
  state is denoted <math|<bw><rsub|j><rsup|n>> and the linear approximation
  will be denoted <math|<br><rsup|n><rsub|j><around|(|x|)>>. For conservative
  reconstruction, the linear reconstruction is given by

  <\equation*>
    <br><rsub|j><rsup|n><around|(|x|)>=<bw><rsub|j><rsup|n>+<around|(|x-x<rsub|j>|)><slope><rsub|j>,<space|2em>x\<in\><around*|(|x<rsub|j-<frac|1|2>>,x<rsub|j+<frac|1|2>>|)>
  </equation*>

  The values on left and right faces will be computed as

  <\equation>
    <label|eq:reconstruction.general><bw><rsup|n,-><rsub|j>=<bw><rsub|j><rsup|n>+<around|(|x<rsub|<jmh>>-x<rsub|j>|)>*<slope><rsub|j>,<space|2em><bw><rsub|j><rsup|n,+>=<bw><rsub|j>+<around|(|x<rsub|j+<half>>-x<rsub|j>|)>*<slope><rsub|j>
  </equation>

  We use Taylor's expansion to evolve the solution to
  <math|t<rsub|n>+<half>*\<Delta\>t>

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<bw><rsub|j><rsup|<nph>,->>|<cell|=>|<cell|<bw><rsub|j><rsup|n,->-<frac|\<Delta\>*t|2*\<Delta\>*x<rsub|j>>*<around|(|f<around|(|<bw><rsub|j><rsup|n,+>|)>-f<around|(|<bw><rsub|j><rsup|n,->|)>|)>>>|<row|<cell|<bw><rsub|j><rsup|<nph>,+>>|<cell|=>|<cell|<bw><rsub|j><rsup|n,+>-<frac|\<Delta\>*t|2*\<Delta\>*x<rsub|j>>*<around|(|f<around|(|<bw><rsub|j><rsup|n,+>|)>-f<around|(|<bw><rsub|j><rsup|n,->|)>|)>>>>>><label|eq:evolution.general>
  </equation>

  where <math|\<Delta\>*x<rsub|j>=x<rsub|<jph>>-x<rsub|<jmh>>>. The final
  update is performed by using an approximate Riemann solver on the evolved
  quantities

  <\equation>
    <bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|j>>*<around*|(|<ff><rsub|j+<frac|1|2>><rsup|n+<frac|1|2>>-<ff><rsup|n+<frac|1|2>><rsub|j-<frac|1|2>>|)><label|eq:muscl.final.general>
  </equation>

  where

  <\equation*>
    <ff><rsub|j+<frac|1|2>><rsup|n+<frac|1|2>>=<ff><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,+>,<bw><rsub|j+1><rsup|n+<frac|1|2>,->|)>
  </equation*>

  is some numerical flux function. The key idea of the proof is to write the
  evolution <math|<bw><rsub|j><rsup|<nph>,\<pm\>>>
  from<nbsp><eqref|eq:evolution.general> as a convex combination of exact
  solution of some Riemann problem and the final update
  <math|<bw><rsub|j><rsup|n+1>> from<nbsp><eqref|eq:muscl.final.general> as a
  convex combination of first order finite volume updates on appropriately
  chosen subcells.

  <section|Primary generalization for proof>

  For the uniform, cell-centered case, Berthon<nbsp><cite|Berthon2006>
  defined <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> to satisfy

  <\equation*>
    <frac|1|2>*<bw><rsub|j><rsup|n,->+<bw><rsub|j><rsup|\<ast\>,\<pm\>>+<frac|1|2>*<bw><rsub|j><rsup|n,+>=2*<bw><rsub|j><rsup|n,\<pm\>>
  </equation*>

  We generalize it for non-cell centred grids<nbsp><eqref|eq:non.cell.centred.defn>

  <\equation*>
    <mum><bw><rsub|j><rsup|n,->+<bw><rsub|j><rsup|\<ast\>,\<pm\>>+<mup><bw><rsub|j><rsup|n,+>=2*<bw><rsub|j><rsup|n,\<pm\>>
  </equation*>

  where

  <\equation>
    <label|eq:mu.pm><mum>=<frac|x<rsub|<jph>>-x<rsub|j>|x<rsub|<jph>>-x<rsub|<jmh>>>,<space|2em><mup>=<frac|x<rsub|j>-x<rsub|<jmh>>|x<rsub|<jph>>-x<rsub|<jmh>>>
  </equation>

  This choice was made to keep the natural extension of
  <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> in the conservative reconstruction
  case:

  <\equation*>
    <bw><rsub|j><rsup|\<ast\>,\<pm\>>=<bw><rsub|j><rsup|n>+2*<around|(|x<rsub|j\<pm\><frac|1|2>>-x<rsub|j>|)><slope><rsub|j>
  </equation*>

  noting that <math|<bw><rsub|j><rsup|n,\<pm\>>> are given
  by<nbsp><eqref|eq:reconstruction.general>.

  <section|Proving admissibility><label|sec:mh.adm>

  The following lemma about conservation laws will be crucial in the proof.

  <\lemma>
    Consider the 1-D Riemann problem

    <\align*>
      <tformat|<table|<row|<cell|<bw><rsub|t>+<ff><around|(|<bw>|)><rsub|x>>|<cell|=0>>|<row|<cell|<bw><around|(|x,0|)>>|<cell|=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|<bw><rsub|l>,>|<cell|<space|1em>>|<cell|x\<less\>0>>|<row|<cell|<bw><rsub|r>,>|<cell|>|<cell|x\<gtr\>0>>>>>|\<nobracket\>>>>>>
    </align*>

    in <math|<around|[|-h,h|]>\<times\><around|[|0,\<Delta\>*t|]>> where

    <\equation>
      <label|eq:con.law.dt><frac|\<Delta\>*t|h>*\<sigma\><around|(|<bw><rsub|l>,<bw><rsub|r>|)>\<leq\>1
    </equation>

    Then, for all <math|t\<le\>\<Delta\>t>,

    <\align>
      <tformat|<table|<row|<cell|<big|int><rsub|-h><rsup|h><bw><around|(|x,t|)><ud>*x=h*<around|(|<bw><rsub|l>+<bw><rsub|r>|)>-t*<around|(|f<around|(|<bw><rsub|r>|)>-f<around|(|<bw><rsub|l>|)>|)><eq-number><label|lemma:avg.riemann.problem>>>>>
    </align>
  </lemma>

  <\proof>
    Integrate the conservation law over <math|<around|(|-h,0|)>\<times\><around|(|0,t|)>>

    <\align*>
      <tformat|<table|<row|<cell|0>|<cell|=<big|int><rsub|-h><rsup|0><bw><around|(|x,t|)><ud>*x-h*<bw><rsub|l>+<big|int><rsub|0><rsup|t><around|(|<ff><around|(|<bw><around|(|0<rsup|->,t|)>|)>-<ff><around|(|<bw><around|(|-h,t|)>|)>|)>*<ud>*t>>|<row|<cell|>|<cell|=<big|int><rsub|-h><rsup|0><bw><around|(|x,t|)><ud>*x-h*<bw><rsub|l>+t*<around|(|<ff><around|(|<wide|<bw>|~><around|(|0<rsup|->|)>|)>-<ff><around|(|<bw><rsub|l>|)>|)>>>>>
    </align*>

    where, by self-similarity of solution of Riemann problem,
    <math|<wide|<bw>|~>> is defined so that
    <math|<bw><around|(|x,t|)>=<wide|<bw>|~><around|(|x/t|)>> and
    <math|<ff><around|(|<bw><around|(|-h,t|)>|)>=<ff><around|(|<bw><rsub|l>|)>>
    is obtained as characteristics from <math|<around|[|0,h|]>> do not reach
    <math|x=-h> due to the time restriction<nbsp><eqref|eq:con.law.dt>.
    Rewriting gives

    <\align*>
      <tformat|<table|<row|<cell|<big|int><rsub|-h><rsup|0><bw><around|(|x,t|)><ud>*x=h*<bw><rsub|l>-t(\<nobracket\><ff><around|(|<wide|<bw>|~><around|(|0<rsup|->|)>-<ff><around|(|<bw><rsub|l>|)>|)>>>>>
    </align*>

    Similarly,

    <\equation*>
      <big|int><rsub|0><rsup|h><bw><around|(|x,t|)><ud>*x=h*<bw><rsub|r>-t*<around|(|<ff><around|(|<bw><rsub|r>|)>-<ff><around|(|<wide|<bw>|~><around|(|0<rsup|+>|)>|)>|)>
    </equation*>

    If <math|<wide|<bw>|~>> is discontinuous at <math|x=0>, by
    Rankine-Hugoniot conditions, we will have a stationary jump at
    <math|x/t=0> and obtain <math|<ff><around|(|<wide|<bw>|~><around|(|0<rsup|+>|)>|)>=<ff><around|(|<wide|<bw>|~><around|(|0<rsup|->|)>|)>>.
    The same trivially holds if <math|<wide|<bw>|~>> is continuous at
    <math|x/t=0>. Thus, we can sum the previous two identities to get
    <eqref|lemma:avg.riemann.problem>.
  </proof>

  We will now give a criterion under which we can prove
  <math|<bw><rsub|j><rsup|<nph>,\<pm\>>\<in\><Uad>>, i.e., the evolution
  step<nbsp><eqref|eq:evolution.general> preserves <math|<Uad>>.

  <\lemma>
    <label|lemma:m.h.step.1>Define <math|\<mu\><rsub|\<pm\>>> by
    <eqref|eq:mu.pm> and pick <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> to
    satisfy

    <\equation>
      <label|eq:ustar.defn><frac|<mum>|2>*<bw><rsub|j><rsup|n,->+<frac|1|2>*<bw><rsub|j><rsup|\<ast\>,\<pm\>>+<frac|<mup>|2>*<bw><rsub|j><rsup|n,+>=<bw><rsub|j><rsup|n,\<pm\>>
    </equation>

    Assume <math|<bw><rsub|j><rsup|n,\<pm\>>,<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<in\><Uad>>
    and the CFL restrictions

    <\equation>
      max<rsub|j> <frac|\<Delta\>*t|<mum>\<Delta\>*x<rsub|j>>*\<sigma\><around*|(|<bw><rsub|j><rsup|n,->,<bw><rsub|j><rsup|\<ast\>,\<pm\>>|)>\<leq\>1,<space|2em>max<rsub|j>
      <frac|\<Delta\>*t|<mup>\<Delta\>*x<rsub|j>>*\<sigma\><around*|(|<bw><rsub|j><rsup|\<ast\>,\<pm\>>,<bw><rsub|j><rsup|n,+>|)>\<leq\>1<label|eq:new.cfl1>
    </equation>

    are satisfied. Then, <math|<bw><rsub|j><rsup|n+<half>,\<pm\>>> given by
    the first step<nbsp><eqref|eq:evolution.general> of the MUSCL-Hancock
    scheme is in <math|<Uad>>.
  </lemma>

  <\proof>
    We will prove that <math|<bw><rsub|j><rsup|n+<frac|1|2>,+>\<in\><Uad>>,
    and the proof for <math|<bw><rsub|j><rsup|n+<frac|1|2>,->> shall follow
    similarly. The key idea is to write <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<pm\>>>
    as the exact solution of some Riemann problems. Define
    <math|<bw><rsup|h><around|(|x,t|)>:<around|(|x<rsub|<jmh>>,x<rsub|<jph>>|)>\<times\><around|(|0,\<Delta\>*t/2|)>\<rightarrow\><Uad>>
    to be the weak solution of the Cauchy problem with initial data

    <\equation*>
      <bw><rsup|h><around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|<bw><rsub|j><rsup|n,->,<space|1em>>|<cell|if
      x\<in\><around|(|x<rsub|<jmh>>,x<rsub|j-1/4>|)>>>|<row|<cell|<bw><rsub|j><rsup|\<ast\>,+>,>|<cell|if
      x\<in\><around|(|x<rsub|j-1/4>,x<rsub|j+1/4>|)>>>|<row|<cell|<bw><rsub|j><rsup|n,+>,>|<cell|if
      x\<in\><around|(|x<rsub|j+1/4>,x<rsub|<jph>>|)>>>>>>
    </equation*>

    where

    <\equation*>
      x<rsub|j-<frac|1|4>>=<frac|1|2>*<around|(|x<rsub|<jmh>>+<wide|x|~><rsub|j>|)>,<space|2em>x<rsub|j+<frac|1|4>>=<frac|1|2>*<around|(|<wide|x|~><rsub|j>+x<rsub|<jph>>|)>,<space|2em><wide|x|~><rsub|j>=x<rsub|j-<frac|1|2>>+<mum>*\<Delta\>x<rsub|j>
    </equation*>

    Under our time step restrictions<nbsp><eqref|eq:new.cfl1>, the solution
    <math|<bw><rsup|h>> at time <math|<frac|\<Delta\>t|2>> is made up of
    non-interacting Riemann problems centered at
    <math|x<rsub|j\<pm\><frac|1|4>>>, see
    Figure<nbsp>(<reference|fig:non.interacting.rp1>). We take the projection
    of <math|<bw><rsup|h><around|(|x,\<Delta\>*t/2|)>> on piecewise-constant
    functions

    <\equation*>
      <wide|<bw>|~><rsub|j><rsup|n+<frac|1|2>,+>\<assign\><frac|1|\<Delta\>x<rsub|j>>*<big|int><rsub|x<rsub|<jmh>>><rsup|x<rsub|<jph>>><space|0.2spc><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x
    </equation*>

    Since we assumed that the conservation law preserves <math|<Uad>>, we get
    <math|<wide|<bw>|~><rsub|j><rsup|n+<frac|1|2>,+>\<in\><Uad>>. If we prove
    <math|<wide|<bw>|~><rsub|j><rsup|n+<frac|1|2>,+>=<bw><rsub|j><rsup|n+<half>,+>>,
    we will have our claim. Applying Lemma
    <reference|lemma:avg.riemann.problem> to the two non-interacting Riemann
    problems, we get

    <\big-figure>
      <padded-center|<image|illustrations/non_interacting_rp1|0.9par|||><label|fig:non.interacting.rp1>>
    </big-figure|Two non-interacting Riemann problems>

    <\align*>
      <tformat|<table|<row|<cell|<wide|<bw>|~><rsub|j><rsup|n+<frac|1|2>,+>>|<cell|=<frac|1|\<Delta\>*x<rsub|j>>*<around*|(|<big|int><rsub|x<rsub|<jmh>>><rsup|<wide|x|~><rsub|j>><bw><rsup|h><around*|(|x,<frac|\<Delta\>*t|2>|)><ud>*x+<big|int><rsub|<wide|x|~><rsub|j>><rsup|x<rsub|<jph>>><bw><rsup|h><around*|(|x,<frac|\<Delta\>*t|2>|)><ud>*x|)>>>|<row|<cell|>|<cell|=<frac|1|\<Delta\>*x<rsub|j>>*<around*|[|<frac|<wide|x|~><rsub|j>-x<rsub|<jmh>>|2>*<bw><rsub|j><rsup|n,->+<frac|\<Delta\>*x<rsub|j>|2>*<bw><rsub|j><rsup|\<ast\>,+>+<frac|x<rsub|<jph>>-<wide|x|~><rsub|j>|2>*<bw><rsub|j><rsup|n,+>-<frac|\<Delta\>*t|2>*<around*|(|f<around*|(|<bw><rsub|j><rsup|n,+>|)>-f<around*|(|<bw><rsub|j><rsup|n,->|)>|)>|]>>>|<row|<cell|>|<cell|=<frac|1|2>*<around*|(|<mum><bw><rsub|j><rsup|n,->+<bw><rsub|j><rsup|\<ast\>,+>+<mup><bw><rsub|j><rsup|n,+>|)>-<frac|\<Delta\>*t/2|\<Delta\>*x<rsub|j>>*<around*|(|f<around*|(|<bw><rsub|j><rsup|n,+>|)>-f<around*|(|<bw><rsub|j><rsup|n,->|)>|)>>>|<row|<cell|>|<cell|=<bw><rsub|j><rsup|n,+>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|j>>*<around*|(|f<around*|(|<bw><rsub|j><rsup|n,+>|)>-f<around*|(|<bw><rsub|j><rsup|n,->|)>|)>,<space|1em><text|using<nbsp><eqref|eq:ustar.defn>>>>|<row|<cell|>|<cell|=<bw><rsub|j><rsup|n+<frac|1|2>,+>,<space|1em><text|by<nbsp><eqref|eq:evolution.general>>>>>>
    </align*>

    This proves our claim.
  </proof>

  Now, we introduce a new variable <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>>
  defined as follows:

  <\equation>
    <label|eq:uj.nph.s><mum>*<bw><rsub|j><rsup|n+<frac|1|2>,->+<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>+<mup>*<bw><rsub|j><rsup|n+<frac|1|2>,+>=2*<bw><rsub|j><rsup|n>
  </equation>

  <\big-figure>
    <padded-center|<image|illustrations/fv_evolution|0.9par|||><label|fig:fv.evolution>>
  </big-figure|Finite volume evolution>

  As illustrated in Figure<nbsp>(<reference|fig:fv.evolution>), we evolve
  each state according to the associated first order scheme to define the
  following

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<bw><rsub|j><rsup|n+1,->>|<cell|=>|<cell|<bw><rsub|j><rsup|n+<frac|1|2>,->-<cfrac|\<Delta\>*t|<mum>\<Delta\>*x<rsub|j>/2><around*|(|f*<around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,->,<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>|)>-f*<around*|(|<bw><rsub|j-1><rsup|n+<frac|1|2>,+>,<bw><rsub|j><rsup|n+<frac|1|2>,->|)>|)>>>|<row|<cell|<bw><rsub|j><rsup|n+1,\<ast\>>>|<cell|=>|<cell|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>-<cfrac|\<Delta\>*t|\<Delta\>*x<rsub|j>/2><around*|(|f*<around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|j><rsup|n+<frac|1|2>,+>|)>-f*<around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,->,<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>|)>|)>>>|<row|<cell|<bw><rsub|j><rsup|n+1,+>>|<cell|=>|<cell|<bw><rsub|j><rsup|n+<frac|1|2>,+>-<cfrac|\<Delta\>*t|<mup>\<Delta\>*x<rsub|j>/2><around*|(|f*<around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,+>,<bw><rsub|j+1><rsup|n+<frac|1|2>,->|)>-f*<around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|j><rsup|n+<frac|1|2>,+>|)>|)>>>>>><label|eq:all.fvm.updates>
  </equation>

  Recall that<nbsp><eqref|eq:muscl.final.general> is

  <\equation*>
    <bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|j>>*<around*|(|<ff><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,+>,<bw><rsub|j+1><rsup|n+<frac|1|2>,->|)>-<ff><around*|(|<bw><rsub|j-1><rsup|n+<frac|1|2>,+>,<bw><rsub|j><rsup|n+<frac|1|2>,->|)>|)>
  </equation*>

  Using<nbsp><eqref|eq:uj.nph.s> and<nbsp><eqref|eq:all.fvm.updates>, we get

  <\equation*>
    <frac|<mum>|2>*<bw><rsub|j><rsup|n+1,->+<frac|1|2>*<bw><rsub|j><rsup|n+1,\<ast\>>+<frac|<mup>|2>*<bw><rsub|j><rsup|n+1,+>=<bw><rsub|j><rsup|n+1>
  </equation*>

  Thus, assuming <math|<bw><rsub|j><rsup|n+<frac|1|2>\<pm\>>,<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>>
  for all <math|j>, and since <math|<half>*<mum>+<half>*<mup>=1>, we get
  <math|<bw><rsub|j><rsup|n+1>\<in\><Uad>> under the following time step
  restrictions arising from the assumed time step
  requirement<nbsp><eqref|eq:numflux.admissibility.cfl> for admissibility of
  the first order finite volume method

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|l>|<table|<row|<cell|max<rsub|j><cfrac|\<Delta\>t|<mum>\<Delta\>x<rsub|j>/2>\<sigma\><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,->,<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>|)>\<leq\>1,>|<cell|<space|2em>>|<cell|max<rsub|j><cfrac|\<Delta\>t|\<Delta\>x<rsub|j>/2>\<sigma\><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,->,<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>|)>\<leq\>1>>|<row|<cell|max<rsub|j><cfrac|\<Delta\>t|<mum>\<Delta\>x<rsub|j>/2>\<sigma\><around*|(|<bw><rsub|j-1><rsup|n+<frac|1|2>,+>,<bw><rsub|j><rsup|n+<frac|1|2>,->|)>\<leq\>1,>|<cell|>|<cell|max<rsub|j><cfrac|\<Delta\>t|<mup>\<Delta\>x<rsub|j>/2>\<sigma\><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,+>,<bw><rsub|j+1><rsup|n+<frac|1|2>,->|)>\<leq\>1>>|<row|<cell|max<rsub|j><cfrac|\<Delta\>t|\<Delta\>x<rsub|j>/2>\<sigma\><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|j><rsup|n+<frac|1|2>,+>|)>\<leq\>1,>|<cell|>|<cell|max<rsub|j><cfrac|\<Delta\>t|<mup>\<Delta\>x<rsub|j>/2>\<sigma\><around*|(|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|j><rsup|n+<frac|1|2>,+>|)>\<leq\>1>>>>><label|eq:new.cfl2>
  </equation>

  This can be summarised in the following Lemma.

  <\lemma>
    <label|lemma:muscl.step2.general>Assume that the states
    <math|<around*|{|<bw><rsub|j><rsup|n+<frac|1|2>,\<pm\>>|}><rsub|j>>,
    <math|<around*|{|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>|}><rsub|j>>
    belong to <math|<Uad>>, where <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>>
    is defined as in<nbsp><eqref|eq:uj.nph.s>. Then, the updated solution
    <math|<bw><rsub|j><rsup|n+1>> of MUSCL-Hancock scheme
    (<reference|eq:reconstruction.general>-<reference|eq:muscl.final.general>)
    is in <math|<Uad>> under the CFL conditions <eqref|eq:new.cfl2>.
  </lemma>

  Since Lemma <reference|lemma:m.h.step.1> states that
  <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<pm\>>\<in\><Uad>> if
  <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<in\><Uad>>, the only new condition
  pertains to <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>>. Our goal now is
  to understand this condition, and ultimately prove that it follows from the
  requirement that <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<in\><Uad>> in
  case of conservative reconstruction.

  Recall that <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>> was defined
  by<nbsp><eqref|eq:uj.nph.s>; expanding the definition of
  <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<pm\>>> given
  by<nbsp><eqref|eq:evolution.general> yields

  <\equation>
    <label|eq:uj.nph.s.explicit><bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>=2*<bw><rsub|j><rsup|n>-<around*|(|<mum><bw><rsub|j><rsup|n,->+<mup><bw><rsub|j><rsup|n,+>|)>-<frac|\<Delta\>*t|2*\<Delta\>*x<rsub|j>>*<around|(|f<around|(|<bw><rsub|j><rsup|n,->|)>-f<around|(|<bw><rsub|j><rsup|n,+>|)>|)>
  </equation>

  This identity<nbsp><eqref|eq:uj.nph.s.explicit> will be seen as an
  evolution update similar to<nbsp><eqref|eq:evolution.general> with
  <math|<bw><rsub|j><rsup|n,+>> and <math|<bw><rsub|j><rsup|n,->> being
  swapped and <math|<bw><rsub|j><rsup|n>> replaced with
  <math|2*<bw><rsub|j><rsup|n>-<around*|(|<mum>*<bw><rsub|j><rsup|n,->+<mup>*<bw><rsub|j><rsup|n,+>|)>>.
  The admissibility of <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>> will be
  studied by adapting the proof of admissibility
  for<nbsp><eqref|eq:evolution.general>, accounting for the differences in
  the case of<nbsp><eqref|eq:uj.nph.s.explicit>. Define
  <math|<bw><rsub|j><rsup|\<ast\>,\<ast\>>> so that

  <\equation>
    <label|eq:uss.defn><frac|<mum>|2>*<bw><rsub|j><rsup|n,->+<frac|1|2>*<bw><rsub|j><rsup|\<ast\>,\<ast\>>+<frac|<mup>|2>*<bw><rsub|j><rsup|n,+>=2*<bw><rsub|j><rsup|n>-<around|(|<mum>*<bw><rsub|j><rsup|n,->+<mup>*<bw><rsub|j><rsup|n,+>|)>
  </equation>

  i.e.,

  <\equation>
    <bw><rsub|j><rsup|\<ast\>,\<ast\>>=4*<bw><rsub|j><rsup|n>-3*<around|(|<mum>*<bw><rsub|j><rsup|n,->+<mup>*<bw><rsub|j><rsup|n,+>|)><label|eq:wss.simplified>
  </equation>

  The following Lemma extends the proof of Lemma <reference|lemma:m.h.step.1>
  to obtain conditions for <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>>.

  <\lemma>
    <label|lemma:muscl.step3.wss>Assume that
    <math|<bw><rsub|j><rsup|n>\<in\><Uad>> for all <math|j>. Consider the
    reconstructions <math|<bw><rsub|j><rsup|n,\<pm\>>> and the
    <math|<bw><rsub|j><rsup|\<ast\>,\<ast\>>> defined
    in<nbsp><eqref|eq:uss.defn>. Assume <math|<bw><rsub|j><rsup|n,\<pm\>>,<bw><rsub|j><rsup|\<ast\>,\<ast\>>\<in\><Uad>>
    and the time step restrictions

    <\equation>
      max<rsub|j> <frac|\<Delta\>t|<mum>*\<Delta\>x<rsub|j>>*\<sigma\><around*|(|<bw><rsub|j><rsup|\<ast\>,\<ast\>>,<bw><rsub|j><rsup|n,->|)>\<leq\>1,<space|2em>max<rsub|j>
      <frac|\<Delta\>t|<mup>*\<Delta\>x<rsub|j>>*\<sigma\><around*|(|<bw><rsub|j><rsup|n,+>,<bw><rsub|j><rsup|\<ast\>,\<ast\>>|)>\<leq\>1<label|eq:new.cfl3>
    </equation>

    Then <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>>.
  </lemma>

  <\proof>
    We will use the identity which follows
    from<nbsp>(<reference|eq:uj.nph.s.explicit>, <reference|eq:uss.defn>)

    <\equation>
      <label|eq:ujph.s.identity><bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>=<frac|<mum>*<bw><rsub|j><rsup|n,->+<bw><rsub|j><rsup|\<ast\>,\<ast\>>+<mup>*<bw><rsub|j><rsup|n,+>|2>-<frac|\<Delta\>t|2*\<Delta\>x<rsub|j>>*<around|(|f<around|(|<bw><rsub|j><rsup|n,->|)>-f<around|(|<bw><rsub|j><rsup|n,+>|)>|)>
    </equation>

    to fall back to previous case of Lemma <reference|lemma:m.h.step.1>.

    Define <math|<bw><rsup|h><around|(|x,t|)>:<around|(|x<rsub|<jmh>>,x<rsub|<jph>>|)>\<times\><around|(|0,\<Delta\>*t/2|)>\<rightarrow\><Uad>>
    to be the weak solution of the Cauchy problem with initial data

    <\equation*>
      <bw><rsup|h><around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|<bw><rsub|j><rsup|n,+>,<space|1em>>|<cell|if
      x\<in\><around|(|x<rsub|<jmh>>,x<rsub|j-1/4>|)>>>|<row|<cell|<bw><rsub|j><rsup|\<ast\>,\<ast\>>,>|<cell|if
      x\<in\><around|(|x<rsub|j-<frac|1|4>>,x<rsub|j+1/4>|)>>>|<row|<cell|<bw><rsub|j><rsup|n,->,>|<cell|if
      x\<in\><around|(|x<rsub|j+<frac|1|4>>,x<rsub|<jph>>|)>>>>>>
    </equation*>

    where

    <\equation*>
      x<rsub|j-<frac|1|4>>=<frac|1|2>*<around|(|x<rsub|<jmh>>+x<rsub|j>|)>,<space|2em>x<rsub|j+<frac|1|4>>=<frac|1|2>*<around|(|x<rsub|j>+x<rsub|<jph>>|)>
    </equation*>

    Note that we have already accounted for the swapped
    <math|<bw><rsub|j><rsup|n,->> and <math|<bw><rsub|j><rsup|n,+>> while
    defining this initial condition, see Figure<nbsp>(<reference|fig:non.interacting.rp2>).

    Under the assumed CFL conditions<nbsp><eqref|eq:new.cfl3>, the solution
    <math|<bw><rsup|h>> at time <math|<frac|\<Delta\>t|2>> is made up of
    non-interacting Riemann problems centered at
    <math|x<rsub|j\<pm\><frac|1|4>>>. Take the projection of
    <math|<bw><rsup|h><around|(|x,t/2|)>> on piecewise-constant functions

    <\equation*>
      <wide|<bw>|~><rsub|j><rsup|n+<frac|1|2>,\<ast\>>\<assign\><frac|1|\<Delta\>x<rsub|j>>*<big|int><rsub|x<rsub|j-<frac|1|2>>><rsup|x<rsub|<jph>>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x\<in\><Uad>
    </equation*>

    <\big-figure>
      <padded-center|<image|illustrations/non_interacting_rp2|0.9par|||><label|fig:non.interacting.rp2>>
    </big-figure|Two non-interacting Riemann problems>

    As in Lemma<nbsp><reference|lemma:m.h.step.1>, we will show
    <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>> by showing
    <math|<bw><rsub|j><rsup|<nph>,\<ast\>>=<wide|<bw>|~><rsub|j><rsup|<nph>,\<ast\>>>.
    Applying Lemma<nbsp><reference|lemma:avg.riemann.problem> to the two
    non-interacting Riemann problems, we get

    <\align*>
      <tformat|<table|<row|<cell|<wide|<bw>|~><rsub|j><rsup|n+<frac|1|2>,\<ast\>>>|<cell|=<frac|1|\<Delta\>x<rsub|j>>*<around*|(|<big|int><rsub|x<rsub|<jmh>>><rsup|x<rsub|j>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x+<big|int><rsub|x<rsub|j>><rsup|x<rsub|<jph>>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x|)>>>|<row|<cell|>|<cell|=<frac|1|\<Delta\>x<rsub|j>>*<around*|(|<frac|x<rsub|j>-x<rsub|<jmh>>|2>*<bw><rsub|j><rsup|n,+>+<frac|\<Delta\>x<rsub|j>|2>*<bw><rsub|j><rsup|\<ast\>,\<ast\>>+<frac|x<rsub|<jph>>-x<rsub|j>|2>*<bw><rsub|j><rsup|n,->-<frac|\<Delta\>t|2>*<around*|(|<value|pf><around*|(|<bw><rsub|j><rsup|n,->|)>-<value|pf><around*|(|<bw><rsub|j><rsup|n,+>|)>|)>|)>>>|<row|<cell|>|<cell|=<frac|1|2>*<around*|(|<mup>*<bw><rsub|j><rsup|n,+>+<bw><rsub|j><rsup|\<ast\>,\<ast\>>+<mum>*<bw><rsub|j><rsup|n,->|)>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|j>>*<around*|(|<value|pf><around*|(|<bw><rsub|j><rsup|n,->|)>-<value|pf><around*|(|<bw><rsub|j><rsup|n,+>|)>|)>>>|<row|<cell|>|<cell|=<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>,<space|1em><text|by<nbsp><eqref|eq:ujph.s.identity>>>>>>
    </align*>

    This proves our claim.
  </proof>

  For conservative reconstruction,

  <\equation*>
    <mum>*<bw><rsub|j><rsup|n,->+<mup>*<bw><rsub|j><rsup|n,+>=<bw><rsub|j><rsup|n>
  </equation*>

  and thus by <eqref|eq:wss.simplified>, <math|<bw><rsub|j><rsup|\<ast\>,\<ast\>>=<bw><rsub|j><rsup|n>>.
  The previous lemma can thus be specialized as follows.

  <\lemma>
    <label|lemma:muscl.step3.conservative>Assume that
    <math|<bw><rsub|j><rsup|n>\<in\><Uad>> and
    <math|<bw><rsub|j><rsup|n,\<pm\>>\<in\><Uad>> for all <math|j> with
    conservative reconstruction. Also assume the CFL restrictions

    <\equation>
      max<rsub|j> <frac|\<Delta\>t|<mum>*\<Delta\>x<rsub|j>>*\<sigma\><around*|(|<bw><rsub|j><rsup|n>,<bw><rsub|j><rsup|n,->|)>\<leq\>1,<space|2em>max<rsub|j>
      <frac|\<Delta\>t|<mup>*\<Delta\>x<rsub|j>>*\<sigma\><around*|(|<bw><rsub|j><rsup|n,+>,<bw><rsub|j><rsup|n>|)>\<leq\>1<label|eq:new.cfl3.conservative>
    </equation>

    where <math|\<mu\><rsup|\<pm\>>> are defined in<nbsp><eqref|eq:mu.pm>.
    Then, <math|<bw><rsub|j><rsup|n+<frac|1|2>,\<ast\>>> defined
    in<nbsp><eqref|eq:uj.nph.s> is in <math|<Uad>>.
  </lemma>

  Combining Lemmas<nbsp><reference|lemma:m.h.step.1>,<nbsp><reference|lemma:muscl.step2.general>,<nbsp><reference|lemma:muscl.step3.conservative>,
  we obtain the final criterion for admissibility preservation of
  MUSCL-Hancock with conservative reconstruction in the following
  Theorem<nbsp><reference|thm:final.condn.conservative>.

  <\theorem>
    <label|thm:final.condn.conservative>Let
    <math|<bw><rsub|j><rsup|n>\<in\><Uad>> for all <math|j> and
    <math|<bw><rsub|j><rsup|n,\<pm\>>> be the conservative reconstructions
    defined as

    <\equation*>
      <bw><rsub|j><rsup|n,+>=<bw><rsub|j>+<around|(|x<rsub|<jph>>-x<rsub|j>|)>*<slope><rsub|j>,<space|2em><bw><rsub|j><rsup|n,->=<bw><rsub|j>+<around|(|x<rsub|<jmh>>-x<rsub|j>|)>*<slope><rsub|j>
    </equation*>

    so that <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> defined
    in<nbsp><eqref|eq:ustar.defn> is also given by

    <\equation>
      <label|eq:us.conservative><bw><rsub|j><rsup|\<ast\>,\<pm\>>=<bw><rsub|j><rsup|n>+2*<around*|(|x<rsub|j\<pm\><frac|1|2>>-x<rsub|j>|)>*<slope><rsub|j>
    </equation>

    Assume the slope <math|<slope><rsub|j>> chosen such that
    <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>\<in\><Uad>> and the CFL
    restrictions<nbsp>(<reference|eq:new.cfl1>, <reference|eq:new.cfl2>,
    <reference|eq:new.cfl3.conservative>) hold. Then, the updated solution
    <math|<bw><rsub|j><rsup|n+1>>, defined by MUSCL-Hancock
    scheme<nbsp><eqref|eq:muscl.final.general> is in <math|<Uad>>.
  </theorem>

  <\proof>
    Once we obtain <math|<bw><rsub|j><rsup|n,\<pm\>>\<in\><Uad>>, the claim
    follows from Lemmas<nbsp><reference|lemma:m.h.step.1>-<reference|lemma:muscl.step3.conservative>.
    To prove that <math|<bw><rsub|j><rsup|n,\<pm\>>> is indeed in
    <math|<Uad>>, we make the straight forward observation that

    <\equation*>
      <bw><rsub|j><rsup|n,\<pm\>>=<frac|1|2>*<bw><rsub|j><rsup|\<ast\>,\<pm\>>+<frac|1|2>*<bw><rsub|j><rsup|n>
    </equation*>

    Since <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>> and
    <math|<bw><rsub|j><rsup|n>> are in <math|<Uad>>, the proof is completed
    by the convex property of <math|<Uad>>.
  </proof>

  <\remark>
    <label|rmk:mh.restriction.for.fr>The strictest time step restriction for
    admissibility of the MUSCL-Hancock scheme is imposed
    by<nbsp><eqref|eq:new.cfl2>. Thus, we can find the CFL coefficient for
    grid used by subcell-based blending scheme<nbsp><eqref|eq:low.order.update>
    by minimizing the denominator in<nbsp><eqref|eq:new.cfl2> which is given
    by

    <\equation*>
      <frac|1|2>*min<rsub|j=0,\<ldots\>,N><around*|(|\<xi\><rsub|j>-<big|sum><rsub|k=0><rsup|j-1>w<rsub|k>|)>*w<rsub|j>=<frac|1|2>*\<xi\><rsub|0>*w<rsub|0>
    </equation*>

    where <math|\<xi\><rsub|0>,w<rsub|0>> are the first Gauss-Legendre
    quadrature point<nbsp><eqref|eq:xi0.defn> and weight in
    <math|<around|[|0,1|]>>. This coefficient is less than half of the
    optimal CFL coefficient that arises from Fourier stability analysis of
    the LWFR scheme with D2 dissipation, see Table 1
    of<nbsp><cite|babbar2022>.
  </remark>

  <section|Non-conservation reconstruction>

  To maintain the simple admissibility criterion
  (Theorem<nbsp><reference|thm:final.condn.conservative>), we have restricted
  ourselves to conservative reconstruction in this work. In this section, we
  explain the complexities that will arise in enforcing admissibility if we
  perform reconstruction with non-conservative variables <math|<bv>> defined
  by the change of variables formula

  <\equation*>
    <bv>=\<kappa\><around*|(|<bw>|)>
  </equation*>

  The linear approximation is given by

  <\equation*>
    <br><rsup|n><rsub|j><around|(|x|)>=<bv><rsup|n><rsub|j>+<around|(|x-x<rsub|j>|)>*<slope><rsub|j>,<space|1em>x\<in\><around|[|x<rsub|<jmh>>,x<rsub|<jph>>|]>
  </equation*>

  and thus the trace values are

  <\equation*>
    <bv><rsub|j><rsup|n,\<pm\>>=<bv><rsub|j><rsup|n>+<around|(|x<rsub|<jpmh>>-x<rsub|j>|)>*<slope><rsub|j>
  </equation*>

  Since the arguments of proof of admissibility depend on constraints on the
  conservative variables, we have to take the inverse map on our
  reconstructions. For example, conservative variables at the face are
  obtained as

  <\equation>
    <label|eq:non.con.face.defn1><bw><rsub|j><rsup|n,\<pm\>>=\<kappa\><rsup|-1><around|(|<bv><rsub|j><rsup|n,\<pm\>>|)>
  </equation>

  Due to the non-linearity of the map <math|\<kappa\>>, unlike the
  conservative case, we have

  <\equation*>
    <mum>*<bw><rsub|j><rsup|n,->+<mup>*<bw><rsub|j><rsup|n,+>\<neq\><bw><rsub|j><rsup|n>
  </equation*>

  which is why several reductions of admissibility constraints will fail. The
  admissibility criteria for non-conservative reconstruction is stated in
  Theorem<nbsp><reference|thm:non.conservative.mh>.

  <\theorem>
    <label|thm:non.conservative.mh>Assume that
    <math|<bw><rsub|j><rsup|n>\<in\><Uad>> for all <math|j>. Consider
    <math|<bw><rsub|j><rsup|n,\<pm\>>> defined in
    <eqref|eq:non.con.face.defn1>, <math|<bw><rsub|j><rsup|\<ast\>,\<pm\>>>
    defined in<nbsp><eqref|eq:ustar.defn> and
    <math|<bw><rsub|j><rsup|\<ast\>,\<ast\>>> defined so that

    <\equation*>
      <frac|<mum>|2>*<bw><rsub|j><rsup|n,->+<frac|1|2>*<bw><rsub|j><rsup|\<ast\>,\<ast\>>+<frac|<mup>|2>*<bw><rsub|j><rsup|n,+>=2*<bw><rsub|j><rsup|n>-<around|(|<mum><bw><rsub|j><rsup|n,->+<mup><bw><rsub|j><rsup|n,+>|)>
    </equation*>

    Assume that the slope <math|<slope><rsub|j>> is chosen so that
    <math|<bw><rsub|j><rsup|n,\<pm\>>,<bw><rsub|j><rsup|\<ast\>,\<pm\>>,<bw><rsub|j><rsup|\<ast\>,\<ast\>>\<in\><Uad>>
    and that the CFL restrictions<nbsp>(<reference|eq:new.cfl1>,
    <reference|eq:new.cfl2>, <reference|eq:new.cfl3>) are satisfied. Then the
    updated solution <math|<bw><rsub|j><rsup|n+1>> of MUSCL-Hancock
    scheme<nbsp><eqref|eq:muscl.final.general> is in <math|<Uad>>.
  </theorem>

  <section|MUSCL-Hancock scheme in 2-D><label|sec:2d.mh>

  Consider the 2-D hyperbolic conservation law<nbsp><eqref|eq:2d.hyp.con.law>
  with fluxes <math|<ff>,<value|pg>>. For simplicity, assume that the
  reconstruction is performed on conservative variables. Thus, the linear
  reconstructions are given by

  <\equation*>
    <br><rsup|n><rsub|\<nocomma\>i\<nocomma\>j>*<around|(|x,y|)>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+<around|(|x-x<rsub|i>|)>*<slope><rsub|i><rsup|x>+<around|(|y-y<rsub|j>|)>*<slope><rsub|j><rsup|y>,
  </equation*>

  and the approximations at the face <math|<unpx>,<unmx>,<unpy>,<unmy>> are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<unpmx><rsub|\<nocomma\>i\<nocomma\>j>>|<cell|=>|<cell|r<rsup|n><rsub|\<nocomma\>i\<nocomma\>j>*<around|(|x<rsub|<ipmh>>,y<rsub|j>|)>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+<around|(|x<rsub|<ipmh>>-x<rsub|i>|)><slope><rsub|i><rsup|x>>>|<row|<cell|<unpmy><rsub|\<nocomma\>i\<nocomma\>j>>|<cell|=>|<cell|r<rsup|n><rsub|\<nocomma\>i\<nocomma\>j>*<around|(|x<rsub|i>,y<rsub|<jpmh>>|)>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+<around|(|y<rsub|<jpmh>>-y<rsub|j>|)><slope><rsub|j><rsup|y>>>>>><label|eq:2DMH1>
  </equation>

  and the derivative approximations are given by

  <\equation*>
    \<partial\><rsub|x> <ff><rsub|\<nocomma\>i\<nocomma\>j>\<assign\><frac|1|\<Delta\>x<rsub|i>>*<around*|(|<ff><around*|(|<unpx><rsub|i\<nocomma\>j>|)>-<ff><around*|(|<unmx><rsub|i\<nocomma\>j>|)>|)>,<space|2em>\<partial\><rsub|y>*<value|bg><rsub|\<nocomma\>i\<nocomma\>j>\<assign\><frac|1|\<Delta\>y<rsub|j>>*<around*|(|<value|fg><around*|(|<unpy><rsub|i\<nocomma\>j>|)>-<value|fg><around*|(|<unmy><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>
  </equation*>

  <\equation*>
    \<partial\><rsub|t>*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>\<assign\>-\<partial\><rsub|x>*<ff><rsub|i\<nocomma\>j>-\<partial\><rsub|y>*<value|fg><rsub|i\<nocomma\>j>
  </equation*>

  The evolutions to time level <math|<nph>> are given by

  <\equation>
    <label|eq:2DMH2><unphpmx><rsub|\<nocomma\>i\<nocomma\>j>=<unpmx><rsub|i\<nocomma\>j\<nocomma\>>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>,<space|2em><unphpmy><rsub|i\<nocomma\>j\<nocomma\>>=<unpmy><rsub|i\<nocomma\>j\<nocomma\>>+<frac|\<Delta\>*t|2>*\<partial\><rsub|t>*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>
  </equation>

  and then the final update is performed as

  <\equation>
    <label|eq:2DMH3><bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+1>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|i>>*<around|(|<ff><rsub|<iph>,j><rsup|<nph>>-<ff><rsub|<imh>,j><rsup|<nph>>|)>-<frac|\<Delta\>*t|\<Delta\>*y<rsub|j>>*<around|(|g<rsub|i,<jph>><rsup|<nph>>-g<rsub|i,<jmh>><rsup|<nph>>|)>
  </equation>

  where the numerical fluxes are computed as

  <\equation*>
    <ff><rsub|<iph>,j><rsup|<nph>>=<ff><around*|(|<unphpx><rsub|i\<nocomma\>j\<nocomma\>>,<unphmx><rsub|i+1,j>|)>,<space|2em>g<rsub|i,<jph>><rsup|<nph>>=g<around*|(|<unphpy><rsub|\<nocomma\>i\<nocomma\>j>,<unphmy><rsub|i,j+1>|)>
  </equation*>

  <subsection|First evolution step>

  As in 1-D, define <math|<uspmx><rsub|\<nocomma\>i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j\<nocomma\>>>
  so that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<mupx>*<unpx><rsub|i\<nocomma\>j\<nocomma\>>+<uspmx><rsub|i\<nocomma\>j>+<mumx>*<unmx><rsub|\<nocomma\>i\<nocomma\>j>>|<cell|=>|<cell|2*<unpmx><rsub|i\<nocomma\>j\<nocomma\>>>>|<row|<cell|<mupy>*<unpy><rsub|\<nocomma\>i\<nocomma\>j>+<uspmy><rsub|i\<nocomma\>j>+<mumy>*<unmy><rsub|\<nocomma\>i\<nocomma\>j>>|<cell|=>|<cell|2*<unpmy><rsub|\<nocomma\>i\<nocomma\>j>>>>>><label|eq:ustar.2d>
  </equation>

  where

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<mupx>>|<cell|=>|<cell|<frac|x<rsub|i>-x<rsub|<imh>>|x<rsub|<iph>>-x<rsub|<imh>>>,<space|2em><mumx>=<frac|x<rsub|<iph>>-x<rsub|i>|x<rsub|<iph>>-x<rsub|i-1/2>>>>|<row|<cell|<mupy>>|<cell|=>|<cell|<frac|y<rsub|j>-y<rsub|<jmh>>|y<rsub|<jph>>-y<rsub|<jmh>>>,<space|2em><mumy>=<frac|y<rsub|<jph>>-y<rsub|j>|y<rsub|<jph>>-y<rsub|<jmh>>>>>>>><label|eq:muxy.defn>
  </equation>

  Since we assume conservative reconstruction

  <\equation*>
    <mupx>*<unpx><rsub|\<nocomma\>i\<nocomma\>j>+<mumx>*<unmx><rsub|i\<nocomma\>j\<nocomma\>>=<mupy>*<unpy><rsub|i\<nocomma\>j\<nocomma\>>+<mumy>*<unmy><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>
  </equation*>

  Thus, we have

  <\equation*>
    <uspmx><rsub|i\<nocomma\>j>=<bw><rsub|i\<nocomma\>j><rsub|\<nocomma\>>+2*<around|(|x<rsub|<ipmh>>-x<rsub|i>|)>*<slope><rsub|i><rsup|x>,<space|2em><uspmy><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|i\<nocomma\>j><rsub|\<nocomma\>>+2*<around|(|y<rsub|<jpmh>>-x<rsub|j>|)>*<slope><rsub|j><rsup|y>
  </equation*>

  We will particularly discuss admissibility of the updates

  <\align>
    <tformat|<table|<row|<cell|<unphpx><rsub|\<nocomma\>i\<nocomma\>j>=<unpx><rsub|i\<nocomma\>j\<nocomma\>>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|i>>*<around*|(|<ff><around*|(|<unpx><rsub|i\<nocomma\>j\<nocomma\>>|)>-<ff><around*|(|<unmx><rsub|i\<nocomma\>j\<nocomma\>>|)>|)>-<frac|\<Delta\>t/2|\<Delta\>y<rsub|j>>*<around*|(|<value|fg><around*|(|<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<value|fg><around*|(|<unmy><rsub|i\<nocomma\>j\<nocomma\>>|)>|)><eq-number><label|eq:2Dupdates>>>>>
  </align>

  Admissibility of the other three updates
  <math|<unphmx><rsub|\<nocomma\>i\<nocomma\>j>,<unphpmy><rsub|\<nocomma\>i\<nocomma\>j>>
  will follow similarly. For some <math|k<rsub|x>,k<rsub|y>> chosen such that
  <math|k<rsub|x>+k<rsub|y>=1>, we write <eqref|eq:2Dupdates> as

  <\align*>
    <tformat|<table|<row|<cell|<unphpx><rsub|\<nocomma\>i\<nocomma\>j>=k<rsub|x>*<thetapx>+k<rsub|y>*<thetapy>>>>>
  </align*>

  where

  <\equation>
    <thetapx>\<assign\><unpx><rsub|i\<nocomma\>j\<nocomma\>>-<frac|\<Delta\>t/2|k<rsub|x>*\<Delta\>x<rsub|i>>*<around*|(|<ff><around*|(|<unpx><rsub|i\<nocomma\>j\<nocomma\>>|)>-<ff><around*|(|<unmx><rsub|i\<nocomma\>j\<nocomma\>>|)>|)><label|eq:update.x.combination>
  </equation>

  and

  <\equation>
    <thetapy>\<assign\><unpx><rsub|\<nocomma\>i\<nocomma\>j>-<frac|\<Delta\>t/2|k<rsub|y>*\<Delta\>y<rsub|j>>*<around*|(|<value|fg><around*|(|<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<value|fg><around*|(|<unmy><rsub|\<nocomma\>i\<nocomma\>j>|)>|)><label|eq:update.x.combination2>
  </equation>

  We will choose the slopes <math|<slope><rsup|x><rsub|i>,<slope><rsup|y><rsub|j>>
  and time step <math|\<Delta\>*t> so that
  <math|<thetapx>,<thetapy>\<in\><Uad>>. Then, we can take convex
  combinations of the two terms to obtain admissibility of
  <math|<unphpx><rsub|\<nocomma\>i\<nocomma\>j>>. The choice of
  <math|k<rsub|x>,k<rsub|y>> will not influence the slope restriction, but
  only the time step restriction required to obtain admissibility. In this
  work, we only use the Fourier CFL restriction imposed by the Lax-Wendroff
  scheme<nbsp><eqref|eq:time.step.2d> and obtain admissibile solutions in all
  our tests and thus do not study the choice of <math|k<rsub|x>,k<rsub|y>>.
  However, in a similar context,<nbsp><cite|Zhang2010b> proposed the choice
  of

  <\equation>
    <label|eq:kx.defn>k<rsub|x>=<frac|a<rsub|x>/\<Delta\>x<rsub|i>|a<rsub|x>/\<Delta\>x<rsub|i>+a<rsub|y>/\<Delta\>y<rsub|j>>,<space|2em>k<rsub|y>=<frac|a<rsub|y>/\<Delta\>y<rsub|j>|a<rsub|x>/\<Delta\>x<rsub|i>+a<rsub|y>/\<Delta\>y<rsub|j>>
  </equation>

  where

  <\equation>
    a<rsub|x>=\<sigma\><rsub|x><around|(|<unmx><rsub|i\<nocomma\>j\<nocomma\>>,<unpx><rsub|i\<nocomma\>j\<nocomma\>>|)>,<space|2em>a<rsub|y>=\<sigma\><rsub|y><around|(|<unmy><rsub|i\<nocomma\>j\<nocomma\>>,<unpy><rsub|i\<nocomma\>j>|)>
  </equation>

  In<nbsp><cite|Cui2023>, it was shown that the time step restriction imposed
  by the above decomposition is suboptimal and optimal decompositions were
  proposed. After choosing <math|k<rsub|x>,k<rsub|y>>, following the 1-D
  procedures from Section<nbsp><reference|sec:mh.adm>, the slopes
  <math|<slope><rsup|x><rsub|i>,<slope><rsup|y><rsub|j>> will be limited to
  enforce admissibility of <math|<thetapx>,<thetapy>>
  (<reference|eq:update.x.combination>, <reference|eq:update.x.combination2>).
  The admissibility preservation of <math|<thetapx>><nbsp><eqref|eq:update.x.combination>
  follows directly from the arguments used in Lemma
  <reference|lemma:m.h.step.1>, enforcing slope restriction so that
  <math|<unpmx><rsub|\<nocomma\>>> and <math|<uspx><rsub|\<nocomma\>>> are
  admissible, and appropriate time step restrictions. For admissibility of
  <math|<thetapy>><nbsp><eqref|eq:update.x.combination2>, we define
  <math|<uspxy><rsub|\<nocomma\>>> so that

  <\equation*>
    <mupy>*<unpy><rsub|i\<nocomma\>j>+<uspxy><rsub|i\<nocomma\>j>+<mumy>*<unmy><rsub|i\<nocomma\>j>=2*<unpx><rsub|i\<nocomma\>j>
  </equation*>

  Thus, the proof of Lemma <reference|lemma:m.h.step.1> shall apply as in 1-D
  under the assumption of admissibility of
  <math|<unpmy><rsub|i\<nocomma\>j>,<uspxy><rsub|i\<nocomma\>j>> and some CFL
  conditions. Thus, we will have admissibility of
  <math|<thetapy>\<in\><Uad>>. We obtain further simplifications because of
  conservative reconstructions

  <\equation>
    <uspxy><rsub|i\<nocomma\>j>=<uspx><rsub|i\<nocomma\>j >
  </equation>

  and thus the slope limiting for enforcing admissibility of
  <math|<uspx><rsub|\<nocomma\>>> will suffice. We note the precise slope and
  CFL restrictions are in Lemma<nbsp><reference|lemma:m.h.step.1.2d>.

  <\lemma>
    <label|lemma:m.h.step.1.2d>For <math|<mupmx>,<mupmy>> defined
    in<nbsp><eqref|eq:muxy.defn>, <math|<unpmx><rsub|i\<nocomma\>j>,<unpmy><rsub|i\<nocomma\>j>>
    reconstructed in<nbsp><eqref|eq:2DMH1>,
    <math|<uspmx><rsub|i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j>> picked as
    in<nbsp><eqref|eq:ustar.2d>, assume

    <\equation*>
      <unpmx><rsub|i\<nocomma\>j>,<unpmy><rsub|i\<nocomma\>j>,<uspmx><rsub|i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j>\<in\><Uad>
    </equation*>

    and the CFL restrictions

    <\equation>
      <\eqsplit>
        <tformat|<table|<row|<cell|max<rsub|i,j>
        <frac|\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unmx><rsub|i\<nocomma\>j>,<uspmx><rsub|i\<nocomma\>j>|)>\<leq\>1,<space|2em>max<rsub|i,j>
        <frac|\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<uspmx><rsub|i\<nocomma\>j>,<unpx><rsub|\<nocomma\>>|)>\<leq\>1>>|<row|<cell|max<rsub|i,j>
        <frac|\<lambda\><rsub|y<rsub|j>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unmy><rsub|i\<nocomma\>j>,<uspmx><rsub|i\<nocomma\>j>|)>\<leq\>1,<space|2em>max<rsub|i,j>
        <frac|\<lambda\><rsub|y<rsub|j>>|<mupy>>*\<sigma\><rsub|y><around*|(|<uspmx><rsub|i\<nocomma\>j>,<unpy><rsub|\<nocomma\>>|)>\<leq\>1>>|<row|<cell|max<rsub|i,j>
        <frac|\<lambda\><rsub|y<rsub|j>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unmy><rsub|i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j>|)>\<leq\>1,<space|2em>max<rsub|i,j>
        <frac|\<lambda\><rsub|y<rsub|j>>|<mupy>>*\<sigma\><rsub|y><around*|(|<uspmy><rsub|i\<nocomma\>j>,<unpy><rsub|i\<nocomma\>j>|)>\<leq\>1>>|<row|<cell|max<rsub|i,j>
        <frac|\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unmx><rsub|i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j>|)>\<leq\>1,<space|2em>max<rsub|i,j>
        <frac|\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<uspmy><rsub|i\<nocomma\>j>,<unpx><rsub|i\<nocomma\>j>|)>\<leq\>1<label|eq:new.cfl1.2d>>>>>
      </eqsplit>
    </equation>

    where <math|\<lambda\><rsub|x<rsub|i>>=<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|i>>,\<lambda\><rsub|y<rsub|j>>=<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|j>>>
    for all <math|i,j> and <math|k<rsub|x>+k<rsub|y>=1>. Then, the updates
    <math|<unphpmx><rsub|\<nocomma\>>,<unphpmy><rsub|\<nocomma\>>><nbsp><eqref|eq:2Dupdates>
    of the first step of 2-D MUSCL-Hancock scheme are admissible.
  </lemma>

  <subsection|Finite volume step>

  The final update is given by

  <\equation>
    <label|eq:2d.mh.final.subs><bw><rsub|i\<nocomma\>j><rsup|n+1>=<bw><rsub|i\<nocomma\>j><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|i>>*<around|(|<ff><rsub|<iph>,j><rsup|n+<half>>-<ff><rsub|<imh>,j><rsup|n+<half>>|)>-<frac|\<Delta\>*t|\<Delta\>*y<rsub|j>>*<around|(|<value|fg><rsub|i,<jph>><rsup|n+<half>>-<value|fg><rsub|i,<jmh>><rsup|n+<half>>|)>
  </equation>

  where the numerical fluxes are computed as

  <\equation*>
    <ff><rsub|<iph>,j><rsup|n+<half>>=<ff><around*|(|<unphpx><rsub|i\<nocomma\>j>,<unphmx><rsub|i+1,j>|)>,<space|2em><value|fg><rsub|i,<jph>><rsup|n+<half>>=<value|fg><around*|(|<unphpy><rsub|i\<nocomma\>j>,<unphmy><rsub|i,j+1>|)>
  </equation*>

  As in the previous step, the expression<nbsp><eqref|eq:2d.mh.final.subs> is
  split in to a convex combination

  <\equation*>
    <bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+1>=k<rsub|x>*<value|bzeta><rsub|i\<nocomma\>j><rsup|x>+k<rsub|y>*<value|bzeta><rsub|i\<nocomma\>j><rsup|y>
  </equation*>

  where

  <\equation*>
    <value|bzeta><rsub|\<nocomma\>i\<nocomma\>j><rsup|x>\<assign\><bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|i>>*<around|(|<ff><rsub|<iph>,j><rsup|n+<half>>-<ff><rsub|<imh>,j><rsup|n+<half>>|)>,<space|2em><value|bzeta><rsub|\<nocomma\>i\<nocomma\>j><rsup|y>\<assign\><bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|j>>*<around|(|<value|fg><rsub|i,<jph>><rsup|<nph>>-<value|fg><rsub|i,<jmh>><rsup|<nph>>|)>
  </equation*>

  for some <math|k<rsub|x>,k<rsub|y>\<ge\>0> with
  <math|k<rsub|x>+k<rsub|y>=1>. The admissibility of
  <math|<value|bzeta><rsub|i\<nocomma\>j><rsup|x>>, and
  <math|<value|bzeta><rsub|i\<nocomma\>j><rsup|y>> will imply the
  admissibility of <math|<bw><rsub|\<nocomma\>><rsup|n+1>>. The admissibility
  of <math|<value|bzeta><rsub|\<nocomma\>><rsup|x>,<value|bzeta><rsub|\<nocomma\>><rsup|y>>
  will follow exactly as from the procedure in 1-D
  (Lemma<nbsp><reference|lemma:muscl.step2.general>) with appropriate time
  step restrictions and assumption of admissibility of terms
  <math|<unphpmx><rsub|\<nocomma\>>,<unphpmy><rsub|\<nocomma\>>,<unphsx><rsub|\<nocomma\>i\<nocomma\>j>,<unphsy><rsub|\<nocomma\>i\<nocomma\>j>>
  for <math|<unphsx><rsub|\<nocomma\>i\<nocomma\>j>,<unphsy><rsub|\<nocomma\>i\<nocomma\>j>>
  defined as

  <\equation>
    <label|eq:unphsxy>

    <\eqsplit>
      <tformat|<table|<row|<cell|<mumx>*<unphmx><rsub|\<nocomma\>i\<nocomma\>j>+<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+<frac|1|2>,\<ast\>x>+<mupx>*<unphpx><rsub|\<nocomma\>i\<nocomma\>j>>|<cell|=2*<bw><rsub|\<nocomma\>><rsup|n>>>|<row|<cell|<mumy>*<unphmy><rsub|\<nocomma\>i\<nocomma\>j>+<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+<frac|1|2>,\<ast\>y>+<mupy>*<unphpy><rsub|i\<nocomma\>j\<nocomma\>>>|<cell|=2*<bw><rsub|\<nocomma\>><rsup|n>>>>>
    </eqsplit>
  </equation>

  The precise CFL restrictions and admissibility constraints are in the
  following Lemma<nbsp><reference|lemma:2d.muscl.step2.general>.

  <\lemma>
    <label|lemma:2d.muscl.step2.general>Assume that the states
    <math|<around*|{|<unphpmx><rsub|i\<nocomma\>j>,<unphpmy><rsub|\<nocomma\>i\<nocomma\>j>,<unphsx><rsub|i\<nocomma\>j\<nocomma\>>,<unphsy><rsub|i\<nocomma\>j\<nocomma\>>|}><rsub|i,j>>
    belong to <math|<Uad>>, where <math|<unphsx><rsub|i\<nocomma\>j\<nocomma\>>,<unphsy><rsub|i\<nocomma\>j\<nocomma\>>>
    are defined as in<nbsp><eqref|eq:unphsxy>. Then, the updated solution
    <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+1>> of MUSCL-Hancock
    scheme is in <math|<Uad>> under the CFL conditions

    <\with|font-base-size|9>
      <math|<label|eq:2d.new.cfl2>>

      <\equation>
        <tabular*|<tformat|<table|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|\<nocomma\>i\<nocomma\>j>,<unphsx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|x<rsub|i>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>i\<nocomma\>j>,<unphpx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|\<nocomma\>i\<nocomma\>j>,<unphmx><rsub|i+1,j>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|i-1,j>,<unphmx><rsub|\<nocomma\>>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|x<rsub|i>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|\<nocomma\>i\<nocomma\>j>,<unphsx><rsub|i\<nocomma\>j\<nocomma\>>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>i\<nocomma\>j>,<unphpx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|\<nocomma\>i\<nocomma\>j>,<unphsx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|x<rsub|i>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>i\<nocomma\>j>,<unphpx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|\<nocomma\>i\<nocomma\>j>,<unphmx><rsub|i+1,j>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|i-1,j>,<unphmx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|x<rsub|i>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|i\<nocomma\>j\<nocomma\>>,<unphsx><rsub|i\<nocomma\>j\<nocomma\>>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>i\<nocomma\>j>,<unphpx><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|y<rsub|j>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unphmy><rsub|\<nocomma\>i\<nocomma\>j>,<unphsy><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|y<rsub|j>>*\<sigma\><rsub|y><around*|(|<unphsy><rsub|i\<nocomma\>j\<nocomma\>>,<unphpy><rsub|i\<nocomma\>j\<nocomma\>>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|y<rsub|j>>|<mupy>>*\<sigma\><rsub|y><around*|(|<unphpy><rsub|\<nocomma\>i\<nocomma\>j>,<unphmy><rsub|i,j+1>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|y<rsub|j>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unphpy><rsub|i,j-1>,<unphmy><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|y<rsub|j>>*\<sigma\><rsub|y><around*|(|<unphmy><rsub|\<nocomma\>i\<nocomma\>j>,<unphsy><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|y<rsub|j>>|<mupy>>*\<sigma\><rsub|y><around*|(|<unphsy><rsub|\<nocomma\>i\<nocomma\>j>,<unphpy><rsub|i\<nocomma\>j\<nocomma\>>|)>\<leq\>1>>>>>
      </equation>
    </with>

    where <math|\<lambda\><rsub|x<rsub|i>>=<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|i>>,\<lambda\><rsub|y<rsub|j>>=<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|j>>>
    for all <math|i,j>.
  </lemma>

  As in 1-D, we now show that admissibility of
  <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+<frac|1|2>,\<ast\>x>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+<frac|1|2>,\<ast\>y>>
  can also be reduced to admissibility of
  <math|<uspmx><rsub|\<nocomma\>i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j\<nocomma\>>>,
  similar to Lemma<nbsp><reference|lemma:muscl.step3.conservative>. Expanding
  the definition of <math|<unphsy><rsub|\<nocomma\>i\<nocomma\>j>> gives us

  <\equation>
    <bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>=2*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<around|(|<mumy>*<unmy><rsub|\<nocomma\>i\<nocomma\>j>+<mupy><unpy><rsub|i\<nocomma\>j\<nocomma\>>|)>-<frac|\<Delta\>*t|\<Delta\>*x<rsub|i>>*<around*|(|<ff><around|(|<unmx><rsub|\<nocomma\>i\<nocomma\>j>|)>-<ff><around|(|<unpx><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>-<frac|\<Delta\>*t|\<Delta\>*y<rsub|j>>*<around*|(|<value|fg><around|(|<unmy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<value|fg><around|(|<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>
  </equation>

  If we obtain the admissibility of

  <\equation>
    <value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*x>\<assign\>2*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<around|(|<mumy><unmy><rsub|\<nocomma\>i\<nocomma\>j>+<mupy><unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<frac|\<Delta\>*t|k<rsub|x>*\<Delta\>*x<rsub|i>>*<around*|(|<ff><around*|(|<unmx><rsub|i\<nocomma\>j\<nocomma\>>|)>-<ff><around*|(|<unpx><rsub|i\<nocomma\>j\<nocomma\>>|)>|)><label|eq:adm2.coeff1>
  </equation>

  and

  <\equation>
    <value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*y>\<assign\>2*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<around|(|<mumy><unmy><rsub|\<nocomma\>i\<nocomma\>j>+<mupy><unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<frac|\<Delta\>*t|k<rsub|y>*\<Delta\>*y<rsub|j>>*<around*|(|<value|fg><around*|(|<unmy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<value|fg><around*|(|<unpy><rsub|i\<nocomma\>j\<nocomma\>>|)>|)><label|eq:adm2.coeff2>
  </equation>

  for some <math|k<rsub|x>,k<rsub|y>\<in\><around|[|0,1|]>> with
  <math|k<rsub|x>+k<rsub|y>=1>, then the admissibility of
  <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>> follows as
  we can write it as a convex combination

  <\align*>
    <tformat|<table|<row|<cell|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>=k<rsub|x>*<value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*x>+k<rsub|y>*<value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*x>>>>>
  </align*>

  and obtain the admissibility of <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>>.
  Thus, we need to limit the slope so that<nbsp>(<reference|eq:adm2.coeff1>,
  <reference|eq:adm2.coeff2>) are admissibile. To that end, define
  <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*x>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*y>>
  to satisfy

  <\align*>
    <tformat|<table|<row|<cell|<mumx>*<unmx><rsub|i\<nocomma\>j\<nocomma\>>+<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*x>+<mupx>*<unpx><rsub|\<nocomma\>i\<nocomma\>j>=>|<cell|2*<around*|(|2*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<around|(|<mumy>*<unmy><rsub|i\<nocomma\>j\<nocomma\>>+<mupy>*<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>>>|<row|<cell|<mumy>*<unmy><rsub|\<nocomma\>i\<nocomma\>j>+<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*y>+<mupy>*<unpy><rsub|\<nocomma\>i\<nocomma\>j>=>|<cell|2*<around*|(|2*<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>-<around|(|<mumy>*<unmy><rsub|i\<nocomma\>j\<nocomma\>>+<mupy>*<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>>>>>
  </align*>

  respectively. Consequently,

  <\align*>
    <tformat|<table|<row|<cell|<value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*x>>|<cell|=<frac|1|2>*<around|(|<mumx>*<unmx><rsub|\<nocomma\>i\<nocomma\>j>+<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*x>+<mupx>*<unpx><rsub|\<nocomma\>i\<nocomma\>j>|)>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|i>>*<around*|(|<ff><around*|(|<unmx><rsub|\<nocomma\>i\<nocomma\>j>|)>-<ff><around*|(|<unpx><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>>>|<row|<cell|<value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*y>>|<cell|=<frac|1|2>*<around|(|<mumy>*<unmy><rsub|\<nocomma\>i\<nocomma\>j>+<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*y>+<mupy>*<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|j>>*<around*|(|<value|fg><around*|(|<unmy><rsub|\<nocomma\>i\<nocomma\>j>|)>-<value|fg><around*|(|<unpy><rsub|\<nocomma\>i\<nocomma\>j>|)>|)>>>>>
  </align*>

  Then, assuming the admissibility of <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*x>,<bw><rsub|i\<nocomma\>j\<nocomma\>><rsup|\<ast\>\<ast\>y*y>>
  and proceeding as in the proof of Lemma <reference|lemma:muscl.step3.wss>,
  we can ensure that <math|<value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*x>,<value|bet><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>y*y>\<in\><Uad>>
  and thus <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>\<in\><Uad>>.
  Furthermore, since the reconstruction is conservative

  <\equation*>
    <mumy>*<unmy><rsub|\<nocomma\>i\<nocomma\>j>+<mupy>*<unpy><rsub|\<nocomma\>i\<nocomma\>j>=<mumx>*<unmx><rsub|\<nocomma\>i\<nocomma\>j>+<mupx>*<unpx><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>
  </equation*>

  Thus, admissibility of <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*x>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*y>>
  is obtained as

  <\equation*>
    <bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*x>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|\<ast\>\<ast\>y*y>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>
  </equation*>

  The arguments for admissibility of <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>x>>
  are similar. The admissibility criteria of
  <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>x>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>>
  are summarised in the following lemma.

  <\lemma>
    <label|lemma:2d.muscl.step3.conservative>Assume that
    <math|<bw><rsub|i\<nocomma\>j><rsup|n>\<in\><Uad>> and
    <math|<unpmx><rsub|\<nocomma\>i\<nocomma\>j>,<unpmy><rsub|\<nocomma\>i\<nocomma\>j>\<in\><Uad>>
    for all <math|i,j> with conservative reconstruction. Also assume the CFL
    restrictions

    <\equation>
      <label|eq:2d.new.cfl3.conservative>

      <\eqsplit>
        <tformat|<table|<row|<cell|max<rsub|i,j>
        <frac|\<lambda\><rsub|x<rsub|i>>|<mumx>>*\<sigma\><rsub|x><around*|(|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>,<unmx><rsub|i\<nocomma\>j\<nocomma\>>|)>\<leq\>1,<space|2em>max<rsub|i,j>
        <frac|\<lambda\><rsub|x<rsub|i>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unpx><rsub|i\<nocomma\>j\<nocomma\>>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>|)>\<leq\>1>>|<row|<cell|max<rsub|i,j>
        <frac|\<lambda\><rsub|y<rsub|j>>|<mumy>>*\<sigma\><rsub|y><around*|(|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>,<unmy><rsub|\<nocomma\>i\<nocomma\>j>|)>\<leq\>1,<space|2em>max<rsub|i,j>
        <frac|\<lambda\><rsub|y<rsub|j>>|<mupy>>*\<sigma\><rsub|y><around*|(|<unpy><rsub|\<nocomma\>i\<nocomma\>j>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>|)>\<leq\>1>>>>
      </eqsplit>
    </equation>

    where <math|\<lambda\><rsub|x<rsub|i>>=<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|i>>,\<lambda\><rsub|y<rsub|j>>=<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|j>>>
    and <math|<mupmx>,<mupmy>> are defined in<nbsp><eqref|eq:muxy.defn>.
    Then, <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>x>,<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|<nph>,\<ast\>y>>
    defined in<nbsp><eqref|eq:unphsxy> are in <math|<Uad>>.
  </lemma>

  Combining Lemmas<nbsp><reference|lemma:m.h.step.1.2d>,<nbsp><reference|lemma:2d.muscl.step2.general>,<nbsp><reference|lemma:2d.muscl.step3.conservative>,
  we will have the 2-D result corresponding to Theorem
  <reference|thm:final.condn.conservative> with the same proof.

  <\theorem>
    <label|thm:final.condn.conservative.2d>Let
    <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>\<in\><Uad>> for all
    <math|i,j> and <math|<unpmx><rsub|i\<nocomma\>j>,<unpmy><rsub|\<nocomma\>i\<nocomma\>j>>
    be the conservative reconstructions defined as

    <\equation*>
      <unpmx><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+<around|(|x<rsub|<jpmh>>-x<rsub|i>|)>*<slope><rsup|x><rsub|i>,<space|2em><unpmy><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+<around|(|y<rsub|<jpmh>>-y<rsub|j>|)>*<slope><rsup|y><rsub|j>
    </equation*>

    so that <math|<uspmx><rsub|\<nocomma\>i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j\<nocomma\>>><nbsp><eqref|eq:ustar.2d>
    are given by

    <\equation*>
      <uspmx><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+2*<around|(|x<rsub|<jpmh>>-x<rsub|i>|)><slope><rsup|x><rsub|i>,<space|2em><uspmy><rsub|\<nocomma\>i\<nocomma\>j>=<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n>+2*<around|(|y<rsub|<jpmh>>-y<rsub|j>|)><slope><rsup|y><rsub|j>
    </equation*>

    Assume that the slopes <math|<slope><rsup|x><rsub|i>,<slope><rsup|y><rsub|j>>
    are chosen to satisfy <math|<uspmx><rsub|\<nocomma\>i\<nocomma\>j>,<uspmy><rsub|i\<nocomma\>j\<nocomma\>>\<in\><Uad>>
    for all <math|i,j> and that the CFL restrictions<nbsp>(<reference|eq:new.cfl1.2d>,
    <reference|eq:2d.new.cfl2>, <reference|eq:2d.new.cfl3.conservative>) are
    satisfied. Then the updated solution <math|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|n+1>>
    of MUSCL-Hancock procedure is in <math|<Uad>>.
  </theorem>

  <subsection|Limiting numerical flux in 2-D><label|sec:2d.admissibility>

  Consider the 2-D hyperbolic conservation
  law<nbsp><eqref|eq:2d.hyp.con.law>. The Lax-Wendroff update is

  <\equation*>
    <around|(|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|e>|)><rsup|n+1>=<around|(|<bw><rsub|\<nocomma\>i\<nocomma\>j><rsup|e>|)><rsup|n>-\<Delta\>t*<around*|[|<frac|1|\<Delta\>x<rsub|e>>*<pd|<value|F><rsub|h><rsup|<ee>>|\<xi\>><around|(|\<xi\><rsub|i>,\<xi\><rsub|j>|)>+<frac|1|\<Delta\>y<rsub|e>>*<pd|<value|G><rsub|h><rsup|<ee>>|<value|bet>><around|(|\<xi\><rsub|i>,\<xi\><rsub|j>|)>|]>,<space|2em>0\<le\>i,j\<le\>N
  </equation*>

  where <math|<value|F><rsup|<ee>><rsub|h>,G<rsup|<ee>><rsub|h>> are
  continuous time-averaged fluxes<nbsp><eqref|eq:frcontflux> in the
  <math|x,y> directions for the grid element
  <math|<ee>=<around|(|<ex>,<ey>|)>>. The reader is referred to
  <with|color|red|Section 10 of<nbsp><cite|babbar2022> for more details of
  the 2-D Lax-Wendroff Flux Reconstruction (LWFR) scheme. TODO - Refer to
  previous chapter.> Since the 2-D scheme is formed by taking a tensor
  product of the 1-D scheme, Theorem<nbsp><reference|thm:lwfr.admissibility>
  applies, i.e., the scheme will be admissibility preserving in means
  (Definition<nbsp><reference|defn:mean.pres>) if we choose the blended
  numerical flux such that the lower order updates are admissible at solution
  points adjacent to the interfaces. Thus, we now explain the process of
  constructing the numerical flux where, to minimize storage requirements and
  memory reads, we will perform the correction within the interface loop
  where only one of <math|x> or <math|y> flux will be available in one
  iteration. Thus theoretical justification for the algorithm comes from
  breaking 2-D lower order updates into 1-D convex combinations. The general
  structure of the LWFR Algorithm<nbsp><reference|alg:high.level.lw> will
  remain the same. Here, we justify Algorithm<nbsp><reference|alg:blended.flux.2d>
  for construction of blended <math|x> flux with knowledge of only the
  <math|x> flux. The algorithm for blended <math|y> fluxes will be analogous.

  We consider the calculation of the blended numerical flux for a corner
  solution point of the element, as this situation differs from 1-D, due to
  the fact that a corner solution point is adjacent to both <math|x> and
  <math|y> interfaces. In particular, we consider the bottom-left corner
  point <math|<bo>=<around|(|0,0|)>> and show that the procedure in
  Algorithm<nbsp><reference|alg:blended.flux.2d> ensures admissibility at
  such points. The same justification applies to other corner and non-corner
  points. For the element <math|<ee>=<around|(|<ex>,<ey>|)>>, denoting
  interfaces along <math|x,y> directions as <math|<eexpmh>>, <math|<eeypmh>>,
  we consider the update at the bottom left corner
  <math|<bo>=<around|(|0,0|)>>, suppressing the local solution point index
  <math|i=0> or <math|j=0> when considering the FR interface fluxes. The
  lower order update is given by

  <\align*>
    <tformat|<table|<row|<cell|<value|atu><rsub|<bo>><rsup|n+1>>|<cell|=<value|uebz><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>*w<rsub|0>>*<around|(|<value|pf><rsub|<around|(|<half>,0|)>><rsup|<ee>>-<value|atF><rsub|<eexmh>>|)>-<frac|\<Delta\>t|\<Delta\>*y<rsub|e>*w<rsub|0>>*<around|(|<value|pg><rsub|<around|(|0,<half>|)>><rsup|<ee>>-<value|atG><rsub|<eeymh>>|)>>>>>
  </align*>

  where <math|<value|atF><rsub|<eexmh>>,<atG><rsub|<eeymh>>> are
  heuristically guess candidates for the blended numerical
  flux<nbsp><eqref|eq:Fblend>. Pick <math|k<rsub|x>,k<rsub|y>\<gtr\>0> such
  that <math|k<rsub|x>+k<rsub|y>=1> and

  <\equation>
    <label|eq:low.update.2d>

    <\eqsplit>
      <tformat|<table|<row|<cell|<value|atu><rsub|x><rsup|<text|low>,n+1>>|<cell|=<around|(|u<rsub|<bo>><rsup|<math-bf|e>>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|e>*w<rsub|0>>*<around|(|<ff><rsup|<math-bf|e>><rsub|<around|(|<half>,0|)>>-<ff><rsub|<around|(|<exmh>,<ey>|)>>|)>>>|<row|<cell|<value|atu><rsub|y><rsup|<text|low>,n+1>>|<cell|=<around|(|u<rsub|<bo>><rsup|<math-bf|e>>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|e>*w<rsub|0>>*<around|(|<value|fg><rsup|<math-bf|e>><rsub|<around|(|0,<half>|)>>-<value|fg><rsub|<around|(|<ex>,<eymh>|)>>|)>>>>>
    </eqsplit>
  </equation>

  satisfy

  <\equation>
    <label|eq:2d.low.update.admissibility.condn><value|atu><rsub|x><rsup|<text|low>,n+1>,<value|atu><rsub|y><rsup|<text|low>,n+1>\<in\><Uad>
  </equation>

  Such <math|k<rsub|x>,k<rsub|y>> exist because the lower order scheme with
  lower order flux at element interfaces is admissibility preserving. The
  choice of <math|k<rsub|x>,k<rsub|y>> should be made so
  that<nbsp><eqref|eq:2d.low.update.admissibility.condn> is satisfied with
  the least time step restriction, but we have found the Fourier stability
  restriction imposed by<nbsp><eqref|eq:time.step.2d> to be sufficient even
  with the most trivial choice of <math|k<rsub|x>=k<rsub|y>=<half>>. The
  discussion of literature for the optimal choice of
  <math|k<rsub|x>,k<rsub|y>> is the same as the one made for the 2-D MUSCL
  Hancock scheme<nbsp><eqref|eq:kx.defn> and is not repeated here. After the
  choice of <math|k<rsub|x>,k<rsub|y>> is made, if we repeat the same
  procedure as in the 1-D case, we can perform slope limiting to find
  <math|<value|F><rsub|e<rsub|x>-<half>,e<rsub|y>>>,
  <math|<value|F><rsub|e<rsub|x>,e<rsub|y>-<half>>> such that
  <math|<value|fg>>

  <\align>
    <tformat|<table|<row|<cell|<value|atu><rsub|x><rsup|n+1>>|<cell|=<value|uebz><rsup|n>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|e>*w<rsub|0>>*<around|(|<ff><rsub|<around|(|<half>,0|)>><rsup|<math-bf|e>>-<value|F><rsub|<around|(|e<rsub|x>-<half>,e<rsub|y>|)>>|)><eq-number><label|eq:2d.adm.numflux.desired.x>>>|<row|<cell|<value|atu><rsub|y><rsup|n+1>>|<cell|=<value|uebz><rsup|n>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|e>*w<rsub|0>>*<around|(|<value|fg><rsup|<math-bf|e>><rsub|<around|(|0,<half>|)>>,-<value|bG><rsub|<around|(|e<rsub|x>,e<rsub|y>-<half>|)>>|)><eq-number><label|eq:2d.adm.numflux.desired.y>>>>>
  </align>

  are also in the admissible region. Then, we will get

  <\equation>
    <label|eq:2d.xy.implies.admissibility>k<rsub|x>*<value|atu><rsub|x><rsup|n+1>+k<rsub|y>*<value|atu><rsub|y><rsup|n+1>=<value|atu><rsub|<bo>><rsup|n+1>
  </equation>

  We now justify Algorithm<nbsp><reference|alg:blended.flux.2d> as follows.
  Algorithm<nbsp><reference|alg:blended.flux.2d> corrects the numerical
  fluxes during the loop over <math|x> interfaces to enforce admissibility of
  <math|<value|atu><rsub|x><rsup|n+1>><nbsp><eqref|eq:2d.adm.numflux.desired.x>
  at all solution points neighbouring <math|x> interfaces including the
  corner solution points, and the analogous algorithm for <math|y> interfaces
  will ensure admissibility of <math|<value|atu><rsub|y><rsup|n+1>><nbsp><eqref|eq:2d.adm.numflux.desired.y>
  at all solution points neighbouring <math|y> interfaces including the
  corner points. At the end of the loop over interfaces,
  <eqref|eq:2d.xy.implies.admissibility> will ensure that lower order updates
  at all solutions points neighbouring interfaces are admissible and
  Algorithm<nbsp><reference|alg:high.level.lw> will be an admissibility
  preserving Lax-Wendroff scheme for 2-D if we compute the blended numerical
  fluxes <math|<value|F><rsub|<around|(|e<rsub|x>+<half>,e<rsub|y>|)>>,<value|F><rsub|<around|(|e<rsub|x>,e<rsub|y>+<half>|)>>>
  using Algorithm<nbsp><reference|alg:blended.flux.2d> and its counterpart in
  the <math|y> direction.

  <with|color|red|Fix algorithm comments>

  <\specified-algorithm|<label|alg:blended.flux.2d>Computation of blended
  flux <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>> where
  <math|<around|(|e<rsub|x>+<half>,e<rsub|y>|)>> are the interface indices
  and <math|j\<in\><around|{|0,\<ldots\>,N|}>> is the solution point index on
  the interface>
    \ <with|font-series|bold|Input:> <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j><rsup|LW>,f<rsub|e<rsub|x>+<half>,e<rsub|y>,j>,f<rsup|<ex>+1,e<rsub|y>><rsub|<half>,j>,f<rsup|<ee>><rsub|<Nmh>,j>,u<rsub|<around|(|0,j|)>><rsup|<ex>+1,<ey>>,u<rsub|<around|(|0,j|)>><rsup|<ee>>,\<alpha\><rsub|<ee>>,\<alpha\><rsub|e<rsub|x>+1,e<rsub|y>>,k<rsup|e<rsub|x>,e<rsub|y>><rsub|x>,k<rsup|e<rsub|x>+1,e<rsub|y>><rsub|x>><next-line><with|font-series|bold|Output:>
    <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>>
    <algo-state|<math|<wide|\<alpha\>|\<bar\>>=<frac|\<alpha\><rsub|<ex>,<ey>>+\<alpha\><rsub|<ex>+1,<ey>>|2>>>

    <algo-state|<math|k<rsub|x><rsup|0>,k<rsub|x><rsup|N>=k<rsub|x><rsup|<ex>,<ey>>,k<rsub|x><rsup|<ex>+1,<ey>>>
    <algo-comment|For ease of writing>>

    <algo-state|<math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>\<leftarrow\><around|(|1-<wide|\<alpha\>|\<bar\>>|)>*<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j><rsup|LW>+<wide|\<alpha\>|\<bar\>>*f<rsub|e<rsub|x>+<half>,e<rsub|y>,j>>
    <algo-comment|Heuristic guess to control oscillations>>

    <algo-state|<math|<value|atu><rsub|0><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e+1><rsub|0,j>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|0>*w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|f<rsup|<ex>+1,e<rsub|y>><rsub|<half>,j>-<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>|)>>
    <algo-comment|FV inner updates with guessed
    <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>>>>

    <algo-state|<math|<value|atu><rsub|N><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e><rsub|N,j>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|N>*w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>-f<rsup|<ee>><rsub|<around|(|<Nmh>,j|)>>|)>>>

    <algo-state|<math|<utilow><rsub|0>=<around|(|<bw><rsup|e+1><rsub|0,j>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|0>*w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|f<rsup|<ex>+1,<ey>><rsub|<half>,j>-f<rsub|e<rsub|x>+<half>,e<rsub|y>,j>|)>>
    <algo-comment|FV inner updates with <math|f<rsub|e<rsub|x>+<half>,e<rsub|y>,j>>>>

    <algo-state|<math|<utilow><rsub|N>=<around|(|<bw><rsup|e><rsub|N,j>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|N>*w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|f<rsub|e<rsub|x>+<half>,e<rsub|y>,j>-f<rsup|<ee>><rsub|<Nmh>,j>|)>>>

    <\algo-for|<math|k>=1:<math|K>>
      <algo-comment|Correct <math|<value|F><rsub|<exph>,e<rsub|y>,j>> for
      <math|K> admissibility constraints>

      <algo-state|<wide-tabular|<tformat|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
        <math|\<theta\>\<leftarrow\>min <around*|(|min<rsub|l=0,N><around*|\||<frac|\<epsilon\><rsub|l>-p<rsub|k><around|(|<wide|<bw>|~><rsub|l><rsup|n+1>|)>|p<rsub|k><around|(|<wide|<bw>|~><rsub|l><rsup|<text|low>,n+1>|)>-p<rsub|k><around|(|<wide|<bw>|~><rsub|l><rsup|n+1>|)>>|\|>,1|)>>
      </cell>|<\cell>
        \;
      </cell>>>>>>

      <algo-state|<math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>\<leftarrow\>\<theta\>*<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>+<around|(|1-\<theta\>|)>*f<rsub|e<rsub|x>+<half>,e<rsub|y>,j>>>

      <algo-state|<math|<value|atu><rsub|0><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e+1><rsub|0,j>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|0>*w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|f<rsup|<ex>+1,<ey>><rsub|<half>,j>-<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>|)>>
      <algo-comment|FV inner updates with guessed
      <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>>>>

      <algo-state|<math|<value|atu><rsub|N><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e><rsub|N,j>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|N>*w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,j>-f<rsup|<ee>><rsub|<around|(|<Nmh>,j|)>>|)>>>
    </algo-for>
  </specified-algorithm>

  <with|color|black| >
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|3>
    <associate|page-first|64>
    <associate|page-medium|paper>
    <associate|preamble|false>
    <associate|section-nr|0>
    <associate|subsection-nr|4>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:blended.flux.2d|<tuple|A.1|102>>
    <associate|alg:high.level.lw|<tuple|4.1|75>>
    <associate|auto-1|<tuple|4|65>>
    <associate|auto-10|<tuple|4.3|71>>
    <associate|auto-11|<tuple|4.20|72>>
    <associate|auto-12|<tuple|4.4|73>>
    <associate|auto-13|<tuple|4.5|75>>
    <associate|auto-14|<tuple|4.6|76>>
    <associate|auto-15|<tuple|4.6.1|76>>
    <associate|auto-16|<tuple|4.6.1.1|77>>
    <associate|auto-17|<tuple|4.3|77>>
    <associate|auto-18|<tuple|4.6.1.2|77>>
    <associate|auto-19|<tuple|4.4|78>>
    <associate|auto-2|<tuple|4.1|65>>
    <associate|auto-20|<tuple|4.6.1.3|78>>
    <associate|auto-21|<tuple|4.5|78>>
    <associate|auto-22|<tuple|4.6.1.4|78>>
    <associate|auto-23|<tuple|4.6|79>>
    <associate|auto-24|<tuple|4.7|79>>
    <associate|auto-25|<tuple|4.7|79>>
    <associate|auto-26|<tuple|4.8|80>>
    <associate|auto-27|<tuple|4.8|80>>
    <associate|auto-28|<tuple|4.8.1|81>>
    <associate|auto-29|<tuple|4.9|81>>
    <associate|auto-3|<tuple|4.2|67>>
    <associate|auto-30|<tuple|4.8.2|81>>
    <associate|auto-31|<tuple|4.10|82>>
    <associate|auto-32|<tuple|4.8.3|82>>
    <associate|auto-33|<tuple|4.11|83>>
    <associate|auto-34|<tuple|4.8.4|83>>
    <associate|auto-35|<tuple|4.12|84>>
    <associate|auto-36|<tuple|4.8.5|84>>
    <associate|auto-37|<tuple|4.13|85>>
    <associate|auto-38|<tuple|4.8.6|85>>
    <associate|auto-39|<tuple|4.14|85>>
    <associate|auto-4|<tuple|4.2.1|67>>
    <associate|auto-40|<tuple|4.15|86>>
    <associate|auto-41|<tuple|4.8.7|86>>
    <associate|auto-42|<tuple|4.16|86>>
    <associate|auto-43|<tuple|4.8.8|87>>
    <associate|auto-44|<tuple|4.17|87>>
    <associate|auto-45|<tuple|4.9|88>>
    <associate|auto-46|<tuple|A|89>>
    <associate|auto-47|<tuple|A.1|89>>
    <associate|auto-48|<tuple|A.1|89>>
    <associate|auto-49|<tuple|A.2|90>>
    <associate|auto-5|<tuple|4.2.2|67>>
    <associate|auto-50|<tuple|A.3|91>>
    <associate|auto-51|<tuple|A.2|92>>
    <associate|auto-52|<tuple|A.3|93>>
    <associate|auto-53|<tuple|A.4|95>>
    <associate|auto-54|<tuple|A.4|96>>
    <associate|auto-55|<tuple|A.5|97>>
    <associate|auto-56|<tuple|A.5.1|97>>
    <associate|auto-57|<tuple|A.5.2|99>>
    <associate|auto-58|<tuple|A.5.3|101>>
    <associate|auto-6|<tuple|4.1|68>>
    <associate|auto-7|<tuple|4.2.3|69>>
    <associate|auto-8|<tuple|4.2|70>>
    <associate|auto-9|<tuple|4.2.4|70>>
    <associate|ch:lw.subcell.limiter|<tuple|4|65>>
    <associate|defn:adm.pres|<tuple|4.1|66>>
    <associate|defn:mean.pres|<tuple|4.2|66>>
    <associate|eq:2DMH1|<tuple|A.23|97>>
    <associate|eq:2DMH2|<tuple|A.24|97>>
    <associate|eq:2DMH3|<tuple|A.25|97>>
    <associate|eq:2Dupdates|<tuple|A.28|97>>
    <associate|eq:2d.adm.numflux.desired.x|<tuple|A.44|101>>
    <associate|eq:2d.adm.numflux.desired.y|<tuple|A.45|101>>
    <associate|eq:2d.hyp.con.law|<tuple|A.1|89>>
    <associate|eq:2d.low.update.admissibility.condn|<tuple|A.43|101>>
    <associate|eq:2d.mh.final.subs|<tuple|A.35|99>>
    <associate|eq:2d.new.cfl2|<tuple|A.10|99>>
    <associate|eq:2d.new.cfl3.conservative|<tuple|A.41|100>>
    <associate|eq:2d.xy.implies.admissibility|<tuple|A.46|101>>
    <associate|eq:2dvaradv.chblend|<tuple|4.24|79>>
    <associate|eq:Fblend|<tuple|4.11|69>>
    <associate|eq:adm2.coeff1|<tuple|A.39|99>>
    <associate|eq:adm2.coeff2|<tuple|A.40|100>>
    <associate|eq:all.fvm.updates|<tuple|A.13|93>>
    <associate|eq:blended.scheme|<tuple|4.7|68>>
    <associate|eq:con.law|<tuple|4.1|65>>
    <associate|eq:con.law.dt|<tuple|A.8|91>>
    <associate|eq:conv.pres.con.law|<tuple|4.6|66>>
    <associate|eq:delta.defn|<tuple|4.15|71>>
    <associate|eq:dt.lw|<tuple|4.23|76>>
    <associate|eq:evolution|<tuple|4.17|72>>
    <associate|eq:evolution.general|<tuple|A.5|90>>
    <associate|eq:fo.at.face|<tuple|4.13|71>>
    <associate|eq:fravgup|<tuple|4.5|66>>
    <associate|eq:frcontflux|<tuple|4.4|66>>
    <associate|eq:kx.defn|<tuple|A.31|98>>
    <associate|eq:low.order.cell.avg.update|<tuple|4.10|68>>
    <associate|eq:low.order.tilde.update|<tuple|4.22|74>>
    <associate|eq:low.order.update|<tuple|4.9|68>>
    <associate|eq:low.update.2d|<tuple|A.42|101>>
    <associate|eq:mh.at.face|<tuple|4.18|72>>
    <associate|eq:mu.pm|<tuple|A.7|90>>
    <associate|eq:muscl.final.general|<tuple|A.6|90>>
    <associate|eq:muxy.defn|<tuple|A.27|97>>
    <associate|eq:new.cfl1|<tuple|A.11|91>>
    <associate|eq:new.cfl1.2d|<tuple|A.34|98>>
    <associate|eq:new.cfl2|<tuple|A.14|93>>
    <associate|eq:new.cfl3|<tuple|A.18|94>>
    <associate|eq:new.cfl3.conservative|<tuple|A.20|95>>
    <associate|eq:non.cell.centred.defn|<tuple|A.3|89>>
    <associate|eq:non.con.face.defn1|<tuple|A.22|96>>
    <associate|eq:numflux.admissibility.cfl|<tuple|A.2|89>>
    <associate|eq:pk.slope.correction|<tuple|4.21|73>>
    <associate|eq:reconstruction|<tuple|4.16|71>>
    <associate|eq:reconstruction.general|<tuple|A.4|90>>
    <associate|eq:riemann.problem|<tuple|4.14|71>>
    <associate|eq:smoothing|<tuple|4.12|70>>
    <associate|eq:subcell.defn|<tuple|4.8|68>>
    <associate|eq:time.step.2d|<tuple|4.25|80>>
    <associate|eq:uad.form|<tuple|4.2|65>>
    <associate|eq:uj.nph.s|<tuple|A.12|93>>
    <associate|eq:uj.nph.s.explicit|<tuple|A.15|94>>
    <associate|eq:ujph.s.identity|<tuple|A.19|94>>
    <associate|eq:unphsxy|<tuple|A.36|99>>
    <associate|eq:update.x.combination|<tuple|A.29|98>>
    <associate|eq:update.x.combination2|<tuple|A.30|98>>
    <associate|eq:us.conservative|<tuple|A.21|96>>
    <associate|eq:us.defn.main|<tuple|4.19|72>>
    <associate|eq:uss.defn|<tuple|A.16|94>>
    <associate|eq:ustar.2d|<tuple|A.26|97>>
    <associate|eq:ustar.defn|<tuple|A.10|91>>
    <associate|eq:ustar.in.uad|<tuple|4.20|72>>
    <associate|eq:wss.simplified|<tuple|A.17|94>>
    <associate|eq:xi0.defn|<tuple|4.3|65>>
    <associate|fig:ShuOsher.chblend|<tuple|4.3|77>>
    <associate|fig:alpha.func|<tuple|4.2|70>>
    <associate|fig:astrophysical.jet|<tuple|4.13|85>>
    <associate|fig:blast.chblend|<tuple|4.4|78>>
    <associate|fig:blast.periodic|<tuple|4.15|86>>
    <associate|fig:blast.periodic.reference|<tuple|4.14|85>>
    <associate|fig:composite.signal.2d|<tuple|4.8|80>>
    <associate|fig:dmr|<tuple|4.11|83>>
    <associate|fig:double.rarefaction|<tuple|4.6|79>>
    <associate|fig:forward.step|<tuple|4.17|87>>
    <associate|fig:fv.evolution|<tuple|A.3|93>>
    <associate|fig:general.grid|<tuple|A.1|89>>
    <associate|fig:isentropic.convergence.chblend|<tuple|4.9|81>>
    <associate|fig:kh|<tuple|4.12|84>>
    <associate|fig:leblanc|<tuple|4.7|79>>
    <associate|fig:non.interacting.rp1|<tuple|A.2|92>>
    <associate|fig:non.interacting.rp2|<tuple|A.4|95>>
    <associate|fig:rp2d|<tuple|4.10|82>>
    <associate|fig:sedov.blast|<tuple|4.5|78>>
    <associate|fig:shock.diffraction|<tuple|4.16|86>>
    <associate|fig:subcells|<tuple|4.1|68>>
    <associate|lemma:2d.muscl.step2.general|<tuple|A.10|99>>
    <associate|lemma:2d.muscl.step3.conservative|<tuple|A.11|100>>
    <associate|lemma:avg.riemann.problem|<tuple|A.9|91>>
    <associate|lemma:m.h.step.1|<tuple|A.2|91>>
    <associate|lemma:m.h.step.1.2d|<tuple|A.9|98>>
    <associate|lemma:muscl.step2.general|<tuple|A.3|93>>
    <associate|lemma:muscl.step3.conservative|<tuple|A.5|95>>
    <associate|lemma:muscl.step3.wss|<tuple|A.4|94>>
    <associate|rmk:mh.restriction.for.fr|<tuple|A.7|96>>
    <associate|rmk:why.same.flux|<tuple|4.3|69>>
    <associate|sec:2d.admissibility|<tuple|A.5.3|101>>
    <associate|sec:2d.mh|<tuple|A.5|97>>
    <associate|sec:admissibility.preservation|<tuple|4.4|73>>
    <associate|sec:alg|<tuple|4.5|75>>
    <associate|sec:blast.chblend|<tuple|4.6.1.2|77>>
    <associate|sec:blending.scheme|<tuple|4.2.2|67>>
    <associate|sec:controlling.oscillations|<tuple|4.2|67>>
    <associate|sec:dmr|<tuple|4.8.3|82>>
    <associate|sec:fo|<tuple|4.2.4|70>>
    <associate|sec:mh|<tuple|4.3|71>>
    <associate|sec:mh.adm|<tuple|A.3|91>>
    <associate|sec:muscl.admissibility.proof|<tuple|A|89>>
    <associate|sec:num.results.chblend|<tuple|4.6|76>>
    <associate|sec:res1dsys.chblend|<tuple|4.6.1|76>>
    <associate|sec:sedov.blast.1d|<tuple|4.6.1.3|78>>
    <associate|sec:shuosher.blend|<tuple|4.6.1.1|77>>
    <associate|sec:smooth.ind|<tuple|4.2.3|69>>
    <associate|sec:sum.blend|<tuple|4.9|88>>
    <associate|sec:tvd|<tuple|4.2.1|67>>
    <associate|thm:final.condn.conservative|<tuple|A.6|95>>
    <associate|thm:final.condn.conservative.2d|<tuple|A.12|100>>
    <associate|thm:lwfr.admissibility|<tuple|4.5|73>>
    <associate|thm:muscl.admissibility.theorem|<tuple|4.4|72>>
    <associate|thm:non.conservative.mh|<tuple|A.8|96>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      babbar2022

      zhang2010c

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989

      Rusanov1962

      Persson2006

      klockner2011

      henemann2021

      henemann2021

      Canuto2007

      Persson2006

      henemann2021

      henemann2021

      Rusanov1962

      vanleer1984

      Berthon2006

      Berthon2006

      Rusanov1962

      vanleer1977

      Berthon2006

      Berthon2006

      meena2017

      ramirez2021

      ramirez2021

      Zhang2010b

      moe2017

      moe2017

      ramirez2021

      Zhang2010b

      Zhang2010b

      ramirez2021

      Zhang2010b

      Zhang2010b

      ramirez2021

      babbar2022

      henemann2021

      Ranocha2022

      tenkai

      paperrepo

      babbar2022

      Shu1989

      Qiu2005b

      Woodward1984

      Qiu2005b

      sedov1959

      zhang2012

      Zhang2010b

      LeVeque1996

      babbar2022

      henemann2021

      Ranocha2022

      Yee1999

      Spiegel2016

      Glimm1985

      Zhang1990

      Lax1998

      Zhang1990

      Lax1998

      Woodward1984

      Volker2010

      Volker2010

      ha2005

      zhang2010c

      ramirez2021

      Takayama1991

      henemann2021

      naca1951

      henemann2021

      emery1968

      Woodward1984

      babbar2022

      henemann2021

      zhang2010c

      henemann2021

      Berthon2006

      Berthon2006

      babbar2022

      Zhang2010b

      Cui2023

      babbar2022
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|4.1>||Subcells used by
      lower order scheme for degree <with|mode|<quote|math>|N=4>.>|<pageref|auto-6>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.2>||Logistic function
      used to map energy to a smoothness coefficient
      <with|mode|<quote|math>|\<alpha\>\<in\><around|[|0,1|]>> shown for
      various solution polynomial degrees
      <with|mode|<quote|math>|N>.>|<pageref|auto-8>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.3>||Shu-Osher
      problem, numerical solution with degree <with|mode|<quote|math>|N=4>
      using first order (FO) and MUSCL-Hancock (MH) blending schemes, and TVB
      limited scheme (TVB-300) with parameter <with|mode|<quote|math>|M=300>.
      (a) Full and (b) zoomed density profiles of numerical solutions are
      shown up to time <with|mode|<quote|math>|t=1.8> on a mesh of 400
      cells.>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.4>||Blast wave
      problem, numerical solution with degree <with|mode|<quote|math>|N=4>
      using first order (FO) and MUSCL-Hancock (MH) blending schemes, and TVB
      limited scheme (TVB-300) with parameter <with|mode|<quote|math>|M=300>.
      (a) Density, (b) pressure profiles are shown at time
      <with|mode|<quote|math>|t=0.038> on a mesh of 400
      cells.>|<pageref|auto-19>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.5>||Sedov's blast
      wave problem, numerical solution with degree
      <with|mode|<quote|math>|N=4> using first order (FO) and MUSCL-Hancock
      blending schemes. (a) Density and (b) pressure profiles of numerical
      solutions are plotted at time <with|mode|<quote|math>|t=0.001> on a
      mesh of <with|mode|<quote|math>|201> cells.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.6>||Double
      rarefaction problem, numerical solution with degree
      <with|mode|<quote|math>|N=4> using first order (FO) and MUSCL-Hancock
      (MH) blending. (a) Density and (b) pressure profiles of numerical
      solutions are plotted at <with|mode|<quote|math>|t=0.6> on a mesh of
      <with|mode|<quote|math>|200> cells.>|<pageref|auto-23>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.7>||Leblanc's test,
      numerical solution with polynomial degree <with|mode|<quote|math>|N=4>
      using first order (FO) and MUSCL-Hancock (MH) blending. (a) Density and
      (b) pressure profiles of numerical solutions with log-scales are
      plotted at <with|mode|<quote|math>|t=0.001> on a mesh of
      <with|mode|<quote|math>|800> cells.>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.8>||Rotation of a
      composite signal with velocity <with|mode|<quote|math>|<rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-series|<quote|bold>|font-shape|<quote|right>|a>>>=<around|(|<frac|1|2>-y,x-<frac|1|2>|)>>,
      numerical solution with polynomial degree <with|mode|<quote|math>|N=4>
      on a mesh of <with|mode|<quote|math>|100<rsup|2>>
      elements.>|<pageref|auto-26>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.9>||Convergence
      analysis of isentropic vortex test for polynomial degrees
      <with|mode|<quote|math>|N=3,4> when (a) the blending limiter is active
      (b) no limiter is active.>|<pageref|auto-29>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.10>||2-D Riemann
      problem, density plots of numerical solution at
      <with|mode|<quote|math>|t=0.25> for degree <with|mode|<quote|math>|N=4>
      on a <with|mode|<quote|math>|256\<times\>256> mesh.>|<pageref|auto-31>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.11>||Double Mach
      reflection problem, density plots of numerical solution at
      <with|mode|<quote|math>|t=0.2> using polynomial degree
      <with|mode|<quote|math>|N=4> on a <with|mode|<quote|math>|600\<times\>150>
      mesh zoomed near the primary triple point. >|<pageref|auto-33>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.12>||Kelvin-Helmholtz
      instability, density plots of numerical solution at
      <with|mode|<quote|math>|t=0.4> using polynomial degree
      <with|mode|<quote|math>|N=4> with Rusanov flux on a
      <with|mode|<quote|math>|256<rsup|2>> element mesh.>|<pageref|auto-35>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.13>||Mach 2000
      astrophysical jet, density plot of numerical solution in log scales on
      <with|mode|<quote|math>|400\<times\>400> mesh at time
      <with|mode|<quote|math>|t=0.001>.>|<pageref|auto-37>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.14>||Sedov's blast
      test with periodic domain, density plot of numerical solution on
      <with|mode|<quote|math>|128\<times\>128> mesh in log scales with degree
      <with|mode|<quote|math>|N=4> at (a) <with|mode|<quote|math>|t=2> and
      (b) <with|mode|<quote|math>|t=20> with polynomial degree
      <with|mode|<quote|math>|N=4> computed using
      <with|font-family|<quote|tt>|Trixi.jl>.>|<pageref|auto-39>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.15>||Sedov's blast
      test with periodic domain, density plot of numerical solution on
      <with|mode|<quote|math>|64\<times\>64> mesh in log scales at
      <with|mode|<quote|math>|t=20> with degree
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-40>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.16>||Shock
      diffraction test, numerical solution at time
      <with|mode|<quote|math>|t=0.01> with degree
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-42>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.17>||Forward facing
      step, density plots of numerical solution at time
      <with|mode|<quote|math>|t=3.0>. The meshes are formed by taking grid
      spacing <with|mode|<quote|math>|\<Delta\>x<rsub|max>=\<Delta\>y<rsub|max>>
      away from the corner and smaller grid spacing
      <with|mode|<quote|math>|\<Delta\>x<rsub|min>=\<Delta\>y<rsub|min>=<frac|1|4>*\<Delta\>x<rsub|max>>
      near the corner.>|<pageref|auto-44>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|A.1>||Non-uniform,
      non-cell-centered finite volume grid>|<pageref|auto-48>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|A.2>||Two
      non-interacting Riemann problems>|<pageref|auto-51>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|A.3>||Finite volume
      evolution>|<pageref|auto-52>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|A.4>||Two
      non-interacting Riemann problems>|<pageref|auto-53>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|4.<space|2spc>Admissibility
      preserving subcell based blending limiter for Lax-Wendroff Flux
      Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      4.1.<space|2spc>Lax-Wendroff FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      4.2.<space|2spc>On controlling oscillations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <with|par-left|<quote|1tab>|4.2.1.<space|2spc>TVD limiter
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|4.2.2.<space|2spc>Blending scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|4.2.3.<space|2spc>Smoothness indicator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2.4.<space|2spc>First order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      4.3.<space|2spc>Higher order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|Slope limiting in practice
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      4.4.<space|2spc>Flux limiter for admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      4.5.<space|2spc>Some implementation details
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      4.6.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      <with|par-left|<quote|1tab>|4.6.1.<space|2spc>1-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|4.6.1.1.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|2tab>|4.6.1.2.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|2tab>|4.6.1.3.<space|2spc>Sedov's blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|2tab>|4.6.1.4.<space|2spc>Riemann problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      4.7.<space|2spc>2-D advection equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      4.8.<space|2spc>2-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      <with|par-left|<quote|1tab>|4.8.1.<space|2spc>Isentropic vortex
      convergence test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|4.8.2.<space|2spc>2-D Riemann problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|1tab>|4.8.3.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1tab>|4.8.4.<space|2spc>Kelvin-Helmholtz
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|1tab>|4.8.5.<space|2spc>Astrophysical jet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|1tab>|4.8.6.<space|2spc>Sedov's blast case with
      periodic boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|1tab>|4.8.7.<space|2spc>Detonation shock
      diffraction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|1tab>|4.8.8.<space|2spc>Forward facing step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      4.9.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      A.<space|2spc>Admissibility of MUSCL-Hancock scheme for general grids>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-46><vspace|0.5fn>

      A.1.<space|2spc>Review of MUSCL-Hancock scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>

      A.2.<space|2spc>Primary generalization for proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>

      A.3.<space|2spc>Proving admissibility
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      A.4.<space|2spc>Non-conservation reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>

      A.5.<space|2spc>MUSCL-Hancock scheme in 2-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>

      <with|par-left|<quote|1tab>|A.5.1.<space|2spc>First evolution step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1tab>|A.5.2.<space|2spc>Finite volume step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|1tab>|A.5.3.<space|2spc>Limiting numerical flux
      in 2-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>>
    </associate>
  </collection>
</auxiliary>