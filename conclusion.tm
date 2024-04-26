<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|preview-ref|comment|style_common>>

<\body>
  <chapter|Conclusions>

  A conservative, Jacobian-free and single step, explicit Lax-Wendroff method
  has been constructed in flux reconstruction context. The Jacobian free
  property is achieved by using the approximate Lax-Wendroff procedure,
  leading to a procedure where the scheme only requires the specification of
  physical flux and numerical flux. Special attention was paid to
  construction of numerical flux; the dissipative part of the numerical flux
  was computed with the time averaged solution (called D2 dissipation)
  leading to an upwind flux in the linear case and improved CFL numbers at no
  additional computational cost. The scheme with D2 dissipation is proven to
  be equivalent to ADER schemes for linear problems. The central part of the
  Lax-Wendroff numerical flux was computed by performing the approximate
  Lax-Wendroff procedure at the faces (<evaluate> scheme) rather than using
  the extrapolated time averaged flux from solution points (<extrapolate>
  scheme). It was observed that the <evaluate> scheme improved accuracy of
  the LWFR scheme and some tests showed optimal order of convergence only
  with the <evaluate> scheme. The development of various numerical fluxes
  like HLL, HLLC and Roe for the LWFR scheme with the improvements was made.
  The new scheme and its benefits were validated by performing convergence
  analysis, analyzing error and energy growth, and various test cases on
  compressible Euler's equations.

  A subcell based shock capturing blending scheme was introduced for LWFR
  based on<nbsp><cite|hennemann2021>. The idea was to construct a robust low
  order scheme on subcells and blend it with the high order LWFR scheme using
  a smoothness indicator. To enhance accuracy, we used Gauss-Legendre
  solution points and performed MUSCL-Hancock reconstruction on the subcells.
  Since the subcells were inherently non-cell centred, the MUSCL-Hancock
  scheme was extended to non-cell centred grids along with the proof
  of<nbsp><cite|Berthon2006> for admissibility preservation. The subcell
  structure was exploited to obtain a provably admissibility preserving LWFR
  scheme by careful construction of the <with|font-shape|italic|blended
  numerical flux> at the element interfaces. The procedure for enforcing
  admissibility only requires the user to specify what the admissibility
  constraints of the equation are, and the process is problem independent
  beyond that. The numerical experiments were made on Compressible Euler's
  equations verifying the enhancement of accuracy and admissibility
  preservation.

  A generalized framework for admissibility preservation was introduced by
  performing a cell average decomposition followed by flux limiting,
  extending the positivity limiter of Zhang and Shu to Lax-Wendroff schemes.
  The scheme was extended to handle source terms by constructing time average
  source terms. Provable admissibility was also obtained for the extension by
  introducing a limiter for the time average sources. The scheme with source
  terms was validated using the ten moment problem of gas dynamics with tests
  for accuracy and robustness.

  The multiderivative Runge-Kutta (MDRK) method of Li and
  Du<nbsp><cite|li2016> was written as an evolution involving time average
  fluxes in both stages. This allowed us to apply approximate Lax-Wendroff
  procedure to each stage and obtain an MDRK scheme in Flux Reconstruction
  framework. The key developments made for LWFR, namely D2 dissipation,
  <evaluate> scheme and blending limiter were applied to each stage. This
  gave us an MDRK scheme with improved stability, robustness and provable
  admissibility preservation. The scheme was validated on the modern test
  suite of<nbsp><cite|Pan2016> for high order methods.

  The LWFR scheme was extended to handle body fitted, adaptively refined
  curvilinear meshes. The curvilinear grids were defined by a reference map
  for each element which was used to apply the Lax-Wendroff procedure in
  reference coordinates. The adaptively refined mesh was allowed to be
  nonconformal and Mortar element method for LWFR was developed to obtain a
  scheme that was conservative, admissibility and free stream preserving. A
  Fourier stability analysis does not apply to such meshes and hence an error
  based time stepping method was developed for LWFR. A performance comparison
  between error based time stepping and CFL based time was made and, even
  with less fine tuning, the error based time stepping gave superior
  performance. The extension is validated by performing tests for Euler's
  equations on curvilinear grids.

  The scheme was also extended to second order equations in conservative form
  by using the BR1 scheme, along with capability to handle curvilinear meshes
  and error based time stepping. The extension is validated with convergence
  analysis and various standard tests for Navier-Stokes equations like lid
  driven cavity and flow over cylinder and airfoil.

  <section|Future scope>

  There are several extensions possible for this work:

  <\enumerate>
    <item>This work is restricted to partial differential equations in
    conservative form. There are many practical hyperbolic problems like
    shear shallow water equations which contain
    <with|font-shape|italic|non-conservative products> and are usually solved
    with path conservative schemes that satisfy
    <with|font-shape|italic|generalized Rankine-Hugoniot> conditions. There
    are already Runge-Kutta Discontinuous Galerkin methods that can solve
    non-conservative hyperbolic equations and thus development of high order
    Lax-Wendroff schemes for such problems will be an important area of
    research. Flux reconstruction cannot be applied on such systems but we
    can possibly use correction functions <math|g<rsub|L>,g<rsub|R>> to
    obtain a quadrature free scheme.

    <item>The LWFR scheme has been developed to explicitly handle source
    terms while maintaining high order accuracy. This explicit treatment
    imposes additional conditions on time step size for stability of the
    scheme. Stiff source terms are those which impose a time step restriction
    that is more severe than the CFL restriction from the wave speeds. They
    occur in a variety of problems like those involving chemical reactions.
    The time step restriction by the source terms can be avoided by adding
    local implictness to the source terms. This is the idea of IMEX schemes.
    The development of such locally implicit solvers for LWFR on source terms
    that maintain high order accuracy will be an important area of research.

    <item>We made a comparison of accuracy between Gauss-Legendre (GL) and
    Gauss-Legendre-Lobatto (GLL) solution points which showed us the superior
    accuracy of the former. Another accuracy improvement that we could make
    was the development of a blending scheme that performs MUSCL-Hancock
    reconstruction on subcells. These accuracy improvements were only applied
    to problems on Cartesian meshes and their extension can be made to
    curvilinear meshes.

    <item>The multiderivative Runge-Kutta scheme in Flux Reconstruction form
    was only developed for Cartesian meshes and its extension to adaptively
    refined curvilinear meshes with error based time stepping should be
    possible.

    <item>The subcell based blending limiter was developed to add dissipation
    to inviscid problems. However, there are many advection-diffusion
    problems that require additional dissipation especially for underresolved
    flows. Thus, it is practical to develop a subcell based blending scheme
    for such problems. This involves development of a low order scheme on
    subcells that can solve advection diffusion equations.

    <item>The description of LWFR scheme on curvilinear grids was dimension
    dependent and can thus be applied to 3-D. However, its numerical
    validation with practical problems to test accuracy, robustness and free
    stream conditions needs to be performed.

    <item>This work most generally applies quadrilateral meshes even though
    triangular meshes are also attractive due to availability of better mesh
    generation algorithms. Thus, the extension of LWFR to triangular and
    hybrid meshes will be fruitful.
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|9>
    <associate|font-base-size|12>
    <associate|page-even|1in>
    <associate|page-first|225>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|section-nr|5>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|10|225>>
    <associate|auto-2|<tuple|10.1|226>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      hennemann2021

      Berthon2006

      li2016

      Pan2016
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|10.<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      10.1.<space|2spc>Future scope <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>
    </associate>
  </collection>
</auxiliary>