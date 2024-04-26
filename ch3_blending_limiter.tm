<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    <assign|correction|<macro|1|<with|color|red|<arg|1>>>>
  </hide-preamble>

  <chapter|Admissibility preserving subcell based blending
  limiter><label|ch:lw.subcell.limiter>

  <section|Introduction>

  In this chapter, we develop a subcell based blending limiter for
  Lax-Wendroff Flux Reconstruction (LWFR) motivated by the work
  of<nbsp><cite|hennemann2021>. The idea is to break each element into
  subcells and construct a robust low order method on the subcells. A
  smoothness indicator is then used to blend the high order LWFR scheme with
  the low order scheme, getting a robust limited scheme. In the development
  of the blending scheme for LWFR, special attention has been paid to improve
  accuracy and obtain provable admissibility preservation. In contrast
  to<nbsp><cite|hennemann2021>, we use Gauss-Legendre solution points because
  of their accuracy benefit known in the literature and also observed by us
  in Chapter<nbsp><reference|ch:lwfr>. The low order scheme on subcells is a
  finite volume method. A natural choice is to use a first order finite
  volume method, but to enhance accuracy we develop a MUSCL-Hancock scheme on
  the subcells. \ For admissibility preservation, we exploit the subcell
  structure of the blending scheme to develop a problem independent flux
  limiter that guarantees admissibility preservation in means.

  In Section<nbsp><reference|sec:blend.review>, we formalize the concept of
  admissibility of a physical and numerical (FR) solution of hyperbolic
  conservation laws<nbsp><eqref|eq:con.law>. In
  Section<nbsp><reference|sec:controlling.oscillations>, we explain the
  blending limiter including a review of the smoothness indicator used
  in<nbsp><cite|hennemann2021> and then MUSCL-Hancock reconstruction
  performed on the subcells in Section<nbsp><reference|sec:mh>. Maintaining
  conservation requires that at the faces of FR elements, both the lower and
  high order schemes must use the same numerical flux (see
  Remark<nbsp><reference|rmk:why.same.flux>). In
  Section<nbsp><reference|sec:admissibility.preservation>, we show how to
  construct the numerical flux to ensure admissibility preservation in means.
  In Section<nbsp><reference|sec:alg>, we explain our implementation of the
  Lax-Wendroff blended scheme as an algorithm. The numerical results
  verifying accuracy and robustness of our scheme with 1-D and 2-D
  compressible Euler equations are shown in
  Sections<nbsp><reference|sec:num.results.chblend>,<nbsp><reference|eq:numresults.2dadv>,<nbsp><reference|sec:numresults.2d.euler>.
  Section<nbsp><reference|sec:sum.blend> gives a summary of the proposed
  blended scheme.

  <section|Admissibility preservation><label|sec:blend.review>

  The solution <math|<value|uu>\<in\><re><rsup|p>> of the conservation
  law<nbsp><eqref|eq:con.law> that is physically correct is assumed to belong
  to an admissible set, denoted by <math|<Uad>>. For example in case of
  compressible flows, the density and pressure (or internal energy) must
  remain positive. In case of shallow water equations, the water depth must
  remain positive. In most of the models that are of interest, the admissible
  set is a convex subset of <math|<re><rsup|p>>, and can be written as

  <\equation>
    <label|eq:uad.form><Uad>=<around|{|<value|uu>\<in\><re><rsup|p>:<value|ad><rsub|k><around|(|<value|bw>|)>\<gtr\>0,1\<le\>k\<le\>K|}>
  </equation>

  Moreover, in most cases, the admissibility constraints
  <math|<value|ad><rsub|k>> are concave functions of the conservative
  variables. In particular, we may have concavity of
  <math|<value|ad><rsub|k>> if <math|<value|ad><rsub|j>\<gtr\>0> for all
  <math|j\<less\>k>. For Euler's equations, <math|K=2> and
  <math|<value|ad><rsub|1>,<value|ad><rsub|2>> are density, pressure
  functions respectively; if the density is positive then pressure is a
  concave function of the conserved variables. This structure simplifies the
  slope and flux limiting steps to enforce
  admissibility<nbsp>(Section<nbsp><reference|sec:slope.limiting>,<nbsp><reference|sec:admissibility.preservation>)
  and was assumed in<nbsp><cite|babbar2023admissibility>. However, there are
  models of interest where the admissibility constraints are not concave
  functions of the conservative variables, like ten moment equations which
  are considered in Chapter<nbsp><reference|ch:10mom>. For those models, our
  admissibility enforcing procedure will instead use the following weaker
  assumption

  <\equation>
    <label|eq:weak.convexity><value|ad><rsub|j><around*|(|<value|uu><rsub|a>|)>,<value|ad><rsub|j><around*|(|<value|uu><rsub|b>|)>\<gtr\>0,<space|1.0spc>
    \<forall\> j\<leq\>k<space|2em>\<Longrightarrow\><space|2em><value|ad><rsub|j><around*|(|\<theta\>*<value|uu><rsub|a>+<around*|(|1-\<theta\>|)>*<value|uu><rsub|b>|)>\<gtr\>\<epsilon\><rsub|j><around*|(|<value|uu><rsub|a>,<value|uu><rsub|b>|)>,<space|1em>\<forall\>j\<leq\>k
  </equation>

  In case of the Ten moment problem, <math|\<epsilon\><rsub|3><around*|(|<value|uu><rsub|a>,<value|uu><rsub|b>|)>=<frac|1|2>*min<around*|(|<value|ad><rsub|3><around*|(|<value|uu><rsub|a>|)>,<value|ad><rsub|3><around*|(|<value|uu><rsub|b>|)>|)>><nbsp>(see
  (2.9) of <cite|Meena_Kumar_Chandrashekar_2017>). Thus, although the
  numerical experiments in this chapter are performed on Compressible Euler's
  equations<nbsp><eqref|eq:2deuler>, we also discuss admissibility
  preservation in case the admissibility constraints
  <math|<value|ad><rsub|k>> are not concave functions of the conservative
  variables.

  The high order Lax-Wendroff Flux Reconstruction scheme to solve the
  conservation law<nbsp><eqref|eq:con.law> is as described in
  Chapter<nbsp><reference|ch:lwfr>. In particular, we use the discrete scheme
  described in Section<nbsp><reference|sec:lw> with the time averaged
  numerical flux constructed using the D2 dissipation and <evaluate> flux
  described in Section<nbsp><reference|sec:numflux>. We define the element
  mean value of the numerical solution <math|<around*|{|<value|uu><rsub|e,p>|}>><nbsp><eqref|eq:num.soln>
  as

  <\equation*>
    <au><rsub|e>=<big|sum><rsub|p=0><rsup|N><value|uep>*w<rsub|p>
  </equation*>

  where <math|w<rsub|p>> are the weights associated to the solution
  points<nbsp><eqref|eq:soln.points>. Then, looking at the LWFR
  update<nbsp><eqref|eq:uplwfr>, it is easy to show that the scheme is
  conservative in the sense that

  <\equation>
    <label|eq:fravgup><au><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>
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
      <value|uep><rsup|n>\<in\><Uad><space|1em>\<forall\>e,p<space|2em>\<Longrightarrow\><space|2em><value|uep><rsup|n+1>\<in\><Uad><space|1em>\<forall\>e,p
    </equation*>

    where <math|<Uad>> is the admissible set of the conservation law.
  </definition>

  To obtain an admissibility preserving scheme, we exploit the weaker
  admissibility preservation in means property defined as

  <\definition>
    <label|defn:mean.pres>The flux reconstruction scheme is said to be
    admissibility preserving in the means if

    <\equation*>
      <value|uep><rsup|n>\<in\><Uad><space|1em>\<forall\>e,p<space|2em>\<Longrightarrow\><space|2em><au><rsub|e><rsup|n+1>\<in\><Uad><space|1em>\<forall\>e
    </equation*>

    where <math|<Uad>> is the admissible set of the conservation law.
  </definition>

  The focus of this chapter is to obtain the admissibility preservation in
  means property for the Lax-Wendroff Flux Reconstruction scheme. Once the
  scheme is admissibility preserving in means, the scaling limiter
  of<nbsp><cite|zhang2010c> can be used to obtain an admissibility preserving
  scheme in the sense of Definition<nbsp><reference|defn:adm.pres>.

  <section|On controlling oscillations><label|sec:controlling.oscillations>

  High order methods for hyperbolic problems necessarily produce Gibbs
  oscillations at discontinuities. In particular, it was shown by
  Godunov<nbsp><cite|godunov1959> that an oscillation free
  <with|font-shape|italic|linear scheme> can be atmost first order accurate.
  The cure is to make the schemes to be non-linear even in the case of linear
  equations. For one dimensional problems, total variation diminishing
  approach provides a framework to construct non-oscillatory schemes. This is
  achieved by incorporating some non-linear limiting strategy into the scheme
  which locally reduces the order of the scheme when a discontinuity is
  detected. In discontinuous Galerkin type methods, the limiting is performed
  by modifying the solution in each element so as to ensure a TVD property
  for the element means, which was a strategy introduced by Cockburn and
  Shu<nbsp><cite|Cockburn1991|Cockburn1989a> and used in
  Chapter<nbsp><reference|ch:lwfr>, as described in
  Section<nbsp><reference|sec:lim>. In this chapter, we introduce the
  blending scheme, motivated and described in
  Section<nbsp><reference|sec:blending.scheme>.

  <subsection|Blending scheme><label|sec:blending.scheme>

  In Chapter<nbsp><reference|ch:lwfr>, TVD-type limiters
  of<nbsp><cite|Cockburn1991|Cockburn1989a> for DG methods were used. These
  limiters lose a lot of information when the limiter is active, since the
  polynomial solution of degree <math|N> is replaced either by a solution of
  degree 1 or a constant solution if a strong discontinuity is detected in an
  element. This is especially problematic near smooth extrema which may be
  wrongly detected as a discontinuity. It would be desirable to use more
  information inside each element while applying some limiting process. Let
  us write the LWFR update equation<nbsp><eqref|eq:uplwfr> as

  <\equation*>
    <vu><rsup|H,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vR><rsup|H><rsub|e>
  </equation*>

  where <math|<vu><rsub|e>> is the vector of nodal values in the element.
  Suppose we also have a lower order and non-oscillatory scheme available to
  us in the form

  <\equation>
    <vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vR><rsup|L><rsub|e><label|eq:low.order.high.level>
  </equation>

  Then a blended scheme is given by

  <\equation>
    <vu><rsup|n+1><rsub|e>=<around|(|1-\<alpha\><rsub|e>|)>*<vu><rsup|H,n+1><rsub|e>+\<alpha\><rsub|e>*<vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|[|<around|(|1-\<alpha\><rsub|e>|)>*<vR><rsup|H><rsub|e>+\<alpha\><rsub|e>*<vR><rsup|L><rsub|e>|]><label|eq:blended.scheme>
  </equation>

  where <math|\<alpha\><rsub|e>\<in\><around|[|0,1|]>> must be chosen based
  on some local smoothness indicator. If <math|\<alpha\><rsub|e>=0> then we
  obtain the high order LWFR scheme, while if <math|\<alpha\><rsub|e>=1> then
  the scheme becomes the low order scheme that is less oscillatory. In
  subsequent sections, we explain the details of the lower order scheme and
  the design of smoothness indicators. The lower order scheme will either be
  a first order finite volume scheme<nbsp>(Section<nbsp><reference|sec:fo>)
  or a high resolution scheme based on MUSCL-Hancock
  idea<nbsp>(Section<nbsp><reference|sec:mh>). In either case, the common
  structure of the low order scheme can be explained as follows.

  <\big-figure>
    <padded-center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|illustrations/subcells_fvm_gl.pdf|0.9par|||>>>|<row|<cell|(a)>>|<row|<cell|<image|illustrations/subcells_fvm_gll.pdf|0.9par|||>>>|<row|<cell|(b)>>>>><label|fig:subcells>>
  </big-figure|<caption-detailed|Subcells used by lower order scheme for
  degree <math|N=4> using (a) Gauss-Legendre (GL) solution points, (b)
  Gauss-Legendre-Lobatto (GLL) solution points|Subcells used by lower order
  scheme for degree <math|N=4>.>>

  Let us subdivide each element <math|\<Omega\><rsub|e>> into <math|N+1>
  subcells associated to the solution points
  <math|<around|{|<value|xep>,p=0,1,\<ldots\>,N|}>> of the LWFR scheme. Thus,
  we will have <math|N+2> subfaces denoted by
  <math|<around|{|x<rsup|e><rsub|<value|pph>>,p=-1,0,\<ldots\>,N|}>> with
  <math|x<rsup|e><rsub|-<half>>=x<rsub|<emh>>> and
  <math|x<rsup|e><rsub|<Nph>>=x<rsub|<eph>>>. For maintaining a conservative
  scheme, the <math|p<rsup|th>> subcell is chosen so that

  <\equation>
    <label|eq:subcell.defn>x<rsub|<value|pph>><rsup|e>-x<rsub|<value|pmh>><rsup|e>=w<rsub|p>*\<Delta\>x<rsub|e>,<space|2em>0\<le\>p\<le\>N
  </equation>

  where <math|w<rsub|p>> is the <math|p<rsup|th>> quadrature weight
  associated with the solution points. Figure<nbsp><reference|fig:subcells>
  gives an illustration of the subcells for degree <math|N=4> case. The low
  order scheme is obtained by updating the solution in each of the subcells
  by a finite volume scheme,

  <\equation>
    <tabular|<tformat|<cwith|3|3|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<value|uu><rsub|e,0><rsup|L,n+1>>|<cell|=>|<cell|<value|uez><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e>>*<around|[|<value|pf><rsub|<half>><rsup|e>-<value|F><rsub|<emh>>|]>>>|<row|<cell|<value|uu><rsub|e,p><rsup|L,n+1>>|<cell|=>|<cell|<value|uep><rsup|n>-<frac|\<Delta\>t|w<rsub|p>*\<Delta\>x<rsub|e>>*<around|[|<value|pf><rsub|<value|pph>><rsup|e>-<value|pf><rsub|<value|pmh>><rsup|e>|]>,<space|2em>1\<le\>p\<le\>N-1>>|<row|<cell|<value|uu><rsub|e,N><rsup|L,n+1>>|<cell|=>|<cell|<value|ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|[|<value|F><rsub|<eph>>-<value|pf><rsub|<Nmh>><rsup|e>|]>>>>>><label|eq:low.order.update>
  </equation>

  The inter-element fluxes <math|<value|F><rsub|<eph>>> used in the low order
  scheme are same as those used in the high order LWFR scheme in
  equation<nbsp><eqref|eq:frcontflux>. The lower order fluxes
  <math|<value|pf><rsub|<value|pph>><rsup|e>> will be taken to be
  admissibility preserving finite volume fluxes
  (Definition<nbsp><reference|defn:admissible.fvm>). The element mean value
  obtained by the low order scheme satisfies

  <\equation>
    <label|eq:low.order.cell.avg.update><au><rsub|e><rsup|L,n+1>=<big|sum><rsub|p=0><rsup|N><value|uep><rsup|L,n+1>*w<rsub|p>=<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>
  </equation>

  which is identical to the update equation by the LWFR scheme given in
  equation<nbsp><eqref|eq:fravgup>. The element mean in the blended scheme
  evolves according to

  <\equation>
    <tabular|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<au><rsub|e><rsup|n+1>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<around|(|<au><rsub|e>|)><rsup|H,n+1>+\<alpha\><rsub|e>*<around|(|<au><rsub|e>|)><rsup|L,n+1>>>|<row|<cell|>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e>|)>*<around*|[|<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>|]>+\<alpha\><rsub|e>*<around*|[|<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|F><rsub|<emh>>|)>>>>>><label|eq:conservation.blending.scheme>
  </equation>

  and hence the blended scheme is also conservative; all three schemes, i.e.,
  lower order, LWFR and the blended scheme, predict the same mean value.

  The inter-element flux <math|<value|F><rsub|<eph>>> is used both in the low
  and high order schemes. To achieve high order accuracy in smooth regions,
  this flux needs to be high order accurate, however it may produce numerical
  oscillations near discontinuities when used in the low order scheme. A
  natural choice to balance accuracy and spurious oscillations is to take

  <\equation>
    <label|eq:Fblend><value|F><rsub|<eph>>=<around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsub|<eph>><rsup|LW>+\<alpha\><rsub|<eph>>*<value|pf><rsub|<eph>>,<space|2em>\<alpha\><rsub|<eph>>\<in\><around|[|0,1|]>
  </equation>

  where <math|<value|F><rsub|<eph>><rsup|LW>> is the high order inter-element
  time-averaged numerical flux of the LWFR scheme<nbsp><eqref|eq:frcontflux>
  and <math|<value|pf><rsub|<eph>>> is a admissibility preserving low order
  flux (Definition<nbsp><reference|defn:admissible.fvm>) at the face
  <math|x<rsub|<eph>>> shared between FR elements and
  subcells<nbsp>(<reference|eq:fo.at.face>,<nbsp><reference|eq:mh.at.face>).
  The blending coefficient <math|\<alpha\><rsub|<eph>>> will be based on a
  local smoothness indicator which will bias the flux towards the lower order
  flux <math|<value|pf><rsub|<eph>>> near regions of lower solution
  smoothness. However, to enforce admissibility in means
  (Definition<nbsp><reference|defn:mean.pres>), the flux has to be further
  corrected, as explained in Section<nbsp><reference|sec:admissibility.preservation>.

  <\remark>
    <label|rmk:why.same.flux>

    <\enumerate-alpha>
      <item>It is essential to use the same inter-element flux in both the
      low and high order schemes in order to have conservation. Suppose we
      use numerical fluxes <math|<value|F><rsub|<eph>><rsup|L>,<value|F><rsub|<eph>><rsup|H>>
      in the low and high order schemes, respectively; then the element mean
      in the blended scheme will become

      <\equation*>
        <au><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|[|<around|(|<around|(|1-\<alpha\><rsub|e>|)>*<value|F><rsub|<eph>><rsup|H>+\<alpha\><rsub|e>*<value|F><rsub|<eph>><rsup|L>|)>-<around|(|<around|(|1-\<alpha\><rsub|e>|)>*<value|F><rsub|<emh>><rsup|H>+\<alpha\><rsub|e>*<value|F><rsub|<emh>><rsup|L>|)>|]>
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

      <item>The contribution to <math|<value|VR><rsup|L><rsub|e>,<value|VR><rsup|H><rsub|e>>
      of the flux <math|<value|F><rsub|<eph>>> has coefficients given by
      <math|<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>,<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*g<rsub|R><rprime|'><around*|(|\<xi\><rsub|N>|)>>
      respectively, as can be seen from<nbsp>(<reference|eq:low.order.update>,<nbsp><reference|eq:curved.lwfr.update.curvilinear>).
      If we use <math|g<rsub|2>> correction functions with
      Gauss-Legendre-Lobatto solution points, we have
      from<nbsp><eqref|eq:corr.expressions>,
      <math|g<rsub|R><rprime|'><around*|(|\<xi\><rsub|N>|)>=\<ell\><rsub|N><around*|(|1|)>/w<rsub|N>=1/w<rsub|N>>.
      Thus, the coefficient is the same for both higher and lower order
      residuals and we add the contribution without a blending coefficient.
      This is different from the case of Gauss-Legendre solution points where
      the coefficients disagree as <math|1/w<rsub|N>\<neq\>\<ell\><rsub|N><around*|(|1|)>/w<rsub|N>=g<rsub|R><rprime|'><around*|(|\<xi\><rsub|N>|)>><nbsp><eqref|eq:corr.expressions>.
    </enumerate-alpha>
  </remark>

  <subsection|Smoothness indicator><label|sec:smooth.ind>

  The numerical approximation of the PDE solution is in the form of piecewise
  polynomials of degree <math|N>. The polynomial can be written in terms of
  an orthogonal basis like Legendre polynomials. The smoothness of the
  solution can be assessed by analyzing the decay of the coefficients of the
  orthogonal expansion, a technique originally proposed by Persson and
  Peraire<nbsp><cite|Persson2006> and subsequently refined by Klöckner et
  al.<nbsp><cite|klockner2011> and Henemann et al.<nbsp><cite|hennemann2021>.
  For a scalar problem, the solution <math|<value|uu>> itself can be used to
  design a smoothness indicator. For a system of PDE, we can use any one or
  all components of the solution vector. Alternatively, some derived quantity
  that can indicate the smoothness of all solution components can be chosen.
  For the Euler equations, a good choice seems to be the product of density
  and pressure<nbsp><cite|hennemann2021>.

  Let <math|q=q<around|(|<value|uu>|)>> be the quantity used to measure the
  solution smoothness. We first project this onto Legendre polynomials,

  <\equation*>
    q<rsub|h><around|(|\<xi\>|)>=<big|sum><rsub|j=0><rsup|N><wide|q|^><rsub|j>*L<rsub|j><around|(|2*\<xi\>-1|)>,<space|1em>\<xi\>\<in\><around|[|0,1|]>,<space|2em><wide|q|^><rsub|j>=<big|int><rsub|0><rsup|1>q<around|(|<value|uu><rsub|h><around|(|\<xi\>|)>|)>*L<rsub|j><around|(|2*\<xi\>-1|)>*<ud>\<xi\>
  </equation*>

  The Legendre coefficients <math|<wide|q|^><rsub|j>> are computed using the
  quadrature induced by the solution points,

  <\equation*>
    <wide|q|^><rsub|j>=<big|sum><rsub|q=0><rsup|N>q<around|(|<value|ueq>|)>*L<rsub|j>*<around|(|2*\<xi\><rsub|q>-1|)>*w<rsub|q>
  </equation*>

  Then the energy contained in the highest modes relative to the total energy
  of the polynomial is computed as follows,

  <\equation>
    <en>=max <around*|(|<frac|<wide|q|^><rsub|N-1><rsup|2>|<big|sum><rsub|j=0><rsup|N-1><wide|q|^><rsub|j><rsup|2>>,<frac|<wide|q|^><rsub|N><rsup|2>|<big|sum><rsub|j=0><rsup|N><wide|q|^><rsub|j><rsup|2>>|)><label|eq:1d.smoothness.E>
  </equation>

  The <math|N<rsup|th>> Legendre coefficient <math|<wide|q|^><rsub|N>> of a
  function which is in the Sobolev space <math|H<rsup|2>> decays as
  <math|O<around|(|1/N<rsup|2>|)>> (see Chapter 5, Section 5.4.2
  of<nbsp><cite|Canuto2007>). We consider smooth functions to be those whose
  Legendre coefficients <math|<wide|q|^><rsub|N>> decay at rate proportional
  to <math|1/N<rsup|2>> or faster so that their squares decay proportional to
  <math|1/N<rsup|4>><nbsp><cite|Persson2006> or faster. Thus, the following
  dimensionless threshold for smoothness is proposed
  in<nbsp><cite|hennemann2021>

  <\equation*>
    <thresh><around|(|N|)>=a\<cdot\>10<rsup|-c*<around|(|N+1|)><rsup|\<nosymbol\>*4>>
  </equation*>

  where parameters <math|a=<half>> and <math|c=1.8> are obtained through
  numerical experiments. To convert the highest mode energy indicator
  <math|<en>> and threshold value <math|<thresh>> into a value in
  <math|<around|[|0,1|]>>, the logistic function
  (Figure<nbsp><reference|fig:alpha.func>) is used

  <\equation*>
    <wide|\<alpha\>|~><around|(|<en>|)>=<frac|1|1+exp
    <around|(|-<frac|s|<thresh>>*<around|(|<en>-<thresh>|)>|)>>
  </equation*>

  <\big-figure>
    <padded-center|<image|illustrations/alpha_func|0.5par|||><label|fig:alpha.func>>
  </big-figure|<caption-detailed|Logistic function used to map energy to a
  smoothness coefficient <math|\<alpha\>\<in\><around|[|0,1|]>> shown for
  various solution polynomial degrees <math|N>.|Logistic function used to map
  energy to a smoothness coefficient <math|\<alpha\>\<in\><around|[|0,1|]>>.>>

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

  with <math|\<alpha\><rsub|min>=0.001>. Finally, since shocks can spread to
  the neighbouring cells as time advances, some smoothening of
  <math|\<alpha\>> is performed as

  <\equation>
    \<alpha\><rsub|e><rsup|final>=max<rsub|E\<in\>\<cal-E\><rsub|e>><around*|{|\<alpha\><rsub|e>,<half>*\<alpha\><rsub|E>|}><label|eq:smoothing>
  </equation>

  where <math|\<cal-E\><rsub|e>> denotes the set of elements sharing a face
  with <math|\<Omega\><rsub|e>>.

  <subsection|First order blending><label|sec:fo>

  The lower order scheme is taken to be a first order finite volume scheme,
  for which the subcell fluxes in <eqref|eq:low.order.update> are given by

  <\equation*>
    <value|pf><rsub|<value|pph>><rsup|e>=<value|pf><around|(|<value|uep>,<value|uu><rsub|e,p+1>|)>
  </equation*>

  At the interfaces that are shared with FR elements, we define the lower
  order flux used in computing inter-element flux
  (Section<nbsp><reference|sec:admissibility.preservation>) as

  <\equation>
    <value|pf><rsub|<eph>>=<value|pf><around|(|<value|ueN>,<value|uu><rsub|e+1,0>|)><label|eq:fo.at.face>
  </equation>

  In this chapter, the numerical flux <math|<value|pf><around|(|\<cdummy\>,\<cdummy\>|)>>
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
  subcell fluxes <math|<value|pf><rsub|<value|pph>><rsup|e>> used in the low
  order scheme<nbsp><eqref|eq:low.order.update> and we now explain the
  procedure for estimating these fluxes. The procedure below can be used for
  any choice of solution points. However, in this thesis, all results with
  MUSCL-Hancock scheme have been generated using Gauss-Legendre solution
  points. To simplify the notation, let us suppress the element index
  <math|e> and set

  <\equation*>
    <value|uu><rsub|-2>=<value|uu><rsub|N-1><rsup|e-1>,<space|1em><value|uu><rsub|-1>=<value|uu><rsub|N><rsup|e-1>,<space|1em><around|{|<value|uu><rsub|p>=<value|uep>,<space|1em>0\<le\>p\<le\>N|}>,<space|1em><value|uu><rsub|N+1>=<value|uu><rsub|0><rsup|e+1>,<space|1em><value|uu><rsub|N+2>=<value|uu><rsub|1><rsup|e+1>
  </equation*>

  Using the mid-point rule in time to integrate the conservation
  law<nbsp><eqref|eq:con.law> over the space-time element
  <math|<around|[|x<rsub|<value|pmh>>,x<rsub|<value|pph>>|]>\<times\><around|[|t<rsup|n>,t<rsup|n+1>|]>>,
  we get

  <\equation>
    <value|uu><rsub|p><rsup|n+1>=<value|uu><rsub|p><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|p>>*<around|(|<value|pf><rsub|<value|pph>><rsup|<nph>>-<value|pf><rsub|<value|pmh>><rsup|<nph>>|)><label|eq:riemann.problem>
  </equation>

  where

  <\equation>
    <value|pf><rsub|<value|pph>><rsup|<nph>>=<value|pf><around|(|<bw><rsub|p-1><rsup|<nph>,+>,<value|uu><rsub|p><rsup|<nph>,->|)><label|eq:mh.corr.flux>
  </equation>

  is obtained from a numerical flux function. The numerical flux
  in<nbsp><eqref|eq:mh.corr.flux> is taken to be Rusanov's
  flux<nbsp><cite|Rusanov1962> in this work, but any admissibility preserving
  finite volume flux (Definition<nbsp><reference|defn:admissible.fvm>) can be
  used. The <math|<bw><rsub|p><rsup|<nph>,\<pm\>>> denote the approximations
  of solutions in subcell <math|p> at right, left faces respectively, evolved
  to time level <math|<nph>>. Aiming to first approximate the solution at
  <math|t<rsup|n>> on the faces, we create a linear approximation of the
  solution in each subcell as

  <\equation>
    <label|eq:delta.defn><br><rsub|p><rsup|n><around|(|x|)>=<value|uu><rsub|p><rsup|n>+<around|(|x-x<rsub|p>|)>*<slope><rsub|p>,<space|2em><slope><rsub|p>=<text|minmod><around*|(|\<beta\>*\<Delta\><rsub|+>*<value|uu><rsub|p>,\<Delta\><rsub|c>*<value|uu><rsub|p>,\<beta\>*\<Delta\><rsub|->*<value|uu><rsub|p>|)>
  </equation>

  where, for <math|h<rsub|1>=x<rsub|p>-x<rsub|p-1>>,
  <math|h<rsub|2>=x<rsub|p+1>-x<rsub|p>>,<\footnote>
    In case of Gauss-Legendre-Lobatto points, the slope
    <math|<slope><rsub|p>=<value|bzero>> is used
    in<nbsp><eqref|eq:delta.defn> whenever <math|h<rsub|1>=0> or
    <math|h<rsub|2>=0>.
  </footnote>

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|\<Delta\><rsub|+>
    <value|uu><rsub|p>=<frac|<value|uu><rsub|p+1><rsup|n>-<value|uu><rsub|p><rsup|n>|h<rsub|2>>,<space|2em>\<Delta\><rsub|->
    <value|uu><rsub|p>=<frac|<value|uu><rsub|p><rsup|n>-<value|uu><rsub|p-1><rsup|n>|h<rsub|1>>>>|<row|<cell|\<Delta\><rsub|c>
    <value|uu><rsub|p>=-<frac|h<rsub|2>|h<rsub|1>*<around|(|h<rsub|1>+h<rsub|2>|)>>*<value|uu><rsup|n><rsub|p-1>+<frac|h<rsub|2>-h<rsub|1>|h<rsub|1>*h<rsub|2>>*<value|uu><rsup|n><rsub|p>+<frac|h<rsub|1>|h<rsub|2>*<around|(|h<rsub|1>+h<rsub|2>|)>>*<value|uu><rsup|n><rsub|p+1>>>>>>
  </equation*>

  The <math|\<Delta\><rsub|\<pm\>>*<bw><rsub|p>> are forward and backward
  approximations of slope respectively, and
  <math|\<Delta\><rsub|c>*<bw><rsub|p>> is the second order approximation of
  the slope. The value <math|\<beta\>> is chosen to lie between <math|1> and
  <math|2>; for <math|\<beta\>=1>, we reduce to the minmod limiter and
  <math|\<beta\>=2> corresponds to the MC (monotonized central-difference)
  limiter of van Leer<nbsp><cite|vanleer1977>. A higher value of
  <math|\<beta\>> tips the slope closer to the second order approximation,
  gaining accuracy but also increasing the risk of spurious oscillations. For
  all results in this chapter, the choice of
  <math|\<beta\>=2-\<alpha\><rsub|e>> is made. Thus, <math|\<beta\>> will be
  close to 2 in regions where smoothness indicator only detects mild
  irregularities in the solution, while it will be near <math|1> in regions
  with strong discontinuities. With the linear reconstructions, we can define

  <\equation>
    <label|eq:reconstruction><bw><rsub|p><rsup|n,->=<br><rsup|n><rsub|p><around|(|x<rsub|<value|pmh>>|)>=<value|uu><rsub|p><rsup|n>+<slope><rsub|p>*<around|(|x<rsub|<value|pmh>>-x<rsub|p>|)>,<space|2em><bw><rsub|p><rsup|n,+>=<br><rsup|n><rsub|p><around|(|x<rsub|<value|pph>>|)>=<value|uu><rsub|p><rsup|n>+<slope><rsub|p>*<around|(|x<rsub|<value|pph>>-x<rsub|p>|)>
  </equation>

  Using the conservation law, we approximate the temporal derivatives as

  <\equation*>
    \<partial\><rsub|t>*<value|uu><rsup|n><rsub|p>\<assign\>-<frac|<value|pf><around|(|<value|uu><rsup|n,+><rsub|p>|)>-<value|pf><around|(|<value|uu><rsup|n,-><rsub|p>|)>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>
  </equation*>

  and finally use Taylor's expansion to evolve the face values in time as

  <\equation>
    <label|eq:evolution><bw><rsub|p><rsup|<nph>,->=<bw><rsub|p><rsup|n,->+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<value|uu><rsup|n><rsub|p>,<space|2em><bw><rsub|p><rsup|<nph>,+>=<bw><rsub|p><rsup|n,+>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<value|uu><rsup|n><rsub|p>
  </equation>

  At the interfaces shared with the FR elements, the lower order flux used in
  computing inter-element flux (Section<nbsp><reference|sec:admissibility.preservation>)
  is given by <math|<value|pf><rsub|<eph>>=<value|pf><rsub|<Nph>><rsup|<nph>>>;
  the dependence on neighbouring states can be made explicit as

  <\equation>
    <value|pf><rsub|<eph>>=<value|pf><around|(|<value|uu><rsub|N-1><rsup|e>,<value|uu><rsub|N><rsup|e>,<value|uu><rsub|0><rsup|e+1>,<value|uu><rsub|1><rsup|e+1>|)><label|eq:mh.at.face>
  </equation>

  For admissibility of the lower order method, we rely on the following
  generalization of Berthon<nbsp><cite|Berthon2006>, proved in
  Appendix<nbsp><reference|sec:muscl.admissibility.proof>.

  <\theorem>
    <label|thm:muscl.admissibility.theorem>Consider a conservation law of the
    form<nbsp><eqref|eq:con.law> which preserves the admissible set
    <math|<Uad>><nbsp><eqref|eq:conv.pres.con.law>. Let
    <math|<around*|{|<bw><rsub|p><rsup|n>|}><rsub|p>> be the approximate
    solution at time level <math|n> and assume that
    <math|<bw><rsub|p><rsup|n>\<in\><Uad>> for all <math|p>. Consider
    conservative reconstructions

    <\equation*>
      <bw><rsub|p><rsup|n,+>=<bw><rsub|p><rsup|n>+<around|(|x<rsub|<value|pph>>-x<rsub|p>|)><slope><rsub|p>,<space|2em><bw><rsub|p><rsup|n,->=<bw><rsub|p><rsup|n>+<around|(|x<rsub|<value|pmh>>-x<rsub|p>|)><slope><rsub|p>
    </equation*>

    Define <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> by

    <\equation>
      <label|eq:us.defn.main><mum>*<bw><rsub|p><rsup|n,->+<bw><rsub|p><rsup|\<ast\>,\<pm\>>+<mup>*<bw><rsub|p><rsup|n,+>=2*<bw><rsub|p><rsup|n,\<pm\>>
    </equation>

    where

    <\equation*>
      <mum>=<frac|x<rsub|<value|pph>>-x<rsub|p>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>,<space|2em><mup>=<frac|x<rsub|p>-x<rsub|<value|pmh>>|x<rsub|<value|pph>>-x<rsub|<value|pmh>>>
    </equation*>

    Assume that the slope <math|<slope><rsub|p>> is chosen so that

    <\equation>
      <bw><rsub|p><rsup|\<ast\>,\<pm\>>\<in\><Uad><label|eq:ustar.in.uad>
    </equation>

    Then, assuming that the first order finite volume flux used
    in<nbsp><eqref|eq:mh.corr.flux> is admissibility preserving
    (Definition<nbsp><reference|defn:admissible.fvm>), under appropriate time
    step restrictions<nbsp>(<reference|eq:new.cfl1>,<nbsp><reference|eq:new.cfl2>,<nbsp><reference|eq:new.cfl3.conservative>),
    the updated solution <math|<bw><rsub|p><rsup|n+1>> defined by the
    MUSCL-Hancock procedure<nbsp><eqref|eq:riemann.problem> is in
    <math|<Uad>>.
  </theorem>

  <subsection|Slope limiting in practice><label|sec:slope.limiting>

  A problem-independent procedure for slope limiting to ensure admissibility
  preservation is proposed, in contrast to the original procedure for Euler's
  equations in<nbsp><cite|Berthon2006> that was extended to the 10-moment
  problem in<nbsp><cite|meena2017>. For the MUSCL-Hancock scheme to be
  admissibility preserving, the slope <math|<slope><rsub|p>> given by the
  minmod limiter<nbsp><eqref|eq:delta.defn> has to be further limited so that
  <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>=<bw><rsub|p><rsup|n>+2*<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p>\<in\><Uad>><nbsp><eqref|eq:us.defn.main>.
  Let <math|<around|{|<ad><rsub|k>,1\<le\>1\<le\>K|}>> be the admissibility
  constraints<nbsp><eqref|eq:uad.form> for the conservation
  law<nbsp><eqref|eq:con.law> to be in <math|<Uad>>. The slope is limited by
  iterating over the constraints. For each constraint, we can solve an
  optimization problem to find the largest
  <math|\<theta\><rsub|\<pm\>>\<in\><around|[|0,1|]>> satisfying

  <\equation>
    <value|ad><rsub|k><around|(|<bw><rsub|p><rsup|n>+2*\<theta\><rsub|\<pm\>>*<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p>|)>=<ad><rsub|k><around|(|\<theta\><rsub|\<pm\>>*<bw><rsub|p><rsup|\<ast\>,\<pm\>>+<around|(|1-\<theta\><rsub|\<pm\>>|)>*<bw><rsub|p><rsup|n>|)>\<geq\>\<epsilon\><rsub|p>,<space|2em>p=0,N<label|eq:optimization.problem>
  </equation>

  where <math|\<epsilon\><rsub|p>> is a tolerance, taken to be
  <math|<frac|1|10>*<ad><rsub|k><around|(|<bw><rsub|p><rsup|n>|)>><nbsp><cite|ramirez2021>.
  The optimization problem is usually a polynomial equation in
  <math|\<theta\>>, and can be solved for its root. In this work, we use a
  general iterative solver that is independent of choice of <math|P<rsub|k>>
  (Appendix<nbsp><reference|app:scaling.limiter>). If <math|<ad><rsub|k>> is
  a concave function of the conserved variables, we can
  follow<nbsp><cite|babbar2023admissibility> and use the simpler but possibly
  sub-optimal approach of defining

  <\equation>
    \<theta\><rsub|\<pm\>>=min <around*|(|min<rsub|p=0,N><around*|\||<frac|\<epsilon\><rsub|p>-<ad><rsub|k><around|(|<bw><rsub|p><rsup|n>|)>|<ad><rsub|k><around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)>-<ad><rsub|k><around|(|<bw><rsub|p><rsup|n>|)>>|\|>,1|)><label|eq:concave.theta>
  </equation>

  In either case, by iterating over the admissibility constraints
  <math|<around|{|<value|ad><rsub|k>|}>> of the conservation law, the flux
  slope limiting is performed by the following <verbatim|for> loop

  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <hrule>

      <no-indent><algo-state|<math|<slope><rsub|p>\<leftarrow\><text|minmod><around*|(|\<beta\>*\<Delta\><rsub|+>*<value|uu><rsub|p>,\<Delta\><rsub|c>*<value|uu><rsub|p>,\<beta\>*\<Delta\><rsub|->*<value|uu><rsub|p>|)>>>

      <no-indent><algo-state|<math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<leftarrow\><bw><rsub|p><rsup|n>+2*<around|(|x<rsub|<ppmh>>-x<rsub|p>|)><slope><rsub|p>>>

      <no-indent><with|font-series|bold|for> <math|k=1:K>
      <with|font-series|bold|do>

      <algo-state|<math|\<epsilon\><rsub|k>=<frac|1|10>*<value|ad><rsub|k><around|(|<bw><rsub|p><rsup|n>|)>>>

      <algo-state|Find <math|\<theta\><rsub|\<pm\>>> by
      solving<nbsp><eqref|eq:optimization.problem> or by
      using<nbsp><eqref|eq:concave.theta> if <math|<value|ad><rsub|k>> is
      concave>

      <algo-state|<math|\<theta\><rsub|k>\<leftarrow\>min
      <around|{|\<theta\><rsub|+>,\<theta\><rsub|->|}>>>

      <algo-state|<math|<slope><rsub|p>\<leftarrow\>\<theta\><rsub|k>*<slope><rsub|p>>>

      <algo-state|<math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<leftarrow\><bw><rsub|p><rsup|n>+2*<around|(|x<rsub|<value|ppmh>>-x<rsub|p>|)>*<slope><rsub|p>>>

      <no-indent><with|font-series|bold|end for>

      <no-indent><hrule>
    </cell>>>>
  </wide-tabular>

  At the <math|k<rsup|th>> iteration, solving the optimization
  problem<nbsp><eqref|eq:optimization.problem> will satisfy the constraint
  <math|<value|ad><rsub|k>> by definition. On the other hand, if we use
  <nbsp><eqref|eq:concave.theta> in case <math|<value|ad><rsub|k>> is
  concave, the <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> computed with the
  corrected slope <math|<slope><rsub|p>> will satisfy

  <\equation>
    <label|eq:pk.slope.correction><value|ad><rsub|k><around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)>=<value|ad><rsub|k>*<around|(|\<theta\><rsub|k><around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>+<around|(|1-\<theta\><rsub|k>|)>*<bw><rsub|p><rsup|n>|)>\<ge\>\<theta\><rsub|k>*<value|ad><rsub|k>*<around|(|<around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>|)>+<around|(|1-\<theta\><rsub|k>|)>*<value|ad><rsub|k><around|(|<bw><rsub|p><rsup|n>|)>\<ge\>\<epsilon\><rsub|k>
  </equation>

  so that the <math|k<rsup|th>> admissibility constraint is satisfied; here
  <math|<around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>> denotes
  <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>> before the <math|k<rsup|th>>
  correction. The choice of <math|\<epsilon\><rsub|k>=<frac|1|10>*<value|ad><rsub|k><around|(|<bw><rsub|p><rsup|n>|)>>
  was made following<nbsp><cite|ramirez2021> to allow only a certain
  deviation below the <with|font-shape|italic|safe solution>, imposing a
  stricter requirement than positivity. Note that this limiting is performed
  on the slope used for reconstruction in the MUSCL-Hancock scheme, and not
  on the updated solution. We now use an inductive argument to show that the
  <math|k<rsup|th>> correction will continue to satisfy the previous
  admissibility constraints. Thus, we assume that constraint
  <math|<value|ad><rsub|l>> is satisfied by
  <math|<around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>> for all
  <math|l\<less\>k> and we perform <math|k<rsup|th>> correction on it to
  obtain<nbsp><math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>>. In case of concave
  admissibility constraints,

  <\eqnarray>
    <tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<value|ad><rsub|l><around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)>>|<cell|=>|<cell|<value|ad><rsub|l><around|(|\<theta\><rsub|k>*<around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>+<around|(|1-\<theta\><rsub|k>|)>*<bw><rsub|p><rsup|n>|)><label|eq:use.weak.convexity><eq-number>>>|<row|<cell|>|<cell|\<geq\>>|<cell|\<theta\><rsub|k>*<value|ad><rsub|l><around|(|<around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>|)>+<around|(|1-\<theta\><rsub|k>|)>*<value|ad><rsub|l><around|(|<bw><rsub|p><rsup|n>|)>\<geq\>\<theta\><rsub|k>*\<epsilon\><rsub|l>+<around|(|1-\<theta\><rsub|k>|)>*\<epsilon\><rsub|l>=\<epsilon\><rsub|l>>>>>
  </eqnarray>

  In case of non-concave <math|<value|ad><rsub|l>>, we
  use<nbsp><eqref|eq:weak.convexity> to obtain
  <math|<value|ad><rsub|l><around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)>\<gtr\>\<epsilon\><rsub|l><around*|(|<around|(|<bw><rsub|p><rsup|\<ast\>,\<pm\>>|)><rsup|prev>,<bw><rsub|p><rsup|n>|)>\<gtr\>0>
  from<nbsp><eqref|eq:use.weak.convexity>. Thus, in both cases, constraints
  <math|<value|ad><rsub|l>> are satisfied for all <math|l\<less\>k> and the
  slope <math|<slope><rsub|p>> obtained at the end of <math|K> iterations
  satisfies all admissibility constraints ensuring
  <math|<bw><rsub|p><rsup|\<ast\>,\<pm\>>\<in\><Uad>>.

  <section|Flux limiter for admissibility
  preservation><label|sec:admissibility.preservation>

  The first step in obtaining an admissibility preserving blending scheme is
  to ensure that the lower order scheme preserves the admissible set
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
  this thesis is to note that, as a result of using the same numerical flux
  in both high and low order schemes, element means of both schemes are the
  same (Theorem<nbsp><reference|thm:lwfr.admissibility>). A consequence of
  this is that our scheme now preserves admissibility of element means and
  thus we can use the scaling limiter of<nbsp><cite|Zhang2010b>. The latter
  approach of correcting element means to obtain a positivity preserving
  Lax-Wendroff scheme has been used in<nbsp><cite|moe2017>, where the
  numerical flux is corrected to directly make element means admissible. In
  comparison to<nbsp><cite|moe2017>, our procedure for ensuring admissibility
  of element means requires less storage and loops.

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
      <math|<value|pf><rsub|<eph>>> as the interface flux is admissibility
      preserving, such as the first-order finite volume method or the
      MUSCL-Hancock scheme with CFL restrictions and slope correction from
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
    <math|<value|uep><rsup|L,n+1>> given by<nbsp><eqref|eq:low.order.update>
    is in <math|<Uad>> for <math|0\<le\>p\<le\>N> implying admissibility in
    means property of the lower order scheme
    by<nbsp><eqref|eq:low.order.cell.avg.update> and thus admissibility in
    means for the blended scheme.
  </proof>

  We now explain the procedure of ensuring that the update obtained by the
  lower order scheme will be admissible. The lower order scheme is computed
  with a first order finite volume method or MUSCL-Hancock with slope
  correction from Theorem<nbsp><reference|thm:muscl.admissibility.theorem> so
  that admissibility is already ensured for inner solution points; i.e., we
  already have

  <\equation*>
    <value|uep><rsup|L,n+1>\<in\><Uad>,<space|1em>1\<le\>p\<le\>N-1
  </equation*>

  The remaining admissibility constraints for the first (<math|p=0>) and last
  solution points (<math|p=N>) will be satisfied by appropriately choosing
  the inter-element flux <math|<value|F><rsub|<eph>>>. The first step is to
  choose a candidate for <math|<value|F><rsub|<eph>>> which is heuristically
  expected to give reasonable control on spurious oscillations, i.e.,

  <\equation*>
    <value|F><rsub|<eph>>=<around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsup|LW><rsub|<eph>>+\<alpha\><rsub|<eph>>*<value|pf><rsub|<eph>>,<space|2em>\<alpha\><rsub|<eph>>=<frac|\<alpha\><rsub|e>+\<alpha\><rsub|e+1>|2>
  </equation*>

  where <math|<value|pf><rsub|<eph>>> is the lower order flux at the face
  <math|<eph>> shared between FR elements and
  subcells<nbsp>(<reference|eq:fo.at.face>,<nbsp><reference|eq:mh.at.face>),
  and <math|\<alpha\><rsub|e>> is the blending
  coefficient<nbsp><eqref|eq:blended.scheme> based on element-wise smoothness
  indicator (Section<nbsp><reference|sec:smooth.ind>).

  The next step is to correct <math|<value|F><rsub|<eph>>> to enforce the
  admissibility constraints. The guiding principle of our approach is to
  perform the correction within the face loops, minimizing storage
  requirements and additional memory reads. The lower order updates in
  subcells neighbouring the <math|<eph>> face with the candidate flux are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<value|atu><rsub|0><rsup|n+1>>|<cell|=>|<cell|<value|uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<value|pf><rsup|e><rsub|<half>>-<value|F><rsub|<eph>>|)>>>|<row|<cell|<value|atu><rsub|N><rsup|n+1>>|<cell|=>|<cell|<value|ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|pf><rsup|e><rsub|<Nmh>>|)>>>>>><label|eq:low.order.tilde.update>
  </equation>

  To correct the interface flux, we will again use the fact that first order
  finite volume method and MUSCL-Hancock with slope correction from
  Theorem<nbsp><reference|thm:muscl.admissibility.theorem> preserve
  admissibility, i.e.,

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<utilow><rsub|0>>|<cell|=>|<cell|<value|uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<value|pf><rsup|e><rsub|<half>>-<value|pf><rsub|<eph>>|)>\<in\><Uad>>>|<row|<cell|<utilow><rsub|N>>|<cell|=>|<cell|<value|ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|pf><rsub|<eph>>-<value|pf><rsup|e><rsub|<Nmh>>|)>\<in\><Uad>>>>>>
  </equation*>

  Let <math|<around|{|<value|ad><rsub|k>,1\<le\>1\<le\>K|}>> be the
  admissibility constraints<nbsp><eqref|eq:uad.form> of the conservation
  law<nbsp><eqref|eq:con.law>. For each constraint, we can solve an
  optimization problem to find the largest
  <math|\<theta\>\<in\><around|[|0,1|]>> satisfying

  <\equation>
    <ad><rsub|k><around|(|\<theta\>*<atu><rsub|p><rsup|n+1>+<around|(|1-\<theta\>|)>*<utilow><rsub|p>|)>\<gtr\>\<epsilon\><rsub|p>,<space|2em>p=0,N<label|eq:flux.optimization.problem>
  </equation>

  where <math|\<epsilon\><rsub|p>> is a tolerance, taken to be
  <math|<frac|1|10>*<ad><rsub|k><around|(|<utilow><rsub|p>|)>><nbsp><cite|ramirez2021>.
  The optimization problem is usually a polynomial equation in
  <math|\<theta\>>, and can be solved for its root. In this work, we use a
  general iterative solver that is independent of choice of <math|P<rsub|k>>
  (Appendix<nbsp><reference|app:scaling.limiter>). If <math|<ad><rsub|k>> is
  a concave function of the conserved variables, we can
  follow<nbsp><cite|babbar2023admissibility> and use the simpler but possibly
  sub-optimal approach of defining

  <\equation>
    \<theta\>=min <around*|(|min<rsub|p=0,N><around*|\||<frac|\<epsilon\><rsub|p>-<ad><rsub|k><around|(|<atu><rsub|p><rsup|<text|low>,n+1>|)>|<ad><rsub|k><around|(|<atu><rsub|p><rsup|n+1>|)>-<ad><rsub|k><around|(|<atu><rsub|p><rsup|<text|low>,n+1>|)>>|\|>,1|)><label|eq:flux.concave.theta>
  </equation>

  In either case, by iterating over the admissibility constraints
  <math|<around|{|<value|ad><rsub|k>|}>> of the conservation law, the flux
  <math|<F><rsub|<eph>><rsup|LW>> can be corrected using the iterative
  limiting procedure in Algorithm<nbsp><reference|alg:flux.limit>.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            <label|alg:flux.limit>Flux limiter
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<\cell>
          <\wide-tabular>
            <tformat|<cwith|1|1|2|2|cell-halign|r>|<table|<row|<\cell>
              <algo-state|<math|<value|F><rsub|<eph>>\<leftarrow\><around|(|1-\<alpha\><rsub|<eph>>|)>*<value|F><rsup|LW><rsub|<eph>>+\<alpha\><rsub|<eph>>*<value|pf><rsub|<eph>>>>
            </cell>|<\cell>
              <math|\<vartriangleright\>> Initial guess
            </cell>>>>
          </wide-tabular>
        </cell>>|<row|<\cell>
          <with|font-series|bold|for> <math|k=1:K> <with|font-series|bold|do>

          <algo-state|<math|\<epsilon\><rsub|0>,\<epsilon\><rsub|N>\<leftarrow\><frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|0>|)>,<frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|N>|)>>>

          <algo-state|Find <math|\<theta\>> by
          solving<nbsp><eqref|eq:flux.optimization.problem> or by
          using<nbsp><eqref|eq:flux.concave.theta> if
          <math|<value|ad><rsub|k>> is concave>

          <algo-state|<math|<value|F><rsub|<eph>>\<leftarrow\>\<theta\>*<value|F><rsub|<eph>>+<around|(|1-\<theta\>|)>*<value|pf><rsub|<eph>>>>

          <algo-state|<math|<value|atu><rsub|0><rsup|n+1>\<leftarrow\><value|uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<value|pf><rsup|e+1><rsub|<half>>-<value|F><rsub|<eph>>|)>>>

          <algo-state|<math|<value|atu><rsub|N><rsup|n+1>\<leftarrow\><value|ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<value|F><rsub|<eph>>-<value|pf><rsup|e><rsub|<Nmh>>|)>>>

          <no-indent><with|font-series|bold|end for>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  In case of solving an optimization problem<nbsp><eqref|eq:flux.optimization.problem>,
  the admissibility constraint <math|<value|ad><rsub|k>> will be satisfied
  after the <math|k<rsup|th>> iteration of
  Algorithm<nbsp><reference|alg:flux.limit> by definition of the optimization
  problem. In the case of concave <math|<value|ad><rsub|k>>,
  if<nbsp><eqref|eq:flux.concave.theta> is used, after the <math|k<rsup|th>>
  iteration, the updates computed using flux <math|<value|F><rsub|<eph>>>
  will satisfy for <math|p=0,N>

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|o>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<value|ad><rsub|k><around|(|<value|atu><rsub|p><rsup|n+1>|)>>|<cell|=>|<cell|<value|ad><rsub|k><around|(|\<theta\><around|(|<value|atu><rsub|p><rsup|n+1>|)><rsup|prev>+<around|(|1-\<theta\>|)><utilow><rsub|p>|)>>>|<row|<cell|>|<cell|\<geq\>>|<cell|\<theta\>*<value|ad><rsub|k><around|(|<around|(|<value|atu><rsub|p><rsup|n+1>|)><rsup|prev>|)>+<around|(|1-\<theta\>|)>*<value|ad><rsub|k><around|(|<utilow><rsub|p>|)>\<ge\>\<epsilon\><rsub|p>>>>>>
  </equation*>

  satisfying the <math|k<rsup|th>> admissibility constraint; here
  <math|<around|(|<value|atu><rsub|p><rsup|n+1>|)><rsup|prev>> denotes
  <math|<value|atu><rsub|p><rsup|n+1>> before the <math|k<rsup|th>>
  correction and the choice of <math|\<epsilon\><rsub|p>=<frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|p>|)>>
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
  requires storage of lower order fluxes <math|<value|pf><rsup|e><rsub|<half>>>
  and <math|<value|pf><rsup|e><rsub|<Nmh>>>, which are computed during the
  element loop.

  In Algorithm<nbsp><reference|alg:high.level.lw>, we give a high level
  overview of the LWFR with blending scheme. In the implementation, some
  operations are avoided by computing only high or low order residuals in the
  cases where <math|\<alpha\><rsub|e>=0> or <math|\<alpha\><rsub|e>=1>, but
  we did not include this optimization in
  Algorithm<nbsp><reference|alg:high.level.lw> to maintain simplicity in our
  explanation. The correction procedure of numerical flux for admissibility
  preservation (Section<nbsp><reference|sec:admissibility.preservation>) is
  performed within the interface iteration. The contribution of numerical
  flux to the residual is added in a different element loop to avoid race
  conditions in a multi-threaded loop; only one loop would be needed in a
  serial code. After the solution update in
  Algorithm<nbsp><reference|alg:high.level.lw>, the blended flux will ensure
  that our purely low order update and the element means are admissible.
  However, the updates at solution points need not be admissible at this
  stage and must be corrected. The correction at solution points could now be
  performed as an <with|font-shape|italic|a posteriori> modification of the
  blending coefficients<nbsp><cite|ramirez2021> or using the scaling limiter
  of<nbsp><cite|Zhang2010b>; we use the scaling limiter for all results in
  this work.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            <label|alg:high.level.lw>High-level overview of the Lax-Wendroff
            with blending scheme
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<\cell>
          <math|t=0>;
        </cell>>|<row|<\cell>
          <with|font-series|bold|while> <math|t\<less\>T>
          <with|font-series|bold|do>

          <no-indent><with|color|white|<mid|lfloor>>
          <tabular|<tformat|<table|<row|<cell|<algo-state|Compute
          <math|<around|{|\<alpha\><rsub|e>|}>>
          (Section<nbsp><reference|sec:smooth.ind>)>>>|<row|<cell|>>|<row|<cell|<math|\<vartriangleright\>><space|0.2spc>Assemble
          element residual>>|<row|<cell|<with|font-series|bold|for> <math|e>
          in <with|font-family|tt|eachelement(mesh)>
          <with|font-series|bold|do>>>|<row|<cell|<with|color|white|<mid|lfloor>><tabular|<tformat|<table|<row|<cell|<algo-state|Add
          LW element residual to rhs scaled with
          <math|1-\<alpha\><rsub|e>>>>>|<row|<cell|<algo-state|Add FV subcell
          residual to rhs scaled with <math|\<alpha\><rsub|e>>>>>|<row|<cell|<algo-state|Store
          <math|<value|pf><rsup|e><rsub|1/2>,<value|pf><rsup|e><rsub|N-1/2>><nbsp><eqref|eq:low.order.tilde.update>>>>>>>>>|<row|<cell|<with|font-series|bold|end
          for>>>|<row|<cell|>>|<row|<cell|<math|\<vartriangleright\>><space|0.2spc>Compute
          numerical fluxes at all interfaces>>|<row|<cell|<with|font-series|bold|for>
          <math|<value|eph>> in <with|font-family|tt|eachinterface(mesh)>
          <with|font-series|bold|do>>>|<row|<cell|<with|color|white|<mid|lfloor>><algo-state|Compute
          <math|<value|F><rsub|<eph>><rsup|LW>>,
          <math|<value|pf><rsub|<eph>>> and blend them into
          <math|<value|F><rsub|<eph>>> (Section<nbsp><reference|sec:admissibility.preservation>)>>>|<row|<cell|<with|font-series|bold|end
          for>>>|<row|<cell|>>|<row|<cell|<math|\<vartriangleright\>><space|0.2spc>Assemble
          face residual>>|<row|<cell|<with|font-series|bold|for> <math|e> in
          <with|font-family|tt|eachelement(mesh)>
          <with|font-series|bold|do>>>|<row|<cell|<with|color|white|<mid|lfloor>>Add
          contribution of <math|<value|F><rsub|e\<pm\><half>>> to high, low
          order residual scaled with <math|1-\<alpha\><rsub|e>,\<alpha\><rsub|e>>>>|<row|<cell|<with|font-series|bold|end
          for>>>|<row|<cell|Update solution>>|<row|<cell|<algo-state|Apply
          positivity correction at solution points
          using<nbsp><cite|Zhang2010b> or<nbsp><cite|ramirez2021>>>>|<row|<cell|<math|<math|t=t+\<mathLaplace\>t>;>>>>>>

          <no-indent><with|font-series|bold|end while>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

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
  Gauss-Legendre-Lobatto points of<nbsp><cite|hennemann2021> implemented in
  <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022|schlottkelakemper2021purely>.
  Our code is publicly available at<nbsp><cite|tenkai>, and the scripts for
  reproducing results in this chapter are available at<nbsp><cite|paperrepo>.
  The user only needs to install <with|font-family|tt|Julia><nbsp><cite|Bezanson2017>
  and the remaining dependencies are automatically handled by
  <with|font-family|tt|Julia> environments and its package manager.

  <subsection|1-D Euler equations><label|sec:res1dsys.chblend>

  As an example of system of non-linear hyperbolic equations, consider the
  one-dimensional Euler equations of gas dynamics given
  by<nbsp><eqref|eq:1deuler>. Unless otherwise specified, the gas constant
  <math|\<gamma\>> will be taken as <math|1.4> which is the value for air.
  The time step size for polynomial degree <math|N> is computed as
  in<nbsp><eqref|eq:dt.lw>. Most of the numerical results presented in this
  chapter use degree <math|N=4> for which CFL<math|<around|(|N|)>=0.069>. The
  admissibility preservation of subcell based MUSCL-Hancock imposes a time
  restriction (Theorem<nbsp><reference|thm:muscl.admissibility.theorem>)
  which depends on several quantities other than element means, including
  some evolved quantities, see equations<nbsp>(<reference|eq:new.cfl1>,
  <reference|eq:new.cfl2>, <reference|eq:new.cfl3.conservative>). The CFL
  coefficient of MUSCL-Hancock admissibility is also smaller than
  CFL<math|<around|(|N|)>> in<nbsp><eqref|eq:dt.lw>, see
  Remark<nbsp><reference|rmk:mh.restriction.for.fr>. However, we have found
  the time step given by<nbsp><eqref|eq:dt.lw> with <math|<value|Cs>=0.98> to
  be sufficient for admissibility preservation in all the simulations we have
  performed. Thus, we do not explicitly impose the CFL restrictions in
  Theorem<nbsp><reference|thm:muscl.admissibility.theorem> as they are more
  severe and expensive to compute. If the admissibility is violated in any
  cell, then the time update can be repeated in those cells by lowering the
  time step by some fraction.

  <subsubsection|Shu-Osher problem><label|sec:shuosher.blend>

  This problem was described in Section<nbsp><reference|sec:shuosher>. Due to
  presence of both spurious oscillations and smooth extremums, this becomes a
  good test for testing robustness and accuracy of limiters. We discretize
  the spatial domain with 400 cells using polynomial degree <math|N=4> and
  compare blending schemes and TVB limiter with parameter
  <math|M=300><nbsp><cite|Qiu2005b>. The density component of the approximate
  solutions computed for the compared limiters are plotted against a
  reference solution obtained using a very fine mesh, and are given in
  Figure<nbsp><reference|fig:ShuOsher>. The three limiters show similar
  performance in Figure<nbsp><reference|fig:ShuOsher>a on the large scale.
  The enlarged plot in Figure<nbsp><reference|fig:ShuOsher>b shows that the
  MUSCL-Hancock blending scheme is able to capture smooth extrema better than
  the first order blending and the TVB scheme.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/shuosher_unzoom|0.45par|||>>|<cell|<image|figures/paper2/euler1d/shuosher|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:ShuOsher.chblend>>|<caption-detailed|Shu-Osher
  problem, numerical solution with degree <math|N=4> using first order (FO)
  and MUSCL-Hancock (MH) blending schemes, and TVB limited scheme (TVB-300)
  with parameter <math|M=300>. (a) Full and (b) zoomed density profiles of
  numerical solutions are shown up to time <math|t=1.8> on a mesh of 400
  cells.|Comparing TVB and blending schemes on Shu-Osher test.>>

  <subsubsection|Blast wave><label|sec:blast.chblend>

  This test case was described in Section<nbsp><reference|sec:blast>. The
  solution consists of reflection of shocks and expansion waves off the
  boundary wall and several wave interactions inside the domain. The
  numerical solutions are inadmissible if the positivity correction is not
  applied. With a grid of 400 cells using polynomial degree <math|N=4>, we
  run the simulation till the time <math|t=0.038> where a high density peak
  profile is produced. As in the previous test, we compare first order (FO)
  and MUSCL-Hancock (MH) blending schemes, and TVB limiter with parameter
  <math|M=300><nbsp><cite|Qiu2005b> (TVB-300). We compare the performance of
  limiters in Figure<nbsp><reference|fig:blast> where the approximated
  density and pressure profiles are compared with a reference solution
  computed using a very fine mesh. Looking at the peak amplitude and contact
  discontinuity of the density profile which is also shown in the zoomed
  inset, it is clear that MUSCL-Hancock blending scheme gives the best
  resolution, especially when compared with the TVB limiter.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/blast|0.45par|||>>|<cell|<image|figures/paper2/euler1d/blast_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:blast.chblend>>|<caption-detailed|Blast
  wave problem, numerical solution with degree <math|N=4> using first order
  (FO) and MUSCL-Hancock (MH) blending schemes, and TVB limited scheme
  (TVB-300) with parameter <math|M=300>. (a) Density, (b) pressure profiles
  are shown at time <math|t=0.038> on a mesh of 400 cells.|Comparing TVB and
  blending schemes on blast wave.>>

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
    \<rho\>=1,<space|2em>v=0,<space|2em>E<around|(|x|)>=<choice|<tformat|<table|<row|<cell|<frac|3.2\<times\>10<rsup|6>|\<Delta\>x>,<space|2em>>|<cell|<around|\||x|\|>\<le\><frac|\<Delta\>x|2>>>|<row|<cell|10<rsup|-12>,<space|2em>>|<cell|<text|otherwise>>>>>>
  </equation*>

  where <math|\<Delta\>x> is the element width. This is a difficult test for
  positivity preservation because of the high pressure ratios. Nonphysical
  solutions are obtained if the proposed admissibility preservation
  corrections are not applied. The density and pressure profiles at
  <math|t=0.001> obtained using blending schemes are shown in
  Figure<nbsp><reference|fig:sedov.blast>. Results of TVD limiter are not
  shown as it fails to preserve positivity in this test because the
  admissibility correction of Lax-Wendroff scheme depends on the blended
  numerical flux (Section<nbsp><reference|sec:admissibility.preservation>).

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/sedov_density|0.45par|||>>|<cell|<image|figures/paper2/euler1d/sedov_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:sedov.blast>>|<caption-detailed|Sedov's
  blast wave problem, numerical solution with degree <math|N=4> using first
  order (FO) and MUSCL-Hancock blending schemes. (a) Density and (b) pressure
  profiles of numerical solutions are plotted at time <math|t=0.001> on a
  mesh of 201 cells.|Sedov's blast wave problem>>

  <subsubsection|Riemann problems>

  We test two extreme Riemann problems from<nbsp><cite|Zhang2010b> to
  demonstrate admissibility preservation of our scheme. The first is a
  Riemann problem with no shocks and two rarefactions, which move away from
  each other leading to a near vacuum state in the exact solution. The low
  densities make it a challenging test, as the oscillations can easily cause
  negative density values. As in the previous test, results of TVD limiter
  are not shown as it fails to preserve admissibility. We run the simulation
  on the domain <math|<around|[|-1,1|]>> with initial data

  <\equation*>
    <around|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|7.0,-1.0,0.2|)>,<space|2em>>|<cell|-1\<le\>x\<le\>0>>|<row|<cell|<around|(|7.0,1.0,0.2|)>,>|<cell|otherwise>>>>>
  </equation*>

  The results obtained using blending schemes are shown in
  Figure<nbsp><reference|fig:double.rarefaction> on a mesh of 200 cells with
  transmissive boundary conditions at time <math|t=0.6>.

  <no-indent>The second test is a 1D Leblanc shock tube problem with initial
  data

  <\equation*>
    <around|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around|(|2,0,10<rsup|9>|)>,<space|2em>>|<cell|-1\<le\>x\<le\>0>>|<row|<cell|<around|(|0.001,0,1|)>,>|<cell|<text|otherwise>>>>>>
  </equation*>

  The solution has extremely high density and pressure ratios across the
  shock and the numerical solutions give negative pressure if the proposed
  admissibility preservation techniques are not applied. The log-scaled
  results obtained using blending schemes are shown in
  Figure<nbsp><reference|fig:leblanc> at time <math|t=0.001> on a mesh of
  <math|800> cells with transmissive boundary conditions.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/double_rarefaction|0.45par|||>>|<cell|<image|figures/paper2/euler1d/double_rarefaction_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:double.rarefaction>>|<caption-detailed|Double
  rarefaction problem, numerical solution with degree <math|N=4> using first
  order (FO) and MUSCL-Hancock (MH) blending. (a) Density and (b) pressure
  profiles of numerical solutions are plotted at <math|t=0.6> on a mesh of
  200 cells.|Double rarefaction problem with LW-MH.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/leblanc|0.45par|||>>|<cell|<image|figures/paper2/euler1d/leblanc_pressure|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:leblanc>>|<caption-detailed|Leblanc's
  test, numerical solution with polynomial degree <math|N=4> using first
  order (FO) and MUSCL-Hancock (MH) blending. (a) Density and (b) pressure
  profiles of numerical solutions with log-scales are plotted at
  <math|t=0.001> on a mesh of <math|800> cells.|Leblanc's test with LW-MH.>>

  <section|2-D advection equation><label|eq:numresults.2dadv>

  The description of this test is provided in
  Section<nbsp><reference|sec:rotate.composite>. The numerical solution is
  computed at <math|t=2*\<pi\>> and shown in
  Figure<nbsp><reference|fig:composite.signal.2d>a after one time period,
  comparing different limiters Figure<nbsp><reference|fig:composite.signal.2d>b-c.
  To be specific, Figure<nbsp><reference|fig:composite.signal.2d> compares
  contour plots of polynomial solutions obtained using the LWFR method of
  degree <math|N=4> with TVB limiter using a fine-tuned parameter
  <math|M=100>, and with blending limiter using first order and MUSCL-Hancock
  reconstructions, after one time period. The blending limiter with
  MUSCL-Hancock reconstruction is shown to produce more accurate solutions
  among the three profiles especially when compared to the TVB limiter, as
  the TVB limiter results in greater smearing of the profile. The sharp
  features of slotted disc profile show the most notable improvement.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|3|3|2|3|cell-valign|c>|<cwith|3|4|2|3|cell-valign|c>|<cwith|3|4|1|1|cell-halign|c>|<cwith|3|4|1|1|cell-valign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-valign|c>|<cwith|3|4|1|1|cell-halign|c>|<cwith|3|4|1|1|cell-valign|c>|<cwith|3|4|2|2|cell-valign|c>|<cwith|3|3|2|2|cell-valign|c>|<cwith|3|4|2|2|cell-halign|c>|<cwith|3|4|2|2|cell-rborder|0ln>|<cwith|3|4|2|2|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/la2d/rotate_composite/initial|0.34par|||>>|<cell|<image|figures/paper2/la2d/rotate_composite/tvb|0.34par|||>>>|<row|<cell|
  (a) Exact>|<cell|(b) TVB with <math|M=100>>>|<row|<cell|<image|figures/paper2/la2d/rotate_composite/blend_fo|0.34par|||>>|<cell|<image|figures/paper2/la2d/rotate_composite/blend_mh|0.34par|||>>>|<row|<cell|(c)
  FO blending>|<cell|(d) MH blending>>>>><label|fig:composite.signal.2d>|<caption-detailed|Rotation
  of a composite signal with velocity <math|<ba>=<around|(|<frac|1|2>-y,x-<frac|1|2>|)>>,
  numerical solution with polynomial degree <math|N=4> on a mesh of
  <math|100<rsup|2>> elements.|TVB and blending schemes compared on composite
  signal.>>

  <section|2-D Euler equations><label|sec:numresults.2d.euler>

  We consider the two-dimensional Euler equations of gas dynamics given
  by<nbsp><eqref|eq:2deuler>. Unless otherwise specified, the adiabatic
  constant <math|\<gamma\>> will be taken as 1.4 in the numerical tests,
  which is the typical value for air. The time step size for polynomial
  degree <math|N> is computed as in<nbsp><eqref|eq:time.step.2d>. Most of the
  numerical results presented in this chapter use degree <math|N=4> for which
  CFL<math|<around|(|N|)>=0.069><nbsp><eqref|eq:time.step.2d>. As in the 1-D
  case,<nbsp><eqref|eq:time.step.2d> will not guarantee that the time step
  restriction for admissibility of MUSCL-Hancock scheme on the subcells is
  satisfied. However, we have found all tests to work
  with<nbsp><eqref|eq:time.step.2d> using <math|<value|Cs>=0.98> and the
  results are shown with that safety factor unless otherwise specified.

  For verification of numerical results and to demonstrate the accuracy gain
  of our proposed Lax-Wendroff blending scheme with MUSCL-Hancock
  reconstruction using Gauss-Legendre points, we will compare our results
  with the first order blending scheme using Gauss-Legendre-Lobatto (GLL)
  points of<nbsp><cite|hennemann2021> available in
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

  The description of this test containing a smooth solution with an analytic
  solution has been given in Section<nbsp><reference|sec:isentropic.vortex>.
  We run the computations up to a time <math|t=T> when the vortex has crossed
  the domain once in the diagonal direction.
  Figure<nbsp><reference|fig:isentropic.convergence>a compares the
  <math|L<rsup|2>> error of density sampled at <math|N+3> equispaced points
  against grid resolution when using the blending limiter. It can be seen
  that the limiter does not activate for adequately high resolution, yielding
  the same optimal convergence rates as those achieved without the limiter,
  as shown in Figure<nbsp><reference|fig:isentropic.convergence>b.

  <\big-figure>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/isentropic_convergence_ndofs_blend|0.45par|||>>|<cell|<image|figures/paper2/euler2d/isentropic_convergence_ndofs_no_limiter|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>

    <label|fig:isentropic.convergence.chblend>
  </big-figure|<caption-detailed|Convergence analysis of isentropic vortex
  test for polynomial degrees <math|N=3,4> when (a) the blending limiter is
  active (b) no limiter is active.|Isentropic convergence with blending
  limiter.>>

  <subsection|2-D Riemann problem><label|sec:2drp>

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
  enlarged domain up to time <math|t=0.25>. The density profiles obtained
  from the MUSCL-Hancock blending scheme and <with|font-family|tt|Trixi.jl>
  are shown in Figure<nbsp><reference|fig:rp2d>. We see that both schemes
  give similar resolution in most regions. The MUSCL-Hancock blending scheme
  gives better resolution of the small scale structures arising across the
  slip lines.

  A plot of the blending coefficients computed by the smoothness indicator is
  shown in Figure<nbsp><reference|fig:rp2d.alpha> at an early time
  <math|t=0.025><nbsp>(<reference|fig:rp2d.alpha>a) and the final time
  <math|t=0.25><nbsp>(<reference|fig:rp2d.alpha>b). The blending coefficient
  takes values close to <math|\<alpha\>=1> in the vicinity of shocks while
  smaller values are seen near the stationary contact discontinuities.
  Figure<nbsp><reference|fig:rp2d.alpha.stats> shows the percentage of cells
  in which the indicator function <math|\<alpha\>\<gtr\>0> as a function of
  time. From these figures we see that limiting is only performed in a small
  subset of the elements in the grid and the indicator is able to track the
  sharp features and ignore the smooth regions.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/rp2d/trixi|0.45par|||>>|<cell|<image|figures/paper2/euler2d/rp2d/lwfr|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>><label|fig:rp2d>>|<caption-detailed|2-D Riemann problem, density
  plots of numerical solution at <math|t=0.25> for degree <math|N=4> on a
  <math|256\<times\>256> mesh.|LW-MH on 2-D Riemann problem.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<table|<row|<cell|<image|figures/paper2/euler2d/rp2d/color_bar.pdf|0.6par|||>>|<cell|>>|<row|<cell|<image|figures/paper2/euler2d/rp2d/alpha_003.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/rp2d/alpha_final.png|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>>><label|fig:rp2d.alpha>|<caption-detailed|2-D Riemann problem,
  blending coefficient <math|\<alpha\>> for degree <math|N=4> on a
  <math|256\<times\>256> mesh.|Blending coefficient <math|\<alpha\>> for 2-D
  Riemann problem.>>

  <big-figure|<image|figures/paper2/euler2d/rp2d/rp2d_alp0.pdf|0.6par|||><label|fig:rp2d.alpha.stats>|<caption-detailed|2-D
  Riemann problem, percentage of elements where the blending coefficient
  <math|\<alpha\>\<gtr\>0> vs time <math|t>, for approximate solution with
  polynomial degree <math|N=4> on a <math|256\<times\>256> mesh.|2-D Riemann
  problem, percentage of elements with blending coefficient
  <math|\<alpha\>\<gtr\>0> vs <math|t>.>>

  <subsection|Double Mach reflection>

  The description and significance of this test has been given in
  Section<nbsp><reference|sec:dmr>. The simulation is run on a mesh of
  <math|600\<times\>150> elements using degree <math|N=4> polynomials up to
  time <math|t=0.2>. In Figure<nbsp><reference|fig:dmr>, we compare the
  results of <with|font-family|tt|Trixi.jl> with the MUSCL-Hancock blended
  scheme zoomed near the primary triple point. As expected, the small scale
  structures are captured better by the MUSCL-Hancock blended scheme.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|3|3|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-row-span|1>|<cwith|2|2|1|1|cell-col-span|2>|<table|<row|<cell|<image|figures/paper2/euler2d/dmr/full_lw.png|0.9par|||>>|<cell|>>|<row|<cell|(a)
  LW-MH>|<cell|>>|<row|<cell|<image|figures/paper2/euler2d/dmr/trixi.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/dmr/lwfr.png|0.45par|||>>>|<row|<cell|(b)
  <with|font-family|tt|Trixi.jl> zoomed>|<cell|(c) LW-MH
  zoomed>>>>><label|fig:dmr>>|<caption-detailed|Double Mach reflection
  problem, density plots of numerical solution at <math|t=0.2> using
  polynomial degree <math|N=4> on a <math|600\<times\>150> mesh zoomed near
  the primary triple point.|Double Mach reflection with LW-MH.>>

  <subsection|Kelvin-Helmholtz instability><label|sec:kh>

  Fluid instabilities are essential for mixing processes and turbulence
  production, and play a significant role in many astrophysical phenomena.
  They are crucial for accurately modeling stripping of gas from satellite
  galaxies, as well as calculating the expected levels of turbulence and
  entropy in the intracluster gas of galaxy clusters<nbsp><cite|Volker2010>.
  The Kelvin-Helmholtz instability is a common fluid instability that occurs
  across contact discontinuities in the presence of a tangential shear flow.
  This instability leads to the formation of vortices that grow in amplitude
  and can eventually lead to the onset of turbulence. We adopt the initial
  conditions for this instability from<nbsp><cite|Volker2010> over the domain
  <math|<around|[|0,1|]><rsup|2>>,

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<rho\>*<around|(|x,y|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|2,<space|1em>>|<cell|<text|if><space|1em>0.25\<less\>y\<less\>0.75>>|<row|<cell|1,<space|1em>>|<cell|<text|otherwise>>>>>>>>|<row|<cell|u*<around|(|x,y|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|0.5,<space|1em>>|<cell|<text|if><space|1em>0.25\<less\>y\<less\>0.75>>|<row|<cell|-0.5,<space|1em>>|<cell|<text|otherwise>,>>>>>>>|<row|<cell|v<around|(|x,y|)>>|<cell|=>|<cell|w<rsub|0>*sin<around|(|4*\<pi\>*x|)>*<around*|{|exp
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
  degree <math|N=4> on a mesh of 512<rsup|2> elements with periodic boundary
  conditions. We compare the density profiles of
  <with|font-family|tt|Trixi.jl> and our MUSCL-Hancock blending scheme in
  Figure<nbsp><reference|fig:kh>. The presence of more vortex structures with
  the MUSCL-Hancock scheme suggests that the scheme has lesser dissipation
  errors and is capable of capturing small scale features.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-lborder|0ln>|<cwith|4|4|2|2|cell-halign|c>|<cwith|4|4|2|2|cell-rborder|0ln>|<cwith|4|4|1|2|cell-valign|c>|<cwith|5|5|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/kh_schaal/trixi_512x512.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/kh_schaal/lwfr_512x512.png|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>|<row|<cell|>|<cell|>>|<row|<cell|<image|figures/paper2/euler2d/kh_schaal/trixi_512x512_zoom.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/kh_schaal/lwfr_512x512_zoom.png|0.45par|||>>>|<row|<cell|(c)
  <verbatim|Trixi.jl> zoomed around top left>|<cell|(d) LW-MH zoomed around
  top left>>>>><label|fig:kh>>|<caption-detailed|Kelvin-Helmholtz
  instability, density plots of numerical solution at <math|t=0.4> using
  polynomial degree <math|N=4> with Rusanov flux on a 512<rsup|2> element
  mesh.|Kelvin-Helmholtz instability with LW-MH.>>

  <subsection|Astrophysical jet><label|sec:m2000>

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
  used a smaller time step with <math|<value|Cs>=0.5>
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

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/M2000/trixi_revised.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/M2000/lwfr_revised.png|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>><label|fig:astrophysical.jet>>|<caption-detailed|Mach 2000
  astrophysical jet, density plot of numerical solution in log scales on
  <math|400\<times\>400> mesh at time <math|t=0.001>.|Mach 2000 astrophysical
  jet with LW-MH.>>

  <subsection|Sedov's blast case with periodic boundary conditions>

  Similar to Sedov's blast test in Section<nbsp><reference|sec:sedov.blast.1d>
  this test from<nbsp><cite|ramirez2021> on domain
  <math|<around|[|-1.5,1.5|]><rsup|2>> has energy concentrated at the origin.
  More precisely, for the initial condition, we assume that the gas is at
  rest (<math|u=v=0>) with Gaussian distribution of density and pressure

  <\equation>
    \<rho\><around|(|x,y|)>=\<rho\><rsub|0>+<frac|1|4*\<pi\>*\<sigma\><rsub|\<rho\>><rsup|2>>*e<rsup|-<frac|r<rsup|2>|2*\<sigma\><rsub|\<rho\>><rsup|2>>>,<space|1em>p<around|(|x,y|)>=p<rsub|0>+<frac|\<gamma\>-1|4*\<pi\>*\<sigma\><rsub|p><rsup|2>>*e<rsup|-<frac|r<rsup|2>|2*\<sigma\><rsub|p><rsup|2>>>,<space|1em>r<rsup|2>=x<rsup|2>+y<rsup|2>
  </equation>

  where <math|\<sigma\><rsub|\<rho\>>=0.25> and
  <math|\<sigma\><rsub|p>=0.15>. The ambient density and ambient pressure are
  set to <math|\<rho\><rsub|0>=1>, <math|p<rsub|0>=10<rsup|-5>>. There are
  two differences in this Sedov's test compared to the previous - the energy
  concentrated at the origin is lesser, and domain is assumed to be periodic.
  When shocks collide at the periodic boundaries, the resulting interaction
  leads to the formation of small scale structures. A reference solution on a
  <math|128<rsup|2>> element mesh with polynomial degree <math|N=4> is shown
  in Figure<nbsp><reference|fig:blast.periodic.reference>. In
  Figure<nbsp><reference|fig:blast.periodic>, we compare the density profiles
  of the numerical solutions of polynomial degree <math|N=4> on a mesh of
  <math|64<rsup|2>> elements using <with|font-family|tt|Trixi.jl> and the
  proposed MUSCL-Hancock blending scheme in log scales. The solution on the
  coarse mesh generated by the proposed scheme is able to resolve small scale
  structures better than the solution of <verbatim|Trixi.jl> on the coarse
  mesh. This is most evidently seen by looking at the
  <with|font-shape|italic|mushroom structures> as some of the mushroom
  structures in the MUSCL-Hancock scheme (Figure<nbsp><reference|fig:blast.periodic>b)
  look very similar to the reference solution
  (Figure<nbsp><reference|fig:blast.periodic.reference>b).

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/sedov_gassner/reference_t2|0.45par|||>>|<cell|<image|figures/paper2/euler2d/sedov_gassner/reference|0.45par|||>>>|<row|<cell|(a)
  <math|t=2>>|<cell|(b) <math|t=20>>>>>><label|fig:blast.periodic.reference>>|<caption-detailed|Sedov's
  blast test with periodic domain, density plot of numerical solution on
  <math|128\<times\>128> mesh in log scales with degree <math|N=4> at (a)
  <math|t=2> and (b) <math|t=20> with polynomial degree <math|N=4> computed
  using <with|font-family|tt|Trixi.jl>.|Sedov's blast with periodic domain,
  reference solution.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/sedov_gassner/trixi|0.45par|||>>|<cell|<image|figures/paper2/euler2d/sedov_gassner/lwfr|0.45par|||>>>|<row|<cell|(a)
  <with|font-family|tt|Trixi.jl>>|<cell|(b)
  LW-MH>>>>><label|fig:blast.periodic>>|<caption-detailed|Sedov's blast test
  with periodic domain, density plot of numerical solution on
  <math|64\<times\>64> mesh in log scales at <math|t=20> with degree
  <math|N=4>.|Sedov's blast with periodic domain, LW-MH.>>

  <subsection|Detonation shock diffraction>

  This test<nbsp><cite|Takayama1991> involves a planar detonation wave that
  interacts with a wedge-shaped corner and diffracts around it, resulting in
  a complicated wave pattern comprising of transmitted and reflected shocks,
  as well as rarefaction waves. The computational domain is
  <math|\<Omega\>=<around|[|0,2|]><rsup|2>\<setminus\><around|(|<around|[|0,0.5|]>\<times\><around|[|0,1|]>|)>>
  and following<nbsp><cite|hennemann2021>, the simulation is performed by
  taking the initial condition to be a pure right-moving shock with Mach
  number of 100 initially located at <math|x=0.5> and travelling through a
  channel of resting gas. The post shock states are computed by normal
  relations<nbsp><cite|naca1951>, so that the initial data is

  <alignat*|2|<tformat|<table|<row|<cell|\<rho\>*<around|(|x,y|)>>|<cell|=<choice|<tformat|<table|<row|<cell|5.9970,<space|2em>>|<cell|<text|if
  >x\<le\>0.5>>|<row|<cell|1,>|<cell|<text|if
  >x\<gtr\>0.5>>>>>,<space|2em>>|<cell|*u
  <around|(|x,y|)>=<choice|<tformat|<table|<row|<cell|98.5914,<space|2em>>|<cell|<text|if
  >x\<le\>0.5>>|<row|<cell|0,>|<cell|<text|if
  >x\<gtr\>0.5>>>>>>>|<row|<cell|v<around|(|x,y|)>>|<cell|=0,<space|2em>>|<cell|p*<around|(|x,y|)>=<choice|<tformat|<table|<row|<cell|11666.5,<space|2em>>|<cell|<text|if
  >x\<le\>0.5>>|<row|<cell|1,>|<cell|<text|if >x\<gtr\>0.5>>>>>>>>>>

  The left boundary is set as inflow and right boundary is set as outflow,
  all other boundaries are solid walls. The numerical results at
  <math|t=0.01> with polynomial degree <math|N=4> on a Cartesian grid
  consisting of uniformly sized squares with
  <math|\<Delta\>x=\<Delta\>y=1/200> are shown in
  Figure<nbsp><reference|fig:shock.diffraction>. The results look similar
  to<nbsp><cite|hennemann2021>; the strong shock makes this a tough test for
  the admissibility preservation and negative pressure values are obtained if
  the proposed admissibility correction is not applied.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/shock_diffraction/density.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/shock_diffraction/mach.png|0.45par|||>>>|<row|<cell|(a)
  Density>|<cell|(b) Mach number>>>>><label|fig:shock.diffraction>>|<caption-detailed|Shock
  diffraction test, numerical solution at time <math|t=0.01> with polynomial
  degree <math|N=4>.|Shock diffraction test with LW-MH.>>

  <subsection|Forward facing step><label|sec:ffs>

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
  near the corner point, which is what we do in
  Chapter<nbsp><reference|ch:curved.meshes>. For now, we obtain the same
  outcome by forming 1-D meshes in <math|<around|[|0,1|]>,<around|[|0,3|]>>
  with the same grid spacing <math|\<Delta\>x<rsub|max>> away from the
  singularity and the smaller grid spacing
  <math|\<Delta\>x<rsub|min>=<frac|1|4>*\<Delta\>x<rsub|max>> in
  <math|<around|[|0.15,0.25|]>,<around|[|0.45,0.75|]>>. Then, the 2-D mesh is
  formed by taking a tensor product of the two 1-D meshes with cells from
  <math|<around|[|0.6,3|]>\<times\><around|[|0,0.2|]>> removed. We show the
  density profile of numerical solutions in
  Figure<nbsp>(<reference|fig:forward.step>a, b, c) for solution polynomial
  degrees <math|N=2,3,4> with <math|\<Delta\>x<rsub|max>=1/160>. The scheme
  captures both the shock and the small scale vortices, with better
  resolution of shear structures from the triple shock point near the top
  wall as the overall resolution is increased. The corner point singularity
  causes an artificial boundary layer and Mach stem to occur but these
  numerical artifacts decrease as we increase mesh resolution by increasing
  the polynomial degree. Figure<nbsp><reference|fig:ffs.alpha.stats> shows
  the time evolution of the percentage of cells in the grid where the
  blending coefficient <math|\<alpha\>\<gtr\>0> and
  Figure<nbsp><reference|fig:forward.step>d plots the blending coefficient
  for degree <math|N=4> solution at the final time; these figures show that
  the blending limiter is activated in a small fraction of the cells and only
  in the vicinity of shocks.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|8|10|1|1|cell-halign|c>|<cwith|8|10|1|1|cell-lborder|0ln>|<cwith|8|10|1|1|cell-rborder|0ln>|<cwith|8|10|1|1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/forward_step/colourbar.pdf|0.72par|||>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/N2.png|0.72par|||>>>|<row|<cell|(a)
  <math|N=2>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/N3.png|0.72par|||>>>|<row|<cell|(b)
  <math|N=3>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/N4.png|0.72par|||>>>|<row|<cell|(c)
  <math|N=4>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/alpha_colourbar.pdf|0.72par|||>>>|<row|<cell|<image|figures/paper2/euler2d/forward_step/alpha_no_colorbar.png|0.72par|||>>>|<row|<cell|(d)
  Blending coefficient <math|\<alpha\>> for
  <math|N=4>>>>>><label|fig:forward.step>>|<caption-detailed|Forward facing
  step, density plots of numerical solution at time <math|t=3> with solution
  polynomial degrees <math|N=2,3,4> (a, b, c) and blending coefficient plot
  for degree <math|N=4> (d). The meshes are formed by taking grid spacing
  <math|\<Delta\>x<rsub|max>=\<Delta\>y<rsub|max>> away from the corner and
  smaller grid spacing <math|\<Delta\>x<rsub|min>=\<Delta\>y<rsub|min>=<frac|1|4>*\<Delta\>x<rsub|max>>
  near the corner.|Forward facing step with LW-MH.>>

  <big-figure|<image|figures/paper2/euler2d/forward_step/ffs_alp0.pdf|0.65par|||><label|fig:ffs.alpha.stats>|<caption-detailed|Forward
  facing step test case, percentage of elements where the blending
  coefficient <math|\<alpha\>> is non-zero versus time <math|t> for
  approximate solution with polynomial degree <math|N=4> on a mesh with
  <math|\<Delta\>x<rsub|max>=1/160>.|Forward facing step, percentage of
  elements with blending coefficient <math|\<alpha\>\<gtr\>0> vs <math|t>.>>

  <section|Summary and conclusions><label|sec:sum.blend>

  An admissibility preserving subcell-based blending limiter for the high
  order Lax-Wendroff Flux Reconstruction (LWFR) scheme has been constructed
  by extending the LWFR scheme proposed in<nbsp><cite|babbar2022> using the
  blending limiter of<nbsp><cite|hennemann2021>. The scheme uses a smoothness
  indicator to blend two single-stage solvers on the FR grid, one based on
  the high order LWFR method and the other based on a finite volume update on
  the subcells. At the FR element interfaces, a
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
  admissibility constraints <math|<around|{|<value|ad><rsub|k>,k=1,\<ldots\>,K|}>>
  of the conservative variables and whose positivity implies that the
  solution is in the admissible set <math|<Uad>>, making the correction
  problem-independent. Once admissibility preservation in means is obtained,
  we use the scaling limiter of<nbsp><cite|zhang2010c> to enforce
  admissibility of the polynomial values. To enhance accuracy, we modified
  the blending scheme of<nbsp><cite|hennemann2021> to use Gauss-Legendre
  solution points and used the second-order MUSCL-Hancock scheme to compute
  the lower-order residual. We extended the slope restriction criterion
  of<nbsp><cite|Berthon2006> for admissibility of the MUSCL-Hancock scheme to
  non-cell-centered grids that arise in the blending scheme to maintain the
  conservation property. We also proposed a problem-independent procedure to
  enforce the slope restriction. The scheme is robust and the higher
  resolution of MUSCL-Hancock is more superior in capturing small scale
  structures, as was demonstrated by numerical experiments on compressible
  Euler equations.
</body>

<\initial>
  <\collection>
    <associate|algorithm-indentation|0tab>
    <associate|chapter-nr|4>
    <associate|font-base-size|12>
    <associate|info-flag|short>
    <associate|page-even|1in>
    <associate|page-first|102>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-odd-shift|0mm>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|project-flag|false>
    <associate|section-nr|12>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:flux.limit|<tuple|5.1|115>>
    <associate|alg:high.level.lw|<tuple|5.2|117>>
    <associate|auto-1|<tuple|5|103>>
    <associate|auto-10|<tuple|5.4|110>>
    <associate|auto-11|<tuple|5.4.1|112>>
    <associate|auto-12|<tuple|5.5|113>>
    <associate|auto-13|<tuple|5.6|116>>
    <associate|auto-14|<tuple|5.7|117>>
    <associate|auto-15|<tuple|5.7.1|118>>
    <associate|auto-16|<tuple|5.7.1.1|118>>
    <associate|auto-17|<tuple|5.3|118>>
    <associate|auto-18|<tuple|5.7.1.2|119>>
    <associate|auto-19|<tuple|5.4|119>>
    <associate|auto-2|<tuple|5.1|103>>
    <associate|auto-20|<tuple|5.7.1.3|119>>
    <associate|auto-21|<tuple|5.5|120>>
    <associate|auto-22|<tuple|5.7.1.4|120>>
    <associate|auto-23|<tuple|5.6|121>>
    <associate|auto-24|<tuple|5.7|121>>
    <associate|auto-25|<tuple|5.8|121>>
    <associate|auto-26|<tuple|5.8|122>>
    <associate|auto-27|<tuple|5.9|122>>
    <associate|auto-28|<tuple|5.9.1|123>>
    <associate|auto-29|<tuple|5.9|123>>
    <associate|auto-3|<tuple|5.2|103>>
    <associate|auto-30|<tuple|5.9.2|123>>
    <associate|auto-31|<tuple|5.10|124>>
    <associate|auto-32|<tuple|5.11|125>>
    <associate|auto-33|<tuple|5.12|125>>
    <associate|auto-34|<tuple|5.9.3|125>>
    <associate|auto-35|<tuple|5.13|126>>
    <associate|auto-36|<tuple|5.9.4|126>>
    <associate|auto-37|<tuple|5.14|127>>
    <associate|auto-38|<tuple|5.9.5|127>>
    <associate|auto-39|<tuple|5.15|128>>
    <associate|auto-4|<tuple|5.3|105>>
    <associate|auto-40|<tuple|5.9.6|128>>
    <associate|auto-41|<tuple|5.16|129>>
    <associate|auto-42|<tuple|5.17|130>>
    <associate|auto-43|<tuple|5.9.7|130>>
    <associate|auto-44|<tuple|5.18|131>>
    <associate|auto-45|<tuple|5.9.8|131>>
    <associate|auto-46|<tuple|5.19|132>>
    <associate|auto-47|<tuple|5.20|133>>
    <associate|auto-48|<tuple|5.10|133>>
    <associate|auto-5|<tuple|5.3.1|105>>
    <associate|auto-6|<tuple|5.1|106>>
    <associate|auto-7|<tuple|5.3.2|108>>
    <associate|auto-8|<tuple|5.2|109>>
    <associate|auto-9|<tuple|5.3.3|109>>
    <associate|ch:lw.subcell.limiter|<tuple|5|103>>
    <associate|defn:adm.pres|<tuple|5.1|104>>
    <associate|defn:mean.pres|<tuple|5.2|105>>
    <associate|eq:1d.smoothness.E|<tuple|5.12|108>>
    <associate|eq:Fblend|<tuple|5.11|107>>
    <associate|eq:blended.scheme|<tuple|5.6|106>>
    <associate|eq:concave.theta|<tuple|5.24|112>>
    <associate|eq:conservation.blending.scheme|<tuple|5.10|107>>
    <associate|eq:conv.pres.con.law|<tuple|5.4|104>>
    <associate|eq:delta.defn|<tuple|5.17|110>>
    <associate|eq:evolution|<tuple|5.19|111>>
    <associate|eq:flux.concave.theta|<tuple|5.29|115>>
    <associate|eq:flux.optimization.problem|<tuple|5.28|115>>
    <associate|eq:fo.at.face|<tuple|5.14|110>>
    <associate|eq:fravgup|<tuple|5.3|104>>
    <associate|eq:low.order.cell.avg.update|<tuple|5.9|107>>
    <associate|eq:low.order.high.level|<tuple|5.5|105>>
    <associate|eq:low.order.tilde.update|<tuple|5.27|115>>
    <associate|eq:low.order.update|<tuple|5.8|106>>
    <associate|eq:mh.at.face|<tuple|5.20|111>>
    <associate|eq:mh.corr.flux|<tuple|5.16|110>>
    <associate|eq:numresults.2dadv|<tuple|5.8|121>>
    <associate|eq:optimization.problem|<tuple|5.23|112>>
    <associate|eq:pk.slope.correction|<tuple|5.25|113>>
    <associate|eq:reconstruction|<tuple|5.18|111>>
    <associate|eq:riemann.problem|<tuple|5.15|110>>
    <associate|eq:smoothing|<tuple|5.13|109>>
    <associate|eq:subcell.defn|<tuple|5.7|106>>
    <associate|eq:uad.form|<tuple|5.1|103>>
    <associate|eq:us.defn.main|<tuple|5.21|111>>
    <associate|eq:use.weak.convexity|<tuple|5.25|113>>
    <associate|eq:ustar.in.uad|<tuple|5.22|112>>
    <associate|eq:weak.convexity|<tuple|5.2|104>>
    <associate|fig:ShuOsher.chblend|<tuple|5.3|118>>
    <associate|fig:alpha.func|<tuple|5.2|109>>
    <associate|fig:astrophysical.jet|<tuple|5.15|128>>
    <associate|fig:blast.chblend|<tuple|5.4|119>>
    <associate|fig:blast.periodic|<tuple|5.17|130>>
    <associate|fig:blast.periodic.reference|<tuple|5.16|129>>
    <associate|fig:composite.signal.2d|<tuple|5.8|122>>
    <associate|fig:dmr|<tuple|5.13|126>>
    <associate|fig:double.rarefaction|<tuple|5.6|121>>
    <associate|fig:ffs.alpha.stats|<tuple|5.20|133>>
    <associate|fig:forward.step|<tuple|5.19|132>>
    <associate|fig:isentropic.convergence.chblend|<tuple|5.9|123>>
    <associate|fig:kh|<tuple|5.14|127>>
    <associate|fig:leblanc|<tuple|5.7|121>>
    <associate|fig:rp2d|<tuple|5.10|124>>
    <associate|fig:rp2d.alpha|<tuple|5.11|125>>
    <associate|fig:rp2d.alpha.stats|<tuple|5.12|125>>
    <associate|fig:sedov.blast|<tuple|5.5|120>>
    <associate|fig:shock.diffraction|<tuple|5.18|131>>
    <associate|fig:subcells|<tuple|5.1|106>>
    <associate|footnote-5.1|<tuple|5.1|111>>
    <associate|footnr-5.1|<tuple|5.1|111>>
    <associate|rmk:why.same.flux|<tuple|5.3|107>>
    <associate|sec:2drp|<tuple|5.9.2|123>>
    <associate|sec:admissibility.preservation|<tuple|5.5|113>>
    <associate|sec:alg|<tuple|5.6|116>>
    <associate|sec:blast.chblend|<tuple|5.7.1.2|119>>
    <associate|sec:blend.review|<tuple|5.2|103>>
    <associate|sec:blending.scheme|<tuple|5.3.1|105>>
    <associate|sec:controlling.oscillations|<tuple|5.3|105>>
    <associate|sec:ffs|<tuple|5.9.8|131>>
    <associate|sec:fo|<tuple|5.3.3|109>>
    <associate|sec:kh|<tuple|5.9.4|126>>
    <associate|sec:m2000|<tuple|5.9.5|127>>
    <associate|sec:mh|<tuple|5.4|110>>
    <associate|sec:num.results.chblend|<tuple|5.7|117>>
    <associate|sec:numresults.2d.euler|<tuple|5.9|122>>
    <associate|sec:res1dsys.chblend|<tuple|5.7.1|118>>
    <associate|sec:sedov.blast.1d|<tuple|5.7.1.3|119>>
    <associate|sec:shuosher.blend|<tuple|5.7.1.1|118>>
    <associate|sec:slope.limiting|<tuple|5.4.1|112>>
    <associate|sec:smooth.ind|<tuple|5.3.2|108>>
    <associate|sec:sum.blend|<tuple|5.10|133>>
    <associate|thm:lwfr.admissibility|<tuple|5.5|114>>
    <associate|thm:muscl.admissibility.theorem|<tuple|5.4|111>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hennemann2021

      hennemann2021

      hennemann2021

      babbar2023admissibility

      Meena_Kumar_Chandrashekar_2017

      zhang2010c

      godunov1959

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989a

      Persson2006

      klockner2011

      hennemann2021

      hennemann2021

      Canuto2007

      Persson2006

      hennemann2021

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

      babbar2023admissibility

      ramirez2021

      ramirez2021

      Zhang2010b

      moe2017

      moe2017

      ramirez2021

      babbar2023admissibility

      ramirez2021

      Zhang2010b

      Zhang2010b

      ramirez2021

      Zhang2010b

      Zhang2010b

      ramirez2021

      babbar2022

      hennemann2021

      Ranocha2022

      schlottkelakemper2021purely

      tenkai

      paperrepo

      Bezanson2017

      Qiu2005b

      Qiu2005b

      sedov1959

      zhang2012

      Zhang2010b

      hennemann2021

      Ranocha2022

      Glimm1985

      Zhang1990

      Lax1998

      Zhang1990

      Lax1998

      Volker2010

      Volker2010

      ha2005

      zhang2010c

      ramirez2021

      Takayama1991

      hennemann2021

      naca1951

      hennemann2021

      emery1968

      Woodward1984

      babbar2022

      hennemann2021

      zhang2010c

      hennemann2021

      Berthon2006
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.1>|>
        Subcells used by lower order scheme for degree
        <with|mode|<quote|math>|N=4>.
      </surround>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.2>|>
        Logistic function used to map energy to a smoothness coefficient
        <with|mode|<quote|math>|\<alpha\>\<in\><around|[|0,1|]>>.
      </surround>|<pageref|auto-8>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.3>|>
        Comparing TVB and blending schemes on Shu-Osher test.
      </surround>|<pageref|auto-17>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.4>|>
        Comparing TVB and blending schemes on blast wave.
      </surround>|<pageref|auto-19>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.5>|>
        Sedov's blast wave problem
      </surround>|<pageref|auto-21>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.6>|>
        Double rarefaction problem with LW-MH.
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.7>|>
        Leblanc's test with LW-MH.
      </surround>|<pageref|auto-24>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.8>|>
        TVB and blending schemes compared on composite signal.
      </surround>|<pageref|auto-26>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.9>|>
        Isentropic convergence with blending limiter.
      </surround>|<pageref|auto-29>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.10>|>
        LW-MH on 2-D Riemann problem.
      </surround>|<pageref|auto-31>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.11>|>
        Blending coefficient <with|mode|<quote|math>|\<alpha\>> for 2-D
        Riemann problem.
      </surround>|<pageref|auto-32>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.12>|>
        2-D Riemann problem, percentage of elements with blending coefficient
        <with|mode|<quote|math>|\<alpha\>\<gtr\>0> vs
        <with|mode|<quote|math>|t>.
      </surround>|<pageref|auto-33>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.13>|>
        Double Mach reflection with LW-MH.
      </surround>|<pageref|auto-35>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.14>|>
        Kelvin-Helmholtz instability with LW-MH.
      </surround>|<pageref|auto-37>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.15>|>
        Mach 2000 astrophysical jet with LW-MH.
      </surround>|<pageref|auto-39>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.16>|>
        Sedov's blast with periodic domain, reference solution.
      </surround>|<pageref|auto-41>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.17>|>
        Sedov's blast with periodic domain, LW-MH.
      </surround>|<pageref|auto-42>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.18>|>
        Shock diffraction test with LW-MH.
      </surround>|<pageref|auto-44>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.19>|>
        Forward facing step with LW-MH.
      </surround>|<pageref|auto-46>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.20>|>
        Forward facing step, percentage of elements with blending coefficient
        <with|mode|<quote|math>|\<alpha\>\<gtr\>0> vs
        <with|mode|<quote|math>|t>.
      </surround>|<pageref|auto-47>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|5.<space|2spc>Admissibility
      preserving subcell based blending limiter>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      5.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      5.2.<space|2spc>Admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      5.3.<space|2spc>On controlling oscillations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      <with|par-left|<quote|1tab>|5.3.1.<space|2spc>Blending scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|5.3.2.<space|2spc>Smoothness indicator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|5.3.3.<space|2spc>First order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      5.4.<space|2spc>Higher order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|5.4.1.<space|2spc>Slope limiting in
      practice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      5.5.<space|2spc>Flux limiter for admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      5.6.<space|2spc>Some implementation details
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      5.7.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      <with|par-left|<quote|1tab>|5.7.1.<space|2spc>1-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|5.7.1.1.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|2tab>|5.7.1.2.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|2tab>|5.7.1.3.<space|2spc>Sedov's blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|2tab>|5.7.1.4.<space|2spc>Riemann problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      5.8.<space|2spc>2-D advection equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      5.9.<space|2spc>2-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      <with|par-left|<quote|1tab>|5.9.1.<space|2spc>Isentropic vortex
      convergence test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>>

      <with|par-left|<quote|1tab>|5.9.2.<space|2spc>2-D Riemann problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|1tab>|5.9.3.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|1tab>|5.9.4.<space|2spc>Kelvin-Helmholtz
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|1tab>|5.9.5.<space|2spc>Astrophysical jet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>>

      <with|par-left|<quote|1tab>|5.9.6.<space|2spc>Sedov's blast case with
      periodic boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      <with|par-left|<quote|1tab>|5.9.7.<space|2spc>Detonation shock
      diffraction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>>

      <with|par-left|<quote|1tab>|5.9.8.<space|2spc>Forward facing step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>>

      5.10.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>
    </associate>
  </collection>
</auxiliary>