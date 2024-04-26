<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|preview-ref|style_common>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <chapter|Multi-derivative Runge-Kutta><label|ch:mdrk>

  <section|Introduction>

  Lax-Wendroff schemes discussed in earlier chapters perform a Taylor's
  expansion in time to the order of the desired accuracy and compute the
  temporal derivatives locally. Multiderivative Runge-Kutta (MDRK) schemes
  also make use of temporal derivatives but they combine them with multiple
  stages to obtain the desired order of accuracy. As MDRK schemes use both
  temporal derivatives and multiple stages, they are a generalization of LW
  and standard multistage RK methods<nbsp><cite|Seal2013>. MDRK methods
  typically require fewer temporal derivatives in contrast to the
  Lax-Wendroff schemes and fewer stages in contrast to the standard RK
  methods, which is what makes them promising. In this chapter, we propose a
  multiderivative Runge-Kutta scheme in a Flux Reconstruction framework to
  solve hyperbolic conservation laws<nbsp><eqref|eq:con.law>. The idea is to
  cast the fourth order multi-derivative Runge-Kutta scheme
  of<nbsp><cite|li2016> in the form of

  <\eqnarray*>
    <tformat|<table|<row|<cell|<value|uus>>|<cell|=>|<cell|<value|uu><rsup|n>-\<mathLaplace\>t*\<partial\><rsub|x>*<value|F1><label|eq:mdrk.intro.us.evolution><eq-number>>>|<row|<cell|<value|uu><rsup|n+1>>|<cell|=>|<cell|<value|uu><rsup|n>-\<mathLaplace\>t*\<partial\><rsub|x>*<value|F2>>>>>
  </eqnarray*>

  where

  <\equation*>
    \<partial\><rsub|x>*<value|F1>=\<partial\><rsub|x>*<value|F1><around*|(|<value|uu><rsup|n>|)>\<approx\>\<partial\><rsub|x>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1/2>><value|pf>*<ud>t,<space|2em>\<partial\><rsub|x>*<value|F2>=\<partial\><rsub|x>*<value|F2><around*|(|<value|uu><rsup|n>,<value|uus>|)>\<approx\>\<partial\><rsub|x>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><value|pf>*<ud>t
  </equation*>

  The method is two-stage; in the first stage, <math|<value|F1>> is locally
  approximated and then Flux Reconstruction (FR)<nbsp><eqref|eq:frcontflux>
  is used to construct a globally continuous approximation of
  <math|<value|F1>> which is used to perform evolution to
  <math|<value|uus><nbsp><eqref|eq:mdrk.intro.us.evolution>>; and the same
  procedure is then performed using <math|<value|F2>> for evolution to
  <math|<value|uu><rsup|n+1>>. The developments
  of<nbsp>Chapters<nbsp><reference|ch:lwfr>,<nbsp><reference|ch:lw.subcell.limiter>
  are applied to each stage of MDRK. In particular, the numerical flux has
  been constructed with D2 dissipation<nbsp><eqref|eq:nfdiss2> and <evaluate>
  scheme (Section<nbsp><reference|sec:ea.scheme>) to enhance accuracy and
  stability. Admissibility preserving blending limiter performing
  MUSCL-Hancock on subcells is also developed showing good accuracy like in
  Chapter<nbsp><reference|ch:lw.subcell.limiter>. The scheme is validated
  with a modern test suite for high order methods<nbsp><cite|Pan2016>.

  The MDRK scheme in FR framework is introduced in
  Section<nbsp><reference|sec:mdrk>. In particular,
  Section<nbsp><reference|sec:mdrk.alw> discusses approximate Lax-Wendroff
  procedure applied to MDRK, Sections<nbsp><reference|sec:mdrk.numflux>
  discuss the D2 dissipation for computing the dissipative part of the
  numerical flux to enhance Fourier CFL stability limit and
  Section<nbsp><reference|sec:mdrk.ea> discusses the <evaluate> scheme for
  computing the central part of numerical flux to enhance stability. The
  Fourier stability analysis is performed in
  Section<nbsp><reference|sec:mdrk.fourier> to demonstrate the improved
  stability of D2 dissipation. In Section<nbsp><reference|sec:mdrk.blending>,
  we show how the admissibility preserving blending limiter of
  Chapter<nbsp><reference|ch:lw.subcell.limiter> applies to the MDRK scheme.
  The numerical results validating the order of accuracy and capability of
  the blending scheme are shown in Section<nbsp><reference|sec:mdrk.num> and
  a summary of the new MDRK scheme is presented in
  Section<nbsp><reference|sec:mdrk.conclusion>.

  <section|Multi-derivative Runge-Kutta FR scheme><label|sec:mdrk>

  Multiderivative Runge-Kutta (MDRK)<nbsp><cite|obrechkoff1940neue> methods
  were initially developed to solve systems of ODE like

  <\equation>
    <label|eq:ode.L><dv|<value|uu>|t>=<value|bL><around*|(|<value|uu>|)>
  </equation>

  that use temporal derivatives of <math|<value|bL>>. They were first used
  for temporal discretization of hyperbolic conservation laws
  in<nbsp><cite|Seal2013> by using Weighted Essentially Non-Oscillatary
  (WENO)<nbsp><cite|Shu1989> and Discontinuous Galerkin
  (DG)<nbsp><cite|cockburn2000> methods for spatial discretization.\ 

  In this work, we use the two stage fourth order multiderivative Runge-Kutta
  method from<nbsp><cite|li2016>. For the system of
  ODE<nbsp><eqref|eq:ode.L>, the MDRK scheme of<nbsp><cite|li2016> to evolve
  from <math|t<rsup|n>> to <math|t<rsup|n+1>> is given by

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|r>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<value|uu><rsup|\<ast\>>>|<cell|=>|<cell|<value|uu><rsup|n>+<frac|1|2>*\<mathLaplace\>t*<value|bL><around*|(|<value|uu><rsup|n>|)>+<frac|1|8>*<dv|<value|bL>|t><around*|(|<value|uu><rsup|n>|)>>>|<row|<cell|<value|uu><rsup|n+1>>|<cell|=>|<cell|<value|uu><rsup|n>+\<mathLaplace\>t*<value|bL><around*|(|<value|uu><rsup|n>|)>+<frac|1|6>*\<mathLaplace\>t<rsup|2>*<around*|(|<dv|<value|bL>|t><around*|(|<value|uu><rsup|n>|)>+2*<dv|<value|bL>|t><around*|(|<value|uus>|)>|)>>>>>>
  </equation*>

  In order to solve the 1-D conservation law<nbsp><eqref|eq:con.law> using
  the above scheme, we formally set <math|<value|bL>=-<value|pf><around*|(|<value|uu>|)><rsub|x>>
  to get the following two stage procedure

  <\eqnarray>
    <tformat|<table|<row|<cell|<value|uus>>|<cell|=>|<cell|<value|uu><rsup|n>-<frac|\<mathLaplace\>t|2>*\<partial\><rsub|x>*<value|F1><label|eq:mdrk.mdrk.first.stage><eq-number>>>|<row|<cell|<value|uu><rsup|n+1>>|<cell|=>|<cell|<value|uu><rsup|n>-\<mathLaplace\>t*\<partial\><rsub|x>*<value|F2><label|eq:mdrk.mdrk.second.stage><eq-number>>>>>
  </eqnarray>

  where

  <\equation>
    <tabular*|<tformat|<cwith|2|2|2|2|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<value|F1>>|<cell|\<assign\>>|<cell|<value|pf><around*|(|<bu><rsup|n>|)>+<frac|1|4>*\<mathLaplace\>t*<pdv||t>*<value|pf><around*|(|<bu><rsup|n>|)>>>|<row|<cell|<value|F2>>|<cell|\<assign\>>|<cell|<value|pf><around*|(|<value|uu><rsup|n>|)>+<frac|1|6>*\<mathLaplace\>t*<around*|(|<pdv||t>*<value|pf><around*|(|<value|uu><rsup|n>|)>+2*<pdv||t>*<value|pf><around*|(|<value|uus>|)>|)>>>>>><label|eq:mdrk.f2.defn>
  </equation>

  The formal order of accuracy of the scheme
  (Appendix<nbsp><reference|sec:formal.accuracy>) is obtained from

  <\equation*>
    \<partial\><rsub|x>*<value|F2>=\<partial\><rsub|x><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><value|pf>+O<around*|(|\<mathLaplace\>t<rsup|4>|)>
  </equation*>

  The idea is to use<nbsp><eqref|eq:mdrk.f2.defn> to obtain solution update
  at the nodes is written as a collocation scheme

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<value|uep><rsup|n+1>>|<cell|=>|<cell|<value|uep><rsup|n>-<frac|\<Delta\>t|2*\<Delta\>x<rsub|e>>*<od|<value|F1><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>|)>>>|<row|<cell|<value|uep><rsup|n+1>>|<cell|=>|<cell|<value|uep><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<od|<value|F><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>|)>>>>>>,<space|2em>0\<le\>p\<le\>N<label|eq:mdrk.uplwfr>
  </equation>

  where we take <math|N=3> to get fourth order accuracy. As was the case for
  Chapter<nbsp><reference|ch:lwfr>, the major work is in the construction of
  the time average flux approximations <math|<value|F1><rsub|h>,<value|F><rsub|h>>
  which is explained in subsequent sections.

  <subsection|Conservation property>

  The computation of correct weak solutions for non-linear conservation laws
  in the presence of discontinuous solutions requires the use of conservative
  numerical schemes. In order to see conservation property
  of<nbsp><eqref|eq:mdrk.uplwfr>, multiply each equation by the quadrature
  weights associated with the solution points and sum over all the points in
  the <math|e<rsup|th>> element,

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<value|uep><rsup|\<ast\>>>|<cell|=>|<cell|<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<value|uep><rsup|n>-<frac|\<Delta\>t|2*\<Delta\>x<rsub|e>>*<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<pd|<value|F1><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>|)>>>|<row|<cell|<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<value|uep><rsup|n+1>>|<cell|=>|<cell|<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<value|uep><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<pd|<value|F2><rsub|h>|\<xi\>><around*|(|\<xi\><rsub|p>|)>>>>>>
  </equation>

  The correction functions are of degree <math|N+1> and thus the fluxes
  <math|<value|F1><rsub|h>,<value|F2><rsub|h>> are polynomials of degree
  <math|\<le\>N+1>. If the quadrature is exact for polynomials of degree
  atleast <math|N>, which is true for both GLL and GL points, then the
  quadrature is exact for the flux derivative term and we can write it as an
  integral, which leads to

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Omega\><rsub|e>><value|uus><rsub|h>*<ud>x>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|e>><value|uu><rsub|h><rsup|n>*<ud>x-<frac|\<Delta\>t|2>*<around|[|<value|F1><rsub|<eph>>-<value|F1><rsub|<emh>>|]><rsub|>>>|<row|<cell|<big|int><rsub|\<Omega\><rsub|e>><value|uu><rsup|n+1><rsub|h>*<ud>x>|<cell|=>|<cell|<big|int><rsub|\<Omega\><rsub|e>><value|uu><rsub|h><rsup|n>*<ud>x-\<Delta\>t*<around|[|<value|F2><rsub|<eph>>-<value|F2><rsub|<emh>>|]>>>>>><label|eq:mdrk.upmean>
  </equation>

  This shows that the total mass inside the cell changes only due to the
  boundary fluxes and the scheme is hence conservative. The conservation
  property is crucial in the proof of admissibility preservation studied
  in<nbsp>Section<nbsp><reference|sec:admissibility.preservation>.

  <subsection|Reconstruction of the time average
  flux><label|sec:mdrk.reconstruction>

  To complete the description of the MDRK method<nbsp><eqref|eq:mdrk.uplwfr>,
  we must explain the method for the computation of the time average fluxes
  <math|<value|F1><rsub|h>,<F2><rsub|h>> when evolving from <math|t<rsup|n>>
  to <math|t<rsup|n+1>>. In the first stage<nbsp><eqref|eq:mdrk.mdrk.first.stage>,
  we compute <math|<value|F1><rsub|h>> which is then used to evolve to
  <math|<value|uus>>. In the second stage<nbsp><eqref|eq:mdrk.mdrk.second.stage>,
  <math|<value|uu><rsup|n>,<value|uus>> are used to compute
  <math|<value|F><rsub|h>> which is used from evolution to
  <math|<value|uu><rsup|n+1>>. The procedure for both
  <math|<value|F1><rsub|h>,<value|F><rsub|h>> is the same, and is infact the
  same as the Steps 1-4 in Section<nbsp><reference|sec:reconstruction>. The
  explanation is not described but for readability, we briefly mention that
  the steps are the following.

  <\enumerate>
    <item>Approximate Lax-Wendroff procedure<nbsp>(Section<nbsp><reference|sec:alw>)
    to approximate time average fluxes <math|<value|F1><rsub|h>,<value|F><rsub|h>>
    at all solution points.

    <item>Use Lagrange interpolation to construct discontinuous time average
    flux approximations<nbsp><math|<value|F1><rsub|h><rsup|\<delta\>>,<value|F><rsub|h><rsup|\<delta\>>><nbsp><eqref|eq:lwfr.time.average.cts>.

    <item>Use FR correction functions <math|g<rsub|L>,g<rsub|R>><nbsp><eqref|eq:fvm.fr.corr.functions>
    to construct to continuous time average
    fluxes<nbsp><math|<value|F1><rsub|h>,<value|F><rsub|h>><nbsp><eqref|eq:frcontflux>.

    <item>Plug continuous fluxes <math|<value|F1><rsub|h>,<value|F><rsub|h>>
    into<nbsp><eqref|eq:mdrk.uplwfr> to get an LWFR scheme using matrix
    vector operations<nbsp><eqref|eq:mdrk.fder>.
  </enumerate>

  <subsection|Approximate Lax-Wendroff procedure><label|sec:mdrk.alw>

  The time average fluxes <math|<value|F1><rsub|p>,<value|F2><rsub|p>> must
  be computed using<nbsp><eqref|eq:mdrk.f2.defn>, which involves temporal
  derivatives of the flux. The approximate Lax-Wendroff is used due to its
  advantages discussed in Section<nbsp><reference|sec:alw>. To present this
  idea in a concise and efficient form, we recall the notation

  <\equation*>
    <value|uu><rsup|<around|(|1|)>>=\<Delta\>t*\<partial\><rsub|t>*<value|uu>,<space|2em><value|pf><rsup|<around|(|1|)>>=\<Delta\>t*\<partial\><rsub|t>*<value|pf>
  </equation*>

  The time derivatives of the solution are computed using the PDE

  <\equation*>
    <value|uu><rsup|<around|(|1|)>>=-\<Delta\>t*\<partial\><rsub|x>*<value|pf>
  </equation*>

  The approximate Lax-Wendroff procedure is applied in each element and so
  for simplicity of notation, we do not show the element index in the
  following. The vector <math|<vf>> below contains the flux values at
  solution points.

  <paragraph|First stage.>

  <\equation>
    <value|F1>\<assign\><value|pf><around*|(|<bu><rsup|n>|)>+<frac|1|4>*\<mathLaplace\>t*<pdv||t>*<value|pf><around*|(|<bu><rsup|n>|)>=<frac|1|\<mathLaplace\>t/2>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1/2>><value|pf><around*|(|<bu>|)>*<value|ud>t
  </equation>

  To obtain fourth order accuracy, the approximation for
  <math|<pdv||t>*<value|pf><around*|(|<bu><rsup|n>|)>> needs to be third
  order accurate<nbsp>(Appendix<nbsp><reference|sec:formal.accuracy>) which
  we obtain as

  <\equation*>
    <tabular*|<tformat|<cwith|3|3|2|2|cell-halign|l>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<value|pf><rsub|t><around|(|\<xi\>,t|)>>|<cell|>>|<row|<cell|\<approx\>>|<cell|<frac|-<value|pf><around|(|<value|uu><around|(|\<xi\>,t+2*\<Delta\>t|)>|)>+8*<value|pf><around|(|<value|uu><around|(|\<xi\>,t+\<Delta\>t|)>|)>-8*<value|pf><around|(|<value|uu><around|(|\<xi\>,t-\<Delta\>t|)>|)>+<value|pf><around|(|<value|uu><around|(|\<xi\>,t-2*\<Delta\>t|)>|)>|12*\<Delta\>t>>>|<row|<cell|\<approx\>>|<cell|<around*|\<nobracket\>|<frac|-<value|pf><around|(|<value|uu>+2*\<mathLaplace\>t*<value|uu><rsub|t>|)>+8*<value|pf><around|(|<value|uu>+\<mathLaplace\>t*<value|uu><rsub|t>|)>-8*<value|pf><around|(|<value|uu>-\<mathLaplace\>t*<value|uu><rsub|t>|)>+<value|pf><around|(|<value|uu>-2*\<mathLaplace\>t*<value|uu><rsub|t>|)>|12*\<Delta\>t>|\|><rsub|<around*|(|\<xi\>,t|)>>>>>>>
  </equation*>

  Thus, the time averaged flux is computed as

  <\equation*>
    <vF><rsup|\<ast\>>=<vf>+<frac|1|4>*<vf><rsup|<around*|(|1|)>>
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|<vu><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf>>>|<row|<cell|<vf><rsup|<around|(|1|)>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-<value|pf><around*|(|<vu>+2*<vu><rsup|<around|(|1|)>>|)>+8*<value|pf><around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-8*<value|pf><around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>+<value|pf><around*|(|<vu>-2*<vu><rsup|<around|(|1|)>>|)>|]>>>>>
  </eqnarray*>

  <paragraph|Second stage.>

  The time averaged flux is computed as

  <\equation*>
    <vF>=<vf>+<frac|1|6>*<around*|(|<vf><rsup|<around|(|1|)>>+2*<value|vfs><rsup|<around*|(|1|)>>|)>
  </equation*>

  where

  <\eqnarray>
    <tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<value|vus><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><value|vfs>>>|<row|<cell|<value|vfs><rsup|<around*|(|1|)>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-<value|pf><around*|(|<value|vus>+2*<value|vus><rsup|<around|(|1|)>>|)>+8*<value|pf><around*|(|<value|vus>+<value|vus><rsup|<around|(|1|)>>|)>-8*<value|pf><around*|(|<value|vus>-<value|vus><rsup|<around|(|1|)>>|)>+<value|pf><around*|(|<value|vus>-2*<value|vus><rsup|<around|(|1|)>>|)>|]>>>>>
  </eqnarray>

  <\remark>
    The <math|<vf>,<vf><rsup|<around|(|1|)>>> computed in the first stage are
    reused in the second.
  </remark>

  <subsection|Numerical flux><label|sec:mdrk.numflux>

  The numerical flux couples the solution between two neighbouring cells in a
  discontinuous Galerkin type method. In RK methods, the numerical flux is a
  function of the trace values of the solution at the faces. In the MDRK
  scheme, we have constructed time average fluxes at all the solution points
  inside the element and we want to use this information to compute the time
  averaged numerical flux at the element faces. The simplest numerical flux
  is based on Lax-Friedrich type approximation and is similar to the one used
  for LW<nbsp><cite|Qiu2005b> and is termed D1 dissipation as
  in<nbsp>Section<nbsp><reference|sec:numflux>

  <\equation>
    <eqsplit|<tformat|<table|<row|<cell|<value|F><rsub|<eph>>>|<cell|=<half>*<around|[|<value|F><rsub|<eph>><rsup|\<ast\>->+<value|F><rsub|<eph>><rsup|\<ast\>+>|]>-<half>*\<lambda\><rsub|<eph>>*<around|[|<value|uu><rsub|h><around|(|x<rsub|<eph>><rsup|+>,t<rsub|n>|)>-<value|uu><rsub|h><around|(|x<rsub|<eph>><rsup|->,t<rsub|n>|)>|]>>>|<row|<cell|<value|F><rsub|<eph>><rsup|>>|<cell|=<half>*<around|[|<value|F><rsub|<eph>><rsup|->+<value|F><rsub|<eph>><rsup|+>|]>-<half>*\<lambda\><rsub|<eph>>*<around|[|<value|uu><rsub|h><around|(|x<rsub|<eph>><rsup|+>,t<rsub|n>|)>-<value|uu><rsub|h><around|(|x<rsub|<eph>><rsup|->,t<rsub|n>|)>|]>>>>>><label|eq:mdrk.nfdiss1>
  </equation>

  which consists of a central flux and a dissipative part. As in
  Chapter<nbsp><reference|ch:lwfr>, the numerical flux of the
  form<nbsp><eqref|eq:mdrk.nfdiss1> leads to somewhat reduced CFL numbers
  which is experimentally verified and discussed in
  Section<nbsp><reference|sec:mdrk.fourier>. The
  flux<nbsp><eqref|eq:mdrk.nfdiss1> also lacks the upwind property even for
  linear advection equation. An alternate form of the numerical flux is
  obtained by evaluating the dissipation term using the time average
  solution, leading to the formula similar to D2 dissipation
  of<nbsp>Section<nbsp><reference|sec:numflux>

  <\equation>
    <eqsplit|<tformat|<table|<row|<cell|<value|F><rsub|<eph>><rsup|\<ast\>>>|<cell|=<half>*<around|[|<value|F><rsub|<eph>><rsup|\<ast\>->+<value|F><rsub|<eph>><rsup|\<ast\>+>|]>-<half>*\<lambda\><rsub|<eph>>*<around|[|<value|uU><rsub|<eph>><rsup|\<ast\>+>-<value|uU><rsub|<eph>><rsup|\<ast\>->|]>>>|<row|<cell|<value|F><rsub|<eph>>>|<cell|=<half>*<around|[|<value|F><rsub|<eph>><rsup|->+<value|F><rsub|<eph>><rsup|+>|]>-<half>*\<lambda\><rsub|<eph>>*<around|[|<value|uU><rsub|<eph>><rsup|+>-<value|uU><rsub|<eph>><rsup|->|]>>>>>><label|eq:mdrk.nfdiss2>
  </equation>

  where

  <\equation>
    <eqsplit|<tformat|<table|<row|<cell|<value|uU><rsup|\<ast\>>>|<cell|=<vu>+<frac|1|4>*<vu><rsup|<around|(|1|)>>>>|<row|<cell|<value|uU>>|<cell|=<vu>+<frac|1|6>*<around*|(|<vu><rsup|<around|(|1|)>>+2*<value|vus><rsup|<around*|(|1|)>>|)>>>>>><label|eq:mdrk.tavgsol>
  </equation>

  are the time average solutions. Following Chapter<nbsp><reference|ch:lwfr>,
  we will refer to the above two forms of dissipation as D1 and D2,
  respectively. The dissipation model D2 is not computationally expensive
  compared to the D1 model since all the quantities required to compute the
  time average solution <math|<value|uU>> are available during the
  Lax-Wendroff procedure. It remains to explain how to compute
  <math|<value|F><rsub|<eph>><rsup|\<pm\>>> appearing in the central part of
  the numerical flux. There were two ways introduced for Lax-Wendroff in
  Chapter<nbsp><reference|ch:lwfr> to compute the central flux, termed
  <extrapolate> and <evaluate>. We explain how the two apply to MDRK in the
  next two subsections.

  <subsection|Numerical flux \U average and extrapolate to face
  (AE)><label|sec:mdrk.ae>

  In each element, the time average flux <math|<value|F><rsub|h><rsup|\<delta\>>>
  corresponding to each stage has been constructed using the Lax-Wendroff
  procedure. The simplest approximation that can be used for
  <math|<value|F><rsub|<eph>><rsup|\<pm\>>> in the central part of the
  numerical flux is to extrapolate the flux
  <math|<value|F><rsub|h><rsup|\<delta\>>> to the faces

  <\equation*>
    <value|F><rsub|<eph>><rsup|\<pm\>>=<value|F><rsub|h><rsup|\<delta\>><around|(|x<rsub|<eph>><rsup|\<pm\>>|)>
  </equation*>

  As in Chapter<nbsp><reference|ch:lwfr>, we will refer to this approach with
  the abbreviation <extrapolate>. However, as shown in the numerical results,
  this approximation can lead to sub-optimal convergence rates for some
  non-linear problems. Hence we propose another method for the computation of
  the inter-cell flux which overcomes this problem as explained next.

  <subsection|Numerical flux \U extrapolate to face and average
  (EA)><label|sec:mdrk.ea>

  Instead of extrapolating the time average flux from the solution points to
  the faces, we can instead build the time average flux at the faces directly
  using the approximate Lax-Wendroff procedure that is used at the solution
  points. The flux at the faces is constructed after the solution is evolved
  at all the solution points. In the following equations, <math|\<alpha\>>
  denotes either the left face (<math|L>) or the right face (<math|R>) of a
  cell. For <math|\<alpha\>\<in\><around|{|L,R|}>>, we compute the time
  average flux at the faces of the <math|e><rsup|th> element by the following
  steps, where we suppress the element index since all the operations are
  performed inside one element.

  <paragraph|Stage 1.>

  <\eqnarray*>
    <tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|<value|uu><rsub|\<alpha\>><rsup|\<pm\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<vu>\<pm\><vu><rsup|<around|(|1|)>>|)>>>|<row|<cell|<value|pf><rsup|<around|(|1|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-<value|pf><around*|(|<value|uu><rsup|+2><rsub|\<alpha\>>|)>+8*<value|pf><around*|(|<value|uu><rsup|+><rsub|\<alpha\>>|)>-8*<value|pf><around*|(|<value|uu><rsup|-><rsub|\<alpha\>>|)>+<value|pf><around*|(|<value|uu><rsup|-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|<value|F><rsub|\<alpha\>><rsup|\<ast\>>>|<cell|=>|<cell|<value|pf><around|(|<value|uu><rsub|\<alpha\>>|)>+<frac|1|4>*<value|pf><rsup|<around|(|1|)>><rsub|\<alpha\>>>>>>
  </eqnarray*>

  <paragraph|Stage 2.>

  <\eqnarray*>
    <tformat|<table|<row|<cell|<value|uu><rsub|\<alpha\>><rsup|\<ast\>\<pm\>>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<value|vus>\<pm\><value|vus><rsup|<around|(|1|)>>|)>>>|<row|<cell|<value|uu><rsub|\<alpha\>><rsup|\<ast\>\<pm\>2>>|<cell|=>|<cell|<vV><rsub|\<alpha\>><rsup|\<top\>><around*|(|<value|vus>\<pm\>2*<value|vus><rsup|<around|(|1|)>>|)>>>|<row|<cell|<value|pf><rsup|\<ast\><around|(|1|)>><rsub|\<alpha\>>>|<cell|=>|<cell|<frac|1|12>*<around*|[|-<value|pf><around*|(|<value|uu><rsup|\<ast\>+2><rsub|\<alpha\>>|)>+8*<value|pf><around*|(|<value|uu><rsup|\<ast\>+><rsub|\<alpha\>>|)>-8*<value|pf><around*|(|<value|uu><rsup|\<ast\>-><rsub|\<alpha\>>|)>+<value|pf><around*|(|<value|uu><rsup|\<ast\>-2><rsub|\<alpha\>>|)>|]>>>|<row|<cell|<value|F><rsub|\<alpha\>>>|<cell|=>|<cell|<value|pf><around|(|<value|uu><rsub|\<alpha\>>|)>+<frac|1|6>*<around*|(|<value|pf><rsup|<around|(|1|)>><rsub|\<alpha\>>+2*<value|pf><rsup|\<ast\><around*|(|1|)>>|)>>>>>
  </eqnarray*>

  <\remark>
    The <math|<value|pf><around|(|<value|uu><rsub|\<alpha\>>|)>>,
    <math|<value|pf><rsup|<around|(|1|)>><rsub|\<alpha\>>> computed in the
    first stage are reused in the second stage.
  </remark>

  We see that the solution is first extrapolated to the cell faces and the
  same finite difference formulae for the time derivatives of the flux which
  are used at the solution points, are also used at the faces. The numerical
  flux is computed using the time average flux built as above at the faces;
  the central part of the flux <math|<value|F><rsub|<eph>><rsup|\<pm\>>> in
  equations<nbsp><eqref|eq:mdrk.nfdiss1>,<nbsp><eqref|eq:mdrk.nfdiss2> are
  computed as

  <\equation*>
    <value|F><rsub|<eph>><rsup|->=<around|(|<value|F><rsub|R>|)><rsub|e>,<space|2em><value|F><rsub|<eph>><rsup|+>=<around|(|<value|F><rsub|L>|)><rsub|e+1>
  </equation*>

  We will refer to this method with the abbreviation <evaluate>. The
  dissipative part of the flux is computed using either the solution at time
  <math|t<rsub|n>> or the time average solution, which are extrapolated to
  the faces, leading to the D1 and D2 models, respectively.

  <section|Fourier stability analysis><label|sec:mdrk.fourier>

  We now perform Fourier stability analysis of the MDRK scheme applied to the
  linear advection equation <math|u<rsub|t>+a*u<rsub|x>=0> where <math|a> is
  the constant advection speed. We will assume that the advection speed
  <math|a> is positive and denote the CFL number by

  <\equation*>
    \<sigma\>=<frac|a*\<Delta\>t|\<Delta\>x>
  </equation*>

  We will perform the CFL stability analysis for the MDRK scheme with D2
  dissipation flux<nbsp><eqref|eq:mdrk.nfdiss2> and thus will like to write
  the two stage scheme as

  <\equation>
    <vu><rsub|e><rsup|n+1>=-\<sigma\><rsup|2>*<vA><rsub|-2>*<vu><rsub|e-2>-\<sigma\>*<vA><rsub|-1>*<vu><rsub|e-1><rsup|n>+<around*|(|1-\<sigma\>*<vA><rsub|0>|)>*<vu><rsub|e><rsup|n>-\<sigma\>*<vA><rsub|+1>*<vu><rsub|e+1><rsup|n>-\<sigma\><rsup|2>*<vA><rsub|+2>*<vu><rsub|e+2><rsup|n><label|eq:mdrk.2stage.update.eqn>
  </equation>

  where the matrices <math|<vA><rsub|-2>,<vA><rsub|-1>,<vA><rsub|0>,<vA><rsub|+1>,<vA><rsub|+2>>
  depend on the choice of the dissipation model in the numerical flux. We
  will perform the final evolution by studying both the stages.

  <subsection|Stage 1>

  We will try to write the first stage as

  <\equation>
    <vu><rsub|e><rsup|\<ast\>>=-\<sigma\>*<vA><rsup|\<ast\>><rsub|-1>*<vu><rsub|e-1><rsup|n>+<around*|(|1-\<sigma\>*<vA><rsub|0><rsup|\<ast\>>|)>*<vu><rsub|e><rsup|n>-\<sigma\>*<vA><rsub|+1><rsup|\<ast\>>*<vu><rsub|e+1><rsup|n><label|eq:mdrk.A0A1.matrices>
  </equation>

  Since <math|f<rsub|t>=a*u<rsub|t>>, the time average flux for first stage
  at all solution points is given by

  <\equation*>
    <vF><rsub|e><rsup|\<ast\>>=a*<vU><rsub|e><rsup|\<ast\>><space|1em>where<space|1em><vU><rsub|e><rsup|\<ast\>>=<vT><rsup|\<ast\>>*<vu><rsub|e><space|1em>and<space|1em><vT><rsup|\<ast\>>=<vI>-<frac|\<sigma\>|4>*<vD>
  </equation*>

  The extrapolation to the cell boundaries are given by

  <\equation*>
    F<rsub|h><rsup|\<ast\>,\<delta\>><around|(|x<rsub|<value|emh>><rsup|+>|)>=<vV><rsub|L><rsup|T>*<vF><rsub|e><rsup|\<ast\>>,<space|2em>F<rsub|h><rsup|\<ast\>,\<delta\>><around|(|x<rsub|<value|eph>><rsup|+>|)>=<vV><rsub|R><rsup|T>*<vF><rsub|e><rsup|\<ast\>>
  </equation*>

  The D2 dissipation numerical flux is given by

  <\equation*>
    <vF><rsub|<value|eph>><rsup|\<ast\>>=<vV><rsub|R><rsup|T>*<vF><rsub|e><rsup|\<ast\>>=a*<vV><rsub|R><rsup|T>*<vT><rsup|\<ast\>>*<vu><rsub|e>
  </equation*>

  and the flux differences at the face as

  <\equation*>
    F<rsub|<value|emh>><rsup|\<ast\>>-F<rsub|h><rsup|\<ast\>,\<delta\>><around|(|x<rsub|<value|emh>><rsup|->|)>=a*<vV><rsub|R><rsup|T>**<vu><rsub|e-1>-a*<vV><rsub|L><rsup|T>*<vT><rsup|\<ast\>>*<vu><rsub|e>,<space|2em>F<rsub|<value|eph>><rsup|\<ast\>>-F<rsub|h><rsup|\<ast\>,\<delta\>><around|(|x<rsub|<value|eph>><rsup|->|)>=0
  </equation*>

  so that the flux derivative at the solution points is given by

  <\equation*>
    \<partial\><rsub|\<xi\>>*<vF><rsub|h><rsup|\<ast\>>=<vb><rsub|L>*<around*|(|a*<vV><rsub|R><rsup|T>*<vT><rsup|\<ast\>>*<vu><rsub|e-1>-a*<vV><rsub|L><rsup|T>*<vT><rsup|\<ast\>>*<vu><rsub|e>|)>+a*<vD>*<vT><rsup|\<ast\>>*<vu><rsub|e>=a*<vb><rsub|L>*<vV><rsub|R><rsup|T>*<vT><rsup|\<ast\>>*<vu><rsub|e-1>+a*<around*|(|<vD>*<vT><rsup|\<ast\>>-<vb><rsub|L>*<vV><rsub|L><rsup|T>*<vT><rsup|\<ast\>>|)>*<vu><rsub|e>
  </equation*>

  Since the evolution to <math|<vu><rsup|\<ast\>>> is given by

  <\equation>
    <vu><rsup|\<ast\>>=<vu><rsup|n>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|e>>*\<partial\><rsub|\<xi\>>*<vF><rsub|h><rsup|\<ast\>><label|eq:mdrk.us.fourier>
  </equation>

  the matrices in<nbsp><eqref|eq:mdrk.A0A1.matrices> are given by

  <\equation>
    <vA><rsub|-1><rsup|\<ast\>>=<frac|1|2>*<vb><rsub|L>*<vV><rsub|R><rsup|T>*<vT><rsup|\<ast\>>,<space|2em><vA><rsub|0><rsup|\<ast\>>=<frac|1|2>*<around*|(|<vD>*<vT><rsup|\<ast\>>-<vb><rsub|L>*<vV><rsub|L><rsup|T>*<vT><rsup|\<ast\>>|)>,<space|2em><vA><rsub|+1><rsup|\<ast\>>=0<label|eq:mdrk.A.star.defn>
  </equation>

  The upwind character of the D2 dissipation flux leads to
  <math|<vA><rsub|+1><rsup|\<ast\>>=0> and the right cell does not appear in
  the update equation.

  <subsection|Stage 2>

  After stage 1, we have <math|<vu><rsup|\<ast\>>,<vu><rsup|n>> and both are
  used to obtain <math|<vu><rsup|n+1>>. In this case,

  <\equation*>
    <vF><rsup|2><rsub|e>=a*<vU><rsub|e><rsup|2>,<space|2em><vU><rsub|e><rsup|2>=<vu><rsub|e><rsup|n>-<frac|1|6>*\<sigma\>*<vD>*<vu><rsub|e><rsup|n>-<frac|1|3>*\<sigma\>*<vD>*<vu><rsub|e><rsup|\<ast\>>=<vT><rsup|2>*<vu><rsub|e><rsup|n>+<vT><rsup|2,\<ast\>>*<vu><rsub|e><rsup|\<ast\>>
  </equation*>

  where

  <\equation*>
    <vT><rsup|2>=<vI>-<frac|1|6>*\<sigma\>*<vD>,<space|2em><vT><rsup|2,\<ast\>>=-<frac|1|3>*\<sigma\>*<vD>
  </equation*>

  The numerical fluxes are given by

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|5|5|3|3|cell-halign|l>|<cwith|4|4|3|3|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<cwith|3|3|1|1|cell-halign|r>|<cwith|4|4|1|1|cell-halign|r>|<table|<row|<cell|<vF><rsub|<eph>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|<vV><rsub|R><rsup|T>*<vF><rsub|e><rsup|2>+<vV><rsub|L><rsup|T>*<vF><rsub|e+1><rsup|2>|]>-<frac|1|2>*a*<around*|(|<vV><rsub|L><rsup|T>*<vU><rsup|2><rsub|e+1>-<vV><rsub|R><rsup|T>*<vU><rsup|2><rsub|e>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2>*a*<around*|[|<vV><rsub|R><rsup|T>*<vU><rsup|2><rsub|e>+<vV><rsub|L><rsup|T>*<vU><rsup|2><rsub|e+1>|]>-<frac|1|2>*a*<around*|(|<vV><rsub|L><rsup|T>*<vU><rsup|2><rsub|e+1>-<vV><rsub|R><rsup|T>*<vU><rsup|2><rsub|e>|)>>>|<row|<cell|>|<cell|=>|<cell|a*<vV><rsub|R><rsup|T>*<vU><rsub|e><rsup|2>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<vF><rsub|<value|emh>>>|<cell|=>|<cell|a*<vV><rsub|R><rsup|T>*<vU><rsub|e-1><rsup|2>>>>>>
  </equation*>

  and the face extrapolations are

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|->|)>>|<cell|=>|<cell|<vV><rsub|R><rsup|T>*<vF><rsub|e><rsup|2>>|<cell|=>|<cell|a*<vV><rsub|R><rsup|T>*<vU><rsub|e><rsup|2>>>|<row|<cell|F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|emh>><rsup|+>|)>>|<cell|=>|<cell|<vV><rsub|L><rsup|T>*<vF><rsub|e><rsup|2>>|<cell|=>|<cell|a*<vV><rsub|L><rsup|T>*<vU><rsub|e><rsup|2>>>>>>
  </equation*>

  Thus, the flux difference at the faces is

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|F<rsub|<value|eph>>-F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|eph>><rsup|->|)>>|<cell|=>|<cell|0>>|<row|<cell|F<rsub|<emh>>-F<rsub|h><rsup|\<delta\>><around|(|x<rsub|<value|emh>><rsup|+>|)>>|<cell|=>|<cell|a*<around*|(|<vV><rsub|R><rsup|T>*<vU><rsub|e-1><rsup|2>-<vV><rsub|L><rsup|T>*<vU><rsub|e><rsup|2>|)>>>>>>
  </equation>

  the flux derivative at the solution points is given by

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|\<partial\><rsub|\<xi\>>*<vF><rsub|h>>|<cell|=>|<cell|a*<vD>*<vU><rsup|2><rsub|e>+a*<vb><rsub|L>*<around*|(|<vV><rsub|R><rsup|T>*<vU><rsub|e-1><rsup|2>-<vV><rsub|L><rsup|T>*<vU><rsub|e><rsup|2>|)>>>|<row|<cell|>|<cell|=>|<cell|a*<vb><rsub|L>*<vV><rsub|R><rsup|T>*<vU><rsub|e-1><rsup|2>+a*<around*|(|<vD>-<vb><rsub|L>*<vV><rsub|L><rsup|T>|)>*<vU><rsup|2><rsub|e>>>>>>
  </equation>

  We now expand <math|<vU><rsub|e><rsup|2>> in terms of
  <math|<vu><rsub|e><rsup|n>> as follows

  <\equation*>
    <vU><rsub|e><rsup|2>=<vT><rsup|2>*<vu><rsub|e><rsup|n>+<vT><rsup|2,\<ast\>>*<vu><rsub|e><rsup|\<ast\>>
  </equation*>

  where

  <\equation*>
    <vT><rsup|2>=<vI>-<frac|1|6>*\<sigma\>*<vD>,<space|2em><vT><rsup|2,\<ast\>>=-<frac|1|3>*\<sigma\>*<vD>
  </equation*>

  Thus, by

  <\equation*>
    <vu><rsup|n+1>=<vu><rsup|n>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|e>>*\<partial\><rsub|\<xi\>>*<vF><rsub|h>
  </equation*>

  and also expanding <math|<vu><rsup|\<ast\>>>
  from<nbsp><eqref|eq:mdrk.us.fourier>, the matrices
  in<nbsp><eqref|eq:mdrk.2stage.update.eqn> are given by

  <\equation*>
    <tabular*|<tformat|<cwith|4|4|1|1|cell-halign|l>|<cwith|3|3|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|r>|<cwith|4|4|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<vA><rsub|-2>>|<cell|=>|<cell|-<vb><rsub|L>*<vV><rsub|R><rsup|T>*<vT><rsup|2,\<ast\>>*<vA><rsup|\<ast\>><rsub|-1>>>|<row|<cell|<vA><rsub|-1>>|<cell|=>|<cell|<vb><rsub|L>*<vV><rsub|R><rsup|T>*<around*|(|<vT><rsup|2>+<vT><rsup|2,\<ast\>>*<around*|(|1-\<sigma\>*<vA><rsub|0><rsup|\<ast\>>|)>|)>-\<sigma\>*<around*|(|*<vD>-<vb><rsub|L>*<vV><rsub|L><rsup|T>|)>*<vT><rsup|2,\<ast\>>*<vA><rsup|\<ast\>><rsub|-1>>>|<row|<cell|<vA><rsub|0>>|<cell|=>|<cell|-<around*|(|<vD>-<vb><rsub|L>*<vV><rsub|L><rsup|T>|)>*<around*|(|<vT><rsup|2>+<vT><rsup|2,\<ast\>>*<around*|(|1-\<sigma\>*<vA><rsub|0><rsup|\<ast\>>|)>|)>>>|<row|<cell|<vA><rsub|+1>=<vA><rsub|+2>>|<cell|=>|<cell|0>>>>>
  </equation*>

  where <math|<vA><rsub|i><rsup|\<ast\>>> are defined
  in<nbsp><eqref|eq:mdrk.A.star.defn>. The upwind character of D2 flux is the
  reason why we have <math|<vA><rsub|+1>=<vA><rsub|+2>=0>.

  <paragraph|Stability analysis.>We assume a solution of the form
  <math|<vu><rsub|e><rsup|n>=<wide|<vu>|^><rsub|k><rsup|n>*exp<around*|(|i*k*x<rsub|e>|)>>
  where <math|i=<sqrt|-1>>, <math|k> is the wave number which is an integer
  and <math|<wide|<vu>|^><rsub|k><rsup|n>\<in\>\<bbb-R\><rsup|N+1>> are the
  Fourier amplitudes; substituting this ansatz in the update
  equation<nbsp><eqref|eq:mdrk.2stage.update.eqn>, we get

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<wide|<vu>|^><rsub|k><rsup|n+1>=H<around*|(|\<sigma\>,k|)>*<wide|<vu>|^><rsub|k><rsup|n>>>|<row|<cell|<vH>=-\<sigma\><rsup|2>*<vA><rsub|-2>*exp<around*|(|-2*i*\<kappa\>|)>-\<sigma\>*<vA><rsub|-1>exp<around*|(|-i*\<kappa\>|)>+<vI>-\<sigma\>*<vA><rsub|0>-\<sigma\>*<vA><rsub|+1>exp<around*|(|i*\<kappa\>|)>-\<sigma\><rsup|2>*<vA><rsub|+2>*exp<around*|(|2*i*\<kappa\>|)>>>>>>
  </equation*>

  where <math|\<kappa\>=k*\<mathLaplace\>x> is the non-dimensional wave
  number. The explicit expression of <math|<vH>> is then used to numerically
  compute the CFL number as in Section<nbsp><reference|sec:four1d>. The
  results of this numerical investigation of stability are shown in
  Table<nbsp><reference|tab:mdrk.cfl> for two correction functions with
  polynomial degree <math|N=3>. The comparison is made with CFL numbers of
  MDRK-D1<nbsp><eqref|eq:mdrk.nfdiss1> which are experimentally obtained from
  the linear advection test case<nbsp>(Section<nbsp><reference|sec:mdrk.cla>),
  i.e., using time step size that is slightly larger than these numbers
  causes the solution to blow up.

  <big-table|<center|<block|<tformat|<cwith|2|2|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|3|3|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|2|2|4|4|cell-halign|c>|<cwith|3|3|4|4|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|1|1|4|4|cell-halign|c>|<cwith|1|1|3|3|cell-halign|c>|<table|<row|<cell|Correction>|<cell|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|D1>>|<row|<cell|<around*|(|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|Experimentally>>|<row|<cell|obtained>>>>>|)>>>>>>>|<cell|D2>|<cell|<math|<frac|<text|D2>|<text|D1>>>>>|<row|<cell|Radau>|<cell|\<approx\>0.09>|<cell|0.107>|<cell|1.19>>|<row|<cell|<math|<value|g2>>>|<cell|\<approx\>0.16>|<cell|0.224>|<cell|1.4>>>>>>|<caption-detailed|CFL
  numbers for MDRK scheme with Radau and <math|<value|g2>> correction
  functions.|CFL numbers for MDRK scheme.><label|tab:mdrk.cfl>>

  We see that dissipation model D2 has a higher CFL number compared to
  dissipation model D1. The CFL numbers for the <math|g<rsub|2>> correction
  function are also significantly higher than those for the Radau correction
  function. The optimality of these CFL numbers has been verified by
  experiment on the linear advection test
  case<nbsp>(Section<nbsp><reference|sec:mdrk.cla>), i.e., the solution
  eventually blows up if the time step is slightly higher than what is
  allowed by the CFL condition.

  <section|Blending scheme><label|sec:mdrk.blending>

  The MDRK scheme<nbsp><eqref|eq:mdrk.uplwfr> gives a high (fourth) order
  method for smooth problems, but most practical problems involving
  hyperbolic conservation laws consist of non-smooth solutions like shocks.
  Thus, we develop the blending scheme used for LWFR from
  Section<nbsp><reference|sec:blending.scheme> for the MDRK scheme. The idea
  is to apply the limiter at each MDRK stage.

  Let us write the MDRK update equation<nbsp><eqref|eq:mdrk.uplwfr>

  <\equation>
    <vu><rsup|H,\<ast\>><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<vR><rsup|\<ast\>,H><rsub|e>,<space|2em><vu><rsup|H,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vR><rsup|H><rsub|e><label|eq:mdrk.ho.method>
  </equation>

  where <math|<vu><rsub|e>> is the vector of nodal values in the element. We
  use the lower order schemes as

  <\equation>
    <label|eq:mdrk.lo.method><vu><rsup|L,\<ast\>><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<vR><rsup|\<ast\>,L><rsub|e>,<space|2em><vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vR><rsup|L><rsub|e>
  </equation>

  Then the two-stage blended scheme is given by

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<vu><rsup|\<ast\>><rsub|e>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<vu><rsup|H,\<ast\>><rsub|e>+\<alpha\><rsub|e>*<vu><rsup|L,\<ast\>><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<around|[|<around|(|1-\<alpha\><rsub|e>|)>*<vR><rsup|\<ast\>,H><rsub|e>+\<alpha\><rsub|e>*<vR><rsup|\<ast\>,L><rsub|e>|]>>>|<row|<cell|<vu><rsup|n+1><rsub|e>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<vu><rsup|H,n+1><rsub|e>+\<alpha\><rsub|e>*<vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|[|<around|(|1-\<alpha\><rsub|e>|)>*<vR><rsup|n+1,H><rsub|e>+\<alpha\><rsub|e>*<vR><rsup|n+1,L><rsub|e>|]>>>>>><label|eq:mdrk.blended.scheme>
  </equation>

  where <math|\<alpha\><rsub|e>\<in\><around|[|0,1|]>> must be chosen based
  on the local smoothness indicator of Section<nbsp><reference|sec:smooth.ind>.
  As in Section<nbsp><reference|sec:blending.scheme>, if
  <math|\<alpha\><rsub|e>=0> then we obtain the high order MDRK scheme, while
  if <math|\<alpha\><rsub|e>=1> then the scheme becomes the low order scheme
  that is less oscillatory. The lower order scheme will either be a first
  order finite volume scheme<nbsp>(Section<nbsp><reference|sec:fo>) or a high
  resolution scheme based on MUSCL-Hancock
  idea<nbsp>(Section<nbsp><reference|sec:mh>). In either case, the common
  structure of the low order scheme at each stage will be the same as in
  Section<nbsp><reference|sec:blending.scheme>. However, there is one thing
  that we would like to clarify in the structure of the lower order
  method<nbsp><eqref|eq:mdrk.lo.method>. In the first stage, the lower order
  residual <math|<vR><rsup|\<ast\>,L><rsub|e>> performs evolution from time
  <math|t<rsup|n>> to <math|t<rsup|<value|nph>>> while, in the second stage,
  <math|<vR><rsup|L><rsub|e>> performs evolution from <math|t<rsup|n>> to
  <math|t<rsup|n+1>>. Intuition may suggest evolving from
  <math|t<rsup|<value|nph>>> to <math|t<rsup|n+1>> in the next stage, but
  that will violate the conservation property because of the expression of
  second stage of MDRK<nbsp>(<reference|eq:mdrk.mdrk.second.stage>,<nbsp><reference|eq:mdrk.ho.method>).

  Note that the subcells will be the same as in the single stage LWFR scheme,
  see Figure<nbsp><reference|fig:subcells>. Since the lower order scheme for
  the second stage is an evolution from <math|t<rsup|n>> to
  <math|t<rsup|n+1>>, its explanation will be exactly the same as in
  Section<nbsp><reference|sec:blending.scheme>. With a slight modification,
  we will obtain the lower order scheme used in the first stage, but we write
  it here for clarity. The low order scheme is obtained by updating the
  solution in each of the subcells by a finite volume scheme,

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<value|uez><rsup|L,\<ast\>>>|<cell|=>|<cell|<value|uez><rsup|n>-<frac|\<Delta\>t/2|w<rsub|0>*\<Delta\>x<rsub|e>>*<around|[|<value|pf><rsub|<half>><rsup|e>-<value|F><rsub|<emh>><rsup|\<ast\>>|]>>>|<row|<cell|<value|uep><rsup|L,\<ast\>>>|<cell|=>|<cell|<value|uep><rsup|n>-<frac|\<Delta\>t/2|w<rsub|p>*\<Delta\>x<rsub|e>>*<around|[|<value|pf><rsub|<value|pph>><rsup|e>-<value|pf><rsub|<value|pmh>><rsup|e>|]>,<space|2em>1\<le\>p\<le\>N-1>>|<row|<cell|<value|ueN><rsup|L,\<ast\>>>|<cell|=>|<cell|<value|ueN><rsup|n>-<frac|\<Delta\>t/2|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|[|<value|F><rsub|<eph>><rsup|\<ast\>>-<value|pf><rsub|<Nmh>><rsup|e>|]>>>>>><label|eq:mdrk.low.order.update>
  </equation>

  The inter-element fluxes <math|<value|F><rsub|<eph>><rsup|\<ast\>>> used in
  the low order scheme are same as those used in the high order MDRK scheme
  in equation<nbsp><eqref|eq:mdrk.f2.defn>. As in
  Chapter<nbsp><reference|ch:lw.subcell.limiter>, Rusanov's
  flux<nbsp><cite|Rusanov1962> will be used for the inter-element fluxes and
  in the lower order scheme. The element mean value obtained by the low order
  scheme satisfies

  <\equation>
    <label|eq:mdrk.low.order.cell.avg.update><au><rsub|e><rsup|L,\<ast\>>=<big|sum><rsub|p=0><rsup|N><value|uep><rsup|L,\<ast\>>*w<rsub|p>=<au><rsub|e><rsup|n>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>><rsup|\<ast\>>-<value|F><rsub|<emh>><rsup|\<ast\>>|)>
  </equation>

  which is identical to the update equation by the MDRK scheme given in
  equation<nbsp><eqref|eq:mdrk.upmean>. The element mean in the blended
  scheme evolves according to

  <\eqnarray*>
    <tformat|<table|<row|<cell|<au><rsub|e><rsup|\<ast\>>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<around|(|<au><rsub|e>|)><rsup|H,\<ast\>>+\<alpha\><rsub|e>*<around|(|<au><rsub|e>|)><rsup|L,\<ast\>>>>|<row|<cell|>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<around*|[|<au><rsub|e><rsup|n>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>><rsup|\<ast\>>-<value|F><rsub|<emh>><rsup|\<ast\>>|)>|]>+\<alpha\><rsub|e>*<around*|[|<au><rsub|e><rsup|n>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>><rsup|\<ast\>>-<value|F><rsub|<emh>><rsup|\<ast\>>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<au><rsub|e><rsup|n>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>><rsup|\<ast\>>-<value|F><rsub|<emh>><rsup|\<ast\>>|)>>>>>
  </eqnarray*>

  and hence the blended scheme is also conservative. The similar arguments
  will apply to the second stage, where the lower order scheme is as
  described in Section<nbsp><reference|sec:blending.scheme>, and we will have
  by<nbsp><eqref|eq:mdrk.upmean>

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<avg|<value|uu>><rsup|\<ast\>><rsub|e>>|<cell|=>|<cell|<au><rsub|e><rsup|n>-<frac|\<Delta\>t/2|\<Delta\>x<rsub|e>>*<around|(|<value|F1><rsub|<eph>>-<value|F1><rsub|<emh>>|)>>>|<row|<cell|<au><rsub|e><rsup|n+1>>|<cell|=>|<cell|<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<value|F2><rsub|<eph>>-<value|F2><rsub|<emh>>|)>>>>>>
  </equation*>

  Overall, all three schemes, i.e., lower order, MDRK and the blended scheme,
  predict the same mean value.

  The inter-element fluxes <math|<value|F1><rsub|<value|eph>>,<value|F2><rsub|<eph>>>
  are used both in the low and high order schemes. To achieve high order
  accuracy in smooth regions, this flux needs to be high order accurate,
  however it may produce spurious oscillations near discontinuities when used
  in the low order scheme. A natural choice to balance accuracy and
  oscillations is to take

  <\equation>
    <label|eq:mdrk.Fblend><tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<value|F><rsub|<eph>>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsup|HO\<ast\>><rsub|<value|eph>>+\<alpha\><rsub|<eph>>*<value|pf><rsub|<eph>>>>|<row|<cell|<value|F><rsub|<eph>>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F2><rsub|<eph>><rsup|HO>+\<alpha\><rsub|<eph>>*<value|pf><rsub|<eph>>>>>>>
  </equation>

  where <math|<value|F><rsup|HO\<ast\>><rsub|<value|eph>>,<value|F2><rsub|<value|eph>><rsup|HO>>
  are the high order inter-element time-averaged numerical fluxes used in the
  MDRK scheme<nbsp><eqref|eq:mdrk.nfdiss2> and <math|<value|pf><rsub|<eph>>>
  is a lower order flux at the face <math|x<rsub|<eph>>> shared between FR
  elements and subcells<nbsp>(<reference|eq:fo.at.face>,<nbsp><reference|eq:mh.at.face>).
  The construction of specific lower order schemes as first order
  (Section<nbsp><reference|sec:fo>) or MUSCL-Hancock
  (Section<nbsp><reference|sec:mh>) remains as in
  Chapter<nbsp><reference|ch:lw.subcell.limiter>, and the same goes for goes
  for flux limiting of<nbsp><eqref|eq:mdrk.Fblend> to enforce admissibility
  in means (Definition<nbsp><reference|defn:mean.pres>). Once admissibility
  preservation in means is obtained, the scaling limiter
  of<nbsp><cite|Zhang2010b> (Appendix<nbsp><reference|app:scaling.limiter>),
  is used to obtain an admissibility preserving scheme
  (Definition<nbsp><reference|defn:adm.pres>).

  <section|Numerical results><label|sec:mdrk.num>

  In this section, we test the MDRK scheme with numerical experiments using
  polynomial degree <math|N=3> in all results. Most of the test cases from
  the previous chapters were tried and were seen to validate our claims; but
  we only show the important results here. We also tested all the benchmark
  problems for higher order methods in<nbsp><cite|Pan2016>, and show some of
  the results from there.

  <subsection|Scalar equations>

  We perform convergence tests with scalar equations. The MDRK scheme with D1
  and D2 dissipation are tested using the optimal CFL numbers from
  Table<nbsp><reference|tab:mdrk.cfl>. We make comparison with RKFR scheme
  with polynomial degree <math|N=3> described in
  Section<nbsp><reference|sec:rk> using the SSPRK scheme
  from<nbsp><cite|Spiteri2002>. The CFL number for the fourth order RK scheme
  is taken from<nbsp><cite|Gassner2011a>. In many problems, we compare with
  Gauss-Legendre (GL) solution points and Radau correction functions, and
  Gauss-Legendre-Lobatto (GLL) solution points with <math|g<rsub|2>>
  correction functions. These combinations are important because they are
  both variants of Discontinuous Galerkin
  methods<nbsp><cite|Huynh2007|Grazia2014>
  (Appendix<nbsp><reference|app:equiv.dg.fr>).

  <subsubsection|Linear advection equation><label|sec:mdrk.cla>

  The initial condition <math|u<around|(|x,0|)>=sin<around|(|2*\<pi\>*x|)>>
  is taken with periodic boundaries on <math|<around|[|0,1|]>>. The error
  norms are computed at time <math|t=2> units and shown in
  Figure<nbsp><reference|fig:mdrk.cla1>. The MDRK scheme with D2 dissipation
  (MDRK-D2) scheme shows optimal order of convergence and has errors close to
  that MDRK-D1 and the RK scheme for all the combinations of solution points
  and correction functions.

  <big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<cell|<image|figures/mdrk/linadv1d/lw_mdrk_gl.pdf|0.48par|||>>|<cell|<image|figures/mdrk/linadv1d/lw_mdrk_gll.pdf|0.48par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:mdrk.cla1>|<caption-detailed|Error
  convergence for constant linear advection equation comparing MDRK and RK -
  (a) GL points with Radau correction, (b) GLL points with <math|g<rsub|2>>
  correction|Convergence for constant advection, MDRK and RK.>>

  <subsubsection|Variable advection equation>

  <\equation*>
    u<rsub|t>+f<around*|(|x,u|)><rsub|x>=0,<space|2em>f<around*|(|x,u|)>=a<around*|(|x|)>*u
  </equation*>

  The velocity is <math|a<around*|(|x|)>=x<rsup|2>>,
  <math|u<rsub|0><around*|(|x|)>=cos<around*|(|\<pi\>*x/2|)>>,
  <math|x\<in\><around*|[|0.1,1|]>> and the exact solution is
  <math|u<around*|(|x,t|)>=u<rsub|0><around*|(|x/<around*|(|1+t*x|)>|)>/<around*|(|1+t*x|)><rsup|2>>.
  Dirichlet boundary conditions are imposed on the left boundary and outflow
  boundary conditions on the right. This problem is non-linear in the spatial
  variable, i.e., if <math|I<rsub|h>> is the interpolation operator,
  <math|I<rsub|h><around*|(|a*u<rsub|h>|)>\<neq\>I<rsub|h><around*|(|a|)>*I<rsub|h><around*|(|u<rsub|h>|)>>.
  Thus, the <math|<extrapolate>> and <evaluate> schemes are expected to show
  different behavior, unlike the previous test.\ 

  The grid convergence analysis is shown in
  Figure<nbsp><reference|fig:mdrk.vla2>. In
  Figure<nbsp><reference|fig:mdrk.vla2>a, the scheme with <extrapolate> shows
  larger errors compared to the RK scheme though the convergence rate is
  optimal. The MDRK scheme with <evaluate> shown in the middle figure, is as
  accurate as the RK scheme. The last figure compares <extrapolate> and
  <evaluate> schemes using GL solution points, Radau correction function and
  D2 dissipation; we clearly see that <evaluate> scheme has smaller errors
  than <extrapolate> scheme.

  <\big-figure>
    <tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|3|3|cell-halign|c>|<table|<row|<\cell>
      <image|figures/mdrk/varadv/lw_mdrk_AE.pdf|0.3par|||>
    </cell>|<\cell>
      <image|figures/mdrk/varadv/lw_mdrk_EA.pdf|0.3par|||>
    </cell>|<\cell>
      <image|figures/mdrk/varadv/mdrk_bflux_compared.pdf|0.3par|||>
    </cell>>|<row|<\cell>
      (a)
    </cell>|<\cell>
      (b)
    </cell>|<\cell>
      (c)
    </cell>>>>><label|fig:mdrk.vla2>
  </big-figure|<caption-detailed|Error convergence for variable linear
  advection equation with <math|a<around*|(|x|)>=x<rsup|2>>; (a)
  <extrapolate> scheme, (b) <evaluate> scheme, (c) <extrapolate> versus
  <evaluate>|Convergence for variable advection with
  <math|a<around*|(|x|)>=x<rsup|2>>, MDRK and RK.>>

  <subsubsection|Burgers' equations>

  The one dimensional Burger's equation is a conservation law of the form
  <math|u<rsub|t>+f<around|(|u|)><rsub|x>=0> with the quadratic flux
  <math|f<around|(|u|)>=u<rsup|2>/2>. For the smooth initial condition
  <math|u<around|(|x,0|)>=0.2*sin <around|(|x|)>> with periodic boundary
  condition in the domain <math|<around|[|0,2*\<pi\>|]>>, we compute the
  numerical solution at time <math|t=2> when the solution is still smooth.
  Figure<nbsp><reference|fig:mdrk.burg1>a compares the error norms for the
  <extrapolate> and <evaluate> methods for the Rusanov numerical flux, and
  using GL solution points, Radau correction and D2 dissipation. The
  convergence rate of <extrapolate> is less than optimal and close to
  <math|O<around|(|h<rsup|3+1/2>|)>>. In Figure<nbsp><reference|fig:mdrk.burg1>b,
  we see that no scheme shows optimal convergence rates when <math|g<rsub|2>>
  correction + GLL points is used. The comparison between D1, D2 dissipation
  is made in Figure<nbsp><reference|fig:mdrk.burg2> and their performances
  are found to be similar.

  <big-figure|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/burg1d/bflux_compared_gl.pdf|0.47par|||>
  </cell>|<\cell>
    <image|figures/mdrk/burg1d/bflux_compared_gll.pdf|0.47par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.burg1>|<caption-detailed|Comparing <extrapolate>
  and <evaluate> schemes using D2 dissipation for 1-D Burgers' equation at
  <math|t=2>. (a) GL points with Radau correction, (b) GLL points with
  <math|g<rsub|2>> correction.|1-D Burgers' equation, <extrapolate> and
  <evaluate> schemes, MDRK and RK.>>

  <big-figure|<tabular|<tformat|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/burg1d/diss_compared_gl.pdf|0.46par|||>
  </cell>|<\cell>
    <image|figures/mdrk/burg1d/diss_compared_gll.pdf|0.46par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.burg2>|<caption-detailed|Comparing D1 and D2
  dissipation for 1-D Burgers' equation at <math|t=2>. (a) GL points with
  Radau correction, (b) GLL points with <math|g<rsub|2>> correction|MDRK D1
  and D2 dissipation for 1-D Burgers' equation.>>

  <subsection|1-D Euler equations><label|sec:mdrk.res1dsys>

  We now consider the 1-D Euler's equations<nbsp><eqref|eq:1deuler> and
  compute the time step size with<nbsp><eqref|eq:dt.lw> with CFL=0.107
  (Table<nbsp><reference|tab:mdrk.cfl>). The coefficient
  <math|<value|Cs>=0.98> is used in tests, unless specified otherwise.

  <subsubsection|Blast>

  This test is as described in Section<nbsp><reference|sec:blast>. As in the
  case of the LWFR scheme, the numerical solutions give negative pressure if
  the positivity correction is not applied. With a grid of 400 cells using
  polynomial degree <math|N=3>, we run the simulation till the time
  <math|t=0.038> where a high density peak profile is produced. As tested in
  Section<nbsp><reference|sec:blast>, we compare first order (FO) and
  MUSCL-Hancock (MH) blending schemes, and TVB limiter with parameter
  <math|M=300><nbsp><cite|Qiu2005b> (TVB-300). We compare the performance of
  limiters in Figure<nbsp>(<reference|fig:mdrk.blast>) where the approximated
  density and pressure profiles are compared with a reference solution
  computed using a very fine mesh. Looking at the peak amplitude and contact
  discontinuity, it is clear that MUSCL-Hancock blending scheme gives the
  best resolution, especially when compared with the TVB limiter.

  <big-figure|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler1d/blast_density.pdf|0.43par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler1d/blast_pressure|0.43par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.blast>|<caption-detailed|Blast wave problem
  using first order (FO) and MUSCL-Hancock blending schemes, and TVB limited
  scheme (TVB-300) with parameter <math|M=300>. (a) Density, (b) Pressure
  profiles are shown at <math|t=0.038> on a mesh of 400 cells.|Blast wave,
  comparing TVB and blending schemes for MDRK.>>

  <subsubsection|Titarev Toro>

  This is an extension of the Shu-Osher (Section<nbsp><reference|sec:shuosher>)
  problem given by Titarev and Toro<nbsp><cite|Titarev2004> and the initial
  data comprises of a severely oscillatory wave interacting with a shock.
  This problem tests the ability of a high-order numerical scheme to capture
  the extremely high frequency waves. The smooth density profile passes
  through the shock and appears on the other side, and its accurate
  computation is challenging due to numerical dissipation. Due to presence of
  both spurious oscillations and smooth extrema, this becomes a good test for
  testing robustness and accuracy of limiters. We discretize the spatial
  domain with 800 cells using polynomial degree <math|N=3> and compare
  blending schemes. As expected, the MUSCL-Hancock (MH) blending scheme is
  superior to the First Order (FO) blending scheme and has nearly resolved in
  the smooth extrema.

  The initial condition is given by

  <\equation*>
    <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1.515695,0.523346,1.805|)>,>|<cell|<space|2em>>|<cell|-5\<leq\>x\<leq\>-4.5>>|<row|<cell|<around*|(|1+0.1*sin<around*|(|20*\<pi\>*x|)>,0,1|)>,>|<cell|>|<cell|-4.5\<less\>x\<leq\>5>>>>>
  </equation*>

  The physical domain is <math|<around*|[|-5,5|]>> and a grid of 800 elements
  is used. The density profile at <math|t=5> is shown in
  Figure<nbsp><reference|fig:mdrk.titarev.toro>.

  <big-figure|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler1d/titarev_toro.pdf|0.43par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler1d/titarev_toro_zoom.pdf|0.43par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.titarev.toro>|<caption-detailed|Titarev-Toro
  problem, comparing First Order (FO) and MUSCL-Hancock (MH) blending (a)
  Complete plot, (b) Profile zoomed near smooth extrema on a mesh of 800
  cells.|Titarev-Toro problem, comparing blending schemes for MDRK.>>

  <subsubsection|Large density ratio Riemann problem>

  The second example is the large density ratio problem with a very strong
  rarefaction wave<nbsp><cite|Tang2006>. The initial condition is given by

  <\equation*>
    <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1000,0,1000|)>,>|<cell|<space|1em>>|<cell|x\<less\>0.3>>|<row|<cell|<around*|(|1,0,1|)>,>|<cell|>|<cell|0.3\<less\>x>>>>>
  </equation*>

  The computational domain is <math|<around*|[|0,1|]>> and transmissive
  boundary condition is used at both ends. The density and pressure profile
  on a mesh of <math|500> elements at <math|t=0.15> is shown in
  Figure<nbsp><reference|fig:mdrk.high.density>. The MH blending scheme is
  giving better accuracy even in this tough problem.

  <big-figure|<tabular|<tformat|<cwith|1|1|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler1d/large_density_density.pdf|0.45par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler1d/large_density_pressure.pdf|0.45par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.high.density>|<caption-detailed|High density
  problem at <math|t=0.15> on a mesh of 500 elements (a) Density plot, (b)
  Pressure plot|High density problem, comparing blending schemes for MDRK.>>

  <subsubsection|Sedov's blast>

  This test case is as described in Section<nbsp><reference|sec:sedov.blast.1d>.
  Nonphysical solutions are obtained if the proposed admissibility
  preservation corrections are not applied. The density and pressure profiles
  at <math|t=0.001> are obtained using blending schemes are shown in
  Figure<nbsp><reference|fig:mdrk.sedov.blast>. In
  Chapter<nbsp><reference|ch:lw.subcell.limiter>,<nbsp><cite|babbar2023admissibility>,
  the TVB limiter was not used in this test as the proof of admissibility
  preservation depended on the blending scheme. Here, by using the
  generalized admissibility preserving scheme
  of<nbsp>Chapter<nbsp><reference|ch:10mom>,<nbsp><cite|babbar2024generalized>,
  we are able to use the TVB limiter. However, as expected, the TVB limiter
  is less accurate and unable to control the oscillations..

  <big-figure|<tabular|<tformat|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler1d/sedov1d_density.pdf|0.45par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler1d/sedov1d_pressure|0.45par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.sedov.blast>|<caption-detailed|Sedov's blast
  wave problem, numerical solution using first order (FO) and MUSCL-Hancock
  blending schemes, and TVD (a) Density, (b) Pressure profiles are shown at
  <math|t=0.001> on a mesh of 201 cells.|Sedov's blast wave problem,
  comparing TVB and blending schemes for MDRK.>>

  <subsection|2-D Euler's equations>

  We consider the two-dimensional Euler equations of gas dynamics given
  by<nbsp><eqref|eq:2deuler>. The time step size in computed as
  in<nbsp><eqref|eq:mdrk.time.step.2d> with CFL=0.107
  (Table<nbsp><reference|tab:mdrk.cfl>) and <math|<value|Cs>=0.98> unless
  otherwise specified.

  As in Chapter<nbsp><reference|ch:lw.subcell.limiter>, for verification of
  some our numerical results and to demonstrate the accuracy gain observed
  in<nbsp><cite|babbar2023admissibility> of using MUSCL-Hancock
  reconstruction using Gauss-Legendre points, we will compare our results
  with the first order blending scheme using Gauss-Legendre-Lobatto (GLL)
  points of<nbsp><cite|hennemann2021> available in
  <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022>. The accuracy
  benefit is expected since GL points and quadrature are more accurate than
  GLL points, and MUSCL-Hancock is also more accurate than first order finite
  volume method.

  <subsubsection|Double Mach reflection>

  The description and significance of this test has been given in
  Section<nbsp><reference|sec:dmr>. The simulation is run on a mesh of
  <math|600\<times\>150> elements using degree <math|N=3> polynomials up to
  time <math|t=0.2>. In Figure<nbsp><reference|fig:mdrk.dmr>, we compare the
  results of <with|font-family|tt|Trixi.jl> with the MUSCL-Hancock blended
  scheme zoomed near the primary triple point. As expected, the small scale
  structures are captured better by the MUSCL-Hancock blended scheme.

  <big-figure|<tabular|<tformat|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<table|<row|<cell|<image|figures/mdrk/euler2d/dmr/colour_bar.pdf|0.8par|||>>|<cell|>>|<row|<cell|<image|figures/mdrk/euler2d/dmr/density.png|0.45par|||>>|<cell|<image|figures/mdrk/euler2d/dmr/density_trixi.png|0.45par|||>>>|<row|<cell|(a)
  MDRK>|<cell|(b) <verbatim|Trixi.jl>>>>>><label|fig:mdrk.dmr>|<caption-detailed|Double
  Mach reflection problem, density plot of numerical solution at <math|t=0.2>
  on a <math|600\<times\>150> mesh zoomed near the primary triple
  point.|Double Mach reflection problem, MDRK.>>

  <subsubsection|Rotational low density problem>

  These problems are taken from<nbsp><cite|Pan2016> where the solution
  consists of hurricane-like flow evolution, and has one-point vacuum in the
  center with rotational velocity field. The initial condition is given by

  <\equation*>
    <around*|(|\<rho\>,u,v,p|)>=<around*|(|\<rho\><rsub|0>,v<rsub|0>*sin
    \<theta\>,-v<rsub|0>*cos \<theta\>,A*\<rho\><rsub|0><rsup|\<gamma\>>|)>
  </equation*>

  where <math|\<theta\>=arctan<around*|(|y/x|)>>, <math|A=25> is the initial
  entropy, <math|\<rho\>=1> is the initial density, gas constant
  <math|\<gamma\>=2>. The initial velocity distribution has a nontrivial
  transversal component, which makes the flow rotational. The solutions are
  classified<nbsp><cite|Zhang1997> into three types according to the initial
  Mach number <math|M<rsub|0>=<around*|\||v<rsub|0>|\|>/c<rsub|0>>, where
  <math|c<rsub|0>=p<rprime|'><around*|(|\<rho\><rsub|0>|)>=A*\<gamma\>*\<rho\><rsub|0><rsup|\<gamma\>-1>>
  is the sound speed.

  <\enumerate>
    <with|font-series|bold|<item>Critical rotation with
    <math|M<rsub|0>=<sqrt|2>>.> This test has an exact solution with explicit
    formula. The solution consists of two parts: a far field solution and a
    near-field solution. The former far field solution is defined for
    <math|r\<geq\>2*t*<sqrt|p<rprime|'><around*|(|\<rho\><rsub|0>|)>>>,
    <math|r=<sqrt|x<rsup|2>+y<rsup|2>>>,

    <\equation>
      <choice|<tformat|<table|<row|<cell|U<around*|(|x,y,t|)>>|<cell|=>|<cell|<frac|1|r>*<around|(|2*t*p<rsub|0><rprime|'>*cos
      \<theta\>+<sqrt|2*p<rsub|0><rprime|'>>*<sqrt|r<rsup|2>-2*t<rsup|2>*p<rsub|0><rprime|'>>*sin
      \<theta\>|)>>>|<row|<cell|V<around*|(|x,y,t|)>>|<cell|=>|<cell|<frac|1|r>*<around|(|2*t*p<rsub|0><rprime|'>*sin
      \<theta\>-<sqrt|2*p<rsub|0><rprime|'>>*<sqrt|r<rsup|2>-2*t<rsup|2>*p<rsub|0><rprime|'>>*cos
      \<theta\>|)>>>|<row|<cell|\<rho\><around*|(|x,y,t|)>>|<cell|=>|<cell|\<rho\><rsub|0>>>|<row|<cell|p<around*|(|x,y,t|)>>|<cell|=>|<cell|A*\<rho\><rsub|0><rsup|\<gamma\>>>>>>><label|eq:mdrk.far.field.solution>
    </equation>

    and the near-field solution is defined for
    <math|r\<less\>2*t*<sqrt|p<rprime|'><around*|(|\<rho\><rsub|0>|)>>>

    <\equation*>
      U<around*|(|x,y,t|)>=<frac|x+y|2*t>,<space|1em>V<around*|(|x,y,t|)>=<frac|-x+y|2*t>,<space|1em>\<rho\><around*|(|x,y,t|)>=<frac|r<rsup|2>|8*A*t<rsup|2>>
    </equation*>

    The curl of the velocity in the near-field is

    <\equation*>
      curl<around*|(|U,V|)>=V<rsub|x>-U<rsub|y>=-<frac|1|2*t>\<neq\>0
    </equation*>

    and the solution has one-point vacuum at the origin <math|r=0>. This is
    typical hurricane-like solution that behaves highly singular,
    particularly near the origin <math|r=0>. There are two issues here
    challenging the numerical schemes: one is the presence of the vacuum
    state which examines whether a high order scheme can keep the positivity
    preserving property; the other is the rotational velocity field for
    testing whether a numerical scheme can preserve the symmetry. In this
    regime, we take <math|v<rsub|0>=10> on the computational domain
    <math|<around*|[|-1,1|]><rsup|2>> with
    <math|\<Delta\>x=\<mathLaplace\>y=1/100>. The boundary condition is given
    by the far field solution in<nbsp><eqref|eq:mdrk.far.field.solution>.

    <with|font-series|bold|<item>High-speed rotation with
    <math|M<rsub|0>\<gtr\><sqrt|2>>.> For this case, <math|v<rsub|0>=12.5>,
    so that the density goes faster to the vacuum and the fluid rotates
    severely. The physical domain is <math|<around*|[|-2,2|]><rsup|2>> and
    the grid spacing is <math|\<mathLaplace\>x=\<mathLaplace\>y=1/100>.
    Outflow boundary conditions are given on the boundaries.Because of the
    higher rotation speed, this case is tougher than the first one, and can
    be used to validate the robustness of the higher-order scheme.

    <with|font-series|bold|<item>Low-speed rotation with
    <math|M<rsub|0>\<less\><sqrt|2>>.> In this test case, we take
    <math|v<rsub|0>=7.5> making it a rotation with lower speed than the
    previous tests. The outflow boundary conditions are given as in the
    previous tests. The simulation is performed in the domain
    <math|<around*|[|-1,1|]><rsup|2>> till <math|t=0.045>.
  </enumerate>

  The density profile for the flow with critical speed are shown in
  Figure<nbsp><reference|fig:mdrk.hurricane.critical> including a comparison
  with exact solution at a line cut of <math|y=0> in
  Figure<nbsp><reference|fig:mdrk.hurricane.critical>b, showing near overlap.
  In Figure<nbsp><reference|fig:mdrk.rotational.all.speed>a, we show the line
  cut of density profile at <math|y=0> for the three rotation speeds. In
  Figure<nbsp><reference|fig:mdrk.rotational.all.speed>b, we show streamlines
  for high rotational speed, showing symmetry.

  <big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler2d/hurricane/density_pseudo.png|0.38par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/hurricane/density_critical_cut.pdf|0.52par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.hurricane.critical>|<caption-detailed|Density
  profile of rotational low density problem at critical speed (a) Pseudocolor
  plot (b) Line cut at <math|y=0> on a mesh with
  <math|\<mathLaplace\>x=\<mathLaplace\>y=1/100>.|Rotational low density
  problem at critical speed.>>

  <big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler2d/hurricane/density_cut_all.pdf|0.52par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/hurricane/streamlines.png|0.38par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:mdrk.rotational.all.speed>|<caption-detailed|Rotational
  low density problem (a) Density profile line cut at <math|y=0> for
  different rotational speeds, (b) Stream lines for high rotational
  speed.|Rotational low density problem at various speeds.>>

  <subsubsection|Two Dimensional Riemann problem>

  This test case is as described in Section<nbsp><reference|sec:2drp>. The
  simulations are performed with transmissive boundary conditions on an
  enlarged domain upto time <math|t=0.25>. The density profiles obtained from
  the MUSCL-Hancock blending scheme and <with|font-family|tt|Trixi.jl> are
  shown in Figure<nbsp><reference|fig:mdrk.rp2d>. We see that both schemes
  give similar resolution in most regions. As in LWFR scheme, the
  MUSCL-Hancock blending scheme gives better resolution of the small scale
  structures arising across the slip lines.

  <big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler2d/rp2d/old_paper/trixi.png|0.45par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/rp2d/old_paper/mdrk.png|0.45par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>|<row|<\cell>
    <image|figures/mdrk/euler2d/rp2d/old_paper/trixi_zoom.png|0.45par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/rp2d/old_paper/mdrk_zoom.png|0.45par|||>
  </cell>>|<row|<\cell>
    (c)
  </cell>|<\cell>
    (d)
  </cell>>>>><label|fig:mdrk.rp2d>|<caption-detailed|2-D Riemann problem,
  density plots of numerical solution at <math|t=0.25> for degree <math|N=3>
  on a <math|256\<times\>256> mesh (a) <verbatim|Trixi.jl>, (b) MDRK, (c)
  <verbatim|Trixi.jl> zoomed, (d) MDRK zoomed|2-D Riemann problem, MDRK.>>

  <subsubsection|Rayleigh-Taylor instability>

  The last problem is the Rayleigh-Taylor instability to test the performance
  of higher-order scheme for the conservation laws with source terms, and the
  governing equations are written as

  <\equation*>
    <pd||t>*<matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*u>>|<row|<cell|\<rho\>*v>>|<row|<cell|E>>>>>+<pd||x>*<around*|(|<tabular*|<tformat|<table|<row|<cell|\<rho\>*u>>|<row|<cell|p+\<rho\>*u<rsup|2>>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|<around*|(|E+p|)>*u>>>>>|)>+<pd||y>*<around*|(|<tabular*|<tformat|<table|<row|<cell|\<rho\>*v>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|p+\<rho\>*v<rsup|2>>>|<row|<cell|<around*|(|E+p|)>*v>>>>>|)>=<around*|(|<tabular*|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*v>>>>>|)>
  </equation*>

  The implementation of MDRK with source terms is based
  on<nbsp><cite|babbar2024generalized> where an approximate Lax-Wendroff
  procedure is also applied on the source term. The following description is
  taken from<nbsp><cite|Pan2016>. The Rayleigh-Taylor instability happens on
  the interface between fluids with different densities when an acceleration
  is directed from the heavy fluid to the light one. The instability with
  fingering nature generates bubbles of light fluid rising into the ambient
  heavy fluid and spikes of heavy fluid falling into the light fluid. The
  initial condition of this problem<nbsp><cite|Shi2003> is given as follows

  <\equation*>
    <around*|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|2,0,-0.025*a*cos<around*|(|8*\<pi\>*x|)>,2*y+1|)>,>|<cell|<space|1em>>|<cell|y\<leq\>0.5,>>|<row|<cell|<around*|(|1,0,-0.025*a*cos<around*|(|8*\<pi\>*x|)>,y+1.5|)>,>|<cell|>|<cell|y\<gtr\>0.5>>>>>
  </equation*>

  where <math|a=<sqrt|\<gamma\>*p/\<rho\>>> is the sound speed and
  <math|\<gamma\>=5/3>. The computational domain is
  <math|[0,0.25]\<times\>[0,1]>. The reflecting boundary conditions are
  imposed for the left and right boundaries. At the top boundary, the flow
  variables are set as <math|(\<rho\>,u,v,p)=(1,0,0,2.5)>. At the bottom
  boundary, they are <math|(\<rho\>,u,v,p)=(2,0,0,1)>. The uniform mesh with
  <math|64\<times\>256> elements is used in the simulation. The density
  distributions at <math|t = 1.5,1.75, 2, 2.25, \ 2.5> are presented in
  Figure<nbsp><reference|fig:mdrk.rayleigh.taylor>. It is a test to check the
  suitability of higher-order schemes for the capturing of interface
  instabilities.

  <\big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|2|2|4|4|cell-halign|c>|<cwith|2|2|5|5|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|5>|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|3|3|cell-halign|c>|<cwith|3|3|4|4|cell-halign|c>|<cwith|3|3|5|5|cell-halign|c>|<table|<row|<\cell>
    <image|figures/mdrk/euler2d/rayleigh_taylor/colour_bar.pdf|0.7par|||>
  </cell>|<\cell>
    \;
  </cell>|<\cell>
    \;
  </cell>|<\cell>
    \;
  </cell>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <image|figures/mdrk/euler2d/rayleigh_taylor/t1p25.png|0.17par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/rayleigh_taylor/t1p5.png|0.17par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/rayleigh_taylor/t1p75.png|0.17par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/rayleigh_taylor/t2.png|0.17par|||>
  </cell>|<\cell>
    <image|figures/mdrk/euler2d/rayleigh_taylor/t2p5.png|0.17par|||>
  </cell>>|<row|<\cell>
    (a) <math|t=1.5>
  </cell>|<\cell>
    (b) <math|t=1.75>
  </cell>|<\cell>
    (c) <math|t=2>
  </cell>|<\cell>
    (d) <math|t=2.25>
  </cell>|<\cell>
    (e) <math|t=2.5>
  </cell>>>>><label|fig:mdrk.rayleigh.taylor>>
    <caption-detailed|Rayleigh-Taylor instability on a <math|64\<times\>256>
    mesh|Rayleigh-Taylor instability.>
  </big-figure>

  <section|Summary and conclusions><label|sec:mdrk.conclusion>

  This chapter introduces fourth order multiderivative Runge-Kutta (MDRK)
  scheme of<nbsp><cite|li2016> in the conservative, quadrature free Flux
  Reconstruction framework to solve hyperbolic conservation laws. The idea is
  to cast each MDRK stage as an evolution involving a time average flux which
  is approximated by the Jacobian free Approximate Lax-Wendroff procedure.
  The numerical flux is carefully computed with accuracy and stability in
  mind. In particular, the D2 dissipation and <evaluate> flux of
  Chapter<nbsp><reference|ch:lwfr> have been introduced which enhance stable
  CFL numbers and accuracy for nonlinear problems respectively. The stable
  CFL numbers are computed using Fourier stability analysis for two commonly
  used correction functions <math|g<rsub|Radau>> and <math|g<rsub|2>>,
  showing the improved CFL numbers. Convergence analysis for non-linear
  problems was performed which revealed that optimal convergence rates were
  only shown when using the <evaluate> flux. The shock capturing blending
  scheme of Chapter<nbsp><reference|ch:lw.subcell.limiter> has also been
  introduced for the MDRK scheme applied at each stage. The scheme is
  provably admissibility preserving and good at capturing small scale
  structures. The claims are validated by numerical experiments for
  compressible Euler's equations with the modern test
  suite<nbsp><cite|Pan2016> of high order methods.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|6>
    <associate|font-base-size|12>
    <associate|info-flag|short>
    <associate|page-even|1in>
    <associate|page-first|142>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|section-nr|5>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|7|143>>
    <associate|auto-10|<tuple|7.3|148>>
    <associate|auto-11|<tuple|7.3.1|149>>
    <associate|auto-12|<tuple|7.3.2|149>>
    <associate|auto-13|<tuple|7.1|151>>
    <associate|auto-14|<tuple|7.4|151>>
    <associate|auto-15|<tuple|7.5|153>>
    <associate|auto-16|<tuple|7.5.1|153>>
    <associate|auto-17|<tuple|7.5.1.1|153>>
    <associate|auto-18|<tuple|7.1|154>>
    <associate|auto-19|<tuple|7.5.1.2|154>>
    <associate|auto-2|<tuple|7.1|143>>
    <associate|auto-20|<tuple|7.2|154>>
    <associate|auto-21|<tuple|7.5.1.3|155>>
    <associate|auto-22|<tuple|7.3|155>>
    <associate|auto-23|<tuple|7.4|155>>
    <associate|auto-24|<tuple|7.5.2|155>>
    <associate|auto-25|<tuple|7.5.2.1|156>>
    <associate|auto-26|<tuple|7.5|156>>
    <associate|auto-27|<tuple|7.5.2.2|156>>
    <associate|auto-28|<tuple|7.6|157>>
    <associate|auto-29|<tuple|7.5.2.3|157>>
    <associate|auto-3|<tuple|7.2|144>>
    <associate|auto-30|<tuple|7.7|158>>
    <associate|auto-31|<tuple|7.5.2.4|158>>
    <associate|auto-32|<tuple|7.8|158>>
    <associate|auto-33|<tuple|7.5.3|158>>
    <associate|auto-34|<tuple|7.5.3.1|159>>
    <associate|auto-35|<tuple|7.9|159>>
    <associate|auto-36|<tuple|7.5.3.2|159>>
    <associate|auto-37|<tuple|7.10|161>>
    <associate|auto-38|<tuple|7.11|161>>
    <associate|auto-39|<tuple|7.5.3.3|161>>
    <associate|auto-4|<tuple|7.2.1|145>>
    <associate|auto-40|<tuple|7.12|162>>
    <associate|auto-41|<tuple|7.5.3.4|162>>
    <associate|auto-42|<tuple|7.13|163>>
    <associate|auto-43|<tuple|7.6|163>>
    <associate|auto-5|<tuple|7.2.2|145>>
    <associate|auto-6|<tuple|7.2.3|146>>
    <associate|auto-7|<tuple|7.2.4|147>>
    <associate|auto-8|<tuple|7.2.5|147>>
    <associate|auto-9|<tuple|7.2.6|148>>
    <associate|ch:mdrk|<tuple|7|143>>
    <associate|eq:mdrk.2stage.update.eqn|<tuple|7.13|149>>
    <associate|eq:mdrk.A.star.defn|<tuple|7.16|149>>
    <associate|eq:mdrk.A0A1.matrices|<tuple|7.14|149>>
    <associate|eq:mdrk.Fblend|<tuple|7.24|153>>
    <associate|eq:mdrk.blended.scheme|<tuple|7.21|151>>
    <associate|eq:mdrk.f2.defn|<tuple|7.5|144>>
    <associate|eq:mdrk.far.field.solution|<tuple|7.25|160>>
    <associate|eq:mdrk.ho.method|<tuple|7.19|151>>
    <associate|eq:mdrk.intro.us.evolution|<tuple|7.1|143>>
    <associate|eq:mdrk.lo.method|<tuple|7.20|151>>
    <associate|eq:mdrk.low.order.cell.avg.update|<tuple|7.23|152>>
    <associate|eq:mdrk.low.order.update|<tuple|7.22|152>>
    <associate|eq:mdrk.mdrk.first.stage|<tuple|7.2|144>>
    <associate|eq:mdrk.mdrk.second.stage|<tuple|7.3|144>>
    <associate|eq:mdrk.nfdiss1|<tuple|7.10|147>>
    <associate|eq:mdrk.nfdiss2|<tuple|7.11|147>>
    <associate|eq:mdrk.tavgsol|<tuple|7.12|147>>
    <associate|eq:mdrk.uplwfr|<tuple|7.6|144>>
    <associate|eq:mdrk.upmean|<tuple|7.8|145>>
    <associate|eq:mdrk.us.fourier|<tuple|7.15|149>>
    <associate|eq:ode.L|<tuple|7.2|144>>
    <associate|fig:mdrk.blast|<tuple|7.5|156>>
    <associate|fig:mdrk.burg1|<tuple|7.3|155>>
    <associate|fig:mdrk.burg2|<tuple|7.4|155>>
    <associate|fig:mdrk.cla1|<tuple|7.1|154>>
    <associate|fig:mdrk.dmr|<tuple|7.9|159>>
    <associate|fig:mdrk.high.density|<tuple|7.7|158>>
    <associate|fig:mdrk.hurricane.critical|<tuple|7.10|161>>
    <associate|fig:mdrk.rayleigh.taylor|<tuple|7.13|163>>
    <associate|fig:mdrk.rotational.all.speed|<tuple|7.11|161>>
    <associate|fig:mdrk.rp2d|<tuple|7.12|162>>
    <associate|fig:mdrk.sedov.blast|<tuple|7.8|158>>
    <associate|fig:mdrk.titarev.toro|<tuple|7.6|157>>
    <associate|fig:mdrk.vla2|<tuple|7.2|154>>
    <associate|sec:mdrk|<tuple|7.2|144>>
    <associate|sec:mdrk.ae|<tuple|7.2.5|147>>
    <associate|sec:mdrk.alw|<tuple|7.2.3|146>>
    <associate|sec:mdrk.blending|<tuple|7.4|151>>
    <associate|sec:mdrk.cla|<tuple|7.5.1.1|153>>
    <associate|sec:mdrk.conclusion|<tuple|7.6|163>>
    <associate|sec:mdrk.ea|<tuple|7.2.6|148>>
    <associate|sec:mdrk.fourier|<tuple|7.3|148>>
    <associate|sec:mdrk.num|<tuple|7.5|153>>
    <associate|sec:mdrk.numflux|<tuple|7.2.4|147>>
    <associate|sec:mdrk.reconstruction|<tuple|7.2.2|145>>
    <associate|sec:mdrk.res1dsys|<tuple|7.5.2|155>>
    <associate|tab:mdrk.cfl|<tuple|7.1|151>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Seal2013

      li2016

      Pan2016

      obrechkoff1940neue

      Seal2013

      Shu1989

      cockburn2000

      li2016

      li2016

      Qiu2005b

      Rusanov1962

      Zhang2010b

      Pan2016

      Spiteri2002

      Gassner2011a

      Huynh2007

      Grazia2014

      Qiu2005b

      Titarev2004

      Tang2006

      babbar2023admissibility

      babbar2024generalized

      babbar2023admissibility

      hennemann2021

      Ranocha2022

      Pan2016

      Zhang1997

      babbar2024generalized

      Pan2016

      Shi2003

      li2016

      Pan2016
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.1>|>
        Convergence for constant advection, MDRK and RK.
      </surround>|<pageref|auto-18>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.2>|>
        Convergence for variable advection with
        <with|mode|<quote|math>|a<around*|(|x|)>=x<rsup|2>>, MDRK and RK.
      </surround>|<pageref|auto-20>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.3>|>
        1-D Burgers' equation, <with|font-series|<quote|bold>|AE> and
        <with|font-series|<quote|bold>|EA> schemes, MDRK and RK.
      </surround>|<pageref|auto-22>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.4>|>
        MDRK D1 and D2 dissipation for 1-D Burgers' equation.
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.5>|>
        Blast wave, comparing TVB and blending schemes for MDRK.
      </surround>|<pageref|auto-26>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.6>|>
        Titarev-Toro problem, comparing blending schemes for MDRK.
      </surround>|<pageref|auto-28>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.7>|>
        High density problem, comparing blending schemes for MDRK.
      </surround>|<pageref|auto-30>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.8>|>
        Sedov's blast wave problem, comparing TVB and blending schemes for
        MDRK.
      </surround>|<pageref|auto-32>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.9>|>
        Double Mach reflection problem, MDRK.
      </surround>|<pageref|auto-35>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.10>|>
        Rotational low density problem at critical speed.
      </surround>|<pageref|auto-37>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.11>|>
        Rotational low density problem at various speeds.
      </surround>|<pageref|auto-38>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.12>|>
        2-D Riemann problem, MDRK.
      </surround>|<pageref|auto-40>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.13>|>
        Rayleigh-Taylor instability.
      </surround>|<pageref|auto-42>>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|7.1>||CFL numbers for
      MDRK scheme.>|<pageref|auto-13>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|7.<space|2spc>Multi-derivative
      Runge-Kutta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      7.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      7.2.<space|2spc>Multi-derivative Runge-Kutta FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <with|par-left|<quote|1tab>|7.2.1.<space|2spc>Conservation property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|7.2.2.<space|2spc>Reconstruction of the
      time average flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|7.2.3.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|7.2.4.<space|2spc>Numerical flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|7.2.5.<space|2spc>Numerical flux \U average
      and extrapolate to face (AE) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|7.2.6.<space|2spc>Numerical flux \U
      extrapolate to face and average (EA)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      7.3.<space|2spc>Fourier stability analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|7.3.1.<space|2spc>Stage 1
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|7.3.2.<space|2spc>Stage 2
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      7.4.<space|2spc>Blending scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      7.5.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      <with|par-left|<quote|1tab>|7.5.1.<space|2spc>Scalar equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|2tab>|7.5.1.1.<space|2spc>Linear advection
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|2tab>|7.5.1.2.<space|2spc>Variable advection
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|2tab>|7.5.1.3.<space|2spc>Burgers' equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|1tab>|7.5.2.<space|2spc>1-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>>

      <with|par-left|<quote|2tab>|7.5.2.1.<space|2spc>Blast
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|2tab>|7.5.2.2.<space|2spc>Titarev Toro
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|2tab>|7.5.2.3.<space|2spc>Large density ratio
      Riemann problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      <with|par-left|<quote|2tab>|7.5.2.4.<space|2spc>Sedov's blast
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>

      <with|par-left|<quote|1tab>|7.5.3.<space|2spc>2-D Euler's equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|2tab>|7.5.3.1.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|2tab>|7.5.3.2.<space|2spc>Rotational low density
      problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|2tab>|7.5.3.3.<space|2spc>Two Dimensional Riemann
      problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|2tab>|7.5.3.4.<space|2spc>Rayleigh-Taylor
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      7.6.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>
    </associate>
  </collection>
</auxiliary>