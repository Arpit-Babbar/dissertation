<TeXmacs|2.1>

<project|main.tm>

<style|<tuple|tmbook|style_common>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <chapter*|Introduction>

  <with|color|red|Paper 1>

  The numerical solution of hyperbolic PDE is usually based on the Godunov
  approach where a Riemann problem is solved to estimate the numerical flux
  which may be used in a finite volume or discontinuous Galerkin (DG) method.
  The resulting set of ODE are then marched forward in time using a
  multi-stage Runge-Kutta scheme under some CFL condition. For hyperbolic
  problems, the spatial and time order are usually taken to be equal due to
  the CFL condition <math|\<Delta\>*t=O<around|(|\<Delta\>*x|)>>, which
  requires atleast as many stages as the order of the scheme. The need to
  perform many stages of RK scheme means that costly limiters and data
  exchange in case of parallel computations must be performed several times
  for each time step<nbsp><cite|Dumbser2018>. There are also some order
  barriers in the sense that at high orders, we need more stages than the
  order of the method. In contrast to RK schemes, the Lax-Wendroff method
  achieves high order accuracy in time with a single step but requires more
  information to estimate the higher order time derivative terms in a Taylor
  expansion. It is expect that the single stage nature of LW-type schemes can
  make them more efficient than RK schemes<nbsp><cite|Qiu2005b>.

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
  arbitrary high order derivative (ADER) methods. Though its inception was in
  the finite volume spatial setup, later it was extended to finite difference
  and discontinuous Galerkin frameworks<nbsp><cite|Dumbser2006>. In the
  sequel, several authors have contributed to this approach with the aim of
  shaping up a compact single time step scheme,
  see<nbsp><cite|Titarev2005|Kaser2005|Dumbser2007|Castro2008> and references
  therein. In the flavour of ADER methods, Dumbser et al. proposed an
  efficient DG spatial solver in<nbsp><cite|Dumbser2008> and a finite
  difference WENO spatial solver in<nbsp><cite|Dumbser2008a>. These are
  compact schemes that replace the so called Cauchy-Kowalevski procedure in
  the original ADER scheme with an element local space-time Galerkin
  predictor step and a discontinuous Galerkin corrector step, which are also
  found to be suitable for stiff source terms and further studied by Gassner
  et al.in<nbsp><cite|Gassner2011a>. These methods have been extended to the
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

  The flux reconstruction (FR) method<nbsp><cite|Huynh2007> is a class of
  discontinuous Spectral Element Method for the discretization of
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
  optimality of Gauss-Legendre points was again observed. The long term error
  behaviour of FR schemes has been studied
  in<nbsp><cite|Offner2019|Abgrall2020>, while dispersion and dissipation
  errors have been analyzed in<nbsp><cite|Vincent2011|Asthana2015|Vermeire2017>.
  The computationally efficient performance of FR has been noted
  in<nbsp><cite|Vincent2016|Lopez2014|Vandenhoeck2019>, which is attributed
  to the structured computation of finite element methods suitable for modern
  hardware<nbsp><cite|Vincent2016>. The quadrature-free nature of FR methods
  together with the ability to cast the operations as matrix-vector
  operations that can be performed efficiently using optimized BLAS kernels
  makes these methods ideal for use on modern vector
  processors<nbsp><cite|Vincent2016>.

  In the present work, we combine the Lax-Wendroff method for time
  discretization with the FR method for spatial discretization, since each of
  these two methods have their advantages as discussed above. The flux
  reconstruction schemes have been combined with the LW time discretization
  in<nbsp><cite|Lou2020>, where the flux derivatives are computed in the
  standard way by explicitly using chain rule of differentiation and making
  use of the PDE. This is a tedious process that has to be performed for each
  PDE system and leads to large amount of computations. The results
  in<nbsp><cite|Burger2017> reveal that this approach would be
  computationally more expensive and depends on the nature of flux in the
  governing equation. In this work we propose to combine the approximate LW
  procedure<nbsp><cite|Zorio2017> with the FR scheme in space which leads to
  a general method that can be applied to any PDE system. No Jacobian or
  other computations are required and only the flux function is used in this
  method. The time derivatives of the flux in the Taylor expansion are
  approximated using a finite difference method. This allows us to write a
  generic solver that can easily applied to solve any PDE system. The single
  step method is achieved by using an approximation to the time average flux.
  A numerical flux is required for the time average flux and this needs to be
  computed carefully in order to obtain good CFL numbers. In some previous
  works, the solution at the current time level has been used to estimate the
  dissipative part of the numerical flux; however, it reduces the CFL number
  based on Fourier stability analysis and does not lead to an upwind flux,
  even for the linear advection equation. Here we propose to use the time
  average solution to compute the numerical flux, which leads to an upwind
  scheme for linear problems, and also increases the CFL numbers, which are
  comparable to other single step methods like ADER-DG scheme. An interesting
  observation we make is that the method at fifth order has a mild
  instability even though we use the CFL number determined from Fourier
  stability analysis. This mild instability seems to be present even in some
  RKDG schemes and in ADER-DG schemes. The central part of the numerical flux
  can be computed either by extrapolating it from the solution points to the
  faces or by directly estimating them at the faces by applying the
  approximate Lax-Wendroff procedure. These two methods perform differently
  for non-linear problems, with the extrapolation method leading to loss of
  convergence rate at odd polynomial degrees and also having larger errors
  compared to RK scheme. The alternate method proposed in this work performs
  uniformly well at all polynomial degrees and shows comparable accuracy to
  RK schemes. The LW method is also developed for hyperbolic systems like
  Euler equations, where many commonly used numerical fluxes based on
  approximate Riemann solvers like Roe, HLL, HLLC, can be used, along with
  the modifications that enhance the CFL number. The method is described up
  to fifth order accuracy and it is cast in terms of matrix-vector
  operations. The new LW method is applied to linear and non-linear problems
  in one and two dimensions and representative results are shown to exhibit
  its accuracy and ability to compute smooth and discontinuous solutions.

  <with|color|red|Paper 2>

  The current state of memory-bound HPC hardware<nbsp><cite|attig2011|subcommittee2014>
  makes a strong case for development of high-order discrete methods in
  computational fluid dynamics (CFD). By incorporating more higher order
  terms, these methods can achieve greater numerical accuracy per degree of
  freedom while minimizing memory usage and data transfers. In particular,
  higher order methods have higher arithmetic intensity and are thus less
  likely to be memory-bound. However, lower order methods are still routinely
  applied in practical applications, in part due to their robustness. This
  work is in direction of using high order methods while retaining the
  robustness properties of lower order methods.

  Discontinuous Galerkin (DG) is a Spectral Element Method first introduced
  by Reed and Hill<nbsp><cite|reed1973> for neutron transport equations and
  developed for fluid dynamics equations by Cockburn and Shu and others,
  see<nbsp><cite|cockburn2000> and the references therein. The DG method uses
  an approximate solution which is a polynomial within each element and is
  allowed to be discontinuous across interfaces. The neighbouring DG elements
  are coupled only through the numerical flux and thus bulk of computations
  are local to the element, minimizing data transfers.

  Flux Reconstruction (FR) is also a class of discontinuous Spectral Element
  Methods introduced by Huynh<nbsp><cite|Huynh2007>. FR method is obtained by
  using the numerical flux and correction functions to construct a continuous
  flux approximation and collocating the differential form of the equation.
  Thus, FR is quadrature free and all local operations can be vectorized. The
  choice of the correction function affects the accuracy and stability of the
  method<nbsp><cite|Huynh2007|Vincent2011a|Vincent2015|Trojak2021>; by
  properly choosing the correction function and solution points, FR method
  can be shown to be equivalent to some discontinuous Galerkin and spectral
  difference schemes<nbsp><cite|Huynh2007|Trojak2021>.

  FR and DG are procedures for discretizing the equation in space and can be
  used to obtain a system of ODEs in time, i.e., a semi-discretization of the
  PDE. The standard approach to solve the semi-discretization is to use a
  high order multi-stage Runge-Kutta method. In this approach, the spatial
  discretization has to be performed in every RK stage and thus the expensive
  operations of MPI communication and limiting have to be performed multiple
  times per time step.

  An alternative approach is to use a single-stage solver,
  see<nbsp><cite|babbar2022> for a more in-depth review. ADER (Arbitrary high
  order DERivative) schemes are one class of single-stage evolution methods
  which originated as ADER Finite Volume (FV)
  schemes<nbsp><cite|Titarev2002|Titarev2005> and are also used as ADER-DG
  schemes<nbsp><cite|Dumbser2008|Dumbser2014>. Another class of single-stage
  evolution methods are the Lax-Wendroff schemes which were originally
  proposed in the finite difference framework in<nbsp><cite|Qiu2003> with the
  WENO approximation of spatial derivatives<nbsp><cite|Shu1989> and later
  extended to DG framework in<nbsp><cite|Qiu2005b>. These schemes were based
  on computation of flux Jacobian which leads to a problem dependent and
  expensive procedure especially for higher dimension equations with many
  variables. A Jacobian free method, called
  <with|font-shape|italic|approximate Lax-Wendroff>, using finite differences
  in time was developed in<nbsp><cite|Zorio2017> and further studied in
  several other works<nbsp><cite|Burger2017|Carrillo2021|Carrillo2021a>. In
  <nbsp><cite|Lee2021>, the flux Jacobians were directly computed as finite
  difference derivatives with a parameter <math|\<epsilon\>> for accuracy of
  finite difference. In<nbsp><cite|Burger2017>, the approximate Lax-Wendroff
  procedure was used in the DG framework and the performance benefit of
  Jacobian free methods was observed.

  In<nbsp><cite|babbar2022>, the present authors proposed a Lax-Wendroff Flux
  Reconstruction (LWFR) scheme which used the approximate Lax-Wendroff
  procedure of<nbsp><cite|Zorio2017> to obtain high order accuracy. The
  numerical flux was carefully constructed in<nbsp><cite|babbar2022>; the
  dissipative part of the numerical flux was computed with the time averaged
  solution (called D2 dissipation) leading to an upwind flux in the linear
  case and improved CFL numbers at no additional computational cost. The
  central part of the numerical flux was computed by performing the
  approximate Lax-Wendroff procedure at the faces (EA scheme) rather than
  using the extrapolated time averaged flux from solution points (AE scheme).
  It was observed that the EA scheme improved accuracy of the LWFR scheme and
  some tests showed optimal order of convergence only with the EA scheme.
  Thus, in this work, we use the LWFR scheme with numerical flux computed
  with D2 dissipation and EA scheme.

  Although arbitrary high order accuracy in smooth test cases and Wall Clock
  Time (WCT) performance improvement over RKFR (Runge-Kutta Flux
  Reconstruction) was observed for the LWFR scheme proposed
  in<nbsp><cite|babbar2022>, robustness and maintaining high-order accuracy
  in presence of discontinuities remained to be addressed. Solutions to
  hyperbolic conservation laws contain shocks in many practical applications
  and it is well known that high-order schemes produce spurious oscillations
  in those cases. These oscillations can lead not only to incorrect solutions
  but can also easily generate nonphysical solutions like gases with negative
  density or pressure. Thus, these schemes require limiters which reduce the
  higher order scheme to a robust lower order scheme in non-smooth regions.
  In<nbsp><cite|babbar2022>, a TVB limiter was used which reduces the scheme
  to first order or linear in FR elements using a minmod function
  (Section<nbsp><reference|sec:tvd>). The TVB limiter is inadequate for the
  following reasons - it doesn't preserve any subcell information other than
  the element mean and trace values, and it is not provably admissibility
  preserving for Lax-Wendroff schemes even when used with the scaling limiter
  of Zhang and Shu<nbsp><cite|Zhang2010b>. The second issue has been
  considered in<nbsp><cite|moe2017|Xu2022> by modifying the numerical flux to
  obtain admissibility in means making the scaling limiter applicable.
  In<nbsp><cite|moe2017>, admissibility in means is obtained by limiting the
  numerical flux. In<nbsp><cite|Xu2022>, a third order maximum-principle
  satisfying Lax-Wendroff DG scheme is constructed using the direct DG
  numerical flux from<nbsp><cite|Chen2016>. We now give a brief literature
  review of the schemes which deal with the first issue of TVB limiter which
  is preservation of subcell information,
  see<nbsp><cite|Vilar2019|Dumbser2014> for a more in-depth review.

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
  method to add dissipation to the higher order method based on a modal
  smoothness indicator. The indicator of<nbsp><cite|Persson2006> was further
  refined and detailed in<nbsp><cite|klockner2011>.

  There have also been several schemes which limit the solution by breaking
  the element into subcells which offers some advantages over artificial
  viscosity methods, including problem independence over boundary conditions
  and no additional time step restrictions, even when high dissipation is
  required, as noted in<nbsp><cite|henemann2021>. In<nbsp><cite|Peraire2012>,
  the modal smoothness indicator of<nbsp><cite|Persson2006> was used to adapt
  local basis functions, e.g., switching to finite volume basis in the
  presence of discontinuities. In<nbsp><cite|Peraire2013>, subcells were used
  to assign different values to artificial viscosity within each element.
  In<nbsp><cite|Sonntag2014|Rosa2018>, after having detected the troubled
  zones using the modal indicator of<nbsp><cite|Persson2006>, cells are
  subdivided into subcells, and a robust first-order finite volume scheme is
  performed on the subgrid in troubled cells. In<nbsp><cite|henemann2021>,
  the modal smoothness indicator of<nbsp><cite|Persson2006> was used to
  perform limiting by blending a high order DG scheme with
  Gauss-Legendre-Lobatto (GLL) points with a lower order finite volume scheme
  on subcells. In<nbsp><cite|Ramirez2020>, the method
  of<nbsp><cite|henemann2021> was extended to compressible
  magnetohydrodynamics (MHD) and higher-order reconstruction on subcells was
  used to improve accuracy. In<nbsp><cite|ramirez2021>, it was shown that the
  subcell FV method of<nbsp><cite|henemann2021> can be made positivity
  preserving by an <with|font-shape|italic|a posteriori> modification of the
  blending coefficient. In<nbsp><cite|ramirez2022>, the subcell finite volume
  method of<nbsp><cite|henemann2021> with Rusanov's
  flux<nbsp><cite|Rusanov1962> was shown to be equivalent to the sparse
  Invariant Domain Preserving method of Pazner<nbsp><cite|Pazner2021>.

  The approaches explained above can be classified as
  <with|font-shape|italic|a priori> limiters. We briefly discuss
  <with|font-shape|italic|a posteriori> limiting techniques where, following
  the solution update to time <math|t<rsup|n+1>>, admissibility checks are
  performed, and lower-order re-updates are conducted in the elements that
  fail these checks. One of these is the MOOD
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

  In this work, we use the <with|font-shape|italic|a priori> blending limiter
  of<nbsp><cite|henemann2021> for LWFR as its choice of subcells gives a
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
  weights used in<nbsp><cite|henemann2021>. This is because of their accuracy
  advantage as observed by us, and as reported in the literature. In the
  non-linear stability analysis for E-fluxes in<nbsp><cite|Jameson2012>,
  Gauss-Legendre points were found to be the most resistant to aliasing
  driven instability. In another study on accuracy with different choices of
  solution points<nbsp><cite|Witherden2021>, the optimality of Gauss-Legendre
  points was again observed. In<nbsp><cite|babbar2022>, optimal convergence
  rates for some non-linear problems were observed only for Gauss-Legendre
  solution points.

  As observed in<nbsp><cite|ramirez2021>, accuracy can be improved by
  performing a higher order reconstruction on the subcells. Since LWFR is a
  single-stage method, we improve accuracy by using the single-stage, second
  order MUSCL-Hancock scheme<nbsp><cite|vanleer1984> on the subcells. As
  explained in<nbsp><cite|henemann2021>, for a degree <math|N> DG method,
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
  of<nbsp><cite|henemann2021> has been made admissibility preserving by
  changing the blending coefficients in an <with|font-shape|italic|a
  posteriori> fashion. Since our choice of the blended numerical flux implies
  lower order updates are admissible at all solution points, we could take
  the same approach. In this work, we instead use the fact that, with the
  blended numerical flux, admissibility of lower order scheme implies
  admissibility in the means of the blended scheme and thus the scaling
  limiter of<nbsp><cite|Zhang2010b> can now be used to obtain an
  admissibility preserving scheme. In<nbsp><cite|moe2017>, a correction has
  been made to the Lax-Wendroff numerical flux enforcing the admissibility in
  means property and then the scaling limiter<nbsp><cite|Zhang2010b> has been
  used to obtain an admissibility preserving Lax-Wendroff scheme. Our work
  differs from<nbsp><cite|moe2017> as we only target to ensure admissibility
  of the lower order scheme and the admissibility in means is consequently
  obtained. This implies that our correction requires less storage and
  doesn't require additional loops, minimizing memory reads.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|0>
    <associate|info-flag|minimal>
    <associate|page-first|9>
    <associate|page-medium|paper>
    <associate|preamble|false>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|9>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
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

      Offner2019

      Abgrall2020

      Vincent2011

      Asthana2015

      Vermeire2017

      Vincent2016

      Lopez2014

      Vandenhoeck2019

      Vincent2016

      Vincent2016

      Lou2020

      Burger2017

      Zorio2017

      attig2011

      subcommittee2014

      reed1973

      cockburn2000

      Huynh2007

      Huynh2007

      Vincent2011a

      Vincent2015

      Trojak2021

      Huynh2007

      Trojak2021

      babbar2022

      Titarev2002

      Titarev2005

      Dumbser2008

      Dumbser2014

      Qiu2003

      Shu1989

      Qiu2005b

      Zorio2017

      Burger2017

      Carrillo2021

      Carrillo2021a

      Lee2021

      Burger2017

      babbar2022

      Zorio2017

      babbar2022

      babbar2022

      babbar2022

      Zhang2010b

      moe2017

      Xu2022

      moe2017

      Xu2022

      Chen2016

      Vilar2019

      Dumbser2014

      Biswas1994

      Burbeau2001

      Krivodonova2007

      Qiu2005

      Balsara2007

      Persson2006

      Persson2006

      klockner2011

      henemann2021

      Peraire2012

      Persson2006

      Peraire2013

      Sonntag2014

      Rosa2018

      Persson2006

      henemann2021

      Persson2006

      Ramirez2020

      henemann2021

      ramirez2021

      henemann2021

      ramirez2022

      henemann2021

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

      henemann2021

      henemann2021

      Jameson2012

      Witherden2021

      babbar2022

      ramirez2021

      vanleer1984

      henemann2021

      Berthon2006

      Berthon2006

      ramirez2021

      henemann2021

      Zhang2010b

      moe2017

      Zhang2010b

      moe2017
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>