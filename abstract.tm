<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|preview-ref|comment|style_common>>

<\body>
  <chapter*|Abstract>

  The Lax-Wendroff (LW) method is a single step method for evolving time
  dependent solutions governed by partial differential equations, in contrast
  to Runge-Kutta (RK) methods that need multiple stages per time step. We
  develop a Lax-Wendroff Flux Reconstruction (LWFR) method in combination
  with a Jacobian-free Lax-Wendroff procedure that is applicable to general
  hyperbolic conservation laws. The numerical flux is carefully constructed -
  a D2 dissipation scheme is introduced improving CFL numbers and <evaluate>
  scheme which improves accuracy for nonlinear problems.

  We develop a subcell based limiter by blending LWFR with a lower order
  scheme, either first order finite volume or MUSCL-Hancock scheme. While the
  blending with a lower order scheme supresses spurious oscillations, it may
  not guarantee admissibility of discrete solution, e.g., positivity property
  of quantities like density and pressure. By exploiting the subcell
  structure and admissibility of lower order schemes, we devise a strategy to
  ensure that the blended scheme is admissibility preserving for the mean
  values and then use a scaling limiter to obtain admissibility of the
  polynomial solution. For MUSCL-Hancock scheme on non-cell-centered
  subcells, we develop a slope limiter, time step restrictions and suitable
  blending of higher order fluxes, that ensures admissibility of lower order
  updates and hence that of the cell averages. By using the MUSCL-Hancock
  scheme on subcells and Gauss-Legendre points in flux reconstruction, we
  improve small-scale resolution compared to the subcell-based RKDG blending
  scheme with first order finite volume method and Gauss-Legendre-Lobatto
  points.

  We propose a generalized admissibility framework by performing a cell
  average decomposition of LWFR. The decomposition is similar to the one used
  in the admissibility preserving framework of Zhang and Shu. By performing a
  flux limiting of the time averaged numerical flux, the decomposition is
  used to obtain an admissibility preserving LWFR scheme. The admissibility
  preservation framework is further extended to conservation laws with source
  terms.

  Multiderivative Runge-Kutta methods generalize LW and RK as they use
  multiple stages and LW procedure on each stage. We extend the fourth order,
  two stage Multi-Derivative Runge Kutta (MDRK) scheme of Li, Du to FR by
  writing both of the stages in terms of a time averaged flux and then use
  the approximate Lax-Wendroff procedure. The developments made for LWFR
  apply to MDRK by using them at each stage. Thus, accuracy and stability is
  improved by <evaluate> scheme and D2 dissipation. An admissibility
  preserving blending scheme is developed for MDRK.

  We extend the LWFR scheme to solve conservation laws on curvilinear meshes
  with adaptive mesh refinement (AMR). It is proven that the proposed
  extension of LWFR scheme to curvilinear grids preserves constant solution
  (free stream preservation) under the standard metric identities. For
  curvilinear meshes, linear Fourier stability analysis cannot be used to
  obtain an optimal CFL number. Thus, an embedded-error based time step
  computation method is proposed for LWFR method which reduces fine-tuning
  process required to select a stable CFL number using the wave speed based
  time step computation. By using the BR1 scheme, LWFR on curvilinear meshes
  is also applied to second order equations in conservative form.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|0>
    <associate|font-base-size|12>
    <associate|page-even|1in>
    <associate|page-first|19>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|19>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>