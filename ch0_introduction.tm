<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    <assign|correction|<macro|1|<with|color|red|<arg|1>>>>
  </hide-preamble>

  <chapter|Introduction>

  Hyperbolic conservation laws arise as models of physical systems
  representing conservation of mass, momentum, and energy. They are routinely
  solved for applications like Computational Fluid Dynamics (CFD),
  astrophysics and weather modeling. Thus, development of efficient numerical
  methods for solving these equations is crucial. The current state of
  memory-bound HPC hardware<nbsp><cite|attig2011|subcommittee2014> makes a
  strong case for development of high order discrete methods. By
  incorporating more higher order terms, these methods can achieve greater
  numerical accuracy per degree of freedom while minimizing memory usage and
  data transfers. In particular, high order methods have higher arithmetic
  intensity and are thus less likely to be memory-bound. The superior
  accuracy, efficiency, and higher resolution of these methods also make them
  a good fit for LES (Large Eddy Simulation) and DNS (Direct Numerical
  Simulation) of turbulent flows, especially with unsteady vortices. Spectral
  element methods like Flux Reconstruction (FR)<nbsp><cite|Huynh2007> and
  Discontinuous Galerkin (DG)<nbsp><cite|cockburn2000> are high order methods
  that have been successful in resolving advection-dominated
  flows<nbsp><cite|witherden2014|Ranocha2022>. The neighbouring FR/DG
  elements are coupled only through the numerical flux and thus bulk of
  computations are local to the element, minimizing data transfers.

  In comparison to traditional semi-discrete FR/DG schemes, which
  <assign|Fq|<macro|<wide|F|~>>>mainly use Runge-Kutta (RK) time integration,
  this work makes developments for Lax-Wendroff Flux Reconstruction (LWFR)
  which is a spectral element solver for time dependent PDE that performs
  high order evolution to the next time level in a single stage. The single
  stage nature implies fewer applications of shock capturing and positivity
  limiters, saving computational computation. Moreover, fewer stages minimize
  the interelement communication<nbsp><cite|Dumbser2018>, making the method a
  good fit for the modern hardware. There are also some order barriers in RK
  methods in the sense that at high orders, we need more stages than the
  order of the method. The LWFR method uses a Taylor series expansion in time
  and there is no order barrier as any order of accuracy can be reached by
  performing Taylor's expansion to the same and its single stage nature makes
  it more efficient than RK schemes<nbsp><cite|Qiu2005b>.

  In Sections<nbsp><reference|sec:intro.lw>,<nbsp><reference|sec:intro.fr>,
  we do a literature review of Lax-Wendroff and Flux Reconstruction schemes
  respectively. In Section<nbsp><reference|sec:intro.shock.capturing>, we
  review various limiters/shock capturing techniques used for high order
  methods in the literature. Section<nbsp><reference|sec:intro.contri> gives
  an overview of the contributions made in this thesis and
  Section<nbsp><reference|sec:intro.outline> gives an outline of the
  subsequent chapters.

  <section|Lax-Wendroff><label|sec:intro.lw>

  In the context of hyperbolic conservation laws, the Lax-Wendroff (LW) time
  discretization in conjunction with a wide range of spatial schemes were
  extensively studied in the literature. These temporal schemes are
  essentially based on the classical second-order Lax-Wendroff
  method<nbsp><cite|Lax1960>. The Lax-Wendroff temporal discretization,
  originally referred to as Taylor-Galerkin method, was used in the
  continuous finite element spatial schemes by Safian et
  al.<nbsp><cite|Safjan1995> and Tabarrok et al.<nbsp><cite|Tabarrok1994>,
  followed by further improvements in<nbsp><cite|Youn1995>. The case of
  discontinuous finite element spatial schemes was studied
  in<nbsp><cite|Choe1991|Choe1992>. All these methods are confined to a
  certain order of accuracy in both space and time. In the finite difference
  framework, the LW time discretization was originally proposed by Qui and
  Shu<nbsp><cite|Qiu2003> with the WENO approximation of spatial
  derivatives<nbsp><cite|Shu1989>. As an extension to this, a combination
  with alternative WENO method was developed in<nbsp><cite|Jiang2013>. The
  discontinuous Galerkin spatial discretization combined with the LW temporal
  scheme was originally proposed in<nbsp><cite|Qiu2003|Qiu2005b> (abbreviated
  as LWDG) with an advantage of having arbitrary order of accuracy in both
  space and time, in other words, with no theoretical order barrier. It was
  further studied in<nbsp><cite|Qiu2007>, where the performance of various
  numerical fluxes were analyzed for the Euler equations of compressible
  flaws. It is observed that the LWDG schemes are more compact and cost
  effective for certain problems like the two dimensional Euler system of
  compressible gas dynamics, especially when nonlinear limiters are applied.
  In<nbsp><cite|Guo2015> it is found that the LWDG method
  of<nbsp><cite|Qiu2005b> need not exhibit the super-convergence property. In
  order to overcome this issue, a modified version of LWDG was
  proposed<nbsp><cite|Guo2015> using the local DG framework of Cockburn et
  al.<nbsp><cite|Cockburn1998a>. The resulting scheme was found to satisfy
  the super-convergence property. For linear conservation laws the stability
  and accuracy properties of LWDG scheme are explored in<nbsp><cite|Sun2017>
  with the modified LWDG scheme of Guo et al.<nbsp><cite|Guo2015>.

  Another significant contribution towards the single step temporal
  discretization was made by Toro et al., initially for linear equations
  in<nbsp><cite|Toro2001> and for nonlinear systems
  in<nbsp><cite|Titarev2002>, following the idea of generalized Riemann
  problem (GRP)<nbsp><cite|Artzi2006|Han2010>. These are widely known as
  arbitrary high order derivative (ADER) methods. Though their inception was
  in the finite volume spatial setup, later they were extended to finite
  difference and discontinuous Galerkin frameworks<nbsp><cite|Dumbser2006>.
  In the sequel, several authors have contributed to this approach with the
  aim of shaping up a compact single time step scheme,
  see<nbsp><cite|Titarev2005|Kaser2005|Dumbser2007|Castro2008> and references
  therein. In the flavour of ADER methods, Dumbser et al. proposed an
  efficient DG spatial solver in<nbsp><cite|Dumbser2008> and a finite
  difference WENO spatial solver in<nbsp><cite|Dumbser2008a>. These are
  compact schemes that replace the so called Cauchy-Kowalevski procedure in
  the original ADER scheme with an element local space-time Galerkin
  predictor step and a discontinuous Galerkin corrector step, which are also
  found to be suitable for stiff source terms and further studied by Gassner
  et al. in<nbsp><cite|Gassner2011a>. These methods have been extended to the
  divergence free MHD problems with a finite volume WENO spatial scheme
  in<nbsp><cite|Balsara2009a>. Through a modification of the method
  in<nbsp><cite|Dumbser2008|Gassner2011a>, Guthrey et al.
  in<nbsp><cite|Guthrey2019> proposed a regionally implicit ADER
  discontinuous Galerkin solver which is stable for higher CFL numbers. A
  simplified Cauchy-Kowalevski procedure is developed
  in<nbsp><cite|Montecinos2020> which is efficient, easier to implement for
  any system and can be used in ADER type schemes.

  The generic versions of LWDG and ADER methods require the computation of
  high-order flux derivatives for each hyperbolic system and may require the
  use of symbolic manipulation software to perform the algebra. At higher
  orders of accuracy, we need higher order derivatives which needs the
  computation of flux Jacobian and other higher order tensors. This increases
  the computational task and the process has to be performed for each PDE
  system. In order to overcome this difficulty, an approximation procedure
  was originally developed in<nbsp><cite|Zorio2017> in the finite difference
  scenario and further studied by several other
  authors<nbsp><cite|Lee2021|Burger2017|Carrillo2021|Carrillo2021a>. These
  approximation procedures for LW type solvers are found to be
  computationally more efficient and easier in implementation. As a single
  time step method, the resulting schemes are efficient for solving
  hyperbolic conservation laws. Moreover, it is independent of the specific
  form of flux function in the governing equation as it is free from Jacobian
  and other higher version of derivatives.

  <section|Flux Reconstruction><label|sec:intro.fr>

  Discontinuous Galerkin (DG) is a Spectral Element Method first introduced
  by Reed and Hill<nbsp><cite|reed1973> for neutron transport equations and
  developed for fluid dynamics equations by Cockburn and Shu and
  others<nbsp><cite|cockburn2000>. The DG method uses an approximate solution
  which is a polynomial within each element and is allowed to be
  discontinuous across interfaces. The neighbouring DG elements are coupled
  only through the numerical flux and thus bulk of computations are local to
  the element, minimizing data transfers.

  The Flux Reconstruction (FR) method<nbsp><cite|Huynh2007> is a class of
  discontinuous Spectral Element Methods for the discretization of
  conservation laws. FR methods utilize a nodal basis which is usually based
  on some solution points like Gauss points, to approximate the solution with
  piecewise polynomials. The main idea is to construct a continuous
  approximation of the flux utilizing a numerical flux at the cell interfaces
  and a correction function. The solution at the nodes is then updated by a
  collocation scheme in combination with a Runge-Kutta method. The choice of
  the correction function affects the accuracy and stability of the method;
  by properly choosing the correction function and solution points, FR method
  can be shown to be equivalent to some discontinuous Galerkin and spectral
  difference schemes, as shown in<nbsp><cite|Huynh2007|Trojak2021>.
  In<nbsp><cite|Vincent2011a>, linear stability analysis of FR is performed
  through a broken Sobolev norm, leading to a 1-parameter family of
  correction functions which encompasses the stable correction functions
  found in<nbsp><cite|Huynh2007>. The family of stable correction functions
  has been extended in<nbsp><cite|Vincent2015|Trojak2021>,
  see<nbsp><cite|Trojak2021> for a review. For the 1-parameter family of
  correction functions in<nbsp><cite|Vincent2011a>, non-linear stability for
  E-fluxes was studied in<nbsp><cite|Jameson2012> where the significance of
  solution points was pointed out, with Gauss-Legendre points being the most
  resistant to aliasing driven instabilities. In another study on accuracy
  with different choices of solution points<nbsp><cite|Witherden2021>, the
  optimality of Gauss-Legendre points was again observed. In the more recent
  works of<nbsp><cite|Cicchino2022a|Cicchino2022>, a nonlinearly stable FR
  scheme was constructed in split form where a key idea was application of
  correction functions to the volume terms. The long term error behaviour of
  FR schemes has been studied in<nbsp><cite|Offner2019|Abgrall2020>, while
  dispersion and dissipation errors have been analyzed
  in<nbsp><cite|Vincent2011|Asthana2015|Vermeire2017>. The Flux
  Reconstruction scheme has been used on curvilinear
  grids<nbsp><cite|witherden2014|Abe2015|Cicchino2022>. The development of
  Flux Reconstruction on curvilinear grids is primarily based on its
  equivalence with the DG scheme; see<nbsp><cite|Kopriva2006|kopriva2010> for
  the DG scheme on curvilinear grids. Thus, the study of free stream
  conditions for the FR scheme on curvilinear grids are the same as
  in<nbsp><cite|Kopriva2006>. The computationally efficient performance of FR
  has been noted in<nbsp><cite|Vincent2016|Lopez2014|Vandenhoeck2019>, which
  is attributed to the structured computation of finite element methods
  suitable for modern hardware<nbsp><cite|Vincent2016>. The quadrature-free
  nature of FR methods together with the ability to cast the operations as
  matrix-vector operations that can be performed efficiently using optimized
  BLAS kernels makes these methods ideal for use on modern vector
  processors<nbsp><cite|Vincent2016>.

  <section|Shock capturing and admissibility preservation of FR
  schemes><label|sec:intro.shock.capturing>

  Despite the high accuracy of high order methods, lower order methods are
  still routinely applied in practical applications, in part due to their
  robustness. Solutions to hyperbolic conservation laws contain shocks in
  many cases and it is well known that high order schemes produce spurious
  oscillations in those cases. These oscillations can lead not only to
  incorrect solutions but can also easily generate nonphysical solutions like
  gases with negative density or pressure. In order to develop robust high
  order methods for conservation laws, limiters have to be used which
  adaptively add numerical dissipation in regions where numerical solution
  has a high gradient, possibly because of a shock. Some of the limiters
  like<nbsp><cite|Dumbser2014|Dumbser2019|dzanic2022|ramirez2021> have
  inherent mechanisms that ensure physically admissible solutions while
  others like<nbsp><cite|Cockburn1989a|Krivodonova2007|hennemann2021> can be
  made admissibility preserving by relying on the admissibility preserving in
  means property of the numerical scheme and using the scaling limiter
  of<nbsp><cite|Zhang2010b> to guarantee admissibility of solutions.

  In the pioneering work of<nbsp><cite|Cockburn1989a|Cockburn1991>, a Total
  Variation Bounded (TVB) limiter was introduced which reduces the scheme to
  first order or linear in certain elements using a minmod function to
  enforce a local TVB property. The TVB limiter does not preserve any subcell
  information other than the element mean and trace values, and there have
  been several works that develop limiters that are better in this regard. We
  now give a literature review of limiters that preserve subcell information.

  Moment limiters<nbsp><cite|Biswas1994|Burbeau2001|Krivodonova2007> can be
  seen as an extension of TVB limiters where coefficients in an orthonormal
  basis (moments) are limited in a decreasing sequence, from higher to lower
  degree. The hierarchical nature of moment limiters enables preservation of
  subcell information. Another popular strategy is the (H)WENO limiting
  procedure<nbsp><cite|Qiu2005|Balsara2007>, where the DG polynomial is
  substituted in troubled regions by a reconstructed (H)WENO polynomial that
  is computed by a WENO procedure using subcell and neighboring cells
  information. There are also the methods of artificial viscosity where a
  second order diffusion term is added in elements where the solution is
  non-smooth, preserving the subcell information as the high order polynomial
  solution is still used. In<nbsp><cite|Persson2006>, an artificial viscosity
  model was introduced for the Runge-Kutta (RK) Discontinuous Galerkin (DG)
  method to add dissipation to the high order method based on a modal
  smoothness indicator. The indicator of<nbsp><cite|Persson2006> was further
  refined and detailed in<nbsp><cite|klockner2011>.

  There have also been several schemes which limit the solution by breaking
  the element into subcells which offers some advantages over artificial
  viscosity methods, including problem independence over boundary conditions
  and no additional time step restrictions, even when high dissipation is
  required<nbsp><cite|hennemann2021>. In<nbsp><cite|Peraire2012>, the modal
  smoothness indicator of<nbsp><cite|Persson2006> was used to adapt local
  basis functions, e.g., switching to finite volume basis in the presence of
  discontinuities. In<nbsp><cite|Peraire2013>, subcells were used to assign
  different values to artificial viscosity within each element.
  In<nbsp><cite|Sonntag2014|Rosa2018>, after having detected the troubled
  zones using the modal indicator of<nbsp><cite|Persson2006>, cells are
  subdivided into subcells, and a robust first-order finite volume scheme is
  performed on the subgrid in troubled cells. In<nbsp><cite|hennemann2021>,
  the modal smoothness indicator of<nbsp><cite|Persson2006> was used to
  perform limiting by blending a high order DG scheme with
  Gauss-Legendre-Lobatto (GLL) points with a lower order finite volume scheme
  on subcells. In<nbsp><cite|Ramirez2020>, the method
  of<nbsp><cite|hennemann2021> was extended to resistive magnetohydrodynamics
  (MHD) and high order reconstruction on subcells was used to improve
  accuracy. In<nbsp><cite|ramirez2021>, it was shown that the subcell FV
  method of<nbsp><cite|hennemann2021> can be made positivity preserving by an
  <with|font-shape|italic|a posteriori> modification of the blending
  coefficient. In<nbsp><cite|ramirez2022>, the subcell finite volume method
  of<nbsp><cite|hennemann2021> with Rusanov's flux<nbsp><cite|Rusanov1962>
  was shown to be equivalent to the sparse Invariant Domain Preserving method
  of Pazner<nbsp><cite|Pazner2021>.

  The approaches explained above can be classified as
  <with|font-shape|italic|a priori> limiters. We briefly discuss
  <with|font-shape|italic|a posteriori> limiting techniques where the
  solution is updated to time <math|t<rsup|n+1>>, and low order re-updates
  are conducted in the elements that fail certain carefully chosen
  admissibility checks. One of these is the MOOD
  technique<nbsp><cite|Clain2011|Diot2012|Diot2013> where the local
  re-updates are computed with reduced order of accuracy until the
  admissibility checks pass. In<nbsp><cite|Dumbser2014|Dumbser2019>, the
  subcell based technique of<nbsp><cite|Sonntag2014|Rosa2018> is applied in
  an <with|font-shape|italic|a posteriori> fashion using <math|2*N+1>
  subcells for <math|N+1> degrees of freedom per element in the 1-D case,
  using least squares approximation to convert back to a degree <math|N>
  polynomial. In case the least square transformation leads to violation of
  admissibility constraints, the subcell solution values are used in the next
  evolution and thus the scheme is guaranteed to not crash.
  In<nbsp><cite|Vilar2019>, the DG scheme was reformulated as subcell Finite
  Volume (FV) method with appropriate subcells. An indicator was used to mark
  troubled subcells and thus the solution could be modified in a very
  localized manner, preserving subcell information well.

  Other techniques for shock capturing exist that do not fit strictly into
  the aforementioned categories. In<nbsp><cite|dzanic2022>, positivity
  preservation and shock capturing were achieved by filtering and enforcing
  the minimum entropy principle, while in<nbsp><cite|Lu2021>, a numerical
  damping term was introduced in the DG scheme to control spurious
  oscillations.

  <section|Contributions><label|sec:intro.contri>

  <paragraph|Lax Wendroff Flux Reconstruction.>

  We combine the Lax-Wendroff method for time discretization with the FR
  method for spatial discretization in<nbsp><cite|babbar2022>, since each of
  these two methods have their advantages as discussed in
  Sections<nbsp><reference|sec:intro.lw>,<nbsp><reference|sec:intro.fr>. In
  this work we propose to combine the approximate LW
  procedure<nbsp><cite|Zorio2017> with the FR scheme in space which leads to
  a general method that can be applied to any PDE system unlike the work
  of<nbsp><cite|Lou2020>, where the flux derivatives are computed by using
  chain rule of differentiation. The usage of chain rule
  in<nbsp><cite|Lou2020> also leads to complicated tensorial quantities,
  especially for large systems and high orders. In the previous works
  like<nbsp><cite|Qiu2005b>, the solution at the current time level has been
  used to estimate the dissipative part of the numerical flux; however, it
  does not lead to an upwind flux, even for the linear advection equation.
  Here we propose to use the time average solution to compute the numerical
  flux, which leads to an upwind scheme for linear problems, and also
  increases the CFL numbers, which are comparable to other single step
  methods like ADER-DG scheme. We also show that the scheme is infact
  equivalent to the ADER-DG scheme for linear problems. An interesting
  observation we make is that the method at fifth order has a mild
  instability even though we use the CFL number determined from Fourier
  stability analysis. This mild instability seems to be present even in some
  RKDG schemes. The central part of the numerical flux can be computed either
  by extrapolating it from the solution points to the faces or by directly
  estimating them at the faces by applying the approximate Lax-Wendroff
  procedure. These two methods perform differently for non-linear problems,
  with the extrapolation method leading to loss of convergence rate at odd
  polynomial degrees and also having larger errors compared to RK scheme. The
  alternate method proposed in this work performs uniformly well at all
  polynomial degrees and shows comparable accuracy to RK schemes. The LW
  method is developed for hyperbolic systems like Euler equations, where many
  commonly used numerical fluxes based on approximate Riemann solvers like
  Roe, HLL, HLLC, are used, along with the modifications that enhance the CFL
  number. The method is described up to fifth order accuracy and it is cast
  in terms of matrix-vector operations.

  <paragraph|Subcell based blending limiter.>

  The above developments were initially tested for nonsmooth problems by
  using the TVB limiter<nbsp><cite|Cockburn1989a|Cockburn1991>. The TVB
  limiter is a simple approach to reduce the scheme to first order or linear
  in FR elements using a minmod function. It is inadequate when used with
  LWFR for the following reasons - it does not preserve any subcell
  information other than the element mean and trace values, and it is not
  provably admissibility preserving for Lax-Wendroff schemes even when used
  with the scaling limiter of Zhang and Shu<nbsp><cite|Zhang2010b>. The
  schemes that deal with the first issue have been discussed in
  Section<nbsp><reference|sec:intro.shock.capturing>. The second issue has
  been considered in<nbsp><cite|moe2017|Xu2022> by modifying the numerical
  flux to obtain admissibility in means making the scaling limiter
  applicable. In<nbsp><cite|moe2017>, admissibility in means is obtained by
  limiting the numerical flux. In<nbsp><cite|Xu2022>, a third order
  maximum-principle satisfying Lax-Wendroff DG scheme is constructed using
  the direct DG numerical flux from<nbsp><cite|Chen2016>.

  We develop the <with|font-shape|italic|a priori> blending limiter
  of<nbsp><cite|hennemann2021> for LWFR as its choice of subcells gives a
  natural correction to the time averaged numerical flux to obtain
  admissibility preservation in means. The key idea of the blending scheme is
  to reduce spurious oscillations by using a low order scheme in regions
  where the solution is not smooth, as detected by a smoothness indicator.
  The blending limiter by itself is not guaranteed to control all
  oscillations and thus unphysical solutions may still be obtained. Thus, we
  perform additional limiting to obtain a provably admissibility preserving
  scheme. Special attention is also paid to improving accuracy to capture
  small scale structures. We use Gauss-Legendre (GL) solution points and
  subcells obtained from GL quadrature weights instead of the GLL points and
  weights used in<nbsp><cite|hennemann2021>. This is because of their
  accuracy advantage as observed by us, and as reported in the literature. In
  the non-linear stability analysis for E-fluxes in<nbsp><cite|Jameson2012>,
  Gauss-Legendre points were found to be the most resistant to aliasing
  driven instability. In another study on accuracy with different choices of
  solution points<nbsp><cite|Witherden2021>, the optimality of Gauss-Legendre
  points was again observed. In<nbsp><cite|babbar2022>, optimal convergence
  rates for some non-linear problems were observed only for Gauss-Legendre
  solution points.

  As observed in<nbsp><cite|Rueda2021>, accuracy can be improved by
  performing a high order reconstruction on the subcells. Since LWFR is a
  single-stage method, we improve accuracy by using the single-stage, second
  order MUSCL-Hancock scheme<nbsp><cite|vanleer1984> on the subcells. As
  explained in<nbsp><cite|hennemann2021>, for a DG method of degree <math|N>,
  maintaining conservation requires the subcell sizes to be given by the
  <math|N+1> quadrature weights and the solution points to be the solution
  points of DG scheme. This implies that the subcells are non-uniform and the
  finite volumes are neither cell-centered nor vertex centered. Thus, as a
  first step to ensuring that the blended scheme is admissible, we extend the
  work of<nbsp><cite|Berthon2006> to the non-cell centered grids that occur
  from demanding conservation in the blending scheme. Enforcing admissibility
  as in<nbsp><cite|Berthon2006> requires an additional slope limiting step
  and we propose a problem independent procedure to do the same.

  In order to maintain conservation, low and high order updates need to use
  the same numerical flux at the FR element interfaces (see
  Remark<nbsp><reference|rmk:why.same.flux>). This numerical flux has to be
  chosen by blending between the high order time averaged flux and the low
  order FV flux. Thus, as the next step to enforce admissibility of the
  blended Lax-Wendroff scheme, we carefully select the blended numerical flux
  using a scaling procedure to ensure that the lower order updates at
  solution points neighboring the interfaces are admissible.

  In<nbsp><cite|ramirez2021>, the blending limiter
  of<nbsp><cite|hennemann2021> has been made admissibility preserving by
  changing the blending coefficients in an <with|font-shape|italic|a
  posteriori> fashion. Since our choice of the blended numerical flux implies
  the admissibility of lower order updates at all solution points, we could
  take the same approach. In this work, we instead use the fact that, with
  the blended numerical flux, admissibility of lower order scheme implies
  admissibility in the means of the blended scheme and thus the scaling
  limiter of<nbsp><cite|Zhang2010b> can now be used to obtain an
  admissibility preserving scheme. In<nbsp><cite|moe2017>, a correction has
  been made to the Lax-Wendroff numerical flux enforcing the admissibility in
  means property and then the scaling limiter<nbsp><cite|Zhang2010b> has been
  used to obtain an admissibility preserving Lax-Wendroff scheme. Our work
  differs from<nbsp><cite|moe2017> as we only target to ensure admissibility
  of the lower order scheme and the admissibility in means is consequently
  obtained. This implies that our correction requires less storage and does
  not require additional loops, minimizing memory reads.

  <paragraph|Generalized admissibility preservation.>

  The subcell based blending scheme suppresses spurious oscillations but also
  gives a natural flux limiting procedure to ensure admissibility
  preservation of the LWFR scheme. We also develop a
  <with|font-shape|italic|generalized flux limiting> process that can also be
  used when there is no subcell based limiting scheme. The initial argument
  is similar to performing a decomposition of the cell average into
  <with|font-shape|italic|fictitious finite volume updates> as
  in<nbsp><cite|Zhang2010b|zhang2010c>. The difference
  from<nbsp><cite|Zhang2010b> arises as some of the fictitious finite volume
  updates involve the LW high order fluxes. Then, it is seen that, if the LW
  numerical flux is limited to ensure that the updates with its fictitious
  finite volume fluxes is admissible, the scheme will be admissibility
  preserving in means. In addition to showing that our positivity preserving
  framework preserves admissibility in the presence of shocks and
  rarefactions, we also introduce the first LWFR scheme in the presence of
  source terms. The approach involves adding time averages of the sources and
  thus we also propose a source term limiting procedure so that admissibility
  is maintained. The claim is validated on the Ten Moment equations, which
  are derived by Levermore et al.<nbsp><cite|Levermore_1996> by taking a
  Gaussian closure of the kinetic model.

  <paragraph|Multiderivative Runge-Kutta.>

  In<nbsp><cite|li2016>, a two stage fourth order Multiderivative Runge-Kutta
  (MDRK) scheme was introduced for solving hyperbolic conservation laws by
  solving a Generalized Riemann Problem (GRP). We show the first combination
  of MDRK with a Flux Reconstruction scheme by using the scheme
  of<nbsp><cite|li2016>. We also use the construction of the numerical flux
  from<nbsp><cite|babbar2022>. In particular, we use the D2 dissipation and
  show that it leads to enhanced Fourier CFL stability limiter. We also use
  the <evaluate> scheme which leads to enhanced accuracy for non-linear
  problems when using Gauss-Legendre solution points. We also develop
  admissibility preserving subcell based blending scheme and show how it is
  superior to other schemes like a TVB limiter.

  <paragraph|Adaptive, curvilinear grids and time stepping.>

  The LWFR scheme with the above features is further developed to incorporate
  three new features:

  <\enumerate>
    <item>Ability to work on curvilinear, body-fitted grids

    <item>Ability to work on locally and dynamically adapted grids with
    hanging nodes

    <item>Automatic error based time step computation
  </enumerate>

  Curvilinear grids are defined in terms of a tensor product polynomial map
  from a reference element to the physical element. The conservation law is
  transformed to the coordinates of the reference element and then the LWFR
  procedure is applied leading to a collocation method that has similar
  structure as on Cartesian grids. This structure also facilitates the
  extension of the provably admissibility preserving subcell based blending
  scheme to curvilinear grids. The FR formulation on curvilinear grids is
  based on its equivalence with the DG scheme, see<nbsp><cite|Kopriva2006>,
  which also obtained certain metric identities that are required for
  preservation of constant solutions, that is, free stream preservation. See
  references in<nbsp><cite|Kopriva2006> for a review of earlier study of
  metric terms in the context of other higher order schemes like finite
  difference schemes. The free stream preserving conditions for the LWFR
  scheme are proven to be the same discrete metric identities as that
  of<nbsp><cite|Kopriva2006>. The only requirement for the required metric
  identities in two dimensions is that the mappings used to define the
  curvilinear elements must have degree less than or equal to the degree of
  polynomials used to approximate the solution.

  In many problems, there are non-trivial and sharp solution features only in
  some localized parts of the domain and these features can move with respect
  to time. Using a uniform mesh to resolve small scale features is
  computationally expensive and adaptive mesh refinement (AMR) is thus very
  useful. In this work, we perform adaptive mesh refinement based on some
  local error or solution smoothness indicator. Elements with high error
  indicator are flagged for refinement and those with low values are flagged
  for coarsening. A consequence of this procedure is that we get
  non-conformal elements with hanging nodes which is not a major problem with
  discontinuous Galerkin type methods, except that one has to ensure
  conservation is satisfied. For discontinuous Galerkin methods based on
  quadrature, conservation is ensured by performing quadrature on the cell
  faces from the refined side of the face<nbsp><cite|schaal2015|Zanotti2015>.
  For FR type methods which are of collocation type, we need numerical fluxes
  at certain points on the element faces, which have to computed on a refined
  face without loss of accuracy and such that conservation is also satisfied.
  For the LWFR scheme, we use the Mortar Element
  Method<nbsp><cite|Kopriva1996|Kopriva2002> to compute the solution and
  fluxes at non-conformal faces. The resulting method is conservative and
  also preserves free-stream condition on curvilinear, adapted grids.

  The choice of time step is restricted by a CFL-type condition in order to
  satisfy linear stability and some other non-linear stability requirements
  like maintaining positive solutions. Linear stability analysis can be
  performed on uniform Cartesian grids only, leading to some CFL-type
  condition which depends on wave speed estimates. In practice these
  conditions are then also used for curvilinear grids but they may not be
  optimal and may require tuning the time step for each problem by adding a
  safety factor. Thus, automatic time step selection methods based on some
  error estimates become very relevant for curvilinear grids. Error based
  time stepping methods are already developed for ODE solvers; and by using a
  method of lines approach to convert partial differential equations to a
  system of ordinary differential equations, error-based time stepping
  schemes of ODE solvers have been applied to partial differential
  equations<nbsp><cite|berzins1995|ketcheson2020|ware1995> and recent
  application to CFD problems can be found
  in<nbsp><cite|Ranocha2021|ranocha2023>. The LWFR scheme makes use of a
  Taylor expansion in time of the time averaged flux; by truncating the
  Taylor expansion at one order lower, we can obtain two levels of
  approximation, whose difference is used as a local error indicator to adapt
  the time step. As a consequence the user does not need to specify a CFL
  number, but only needs to give some error tolerances based on which the
  time step is automatically decreased or increased.

  <paragraph|Parabolic equations.>

  We extend the LWFR scheme of to second order parabolic equations on
  curvilinear meshes by making use of the BR1 scheme. The BR1 is known to
  retain the superior properties of FR/DG, is applicable to underresolved
  turbulent simulations<nbsp><cite|Gassner2012>, and was proven to be stable
  in<nbsp><cite|Gassner_Winters_Hindenlang_Kopriva_2018>. We use the error
  based time stepping developed for LWFR, which is especially relevant here
  since a Fourier CFL stability limit of LWFR is also not known for second
  order PDE. This is the first extension of a high order Lax-Wendroff to
  second order equations. The ADER schemes, which are another class of single
  stage solvers have also been extended to solve second order PDE
  in<nbsp><cite|Fambri2017> by including additional diffusion in the
  numerical flux in contrast to the BR1 scheme used here. This is the first
  work where any single stage method has been combined with the BR1 scheme.

  <section|Outline><label|sec:intro.outline>

  The rest of the thesis is organized as follows:

  Chapter<nbsp><reference|ch:con.law> introduces the basic notations to
  describe the relevant equations of motion. These include first order
  hyperbolic systems like compressible Euler's equations and the ten moment
  problem of gas dynamics, but also second order equations like compressible
  Navier-Stokes equations.

  Chapter<nbsp><reference|ch:fvm.dg> describes the spatial discretization
  using Flux Reconstruction for hyperbolic conservation laws. The description
  of finite volume and Discontinuous Galerkin methods for hyperbolic
  conservation laws is also provided.

  Chapter<nbsp><reference|ch:lwfr> describes the core Lax-Wendroff Flux
  Reconstruction scheme using the approximate Lax-Wendroff procedure. The D2
  dissipation to compute the dissipative part of numerical flux is introduced
  along with a Fourier stability analysis showing enhancement of CFL numbers
  in comparison to previous works. The computation of <evaluate> scheme to
  compute the central part of numerical flux is also introduced which
  enhances accuracy for nonlinear problems. The scheme is described for 1-D
  and 2-D and numerically validated for accuracy and stability with various
  scalar problems and Euler's system of equations.

  Chapter<nbsp><reference|ch:lw.subcell.limiter> describes the subcell based
  blending limiter for LWFR. In the direction of robustness, provable
  admissibility preservation is obtained by careful construction of the
  <with|font-shape|italic|blended numerical flux>. In the direction of
  accuracy, Gauss-Legendre points are used and MUSCL-Hancock reconstruction
  is performed on the subcells. An admissibility preserving MUSCL-Hancock
  reconstruction scheme is developed for non-cell centred grids that
  naturally arise as subcells to ensure the conservation property. The claims
  are verified by numerical experiments on Euler's equations. The
  admissibility preservation is verified by problems that have shocks with
  very high pressure ratios. The accuracy improvement is verified on problems
  that have small scale structures along with strong shocks.

  Chapter<nbsp><reference|ch:10mom> introduces a generalized admissibility
  preserving framework for LWFR schemes extending the scaling limiter of
  Zhang and Shu. The framework is extended to equations with source terms
  maintaining admissibility. The admissibility preservation is verified by
  numerical results on Ten Moment equations of gas dynamics.

  Chapter<nbsp><reference|ch:mdrk> introduces a two stage, fourth order
  multiderivative Runge-Kutta (MDRK) method in Flux Reconstruction framework
  by writing each stage as an evolution involving a time average flux. The
  time average flux is approximated by performing the LWFR procedure at each
  stage. The D2 dissipation and <evaluate> flux are introduced for MDRK
  enhancing stability and accuracy. The blending limiter is applied at each
  stage to obtained a provably admissibility preserving scheme. The scheme
  and claims are validated by a recent test suite for high order methods on
  Euler's equations.

  Chapter<nbsp><reference|ch:curved.meshes> extends LWFR to adaptively
  refined curvilinear meshes. The mortar element method is developed for LWFR
  to obtain a scheme that is conservative, free stream and admissibility
  preserving. A Fourier CFL stability analysis does not apply to curvilinear
  meshes and thus an error based time stepping method is introduced. The
  scheme is validated by numerical experiments on Compressible Euler's
  equations. The time stepping method is shown to be of superior performance
  in comparison to CFL based time stepping even though it requires less fine
  tuning.

  Chapter<nbsp><reference|ch:parabolic> extends the LWFR scheme to
  advection-diffusion equations by using the BR1 (Bassi-Rebay) scheme. The
  scheme is numerically validated on numerically experiments on compressible
  Navier Stokes equations on curvilinear meshes by comparing the obtained
  numerical solutions with reference solutions.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|0>
    <associate|font-base-size|12>
    <associate|info-flag|minimal>
    <associate|page-even|1in>
    <associate|page-first|20>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|21>>
    <associate|auto-2|<tuple|1.1|21>>
    <associate|auto-3|<tuple|1.2|23>>
    <associate|auto-4|<tuple|1.3|24>>
    <associate|auto-5|<tuple|1.4|25>>
    <associate|auto-6|<tuple|1.5|29>>
    <associate|sec:intro.contri|<tuple|1.4|25>>
    <associate|sec:intro.fr|<tuple|1.2|23>>
    <associate|sec:intro.lw|<tuple|1.1|21>>
    <associate|sec:intro.outline|<tuple|1.5|29>>
    <associate|sec:intro.shock.capturing|<tuple|1.3|24>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      attig2011

      subcommittee2014

      Huynh2007

      cockburn2000

      witherden2014

      Ranocha2022

      Dumbser2018

      Qiu2005b

      Lax1960

      Safjan1995

      Tabarrok1994

      Youn1995

      Choe1991

      Choe1992

      Qiu2003

      Shu1989

      Jiang2013

      Qiu2003

      Qiu2005b

      Qiu2007

      Guo2015

      Qiu2005b

      Guo2015

      Cockburn1998a

      Sun2017

      Guo2015

      Toro2001

      Titarev2002

      Artzi2006

      Han2010

      Dumbser2006

      Titarev2005

      Kaser2005

      Dumbser2007

      Castro2008

      Dumbser2008

      Dumbser2008a

      Gassner2011a

      Balsara2009a

      Dumbser2008

      Gassner2011a

      Guthrey2019

      Montecinos2020

      Zorio2017

      Lee2021

      Burger2017

      Carrillo2021

      Carrillo2021a

      reed1973

      cockburn2000

      Huynh2007

      Huynh2007

      Trojak2021

      Vincent2011a

      Huynh2007

      Vincent2015

      Trojak2021

      Trojak2021

      Vincent2011a

      Jameson2012

      Witherden2021

      Cicchino2022a

      Cicchino2022

      Offner2019

      Abgrall2020

      Vincent2011

      Asthana2015

      Vermeire2017

      witherden2014

      Abe2015

      Cicchino2022

      Kopriva2006

      kopriva2010

      Kopriva2006

      Vincent2016

      Lopez2014

      Vandenhoeck2019

      Vincent2016

      Vincent2016

      Dumbser2014

      Dumbser2019

      dzanic2022

      ramirez2021

      Cockburn1989a

      Krivodonova2007

      hennemann2021

      Zhang2010b

      Cockburn1989a

      Cockburn1991

      Biswas1994

      Burbeau2001

      Krivodonova2007

      Qiu2005

      Balsara2007

      Persson2006

      Persson2006

      klockner2011

      hennemann2021

      Peraire2012

      Persson2006

      Peraire2013

      Sonntag2014

      Rosa2018

      Persson2006

      hennemann2021

      Persson2006

      Ramirez2020

      hennemann2021

      ramirez2021

      hennemann2021

      ramirez2022

      hennemann2021

      Rusanov1962

      Pazner2021

      Clain2011

      Diot2012

      Diot2013

      Dumbser2014

      Dumbser2019

      Sonntag2014

      Rosa2018

      Vilar2019

      dzanic2022

      Lu2021

      babbar2022

      Zorio2017

      Lou2020

      Qiu2005b

      babbar2024equivalence

      Cockburn1989a

      Cockburn1991

      babbar2022

      Zhang2010b

      moe2017

      Xu2022

      moe2017

      Xu2022

      Chen2016

      babbar2023admissibility

      hennemann2021

      hennemann2021

      Jameson2012

      Witherden2021

      babbar2022

      Rueda2021

      vanleer1984

      hennemann2021

      Berthon2006

      Berthon2006

      ramirez2021

      hennemann2021

      Zhang2010b

      moe2017

      Zhang2010b

      moe2017

      babbar2024generalized

      babbar2023admissibility

      Zhang2010b

      zhang2010c

      Zhang2010b

      babbar2023admissibility

      Levermore_1996

      li2016

      babbar2024multiderivative

      li2016

      babbar2022

      babbar2022

      babbar2022

      babbar2023admissibility

      babbar2024curved

      babbar2023admissibility

      Kopriva2006

      Kopriva2006

      Kopriva2006

      schaal2015

      Zanotti2015

      Kopriva1996

      Kopriva2002

      berzins1995

      ketcheson2020

      ware1995

      Ranocha2021

      ranocha2023

      babbar2024laxwendroff

      babbar2022

      babbar2024curved

      Gassner2012

      Gassner_Winters_Hindenlang_Kopriva_2018

      babbar2024laxwendroff

      babbar2024curved

      Fambri2017
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|1.<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      1.1.<space|2spc>Lax-Wendroff <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.2.<space|2spc>Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      1.3.<space|2spc>Shock capturing and admissibility preservation of FR
      schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      1.4.<space|2spc>Contributions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      1.5.<space|2spc>Outline <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>
    </associate>
  </collection>
</auxiliary>