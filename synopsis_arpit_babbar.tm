<TeXmacs|2.1.1>

<style|<tuple|tmarticle|preview-ref|comment|style_common>>

<\body>
  <\hide-preamble>
    <assign|timeline-hsep|<macro|6fn>>

    <assign|timeline-vsep|<macro|0.1fn>>

    <assign|aligned-timeline|<macro|name|<style-with|src-compact|none|<vspace*|<timeline-vsep>><with|par-first|<minus|<timeline-hsep>>|<yes-indent>><resize|<arg|name>|<minus|1r|<minus|<timeline-hsep>|0.5fn>>||<plus|1r|0.5fn>|>>>>

    <assign|timeline|<macro|text|<aligned-timeline|<arg|text>>>>
  </hide-preamble>

  \;

  <\center>
    <\with|font-base-size|21>
      <with|font-series|bold|SYNOPSIS>

      \;

      of the Ph.D. thesis entitled

      \;

      <with|font|helvetica|font-series|bold|font-base-size|25|Lax-Wendroff
      Flux Reconstruction<new-line>for compressible flows><blanc-page>

      \;

      by

      \;

      <with|font-series|bold|Arpit Babbar>

      \;

      \;

      under the guidance of

      \;

      \;

      <with|font-series|bold|Prof. Praveen Chandrashekar>

      (TIFR Centre for Applicable Mathematics,<new-line>Bangalore)

      \;

      \;

      Centre for Applicable Mathematics,

      Tata Institute of Fundamental Research,

      Bangalore, 560065

      India

      <date|>
    </with>
  </center>

  <new-page>

  <section|Introduction>

  Hyperbolic conservation laws arise as models of physical systems
  representing conservation of mass, momentum, and energy. They are routinely
  solved for applications like Computational Fluid Dynamics (CFD),
  astrophysics and weather modeling. Thus, development of efficient numerical
  methods for solving these equations is crucial. The current state of
  memory-bound HPC hardware makes a strong case for development of high order
  discrete methods. By incorporating more higher order terms, these methods
  can achieve greater numerical accuracy per degree of freedom while
  minimizing memory usage and data transfers. In particular, high order
  methods have higher arithmetic intensity and are thus less likely to be
  memory-bound. The superior accuracy, efficiency, and higher resolution of
  these methods also make them a good fit for LES and DNS of turbulent flows,
  especially with unsteady vortices. Spectral element methods like Flux
  Reconstruction (FR) and Discontinuous Galerkin (DG) are high order methods
  that have been successful in resolving advection-dominated flows. The
  neighbouring FR/DG elements are coupled only through the numerical flux and
  thus bulk of computations are local to the element, minimizing data
  transfers.

  In comparison to traditional semi-discrete FR/DG schemes, which
  <assign|Fq|<macro|<wide|F|~>>>mainly use Runge-Kutta time integration, this
  work makes developments for Lax-Wendroff Flux Reconstruction (LWFR) which
  is a spectral element solver for time dependent PDE that performs high
  order evolution to the next time level in a single stage. The single stage
  nature implies fewer applications of shock capturing and positivity
  limiters, but more importantly that interelement communication is
  minimized, making the method a good fit for the modern hardware. The method
  uses a Taylor series expansion in time and there is no order barrier as any
  order of accuracy can be reached by performing Taylor's expansion to the
  same.

  In this work, the key contributions made to LWFR schemes are the following.
  A Jacobian free LWFR scheme is proposed with new methods of computing
  numerical flux that enhance accuracy and
  stability<nbsp>[<reference|bib-babbar2022>]; the scheme is proven to be
  equivalent to ADER-DG<nbsp><cite|Dumbser2008> scheme
  in<nbsp>[<reference|bib-babbar2024equivalence>] for linear problems. A
  provably admissibility preserving subcell based blending limiter is
  developed with attention also paid to maintaining accuracy of the high
  order method in<nbsp>[<reference|bib-babbar2023admissibility>]. The scheme
  is extended to adaptive, curvilinear meshes and a novel error based time
  stepping is introduced because Fourier stability analysis does not apply to
  curvilinear meshes<nbsp>[<reference|bib-babbar2024curved>]. The other
  developments include applications to source
  terms<nbsp>[<reference|bib-babbar2024generalized>], multiderivative
  Runge-Kutta<nbsp>[<reference|bib-babbar2024multiderivative>] and parabolic
  equations<nbsp>[<reference|bib-babbar2024laxwendroff>]. In the following
  sections, we describe the work done in each of the publications
  (Section<nbsp><reference|sec:publications>).
  Section<nbsp><reference|sec:paper1> describes our first
  work<nbsp>[<reference|bib-babbar2022>] which contains the core LWFR scheme
  and is thus used in the subsequent sections.

  <section|Lax-Wendroff Flux Reconstruction><label|sec:paper1>

  High order Lax-Wendroff schemes were introduced in Discontinuous Galerkin
  framework in<nbsp><cite|Qiu2003>. In<nbsp>[<reference|bib-babbar2022>], we
  combine the Lax-Wendroff method (LW) for time discretization with the Flux
  Reconstruction (FR) method for spatial discretization, since each of these
  two methods have their advantages as discussed in the previous section. We
  use the approximate Lax-Wendroff procedure of<nbsp><cite|Zorio2017> so that
  the method does not require using chain rule which can lead to Jacobians,
  Hessians and higher order tensorial quantities.

  Numerical solutions in FR/DG schemes are allowed to be discontinous across
  element interfaces and use a Godunov type finite volume flux to couple
  neighbouring elements. The main novelties
  of<nbsp>[<reference|bib-babbar2022>] are in the construction of
  Lax-Wendroff / time-averaged numerical flux at element interfaces which
  lead to enhancement of accuracy and stability. The numerical fluxes used in
  Lax-Wendroff schemes consist of a central and a dissipative part, and our
  work<nbsp>[<reference|bib-babbar2022>] proposes enhancements in computation
  of both.

  In earlier works like<nbsp><cite|Qiu2003>, the dissipative part of
  numerical flux was computed with the current numerical solution (which we
  term as the D1 dissipation). Motivated by the fact that the numerical
  fluxes approximate the time averaged fluxes, we propose using the time
  average solution to compute the dissipative part (termed D2 dissipation).
  The shortcoming of the D1 dissipation was that it did not reduce to an
  upwind flux for linear problems, which is overcome by the D2 dissipation. A
  Fourier stability analysis was performed
  in<nbsp>[<reference|bib-babbar2022>] showing that the D2 dissipation has
  enhanced CFL numbers by a factor of <math|\<sim\>1.4> in comparison to D1
  dissipation for all polynomial degrees tried.

  It has been noted in<nbsp>[<reference|bib-babbar2022>] and earlier works
  that Gauss-Legendre solution points, which do not include boundary points
  give lower dissipation and dispersion errors in FR/DG methods, in contrast
  to solution points that include boundary points. The following development
  for LW schemes, termed <with|font-series|bold|Extrapolate and Average
  (EA)><nbsp>[<reference|bib-babbar2022>] scheme, is particular to
  Gauss-Legendre solution points. In high order Lax-Wendroff schemes, a local
  <with|font-series|bold|time averaging> of flux is performed at each
  solution point within the finite element. In order to obtain the central
  part of the numerical flux, we propose performing time averaging at the
  element interfaces with extrapolated values
  (<with|font-series|bold|Extrapolate and Average>,
  Figure<nbsp><reference|fig:ea.illustration>b) in contrast to using
  extrapolated values of the time averaged flux
  (<with|font-series|bold|Average and Extrapolate>,
  Figure<nbsp><reference|fig:ea.illustration>). This leads to enhanced
  accuracy for non-linear problems and cases with sonic point only showed
  optimal convergence rates when the <with|font-series|bold|EA> scheme was
  used. <big-figure|<wide-tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|illustrations/ae.pdf|0.49par|||>
  </cell>|<\cell>
    <image|illustrations/ea.pdf|0.49par|||>
  </cell>>|<row|<\cell>
    (a) <with|font-series|bold|Average and Extrapolate>
  </cell>|<\cell>
    (b) <with|font-series|bold|Extrapolate and Average>
  </cell>>>>>|Methods of computing central part of Lax-Wendroff numerical
  flux<label|fig:ea.illustration>>

  There are two other developments that we made
  in<nbsp>[<reference|bib-babbar2022>]. First, we experimentally discovered a
  mild linear instability for degree <math|N=4> for LW and then found the
  well-known ADER schemes<nbsp><cite|Dumbser2008> to have the same
  instability. Second, we extended commonly used fluxes like Roe's, HLL, HLLC
  developed for LW by making sure that all the intermediate quantities in
  these approximate Riemann solvers were computed using the time average
  fluxes.

  The overall scheme was found to be faster than standard Runge-Kutta schemes
  despite having a smaller CFL number. We found an improvement in Wall Clock
  Time (WCT) ratio of up to a factor of 1.5 in serial computations.

  <section|Admissibility preserving subcell limiter>

  Although arbitrary high order accuracy in smooth test cases and Wall Clock
  Time (WCT) performance improvement over RKFR (Runge-Kutta Flux
  Reconstruction) was observed for the LWFR scheme proposed
  in<nbsp>[<reference|bib-babbar2022>], robustness and maintaining high order
  accuracy in presence of discontinuities remained to be addressed. Solutions
  to hyperbolic conservation laws contain shocks in many practical
  applications and it is well known that high order schemes produce spurious
  oscillations in those cases. These oscillations can lead not only to
  incorrect solutions but can also easily generate nonphysical solutions like
  gases with negative density or pressure. Thus, these schemes require
  limiters which reduce the high order scheme to a lower order scheme in
  non-smooth regions. In<nbsp>[<reference|bib-babbar2022>], a TVB limiter was
  used which reduces the scheme to first order or second in FR elements using
  a minmod function. The TVB limiter is inadequate for the following reasons
  - it does not preserve any subcell information other than the element mean
  and trace values, and it is not provably admissibility preserving for
  Lax-Wendroff schemes even when used with the scaling limiter
  of<nbsp><cite|Zhang2010b>.

  In this work, we use the <with|font-shape|italic|a priori> blending limiter
  of<nbsp><cite|hennemann2021> for LWFR as its choice of subcells gives a
  natural correction to the time averaged numerical flux to obtain
  admissibility preservation in means. The key idea of the blending scheme is
  to write the higher order single step Lax-Wendroff scheme as
  <math|<vu><rsup|H,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vR><rsup|H><rsub|e>>,
  where <math|<vu><rsub|e>> is the vector of nodal values in the element, and
  a low order and non-oscillatory scheme on subcells,
  <math|<vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vR><rsup|L><rsub|e>>,
  and obtain the blended scheme

  <\equation*>
    <math|<vu><rsup|n+1><rsub|e>=<around|(|1-\<alpha\><rsub|e>|)>*<vu><rsup|H,n+1><rsub|e>+\<alpha\><rsub|e>*<vu><rsup|L,n+1><rsub|e>=<vu><rsup|n><rsub|e>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|[|<around|(|1-\<alpha\><rsub|e>|)>*<vR><rsup|H><rsub|e>+\<alpha\><rsub|e>*<vR><rsup|L><rsub|e>|]>>
  </equation*>

  where <math|\<alpha\><rsub|e>\<in\><around|[|0,1|]>> is chosen based on the
  local smoothness indicator of<nbsp><cite|hennemann2021>. This is the first
  blending limiter developed for a Lax-Wendroff scheme and has been carefully
  constructed to obtain accuracy and robustness.

  <paragraph|Accuracy.>We use Gauss-Legendre (GL) solution points and
  subcells obtained from GL quadrature weights
  (Figure<nbsp><reference|fig:subcells>a) instead of the GLL points and
  weights used in<nbsp><cite|hennemann2021>
  (Figure<nbsp><reference|fig:subcells>b). This is because of their accuracy
  advantage as observed by us, and as reported in the literature.

  <\big-figure>
    <padded-center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|illustrations/subcells_fvm_gl.pdf|0.9par|||>>>|<row|<cell|(a)
    Gauss-Legendre (GL) solution points>>|<row|<cell|<image|illustrations/subcells_fvm_gll.pdf|0.9par|||>>>|<row|<cell|(b)
    Gauss-Legendre-Lobatto (GLL) solution points>>>>><label|fig:subcells>>
  </big-figure|<caption-detailed|Subcells used by lower order scheme for
  degree <math|N=4>|Subcells used by lower order scheme for degree
  <math|N=4>.>>

  The other enhancement of accuracy is obtained by performing a second order
  reconstruction on the subcells. This requires developing the MUSCL-Hancock
  scheme on non-cell centred cells (Figure<nbsp><reference|fig:general.grid>)
  and extending the provably admissibility enforcing slope limiter
  of<nbsp><cite|Berthon2006> to such general grids, which is naturally
  crucial for the high order scheme to be admissiblity preserving.

  <\big-figure>
    <padded-center|<image|illustrations/non_cell_centred_grid.pdf|0.97par|||><label|fig:general.grid>>
  </big-figure|A general non-uniform, non-cell-centered finite volume grid>

  We also proposed a simple and efficient problem independent slope limiting
  procedure to enforce the admissibility of MUSCL-Hancock scheme in Section 4
  of<nbsp>[<reference|bib-babbar2023admissibility>].

  <paragraph|Admissibility preservation.>Let us denote <math|<Uad>> as the
  set containing physically correct solutions of hyperbolic conservation
  laws. For example, in case of compressible flows, <math|<Uad>> consists of
  states with positive density and pressure. The first step in obtaining an
  admissibility preserving blending scheme is to ensure that the lower order
  scheme preserves the admissibility set <math|<Uad>>. This is always true if
  all the fluxes in the lower order method are computed with an admissibility
  preserving finite volume method. But the LWFR scheme uses a time average
  numerical flux and maintaining conservation requires that we use the same
  numerical flux at the element interfaces for both lower and higher order
  schemes (Remark<nbsp>1 of<nbsp>[<reference|bib-babbar2023admissibility>]).
  The blended numerical flux at an interface has to be chosen not only to
  balance accuracy and oscillations, but to also ensure provable
  admissibility preservation. In<nbsp>[<reference|bib-babbar2023admissibility>],
  we propose a flux limiting procedure for the blended numerical flux to
  obtain an admissibility preserving lower order scheme. The procedure is
  carefully constructed to be problem independent, efficient and is performed
  within the pre-existing interface loops minimizing storage requirements and
  memory reads. As a result of using the same numerical flux in both high and
  low order schemes, element means of the two schemes are the same (see
  Theorem<nbsp>2 of<nbsp>[<reference|bib-babbar2023admissibility>]). As a
  consequence, the blended scheme now preserves admissibility of element
  means and thus we can use the scaling limiter of<nbsp><cite|Zhang2010b> to
  obtain a scheme that preserves admissibility of the numerical solution at
  all solution points.

  <paragraph|Numerical validation.>The admissibility preservation capability
  was verified in<nbsp>[<reference|bib-babbar2023admissibility>] by extremely
  tough tests like Sedov's blast and Mach 2000 astrophysical jet. In
  Figure<nbsp><reference|fig:blast.chblend>, we compare blending schemes with
  the TVB limiter for blast wave problem of Woodward and Collela. Looking at
  the peak amplitude and contact discontinuity of the density profile which
  is also shown in the zoomed inset, it is clear that MUSCL-Hancock blending
  scheme gives the best resolution, especially when compared with the TVB
  limiter. In Figure<nbsp><reference|fig:dmr>, the MUSCL-Hancock blending and
  the blending scheme of<nbsp><cite|hennemann2021> are compared with the same
  resolution for the double Mach reflection problem. It is seen that our
  proposed scheme is capturing more small scale shear structures verifying
  the lesser dissipation errors and enhanced accuracy.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper2/euler1d/blast.pdf|0.45par|||>>|<cell|<image|figures/paper2/euler1d/blast_pressure.pdf|0.45par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:blast.chblend>>|<caption-detailed|Blast
  problem; First Order (FO), MUSCL-Hancock (MH) blending and TVB limiter with
  degree <math|N=4>.|Comparing TVB and blending schemes on blast wave.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/paper2/euler2d/dmr/trixi.png|0.45par|||>>|<cell|<image|figures/paper2/euler2d/dmr/lwfr.png|0.45par|||>>>|<row|<cell|(a)
  Blending scheme of<nbsp><cite|hennemann2021>>|<cell|(b) LW-MH
  zoomed>>>>><label|fig:dmr>>|<caption-detailed|Double Mach reflection
  problem, density of numerical solution with degree <math|N=4>|Double Mach
  reflection with LW-MH.>>

  <section|Adaptive, curvilinear grids with error-based time stepping>

  <paragraph|Curvilinear, body-fitted grids.>The conservation law is
  transformed to the coordinates of the reference element and then the LWFR
  procedure is applied leading to a collocation method that has similar
  structure as on Cartesian grids. This structure also facilitates the
  extension of the provably admissibility preserving subcell based blending
  scheme of<nbsp>[<reference|bib-babbar2023admissibility>] to curvilinear
  grids. The FR formulation on curvilinear grids is based on its equivalence
  with the DG scheme, see<nbsp><cite|Kopriva2006> which also obtained certain
  metric identities that are required for preservation of constant solutions,
  that is, free stream preservation. The free stream preserving conditions
  for the LWFR scheme are proven to be the same discrete metric identities as
  that of<nbsp><cite|Kopriva2006>.

  <paragraph|Locally and dynamically adapted grids with hanging nodes.>In
  many problems, there are non-trivial and sharp solution features only in
  some localized parts of the domain and these features can move with respect
  to time. Using a uniform mesh to resolve small scale features is
  computationally expensive and adaptive mesh refinement (AMR) is thus very
  useful. In this work, we perform adaptive mesh refinement based on some
  local error or solution smoothness indicator. A consequence of this
  procedure is that we get non-conformal elements with hanging nodes which is
  not a major problem with discontinuous Galerkin type methods, except that
  one has to ensure conservation is satisfied. For discontinuous Galerkin
  methods based on quadrature, conservation is ensured by performing
  quadrature on the cell faces from the refined side of the face. For FR type
  methods which are of collocation type, we need numerical fluxes at certain
  points on the element faces, which have to computed on a refined face
  without loss of accuracy and such that conservation is also satisfied. For
  the LWFR scheme, we use the Mortar Element Method to compute the solution
  and fluxes at non-conformal faces. The resulting method is conservative and
  also preserves free-stream condition on curvilinear, adapted grids.\ 

  <paragraph|Automatic error based time step computation.>The choice of time
  step is restricted by a CFL-type condition in order to satisfy linear
  stability and some other non-linear stability requirements like maintaining
  positive solutions. Linear stability analysis can be performed on uniform
  Cartesian grids only, leading to some CFL-type condition which depends on
  wave speed estimates. In practice these conditions are then also used for
  curvilinear grids but they may not be optimal and may require tuning the
  time step for each problem by adding a safety factor. Thus, automatic time
  step selection methods based on some error estimates become very relevant
  for curvilinear grids. Error based time stepping methods are already
  developed for ODE solvers; and by using a method of lines approach to
  convert partial differential equations to a system of ordinary differential
  equations, error-based time stepping schemes of ODE solvers have been
  applied to partial differential equations. The LWFR scheme makes use of a
  Taylor expansion in time of the time averaged flux; by truncating the
  Taylor expansion at one order lower, we can obtain two levels of
  approximation, whose difference is used as a local error indicator to adapt
  the time step. As a consequence the user does not need to specify a CFL
  number, but only needs to give some error tolerances based on which the
  time step is automatically decreased or increased.

  <paragraph|Numerical validation.>The combination of all three developments
  has been tested for many problems in<nbsp>[<reference|bib-babbar2023admissibility>].
  Here, we show two examples.

  In the first example, a hypersonic jet is injected into a uniform medium
  with a Mach number of 2000 relative to the sound speed in the medium. This
  is a cold start problem and thus CFL based scheme will require small CFL
  numbers at the beginning while the error based time stepping automates this
  process. The results with error based time stepping are shown in
  Figure<nbsp><reference|fig:curved.m2000>. In
  Figure<nbsp><reference|fig:curved.m2000>b, we see how the error based time
  stepping uses a small <with|font-shape|italic|effective <math|CFL>> in the
  beginning which later increases and stabilizes.

  <big-figure|<center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/euler2d/m2000_error_based/density_low_res.png|0.38par|||>>|<cell|<image|figures/paper3/euler2d/m2000_error_based/m2000_cfl.pdf|0.45par|||>>>|<row|<cell|(a)
  Density plot>|<cell|(b) Effective <math|<Cs>> /
  CFL>>>>>><label|fig:curved.m2000>|<caption-detailed|Mach 2000 astrophysical
  jet, numerical solution of polynomial degree <math|N=4>. \ |Mach 2000
  astrophysical jet with adaptive time stepping.>>

  In the second example, we demonstrate adaptive mesh refinement for a
  Kelvin-Helmholtz instability to resolve the same scale structures and show
  the results in Figure<nbsp><reference|fig:curved.kh>. It is seen that the
  AMR indicator is tracing the small scale structures well.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/paper3/euler2d/kh/final_soln_lower_res.png|0.46par|||>>|<cell|<image|figures/paper3/euler2d/kh/final_mesh_low_res.png|0.46par|||>>>|<row|<cell|(a)
  Density plot>|<cell|(b) Adaptively refined
  mesh>>>>><label|fig:curved.kh>|<caption-detailed|Kelvin-Helmholtz
  instability at <math|t=3> using polynomial degree
  <math|N=4>.|Kelvin-Helmholtz instability, adaptive mesh and time
  stepping.>>

  <section|LWFR and ADER schemes for linear problems>

  ADER (Arbitrary high order by DERivatives) are another class of schemes
  used for solving time dependent equations in a single stage. There are many
  variants of ADER schemes, and a popularly used one is
  in<nbsp><cite|Dumbser2008>. The idea of<nbsp><cite|Dumbser2008> is to solve
  a locally implicit equation to obtain a space time polynomial approximation
  of the solution, known as the <with|font-shape|italic|predictor solution>.
  The predictor is then used to compute the numerical flux at various time
  levels which is then used to obtain a high order evolution to the next time
  level. Lax-Wendroff schemes are very different from ADER as they rely on an
  explicit Taylor's expansion in time instead of an implicit space-time
  equation. In<nbsp>[<reference|bib-babbar2024equivalence>], we prove, for
  linear problems, the equivalence of the ADER-DG scheme introduced
  in<nbsp><cite|Dumbser2008> with Lax-Wendroff FR (LWFR) using D2 dissipation
  numerical flux introduced in<nbsp>[<reference|bib-babbar2022>]; the key
  observation used is that the space time predictor polynomial can be
  explicitly determined for linear problems. The claim is numerically
  verified in<nbsp>[<reference|bib-babbar2024equivalence>]. This work relates
  two single stage methods which are based on very different ideas and is
  thus a contribution to our understanding of these numerical schemes.

  <section|Admissibility preservation with source terms>

  This work<nbsp>[<reference|bib-babbar2024generalized>] develops
  admissibility preserving LWFR schemes for conservation laws with source
  terms. This work is also a generalization of the admissibility preserving
  framework of our previous work<nbsp>[<reference|bib-babbar2023admissibility>]
  in the sense that admissibility preservation is obtained without using a
  blending limiter. The generalized admissibility preserving framework was
  verified with all the test cases in<nbsp>[<reference|bib-babbar2023admissibility>],
  and additional tests with source terms. The LWFR scheme is extended to
  equations with source terms by including them as time averages. The
  admissibility preservation for source terms is also obtained by introducing
  a limiter for the time averaged sources. The LWFR scheme for source terms
  is numerically verified on various tests with the ten moment problem of gas
  dynamics.

  <section|Advection diffusion equations>

  This work<nbsp>[<reference|bib-babbar2024laxwendroff>] extends the LWFR
  scheme to solve second order time-dependent partial differential equations
  in conservative form. There are many physically relevant equations which
  can be written in this form, like the Navier-Stokes and resistive
  Magnetohydrodynamics equations. The method uses BR1
  scheme<nbsp><cite|Bassi1997> to reduce the system to first order by
  introducing an auxiliary solution variable, say <math|<bq>>, to obtain two
  systems of equations. The idea is to first solve the first system for <bq>
  by performing an FR-type correction on the solution and collocating the
  equation for <math|<bq>> at solution points. The approximate Lax-Wendroff
  procedure is then performed on the second system to obtain the local time
  averaged advective and viscous fluxes. Global approximations of these
  fluxes are constructed by FR correction where the advective flux uses a
  finite volume numerical flux and the diffusive flux uses a central flux.
  The work makes use of the embedded error-based time stepping introduced
  in<nbsp>[<reference|bib-babbar2024curved>] which becomes particularly
  relevant in the absence of a theoretical CFL stability limit for parabolic
  equations. The scheme is verified to show optimal order convergence and
  validated with transonic flow over airfoil and unsteady flow over cylinder
  in<nbsp>[<reference|bib-babbar2024laxwendroff>]. In
  Figure<nbsp><reference|fig:swanson.mesh.mach>, we show the Mach number plot
  of the numerical solution of a transonic flow over an airfoil with Reynolds
  number 500. The results are verified by comparing quantities of interest
  <around*|(|<math|C<rsub|p>,C<rsub|f>,c<rsub|d>,c<rsub|l>>|)> with reference
  data from<nbsp><cite|Swanson_Langer_2016>, shown in
  Figure<nbsp><reference|fig:cp.cf.swanson> and
  Table<nbsp><reference|tab:swanson.forces>.

  <big-figure|<center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/swanson/mesh_zoomed_lower_res.png|0.45par|||>>|<cell|<image|figures/parabolic/swanson/mach_l0_low_res.png|0.45par|||>>>|<row|<cell|(a)
  Mesh>|<cell|(b) Mach number>>>>>><label|fig:swanson.mesh.mach>|<caption-detailed|Transonic
  flow over airfoil with <math|M<rsub|\<infty\>>=0.8>, Reynolds number 500,
  <math|10<rsup|\<circ\>>> angle of attack for numerical solution with
  polynomial degree <math|N=4>. |Mach number plot for transonic flow over an
  airfoil.>>

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/parabolic/swanson/Cp.pdf|0.45par|||>>|<cell|<image|figures/parabolic/swanson/Cf.pdf|0.45par|||>>>|<row|<cell|(a)
  Coefficient of pressure>|<cell|(b) Coefficient of
  friction>>>>><label|fig:cp.cf.swanson>>|<caption-detailed|Transonic flow
  over an airfoil, quantities of interest on surface for numerical solution
  of polynomial degree <math|N=4>.|<math|C<rsub|p>,C<rsub|f>> for transonic
  flow over airfoil.>>

  <big-table|<tabular*|<tformat|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-halign|c>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-halign|c>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-halign|c>|<cwith|1|-1|5|5|cell-rborder|1ln>|<cwith|1|-1|6|6|cell-halign|c>|<cwith|1|-1|6|6|cell-rborder|1ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-bborder|1ln>|<cwith|3|3|1|-1|cell-bborder|1ln>|<table|<row|<cell|>|<cell|<math|c<rsub|d*p>>>|<cell|<math|c<rsub|d*f>>>|<cell|<math|c<rsub|l*p>>>|<cell|<math|c<rsub|l*f>>>|<cell|<math|c<rsub|l*p>>+<math|c<rsub|l*f>>>>|<row|<cell|LWFR>|<cell|0.1467>|<cell|0.1242>|<cell|0.4416>|<cell|-0.0043>|<cell|0.4373>>|<row|<cell|Reference>|<cell|0.1475>|<cell|0.1275>|<cell|-->|<cell|-->|<cell|0.4363>>>>><label|tab:swanson.forces>|<caption-detailed|Transonic
  flow over an airfoil compared with data
  from<nbsp><cite|Swanson_Langer_2016> for numerical solution of degree
  <math|N=4>.|Transonic flow over an airfoil compared with data from Swanson,
  Langer (2016).>>

  <section|Multiderivative Runge-Kutta>

  Lax-Wendroff schemes perform a Taylor's expansion in time to the order of
  the desired accuracy and compute the temporal derivatives locally.
  Multiderivative Runge-Kutta (MDRK) schemes also make use of temporal
  derivatives but they combine them with multiple stages to obtain the
  desired order of accuracy. As MDRK schemes use both temporal derivatives
  and multiple stages, they are a generalization of LW and standard
  multistage RK methods. MDRK methods typically require fewer temporal
  derivatives in contrast to the Lax-Wendroff schemes and fewer stages in
  contrast to the standard RK methods, which is what makes them promising.
  In<nbsp>[<reference|bib-babbar2024multiderivative>], we proposed the first
  multiderivative Runge-Kutta scheme in a Flux Reconstruction framework to
  solve hyperbolic conservation laws. The idea is to cast the fourth order
  multi-derivative Runge-Kutta scheme of<nbsp><cite|li2016> in an update
  where each stage uses time averaged flux approximations and the approximate
  Lax-Wendroff procedure is applied within each stage. The works done
  in<nbsp>[<reference|bib-babbar2022>, <reference|bib-babbar2023admissibility>]
  are applied to each stage of MDRK. Thus, numerical flux has been
  constructed with D2 dissipation and <evaluate> scheme to enhance accuracy
  and stability. Admissibility preserving blending limiter performing
  MUSCL-Hancock on subcells is also developed showing good accuracy like
  in<nbsp>[<reference|bib-babbar2023admissibility>]. The numerical scheme is
  validated with even tougher tests than in the previous works, taken
  from<nbsp><cite|Pan2016>.<new-page>

  <section|List of publications><label|sec:publications>

  <paragraph|Published>

  <bibitem*|P1><label|bib-babbar2022>Arpit Babbar, Sudarshan<nbsp>Kumar
  Kenettinkara<localize|, and >Praveen Chandrashekar. <newblock>Lax-wendroff
  flux reconstruction method for hyperbolic conservation laws.
  <newblock><with|font-shape|italic|Journal of Computational Physics>,
  <localize|page >111423, 2022.<newblock>
  <hlink|https://doi.org/10.1016/j.jcp.2022.111423|https://doi.org/10.1016/j.jcp.2022.111423>,
  <hlink|https://arxiv.org/abs/2207.02954|https://arxiv.org/abs/2207.02954>

  <bibitem*|P2><label|bib-babbar2023admissibility>Arpit Babbar,
  Sudarshan<nbsp>Kumar Kenettinkara<localize|, and >Praveen Chandrashekar.
  <newblock>Admissibility preserving subcell limiter for lax-wendroff flux
  reconstruction, <with|font-shape|italic|Journal of Scientific Computing>,
  Volume 99, 2024. <hlink|https://doi.org/10.1007/s10915-024-02482-9|https://doi.org/10.1007/s10915-024-02482-9>,
  <hlink|https://doi.org/10.48550/arXiv.2305.10781|https://doi.org/10.48550/arXiv.2305.10781>

  <paragraph|Preprints submitted>

  <bibitem*|P3><label|bib-babbar2024curved>Arpit Babbar<localize| and
  >Praveen Chandrashekar. <newblock>Lax-wendroff flux reconstruction on
  adaptive curvilinear meshes with error based time stepping for hyperbolic
  conservation laws. <newblock>2024. <hlink|https://arxiv.org/abs/2402.11926|https://arxiv.org/abs/2402.11926>

  <bibitem*|P4><label|bib-babbar2024equivalence>Arpit Babbar<localize| and
  >Praveen Chandrashekar. <newblock>Equivalence of ADER and Lax-Wendroff in
  DG/FR framework for linear problems. <newblock>2024.<newblock>
  <hlink|https://arxiv.org/abs/2402.18937|https://arxiv.org/abs/2402.18937>

  <bibitem*|P5><label|bib-babbar2024generalized>Arpit Babbar<localize| and
  >Praveen Chandrashekar. <newblock>Generalized framework for admissibility
  preserving lax-wendroff flux reconstruction for hyperbolic conservation
  laws with source terms. <newblock>2024.<newblock>
  <hlink|https://arxiv.org/abs/2402.01442|https://arxiv.org/abs/2402.01442>

  <bibitem*|P6><label|bib-babbar2024laxwendroff>Arpit Babbar<localize| and
  >Praveen Chandrashekar. <newblock>Lax-Wendroff Flux Reconstruction for
  advection-diffusion equations with error-based time stepping.
  <newblock>2024.<newblock> <hlink|https://arxiv.org/abs/2402.12669|https://arxiv.org/abs/2402.12669>

  <paragraph|Preprints>

  <bibitem*|P7><label|bib-babbar2024multiderivative>Arpit Babbar<localize|
  and >Praveen Chandrashekar. <newblock>Multi-Derivative Runge-Kutta Flux
  Reconstruction for hyperbolic conservation laws. <newblock>2024.<newblock>
  <hlink|https://arxiv.org/abs/2403.02141|https://arxiv.org/abs/2403.02141>

  <paragraph|Conference presentations>

  <aligned-timeline|\<bullet\> >Arpit Babbar, Praveen Chandrashekar,
  ``Error-based time stepping schemes for Lax-Wendroff Flux Reconstruction\Q,
  <with|font-shape|italic|Indo-German Conference on Computational
  Mathematics>, February 2023, IISc, Bangalore.

  <aligned-timeline|\<bullet\> >Arpit Babbar, Praveen Chandrashekar,
  ``Embedded error-based time stepping for Lax-Wendroff Flux Reconstruction
  for compressible flows\Q, <with|font-shape|italic|ICOSAHOM>, 14-18 August,
  2023, Seoul, Korea.

  <aligned-timeline|\<bullet\> >Arpit Babbar, Praveen Chandrashekar,
  Sudarshan Kumar Kenettinkara, ``Admissibility preserving subcell limiter
  for Lax-Wendroff flux reconstruction\Q, <with|font-shape|italic|ICOSAHOM>,
  14-18 August, 2023, Seoul, Korea.

  <aligned-timeline|\<bullet\> >Arpit Babbar, Praveen Chandrashekar,
  Sudarshan Kumar Kenettinkara, ``Domain-invariant subcell-based blending
  limiter for Lax-Wendroff Flux Reconstruction\Q,
  <with|font-shape|italic|ICIAM> August 20-25, 2023, Waseda Univ., Tokyo,
  Japan.<new-page>

  <\bibliography|bib|tm-plain|references>
    <\bib-list|11>
      <bibitem*|1><label|bib-Bassi1997>F.<nbsp>Bassi<localize| and
      >S.<nbsp>Rebay. <newblock>A high-order accurate discontinuous finite
      element method for the numerical solution of the compressible
      navier\Ustokes equations. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 131(2):267\U279, 1997.<newblock>

      <bibitem*|2><label|bib-Berthon2006>Christophe Berthon. <newblock>Why
      the MUSCL\UHancock scheme is l1-stable.
      <newblock><with|font-shape|italic|Numerische Mathematik>,
      104(1):27\U46, jun 2006.<newblock>

      <bibitem*|3><label|bib-Dumbser2008>Michael Dumbser,
      Dinshaw<nbsp>S.<nbsp>Balsara, Eleuterio<nbsp>F.<nbsp>Toro<localize|,
      and >Claus-Dieter Munz. <newblock>A unified framework for the
      construction of one-step finite volume and discontinuous Galerkin
      schemes on unstructured meshes. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 227(18):8209\U8253, sep 2008.<newblock>

      <bibitem*|4><label|bib-hennemann2021>Sebastian Hennemann,
      Andrés<nbsp>M.<nbsp>Rueda-Ramírez, Florian<nbsp>J.<nbsp>Hindenlang<localize|,
      and >Gregor<nbsp>J.<nbsp>Gassner. <newblock>A provably entropy stable
      subcell shock capturing approach for high order split form dg for the
      compressible euler equations. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 426:109935, 2021.<newblock>

      <bibitem*|5><label|bib-Kopriva2006>David<nbsp>A.<nbsp>Kopriva.
      <newblock>Metric identities and the discontinuous spectral element
      method on curvilinear meshes. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 26(3):301\U327, 2006.<newblock>

      <bibitem*|6><label|bib-li2016>Jiequan Li<localize| and >Zhifang Du.
      <newblock>A two-stage fourth order time-accurate discretization for
      lax\Uwendroff type flow solvers i. hyperbolic conservation laws.
      <newblock><with|font-shape|italic|SIAM Journal on Scientific
      Computing>, 38(5):0, 2016.<newblock>

      <bibitem*|7><label|bib-Pan2016>Liang Pan, Jiequan Li<localize|, and
      >Kun Xu. <newblock>A few benchmark test cases for higher-order euler
      solvers. <newblock><with|font-shape|italic|Numerical Mathematics:
      Theory, Methods and Applications>, 10:0, 09 2016.<newblock>

      <bibitem*|8><label|bib-Qiu2003>Jianxian Qiu<localize| and >Chi-Wang
      Shu. <newblock>Finite Difference WENO Schemes with Lax\UWendroff-Type
      Time Discretizations. <newblock><with|font-shape|italic|SIAM Journal on
      Scientific Computing>, 24(6):2185\U2198, jan 2003.<newblock>

      <bibitem*|9><label|bib-Swanson_Langer_2016>R.<nbsp>C.<nbsp>Swanson<localize|
      and >S.<nbsp>Langer. <newblock>Steady-state laminar flow solutions for
      naca 0012 airfoil. <newblock><with|font-shape|italic|Computers &
      Fluids>, 126(Supplement C):102\U128, mar 2016.<newblock>

      <bibitem*|10><label|bib-Zhang2010b>Xiangxiong Zhang<localize| and
      >Chi-Wang Shu. <newblock>On maximum-principle-satisfying high order
      schemes for scalar conservation laws.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      229(9):3091\U3120, may 2010.<newblock>

      <bibitem*|11><label|bib-Zorio2017>D.<nbsp>Zorío,
      A.<nbsp>Baeza<localize|, and >P.<nbsp>Mulet. <newblock>An Approximate
      Lax\UWendroff-Type Procedure for High Order Accurate Schemes for
      Hyperbolic Conservation Laws. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 71(1):246\U273, apr 2017.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|page-even|0.9in>
    <associate|page-medium|paper>
    <associate|page-odd|0.9in>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-10|<tuple|6|8>>
    <associate|auto-11|<tuple|7|8>>
    <associate|auto-12|<tuple|5|9>>
    <associate|auto-13|<tuple|6|9>>
    <associate|auto-14|<tuple|7|9>>
    <associate|auto-15|<tuple|8|10>>
    <associate|auto-16|<tuple|9|10>>
    <associate|auto-17|<tuple|1|10>>
    <associate|auto-18|<tuple|8|11>>
    <associate|auto-19|<tuple|9|12>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-20|<tuple|4|13>>
    <associate|auto-3|<tuple|1|3>>
    <associate|auto-4|<tuple|3|4>>
    <associate|auto-5|<tuple|2|5>>
    <associate|auto-6|<tuple|3|5>>
    <associate|auto-7|<tuple|4|6>>
    <associate|auto-8|<tuple|5|6>>
    <associate|auto-9|<tuple|4|7>>
    <associate|bib-Bassi1997|<tuple|1|13>>
    <associate|bib-Berthon2006|<tuple|2|13>>
    <associate|bib-Dumbser2008|<tuple|3|13>>
    <associate|bib-Kopriva2006|<tuple|5|13>>
    <associate|bib-Pan2016|<tuple|7|13>>
    <associate|bib-Qiu2003|<tuple|8|13>>
    <associate|bib-Swanson_Langer_2016|<tuple|9|13>>
    <associate|bib-Zhang2010b|<tuple|10|13>>
    <associate|bib-Zorio2017|<tuple|11|13>>
    <associate|bib-babbar2022|<tuple|P1|12>>
    <associate|bib-babbar2023admissibility|<tuple|P2|12>>
    <associate|bib-babbar2024curved|<tuple|P3|12>>
    <associate|bib-babbar2024equivalence|<tuple|P4|12>>
    <associate|bib-babbar2024generalized|<tuple|P5|12>>
    <associate|bib-babbar2024laxwendroff|<tuple|P6|12>>
    <associate|bib-babbar2024multiderivative|<tuple|P7|12>>
    <associate|bib-hennemann2021|<tuple|4|13>>
    <associate|bib-li2016|<tuple|6|13>>
    <associate|fig:blast.chblend|<tuple|4|6>>
    <associate|fig:cp.cf.swanson|<tuple|9|10>>
    <associate|fig:curved.kh|<tuple|7|8>>
    <associate|fig:curved.m2000|<tuple|6|8>>
    <associate|fig:dmr|<tuple|5|6>>
    <associate|fig:ea.illustration|<tuple|1|3>>
    <associate|fig:general.grid|<tuple|3|5>>
    <associate|fig:subcells|<tuple|2|5>>
    <associate|fig:swanson.mesh.mach|<tuple|8|10>>
    <associate|sec:paper1|<tuple|2|2>>
    <associate|sec:publications|<tuple|9|12>>
    <associate|tab:swanson.forces|<tuple|1|10>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Dumbser2008

      Qiu2003

      Zorio2017

      Qiu2003

      Dumbser2008

      Zhang2010b

      hennemann2021

      hennemann2021

      hennemann2021

      Berthon2006

      Zhang2010b

      hennemann2021

      hennemann2021

      Kopriva2006

      Kopriva2006

      Dumbser2008

      Dumbser2008

      Dumbser2008

      Bassi1997

      Swanson_Langer_2016

      Swanson_Langer_2016

      li2016

      Pan2016
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Methods of
      computing central part of Lax-Wendroff numerical
      flux>|<pageref|auto-3>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2>|>
        Subcells used by lower order scheme for degree
        <with|mode|<quote|math>|N=4>.
      </surround>|<pageref|auto-5>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||A general
      non-uniform, non-cell-centered finite volume grid>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4>|>
        Comparing TVB and blending schemes on blast wave.
      </surround>|<pageref|auto-7>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5>|>
        Double Mach reflection with LW-MH.
      </surround>|<pageref|auto-8>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6>|>
        Mach 2000 astrophysical jet with adaptive time stepping.
      </surround>|<pageref|auto-10>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7>|>
        Kelvin-Helmholtz instability, adaptive mesh and time stepping.
      </surround>|<pageref|auto-11>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8>|>
        Mach number plot for transonic flow over an airfoil.
      </surround>|<pageref|auto-15>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9>|>
        <with|mode|<quote|math>|C<rsub|p>,C<rsub|f>> for transonic flow over
        airfoil.
      </surround>|<pageref|auto-16>>
    </associate>
    <\associate|table>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|1>|>
        Transonic flow over an airfoil compared with data from Swanson,
        Langer (2016).
      </surround>|<pageref|auto-17>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|1.<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|2.<space|2spc>Lax-Wendroff
      Flux Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|3.<space|2spc>Admissibility
      preserving subcell limiter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|4.<space|2spc>Adaptive,
      curvilinear grids with error-based time stepping>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|5.<space|2spc>LWFR
      and ADER schemes for linear problems>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-12><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|6.<space|2spc>Admissibility
      preservation with source terms> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-13><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|7.<space|2spc>Advection
      diffusion equations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-14><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|8.<space|2spc>Multiderivative
      Runge-Kutta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-18><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|9.<space|2spc>List
      of publications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-19><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-20><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>