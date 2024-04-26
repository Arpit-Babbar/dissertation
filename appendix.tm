<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|british|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    <assign|q|<macro|<wide|u|~>>>

    <assign|fq|<macro|<wide|f|~>>>

    <assign|Fq|<macro|<wide|F|~>>>
  </hide-preamble>

  <appendix|ADER-FR and LWFR for linear problems>

  <section|Introduction>

  In addition to high order Lax-Wendroff schemes which have been studied in
  this thesis, this appendix considers the the family of Arbitrary high order
  schemes using DERivatives (ADER) initially introduced by the idea of a
  generalized Riemann solver<nbsp><cite|Toro2001> but later extended to
  Finite Volume / DG framework to obtain high order accuracy by using a
  predictor-corrector approach<nbsp><cite|Dumbser2008>. The local evolution
  in ADER schemes is performed by solving an element local implicit equation
  while the LW scheme uses an explicit Taylor's expansion. In this work, we
  prove, for linear problems, the equivalence of the ADER-DG scheme
  introduced in<nbsp><cite|Dumbser2008> with Lax-Wendroff FR (LWFR) using D2
  dissipation numerical flux introduced in Chapter<nbsp><reference|ch:lwfr>;
  the key observation used is that the space time predictor polynomial can be
  explicitly determined for linear problems. We remark that there are some
  works where both these ideas are considered as types of ADER schemes.
  However, in this work, we refer to ADER schemes as those which use a local
  implicit solver like in<nbsp><cite|Dumbser2008> while LW schemes as those
  that use a local Taylor's expansion like in
  Chapter<nbsp><reference|ch:lwfr> and<nbsp><cite|Qiu2005b|babbar2022>. The
  rest of this appendix is organized as follows. In
  Section<nbsp><reference|sec:ader.dg>, we review the ADER-DG scheme
  of<nbsp><cite|Dumbser2008> for 1-D scalar conservation laws and cast it in
  an FR framework for simplicity of the proof. In
  Section<nbsp><reference|sec:linear.equivalence>, we show the equivalence of
  ADER-FR scheme and the LWFR scheme with D2 dissipation flux
  of<nbsp>Chapter<nbsp><reference|ch:lwfr> for linear problems. In
  Section<nbsp><reference|sec:num>, we verify the equivalence numerically and
  draw conclusions in Section<nbsp><reference|sec:con>.

  <section|ADER Discontinuous Galerkin and Flux Reconstruction>
  <label|sec:ader.dg>The arguments in this work apply to linear conservation
  laws of any dimension but for simplicity we restrict ourselves to 1-D
  linear scalar conservation law

  <\equation>
    u<rsub|t>+f<around|(|u|)><rsub|x>=0,<space|2em>f<around|(|u|)>=a*u,<space|1em>a=const<label|eq:scalar.con.law>
  </equation>

  where <math|u> is some conserved quantity, together with some initial and
  boundary conditions. In this work, we consider the ADER-DG framework
  of<nbsp><cite|Dumbser2008>. We will divide the physical domain
  <math|\<Omega\>> into disjoint elements <math|\<Omega\><rsub|e>>, with
  <math|\<Omega\><rsub|e>=<around|[|x<rsub|<value|emh>>,x<rsub|<value|eph>>|]>>
  and <math|\<Delta\>x<rsub|e>=x<rsub|<value|eph>>-x<rsub|<value|emh>>>. The
  temporal discretization is performed by denoting the
  <math|n<rsup|<text|th>>> time interval as
  <math|<around|[|t<rsub|n>,t<rsub|n+1>|]>> and
  <math|\<Delta\>t<rsub|n>=t<rsub|n+1>-t<rsub|n>>. Let us map all spatial and
  temporal elements to reference elements
  <math|\<Omega\><rsub|e>\<to\><around|[|0,1|]>>,
  <math|<around|[|t<rsub|n>,t<rsub|n+1>|]>\<to\><around|[|0,1|]>> by

  <\equation*>
    x\<mapsto\>\<xi\>=<frac|x-x<rsub|<value|emh>>|\<Delta\>x<rsub|e>>,<space|2em>t\<mapsto\>\<tau\>=<frac|t-t<rsub|n>|\<Delta\>t<rsub|n>>
  </equation*>

  Thus, <math|x,t> are physical variables in space and time and
  <math|\<xi\>,\<tau\>> are the respective reference variables. Inside each
  element, we approximate the solution as <math|<poly><rsub|N>> functions
  which are polynomials of degree <math|N\<ge\>0>. For this, choose
  <math|N+1> distinct nodes <math|<around|{|\<xi\><rsub|i>|}><rsub|i=0><rsup|N>>
  in <math|<around|[|0,1|]>> which will be taken to be Gauss-Legendre (GL) or
  Gauss-Lobatto-Legendre (GLL) nodes, and will also be referred to as
  <with|font-shape|italic|solution points>. There are associated quadrature
  weights <math|w<rsub|j>> such that the quadrature rule is exact for
  polynomials of degree up to <math|2*N+1> for GL points and upto degree
  <math|2*N-1> for GLL points. Note that the nodes and weights we use are
  with respect to the interval <math|<around|[|0,1|]>> whereas they are
  usually defined for the interval <math|<around|[|-1,+1|]>>. For
  constructing the space-time predictor, we use the same solution points in
  time. The numerical solution inside an element <math|\<Omega\><rsub|e>> at
  <math|t=t<rsup|n>> is given by

  <\equation*>
    x\<in\>\<Omega\><rsub|e>:<space|2em>u<rsub|h><rsup|n><around|(|\<xi\>|)>=<big|sum><rsub|p=0><rsup|N>u<rsub|e,p>*\<ell\><rsub|p><around|(|\<xi\>|)>
  </equation*>

  where each <math|\<ell\><rsub|p>> is a Lagrange polynomial of degree
  <math|N> in <math|<around|[|0,1|]>> defined to satisfy
  <math|\<ell\><rsub|q><around|(|\<xi\><rsub|p>|)>=\<delta\><rsub|p\<nocomma\>q>>
  for <math|0\<leq\>p,q\<leq\>N>.

  <paragraph|Predictor step.>The predictor inside a space-time element is
  given by

  <\equation>
    <around|(|x,t|)>\<in\>\<Omega\><rsub|e>\<times\><around|[|t<rsub|n>,t<rsub|n+1>|]>:<space|2em><q><rsub|h><around|(|\<xi\>,\<tau\>|)>=<big|sum><rsub|p,q=0><rsup|N><q><rsub|e,p\<nocomma\>q>*\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|\<tau\>|)><label|eq:predictor.defn>
  </equation>

  Within each element <math|\<Omega\><rsub|e>>, we take a local space-time
  test function <math|\<ell\><rsub|p\<nocomma\>q>>

  <\equation*>
    <around|(|x,t|)>\<in\>\<Omega\><rsub|e>\<times\><around|[|t<rsub|n>,t<rsub|n+1>|]>:<space|2em>\<ell\><rsub|p\<nocomma\>q><around|(|\<xi\>,\<tau\>|)>=\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|\<tau\>|)>
  </equation*>

  To compute the cell-local predictor, we multiply the conservation
  law<nbsp><eqref|eq:scalar.con.law> by <math|\<ell\><rsub|p\<nocomma\>q>>
  and do an integration by parts in time

  <\equation>
    <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|\<Omega\><rsub|e>><q><rsub|h>*\<partial\><rsub|t>*\<ell\><rsub|p\<nocomma\>q>*<ud>x*<ud>t+<big|int><rsub|\<Omega\><rsub|e>><q><rsub|h><around|(|\<xi\>,1|)>*\<ell\><rsub|p\<nocomma\>q>*<ud>x-<big|int><rsub|\<Omega\><rsub|e>>u<rsub|h><rsup|n><around|(|\<xi\>|)>*\<ell\><rsub|p\<nocomma\>q>*<ud>x>>|<row|<cell|<space|2em>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|\<Omega\><rsub|e>><around|(|\<partial\><rsub|x>*<fq><rsub|h>|)>*\<ell\><rsub|p\<nocomma\>q>*<ud>x*<ud>t=0>>>>><label|eq:predictor.eqn>
  </equation>

  where <math|<fq><rsub|h>=a<q><rsub|h>>. The above system of
  equations<nbsp><eqref|eq:predictor.eqn> is solved for all
  <math|<q><rsub|e,p\<nocomma\>q>><nbsp><eqref|eq:predictor.defn>.

  <paragraph|Corrector step.>Integrate<nbsp><eqref|eq:scalar.con.law> over
  the space-time element <math|\<Omega\><rsub|e>\<times\><around|[|t<rsub|n>,t<rsub|n+1>|]>>
  with the test function <math|\<ell\><rsub|p>=\<ell\><rsub|p><around|(|\<xi\>|)>>
  and perform an integration by parts in space to get

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Omega\><rsub|e>>u<rsub|h><rsup|n+1>*\<ell\><rsub|p>*<ud>x>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|e>>u<rsub|h><rsup|n>*\<ell\><rsub|p>*<ud>x+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|\<Omega\><rsub|e>><fq><rsub|h>*\<partial\><rsub|x>*\<ell\><rsub|p>*<ud>x*<ud>t>>|<row|<cell|>|<cell|>|<cell|-\<ell\><rsub|p><around|(|1|)>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<rsub|<value|eph>><around|(|<q><rsub|h><around|(|t|)>|)>*<ud>t+\<ell\><rsub|p><around|(|0|)>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<rsub|<value|emh>><around*|(|<q><rsub|h><around|(|t|)>|)>*<ud>t>>>>><label|eq:ader.corr1>
  </equation>

  where, for the linear case, <math|f<rsub|<value|eph>><around*|(|<q><rsub|h><around|(|t|)>|)>>
  is the upwind flux

  <\equation>
    f<rsub|<value|eph>><around*|(|<q><rsub|h><around|(|t|)>|)>=<frac|a|2>*<around*|(|<q><rsub|h><around|(|x<rsub|<value|eph>><rsup|->,t|)>+<q><rsub|h><around|(|x<rsub|<value|eph>><rsup|+>,t|)>|)>-<frac|<around|\||a|\|>|2>*<around*|(|<q><rsub|h><around|(|x<rsub|<value|eph>><rsup|+>,t|)>-<q><rsub|h><around|(|x<rsub|<value|eph>><rsup|->,t|)>|)><label|eq:numflux.defn>
  </equation>

  The complete numerical scheme is given by space-time quadrature
  on<nbsp><eqref|eq:ader.corr1> at the solution points. By linearity of the
  flux, quadrature on the flux term in<nbsp><eqref|eq:ader.corr1> is exact as
  we use GL / GLL quadrature points and can thus perform another integration
  by parts in space to write

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Omega\><rsub|e>>u<rsub|h><rsup|n+1>*\<ell\><rsub|p>*<ud>x>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|e>>u<rsub|h><rsup|n>*\<ell\><rsub|p>*<ud>x-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|\<Omega\><rsub|e>><around|(|\<partial\><rsub|x>*<fq><rsub|h>|)>*\<ell\><rsub|p>*<ud>x*<ud>t>>|<row|<cell|>|<cell|>|<cell|-\<ell\><rsub|p><around|(|1|)>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around|(|f<rsub|<value|eph>><around|(|<q><rsub|h><around|(|t|)>|)>-<fq><rsub|h><around|(|1,t|)>|)>*<ud>t>>|<row|<cell|>|<cell|>|<cell|+\<ell\><rsub|p><around|(|0|)>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around|(|f<rsub|<value|emh>><around|(|<q><rsub|h><around|(|t|)>|)>-<fq><rsub|h><around|(|0,t|)>|)>*<ud>t>>>>>
  </equation*>

  Performing quadrature in space at solution points gives

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|u<rsub|p><rsup|n+1>>|<cell|=>|<cell|u<rsub|p><rsup|n>-<around*|[|\<partial\><rsub|x>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><fq><rsub|h><around|(|t|)>*<ud>t|]><rsub|p>>>|<row|<cell|>|<cell|>|<cell|-<frac|\<ell\><rsub|p><around|(|1|)>|\<Delta\>x<rsub|e>*w<rsub|p>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<rsub|<value|eph>><around*|(|<q><rsub|h><around|(|t|)>|)>-<fq><rsub|h><around|(|1,t|)>|)>*<ud>t>>|<row|<cell|>|<cell|>|<cell|+<frac|\<ell\><rsub|p><around|(|0|)>|\<Delta\>x<rsub|e>*w<rsub|p>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<rsub|<value|emh>><around*|(|<q><rsub|h><around|(|t|)>|)>-<fq><rsub|h><around|(|0,t|)>|)>*<ud>t>>>>>
  </equation*>

  We choose correction functions <math|g<rsub|L>,g<rsub|R>\<in\>\<bbb-P\><rsub|N+1>>
  to be <math|g<rsub|Radau>><nbsp><cite|Huynh2007> if the solution points are
  GL points and <math|<value|g2>><nbsp><cite|Huynh2007> if solution points
  are GLL. Then, by the identities<nbsp>(Appendix<nbsp><reference|app:equiv.dg.fr>)

  <\equation*>
    g<rsub|R><rprime|'><around|(|\<xi\><rsub|p>|)>=\<ell\><rsub|p><around|(|1|)>/w<rsub|p>,<space|2em>g<rsub|L><rprime|'><around|(|\<xi\><rsub|p>|)>=-\<ell\><rsub|p><around|(|0|)>/w<rsub|p>
  </equation*>

  and thus the correction step can be written in the FR form as

  <\equation>
    u<rsub|p><rsup|n+1>=u<rsub|p><rsup|n>-\<Delta\>t<rsub|n>*\<partial\><rsub|x>*<Fq><rsub|h><around|(|\<xi\><rsub|p>|)><label|eq:ader.evolution>
  </equation>

  where we define

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<Fq><rsub|h><around|(|\<xi\>|)>>|<cell|=>|<cell|<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><fq><rsub|h><around|(|\<xi\>,t|)>*<ud>t>>|<row|<cell|>|<cell|>|<cell|+<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|[|g<rsub|R><around|(|\<xi\>|)>*<around*|(|f<rsub|<value|eph>><around*|(|<q><rsub|h><around|(|t|)>|)>-<fq><rsub|h><around|(|1,t|)>|)>|]>*<ud>t>>|<row|<cell|>|<cell|>|<cell|+<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|[|g<rsub|L><around|(|\<xi\>|)>*<around*|(|f<rsub|<value|emh>><around*|(|<q><rsub|h><around|(|t|)>|)>-<fq><rsub|h><around|(|0,t|)>|)>|]>*<ud>t>>>>><label|eq:ader.fr.flux>
  </equation>

  which is the ADER time-averaged flux corrected by FR. The
  <math|g<rsub|L>,g<rsub|R>> satisfy <math|g<rsub|L><around|(|0|)>=g<rsub|R><around|(|1|)>=1,g<rsub|L><around|(|1|)>=g<rsub|R><around|(|0|)>=0>
  so that

  <\equation*>
    <Fq><rsub|h><around|(|0|)>=<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<rsub|<value|emh>><around*|(|<q><rsub|h><around|(|t|)>|)>*<ud>t,<space|2em><Fq><rsub|h><around|(|1|)>=<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<rsub|<value|eph>><around*|(|<q><rsub|h><around|(|t|)>|)>*<ud>t
  </equation*>

  making <math|<Fq><rsub|h>> a globally continuous flux approximation. The
  equations<nbsp>(<reference|eq:predictor.eqn>,<nbsp><reference|eq:ader.evolution>,<nbsp><reference|eq:ader.fr.flux>)
  describe the ADER-FR scheme.

  <section|Equivalence><label|sec:linear.equivalence>

  Since <math|f<around|(|u|)>=a*u> in<nbsp><eqref|eq:scalar.con.law>, the
  numerical flux function is linear and thus the corrected ADER time-averaged
  flux of<nbsp><eqref|eq:ader.fr.flux> can be written as

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<Fq><rsub|h><around|(|\<xi\>|)>>|<cell|=>|<cell|<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>a*<q><rsub|h><around|(|\<xi\>,t|)>*<ud>t>>|<row|<cell|>|<cell|>|<cell|+g<rsub|R><around|(|\<xi\>|)>*<around*|[|f<rsub|<value|eph>>*<around*|(|<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><q><rsub|h><around|(|t|)>*<ud>t|)>-<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>a*<q><rsub|h><around|(|1,t|)><ud>t|]>>>|<row|<cell|>|<cell|>|<cell|+g<rsub|L><around|(|\<xi\>|)>*<around*|[|f<rsub|<value|emh>>*<around*|(|<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><q><rsub|h><around|(|t|)>*<ud>t|)>-<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>a*<q><rsub|h><around|(|0,t|)><ud>t|]>>>>>><label|eq:ader.corr.flux>
  </equation>

  We will prove equivalence assuming that both schemes have the same solution
  at time <math|t=t<rsup|n>>. Now, by<nbsp><eqref|eq:uplwfr>, Lax-Wendroff
  Flux Reconstruction (LWFR) in an element can be written as

  <\equation>
    u<rsub|p><rsup|n+1>=u<rsub|p><rsup|n>-\<Delta\>t<rsub|n>*\<partial\><rsub|x>*F<rsub|h><around|(|\<xi\><rsub|p>|)><label|eq:lwfr.evolution>
  </equation>

  where <math|F<rsub|h>> is the continuous LW time averaged flux

  <\equation>
    F<rsub|h><around|(|\<xi\>|)>=F<rsub|h><rsup|\<delta\>><around|(|\<xi\>|)>+g<rsub|R><around|(|\<xi\>|)>*<around|[|F<rsub|<value|eph>>-F<rsub|h><rsup|\<delta\>><around|(|1|)>|]>+g<rsub|L><around|(|\<xi\>|)>*<around|[|F<rsub|<value|emh>>-F<rsub|h><rsup|\<delta\>><around|(|0|)>|]><label|eq:first.time.average.flux>
  </equation>

  and <math|F<rsub|h><rsup|\<delta\>>> is the discontinuous time averaged
  flux computed by the approximate Lax-Wendroff procedure, described in
  Section<nbsp><reference|sec:alw>,<nbsp><cite|Zorio2017|Burger2017>, which
  gives the following for linear flux

  <\equation>
    F<rsub|h><rsup|\<delta\>>=<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>*f<around|(|u<rsup|n>|)>=a*<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>*u<rsup|n>=a*<big|sum><rsub|k=0><rsup|N><frac|<around|(|-a*\<Delta\>t|)><rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|x><rsup|k>*u<rsup|n><rsub|h>\<backassign\>a*U<rsub|h><rsup|n><label|eq:Uh.defn>
  </equation>

  where <math|U<rsub|h><rsup|n>> is the approximate time averaged solution,
  and all spatial derivatives are computed as local polynomial derivatives.
  The numerical flux with D2 dissipation introduced
  in<nbsp><eqref|eq:nfdiss2> is given by

  <\equation>
    <tabular*|<tformat|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|F<rsub|<value|eph>>>|<cell|=>|<cell|<frac|1|2>*<around|(|F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|->|)>+F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|+>|)>|)>-<frac|<around|\||a|\|>|2>*<around|(|U<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|+>|)>-U<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|->|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|a|2>*<around|(|U<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|->|)>+U<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|+>|)>|)>-<frac|<around|\||a|\|>|2>*<around|(|U<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|+>|)>-U<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|->|)>|)>>>|<row|<cell|>|<cell|=>|<cell|f<rsub|<value|eph>><around|(|U<rsub|h><rsup|n>|)>>>>>><label|eq:numflux.d2>
  </equation>

  where <math|f<rsub|<value|eph>><around|(|U<rsub|h><rsup|n>|)>> is as
  defined in<nbsp><eqref|eq:numflux.defn>. Thus, the time averaged
  flux<nbsp><eqref|eq:first.time.average.flux> in LWFR
  scheme<nbsp><eqref|eq:lwfr.evolution> can be written as

  <\equation>
    F<rsub|h><around|(|\<xi\>|)>=a*U<rsub|h><rsup|n><around|(|\<xi\>|)>+g<rsub|R><around|(|\<xi\>|)>*<around|[|f<rsub|<value|eph>><around|(|U<rsub|h><rsup|n>|)>-U<rsub|h><rsup|n><around|(|1|)>|]>+g<rsub|L><around|(|\<xi\>|)>*<around|[|f<rsub|<value|emh>><around|(|U<rsub|h><rsup|n>|)>-U<rsub|h><rsup|n><around|(|0|)>|]><label|eq:lw.corr.flux>
  </equation>

  <\remark>
    The D1 dissipation numerical flux, as termed in
    Chapter<nbsp><reference|ch:lwfr>, was used in earlier works
    like<nbsp><cite|Qiu2005b> and is given by

    <\equation>
      F<rsub|<value|eph>>=<frac|1|2>*<around|(|F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|->|)>+F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|+>|)>|)>-<frac|<around|\||a|\|>|2>*<around|(|u<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|+>|)>-u<rsub|h><rsup|n><around|(|x<rsub|<value|eph>><rsup|->|)>|)><label|eq:numflux.d1>
    </equation>

    The D2 flux<nbsp><eqref|eq:numflux.d2> enhances the Fourier CFL stability
    limit (Section<nbsp><reference|sec:four1d>). The equivalence between LW
    and ADER only holds with the D2 dissipation.
  </remark>

  Looking at<nbsp>(<reference|eq:ader.evolution>,<nbsp><reference|eq:lwfr.evolution>),
  to prove the claimed equivalence, we need to show
  that<nbsp><eqref|eq:ader.corr.flux> and<nbsp><eqref|eq:lw.corr.flux> are
  the same, which will be true if we show that the time averaged solution
  <math|U<rsub|h><rsup|n>> defined in<nbsp><eqref|eq:Uh.defn> is given by

  <\equation>
    U<rsub|h><rsup|n><around|(|\<xi\>|)>=<frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><q><rsub|h><around|(|\<xi\>,t|)>*<ud>t<label|eq:final.claim>
  </equation>

  For simplicity of explanation, extend the cell local polynomial
  <math|x\<mapsto\><big|sum><rsub|p=0><rsup|N>u<rsup|e><rsub|p>*\<ell\><rsub|p><around|(|\<xi\><around|(|x|)>|)>>
  as a polynomial in whole of <math|\<bbb-R\>>, now denoted
  <math|u<rsub|e><rsup|n>>. Then, defined in physical coordinates,
  <math|<around|(|x,t|)>\<mapsto\>u<rsup|n><rsub|e>*<around|(|x-a*<around|(|t-t<rsub|n>|)>|)>>
  is a degree <math|N> space-time polynomial which satisfies the predictor
  equation<nbsp><eqref|eq:predictor.eqn> for <math|f<around|(|u|)>=a*u>.
  Since the predictor equation has a unique
  solution<nbsp><cite|Dumbser2009|Jackson2017>, the solution
  of<nbsp><eqref|eq:predictor.eqn> is indeed given in physical coordinates as

  <\equation>
    <q><rsub|h><around|(|x,t|)>=u<rsup|n><rsub|e>*<around|(|x-a*<around|(|t-t<rsup|n>|)>|)>,<space|2em>x\<in\>\<Omega\><rsub|e><label|eq:predictor.linear.solution>
  </equation>

  Thus, we have <math|\<partial\><rsub|t><q><rsub|h>=-a*\<partial\><rsub|x><q><rsub|h>>
  and <math|<q><rsub|h>\|<rsub|t=t<rsub|n>,x\<in\>\<Omega\><rsub|e>>=u<rsub|e><rsup|n>=u<rsub|h><rsup|n>>
  which we will now exploit to obtain<nbsp><eqref|eq:final.claim>. Since
  <math|<q><rsub|h>> is a degree <math|N> polynomial, its Taylor's expansion
  gives

  <\equation*>
    <tabular*|<tformat|<cwith|4|4|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<q><rsub|h><around|(|\<xi\>,t|)>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|N><frac|<around|(|t-t<rsup|n>|)><rsup|k>|k!>*\<partial\><rsub|t><rsup|k>*<q><rsub|h><around|(|\<xi\>,t<rsup|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|N><frac|<around|(|-a*<around|(|t-t<rsup|n>|)>|)><rsup|k>|k!>*\<partial\><rsub|x><rsup|k>*<q><rsub|h><around|(|\<xi\>,t<rsup|n>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|N><frac|<around|(|-a*<around|(|t-t<rsup|n>|)>|)><rsup|k>|k!>*\<partial\><rsub|x><rsup|k>*u<rsub|h><rsup|n><space|2em><eqref|eq:predictor.linear.solution>>>|<row|<cell|\<Longrightarrow\><frac|1|\<Delta\>t<rsub|n>>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><q><rsub|h><around|(|\<xi\>,t|)>*<ud>t>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|N><frac|<around|(|-a*\<Delta\>t|)><rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|x><rsup|k>*u<rsub|h><rsup|n>=U<rsub|h><rsup|n><space|2em><eqref|eq:Uh.defn>>>>>>
  </equation*>

  Thus, we have obtained<nbsp><eqref|eq:final.claim> proving equivalence of
  the two schemes.

  <\remark>
    The above steps are not valid for a non-linear flux because the identity
    <math|<q><rsub|t>=-<fq><rsub|x>> need not hold at
    <math|t=t<rsup|n>>.<label|rmk:non.linear>
  </remark>

  <section|Numerical validation><label|sec:num>

  The ADER-FR scheme described in Section<nbsp><reference|sec:ader.dg> is
  implemented, tested and validated for general scalar conservation laws like
  Burgers' equations with smooth solutions. For numerical validation of
  equivalence, the Lax-Wendroff scheme with D1,
  D2<nbsp>(<reference|eq:numflux.d1>,<nbsp><reference|eq:numflux.d2>)
  dissipation (called LW-D1, LW-D2) and ADER scheme are tested for scalar
  linear advection equation<nbsp><eqref|eq:scalar.con.law> with <math|a=5>
  and wave packet initial condition <math|u<around|(|x,0|)>=e<rsup|-10*x<rsup|2>>*sin
  <around|(|10*\<pi\>*x|)>> on domain <math|<around|[|-1,1|]>> with periodic
  and Dirichlet boundary conditions for degrees <math|N=1,2,3>. The
  non-periodic boundaries for LWFR are treated as in
  Section<nbsp><reference|sec:lw.bc>. The Radau correction
  functions<nbsp><cite|Huynh2007> and Gauss-Legendre solution points are used
  in the results shown, although we have also tested other correction
  functions and solution points where same behavior was seen. Each scheme
  uses the same time step size, and is within the stability limit. The
  LW-D2<nbsp><eqref|eq:numflux.d2> and ADER schemes are found to match to
  <math|O<around|(|10<rsup|-14>|)>> in <math|L<rsup|\<infty\>>> norm,
  verifying equivalence. In Figure<nbsp><reference|fig:error>, we show the
  <math|L<rsup|2>> error <math|<around|\<\|\|\>|u<rsub|h>-u<rsub|exact>|\<\|\|\>><rsub|2>>
  versus time plot for LW-D1, LW-D2<nbsp>(<reference|eq:numflux.d1>,<nbsp><reference|eq:numflux.d2>)
  and the ADER scheme for periodic (Figure<nbsp><reference|fig:error>a,<nbsp>b,<nbsp>c)
  and non-periodic (Figure<nbsp><reference|fig:error>d,<nbsp>e,<nbsp>f)
  boundaries. Since the ADER and LW-D2 schemes are equivalent, we see their
  <math|L<rsup|2>> error curves overlap, while for D1 dissipation, we see
  differences of upto <math|O<around|(|10<rsup|-3>|)>> for both periodic and
  non-periodic boundaries. Thus, equivalence holds precisely with the D2
  dissipation. The code used to generate these results is available online
  at<nbsp><cite|arpit_babbar_2024_10816439>.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|linear/error1|0.3par|||>>|<cell|<image|linear/error2|0.3par|||>>|<cell|<image|linear/error3|0.3par|||>>>|<row|<cell|(a)>|<cell|(b)>|<cell|(c)>>|<row|<cell|<image|linear/error_dirichlet1|0.3par|||>>|<cell|<image|linear/error_dirichlet2|0.3par|||>>|<cell|<image|linear/error_dirichlet3|0.3par|||>>>|<row|<cell|(d)>|<cell|(e)>|<cell|(f)>>>>>><label|fig:error>|<caption-detailed|<math|L<rsup|2>>
  error <math|<around|\<\|\|\>|u<rsub|h>-u<rsub|exact>|\<\|\|\>><rsub|2>>
  versus time for wave packet test for different polynomial degrees with 240
  degrees of freedom. Periodic : (a) <math|N=1>, (b) <math|N=2>, (c)
  <math|N=3>. Non-periodic : (d) <math|N=1>, (e) <math|N=2>, (f)
  <math|N=3>|Error growth of LW-D1, LW-D2 and ADER schemes.>>

  <section|Conclusions><label|sec:con>

  This appendix proves linear equivalence of high order ADER and Lax-Wendroff
  (LW) schemes in Discontinuous Galerkin / Flux Reconstruction framework when
  the numerical flux in LW is computed using the D2 dissipation introduced in
  Chapter<nbsp><reference|ch:lwfr>. This is consistent with the Fourier
  stability analysis performed in Section<nbsp><reference|sec:four1d> where
  it was observed that the CFL numbers of LWFR scheme with D2 dissipation are
  the same as those of ADER-DG schemes obtained
  in<nbsp><cite|Dumbser2008|Gassner2011a>. The equivalence was also
  numerically validated for a wave packet test. The crucial observation
  needed for the proof is that the solution of the predictor equation of ADER
  scheme has the same expression as exact solution of the linear problem.
  Thus, this work relates two single stage methods which are based on very
  different ideas and is thus a contribution to our understanding of these
  numerical schemes. A natural but important research question for further
  comparison of these two schemes is whether they agree upto optimal order of
  accuracy, at least for smooth solutions.

  <appendix|Some numerical fluxes><label|sec:lwfr.numfluxes>

  We describe the procedure to compute the numerical flux for systems at one
  single face <math|<eph>>. The numerical flux for LWFR is computed using the
  trace values of the solution <math|<value|uU><rsub|l>=<value|uU><rsub|<eph>><rsup|->>,
  <math|<value|uU><rsub|r>=<value|uU><rsub|<eph>><rsup|+>> and time average
  fluxes <math|<value|F><rsub|l>=<value|F><rsub|<eph>><rsup|->>,
  <math|<value|F><rsub|r>=<value|F><rsub|<eph>><rsup|+>>. Here
  <math|<value|uU><rsub|l>,<value|uU><rsub|r>> may be the solution values at
  time <math|t<rsub|n>> for dissipation model D1 or the time average value in
  case of dissipation model D2. Further, we use the cell average values at
  time <math|t=t<rsub|n>>, <math|<wide|<value|uU>|\<bar\>><rsub|l>=<au><rsub|e><rsup|n>>,
  <math|<wide|<value|uU>|\<bar\>><rsub|r>=<au><rsub|e+1><rsup|n>>, to compute
  the dissipation coefficients. In the following sub-sections, we described
  different numerical fluxes which are functions of the quantities:
  <math|<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>,<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>>.

  <section|Rusanov flux>

  The Rusanov flux<nbsp><cite|Rusanov1962> is a local version of the
  Lax-Friedrichs flux with the wave speed being estimated locally. The flux
  approximation is given by

  <\equation*>
    <value|F><around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<half>*<around|(|<value|F><rsub|l>+<value|F><rsub|r>|)>-<half>*\<lambda\>*<around|(|<value|uU><rsub|r>-<value|uU><rsub|l>|)>
  </equation*>

  where <math|\<lambda\>> is an estimate of the maximum wave speed in the two
  states

  <\equation*>
    \<lambda\>=max <around|{|\<rho\><around|(|<wide|<value|uU>|\<bar\>><rsub|l>|)>,\<rho\><around|(|<wide|<value|uU>|\<bar\>><rsub|r>|)>|}>
  </equation*>

  and <math|\<rho\>> denotes the spectral radius of the flux jacobian,
  <math|<value|pf><rprime|'><around*|(|<value|uu>|)>>.

  <section|Roe flux>

  The Roe flux <cite|Roe1981> is built on a local linearization of the
  hyperbolic conservation law and solving the Riemann problem exactly. The
  Roe flux is given by

  <\equation*>
    <value|F><around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<half>*<around|(|<value|F><rsub|l>+<value|F><rsub|r>|)>-<half>*R*<around|\||\<Lambda\>|\|>*L*<around|(|<value|uU><rsub|r>-<value|uU><rsub|l>|)>
  </equation*>

  where <math|R,\<Lambda\>,L> are the right eigenvector matrix, diagonal
  matrix of eigenvalues and left eigenvector matrix corresponding to the flux
  Jacobian at the face, computed using the Roe average based on cell average
  values <math|<wide|<value|uU>|\<bar\>><rsub|l>>,
  <math|<wide|<value|uU>|\<bar\>><rsub|r>>.

  <section|HLL flux>

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
    <value|F><around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<choice|<tformat|<table|<row|<cell|<value|F><rsub|l>,>|<cell|S<rsub|l>\<gtr\>0>>|<row|<cell|<value|F><rsub|r>,>|<cell|S<rsub|r>\<less\>0>>|<row|<cell|<value|F><rsub|\<ast\>>,>|<cell|<math-up|otherwise>>>>>>
  </equation*>

  The speeds <math|S<rsub|l>,S<rsub|r>> are computed using the cell average
  values <math|<wide|<value|uU>|\<bar\>><rsub|l>>,
  <math|<wide|<value|uU>|\<bar\>><rsub|r>> and there are various methods
  available<nbsp><cite|Einfeldt1988|Batten1997|Toro2009|Guermond2016|Toro2020>.
  In the numerical tests, we use the method from<nbsp><cite|Toro2009> to
  estimate the slowest and fastest speeds.

  <section|HLLC flux>

  We describe the HLLC flux for 1-D Compressible Euler's
  equations<nbsp><eqref|eq:1deuler>. The HLLC Riemann
  solver<nbsp><cite|Toro1994> includes the contact wave by using a three wave
  model with three wave speeds <math|S<rsub|l>\<less\>S<rsub|\<ast\>>\<less\>S<rsub|r>>
  and two intermediate states <math|<value|uU><rsub|\<ast\>l>> and
  <math|<value|uU><rsub|\<ast\>r>>. The contact wave is the middle wave with
  speed <math|S<rsub|\<ast\>>>. The pressure and normal velocity are
  continuous across the contact wave, i.e.,

  <\equation*>
    p<rsub|\<ast\>l>=p<rsub|\<ast\>r>=p<rsub|\<ast\>>,<space|2em>u<rsub|\<ast\>l>=u<rsub|\<ast\>r>=u<rsub|\<ast\>>
  </equation*>

  and the speed of the contact wave coincides with the intermediate velocity
  <math|S<rsub|\<ast\>>=u<rsub|\<ast\>>>. The jump condition across the
  <math|S<rsub|l>> and <math|S<rsub|r>> wave reads as

  <\equation*>
    <value|F><rsub|\<ast\>\<alpha\>>-<value|F><rsub|\<alpha\>>=S<rsub|\<alpha\>>*<around|(|<value|uU><rsub|\<ast\>\<alpha\>>-<value|uU><rsub|\<alpha\>>|)>,<space|1em>\<alpha\>=l,r
  </equation*>

  In the full form, the jump conditions are given by

  <\equation*>
    <around*|[|<tabular*|<tformat|<table|<row|<cell|\<rho\><rsub|\<ast\>\<alpha\>>*u<rsub|\<ast\>>>>|<row|<cell|p<rsub|\<ast\>>+\<rho\><rsub|\<ast\>\<alpha\>>*u<rsub|\<ast\>><rsup|2>>>|<row|<cell|<around*|(|E<rsub|\<ast\>\<alpha\>>+p<rsub|\<ast\>>|)>*u<rsub|\<ast\>>>>>>>|]>-S<rsub|\<alpha\>>*<around*|[|<tabular*|<tformat|<table|<row|<cell|\<rho\><rsub|\<ast\>\<alpha\>>>>|<row|<cell|\<rho\><rsub|\<ast\>\<alpha\>>*u<rsub|\<ast\>>>>|<row|<cell|E<rsub|\<ast\>\<alpha\>>>>>>>|]>=<around*|[|<tabular*|<tformat|<table|<row|<cell|F<rsub|\<alpha\>><rsup|\<rho\>>>>|<row|<cell|F<rsub|\<alpha\>><rsup|m>>>|<row|<cell|F<rsub|\<alpha\>><rsup|E>>>>>>|]>-S<rsub|\<alpha\>>*<around*|[|<tabular*|<tformat|<table|<row|<cell|\<rho\><rsub|\<alpha\>>>>|<row|<cell|m<rsub|\<alpha\>>>>|<row|<cell|E<rsub|\<alpha\>>>>>>>|]>
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
  following expression

  <\equation*>
    p<rsub|\<ast\>>=<frac|<around|(|S<rsub|r>*m<rsub|r>-F<rsub|r><rsup|m>|)>*<around|(|S<rsub|l>*\<rho\><rsub|l>-F<rsub|l><rsup|\<rho\>>|)>-<around|(|S<rsub|l>*m<rsub|l>-F<rsub|l><rsup|m>|)>*<around|(|S<rsub|r>*\<rho\><rsub|r>-F<rsub|r><rsup|\<rho\>>|)>|<around|(|S<rsub|r>*\<rho\><rsub|r>-F<rsub|r><rsup|\<rho\>>|)>-<around|(|S<rsub|l>*\<rho\><rsub|l>-F<rsub|l><rsup|\<rho\>>|)>>
  </equation*>

  From the last jump condition we obtain

  <\equation*>
    E<rsub|\<ast\>\<alpha\>>=<frac|p<rsub|\<ast\>>*u<rsub|\<ast\>>+S<rsub|\<alpha\>>*E<rsub|\<alpha\>>-F<rsub|\<alpha\>><rsup|E>|S<rsub|\<alpha\>>-u<rsub|\<ast\>>>
  </equation*>

  The flux is now given by

  <\equation*>
    <value|F>*<around|(|<value|uU><rsub|l>,<value|uU><rsub|r>,<value|F><rsub|l>,<value|F><rsub|r>;<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>|)>=<choice|<tformat|<table|<row|<cell|<value|F><rsub|l>,>|<cell|S<rsub|l>\<gtr\>0>>|<row|<cell|<value|F><rsub|r>,>|<cell|S<rsub|r>\<less\>0>>|<row|<cell|<value|F><rsub|\<ast\>l>=<value|F><rsub|l>+S<rsub|l>*<around|(|<value|uU><rsub|\<ast\>l>-<value|uU><rsub|l>|)>,>|<cell|S<rsub|l>\<less\>0\<less\>u<rsub|\<ast\>>>>|<row|<cell|<value|F><rsub|\<ast\>r>=<value|F><rsub|r>+S<rsub|r>*<around|(|<value|uU><rsub|\<ast\>r>-<value|uU><rsub|r>|)>,>|<cell|u<rsub|\<ast\>>\<less\>0\<less\>S<rsub|r>>>>>>
  </equation*>

  where the wave speeds <math|S<rsub|l>> and <math|S<rsub|r>> are computed
  using the cell average values <math|<wide|<value|uU>|\<bar\>><rsub|l>,<wide|<value|uU>|\<bar\>><rsub|r>>.

  <appendix|Equivalence of DG and FR><label|app:equiv.dg.fr>

  As proven in<nbsp><cite|Huynh2007|Mengaldo2015>, the Discontinuous Galerkin
  (DG) method can be cast in a Flux Reconstruction (FR) framework when
  Gauss-Legendre or Gauss-Legendre-Lobatto points are used as solution and
  quadrature points. The same is proven here for the general case of
  curvilinear grids in part to justify the FR formulation in
  Section<nbsp><reference|sec:curved.fr>. The proof is provided here for
  Runge-Kutta Flux Reconstruction for simplicity although the same arguments
  apply for Lax-Wendroff Flux Recontruction. That is, following the ideas in
  this appendix and Section<nbsp><reference|sec:curved.lwfr.curved>, a
  Lax-Wendroff Discontinuous Galerkin method on curvilinear grids can be
  defined which will be equivalent to the Lax-Wendroff Flux Reconstruction
  method of Chapter<nbsp><reference|ch:curved.meshes>.

  <section|Discontinuous Galerkin on curvilinear grids>

  Consider the degree <math|N> Lagrange polynomial basis
  <math|<around*|{|\<ell\><rsub|<bp>>|}>> on the reference cell
  <math|<value|Oo>=<around*|[|-1,1|]><rsup|d>><nbsp><eqref|eq:curved.lagrange.basis>.
  Let <math|<value|uu><rsup|\<delta\>>,<value|tf><rsup|\<delta\>>> be the
  degree <math|N> approximate solution and contravariant flux, defined
  in<nbsp>(<reference|eq:curved.approx.soln>,<nbsp><reference|eq:curved.flux.poly.defn>)
  respectively. The DG scheme can either be formulated for the transformed
  PDE<nbsp><eqref|eq:curved.transformed.conservation.law> or weak formulation
  can be constructed for the conservation law in the physical
  space<nbsp><eqref|eq:con.law> and transformed to the reference cell. It is
  easy to see that the two are equivalent, and we will only show the DG
  scheme for the transformed PDE<nbsp><eqref|eq:curved.transformed.conservation.law>.

  We will show that both can be formulated in a way that the obtained schemes
  are equivalent. We first derive the DG scheme for the tranformed
  conservation law. The first step is to multiply the transformed
  conservation law<nbsp><eqref|eq:curved.transformed.conservation.law> with a
  test function <math|\<varphi\>> which is a degree <math|N> polynomial in
  reference space

  <\equation*>
    <big|int><rsub|<value|Oo>>J*<pdv|<value|uu><rsub|e><rsup|\<delta\>>|t>*\<varphi\>*<ud><vxi>+<big|int><rsub|<value|Oo>>\<varphi\>*\<nabla\><rsub|<vxi>>\<cdot\><value|tf><rsub|e><rsup|\<delta\>>*<ud><vxi>=<value|bzero>
  </equation*>

  Performing a formal integration by parts to derive the DG scheme gives

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<value|Oo>>J*<pdv|<with|font-series|bold|u><rsub|e><rsup|\<delta\>>|t>*\<varphi\><around*|(|<vxi>|)>*<ud><vxi>-<big|int><rsub|<value|Oo>><value|tf><rsub|e><rsup|\<delta\>>\<cdot\><around*|(|\<nabla\><rsub|<vxi>>
    \<varphi\>|)>*<ud><vxi>>>|<row|<cell|<tabular*|<tformat|<table|<row|<cell|<space|1em>+<big|sum><rsub|i=1><rsup|d><big|int><rsub|<value|Oim>><around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|L,i>|)><rsup|\<ast\>>*\<ell\><rsub|<bp>>*<ud>S<rsub|<vxi>>+<big|int><rsub|<value|Oip>><around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|R,i>|)><rsup|\<ast\>>*\<ell\><rsub|<bp>>*<ud>S<rsub|<vxi>>=<value|bzero>>>>>>>>>>><label|eq:dg.scheme>
  </equation>

  where <math|i> denotes the coordinate direction and <math|s> denotes the
  side <math|<around*|{|L,R|}>>, <math|<value|Oip>> denotes the face where
  reference outward normal is <math|<value|bnr><rsub|R,i>=<be><rsub|i>> and
  <math|<value|Oim>> has outward unit normal
  <math|<value|bnr><rsub|L,i>=-<value|bnr><rsub|R,i>>. The face of element
  <math|e> in a direction <math|i> on the side <math|s> will be referred to
  as the face <math|<around*|(|s,i|)>> and
  <math|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|s,i>|)><rsup|\<ast\>>>
  denotes the numerical flux. The numerical flux is taken to be Rusanov's
  flux<nbsp><cite|Rusanov1962> in this work

  <\equation>
    <around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|s,i>|)><rsup|\<ast\>>=<value|tf><rsup|\<ast\>><around*|(|<value|uu><rsup|-><rsub|s,i>,<value|uu><rsup|+><rsub|s,i>,<value|bnr><rsub|s,i>|)>=<frac|1|2>*<around*|(|<around*|(|<value|tf><rsup|\<delta\>>\<cdot\><value|bnr><rsub|s,i>|)><rsup|+>+<around*|(|<value|tf><rsup|\<delta\>>\<cdot\><value|bnr><rsub|s,i>|)><rsup|->|)>-<frac|\<lambda\><rsub|s,i>|2>*<around*|(|<value|uu><rsup|+><rsub|s,i>-<value|uu><rsup|-><rsub|s,i>|)><label|eq:dg.rusanov>
  </equation>

  The <math|<around*|(|<value|tf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|\<pm\>>>
  and <math|<value|uu><rsub|s,i><rsup|\<pm\>>> denote the trace values of the
  normal flux and solution from outer, inner directions respectively; the
  inner direction corresponds to the element <math|e> while the outer
  direction corresponds to its neighbour across the interface
  <math|<around*|(|s,i|)>>. The <math|\<lambda\><rsub|s,i>> is a local wave
  speed estimate at the interface <math|<around*|(|s,i|)>>. For compressbile
  Euler's equations with density, velocity and pressure variables denoted as
  <math|\<rho\>,<bv>,p>, <verbatim|Trixi.jl><nbsp><cite|Ranocha2022>
  estimates the wave speed as

  <\eqnarray*>
    <tformat|<table|<row|<cell|>|<cell|\<lambda\>=max<around*|(|<around*|\||v<rsup|->|\|>,<around*|\||v<rsup|+>|\|>|)>+max<around*|(|<around*|\||c<rsup|->|\|>,<around*|\||c<rsup|+>|\|>|)>>|<cell|>>|<row|<cell|>|<cell|v<rsup|\<pm\>>=<bv>\<cdot\><value|bn><rsup|\<pm\>>,<space|2em>c<rsup|\<pm\>>=<sqrt|\<gamma\>*p<rsup|\<pm\>>/\<rho\><rsup|\<pm\>>>>|<cell|<label|eq:wave.speed.dg><eq-number>>>>>
  </eqnarray*>

  where <math|<value|bn>> is the physical unit normal at the interface. \ In
  <verbatim|Trixi.jl><nbsp><cite|Ranocha2022>, the numerical flux is computed
  in physical variables as

  <\equation*>
    <around*|(|<value|pf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|\<ast\>>=<frac|1|2>*<around*|(|<around*|(|<value|pf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|+>+<around*|(|<value|pf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|->|)>-<frac|\<lambda\><rsub|s,i>|2>*<around*|(|<value|uu><rsup|+><rsub|s,i>-<value|uu><rsup|-><rsub|s,i>|)>
  </equation*>

  <section|Equivalence with Flux Reconstruction>

  We derive the collocation based Flux Reconstruction<nbsp><cite|Huynh2007>
  scheme directly from the DG scheme. For the multi-indices
  <math|<bp>=<around*|(|p<rsub|i>|)><rsub|i<value|subindex>1><rsup|d>> where
  <math|p<rsub|i>\<in\><around*|{|0,1\<ldots\>,N|}>>, take the test function
  to be

  <\equation*>
    \<ell\><rsub|<bp>><around*|(|<vxi>|)>=<big|prod><rsub|i=1><rsup|d>\<ell\><rsub|p<rsub|i>><around*|(|<value|xii>|)>
  </equation*>

  so that the DG scheme<nbsp><eqref|eq:dg.scheme> becomes

  <\equation>
    <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<value|Oo>>J*<pdv|<value|uu><rsub|e><rsup|\<delta\>>|t>*\<ell\><rsub|<bp>>*<ud><vxi>-<big|int><rsub|<value|Oo>><value|tf><rsub|e><rsup|\<delta\>>\<cdot\><around*|(|\<nabla\><rsub|<vxi>>
    \<ell\><rsub|<bp>>|)>*<ud><vxi>>>|<row|<cell|<space|1em>+<big|sum><rsub|i=1><rsup|d><big|int><rsub|<value|Oim>><around*|(|<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|L,i>|)><rsup|\<ast\>>*\<ell\><rsub|<bp>>*<ud>S<rsub|<vxi>>+<big|int><rsub|<value|Oip>><around*|(|<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|R,i>|)><rsup|\<ast\>>*\<ell\><rsub|<bp>>*<ud>S<rsub|<vxi>>=<value|bzero>>>>>><label|eq:dg.weak>
  </equation>

  The scheme in<nbsp><eqref|eq:dg.weak> requires quadrature to be
  implemented; for equivalence with Flux Reconstruction, quadrature points
  are taken to be the same as solution points. Integration by parts can be
  performed if the volume integral with flux is exact. This will be true if
  we use Gauss-Legendre (GL) quadrature points (integrals will be exact) or
  Gauss-Legendre-Lobatto (GLL) quadrature points (integrals will be exact
  along the direction of the derivative, also used
  in<nbsp><cite|kopriva2010>). Thus,<nbsp><eqref|eq:dg.weak> is equivalent to
  the <with|font-shape|italic|strong form><nbsp><cite|kopriva2010>

  <\equation*>
    <tabular|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|<value|Oo>>J*<pdv|<value|uu><rsub|e><rsup|\<delta\>>|t>*\<ell\><rsub|<bp>>*<ud><vxi>+<big|int><rsub|<value|Oo>><around*|(|\<nabla\><rsub|<vxi>>\<cdot\><value|tf><rsub|e><rsup|\<delta\>>|)>*\<ell\><rsub|<bp>>*<ud><vxi>>>|<row|<cell|<space|1em>+<big|sum><rsub|i=1><rsup|d><big|int><rsub|<value|Oip>><around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|R,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|R,i>|)>*\<ell\><rsub|<bp>>*<ud>S<rsub|<vxi>>+<big|int><rsub|<value|Oim>><around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|L,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|L,i>|)>*\<ell\><rsub|<bp>>*<ud>S<rsub|<vxi>>=<value|bzero>>>>>>
  </equation*>

  Now, perform quadrature and collocate the scheme at solution points
  <math|<around*|{|<vxi><rsub|<bp>>=<around*|(|\<xi\><rsub|p<rsub|i>>|)><rsub|i=1><rsup|d>,p<rsub|i>=0,\<ldots\>,N|}>>.
  For a fixed <math|<bp>>, we denote the product of quadrature weights in
  each coordinate direction as <math|<value|cw><rsub|<bp>>\<assign\><big|prod><rsub|i=1><rsup|d>w<rsub|p<rsub|i>>>
  and the solution point with index suppressed as
  <math|<vxi>\<assign\><vxi><rsub|<bp>>>. Then, as in
  Chapter<nbsp><reference|ch:curved.meshes>, we denote
  <math|<vxi><rsub|i><rsup|S>> as projection of <math|<vxi>> to the face
  <math|S=L,R> in the <math|i<rsup|th>> direction<nbsp><eqref|eq:curved.xis.notation>.
  Performing quadrature at solution points, the collocation scheme at the
  fixed <math|<vxi>> will be

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|J*<dv|<value|uu><rsub|e,<bp>><rsup|\<delta\>>|t>*<cw><rsub|<bp>>+\<nabla\><rsub|<vxi>>\<cdot\><value|tf><rsub|e><rsup|\<delta\>><around*|(|<vxi><rsub|<bp>>|)>*<cw><rsub|<bp>>>>|<row|<cell|<space|1em>+<frac|<cw><rsub|<bp>>|w<rsub|p<rsub|i>>><big|sum><rsub|i=1><rsup|d><around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|R,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|R,i>|)><around*|(|<vxi><rsub|i><rsup|R>|)>*\<ell\><rsub|p<rsub|i>><around*|(|1|)>+<around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|L,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|L,i>|)><around*|(|<vxi><rsub|i><rsup|L>|)>*\<ell\><rsub|p<rsub|i>><around*|(|-1|)>=<value|bzero>>>>>>
  </equation*>

  where <math|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|s,i>|)><rsup|\<ast\>><around*|(|<vxi><rsub|i><rsup|s>|)>>
  and <math|<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|s,i><around*|(|\<xi\><rsub|i><rsup|s>|)>>
  denote numerical flux and physical flux at interface solution point
  <math|<vxi><rsub|i><rsup|s>>. Dividing by <math|J*<cw><rsub|<bp>>> gives

  <\equation>
    <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<dv|<with|font-series|bold|<value|uu>><rsub|e,<bp>><rsup|\<delta\>>|t>+<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><value|tf><rsub|e><rsup|\<delta\>><around*|(|<vxi><rsub|<bp>>|)>>>|<row|<cell|<space|1em>+<frac|1|J>*<big|sum><rsub|i=1><rsup|d><around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|R,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|R,i>|)><around*|(|<vxi><rsub|i><rsup|R>|)>*<frac|\<ell\><rsub|p<rsub|i>><around*|(|1|)>|w<rsub|p<rsub|i>>>-<around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|L,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|L,i>|)><around*|(|<vxi><rsub|i><rsup|L>|)>*<frac|\<ell\><rsub|p<rsub|i>><around*|(|-1|)>|w<rsub|p<rsub|i>>>=<value|bzero><label|eq:dg.collocated>>>>>>
  </equation>

  The equivalence of FR and DG for choices of different solution points and
  correction functions has been studied in<nbsp><cite|Huynh2007|Mengaldo2015>.
  We use the following identities whose proofs are based on properties of
  special polynomials observed in<nbsp><cite|Huynh2007> (see
  Appendix<nbsp><reference|sec:fr.corr.identities>) which generalize the
  proofs of equivalence in<nbsp><cite|Huynh2007|Mengaldo2015>

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<frac|\<ell\><rsub|p<rsub|i>><around*|(|-1|)>|w<rsub|p<rsub|i>>>,<frac|\<ell\><rsub|p<rsub|i>><around*|(|1|)>|w<rsub|p<rsub|i>>>>>|<row|<cell|=<choice|<tformat|<table|<row|<cell|-g<rsub|Radau,L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>,g<rsub|Radau,R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>,>|<cell|<space|1em>>|<cell|<text|GL
    solution points and quadrature>>>|<row|<cell|-g<rsub|2,L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>,g<rsub|2,R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>,>|<cell|>|<cell|<text|GLL
    solution points and quadrature>>>>>>>>>>><label|eq:dg.is.fr.corr>
  </equation>

  The <math|g<rsub|Radau>,g<rsub|2>> are FR correction functions introduced
  in<nbsp><cite|Huynh2007> and their explicit expressions
  are<nbsp>(<reference|eq:radau.corrector>, <reference|eq:ghu>)<\footnote>
    The <math|g<rsub|Radau>> and <math|<value|g2>> correction function
    expressions of<nbsp>(<reference|eq:radau.corrector>,<nbsp><reference|eq:ghu>)
    are defined for the reference interval <math|<around*|[|-1,1|]>> and are
    thus different from those in<nbsp>(<reference|eq:gradau>,<nbsp><reference|eq:g2>)
    defined for reference interval <math|<around*|[|0,1|]>>.
  </footnote>. By<nbsp><eqref|eq:dg.is.fr.corr>, we can choose the corrector
  functions <math|g<rsub|L>,g<rsub|R>> corresponding to the solution points
  so that<nbsp><eqref|eq:dg.collocated> can be written as

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<dv|<value|uebp><rsup|\<delta\>>|t>+<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><value|tf><rsub|e><rsup|\<delta\>><around*|(|<vxi><rsub|<bp>>|)>>>|<row|<cell|<space|1em>+<frac|1|J>*<big|sum><rsub|i=1><rsup|d><around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|R,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|R,i>|)><around*|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>+<around*|(|<around*|(|<value|tf><rsub|e>\<cdot\><value|bnr><rsub|L,i>|)><rsup|\<ast\>>-<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|L,i>|)><around*|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>=<value|bzero>>>>>>
  </equation>

  This is the same explicit form of FR as
  in<nbsp><eqref|eq:curved.fr.update.curvilinear>, proving the equivalence
  between FR and DG schemes.

  <subsection|Corrector function identitites><label|sec:fr.corr.identities>

  In this section, we prove the following for <math|0\<leq\>p\<leq\>N>

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<frac|\<ell\><rsub|p><around*|(|-1|)>|w<rsub|p>>,<frac|\<ell\><rsub|p><around*|(|1|)>|w<rsub|p>><label|eq:corr.expressions>>>|<row|<cell|<tabular*|<tformat|<table|<row|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|-g<rsub|Radau,L><rprime|'><around*|(|\<xi\><rsub|p>|)>,g<rsub|Radau,R><rprime|'><around*|(|\<xi\><rsub|p>|)>,>|<cell|<around*|(|\<xi\><rsub|p>,w<rsub|p>|)>
    are GL solution, quadrature points>>|<row|<cell|-g<rsub|2,L><rprime|'><around*|(|\<xi\><rsub|p>|)>,g<rsub|2,R><rprime|'><around*|(|\<xi\><rsub|p>|)>,>|<cell|<around*|(|\<xi\><rsub|p>,w<rsub|p>|)>
    are GLL solution, quadrature points>>>>>>>>>>>>>>>
  </equation>

  We first prove it for Gauss-Legendre solution points, with the Radau
  correction function. Since degree <math|N> Gauss-Legendre solution points
  are the <math|N+1> zeros of the degree <math|N+1> Legendre polynomial
  <math|L<rsub|N+1>> where we make the normalization choice
  <math|L<rsub|N+1><around*|(|1|)>=1>, the Lagrange polynomials corresponding
  to Gauss-Legendre points are given by

  <\equation>
    \<ell\><rsub|j><around*|(|\<xi\>|)>=<frac|L<rsub|N+1><around*|(|\<xi\>|)>|<around*|(|\<xi\>-\<xi\><rsub|j>|)>*L<rsub|N+1><rprime|'><around*|(|\<xi\><rsub|j>|)>>,<space|2em>0\<leq\>j\<leq\>N<label|eq:gl.lagrange>
  </equation>

  The quadrature weights are

  <\equation>
    w<rsub|j>=<frac|2|<around*|(|1-\<xi\><rsub|j><rsup|2>|)>*<around*|[|L<rsub|N+1><rprime|'><around*|(|\<xi\><rsub|j>|)>|]><rsup|2>>,<space|2em>0\<leq\>j\<leq\>N<label|eq:wj.expression>
  </equation>

  The Radau correction functions are

  <\equation>
    g<rsub|L><around*|(|\<xi\>|)>=R<rsub|N+1,R><around*|(|\<xi\>|)>,<space|2em>g<rsub|R><around*|(|\<xi\>|)>=g<rsub|L><around*|(|-\<xi\>|)>=R<rsub|N+1,L><around*|(|\<xi\>|)><label|eq:radau.corrector>
  </equation>

  where <math|R<rsub|N+1,R>> is the right Radau polynomial characterized as
  the polynomial perpendical to <math|<value|polyP><rsub|N-1>> and satisfying
  <math|R<rsub|N+1,R><around*|(|-1|)>=1>,
  <math|R<rsub|N+1,R><around*|(|1|)>=0>. The right, left Radau polynomials
  are explicitly given by

  <\equation>
    R<rsub|N+1,R>=<frac|<around*|(|-1|)><rsup|N+1>|2>*<around*|(|L<rsub|N+1>-L<rsub|N>|)>,<space|2em>R<rsub|N+1,L>=R<rsub|N+1,R><around*|(|-\<xi\>|)>=<frac|1|2>*<around*|(|L<rsub|N>+L<rsub|N+1>|)><label|eq:radau.poly>
  </equation>

  We will also be using the identities<nbsp>(8.5.7) of
  Hildebrand<nbsp><cite|hildebrand1973>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<around*|(|1-\<xi\><rsup|2>|)>*L<rsub|N><rprime|'><around*|(|\<xi\>|)>>|<cell|=>|<cell|-N*\<xi\>*L<rsub|N><around*|(|\<xi\>|)>+N*L<rsub|N-1><around*|(|\<xi\>|)><label|eq:leg.id1><eq-number>>>|<row|<cell|<around*|(|1-\<xi\><rsup|2>|)>*L<rsub|N><rprime|'><around*|(|\<xi\>|)>>|<cell|=>|<cell|<around*|(|N+1|)>*\<xi\>*L<rsub|N><around*|(|\<xi\>|)>-<around*|(|N+1|)>*L<rsub|N+1><around*|(|\<xi\>|)><label|eq:leg.id2><eq-number>>>>>
  </eqnarray*>

  Now, using <math|L<rsub|N+1><around*|(|-1|)>=<around*|(|-1|)><rsup|N+1>>,
  we get from<nbsp>(<reference|eq:gl.lagrange>, <reference|eq:wj.expression>)

  <\equation>
    -<frac|\<ell\><rsub|j><around*|(|-1|)>|w<rsub|j>>=<frac|1|2>*<around*|(|-1|)><rsup|N>*<around*|(|\<xi\><rsub|j>-1|)>*L<rsub|N+1><rprime|'><around*|(|\<xi\><rsub|j>|)><label|eq:radau.simplifier.1>
  </equation>

  Then, using (<reference|eq:leg.id1>, <reference|eq:leg.id2>) gives

  <\equation>
    L<rsub|N><rprime|'><around*|(|\<xi\><rsub|j>|)>=<frac|<around*|(|N+1|)>*\<xi\><rsub|j>*L<rsub|N><around*|(|\<xi\><rsub|j>|)>|1-\<xi\><rsub|j><rsup|2>>,<space|2em>L<rsub|N+1><rprime|'><around*|(|\<xi\><rsub|j>|)>=<frac|<around*|(|N+1|)>*L<rsub|N><around*|(|\<xi\><rsub|j>|)>|1-\<xi\><rsub|j><rsup|2>><label|eq:radau.simplifier.2>
  </equation>

  and thus, using<nbsp>(<reference|eq:radau.simplifier.1>,
  <reference|eq:radau.simplifier.2>), Radau correction
  function<nbsp><eqref|eq:radau.corrector> satisfies

  <\equation*>
    g<rsub|L><rprime|'><around*|(|\<xi\><rsub|j>|)>+<frac|\<ell\><rsub|j><around*|(|-1|)>|w<rsub|j>>=<frac|<around*|(|-1|)><rsup|N>|2>*<around*|(|L<rsub|N><rprime|'><around*|(|\<xi\><rsub|j>|)>-\<xi\><rsub|j>*L<rsub|N+1><rprime|'><around*|(|\<xi\><rsub|j>|)>|)>=0,
  </equation*>

  and we get the claim<nbsp><eqref|eq:corr.expressions> for Radau correction
  functions. We now prove the claim<nbsp><eqref|eq:corr.expressions> for
  <math|g<rsub|2>> correction functions. Since GLL points include
  <math|\<pm\>1>, the Lagrange polynomials with GLL points satisfy

  <\equation*>
    <frac|\<ell\><rsub|p><around*|(|-1|)>|w<rsub|p>>=<frac|\<delta\><rsub|p0>|w<rsub|p>>,<space|2em><frac|\<ell\><rsub|p><around*|(|1|)>|w<rsub|p>>=<frac|\<delta\><rsub|p\<nocomma\>N>|w<rsub|p>>
  </equation*>

  where <math|\<delta\><rsub|k\<nocomma\>l>> is the Dirac delta function. The
  quadrature weights corresponding to GLL points are given by

  <\equation>
    w<rsub|p>=<choice|<tformat|<table|<row|<cell|<frac|2|N*<around*|(|N+1|)>>*<frac|1|<around*|[|L<rsub|N><around*|(|\<xi\><rsub|p>|)>|]><rsup|2>>>|<cell|<space|2em>>|<cell|<text|if><space|1em>0\<less\>p\<less\>N>>|<row|<cell|<frac|2|N*<around*|(|N+1|)>>>|<cell|>|<cell|<text|if><space|1em>p=0<infix-or>p=N>>>>><label|eq:g2.simplifier>
  </equation>

  The <math|g<rsub|2>> correction functions are given
  by<nbsp><cite|Huynh2007>

  <\equation>
    g<rsub|2,L>=<frac|N|2*N+1>*R<rsub|R,N+1>+<frac|N+1|2*N+1>*R<rsub|R,N><label|eq:ghu>
  </equation>

  where <math|R<rsub|N>> are Radau polynomials<nbsp><eqref|eq:radau.poly>. In
  Appendix E of<nbsp><cite|Huynh2007>, it is proven that <math|g<rsub|2,L>>
  has extremums at all Lobatto points other than the left boundary, where it
  satisfies by<nbsp><eqref|eq:g2.simplifier>

  <\equation*>
    g<rsub|2,L><rprime|'><around*|(|-1|)>=-<frac|1|2>*N*<around*|(|N+1|)>=-<frac|\<ell\><rsub|0><around*|(|-1|)>|w<rsub|0>>
  </equation*>

  giving our claim<nbsp><eqref|eq:corr.expressions>.

  <appendix|Efficient local differential operators><label|app:efficient.diff>

  In our implementation of Lax-Wendroff Flux Reconstruction scheme, we use
  differentation matrices for computing polynomial derivatives within an
  element. For instance, the matrix <vD> defined
  in<nbsp><eqref|eq:diff.matrix> is used to compute the local derivatives in
  the approximate Lax-Wendroff procedure (Section<nbsp><reference|sec:alw>)
  and the matrix <vD><rsub|1> is used for computing the derivatives of the
  continuous flux<nbsp>(<reference|eq:fder>,<nbsp><reference|eq:up2d>). This
  section describes how these derivative operators are applied in a cache
  blocking way<nbsp><cite|akkurt2022> that avoids writing to memory (RAM).
  The approach is also used in <verbatim|Trixi.jl><nbsp><cite|Ranocha2022>
  and <verbatim|PyFR><nbsp><cite|witherden2014|akkurt2022>.

  We describe the process when dealing with the 1-D system of conservation
  laws<nbsp><eqref|eq:con.law> with <verbatim|nvar> variables solved on a
  grid of <verbatim|ncell> cells and polynomial degree <math|N>. Let
  <verbatim|u> be the solution array of size (<verbatim|nvar>, <math|N+1>,
  <verbatim|ncell>) containing <verbatim|Float64> values. The approximate
  Lax-Wendroff procedure (Section<nbsp><reference|sec:alw>) and derivative of
  continuous flux<nbsp>(<reference|eq:fder>,<nbsp><reference|eq:up2d>)
  require us to loop over the <verbatim|ncell> cells and compute the flux
  derivative within each cell. A natural approach to compute the flux
  derivatives will be to compute fluxes at all solution points, store them in
  an array and apply the differentiation matrix. This is performed in the
  pseudocode below where <verbatim|f> is an array of size (<verbatim|NVAR>,
  <math|N+1>).

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\julia-code>
        for cell in eachelement(grid) # Cell loop

        <nbsp> <nbsp> for i in eachnode(basis) \ # DoF loop

        <nbsp> <nbsp> <nbsp> <nbsp> f[:,i] = flux(u[:,i,cell])

        <nbsp> <nbsp> end

        <nbsp> <nbsp> BLAS.mul(<text|<verbatim|D>>, f, fder) # fder = D * f

        end
      </julia-code>
    </cell>>>>
  </wide-tabular>

  This issue with this apporach is that storing the flux in an array requires
  writing to memory (RAM). The idea of cache blocking is to compute the flux
  derivative without writing the flux to memory. This is ensured by computing
  the flux derivative by summing contributions to flux derivative from all
  solution points. To be precise, during the loop over solution points, we
  simply compute the flux at that solution point, compute its contribution to
  the derivative, and add it to target <verbatim|fder>. At each solution
  point, the flux only consists of <verbatim|NVAR> values of
  <verbatim|Float64> type. The <verbatim|NVAR> is relatively small (3 for 1-D
  Euler's equations<nbsp><eqref|eq:1deuler>, 6 for the ten moment problem
  <eqref|eq:tmp.tmp>) and the code is setup to ensure that <verbatim|NVAR> is
  known at the time of compilation. Thus, the <verbatim|NVAR> flux values
  will be stored in the cache.

  We now discuss how cache blocking is performed in practice. The
  implementation will typically be dependent on the programming language and
  we only describe it for Julia<nbsp><cite|Bezanson2017>. We first describe
  how to ensure that <verbatim|NVAR> is known at the time of compilation.

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\julia-code>
        abstract type AbstractEquations{NDIMS, NVAR} end

        nvariables(::AbstractEquations{NDIMS,NVAR}) where {NDIMS, NVAR} =
        NVAR
      </julia-code>
    </cell>>>>
  </wide-tabular>

  The type <verbatim|AbstractEquations> contains the number of dimensions
  <verbatim|NDIMS> and number of variables <verbatim|NVAR>. Since types are
  resolved at the time of compilation, these values will be known to the
  compiler and can be queried by the function <verbatim|nvariables>. This
  <verbatim|abstract type> is then used in a particular system of equations,
  like 1-D Euler's equations, as follows.

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\julia-code>
        <code|<\code*>
          struct Euler1D \<less\>: AbstractEquations{1, 3}

          <nbsp> <nbsp> \<vdots\> # contains information like gas constant
          gamma

          <nbsp> <nbsp> \<vdots\>

          end
        </code*>>
      </julia-code>
    </cell>>>>
  </wide-tabular>

  Thus, any instantiation of <verbatim|Euler1D> will know <verbatim|NDIMS=1>
  and <verbatim|NVAR=3> so that these values are known at the time of
  compilation. If <verbatim|eq> is an instantiation of such a
  <verbatim|struct>, the following function makes use of this compile time
  information<\footnote>
    Julia uses a just-in-time compiler and we thus do not need to specify the
    types when defining a function.
  </footnote>.

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\julia-code>
        function mul_add_to_node_vars!(u, factor, u_node, eq, indices)

        <nbsp> <nbsp> for v in 1:nvariables(eq)

        <nbsp> <nbsp> <nbsp> <nbsp> u[v, indices] = u[v, indices] + factor *
        u_node[v]

        <nbsp> <nbsp> end

        <nbsp> <nbsp> return nothing

        end
      </julia-code>
    </cell>>>>
  </wide-tabular>

  In the slicing notation of <verbatim|python> and <verbatim|fortran>, this
  function performs <verbatim|u[:,indices] += u[:,indices] + factor * u_node>
  but with the capability of performing the operation faster as it knows the
  size of each slice. The final ingredient we will be needing in Julia is an
  array type that can store data in the cache. The array type we use is
  <verbatim|SVector> (static vector) from the Julia package
  <verbatim|StaticArrays.jl>. The usage of this package is recommended for
  arrays with less than 100 entries. To motivate the usage of
  <verbatim|StaticArrays.jl>, we first show a pseudocode for application of
  the <vD><rsub|1> matrix on the flux<nbsp>(<reference|eq:fder>,<nbsp><reference|eq:up2d>)
  in Algorithm<nbsp><reference|alg:cache.blocking>.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            Cache blocking flux differentiation<label|alg:cache.blocking>
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\julia-code>
        for cell in eachelement(grid) # Cell loop

        <nbsp> <nbsp> for i in eachnode(basis) \ # DoF loop

        <nbsp> <nbsp> <nbsp> <nbsp> u_node = get_node_vars(equations, u, i,
        cell)

        <nbsp> <nbsp> <nbsp> <nbsp> f_node = flux(u_node)

        <nbsp> <nbsp> <nbsp> <nbsp> for ix in eachnode(basis)

        <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> # Equivalent to
        fder[:,ix,i,cell] += D1[ix,i] * f_node

        <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> mul_add_to_node_vars!(eq,
        D1[ix,i], f_node, fder, ix, cell)

        <nbsp> <nbsp> <nbsp> <nbsp> end

        <nbsp> <nbsp> end

        end
      </julia-code>
    </cell>>>>
  </wide-tabular>

  The function <verbatim|get_node_vars> in
  Algorithm<nbsp><reference|alg:cache.blocking> loads the <verbatim|NVAR>
  variables at a solution point into <verbatim|u_node> of type
  <verbatim|SVector>.

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\julia-code>
        <code|<\code*>
          @inline function get_node_vars(u, eq, indices)

          <nbsp> <nbsp> SVector(ntuple(@inline(v -\<gtr\> u[v, indices]),
          nvariables(eq)))

          end
        </code*>>
      </julia-code>
    </cell>>>>
  </wide-tabular>

  The function is made to use the <verbatim|NVAR> information known at the
  time of compilation by using the <verbatim|nvariables> function we
  described earlier. This leads to an <verbatim|SVector> that will be stored
  in the cache. Then, the flux computation can be performed without a write
  to the memory, returning another <verbatim|SVector> which will live in
  cache.

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\julia-code>
        <code|<\code*>
          @inline function flux(u, eq::Euler1D)

          <nbsp> <nbsp> rho, rho_v1, rho_e = u

          <nbsp> <nbsp> v1 = rho_v1 / rho

          <nbsp> <nbsp> p \ = (eq.gamma - 1) * (rho_e - 0.5 * rho_v1 * v1)

          <nbsp> <nbsp> f1 = rho_v1

          <nbsp> <nbsp> f2 = rho_v1 * v1 + p

          <nbsp> <nbsp> f3 = (rho_e + p) * v1

          <nbsp> <nbsp> return SVector(f1, f2, f3)

          end
        </code*>>
      </julia-code>
    </cell>>>>
  </wide-tabular>

  Once the flux at a solution point is computed, another loop over solution
  points is performed in Algorithm<nbsp><reference|alg:cache.blocking> to add
  its contribution to <verbatim|fder>. The <verbatim|mul_add_to_node_vars!>
  function is used for efficient application of this operation. A minimal
  working example of a code that involves writing to memory is provided at

  <center|<hlink|https://github.com/Arpit-Babbar/renshu/blob/main/misc/benchmarks_julia/memory_write.jl|https://github.com/Arpit-Babbar/renshu/blob/main/misc/benchmarks_julia/memory_write.jl>>

  <no-indent>Another code with cache blocking is provided here

  <hlink|<center|https://github.com/Arpit-Babbar/renshu/blob/main/misc/benchmarks_julia/cache_block.jl>|https://github.com/Arpit-Babbar/renshu/blob/main/misc/benchmarks_julia/cache_block.jl>

  The codes have benchmarking built into them that clearly show the many
  factors of improvement obtained by cache blocking. The
  figure<nbsp><reference|eq:cache.blocking> illustrates cache blocking where
  <math|<wide|f|~>,<wide|u|~>> denote <verbatim|f_node>, <verbatim|u_node>
  respectively.

  <big-figure|<wide-tabular|<tformat|<table|<row|<\cell>
    <with|font-base-size|16|gr-frame|<tuple|scale|0.630672cm|<tuple|0.52gw|0.450004gh>>|magnify|0.63067231125|gr-geometry|<tuple|geometry|1par|0.457703par|center>|gr-mode|<tuple|group-edit|move>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|<graphics||<rectangle|<point|-10.8995|6.00045>|<point|-1.92472549279005|2.06341778012965>>|<rectangle|<point|4.93332|5.89461>|<point|11.3045376372536|2.04225095912158>>|<math-at|<large|<with|font-base-size|16|f<rprime|'>>>|<point|-7.14263201926147|3.72319850194152>>|<with|fill-color|red|<rectangle|<point|3.00714|2.04225>|<point|-0.421881201217092|6.00044648763064>>>|<math-at|<large|<with|font-base-size|16|D<rsub|1>>>|<point|0.77847216007963|3.84354423902235>>|<math-at|<large|<with|font-base-size|16|f>>|<point|7.94167599084805|3.7696819992925>>|<with|line-width|2ln|<arc|<point|8.87629049714195|1.78846305936337>|<point|10.0404700142738|-1.72522948647603>|<point|8.96096214286224|-4.87908581667843>>>|<math-at|<large|<with|font-base-size|16|u>>|<point|5.75358111831555|-1.74295062388289>>|<rectangle|<point|2.94958049714195|1.30162595936337>|<point|8.83396121681386|-4.4134157545009>>|<with|fill-color|red|<rectangle|<point|3.78716049714195|1.30162595936337>|<point|5.30127794476593|-4.4134157545009>>>|<math-at|<large|<wide|u|~>>|<point|4.33607081065426|-1.76139212801028>>|<with|line-width|2ln|<arc|<point|2.33574749714195|1.72496205936337>|<point|1.42557386398942|-1.57706173941954>|<point|2.69558312447361|-5.02725356373492>>>|<math-at|<with|font-base-size|40|=>|<point|-2.9861642573811|-1.98271067885048>>|<\document-at>
      <with|font-base-size|28|<with|font-series|bold|Flux>>
    </document-at|<point|-1.22969024167038|-1.21744894208813>>|<rectangle|<point|-9.36947950285806|1.38629315936337>|<point|-3.61212953593121|-4.45574939651704>>|<math-at|<large|f><with|font-base-size|16|>|<point|-6.6723453274081|-1.66073038947102>>|<with|fill-color|red|<rectangle|<point|-8.48187950285806|1.38629315936337>|<point|-7.13811402926913|-4.45574939651704>>>|<math-at|<large|<wide|f|~>>|<point|-8.08576133605887|-1.66700055738796>>|<with|fill-color|red|<rectangle|<point|6.19458|5.89461>|<point|7.54506243969466|2.04225095912158>>>|<with|fill-color|red|<rectangle|<point|-9.37374|6.00045>|<point|-7.46979097615852|2.06341778012965>>>|<math-at|<large|<wide|f|~>>|<point|6.65188951086034|3.74284941081126>>|<math-at|<large|<wide|f|~><rprime|'>>|<point|-8.93094324646117|3.76642082286017>>|<math-at|<with|font-base-size|40|=>|<point|-1.67157281105458|3.6591100692223>>|<math-at|<with|font-base-size|40|\<times\>>|<point|3.452287188421|3.5666741449473>>>>
  </cell>>>>><label|eq:cache.blocking>|<caption-detailed|Cache blocking flux
  differentiation (illustration from<nbsp><cite|Vincent2022>).|Cache blocking
  flux differentiation.>>

  <appendix|Equivalence with DFR><label|sec:frdfr>

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
    <od||\<xi\>>*<around|(|g<rsub|L>-<wide|\<ell\>|~><rsub|-1>|)><around|(|\<xi\><rsub|p>|)>=0,<space|2em>p=0,1,\<ldots\>,N
  </equation*>

  i.e.,

  <\equation*>
    L<rsub|N><rprime|'><around|(|2*\<xi\><rsub|p>-1|)>-L<rsub|N+1><around|(|2*\<xi\><rsub|p>-1|)>-<around|(|2*\<xi\><rsub|p>-1|)>*L<rsub|N+1><rprime|'><around|(|2*\<xi\><rsub|p>-1|)>=0,<space|2em>p=0,1,\<ldots\>,N
  </equation*>

  To work in <math|<around|[|-1,1|]>> which is the natural domain of Legendre
  polynomials, we define the residual <math|R<around|(|\<eta\>|)>=L<rsub|N><rprime|'><around|(|\<eta\>|)>-L<rsub|N+1><around|(|\<eta\>|)>-\<eta\>*L<rsub|N+1><rprime|'><around|(|\<eta\>|)>>
  so we have to show

  <\equation*>
    R<around|(|\<eta\><rsub|p>|)>=0,<space|2em>p=0,1,\<ldots\>,N
  </equation*>

  where <math|\<eta\><rsub|p>=2*\<xi\><rsub|p>-1> are the Gauss-Legendre
  points in <math|<around|[|-1,+1|]>>. Using the recurrence relations

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<around|(|1-\<eta\><rsup|2>|)>*L<rsub|N+1><rprime|'><around|(|\<eta\>|)>>|<cell|=>|<cell|<around|(|N+1|)>*<around|[|L<rsub|N><around|(|\<eta\>|)>-\<eta\>*L<rsub|N+1><around|(|\<eta\>|)>|]>>>|<row|<cell|L<rsub|N><rprime|'><around|(|\<eta\>|)>>|<cell|=>|<cell|<around|(|N+1|)>*<around|[|\<eta\>*L<rsub|N><around|(|\<eta\>|)>-L<rsub|N+1><around|(|\<eta\>|)>|]>>>>>>
  </equation*>

  we get

  <\equation*>
    R<around|(|\<eta\>|)>=-<around|(|N+2|)>*L<rsub|N+1><around|(|\<eta\>|)>
  </equation*>

  proving that <math|R<around|(|\<eta\><rsub|p>|)>=0> for all
  <math|p=0,1,\<ldots\>,N> since these <math|\<eta\><rsub|p>> are the zeros
  of <math|L<rsub|N+1>>. Thus, <math|<vb><rsub|L><rsup|FR>=<vb><rsub|L><rsup|DFR>>.
  The claim for right correction follows analogously.

  <paragraph|Equivalence of <math|<vD><rsub|1>>.>Writing
  <math|<vb><rsub|L>=<vb><rsup|FR><rsub|L>=<vb><rsup|DFR><rsub|L>> and
  <math|<vb><rsub|R>=<vb><rsup|FR><rsub|R>=<vb><rsup|DFR><rsub|R>>, proving
  that the <math|<vD><rsub|1>> matrices are same for both schemes is
  equivalent to showing that

  <\equation*>
    <vD>=<vD><rsub|1><rsup|DFR>+<vb><rsub|L>
    <vV><rsub|L><rsup|\<top\>>+<vb><rsub|R> <vV><rsub|R><rsup|\<top\>>
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
    <tabular*|<tformat|<cwith|3|3|2|2|cell-halign|l>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|(|<vD><rsub|1><rsup|DFR>+<vb><rsub|L><vV><rsub|L><rsup|\<top\>>+<vb><rsub|R><vV><rsub|R><rsup|\<top\>>|)><vp>>|<cell|>>|<row|<cell|=>|<cell|<around*|[|<tabular*|<tformat|<table|<row|<cell|<big|sum><rsub|q=0><rsup|N>p<around|(|\<xi\><rsub|0>|)>*<wide|\<ell\>|~><rprime|'><rsub|q><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|<big|sum><rsub|q=0><rsup|N>p<around|(|\<xi\><rsub|N>|)>*<wide|\<ell\>|~><rprime|'><rsub|q><around|(|\<xi\><rsub|N>|)>>>>>>|]>+<around*|[|<tabular*|<tformat|<table|<row|<cell|p<around|(|0|)>*<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|p<around|(|0|)>*<wide|\<ell\>|~><rsub|-1><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>+<around*|[|<tabular*|<tformat|<table|<row|<cell|p<around|(|1|)>*<wide|\<ell\>|~><rsub|N+1><rprime|'><around|(|\<xi\><rsub|0>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|p<around|(|1|)>*<wide|\<ell\>|~><rsub|N+1><rprime|'><around|(|\<xi\><rsub|N>|)>>>>>>|]>>>|<row|<cell|=>|<cell|<vp><rprime|'>=<vD><vp>>>>>>
  </equation*>

  for all <math|<vp>\<in\><re><rsup|N+1>>, which proves the claim.

  <appendix|Scaling limiter><label|app:scaling.limiter>

  In Chapters<nbsp><reference|ch:lw.subcell.limiter>,<nbsp><reference|ch:10mom>,
  we developed Flux Reconstruction schemes that were admissibility preserving
  in means (Definition<nbsp><reference|defn:mean.pres>). In this section, we
  review the scaling limiter of<nbsp><cite|Zhang2010b> to use admissibility
  in means to obtain an admissibility preserving scheme
  (Definition<nbsp><reference|defn:adm.pres>).

  Consider the solution <math|<value|uu><rsub|h><rsup|n>> at current time
  time level <math|n>. Within each element,
  <math|<value|uu><rsub|h><rsup|n>\<in\><poly><rsub|N>> and since the scheme
  is admissibility in means, we assume <math|<au><rsup|n><rsub|e>\<in\><Uad>>
  for each element <math|e>. We will iteratively correct all admissibility
  constraints <math|<around*|{|<value|ad><rsub|k>|}><rsub|k=1><rsup|d>><nbsp><eqref|eq:uad.form>.
  For each constraint <math|<value|ad><rsub|k>>, we find
  <math|\<theta\><rsub|k>\<in\><around*|[|0,1|]>> such that
  <math|<value|ad><rsub|k><around*|(|<around*|(|1-\<theta\><rsub|k>|)>*<au><rsup|n><rsub|e>+\<theta\><rsub|k>*<value|uu><rsub|h><rsup|n>|)>\<gtr\>0>
  at the <math|N+1> solution points and replace the polynomial
  <math|<value|uu><rsub|h><rsup|n>> with <math|<around*|(|1-\<theta\>|)>*<au><rsup|n><rsub|e>+\<theta\>*<value|uu><rsub|h><rsup|n>>.
  In case of concave <math|<value|ad><rsub|k>>, we choose
  <math|\<theta\><rsub|k>> to be

  <\equation>
    \<theta\><rsub|k>=min <around*|(|min<rsub|0\<leq\>p\<leq\>N><around*|\||<frac|\<epsilon\><rsub|p>-<ad><rsub|k><around|(|<au><rsup|n><rsub|e>|)>|<ad><rsub|k><around|(|<value|uep><rsup|n>|)>-<ad><rsub|k><around|(|<au><rsup|n><rsub|e>|)>>|\|>,1|)><label|eq:scaling.conv.theta>
  </equation>

  If it is not, we solve a nonlinear equation to find the largest
  <math|\<theta\><rsub|k>\<in\><around*|[|0,1|]>> satisfying

  <\equation>
    <value|ad><rsub|k><around*|(|<around*|(|1-\<theta\><rsub|k>|)>*<au><rsup|n><rsub|e>+\<theta\><rsub|k>*<value|uep><rsup|n>|)>=\<epsilon\><rsub|p>,<space|2em>0\<leq\>p\<leq\>N<label|eq:scaling.general.theta>
  </equation>

  This procedure is performed for all <math|k> and the minimum is
  successively taken, as described in Algorithm<nbsp><reference|alg:scaling>.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            <label|alg:scaling>Scaling limiter
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <math|\<theta\>=1>

          <no-indent><with|font-series|bold|for> <math|k=1:K>
          <with|font-series|bold|do>

          <tabular|<tformat|<table|<row|<cell|>|<cell|<algo-state|<math|\<epsilon\><rsub|k>=<frac|1|10>*<value|ad><rsub|k><around|(|<au><rsub|e><rsup|n>|)>>>>>|<row|<cell|<space|1em>>|<cell|<algo-state|Find
          <math|\<theta\><rsub|k>> by solving<nbsp><eqref|eq:scaling.general.theta>
          or by using<nbsp><eqref|eq:scaling.conv.theta> if
          <math|<value|ad><rsub|k>> is concave>>>|<row|<cell|>|<cell|<math|\<theta\>\<leftarrow\>min<around*|(|\<theta\><rsub|k>,\<theta\>|)>>>>>>>

          <no-indent><with|font-series|bold|end for>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  The idea of choosing <math|\<theta\><rsub|k>> by
  solving<nbsp><eqref|eq:scaling.general.theta> is to maintain the formal
  order of accuracy. In<nbsp><cite|zhang2010c|Meena_Kumar_Chandrashekar_2017>,
  it was shown that<nbsp><eqref|eq:scaling.general.theta> maintains optimal
  order of accuracy for Compressible Euler's
  equations<nbsp><eqref|eq:2deuler> and Ten Moment
  problem<nbsp><eqref|eq:tmp.tmp> respectively.
  In<nbsp><cite|zhang2010c|Meena_Kumar_Chandrashekar_2017>, the
  <math|\<theta\><rsub|k>> in<nbsp><eqref|eq:scaling.general.theta> was found
  by solving a quadratic and cubic equation respectively. In this work, we
  solve it by using a general nonlinear iterative solver that applies to any
  choice of <math|<value|ad><rsub|k>>.

  <appendix|Admissibility of MUSCL-Hancock on general
  grids><label|sec:muscl.admissibility.proof>

  <section|Introduction and notations>

  In this appendix, we prove Theorem<nbsp><reference|thm:muscl.admissibility.theorem>
  regarding admissibility of the MUSCL-Hancock scheme described in
  Section<nbsp><reference|sec:mh> on non-cell centred grids. These grids
  arise in the subcell based blending scheme of
  Section<nbsp><reference|sec:blending.scheme> as we demand a conservative
  scheme. The prove is provided here for general non-cell centred grids like
  in Figure<nbsp><reference|fig:general.grid>.

  We now mention some notations that will be used in the proof. For the 1-D
  conservation law<nbsp><eqref|eq:con.law>, define
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
    <tabular|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|\<sigma\><rsub|x><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>>|<cell|=>|<cell|max
    <around|{|\<rho\><around|(|<ff><rprime|'><around|(|<bw><rsub|\<lambda\>>|)>|)>:<bw><rsub|\<lambda\>>=\<lambda\>*<bw><rsub|1>+<around|(|1-\<lambda\>|)>*<bw><rsub|2>,<space|1em>0\<le\>\<lambda\>\<le\>1|}>>>|<row|<cell|\<sigma\><rsub|y><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>>|<cell|=>|<cell|max
    <around|{|\<rho\><around|(|<value|fg><rprime|'><around|(|<bw><rsub|\<lambda\>>|)>|)>:<bw><rsub|\<lambda\>>=\<lambda\>*<bw><rsub|1>+<around|(|1-\<lambda\>|)>*<bw><rsub|2>,<space|1em>0\<le\>\<lambda\>\<le\>1|}>>>>>>
  </equation*>

  We assume that the admissibility set <math|<Uad>> of the conservation law
  is a convex subset of <math|<re><rsup|d>> which can be written
  as<nbsp><eqref|eq:uad.form>. The following assumption is made concerning
  the admissibility of first order finite volume scheme.

  <paragraph|Admissibility of first order finite volume scheme.>Under the
  time step restriction

  <\equation>
    <label|eq:numflux.admissibility.cfl>max<rsub|p>
    <frac|\<Delta\>t|\<Delta\>x<rsub|p>>*\<sigma\><around|(|<bw><rsub|p><rsup|n>,<bw><rsub|p+1><rsup|n>|)>\<le\>1
  </equation>

  the first order finite volume method

  <\equation*>
    <bw><rsub|p><rsup|n+1>=<bw><rsub|p><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around*|(|<ff><around|(|<bw><rsub|p><rsup|n>,<bw><rsub|p+1><rsup|n>|)>-<ff><around|(|<bw><rsub|p-1><rsup|n>,<bw><rsub|p><rsup|n>|)>|)>
  </equation*>

  is admissibility preserving, i.e., <math|<bw><rsub|p><rsup|n>\<in\><Uad>>
  for all <math|p> implies that <math|<bw><rsub|p><rsup|n+1>\<in\><Uad>> for
  all <math|p>.

  <section|Review of MUSCL-Hancock scheme>

  Here we review the MUSCL-Hancock scheme for general uniform grids that need
  not be cell-centered (Figure<nbsp><reference|fig:general.grid>) in the
  sense that

  <\equation>
    <label|eq:non.cell.centred.defn>x<rsub|<value|pph>>-x<rsub|p>\<ne\>x<rsub|p>-x<rsub|<value|pmh>>,
  </equation>

  for some <math|p> where <math|x<rsub|p>> is the solution point in finite
  volume element <math|<around|(|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|)>>.
  The grid used in the blending limiter (Figure<nbsp><reference|fig:subcells>)
  is a special case of<nbsp><eqref|eq:non.cell.centred.defn>.

  <\big-figure>
    <padded-center|<image|illustrations/non_cell_centred_grid|0.97par|||><label|fig:general.grid>>
  </big-figure|Non-uniform, non-cell-centered finite volume grid>

  For the <math|p<rsup|th>> finite volume element
  <math|<around|(|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|)>>, the constant
  state is denoted <math|<bw><rsub|p><rsup|n>> and the linear approximation
  will be denoted <math|<br><rsup|n><rsub|p><around|(|x|)>>. For conservative
  reconstruction, the linear reconstruction is given by

  <\equation*>
    <br><rsub|p><rsup|n><around|(|x|)>=<bw><rsub|p><rsup|n>+<around|(|x-x<rsub|p>|)>*<slope><rsub|p>,<space|2em>x\<in\><around*|(|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|)>
  </equation*>

  The values on left and right faces will be computed as

  <\equation>
    <label|eq:reconstruction.general><bw><rsup|n,-><rsub|p>=<bw><rsub|p><rsup|n>+<around|(|x<rsub|<value|pmh>>-x<rsub|p>|)>*<slope><rsub|p>,<space|2em><bw><rsub|p><rsup|n,+>=<bw><rsub|p>+<around|(|x<rsub|<value|pph>>-x<rsub|p>|)>*<slope><rsub|p>
  </equation>

  We use Taylor's expansion to evolve the solution to
  <math|t<rsub|n>+<half>*\<Delta\>t>

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<bw><rsub|p><rsup|<nph>,->>|<cell|=>|<cell|<bw><rsub|p><rsup|n,->-<frac|\<Delta\>t|2*\<Delta\>x<rsub|p>>*<around|(|<value|pf><around|(|<bw><rsub|p><rsup|n,+>|)>-<value|pf><around|(|<bw><rsub|p><rsup|n,->|)>|)>>>|<row|<cell|<bw><rsub|p><rsup|<nph>,+>>|<cell|=>|<cell|<bw><rsub|p><rsup|n,+>-<frac|\<Delta\>t|2*\<Delta\>x<rsub|p>>*<around|(|<value|pf><around|(|<bw><rsub|p><rsup|n,+>|)>-<value|pf><around|(|<bw><rsub|p><rsup|n,->|)>|)>>>>>><label|eq:evolution.general>
  </equation>

  where <math|\<Delta\>x<rsub|p>=x<rsub|<value|pph>>-x<rsub|<value|pmh>>>.
  The final update is performed by using an approximate Riemann solver on the
  evolved quantities

  <\equation>
    <bw><rsub|p><rsup|n+1>=<bw><rsub|p><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around*|(|<ff><rsub|<value|pph>><rsup|n+<frac|1|2>>-<ff><rsup|n+<frac|1|2>><rsub|<value|pmh>>|)><label|eq:muscl.final.general>
  </equation>

  where

  <\equation*>
    <ff><rsub|<value|pph>><rsup|n+<frac|1|2>>=<ff><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,+>,<bw><rsub|p+1><rsup|n+<frac|1|2>,->|)>
  </equation*>

  is some numerical flux function. The key idea of the proof is to write the
  evolution <math|<bw><rsub|p><rsup|<nph>,\<pm\>>>
  from<nbsp><eqref|eq:evolution.general> as a convex combination of exact
  solution of some Riemann problem and the final update
  <math|<bw><rsub|p><rsup|n+1>> from<nbsp><eqref|eq:muscl.final.general> as a
  convex combination of first order finite volume updates on appropriately
  chosen subcells.

  <section|Primary generalization for proof>

  For the uniform, cell-centered case, Berthon<nbsp><cite|Berthon2006>
  defined <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> to satisfy

  <\equation*>
    <frac|1|2>*<bw><rsub|p><rsup|n,->+<bw><rsub|p><rsup|\<ast\>,\<pm\>>+<frac|1|2>*<bw><rsub|p><rsup|n,+>=2*<bw><rsub|p><rsup|n,\<pm\>>
  </equation*>

  We generalize it for non-cell centered grids<nbsp><eqref|eq:non.cell.centred.defn>

  <\equation*>
    <mum><bw><rsub|p><rsup|n,->+<bw><rsub|p><rsup|\<ast\>,\<pm\>>+<mup><bw><rsub|p><rsup|n,+>=2*<bw><rsub|p><rsup|n,\<pm\>>
  </equation*>

  where

  <\equation>
    <label|eq:mu.pm><mum>=<frac|x<rsub|<value|pph>>-x<rsub|p>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>,<space|2em><mup>=<frac|x<rsub|p>-x<rsub|<value|pmh>>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>
  </equation>

  This choice was made to keep the natural extension of
  <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> in the conservative reconstruction
  case:

  <\equation*>
    <bw><rsub|p><rsup|\<ast\>,\<pm\>>=<bw><rsub|p><rsup|n>+2*<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p>
  </equation*>

  noting that <math|<bw><rsub|p><rsup|n,\<pm\>>> are given
  by<nbsp><eqref|eq:reconstruction.general>.

  <section|Proving admissibility><label|sec:mh.adm>

  The following lemma about conservation laws will be crucial in the proof.

  <\lemma>
    <math|<label|lemma:avg.riemann.problem>>Consider the 1-D Riemann problem

    <\align*>
      <tformat|<table|<row|<cell|<bw><rsub|t>+<ff><around|(|<bw>|)><rsub|x>>|<cell|=<value|bzero>>>|<row|<cell|<bw><around|(|x,0|)>>|<cell|=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|<bw><rsub|l>,>|<cell|<space|1em>>|<cell|x\<less\>0>>|<row|<cell|<bw><rsub|r>,>|<cell|>|<cell|x\<gtr\>0>>>>>|\<nobracket\>>>>>>
    </align*>

    in <math|<around|[|-h,h|]>\<times\><around|[|0,\<Delta\>t|]>> where

    <\equation>
      <label|eq:con.law.dt><frac|\<Delta\>t|h>*\<sigma\><around|(|<bw><rsub|l>,<bw><rsub|r>|)>\<leq\>1
    </equation>

    Then, for all <math|t\<le\>\<Delta\>t>,

    <\equation*>
      <big|int><rsub|-h><rsup|h><bw><around|(|x,t|)><ud>*x=h*<around|(|<bw><rsub|l>+<bw><rsub|r>|)>-t*<around|(|<value|pf><around|(|<bw><rsub|r>|)>-<value|pf><around|(|<bw><rsub|l>|)>|)>
    </equation*>
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

    <\equation*>
      <big|int><rsub|-h><rsup|0><bw><around|(|x,t|)><ud>*x=h*<bw><rsub|l>-t(\<nobracket\><ff><around|(|<wide|<bw>|~><around|(|0<rsup|->|)>-<ff><around|(|<bw><rsub|l>|)>|)>
    </equation*>

    Similarly,

    <\equation*>
      <big|int><rsub|0><rsup|h><bw><around|(|x,t|)>*<ud>*x=h*<bw><rsub|r>-t*<around|(|<ff><around|(|<bw><rsub|r>|)>-<ff><around|(|<wide|<bw>|~><around|(|0<rsup|+>|)>|)>|)>
    </equation*>

    If <math|<wide|<bw>|~>> is discontinuous at <math|x=0>, by
    Rankine-Hugoniot conditions, we will have a stationary jump at
    <math|x/t=0> and obtain <math|<ff><around|(|<wide|<bw>|~><around|(|0<rsup|+>|)>|)>=<ff><around|(|<wide|<bw>|~><around|(|0<rsup|->|)>|)>>.
    The same trivially holds if <math|<wide|<bw>|~>> is continuous at
    <math|x/t=0>. Thus, we can sum the previous two identities to get
    <eqref|lemma:avg.riemann.problem>.
  </proof>

  We will now give a criterion under which we can prove
  <math|<bw><rsub|p><rsup|<nph>,\<pm\>>\<in\><Uad>>, i.e., the evolution
  step<nbsp><eqref|eq:evolution.general> preserves <math|<Uad>>.

  <\lemma>
    <label|lemma:m.h.step.1>Define <math|\<mu\><rsub|\<pm\>>> by
    <eqref|eq:mu.pm> and pick <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> to
    satisfy

    <\equation>
      <label|eq:ustar.defn><frac|<mum>|2>*<bw><rsub|p><rsup|n,->+<frac|1|2>*<bw><rsub|p><rsup|\<ast\>,\<pm\>>+<frac|<mup>|2>*<bw><rsub|p><rsup|n,+>=<bw><rsub|p><rsup|n,\<pm\>>
    </equation>

    Assume <math|<bw><rsub|p><rsup|n,\<pm\>>,<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<in\><Uad>>
    and the CFL restrictions

    <\equation>
      max<rsub|p> <frac|\<Delta\>t|<mum>\<Delta\>x<rsub|p>>*\<sigma\><around*|(|<bw><rsub|p><rsup|n,->,<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)>\<leq\>1,<space|2em>max<rsub|p>
      <frac|\<Delta\>t|<mup>\<Delta\>x<rsub|p>>*\<sigma\><around*|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>,<bw><rsub|p><rsup|n,+>|)>\<leq\>1<label|eq:new.cfl1>
    </equation>

    are satisfied. Then, <math|<bw><rsub|p><rsup|n+<half>,\<pm\>>> given by
    the first step<nbsp><eqref|eq:evolution.general> of the MUSCL-Hancock
    scheme is in <math|<Uad>>.
  </lemma>

  <\proof>
    We will prove that <math|<bw><rsub|p><rsup|n+<frac|1|2>,+>\<in\><Uad>>,
    and the proof for <math|<bw><rsub|p><rsup|n+<frac|1|2>,->> shall follow
    similarly. The key idea is to write <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<pm\>>>
    as the exact solution of some Riemann problems. Define
    <math|<bw><rsup|h><around|(|x,t|)>:<around|(|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|)>\<times\><around|(|0,\<Delta\>t/2|)>\<rightarrow\><Uad>>
    to be the weak solution of the Cauchy problem with initial data

    <\equation*>
      <bw><rsup|h><around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|<bw><rsub|p><rsup|n,->,<space|1em>>|<cell|if
      x\<in\><around|(|x<rsub|<value|pmh>>,x<rsub|p-1/4>|)>>>|<row|<cell|<bw><rsub|p><rsup|\<ast\>,+>,>|<cell|if
      x\<in\><around|(|x<rsub|p-1/4>,x<rsub|p+1/4>|)>>>|<row|<cell|<bw><rsub|p><rsup|n,+>,>|<cell|if
      x\<in\><around|(|x<rsub|p+1/4>,x<rsub|<value|pph>>|)>>>>>>
    </equation*>

    where

    <\equation*>
      x<rsub|p-<frac|1|4>>=<frac|1|2>*<around|(|x<rsub|<value|pmh>>+<wide|x|~><rsub|p>|)>,<space|2em>x<rsub|p+<frac|1|4>>=<frac|1|2>*<around|(|<wide|x|~><rsub|p>+x<rsub|<value|pph>>|)>,<space|2em><wide|x|~><rsub|p>=x<rsub|<value|pmh>>+<mum>*\<Delta\>x<rsub|p>
    </equation*>

    Under our time step restrictions<nbsp><eqref|eq:new.cfl1>, the solution
    <math|<bw><rsup|h>> at time <math|<frac|\<Delta\>t|2>> is made up of
    non-interacting Riemann problems centered at
    <math|x<rsub|p\<pm\><frac|1|4>>>, see
    Figure<nbsp><reference|fig:non.interacting.rp1>. We take the projection
    of <math|<bw><rsup|h><around|(|x,\<Delta\>t/2|)>> on piecewise-constant
    functions

    <\equation*>
      <wide|<bw>|~><rsub|p><rsup|n+<frac|1|2>,+>\<assign\><frac|1|\<Delta\>x<rsub|p>>*<big|int><rsub|x<rsub|<value|pmh>>><rsup|x<rsub|<value|pph>>><space|0.2spc><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x
    </equation*>

    Since we assumed that the conservation law preserves <math|<Uad>>, we get
    <math|<wide|<bw>|~><rsub|p><rsup|n+<frac|1|2>,+>\<in\><Uad>>. If we prove
    <math|<wide|<bw>|~><rsub|p><rsup|n+<frac|1|2>,+>=<bw><rsub|p><rsup|n+<half>,+>>,
    we will have our claim. Applying Lemma
    <reference|lemma:avg.riemann.problem> to the two non-interacting Riemann
    problems, we get

    <\big-figure>
      <padded-center|<image|illustrations/non_interacting_rp1|0.9par|||><label|fig:non.interacting.rp1>>
    </big-figure|Two non-interacting Riemann problems>

    <\equation*>
      <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|4|4|3|3|cell-halign|l>|<cwith|5|5|3|3|cell-halign|l>|<table|<row|<cell|<wide|<bw>|~><rsub|p><rsup|n+<frac|1|2>,+>>|<cell|=>|<cell|<frac|1|\<Delta\>x<rsub|p>>*<around*|(|<big|int><rsub|x<rsub|<value|pmh>>><rsup|<wide|x|~><rsub|p>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x+<big|int><rsub|<wide|x|~><rsub|p>><rsup|x<rsub|<value|pph>>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<Delta\>x<rsub|p>>*<around*|[|<tabular*|<tformat|<table|<row|<cell|<frac|<wide|x|~><rsub|p>-x<rsub|<value|pmh>>|2>*<bw><rsub|p><rsup|n,->+<frac|\<Delta\>x<rsub|p>|2>*<bw><rsub|p><rsup|\<ast\>,+>+<frac|x<rsub|<value|pph>>-<wide|x|~><rsub|p>|2>*<bw><rsub|p><rsup|n,+>>>|<row|<cell|-<frac|\<Delta\>t|2>*<around*|(|<value|pf><around*|(|<bw><rsub|p><rsup|n,+>|)>-<value|pf><around*|(|<bw><rsub|p><rsup|n,->|)>|)>>>>>>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*<around*|(|<mum><bw><rsub|p><rsup|n,->+<bw><rsub|p><rsup|\<ast\>,+>+<mup><bw><rsub|p><rsup|n,+>|)>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|p>>*<around*|(|<value|pf><around*|(|<bw><rsub|p><rsup|n,+>|)>-<value|pf><around*|(|<bw><rsub|p><rsup|n,->|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|p><rsup|n,+>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|p>>*<around*|(|<value|pf><around*|(|<bw><rsub|p><rsup|n,+>|)>-<value|pf><around*|(|<bw><rsub|p><rsup|n,->|)>|)>,<space|1em><text|using<nbsp><eqref|eq:ustar.defn>>>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|p><rsup|n+<frac|1|2>,+>,<space|1em><text|by<nbsp><eqref|eq:evolution.general>>>>>>>
    </equation*>

    This proves our claim.
  </proof>

  Now, we introduce a new variable <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>>
  defined as follows:

  <\equation>
    <label|eq:uj.nph.s><mum>*<bw><rsub|p><rsup|<value|nph>,->+<bw><rsub|p><rsup|<value|nph>,\<ast\>>+<mup>*<bw><rsub|p><rsup|<value|nph>,+>=2*<bw><rsub|p><rsup|n>
  </equation>

  <\big-figure>
    <padded-center|<image|illustrations/fv_evolution|0.9par|||><label|fig:fv.evolution>>
  </big-figure|Finite volume evolution>

  As illustrated in Figure<nbsp><reference|fig:fv.evolution>, we evolve each
  state according to the associated first order scheme to define the
  following

  <\equation>
    <tabular|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<bw><rsub|p><rsup|n+1,->>|<cell|=>|<cell|<bw><rsub|p><rsup|n+<frac|1|2>,->-<cfrac|\<Delta\>t|<mum>\<Delta\>x<rsub|p>/2>*<around*|(|<value|pf>*<around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,->,<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>|)>-<value|pf>*<around*|(|<bw><rsub|p-1><rsup|n+<frac|1|2>,+>,<bw><rsub|p><rsup|n+<frac|1|2>,->|)>|)>>>|<row|<cell|<bw><rsub|p><rsup|n+1,\<ast\>>>|<cell|=>|<cell|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>-<cfrac|\<Delta\>t|\<Delta\>x<rsub|p>/2>*<around*|(|<value|pf>*<around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|p><rsup|n+<frac|1|2>,+>|)>-<value|pf>*<around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,->,<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>|)>|)>>>|<row|<cell|<bw><rsub|p><rsup|n+1,+>>|<cell|=>|<cell|<bw><rsub|p><rsup|n+<frac|1|2>,+>-<cfrac|\<Delta\>t|<mup>\<Delta\>x<rsub|p>/2>*<around*|(|<value|pf>*<around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,+>,<bw><rsub|p+1><rsup|n+<frac|1|2>,->|)>-<value|pf>*<around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|p><rsup|n+<frac|1|2>,+>|)>|)>>>>>><label|eq:all.fvm.updates>
  </equation>

  Recall that<nbsp><eqref|eq:muscl.final.general> is

  <\equation*>
    <bw><rsub|p><rsup|n+1>=<bw><rsub|p><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around*|(|<ff><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,+>,<bw><rsub|p+1><rsup|n+<frac|1|2>,->|)>-<ff><around*|(|<bw><rsub|p-1><rsup|n+<frac|1|2>,+>,<bw><rsub|p><rsup|n+<frac|1|2>,->|)>|)>
  </equation*>

  Using<nbsp><eqref|eq:uj.nph.s> and<nbsp><eqref|eq:all.fvm.updates>, we get

  <\equation*>
    <frac|<mum>|2>*<bw><rsub|p><rsup|n+1,->+<frac|1|2>*<bw><rsub|p><rsup|n+1,\<ast\>>+<frac|<mup>|2>*<bw><rsub|p><rsup|n+1,+>=<bw><rsub|p><rsup|n+1>
  </equation*>

  Thus, assuming <math|<bw><rsub|p><rsup|n+<frac|1|2>\<pm\>>,<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>>
  for all <math|p>, and since <math|<half>*<mum>+<half>*<mup>=1>, we get
  <math|<bw><rsub|p><rsup|n+1>\<in\><Uad>> under the following time step
  restrictions arising from the assumed time step
  requirement<nbsp><eqref|eq:numflux.admissibility.cfl> for admissibility of
  the first order finite volume method

  <\equation>
    <eqsplit|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|2|2|cell-halign|l>|<cwith|1|1|2|2|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<table|<row|<cell|>|<cell|max<rsub|p><cfrac|\<Delta\>t|<mum>*\<Delta\>x<rsub|p>/2>*\<sigma\><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,->,<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>|)>\<leq\>1,>|<cell|max<rsub|p><cfrac|\<Delta\>t|\<Delta\>x<rsub|p>/2>*\<sigma\><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,->,<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>|)>\<leq\>1>>|<row|<cell|>|<cell|max<rsub|p><cfrac|\<Delta\>t|<mum>*\<Delta\>x<rsub|p>/2>*\<sigma\><around*|(|<bw><rsub|p-1><rsup|n+<frac|1|2>,+>,<bw><rsub|p><rsup|n+<frac|1|2>,->|)>\<leq\>1,<space|1em>>|<cell|max<rsub|p><cfrac|\<Delta\>t|<mup>*\<Delta\>x<rsub|p>/2>*\<sigma\><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,+>,<bw><rsub|p+1><rsup|n+<frac|1|2>,->|)>\<leq\>1>>|<row|<cell|>|<cell|max<rsub|p><cfrac|\<Delta\>t|\<Delta\>x<rsub|p>/2>*\<sigma\><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|p><rsup|n+<frac|1|2>,+>|)>\<leq\>1,>|<cell|max<rsub|p><cfrac|\<Delta\>t|<mup>*\<Delta\>x<rsub|p>/2>*\<sigma\><around*|(|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|p><rsup|n+<frac|1|2>,+>|)>\<leq\>1>>>>><label|eq:new.cfl2>
  </equation>

  This can be summarised in the following Lemma.

  <\lemma>
    <label|lemma:muscl.step2.general>Assume that the states
    <math|<around*|{|<bw><rsub|p><rsup|n+<frac|1|2>,\<pm\>>|}><rsub|p>>,
    <math|<around*|{|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>|}><rsub|p>>
    belong to <math|<Uad>>, where <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>>
    is defined as in<nbsp><eqref|eq:uj.nph.s>. Then, the updated solution
    <math|<bw><rsub|p><rsup|n+1>> of MUSCL-Hancock scheme
    (<reference|eq:reconstruction.general>-<reference|eq:muscl.final.general>)
    is in <math|<Uad>> under the CFL conditions <eqref|eq:new.cfl2>.
  </lemma>

  Since Lemma <reference|lemma:m.h.step.1> states that
  <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<pm\>>\<in\><Uad>> if
  <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<in\><Uad>>, the only new condition
  pertains to <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>>. Our goal now is
  to understand this condition, and ultimately prove that it follows from the
  requirement that <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<in\><Uad>> in
  case of conservative reconstruction.

  Recall that <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>> was defined
  by<nbsp><eqref|eq:uj.nph.s>; expanding the definition of
  <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<pm\>>> given
  by<nbsp><eqref|eq:evolution.general> yields

  <\equation>
    <label|eq:uj.nph.s.explicit><bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>=2*<bw><rsub|p><rsup|n>-<around*|(|<mum><bw><rsub|p><rsup|n,->+<mup><bw><rsub|p><rsup|n,+>|)>-<frac|\<Delta\>t|2*\<Delta\>x<rsub|p>>*<around|(|<value|pf><around|(|<bw><rsub|p><rsup|n,->|)>-<value|pf><around|(|<bw><rsub|p><rsup|n,+>|)>|)>
  </equation>

  This identity<nbsp><eqref|eq:uj.nph.s.explicit> will be seen as an
  evolution update similar to<nbsp><eqref|eq:evolution.general> with
  <math|<bw><rsub|p><rsup|n,+>> and <math|<bw><rsub|p><rsup|n,->> being
  swapped and <math|<bw><rsub|p><rsup|n>> replaced with
  <math|2*<bw><rsub|p><rsup|n>-<around*|(|<mum>*<bw><rsub|p><rsup|n,->+<mup>*<bw><rsub|p><rsup|n,+>|)>>.
  The admissibility of <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>> will be
  studied by adapting the proof of admissibility
  for<nbsp><eqref|eq:evolution.general>, accounting for the differences in
  the case of<nbsp><eqref|eq:uj.nph.s.explicit>. Define
  <math|<bw><rsub|p><rsup|\<ast\>,\<ast\>>> so that

  <\equation>
    <label|eq:uss.defn><frac|<mum>|2>*<bw><rsub|p><rsup|n,->+<frac|1|2>*<bw><rsub|p><rsup|\<ast\>,\<ast\>>+<frac|<mup>|2>*<bw><rsub|p><rsup|n,+>=2*<bw><rsub|p><rsup|n>-<around|(|<mum>*<bw><rsub|p><rsup|n,->+<mup>*<bw><rsub|p><rsup|n,+>|)>
  </equation>

  i.e.,

  <\equation>
    <bw><rsub|p><rsup|\<ast\>,\<ast\>>=4*<bw><rsub|p><rsup|n>-3*<around|(|<mum>*<bw><rsub|p><rsup|n,->+<mup>*<bw><rsub|p><rsup|n,+>|)><label|eq:wss.simplified>
  </equation>

  The following Lemma extends the proof of Lemma <reference|lemma:m.h.step.1>
  to obtain conditions for <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>>.

  <\lemma>
    <label|lemma:muscl.step3.wss>Assume that
    <math|<bw><rsub|p><rsup|n>\<in\><Uad>> for all <math|p>. Consider the
    reconstructions <math|<bw><rsub|p><rsup|n,\<pm\>>> and the
    <math|<bw><rsub|p><rsup|\<ast\>,\<ast\>>> defined
    in<nbsp><eqref|eq:uss.defn>. Assume <math|<bw><rsub|p><rsup|n,\<pm\>>,<bw><rsub|p><rsup|\<ast\>,\<ast\>>\<in\><Uad>>
    and the time step restrictions

    <\equation>
      max<rsub|p> <frac|\<Delta\>t|<mum>*\<Delta\>x<rsub|p>>*\<sigma\><around*|(|<bw><rsub|p><rsup|\<ast\>,\<ast\>>,<bw><rsub|p><rsup|n,->|)>\<leq\>1,<space|2em>max<rsub|p>
      <frac|\<Delta\>t|<mup>*\<Delta\>x<rsub|p>>*\<sigma\><around*|(|<bw><rsub|p><rsup|n,+>,<bw><rsub|p><rsup|\<ast\>,\<ast\>>|)>\<leq\>1<label|eq:new.cfl3>
    </equation>

    Then <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>>.
  </lemma>

  <\proof>
    We will use the identity which follows
    from<nbsp>(<reference|eq:uj.nph.s.explicit>,<nbsp><reference|eq:uss.defn>)

    <\equation>
      <label|eq:ujph.s.identity><bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>=<frac|<mum>*<bw><rsub|p><rsup|n,->+<bw><rsub|p><rsup|\<ast\>,\<ast\>>+<mup>*<bw><rsub|p><rsup|n,+>|2>-<frac|\<Delta\>t|2*\<Delta\>x<rsub|p>>*<around|(|<value|pf><around|(|<bw><rsub|p><rsup|n,->|)>-<value|pf><around|(|<bw><rsub|p><rsup|n,+>|)>|)>
    </equation>

    to fall back to previous case of Lemma <reference|lemma:m.h.step.1>.

    Define <math|<bw><rsup|h><around|(|x,t|)>:<around|(|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|)>\<times\><around|(|0,\<Delta\>t/2|)>\<rightarrow\><Uad>>
    to be the weak solution of the Cauchy problem with initial data

    <\equation*>
      <bw><rsup|h><around|(|x,0|)>=<choice|<tformat|<table|<row|<cell|<bw><rsub|p><rsup|n,+>,<space|1em>>|<cell|if
      x\<in\><around|(|x<rsub|<value|pmh>>,x<rsub|p-1/4>|)>>>|<row|<cell|<bw><rsub|p><rsup|\<ast\>,\<ast\>>,>|<cell|if
      x\<in\><around|(|x<rsub|p-<frac|1|4>>,x<rsub|p+1/4>|)>>>|<row|<cell|<bw><rsub|p><rsup|n,->,>|<cell|if
      x\<in\><around|(|x<rsub|p+<frac|1|4>>,x<rsub|<value|pph>>|)>>>>>>
    </equation*>

    where

    <\equation*>
      x<rsub|p-<frac|1|4>>=<frac|1|2>*<around|(|x<rsub|<value|pmh>>+x<rsub|p>|)>,<space|2em>x<rsub|p+<frac|1|4>>=<frac|1|2>*<around|(|x<rsub|p>+x<rsub|<value|pph>>|)>
    </equation*>

    Note that we have already accounted for the swapped
    <math|<bw><rsub|p><rsup|n,->> and <math|<bw><rsub|p><rsup|n,+>> while
    defining this initial condition, see Figure<nbsp><reference|fig:non.interacting.rp2>.

    Under the assumed CFL conditions<nbsp><eqref|eq:new.cfl3>, the solution
    <math|<bw><rsup|h>> at time <math|<frac|\<Delta\>t|2>> is made up of
    non-interacting Riemann problems centered at
    <math|x<rsub|p\<pm\><frac|1|4>>>. Take the projection of
    <math|<bw><rsup|h><around|(|x,t/2|)>> on piecewise-constant functions

    <\equation*>
      <wide|<bw>|~><rsub|p><rsup|n+<frac|1|2>,\<ast\>>\<assign\><frac|1|\<Delta\>x<rsub|p>>*<big|int><rsub|x<rsub|<value|pmh>>><rsup|x<rsub|<value|pph>>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x\<in\><Uad>
    </equation*>

    <\big-figure>
      <padded-center|<image|illustrations/non_interacting_rp2|0.9par|||><label|fig:non.interacting.rp2>>
    </big-figure|Two non-interacting Riemann problems>

    As in Lemma<nbsp><reference|lemma:m.h.step.1>, we will show
    <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>\<in\><Uad>> by showing
    <math|<bw><rsub|p><rsup|<nph>,\<ast\>>=<wide|<bw>|~><rsub|p><rsup|<nph>,\<ast\>>>.
    Applying Lemma<nbsp><reference|lemma:avg.riemann.problem> to the two
    non-interacting Riemann problems, we get

    <\equation*>
      <tabular|<tformat|<table|<row|<cell|<wide|<bw>|~><rsub|p><rsup|n+<frac|1|2>,\<ast\>>>|<cell|=>|<cell|<frac|1|\<Delta\>x<rsub|p>>*<around*|(|<big|int><rsub|x<rsub|<value|pmh>>><rsup|x<rsub|p>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x+<big|int><rsub|x<rsub|p>><rsup|x<rsub|<value|pph>>><bw><rsup|h><around*|(|x,<frac|\<Delta\>t|2>|)>*<ud>*x|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<Delta\>x<rsub|p>>*<around*|[|<tabular*|<tformat|<table|<row|<cell|<frac|x<rsub|p>-x<rsub|<value|pmh>>|2>*<bw><rsub|p><rsup|n,+>+<frac|\<Delta\>x<rsub|p>|2>*<bw><rsub|p><rsup|\<ast\>,\<ast\>>+<frac|x<rsub|<value|pph>>-x<rsub|p>|2>*<bw><rsub|p><rsup|n,->>>|<row|<cell|-<frac|\<Delta\>t|2>*<around*|(|<value|pf><around*|(|<bw><rsub|p><rsup|n,->|)>-<value|pf><around*|(|<bw><rsub|p><rsup|n,+>|)>|)>>>>>>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*<around*|(|<mup>*<bw><rsub|p><rsup|n,+>+<bw><rsub|p><rsup|\<ast\>,\<ast\>>+<mum>*<bw><rsub|p><rsup|n,->|)>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|p>>*<around*|(|<value|pf><around*|(|<bw><rsub|p><rsup|n,->|)>-<value|pf><around*|(|<bw><rsub|p><rsup|n,+>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>,<space|1em><text|by<nbsp><eqref|eq:ujph.s.identity>>>>>>>
    </equation*>

    This proves our claim.
  </proof>

  For conservative reconstruction,

  <\equation*>
    <mum>*<bw><rsub|p><rsup|n,->+<mup>*<bw><rsub|p><rsup|n,+>=<bw><rsub|p><rsup|n>
  </equation*>

  and thus by <eqref|eq:wss.simplified>, <math|<bw><rsub|p><rsup|\<ast\>,\<ast\>>=<bw><rsub|p><rsup|n>>.
  The previous lemma can thus be specialized as follows.

  <\lemma>
    <label|lemma:muscl.step3.conservative>Assume that
    <math|<bw><rsub|p><rsup|n>\<in\><Uad>> and
    <math|<bw><rsub|p><rsup|n,\<pm\>>\<in\><Uad>> for all <math|p> with
    conservative reconstruction. Also assume the CFL restrictions

    <\equation>
      max<rsub|p> <frac|\<Delta\>t|<mum>*\<Delta\>x<rsub|p>>*\<sigma\><around*|(|<bw><rsub|p><rsup|n>,<bw><rsub|p><rsup|n,->|)>\<leq\>1,<space|2em>max<rsub|p>
      <frac|\<Delta\>t|<mup>*\<Delta\>x<rsub|p>>*\<sigma\><around*|(|<bw><rsub|p><rsup|n,+>,<bw><rsub|p><rsup|n>|)>\<leq\>1<label|eq:new.cfl3.conservative>
    </equation>

    where <math|\<mu\><rsup|\<pm\>>> are defined in<nbsp><eqref|eq:mu.pm>.
    Then, <math|<bw><rsub|p><rsup|n+<frac|1|2>,\<ast\>>> defined
    in<nbsp><eqref|eq:uj.nph.s> is in <math|<Uad>>.
  </lemma>

  Combining Lemmas<nbsp><reference|lemma:m.h.step.1>,<nbsp><reference|lemma:muscl.step2.general>,<nbsp><reference|lemma:muscl.step3.conservative>,
  we obtain the final criterion for admissibility preservation of
  MUSCL-Hancock with conservative reconstruction in the following
  Theorem<nbsp><reference|thm:final.condn.conservative>.

  <\theorem>
    <label|thm:final.condn.conservative>Let
    <math|<bw><rsub|p><rsup|n>\<in\><Uad>> for all <math|p> and
    <math|<bw><rsub|p><rsup|n,\<pm\>>> be the conservative reconstructions
    defined as

    <\equation*>
      <bw><rsub|p><rsup|n,+>=<bw><rsub|p><rsup|n>+<around|(|x<rsub|<value|pph>>-x<rsub|p>|)>*<slope><rsub|p>,<space|2em><bw><rsub|p><rsup|n,->=<bw><rsub|p><rsup|n>+<around|(|x<rsub|<value|pmh>>-x<rsub|p>|)>*<slope><rsub|p>
    </equation*>

    so that <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> defined
    in<nbsp><eqref|eq:ustar.defn> is also given by

    <\equation>
      <label|eq:us.conservative><bw><rsub|p><rsup|\<ast\>,\<pm\>>=<bw><rsub|p><rsup|n>+2*<around|(|x<rsub|p\<pm\><frac|1|2>>-x<rsub|p>|)>*<slope><rsub|p>
    </equation>

    Assume that the slope <math|<slope><rsub|p>> is chosen such that
    <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<in\><Uad>> and the CFL
    restrictions<nbsp>(<reference|eq:new.cfl1>, <reference|eq:new.cfl2>,
    <reference|eq:new.cfl3.conservative>) hold. Then, the updated solution
    <math|<bw><rsub|p><rsup|n+1>>, defined by MUSCL-Hancock
    scheme<nbsp><eqref|eq:muscl.final.general> is in <math|<Uad>>.
  </theorem>

  <\proof>
    Once we obtain <math|<bw><rsub|p><rsup|n,\<pm\>>\<in\><Uad>>, the claim
    follows from Lemmas<nbsp><reference|lemma:m.h.step.1>-<reference|lemma:muscl.step3.conservative>.
    To prove that <math|<bw><rsub|p><rsup|n,\<pm\>>> is indeed in
    <math|<Uad>>, we make the straight forward observation that

    <\equation*>
      <bw><rsub|p><rsup|n,\<pm\>>=<frac|1|2>*<bw><rsub|p><rsup|\<ast\>,\<pm\>>+<frac|1|2>*<bw><rsub|p><rsup|n>
    </equation*>

    Since <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> and
    <math|<bw><rsub|p><rsup|n>> are in <math|<Uad>>, the proof is completed
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
      <frac|1|2>*min<rsub|p=0,\<ldots\>,N><around*|(|\<xi\><rsub|p>-<big|sum><rsub|k=0><rsup|p-1>w<rsub|k>|)>*w<rsub|p>=<frac|1|2>*\<xi\><rsub|0>*w<rsub|0>
    </equation*>

    where <math|\<xi\><rsub|0>,w<rsub|0>> are the first Gauss-Legendre
    quadrature point<nbsp><eqref|eq:soln.points> and weight in
    <math|<around|[|0,1|]>>. This coefficient is less than half of the
    optimal CFL coefficient that arises from Fourier stability analysis of
    the LWFR scheme with D2 dissipation, see Table<nbsp><reference|tab:cfl>.
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
    <br><rsup|n><rsub|p><around|(|x|)>=<bv><rsup|n><rsub|p>+<around|(|x-x<rsub|p>|)>*<slope><rsub|p>,<space|1em>x\<in\><around|[|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|]>
  </equation*>

  and thus the trace values are

  <\equation*>
    <bv><rsub|p><rsup|n,\<pm\>>=<bv><rsub|p><rsup|n>+<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p>
  </equation*>

  Since the arguments of proof of admissibility depend on constraints on the
  conservative variables, we have to take the inverse map on our
  reconstructions. For example, conservative variables at the face are
  obtained as

  <\equation>
    <label|eq:non.con.face.defn1><bw><rsub|p><rsup|n,\<pm\>>=\<kappa\><rsup|-1><around|(|<bv><rsub|p><rsup|n,\<pm\>>|)>
  </equation>

  Due to the non-linearity of the map <math|\<kappa\>>, unlike the
  conservative case, we have

  <\equation*>
    <mum>*<bw><rsub|p><rsup|n,->+<mup>*<bw><rsub|p><rsup|n,+>\<neq\><bw><rsub|p><rsup|n>
  </equation*>

  which is why several reductions of admissibility constraints will fail. The
  admissibility criteria for non-conservative reconstruction is stated in
  Theorem<nbsp><reference|thm:non.conservative.mh>.

  <\theorem>
    <label|thm:non.conservative.mh>Assume that
    <math|<bw><rsub|p><rsup|n>\<in\><Uad>> for all <math|p>. Consider
    <math|<bw><rsub|p><rsup|n,\<pm\>>> defined in
    <eqref|eq:non.con.face.defn1>, <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>>
    defined in<nbsp><eqref|eq:ustar.defn> and
    <math|<bw><rsub|p><rsup|\<ast\>,\<ast\>>> defined so that

    <\equation*>
      <frac|<mum>|2>*<bw><rsub|p><rsup|n,->+<frac|1|2>*<bw><rsub|p><rsup|\<ast\>,\<ast\>>+<frac|<mup>|2>*<bw><rsub|p><rsup|n,+>=2*<bw><rsub|p><rsup|n>-<around|(|<mum>*<bw><rsub|p><rsup|n,->+<mup>*<bw><rsub|p><rsup|n,+>|)>
    </equation*>

    Assume that the slope <math|<slope><rsub|p>> is chosen so that
    <math|<bw><rsub|p><rsup|n,\<pm\>>,<bw><rsub|p><rsup|\<ast\>,\<pm\>>,<bw><rsub|p><rsup|\<ast\>,\<ast\>>\<in\><Uad>>
    and that the CFL restrictions<nbsp>(<reference|eq:new.cfl1>,
    <reference|eq:new.cfl2>, <reference|eq:new.cfl3>) are satisfied. Then the
    updated solution <math|<bw><rsub|p><rsup|n+1>> of MUSCL-Hancock
    scheme<nbsp><eqref|eq:muscl.final.general> is in <math|<Uad>>.
  </theorem>

  <section|MUSCL-Hancock scheme in 2-D><label|sec:2d.mh>

  Consider the 2-D hyperbolic conservation law<nbsp><eqref|eq:2d.hyp.con.law>
  with fluxes <math|<ff>,<value|pg>>. For simplicity, assume that the
  reconstruction is performed on conservative variables. Thus, the linear
  reconstructions are given by

  <\equation*>
    <br><rsup|n><rsub|\<nocomma\>p\<nocomma\>q>
    <around|(|x,y|)>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+<around|(|x-x<rsub|p>|)>*<slope><rsub|p><rsup|x>+<around|(|y-y<rsub|q>|)>*<slope><rsub|q><rsup|y>
  </equation*>

  and the approximations at the face <math|<unpx>,<unmx>,<unpy>,<unmy>> are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<unpmx><rsub|\<nocomma\>p\<nocomma\>q>>|<cell|=>|<cell|r<rsup|n><rsub|\<nocomma\>p\<nocomma\>q>*<around|(|x<rsub|<value|ppmh>>,y<rsub|q>|)>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p><rsup|x>>>|<row|<cell|<unpmy><rsub|\<nocomma\>p\<nocomma\>q>>|<cell|=>|<cell|r<rsup|n><rsub|\<nocomma\>p\<nocomma\>q>*<around|(|x<rsub|p>,y<rsub|<qpmh>>|)>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+<around|(|y<rsub|<qpmh>>-y<rsub|q>|)>*<slope><rsub|q><rsup|y>>>>>><label|eq:2DMH1>
  </equation>

  and the derivative approximations are given by

  <\equation*>
    \<partial\><rsub|x> <ff><rsub|\<nocomma\>p\<nocomma\>q>\<assign\><frac|1|\<Delta\>x<rsub|p>>*<around*|(|<ff><around*|(|<unpx><rsub|p\<nocomma\>q>|)>-<ff><around*|(|<unmx><rsub|p\<nocomma\>q>|)>|)>,<space|2em>\<partial\><rsub|y>
    <value|fg><rsub|\<nocomma\>p\<nocomma\>q>\<assign\><frac|1|\<Delta\>y<rsub|q>>*<around*|(|<value|fg><around*|(|<unpy><rsub|p\<nocomma\>q>|)>-<value|fg><around*|(|<unmy><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>
  </equation*>

  <\equation*>
    \<partial\><rsub|t>*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>\<assign\>-\<partial\><rsub|x>*<ff><rsub|p\<nocomma\>q>-\<partial\><rsub|y>*<value|fg><rsub|p\<nocomma\>q>
  </equation*>

  The evolutions to time level <math|<nph>> are given by

  <\equation>
    <label|eq:2DMH2><unphpmx><rsub|\<nocomma\>p\<nocomma\>q>=<unpmx><rsub|p\<nocomma\>q\<nocomma\>>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>,<space|2em><unphpmy><rsub|p\<nocomma\>q\<nocomma\>>=<unpmy><rsub|p\<nocomma\>q\<nocomma\>>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>
  </equation>

  and then the final update is performed as

  <\equation>
    <label|eq:2DMH3><bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+1>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around|(|<ff><rsub|<value|pph>,q><rsup|<nph>>-<ff><rsub|<value|pmh>,q><rsup|<nph>>|)>-<frac|\<Delta\>t|\<Delta\>y<rsub|q>>*<around|(|<value|fg><rsub|p,<qph>><rsup|<nph>>-<value|fg><rsub|p,<value|qmh>><rsup|<nph>>|)>
  </equation>

  where the numerical fluxes are computed as

  <\equation*>
    <ff><rsub|<value|pph>,q><rsup|<nph>>=<ff><around|(|<unphpx><rsub|p\<nocomma\>q\<nocomma\>>,<unphmx><rsub|p+1,q>|)>,<space|2em><value|fg><rsub|p,<qph>><rsup|<nph>>=<value|fg><around|(|<unphpy><rsub|\<nocomma\>p\<nocomma\>q>,<unphmy><rsub|p,q+1>|)>
  </equation*>

  <subsection|First evolution step>

  As in 1-D, define <math|<uspmx><rsub|\<nocomma\>p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q\<nocomma\>>>
  so that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<mupx>*<unpx><rsub|p\<nocomma\>q\<nocomma\>>+<uspmx><rsub|p\<nocomma\>q>+<mumx>*<unmx><rsub|\<nocomma\>p\<nocomma\>q>>|<cell|=>|<cell|2*<unpmx><rsub|p\<nocomma\>q\<nocomma\>>>>|<row|<cell|<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>+<uspmy><rsub|p\<nocomma\>q>+<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>>|<cell|=>|<cell|2*<unpmy><rsub|\<nocomma\>p\<nocomma\>q>>>>>><label|eq:ustar.2d>
  </equation>

  where

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<mupx>>|<cell|=>|<cell|<frac|x<rsub|p>-x<rsub|<value|pmh>>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>,<space|2em><mumx>=<frac|x<rsub|<value|pph>>-x<rsub|p>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>>>|<row|<cell|<mupy>>|<cell|=>|<cell|<frac|y<rsub|q>-y<rsub|<value|qmh>>|y<rsub|<qph>>-y<rsub|<value|qmh>>>,<space|2em><mumy>=<frac|y<rsub|<qph>>-y<rsub|q>|y<rsub|<qph>>-y<rsub|<value|qmh>>>>>>>><label|eq:muxy.defn>
  </equation>

  Since we assume conservative reconstruction

  <\equation*>
    <mupx>*<unpx><rsub|\<nocomma\>p\<nocomma\>q>+<mumx>*<unmx><rsub|p\<nocomma\>q\<nocomma\>>=<mupy>*<unpy><rsub|p\<nocomma\>q\<nocomma\>>+<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>
  </equation*>

  Thus, we have

  <\equation*>
    <uspmx><rsub|p\<nocomma\>q>=<bw><rsub|p\<nocomma\>q><rsub|\<nocomma\>>+2*<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p><rsup|x>,<space|2em><uspmy><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|p\<nocomma\>q><rsub|\<nocomma\>>+2*<around|(|y<rsub|<qpmh>>-x<rsub|q>|)>*<slope><rsub|q><rsup|y>
  </equation*>

  We will particularly discuss admissibility of the updates

  <\equation>
    <unphpx><rsub|\<nocomma\>p\<nocomma\>q>=<unpx><rsub|p\<nocomma\>q\<nocomma\>>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|p>>*<around*|(|<ff><around*|(|<unpx><rsub|p\<nocomma\>q\<nocomma\>>|)>-<ff><around*|(|<unmx><rsub|p\<nocomma\>q\<nocomma\>>|)>|)>-<frac|\<Delta\>t/2|\<Delta\>y<rsub|q>>*<around*|(|<value|fg><around*|(|<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<value|fg><around*|(|<unmy><rsub|p\<nocomma\>q\<nocomma\>>|)>|)><label|eq:2Dupdates>
  </equation>

  Admissibility of the other three updates
  <math|<unphmx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpmy><rsub|\<nocomma\>p\<nocomma\>q>>
  will follow similarly. For some <math|k<rsub|x>,k<rsub|y>> chosen such that
  <math|k<rsub|x>+k<rsub|y>=1>, we write <eqref|eq:2Dupdates> as

  <\equation*>
    <unphpx><rsub|\<nocomma\>p\<nocomma\>q>=k<rsub|x>*<thetapx>+k<rsub|y>*<thetapy>
  </equation*>

  where

  <\equation>
    <thetapx>\<assign\><unpx><rsub|p\<nocomma\>q\<nocomma\>>-<frac|\<Delta\>t/2|k<rsub|x>*\<Delta\>x<rsub|p>>*<around*|(|<ff><around*|(|<unpx><rsub|p\<nocomma\>q\<nocomma\>>|)>-<ff><around*|(|<unmx><rsub|p\<nocomma\>q\<nocomma\>>|)>|)><label|eq:update.x.combination>
  </equation>

  and

  <\equation>
    <thetapy>\<assign\><unpx><rsub|\<nocomma\>p\<nocomma\>q>-<frac|\<Delta\>t/2|k<rsub|y>*\<Delta\>y<rsub|q>>*<around*|(|<value|fg><around*|(|<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<value|fg><around*|(|<unmy><rsub|\<nocomma\>p\<nocomma\>q>|)>|)><label|eq:update.x.combination2>
  </equation>

  We will choose the slopes <math|<slope><rsup|x><rsub|p>,<slope><rsup|y><rsub|q>>
  and time step <math|\<Delta\>t> so that
  <math|<thetapx>,<thetapy>\<in\><Uad>>. Then, we can take convex
  combinations of the two terms to obtain admissibility of
  <math|<unphpx><rsub|\<nocomma\>p\<nocomma\>q>>. The choice of
  <math|k<rsub|x>,k<rsub|y>> will not influence the slope restriction, but
  only the time step restriction required to obtain admissibility. In this
  work, we only use the Fourier CFL restriction imposed by the Lax-Wendroff
  scheme<nbsp><eqref|eq:time.step.2d> and observe admissibility preservation
  in all our numerical experiments and thus do not study the choice of
  <math|k<rsub|x>,k<rsub|y>>. However, in a similar
  context,<nbsp><cite|Zhang2010b> proposed the choice of

  <\equation>
    <label|eq:kx.defn>k<rsub|x>=<frac|a<rsub|x>/\<Delta\>x<rsub|p>|a<rsub|x>/\<Delta\>x<rsub|p>+a<rsub|y>/\<Delta\>y<rsub|q>>,<space|2em>k<rsub|y>=<frac|a<rsub|y>/\<Delta\>y<rsub|q>|a<rsub|x>/\<Delta\>x<rsub|p>+a<rsub|y>/\<Delta\>y<rsub|q>>
  </equation>

  where

  <\equation*>
    a<rsub|x>=\<sigma\><rsub|x><around|(|<unmx><rsub|p\<nocomma\>q\<nocomma\>>,<unpx><rsub|p\<nocomma\>q\<nocomma\>>|)>,<space|2em>a<rsub|y>=\<sigma\><rsub|y><around|(|<unmy><rsub|p\<nocomma\>q\<nocomma\>>,<unpy><rsub|p\<nocomma\>q>|)>
  </equation*>

  In<nbsp><cite|Cui2023>, it was shown that the time step restriction imposed
  by the above decomposition is suboptimal and optimal decompositions were
  proposed. After choosing <math|k<rsub|x>,k<rsub|y>>, following the 1-D
  procedures from Section<nbsp><reference|sec:mh.adm>, the slopes
  <math|<slope><rsup|x><rsub|p>,<slope><rsup|y><rsub|q>> will be limited to
  enforce admissibility of <math|<thetapx>,<thetapy>>
  (<reference|eq:update.x.combination>, <reference|eq:update.x.combination2>).
  The admissibility preservation of <math|<thetapx>><nbsp><eqref|eq:update.x.combination>
  follows directly from the arguments used in Lemma
  <reference|lemma:m.h.step.1>, enforcing slope restriction so that
  <math|<unpmx><rsub|\<nocomma\>p\<nocomma\>q>> and
  <math|<uspx><rsub|\<nocomma\>p\<nocomma\>q>> are admissible, and
  appropriate time step restrictions. For admissibility of
  <math|<thetapy>><nbsp><eqref|eq:update.x.combination2>, we define
  <math|<uspxy><rsub|\<nocomma\>p\<nocomma\>q>> so that

  <\equation*>
    <mupy>*<unpy><rsub|p\<nocomma\>q>+<uspxy><rsub|p\<nocomma\>q>+<mumy>*<unmy><rsub|p\<nocomma\>q>=2*<unpx><rsub|p\<nocomma\>q>
  </equation*>

  Thus, the proof of Lemma <reference|lemma:m.h.step.1> shall apply as in 1-D
  under the assumption of admissibility of
  <math|<unpmy><rsub|p\<nocomma\>q>,<uspxy><rsub|p\<nocomma\>q>> and some CFL
  conditions. Thus, we will have admissibility of
  <math|<thetapy>\<in\><Uad>>. We obtain further simplifications because of
  conservative reconstructions

  <\equation*>
    <uspxy><rsub|p\<nocomma\>q>=<uspx><rsub|p\<nocomma\>q >
  </equation*>

  and thus the slope limiting for enforcing admissibility of
  <math|<uspx><rsub|p\<nocomma\>q>> will suffice. We note the precise slope
  and CFL restrictions are in Lemma<nbsp><reference|lemma:m.h.step.1.2d>.

  <\lemma>
    <label|lemma:m.h.step.1.2d>For <math|<mupmx>,<mupmy>> defined
    in<nbsp><eqref|eq:muxy.defn>, <math|<unpmx><rsub|p\<nocomma\>q>,<unpmy><rsub|p\<nocomma\>q>>
    reconstructed in<nbsp><eqref|eq:2DMH1>,
    <math|<uspmx><rsub|p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q>> picked as
    in<nbsp><eqref|eq:ustar.2d>, assume

    <\equation*>
      <unpmx><rsub|p\<nocomma\>q>,<unpmy><rsub|p\<nocomma\>q>,<uspmx><rsub|p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q>\<in\><Uad>
    </equation*>

    and the CFL restrictions

    <\equation>
      <\eqsplit>
        <tformat|<table|<row|<cell|max<rsub|p,q>
        <frac|\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unmx><rsub|p\<nocomma\>q>,<uspmx><rsub|p\<nocomma\>q>|)>\<leq\>1,<space|2em>max<rsub|p,q>
        <frac|\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<uspmx><rsub|p\<nocomma\>q>,<unpx><rsub|\<nocomma\>>|)>\<leq\>1>>|<row|<cell|max<rsub|p,q>
        <frac|\<lambda\><rsub|y<rsub|q>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unmy><rsub|p\<nocomma\>q>,<uspmx><rsub|p\<nocomma\>q>|)>\<leq\>1,<space|2em>max<rsub|p,q>
        <frac|\<lambda\><rsub|y<rsub|q>>|<mupy>>*\<sigma\><rsub|y><around*|(|<uspmx><rsub|p\<nocomma\>q>,<unpy><rsub|\<nocomma\>>|)>\<leq\>1>>|<row|<cell|max<rsub|p,q>
        <frac|\<lambda\><rsub|y<rsub|q>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unmy><rsub|p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q>|)>\<leq\>1,<space|2em>max<rsub|p,q>
        <frac|\<lambda\><rsub|y<rsub|q>>|<mupy>>*\<sigma\><rsub|y><around*|(|<uspmy><rsub|p\<nocomma\>q>,<unpy><rsub|p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|max<rsub|p,q>
        <frac|\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unmx><rsub|p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q>|)>\<leq\>1,<space|2em>max<rsub|p,q>
        <frac|\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<uspmy><rsub|p\<nocomma\>q>,<unpx><rsub|p\<nocomma\>q>|)>\<leq\>1<label|eq:new.cfl1.2d>>>>>
      </eqsplit>
    </equation>

    where <math|\<lambda\><rsub|x<rsub|p>>=<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|p>>,\<lambda\><rsub|y<rsub|q>>=<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|q>>>
    for all <math|p,q> and <math|k<rsub|x>+k<rsub|y>=1>. Then, the updates
    <math|<unphpmx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpmy><rsub|\<nocomma\>p\<nocomma\>q>><nbsp><eqref|eq:2Dupdates>
    of the first step of 2-D MUSCL-Hancock scheme are admissible.
  </lemma>

  <subsection|Finite volume step>

  The final update is given by

  <\equation>
    <label|eq:2d.mh.final.subs><bw><rsub|p\<nocomma\>q><rsup|n+1>=<bw><rsub|p\<nocomma\>q><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around|(|<ff><rsub|<value|pph>,q><rsup|n+<half>>-<ff><rsub|<value|pmh>,q><rsup|n+<half>>|)>-<frac|\<Delta\>t|\<Delta\>y<rsub|q>>*<around|(|<value|fg><rsub|p,<qph>><rsup|n+<half>>-<value|fg><rsub|p,<value|qmh>><rsup|n+<half>>|)>
  </equation>

  where the numerical fluxes are computed as

  <\equation*>
    <ff><rsub|<value|pph>,q><rsup|n+<half>>=<ff><around*|(|<unphpx><rsub|p\<nocomma\>q>,<unphmx><rsub|p+1,q>|)>,<space|2em><value|fg><rsub|p,<qph>><rsup|n+<half>>=<value|fg><around*|(|<unphpy><rsub|p\<nocomma\>q>,<unphmy><rsub|p,q+1>|)>
  </equation*>

  As in the previous step, the expression<nbsp><eqref|eq:2d.mh.final.subs> is
  split into a convex combination

  <\equation*>
    <bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+1>=k<rsub|x>*<value|bzeta><rsub|p\<nocomma\>q><rsup|x>+k<rsub|y>*<value|bzeta><rsub|p\<nocomma\>q><rsup|y>
  </equation*>

  where

  <\equation*>
    <value|bzeta><rsub|\<nocomma\>p\<nocomma\>q><rsup|x>\<assign\><bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|p>>*<around|(|<ff><rsub|<value|pph>,q><rsup|n+<half>>-<ff><rsub|<value|pmh>,q><rsup|n+<half>>|)>,<space|2em><value|bzeta><rsub|\<nocomma\>p\<nocomma\>q><rsup|y>\<assign\><bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|q>>*<around|(|<value|fg><rsub|p,<qph>><rsup|<nph>>-<value|fg><rsub|p,<value|qmh>><rsup|<nph>>|)>
  </equation*>

  for some <math|k<rsub|x>,k<rsub|y>\<ge\>0> with
  <math|k<rsub|x>+k<rsub|y>=1>. The admissibility of
  <math|<value|bzeta><rsub|p\<nocomma\>q><rsup|x>> and
  <math|<value|bzeta><rsub|p\<nocomma\>q><rsup|y>> will imply the
  admissibility of <math|<bw><rsub|\<nocomma\>><rsup|n+1>>. The admissibility
  of <math|<value|bzeta><rsub|\<nocomma\>p\<nocomma\>q><rsup|x>,<value|bzeta><rsub|\<nocomma\>p\<nocomma\>q><rsup|y>>
  will follow exactly as from the procedure in 1-D
  (Lemma<nbsp><reference|lemma:muscl.step2.general>) with appropriate time
  step restrictions and assumption of admissibility of terms
  <math|<unphpmx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpmy><rsub|\<nocomma\>p\<nocomma\>q>,<unphsx><rsub|\<nocomma\>p\<nocomma\>q>,<unphsy><rsub|\<nocomma\>p\<nocomma\>q>>
  for <math|<unphsx><rsub|\<nocomma\>p\<nocomma\>q>,<unphsy><rsub|\<nocomma\>p\<nocomma\>q>>
  defined as

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|<mumx>*<unphmx><rsub|\<nocomma\>p\<nocomma\>q>+<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+<frac|1|2>,\<ast\>x>+<mupx>*<unphpx><rsub|\<nocomma\>p\<nocomma\>q>>|<cell|=>|<cell|2*<value|uu><rsub|p\<nocomma\>q><rsup|n>>>|<row|<cell|<mumy>*<unphmy><rsub|\<nocomma\>p\<nocomma\>q>+<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+<frac|1|2>,\<ast\>y>+<mupy>*<unphpy><rsub|p\<nocomma\>q\<nocomma\>>>|<cell|=>|<cell|2*<value|uu><rsup|n><rsub|p\<nocomma\>q>>>>>><label|eq:unphsxy>
  </equation*>

  The precise CFL restrictions and admissibility constraints are in the
  following Lemma<nbsp><reference|lemma:2d.muscl.step2.general>.

  <\lemma>
    <label|lemma:2d.muscl.step2.general>Assume that the states
    <math|<around*|{|<unphpmx><rsub|p\<nocomma\>q>,<unphpmy><rsub|\<nocomma\>p\<nocomma\>q>,<unphsx><rsub|p\<nocomma\>q\<nocomma\>>,<unphsy><rsub|p\<nocomma\>q\<nocomma\>>|}><rsub|p,q>>
    belong to <math|<Uad>>, where <math|<unphsx><rsub|p\<nocomma\>q\<nocomma\>>,<unphsy><rsub|p\<nocomma\>q\<nocomma\>>>
    are defined as in<nbsp><eqref|eq:unphsxy>. Then, the updated solution
    <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+1>> of MUSCL-Hancock
    scheme is in <math|<Uad>> under the CFL conditions

    <\equation>
      <tabular*|<tformat|<table|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|\<nocomma\>p\<nocomma\>q>,<unphsx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|x<rsub|p>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|\<nocomma\>p\<nocomma\>q>,<unphmx><rsub|p+1,q>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|p-1,q>,<unphmx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|2*\<lambda\><rsub|x<rsub|p>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|\<nocomma\>p\<nocomma\>q>,<unphsx><rsub|p\<nocomma\>q\<nocomma\>>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|\<nocomma\>p\<nocomma\>q>,<unphsx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|x<rsub|p>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|\<nocomma\>p\<nocomma\>q>,<unphmx><rsub|p+1,q>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<unphpx><rsub|p-1,q>,<unphmx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|2*\<lambda\><rsub|x<rsub|p>>*\<sigma\><rsub|x><around*|(|<unphmx><rsub|p\<nocomma\>q\<nocomma\>>,<unphsx><rsub|p\<nocomma\>q\<nocomma\>>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unphsx><rsub|\<nocomma\>p\<nocomma\>q>,<unphpx><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|y<rsub|q>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unphmy><rsub|\<nocomma\>p\<nocomma\>q>,<unphsy><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1,<space|1em>2*\<lambda\><rsub|y<rsub|q>>*\<sigma\><rsub|y><around*|(|<unphsy><rsub|p\<nocomma\>q\<nocomma\>>,<unphpy><rsub|p\<nocomma\>q\<nocomma\>>|)>\<leq\>1>>|<row|<cell|<frac|2*\<lambda\><rsub|y<rsub|q>>|<mupy>>*\<sigma\><rsub|y><around*|(|<unphpy><rsub|\<nocomma\>p\<nocomma\>q>,<unphmy><rsub|p,q+1>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|y<rsub|q>>|<mumy>>*\<sigma\><rsub|y><around*|(|<unphpy><rsub|p,q-1>,<unphmy><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1>>|<row|<cell|2*\<lambda\><rsub|y<rsub|q>>*\<sigma\><rsub|y><around*|(|<unphmy><rsub|\<nocomma\>p\<nocomma\>q>,<unphsy><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1,<space|1em><frac|2*\<lambda\><rsub|y<rsub|q>>|<mupy>>*\<sigma\><rsub|y><around*|(|<unphsy><rsub|\<nocomma\>p\<nocomma\>q>,<unphpy><rsub|p\<nocomma\>q\<nocomma\>>|)>\<leq\>1>>>>><label|eq:2d.new.cfl2>
    </equation>

    where <math|\<lambda\><rsub|x<rsub|p>>=<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|p>>,\<lambda\><rsub|y<rsub|q>>=<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|q>>>
    for all <math|p,q>.
  </lemma>

  As in 1-D, we now show that admissibility of
  <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+<frac|1|2>,\<ast\>x>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+<frac|1|2>,\<ast\>y>>
  can also be reduced to admissibility of
  <math|<uspmx><rsub|\<nocomma\>p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q\<nocomma\>>>,
  similar to Lemma<nbsp><reference|lemma:muscl.step3.conservative>. Expanding
  the definition of <math|<unphsy><rsub|\<nocomma\>p\<nocomma\>q>> gives us

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|r>|<table|<row|<cell|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>>|<cell|=>|<cell|2*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<around|(|<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>+<mupy>*<unpy><rsub|p\<nocomma\>q\<nocomma\>>|)>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around*|(|<ff><around|(|<unmx><rsub|\<nocomma\>p\<nocomma\>q>|)>-<ff><around|(|<unpx><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>>>|<row|<cell|>|<cell|>|<cell|<space|1em>-<frac|\<Delta\>t|\<Delta\>y<rsub|q>>*<around*|(|<value|fg><around|(|<unmy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<value|fg><around|(|<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>>>>>>
  </equation*>

  If we obtain the admissibility of

  <\equation>
    <value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*x>\<assign\>2*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<around|(|<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|p>>*<around*|(|<ff><around*|(|<unmx><rsub|p\<nocomma\>q\<nocomma\>>|)>-<ff><around*|(|<unpx><rsub|p\<nocomma\>q\<nocomma\>>|)>|)><label|eq:adm2.coeff1>
  </equation>

  and

  <\equation>
    <value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*y>\<assign\>2*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<around|(|<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|q>>*<around*|(|<value|fg><around*|(|<unmy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<value|fg><around*|(|<unpy><rsub|p\<nocomma\>q\<nocomma\>>|)>|)><label|eq:adm2.coeff2>
  </equation>

  for some <math|k<rsub|x>,k<rsub|y>\<in\><around|[|0,1|]>> with
  <math|k<rsub|x>+k<rsub|y>=1>, then the admissibility of
  <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>> follows as
  we can write it as a convex combination

  <\equation*>
    <bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>=k<rsub|x>*<value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*x>+k<rsub|y>*<value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*x>
  </equation*>

  and obtain the admissibility of <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>>.
  Thus, we need to limit the slope so that<nbsp>(<reference|eq:adm2.coeff1>,
  <reference|eq:adm2.coeff2>) are admissibile. To that end, define
  <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*x>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*y>>
  to satisfy

  <\align*>
    <tformat|<table|<row|<cell|<mumx>*<unmx><rsub|p\<nocomma\>q\<nocomma\>>+<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*x>+<mupx>*<unpx><rsub|\<nocomma\>p\<nocomma\>q>=>|<cell|2*<around*|(|2*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<around|(|<mumy>*<unmy><rsub|p\<nocomma\>q\<nocomma\>>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>>>|<row|<cell|<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>+<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*y>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>=>|<cell|2*<around*|(|2*<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>-<around|(|<mumy>*<unmy><rsub|p\<nocomma\>q\<nocomma\>>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>>>>>
  </align*>

  respectively. Consequently,

  <\align*>
    <tformat|<table|<row|<cell|<value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*x>>|<cell|=<frac|1|2>*<around|(|<mumx>*<unmx><rsub|\<nocomma\>p\<nocomma\>q>+<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*x>+<mupx>*<unpx><rsub|\<nocomma\>p\<nocomma\>q>|)>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|p>>*<around*|(|<ff><around*|(|<unmx><rsub|\<nocomma\>p\<nocomma\>q>|)>-<ff><around*|(|<unpx><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>>>|<row|<cell|<value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*y>>|<cell|=<frac|1|2>*<around|(|<mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>+<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*y>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|q>>*<around*|(|<value|fg><around*|(|<unmy><rsub|\<nocomma\>p\<nocomma\>q>|)>-<value|fg><around*|(|<unpy><rsub|\<nocomma\>p\<nocomma\>q>|)>|)>>>>>
  </align*>

  Then, assuming the admissibility of <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*x>,<bw><rsub|p\<nocomma\>q\<nocomma\>><rsup|\<ast\>\<ast\>y*y>>
  and proceeding as in the proof of Lemma<nbsp><reference|lemma:muscl.step3.wss>,
  we can ensure that <math|<value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*x>,<value|bet><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>y*y>\<in\><Uad>>
  and thus <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>\<in\><Uad>>.
  Furthermore, since the reconstruction is conservative

  <\equation*>
    <mumy>*<unmy><rsub|\<nocomma\>p\<nocomma\>q>+<mupy>*<unpy><rsub|\<nocomma\>p\<nocomma\>q>=<mumx>*<unmx><rsub|\<nocomma\>p\<nocomma\>q>+<mupx>*<unpx><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>
  </equation*>

  Thus, admissibility of <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*x>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*y>>
  is obtained as

  <\equation*>
    <bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*x>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|\<ast\>\<ast\>y*y>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>
  </equation*>

  The arguments for admissibility of <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>x>>
  are similar. The admissibility criteria of
  <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>x>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>>
  are summarised in the following lemma.

  <\lemma>
    <label|lemma:2d.muscl.step3.conservative>Assume that
    <math|<bw><rsub|p\<nocomma\>q><rsup|n>\<in\><Uad>> and
    <math|<unpmx><rsub|\<nocomma\>p\<nocomma\>q>,<unpmy><rsub|\<nocomma\>p\<nocomma\>q>\<in\><Uad>>
    for all <math|p,q> with conservative reconstruction. Also assume the CFL
    restrictions

    <\equation>
      <tabular|<tformat|<table|<row|<cell|max<rsub|p,q>
      <frac|\<lambda\><rsub|x<rsub|p>>|<mumx>>*\<sigma\><rsub|x><around*|(|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>,<unmx><rsub|p\<nocomma\>q\<nocomma\>>|)>\<leq\>1,<space|2em>max<rsub|p,q>
      <frac|\<lambda\><rsub|x<rsub|p>>|<mupx>>*\<sigma\><rsub|x><around*|(|<unpx><rsub|p\<nocomma\>q\<nocomma\>>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>|)>\<leq\>1>>|<row|<cell|max<rsub|p,q>
      <frac|\<lambda\><rsub|y<rsub|q>>|<mumy>>*\<sigma\><rsub|y><around*|(|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>,<unmy><rsub|\<nocomma\>p\<nocomma\>q>|)>\<leq\>1,<space|2em>max<rsub|p,q>
      <frac|\<lambda\><rsub|y<rsub|q>>|<mupy>>*\<sigma\><rsub|y><around*|(|<unpy><rsub|\<nocomma\>p\<nocomma\>q>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>|)>\<leq\>1>>>>><label|eq:2d.new.cfl3.conservative>
    </equation>

    where <math|\<lambda\><rsub|x<rsub|p>>=<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|p>>,\<lambda\><rsub|y<rsub|q>>=<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|q>>>
    and <math|<mupmx>,<mupmy>> are defined in<nbsp><eqref|eq:muxy.defn>.
    Then, <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>x>,<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|<nph>,\<ast\>y>>
    defined in<nbsp><eqref|eq:unphsxy> are in <math|<Uad>>.
  </lemma>

  Combining Lemmas<nbsp><reference|lemma:m.h.step.1.2d>,<nbsp><reference|lemma:2d.muscl.step2.general>,<nbsp><reference|lemma:2d.muscl.step3.conservative>,
  we will have the 2-D result corresponding to Theorem
  <reference|thm:final.condn.conservative> with the same proof.

  <\theorem>
    <label|thm:final.condn.conservative.2d>Let
    <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>\<in\><Uad>> for all
    <math|p,q> and <math|<unpmx><rsub|p\<nocomma\>q>,<unpmy><rsub|\<nocomma\>p\<nocomma\>q>>
    be the conservative reconstructions defined as

    <\equation*>
      <unpmx><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsup|x><rsub|p>,<space|2em><unpmy><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+<around|(|y<rsub|<qpmh>>-y<rsub|q>|)>*<slope><rsup|y><rsub|q>
    </equation*>

    so that <math|<uspmx><rsub|\<nocomma\>p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q\<nocomma\>>><nbsp><eqref|eq:ustar.2d>
    are given by

    <\equation*>
      <uspmx><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+2*<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsup|x><rsub|p>,<space|2em><uspmy><rsub|\<nocomma\>p\<nocomma\>q>=<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n>+2*<around|(|y<rsub|<qpmh>>-y<rsub|q>|)>*<slope><rsup|y><rsub|q>
    </equation*>

    Assume that the slopes <math|<slope><rsup|x><rsub|p>,<slope><rsup|y><rsub|q>>
    are chosen to satisfy <math|<uspmx><rsub|\<nocomma\>p\<nocomma\>q>,<uspmy><rsub|p\<nocomma\>q\<nocomma\>>\<in\><Uad>>
    for all <math|p,q> and that the CFL restrictions<nbsp>(<reference|eq:new.cfl1.2d>,
    <reference|eq:2d.new.cfl2>, <reference|eq:2d.new.cfl3.conservative>) are
    satisfied. Then the updated solution <math|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|n+1>>
    of MUSCL-Hancock procedure is in <math|<Uad>>.
  </theorem>

  <subsection|Limiting numerical flux in 2-D><label|sec:2d.admissibility>

  Consider the 2-D hyperbolic conservation
  law<nbsp><eqref|eq:2d.hyp.con.law>. Following
  Section<nbsp><reference|sec:lwfr.2d>, the Lax-Wendroff update is

  <\equation*>
    <around|(|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|e>|)><rsup|n+1>=<around|(|<bw><rsub|\<nocomma\>p\<nocomma\>q><rsup|e>|)><rsup|n>-\<Delta\>t*<around*|[|<frac|1|\<Delta\>x<rsub|e>>*<pd|<value|F><rsub|h><rsup|<ee>>|\<xi\>><around|(|\<xi\><rsub|p>,\<xi\><rsub|q>|)>+<frac|1|\<Delta\>y<rsub|e>>*<pd|<value|pG><rsub|h><rsup|<ee>>|\<eta\>><around|(|\<xi\><rsub|p>,\<xi\><rsub|q>|)>|]>,<space|2em>0\<le\>p,q\<le\>N
  </equation*>

  where <math|<value|F><rsup|<ee>><rsub|h>,<value|bG><rsup|<ee>><rsub|h>> are
  continuous time-averaged fluxes<nbsp><eqref|eq:frcontflux> in the
  <math|x,y> directions for the grid element
  <math|<ee>=<around|(|<ex>,<ey>|)>>. \ Since the 2-D scheme is formed by
  taking a tensor product of the 1-D scheme,
  Theorem<nbsp><reference|thm:lwfr.admissibility> applies, i.e., the scheme
  will be admissibility preserving in means
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
  <math|p=0> or <math|q=0> when considering the FR interface fluxes. The
  lower order update is given by

  <\equation*>
    <value|atu><rsub|<bo>><rsup|n+1>=<value|uebz><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>*w<rsub|0>>*<around|(|<value|pf><rsub|<around|(|<half>,0|)>><rsup|<ee>>-<value|atF><rsub|<eexmh>>|)>-<frac|\<Delta\>t|\<Delta\>y<rsub|e>*w<rsub|0>>*<around|(|<value|pg><rsub|<around|(|0,<half>|)>><rsup|<ee>>-<value|atG><rsub|<eeymh>>|)>
  </equation*>

  where <math|<value|atF><rsub|<eexmh>>,<atG><rsub|<eeymh>>> are
  heuristically guessed candidates for the blended numerical
  flux<nbsp><eqref|eq:Fblend>. Pick <math|k<rsub|x>,k<rsub|y>\<gtr\>0> such
  that <math|k<rsub|x>+k<rsub|y>=1> and

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<value|atu><rsub|x><rsup|<text|low>,n+1>>|<cell|=>|<cell|<around|(|<value|uu><rsub|<bo>><rsup|<math-bf|e>>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|e>*w<rsub|0>>*<around|(|<ff><rsup|<math-bf|e>><rsub|<around|(|<half>,0|)>>-<ff><rsub|<around|(|<exmh>,<ey>|)>>|)>>>|<row|<cell|<value|atu><rsub|y><rsup|<text|low>,n+1>>|<cell|=>|<cell|<around|(|<value|uu><rsub|<bo>><rsup|<math-bf|e>>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|e>*w<rsub|0>>*<around|(|<value|fg><rsup|<math-bf|e>><rsub|<around|(|0,<half>|)>>-<value|fg><rsub|<around|(|<ex>,<eymh>|)>>|)>>>>>><label|eq:low.update.2d>
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

  <\eqnarray>
    <tformat|<table|<row|<cell|<value|atu><rsub|x><rsup|n+1>>|<cell|=>|<cell|<value|uebz><rsup|n>-<frac|\<Delta\>t|k<rsub|x>*\<Delta\>x<rsub|e>*w<rsub|0>>*<around|(|<ff><rsub|<around|(|<half>,0|)>><rsup|<math-bf|e>>-<value|F><rsub|<around|(|e<rsub|x>-<half>,e<rsub|y>|)>>|)><label|eq:2d.adm.numflux.desired.x>>>|<row|<cell|<value|atu><rsub|y><rsup|n+1>>|<cell|=>|<cell|<value|uebz><rsup|n>-<frac|\<Delta\>t|k<rsub|y>*\<Delta\>y<rsub|e>*w<rsub|0>>*<around|(|<value|fg><rsup|<math-bf|e>><rsub|<around|(|0,<half>|)>>,-<value|pG><rsub|<around|(|e<rsub|x>,e<rsub|y>-<half>|)>>|)><label|eq:2d.adm.numflux.desired.y>>>>>
  </eqnarray>

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

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            Computation of blended flux <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>
            where <math|<around|(|e<rsub|x>+<half>,e<rsub|y>|)>> are the
            interface indices and <math|q\<in\><around|{|0,\<ldots\>,N|}>> is
            the solution point index on the
            interface<label|alg:blended.flux.2d>

            <with|font-series|bold|Input:>
            <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q><rsup|LW>,<value|pf><rsub|e<rsub|x>+<half>,e<rsub|y>,q>,<value|pf><rsup|<ex>+1,e<rsub|y>><rsub|<half>,q>,<value|pf><rsup|<ee>><rsub|<Nmh>,q>,<value|uu><rsub|<around|(|0,q|)>><rsup|<ex>+1,<ey>>,<value|uu><rsub|<around|(|0,q|)>><rsup|<ee>>,\<alpha\><rsub|<ee>>,\<alpha\><rsub|e<rsub|x>+1,e<rsub|y>>,k<rsup|e<rsub|x>,e<rsub|y>><rsub|x>,k<rsup|e<rsub|x>+1,e<rsub|y>><rsub|x>><next-line><with|font-series|bold|Output:>
            <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <algo-state|<math|<wide|\<alpha\>|\<bar\>>=<large|<frac|\<alpha\><rsub|<ex>,<ey>>+\<alpha\><rsub|<ex>+1,<ey>>|2>>>>

          <\wide-tabular>
            <tformat|<cwith|1|1|2|2|cell-halign|r>|<table|<row|<\cell>
              <algo-state|<math|k<rsub|x><rsup|0>,k<rsub|x><rsup|N>=k<rsub|x><rsup|<ex>,<ey>>,k<rsub|x><rsup|<ex>+1,<ey>>>>
            </cell>|<\cell>
              <math|\<vartriangleright\>><space|0.2spc>For ease of writing
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<cwith|1|1|2|2|cell-halign|r>|<table|<row|<\cell>
              <algo-state|<math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>\<leftarrow\><around|(|1-<wide|\<alpha\>|\<bar\>>|)>*<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q><rsup|LW>+<wide|\<alpha\>|\<bar\>>*<value|pf><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>>
            </cell>|<\cell>
              <math|\<vartriangleright\>><space|0.2spc>Heuristic guess to
              control oscillations
            </cell>>>>
          </wide-tabular>

          \;

          <\wide-tabular>
            <tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<\cell>
              <math|\<vartriangleright\>><space|0.2spc>FV updates with
              guessed <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>
            </cell>>|<row|<\cell>
              <algo-state|<math|<value|atu><rsub|0><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e<rsub|x>+1,e<rsub|y>><rsub|0,q>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|0>*w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<value|pf><rsup|<ex>+1,e<rsub|y>><rsub|<half>,q>-<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>|)>>>

              <no-indent><algo-state|<math|<value|atu><rsub|N><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e<rsub|x>,e<rsub|y>><rsub|N,q>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|N>*w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>-<value|pf><rsup|<ee>><rsub|<around|(|<Nmh>,q|)>>|)>>>
            </cell>>|<row|<\cell>
              \;
            </cell>>>>
          </wide-tabular>

          \;

          <\wide-tabular>
            <tformat|<table|<row|<\cell>
              <algo-state|<math|\<vartriangleright\>><space|0.2spc>FV inner
              updates with <math|<value|pf><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>>
            </cell>>|<row|<\cell>
              <algo-state|<math|<utilow><rsub|0>=<around|(|<bw><rsup|e<rsub|x>+1,e<rsub|y>><rsub|0,q>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|0>*w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<value|pf><rsup|<ex>+1,<ey>><rsub|<half>,q>-<value|pf><rsub|e<rsub|x>+<half>,e<rsub|y>,q>|)>>>
            </cell>>|<row|<\cell>
              <math|<utilow><rsub|N>=<around|(|<bw><rsup|e<rsub|x>,e<rsub|y>><rsub|N,q>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|N>*w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|pf><rsub|e<rsub|x>+<half>,e<rsub|y>,q>-<value|pf><rsup|<ee>><rsub|<Nmh>,q>|)>>
            </cell>>|<row|<\cell>
              \;
            </cell>>>>
          </wide-tabular>

          \;

          <\wide-tabular>
            <tformat|<cwith|2|2|2|2|cell-halign|r>|<table|<row|<\cell>
              <math|\<vartriangleright\><space|0.2spc>>Correct
              <math|<value|F><rsub|<exph>,e<rsub|y>,q>> for <math|K>
              admissibility constraints
            </cell>|<\cell>
              \;
            </cell>>|<row|<\cell>
              <with|font-series|bold|for> <math|k=1:K>
              <with|font-series|bold|do>
            </cell>|<\cell>
              <math|>
            </cell>>>>
          </wide-tabular>

          <algo-state|<space|1em><math|\<epsilon\><rsub|0>,\<epsilon\><rsub|N>\<leftarrow\><frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|0>|)>,<frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|N>|)>>>

          <\algo-state>
            <space|1em><wide-tabular|<tformat|<table|<row|<\cell>
              <math|\<theta\>\<leftarrow\>min
              <around*|(|min<rsub|p=0,N><around*|\||<frac|\<epsilon\><rsub|p>-<value|ad><rsub|k><around|(|<value|atu><rsub|p><rsup|n+1>|)>|<value|ad><rsub|k><around|(|<value|atu><rsub|p><rsup|<text|low>,n+1>|)>-<value|ad><rsub|k><around|(|<value|atu><rsub|p><rsup|n+1>|)>>|\|>,1|)>>
            </cell>>>>>
          </algo-state>

          <algo-state|<space|1em><math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>\<leftarrow\>\<theta\>*<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>+<around|(|1-\<theta\>|)>*<value|pf><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>>

          \;

          <algo-state|<space|1em><math|\<vartriangleright\>><space|0.2spc>FV
          inner updates with new <math|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>>>

          <algo-state|<space|1em><math|<value|atu><rsub|0><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e<rsub|x>+1,e<rsub|y>><rsub|0,q>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|0>*w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<value|pf><rsup|<ex>+1,<ey>><rsub|<half>,q>-<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>|)>>>

          <algo-state|<space|1em><math|<value|atu><rsub|N><rsup|n+1>\<leftarrow\><around|(|<bw><rsup|e<rsub|x>,e<rsub|y>><rsub|N,q>|)><rsup|n>-<frac|\<Delta\>t|k<rsub|x><rsup|N>*w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|e<rsub|x>+<half>,e<rsub|y>,q>-<value|pf><rsup|<ee>><rsub|<around|(|<Nmh>,q|)>>|)>>>

          <no-indent><with|font-series|bold|end>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  <appendix|Formal accuracy of multiderivative RK><label|sec:formal.accuracy>

  We consider the system of time dependent equations

  <\equation*>
    <value|uu><rsub|t>=<value|bL><around*|(|<value|uu>|)>
  </equation*>

  which relates to the hyperbolic conservation law<nbsp><eqref|eq:con.law> by
  formally setting <math|<value|bL>=-<value|pf><around*|(|<value|uu>|)><rsub|x>>.
  Now, we are analyzing the scheme

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<value|uus>>|<cell|=>|<cell|<value|uu><rsup|n>+\<mathLaplace\>t*a<rsub|2\<nocomma\>1>*<value|bL><around*|(|<value|uu><rsup|n>|)>+\<mathLaplace\>t<rsup|2>*<wide|a|^><rsub|21>*<value|bL><rsub|t><around*|(|<value|uu><rsup|n>|)>>>|<row|<cell|<value|uu><rsup|n+1>>|<cell|=>|<cell|<value|uu><rsup|n>+\<mathLaplace\>t*<around*|(|b<rsub|1>*<value|bL><around*|(|<value|uu><rsup|n>|)>+b<rsub|2>*<value|bL><around*|(|<value|uus>|)>|)>+\<mathLaplace\>t<rsup|2>*<around*|(|<wide|b|^><rsub|1>*\<partial\><rsub|t>*<with|font-series|bold|L>+<wide|b|^><rsub|2>*\<partial\><rsub|t>*<with|font-series|bold|L><around*|(|<value|uus>|)>|)>>>>>>
  </equation>

  Further note that, we use the Approximate Lax-Wendroff
  (Section<nbsp><reference|sec:mdrk.alw>) to approximate
  <math|\<partial\><rsub|t>*<value|bL><around*|(|<value|uu><rsup|n>|)>,\<partial\><rsub|t>*<value|bL><around*|(|<value|uus>|)>>
  to <math|O<around*|(|\<mathLaplace\>t<rsup|3>|)>> accuracy and thus we
  perform an error analysis of an evolution performed as

  <\equation*>
    <value|uus>=<value|uu><rsup|n>+\<mathLaplace\>t*a<rsub|2\<nocomma\>1>*<value|bL><around*|(|<value|uu><rsup|n>|)>+\<mathLaplace\>t<rsup|2>*<wide|a|^><rsub|21>*<value|bL><rsub|t><around*|(|<value|uu><rsup|n>|)>+O<around*|(|\<mathLaplace\>t<rsup|5>|)>
  </equation*>

  <\equation>
    <value|uu><rsup|n+1>=<value|uu><rsup|n>+\<mathLaplace\>t*<around*|(|b<rsub|1>*<value|bL><around*|(|<value|uu><rsup|n>|)>+b<rsub|2>*<value|bL><around*|(|<value|uus>|)>|)>+\<mathLaplace\>t<rsup|2>*<around*|(|<wide|b|^><rsub|1>*\<partial\><rsub|t>*<value|bL>+<wide|b|^><rsub|2>*\<partial\><rsub|t>*<value|bL><around*|(|<value|uus>|)>|)>+O<around*|(|\<mathLaplace\>t<rsup|5>|)><label|eq:mdrk.unp.approximate>
  </equation>

  Now, note that

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<value|uu><rsub|t\<nocomma\>t>=<bL><rsub|<value|uu>>*<value|uu><rsub|t>=<bL><rsub|<value|uu>>*<bL>,<space|2em><value|uu><rsub|t\<nocomma\>t\<nocomma\>t>=<bL><rsub|<value|uu>\<nocomma\><value|uu>>*<value|uu><rsub|t><rsup|2>+<bL><rsub|<value|uu>>*<value|uu><rsub|t\<nocomma\>t>=<bL><rsub|<value|uu>\<nocomma\><value|uu>>*<bL><rsup|2>+<bL><rsub|<value|uu>><rsup|2>*<bL>>>|<row|<cell|<value|uu><rsub|t\<nocomma\>t\<nocomma\>t\<nocomma\>t>=<bL><rsub|<value|uu>\<nocomma\><value|uu>\<nocomma\><value|uu>>*<value|uu><rsub|t><rsup|3>+3*<bL><rsub|<value|uu>\<nocomma\><value|uu>>*<value|uu><rsub|t>*<value|uu><rsub|t\<nocomma\>t>+<bL><rsub|<value|uu>>*<value|uu><rsub|t\<nocomma\>t\<nocomma\>t>=<bL><rsub|<value|uu>\<nocomma\><value|uu>\<nocomma\><value|uu>>*<bL><rsup|3>+4*<bL><rsub|<value|uu>\<nocomma\><value|uu>>*<bL><rsub|<value|uu>>*<bL><rsup|2>+<bL><rsub|<value|uu>><rsup|3>*<bL>>>>>><label|eq:mdrk.ut.ders>
  </equation>

  Starting from <math|<value|uu>=<value|uu><rsup|n>>, the exact solution
  satisfies

  <\equation>
    <value|uu><rsup|n+1>=<value|uu>+\<mathLaplace\>t*<value|uu><rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|2>*<value|uu><rsub|t\<nocomma\>t>+<frac|\<mathLaplace\>t<rsup|3>|6>*<value|uu><rsub|t\<nocomma\>t\<nocomma\>t>+<frac|\<mathLaplace\>t<rsup|4>|24>*<value|uu><rsub|t\<nocomma\>t\<nocomma\>t\<nocomma\>t>+O<around*|(|\<mathLaplace\>t<rsup|5>|)><label|eq:mdrk.taylor.u.five>
  </equation>

  We note the following identities

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|\<partial\><rsub|t>*<value|bL><around*|(|<value|uu>|)>=<value|bL><rsub|<value|uu>>*<value|uu><rsub|t>>>|<row|<cell|<value|uus>=<value|uu>+\<mathLaplace\>t*a<rsub|21>*<value|bL>+\<mathLaplace\>t<rsup|2>*<wide|a|^><rsub|21>*<value|bL><rsub|<value|uu>>*<value|bL>+O<around*|(|\<mathLaplace\>t<rsup|5>|)>>>|<row|<cell|<bL><around*|(|<value|uus>|)>=<bL>+<bL><rsub|<value|uu>><around*|(|<value|uus>-<value|uu>|)>+<frac|1|2>*<bL><rsub|<value|uu>\<nocomma\><value|uu>>*<around*|(|<value|uus>-<value|uu>|)><rsup|2>+<frac|1|6>*<bL><rsub|<value|uu>\<nocomma\><value|uu>\<nocomma\><value|uu>>*<around*|(|<value|uus>-<value|uu>|)><rsup|3>+O<around*|(|\<mathLaplace\>t<rsup|4>|)>>>|<row|<cell|<bL><rsub|<value|uu>><around*|(|<value|uus>|)>=<bL><rsub|<value|uu>>+<bL><rsub|<value|uu>\<nocomma\><value|uu>>*<around*|(|<value|uus>-<value|uu>|)>+<frac|1|2>*<bL><rsub|<value|uu>\<nocomma\><value|uu>\<nocomma\><value|uu>>*<around*|(|<value|uus>-<value|uu>|)><rsup|2>+O<around*|(|\<mathLaplace\>t<rsup|3>|)>>>|<row|<cell|\<partial\><rsub|t>*<bL><around*|(|<value|uus>|)>=<bL><rsub|<value|uu>><around*|(|<value|uus>|)>*<bL><around*|(|<value|uus>|)>>>>>>
  </equation*>

  Now we will substitute these four equations
  into<nbsp><eqref|eq:mdrk.unp.approximate> and
  use<nbsp><eqref|eq:mdrk.ut.ders> to obtain the update equation in terms of
  temporal derivatives on <math|<value|uu>>. Then, we compare with the
  Taylor's expansion of <math|<value|uu>><nbsp><eqref|eq:mdrk.taylor.u.five>
  to get conditions for the respective orders of accuracy

  <no-indent>First order:

  <\equation>
    <label|eq:mdrk.c1>b<rsub|1>+b<rsub|2>=1
  </equation>

  <no-indent>Second order:

  <\equation>
    <label|eq:mdrk.c2>b<rsub|2>*a<rsub|21>+<wide|b|^><rsub|1>+<wide|b|^><rsub|2>=<frac|1|2>
  </equation>

  <no-indent>Third order:

  <\eqnarray>
    <tformat|<table|<row|<cell|b<rsub|2>*a<rsub|21><rsup|2>+2*<wide|b|^><rsub|2>*a<rsub|21>>|<cell|=>|<cell|<frac|1|3><eq-number><label|eq:mdrk.c3>>>|<row|<cell|b<rsub|2>*<wide|a|^><rsub|21>+<wide|b|^><rsub|2>*a<rsub|21>>|<cell|=>|<cell|<frac|1|6><eq-number><label|eq:mdrk.c4>>>>>
  </eqnarray>

  <no-indent>Fourth order:

  <\eqnarray>
    <tformat|<table|<row|<cell|b<rsub|2>*a<rsub|21><rsup|3>+3*<wide|b|^><rsub|2>*a<rsub|21><rsup|2>>|<cell|=>|<cell|<frac|1|4><eq-number><label|eq:mdrk.c5>>>|<row|<cell|b<rsub|2>*a<rsub|21>*<wide|a|^><rsub|21>+<wide|b|^><rsub|2>*a<rsub|21><rsup|2>+<wide|b|^><rsub|2>*<wide|a|^><rsub|21>>|<cell|=>|<cell|<frac|1|8><eq-number><label|eq:mdrk.c6>>>|<row|<cell|<wide|b|^><rsub|2>*a<rsub|21><rsup|2>>|<cell|=>|<cell|<frac|1|12><eq-number><label|eq:mdrk.c7>>>|<row|<cell|<wide|b|^><rsub|2>*<wide|a|^><rsub|21>>|<cell|=>|<cell|<frac|1|24><eq-number><label|eq:mdrk.c8>>>>>
  </eqnarray>

  From (<reference|eq:mdrk.c7>), (<reference|eq:mdrk.c8>) we get

  <\equation>
    <wide|a|^><rsub|21>=<frac|1|2>*a<rsub|21><rsup|2>
  </equation>

  We then see that equations<nbsp>(<reference|eq:mdrk.c3>),
  (<reference|eq:mdrk.c4>) become identical, and
  equations<nbsp>(<reference|eq:mdrk.c5>), (<reference|eq:mdrk.c6>) become
  identical. Simplifying the above equations, we get five equations for the
  five unknown coefficient.

  <\eqnarray>
    <tformat|<table|<row|<cell|b<rsub|1>+b<rsub|2>>|<cell|=>|<cell|1<eq-number><label|eq:mdrk.d1>>>|<row|<cell|b<rsub|2>*a<rsub|21>+<wide|b|^><rsub|1>+<wide|b|^><rsub|2>>|<cell|=>|<cell|<frac|1|2><eq-number><label|eq:mdrk.d2>>>|<row|<cell|b<rsub|2>*a<rsub|21><rsup|2>+2*<wide|b|^><rsub|2>*a<rsub|21>>|<cell|=>|<cell|<frac|1|3><eq-number><label|eq:mdrk.d3>>>|<row|<cell|b<rsub|2>*a<rsub|21><rsup|3>+3*<wide|b|^><rsub|2>*a<rsub|21><rsup|2>>|<cell|=>|<cell|<frac|1|4><eq-number><label|eq:mdrk.d4>>>|<row|<cell|<wide|b|^><rsub|2>*a<rsub|21><rsup|2>>|<cell|=>|<cell|<frac|1|12><eq-number><label|eq:mdrk.d5>>>>>
  </eqnarray>

  Using <eqref|eq:mdrk.d5> in <eqref|eq:mdrk.d4> we get

  <\equation*>
    b<rsub|2>*a<rsub|21><rsup|3>=0
  </equation*>

  The solution <math|a<rsub|21>=0> does not satisfy <eqref|eq:mdrk.d3>,
  <eqref|eq:mdrk.d4>, hence let us choose

  <\equation*>
    b<rsub|2>=0
  </equation*>

  Then we get the unique solution for the coefficients

  <\equation*>
    b<rsub|1>=1,<space|1em>b<rsub|2>=0,<space|1em><wide|b|^><rsub|1>=<frac|1|6>,<space|1em><wide|b|^><rsub|2>=<frac|1|3>,<space|1em>a<rsub|21>=<frac|1|2>,<space|1em><wide|a|^><rsub|21>=<frac|1|8>
  </equation*>

  These coefficients do give the scheme<nbsp><eqref|eq:mdrk.f2.defn>.
</body>

<\initial>
  <\collection>
    <associate|algorithm-indentation|0tab>
    <associate|chapter-nr|10>
    <associate|font-base-size|12>
    <associate|indent-indentation|0tab>
    <associate|page-even|1in>
    <associate|page-first|225>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|section-nr|1>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:blended.flux.2d|<tuple|G.1|265>>
    <associate|alg:cache.blocking|<tuple|D.1|242>>
    <associate|alg:scaling|<tuple|F.1|247>>
    <associate|app:efficient.diff|<tuple|D|241>>
    <associate|app:equiv.dg.fr|<tuple|C|235>>
    <associate|app:scaling.limiter|<tuple|F|247>>
    <associate|auto-1|<tuple|A|225>>
    <associate|auto-10|<tuple|B.2|231>>
    <associate|auto-11|<tuple|B.3|231>>
    <associate|auto-12|<tuple|B.4|232>>
    <associate|auto-13|<tuple|C|235>>
    <associate|auto-14|<tuple|C.1|235>>
    <associate|auto-15|<tuple|C.2|236>>
    <associate|auto-16|<tuple|C.2.1|238>>
    <associate|auto-17|<tuple|D|241>>
    <associate|auto-18|<tuple|D.1|243>>
    <associate|auto-19|<tuple|E|245>>
    <associate|auto-2|<tuple|A.1|225>>
    <associate|auto-20|<tuple|F|247>>
    <associate|auto-21|<tuple|G|249>>
    <associate|auto-22|<tuple|G.1|249>>
    <associate|auto-23|<tuple|G.2|249>>
    <associate|auto-24|<tuple|G.1|250>>
    <associate|auto-25|<tuple|G.3|250>>
    <associate|auto-26|<tuple|G.4|251>>
    <associate|auto-27|<tuple|G.2|253>>
    <associate|auto-28|<tuple|G.3|253>>
    <associate|auto-29|<tuple|G.4|256>>
    <associate|auto-3|<tuple|A.2|225>>
    <associate|auto-30|<tuple|G.5|257>>
    <associate|auto-31|<tuple|G.6|258>>
    <associate|auto-32|<tuple|G.6.1|259>>
    <associate|auto-33|<tuple|G.6.2|260>>
    <associate|auto-34|<tuple|G.6.3|263>>
    <associate|auto-35|<tuple|H|267>>
    <associate|auto-4|<tuple|A.3|228>>
    <associate|auto-5|<tuple|A.4|229>>
    <associate|auto-6|<tuple|A.1|230>>
    <associate|auto-7|<tuple|A.5|230>>
    <associate|auto-8|<tuple|B|231>>
    <associate|auto-9|<tuple|B.1|231>>
    <associate|eq:2DMH1|<tuple|G.22|258>>
    <associate|eq:2DMH2|<tuple|G.23|258>>
    <associate|eq:2DMH3|<tuple|G.24|258>>
    <associate|eq:2Dupdates|<tuple|G.27|259>>
    <associate|eq:2d.adm.numflux.desired.x|<tuple|G.38|264>>
    <associate|eq:2d.adm.numflux.desired.y|<tuple|G.38|264>>
    <associate|eq:2d.hyp.con.law|<tuple|G.1|249>>
    <associate|eq:2d.low.update.admissibility.condn|<tuple|G.38|264>>
    <associate|eq:2d.mh.final.subs|<tuple|G.32|260>>
    <associate|eq:2d.new.cfl2|<tuple|G.33|261>>
    <associate|eq:2d.new.cfl3.conservative|<tuple|G.36|263>>
    <associate|eq:2d.xy.implies.admissibility|<tuple|G.39|264>>
    <associate|eq:Uh.defn|<tuple|A.11|228>>
    <associate|eq:ader.corr.flux|<tuple|A.8|228>>
    <associate|eq:ader.corr1|<tuple|A.4|226>>
    <associate|eq:ader.evolution|<tuple|A.6|227>>
    <associate|eq:ader.fr.flux|<tuple|A.7|227>>
    <associate|eq:adm2.coeff1|<tuple|G.34|262>>
    <associate|eq:adm2.coeff2|<tuple|G.35|262>>
    <associate|eq:all.fvm.updates|<tuple|G.12|254>>
    <associate|eq:cache.blocking|<tuple|D.1|243>>
    <associate|eq:con.law.dt|<tuple|G.8|251>>
    <associate|eq:corr.expressions|<tuple|C.8|238>>
    <associate|eq:dg.collocated|<tuple|C.5|237>>
    <associate|eq:dg.is.fr.corr|<tuple|C.6|237>>
    <associate|eq:dg.rusanov|<tuple|C.2|235>>
    <associate|eq:dg.scheme|<tuple|C.1|235>>
    <associate|eq:dg.weak|<tuple|C.4|236>>
    <associate|eq:evolution.general|<tuple|G.5|250>>
    <associate|eq:final.claim|<tuple|A.15|229>>
    <associate|eq:first.time.average.flux|<tuple|A.10|228>>
    <associate|eq:g2.simplifier|<tuple|C.17|239>>
    <associate|eq:ghu|<tuple|C.18|239>>
    <associate|eq:gl.lagrange|<tuple|C.9|238>>
    <associate|eq:kx.defn|<tuple|G.30|259>>
    <associate|eq:leg.id1|<tuple|C.12|238>>
    <associate|eq:leg.id2|<tuple|C.13|238>>
    <associate|eq:low.update.2d|<tuple|G.37|264>>
    <associate|eq:lw.corr.flux|<tuple|A.13|228>>
    <associate|eq:lwfr.evolution|<tuple|A.9|228>>
    <associate|eq:mdrk.c1|<tuple|H.5|267>>
    <associate|eq:mdrk.c2|<tuple|H.6|268>>
    <associate|eq:mdrk.c3|<tuple|H.7|268>>
    <associate|eq:mdrk.c4|<tuple|H.8|268>>
    <associate|eq:mdrk.c5|<tuple|H.9|268>>
    <associate|eq:mdrk.c6|<tuple|H.10|268>>
    <associate|eq:mdrk.c7|<tuple|H.11|268>>
    <associate|eq:mdrk.c8|<tuple|H.12|268>>
    <associate|eq:mdrk.d1|<tuple|H.14|268>>
    <associate|eq:mdrk.d2|<tuple|H.15|268>>
    <associate|eq:mdrk.d3|<tuple|H.16|268>>
    <associate|eq:mdrk.d4|<tuple|H.17|268>>
    <associate|eq:mdrk.d5|<tuple|H.18|268>>
    <associate|eq:mdrk.taylor.u.five|<tuple|H.4|267>>
    <associate|eq:mdrk.unp.approximate|<tuple|H.2|267>>
    <associate|eq:mdrk.ut.ders|<tuple|H.3|267>>
    <associate|eq:mu.pm|<tuple|G.7|251>>
    <associate|eq:muscl.final.general|<tuple|G.6|250>>
    <associate|eq:muxy.defn|<tuple|G.26|259>>
    <associate|eq:new.cfl1|<tuple|G.10|252>>
    <associate|eq:new.cfl1.2d|<tuple|G.31|260>>
    <associate|eq:new.cfl2|<tuple|G.13|254>>
    <associate|eq:new.cfl3|<tuple|G.17|255>>
    <associate|eq:new.cfl3.conservative|<tuple|G.19|256>>
    <associate|eq:non.cell.centred.defn|<tuple|G.3|249>>
    <associate|eq:non.con.face.defn1|<tuple|G.21|257>>
    <associate|eq:numflux.admissibility.cfl|<tuple|G.2|249>>
    <associate|eq:numflux.d1|<tuple|A.14|228>>
    <associate|eq:numflux.d2|<tuple|A.12|228>>
    <associate|eq:numflux.defn|<tuple|A.5|226>>
    <associate|eq:predictor.defn|<tuple|A.2|226>>
    <associate|eq:predictor.eqn|<tuple|A.3|226>>
    <associate|eq:predictor.linear.solution|<tuple|A.16|229>>
    <associate|eq:pstar|<tuple|B.1|232>>
    <associate|eq:radau.corrector|<tuple|C.11|238>>
    <associate|eq:radau.poly|<tuple|C.12|238>>
    <associate|eq:radau.simplifier.1|<tuple|C.15|238>>
    <associate|eq:radau.simplifier.2|<tuple|C.16|238>>
    <associate|eq:reconstruction.general|<tuple|G.4|250>>
    <associate|eq:scalar.con.law|<tuple|A.1|225>>
    <associate|eq:scaling.conv.theta|<tuple|F.1|247>>
    <associate|eq:scaling.general.theta|<tuple|F.2|247>>
    <associate|eq:uj.nph.s|<tuple|G.11|253>>
    <associate|eq:uj.nph.s.explicit|<tuple|G.14|254>>
    <associate|eq:ujph.s.identity|<tuple|G.18|255>>
    <associate|eq:unphsxy|<tuple|G.32|261>>
    <associate|eq:update.x.combination|<tuple|G.28|259>>
    <associate|eq:update.x.combination2|<tuple|G.29|259>>
    <associate|eq:us.conservative|<tuple|G.20|257>>
    <associate|eq:uss.defn|<tuple|G.15|255>>
    <associate|eq:ustar.2d|<tuple|G.25|259>>
    <associate|eq:ustar.defn|<tuple|G.9|252>>
    <associate|eq:wave.speed.dg|<tuple|C.2|236>>
    <associate|eq:wj.expression|<tuple|C.10|238>>
    <associate|eq:wss.simplified|<tuple|G.16|255>>
    <associate|fig:error|<tuple|A.1|230>>
    <associate|fig:fv.evolution|<tuple|G.3|253>>
    <associate|fig:general.grid|<tuple|G.1|250>>
    <associate|fig:non.interacting.rp1|<tuple|G.2|253>>
    <associate|fig:non.interacting.rp2|<tuple|G.4|256>>
    <associate|footnote-C.1|<tuple|C.1|237>>
    <associate|footnote-D.1|<tuple|D.1|242>>
    <associate|footnr-C.1|<tuple|C.1|237>>
    <associate|footnr-D.1|<tuple|D.1|242>>
    <associate|lemma:2d.muscl.step2.general|<tuple|G.10|261>>
    <associate|lemma:2d.muscl.step3.conservative|<tuple|G.11|263>>
    <associate|lemma:avg.riemann.problem|<tuple|G.1|251>>
    <associate|lemma:m.h.step.1|<tuple|G.2|252>>
    <associate|lemma:m.h.step.1.2d|<tuple|G.9|260>>
    <associate|lemma:muscl.step2.general|<tuple|G.3|254>>
    <associate|lemma:muscl.step3.conservative|<tuple|G.5|256>>
    <associate|lemma:muscl.step3.wss|<tuple|G.4|255>>
    <associate|rmk:mh.restriction.for.fr|<tuple|G.7|257>>
    <associate|rmk:non.linear|<tuple|A.2|229>>
    <associate|sec:2d.admissibility|<tuple|G.6.3|263>>
    <associate|sec:2d.mh|<tuple|G.6|258>>
    <associate|sec:ader.dg|<tuple|A.2|225>>
    <associate|sec:con|<tuple|A.5|230>>
    <associate|sec:formal.accuracy|<tuple|H|267>>
    <associate|sec:fr.corr.identities|<tuple|C.2.1|238>>
    <associate|sec:frdfr|<tuple|E|245>>
    <associate|sec:linear.equivalence|<tuple|A.3|228>>
    <associate|sec:lwfr.numfluxes|<tuple|B|231>>
    <associate|sec:mh.adm|<tuple|G.4|251>>
    <associate|sec:muscl.admissibility.proof|<tuple|G|249>>
    <associate|sec:num|<tuple|A.4|229>>
    <associate|thm:final.condn.conservative|<tuple|G.6|256>>
    <associate|thm:final.condn.conservative.2d|<tuple|G.12|263>>
    <associate|thm:non.conservative.mh|<tuple|G.8|258>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Toro2001

      Dumbser2008

      Dumbser2008

      Dumbser2008

      Qiu2005b

      babbar2022

      Dumbser2008

      Dumbser2008

      Huynh2007

      Huynh2007

      Zorio2017

      Burger2017

      Qiu2005b

      Dumbser2009

      Jackson2017

      Huynh2007

      arpit_babbar_2024_10816439

      Dumbser2008

      Gassner2011a

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

      Huynh2007

      Mengaldo2015

      Rusanov1962

      Ranocha2022

      Ranocha2022

      Huynh2007

      kopriva2010

      kopriva2010

      Huynh2007

      Mengaldo2015

      Huynh2007

      Huynh2007

      Mengaldo2015

      Huynh2007

      hildebrand1973

      Huynh2007

      Huynh2007

      akkurt2022

      Ranocha2022

      witherden2014

      akkurt2022

      Bezanson2017

      Vincent2022

      Romero2016

      Zhang2010b

      zhang2010c

      Meena_Kumar_Chandrashekar_2017

      zhang2010c

      Meena_Kumar_Chandrashekar_2017

      Berthon2006

      Zhang2010b

      Cui2023
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|A.1>|>
        Error growth of LW-D1, LW-D2 and ADER schemes.
      </surround>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|D.1>|>
        Cache blocking flux differentiation.
      </surround>|<pageref|auto-18>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.1>||Non-uniform,
      non-cell-centered finite volume grid>|<pageref|auto-24>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.2>||Two
      non-interacting Riemann problems>|<pageref|auto-27>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.3>||Finite volume
      evolution>|<pageref|auto-28>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.4>||Two
      non-interacting Riemann problems>|<pageref|auto-29>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      A.<space|2spc>ADER-FR and LWFR for linear problems>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      A.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      A.2.<space|2spc>ADER Discontinuous Galerkin and Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      A.3.<space|2spc>Equivalence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      A.4.<space|2spc>Numerical validation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      A.5.<space|2spc>Conclusions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      B.<space|2spc>Some numerical fluxes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-8><vspace|0.5fn>

      B.1.<space|2spc>Rusanov flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      B.2.<space|2spc>Roe flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      B.3.<space|2spc>HLL flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      B.4.<space|2spc>HLLC flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      C.<space|2spc>Equivalence of DG and FR>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-13><vspace|0.5fn>

      C.1.<space|2spc>Discontinuous Galerkin on curvilinear grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      C.2.<space|2spc>Equivalence with Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      <with|par-left|<quote|1tab>|C.2.1.<space|2spc>Corrector function
      identitites <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      D.<space|2spc>Efficient local differential operators>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      E.<space|2spc>Equivalence with DFR>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-19><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      F.<space|2spc>Scaling limiter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-20><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      G.<space|2spc>Admissibility of MUSCL-Hancock on general grids>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-21><vspace|0.5fn>

      G.1.<space|2spc>Introduction and notations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      G.2.<space|2spc>Review of MUSCL-Hancock scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      G.3.<space|2spc>Primary generalization for proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      G.4.<space|2spc>Proving admissibility
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      G.5.<space|2spc>Non-conservation reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      G.6.<space|2spc>MUSCL-Hancock scheme in 2-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      <with|par-left|<quote|1tab>|G.6.1.<space|2spc>First evolution step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1tab>|G.6.2.<space|2spc>Finite volume step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|1tab>|G.6.3.<space|2spc>Limiting numerical flux
      in 2-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      H.<space|2spc>Formal accuracy of multiderivative RK>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-35><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>