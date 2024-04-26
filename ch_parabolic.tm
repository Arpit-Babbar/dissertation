<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|british|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <chapter|Parabolic equations><label|ch:parabolic>

  <section|Introduction>

  In this chapter, we develop the LWFR scheme to solve second order PDE in
  conservative form. Examples of such equations include compressible
  Navier-Stokes and resistive magnetohydrodynamics. We make use of the the
  BR1 scheme<nbsp><cite|Bassi1997> which was the first scheme for using
  spectral element methods to solve second order equations. Following
  Chapter<nbsp><reference|ch:curved.meshes>, we solve second order equations
  on curvilinear meshes and use error based time stepping.

  This chapter is organized as follows. In
  Section<nbsp><reference|sec:transformations.parabolic>, the notations and
  transformations of second order equations from curved element to a
  reference cube are reviewed. In Section<nbsp><reference|sec:lwfr.2nd.order>,
  the LWFR scheme for second order equations is introduced. The numerical
  results are shown in Section<nbsp><reference|sec:results> and a summary of
  the chapter is provided in Section<nbsp><reference|sec:conclusion>.

  <section|Curvilinear coordinates for parabolic
  equations><label|sec:transformations.parabolic>

  We work with a system of parabolic equations in conservative form in
  <math|d> dimensions

  <\equation>
    \<partial\><rsub|t>*<uu>+<Div><fa><around*|(|<uu>|)>=<Div><fv><around*|(|<uu>,<Grad>*<uu>|)><label|eq:parabolic.parabolic.eqn>
  </equation>

  with some initial and boundary conditions. Here,
  <math|<uu>\<in\>\<bbb-R\><rsup|p>> is the solution vector and its gradient
  is the matrix <math|<Grad>*<uu>=<around*|(|\<partial\><rsub|x<rsub|1>>*<uu>,\<ldots\>,\<partial\><rsub|x<rsub|d>>*<uu>|)>\<in\>\<bbb-R\><rsup|p\<times\>d>>.
  The <math|<fa>,<fv>> are the advective and viscous fluxes and can be seen
  as matrices <math|<pf>=<around*|(|<pf><rsub|1>,\<ldots\>,<pf><rsub|d>|)>\<in\>\<bbb-R\><rsup|p\<times\>d>>,
  <math|<bx>> is in domain <math|\<Omega\>\<subset\>\<bbb-R\><rsup|d>> and
  divergence of a flux is given by <math|<Div><pf>=<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|x<rsub|i>>*<pf><rsub|i>>.
  Following<nbsp><cite|Gassner_Winters_Hindenlang_Kopriva_2018>, we introduce
  some notations to describe the scheme. The action of a vector
  <math|<bb>\<in\>\<bbb-R\><rsup|d>> on <math|<bv>\<in\>\<bbb-R\><rsup|p>>
  gives <math|<bb>*<bv>\<in\>\<bbb-R\><rsup|p\<times\>d>> which is defined
  component-vice as

  <\equation>
    <bb>*<bv>=<around*|(|b<rsub|j>*<bv>|)><rsub|j=1><rsup|d><label|eq:parabolic.vector.vector>
  </equation>

  Further, the action of a matrix <math|<mB>=<around*|(|<bb><rsub|1>,\<ldots\>,<bb><rsub|d>|)>\<in\>\<bbb-R\><rsup|d\<times\>d>>
  on <math|<bv>=<around|(|<bv><rsub|1>,\<ldots\>,<bv><rsub|d>|)>\<in\>\<bbb-R\><rsup|p\<times\>d>>
  also gives <math|<mB>*<bv>\<in\>\<bbb-R\><rsup|p\<times\>d>> defined as

  <\equation>
    \<cal-B\>*<bv>=<big|sum><rsub|i=1><rsup|d><bb><rsub|i>*<bv><rsub|i>,<space|2em><bb><rsub|i>*<bv><rsub|i>=<around|(|b<rsub|i*j>*<bv><rsub|i>|)><rsub|j=1><rsup|d><label|eq:parabolic.matrix.operator.notation>
  </equation>

  The second order system<nbsp><eqref|eq:parabolic.parabolic.eqn> will be
  reduced to a first order system of equations following the BR1
  scheme<nbsp><cite|Bassi1997> where an auxiliary variable <math|<bq>> is
  introduced

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<bq>-<Grad>*<uu>>|<cell|=>|<cell|<value|bzero>>>|<row|<cell|\<partial\><rsub|t>*<uu>+<Div><pf><around*|(|<uu>,<bq>|)>>|<cell|=>|<cell|<bzero>>>>>><label|eq:parabolic.parabolic.in.first.order>
  </equation>

  We will be using the same FR elements <math|<around*|{|\<Omega\><rsub|e>|}>><nbsp><eqref|eq:curved.partition>,
  reference map <math|<bx>=\<Theta\><around*|(|<vxi>|)><nbsp><eqref|eq:curved.reference.map>>,
  multi-index <math|<bp>\<in\><value|Nnd>><nbsp><eqref|eq:curved.Nnd>,
  Lagrange polynomial basis <math|<around*|{|\<ell\><rsub|<bp>>|}><rsub|<bp>\<in\><value|Nnd>>>
  as in Section<nbsp><reference|sec:curved.curvilinear.coords> and again
  denote the covariant and contravariant basis vectors as
  <math|<around*|{|<ba><rsub|i>|}><rsub|i=1><rsup|3>,<around*|{|<ba><rsup|i>|}><rsub|i=1><rsup|3>>
  (Definition<nbsp><reference|defn:curved.covariant.basis>,<nbsp><reference|defn:curved.contravariant.basis>).
  The covariant and contravariant vectors will now be used to map the
  equations<nbsp><eqref|eq:parabolic.parabolic.in.first.order> to the
  reference element <math|<Oo>=<around*|[|-1,1|]><rsup|d>>.

  Using the Leibniz product rule of differentiation, and the metric
  identity<nbsp><eqref|eq:curved.metric.identity.contravariant> on the
  transformation of a gradient transformation<nbsp><eqref|eq:curved.gradient.transform.contravariant>,
  we get the non-conservative form of gradient of a scalar <math|\<phi\>> and
  thus of a vector <math|<uu>> in vector action
  notation<nbsp><eqref|eq:parabolic.vector.vector>

  <\equation>
    <Grad>*\<phi\>=<frac|1|J>*<big|sum><rsub|i=1><rsup|d>J*<ba><rsup|i>*<pdv|\<phi\>|<xii>>,<space|2em><Grad>*<uu>=<frac|1|J>*<big|sum><rsub|i=1><rsup|d>J*<ba><rsup|i>*<pdv|<uu>|<xii>>
  </equation>

  Following the notation of<nbsp><cite|Gassner_Winters_Hindenlang_Kopriva_2018>,
  define the transformation matrix <math|<M>=<around*|(|J*<ba><rsup|1>,\<ldots\>,J*<ba><rsup|d>|)>\<in\>\<bbb-R\><rsup|d\<times\>d>>
  so that with the matrix action notation<nbsp><eqref|eq:parabolic.matrix.operator.notation>

  <\equation>
    <Grad>*<uu>=<frac|1|J>*<M>*\<nabla\><rsub|<vxi>>*<uu><label|eq:parabolic.grad.transform>
  </equation>

  Within each element <math|\<Omega\><rsub|e>>, performing change of
  variables with the reference map <math|\<Theta\><rsub|e>><nbsp>(<reference|eq:curved.gradient.transform.contravariant>,<nbsp><reference|eq:curved.divergence.transform.contravariant>),
  the first order system<nbsp><eqref|eq:parabolic.parabolic.in.first.order>
  transforms into

  <\equation>
    <tabular|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|J*<bq>-<M>*\<nabla\><rsub|<vxi>>*<uu>>|<cell|=>|<cell|<bzero>>>|<row|<cell|J*\<partial\><rsub|t>*<uu>+\<nabla\><rsub|<vxi>>\<cdot\><tfa>>|<cell|=>|<cell|\<nabla\><rsub|<vxi>>\<cdot\><tfv><around*|(|<uu>,<bq>|)>>>>>><label|eq:parabolic.transformed.fo>
  </equation>

  where, as in<nbsp><eqref|eq:curved.contravariant.flux.defn>, we have

  <\equation>
    <around*|(|<tfs>|)><rsup|i>=J*<ba><rsup|i>\<cdot\><tfs>=<big|sum><rsub|n=1><rsup|d>J*a<rsub|n><rsup|i>*<fs><rsub|n>,<space|2em>\<alpha\>=a,v
  </equation>

  <section|Lax-Wendroff flux reconstruction><label|sec:lwfr.2nd.order>

  As in the earlier chapters, the solution
  of<nbsp><eqref|eq:parabolic.parabolic.eqn> will be approximated by
  piecewise polynomial functions which are allowed to be discontinuous across
  the elements. Within each element <math|\<Omega\><rsub|e>>, the solution
  will be represented by degree <math|N> Lagrange basis in the reference
  coordinates<nbsp><eqref|eq:curved.approx.soln> and <math|<uebp>> are the
  unknown values at solution points which are taken to be GLL points.

  <subsection|Solving for <bq>>

  The system<nbsp><eqref|eq:parabolic.transformed.fo> is solved at each time
  step for evolving the numerical solution from time <math|t<rsup|n>> to
  <math|t<rsup|n+1>>, where the first step is solving the equations for
  <math|<bq>>. The BR1 scheme was initially introduced for Discontinuous
  Galerkin (DG) method in<nbsp><cite|Bassi1997> and is used as a Flux
  Reconstruction (FR) scheme by exploiting the equivalence between FR and
  DG<nbsp><cite|Huynh2007>, see for example<nbsp><cite|witherden2014>. Here,
  we show the first step in the FR framework<\footnote>
    Unlike FR, there is no <with|font-shape|italic|physical flux> in the
    first step of the BR1 scheme where we solve for <math|<bq>>. We call this
    step FR due to the application of correction functions to enforce global
    continuity.
  </footnote>, repeating some notations from
  Chapter<nbsp><reference|ch:curved.meshes>. Recall that we defined the
  multi-index <math|<bp>=<around|(|p<rsub|i>|)><rsub|i=1><rsup|d>> where
  <math|p<rsub|i>\<in\><around|{|0,1*\<ldots\>,N|}>>. Let
  <math|i\<in\><around|{|1,\<ldots\>,d|}>> denote a coordinate direction and
  <math|s\<in\><around|{|L,R|}>> so that <math|<around|(|s,i|)>> corresponds
  to the face <math|<Ois>> in direction <math|i> on side <math|s> which has
  the reference outward normal <math|<bnr><rsub|s,i>>, see
  Figure<nbsp><reference|fig:curved.ref.map>. Thus, <math|<Oip>> denotes the
  face where reference outward normal is <math|<bnr><rsub|R,i>=<be><rsub|i>>
  and <math|<Oim>> has outward unit normal
  <math|<bnr><rsub|L,i>=-<bnr><rsub|R,i>>. From now, we will suppress the
  <math|R> and denote <math|<bnr><rsub|i>=<bnr><rsub|R,i>>.

  The FR scheme is a collocation at each of the solution points
  <math|<around|{|<vxi><rsub|<bp>>=<around|(|\<xi\><rsub|p<rsub|i>>|)><rsub|i=1><rsup|d>,p<rsub|i>=0,\<ldots\>,N|}>>.
  We will thus explain the scheme for a fixed <math|<vxi>=<vxi><rsub|<bp>>>
  and denote <math|<vxi><rsub|i><rsup|s>> as the projection of <vxi> to the
  face <math|s=L,R> in the <math|i<rsup|th>> direction
  (Figure<nbsp><reference|fig:curved.ref.map>), as defined
  in<nbsp><eqref|eq:curved.xis.notation>. A correction of
  <math|<uu><rsub|e><rsup|\<delta\>>> is performed to obtain
  <math|<uu><rsub|e>> as

  <\equation>
    <uu><rsub|e><around|(|<vxi>|)>=<uu><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>+<around|(|<uu><rsub|e><rsup|\<ast\>>-<uu><rsub|e><rsup|\<delta\>>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><around|(|\<xi\><rsub|p<rsub|i>>|)>+<around|(|<uu><rsub|e><rsup|\<ast\>>-<uu><rsub|e><rsup|\<delta\>>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><around|(|\<xi\><rsub|p<rsub|i>>|)><label|eq:parabolic.u.corrected>
  </equation>

  where <math|<uu><rsup|\<delta\>><rsub|e><around|(|<vxi><rsub|i><rsup|s>|)>>
  denotes the trace value of the normal flux in element <math|e> and
  <math|<uu><rsub|e><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|s>|)>> denotes
  an approximation of the solution at the interface <math|<around|(|s,i|)>>
  which is chosen to be

  <\equation>
    <uu><rsub|e><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|s>|)>=<frac|1|2>*<around|(|<uu><rsup|+><rsub|s,i>+<uu><rsup|-><rsub|s,i>|)><label|eq:parabolic.central.u>
  </equation>

  and <math|g<rsub|L>,g<rsub|R>> are FR correction
  functions<nbsp><cite|Huynh2007> (Section<nbsp><reference|sec:rk>). Thus,
  <math|<bq>> can be obtained from<nbsp><eqref|eq:parabolic.transformed.fo>
  as

  <\equation>
    <bq>=<frac|1|J>*<M>*\<nabla\><rsub|<vxi>>*<uu><rsub|e><around|(|<vxi>|)><label|eq:parabolic.q.defn>
  </equation>

  <subsection|Time averaging>

  The LWFR scheme is obtained by performing the Lax-Wendroff procedure for
  Cartesian domains on the transformed equation<nbsp><eqref|eq:parabolic.transformed.fo>.
  Let <math|<uu><rsup|n>> denote the solution at time <math|t=t<rsub|n>> and
  <math|<bq><rsup|n>> denoting the gradient computed
  from<nbsp><eqref|eq:parabolic.q.defn>. As we did in the previous chapters,
  the solution at the next time level can be written as

  <\equation*>
    <uu><rsup|n+1>=<uu><rsup|n>+<big|sum><rsub|k<subindex>1><rsup|N+1><frac|\<Delta\>t<rsup|k>|k!>*\<partial\><rsub|t><rsup|<around|(|k|)>>*<uu><rsup|n>+O<around|(|\<Delta\>t<rsup|N+2>|)>
  </equation*>

  where <math|N> is the solution polynomial degree. Then, use
  <math|<uu><rsub|t>=-<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><around|(|<tfa>-<tfv>|)>>
  from<nbsp><eqref|eq:parabolic.transformed.fo> to swap a temporal derivative
  with a spatial derivative and retaining terms upto <math|\<Delta\>t> to get

  <\equation*>
    <uu><rsup|n+1>=<uu><rsup|n>-<frac|1|J>*<big|sum><rsub|k=1><rsup|N+1><frac|\<Delta\>t<rsup|k>|k!>*\<partial\><rsub|t><rsup|<around|(|k-1|)>>*<around|(|\<nabla\><rsub|<vxi>>\<cdot\><tfa>|)>+<frac|1|J>*<big|sum><rsub|k=1><rsup|N+1><frac|\<Delta\>t<rsup|k>|k!>*\<partial\><rsub|t><rsup|<around|(|k-1|)>>*<around|(|\<nabla\><rsub|<vxi>>\<cdot\><tfv>|)>
  </equation*>

  Shifting indices and writing in a conservative form gives

  <\equation>
    <uu><rsup|n+1>=<uu><rsup|n>-<frac|\<Delta\>t|J>*\<nabla\><rsub|<vxi>>\<cdot\><tFa>+<frac|\<Delta\>t|J>*\<nabla\><rsub|<vxi>>\<cdot\><tFv><label|eq:parabolic.lw.update>
  </equation>

  where <math|<tFa>,<tFv>> are time averages of the contravariant advective
  and viscous fluxes <math|<tfa>,<tfv>>

  <\equation>
    <tFs>=<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>*<tfs>\<approx\><frac|1|\<Delta\>t>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><tfs>*<ud>t,<space|2em>\<alpha\>=a,v<label|eq:parabolic.time.averaged.flux>
  </equation>

  We will find local order <math|N+1> approximations
  <math|<tFad><rsub|e>,<tFvd><rsub|e>> to
  <math|<tFa>,<tFv>><nbsp>(Section<nbsp><reference|sec:alwp>) which will be
  discontinuous across element interfaces. Then, in order to couple the
  neighbouring elements, continuity of the normal fluxes at the interfaces
  will be enforced by constructing the <with|font-shape|italic|continuous
  flux approximation> using the FR correction functions
  <math|g<rsub|L>,g<rsub|R>><nbsp><cite|Huynh2007>
  (Section<nbsp><reference|sec:rk>) and the numerical fluxes. Thus, once the
  local approximations <math|<tFad><rsub|e>,<tFvd><rsub|e>> are computed, we
  construct the advective and viscous numerical fluxes for element <math|e>
  in coordinate direction <math|i\<in\><around|{|1,\<ldots\>*d|}>> at the
  side <math|s\<in\><around|{|L,R|}>> (following the notation
  from<nbsp><eqref|eq:curved.xis.notation>) by using
  Rusanov's<nbsp><cite|Rusanov1962> and the central flux respectively

  <\eqnarray>
    <tformat|<table|<row|<cell|<around|(|<tFa><rsub|e>\<cdot\><bnr><rsub|s,i>|)><rsup|\<ast\>>>|<cell|=>|<cell|<frac|1|2>*<around|(|<around|(|<tFad>\<cdot\><bnr><rsub|s,i>|)><rsup|+>+<around|(|<tFad>\<cdot\><bnr><rsub|s,i>|)><rsup|->|)>-<frac|\<lambda\><rsub|s,i>|2>*<around|(|<uU><rsup|+><rsub|s,i>-<uU><rsup|-><rsub|s,i>|)><eq-number><label|eq:parabolic.rusanov.flux.lw>>>|<row|<cell|<around|(|<tFv><rsub|e>\<cdot\><bnr><rsub|s,i>|)><rsup|\<ast\>>>|<cell|=>|<cell|<frac|1|2>*<around|(|<around|(|<tFvd>\<cdot\><bnr><rsub|s,i>|)><rsup|+>+<around|(|<tFvd>\<cdot\><bnr><rsub|s,i>|)><rsup|->|)>>>>>
  </eqnarray>

  The <math|<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|s,i>|)><rsup|\<pm\>>>
  and <math|<uU><rsub|s,i><rsup|\<pm\>>> denote the trace values of the
  normal flux and time average solution from outer, inner directions
  respectively; the inner direction corresponds to the element <math|e> while
  the outer direction corresponds to its neighbour across the interface
  <math|<around|(|s,i|)>>. The Rusanov's flux<nbsp><eqref|eq:parabolic.rusanov.flux.lw>
  is exactly as discussed in the inviscid
  case<nbsp><eqref|eq:curved.rusanov.flux.lw>.

  The advective and viscous fluxes have been treated separately so far to
  keep a simple implementation of the different boundary conditions of the
  two. However, for the final evolution<nbsp><eqref|eq:parabolic.lw.update>,
  we can combine them to define <math|<tF>=<tFa>-<tFv>>, so that the
  interface numerical fluxes can also be summed as
  <math|<around|(|<tF><rsub|e>\<cdot\><wide|<bn>|^><rsub|s,i>|)><rsup|\<ast\>>=<around|(|<tFa><rsub|e>\<cdot\><wide|<bn>|^><rsub|s,i>|)><rsup|\<ast\>>-<around|(|<tFv><rsub|e>\<cdot\><wide|<bn>|^><rsub|s,i>|)><rsup|\<ast\>>>
  and thus the continuous time averaged numerical flux is constructed as

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<around|(|<tF><rsub|e><around|(|<vxi>|)>|)><rsup|i>=<around|(|<tF><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>|)><rsup|i>>|<cell|+<around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>>-<tF><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><around|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|>|<cell|+<around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>>-<tF><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><around|(|\<xi\><rsub|p<rsub|i>>|)>>>>>><label|eq:parabolic.cts.time.avg.flux>
  </equation>

  Substituting <math|<tF><rsub|e>> in<nbsp><eqref|eq:parabolic.lw.update>,
  the explicit LWFR update is

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<uebp><rsup|n+1>=<uebp><rsup|n>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tF><rsup|\<delta\>><rsub|e><around|(|<vxi><rsub|<bp>>|)>>|<cell|-<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|>|<cell|-<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>>>>>><label|eq:parabolic.lwfr.update.curvilinear>
  </equation>

  <subsubsection|Approximate Lax-Wendroff procedure><label|sec:alwp>

  We now illustrate how to locally approximate
  <math|<tFad>,<tFvd>><nbsp><eqref|eq:parabolic.time.averaged.flux> for
  degree <math|N=1> using the approximate Lax-Wendroff
  procedure<nbsp><cite|Zorio2017>. For <math|N=1>,<nbsp><eqref|eq:parabolic.time.averaged.flux>
  requires <math|\<partial\><rsub|t>*<tfa>,\<partial\><rsub|t>*<tfv>> which
  are

  <\equation>
    <tabular|<tformat|<table|<row|<cell|\<partial\><rsub|t>*<tfa>>|<cell|\<approx\>>|<cell|<frac|<tfa><around*|(|<uu>+\<Delta\>t<uu><rsub|t>|)>-<tfa><around*|(|<uu>-\<Delta\>t<uu><rsub|t>|)>|2*\<Delta\>t>\<backassign\>\<partial\><rsub|t>*<tfad>>>|<row|<cell|\<partial\><rsub|t>*<tfv>>|<cell|\<approx\>>|<cell|<frac|<tfv><around*|(|<uu>+\<Delta\>t*<uu><rsub|t>,\<nabla\><uu>+\<Delta\>t*<around*|(|\<nabla\><uu>|)><rsub|t>|)>-<tfv><around*|(|<uu>-\<Delta\>t*<uu><rsub|t>,\<nabla\><uu>-\<Delta\>t*<around*|(|\<nabla\><uu>|)><rsub|t>|)>|2*\<Delta\>t>\<backassign\>\<partial\><rsub|t>*<tfvd>>>>>><label|eq:parabolic.ft.defn>
  </equation>

  and <math|<uu><rsub|t>,<around*|(|\<nabla\><uu>|)><rsub|t>> are
  approximated using<nbsp><eqref|eq:parabolic.transformed.fo>

  <\equation>
    <uu><rsub|t>=-<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><around|(|<tfad>-<tfvd>|)>,<space|2em><around|(|\<nabla\><uu>|)><rsub|t>=<frac|1|J>*<M>*\<nabla\><rsub|<vxi>>*<uu><rsub|t><label|eq:parabolic.ut.defn>
  </equation>

  where <math|<tfad><rsub|e>,<tfvd><rsub|e>> are degree <math|N> cell local
  approximations to the fluxes <math|<tfa>,<tfv>> given
  in<nbsp><eqref|eq:parabolic.transformed.fo> constructed by
  interpolation<nbsp><eqref|eq:curved.flux.poly.defn>

  <\equation>
    <around|(|<tfad><rsub|e>|)><rsub|i>=<big|sum><rsub|<bp>><tfa><around|(|<uu><rsub|e,p>|)>*\<ell\><rsub|<bp>>,<space|2em><around|(|<tfvd>|)><rsub|i>=<big|sum><rsub|<bp>><tfv><around|(|<uu><rsub|e,p>,<bq><rsub|e,p>|)>*\<ell\><rsub|<bp>><label|eq:parabolic.flux.poly.defn>
  </equation>

  where <math|<bq>> is obtained in<nbsp><eqref|eq:parabolic.q.defn>. The
  procedure for other degrees will be similar following
  Section<nbsp><reference|sec:alw>.

  <subsection|Free stream preservation>

  Assume a constant solution <math|<uu><rsup|n>=<bc>>. The correction terms
  in<nbsp><eqref|eq:parabolic.u.corrected> will be zero since constant
  implies continuous at interfaces and thus
  <math|<uu><rsub|e>=<uu><rsub|e><rsup|\<delta\>>=<bc>>, proving that
  <math|<bq>=<bzero>> from<nbsp><eqref|eq:parabolic.q.defn>. Thus, we can now
  suppress dependence of <math|<bq>> on <math|<fv>> and, in particular, write
  <math|<tfv>=<tfv><around|(|<uu><rsub|e>|)>>. Thus, the equation we are
  solving for evolution from <math|t<rsup|n>> to <math|t<rsup|n+1>> is now

  <\equation*>
    <uu><rsub|t>+<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><tf><around|(|<uu>|)>=<bzero>,<space|2em><tf>=<tf><rsup|a>-<tf><rsup|v>
  </equation*>

  implying that the arguments for free stream preservation for LWFR on
  hyperbolic conservation laws used in Chapter<nbsp><reference|ch:curved.meshes>
  apply to parabolic equations. Thus, as proven in
  Section<nbsp><reference|sec:curved.free.stream.lwfr>, the free stream will
  be preserved as long the metric identity<nbsp><eqref|eq:curved.metric.identity.contravariant>
  is satisfied for interpolated metric terms<nbsp><eqref|eq:curved.metric.identity.contravariant.inter>.

  <section|Numerical results><label|sec:results>

  The numerical experiments were made with the compressible Navier Stokes
  equations<nbsp><eqref|eq:2dns>, with most test cases taken
  from<nbsp><cite|Ray2017>. The error based time stepping from
  Section<nbsp><reference|sec:curved.error.lw> is used in all experiments
  other than the convergence tests. The error based time stepping is applied
  to parabolic equations by using the local time averaged
  flux<nbsp>(<reference|eq:curved.uloc.high>,<nbsp><reference|eq:curved.time.averaged.flux>)
  to be the total of time averaged advective and viscous
  fluxes<nbsp><eqref|eq:parabolic.time.averaged.flux>. The subsequent step of
  truncating the time averaged flux<nbsp><eqref|eq:curved.Fdelta.low> to
  obtain an embedded lower order method<nbsp><eqref|eq:curved.unp1.low>
  remains the same. Absolute and relative
  tolerances<nbsp><eqref|eq:curved.error.estimator> of
  <math|\<tau\><rsub|a>=\<tau\><rsub|r>=10<rsup|-8>> are used in all
  experiments.

  The results have been generated by extending the package
  <hlink|<with|font-family|tt|TrixiLW.jl>|https://github.com/Arpit-Babbar/TrixiLW.jl>
  developed in Chapter<nbsp><reference|ch:curved.meshes> to solve parabolic
  equations. The setup files for the numerical experiments in this chapter
  are available at<nbsp><cite|nsrepo>.

  <subsection|Convergence test>

  Consider the scalar advection diffusion equation
  <math|u<rsub|t>+<ba>\<cdot\>\<nabla\>*u=\<nu\>*\<Delta\>*u> where
  <math|<ba>=<around|(|1.5,1|)>>. For the initial condition
  <math|u<rsub|0><around|(|x,y|)>=1+0.5*sin
  <around|(|\<pi\>*<around|(|x+y|)>|)>> on <math|<around|[|-1,1|]><rsup|2>>
  with periodic boundary conditions, the exact solution is given by\ 

  <\equation*>
    <math|u<around|(|x,y|)>=1+0.5*e<rsup|-2*\<nu\>*\<pi\><rsup|2>*t>*sin
    <around|(|\<pi\>*<around|(|x-a<rsub|1>*t+y-a<rsub|2>*t|)>|)>>
  </equation*>

  A convergence analysis with <math|\<nu\>> chosen to be in diffusion and
  advection dominated regimes is performed and shown in
  Figure<nbsp><reference|fig:convergence.analysis>, and optimal convergence
  rates are seen for all solution polynomial degrees. For non-periodic
  boundaries, we use the Eriksson-Johnson test<nbsp><cite|Ellis2016> which is
  also a scalar advection diffusion with <math|<ba>=<around*|(|1,0|)>> and
  <math|\<nu\>=0.05> on domain <math|<around*|[|-1,0|]>\<times\><around*|[|-0.5,0.5|]>>
  with exact solution that decays to a steady state

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|u<around*|(|x,y|)>=exp<around*|(|-l*t|)>*<around*|(|e<rsup|\<lambda\><rsub|1>*x>-e<rsup|\<lambda\><rsub|2>*x>|)>+cos<around*|(|\<pi\>*y|)>*<frac|e<rsup|\<pi\>*x>-e<rsup|r<rsub|1>*x>|e<rsup|-s<rsub|1>>-e<rsup|-r<rsub|1>>>>>|<row|<cell|\<lambda\><rsub|1>,\<lambda\><rsub|2>=<frac|<around*|(|-1\<pm\><sqrt|1-4*\<nu\>*l>|)>|-2*\<nu\>>,<space|2em>l=4>>|<row|<cell|r<rsub|1>,s<rsub|1>=<frac|1\<pm\><sqrt|1+4*\<pi\><rsup|2>*\<nu\><rsup|2>>|2*\<nu\>>>>>>><label|eq:erik.ic>
  </equation>

  Dirichlet boundary conditions are used on left, bottom and top boundaries
  and outflow conditions on the right. The initial and numerical solution at
  <math|t=1> on a <math|128<rsup|2>> mesh are shown in
  Figure<nbsp><reference|fig:erik>. The convergence results are shown in
  Figure<nbsp><reference|fig:convergence.analysis.nse>a where degree
  <math|N=2,4> show optimal rates while degree <math|N=3> nears 3.54 order
  accuracy.

  <big-figure|<center|<wide-tabular|<tformat|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
    <image|figures/parabolic/convergence/non_periodic_scalar/colour_bar.pdf|0.6par|||>
  </cell>|<\cell>
    \;
  </cell>>|<row|<\cell>
    <image|figures/parabolic/convergence/non_periodic_scalar/initial.png|0.4par|||>
  </cell>|<\cell>
    <image|figures/parabolic/convergence/non_periodic_scalar/final.png|0.4par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>>><label|fig:erik>|Errikson-Johnson test (a) Initial condition
  (b) Numerical solution at <math|t=1>>

  A convergence analysis is also made for the Navier-Stokes equations on the
  domain <math|<around|[|-1,1|]><rsup|2>> with a manufactured solution taken
  from one of the examples in <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022>
  given by

  <\equation>
    <tabular*|<tformat|<cwith|3|3|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<cwith|3|3|1|1|cell-halign|r>|<table|<row|<cell|\<rho\>>|<cell|=>|<cell|c+A*sin
    <around|(|\<pi\>*x|)>*cos <around|(|\<pi\>*y|)>*cos
    <around|(|\<pi\>*t|)>>>|<row|<cell|v<rsub|1>=v<rsub|2>>|<cell|=>|<cell|sin
    <around|(|\<pi\>*x|)>*log <around|(|y+2|)>*<around|(|1-e<rsup|-A*<around|(|y-2|)>>|)>*cos
    <around|(|\<pi\>*t|)>>>|<row|<cell|p>|<cell|=>|<cell|\<rho\><rsup|2>>>>>><label|eq:nse.manu>
  </equation>

  The <with|font-shape|italic|manufacturing> of solution will lead to source
  terms which will be treated as in Chapter<nbsp><reference|ch:10mom>. The
  vertical boundaries are periodic and horizontal boundaries are no slip,
  adiabatic walls. The density and <math|v<rsub|1>> plot of numerical
  solution at <math|t=1> are shown in Figure<nbsp><reference|fig:nse.manu>.
  The error convergence analysis for density profile is shown in
  Figure<nbsp><reference|fig:convergence.analysis.nse>b, where optimal
  convergence rates are seen for all polynomial degrees.

  <big-figure|<wide-tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/parabolic/convergence/nse_manufactured/density.png|0.4par|||>
  </cell>|<\cell>
    <image|figures/parabolic/convergence/nse_manufactured/vx.png|0.4par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:nse.manu>|<caption-detailed|Numerical solution for
  Navier-Stokes equations with manufactured exact
  solution<nbsp><eqref|eq:nse.manu>. (a) Density plot, (b) <math|v<rsub|x>>
  plot|Navier-Stokes equations with manufactured exact solution.>>

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/convergence/diff_5em2.pdf|0.43par|||>>|<cell|<image|figures/parabolic/convergence/diff_1em12.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:convergence.analysis>|<caption-detailed|Convergence
  analysis for scalar advection-diffusion equation with
  <math|<ba>=<around|(|1.5,1|)>> and coefficient (a)
  <math|\<nu\>=5\<times\>10<rsup|-2>> (b)
  <math|\<nu\>=10<rsup|-12>>|Convergence analysis for scalar
  advection-diffusion equation.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/convergence/convergence_nonperiodic.pdf|0.43par|||>>|<cell|<image|figures/parabolic/convergence/convergence_NS.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:convergence.analysis.nse>>|<caption-detailed|Convergence
  analysis with non-periodic boundary conditions. (a) Eriksson-Johnson test
  (Section 4 of<nbsp><cite|Ellis2016>) and (b) Navier-Stokes equations with
  manufactured solution.|Convergence analysis for non-periodic
  advection-diffusion.>>

  <subsection|Lid driven cavity>

  This is a steady state test case for the Navier Stokes equations in the
  square domain <math|<around|[|0,1|]><rsup|2>>. We take the setup
  from<nbsp><cite|Ghia1982> where Pr=0.7, <math|\<mu\>=0.001> and the initial
  condition is the solution at rest

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around*|(|1,0,0,<frac|1|M<rsub|\<infty\>><rsup|2>*\<gamma\>>|)>
  </equation*>

  where <math|M<rsub|\<infty\>>=0.1>. The top boundary is moving with a
  velocity of <math|<around|(|1,0|)>> and the other three have no-slip
  boundary conditions. All boundaries are isothermal. The problem has a
  Reynolds number of 1000 corresponding to the top moving wall. The laminar
  solution of the problem is steady, with Mach number 0.1 corresponding to
  the moving lid. We compare the solution with the numerical data of Ghia et
  al.<nbsp><cite|Ghia1982> by plotting the horizontal velocity profile along
  the vertical line through the midpoint of the domain, and vertical velocity
  profile along the horizontal line through the midpoint of the domain. The
  <math|x>-velocity plot along with velocity vectors are shown in
  Figure<nbsp><reference|fig:lid.cavity.soln>. The comparison is shown in
  Figure<nbsp><reference|fig:cavity>, where a good agreement
  with<nbsp><cite|Ghia1982> is seen.

  <big-figure|<image|figures/parabolic/lid_driven_cavity/lid_driven_cavity.pdf|0.44par|||><label|fig:lid.cavity.soln>|Lid
  driven cavity, <math|x>-velocity pseudocolor plot and velocity vectors.>

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/lid_driven_cavity/x_vs_vy.pdf|0.43par|||>>|<cell|<image|figures/parabolic/lid_driven_cavity/y_vs_vx.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:cavity>|<caption-detailed|Velocity
  profiles of lid driven cavity test. (a) <math|v<rsub|y>> cut at
  <math|y=0.5> (b) <math|v<rsub|x>> cut at <math|x=0.5>.|Velocity profiles of
  lid driven cavity test.>>

  <subsection|Transonic flow past NACA-0012 airfoil><label|sec:swanson>

  The following additional quantities are considered for validation of the
  scheme:

  <\itemize>
    <item>Surface pressure coefficient <math|C<rsub|p>> and surface skin
    friction coefficient <math|C<rsub|f>> along the airfoil surface

    <\equation*>
      C<rsub|p>=<frac|p-p<rsub|\<infty\>>|<value|half>*\<rho\><rsub|\<infty\>>*<around*|\||<bv><rsub|\<infty\>>|\|><rsup|2>*l<rsub|\<infty\>>>,<space|2em>C<rsub|f>=<frac|<around*|(|\<tau\>*<bn>|)>*<bn><rsup|\<perp\>>|<frac|1|2>*\<rho\><rsub|\<infty\>>*<around*|\||<bv><rsub|\<infty\>>|\|><rsup|2>*l<rsub|\<infty\>>>
    </equation*>

    <item>Pressure induced lift and drag force coefficients

    <\equation*>
      c<rsub|d\<nocomma\>p>=<frac|<big|int><rsub|S>p*<around*|(|<bn>*\<Psi\><rsub|d>|)>*<ud>s|<frac|1|2>*\<rho\><rsub|\<infty\>>*<around*|\||<bv><rsub|\<infty\>>|\|><rsup|2>*l<rsub|\<infty\>>>,<space|2em>c<rsub|d\<nocomma\>p>=<frac|<big|int><rsub|S>p*<around*|(|<bn>*\<Psi\><rsub|l>|)>*<ud>s|<frac|1|2>*\<rho\><rsub|\<infty\>>*<around*|\||<bv><rsub|\<infty\>>|\|><rsup|2>*l<rsub|\<infty\>>>
    </equation*>

    <item>Lift and drag force coefficients due to viscous forces

    <\equation*>
      c<rsub|d\<nocomma\>p>=<frac|<big|int><rsub|S><around*|(|\<tau\>*<bn>|)>\<cdot\>\<Psi\><rsub|d>*<ud>s|<frac|1|2>*\<rho\><rsub|\<infty\>>*<around*|\||<bv><rsub|\<infty\>>|\|><rsup|2>*l<rsub|\<infty\>>>,<space|2em>c<rsub|d\<nocomma\>p>=<frac|<big|int><rsub|S><around*|(|\<tau\>*<bn>|)>\<cdot\>\<Psi\><rsub|l>*<ud>s|<value|half>*\<rho\><rsub|\<infty\>>*<around*|\||<bv><rsub|\<infty\>>|\|><rsup|2>*l<rsub|\<infty\>>>
    </equation*>
  </itemize>

  where <math|<value|bn>> is the inward unit normal at domain boundary,
  <math|<value|bn><rsup|\<perp\>>> is the tangent at the domain boundary,
  <math|\<Psi\><rsub|d>=<around*|(|cos \<alpha\>,sin
  \<alpha\>|)><rsup|\<bot\>>,\<Psi\><rsub|l>=<around*|(|-sin \<alpha\>,cos
  \<alpha\>|)><rsup|\<bot\>>>, with <math|\<alpha\>> being the angle of
  attack.\ 

  This test case involves a steady flow past a symmetric NACA-0012 airfoil.
  We choose the free stream density and pressure as
  <math|\<rho\><rsub|\<infty\>>=1,p<rsub|\<infty\>>=2.85> and Prandtl number
  <math|Pr=0.72>, and simulate a flow corresponding to a Reynolds number 500,
  free-stream Mach number of 0.8 and <math|10<rsup|\<circ\>>> angle of
  attack. The free-stream velocity is set at
  <math|<uu><rsub|\<infty\>>=<around|(|1.574,0.277|)>>. The simulation is
  performed with 728 elements and polynomial degree <math|N=4>. The mesh and
  Mach number contour plot are shown in Figure<nbsp><reference|fig:swanson.mesh.mach>.
  In Figure<nbsp><reference|fig:cp.cf.swanson>, coefficient of pressure
  <math|C<rsub|p>> and coefficient of friction <math|C<rsub|f>> over the
  airfoil surface are compared with<nbsp><cite|Swanson_Langer_2016>, showing
  good agreement for <math|C<rsub|p>> and same for <math|C<rsub|f>>
  everywhere other than the leading edge where there are some errors. The
  coefficients of pressure induced drag and lift
  (<math|c<rsub|d*p>,c<rsub|l*p>>), and drag and lift due to viscous forces
  (<math|c<rsub|d*f>,c<rsub|l*f>>) are shown in
  Table<nbsp><reference|tab:swanson.forces> and a good agreement
  with<nbsp><cite|Swanson_Langer_2016> is seen.

  <big-figure|<center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/swanson/mesh_zoomed.png|0.45par|||>>|<cell|<image|figures/parabolic/swanson/mach_l0.png|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>><label|fig:swanson.mesh.mach>|<caption-detailed|Transonic
  flow over a NACA-0012 airfoil with <math|M<rsub|\<infty\>>=0.8> solved on a
  mesh with 728 elements using solution polynomial degree <math|N=4>. (a)
  Mesh (b) Mach number contour.|Mach number plot for transonic flow over an
  airfoil.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/swanson/Cp.pdf|0.45par|||>>|<cell|<image|figures/parabolic/swanson/Cf.pdf|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:cp.cf.swanson>>|<caption-detailed|Transonic
  flow over an airfoil, quantities of interest on surface. (a) Coefficient of
  pressure and (b) Coefficient of friction|<math|C<rsub|p>,C<rsub|f>> for
  transonic flow over airfoil.>>

  <big-table|<tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|c>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|c>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|3|3|1|-1|cell-bborder|1ln>|<table|<row|<cell|>|<cell|<math|c<rsub|d*p>>>|<cell|<math|c<rsub|d*f>>>|<cell|<math|c<rsub|l*p>>>|<cell|<math|c<rsub|l*f>>>|<cell|<math|c<rsub|l*p>>+<math|c<rsub|l\<nocomma\>f>>>>|<row|<cell|LWFR>|<cell|0.1467>|<cell|0.1242>|<cell|0.4416>|<cell|-0.0043>|<cell|0.4373>>|<row|<cell|Reference>|<cell|0.1475>|<cell|0.1275>|<cell|-->|<cell|-->|<cell|0.4363>>>>><label|tab:swanson.forces>|<caption-detailed|Transonic
  flow over an airfoil compared with data
  from<nbsp><cite|Swanson_Langer_2016>.|Transonic flow over an airfoil
  compared with data from Swanson, Langer (2016).>>

  <subsection|Flow past a cylinder><label|sec:von.karman>

  This test involves a laminar, unsteady flow past a cylinder inside a
  channel<nbsp><cite|Schafer1996>. On the left, the inflow boundary condition
  is imposed with <math|p=\<theta\>=160.7143>,
  <math|v<rsub|1>=4*v<rsub|m>*y*<around|(|H-y|)>/H<rsup|2>> and
  <math|v<rsub|2>=0>, where <math|v<rsub|m>=1.5>m/s is the maximum velocity
  and the Mach number corresponding to <math|v<rsub|m>> is <math|0.1>,
  <math|H=0.41<text|m>>. The <math|v<rsub|1>> velocity has a quadratic
  profile in <math|y> and is symmetric for <math|y\<in\><around*|[|0,H|]>>.
  The cylinder is placed so that its center is at
  <math|<around*|(|H/2,H/2|)>-<around*|(|0.005,0.005|)>> so that it is
  slightly offset in <math|y> from the center of the channel to destabilize
  the otherwise steady symmetric flow (Figure<nbsp><reference|fig:karman.vorticity>a).
  Isothermal no-slip boundary conditions are imposed on the cylinder surface,
  and the top and bottom boundaries. The Reynolds number of the flow
  corresponding to the mean velocity is 100, so that the viscosity
  coefficient is <math|\<nu\>=10<rsup|-3>>.

  The simulation is performed on a mesh with 5692 elements and polynomial
  degree <math|N=4> so that <math|\<Delta\>x\<approx\>0.01>. After some time,
  a Von Karman vortex street appears with a periodic shedding of eddies from
  alternate sides of the cylinder. This is typical for slow flows past a
  slender body. The vorticity profile is shown in
  Figure<nbsp><reference|fig:karman.vorticity>b, which clearly depicts the
  periodic vortex shedding. The periodic behavior can also be observed in
  Figure<nbsp><reference|fig:karman.forces> where the evolution of the
  coefficient of total lift <math|c<rsub|l>=c<rsub|l\<nocomma\>p>+c<rsub|l\<nocomma\>f>>
  and the coefficient of total drag <math|c<rsub|d>=c<rsub|d\<nocomma\>p>+c<rsub|d\<nocomma\>f>>
  on the surface of cylinder is shown. The time period of the
  <math|c<rsub|l>> profile is <math|\<tau\>\<approx\>0.33759> so that the
  Strouhal number is <math|St=\<cal-F\>*\<cal-D\>/<wide|u|\<bar\>>=\<cal-D\>/<around|(|\<tau\>*<wide|u|\<bar\>>|)>=0.29621>
  where <math|\<cal-D\>=0.1,<wide|u|\<bar\>>=1> are the diameter of cylinder
  and mean velocity. This value is in the reference range
  of<nbsp><cite|Schafer1996>. The values Max <math|c<rsub|l>> and Max
  <math|c<rsub|l>> are not in the reference range but are close, as shown in
  Table<nbsp><reference|tab:max.cl.max.cp>.

  <big-figure|<with|par-mode|center|<tabular|<tformat|<cwith|4|4|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|illustrations/channel.pdf|0.91par|||>>>|<row|<cell|(a)>>|<row|<cell|<image|figures/parabolic/von_karman/vorticity.png|0.9par|||>>>|<row|<cell|(b)>>>>><label|fig:karman.vorticity>>|<caption-detailed|Von
  Karman street (a) Physical domain, (b) Vorticity plot|Vorticity profile of
  Von Karman vortex street.>>

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/von_karman/cl.pdf|0.45par|||>>|<cell|<image|figures/parabolic/von_karman/cd.pdf|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:karman.forces>|<caption-detailed|Flow
  over cylinder. (a) Coefficient of lift <math|c<rsub|l>> (b) Coefficient of
  drag <math|c<rsub|d>>.|<math|c<rsub|l>,c<rsub|d>> for Von Karman vortex
  street.>>

  <big-table|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|3|3|1|-1|cell-bborder|1ln>|<table|<row|<cell|>|<cell|Max
  <math|c<rsub|l>>>|<cell|Max <math|c<rsub|d>>>|<cell|St>>|<row|<cell|LWFR>|<cell|0.906>|<cell|3.136>|<cell|0.29621>>|<row|<cell|Reference
  range>|<cell|<math|<around|[|0.99,1.01|]>>>|<cell|<math|<around|[|3.22,3.24|]>>>|<cell|<math|<around|[|0.284,0.3|]>>>>>>><label|tab:max.cl.max.cp>>|<caption-detailed|Comparison
  of quantities of interest for flow past
  cylinder|<math|c<rsub|l>,c<rsub|d>,St> for Von Karman vortex street.>>

  <section|Summary and Conclusion><label|sec:conclusion>

  The Lax-Wendroff Flux Reconstruction (LWFR) scheme has been extended to
  parabolic equations along with its capability of handing curved meshes and
  error based time stepping proposed in Chapter<nbsp><reference|ch:curved.meshes>.
  The scheme has been numerically validated by performing convergence and
  other validation tests on the compressible Navier Stokes equations.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|8>
    <associate|font-base-size|12>
    <associate|page-even|1in>
    <associate|page-even-shift|0mm>
    <associate|page-first|209>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-odd-shift|auto>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|auto>
    <associate|project-flag|false>
    <associate|section-nr|8>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|9|209>>
    <associate|auto-10|<tuple|9.4.1|213>>
    <associate|auto-11|<tuple|9.1|214>>
    <associate|auto-12|<tuple|9.2|214>>
    <associate|auto-13|<tuple|9.3|215>>
    <associate|auto-14|<tuple|9.4|215>>
    <associate|auto-15|<tuple|9.4.2|215>>
    <associate|auto-16|<tuple|9.5|216>>
    <associate|auto-17|<tuple|9.6|216>>
    <associate|auto-18|<tuple|9.4.3|216>>
    <associate|auto-19|<tuple|9.7|217>>
    <associate|auto-2|<tuple|9.1|209>>
    <associate|auto-20|<tuple|9.8|218>>
    <associate|auto-21|<tuple|9.1|218>>
    <associate|auto-22|<tuple|9.4.4|218>>
    <associate|auto-23|<tuple|9.9|219>>
    <associate|auto-24|<tuple|9.10|219>>
    <associate|auto-25|<tuple|9.2|219>>
    <associate|auto-26|<tuple|9.5|220>>
    <associate|auto-3|<tuple|9.2|209>>
    <associate|auto-4|<tuple|9.3|210>>
    <associate|auto-5|<tuple|9.3.1|210>>
    <associate|auto-6|<tuple|9.3.2|211>>
    <associate|auto-7|<tuple|9.3.2.1|212>>
    <associate|auto-8|<tuple|9.3.3|212>>
    <associate|auto-9|<tuple|9.4|213>>
    <associate|ch:parabolic|<tuple|9|209>>
    <associate|eq:erik.ic|<tuple|9.20|213>>
    <associate|eq:nse.manu|<tuple|9.21|214>>
    <associate|eq:parabolic.central.u|<tuple|9.10|211>>
    <associate|eq:parabolic.cts.time.avg.flux|<tuple|9.15|212>>
    <associate|eq:parabolic.flux.poly.defn|<tuple|9.19|212>>
    <associate|eq:parabolic.ft.defn|<tuple|9.17|212>>
    <associate|eq:parabolic.grad.transform|<tuple|9.6|210>>
    <associate|eq:parabolic.lw.update|<tuple|9.12|211>>
    <associate|eq:parabolic.lwfr.update.curvilinear|<tuple|9.16|212>>
    <associate|eq:parabolic.matrix.operator.notation|<tuple|9.3|209>>
    <associate|eq:parabolic.parabolic.eqn|<tuple|9.1|209>>
    <associate|eq:parabolic.parabolic.in.first.order|<tuple|9.4|209>>
    <associate|eq:parabolic.q.defn|<tuple|9.11|211>>
    <associate|eq:parabolic.rusanov.flux.lw|<tuple|9.14|211>>
    <associate|eq:parabolic.time.averaged.flux|<tuple|9.13|211>>
    <associate|eq:parabolic.transformed.fo|<tuple|9.7|210>>
    <associate|eq:parabolic.u.corrected|<tuple|9.9|211>>
    <associate|eq:parabolic.ut.defn|<tuple|9.18|212>>
    <associate|eq:parabolic.vector.vector|<tuple|9.2|209>>
    <associate|fig:cavity|<tuple|9.6|216>>
    <associate|fig:convergence.analysis|<tuple|9.3|215>>
    <associate|fig:convergence.analysis.nse|<tuple|9.4|215>>
    <associate|fig:cp.cf.swanson|<tuple|9.8|218>>
    <associate|fig:erik|<tuple|9.1|214>>
    <associate|fig:karman.forces|<tuple|9.10|219>>
    <associate|fig:karman.vorticity|<tuple|9.9|219>>
    <associate|fig:lid.cavity.soln|<tuple|9.5|216>>
    <associate|fig:nse.manu|<tuple|9.2|214>>
    <associate|fig:swanson.mesh.mach|<tuple|9.7|217>>
    <associate|footnote-9.1|<tuple|9.1|210>>
    <associate|footnr-9.1|<tuple|9.1|210>>
    <associate|sec:alwp|<tuple|9.3.2.1|212>>
    <associate|sec:conclusion|<tuple|9.5|220>>
    <associate|sec:lwfr.2nd.order|<tuple|9.3|210>>
    <associate|sec:results|<tuple|9.4|213>>
    <associate|sec:swanson|<tuple|9.4.3|216>>
    <associate|sec:transformations.parabolic|<tuple|9.2|209>>
    <associate|sec:von.karman|<tuple|9.4.4|218>>
    <associate|tab:max.cl.max.cp|<tuple|9.2|219>>
    <associate|tab:swanson.forces|<tuple|9.1|218>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Bassi1997

      Gassner_Winters_Hindenlang_Kopriva_2018

      Bassi1997

      Gassner_Winters_Hindenlang_Kopriva_2018

      Bassi1997

      Huynh2007

      witherden2014

      Huynh2007

      Huynh2007

      Rusanov1962

      Zorio2017

      Ray2017

      nsrepo

      Ellis2016

      Ranocha2022

      Ellis2016

      Ghia1982

      Ghia1982

      Ghia1982

      Swanson_Langer_2016

      Swanson_Langer_2016

      Swanson_Langer_2016

      Schafer1996

      Schafer1996
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|9.1>||Errikson-Johnson
      test (a) Initial condition (b) Numerical solution at
      <with|mode|<quote|math>|t=1>>|<pageref|auto-11>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.2>|>
        Navier-Stokes equations with manufactured exact solution.
      </surround>|<pageref|auto-12>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.3>|>
        Convergence analysis for scalar advection-diffusion equation.
      </surround>|<pageref|auto-13>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.4>|>
        Convergence analysis for non-periodic advection-diffusion.
      </surround>|<pageref|auto-14>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|9.5>||Lid driven
      cavity, <with|mode|<quote|math>|x>-velocity pseudocolor plot and
      velocity vectors.>|<pageref|auto-16>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.6>|>
        Velocity profiles of lid driven cavity test.
      </surround>|<pageref|auto-17>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.7>|>
        Mach number plot for transonic flow over an airfoil.
      </surround>|<pageref|auto-19>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.8>|>
        <with|mode|<quote|math>|C<rsub|p>,C<rsub|f>> for transonic flow over
        airfoil.
      </surround>|<pageref|auto-20>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.9>|>
        Vorticity profile of Von Karman vortex street.
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.10>|>
        <with|mode|<quote|math>|c<rsub|l>,c<rsub|d>> for Von Karman vortex
        street.
      </surround>|<pageref|auto-24>>
    </associate>
    <\associate|table>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.1>|>
        Transonic flow over an airfoil compared with data from Swanson,
        Langer (2016).
      </surround>|<pageref|auto-21>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.2>|>
        <with|mode|<quote|math>|c<rsub|l>,c<rsub|d>,St> for Von Karman vortex
        street.
      </surround>|<pageref|auto-25>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|9.<space|2spc>Parabolic
      equations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      9.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      9.2.<space|2spc>Curvilinear coordinates for parabolic equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      9.3.<space|2spc>Lax-Wendroff flux reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      <with|par-left|<quote|1tab>|9.3.1.<space|2spc>Solving for \<b-q\>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|9.3.2.<space|2spc>Time averaging
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|9.3.2.1.<space|2spc>Approximate
      Lax-Wendroff procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|9.3.3.<space|2spc>Free stream preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      9.4.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      <with|par-left|<quote|1tab>|9.4.1.<space|2spc>Convergence test
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|9.4.2.<space|2spc>Lid driven cavity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|9.4.3.<space|2spc>Transonic flow past
      NACA-0012 airfoil <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|9.4.4.<space|2spc>Flow past a cylinder
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      9.5.<space|2spc>Summary and Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>
    </associate>
  </collection>
</auxiliary>