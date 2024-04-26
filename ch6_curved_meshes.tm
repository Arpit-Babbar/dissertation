<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    \ Vectors

    <assign|vX|<math|<with|font-series|bold|X>>>

    <assign|va|<math|<with|font-series|bold|a>>>

    <assign|vxi|<with|font-series|bold|<math|\<xi\>>>>

    <assign|vQ|<with|font-series|bold|<math|u>>>

    <assign|vF|<with|font-series|bold|<math|f>>>

    \;

    # Hats

    <assign|hx|<macro|<wide|x|^>>>

    <assign|hy|<macro|<wide|y|^>>>

    <assign|hz|<macro|<wide|z|^>>>

    # Vectors

    <assign|vX|<bX>>

    <assign|va|<ba>>

    <assign|vQ|<math|<with|font-series|bold|<math|Q>>>>

    <assign|vF|<math|<with|font-series|bold|F>>>

    \;

    # Others

    <assign|lmn|<math|\<lambda\>\<mu\>\<nu\>>>

    \;

    <assign|uu|<bu>>

    <assign|ppu|<math|<value|uu>>>

    <assign|rpu|<math|<wide|<value|uu>|^><rsup|\<delta\>>>>

    <assign|tu|<math|<wide|<bu>|~>>>

    <assign|pf|<bof>>

    <assign|F|<bF>>

    <assign|ppf|<math|<value|pf><rsup|\<delta\>>>>

    <assign|rpf|<math|<wide|<value|pf>|^><rsup|\<delta\>>>>

    <assign|tf|<math|<wide|<value|pf>|~>>>

    <assign|tF|<math|<wide|<value|F>|~>>>

    \;

    \;

    <assign|qint|<superpose|<big|int>| ->>
  </hide-preamble>

  <chapter|Curvilinear grids><label|ch:curved.meshes>

  <section|Introduction>

  This chapter extends the LWFR scheme to curvilinear grids that are
  body-fitted to handle curved geometries. These geometries occur in
  practical problems, especially in CFD. Adaptive mesh refinement is also
  developed for LWFR using the Mortar Element Method<nbsp><cite|Kopriva1996>
  in order to have efficient resolution of localized flows. The extension is
  conservative, free stream and admissibility preserving. In the previous
  chapters, the time step size was computed based on a wave speed estimate by
  using optimal CFL numbers obtained from a Fourier stability analysis. The
  Fourier stability analysis is based on uniform Cartesian grids and does not
  apply to the curvilinear case. Thus, usage of a wave speed based formula
  for computing time step sizes for curvilinear grids requires fine tuning of
  the CFL number for each problem and geometry. In order to minimize fine
  tuning, we propose an error based time step computation method for the LWFR
  method. Numerical results for compressible Euler's equations are used to
  validate LWFR on adaptively refined, curvilinear grids with error based
  time stepping. The performance improvement of error based time stepping
  over CFL based time stepping is also shown.

  The chapter is organized as follows. In
  Section<nbsp><reference|sec:curved.curvilinear.coords>, we review notations
  and the transformation of conservation laws from curved elements to a
  reference cube following<nbsp><cite|Kopriva2006|kopriva2009>. In
  Section<nbsp><reference|sec:curved.cons.lw>, the LWFR scheme
  of<nbsp><cite|babbar2022> is extended to curvilinear grids. In
  Section<nbsp><reference|sec:curved.fr>, we review FR on curvilinear grids
  and use it to construct LWFR on curvilinear grids in
  Section<nbsp><reference|sec:curved.lwfr.curved>.
  Section<nbsp><reference|sec:curved.free.stream.lwfr> shows that the free
  stream preservation condition of LWFR is the standard metric identity
  of<nbsp><cite|Kopriva2006>. In Section<nbsp><reference|sec:curved.shock.capturing>,
  the admissibility preserving subcell limiter for LWFR
  from<nbsp><cite|babbar2023admissibility> is reviewed and extended to
  curvilinear grids. In Section<nbsp><reference|sec:curved.amr>, the Mortar
  Element Method for treatment of non-conformal interfaces in AMR
  of<nbsp><cite|Kopriva1996> is extended to LWFR. In
  Section<nbsp><reference|sec:curved.time.stepping>, error-based time
  stepping methods are discussed; Section<nbsp><reference|sec:curved.rk.error.section>
  reviews error-based time stepping methods for Runge-Kutta and
  Section<nbsp><reference|sec:curved.error.lw> introduces an embedded
  error-based time stepping method for LWFR. In
  Section<nbsp><reference|sec:curved.numerical.results>, numerical results
  are shown to demonstrate the scheme's capability of handling adaptively
  refined curved grids and benefits of error-based time stepping.
  Section<nbsp><reference|sec:curved.conclusions> gives a summary and draws
  conclusions from the work.

  <section|Conservation laws and curvilinear
  grids><label|sec:curved.curvilinear.coords>

  The developments in this work are applicable to a wide class of hyperbolic
  conservation laws but the numerical experiments are performed on 2-D
  compressible Euler's equations<nbsp><eqref|eq:2deuler>. For the sake of
  simplicity and generality, we subsequently explain the development of the
  algorithms for a general hyperbolic conservation law written as

  <\equation>
    <uu><rsub|t>+<Div><pf><around|(|<uu>|)>=<bzero><label|eq:curved.con.law>
  </equation>

  where <math|<uu>\<in\>\<bbb-R\><rsup|p>> is the vector of conserved
  quantities, <math|<pf><around|(|<uu>|)>=<around|(|<pf><rsub|1>,\<ldots\>,<pf><rsub|d>|)>\<in\>\<bbb-R\><rsup|p\<times\>d>>
  is the corresponding physical flux, <math|<bx>> is in domain
  <math|\<Omega\>\<subset\>\<bbb-R\><rsup|d>> and

  <\equation>
    <Div><pf>=<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|x<rsub|i>>*<pf><rsub|i><label|eq:curved.defn1.div>
  </equation>

  Let us partition <math|\<Omega\>> into <math|M> non-overlapping
  quadrilateral/hexahedral elements <math|\<Omega\><rsub|e>> such that

  <\equation>
    \<Omega\>=<big|cup><rsub|e=1><rsup|M>\<Omega\><rsub|e><label|eq:curved.partition>
  </equation>

  The elements <math|\<Omega\><rsub|e>> are allowed to have curved boundaries
  in order to match curved boundaries of the problem domain <math|\<Omega\>>.
  In this chapter, we take the reference element to be
  <math|<value|Oo>=<around*|[|-1,1|]><rsup|d>> in contrast to be the previous
  chapters where it was <math|<around*|[|0,1|]><rsup|d>>. This choice is made
  for compatibility with <verbatim|Trixi.jl><nbsp><cite|Ranocha2022>. .To
  construct the numerical approximation, we map each element
  <math|\<Omega\><rsub|e>> to a reference element
  <math|<Oo>=<around|[|-1,1|]><rsup|d>> by a bijective map
  <math|\<Theta\><rsub|e>:<Oo>\<to\>\<Omega\><rsub|e>>

  <\equation*>
    <bx>=\<Theta\><rsub|e><around|(|<vxi>|)>
  </equation*>

  where <math|<vxi>=<around|(|<xii>|)><rsub|i=1><rsup|d>> are the coordinates
  in the reference element, and the subscript <math|e> will usually be
  suppressed. We will denote a <math|d>-dimensional multi-index as
  <math|<bp>=<around|(|p<rsub|i>|)><rsub|i=1><rsup|d>>. In this work, the
  reference map is defined using tensor product Lagrange interpolation of
  degree <math|N\<ge\>1>,

  <\equation>
    \<Theta\><around|(|<vxi>|)>=<big|sum><rsub|<bp>\<in\><Nnd>><wide|<bx>|^><rsub|<bp>>*\<ell\><rsub|<bp>><around|(|<vxi>|)><label|eq:curved.reference.map>
  </equation>

  where

  <\equation>
    <Nnd>=<around*|{|<bp>=<around|(|p<rsub|1>,\<ldots\>,p<rsub|d>|)>:p<rsub|i>\<in\><around|{|0,1,\<ldots\>,N|}>,1\<leq\>i\<leq\>d|}><label|eq:curved.Nnd>
  </equation>

  and <math|<around*|{|\<ell\><rsub|<bp>>|}><rsub|<bp>\<in\><Nnd>>> is the
  degree <math|N> Lagrange polynomial corresponding to the
  Gauss-Legendre-Lobatto (GLL) points <math|<around*|{|<vxi><rsub|<bp>>|}><rsub|<bp>\<in\><Nnd>>>
  so that <math|\<Theta\><around|(|<vxi><rsub|<bp>>|)>=<wide|<bx>|^><rsub|<bp>>>
  for all <math|<bp>\<in\><Nnd>>. Thus, the points
  <math|<around*|{|<vxi><rsub|<bp>>|}><rsub|<bp>\<in\><Nnd>>> are where the
  reference map will be specified and they will also be taken to be the
  solution points of the Flux Reconstruction scheme throughout this chapter.
  The functions <math|<around*|{|\<ell\><rsub|<bp>>|}><rsub|<bp>\<in\><Nnd>>>
  can be written as a tensor product of the 1-D Lagrange polynomials
  <math|<around|{|\<ell\><rsub|p<rsub|i>>|}><rsub|p<rsub|i><subindex>0><rsup|N>>
  of degree <math|N> corresponding to the GLL points
  <math|<around|{|\<xi\><rsub|p<rsub|i>>|}><rsub|p<rsub|i>=0><rsup|N>>

  <\equation>
    \<ell\><rsub|<bp>><around|(|<vxi>|)>=<big|prod><rsub|i=1><rsup|d>\<ell\><rsub|p<rsub|i>><around|(|<xii>|)>,<space|2em>\<ell\><rsub|p<rsub|i>><around|(|\<xi\><rsup|i>|)>=<big|prod><rsub|k=0,k\<ne\>i><rsup|N><frac|\<xi\><rsup|i>-\<xi\><rsub|p<rsub|k>>|\<xi\><rsub|p<rsub|i>>-\<xi\><rsub|p<rsub|k>>><label|eq:curved.lagrange.basis>
  </equation>

  The numerical approximation of the conservation law will be developed by
  first transforming the PDE in terms of the coordinates of the reference
  cell. To do this, we need to introduce covariant and contravariant basis
  vectors with respect to the reference coordinates.

  <\definition>
    <dueto|Covariant basis><label|defn:curved.covariant.basis>The coordinate
    basis vectors <math|<around*|{|<ba><rsub|i>|}><rsub|i=1><rsup|d>> are
    defined so that <math|<ba><rsub|i>,<ba><rsub|j>> are tangent to
    <math|<around|{|\<xi\><rsup|k>=const|}>> where <math|i,j,k> are cyclic.
    They are explicitly given as

    <\equation>
      <ba><rsub|i>=<around|(|a<rsub|i,1>,\<ldots\>,a<rsub|i,d>|)>=<pdv|<bx>|<xii>>,<space|2em>1\<leq\>i\<leq\>d
    </equation>
  </definition>

  <\definition>
    <dueto|Contravariant basis><label|defn:curved.contravariant.basis>The
    contravariant basis vectors <math|<around*|{|<ba><rsup|i>|}><rsub|i=1><rsup|d>>
    are the respective normal vectors to the coordinate planes
    <math|<around|{|\<xi\><rsub|i>=const|}><rsub|i=1><rsup|3>>. They are
    explicitly given as

    <\equation>
      <ba><rsup|i>=<around|(|a<rsup|i><rsub|1>,\<ldots\>,a<rsup|i><rsub|d>|)>=\<nabla\><rsub|<bx>>*<xii>,<space|2em>1\<leq\>i\<leq\>d
    </equation>
  </definition>

  The covariant basis vectors <math|<ba><rsub|i>> can be computed by
  differentiating the reference map <math|\<Theta\><around|(|\<xi\>|)>>. The
  contravariant basis vectors can be computed
  using<nbsp><cite|Kopriva2006|kopriva2009>

  <\equation>
    J*<ba><rsup|i>=<ba><rsub|j>\<times\><ba><rsub|k><label|eq:curved.contravariant.identity>
  </equation>

  where <math|<around|(|<ijkc>|)>> are cyclic, and <math|J> denotes the
  Jacobian of the transformation which also satisfies

  <\equation*>
    J=det<around*|[|<pdv|<bx>|<vxi>>|]>=<ba><rsub|i>\<cdot\><around|(|<ba><rsub|j>\<times\><ba><rsub|k>|)><space|2em><around|(|i,j,k|)>
    cyclic
  </equation*>

  The divergence of a flux vector can be computed in reference coordinates
  using the contravariant basis vectors as<nbsp><cite|Kopriva2006|kopriva2009>

  <\equation>
    <Div><pf>=<frac|1|J>*<big|sum><rsub|i=1><rsup|d><pdv||<xii>><around|(|J*<ba><rsup|i>\<cdot\><pf>|)><label|eq:curved.divergence.transform.contravariant>
  </equation>

  Consequently, the gradient of a scalar function <math|\<phi\>> becomes

  <\equation>
    \<nabla\>*\<phi\>=<frac|1|J>*<big|sum><rsub|i=1><rsup|d><pdv||<xii>><around|[|<around|(|J*<ba><rsup|i>|)>*\<phi\>|]><label|eq:curved.gradient.transform.contravariant>
  </equation>

  Within each element <math|\<Omega\><rsub|e>>, performing change of
  variables with the reference map <math|\<Theta\><rsub|e>><nbsp><eqref|eq:curved.divergence.transform.contravariant>,
  the transformed conservation law is given by

  <\equation>
    <tu><rsub|t>+\<nabla\><rsub|<vxi>>\<cdot\><tf>=<bzero><label|eq:curved.transformed.conservation.law>
  </equation>

  where

  <\equation>
    <label|eq:curved.contravariant.flux.defn><tu>=J<uu>,<space|2em><tf><rsup|i>=J*<ba><rsup|i>\<cdot\><pf>=<big|sum><rsub|n=1><rsup|d>J*a<rsub|n><rsup|i>*<pf><rsub|n>
  </equation>

  The flux <math|<tf>> is referred to as the contravariant flux.

  The vectors <math|<around|{|J*<ba><rsup|i>|}><rsub|i<subindex>1><rsup|d>>
  are called the metric terms and the <with|font-shape|italic|metric
  identity> is given by

  <\equation>
    <big|sum><rsub|i=1><rsup|d><pdv|<around|(|J*<ba><rsup|i>|)>|<xii>>=<bzero><label|eq:curved.metric.identity.contravariant>
  </equation>

  The metric identity can be obtained by reasoning that the gradient of a
  constant function is zero and using<nbsp><eqref|eq:curved.gradient.transform.contravariant>
  or that a constant solution must remain constant
  in<nbsp><eqref|eq:curved.transformed.conservation.law>. The metric identity
  is crucial for studying free stream stream preservation of a numerical
  scheme.

  <\remark>
    The equations for two dimensional case can be obtained by setting
    <math|<around|(|\<Theta\><around|(|<vxi>|)>|)><rsub|3>=x<rsub|3><around|(|<vxi>|)>=<value|xi3>>
    so that <math|<ba><rsub|3>=<around|(|0,0,1|)>>.
  </remark>

  <section|LWFR on curvilinear grids><label|sec:curved.cons.lw>

  The solution of the conservation law will be approximated by piecewise
  polynomial functions which are allowed to be discontinuous across the
  elements. In each element <math|\<Omega\><rsub|e>>, the solution is
  approximated by

  <\equation>
    <wide|<uu>|^><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>=<big|sum><rsub|<bp>><uebp>*\<ell\><rsub|<bp>><around|(|<vxi>|)><label|eq:curved.approx.soln>
  </equation>

  where the <math|\<ell\><rsub|<bp>>> are tensor-product polynomials of
  degree <math|N> which have been already introduced before to define the map
  to the reference element. The hat will be used to denote functions written
  in terms of the reference coordinates and the delta denotes functions which
  are possibly discontinuous across the element boundaries. Note that the
  coefficients <math|<uebp>> are the values of the function at the solution
  points which are GLL points.

  <subsection|Flux Reconstruction (FR)><label|sec:curved.fr>

  Recall that we defined the multi-index <math|<bp>=<around|(|p<rsub|i>|)><rsub|i=1><rsup|d>><nbsp><eqref|eq:curved.Nnd>
  where <math|p<rsub|i>\<in\><around|{|0,1*\<ldots\>,N|}>>. Let
  <math|i\<in\><around|{|1,\<ldots\>,d|}>> denote a coordinate direction and
  <math|S\<in\><around|{|L,R|}>> so that <math|<around|(|S,i|)>> corresponds
  to the face <math|<Ois>> in direction <math|i> on side <math|S> which has
  the reference outward normal <math|<bnr><rsub|S,i>>, see
  Figure<nbsp><reference|fig:curved.ref.map>. Thus, <math|<Oip>> denotes the
  face where reference outward normal is <math|<bnr><rsub|R,i>=<be><rsub|i>>
  and <math|<Oim>> has outward unit normal
  <math|<bnr><rsub|L,i>=-<bnr><rsub|R,i>>.

  The FR scheme is a collocation scheme at each of the solution points
  <math|<around*|{|<vxi><rsub|<bp>>=<around|(|\<xi\><rsub|p<rsub|i>>|)><rsub|i=1><rsup|d>,p<rsub|i>=0,\<ldots\>,N|}>>.
  We will thus explain the scheme for a fixed <math|<vxi>=<vxi><rsub|<bp>>>
  and denote <math|<vxi><rsub|i><rsup|S>> as the projection of <vxi> to the
  face <math|S=L,R> in the <math|i<rsup|th>> direction (see
  Figure<nbsp><reference|fig:curved.ref.map>), i.e.,

  <\equation>
    <around|(|<vxi><rsub|i><rsup|S>|)><rsub|j>=<around*|{|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|l>|<cwith|1|-1|3|3|cell-halign|l>|<cwith|1|-1|3|3|cell-rborder|0ln>|<table|<row|<cell|\<xi\><rsub|j>,>|<cell|<space|2em>>|<cell|j\<neq\>i>>|<row|<cell|-1,>|<cell|>|<cell|j=i,S=L>>|<row|<cell|+1,>|<cell|>|<cell|j=i,S=R>>>>>|\<nobracket\>><label|eq:curved.xis.notation>
  </equation>

  <big-figure|<with|par-mode|center|<image|illustrations/paper3/reference_map.pdf|0.95par|||><label|fig:curved.ref.map>>|<caption-detailed|Illustration
  of reference map, solution point projections, reference and physical
  normals.|Illustration of curvilinear reference map.>>

  The first step is to construct an approximation to the flux by
  interpolating at the solution points

  <\equation>
    <around|(|<tf><rsub|e><rsup|\<delta\>>|)><rsub|i><around|(|<vxi>|)>=<big|sum><rsub|<bp>><around|(|J*<ba><rsup|i>\<cdot\><pf>|)><around|(|<vxi><rsub|<bp>>|)>*\<ell\><rsub|<bp>><around|(|<vxi>|)><label|eq:curved.flux.poly.defn>
  </equation>

  which may be discontinuous across the element interfaces. In order to
  couple the neighbouring elements and ensure conservation property,
  continuity of the normal flux at the interfaces is enforced by constructing
  the <with|font-shape|italic|continuous flux approximation> using the FR
  correction functions <math|g<rsub|L>,g<rsub|R>><nbsp><cite|Huynh2007>. We
  construct this for the contravariant flux
  <math|<tf><rsup|\<delta\>>><nbsp><eqref|eq:curved.flux.poly.defn> by
  performing correction along each direction <math|i>,

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|r>|<cwith|1|1|3|3|cell-halign|r>|<cwith|2|2|5|5|cell-halign|l>|<table|<row|<cell|<around|(|<tf><rsub|e><around|(|<vxi>|)>|)><rsup|i>>|<cell|=>|<cell|<around|(|<tf><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>|)><rsup|i>>|<cell|+>|<cell|<around|(|<around|(|<tf><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tf><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|R,i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><around|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|>|<cell|>|<cell|>|<cell|->|<cell|<around|(|<around|(|<tf><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tf><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|L,i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><around|(|\<xi\><rsub|p<rsub|i>>|)>>>>>><label|eq:curved.cts.num.flux>
  </equation>

  where <math|<tf><rsub|e>\<cdot\><bnr><rsub|S,i><around|(|<vxi><rsub|i><rsup|S>|)>>
  denotes the trace value of the normal flux in element
  <math|\<Omega\><rsub|e>> and <math|<around|(|<tf><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|S>|)>>
  denotes the numerical flux. We will use Rusanov's numerical
  flux<nbsp><cite|Rusanov1962> which for the face <math|<around|(|S,i|)>> is
  given by

  <\equation>
    <around|(|<tf><rsub|e>\<cdot\><bnr><rsub|S,i>|)><rsup|\<ast\>>=<tf><rsup|\<ast\>><around|(|<uu><rsup|-><rsub|S,i>,<uu><rsup|+><rsub|S,i>,<bnr><rsub|S,i>|)>=<frac|1|2>*<around|[|<around|(|<tf><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|+>+<around|(|<tf><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|->|]>-<frac|\<lambda\><rsub|S,i>|2>*<around|(|<uu><rsup|+><rsub|S,i>-<uu><rsup|-><rsub|S,i>|)><label|eq:curved.rusanov.flux>
  </equation>

  The <math|<around|(|<tf><rsup|\<delta\>>\<cdot\><bn><rsub|S,i>|)><rsup|\<pm\>>>
  and <math|<uu><rsub|S,i><rsup|\<pm\>>> denote the trace values of the
  normal flux and solution from outer, inner directions respectively; the
  inner direction corresponds to the element <math|\<Omega\><rsub|e>> while
  the outer direction corresponds to its neighbour across the interface
  <math|<around|(|S,i|)>>. The <math|\<lambda\><rsub|S,i>> is a local wave
  speed estimate at the interface <math|<around|(|S,i|)>>. For compressbile
  Euler's equations<nbsp><eqref|eq:2deuler>, the wave speed is estimated
  as<nbsp><cite|Ranocha2022>

  <\equation>
    <label|eq:rusanov.lambda>\<lambda\>=max
    <around|(|<around|\||v<rsup|->|\|>,<around|\||v<rsup|+>|\|>|)>+max
    <around|(|<around|\||c<rsup|->|\|>,<around|\||c<rsup|+>|\|>|)>,<space|2em>v<rsup|\<pm\>>=<bv>\<cdot\><bn><rsup|\<pm\>>,<space|2em>c<rsup|\<pm\>>=<sqrt|\<gamma\>*p<rsup|\<pm\>>/\<rho\><rsup|\<pm\>>>
  </equation>

  where <math|<bn>> is the physical unit normal at the interface. The FR
  correction functions <math|g<rsub|L>,g<rsub|R>> in the degree <math|N+1>
  polynomial space <math|<polyP><rsub|N+1>> are a crucial ingredient of the
  FR scheme and have the property

  <\equation*>
    g<rsub|L><around|(|-1|)>=g<rsub|R><around|(|1|)>=1,<space|2em>g<rsub|L><around|(|1|)>=g<rsub|R><around|(|-1|)>=0
  </equation*>

  Reference<nbsp><cite|Huynh2007> gives a discussion on how the choice of
  correction functions leads to equivalence between FR and variants of DG
  scheme. In this work, the correction functions known as <math|g<rsub|2>> or
  <math|g<rsub|HU>> from<nbsp><cite|Huynh2007> are used since along with
  Gauss-Legendre-Lobatto (GLL) solution points, they lead to an FR scheme
  which is equivalent to a DG scheme using the same GLL solution and
  quadrature points. Once the continuous flux approximation is obtained, the
  FR scheme is given by

  <\equation>
    <dv|<uebp><rsup|\<delta\>>|t>+<frac|1|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tf><rsub|e><around|(|<vxi><rsub|<bp>>|)>=<bzero>,<space|2em>\<forall\><bp><label|eq:curved.semi.discrete.fr>
  </equation>

  where <math|J<rsub|e,<bp>>> is the Jacobian of the transformation at
  solution points <math|<bx><rsub|e,<bp>>>. The FR scheme is explicitly
  written as

  <\equation>
    <label|eq:curved.fr.update.curvilinear>

    <\eqsplit>
      <tformat|<table|<row|<cell|<dv|<uu><rsub|e,<bp>><rsup|\<delta\>>|t>>|<cell|+<frac|1|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tf><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>>>|<row|<cell|>|<cell|+<frac|1|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tf><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tf><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|R,i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|>|<cell|-<frac|1|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tf><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tf><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|L,i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>=<bzero>>>>>
    </eqsplit>
  </equation>

  <subsection|Lax-Wendroff Flux Reconstruction
  (LWFR)><label|sec:curved.lwfr.curved>

  The LWFR scheme is obtained by following the Lax-Wendroff procedure for
  Cartesian domains<nbsp><cite|babbar2022> on the transformed
  equation<nbsp><eqref|eq:curved.transformed.conservation.law>. With
  <math|<uu><rsup|n>> denoting the solution at time level <math|t=t<rsub|n>>,
  the solution at the next time level can be written using Taylor expansion
  in time as

  <\equation*>
    <uu><rsup|n+1>=<uu><rsup|n>+<big|sum><rsub|k<subindex>1><rsup|N+1><frac|\<Delta\>t<rsup|k>|k!>*\<partial\><rsub|t><rsup|<around|(|k|)>>*<uu><rsup|n>+O<around|(|\<Delta\>t<rsup|N+2>|)>
  </equation*>

  where <math|N> is the solution polynomial degree. Then, use
  <math|<uu><rsub|t>=-<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><tf>>
  from<nbsp><eqref|eq:curved.transformed.conservation.law> to swap a temporal
  derivative with a spatial derivative and retaining terms upto
  <math|O<around|(|\<Delta\>t<rsup|N+1>|)>>

  <\equation*>
    <uu><rsup|n+1>=<uu><rsup|n>-<frac|1|J>*<big|sum><rsub|k=1><rsup|N+1><frac|\<Delta\>t<rsup|k>|k!>*\<partial\><rsub|t><rsup|<around|(|k-1|)>>*<around|(|\<nabla\><rsub|<vxi>>\<cdot\><tf>|)>
  </equation*>

  Shifting indices and writing in a conservative form

  <\equation>
    <uu><rsup|n+1>=<uu><rsup|n>-<frac|\<Delta\>t|J>*\<nabla\><rsub|<vxi>>\<cdot\><tF><label|eq:curved.lw.update>
  </equation>

  where <math|<tF>> is a time averaged approximation of the contravaraint
  flux <math|<tf>> given by

  <\equation>
    <tF>=<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k><tf>\<approx\><frac|1|\<Delta\>t>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><tf><ud>t<label|eq:curved.time.averaged.flux>
  </equation>

  We first construct an element local order <math|N+1> approximation
  <math|<tF><rsup|\<delta\>><rsub|e>> to <math|<tF>><nbsp>(Section<nbsp><reference|sec:curved.alwp>)

  <\equation*>
    <tF><rsup|\<delta\>><rsub|e><around|(|<vxi>|)>=<big|sum><rsub|<bp>><tF><rsub|e,<bp>>*\<ell\><rsub|<bp>><around|(|<vxi>|)>
  </equation*>

  and which will be in general discontinuous across the element interfaces.
  Then, we construct the <with|font-shape|italic|continuous time averaged
  flux approximation> by performing a correction along each direction
  <math|i>, analogous to the case of FR<nbsp><eqref|eq:curved.cts.num.flux>,
  leading to

  <\equation>
    <tabular*|<tformat|<cwith|2|2|5|5|cell-halign|l>|<cwith|1|1|5|5|cell-halign|l>|<table|<row|<cell|<around|(|<tF><rsub|e><around|(|<vxi>|)>|)><rsup|i>>|<cell|=>|<cell|<around|(|<tF><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>|)><rsup|i>>|<cell|+>|<cell|<around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tF><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|R,i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><around|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|>|<cell|>|<cell|>|<cell|->|<cell|<around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tF><rsub|e><rsup|\<delta\>>\<cdot\><bnr><rsub|L,i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><around|(|\<xi\><rsub|p<rsub|i>>|)>>>>>><label|eq:curved.cts.time.avg.flux>
  </equation>

  where, as in<nbsp><eqref|eq:curved.rusanov.flux>, the numerical
  flux<nbsp><math|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|S,i>|)><rsup|\<ast\>>>
  is an approximation to the time average flux and is computed by a
  Rusanov-type approximation,

  <\equation>
    <around|(|<tF><rsub|e>\<cdot\><wide|<bn>|^><rsub|S,i>|)><rsup|\<ast\>>=<frac|1|2>*<around|[|<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|+>+<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|->|]>-<frac|\<lambda\><rsub|S,i>|2>*<around|(|<uU><rsup|+><rsub|S,i>-<uU><rsup|-><rsub|S,i>|)><label|eq:curved.rusanov.flux.lw>
  </equation>

  and <math|<uU>> is the approximation of time average solution given by

  <\equation>
    <uU>=<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k><uu>\<approx\><frac|1|\<Delta\>t>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><uu>*<ud>t
  </equation>

  The computation of dissipative part of<nbsp><eqref|eq:curved.rusanov.flux.lw>
  using the time averaged solution instead of the solution at time
  <math|t<rsub|n>> was introduced in Section<nbsp><reference|sec:numflux> and
  was termed D2 dissipation. It is a natural choice in approximating the time
  averaged numerical flux and doesn't add any significant computational cost
  because the temporal derivatives of <math|<uu>> are already available when
  computing the local approximation <math|<tF><rsup|\<delta\>>>. The choice
  of D2 dissipation reduces to an upwind scheme in case of constant advection
  equation and leads to enhanced Fourier CFL stability limit
  (Section<nbsp><reference|sec:four1d>).

  The Lax-Wendroff update is performed following<nbsp><eqref|eq:curved.semi.discrete.fr>
  for<nbsp><eqref|eq:curved.lw.update>

  <\equation*>
    <uebp><rsup|n+1>=<uebp><rsup|n>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tF><rsub|e><around|(|<vxi><rsub|<bp>>|)>
  </equation*>

  which can be explicitly written as

  <\equation>
    <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|<uebp><rsup|n+1>=<uebp><rsup|n>>|<cell|-<frac|\<Delta\>t|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tF><rsup|\<delta\>><rsub|e><around|(|<vxi><rsub|<bp>>|)>>>|<row|<cell|>|<cell|-<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|R,i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|>|<cell|+<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>>>>>><label|eq:curved.lwfr.update.curvilinear>
  </equation>

  By multiplying<nbsp><eqref|eq:curved.lwfr.update.curvilinear> by quadrature
  weights <math|J<rsub|e,<bp>>*w<rsub|<bp>>> and summing over <math|<bp>>, it
  is easy to see that the scheme is conservative in the sense that

  <\equation>
    <wide|<uu>|\<bar\>><rsub|e><rsup|n+1>=<wide|<uu>|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>t|<around|\||\<Omega\><rsub|e>|\|>>*<around*|(|<big|sum><rsub|i=1><rsup|d><big|int><rsub|<Oip>><around|(|<tF><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><ud>S<rsub|<vxi>>+<big|int><rsub|<Oim>><around|(|<tF><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><ud>S<rsub|<vxi>>|)><label|eq:curved.conservation.lw>
  </equation>

  where the element mean value <math|<wide|<uu>|\<bar\>><rsub|e>> is defined
  to be

  <\equation>
    <wide|<uu>|\<bar\>><rsub|e>=<frac|1|<around|\||\<Omega\><rsub|e>|\|>>*<big|sum><rsub|<bp>><uebp>J<rsub|e,<bp>>*w<rsub|<bp>><label|defn.mean>
  </equation>

  We provide the proof of<nbsp><eqref|eq:curved.conservation.lw> for
  completeness. Multiply<nbsp><eqref|eq:curved.lwfr.update.curvilinear> with
  <math|J<rsub|e,<bp>>*<value|cw><rsub|<bp>>> and sum over
  <math|<bp>\<in\><Nnd>> to get, using the exactness of
  Gauss-Legendre-Lobatto (GLL) quadrature

  <\equation>
    <\eqsplit>
      <tformat|<table|<row|<cell|<au><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>>|<cell|-<frac|\<Delta\>t|<around|\||\<Omega\><rsub|e>|\|>>*<big|int><rsub|<Oo>>\<nabla\><rsub|<vxi>>\<cdot\><tF><rsup|\<delta\>><rsub|e><around|(|<vxi>|)>*<ud><vxi>>>|<row|<cell|>|<cell|-<frac|\<Delta\>t|<around|\||\<Omega\><rsub|e>|\|>>*<big|int><rsub|<Oo>><space|0.2spc><big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|R,i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>*<ud><vxi>>>|<row|<cell|>|<cell|+<frac|\<Delta\>t|<around|\||\<Omega\><rsub|e>|\|>>*<big|int><rsub|<Oo>><space|0.2spc><big|sum><rsub|i=1><rsup|d><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>*<ud><vxi><label|eq:semi.integral.form>>>>>
    </eqsplit>
  </equation>

  where <math|<vxi><rsub|i><rsup|s>> are as defined
  in<nbsp><eqref|eq:curved.xis.notation>. Then, note the following integral
  identities that are an application of Fubini's theorem followed by
  fundamental theorem of Calculus

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<big|int><rsub|<Oo>>\<partial\><rsub|\<xi\><rsup|i>>\<cdot\><tF><rsup|\<delta\>><rsub|e><around|(|<vxi>|)>*<ud><vxi>>|<cell|=>|<cell|<big|int><rsub|\<partial\>*\<Omega\><rsub|o,i><rsup|L>><around|[|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|]>*<ud>S<rsub|<vxi>>+<big|int><rsub|\<partial\>*\<Omega\><rsub|o,i><rsup|R>><around|[|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|R,i>|]>*<ud>S<rsub|<vxi>>>>|<row|<cell|<big|int><rsub|<Oo>><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|R,i>|)><around|(|<vxi><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>*<ud><vxi>>|<cell|=>|<cell|<big|int><rsub|\<partial\>*\<Omega\><rsub|o,i><rsup|R>><around|[|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|R,i>|]>*<ud>S<rsub|<vxi>>>>|<row|<cell|<big|int><rsub|<Oo>><around|(|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><around|(|<vxi><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around|(|\<xi\><rsub|p<rsub|i>>|)>*<ud><vxi>>|<cell|=>|<cell|-<big|int><rsub|\<partial\>*\<Omega\><rsub|o,i><rsup|L>><around|[|<around|(|<tF><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>>-<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|]>*<ud>S<rsub|<vxi>>>>>>>
  </equation*>

  where <math|<Ois>> is as in Figure<nbsp><reference|fig:curved.ref.map> and
  we used <math|g<rsub|L><around|(|-1|)>=g<rsub|R><around|(|1|)>=1>,
  <math|g<rsub|L><around|(|-1|)>=g<rsub|R><around|(|1|)>=0>. Then
  substituting these identities into<nbsp><eqref|eq:semi.integral.form> gives
  us the conservative update of the cell average<nbsp><eqref|eq:curved.conservation.lw>.

  <subsection|Approximate Lax-Wendroff procedure><label|sec:curved.alwp>

  We now illustrate how to approximate the time average flux at the solution
  points <math|<tF><rsub|e,<bp>>> which is required to construct the element
  local approximation <math|<tF><rsub|e><rsup|\<delta\>><around|(|<vxi>|)>>
  using the approximate Lax-Wendroff procedure<nbsp><cite|Zorio2017>. For
  <math|N=1>,<nbsp><eqref|eq:curved.time.averaged.flux> requires
  <math|\<partial\><rsub|t>*<tf>> which is approximated as

  <\equation>
    \<partial\><rsub|t><tf><rsup|\<delta\>><around|(|<vxi><rsub|<bp>>|)>=<frac|<tf><around|(|<uu><rsub|<bp>>+\<Delta\>t<around|(|<uu><rsub|t>|)><rsub|<bp>>|)>-<tf><around|(|<uu><rsub|<bp>>-\<Delta\>t<around|(|<uu><rsub|t>|)><rsub|<bp>>|)>|2*\<Delta\>t><label|eq:curved.ft.defn>
  </equation>

  where element index <math|e> is suppressed as all these operations are
  local to each element. The time index is also suppresed as all quantities
  are used from time level <math|t<rsub|n>>. The <math|<uu><rsub|t>> above is
  approximated using<nbsp><eqref|eq:curved.transformed.conservation.law>

  <\equation>
    <around|(|<uu><rsub|t>|)><rsub|<bp>>=-<frac|1|J<rsub|<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tf><rsup|\<delta\>><around|(|<vxi><rsub|<bp>>|)><label|eq:curved.ut.defn>
  </equation>

  where <math|<tf><rsup|\<delta\>>> is the cell local approximation to the
  flux <math|<tf>> given in<nbsp><eqref|eq:curved.flux.poly.defn>. For
  <math|N=2>,<nbsp><eqref|eq:curved.time.averaged.flux> additionally requires
  <math|\<partial\><rsub|t\<nocomma\>t>*<tf>>

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|l>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|\<partial\><rsub|t*t>*<tf><rsup|\<delta\>><around|(|<vxi><rsub|<bp>>|)>>|<cell|>>|<row|<cell|=>|<cell|<frac|1|\<Delta\>t<rsup|2>>*<around*|[|<tf><around*|(|<uu><rsub|<bp>>+\<Delta\>t<around|(|<uu><rsub|t>|)><rsub|<bp>>+<frac|\<Delta\>t|2><around|(|<uu><rsub|t*t>|)><rsub|<bp>>|)>-2*<tf><around|(|<uu><rsub|<bp>>|)>+<tf><around*|(|<uu><rsub|<bp>>-\<Delta\>t<around|(|<uu><rsub|t>|)><rsub|<bp>>+<frac|\<Delta\>t|2><around|(|<uu><rsub|t*t>|)><rsub|<bp>>|)>|]>>>>>>
  </equation*>

  where the element index <math|e> is again suppressed. We approximate
  <math|<uu><rsub|t\<nocomma\>t>> as

  <\equation>
    <around|(|<uu><rsub|t*t>|)><rsub|<bp>>=-<frac|1|J<rsub|<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\>\<partial\><rsub|t><tf><rsup|\<delta\>><around|(|<vxi><rsub|<bp>>|)><label|eq:curved.utt.defn>
  </equation>

  The procedure for other degrees will be similar and the derivatives
  <math|\<nabla\><rsub|<vxi>>> are computed using a differentiation matrix.
  The implementation is made efficient by accounting for cancellations of
  <math|\<Delta\>t> terms, which will be the same as in
  Section<nbsp><reference|sec:alw> for Cartesian meshes.

  <subsection|Free stream preservation for
  LWFR><label|sec:curved.free.stream.lwfr>

  <with|color|red|Write intro about the free stream preservation problem.>

  The divergence in a Flux Reconstruction (FR)
  scheme<nbsp><eqref|eq:curved.fr.update.curvilinear> is computed as the
  derivative of a polynomial. Thus, denoting
  <math|\<partial\><rsub|\<xi\><rsub|i>><rsup|h>> as a polynomial derivative,
  which is computed using a differentiation
  matrix<nbsp><eqref|eq:diff.matrix>, the following
  <with|font-shape|italic|discrete metric
  identity><nbsp><eqref|eq:curved.metric.identity.contravariant> is required
  for our scheme to preserve a constant state

  <\equation>
    <big|sum><rsub|i=1><rsup|d>\<partial\><rsub|\<xi\><rsub|i>><rsup|h>
    <around|(|J*<ba><rsup|i>|)>=<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|\<xi\><rsub|i>>*<InI><around|(|J*<ba><rsup|i>|)>=<bzero><label|eq:curved.metric.identity.contravariant.inter>
  </equation>

  where <math|<InI>> is the degree <math|N> interpolation operator defined as

  <\equation>
    <InI><around|(|f|)><around|(|<vxi>|)>=<big|sum><rsub|<bp>>\<ell\><rsub|<bp>><around|(|<vxi>|)>*f<around|(|<vxi><rsub|<bp>>|)><label|eq:curved.interpolation.defn>
  </equation>

  The study of free-stream preservation for Discontinuous Galerkin (DG)
  methods was made in<nbsp><cite|Kopriva2006> showing that
  satisfying<nbsp><eqref|eq:curved.metric.identity.contravariant.inter> gives
  free stream preservation. However, it was also shown that the identities
  impose additional constraints on the degree of the reference map
  <math|\<Theta\>>. The remedy given in<nbsp><eqref|eq:curved.metric.identity.contravariant.inter>
  is to replace the metric terms <math|J*<ba><rsup|i>> by a different degree
  <math|N> approximation <math|<II><around|(|J*<ba><rsup|i>|)>> so
  that<nbsp><eqref|eq:curved.metric.identity.contravariant.inter> reduces to

  <\equation>
    <big|sum><rsub|i=1><rsup|d>\<partial\><rsub|\<xi\><rsub|i>><rsup|h>
    <II><around|(|J*<ba><rsup|i>|)>=<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|\<xi\><rsub|i>>*<InI>
    <II><around|(|J*<ba><rsup|i>|)>=<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|\<xi\><rsub|i>>**<II><around|(|J*<ba><rsup|i>|)>=<bzero><label|eq:curved.metric.identity.contravariant.poly>
  </equation>

  In<nbsp><cite|Kopriva2006>, choices of <math|<II>> like the
  <with|font-shape|italic|conservative curl form> were proposed which
  ensured<nbsp><eqref|eq:curved.metric.identity.contravariant.poly> without
  any additional constraints on the degree of the reference map
  <math|\<Theta\>>. Those choices are only relevant in 3-D as, in 2-D, they
  are equivalent to interpolating <math|\<Theta\>> to a degree <math|N>
  polynomial before computing the metric terms which is the choice of
  <math|<II>> we make in this work by defining the reference map as
  in<nbsp><eqref|eq:curved.reference.map>.

  In this section, we show that the identities<nbsp><eqref|eq:curved.metric.identity.contravariant.inter>
  are enough to ensure free stream preservation for LWFR. Throughout this
  section, we assume that the mesh is <with|font-shape|italic|well-constructed><nbsp><cite|Kopriva2006>
  which is a property that follows from the natural assumption of global
  continuity of the reference map.

  <\definition>
    <label|defn:curved.well.constructed.mesh>Consider a mesh where element
    faces in reference element <math|<Oo>> are denoted as
    <math|<around*|{|\<partial\>\<Omega\><rsub|o,i><rsup|S>|}>> for
    coordinate directions <math|1\<leq\>i\<leq\>d> and <math|S=L/R> chosen so
    that the corresponding reference normals
    <math|<around*|{|<bnr><rsub|S,i>|}>> are
    <math|<bnr><rsub|R,i>=<be><rsub|i>> and
    <math|<bnr><rsub|L,i>=-<bnr><rsub|R,i>> where
    <math|<around*|{|<be><rsub|i>|}><rsub|i=1><rsup|d>> is the Cartesian
    basis, see Figure<nbsp><reference|fig:curved.ref.map>. The mesh is said
    to be well-constructed if the following is satisfied

    <\equation>
      <big|sum><rsub|m=1><rsup|d><around|(|<II><around|(|J*<ba><rsup|m>|)><rsup|+>-<II><around|(|J*<ba><rsup|m>|)><rsup|->|)>*<around|(|<bnr><rsub|S,i>|)><rsub|m>=<bzero>,<space|2em>\<forall\>1\<leq\>i\<leq\>d,<space|1em>s=L,R<label|eq:curved.well.constructed>
    </equation>

    where <math|\<pm\>> are used to denote trace values from <math|<Oo>> or
    from the neighbouring element respectively.
  </definition>

  <\remark>
    From<nbsp><eqref|eq:curved.contravariant.identity>, the
    identity<nbsp><eqref|eq:curved.well.constructed> can be seen as a
    property of continuity of the tangential derivatives of the reference map
    at the faces and is thus obtained if the reference map is globally
    continuous. Also, since the unit normal vector of an element at interface
    <math|i> is given by <math|J*<ba><rsup|i>/<around*|\||J*<ba><rsup|i>|\|>>,<nbsp><eqref|eq:curved.well.constructed>
    also gives us continuity of the unit normal across interfaces.
  </remark>

  Assuming the current solution is constant in space,
  <math|<uu><rsup|n>=<bc>>, we will begin by proving that the approximate
  time averaged flux and solution satisfy

  <\equation>
    <tF><rsup|\<delta\>>=<tf><rsup|\<delta\>><around|(|<bc>|)>,<space|2em><uU>=<uu><rsup|\<delta\>>=<bc><label|eq:curved.time.avg.is.physical.flux>
  </equation>

  For the constant physical flux <math|<pf><around|(|<bc>|)>>, the
  contravariant flux <math|<tf>> will be

  <\equation>
    <label|eq:ftilde.free.stream><tf><rsub|i>=<II><around|(|J*<ba><rsup|i>|)>\<cdot\><pf><around|(|<bc>|)>=<big|sum><rsub|n=1><rsup|d><II><around|(|J*a<rsup|i><rsub|n>|)><pf><rsub|n><around|(|<bc>|)>
  </equation>

  Note that the contravariant flux<nbsp><eqref|eq:ftilde.free.stream> is not
  constant as the metric terms spatially vary for curvilinear grids. However,
  using<nbsp><eqref|eq:curved.ut.defn>, we obtain at each solution point

  <\equation*>
    <tabular*|<tformat|<cwith|3|3|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<uu><rsub|t>>|<cell|=>|<cell|-<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\><tf><rsup|\<delta\>>=-<frac|1|J>*<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|<xii>><around|(|<tf><rsup|\<delta\>>|)><rsup|i>>>|<row|<cell|>|<cell|=>|<cell|-<frac|1|J>*<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|<xii>>*<around|(|<II><around|(|J*<ba><rsup|i>|)>\<cdot\><pf><around|(|<bc>|)>|)>=-<frac|1|J>*<around*|(|<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|<xii>>
    <II><around|(|J*<ba><rsup|i>|)>|)>\<cdot\><pf><around|(|<bc>|)>>>|<row|<cell|>|<cell|=>|<cell|<bzero>>>>>>
  </equation*>

  where the last equality follows from using the metric
  identity<nbsp><eqref|eq:curved.metric.identity.contravariant.inter>. For
  polynomial degree <math|N=1>, recalling <eqref|eq:curved.ft.defn>, this
  proves that

  <\equation*>
    \<partial\><rsub|t>*<tf><rsup|\<delta\>>=<frac|<tf><around|(|<uu>+\<Delta\>t*<uu><rsub|t>|)>-<tf><around|(|<uu>-\<Delta\>t*<uu><rsub|t>|)>|2*\<Delta\>t>=<bzero>
  </equation*>

  Thus, we obtain

  <\equation*>
    <tF><rsup|\<delta\>>=<tf><rsup|\<delta\>>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<tf><rsup|\<delta\>>=<tf><rsup|\<delta\>>,<space|2em><uU>=<uu><rsup|\<delta\>>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<uu><rsup|\<delta\>>=<uu><rsup|\<delta\>>
  </equation*>

  Building on this, for <math|N=2>, by <eqref|eq:curved.utt.defn>,

  <\equation*>
    <uu><rsub|t\<nocomma\>t>=-<frac|1|J>*\<nabla\><rsub|<vxi>>\<cdot\>\<partial\><rsub|t>*<tf><rsup|\<delta\>>=<bzero>
  </equation*>

  which will prove <math|\<partial\><rsub|t\<nocomma\>t><tf><rsup|\<delta\>>=<bzero>>
  and we similarly obtain the following for all degrees

  <\eqnarray>
    <tformat|<table|<row|<cell|<tF><rsup|\<delta\>>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>*<tf><rsup|\<delta\>>=<tf><rsup|\<delta\>>=<around*|{|J*<ba><rsup|i>\<cdot\><pf><around|(|<bc>|)>|}><rsub|i<subindex>1><rsup|d><eq-number><label|eq:curved.Fisf>>>|<row|<cell|<uU>>|<cell|=>|<cell|<big|sum><rsub|k=0><rsup|N><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>*<uu><rsup|\<delta\>>=<uu><rsup|\<delta\>>=<bc><eq-number><label|eq:curved.Uisu>>>>>
  </eqnarray>

  To prove free stream preservation, we argue that the
  update<nbsp><eqref|eq:curved.lwfr.update.curvilinear> vanishes as the
  volume terms involving divergence of <math|<tF><rsup|\<delta\>>> and the
  surface terms involving trace values and numerical flux vanish.
  By<nbsp><eqref|eq:curved.Fisf>, the volume terms
  in<nbsp><eqref|eq:curved.lwfr.update.curvilinear> are given by

  <\equation*>
    <frac|1|J>*\<Delta\>t*<around*|(|<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|<xii>>*<II><around|(|J*<ba><rsup|i>|)>|)>\<cdot\><pf><around|(|<bc>|)>
  </equation*>

  and vanish by the metric identity<nbsp><eqref|eq:curved.metric.identity.contravariant.poly>.
  By<nbsp><eqref|eq:curved.Uisu>, the dissipative part of the numerical
  flux<nbsp><eqref|eq:curved.rusanov.flux.lw> is computed with the constant
  solution <math|<uu><rsup|n>=<bc>> and will thus vanish. For the central
  part of the numerical flux, as the mesh is well-constructed
  (Definition<nbsp><reference|defn:curved.well.constructed.mesh>), the trace
  values are given by

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|+>>|<cell|=>|<cell|<big|sum><rsub|m=1><rsup|d><around|(|<II><around|(|J*<ba><rsup|m>|)>\<cdot\><pf><around|(|<bc>|)>|)><rsup|+><around|(|<bnr><rsub|S,i>|)><rsub|m>=<big|sum><rsub|m=1><rsup|d><around|(|<II><around|(|J*<ba><rsup|m>|)>\<cdot\><pf><around|(|<bc>|)>|)><rsup|-><around|(|<bnr><rsub|S,i>|)><rsub|m>>>|<row|<cell|>|<cell|=>|<cell|<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|->>>>>>
  </equation*>

  Overall, the numerical flux<nbsp><eqref|eq:curved.rusanov.flux.lw>
  satisfies

  <\equation*>
    <around|(|<tF><rsub|e>\<cdot\><bnr><rsub|S,i>|)><rsup|\<ast\>>=<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|+>=<around|(|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>|)><rsup|->
  </equation*>

  That is, the numerical flux agrees with the physical flux at element
  interfaces, ensuring that the surface terms
  in<nbsp><eqref|eq:curved.lwfr.update.curvilinear> vanish.

  <section|Shock capturing and admissibility
  preservation><label|sec:curved.shock.capturing>

  As is the case for problems involving Cartesian grids
  (Chapters<nbsp><reference|ch:lwfr>-<reference|ch:mdrk>), most practical
  problems involving hyperbolic conservation laws on curvilinear grids
  consist of non-smooth solutions containing shocks and other
  discontinuities. Thus, we develop the blending scheme from
  Section<nbsp><reference|sec:blending.scheme> for curvilinear grids. In
  order to be compatible with <verbatim|Trixi.jl><nbsp><cite|Ranocha2022> and
  make use of this excellent code, we introduce LWFR with blending scheme for
  Gauss-Legendre-Lobatto solution points, which are also used in
  <verbatim|Trixi.jl>. As in Chapter<nbsp><reference|ch:lw.subcell.limiter>,
  the blending scheme has to be constructed to be provably admissibility
  preserving<nbsp>(Definition<nbsp><reference|defn:adm.pres>), which is
  obtained by the weaker admissibility preservation in
  means<nbsp>(Definition<nbsp><reference|defn:mean.pres>) property using the
  scaling limiter (<cite|Zhang2010b>,<nbsp>Appendix<nbsp><reference|app:scaling.limiter>).

  As in Section<nbsp><reference|sec:blending.scheme>, we will subdivide each
  element into subcells (Figure<nbsp><reference|fig:curved.curved.subcells>)
  and perform a first order finite volume evolution on the subcells which
  will be blended with the high order scheme LWFR scheme using a smoothness
  indicator as in<nbsp><eqref|eq:blended.scheme>. We begin by discussing how
  to construct the low order scheme on the curved element and subcells.

  <subsection|Low order scheme for curvilinear grids>

  <big-figure|<with|par-mode|center|<image|illustrations/paper3/subcells_curved|0.95par|||><label|fig:curved.curved.subcells>>|Subcells
  in a curved FR element>

  The subcells for a curved element will be defined by the reference map, as
  shown in Figure<nbsp><reference|fig:curved.curved.subcells>. As in Appendix
  B.3 of<nbsp><cite|hennemann2021>, the finite volume formulation on subcells
  is obtained by an integral formulation of the transformed conservation
  law<nbsp><eqref|eq:curved.transformed.conservation.law>. In the reference
  element, consider subcells <math|<Cijk>> of size
  <math|w<rsub|<bp>>=<big|prod><rsub|i=1><rsup|d>w<rsub|p<rsub|i>>>
  associated to the solution point <math|<around|(|\<xi\><rsub|p<rsub|i>>|)><rsub|i=1><rsup|d>>
  corresponding to the multi-index <math|<bp>=<around|(|p<rsub|i>|)><rsub|i=1><rsup|d>>,
  where <math|p<rsub|i>\<in\><around|{|0,1*\<ldots\>,N|}>>. Fix a subcell
  <math|C=<Cijk>> around the solution point
  <math|<vxi>=<around|(|\<xi\><rsub|p<rsub|i>>|)><rsub|i=1><rsup|d>> and
  denote <math|<vxi><rsub|i><rsup|L/R>> as
  in<nbsp><eqref|eq:curved.xis.notation>. Integrate the conservation law on
  the fixed subcell <math|C>

  <\equation*>
    <big|int><rsub|C>J*<uu><rsub|t>*<ud>V+<big|int><rsub|C>\<nabla\><rsub|<vxi>>\<cdot\><tf>*<ud>V=<bzero>
  </equation*>

  Next perform one point quadrature in the first term and apply Gauss
  divergence theorem on the second term to get

  <\equation>
    J<rsub|e,<bp>>*<dv|<uu><rsub|<bp>>|t>*w<rsub|<bp>>+<big|int><rsub|\<partial\>*C><tf>\<cdot\><bnr>*<ud>A=<bzero>
  </equation>

  where <math|<bnr>> is the reference normal vector on the subcell surface.
  Now evaluate this surface integral by approximating fluxes in each
  direction with numerical fluxes

  <\equation>
    <label|eq:curved.lower.order.flux.curved><big|int><rsub|\<partial\>*C><tf>\<cdot\><bnr><ud>A=<big|sum><rsub|i=1><rsup|d><frac|w<rsub|<bp>>|w<rsub|p<rsub|i>>>*<around|[|<around|(|<tf><rsup|\<delta\>><rsub|C>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>+<around|(|<tf><rsup|\<delta\>><rsub|C>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>|]>,<space|1em><bnr><rsub|R,i>=<be><rsub|i>*<bnr><rsub|L,i>=-<be><rsub|i>
  </equation>

  The explicit lower order method using forward Euler update is given by

  <\equation>
    <uu><rsup|n+1><rsub|<bp>>=<uu><rsup|n><rsub|<bp>>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><frac|1|w<rsub|p<rsub|i>>>*<around|[|<around|(|<tf><rsup|\<delta\>><rsub|<Cijk>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>+<around|(|<tf><rsup|\<delta\>><rsub|<Cijk>>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>|]><label|eq:curved.lower.order.curved>
  </equation>

  For the subcells whose interfaces are not shared by the FR element, the
  fluxes are computed, following<nbsp><cite|hennemann2021>, as

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<around|(|<tf><rsup|\<delta\>><rsub|<Cijk>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>=<around*|\<\|\|\>|<around|(|<bn><rsub|R,i>|)><rsub|<bp>>|\<\|\|\>>*<pf><rsup|\<ast\>><around*|(|<uu><rsub|<bp>>,<uu><rsub|<bp><rsub|i+>>,<frac|<around|(|<bn><rsub|R,i>|)><rsub|<bp>>|<around*|\||<around|(|<bn><rsub|R,i>|)><rsub|<bp>>|\|>>|)>>>|<row|<cell|<around|(|<tf><rsup|\<delta\>><rsub|<Cijk>>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>=<around|\<\|\|\>|<around|(|<bn><rsub|L,i>|)><rsub|<bp>>|\<\|\|\>>*<pf><rsup|\<ast\>><around*|(|<uu><rsub|<bp><rsub|i->>,<uu><rsub|<bp>>,<frac|<around|(|<bn><rsub|L,i>|)><rsub|<bp>>|<around|\<\|\|\>|<around|(|<bn><rsub|L,i>|)><rsub|<bp>>|\<\|\|\>>>|)>>>|<row|<cell|<around|(|<bp><rsub|i\<pm\>>|)><rsub|m>=<choice|<tformat|<table|<row|<cell|p<rsub|m><space|2em>>|<cell|m\<neq\>i>>|<row|<cell|p<rsub|i\<pm\>1>>|<cell|m=i>>>>>>>>>><label|eq:curved.lo.numflux>
  </equation>

  where <math|<around|(|<bn><rsub|s,i>|)><rsub|<bp>>> is the normal vector of
  subcell <math|C<rsub|<bp>>> in direction <math|i> and side
  <math|s\<in\><around|{|L,R|}>>. The numerical
  fluxes<nbsp><eqref|eq:curved.lo.numflux> are taken to be Rusanov's
  flux<nbsp><eqref|eq:curved.rusanov.flux>

  <\equation>
    <tf><rsup|\<ast\>><around|(|<uu><rsup|->,<uu><rsup|+>,<bn>|)>=<frac|1|2>*<around|[|<around|(|<pf>\<cdot\><bn>|)><around|(|<uu><rsup|+>|)>+<around|(|<pf>\<cdot\><bn>|)><around|(|<uu><rsup|->|)>|]>-<frac|\<lambda\>|2>*<around|(|<uu><rsup|+>-<uu><rsup|->|)><label|eq:curved.fo.rusanov>
  </equation>

  where <math|\<lambda\>> is the wave speed estimate at the subcell face
  computed using <math|<value|uu><rsup|\<pm\>>><nbsp><eqref|eq:rusanov.lambda>.
  At the interfaces shared by FR elements, the first order numerical flux is
  computed by setting <math|<uu><rsup|\<pm\>>>
  in<nbsp><eqref|eq:curved.fo.rusanov> to element trace values as
  in<nbsp><eqref|eq:curved.rusanov.flux>. However, the lower order residual
  needs to be computed using the same inter-element flux as the higher order
  scheme at interfaces of the Flux Reconstruction (FR) elements. Thus, for
  example, for an element <math|\<Omega\><rsub|e>> at solution point
  <math|<vxi>=<vxi><rsub|<bp>>> with <math|<bp>=<bzero>>, the subcell update
  will be given by

  <\equation>
    <uu><rsub|e,<bzero>><rsup|n+1>=<uu><rsub|e,<bzero>><rsup|n>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><frac|1|w<rsub|p<rsub|i>>>*<around|[|<around|(|<tf><rsup|\<delta\>><rsub|C<rsub|<bzero>>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>+<around|(|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>|]><label|eq:curved.blended.flux.in.curved>
  </equation>

  where <math|<around|(|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>>
  is the blended numerical flux and is computed by taking a convex
  combination of the lower order flux chosen as
  in<nbsp><eqref|eq:curved.rusanov.flux> and the time averaged flux from LWFR
  scheme<nbsp><eqref|eq:curved.rusanov.flux.lw>. An initial guess is made as
  in 1-D<nbsp><eqref|eq:Fblend> and then further correction is performed to
  ensure admissibility, as explained in Section<nbsp><reference|sec:curved.flux.correction.curved>.
  Other subcells neighbouring the element interfaces will also use the
  blended numerical fluxes at the element interfaces and thus have an update
  similar to<nbsp><eqref|eq:curved.blended.flux.in.curved>. Then, by
  multiplying each update equation of each subcell <math|<bp>> by
  <math|w<rsub|<bp>>> and summing over <math|<bp>>, the conservation property
  is obtained

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<wide|<uu>|\<bar\>><rsub|e><rsup|L,n+1>=<big|sum><rsub|<bp>><uebp><rsup|L,n+1>w<rsub|<bp>>=<wide|<uu>|\<bar\>><rsub|e><rsup|n>-<frac|\<Delta\>t|<around|\||\<Omega\><rsub|e>|\|>>*<around*|(|<big|sum><rsub|i=1><rsup|d><big|int><rsub|<Oip>><around|(|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><ud>S<rsub|<vxi>>+<big|int><rsub|<Oim>><around|(|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><ud>S<rsub|<vxi>>|)><label|eq:curved.low.order.cell.avg.update.curved>>>>>>
  </equation>

  Since we also have the conservation property in the higher order
  scheme<nbsp><eqref|eq:curved.conservation.lw>, the blended scheme will be
  conservative, analogous to the 1-D case<nbsp>(<reference|eq:low.order.cell.avg.update>,<nbsp><reference|eq:conservation.blending.scheme>).

  The expressions for normal vectors on the subcells needed to
  compute<nbsp><eqref|eq:curved.lo.numflux> are taken from Appendix B.4
  of<nbsp><cite|hennemann2021> where they were derived by equating the high
  order flux difference and Discontinuous Galerkin split form. We directly
  state the normal vectors here, denoting
  <math|<around|(|<bn><rsub|R,i>|)><rsub|<bp>>> as the outward normal
  direction in subcell <math|<Cijk>> along the positive <math|i> direction

  <\equation*>
    <around|(|<bn><rsub|R,i>|)><rsub|<bp>>=<II><around|(|J*<ba><rsup|i>|)><rsub|<bp><rsub|i\|0>>+<big|sum><rsub|l=0><rsup|p<rsub|i>>w<rsub|l>*\<partial\><rsub|<xii>><II><around|(|J*<ba><rsup|i>|)><rsub|<bp><rsub|i\|\<nocomma\>l>>,<space|2em><around|(|<bp><rsub|i\<nocomma\>\|l>|)><rsub|m>=<choice|<tformat|<table|<row|<cell|p<rsub|m><space|2em>>|<cell|m\<neq\>i>>|<row|<cell|p<rsub|l>>|<cell|m=i>>>>>
  </equation*>

  where <math|<around|{|w<rsub|l>|}><rsub|l=0><rsup|N>> are quadrature
  weights corresponding to solution points, <math|<II>> is the approximation
  operator for metric terms<nbsp><eqref|eq:curved.metric.identity.contravariant.poly>,
  and <math|<around|(|<bn><rsub|L,i>|)><rsub|<bp>>> can be obtained by the
  relation <math|<around|(|<bn><rsub|L,i>|)><rsub|<bp>>=-<around|(|<bn><rsub|R,i>|)><rsub|<bp><rsub|i->>>,
  where <math|<bp><rsub|i->> was defined in<nbsp><eqref|eq:curved.lo.numflux>.

  <paragraph|Free-stream preservation.>To show the free stream preservation
  of the lower order scheme with the chosen normal vectors, we consider a
  constant initial state <math|<uu>=<bc>> and show that the finite volume
  residual will be zero. A constant state implies that the time average of
  the contravariant flux will be the contravariant flux
  itself<nbsp><eqref|eq:curved.time.avg.is.physical.flux>. Thus, all
  numerical fluxes including element interface fluxes are first order fluxes
  like in<nbsp><eqref|eq:curved.lo.numflux> and the residual at <math|<bp>>
  in direction <math|i> is given by

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<cwith|3|3|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<table|<row|<cell|<frac|<pf><around|(|<bc>|)>|w<rsub|p<rsub|i>>>\<cdot\><around|(|<around|(|<bn><rsub|R,i>|)><rsub|<bp>>+<around|(|<bn><rsub|L,i>|)><rsub|<bp>>|)>>|<cell|>>|<row|<cell|=>|<cell|<frac|<pf><around|(|<bc>|)>|w<rsub|p<rsub|i>>>\<cdot\><around|(|<II><around|(|J*<ba><rsup|i>|)><rsub|<bp><rsub|i\<nocomma\>\|0>>+<big|sum><rsub|l=0><rsup|p<rsub|i>>w<rsub|l>*\<partial\><rsub|<xii>>*<II><around|(|J*<ba><rsup|i>|)><rsub|<bp><rsub|i\|\<nocomma\>l>>-<II><around|(|J*<ba><rsup|i>|)><rsub|<bp><rsub|i\<nocomma\>\|0>>-<big|sum><rsub|l=0><rsup|p<rsub|i>-1>w<rsub|l>*\<partial\><rsub|<xii>>*<II><around|(|J*<ba><rsup|i>|)><rsub|<bp><rsub|i\<nocomma\>\|l>>|)>>>|<row|<cell|=>|<cell|<pf><around|(|<bc>|)>\<cdot\>\<partial\><rsub|<xii>><II><around|(|J*<ba><rsup|i>|)><rsub|<bp>>>>>>>
  </equation*>

  The residuals in other directions give similar terms and summing them gives

  <\equation*>
    <pf><around|(|<bc>|)>\<cdot\><big|sum><rsub|i=1><rsup|d><pdv||<xii>>*<II><around|(|J*<ba><rsup|i>|)><rsub|<bp>>=<bzero>
  </equation*>

  by the metric identities, thus satisfying the free stream preservation
  condition.

  <subsection|Smoothness indicator><label|sec:curved.smooth.ind>

  As in Section<nbsp><reference|sec:smooth.ind>, we measure the smoothness of
  degree <math|N> approximate solution within each element and in terms of
  the orthonormal Legendre basis and analyzing the decay of its coefficients.
  In this section, we write the smoothness indicator for dimension <math|d>,
  using the multi-index notation<nbsp><eqref|eq:curved.Nnd>.

  Let <math|q=q<around|(|<uu>|)>> be the quantity used to measure the
  solution smoothness. With <math|<around|{|L<rsub|j>|}><rsub|j<subindex>0><rsup|N>>
  being the 1-D Legendre polynomial basis of degree <math|N>, taking tensor
  product gives the degree <math|N> Legendre basis

  <\equation*>
    <Leg><rsub|<bp>><around|(|<vxi>|)>=<big|prod><rsub|i=1><rsup|d><Leg><rsub|p<rsub|i>><around|(|<xii>|)>,<space|2em>p<rsub|i>\<in\><around|{|0,1,\<ldots\>,N|}>
  </equation*>

  The Legendre basis representation of <math|q> can be obtained as

  <\equation*>
    q<rsub|h><around|(|<vxi>|)>=<big|sum><rsub|<bp>><wide|q|^><rsub|<bp>>*L<rsub|<bp>><around|(|<vxi>|)>,<space|1em><vxi>\<in\><Oo>,<space|2em><wide|q|^><rsub|<bp>>=<big|int><rsub|<Oo>>q<around|(|<uu><rsup|\<delta\>><around|(|<vxi>|)>|)>*L<rsub|j><around|(|<vxi>|)>*<ud><vxi>
  </equation*>

  The Legendre coefficients <math|<around*|{|<wide|q|^><rsub|<bp>>|}>> are
  computed using the quadrature induced by the solution points,

  <\equation*>
    <wide|q|^><rsub|<bp>>=<big|sum><rsub|<bq>>q<around|(|<uebq>|)>*L<rsub|<bp>><around|(|<vxi><rsub|<bq>>|)>*w<rsub|<bq>>
  </equation*>

  Define

  <\equation*>
    \<bbb-S\><rsub|K>=<big|sum><rsub|<bp>,p<rsub|i>\<leq\>K><wide|q|^><rsub|<bp>><rsup|2>
  </equation*>

  which the measures the \Penergy\Q in <math|q<rsub|h>>. Then the energy
  contained in highest modes relative to the total energy of the polynomial
  is computed as follows

  <\equation*>
    <en>=max <around*|{|<frac|\<bbb-S\><rsub|N>-\<bbb-S\><rsub|N-1>|\<bbb-S\><rsub|N>>,<frac|\<bbb-S\><rsub|N-1>-\<bbb-S\><rsub|N-2>|\<bbb-S\><rsub|N-1>>|}>
  </equation*>

  In 1-D, this simplifies to the expression
  of<nbsp><eqref|eq:1d.smoothness.E> and the remaining steps to obtain the
  blending coefficient <math|\<alpha\><rsub|e>\<in\><around*|[|0,1|]>> are
  the same as in Section<nbsp><reference|sec:smooth.ind>.

  <subsection|Flux limiter for admissibility
  preservation><label|sec:curved.flux.correction>

  We first review the flux limiting process for admissibility preservation
  from<nbsp><cite|babbar2023admissibility> for 1-D and then do a natural
  extension to curvilinear meshes. The first step in obtaining an
  admissibility preserving blending scheme is to ensure that the lower order
  scheme preserves the admissibility set <math|<Uad>>. This is always true if
  all the fluxes in the lower order method are computed with an admissibility
  preserving low order finite volume method. But the LWFR scheme uses a time
  average numerical flux and maintaining conservation requires that we use
  the same numerical flux at the element interfaces for both lower and higher
  order schemes (Remark<nbsp>1 of<nbsp><cite|babbar2023admissibility>). To
  maintain accuracy and admissibility, we carefully choose a blended
  numerical flux <math|<F><rsub|<eph>>> as in<nbsp><eqref|eq:Fblend> but this
  choice may not ensure admissibility and further limitation is required. Our
  proposed procedure for choosing the blended numerical flux will give us an
  admissibility preserving lower order scheme. As a result of using the same
  numerical flux at element interfaces in both high and low order schemes,
  element means of both schemes are the same
  (Theorem<nbsp><reference|thm:curved.lwfr.admissibility>). A consequence of
  this is that our scheme now preserves admissibility of element means and
  thus we can use the scaling limiter of<nbsp><cite|Zhang2010b> to get
  admissibility at all solution points.

  The theoretical basis for flux limiting is summarized in
  Theorem<nbsp><reference|thm:lwfr.admissibility>. For clarity, we rewrite
  Theorem<nbsp><reference|thm:lwfr.admissibility> in the notation of general
  curvilinear specialized to first order blending in
  Theorem<nbsp><reference|thm:curved.lwfr.admissibility>.

  <\theorem>
    <label|thm:curved.lwfr.admissibility>Consider the LWFR blending scheme on
    curved meshes where low and high order schemes use the same numerical
    flux <math|<around|(|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|s>|)>>
    at every element interface and the lower order residual is computed using
    the first order finite volume scheme<nbsp><eqref|eq:curved.lower.order.curved>.
    Then the following can be said about admissibility preserving in means
    property (Definition<nbsp><reference|defn:mean.pres>) of the scheme:

    <\enumerate>
      <item>element means of both low and high order schemes are same, and
      thus the blended scheme is admissibility preserving in means if and
      only if the lower order scheme is admissibility preserving in means;

      <item>if the blended numerical flux
      <math|<around|(|<tF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|s>|)>>
      is chosen to preserve the admissibility of lower-order updates at
      solution points adjacent to the interfaces, then the blending scheme
      will preserve admissibility in means.
    </enumerate>
  </theorem>

  <\proof>
    By<nbsp>(<reference|eq:curved.conservation.lw>,<nbsp><reference|eq:curved.low.order.cell.avg.update.curved>),
    element means are the same for both low and high order schemes. Thus,
    admissibility in means of one implies the same for the other, proving the
    first claim. For the second claim, note that our assumptions imply
    <math|<uebp><rsup|L,n+1>> given by<nbsp>(<reference|eq:curved.lower.order.curved>,<nbsp><reference|eq:curved.blended.flux.in.curved>)
    are in <math|<Uad>> for all <math|<bp>>. Therefore, we obtain
    admissibility in means property of the lower order scheme
    by<nbsp><eqref|eq:curved.low.order.cell.avg.update.curved> and thus
    admissibility in means for the blended scheme.
  </proof>

  <subsubsection|Flux limiter for admissibility preservation in
  1-D><label|sec:curved.flux.limiter.1d>

  To make the general case of curved meshes easier to understand, we keep the
  1-D Flux limiter in Section<nbsp><reference|sec:admissibility.preservation>
  in a self-contained version in Algorithm<nbsp><reference|alg:blended.flux>.
  For simplicity, we only consider the case where
  <math|<value|ad><rsub|k>><nbsp><eqref|eq:uad.form> are concave functions of
  the conservative variables.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            Computation of blended flux <math|<F><rsub|<eph>>><label|alg:blended.flux>

            <with|font-series|bold|Input:>
            <math|<F><rsub|<eph>><rsup|LW>,<pf><rsub|<eph>>,<pf><rsup|e+1><rsub|<frac|3|2>>,<pf><rsup|e><rsub|<Nph>>,<uepoz><rsup|n>,<ueN><rsup|n>,\<alpha\><rsub|e>,\<alpha\><rsub|e+1>><next-line><with|font-series|bold|Output:>
            <math|<F><rsub|<eph>>>
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          <algo-state|<math|\<alpha\><rsub|<eph>>=<frac|\<alpha\><rsub|e>+\<alpha\><rsub|e+1>|2>>>

          <\wide-tabular>
            <tformat|<cwith|1|1|2|2|cell-halign|r>|<table|<row|<\cell>
              <algo-state|<math|<F><rsub|<eph>>\<leftarrow\><around|(|1-\<alpha\><rsub|<eph>>|)>*<F><rsub|<eph>><rsup|LW>+\<alpha\><rsub|<eph>>*<pf><rsub|<eph>>>
              >
            </cell>|<\cell>
              <math|\<vartriangleright\>><space|0.2spc>Heuristic guess to
              control oscillations
            </cell>>>>
          </wide-tabular>

          \;

          <\wide-tabular>
            <tformat|<table|<row|<\cell>
              <math|\<vartriangleright\>><space|0.2spc>FV inner updates with
              guessed <math|<F><rsub|<eph>>>
            </cell>>|<row|<\cell>
              <math|<atu><rsub|0><rsup|n+1>\<leftarrow\><uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<pf><rsup|e><rsub|<frac|3|2>>-<F><rsub|<eph>>|)>>
            </cell>>|<row|<\cell>
              <algo-state|<math|<atu><rsub|N><rsup|n+1>\<leftarrow\><ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<F><rsub|<eph>>-<pf><rsup|e><rsub|<Nph>>|)>>>
            </cell>>>>
          </wide-tabular>

          <\wide-tabular>
            <tformat|<table|<row|<\cell>
              <math|\<vartriangleright\>><space|0.2spc>FV inner updates with
              <math|<pf><rsub|<eph>>>
            </cell>>|<row|<\cell>
              <math|<utilow><rsub|0>=<uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<pf><rsup|e+1><rsub|<frac|3|2>>-<pf><rsub|<eph>>|)>>
            </cell>>|<row|<\cell>
              <algo-state|<math|<utilow><rsub|N>=<ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<pf><rsub|<eph>>-<pf><rsup|e><rsub|<Nph>>|)>>>
            </cell>>>>
          </wide-tabular>

          <no-indent><with|font-series|bold|for> <math|k=1:K>
          <with|font-series|bold|do>

          <math|\<vartriangleright\>><space|0.2spc>Correct
          <math|<F><rsub|<eph>>> for <math|K> admissibility constraints

          <algo-state|<math|\<epsilon\><rsub|0>,\<epsilon\><rsub|N>\<leftarrow\><frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|0>|)>,<frac|1|10>*<value|ad><rsub|k><around|(|<utilow><rsub|N>|)>>>

          <algo-state|<math|\<theta\>\<leftarrow\>min
          <around*|(|min<rsub|j=0,N><around*|\||<frac|\<epsilon\><rsub|j>-<value|ad><rsub|k><around|(|<atu><rsub|j><rsup|<text|low>,n+1>|)>)|<value|ad><rsub|k><around|(|<atu><rsub|j><rsup|n+1>|)>-<value|ad><rsub|k><around|(|<atu><rsub|j><rsup|<text|low>,n+1>|)>>|\|>,1|)>>>

          <math|<F><rsub|<eph>>\<leftarrow\>\<theta\>*<F><rsub|<eph>>+<around|(|1-\<theta\>|)>*<pf><rsub|<eph>>>

          \;

          <math|\<vartriangleright\>><space|0.2spc>FV inner updates with
          <math|<F><rsub|<eph>>> corrected for <math|<value|ad><rsub|k>>

          <algo-state|<math|<atu><rsub|0><rsup|n+1>\<leftarrow\><uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<pf><rsup|e+1><rsub|<frac|3|2>>-<F><rsub|<eph>>|)>>>

          <algo-state|<math|<atu><rsub|N><rsup|n+1>\<leftarrow\><ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<F><rsub|<eph>>-<pf><rsup|e><rsub|<Nph>>|)>>>

          <no-indent><with|font-series|bold|end>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  <subsubsection|Flux limiter for admissibility preservation on curved
  meshes><label|sec:curved.flux.correction.curved>

  Consider the calculation of the blended numerical flux for a corner
  solution point of the element, see Figure<nbsp><reference|fig:curved.curved.subcells>.
  A corner solution point is adjacent to interfaces in all <math|d>
  directions, making its admissibility preservation procedure different from
  1-D. In particular, let us consider the corner solution point
  <math|<bp>=<bzero>> and show how we can apply the 1-D procedure in
  Section<nbsp><reference|sec:curved.flux.limiter.1d> to ensure admissibility
  at such points. The same procedure applies to other corner and non-corner
  points. The lower order update at the corner is given
  by<nbsp><eqref|eq:curved.blended.flux.in.curved>

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|<atu><rsub|e,<bzero>><rsup|n+1>>|<cell|=>|<cell|<uu><rsub|e,<bzero>><rsup|n>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*<big|sum><rsub|i=1><rsup|d><frac|1|w<rsub|p<rsub|i>>>*<around|[|<around|(|<tf><rsup|\<delta\>><rsub|C<rsub|<bzero>>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>+<around|(|<atF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>|]>>>>>>
  </equation>

  where <math|<bnr><rsub|i>=<be><rsub|i>> is the reference normal vector on
  the subcell interface in direction <math|i>,
  <math|<around|(|<tf><rsup|\<delta\>><rsub|C<rsub|<bzero>>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>>>
  denotes the lower order flux<nbsp><eqref|eq:curved.lower.order.flux.curved>
  at the subcell <math|C<rsub|<bzero>>> surrounding
  <math|<vxi><rsub|<bzero>>>, <math|<around|(|<atF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>>
  is the initial guess candidate for the blended numerical flux. Pick
  <math|k<rsub|i>\<gtr\>0> such that <math|<big|sum><rsub|i=1><rsup|d>k<rsub|i>=1>
  and

  <\equation>
    <atu><rsub|i><rsup|<text|low>,n+1>\<assign\><uu><rsub|e,<bzero>><rsup|n>-<frac|\<Delta\>t|k<rsub|i>*w<rsub|p<rsub|i>>*J<rsub|e,<bp>>>*<around|[|<around|(|<tf><rsup|\<delta\>><rsub|C<rsub|<bzero>>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>+<around|(|<tf>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>|]>,<space|2em>1\<leq\>i\<leq\>d<label|eq:curved.low.update.2d>
  </equation>

  satisfy

  <\equation>
    <atu><rsub|i><rsup|<text|low>,n+1>\<in\><Uad>,<space|2em>1\<leq\>i\<leq\>d<label|eq:curved.2d.low.update.admissibility.condn>
  </equation>

  where <math|<around|(|<tf>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>>
  is the first order finite volume flux computed at the FR element interface.

  The <math|<around|{|k<rsub|i>|}>> that ensure<nbsp><eqref|eq:curved.2d.low.update.admissibility.condn>
  will exist provided the appropriate CFL restrictions are satisfied because
  the lower order scheme using the first order numerical flux at element
  interfaces is admissibility preserving. The choice of
  <math|<around|{|k<rsub|i>|}>> should be made so
  that<nbsp><eqref|eq:curved.2d.low.update.admissibility.condn> is satisfied
  with the least time step restriction. However, we make the trivial choice
  of equal <math|k<rsub|i>>'s motivated by the experience
  of<nbsp><cite|babbar2023admissibility>, where it was found that even this
  choice does not impose any additional time step constraints over the
  Fourier stability limit. After choosing <math|k<rsub|i>>'s, we have reduced
  the update to 1-D and can repeat the same procedure as in
  Algorithm<nbsp><reference|alg:blended.flux> where for all directions
  <math|i>, the neighbouring element is chosen along the normal direction.
  After the flux limiting is performed following the
  Algorithm<nbsp><reference|alg:blended.flux>, we obtain
  <math|<around|(|<atF><rsup|\<delta\>><rsub|e>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>>
  such that

  <\equation>
    <atu><rsub|i><rsup|n+1>\<assign\><uu><rsub|e,<bzero>><rsup|n>-<frac|\<Delta\>t|k<rsub|i>*w<rsub|p<rsub|i>>*J<rsub|e,<bp>>>*<around|[|<around|(|<tf><rsup|\<delta\>><rsub|C<rsub|<bzero>>>\<cdot\><bnr><rsub|R,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>+<around|(|<atF><rsup|\<delta\>>\<cdot\><bnr><rsub|L,i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|L>|)>|]>\<in\><Uad><label|eq:curved.2d.adm.numflux.desired>
  </equation>

  Then, we will get

  <\equation>
    <big|sum><rsub|i=1><rsup|d>k<rsub|i>*<atu><rsub|i><rsup|n+1>=<atu><rsub|e,<bzero>><rsup|n+1>\<in\><Uad><label|eq:curved.2d.xy.implies.admissibility>
  </equation>

  along with admissibility of all other corner and non-corner solution points
  where the flux <math|<around|(|<atF><rsup|\<delta\>>\<cdot\><bnr><rsub|i>|)><rsup|\<ast\>><around|(|<vxi><rsub|i><rsup|R>|)>>
  is used. Finally, by Theorem<nbsp><reference|thm:curved.lwfr.admissibility>,
  admissibility in means (Definition<nbsp><reference|defn.mean>) is obtained
  and the scaling limiter of<nbsp><cite|Zhang2010b> can be used to obtain an
  admissibility preserving scheme (Definition<nbsp><reference|defn:adm.pres>).

  <section|Adaptive mesh refinement><label|sec:curved.amr>

  Adaptive mesh refinement helps resolve flows where the relevant features
  are localized to certain regions of the physical domain by increasing the
  mesh resolution in those regions and coarsening in the rest of the domain.
  In this work, we allow the adaptively refined meshes to be non-conforming,
  i.e., element neighbours need not have coinciding solution points at the
  interfaces<nbsp>(Figure<nbsp><reference|fig:curved.refine.coarsen>a). We
  handle the non-conformality using the <em|mortar element method> first
  introduced for hyperbolic PDEs in<nbsp><cite|Kopriva1996>.

  In order to perform the transfer of solution during coarsening and
  refinement, we introduce some notations and operators. Define the 1-D
  reference elements

  <\equation>
    I<rsub|0>=<around|[|-1,0|]>,<space|2em>I<rsub|1>=<around|[|0,1|]>,<space|2em>I=<around|[|-1,1|]>,<space|2em><Nod>=<around|{|0,1|}><rsup|d><label|eq:curved.I0.defn>
  </equation>

  and the bijections <math|\<phi\><rsub|s>:I<rsub|s>\<rightarrow\>I> for
  <math|s=0,1> as

  <\equation>
    <label|eq:curved.submap><sphi><rsub|0><around|(|\<xi\>|)>=2*\<xi\>+1,<space|1em>\<xi\>\<in\>I<rsub|0>,<space|2em><sphi><rsub|1><around|(|\<xi\>|)>=2*\<xi\>-1,<space|1em>\<xi\>\<in\>I<rsub|1>
  </equation>

  so that the inverse maps <math|\<phi\><rsub|s><rsup|-1>:I\<rightarrow\>I<rsub|s>>
  are given by

  <\equation>
    <label|eq:curved.submap.inverse><sphi><rsub|0><rsup|-1><around|(|\<xi\>|)>=<frac|\<xi\>-1|2>,<space|1em>\<xi\>\<in\>I,<space|2em><sphi><rsub|1><rsup|-1><around|(|\<xi\>|)>=<frac|\<xi\>+1|2>,<space|1em>\<xi\>\<in\>I
  </equation>

  Denoting the 1-D solution points and Lagrange basis for <math|I> as
  <math|<around|{|\<xi\><rsub|p>|}><rsub|p<subindex>0><rsup|N>> and
  <math|<around|{|\<ell\><rsub|p><around|(|\<xi\>|)>|}><rsub|p<subindex>0><rsup|N>>
  respectively, the same for <math|I<rsub|s>> are given by
  <math|<around*|{|<sphi><rsub|s><rsup|-1><around|(|\<xi\><rsub|p>|)>|}><rsub|p<subindex>0><rsup|N>>
  and <math|<around*|{|\<ell\><rsub|p><around|(|<sphi><rsub|s><around|(|\<xi\>|)>|)>|}><rsub|p<subindex>0><rsup|N>>
  respectively. We also define <math|<value|qqint>> to be integration under
  quadrature at solution points. Thus,

  <\equation*>
    <value|qqint><rsub|I>u<around|(|\<xi\>|)>*<ud>\<xi\>=<big|sum><rsub|p<subindex>0><rsup|N>u<around|(|\<xi\><rsub|p>|)>*w<rsub|p>,<space|2em><value|qqint><rsub|I<rsub|s>>u<around|(|\<xi\>|)>*<ud>\<xi\>=<big|sum><rsub|p<subindex>0><rsup|N>2*u<around|(|<sphi><rsub|s><rsup|-1><around|(|\<xi\><rsub|p>|)>|)>*w<rsub|p>
  </equation*>

  In order to get the solution point values of the refined elements, we will
  perform interpolation. All integrals in this section are approximated by
  quadrature at solution points which are the degree <math|N>
  Gauss-Legendre-Lobatto points. The interpolation operator from <math|I> to
  <math|<around|{|I<rsub|s>|}><rsub|s<subindex>0,1>> is given by
  <math|<Vi><rsub|<X><rsub|s>>> defined as the Vandermonde matrix
  corresponding to the Lagrange basis

  <\equation>
    <around|(|<Vi><rsub|s>|)><rsub|p\<nocomma\>q>=\<ell\><rsub|q><around|(|<sphi><rsub|s><rsup|-1><around|(|\<xi\><rsub|p>|)>|)>,<space|2em>0\<leq\>p,q\<leq\>N,<space|2em>s=0,1<label|eq:curved.subint.op>
  </equation>

  For the process of coarsening, we also define the <math|L<rsup|2>>
  projection operators <math|<around*|{|<proP><rsup|s>|}><rsub|s<subindex>0,1>>
  which projects a polynomial <math|u> defined on the Lagrange basis of
  <math|I<rsub|s>> to the Lagrange basis of <math|I> as

  <\equation*>
    <value|qqint><rsub|I><proP><rsup|s><around|(|u|)><around|(|\<xi\>|)>*\<ell\><rsub|i><around|(|\<xi\>|)>*<ud>\<xi\>=<value|qqint><rsub|I<rsub|s>>u<around|(|\<xi\>|)>*\<ell\><rsub|i><around|(|\<xi\>|)>*<ud>\<xi\>,<space|2em>0\<leq\>i\<leq\>N
  </equation*>

  Approximating the integrals by quadrature on solution points, we obtain the
  matrix representations corresponding to the basis

  <\equation>
    <proP><rsup|s><rsub|p\<nocomma\>q>=<frac|1|2>*<frac|w<rsub|q>|w<rsub|p>>*\<ell\><rsub|p><around|(|<sphi><rsub|s><rsup|-1><around|(|\<xi\><rsub|q>|)>|)>,<space|2em>0\<leq\>i,j\<leq\>N,<space|1em>s=0,1<label|eq:curved.proP.defn>
  </equation>

  where <math|<around|{|w<rsub|p>|}><rsub|p<subindex>0><rsup|N>> are the
  quadrature weights corresponding to solution points. The transfer of
  solution during coarsening and refinement is performed by matrix vector
  operations using the operators<nbsp>(<reference|eq:curved.subint.op>,<nbsp><reference|eq:curved.proP.defn>).
  Thus, the operators<nbsp>(<reference|eq:curved.subint.op>,<nbsp><reference|eq:curved.proP.defn>)
  are stored as matrices for reference element at the beginning of the
  simulation and reused for the adaptation operations in all elements.
  Lastly, we introduce the notation of a product of matrix operators
  <math|<around|{|A<rsub|i>|}><rsub|i=1><rsup|d>> acting on
  <math|\<b-b\>=<around|(|b<rsub|<bp>>|)><rsub|<bp>\<in\><Nnd>>=<around|(|b<rsub|p<rsub|1>\<nocomma\>p<rsub|2>\<nocomma\>p<rsub|3>>|)><rsub|<bp>\<in\><Nnd>>>
  as

  <\equation>
    <around|(|A<rsub|i>*\<b-b\>|)><rsub|<bp>>=<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d>><around*|(|<big|prod><rsub|i=1><rsup|d><around|(|A<rsub|i>|)><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>|)>*b<rsub|<bq>><label|eq:curved.product.of.operators>
  </equation>

  <subsection|Solution transfer between element and
  subelements><label|sec:curved.soln.transfer><float|float|thb|<big-figure|<center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|illustrations/paper3/mortar_neighbours.pdf|0.55par|||>>>|<row|<cell|(a)>>|<row|<cell|<image|illustrations/paper3/refine_coarsen_extended.pdf|0.75par|||>>>|<row|<cell|(b)>>>>>><label|fig:curved.refine.coarsen>|<caption-detailed|(a)
  Neighbouring elements with hanging nodes (b) Illustration of refinement and
  coarsening|AMR illustration(a) hanging nodes, (b) refinement &
  coarsening>>>

  Corresponding to the element <math|\<Omega\><rsub|e>>, we denote the
  <math|2<rsup|d>> subdivisions as<nbsp>(Figure<nbsp><reference|fig:curved.refine.coarsen>b)

  <\equation*>
    \<Omega\><rsub|e<rsub|<bss>>>=\<Theta\><rsub|e><around*|(|<big|prod><rsub|i=1><rsup|d>I<rsub|s<rsub|i>>|)>,<space|2em>\<forall\><bss>\<in\><Nod>
  </equation*>

  where <math|I<rsub|s>> are defined in<nbsp><eqref|eq:curved.I0.defn>. We
  also define <math|<sphi><rsub|<bss>><around|(|<vxi>|)>=<around|(|<sphi><rsub|s<rsub|i>><around|(|<xii>|)>|)><rsub|i=1><rsup|d>>
  so that <math|<sphi><rsub|<bss>>> is a bijection between
  <math|\<Omega\><rsub|e<rsub|<bss>>>> and <math|\<Omega\><rsub|e>>. Recall
  that <math|<around*|{|\<ell\><rsub|<bp>>|}><rsub|<bp>\<in\><Nnd>>> are
  Lagrange polynomials of degree <math|N> with variables
  <math|<vxi>=<around|(|<xii>|)><rsub|i=1><rsup|d>>. Thus, the reference
  solution points and Lagrange basis for <math|\<Omega\><rsub|e<rsub|<bss>>>>
  are given by <math|<around*|{|<sphi><rsub|<bss>><rsup|-1><around|(|<vxi><rsub|<bp>>|)>|}><rsub|<bp>\<in\>\<bbb-N\><rsub|N><rsup|d>>>
  and <math|<around*|{|\<ell\><rsub|<bp>><around|(|<sphi><rsub|<bss>><around|(|<vxi>|)>|)>|}><rsub|<bp>\<in\><Nnd>>>,
  respectively. The respective representations of solution approximations in
  <math|\<Omega\><rsub|e>,\<Omega\><rsub|e<rsub|<bss>>>> in reference
  coordinates are thus given by

  <\equation>
    <uu><rsub|e><around|(|<vxi>|)>=<big|sum><rsub|<bq>\<in\><Nnd>>\<ell\><rsub|<bq>><around|(|<vxi>|)>*<uu><rsub|e,<bq>>,<space|2em><uu><rsub|e<rsub|<bss>>><around|(|<vxi>|)>=<big|sum><rsub|<bq>\<in\><Nnd>>\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><around|(|<vxi>|)>|)>*<uu><rsub|e<rsub|<bss>>,<bq>><label|eq:curved.ueues.defn>
  </equation>

  <subsubsection|Interpolation for refinement>

  After refining an element <math|\<Omega\><rsub|e>> into child elements
  <math|<around*|{|\<Omega\><rsub|e<rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d>>>,
  the solution <math|<uu><rsub|e>> has to be interpolated on the solution
  points of child elements to obtain <math|<around*|{|<uu><rsub|e<rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d>>>.
  The scheme will be specified by writing
  <math|<uu><rsub|e<rsub|<bss>>,<bq>>> in terms of <math|<uu><rsub|e,<bq>>>,
  which were defined in<nbsp><eqref|eq:curved.ueues.defn>. The interpolation
  is performed as

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|2|2|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<uu><rsub|e<rsub|<bss>>,<bp>>>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\><Nnd>>\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><rsup|-1><around|(|<vxi><rsub|<bp>>|)>|)><uu><rsub|e,<bq>>=<big|sum><rsub|<bq>\<in\><Nnd>><around*|(|<big|prod><rsub|i=1><rsup|d>\<ell\><rsub|q<rsub|i>><around|(|<sphi><rsub|s<rsub|i>><rsup|-1><around|(|<vxi><rsub|p<rsub|i>>|)>|)>|)><uu><rsub|e,<bq>>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\><Nnd>><around*|(|<big|prod><rsub|i=1><rsup|d><around|(|<Vi><rsub|<X><rsub|s<rsub|i>>>|)><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>|)><uu><rsub|e,<bq>>>>>>><label|eq:curved.interpolation.ue>
  </equation*>

  In the product of operators notation<nbsp><eqref|eq:curved.product.of.operators>,
  the interpolation can be written as

  <\equation*>
    <uu><rsub|e<rsub|<bss>>>=<around*|(|<big|prod><rsub|i=1><rsup|d><Vi><rsub|<X><rsub|s<rsub|i>>>|)><uu><rsub|e>
  </equation*>

  <subsubsection|Projection for coarsening><label|sec:curved.proj.elem>

  When <math|2<rsup|d>> elements are joined into one single bigger element
  <math|\<Omega\><rsub|e>>, the solution transfer is performed using
  <math|L<rsup|2>> projection of <math|<around*|{|<uu><rsub|e<rsub|<bss>>>|}><rsub|<bss>\<in\><Nod>>>
  into <math|<uu><rsub|e>>, which is given by

  <\equation>
    <big|sum><rsub|<bss>\<in\><Nod>><value|qqint><rsub|\<Omega\><rsub|e<rsub|<bss>>>><uu><rsub|e<rsub|<bss>>>\<ell\><rsub|<bp>><around|(|<vxi>|)><ud><bx>=<value|qqint><rsub|\<Omega\><rsub|e>><uu><rsub|e>\<ell\><rsub|<bp>><around|(|<vxi>|)><ud><bx>,<space|2em>\<forall\><bp>\<in\><Nnd><label|eq:curved.4to1proj>
  </equation>

  Substituting<nbsp><eqref|eq:curved.ueues.defn>
  into<nbsp><eqref|eq:curved.4to1proj> gives

  <\equation>
    <big|sum><rsub|<bss>\<in\><Nod>><big|sum><rsub|<bq>\<in\><Nnd>><value|qqint><rsub|\<Omega\><rsub|e<rsub|<bss>>>>\<ell\><rsub|<bp>><around|(|<vxi>|)>*\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><around|(|<vxi>|)>|)><uu><rsub|e<rsub|<bss>>,<bq>><ud><bx>=<big|sum><rsub|<bq>\<in\><Nnd>><value|qqint><rsub|\<Omega\><rsub|e>>\<ell\><rsub|<bp>><around|(|<vxi>|)>*\<ell\><rsub|<bq>><around|(|<vxi>|)><uu><rsub|e,<bq>><ud><bx><label|eq:curved.pro4.with.lagrange>
  </equation>

  Note the 1-D identities

  <\align*>
    <tformat|<table|<row|<cell|<value|qqint><rsub|I>\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|\<xi\>|)><ud>\<xi\>>|<cell|=\<delta\><rsub|p\<nocomma\>q>*w<rsub|p>>>|<row|<cell|<value|qqint><rsub|I<rsub|s>>\<ell\><rsub|p><around|(|\<xi\>|)>*\<ell\><rsub|q><around|(|<sphi><rsub|s><around|(|\<xi\>|)>|)><ud>\<xi\>>|<cell|=<frac|1|2><value|qqint><rsub|-1><rsup|+1>\<ell\><rsub|p><around|(|<sphi><rsub|s><rsup|-1><around|(|\<xi\>|)>|)>*\<ell\><rsub|q><around|(|\<xi\>|)><ud>\<xi\>=<frac|1|2>*\<ell\><rsub|p><around|(|<sphi><rsub|s><rsup|-1><around|(|\<xi\><rsub|q>|)>|)>*w<rsub|q>=\<cal-P\><rsup|s><rsub|p\<nocomma\>q>*w<rsub|p>>>>>
  </align*>

  where the projection operator <math|<around*|{|<proP><rsup|s>|}><rsub|s=0,1>>
  is defined in<nbsp><eqref|eq:curved.proP.defn>. Then, by change of
  variables, we have the following

  <\equation>
    <value|qqint><rsub|\<Omega\><rsub|e>>\<ell\><rsub|<bp>><around|(|<vxi>|)>*\<ell\><rsub|<bq>><around|(|<vxi>|)>=J<rsub|e,<bp>>*<big|prod><rsub|i=1><rsup|d>w<rsub|p<rsub|i>>*\<delta\><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>,<space|2em><value|qqint><rsub|\<Omega\><rsub|e<rsub|<bss>>>>\<ell\><rsub|<bp>><around|(|<vxi>|)>*\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><around|(|<vxi>|)>|)>=J<rsub|e,<bp>>*<big|prod><rsub|i=1><rsup|d>w<rsub|p<rsub|i>>*\<cal-P\><rsup|s<rsub|i>><rsub|p<rsub|i>\<nocomma\>q<rsub|i>><label|eq:curved.integral.identities>
  </equation>

  Using<nbsp><eqref|eq:curved.integral.identities>
  in<nbsp><eqref|eq:curved.pro4.with.lagrange> and dividing both sides by
  <math|J<rsub|e,<bp>>> gives

  <\equation*>
    <uu><rsub|e,<bp>>=<big|sum><rsub|<bss>\<in\><Nod>><big|sum><rsub|<bq>\<in\><Nnd>><around*|(|<big|prod><rsub|i=1><rsup|d>\<cal-P\><rsup|s<rsub|i>><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>|)><uu><rsub|e<rsub|<bss>>,<bq>>=<big|sum><rsub|<bss>\<in\><Nod>><around*|(|<big|prod><rsub|i=1><rsup|d>\<cal-P\><rsup|s<rsub|i>>|)><uu><rsub|e<rsub|<bss>>>
  </equation*>

  where the last equation follows using the product of operators
  notation<nbsp><eqref|eq:curved.product.of.operators>.

  <subsection|Mortar element method (MEM)><label|sec:curved.handling.mortars>

  <subsubsection|Motivation and notation>

  <float|float|thb|<big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|illustrations/paper3/refine_coarsen_face_prolongation|0.8par|||>>>|<row|<cell|(a)>>|<row|<cell|<image|illustrations/paper3/refine_coarsen_face_projection|0.8par|||>>>|<row|<cell|(b)>>>>><label|fig:curved.mortar>|<caption-detailed|(a)
  Prolongation to mortar and computation of numerical flux
  <math|<F><rsub|\<Xi\><rsub|1>>,<F><rsub|\<Xi\><rsub|2>>>, (b) Projection of
  numerical flux to interfaces.|AMR illustration (a) Prolongation, (b)
  Projection.>>>When the mesh is adaptively refined, there will be elements
  with different refinement levels sharing a face; in this work, we assume
  that the refinement levels of those elements only differs by
  2<nbsp>(Figure<nbsp><reference|fig:curved.refine.coarsen>a). Since the
  neighbouring elements do not have a common face, the solution points on
  their faces do not coincide<nbsp>(Figure<nbsp><reference|fig:curved.mortar>).
  We will use the Mortar Element Method (MEM) for computing the numerical
  flux at all the required points on such a face, while preserving accuracy
  and the conservation property<nbsp><eqref|eq:curved.conservation.lw>. There
  are two steps to the method.

  <\enumerate>
    <item>Prolong<nbsp><math|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>,<uU><rsub|S,i>,<uu><rsub|S,i>><nbsp><eqref|eq:curved.rusanov.flux.lw>
    from the neighbouring elements to a set of common solution points known
    as mortar solution points<nbsp>(Figure<nbsp><reference|fig:curved.mortar>a).

    <item>Compute the numerical flux at the mortar solution points as
    in<nbsp><eqref|eq:curved.rusanov.flux.lw> and map it back to the
    interfaces<nbsp>(Figure<nbsp><reference|fig:curved.mortar>b).
  </enumerate>

  In Sections<nbsp><reference|sec:curved.el2mortar>,<nbsp><reference|sec:curved.proj.face>,
  we will explain these two steps through the specific case of
  Figure<nbsp><reference|fig:curved.mortar> and we first introduce notations
  for the same.

  Consider the multi-indices <math|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>=<around|{|0,1|}><rsup|d-1>>
  and the interface in right (positive) <math|i=1> direction of element
  <math|\<Omega\><rsub|e>>, denoted as <math|<G>>
  (Figure<nbsp><reference|fig:curved.mortar>). We assume that the elements
  neighbouring <math|\<Omega\><rsub|e>> at the interface <math|\<Gamma\>> are
  finer and thus we have non-conforming subinterfaces
  <math|<around*|{|<G><rsub|<bss>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  which, by continuity of the reference map, can be written as
  <math|<G><rsub|<bss>>=\<Theta\><rsub|e><around|(|<around|{|1|}>\<times\><big|prod><rsub|i=1><rsup|d-1>I<rsub|s<rsub|i>>|)>=\<Theta\><rsub|e><around|(|<around|{|1|}>\<times\><sphi><rsub|<bss>><rsup|-1><around|(|I<rsup|d-1>|)>|)>>.
  Thus, in reference coordinates, <math|<sphi><rsub|<bss>>><nbsp><eqref|eq:curved.submap>
  is a bijection from <math|\<Gamma\><rsub|<bss>>> to <math|\<Gamma\>>. The
  interface <math|\<Gamma\>> can be parametrized as
  <math|<by>=<bga><around|(|<bet>|)>=\<Theta\><rsub|e><around|(|1,<bet>|)>>
  for <math|<bet>\<in\>I<rsup|d-1>> and thus the reference variable of
  interface is denoted <math|<bet>=<bga><rsup|-1><around|(|<by>|)>>. The
  subinterfaces can also be written by using the same parametrization so that
  <math|\<Gamma\><rsub|<bss>>=<around*|{|\<gamma\><around|(|<bet>|)>:<bet>\<in\><big|prod><rsub|i=1><rsup|d-1>I<rsub|s<rsub|i>>|}>>.
  For the reference solution points on <math|<G>> being
  <math|<around*|{|<bet><rsub|<bss>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>,
  the solution points in <math|\<Gamma\><rsub|<bss>>> are respectively given
  by <math|<around*|{|<sphi><rsub|<bss>><rsup|-1><around|(|<bet><rsub|<bp>>|)>|}><rsub|<bp>\<in\>N<rsub|1><rsup|d-1>>>
  and for <math|<around*|{|\<ell\><rsub|<bp>><around|(|<bet>|)>|}><rsub|<bp>\<in\>\<bbb-N\><rsub|N><rsup|d-1>>>
  being Lagrange polynomials in <math|<G>>, the Lagrange polynomials in
  <math|\<Gamma\><rsub|<bss>>> are given by
  <math|<around*|{|\<ell\><rsub|<bp>><around|(|<sphi><rsub|<bss>><around|(|<bet>|)>|)>|}><rsub|<bp>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  respectively. Since the solution points between <math|<G>> and
  <math|<G><rsub|<bss>>> do not coincide, they will be mapped to common
  solution points in the mortars <math|<X><rsub|<bss>>> and then back to
  <math|<G>,<G><rsub|<bss>>> after computing the common numerical flux. The
  solution points in <math|<X><rsub|<bss>>> are actually given by
  <math|<around*|{|<sphi><rsub|<bss>><rsup|-1><around|(|<bet><rsub|<bp>>|)>|}><rsub|<bp>\<in\>N<rsub|1><rsup|d-1>>>,
  i.e., they are the same as <math|<G><rsub|<bss>>>. The quantities with
  subscripts <math|<X><rsub|<bss>><rsup|->,<X><rsub|<bss>><rsup|+>> will
  denote trace values from larger, smaller elements respectively.

  <subsubsection|Prolongation to mortars><label|sec:curved.el2mortar>

  We will explain the prolongation procedure for a quantity <math|<F>> which
  could be the normal flux <math|<tF><rsup|\<delta\>>\<cdot\><bnr><rsub|S,i>>,
  time average solution <math|<uU><rsub|S,i>> or the solution
  <math|<uu><rsub|S,i>>. The first step of MEM of mapping of solution point
  values from solution points at element interfaces
  <math|<G>,<G><rsub|<bss>>> to solution points at mortars
  <math|<X><rsub|<bss>><rsup|->,<X><rsub|<bss>><rsup|+>> is known as
  prolongation. The prolongation of <math|<around|{|<F><rsup|\<delta\>><rsub|<G><rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  from small elements <math|<G><rsub|<bss>>> to mortar values
  <math|<around|{|<F><rsub|<X><rsub|<bss>><rsup|+>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  is the identity map since both have the same solution points, and the
  prolongation of <math|<F><rsub|<G>><rsup|\<delta\>>> from the large
  interface <math|<G>> to the <math|<around|{|<F><rsub|\<Xi\><rsub|<bss>>><rsup|->|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  is an interpolation to the mortar solution points. Accuracy is maintained
  by the interpolation as the mortar elements are finer. Below, we explain
  the matrix operations used to perform the interpolation.

  The prolongation of <math|<around|{|<F><rsup|\<delta\>><rsub|<G><rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  to the mortar values <math|<around|{|<F><rsub|<X><rsub|<bss>><rsup|+>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  is the identity map. The <math|<around|{|<F><rsub|\<Xi\><rsub|<bss>>><rsup|->|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  in Lagrange basis are given by

  <\equation>
    <F><rsub|\<Xi\><rsub|<bss>><rsup|->><around|(|<bet>|)>=<big|sum><rsub|<bp>\<in\>\<bbb-N\><rsub|N><rsup|d-1>>\<ell\><rsub|<bp>><around|(|<sphi><rsub|<bss>><around|(|<bet>|)>|)><F><rsub|<X><rsub|<bss>><rsup|->,<bp>>,<space|2em><bet>\<in\><big|prod><rsub|i=1><rsup|d-1>I<rsub|s<rsub|i>><label|eq:curved.uXidefn>
  </equation>

  The coefficients <math|<around|{|<F><rsub|<X><rsub|<bss>>,<bp>><rsup|->|}><rsub|<bp>\<in\>\<bbb-N\><rsub|N><rsup|d-1>>>
  are computed by interpolation

  <\equation>
    <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|<F><rsub|<X><rsub|<bss>><rsup|->,<bp>>=<F><rsub|<G><rsup|->><around|(|<sphi><rsub|<bss>><rsup|-1><around|(|<bet><rsub|<bp>>|)>|)>>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d-1>>\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><rsup|-1><around|(|<bet><rsub|<bp>>|)>|)><F><rsub|<G>><rsup|\<delta\>><around|(|<bet><rsub|<bq>>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d-1>><around*|(|<big|prod><rsub|i=1><rsup|d-1>\<ell\><rsub|q<rsub|i>><around|(|<sphi><rsub|s<rsub|i>><rsup|-1><around|(|<bet><rsub|p<rsub|i>>|)>|)>|)><F><rsub|<G>><rsup|\<delta\>><around|(|<bet><rsub|<bq>>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d-1>><around*|(|<big|prod><rsub|i=1><rsup|d-1><around|(|<Vi><rsub|s<rsub|i>>|)><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>|)><F><rsub|<G>><rsup|\<delta\>><around|(|<bet><rsub|<bq>>|)>>>>>><label|eq:curved.final.int.identity.fxi>
  </equation>

  where the interpolation operators <math|<around*|{|<Vi><rsub|<X><rsub|s>>|}><rsub|s=0,1>>
  were defined in<nbsp><eqref|eq:curved.subint.op>. Using the product of
  operators notation<nbsp><eqref|eq:curved.product.of.operators>, we can
  compactly write<nbsp><eqref|eq:curved.final.int.identity.fxi> as

  <\equation>
    <F><rsub|<X><rsub|<bss>><rsup|->>=<around*|(|<big|prod><rsub|i=1><rsup|d-1><Vi><rsub|s<rsub|i>>|)><F><rsub|<G>><rsup|\<delta\>><label|eq:curved.compact.prolongation>
  </equation>

  The same procedure is performed for obtaining
  <math|<uU><rsub|<X><rsub|<bss>><rsup|\<pm\>>>,<uu><rsub|<X><rsub|<bss>><rsup|\<pm\>>>>.
  The numerical fluxes <math|<around*|{|<F><rsub|<X><rsub|<bss>>><rsup|\<ast\>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  are then computed as in<nbsp><eqref|eq:curved.rusanov.flux.lw>.

  <subsubsection|Projection of numerical fluxes from mortars to
  faces><label|sec:curved.proj.face>

  In this section, we use the notation <math|<F><rsup|\<ast\>>\<assign\><around|(|<tF><rsub|e>\<cdot\><bnr><rsub|S,i>|)><rsup|\<ast\>>>
  to denote the numerical flux<nbsp><eqref|eq:curved.rusanov.flux.lw>. In the
  second step of MEM, the numerical fluxes
  <math|<around|{|<F><rsup|\<ast\>><rsub|<X><rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  computed using values at <math|<around|{|\<Xi\><rsup|\<pm\>><rsub|<bss>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  are mapped back to interfaces <math|<G><rsub|<bss>>,<G>>. Since the
  solution points on <math|<G><rsub|<bss>>> are the same as those of
  <math|\<Xi\><rsup|\<pm\>><rsub|<bss>>>, the mapping from
  <math|<around|{|<F><rsup|\<ast\>><rsub|<X><rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  to <math|<around|{|<F><rsup|\<ast\>><rsub|<G><rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  is the identity map. In order to maintain the conservation property, an
  <math|L<rsup|2>> projection is performed to map all the fluxes
  <math|<around|{|<F><rsup|\<ast\>><rsub|<X><rsub|<bss>>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  into one numerical flux <math|<F><rsub|<G>><rsup|\<ast\>>> on the larger
  interface.

  An <math|L<rsup|2>> projection of these fluxes to
  <math|<F><rsub|<G>><rsup|\<ast\>>> on <math|<G>> is performed as

  <\equation>
    <big|sum><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>><value|qqint><rsub|<G><rsub|<bss>>><F><rsub|<X><rsub|<bss>>><rsup|\<ast\>>*\<ell\><rsub|<bp>>=<value|qqint><rsub|<G>><F><rsub|<G>><rsup|\<ast\>>\<ell\><rsub|<bp>>,<space|2em>\<forall\><bp>\<in\>\<bbb-N\><rsub|N><rsup|d-1><label|eq:curved.proj.mortar.int.id>
  </equation>

  where integrals are computed with quadrature at solution points. As
  in<nbsp><eqref|eq:curved.uXidefn>, we write the mortar fluxes as

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<F><rsub|\<Xi\><rsub|<bss>>><rsup|\<ast\>><around|(|<bet>|)>>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><around|(|<bet>|)>|)><F><rsub|<X><rsub|<bss>>,<bq>><rsup|\<ast\>>,<space|2em><bet>\<in\><X><rsub|<bss>>>>|<row|<cell|<F><rsub|<G>><rsup|\<ast\>><around|(|<bet>|)>>|<cell|=>|<cell|<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>\<ell\><rsub|<bq>><around|(|<bet>|)><F><rsup|\<ast\>><rsub|<G>,<bq>>,<space|2em><bet>\<in\><G>>>>>>
  </equation*>

  Thus, the integral identity<nbsp><eqref|eq:curved.proj.mortar.int.id> can
  be written as

  <\equation>
    <big|sum><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>><big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d-1>><value|qqint><rsub|<G><rsub|<bss>>>\<ell\><rsub|<bp>><around|(|<bet>|)>*\<ell\><rsub|<bq>><around|(|<sphi><rsub|<bss>><around|(|<bet>|)>|)><F><rsub|<X><rsub|<bss>>,<bq>><rsup|\<ast\>>=<big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|<bp>><rsup|d-1>><value|qqint><rsub|<G>>\<ell\><rsub|<bp>><around|(|<bet>|)>*\<ell\><rsub|<bq>><around|(|<bet>|)><F><rsup|\<ast\>><rsub|<G>,<bq>>,<space|1em>\<forall\><bp>\<in\>\<bbb-N\><rsub|N><rsup|d-1><label|eq:curved.projection.integral.equation>
  </equation>

  Using the identities<nbsp><eqref|eq:curved.projection.integral.equation>,
  the equations<nbsp><eqref|eq:curved.projection.integral.equation> become

  <\equation*>
    <big|sum><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>><big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d-1>><around*|(|<big|prod><rsub|i=1><rsup|d-1>w<rsub|p<rsub|i>>*\<cal-P\><rsup|s<rsub|i>><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>|)><F><rsub|<X><rsub|<bss>>,<bq>><rsup|\<ast\>>J<rsub|e,<bp>><rsup|S>=w<rsub|<bp>>*<F><rsup|\<ast\>><rsub|<G>,<bp>>*J<rsub|e,<bp>><rsup|S>
  </equation*>

  where <math|J<rsub|e,<bp>><rsup|S>> is the surface Jacobian, given by
  <math|<around|\|||\|><around|(|J*<ba><rsup|1>|)><rsub|e,<bp>><around|\|||\|>>
  in this case ((6.29) of<nbsp><cite|kopriva2009>). Then, dividing both sides
  by <math|J<rsub|e,<bp>><rsup|S>*w<rsub|<bp>>> gives

  <\equation>
    <F><rsup|\<ast\>><rsub|<G>,<bp>>=<big|sum><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>><big|sum><rsub|<bq>\<in\>\<bbb-N\><rsub|N><rsup|d-1>><around*|(|<big|prod><rsub|i=1><rsup|d-1>\<cal-P\><rsup|s<rsub|i>><rsub|p<rsub|i>\<nocomma\>q<rsub|i>>|)>*<F><rsub|<X><rsub|<bss>>,<bq>><rsup|\<ast\>>=<big|sum><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>><around*|(|<big|prod><rsub|i=1><rsup|d-1>\<cal-P\><rsup|s<rsub|i>>|)>*<F><rsub|\<Xi\><rsub|<bss>>><rsup|\<ast\>>
  </equation>

  where the last identity is obtained by the product of operators
  notation<nbsp><eqref|eq:curved.product.of.operators>. Note that the
  identity<nbsp><eqref|eq:curved.proj.mortar.int.id> implies

  <\equation*>
    <big|sum><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>><value|qqint><rsub|<G><rsub|<bss>>><F><rsub|<X><rsub|<bss>>><rsup|\<ast\>>*v=<value|qqint><rsub|<G>><F><rsub|<G>><rsup|\<ast\>>*v,<space|2em>v\<in\><polyP><rsub|N>
  </equation*>

  Then, taking <math|v=1> shows that the total fluxes over an interface
  <math|\<Gamma\>> are the same as over <math|<around|{|\<Gamma\><rsub|<bss>>|}><rsub|<bss>\<in\>\<bbb-N\><rsub|1><rsup|d-1>>>
  and thus the conservation property<nbsp><eqref|eq:curved.conservation.lw>
  of LWFR is maintained by the LWFR scheme.

  <\remark>
    <dueto|Freestream and admissibility preservation under
    AMR><label|rmk:amr.metric.terms>Under the adaptively refined meshes, free
    stream preservation and provable admissibility preservation are
    respectively ensured.

    <\enumerate>
      <item>When refining/coarsening, there are two ways to compute the
      metric terms - interpolate/project the metric terms directly or
      interpolate/project the reference map <math|\<Theta\>> at solution
      points and use the newly obtained reference map to recompute the metric
      terms. The latter, which is the approach taken in this work, can lead
      to violation of free stream preservation as we can have
      <math|<around|(|<II>|)><rsub|e<rsub|L>><around|(|J*<ba><rsup|i>|)>\<neq\><around|(|<II>|)><rsub|e<rsub|R>><around|(|J*<ba><rsup|i>|)>>
      where <math|\<Omega\><rsub|e<rsub|L>>> and
      <math|\<Omega\><rsub|e<rsub|S>>> are two neighbouring large and small
      elements respectively. Thus, the interface terms may not vanish in the
      update equation<nbsp><eqref|eq:curved.lwfr.update.curvilinear> with
      constant <math|<uu><rsup|n>> leading to a violation of free stream
      preservation. This issue only occurs in 3-D and is thus beyond the
      scope of this work, but some remedies are to interpolate/project the
      metric terms when refining/coarsening or to use the reference map
      <math|\<Theta\>\<in\><polyP><rsub|N/2>>, as explained
      in<nbsp><cite|Kopriva2019>. Another solution has been studied
      in<nbsp><cite|Kozdon2018> where a common finite element space with
      mixed degree <math|N-1> and <math|N> is used with continuity at the
      non-conformal interfaces. Since this work only deals with problems in
      2-D, we always have<math|<around|(|<II>|)><rsub|e<rsub|L>><around|(|J*<ba><rsup|i>|)>=<around|(|<II>|)><rsub|e<rsub|R>><around|(|J*<ba><rsup|i>|)>>
      ensuring that the interface terms in<nbsp><eqref|eq:curved.lwfr.update.curvilinear>
      vanish when <math|<uu>=<bc>>. Further, since the metric terms are
      recomputed in this work, the volume terms will vanish by the same
      arguments as in<nbsp>Section<nbsp><reference|sec:curved.free.stream.lwfr>.
      Thus, free stream preservation is maintained even with the
      non-conformal, adaptively refined meshes.

      <item>The flux limiting explained in
      Section<nbsp><reference|sec:curved.flux.correction> ensures
      admissibility in means (Definition<nbsp><reference|defn:mean.pres>) and
      then uses the scaling limiter of<nbsp><cite|Zhang2010b> to enforce
      admissibility of solution polynomial at all solution points to obtain
      an admissibility preserving scheme (Definition<nbsp><reference|defn:adm.pres>).
      However, the procedure doesn't ensure that the polynomial is admissible
      at points which are not the solution points. Adaptive mesh refinement
      introduces such points into the numerical method and can thus cause a
      failure of admissibility preservation in the following situations: (a)
      mortar solution values <math|<around|{|<uu><rsub|<X><rsub|<bss>>><rsup|->|}>>
      obtained by interpolation as in<nbsp><eqref|eq:curved.uXidefn> are not
      admissible, (b) mean values <math|<around|{|<wide|<uu>|\<bar\>><rsub|e<rsub|<bss>>>|}>>
      of the solution values <math|<around|{|<uu><rsub|e<rsub|<bss>>>|}>>
      obtained by interpolating from the larger element as
      in<nbsp><eqref|eq:curved.interpolation.ue> are not admissible. Since
      the scaling limiter<nbsp><cite|Zhang2010b> can be used to enforce
      admissibility of solution at any desired points, the remedy to both the
      issues is further scaling; we simply perform scaling of solution point
      values <math|<around|{|<uu><rsub|<X><rsub|<bss>>><rsup|->|}>,<around|{|<uu><rsub|e<rsub|<bss>>>|}>>
      with the admissible mean value <math|<wide|<uu>|\<bar\>><rsub|e>>. This
      will ensure that the mortar solution point values and the mean values
      <math|<around|{|<uu><rsub|e<rsub|<bss>>>|}>> are admissible.
    </enumerate>
  </remark>

  <subsection|AMR indicators><label|sec:curved.amr.indicator>

  The process of adaptively refining and coarsening the mesh requires a local
  solution smoothness indicator. In this work, two smoothness indicators have
  been used for adaptive mesh refinement. The first is the indicator
  of<nbsp><cite|hennemann2021>, explained in
  Section<nbsp><reference|sec:curved.smooth.ind>. The second is Löhner's
  smoothness indicator<nbsp><cite|lohner1987> which uses the central finite
  difference formula for second derivative, which is given by

  <\equation>
    <tabular*|<tformat|<table|<row|<cell|\<alpha\><rsub|e>=max<rsub|<bp>\<in\><Nnd>>
    max<rsub|1\<leq\>i\<leq\>d> <frac|<around*|\||q<around|(|<uu><rsub|<bp><rsub|i+>>|)>-2*q<around|(|<uu><rsub|<bp>>|)>+q<around|(|<uu><rsub|<bp><rsub|i->>|)>|\|>|Normalizer<around*|(|i,<bp>|)>>,>>|<row|<cell|Normalizer<around*|(|i,<bp>|)>=
    <around*|(|<tabular*|<tformat|<table|<row|<cell|<around*|\||q<around|(|<uu><rsub|<bp><rsub|i+>>|)>-q<around|(|<uu><rsub|<bp>>|)>|\|>+<around*|\||q<around|(|<uu><rsub|<bp>>|)>-q<around|(|<uu><rsub|<bp><rsub|i->>|)>|\|>>>|<row|<cell|+f<rsub|wave>*<around|(|<around*|\||q<around|(|<uu><rsub|<bp><rsub|i+>>|)>|\|>+2<around*|\||q<around|(|<uu><rsub|<bp>>|)>|\|>+<around*|\||q<around|(|<uu><rsub|<bp><rsub|i->>|)>|\|>|)>>>>>>|)>>>|<row|<cell|<around|(|<bp><rsub|i\<pm\>>|)><rsub|m>=<choice|<tformat|<table|<row|<cell|p<rsub|m>,<space|1em>>|<cell|m\<neq\>i>>|<row|<cell|p<rsub|i\<pm\>1>,>|<cell|m=i>>>>>>>>>><label|eq:curved.lohner.ind>
  </equation>

  where <math|<around*|{|<uu><rsub|<bp>>|}><rsub|<bp>\<in\><Nnd>>> are the
  degrees of freedom in element <math|\<Omega\><rsub|e>> and <math|q> is a
  derived quantity like the product of density and pressure used in
  Section<nbsp><reference|sec:curved.smooth.ind>. The value
  <math|f<rsub|wave>=0.2> has been chosen in all the tests.

  Once a smoothness indicator is chosen, the three level controller
  implemented in <verbatim|Trixi.jl><nbsp><cite|Ranocha2021> is used to
  determine the local refinement level. The mesh begins with an initial
  refinement level and the effective refinement level is prescribed by how
  much further refinement has been done to the initial mesh, The mesh is
  created with two thresholds <verbatim|med_threshold> and
  <verbatim|max_threshold> and three refinement levels <verbatim|base_level>,
  <verbatim|med_level> and <verbatim|max_level>. Then, we have

  <\equation*>
    <verbatim|level><rsub|e>=<choice|<tformat|<table|<row|<cell|<verbatim|base_level>,<space|2em>>|<cell|\<alpha\><rsub|e>\<le\><verbatim|med_threshold>>>|<row|<cell|<verbatim|med_level>,<space|2em>>|<cell|<verbatim|med_threshold>\<le\>\<alpha\><rsub|e>\<le\><verbatim|max_threshold>>>|<row|<cell|<verbatim|max_level>,<space|2em>>|<cell|<verbatim|max_threshold>\<le\>\<alpha\><rsub|e>>>>>>
  </equation*>

  Beyond these refinement levels, further refinement is performed to make
  sure that two neighbouring elements only differ by a refinement level of 1.

  <section|Time stepping><label|sec:curved.time.stepping>

  This section introduces an embedded error approximation method to compute
  the time step size <math|\<Delta\>t> for the single stage Lax-Wendroff Flux
  Reconstruction method. A standard way to compute the time step size
  <math|\<Delta\>t<rsup|n>> is to use<nbsp><cite|babbar2022|babbar2023admissibility>

  <\equation>
    \<Delta\>t<rsub|n>=C<rsub|s>*min<rsub|e,<bp>>
    <frac|<around|\||J<rsub|e,<bp>>|\|>|\<sigma\><around|(|<uebp><rsup|n>|)>>*CFL<around|(|N|)><label|eq:curved.cfl.formula>
  </equation>

  where the minimum is taken over all elements
  <math|<around|{|\<Omega\><rsub|e>|}><rsub|e>>, <math|J<rsub|e>> is the
  Jacobian of the change of variable map,
  <math|\<sigma\><around|(|<uu><rsup|n><rsub|e>|)>> is the largest eigenvalue
  of the flux jacobian at state <math|<uu><rsub|e><rsup|n>>, approximating
  the local wave speed, <math|CFL<around|(|N|)>> is the optimal CFL number
  dependent on solution polynomial degree <math|N> and
  <math|C<rsub|s>\<leq\>1> is a safety factor. In<nbsp><cite|babbar2022>, a
  Fourier stability analysis of the LWFR scheme was performed on Cartesian
  grids, and the optimal <math|CFL> numbers were obtained for each degree
  <math|N> which guaranteed the stability of the scheme. However, the Fourier
  stability analysis does not apply to curvilinear grids and
  formula<nbsp><eqref|eq:curved.cfl.formula> need not guarantee
  <math|L<rsup|2>> stability which may require the CFL number to be
  fine-tuned for each problem. Along with the <math|L<rsup|2>> stability, the
  time step has to be chosen so that the scheme does not give inadmissible
  solutions. An error-based time stepping method inherently minimizes the
  parameter tuning process in time step computation. The parameters in an
  error-based time stepping scheme that a user has to specify are the
  absolute and relative error tolerances <math|\<tau\><rsub|a>,\<tau\><rsub|r>>,
  and they only affect the time step size logarithmically. In particular,
  because of the weak dependence, tolerances
  <math|\<tau\><rsub|a>=\<tau\><rsub|r>=10<rsup|-6>> worked reasonably for
  all tests with shocks; although, it was possible to enhance performance by
  choosing larger tolerances for some problems. Secondly, if inadmissibility
  is detected during any step in the scheme or if errors are too large, the
  time step is redone with a reduced time step size provided by the error
  estimate. The scheme also has the capability of increasing and decreasing
  the time step size.

  We begin by reviewing the error-based time stepping scheme for the
  Runge-Kutta ODE solvers from<nbsp><cite|Ranocha2021|ranocha2023> in
  Section<nbsp><reference|sec:curved.rk.error.section> and explain our
  extension of the same to LWFR in Section<nbsp><reference|sec:curved.error.lw>.

  <subsection|Error estimation for Runge-Kutta
  schemes><label|sec:curved.rk.error.section>

  Consider an explicit Runge-Kutta method used for solving ordinary
  differential equations by evolving the numerical solution from time level
  <math|n> to <math|n+1>. For error-estimation, the method is constructed to
  have an embedded lower order update <math|<wide|<uu>|^><rsup|n+1>>, as
  described in equation<nbsp>(3) of<nbsp><cite|Ranocha2021>. The difference
  in the two updates, <math|<uu><rsup|n+1>-<wide|<uu>|^><rsup|n+1>>, gives an
  indication of the time integration error, which is used to build a
  Proportional Integral Derivative (PID) controller to compute the new time
  step size,

  <\equation>
    <wide|\<Delta\>t|~><rsub|n+1>=\<kappa\><around|(|\<varepsilon\><rsub|n+1><rsup|\<beta\><rsub|1>/k>*\<varepsilon\><rsub|n><rsup|\<beta\><rsub|2>/k>*\<varepsilon\><rsub|n-1><rsup|\<beta\><rsub|3>/k>|)>*\<Delta\>t<rsub|n><label|eq:curved.dtnp1.formula>
  </equation>

  where for <math|q> being the order of main method, <math|<wide|q|^>> being
  the order of embedded method, we have

  <\equation*>
    k=min <around|(|q,<wide|q|^>|)>+1
  </equation*>

  and <math|\<beta\><rsub|i>> are called control parameters which are
  optimized for the particular Runge-Kutta scheme<nbsp><cite|Ranocha2021>.
  With <math|M> being the number of degrees of freedom in <math|<uu>>, we
  pick absolute and relative tolerances <math|\<tau\><rsub|a>,\<tau\><rsub|r>>
  and then error approximation is made as

  <\equation>
    \<varepsilon\><rsub|n+1>=<frac|1|w<rsub|n+1>>,<space|2em>w<rsub|n+1>=<around*|(|<frac|1|M>*<big|sum><rsub|i=1><rsup|M><around*|(|<frac|<uu><rsub|i><rsup|n+1>-<wide|<uu>|^><rsub|i><rsup|n+1>|\<tau\><rsub|a>+\<tau\><rsub|r>*max
    <around*|{|<around*|\||<uu><rsub|i><rsup|n+1>|\|>,<around*|\||<nou>|\|>|}>>|)><rsup|2>|)><rsup|<frac|1|2>><label|eq:curved.error.estimator>
  </equation>

  where the sum is over all degrees of freedom, including solution points and
  conservation variables. The tolerances are to be chosen by the user but
  their influence on the scheme is logarithmic, unlike the CFL based
  scheme<nbsp><eqref|eq:curved.cfl.formula>.

  The limiting function <math|\<kappa\><around|(|x|)>=1+tan<rsup|-1><around|(|x-1|)>>
  is used to prevent sudden increase in time step sizes. For normalization,
  <verbatim|PETSc> uses <math|<nou>=<wide|<uu>|^><rsup|n+1>> while
  <verbatim|OrdinaryDiffEq.jl> uses <math|<nou>=<uu><rsup|n>>.
  Following<nbsp><cite|Ranocha2021>, if the time step factor
  <math|<wide|\<Delta\>t|~><rsup|n+1>/\<Delta\>t<rsup|n>\<geq\>0.9<rsup|2>>,
  the new time step is accepted and used in the next level as
  <math|\<Delta\>t<rsup|n+1>=<wide|\<Delta\>t|~><rsup|n+1>>. If not, or if
  admissibility is violated, evolution is redone with time step size
  <math|\<Delta\>t<rsup|n>=<wide|\<Delta\>t|~><rsup|n+1>> computed
  from<nbsp><eqref|eq:curved.dtnp1.formula>.

  <subsection|Error based time stepping for Lax-Wendroff flux
  reconstruction><label|sec:curved.error.lw>

  Consider the LWFR scheme<nbsp><eqref|eq:curved.lwfr.update.curvilinear>
  with polynomial degree <math|N> and formal order of accuracy <math|N+1>

  <\equation*>
    <uebp><rsup|n+1>=<uebp><rsup|n>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tF><rsup|\<delta\>><rsub|e><around|(|<vxi><rsub|<bp>>|)>-<C><rsub|e,<bp>>
  </equation*>

  where <math|<C><rsub|e,<bp>>> contains contributions at element interfaces.
  In order to construct a lower order embedded scheme without requiring
  additional inter-element communication, consider an evolution where the
  interface correction terms <math|<C><rsub|e,<bp>>> are not used, i.e.,
  consider the element local update

  <\equation>
    <uu><rsup|n+1><rsub|loc,e,<bp>>=<uu><rsup|n><rsub|e,<bp>>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><tF><rsup|\<delta\>><rsub|e><around|(|<vxi><rsub|<bp>>|)><label|eq:curved.uloc.high>
  </equation>

  Truncating the locally computed time averaged flux
  <math|<tF><rsup|\<delta\>><rsub|e>><nbsp><eqref|eq:curved.time.averaged.flux>
  at one order lower

  <\equation>
    <wide|<F><rsup|\<delta\>><rsub|e>|^>=<big|sum><rsub|k=0><rsup|N-1><frac|\<Delta\>t<rsup|k>|<around|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>*<tf><rsub|e><rsup|\<delta\>><label|eq:curved.Fdelta.low>
  </equation>

  we can consider another update

  <\equation>
    <wide|<uu><rsup|n+1><rsub|loc,e,<bp>>|^>=<value|uebp><rsup|n>-<frac|\<Delta\>t|J<rsub|e,<bp>>>*\<nabla\><rsub|<vxi>>\<cdot\><wide|<F><rsup|\<delta\>><rsub|e>|^><around|(|<vxi><rsub|<bp>>|)><label|eq:curved.unp1.low>
  </equation>

  which is also locally computed but is one order of accuracy lower. We thus
  use <math|<uu><rsup|n+1><rsub|e>=<uu><rsup|n+1><rsub|loc,e>> and
  <math|<wide|<uu>|^><rsup|n+1><rsub|e>=<wide|<uu><rsup|n+1><rsub|loc,e>|^>>
  in the formula<nbsp><eqref|eq:curved.error.estimator> along with
  <math|<nou>=<wide|<uu>|^><rsup|n+1>>; then we use the same procedure of
  redoing the time step sizes as in Section<nbsp><reference|sec:curved.rk.error.section>.
  That is, after using the error estimate<nbsp><eqref|eq:curved.error.estimator>
  to compute <math|<wide|\<Delta\>t|~><rsub|n+1>><nbsp><eqref|eq:curved.dtnp1.formula>
  we redo the time step if <math|<wide|\<Delta\>t|~><rsup|n+1>/\<Delta\>t<rsup|n>\<geq\>0.9<rsup|2>>
  or if admissibility is violated; otherwise we set
  <math|\<Delta\>t<rsup|n+1>> to be used at the next time level. The complete
  process is also detailed in Algorithm<nbsp><reference|alg:time.stepping>.
  In this work, we have used the control parameters
  <math|\<beta\><rsub|1>=0.6,\<beta\><rsub|2>=-0.2,\<beta\><rsub|3>=0.0> for
  all numerical results which are the same as those used
  in<nbsp><cite|Ranocha2021> for BS3(2)3<rsub|F>, the third-order, four-stage
  RK method of<nbsp><cite|Bogacki1989>. We tried the other control parameters
  from<nbsp><cite|Ranocha2021> but found the present choice to be either
  superior or only slightly different in performance, measured by the number
  of iterations taken to reach the final time.

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            Overview of LWFR element residual of order <math|N+1> & error
            approximation using <math|<uu><rsup|n+1><rsub|loc>,<wide|<uu><rsup|n+1><rsub|loc>|^>><label|alg:cell.residual>
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          \;

          <no-indent><with|font-series|bold|for> <math|e> in
          <verbatim|eachelement(mesh)> <with|font-series|bold|do>

          <algo-state|Compute <math|<around*|{|\<partial\><rsub|t><rsup|k>*<tf><rsub|e><rsup|\<delta\>>|}><rsub|k=0><rsup|N-1>>
          using approximate LW procedure<nbsp><eqref|eq:curved.ft.defn> to
          obtain <math|<wide|<F><rsup|\<delta\>><rsub|e>|^>><nbsp><eqref|eq:curved.Fdelta.low>>

          <algo-state|Compute <math|<wide|<uu><rsup|n+1><rsub|loc,e>|^>>
          using <math|<wide|<F><rsup|\<delta\>><rsub|e>|^>><nbsp><eqref|eq:curved.unp1.low>>

          <algo-state|Compute \ <math|\<partial\><rsub|t><rsup|N+1>*<tf><rsub|e><rsup|\<delta\>>>
          using approximate LW procedure<nbsp><eqref|eq:curved.ft.defn> to
          obtain <math|<tF><rsup|\<delta\>><rsub|e>><nbsp><eqref|eq:curved.time.averaged.flux>>

          <algo-state|Compute <math|<uu><rsup|n+1><rsub|loc,e>> using
          <math|<F><rsup|\<delta\>><rsub|e>> as
          in<nbsp><eqref|eq:curved.uloc.high>>

          <algo-state|<with|font-family|tt|temporal_error[e]=><math|<with|math-display|true|<big|sum><rsub|i><around*|(|<frac|<uu><rsup|n+1><rsub|loc,e,i>-<wide|<uu><rsup|n+1><rsub|loc,e,i>|^>|\<tau\><rsub|a>+\<tau\><rsub|r>*max
          <around*|{|<around*|\||<uu><rsup|n+1><rsub|loc,e,i>|\|>,<around*|\||<wide|<uu><rsup|n+1><rsub|loc,e,i>|^>|\|>|}>>|)><rsup|2>>>,
          sum is over dofs in <math|e>>

          <algo-state|Compute and add local contribution of
          <math|<F><rsup|\<delta\>><rsub|e>> to the
          residual<nbsp><eqref|eq:curved.lwfr.update.curvilinear>>

          <no-indent><with|font-series|bold|end>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            High level overview of LWFR residual (Within time integration)
            <label|alg:lw.residual>
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<table|<row|<\cell>
          \;

          <no-indent><algo-state|Compute <math|<around|{|\<alpha\><rsub|e>|}>>
          (Section<nbsp><reference|sec:curved.smooth.ind>)>

          <no-indent><algo-state|Assemble cell residual
          (Algorithm<nbsp><reference|alg:cell.residual>)>

          <no-indent><with|font-series|bold|for> <math|\<Gamma\>> in
          <verbatim|eachinterface(mesh)> <with|font-series|bold|do>

          <algo-state|Compute <math|<F><rsub|<G>><rsup|LW>,<pf><rsub|<G>>>
          and blend them into <math|<F><rsub|<G>>>
          (Algorithm<nbsp><reference|alg:blended.flux>)>

          <no-indent><with|font-series|bold|end>

          <no-indent><with|font-series|bold|for> <math|e> in
          <verbatim|eachelement(mesh)> <with|font-series|bold|do>

          <algo-state|Add contribution of numerical fluxes to residual of
          element <math|e> (Remark<nbsp><reference|rmk:why.same.flux>b)>

          <no-indent><with|font-series|bold|done>

          <no-indent><algo-state|Update solution>

          <no-indent><algo-state|Apply positivity limiter>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            <label|alg:time.stepping>Lax-Wendroff Flux Reconstruction at a
            high level to explain error based time stepping
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<\cell>
          <algo-state|Initialize <math|t\<leftarrow\>0>, time step number
          <math|n\<leftarrow\>0>, and initial state <math|<uu><rsup|0>>>

          <no-indent><algo-state|Initialize PID controller with
          <math|\<varepsilon\><rsub|0>\<leftarrow\>1,\<varepsilon\><rsub|-1>\<leftarrow\>1>>

          <no-indent><algo-state|Initialize
          <math|\<Delta\>t<rsub|0>=<wide|\<Delta\>t|~>> with a user supplied
          value>

          <no-indent><algo-state|Initialize <verbatim|accept_step>
          <math|\<leftarrow\>> <verbatim|false>>
        </cell>>|<row|<\cell>
          <with|font-series|bold|while> <math|t\<less\>T>
          <with|font-series|bold|do>

          <no-indent><with|color|white|<mid|lfloor>>
          <tabular|<tformat|<table|<row|<cell|<with|font-series|bold|if>
          <verbatim|accept_step> <with|font-series|bold|then>>>|<row|<cell|<space|1em><tabular|<tformat|<table|<row|<cell|<algo-state|<verbatim|accept_step>
          <math|\<leftarrow\>> <verbatim|false>>>>|<row|<cell|<algo-state|<math|t\<leftarrow\><wide|t|~>>>>>|<row|<cell|<algo-state|<math|\<Delta\>t<rsub|n+1>\<leftarrow\><wide|\<Delta\>t|~>>>>>|<row|<cell|<algo-state|<math|n\<leftarrow\>n+1>>>>>>>>>|<row|<cell|<with|font-series|bold|else>>>|<row|<cell|<space|1em><tabular|<tformat|<table|<row|<cell|<math|\<mathLaplace\>t<rsub|n>\<leftarrow\><wide|\<mathLaplace\>t|~>>>>>>>>>|<row|<cell|<with|font-series|bold|end>>>|<row|<cell|<algo-if-else-if|<math|t+\<Delta\>t<rsub|n>\<gtr\>><verbatim|final_time>|<space|1em><tabular|<tformat|<table|<row|<cell|<algo-state|<math|\<Delta\>t<rsub|n>>
          <math|\<leftarrow\>> <verbatim|final_time><math|-t>>>>>>>>>>|<row|<cell|<algo-state|<math|<uu><rsup|n><long-arrow|\<rubber-rightarrow\>|\<mathLaplace\>t<rsub|n>><uu><rsup|n+1>>
          (Algorithm<nbsp><reference|alg:lw.residual>,
          <reference|alg:cell.residual>) computing <verbatim|temporal_error>,
          checking admissibility>>>|<row|<cell|<algo-state|<math|w<rsub|n+1>\<leftarrow\><around*|(|<frac|1|M>*<big|sum><rsub|e><text|<verbatim|temporal_error[e]>>|)><rsup|<frac|1|2>>>
          ><space|1em><math|\<vartriangleright\>><space|0.2spc><math|M> is
          the total number of dofs>>|<row|<cell|<algo-state|<math|w<rsub|n+1>\<leftarrow\>max
          <around|{|w<rsub|n+1>,10<rsup|-10>|}>>><space|1em><math|\<vartriangleright\>><space|0.2spc>To
          avoid division by zero>>|<row|<cell|<algo-state|<math|\<varepsilon\><rsub|n+1>\<leftarrow\><frac|1|w<rsub|n+1>>>>>>|<row|<cell|<algo-state|<verbatim|dt_factor>
          <math|\<leftarrow\>> <math|\<kappa\>*<around|(|\<varepsilon\><rsub|n+1><rsup|\<beta\><rsub|1>/k>*\<varepsilon\><rsub|n><rsup|\<beta\><rsub|2>/k>*\<varepsilon\><rsub|n-1><rsup|\<beta\><rsub|3>/k>|)>>><space|1em><math|\<vartriangleright\>><space|0.2spc><math|\<kappa\><around|(|x|)>=1+tan<rsup|-1><around|(|x-1|)>>>>|<row|<cell|<algo-state|<math|<wide|\<Delta\>t|~>\<leftarrow\>><verbatim|dt_factor><math|\<cdot\>\<Delta\>t<rsub|n>>>>>|<row|<cell|<with|font-series|bold|if>
          <verbatim|dt_factor> <math|\<geq\>> <verbatim|accept_safety && no
          inadmissibility> <with|font-series|bold|then>>>|<row|<cell|<space|1em><tabular|<tformat|<table|<row|<cell|<algo-state|<verbatim|accept_step>
          <math|\<leftarrow\>> <verbatim|true>>>>>>>>>|<row|<cell|<with|font-series|bold|else>>>|<row|<cell|<space|1em><tabular|<tformat|<table|<row|<cell|<algo-state|<verbatim|accept_step>
          <math|\<leftarrow\>> <verbatim|false>>>>>>>>>|<row|<cell|<with|font-series|bold|end>>>|<row|<cell|<with|font-series|bold|if>
          <verbatim|accept_step> <with|font-series|bold|then>>>|<row|<cell|<space|1em><tabular|<tformat|<table|<row|<cell|<algo-state|<math|<wide|t|~>\<leftarrow\>t+\<Delta\>t<rsub|n>>>>>|<row|<cell|<space|1em><tabular|<tformat|<table|<row|<cell|<with|font-series|bold|if>
          <math|<wide|t|~>\<approx\>><verbatim|final_time>
          <with|font-series|bold|then>>>|<row|<cell|<space|1em><algo-state|<math|<wide|t|~>\<leftarrow\>><verbatim|final_time>>>>|<row|<cell|<with|font-series|bold|end
          if>>>>>>>>|<row|<cell|<algo-state|Apply callbacks
          <algo-comment|Analyze and postprocess solution,
          AMR>>>>|<row|<cell|<algo-state|Positivity correction for AMR
          (Remark<nbsp><reference|rmk:amr.metric.terms>)>>>>>>>>|<row|<cell|<with|font-series|bold|end
          if>>>>>>

          <no-indent><with|font-series|bold|end while>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  <section|Numerical results><label|sec:curved.numerical.results>

  The numerical experiments are performed on 2-D Euler's
  equations<nbsp><eqref|eq:2deuler>. Unless specified otherwise, the
  adiabatic constant <math|\<gamma\>> will be taken as <math|1.4> in the
  numerical tests, which is the typical value for air. The CFL based time
  stepping schemes use the following formula for the time step (see 2.5
  of<nbsp><cite|ranocha2023>, but also<nbsp><cite|Rasha2021|Ranocha2021>)

  <\equation>
    \<Delta\>t<rsub|n>=<frac|2|N+1>*<Cs>*min<rsub|e,<bp>><around*|(|<frac|1|<around*|\||J<rsub|e,<bp>>|\|>>*<big|sum><rsub|i=1><rsup|d><wide|\<lambda\>|~><rsub|e,<bp>><rsup|i>|)>,<space|2em><Cs>\<leq\>1<label|eq:curved.cfl.time.step>
  </equation>

  where <math|<around|{|<wide|\<lambda\>|~><rsub|e,<bp>><rsup|i>|}><rsub|i<subindex>1><rsup|d>>
  are wave speed estimates computed by the transformation

  <\equation*>
    <wide|\<lambda\>|~><rsub|e,<bp>><rsup|i>=<big|sum><rsub|n=1><rsup|d><around|(|J*a<rsup|i><rsub|n>|)><rsub|e,<bp>>*\<lambda\><rsub|e,<bp>><rsup|i>
  </equation*>

  where <math|<around|{|J*<ba><rsup|i>|}><rsub|i<subindex>1><rsup|d>> are the
  contravariant vectors<nbsp><eqref|defn:curved.contravariant.basis> and
  <math|\<lambda\><rsub|e,<bp>><rsup|i>> is the absolute maximum eigenvalue
  of <math|<pf><rprime|'><rsub|i><around|(|<uu><rsub|e,<bp>>|)>>. For Euler's
  equations with velocity vector <math|<bv>=<around|{|v<rsub|i>|}>> and sound
  speed <math|c>, <math|\<lambda\><rsup|i>=<around|\||v<rsub|i>|\|>+c>. The
  <math|<Cs>> in<nbsp><eqref|eq:curved.cfl.time.step> may need to be
  fine-tuned depending on the problem. Other than the convergence
  test<nbsp>(Section<nbsp><reference|sec:curved.isentropic>), the results
  shown below have been generated with error-based time
  stepping<nbsp>(Section<nbsp><reference|sec:curved.error.lw>). The scheme is
  implemented in a Julia package <hlink|<with|font-family|tt|TrixiLW.jl>|https://github.com/Arpit-Babbar/TrixiLW.jl>
  written using <with|font-family|tt|Trixi.jl><nbsp><cite|Ranocha2022|schlottkelakemper2021purely|schlottkelakemper2020trixi>
  as a library. <with|font-family|tt|Trixi.jl> is a high order PDE solver
  package in <with|font-family|tt|Julia><nbsp><cite|Bezanson2017> and uses
  the Runge-Kutta Discontinuous Galerkin method;
  <with|font-family|tt|TrixiLW.jl> uses <with|font-family|tt|Julia>'s
  multiple dispatch to borrow features like curved meshes support and
  postprocessing from <with|font-family|tt|Trixi.jl>.
  <with|font-family|tt|TrixiLW.jl> is not a fork of
  <with|font-family|tt|Trixi.jl> but only uses it through
  <with|font-family|tt|Julia>'s package manager without modifying its
  internal code. The setup files for the numerical experiments in this work
  are available at<nbsp><cite|curvedrepo>. The animations of the results
  presented in this chapter can be viewed at

  <\padded-center>
    <hlink|www.youtube.com/playlist?list=PLHg8S7nd3rfvI1Uzc3FDaTFtQo5VBUZER|https://www.youtube.com/playlist?list=PLHg8S7nd3rfvI1Uzc3FDaTFtQo5VBUZER>
  </padded-center>

  <subsection|Results on Cartesian grids>

  <subsubsection|Mach 2000 astrophysical jet>

  The test is as described in Section<nbsp><reference|sec:m2000>. The
  simulation is performed on a uniform <math|512<rsup|2>> element mesh. This
  test requires admissibility preservation to be enforced to avoid solutions
  with negative pressure. This is a cold-start problem as the solution is
  constant with zero velocity in the domain at time <math|t=0>. However,
  there is a high speed inflow at the boundary, which the standard wave speed
  estimate for time step approximation<nbsp><eqref|eq:curved.cfl.effective>
  does not account for. Thus, in order to use the CFL based time stepping,
  lower values of <math|<Cs>><nbsp><eqref|eq:curved.cfl.time.step> have to be
  used in the first few iterations of the simulations. Once the high speed
  flow has entered the domain, this value needs to be raised since otherwise,
  the simulation will use much smaller time steps than the linear stability
  limit permits. In Section<nbsp><reference|sec:m2000>, this was handled by
  including the inflow wave speed for computation of time step. Error based
  time stepping schemes automate this process by their adaptivity and ability
  to redo the time steps. The simulation is run till <math|t=10<rsup|-2>> and
  the log scaled density plot for degree <math|N=4> solution obtained on the
  uniform mesh is shown in Figure<nbsp><reference|fig:curved.m2000>a. For an
  error-based time stepping scheme, we define the effective <math|<Cs>> as

  <\equation>
    <Cs>\<assign\>\<Delta\>t<rsub|n>*<around*|[|<frac|2|N+1>*min<rsub|e,<bp>><around*|(|<frac|1|<around*|\||J<rsub|e,<bp>>|\|>>*<big|sum><rsub|i=1><rsup|d><wide|\<lambda\>|~><rsub|e,<bp>><rsup|i>|)>|]><rsup|-1><label|eq:curved.cfl.effective>
  </equation>

  which is a reverse computation so that its usage
  in<nbsp><eqref|eq:curved.cfl.formula> will get <math|\<Delta\>t<rsub|n>>
  chosen in the error-based time stepping
  scheme<nbsp>(Algorithm<nbsp><reference|alg:time.stepping>). In
  Figure<nbsp><reference|fig:curved.m2000>b, time <math|t> versus effective
  <math|<Cs>><nbsp><eqref|eq:curved.cfl.effective> is plotted upto
  <math|t=10<rsup|-5>> to demonstrate that the scheme automatically uses a
  smaller <math|<Cs>> of <math|\<sim\>10<rsup|-3>> at the beginning which
  later increases and stabilizes at <math|\<sim\>10<rsup|-1>>. Thus, the
  error based time stepping is automatically doing what would have to be
  manually implemented for a CFL based time stepping scheme which would be
  problem-dependent and requiring smart user intervention.

  <big-figure|<center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/euler2d/m2000_error_based/density.png|0.45par|||>>|<cell|<image|figures/paper3/euler2d/m2000_error_based/m2000_cfl|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>><label|fig:curved.m2000>|<caption-detailed|Mach
  2000 astrophysical jet (a) Density plot (b) Effective <math|<Cs>>|Mach 2000
  astrophysical jet with adaptive time stepping.>>

  <subsubsection|Kelvin-Helmholtz instability>

  This is a variant of the Kelvin-Helmholtz instability like in
  Section<nbsp><reference|sec:kh>. The initial condition is given
  by<nbsp><cite|ramirez2021>

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around*|(|<frac|1|2>+<frac|3|4>*B,<frac|1|2>*<around|(|B-1|)>,<frac|1|10>*sin
    <around|(|2*\<pi\>*x|)>,1|)>
  </equation*>

  with <math|B=tanh <around|(|15*y+7.5|)>-tanh <around|(|15*y-7.5|)>> in
  domain <math|\<Omega\>=<around|[|-1,1|]><rsup|2>> with periodic boundary
  conditions. The initial condition has a Mach number <math|M\<leq\>0.6>
  which makes compressibility effects relevant but does not cause shocks to
  develop. Thus, a very mild shock capturing scheme is used by setting
  <math|\<alpha\><rsub|e>=min <around|{|\<alpha\><rsub|e>,\<alpha\><rsub|max>|}>><nbsp>(Section<nbsp><reference|sec:curved.smooth.ind>)
  where <math|\<alpha\><rsub|max>=0.002>. The same smoothness indicator of
  Section<nbsp><reference|sec:curved.smooth.ind> is used for AMR indicator
  with parameters from Section<nbsp><reference|sec:curved.amr.indicator>
  chosen to be

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<around|(|<verbatim|base_level>,<verbatim|med_level>,<verbatim|max_level>|)>=<around|(|4,0,8|)>>>|<row|<cell|<around|(|<verbatim|med_threshold>,<verbatim|max_threshold>|)>=<around|(|0.0003,0.003|)>>>>>>
  </equation*>

  where <math|<verbatim|base_level>=0> refers to a <math|2\<times\>2> mesh.
  This test case, along with indicators' configuration was taken from the
  examples of <verbatim|Trixi.jl><nbsp><cite|Ranocha2021>. The simulation is
  run till <math|t=3> using polynomial degree <math|N=4>. There is a shear
  layer at <math|y=\<pm\>0.5> which rolls up and develops smaller scale
  structures as time progresses. The results are shown in
  Figure<nbsp><reference|fig:curved.kh> and it can be seen that the AMR
  indicator is able to track the small scale structures. The simulation
  starts with a mesh of <math|1024> elements which steadily increases to
  13957 at the final time; the mesh is adaptively refined or coarsened at
  every time step. The solution has non-trivial variations in small regions
  around the rolling structures which an adaptive mesh algorithm can capture
  efficiently, while a uniform mesh with similar resolution would require
  262144 elements.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/euler2d/kh/final_soln_low_res.png|0.46par|||>>|<cell|<image|figures/paper3/euler2d/kh/mesh.png|0.46par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:curved.kh>|<caption-detailed|Kelvin-Helmholtz
  instability at <math|t=3> using polynomial degree <math|N=4> (a) density
  plots, (b) adaptively refined mesh|Kelvin-Helmholtz instability, adaptive
  mesh and time stepping.>>

  <subsubsection|Double mach reflection><label|sec:curved.dmr>

  The description and significance of this test has been given in
  Section<nbsp><reference|sec:dmr>. The setup of Löhner's smoothness
  indicator<nbsp><eqref|eq:curved.lohner.ind> is taken from an example of
  <verbatim|Trixi.jl><nbsp><cite|Ranocha2021>

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<around|(|<verbatim|base_level>,<verbatim|med_level>,<verbatim|max_level>|)>=<around|(|0,3,6|)>>>|<row|<cell|<around|(|<verbatim|med_threshold>,<verbatim|max_threshold>|)>=<around|(|0.05,0.1|)>>>>>>
  </equation*>

  where <math|<verbatim|base_level>=0> corresponds to a <math|16\<times\>5>
  mesh. The density solution obtained using polynomial degree <math|N=4> is
  shown in Figure<nbsp><reference|fig:curved.dmr> where it is seen that AMR
  is tracing the shocks and small scale shearing well. The initial mesh
  consists of 80 elements and is refined in first iteration in the vicinity
  of the shock to get 2411 elements. In later iterations, the mesh is refined
  and coarsened in each iteration, and the number of elements keeps
  increasing up to 7793 elements at the final time <math|t=0.2>. In order to
  capture the same effective refinement, a uniform mesh will require 327680
  elements.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|l>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|2|2|1|1|cell-halign|l>|<cwith|4|4|1|1|cell-halign|l>|<table|<row|<cell|<image|figures/paper3/euler2d/dmr/soln.png|0.9par|||>>>|<row|<cell|<space|0.4tex-text-width><space|0.435par>(a)>>|<row|<cell|<image|figures/paper3/euler2d/dmr/mesh_low_res.png|0.87par|||>>>|<row|<cell|<space|0.4tex-text-width><space|0.435par>(b)>>>>><label|fig:curved.dmr>|<caption-detailed|Double
  Mach reflection with solution polynomial degree <math|N=4> at <math|t=0.2>
  (a) Density plot, (b) Adaptively refined mesh at final time|Double Mach
  reflection, adaptive mesh and time stepping.>>

  <subsubsection|Forward facing step><label|sec:curved.forward.step>

  The description and significance of this test has been given in
  Section<nbsp><reference|sec:ffs>. Here, we repeat the setup to make this
  chapter self-contained. The step is simulated in the domain
  <math|\<Omega\>=<around|(|<around|[|0,3|]>\<times\><around|[|0,1|]>|)>\<setminus\><around|(|<around|[|0.6,3|]>\<times\><around|[|0,0.2|]>|)>>
  and the initial conditions are taken to be

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around|(|1.4,3,0,1|)><space|2em><text|in
    >\<Omega\>
  </equation*>

  The left boundary condition is taken as an inflow and the right one is an
  outflow, while the rest are solid walls. The corner
  <math|<around|(|0.6,0.2|)>> of the step is the center of a rarefaction fan
  and can lead to large errors and the formation of a spurious boundary
  layer, as shown in Figure 7a-7d of<nbsp><cite|Woodward1984> and also in the
  results of Section<nbsp><reference|sec:ffs>. These errors can be reduced by
  refining the mesh near the corner, which is automated here with the AMR
  algorithm.

  The setup of Löhner's smoothness indicator<nbsp><eqref|eq:curved.lohner.ind>
  is taken from an example of <verbatim|Trixi.jl><nbsp><cite|Ranocha2021>

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<around|(|<verbatim|base_level>,<verbatim|med_level>,<verbatim|max_level>|)>=<around|(|0,2,5|)>>>|<row|<cell|<around|(|<verbatim|med_threshold>,<verbatim|max_threshold>|)>=<around|(|0.05,0.1|)>>>>>>
  </equation*>

  The density at <math|t=3> obtained using polynomial degree <math|N=4> and
  Löhner's smoothness indicator<nbsp><eqref|eq:curved.lohner.ind> is plotted
  in Figure<nbsp><reference|fig:curved.forward.step>. The shocks have been
  well-traced and resolved by AMR and the spurious boundary layer and Mach
  stem do not appear. The simulations starts with a mesh of 198 elements and
  the number peaks at 6700 elements during the simulation then and decreases
  to 6099 at the final time <math|t=3>. The mesh is adaptively refined or
  coarsened once every 100 time steps. In order to capture the same effective
  refinement, a uniform mesh will require 202752 elements.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/unstructured/forward_step/solution_low_res.png|0.9par|||>>>|<row|<cell|(a)>>|<row|<cell|<image|figures/paper3/unstructured/forward_step/mesh_low_res.png|0.9par|||>>>|<row|<cell|(b)>>>>>><label|fig:curved.forward.step>|<caption-detailed|Mach
  3 flow over forward facing step at time <math|t=3> using solution
  polynomial degree <math|N=4> with Löhner's indicator for mesh refinement.
  (a) Density plot (b) Adaptively refined mesh|Forward facing step, adaptive
  non-Cartesian mesh and adaptive time stepping.>>

  <subsection|Results on curved grids>

  <subsubsection|Free stream preservation>

  In this section, free stream preservation is tested for meshes with curved
  elements. Since we use a reference map of degree <math|N>
  in<nbsp><eqref|eq:curved.reference.map>, free stream will be preserved
  following the discussion in Section<nbsp><reference|sec:curved.free.stream.lwfr>.
  We numerically verify the same for the meshes taken from
  <verbatim|Trixi.jl> which are shown in Figure<nbsp><reference|fig:curved.free.stream>.
  The mesh in Figure<nbsp><reference|fig:curved.free.stream>a consists of
  curved boundaries and only the elements adjacent to the boundary are
  curved, while the one in Figure<nbsp><reference|fig:curved.free.stream>b is
  a non-conforming mesh with curved elements everywhere, and is used to
  verify that free stream preservation holds with adaptively refined meshes.
  The mesh in Figure<nbsp><reference|fig:curved.free.stream>b is a 2-D
  reduction of the one used in Figure 3 of<nbsp><cite|Rueda2021> and is
  defined by the global map <math|<around|(|\<xi\>,\<eta\>|)>\<mapsto\><around|(|x,y|)>>
  from <math|<around|[|0,3|]><rsup|2>\<to\>\<Omega\>> described as

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|x=\<xi\>+<frac|3|8>*cos
    <around*|(|<frac|\<pi\>|2>*<frac|2*\<xi\>-3|3>|)>*cos
    <around*|(|2*\<pi\>*<frac|2*y-3|3>|)>>>|<row|<cell|y=\<eta\>+<frac|3|8>*cos
    <around*|(|<frac|3*\<pi\>|2>*<frac|2*\<xi\>-3|3>|)>*cos
    <around*|(|<frac|\<pi\>|2>*<frac|2*\<eta\>-3|3>|)>>>>>>
  </equation*>

  The free stream preservation is verified on these meshes by solving the
  Euler's equation with constant initial data

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around|(|1,0.1,-0.2,10|)>
  </equation*>

  and Dirichlet boundary conditions. Figure<nbsp><reference|fig:curved.free.stream>
  shows the density at time <math|t=10> which is constant throughout the
  domain.

  <big-figure| <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<table|<row|<cell|<image|figures/paper3/euler2d/free_stream/free_stream_colour_bar.pdf|0.8par|||>>|<cell|>>|<row|<cell|<image|figures/paper3/euler2d/free_stream/ginger_bread_low_res.png|0.4par|||>>|<cell|<image|figures/paper3/euler2d/free_stream/wrapped_mesh_low_res.png|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:curved.free.stream>|<caption-detailed|Density
  plots of free stream tests with mesh and solution polynomial degree
  <math|N=6> at <math|t=10> on (a) mesh with curved boundaries, (b) mesh with
  refined curved elements|Free stream solutions.>>

  <subsubsection|Isentropic vortex><label|sec:curved.isentropic>

  This is a test with exact solution taken from<nbsp><cite|hennemann2021>
  where the domain is specified by the following transformation from
  <math|<around|[|0,1|]><rsup|2>\<to\>\<Omega\>>

  <\equation*>
    <bx><around|(|\<xi\>,\<eta\>|)>=<around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<xi\>*L<rsub|x>-A<rsub|x>*L<rsub|y>*sin
    <around|(|2*\<pi\>*\<eta\>|)>>>|<row|<cell|\<eta\>*L<rsub|y>+A<rsub|y>*L<rsub|x>*sin
    <around|(|2*\<pi\>*\<xi\>|)>>>>>>|)>
  </equation*>

  which is a distortion of the square <math|<around|[|0,L<rsub|x>|]>\<times\><around|[|0,L<rsub|y>|]>>
  with sine waves of amplitudes <math|A<rsub|x>,A<rsub|y>>.
  Following<nbsp><cite|hennemann2021>, we choose length
  <math|L<rsub|x>=L<rsub|y>=0.1> and amplitudes
  <math|A<rsub|x>=A<rsub|y>=0.1>. The boundaries are set to be periodic. A
  vortex with radius <math|R<rsub|v>=0.005> is initialized in the curved
  domain with center <math|<around|(|x<rsub|v>,y<rsub|v>|)>=<around|(|L<rsub|x>/2,L<rsub|y>/2|)>>.
  The gas constant is taken to be <math|R<rsub|gas>=287.15> and specific heat
  ratio <math|\<gamma\>=1.4> as before. The free stream state is defined by
  the Mach number <math|M<rsub|0>=0.5>, temperature <math|T<rsub|0>=300>,
  pressure <math|p<rsub|0>=10<rsup|5>>, velocity
  <math|u<rsub|0>=M<rsub|0>*<sqrt|\<gamma\>*R<rsub|gas>*T<rsub|0>>> and
  density <math|\<rho\><rsub|0>=<frac|p<rsub|0>|R<rsub|gas>*T<rsub|0>>>. The
  initial condition <math|<uu><rsub|0>> is given by

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<around|(|\<rho\>,u,v,p|)>=<around*|(|\<rho\><rsub|0><around*|(|<frac|T|T<rsub|0>>|)><rsup|<frac|1|\<gamma\>-1>>,u<rsub|0><around*|(|1-\<beta\><frac|y-y<rsub|v>|R<rsub|v>>*e<rsup|<frac|-r<rsup|2>|2>>|)>,u<rsub|0>*\<beta\>*<frac|x-x<rsub|v>|R<rsub|v>>*e<rsup|<frac|-r<rsup|2>|2>>,\<rho\><around|(|x,y|)>*R<rsub|gas>*T|)>>>|<row|<cell|T*<around|(|x,y|)>=T<rsub|0>-<frac|<around|(|u<rsub|0>*\<beta\>|)><rsup|2>|2*C<rsub|p>>*e<rsup|-r<rsup|2>>,<space|2em>r=<sqrt|<around|(|x-x<rsub|v>|)><rsup|2>+<around|(|y-y<rsub|v>|)><rsup|2>>/R<rsub|v>>>>>>
  </equation*>

  where <math|C<rsub|p>=R<rsub|gas>*\<gamma\>/<around|(|\<gamma\>-1|)>> is
  the heat capacity at constant pressure and <math|\<beta\>=0.2> is the
  vortex strength. The vortex moves in the positive <math|x> direction with
  speed <math|u<rsub|0>> so that the exact solution at time <math|t> is
  <math|<uu><around|(|x,y,t|)>=<uu><rsub|0><around|(|x-u<rsub|0>*t,y|)>>
  where <math|<uu><rsub|0>> is extended outside <math|\<Omega\>> by
  periodicity. We simulate the propagation of the vortex for one time period
  <math|t<rsub|p>=L<rsub|x>/u<rsub|0>> and perform numerical convergence
  analysis for degree <math|N=3> in Figure<nbsp><reference|fig:curved.isentropic>b,
  showing optimal rates in grid versus <math|L<rsup|2>> error norm for all
  the conserved variables.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/unstructured/isentropic_low_res.png|0.48par|||>>|<cell|<image|figures/paper3/unstructured/isentropic_convergence.pdf|0.4par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:curved.isentropic>|<caption-detailed|Convergence
  analysis for isentropic vortex problem with polynomial degree <math|N=3>.
  (a) Density plot, (b) <math|L<rsup|2>> error norm of conserved
  variables|Isentropic vortex on curvilinear mesh.>>

  <subsubsection|Supersonic flow over cylinder><label|sec:curved.cylinder>

  Supersonic flow over a cylinder is computed at a free stream Mach number of
  <math|3> with the initial condition

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around|(|1.4,3,0,1|)>
  </equation*>

  Solid wall boundary conditions are used at the top and bottom boundaries. A
  bow shock forms which reflects across the solid walls and interacts with
  the small vortices forming in the wake of the cylinder. The setup of
  Löhner's smoothness indicator<nbsp><eqref|eq:curved.lohner.ind> is taken
  from an example of <verbatim|Trixi.jl><nbsp><cite|Ranocha2021>

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<around|(|<verbatim|base_level>,<verbatim|med_level>,<verbatim|max_level>|)>=<around|(|0,3,5|)>>>|<row|<cell|<around|(|<verbatim|med_threshold>,<verbatim|max_threshold>|)>=<around|(|0.05,0.1|)>>>>>>
  </equation*>

  where <math|<verbatim|base_level>=0> refers to mesh in
  Figure<nbsp><reference|fig:curved.supersonic.cylinder>a. The flow consists
  of a strong a shock and thus the positivity limiter had to be used to
  enforce admissibility. The flow behind the cylinder is highly unsteady,
  with reflected shocks and vortices interacting continuously. The density
  profile of the numerical solution at <math|t=10> is shown in
  Figure<nbsp><reference|fig:curved.supersonic.cylinder> with mesh and
  solution polynomial degree <math|N=4> using Löhner's
  indicator<nbsp><eqref|eq:curved.lohner.ind> for AMR. The AMR indicator is
  tracing the shocks and the vortex structures forming in the wake well. The
  initial mesh has 561 elements which first increase to 63000 elements
  followed by a fall to 39000 elements and then a steady increase to the peak
  of 85000 elements from which it steadily falls to 36000 elements by the end
  of the simulation. The mesh is refined or coarsened once every 100 time
  steps. In order to capture the same effective refinement, a uniform mesh
  will require 574464 elements.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/euler2d/supersonic_cylinder/mesh_initial_low_res.png|0.7par|||>>>|<row|<cell|(a)>>|<row|<cell|<image|figures/paper3/euler2d/supersonic_cylinder/mesh_low_res.png|0.7par|||>>>|<row|<cell|(b)>>|<row|<cell|<image|figures/paper3/euler2d/supersonic_cylinder/solution_low_res.png|0.7par|||>>>|<row|<cell|(c)>>>>>
  ><label|fig:curved.supersonic.cylinder>|<caption-detailed|Mach 3 flow over
  cylinder using solution and mesh polynomial degree <math|N=4> at
  <math|t=10> (a) Initial mesh, (b) adaptively refined mesh at final time,
  (c) density plot at final time.|Supersonic flow over cylinder, adaptive
  mesh and time stepping.>>

  <subsubsection|Inviscid bow shock upstream of a blunt
  body><label|sec:curved.blunt>

  This test simulates steady supersonic flow over a blunt body and is taken
  from<nbsp><cite|hennemann2021> which followed the description proposed by
  the high order computational fluid dynamics
  workshop<nbsp><cite|Cenaero2017>. The domain, also shown in
  Figure<nbsp><reference|fig:curved.blunt> consists of a left and a right
  boundary. The left boundary is an arc of a circle with origin
  <math|<around|(|3.85,0|)>> and radius <math|5.9> extended till <math|x=0>
  on both ends. The right boundary consists of (a) the blunt body and (b)
  straight-edged outlets. The straight-edged outlets are
  <math|<around|{|<around|(|0,y|)>:<around|\||y|\|>\<gtr\>0.5|}>> extended
  till the left boundary arc. The blunt body consists of a front of length
  <math|1> and two quarter circles of radius 0.5. The domain is initialized
  with a Mach 4 flow, which is given in primitive variables by

  <\equation>
    <around|(|\<rho\>,u,v,p|)>=<around|(|1.4,4,0,1|)>
  </equation>

  The left boundary is set as supersonic inflow, the blunt body is a
  reflecting wall and the straight edges at <math|x=0> are supersonic outflow
  boundaries. Löhner's smoothness indicator<nbsp><eqref|eq:curved.lohner.ind>
  for AMR is set up as

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<around|(|<verbatim|base_level>,<verbatim|med_level>,<verbatim|max_level>|)>=<around|(|0,1,2|)>>>|<row|<cell|<around|(|<verbatim|med_threshold>,<verbatim|max_threshold>|)>=<around|(|0.05,0.1|)>>>>>>
  </equation*>

  where <math|<verbatim|base_level>=0> refers to mesh in
  Figure<nbsp><reference|fig:curved.blunt>a. Since this is a test case with a
  strong bow shock, the positivity limiter had to be used to enforce
  admissibility. The pressure obtained with polynomial degree <math|N=4> is
  shown in Figure<nbsp><reference|fig:curved.blunt> with adaptive mesh
  refinement performed using Löhner's smoothness
  indicator<nbsp><eqref|eq:curved.lohner.ind> where the AMR procedure is seen
  to be refining the mesh in the region of the bow shock. The initial
  mesh<nbsp>(Figure<nbsp><reference|fig:curved.blunt>a) has 244 elements
  which steadily increases to <math|\<sim\>1600> elements till
  <math|t\<approx\>1.5> and then remains nearly constant as the solution
  reaches steady state. The mesh is adaptively refined or coarsened at every
  time step.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/euler2d/blunt/initial_mesh|0.095par|||>
  <space|2em>>|<cell|<image|figures/paper3/euler2d/blunt/mesh|0.095par|||>
  <space|2em>>|<cell|<image|figures/paper3/euler2d/blunt/N4.png|0.21par|||>
  >|<cell|<image|figures/paper3/euler2d/blunt/N4_mach.png|0.21par|||>>>|<row|<cell|(a)>|<cell|(b)>|<cell|(c)>|<cell|(d)>>>>><label|fig:curved.blunt>|<caption-detailed|Mach
  4 flow over blunt body using polynomial degree <math|N=4> showing (a)
  initial mesh, (b) adaptively refined mesh, (c) pressure plot, (d) Mach
  number plot|Mach 4 flow over blunt body, adaptive mesh and time stepping.>>

  <subsubsection|Transonic flow over NACA0012 airfoil><label|sec:curved.naca>

  This is a steady transonic flow over the symmetric NACA0012 airfoil. The
  initial condition is taken to have Mach number <math|M<rsub|0>=0.85> and it
  is given in primitive variables as

  <\equation*>
    <around|(|\<rho\>,u,v,p|)>=<around*|(|<frac|p<rsub|0>|T<rsub|0>*R>,U<rsub|0>*cos
    \<theta\>,U<rsub|0>*sin \<theta\>,p<rsub|0>|)>
  </equation*>

  where <math|p<rsub|0>=1,T<rsub|0>=1,R=287.87,\<theta\>=\<pi\>/180>,
  <math|U<rsub|0>=M<rsub|0>*c<rsub|0>> and sound speed
  <math|c<rsub|0>=<sqrt|\<gamma\>*p<rsub|0>/\<rho\><rsub|0>>>. The airfoil is
  of length <math|1> unit located in the rectangular domain
  <math|<around|[|-20,20|]><rsup|2>> and the initial mesh has 728 elements.
  We run the simulation with mesh and solution polynomial degree <math|N=6>
  using Löhner's smoothness indicator<nbsp><eqref|eq:curved.lohner.ind> for
  AMR with the setup

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<around|(|<verbatim|base_level>,<verbatim|med_level>,<verbatim|max_level>|)>=<around|(|1,3,4|)>>>|<row|<cell|<around|(|<verbatim|med_threshold>,<verbatim|max_threshold>|)>=<around|(|0.05,0.1|)>>>>>>
  </equation*>

  where <math|<verbatim|base_level>=1> refers to the mesh in
  Figure<nbsp><reference|fig:curved.naca.mesh>a . In
  Figure<nbsp><reference|fig:curved.naca.mesh>, we show the initial and
  adaptively refined mesh. In Figure<nbsp><reference|fig:curved.naca>, we
  show the Mach number and compare the coefficient of pressure
  <math|C<rsub|p>> on the surface of airfoil with SU2<nbsp><cite|su2>
  results, seeing reasonable agreement in terms of the values and shock
  locations. The AMR procedure is found to steadily increase the number of
  elements till they peak at <math|\<approx\>4200> and decrease to stabilize
  at <math|\<sim\>3750>; the region of the shocks is being refined by the AMR
  process. The mesh is adaptively refined or coarsened once every 100 time
  steps. In order to capture the same effective refinement, a uniform mesh
  will require 186368 elements.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/unstructured/naca/coarse_mesh.png|0.45par|||>>|<cell|<image|figures/paper3/unstructured/naca/amr_mesh.png|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:curved.naca.mesh>|<caption-detailed|Meshes
  for transonic flow over NACA0012 airfoil. (a) Initial mesh (b) adaptively
  refined mesh|Adaptively refined NACA0012 airfoil mesh.>>

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/unstructured/naca/mach_number.png|0.5par|||>>|<cell|<image|figures/paper3/unstructured/naca/cp|0.4par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:curved.naca>|<caption-detailed|Transonic
  flow over airfoil using degree <math|N=6> on adapted mesh (a) Mach number
  (b) Coefficient of pressure on the surface of the airfoil|Transonic flow
  over airfoil, adaptive mesh and time stepping.>>

  <subsection|Performance comparison of time stepping schemes>

  In Table<nbsp><reference|tab:cfl.error>, we show comparison of total time
  steps needed by error<nbsp> (Algorithm<nbsp><reference|alg:time.stepping>)
  and CFL<nbsp><eqref|eq:curved.cfl.time.step> based time stepping methods
  for test cases where non-Cartesian meshes are used. The total time steps
  give a complete description of the cost because our experiments have shown
  that error estimation procedure only adds an additional computational cost
  of <math|\<sim\>4%>. The relative and absolute tolerances
  <math|\<tau\><rsub|a>,\<tau\><rsub|r>> in<nbsp><eqref|eq:curved.error.estimator>
  are taken to be the same, and denoted <verbatim|tolE>. The iterations which
  are redone because of error or admissibility criterion in
  Algorithm<nbsp><reference|alg:time.stepping> are counted as
  <with|font-shape|italic|failed> (shown in
  Table<nbsp><reference|tab:cfl.error> in red) while the rest as
  <with|font-shape|italic|successful> (shown in
  Table<nbsp><reference|tab:cfl.error> in blue). The comparisons are made
  between the two time stepping schemes as follows - the constant <math|<Cs>>
  in<nbsp><eqref|eq:curved.cfl.time.step> is experimentally chosen to be the
  largest which can be used without admissibility violation while error based
  time stepping is shown with <verbatim|tolE = 1e-6> and the best tolerance
  for the particular test case (which is either <verbatim|1e-6> or
  <verbatim|5e-6>). Note that the choice of <verbatim|tolE = 1e-6> is made in
  all the results shown in previous sections. A poor quality (nearly
  degenerate) mesh<nbsp>(Figure<nbsp><reference|fig:curved.blunt>b) was used
  in the flow over blunt body<nbsp>(Section<nbsp><reference|sec:curved.blunt>)
  and thus the CFL based scheme could not run till the final time <math|t=10>
  without admissibility violation for any choice of <math|<Cs>>. However, the
  error-based time stepping scheme is able to finish the simulation by its
  ability to redo time steps; although there are many failed time steps as is
  to be expected. The error-based time stepping scheme is giving superior
  performance with <verbatim|tolE = 1e-6> for the supersonic flow over
  cylinder and transonic flow over airfoil (curved meshes tests) with ratio
  of total time steps being 1.755 and 1.43 respectively. However, for the
  forward facing step test with a straight sided quadrilateral mesh, error
  based time stepping with <verbatim|tolE = 1e-6> takes more time steps than
  the fine-tuned CFL based time stepping. However, increasing the tolerance
  to <verbatim|tolE = 5e-6> gives the same performance as the CFL based time
  stepping. By using <verbatim|tolE = 5e-6>, the performance of supersonic
  flow cylinder can be further obtained to get a ratio of 2.327. These
  results show the robustness of error-based time stepping and even improved
  efficiency in meshes with curved elements.

  <big-table|<tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|c>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|c>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|3|3|1|-1|cell-bborder|1ln>|<cwith|4|4|1|-1|cell-bborder|1ln>|<cwith|5|5|1|-1|cell-bborder|1ln>|<cwith|6|6|1|-1|cell-bborder|1ln>|<table|<row|<cell|>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|CFL>>|<row|<cell|(<reference|eq:curved.cfl.time.step>)>>>>>>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|Error>>|<row|<cell|(Alg.
  <reference|alg:time.stepping>)>>|<row|<cell|(<with|color|blue|Pass> +
  <with|color|red|Fail>)>>>>>>|<cell|>|<cell|>|<cell|Ratio>>|<row|<cell|>|<cell|>|<cell|<verbatim|tolE=1e-6>>|<cell|<math|<frac|<text|CFL>|<verbatim|<text|tolE=1e-6>>>>>|<cell|Best
  <verbatim|tolE>>|<cell|<math|<frac|<text|CFL>|<text|Best
  <verbatim|tolE>>>>>>|<row|<cell|<tabular|<tformat|<table|<row|<cell|FF
  Step>>|<row|<cell|<eqref|sec:curved.forward.step>>>>>>>|<cell|5706455>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|7661457>>|<row|<cell|<math|<around|(|<with|color|b*l*u*e|7661453>+<with|color|r*e*d|4>|)>>>>>>>>|<cell|0.74>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|5646355
  <verbatim|(5e-6)>>>|<row|<cell|(<with|color|blue|5646355> +
  <with|color|red|5>)>>>>>>|<cell|1.01>>|<row|<cell|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|Cylinder>>|<row|<cell|
  (<reference|sec:curved.cylinder>)>>>>>>|<cell|1529064>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|871262>>|<row|<cell|(<with|color|blue|871124>
  + <with|color|red|138>)>>>>>>|<cell|1.755>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|657170
  <verbatim|(5e-6)>>>|<row|<cell|(<with|color|blue|651118>+<with|color|red|6052>)>>>>>>|<cell|2.327>>|<row|<cell|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|Blunt>>|<row|<cell|(<reference|sec:curved.blunt>)>>>>>>|<cell|->|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|4200>>|<row|<cell|(<with|color|blue|3800>
  + <with|color|red|400>)>>>>>>|<cell|->|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|4200
  <verbatim|(1e-6)>>>|<row|<cell|(<with|color|blue|3800> +
  <with|color|red|400>)>>>>>>|<cell|->>|<row|<cell|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|Airfoil>>|<row|<cell|(<reference|sec:curved.naca>)>>>>>>|<cell|6856828>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|4778674>>|<row|<cell|(<with|color|blue|4778651>
  + <with|color|red|23>)>>>>>>|<cell|1.43>|<cell|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|4778674
  <verbatim|(1e-6)>>>|<row|<cell|(<with|color|blue|4778651> +
  <with|color|red|23>)>>>>>>|<cell|1.43>>>>> |<label|tab:cfl.error>Number of
  time steps comparing error and CFL based methods>

  <section|Summary and conclusions><label|sec:curved.conclusions>

  The Lax-Wendroff Flux Reconstruction (LWFR) scheme has been extended to
  curvilinear and dynamic, locally adapted meshes. On curvilinear meshes, it
  is shown that satisfying the standard metric identities gives free stream
  preservation for the LWFR scheme. The subcell based blending scheme of
  Chapter<nbsp><reference|ch:lw.subcell.limiter> has been extended to
  curvilinear meshes along with the provable admissibility preservation
  (Section<nbsp><reference|sec:blend.review>) based on the idea of
  appropriately choosing the <with|font-shape|italic|blended numerical
  flux><nbsp>(Section<nbsp><reference|sec:admissibility.preservation>) at the
  element interfaces. Adaptive Mesh Refinement has been introduced for LWFR
  scheme using the Mortar Element Method (MEM) of<nbsp><cite|Kopriva1996>.
  Fourier stability analysis to compute the optimal CFL number as in
  Section<nbsp><reference|sec:four1d> is based on uniform Cartesian meshes
  and does not apply to curvilinear grids. Thus, in order to use a wave speed
  based time step computation, the CFL number has to be fine tuned for every
  problem, especially for curved grids. In order to decrease the fine-tuning
  process, an embedded errror-based time step computation method was
  introduced for LWFR by taking difference between two element local
  evolutions of the solutions using the local time averaged flux
  approximations - one which is order <math|N+1> and the other truncated to
  be order <math|N>. This is the first time error-based time stepping has
  been introduced for a single stage evolution method for solving time
  dependent equations. Numerical results using compressible Euler equations
  were shown to validate the claims. It was shown that free stream condition
  is satisfied on curvilinear meshes even with non-conformal elements and
  that the LWFR scheme shows optimal convergence rates on domains with curved
  boundaries and meshes. The AMR with shock capturing was tested on various
  problems to show the scheme's robustness and capability to automatically
  refine in regions comprising of relevant features like shocks and small
  scale structures. The error based time stepping scheme is able to run with
  fewer time steps in comparison to the CFL based scheme and with less fine
  tuning. The speed-up obtained by error based time stepping for curvilinear
  meshes was in the range of 1.43 and 2.33.
</body>

<\initial>
  <\collection>
    <associate|algorithm-indentation|0tab>
    <associate|chapter-nr|7>
    <associate|font-base-size|12>
    <associate|info-flag|detailed>
    <associate|page-even|1in>
    <associate|page-first|167>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|project-flag|false>
    <associate|section-nr|6>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:blended.flux|<tuple|8.1|182>>
    <associate|alg:cell.residual|<tuple|8.2|194>>
    <associate|alg:lw.residual|<tuple|8.3|194>>
    <associate|alg:time.stepping|<tuple|8.4|195>>
    <associate|auto-1|<tuple|8|167>>
    <associate|auto-10|<tuple|8.4|177>>
    <associate|auto-11|<tuple|8.4.1|178>>
    <associate|auto-12|<tuple|8.2|178>>
    <associate|auto-13|<tuple|8.4.2|180>>
    <associate|auto-14|<tuple|8.4.3|181>>
    <associate|auto-15|<tuple|8.4.3.1|182>>
    <associate|auto-16|<tuple|8.4.3.2|183>>
    <associate|auto-17|<tuple|8.5|184>>
    <associate|auto-18|<tuple|8.5.1|185>>
    <associate|auto-19|<tuple|8.3|185>>
    <associate|auto-2|<tuple|8.1|167>>
    <associate|auto-20|<tuple|8.5.1.1|186>>
    <associate|auto-21|<tuple|8.5.1.2|186>>
    <associate|auto-22|<tuple|8.5.2|187>>
    <associate|auto-23|<tuple|8.5.2.1|187>>
    <associate|auto-24|<tuple|8.4|187>>
    <associate|auto-25|<tuple|8.5.2.2|188>>
    <associate|auto-26|<tuple|8.5.2.3|189>>
    <associate|auto-27|<tuple|8.5.3|191>>
    <associate|auto-28|<tuple|8.6|192>>
    <associate|auto-29|<tuple|8.6.1|192>>
    <associate|auto-3|<tuple|8.2|167>>
    <associate|auto-30|<tuple|8.6.2|193>>
    <associate|auto-31|<tuple|8.7|195>>
    <associate|auto-32|<tuple|8.7.1|196>>
    <associate|auto-33|<tuple|8.7.1.1|196>>
    <associate|auto-34|<tuple|8.5|197>>
    <associate|auto-35|<tuple|8.7.1.2|197>>
    <associate|auto-36|<tuple|8.6|198>>
    <associate|auto-37|<tuple|8.7.1.3|198>>
    <associate|auto-38|<tuple|8.7|199>>
    <associate|auto-39|<tuple|8.7.1.4|199>>
    <associate|auto-4|<tuple|8.3|170>>
    <associate|auto-40|<tuple|8.8|200>>
    <associate|auto-41|<tuple|8.7.2|200>>
    <associate|auto-42|<tuple|8.7.2.1|200>>
    <associate|auto-43|<tuple|8.9|201>>
    <associate|auto-44|<tuple|8.7.2.2|201>>
    <associate|auto-45|<tuple|8.10|202>>
    <associate|auto-46|<tuple|8.7.2.3|202>>
    <associate|auto-47|<tuple|8.11|203>>
    <associate|auto-48|<tuple|8.7.2.4|204>>
    <associate|auto-49|<tuple|8.12|204>>
    <associate|auto-5|<tuple|8.3.1|170>>
    <associate|auto-50|<tuple|8.7.2.5|204>>
    <associate|auto-51|<tuple|8.13|205>>
    <associate|auto-52|<tuple|8.14|205>>
    <associate|auto-53|<tuple|8.7.3|206>>
    <associate|auto-54|<tuple|8.1|206>>
    <associate|auto-55|<tuple|8.8|207>>
    <associate|auto-6|<tuple|8.1|171>>
    <associate|auto-7|<tuple|8.3.2|172>>
    <associate|auto-8|<tuple|8.3.3|174>>
    <associate|auto-9|<tuple|8.3.4|175>>
    <associate|ch:curved.meshes|<tuple|8|167>>
    <associate|defn.mean|<tuple|8.30|174>>
    <associate|defn:curved.contravariant.basis|<tuple|8.2|169>>
    <associate|defn:curved.covariant.basis|<tuple|8.1|169>>
    <associate|defn:curved.well.constructed.mesh|<tuple|8.4|176>>
    <associate|eq:curved.2d.adm.numflux.desired|<tuple|8.53|183>>
    <associate|eq:curved.2d.low.update.admissibility.condn|<tuple|8.52|183>>
    <associate|eq:curved.2d.xy.implies.admissibility|<tuple|8.54|183>>
    <associate|eq:curved.4to1proj|<tuple|8.62|186>>
    <associate|eq:curved.Fdelta.low|<tuple|8.76|193>>
    <associate|eq:curved.Fisf|<tuple|8.41|177>>
    <associate|eq:curved.I0.defn|<tuple|8.55|184>>
    <associate|eq:curved.Nnd|<tuple|8.5|168>>
    <associate|eq:curved.Uisu|<tuple|8.42|177>>
    <associate|eq:curved.approx.soln|<tuple|8.15|170>>
    <associate|eq:curved.blended.flux.in.curved|<tuple|8.48|179>>
    <associate|eq:curved.cfl.effective|<tuple|8.79|197>>
    <associate|eq:curved.cfl.formula|<tuple|8.72|192>>
    <associate|eq:curved.cfl.time.step|<tuple|8.78|196>>
    <associate|eq:curved.compact.prolongation|<tuple|8.67|189>>
    <associate|eq:curved.con.law|<tuple|8.1|167>>
    <associate|eq:curved.conservation.lw|<tuple|8.29|174>>
    <associate|eq:curved.contravariant.flux.defn|<tuple|8.13|169>>
    <associate|eq:curved.contravariant.identity|<tuple|8.9|169>>
    <associate|eq:curved.cts.num.flux|<tuple|8.18|171>>
    <associate|eq:curved.cts.time.avg.flux|<tuple|8.25|173>>
    <associate|eq:curved.defn1.div|<tuple|8.2|168>>
    <associate|eq:curved.divergence.transform.contravariant|<tuple|8.10|169>>
    <associate|eq:curved.dtnp1.formula|<tuple|8.73|193>>
    <associate|eq:curved.error.estimator|<tuple|8.74|193>>
    <associate|eq:curved.final.int.identity.fxi|<tuple|8.66|189>>
    <associate|eq:curved.flux.poly.defn|<tuple|8.17|171>>
    <associate|eq:curved.fo.rusanov|<tuple|8.47|179>>
    <associate|eq:curved.fr.update.curvilinear|<tuple|8.22|172>>
    <associate|eq:curved.ft.defn|<tuple|8.32|174>>
    <associate|eq:curved.gradient.transform.contravariant|<tuple|8.11|169>>
    <associate|eq:curved.integral.identities|<tuple|8.64|187>>
    <associate|eq:curved.interpolation.defn|<tuple|8.36|175>>
    <associate|eq:curved.interpolation.ue|<tuple|8.5.1.1|186>>
    <associate|eq:curved.lagrange.basis|<tuple|8.6|168>>
    <associate|eq:curved.lo.numflux|<tuple|8.46|179>>
    <associate|eq:curved.lohner.ind|<tuple|8.71|191>>
    <associate|eq:curved.low.order.cell.avg.update.curved|<tuple|8.49|179>>
    <associate|eq:curved.low.update.2d|<tuple|8.51|183>>
    <associate|eq:curved.lower.order.curved|<tuple|8.45|178>>
    <associate|eq:curved.lower.order.flux.curved|<tuple|8.44|178>>
    <associate|eq:curved.lw.update|<tuple|8.23|172>>
    <associate|eq:curved.lwfr.update.curvilinear|<tuple|8.28|173>>
    <associate|eq:curved.metric.identity.contravariant|<tuple|8.14|170>>
    <associate|eq:curved.metric.identity.contravariant.inter|<tuple|8.35|175>>
    <associate|eq:curved.metric.identity.contravariant.poly|<tuple|8.37|175>>
    <associate|eq:curved.partition|<tuple|8.3|168>>
    <associate|eq:curved.pro4.with.lagrange|<tuple|8.63|186>>
    <associate|eq:curved.proP.defn|<tuple|8.59|185>>
    <associate|eq:curved.product.of.operators|<tuple|8.60|185>>
    <associate|eq:curved.proj.mortar.int.id|<tuple|8.68|189>>
    <associate|eq:curved.projection.integral.equation|<tuple|8.69|189>>
    <associate|eq:curved.reference.map|<tuple|8.4|168>>
    <associate|eq:curved.rusanov.flux|<tuple|8.19|171>>
    <associate|eq:curved.rusanov.flux.lw|<tuple|8.26|173>>
    <associate|eq:curved.semi.discrete.fr|<tuple|8.21|172>>
    <associate|eq:curved.subint.op|<tuple|8.58|184>>
    <associate|eq:curved.submap|<tuple|8.56|184>>
    <associate|eq:curved.submap.inverse|<tuple|8.57|184>>
    <associate|eq:curved.time.averaged.flux|<tuple|8.24|172>>
    <associate|eq:curved.time.avg.is.physical.flux|<tuple|8.39|176>>
    <associate|eq:curved.transformed.conservation.law|<tuple|8.12|169>>
    <associate|eq:curved.uXidefn|<tuple|8.65|188>>
    <associate|eq:curved.ueues.defn|<tuple|8.61|186>>
    <associate|eq:curved.uloc.high|<tuple|8.75|193>>
    <associate|eq:curved.unp1.low|<tuple|8.77|194>>
    <associate|eq:curved.ut.defn|<tuple|8.33|174>>
    <associate|eq:curved.utt.defn|<tuple|8.34|175>>
    <associate|eq:curved.well.constructed|<tuple|8.38|176>>
    <associate|eq:curved.xis.notation|<tuple|8.16|170>>
    <associate|eq:ftilde.free.stream|<tuple|8.40|176>>
    <associate|eq:rusanov.lambda|<tuple|8.20|171>>
    <associate|eq:semi.integral.form|<tuple|8.31|174>>
    <associate|fig:curved.blunt|<tuple|8.12|204>>
    <associate|fig:curved.curved.subcells|<tuple|8.2|178>>
    <associate|fig:curved.dmr|<tuple|8.7|199>>
    <associate|fig:curved.forward.step|<tuple|8.8|200>>
    <associate|fig:curved.free.stream|<tuple|8.9|201>>
    <associate|fig:curved.isentropic|<tuple|8.10|202>>
    <associate|fig:curved.kh|<tuple|8.6|198>>
    <associate|fig:curved.m2000|<tuple|8.5|197>>
    <associate|fig:curved.mortar|<tuple|8.4|187>>
    <associate|fig:curved.naca|<tuple|8.14|205>>
    <associate|fig:curved.naca.mesh|<tuple|8.13|205>>
    <associate|fig:curved.ref.map|<tuple|8.1|171>>
    <associate|fig:curved.refine.coarsen|<tuple|8.3|185>>
    <associate|fig:curved.supersonic.cylinder|<tuple|8.11|203>>
    <associate|rmk:amr.metric.terms|<tuple|8.7|190>>
    <associate|sec:curved.alwp|<tuple|8.3.3|174>>
    <associate|sec:curved.amr|<tuple|8.5|184>>
    <associate|sec:curved.amr.indicator|<tuple|8.5.3|191>>
    <associate|sec:curved.blunt|<tuple|8.7.2.4|204>>
    <associate|sec:curved.conclusions|<tuple|8.8|207>>
    <associate|sec:curved.cons.lw|<tuple|8.3|170>>
    <associate|sec:curved.curvilinear.coords|<tuple|8.2|167>>
    <associate|sec:curved.cylinder|<tuple|8.7.2.3|202>>
    <associate|sec:curved.dmr|<tuple|8.7.1.3|198>>
    <associate|sec:curved.el2mortar|<tuple|8.5.2.2|188>>
    <associate|sec:curved.error.lw|<tuple|8.6.2|193>>
    <associate|sec:curved.flux.correction|<tuple|8.4.3|181>>
    <associate|sec:curved.flux.correction.curved|<tuple|8.4.3.2|183>>
    <associate|sec:curved.flux.limiter.1d|<tuple|8.4.3.1|182>>
    <associate|sec:curved.forward.step|<tuple|8.7.1.4|199>>
    <associate|sec:curved.fr|<tuple|8.3.1|170>>
    <associate|sec:curved.free.stream.lwfr|<tuple|8.3.4|175>>
    <associate|sec:curved.handling.mortars|<tuple|8.5.2|187>>
    <associate|sec:curved.isentropic|<tuple|8.7.2.2|201>>
    <associate|sec:curved.lwfr.curved|<tuple|8.3.2|172>>
    <associate|sec:curved.naca|<tuple|8.7.2.5|204>>
    <associate|sec:curved.numerical.results|<tuple|8.7|195>>
    <associate|sec:curved.proj.elem|<tuple|8.5.1.2|186>>
    <associate|sec:curved.proj.face|<tuple|8.5.2.3|189>>
    <associate|sec:curved.rk.error.section|<tuple|8.6.1|192>>
    <associate|sec:curved.shock.capturing|<tuple|8.4|177>>
    <associate|sec:curved.smooth.ind|<tuple|8.4.2|180>>
    <associate|sec:curved.soln.transfer|<tuple|8.5.1|185>>
    <associate|sec:curved.time.stepping|<tuple|8.6|192>>
    <associate|tab:cfl.error|<tuple|8.1|206>>
    <associate|thm:curved.lwfr.admissibility|<tuple|8.6|181>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Kopriva1996

      Kopriva2006

      kopriva2009

      babbar2022

      Kopriva2006

      babbar2023admissibility

      Kopriva1996

      Ranocha2022

      Kopriva2006

      kopriva2009

      Kopriva2006

      kopriva2009

      Huynh2007

      Rusanov1962

      Ranocha2022

      Huynh2007

      Huynh2007

      babbar2022

      Zorio2017

      Kopriva2006

      Kopriva2006

      Kopriva2006

      Ranocha2022

      Zhang2010b

      hennemann2021

      hennemann2021

      hennemann2021

      babbar2023admissibility

      babbar2023admissibility

      Zhang2010b

      babbar2023admissibility

      Zhang2010b

      Kopriva1996

      kopriva2009

      Kopriva2019

      Kozdon2018

      Zhang2010b

      Zhang2010b

      hennemann2021

      lohner1987

      Ranocha2021

      babbar2022

      babbar2023admissibility

      babbar2022

      Ranocha2021

      ranocha2023

      Ranocha2021

      Ranocha2021

      Ranocha2021

      Ranocha2021

      Bogacki1989

      Ranocha2021

      ranocha2023

      Rasha2021

      Ranocha2021

      Ranocha2022

      schlottkelakemper2021purely

      schlottkelakemper2020trixi

      Bezanson2017

      curvedrepo

      ramirez2021

      Ranocha2021

      Ranocha2021

      Woodward1984

      Ranocha2021

      Rueda2021

      hennemann2021

      hennemann2021

      Ranocha2021

      hennemann2021

      Cenaero2017

      su2

      Kopriva1996
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.1>|>
        Illustration of curvilinear reference map.
      </surround>|<pageref|auto-6>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8.2>||Subcells in a
      curved FR element>|<pageref|auto-12>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.3>|>
        AMR illustration(a) hanging nodes, (b) refinement & coarsening
      </surround>|<pageref|auto-19>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.4>|>
        AMR illustration (a) Prolongation, (b) Projection.
      </surround>|<pageref|auto-24>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.5>|>
        Mach 2000 astrophysical jet with adaptive time stepping.
      </surround>|<pageref|auto-34>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.6>|>
        Kelvin-Helmholtz instability, adaptive mesh and time stepping.
      </surround>|<pageref|auto-36>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.7>|>
        Double Mach reflection, adaptive mesh and time stepping.
      </surround>|<pageref|auto-38>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.8>|>
        Forward facing step, adaptive non-Cartesian mesh and adaptive time
        stepping.
      </surround>|<pageref|auto-40>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.9>|>
        Free stream solutions.
      </surround>|<pageref|auto-43>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.10>|>
        Isentropic vortex on curvilinear mesh.
      </surround>|<pageref|auto-45>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.11>|>
        Supersonic flow over cylinder, adaptive mesh and time stepping.
      </surround>|<pageref|auto-47>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.12>|>
        Mach 4 flow over blunt body, adaptive mesh and time stepping.
      </surround>|<pageref|auto-49>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.13>|>
        Adaptively refined NACA0012 airfoil mesh.
      </surround>|<pageref|auto-51>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.14>|>
        Transonic flow over airfoil, adaptive mesh and time stepping.
      </surround>|<pageref|auto-52>>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|8.1>||Number of time
      steps comparing error and CFL based methods>|<pageref|auto-54>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|8.<space|2spc>Curvilinear
      grids> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      8.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      8.2.<space|2spc>Conservation laws and curvilinear grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      8.3.<space|2spc>LWFR on curvilinear grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      <with|par-left|<quote|1tab>|8.3.1.<space|2spc>Flux Reconstruction (FR)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|1tab>|8.3.2.<space|2spc>Lax-Wendroff Flux
      Reconstruction (LWFR) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|8.3.3.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|8.3.4.<space|2spc>Free stream preservation
      for LWFR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      8.4.<space|2spc>Shock capturing and admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|8.4.1.<space|2spc>Low order scheme for
      curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|8.4.2.<space|2spc>Smoothness indicator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|8.4.3.<space|2spc>Flux limiter for
      admissibility preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|2tab>|8.4.3.1.<space|2spc>Flux limiter for
      admissibility preservation in 1-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|8.4.3.2.<space|2spc>Flux limiter for
      admissibility preservation on curved meshes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      8.5.<space|2spc>Adaptive mesh refinement
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      <with|par-left|<quote|1tab>|8.5.1.<space|2spc>Solution transfer between
      element and subelements <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|2tab>|8.5.1.1.<space|2spc>Interpolation for
      refinement <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|2tab>|8.5.1.2.<space|2spc>Projection for
      coarsening <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <with|par-left|<quote|1tab>|8.5.2.<space|2spc>Mortar element method
      (MEM) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      <with|par-left|<quote|2tab>|8.5.2.1.<space|2spc>Motivation and notation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|2tab>|8.5.2.2.<space|2spc>Prolongation to mortars
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|2tab>|8.5.2.3.<space|2spc>Projection of numerical
      fluxes from mortars to faces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|1tab>|8.5.3.<space|2spc>AMR indicators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      8.6.<space|2spc>Time stepping <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      <with|par-left|<quote|1tab>|8.6.1.<space|2spc>Error estimation for
      Runge-Kutta schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>>

      <with|par-left|<quote|1tab>|8.6.2.<space|2spc>Error based time stepping
      for Lax-Wendroff flux reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      8.7.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      <with|par-left|<quote|1tab>|8.7.1.<space|2spc>Results on Cartesian
      grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|2tab>|8.7.1.1.<space|2spc>Mach 2000 astrophysical
      jet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|2tab>|8.7.1.2.<space|2spc>Kelvin-Helmholtz
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|2tab>|8.7.1.3.<space|2spc>Double mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      <with|par-left|<quote|2tab>|8.7.1.4.<space|2spc>Forward facing step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|1tab>|8.7.2.<space|2spc>Results on curved grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>>

      <with|par-left|<quote|2tab>|8.7.2.1.<space|2spc>Free stream
      preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|2tab>|8.7.2.2.<space|2spc>Isentropic vortex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>>

      <with|par-left|<quote|2tab>|8.7.2.3.<space|2spc>Supersonic flow over
      cylinder <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>>

      <with|par-left|<quote|2tab>|8.7.2.4.<space|2spc>Inviscid bow shock
      upstream of a blunt body <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>>

      <with|par-left|<quote|2tab>|8.7.2.5.<space|2spc>Transonic flow over
      NACA0012 airfoil <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>>

      <with|par-left|<quote|1tab>|8.7.3.<space|2spc>Performance comparison of
      time stepping schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      8.8.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>
    </associate>
  </collection>
</auxiliary>