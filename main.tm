<TeXmacs|2.1>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    # To get figure numbers in Table of figures. Source -
    <hlink|texmacs-users - Re: [TeXmacs] figure number in list of figures -
    arc|https://lists.texmacs.org/wws/arc/texmacs-users/2006-02/msg00035.html>

    # Make sure you copy exactly that, not even a space extra. Then paste
    from edit -\<gtr\> paste from TexMacs scheme.

    # I actually learnt about it from <hlink|How to add Figure numbering to
    List of Figures? - General - GNU TeXmacs
    Forum|http://forum.texmacs.cn/t/how-to-add-figure-numbering-to-list-of-figures/1554/2>

    <assign|list-fig|0>

    <assign|glossary-1|<macro|left|right|Figure
    <assign|list-fig|<plus|<value|list-fig>|1>><value|list-fig>.
    <arg|left><glossary-dots><arg|right>>>
  </hide-preamble>

  <include|title_page.tm>

  \;

  <include|prelim_pages.tm>

  <include|publications.tm>

  <\list-of-figures|figure>
    <glossary-1|<\surround|<hidden-binding|<tuple>|2.1>|>
      Solution structure for the Riemann problem of a system of conservation
      laws.
    </surround>|<pageref|auto-17>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|2.2>|>
      Characteristic lines for simple waves forming the solution to a Riemann
      problem.
    </surround>|<pageref|auto-18>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|3.1>|>
      Piecewise solutions and flux polynomials
    </surround>|<pageref|auto-23>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.1>|>
      Error convergence for constant linear advection comparing Radau and
      <with|mode|math|g<rsub|2>> correction.
    </surround>|<pageref|auto-48>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.2>|>
      Error convergence for constant linear advection comparing LWFR and RKFR
    </surround>|<pageref|auto-49>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.3>|>
      Error growth for constant linear advection equation.
    </surround>|<pageref|auto-50>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.4>|>
      <with|mode|math|L<rsub|2>> norm growth for constant linear advection
      equation.
    </surround>|<pageref|auto-51>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.5>|>
      Convergence for constant linear advection with Dirichlet boundary
      conditions
    </surround>|<pageref|auto-52>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.6>|>
      <with|mode|math|L<rsub|2>> norm growth for constant linear advection
      with Dirichlet boundary conditions
    </surround>|<pageref|auto-53>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.7>|>
      Constant linear advection of a wave packet.
    </surround>|<pageref|auto-54>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.8>|>
      Error convergence for constant linear advection of a wave packet.
    </surround>|<pageref|auto-55>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.9>|>
      Constant linear advection of hat profile without limiter.
    </surround>|<pageref|auto-57>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.10>|>
      Constant linear advection of hat profile with TVB limiter.
    </surround>|<pageref|auto-58>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.11>|>
      Constant linear advection of hat profile using RK65 with TVB limiter.
    </surround>|<pageref|auto-59>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.12>|>
      Constant linear advection of a composite profile without limiter.
    </surround>|<pageref|auto-60>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.13>|>
      Constant linear advection of a composite profile with TVB limiter.
    </surround>|<pageref|auto-61>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.14>|>
      Error convergence for variable linear advection with
      <with|mode|math|a(x) = x>.
    </surround>|<pageref|auto-63>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.15>|>
      Error convergence for variable linear advection with
      <with|mode|math|a(x) = x<rsup|2>>.
    </surround>|<pageref|auto-64>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.16>|>
      Error growth for linear advection with wave speed <with|mode|math|a(x)
      = x<rsup|2>>
    </surround>|<pageref|auto-65>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.17>|>
      Solution of 1-D Burger's equation.
    </surround>|<pageref|auto-67>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.18>|>
      Error convergence for 1-D Burger's equation.
    </surround>|<pageref|auto-68>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.19>|>
      Error convergence for 1-D Burger's equation comparing numerical fluxes.
    </surround>|<pageref|auto-69>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.20>|>
      Solution of Buckley-Leverett model.
    </surround>|<pageref|auto-71>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.21>|>
      Density error convergence for 1-D Euler's equation.
    </surround>|<pageref|auto-74>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.22>|>
      Numerical solutions of Sod's test case.
    </surround>|<pageref|auto-76>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.23>|>
      Numerical solutions of Lax's test case.
    </surround>|<pageref|auto-78>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.24>|>
      Numerical solutions of Shu-Osher problem.
    </surround>|<pageref|auto-80>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.25>|>
      Numerical solutions of blast wave.
    </surround>|<pageref|auto-82>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.26>|>
      Numerical solutions of Blast wave comparing different numerical fluxes.
    </surround>|<pageref|auto-84>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.27>|>
      Numerical solutions of 1-D Euler's equations with different numerical
      fluxes
    </surround>|<pageref|auto-85>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.28>|>
      Numerical solutions of Shu-Osher problem comparing Radau and
      <with|mode|math|g<rsub|2>> correction.
    </surround>|<pageref|auto-87>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.29>|>
      Solution and flux points on a 2-D FR element.
    </surround>|<pageref|auto-88>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.30>|>
      Stability region of 2-D LWFR with Radau correction and D2 dissipation.
    </surround>|<pageref|auto-91>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.31>|>
      Stability region of 2-D LWFR with the <with|mode|math|g<rsub|2>>
      correction and D2 dissipation.
    </surround>|<pageref|auto-92>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.32>|>
      Error convergence test for 2-D linear advection equation with velocity
      <with|mode|math|\<b-a\>=<around|(|1,1|)>>.
    </surround>|<pageref|auto-96>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.33>|>
      Linear advection with velocity <with|mode|math|\<b-a\>=<around|(|-y,x|)>>.
    </surround>|<pageref|auto-98>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.34>|>
      Error convergence test for 2-D linear advection equation with velocity
      <with|mode|math|\<b-a\>=<around|(|-y,x|)>>.
    </surround>|<pageref|auto-99>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.35>|>
      Numerical solutions of composite signal with velocity
      <with|mode|math|<with|font-series|bold|a>=<around*|(|<frac|1|2>-y,x-<frac|1|2>|)>>.
    </surround>|<pageref|auto-100>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.36>|>
      Line plot across the diagonal of the solution of 2-D Burger's equation.
    </surround>|<pageref|auto-102>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.37>|>
      Error convergence test for 2-D Burger's equation.
    </surround>|<pageref|auto-103>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.38>|>
      <with|mode|math|L<rsup|2>> error, WCT for isentropic vortex versus grid
      resolution.
    </surround>|<pageref|auto-106>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.39>|>
      Wall Clock Time (WCT) versus <with|mode|math|L<rsup|2>> error for
      isentropic vortex.
    </surround>|<pageref|auto-107>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.40>|>
      Wall Clock Time (WCT) ratios versus grid resolution for isentropic
      vortex.
    </surround>|<pageref|auto-108>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.41>|>
      Density profile of numerical solutions of double Mach reflection
      problem.
    </surround>|<pageref|auto-110>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.42>|>
      Enlarged density contours of density double Mach reflection problem.
    </surround>|<pageref|auto-111>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.43>|>
      Grid size versus WCT RK and LW for double Mach reflection problem.
    </surround>|<pageref|auto-112>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.1>|>
      Subcells used by lower order scheme for degree <with|mode|math|N=4>.
    </surround>|<pageref|auto-119>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.2>|>
      Logistic function used to map energy to a smoothness coefficient
      <with|mode|math|\<alpha\>\<in\><around|[|0,1|]>>.
    </surround>|<pageref|auto-121>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.3>|>
      Comparing TVB and blending schemes on Shu-Osher test.
    </surround>|<pageref|auto-130>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.4>|>
      Comparing TVB and blending schemes on blast wave.
    </surround>|<pageref|auto-132>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.5>|>
      Sedov's blast wave problem
    </surround>|<pageref|auto-134>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.6>|>
      Double rarefaction problem with LW-MH.
    </surround>|<pageref|auto-136>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.7>|>
      Leblanc's test with LW-MH.
    </surround>|<pageref|auto-137>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.8>|>
      TVB and blending schemes compared on composite signal.
    </surround>|<pageref|auto-139>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.9>|>
      Isentropic convergence with blending limiter.
    </surround>|<pageref|auto-142>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.10>|>
      LW-MH on 2-D Riemann problem.
    </surround>|<pageref|auto-144>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.11>|>
      Blending coefficient <with|mode|math|\<alpha\>> for 2-D Riemann
      problem.
    </surround>|<pageref|auto-145>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.12>|>
      2-D Riemann problem, percentage of elements with blending coefficient
      <with|mode|math|\<alpha\>\<gtr\>0> vs <with|mode|math|t>.
    </surround>|<pageref|auto-146>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.13>|>
      Double Mach reflection with LW-MH.
    </surround>|<pageref|auto-148>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.14>|>
      Kelvin-Helmholtz instability with LW-MH.
    </surround>|<pageref|auto-150>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.15>|>
      Mach 2000 astrophysical jet with LW-MH.
    </surround>|<pageref|auto-152>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.16>|>
      Sedov's blast with periodic domain, reference solution.
    </surround>|<pageref|auto-154>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.17>|>
      Sedov's blast with periodic domain, LW-MH.
    </surround>|<pageref|auto-155>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.18>|>
      Shock diffraction test with LW-MH.
    </surround>|<pageref|auto-157>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.19>|>
      Forward facing step with LW-MH.
    </surround>|<pageref|auto-159>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.20>|>
      Forward facing step, percentage of elements with blending coefficient
      <with|mode|math|\<alpha\>\<gtr\>0> vs <with|mode|math|t>.
    </surround>|<pageref|auto-160>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.1>|>
      Convergence of ten moment problem with sources.
    </surround>|<pageref|auto-172>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.2>|>
      Ten moment problem, Sod and two rarefaction tests.
    </surround>|<pageref|auto-174>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.3>|>
      Ten moment Shu-Osher problem.
    </surround>|<pageref|auto-176>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.4>|>
      Two rarefactions with source terms
    </surround>|<pageref|auto-178>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.5>|>
      Ten moment 2-D near vacuum test.
    </surround>|<pageref|auto-180>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.6>|>
      Uniform plasma with Gaussian source.
    </surround>|<pageref|auto-182>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.7>|>
      Ten moment, realistic simulation.
    </surround>|<pageref|auto-184>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.1>|>
      Convergence for constant advection, MDRK and RK.
    </surround>|<pageref|auto-203>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.2>|>
      Convergence for variable advection with
      <with|mode|math|a<around*|(|x|)>=x<rsup|2>>, MDRK and RK.
    </surround>|<pageref|auto-205>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.3>|>
      1-D Burgers' equation, <with|font-series|bold|AE> and
      <with|font-series|bold|EA> schemes, MDRK and RK.
    </surround>|<pageref|auto-207>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.4>|>
      MDRK D1 and D2 dissipation for 1-D Burgers' equation.
    </surround>|<pageref|auto-208>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.5>|>
      Blast wave, comparing TVB and blending schemes for MDRK.
    </surround>|<pageref|auto-211>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.6>|>
      Titarev-Toro problem, comparing blending schemes for MDRK.
    </surround>|<pageref|auto-213>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.7>|>
      High density problem, comparing blending schemes for MDRK.
    </surround>|<pageref|auto-215>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.8>|>
      Sedov's blast wave problem, comparing TVB and blending schemes for
      MDRK.
    </surround>|<pageref|auto-217>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.9>|>
      Double Mach reflection problem, MDRK.
    </surround>|<pageref|auto-220>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.10>|>
      Rotational low density problem at critical speed.
    </surround>|<pageref|auto-222>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.11>|>
      Rotational low density problem at various speeds.
    </surround>|<pageref|auto-223>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.12>|>
      2-D Riemann problem, MDRK.
    </surround>|<pageref|auto-225>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.13>|>
      Rayleigh-Taylor instability.
    </surround>|<pageref|auto-227>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.1>|>
      Illustration of curvilinear reference map.
    </surround>|<pageref|auto-234>>

    <glossary-1|<surround|<hidden-binding|<tuple>|8.2>||Subcells in a curved
    FR element>|<pageref|auto-240>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.3>|>
      AMR illustration(a) hanging nodes, (b) refinement & coarsening
    </surround>|<pageref|auto-247>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.4>|>
      AMR illustration (a) Prolongation, (b) Projection.
    </surround>|<pageref|auto-252>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.5>|>
      Mach 2000 astrophysical jet with adaptive time stepping.
    </surround>|<pageref|auto-262>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.6>|>
      Kelvin-Helmholtz instability, adaptive mesh and time stepping.
    </surround>|<pageref|auto-264>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.7>|>
      Double Mach reflection, adaptive mesh and time stepping.
    </surround>|<pageref|auto-266>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.8>|>
      Forward facing step, adaptive non-Cartesian mesh and adaptive time
      stepping.
    </surround>|<pageref|auto-268>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.9>|>
      Free stream solutions.
    </surround>|<pageref|auto-271>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.10>|>
      Isentropic vortex on curvilinear mesh.
    </surround>|<pageref|auto-273>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.11>|>
      Supersonic flow over cylinder, adaptive mesh and time stepping.
    </surround>|<pageref|auto-275>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.12>|>
      Mach 4 flow over blunt body, adaptive mesh and time stepping.
    </surround>|<pageref|auto-277>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.13>|>
      Adaptively refined NACA0012 airfoil mesh.
    </surround>|<pageref|auto-279>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.14>|>
      Transonic flow over airfoil, adaptive mesh and time stepping.
    </surround>|<pageref|auto-280>>

    <glossary-1|<surround|<hidden-binding|<tuple>|9.1>||Errikson-Johnson test
    (a) Initial condition (b) Numerical solution at
    <with|mode|math|t=1>>|<pageref|auto-294>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.2>|>
      Navier-Stokes equations with manufactured exact solution.
    </surround>|<pageref|auto-295>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.3>|>
      Convergence analysis for scalar advection-diffusion equation.
    </surround>|<pageref|auto-296>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.4>|>
      Convergence analysis for non-periodic advection-diffusion.
    </surround>|<pageref|auto-297>>

    <glossary-1|<surround|<hidden-binding|<tuple>|9.5>||Lid driven cavity,
    <with|mode|math|x>-velocity pseudocolor plot and velocity
    vectors.>|<pageref|auto-299>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.6>|>
      Velocity profiles of lid driven cavity test.
    </surround>|<pageref|auto-300>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.7>|>
      Mach number plot for transonic flow over an airfoil.
    </surround>|<pageref|auto-302>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.8>|>
      <with|mode|math|C<rsub|p>,C<rsub|f>> for transonic flow over airfoil.
    </surround>|<pageref|auto-303>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.9>|>
      Vorticity profile of Von Karman vortex street.
    </surround>|<pageref|auto-306>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.10>|>
      <with|mode|math|c<rsub|l>,c<rsub|d>> for Von Karman vortex street.
    </surround>|<pageref|auto-307>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|A.1>|>
      Error growth of LW-D1, LW-D2 and ADER schemes.
    </surround>|<pageref|auto-317>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|D.1>|>
      Cache blocking flux differentiation.
    </surround>|<pageref|auto-329>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.1>||Non-uniform,
    non-cell-centered finite volume grid>|<pageref|auto-335>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.2>||Two non-interacting
    Riemann problems>|<pageref|auto-338>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.3>||Finite volume
    evolution>|<pageref|auto-339>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.4>||Two non-interacting
    Riemann problems>|<pageref|auto-340>>
  </list-of-figures>

  <assign|list-fig|0><assign|list-fig|0><assign|glossary-1|<macro|left|right|Table
  <assign|list-fig|<plus|<value|list-fig>|1>><value|list-fig>.
  <arg|left><glossary-dots><arg|right>>>

  \;

  <\list-of-tables|table>
    <glossary-1|<\surround|<hidden-binding|<tuple>|4.1>|>
      CFL numbers for 1-D LWFR
    </surround>|<pageref|auto-42>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.2>|>
      Two dimensional CFL numbers for LWFR scheme.
    </surround>|<pageref|auto-93>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.1>|>
      CFL numbers for MDRK scheme.
    </surround>|<pageref|auto-198>>

    <glossary-1|<surround|<hidden-binding|<tuple>|8.1>||Number of time steps
    comparing error and CFL based methods>|<pageref|auto-282>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.1>|>
      Transonic flow over an airfoil compared with data from Swanson, Langer
      (2016).
    </surround>|<pageref|auto-304>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.2>|>
      <with|mode|math|c<rsub|l>,c<rsub|d>,St> for Von Karman vortex street.
    </surround>|<pageref|auto-308>>
  </list-of-tables>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|List
    of publications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|List
    of figures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|List
    of tables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-5><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|1.<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-6><vspace|0.5fn>

    1.1.<space|2spc>Lax-Wendroff <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7>

    1.2.<space|2spc>Flux Reconstruction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    1.3.<space|2spc>Shock capturing and admissibility preservation of FR
    schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>

    1.4.<space|2spc>Contributions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>

    1.5.<space|2spc>Outline <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|2.<space|2spc>Equations
    of motion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-12><vspace|0.5fn>

    2.1.<space|2spc>Hyperbolic conservation laws
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>

    <with|par-left|1tab|2.1.1.<space|2spc>Weak formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|2.1.2.<space|2spc>Entropy condition
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|1tab|2.1.3.<space|2spc>The Riemann problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    2.2.<space|2spc>Compressible Euler's equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>

    2.3.<space|2spc>Compressible Navier-Stokes equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|3.<space|2spc>Flux
    Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-21><vspace|0.5fn>

    3.1.<space|2spc>Conservation law <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>

    3.2.<space|2spc>Finite volume method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>

    3.3.<space|2spc>Runge-Kutta DG <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>

    3.4.<space|2spc>Runge-Kutta FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|4.<space|2spc>Lax-Wendroff
    Flux Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-27><vspace|0.5fn>

    4.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-28>

    4.2.<space|2spc>Lax-Wendroff FR scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29>

    <with|par-left|1tab|4.2.1.<space|2spc>Conservation property
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-30>>

    <with|par-left|1tab|4.2.2.<space|2spc>Reconstruction of the time average
    flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-31>>

    <with|par-left|1tab|4.2.3.<space|2spc>Direct flux reconstruction (DFR)
    scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-32>>

    <with|par-left|1tab|4.2.4.<space|2spc>Approximate Lax-Wendroff procedure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-33>>

    <with|par-left|2tab|4.2.4.1.<space|2spc>Second order scheme,
    <with|mode|math|N=1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-34>>

    <with|par-left|2tab|4.2.4.2.<space|2spc>Third order scheme,
    <with|mode|math|N=2> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-35>>

    <with|par-left|2tab|4.2.4.3.<space|2spc>Fourth order scheme,
    <with|mode|math|N=3> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    <with|par-left|2tab|4.2.4.4.<space|2spc>Fifth order scheme,
    <with|mode|math|N=4> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-37>>

    4.3.<space|2spc>Numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-38>

    <with|par-left|1tab|4.3.1.<space|2spc>Numerical flux \U average and
    extrapolate to face (<with|font-series|bold|AE>)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-39>>

    <with|par-left|1tab|4.3.2.<space|2spc>Numerical flux \U extrapolate to
    face and average (<with|font-series|bold|EA>)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-40>>

    4.4.<space|2spc>Fourier stability analysis in 1-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-41>

    4.5.<space|2spc>Boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-43>

    4.6.<space|2spc>TVD limiter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-44>

    4.7.<space|2spc>Numerical results in 1-D: scalar problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-45>

    <with|par-left|1tab|4.7.1.<space|2spc>Linear advection equation: constant
    speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>>

    <with|par-left|2tab|4.7.1.1.<space|2spc>Smooth solutions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-47>>

    <with|par-left|2tab|4.7.1.2.<space|2spc>Non-smooth solutions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-56>>

    <with|par-left|1tab|4.7.2.<space|2spc>Linear equation with variable
    coefficient <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-62>>

    <with|par-left|1tab|4.7.3.<space|2spc>Inviscid Burgers' equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-66>>

    <with|par-left|1tab|4.7.4.<space|2spc>Non-convex problem:
    Buckley-Leverett equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-70>>

    4.8.<space|2spc>Numerical results in 1-D: Euler equations
    \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-72>

    <with|par-left|1tab|4.8.1.<space|2spc>Smooth solution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-73>>

    <with|par-left|1tab|4.8.2.<space|2spc>Sod's shock tube problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-75>>

    <with|par-left|1tab|4.8.3.<space|2spc>Lax problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-77>>

    <with|par-left|1tab|4.8.4.<space|2spc>Shu-Osher problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-79>>

    <with|par-left|1tab|4.8.5.<space|2spc>Blast wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-81>>

    <with|par-left|1tab|4.8.6.<space|2spc>Numerical fluxes: LF, Roe, HLL and
    HLLC <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-83>>

    <with|par-left|1tab|4.8.7.<space|2spc>Comparison of correction functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-86>>

    4.9.<space|2spc>Two dimensional scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-89>

    <with|par-left|1tab|4.9.1.<space|2spc>Fourier analysis in 2-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-90>>

    4.10.<space|2spc>Numerical results in 2D: scalar problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-94>

    <with|par-left|1tab|4.10.1.<space|2spc>Advection of a smooth signal
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-95>>

    <with|par-left|1tab|4.10.2.<space|2spc>Rotation of a composite signal
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-97>>

    <with|par-left|1tab|4.10.3.<space|2spc>Inviscid Burgers' equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-101>>

    4.11.<space|2spc>Numerical results in 2-D: Euler equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-104>

    <with|par-left|1tab|4.11.1.<space|2spc>Isentropic vortex
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-105>>

    <with|par-left|1tab|4.11.2.<space|2spc>Double Mach reflection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-109>>

    4.12.<space|2spc>Summary <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-113>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|5.<space|2spc>Admissibility
    preserving subcell based blending limiter>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-114><vspace|0.5fn>

    5.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-115>

    5.2.<space|2spc>Admissibility preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-116>

    5.3.<space|2spc>On controlling oscillations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-117>

    <with|par-left|1tab|5.3.1.<space|2spc>Blending scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-118>>

    <with|par-left|1tab|5.3.2.<space|2spc>Smoothness indicator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-120>>

    <with|par-left|1tab|5.3.3.<space|2spc>First order blending
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-122>>

    5.4.<space|2spc>Higher order blending
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-123>

    <with|par-left|1tab|5.4.1.<space|2spc>Slope limiting in practice
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-124>>

    5.5.<space|2spc>Flux limiter for admissibility preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-125>

    5.6.<space|2spc>Some implementation details
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-126>

    5.7.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-127>

    <with|par-left|1tab|5.7.1.<space|2spc>1-D Euler equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-128>>

    <with|par-left|2tab|5.7.1.1.<space|2spc>Shu-Osher problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-129>>

    <with|par-left|2tab|5.7.1.2.<space|2spc>Blast wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-131>>

    <with|par-left|2tab|5.7.1.3.<space|2spc>Sedov's blast wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-133>>

    <with|par-left|2tab|5.7.1.4.<space|2spc>Riemann problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-135>>

    5.8.<space|2spc>2-D advection equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-138>

    5.9.<space|2spc>2-D Euler equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-140>

    <with|par-left|1tab|5.9.1.<space|2spc>Isentropic vortex convergence test
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-141>>

    <with|par-left|1tab|5.9.2.<space|2spc>2-D Riemann problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-143>>

    <with|par-left|1tab|5.9.3.<space|2spc>Double Mach reflection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-147>>

    <with|par-left|1tab|5.9.4.<space|2spc>Kelvin-Helmholtz instability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-149>>

    <with|par-left|1tab|5.9.5.<space|2spc>Astrophysical jet
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-151>>

    <with|par-left|1tab|5.9.6.<space|2spc>Sedov's blast case with periodic
    boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-153>>

    <with|par-left|1tab|5.9.7.<space|2spc>Detonation shock diffraction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-156>>

    <with|par-left|1tab|5.9.8.<space|2spc>Forward facing step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-158>>

    5.10.<space|2spc>Summary and conclusions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-161>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|6.<space|2spc>Generalized
    admissibility preservation with source terms>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-162><vspace|0.5fn>

    6.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-163>

    6.2.<space|2spc>LWFR for source terms
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-164>

    <with|par-left|1tab|6.2.1.<space|2spc>Approximate Lax-Wendroff procedure
    for degree <with|mode|math|N=2> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-165>>

    <with|par-left|1tab|6.2.2.<space|2spc>Admissibility preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-166>>

    6.3.<space|2spc>Limiting time averages
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-167>

    <with|par-left|1tab|6.3.1.<space|2spc>Limiting time average flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-168>>

    <with|par-left|1tab|6.3.2.<space|2spc>Limiting time average sources
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-169>>

    6.4.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-170>

    <with|par-left|1tab|6.4.1.<space|2spc>Convergence test
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-171>>

    <with|par-left|1tab|6.4.2.<space|2spc>Riemann problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-173>>

    <with|par-left|1tab|6.4.3.<space|2spc>Shu-Osher test
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-175>>

    <with|par-left|1tab|6.4.4.<space|2spc>Two rarefactions with source terms
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-177>>

    <with|par-left|1tab|6.4.5.<space|2spc>Two dimensional near vacuum test
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-179>>

    <with|par-left|1tab|6.4.6.<space|2spc>Uniform plasma state with Gaussian
    source <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-181>>

    <with|par-left|1tab|6.4.7.<space|2spc>Realistic simulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-183>>

    6.5.<space|2spc>Summary and Conclusions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-185>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|7.<space|2spc>Multi-derivative
    Runge-Kutta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-186><vspace|0.5fn>

    7.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-187>

    7.2.<space|2spc>Multi-derivative Runge-Kutta FR scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-188>

    <with|par-left|1tab|7.2.1.<space|2spc>Conservation property
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-189>>

    <with|par-left|1tab|7.2.2.<space|2spc>Reconstruction of the time average
    flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-190>>

    <with|par-left|1tab|7.2.3.<space|2spc>Approximate Lax-Wendroff procedure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-191>>

    <with|par-left|1tab|7.2.4.<space|2spc>Numerical flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-192>>

    <with|par-left|1tab|7.2.5.<space|2spc>Numerical flux \U average and
    extrapolate to face (AE) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-193>>

    <with|par-left|1tab|7.2.6.<space|2spc>Numerical flux \U extrapolate to
    face and average (EA) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-194>>

    7.3.<space|2spc>Fourier stability analysis
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-195>

    <with|par-left|1tab|7.3.1.<space|2spc>Stage 1
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-196>>

    <with|par-left|1tab|7.3.2.<space|2spc>Stage 2
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-197>>

    7.4.<space|2spc>Blending scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-199>

    7.5.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-200>

    <with|par-left|1tab|7.5.1.<space|2spc>Scalar equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-201>>

    <with|par-left|2tab|7.5.1.1.<space|2spc>Linear advection equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-202>>

    <with|par-left|2tab|7.5.1.2.<space|2spc>Variable advection equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-204>>

    <with|par-left|2tab|7.5.1.3.<space|2spc>Burgers' equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-206>>

    <with|par-left|1tab|7.5.2.<space|2spc>1-D Euler equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-209>>

    <with|par-left|2tab|7.5.2.1.<space|2spc>Blast
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-210>>

    <with|par-left|2tab|7.5.2.2.<space|2spc>Titarev Toro
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-212>>

    <with|par-left|2tab|7.5.2.3.<space|2spc>Large density ratio Riemann
    problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-214>>

    <with|par-left|2tab|7.5.2.4.<space|2spc>Sedov's blast
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-216>>

    <with|par-left|1tab|7.5.3.<space|2spc>2-D Euler's equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-218>>

    <with|par-left|2tab|7.5.3.1.<space|2spc>Double Mach reflection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-219>>

    <with|par-left|2tab|7.5.3.2.<space|2spc>Rotational low density problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-221>>

    <with|par-left|2tab|7.5.3.3.<space|2spc>Two Dimensional Riemann problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-224>>

    <with|par-left|2tab|7.5.3.4.<space|2spc>Rayleigh-Taylor instability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-226>>

    7.6.<space|2spc>Summary and conclusions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-228>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|8.<space|2spc>Curvilinear
    grids> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-229><vspace|0.5fn>

    8.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-230>

    8.2.<space|2spc>Conservation laws and curvilinear grids
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-231>

    8.3.<space|2spc>LWFR on curvilinear grids
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-232>

    <with|par-left|1tab|8.3.1.<space|2spc>Flux Reconstruction (FR)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-233>>

    <with|par-left|1tab|8.3.2.<space|2spc>Lax-Wendroff Flux Reconstruction
    (LWFR) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-235>>

    <with|par-left|1tab|8.3.3.<space|2spc>Approximate Lax-Wendroff procedure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-236>>

    <with|par-left|1tab|8.3.4.<space|2spc>Free stream preservation for LWFR
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-237>>

    8.4.<space|2spc>Shock capturing and admissibility preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-238>

    <with|par-left|1tab|8.4.1.<space|2spc>Low order scheme for curvilinear
    grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-239>>

    <with|par-left|1tab|8.4.2.<space|2spc>Smoothness indicator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-241>>

    <with|par-left|1tab|8.4.3.<space|2spc>Flux limiter for admissibility
    preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-242>>

    <with|par-left|2tab|8.4.3.1.<space|2spc>Flux limiter for admissibility
    preservation in 1-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-243>>

    <with|par-left|2tab|8.4.3.2.<space|2spc>Flux limiter for admissibility
    preservation on curved meshes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-244>>

    8.5.<space|2spc>Adaptive mesh refinement
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-245>

    <with|par-left|1tab|8.5.1.<space|2spc>Solution transfer between element
    and subelements <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-246>>

    <with|par-left|2tab|8.5.1.1.<space|2spc>Interpolation for refinement
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-248>>

    <with|par-left|2tab|8.5.1.2.<space|2spc>Projection for coarsening
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-249>>

    <with|par-left|1tab|8.5.2.<space|2spc>Mortar element method (MEM)
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-250>>

    <with|par-left|2tab|8.5.2.1.<space|2spc>Motivation and notation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-251>>

    <with|par-left|2tab|8.5.2.2.<space|2spc>Prolongation to mortars
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-253>>

    <with|par-left|2tab|8.5.2.3.<space|2spc>Projection of numerical fluxes
    from mortars to faces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-254>>

    <with|par-left|1tab|8.5.3.<space|2spc>AMR indicators
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-255>>

    8.6.<space|2spc>Time stepping <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-256>

    <with|par-left|1tab|8.6.1.<space|2spc>Error estimation for Runge-Kutta
    schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-257>>

    <with|par-left|1tab|8.6.2.<space|2spc>Error based time stepping for
    Lax-Wendroff flux reconstruction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-258>>

    8.7.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-259>

    <with|par-left|1tab|8.7.1.<space|2spc>Results on Cartesian grids
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-260>>

    <with|par-left|2tab|8.7.1.1.<space|2spc>Mach 2000 astrophysical jet
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-261>>

    <with|par-left|2tab|8.7.1.2.<space|2spc>Kelvin-Helmholtz instability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-263>>

    <with|par-left|2tab|8.7.1.3.<space|2spc>Double mach reflection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-265>>

    <with|par-left|2tab|8.7.1.4.<space|2spc>Forward facing step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-267>>

    <with|par-left|1tab|8.7.2.<space|2spc>Results on curved grids
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-269>>

    <with|par-left|2tab|8.7.2.1.<space|2spc>Free stream preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-270>>

    <with|par-left|2tab|8.7.2.2.<space|2spc>Isentropic vortex
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-272>>

    <with|par-left|2tab|8.7.2.3.<space|2spc>Supersonic flow over cylinder
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-274>>

    <with|par-left|2tab|8.7.2.4.<space|2spc>Inviscid bow shock upstream of a
    blunt body <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-276>>

    <with|par-left|2tab|8.7.2.5.<space|2spc>Transonic flow over NACA0012
    airfoil <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-278>>

    <with|par-left|1tab|8.7.3.<space|2spc>Performance comparison of time
    stepping schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-281>>

    8.8.<space|2spc>Summary and conclusions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-283>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|9.<space|2spc>Parabolic
    equations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-284><vspace|0.5fn>

    9.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-285>

    9.2.<space|2spc>Curvilinear coordinates for parabolic equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-286>

    9.3.<space|2spc>Lax-Wendroff flux reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-287>

    <with|par-left|1tab|9.3.1.<space|2spc>Solving for \<b-q\>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-288>>

    <with|par-left|1tab|9.3.2.<space|2spc>Time averaging
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-289>>

    <with|par-left|2tab|9.3.2.1.<space|2spc>Approximate Lax-Wendroff
    procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-290>>

    <with|par-left|1tab|9.3.3.<space|2spc>Free stream preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-291>>

    9.4.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-292>

    <with|par-left|1tab|9.4.1.<space|2spc>Convergence test
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-293>>

    <with|par-left|1tab|9.4.2.<space|2spc>Lid driven cavity
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-298>>

    <with|par-left|1tab|9.4.3.<space|2spc>Transonic flow past NACA-0012
    airfoil <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-301>>

    <with|par-left|1tab|9.4.4.<space|2spc>Flow past a cylinder
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-305>>

    9.5.<space|2spc>Summary and Conclusion
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-309>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|10.<space|2spc>Conclusions>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-310><vspace|0.5fn>

    10.1.<space|2spc>Future scope <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-311>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    A.<space|2spc>ADER-FR and LWFR for linear problems>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-312><vspace|0.5fn>

    A.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-313>

    A.2.<space|2spc>ADER Discontinuous Galerkin and Flux Reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-314>

    A.3.<space|2spc>Equivalence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-315>

    A.4.<space|2spc>Numerical validation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-316>

    A.5.<space|2spc>Conclusions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-318>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    B.<space|2spc>Some numerical fluxes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-319><vspace|0.5fn>

    B.1.<space|2spc>Rusanov flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-320>

    B.2.<space|2spc>Roe flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-321>

    B.3.<space|2spc>HLL flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-322>

    B.4.<space|2spc>HLLC flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-323>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    C.<space|2spc>Equivalence of DG and FR>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-324><vspace|0.5fn>

    C.1.<space|2spc>Discontinuous Galerkin on curvilinear grids
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-325>

    C.2.<space|2spc>Equivalence with Flux Reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-326>

    <with|par-left|1tab|C.2.1.<space|2spc>Corrector function identitites
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-327>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    D.<space|2spc>Efficient local differential operators>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-328><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    E.<space|2spc>Equivalence with DFR> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-330><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    F.<space|2spc>Scaling limiter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-331><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    G.<space|2spc>Admissibility of MUSCL-Hancock on general grids>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-332><vspace|0.5fn>

    G.1.<space|2spc>Introduction and notations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-333>

    G.2.<space|2spc>Review of MUSCL-Hancock scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-334>

    G.3.<space|2spc>Primary generalization for proof
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-336>

    G.4.<space|2spc>Proving admissibility
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-337>

    G.5.<space|2spc>Non-conservation reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-341>

    G.6.<space|2spc>MUSCL-Hancock scheme in 2-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-342>

    <with|par-left|1tab|G.6.1.<space|2spc>First evolution step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-343>>

    <with|par-left|1tab|G.6.2.<space|2spc>Finite volume step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-344>>

    <with|par-left|1tab|G.6.3.<space|2spc>Limiting numerical flux in 2-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-345>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    H.<space|2spc>Formal accuracy of multiderivative RK>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-346><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-347><vspace|0.5fn>
  </table-of-contents>

  <include|abstract.tm>

  <include|ch0_introduction.tm>

  <include|ch1_hyperbolic_conservation_laws.tm>

  <include|ch1b_finite_volume_method.tm>

  <include|ch2_lax_wendroff_flux_reconstruction.tm>

  <include|ch3_blending_limiter.tm>

  <include|ch5_10_moment_problem.tm>

  <include|ch4_mdrk.tm>

  <include|ch6_curved_meshes.tm>

  <include|ch_parabolic.tm>

  <include|conclusion.tm>

  <include|appendix.tm>

  <include|bibliography.tm>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|info-flag|detailed>
    <associate|page-even|1.0in>
    <associate|page-medium|paper>
    <associate|page-odd|1.0in>
    <associate|page-screen-left|5mm>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|project-flag|true>
  </collection>
</initial>

<\attachments>
  <\collection>
    <\associate|bib-bibliography>
      <\db-entry|+1ZeFeLzoEte35Uu|article|Dumbser2018>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Michael <name|Dumbser><name-sep>Francesco
        <name|Fambri><name-sep>Maurizio <name|Tavelli><name-sep>Michael
        <name|Bader><name-sep>Tobias <name|Weinzierl>>

        <db-field|title|Efficient Implementation of ADER Discontinuous
        Galerkin Schemes for a Scalable Hyperbolic PDE Engine>

        <db-field|journal|Axioms>

        <db-field|year|2018>

        <db-field|volume|7>

        <db-field|number|3>

        <db-field|pages|63>

        <db-field|month|sep>

        <db-field|note|bibtex: Dumbser2018>

        <db-field|copyright|<slink|http://creativecommons.org/licenses/by/3.0/>>

        <db-field|url|<slink|https://www.mdpi.com/2075-1680/7/3/63>>

        <db-field|doi|10.3390/axioms7030063>

        <db-field|language|en>

        <db-field|urldate|2021-10-06>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35T0|article|Qiu2005b>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Jianxian <name|Qiu><name-sep>Michael
        <name|Dumbser><name-sep>Chi-Wang <name|Shu>>

        <db-field|title|The discontinuous Galerkin method with Lax\UWendroff
        type time discretizations>

        <db-field|journal|Computer Methods in Applied Mechanics and
        Engineering>

        <db-field|year|2005>

        <db-field|volume|194>

        <db-field|number|42-44>

        <db-field|pages|4528\U4543>

        <db-field|month|oct>

        <db-field|issn|00457825>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S004578250400533X>>

        <db-field|doi|10.1016/j.cma.2004.11.007>

        <db-field|language|en>

        <db-field|urldate|2021-07-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uj|article|Lax1960>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Peter <name|Lax><name-sep>Burton <name|Wendroff>>

        <db-field|title|Systems of conservation laws>

        <db-field|journal|Communications on Pure and Applied Mathematics>

        <db-field|year|1960>

        <db-field|volume|13>

        <db-field|number|2>

        <db-field|pages|217\U237>

        <db-field|month|may>

        <db-field|note|bibtex: Lax1960>

        <db-field|issn|00103640, 10970312>

        <db-field|url|<slink|https://onlinelibrary.wiley.com/doi/10.1002/cpa.3160130205>>

        <db-field|doi|10.1002/cpa.3160130205>

        <db-field|language|en>

        <db-field|urldate|2021-08-09>

        <db-field|file|Submitted Version:/Users/praveen/Zotero/storage/G3GLBI4Z/Lax
        and Wendroff - 1960 - Systems of conservation
        laws.pdf:application/pdf>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uv|article|Safjan1995>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|A. <name|Safjan><name-sep>J.T. <name|Oden>>

        <db-field|title|High-Order Taylor-Galerkin Methods for Linear
        Hyperbolic Systems>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1995>

        <db-field|volume|120>

        <db-field|number|2>

        <db-field|pages|206\U230>

        <db-field|month|sep>

        <db-field|note|bibtex: Safjan1995>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S002199918571159X>>

        <db-field|doi|10.1006/jcph.1995.1159>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uw|article|Tabarrok1994>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|B <name|Tabarrok><name-sep>Jichao <name|Su>>

        <db-field|title|Semi-implicit Taylor\VGalerkin finite element methods
        for incompressible viscous flows>

        <db-field|journal|Computer Methods in Applied Mechanics and
        Engineering>

        <db-field|year|1994>

        <db-field|volume|117>

        <db-field|number|3-4>

        <db-field|pages|391\U410>

        <db-field|month|aug>

        <db-field|note|bibtex: Tabarrok1994>

        <db-field|issn|00457825>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/0045782594901252>>

        <db-field|doi|10.1016/0045-7825(94)90125-2>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ux|article|Youn1995>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Sung-Kie <name|Youn><name-sep>Sang-Hoon <name|Park>>

        <db-field|title|A new direct higher-order Taylor-Galerkin finite
        element method>

        <db-field|journal|Computers & Structures>

        <db-field|year|1995>

        <db-field|volume|56>

        <db-field|number|4>

        <db-field|pages|651\U656>

        <db-field|month|aug>

        <db-field|note|bibtex: Youn1995>

        <db-field|issn|00457949>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/004579499400561G>>

        <db-field|doi|10.1016/0045-7949(94)00561-G>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uy|article|Choe1991>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Kyu Y. <name|Choe><name-sep>Keith A.
        <name|Holsapple>>

        <db-field|title|The Taylor-Galerkin discontinuous finite element
        method\VAn explicit scheme for nonlinear hyperbolic conservation
        laws>

        <db-field|journal|Finite Elements in Analysis and Design>

        <db-field|year|1991>

        <db-field|volume|10>

        <db-field|number|3>

        <db-field|pages|243\U265>

        <db-field|month|dec>

        <db-field|note|bibtex: Choe1991>

        <db-field|issn|0168874X>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/0168874X9190012N>>

        <db-field|doi|10.1016/0168-874X(91)90012-N>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uz|article|Choe1992>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Kyu Y. <name|Choe><name-sep>Keith A.
        <name|Holsapple>>

        <db-field|title|The discontinuous finite element method with the
        Taylor-Galerkin approach for nonlinear hyperbolic conservation laws>

        <db-field|journal|Computer Methods in Applied Mechanics and
        Engineering>

        <db-field|year|1992>

        <db-field|volume|95>

        <db-field|number|2>

        <db-field|pages|141\U167>

        <db-field|month|mar>

        <db-field|note|bibtex: Choe1992>

        <db-field|issn|00457825>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/004578259290138A>>

        <db-field|doi|10.1016/0045-7825(92)90138-A>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tz|article|Qiu2003>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Jianxian <name|Qiu><name-sep>Chi-Wang <name|Shu>>

        <db-field|title|Finite Difference WENO Schemes with
        Lax--Wendroff-Type Time Discretizations>

        <db-field|journal|SIAM Journal on Scientific Computing>

        <db-field|year|2003>

        <db-field|volume|24>

        <db-field|number|6>

        <db-field|pages|2185\U2198>

        <db-field|month|jan>

        <db-field|note|bibtex: Qiu2003>

        <db-field|issn|1064-8275, 1095-7197>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/S1064827502412504>>

        <db-field|doi|10.1137/S1064827502412504>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35T1|article|Shu1989>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Chi-Wang <name|Shu><name-sep>Stanley <name|Osher>>

        <db-field|title|Efficient implementation of essentially
        non-oscillatory shock-capturing schemes, II>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1989>

        <db-field|volume|83>

        <db-field|number|1>

        <db-field|pages|32\U78>

        <db-field|month|jul>

        <db-field|issn|00219991>

        <db-field|url|<slink|http://linkinghub.elsevier.com/retrieve/pii/0021999189902222>>

        <db-field|doi|10.1016/0021-9991(89)90222-2>

        <db-field|language|en>

        <db-field|urldate|2018-07-03>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uk|article|Jiang2013>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Yan <name|Jiang><name-sep>Chi-Wang
        <name|Shu><name-sep>Mengping <name|Zhang>>

        <db-field|title|An Alternative Formulation of Finite Difference
        Weighted ENO Schemes with Lax--Wendroff Time Discretization for
        Conservation Laws>

        <db-field|journal|SIAM Journal on Scientific Computing>

        <db-field|year|2013>

        <db-field|volume|35>

        <db-field|number|2>

        <db-field|pages|0>

        <db-field|month|jan>

        <db-field|note|bibtex: Jiang2013>

        <db-field|issn|1064-8275, 1095-7197>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/120889885>>

        <db-field|doi|10.1137/120889885>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V0|article|Qiu2007>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Jianxian <name|Qiu>>

        <db-field|title|A Numerical Comparison of the Lax\UWendroff
        Discontinuous Galerkin Method Based on Different Numerical Fluxes>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2007>

        <db-field|volume|30>

        <db-field|number|3>

        <db-field|pages|345\U367>

        <db-field|month|mar>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-006-9109-5>>

        <db-field|doi|10.1007/s10915-006-9109-5>

        <db-field|language|en>

        <db-field|urldate|2018-12-07>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UQ|article|Guo2015>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Wei <name|Guo><name-sep>Jing-Mei
        <name|Qiu><name-sep>Jianxian <name|Qiu>>

        <db-field|title|A New Lax\UWendroff Discontinuous Galerkin Method
        with Superconvergence>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2015>

        <db-field|volume|65>

        <db-field|number|1>

        <db-field|pages|299\U326>

        <db-field|month|oct>

        <db-field|note|bibtex: Guo2015>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-014-9968-0>>

        <db-field|doi|10.1007/s10915-014-9968-0>

        <db-field|language|en>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V1|article|Cockburn1998a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bernardo <name|Cockburn><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|The Local Discontinuous Galerkin Method for
        Time-Dependent Convection-Diffusion Systems>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|1998>

        <db-field|volume|35>

        <db-field|number|6>

        <db-field|pages|2440\U2463>

        <db-field|month|dec>

        <db-field|issn|0036-1429, 1095-7170>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/S0036142997316712>>

        <db-field|doi|10.1137/S0036142997316712>

        <db-field|language|en>

        <db-field|urldate|2019-10-02>

        <db-field|file|Submitted Version:/Users/praveen/Zotero/storage/327G54HE/Cockburn
        and Shu - 1998 - The Local Discontinuous Galerkin Method for
        Time-D.pdf:application/pdf>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V2|article|Sun2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Zheng <name|Sun><name-sep>Chi-Wang <name|Shu>>

        <db-field|title|Stability analysis and error estimates of
        Lax\UWendroff discontinuous Galerkin methods for linear conservation
        laws>

        <db-field|journal|ESAIM: Mathematical Modelling and Numerical
        Analysis>

        <db-field|year|2017>

        <db-field|volume|51>

        <db-field|number|3>

        <db-field|pages|1063\U1087>

        <db-field|month|may>

        <db-field|note|bibtex: Sun2017>

        <db-field|issn|0764-583X, 1290-3841>

        <db-field|url|<slink|http://www.esaim-m2an.org/10.1051/m2an/2016049>>

        <db-field|doi|10.1051/m2an/2016049>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V3|incollection|Toro2001>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|E. F. <name|Toro><name-sep>R. C.
        <name|Millington><name-sep>L. A. M. <name|Nejad>>

        <db-field|title|Towards Very High Order Godunov Schemes>

        <db-field|booktitle|Godunov Methods>

        <db-field|pages|907\U940>

        <db-field|publisher|Springer US>

        <db-field|year|2001>

        <db-field|editor|E. F. <name|Toro>>

        <db-field|address|New York, NY>

        <db-field|note|bibtex: Toro2001>

        <db-field|isbn|978-1-4613-5183-2 978-1-4615-0663-8>

        <db-field|url|https://link.springer.com/10.1007/978-1-4615-0663-8<rsub|8>7>

        <db-field|language|en>

        <db-field|urldate|2021-08-13>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tw|article|Titarev2002>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|V. A. <name|Titarev><name-sep>E. F. <name|Toro>>

        <db-field|title|ADER: Arbitrary High Order Godunov Approach>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2002>

        <db-field|volume|17>

        <db-field|number|1/4>

        <db-field|pages|609\U618>

        <db-field|note|bibtex: Titarev2002>

        <db-field|issn|08857474>

        <db-field|url|<slink|http://link.springer.com/10.1023/A:1015126814947>>

        <db-field|doi|10.1023/A:1015126814947>

        <db-field|urldate|2021-08-11>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uo|article|Artzi2006>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Matania <name|Ben-Artzi><name-sep>Jiequan
        <name|Li><name-sep>Gerald <name|Warnecke>>

        <db-field|title|A direct Eulerian GRP scheme for compressible fluid
        flows>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2006>

        <db-field|volume|218>

        <db-field|number|1>

        <db-field|pages|19\U43>

        <db-field|month|oct>

        <db-field|note|bibtex: Artzi2006>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999106000581>>

        <db-field|doi|10.1016/j.jcp.2006.01.044>

        <db-field|language|en>

        <db-field|urldate|2021-08-13>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Up|article|Han2010>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Ee <name|Han><name-sep>Jiequan
        <name|Li><name-sep>Huazhong <name|Tang>>

        <db-field|title|An adaptive GRP scheme for compressible fluid flows>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2010>

        <db-field|volume|229>

        <db-field|number|5>

        <db-field|pages|1448\U1466>

        <db-field|month|mar>

        <db-field|note|bibtex: Han2010>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999109005993>>

        <db-field|doi|10.1016/j.jcp.2009.10.038>

        <db-field|language|en>

        <db-field|urldate|2021-08-13>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ut|article|Dumbser2006>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Michael <name|Dumbser><name-sep>Claus-Dieter
        <name|Munz>>

        <db-field|title|Building Blocks for Arbitrary High Order
        Discontinuous Galerkin Schemes>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2006>

        <db-field|volume|27>

        <db-field|number|1-3>

        <db-field|pages|215\U230>

        <db-field|month|jun>

        <db-field|note|bibtex: Dumbser2006>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-005-9025-0>>

        <db-field|doi|10.1007/s10915-005-9025-0>

        <db-field|language|en>

        <db-field|urldate|2021-08-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tx|article|Titarev2005>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|V.A. <name|Titarev><name-sep>E.F. <name|Toro>>

        <db-field|title|ADER schemes for three-dimensional non-linear
        hyperbolic systems>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2005>

        <db-field|volume|204>

        <db-field|number|2>

        <db-field|pages|715\U736>

        <db-field|month|apr>

        <db-field|note|bibtex: Titarev2005>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999104004358>>

        <db-field|doi|10.1016/j.jcp.2004.10.028>

        <db-field|language|en>

        <db-field|urldate|2021-08-13>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uq|article|Kaser2005>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Martin <name|Käser><name-sep>Armin <name|Iske>>

        <db-field|title|ADER schemes on adaptive triangular meshes for scalar
        conservation laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2005>

        <db-field|volume|205>

        <db-field|number|2>

        <db-field|pages|486\U508>

        <db-field|month|may>

        <db-field|note|bibtex: Kaser2005>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999104004772>>

        <db-field|doi|10.1016/j.jcp.2004.11.015>

        <db-field|language|en>

        <db-field|urldate|2021-08-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ur|article|Dumbser2007>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Michael <name|Dumbser><name-sep>Martin
        <name|Käser><name-sep>Vladimir A. <name|Titarev><name-sep>Eleuterio
        F. <name|Toro>>

        <db-field|title|Quadrature-free non-oscillatory finite volume schemes
        on unstructured meshes for nonlinear hyperbolic systems>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2007>

        <db-field|volume|226>

        <db-field|number|1>

        <db-field|pages|204\U243>

        <db-field|month|sep>

        <db-field|note|bibtex: Dumbser2007>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999107001520>>

        <db-field|doi|10.1016/j.jcp.2007.04.004>

        <db-field|language|en>

        <db-field|urldate|2021-08-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Us|article|Castro2008>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|C.E. <name|Castro><name-sep>E.F. <name|Toro>>

        <db-field|title|Solvers for the high-order Riemann problem for
        hyperbolic balance laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2008>

        <db-field|volume|227>

        <db-field|number|4>

        <db-field|pages|2481\U2513>

        <db-field|month|feb>

        <db-field|note|bibtex: Castro2008>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999107004780>>

        <db-field|doi|10.1016/j.jcp.2007.11.013>

        <db-field|language|en>

        <db-field|urldate|2021-08-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ul|article|Dumbser2008>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Michael <name|Dumbser><name-sep>Dinshaw S.
        <name|Balsara><name-sep>Eleuterio F.
        <name|Toro><name-sep>Claus-Dieter <name|Munz>>

        <db-field|title|A unified framework for the construction of one-step
        finite volume and discontinuous Galerkin schemes on unstructured
        meshes>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2008>

        <db-field|volume|227>

        <db-field|number|18>

        <db-field|pages|8209\U8253>

        <db-field|month|sep>

        <db-field|issn|00219991>

        <db-field|url|<slink|http://linkinghub.elsevier.com/retrieve/pii/S0021999108002829>>

        <db-field|doi|10.1016/j.jcp.2008.05.025>

        <db-field|language|en>

        <db-field|urldate|2018-07-03>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V4|article|Dumbser2008a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Michael <name|Dumbser><name-sep>Cedric
        <name|Enaux><name-sep>Eleuterio F. <name|Toro>>

        <db-field|title|Finite volume schemes of very high order of accuracy
        for stiff hyperbolic balance laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2008>

        <db-field|volume|227>

        <db-field|number|8>

        <db-field|pages|3971\U4001>

        <db-field|month|apr>

        <db-field|note|bibtex: Dumbser2008a>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999107005578>>

        <db-field|doi|10.1016/j.jcp.2007.12.005>

        <db-field|language|en>

        <db-field|urldate|2021-08-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UH|article|Gassner2011a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Gregor <name|Gassner><name-sep>Michael
        <name|Dumbser><name-sep>Florian <name|Hindenlang><name-sep>Claus-Dieter
        <name|Munz>>

        <db-field|title|Explicit one-step time discretizations for
        discontinuous Galerkin and finite volume schemes based on local
        predictors>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2011>

        <db-field|volume|230>

        <db-field|number|11>

        <db-field|pages|4232\U4247>

        <db-field|month|may>

        <db-field|note|bibtex: Gassner2011a>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999110005802>>

        <db-field|doi|10.1016/j.jcp.2010.10.024>

        <db-field|language|en>

        <db-field|urldate|2021-08-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Um|article|Balsara2009a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Dinshaw S. <name|Balsara><name-sep>Tobias
        <name|Rumpf><name-sep>Michael <name|Dumbser><name-sep>Claus-Dieter
        <name|Munz>>

        <db-field|title|Efficient, high accuracy ADER-WENO schemes for
        hydrodynamics and divergence-free magnetohydrodynamics>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2009>

        <db-field|volume|228>

        <db-field|number|7>

        <db-field|pages|2480\U2516>

        <db-field|month|apr>

        <db-field|issn|00219991>

        <db-field|url|<slink|http://linkinghub.elsevier.com/retrieve/pii/S0021999108006396>>

        <db-field|doi|10.1016/j.jcp.2008.12.003>

        <db-field|language|en>

        <db-field|urldate|2018-07-03>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Un|article|Guthrey2019>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Pierson T. <name|Guthrey><name-sep>James A.
        <name|Rossmanith>>

        <db-field|title|The Regionally Implicit Discontinuous Galerkin
        Method: Improving the Stability of DG-FEM>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|2019>

        <db-field|volume|57>

        <db-field|number|3>

        <db-field|pages|1263\U1288>

        <db-field|month|jan>

        <db-field|note|bibtex: Guthrey2019>

        <db-field|issn|0036-1429, 1095-7170>

        <db-field|shorttitle|The Regionally Implicit Discontinuous Galerkin
        Method>

        <db-field|url|<slink|https://epubs.siam.org/doi/10.1137/17M1156174>>

        <db-field|doi|10.1137/17M1156174>

        <db-field|language|en>

        <db-field|urldate|2021-08-13>

        <db-field|file|Submitted Version:/Users/praveen/Zotero/storage/DW72YEJX/Guthrey
        and Rossmanith - 2019 - The Regionally Implicit Discontinuous
        Galerkin Met.pdf:application/pdf>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V5|article|Montecinos2020>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Gino I. <name|Montecinos><name-sep>Dinshaw S.
        <name|Balsara>>

        <db-field|title|A simplified Cauchy-Kowalewskaya procedure for the
        local implicit solution of generalized Riemann problems of hyperbolic
        balance laws>

        <db-field|journal|Computers & Fluids>

        <db-field|year|2020>

        <db-field|volume|202>

        <db-field|pages|104490>

        <db-field|month|apr>

        <db-field|note|bibtex: Montecinos2020>

        <db-field|issn|0045-7930>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0045793020300633>>

        <db-field|doi|10.1016/j.compfluid.2020.104490>

        <db-field|language|en>

        <db-field|urldate|2021-12-24>

        <db-field|keywords|ADER schemes, Finite volume schemes, Generalized
        Riemann Problems, stiff source terms>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ss|article|Zorio2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|D. <name|Zorío><name-sep>A. <name|Baeza><name-sep>P.
        <name|Mulet>>

        <db-field|title|An Approximate Lax\UWendroff-Type Procedure for High
        Order Accurate Schemes for Hyperbolic Conservation Laws>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2017>

        <db-field|volume|71>

        <db-field|number|1>

        <db-field|pages|246\U273>

        <db-field|month|apr>

        <db-field|note|bibtex: Zorio2017>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-016-0298-2>>

        <db-field|doi|10.1007/s10915-016-0298-2>

        <db-field|language|en>

        <db-field|urldate|2021-07-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U2|article|Lee2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Youngjun <name|Lee><name-sep>Dongwook <name|Lee>>

        <db-field|title|A single-step third-order temporal discretization
        with Jacobian-free and Hessian-free formulations for finite
        difference methods>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2021>

        <db-field|volume|427>

        <db-field|pages|110063>

        <db-field|month|feb>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999120308378>>

        <db-field|doi|10.1016/j.jcp.2020.110063>

        <db-field|language|en>

        <db-field|urldate|2021-08-12>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U3|article|Burger2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Raimund <name|Bürger><name-sep>Sudarshan Kumar
        <name|Kenettinkara><name-sep>David <name|Zorío>>

        <db-field|title|Approximate Lax\UWendroff discontinuous Galerkin
        methods for hyperbolic conservation laws>

        <db-field|journal|Computers & Mathematics with Applications>

        <db-field|year|2017>

        <db-field|volume|74>

        <db-field|number|6>

        <db-field|pages|1288\U1310>

        <db-field|month|sep>

        <db-field|issn|08981221>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S089812211730367X>>

        <db-field|doi|10.1016/j.camwa.2017.06.019>

        <db-field|language|en>

        <db-field|urldate|2018-12-07>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U0|article|Carrillo2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|H. <name|Carrillo><name-sep>E.
        <name|Macca><name-sep>C. <name|Parés><name-sep>G.
        <name|Russo><name-sep>D. <name|Zorío>>

        <db-field|title|An order-adaptive compact approximation Taylor method
        for systems of conservation laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2021>

        <db-field|volume|438>

        <db-field|pages|110358>

        <db-field|month|aug>

        <db-field|note|bibtex: Carrillo2021>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999121002539>>

        <db-field|doi|10.1016/j.jcp.2021.110358>

        <db-field|language|en>

        <db-field|urldate|2021-09-09>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U1|article|Carrillo2021a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|H. <name|Carrillo><name-sep>C.
        <name|Parés><name-sep>D. <name|Zorío>>

        <db-field|title|Lax-Wendroff Approximate Taylor Methods with Fast and
        Optimized Weighted Essentially Non-oscillatory Reconstructions>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2021>

        <db-field|volume|86>

        <db-field|number|1>

        <db-field|pages|15>

        <db-field|month|jan>

        <db-field|note|bibtex: Carrillo2021a>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-020-01380-0>>

        <db-field|doi|10.1007/s10915-020-01380-0>

        <db-field|language|en>

        <db-field|urldate|2021-09-09>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35St|inproceedings|Huynh2007>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|H. T. <name|Huynh>>

        <db-field|title|A Flux Reconstruction Approach to High-Order Schemes
        Including Discontinuous Galerkin Methods>

        <db-field|year|2007>

        <db-field|address|Miami, FL>

        <db-field|month|jun>

        <db-field|publisher|AIAA>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tv|article|Trojak2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|W. <name|Trojak><name-sep>F. D. <name|Witherden>>

        <db-field|title|A new family of weighted one-parameter flux
        reconstruction schemes>

        <db-field|journal|Computers & Fluids>

        <db-field|year|2021>

        <db-field|volume|222>

        <db-field|pages|104918>

        <db-field|month|may>

        <db-field|note|bibtex: Trojak2021>

        <db-field|issn|0045-7930>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0045793021000840>>

        <db-field|doi|10.1016/j.compfluid.2021.104918>

        <db-field|language|en>

        <db-field|urldate|2021-11-02>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tt|article|Vincent2011a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|P. E. <name|Vincent><name-sep>P.
        <name|Castonguay><name-sep>A. <name|Jameson>>

        <db-field|title|A New Class of High-Order Energy Stable Flux
        Reconstruction Schemes>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2011>

        <db-field|volume|47>

        <db-field|number|1>

        <db-field|pages|50\U72>

        <db-field|month|apr>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|https://link.springer.com/article/10.1007/s10915-010-9420-z>>

        <db-field|doi|10.1007/s10915-010-9420-z>

        <db-field|abstract|The flux reconstruction approach to high-order
        methods is robust, efficient, simple to implement, and allows various
        high-order schemes, such as the nodal discontinuous Galerkin method
        and the spectral difference method, to be cast within a single
        unifying framework. Utilizing a flux reconstruction formulation, it
        has been proved (for one-dimensional linear advection) that the
        spectral difference method is stable for all orders of accuracy in a
        norm of Sobolev type, provided that the interior flux collocation
        points are located at zeros of the corresponding Legendre
        polynomials. In this article the aforementioned result is extended in
        order to develop a new class of one-dimensional energy stable flux
        reconstruction schemes. The energy stable schemes are parameterized
        by a single scalar quantity, which if chosen judiciously leads to the
        recovery of various well known high-order methods (including a
        particular nodal discontinuous Galerkin method and a particular
        spectral difference method). The analysis offers significant insight
        into why certain flux reconstruction schemes are stable, whereas
        others are not. Also, from a practical standpoint, the analysis
        provides a simple prescription for implementing an infinite range of
        energy stable high-order methods via the intuitive flux
        reconstruction approach.>

        <db-field|language|en>

        <db-field|urldate|2018-02-12>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tu|article|Vincent2015>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|P. E. <name|Vincent><name-sep>A. M.
        <name|Farrington><name-sep>F. D. <name|Witherden><name-sep>A.
        <name|Jameson>>

        <db-field|title|An extended range of stable-symmetric-conservative
        Flux Reconstruction correction functions>

        <db-field|journal|Computer Methods in Applied Mechanics and
        Engineering>

        <db-field|year|2015>

        <db-field|volume|296>

        <db-field|pages|248\U272>

        <db-field|month|nov>

        <db-field|note|bibtex: Vincent2015>

        <db-field|issn|0045-7825>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0045782515002418>>

        <db-field|doi|10.1016/j.cma.2015.07.023>

        <db-field|language|en>

        <db-field|urldate|2021-11-01>

        <db-field|keywords|Discontinuous Galerkin method, Energy stability,
        Flux Reconstruction, High-order methods, Spectral difference method>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V6|article|Jameson2012>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|A. <name|Jameson><name-sep>P. E.
        <name|Vincent><name-sep>P. <name|Castonguay>>

        <db-field|title|On the Non-linear Stability of Flux Reconstruction
        Schemes>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2012>

        <db-field|volume|50>

        <db-field|number|2>

        <db-field|pages|434\U445>

        <db-field|month|feb>

        <db-field|note|bibtex: Jameson2012>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-011-9490-6>>

        <db-field|doi|10.1007/s10915-011-9490-6>

        <db-field|language|en>

        <db-field|urldate|2021-09-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V7|article|Witherden2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|F.D. <name|Witherden><name-sep>P.E. <name|Vincent>>

        <db-field|title|On nodal point sets for flux reconstruction>

        <db-field|journal|Journal of Computational and Applied Mathematics>

        <db-field|year|2021>

        <db-field|volume|381>

        <db-field|pages|113014>

        <db-field|month|jan>

        <db-field|note|bibtex: Witherden2021>

        <db-field|issn|03770427>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0377042720303058>>

        <db-field|doi|10.1016/j.cam.2020.113014>

        <db-field|language|en>

        <db-field|urldate|2021-09-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UR|article|Offner2019>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Philipp <name|Öffner><name-sep>Hendrik
        <name|Ranocha>>

        <db-field|title|Error Boundedness of Discontinuous Galerkin Methods
        with Variable Coefficients>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2019>

        <db-field|volume|79>

        <db-field|number|3>

        <db-field|pages|1572\U1607>

        <db-field|month|jun>

        <db-field|note|bibtex: Offner2019>

        <db-field|issn|1573-7691>

        <db-field|url|<slink|https://doi.org/10.1007/s10915-018-00902-1>>

        <db-field|doi|10.1007/s10915-018-00902-1>

        <db-field|language|en>

        <db-field|urldate|2021-11-01>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VE|inproceedings|Abgrall2020>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Rémi <name|Abgrall><name-sep>Elise le
        <name|Mélédo><name-sep>Philipp <name|Öffner><name-sep>Hendrik
        <name|Ranocha>>

        <db-field|title|Error boundedness of correction procedure via
        Reconstruction/Flux reconstruction and the connection to residual
        distribution schemes>

        <db-field|booktitle|Hyperbolic problems: Theory, numerics,
        applications>

        <db-field|pages|215\U222>

        <db-field|year|2020>

        <db-field|editor|Alberto <name|Bressan><name-sep>Marta
        <name|Lewicka><name-sep>Dehua <name|Wang><name-sep>Yuxi <name|Zheng>>

        <db-field|volume|10>

        <db-field|series|AIMS on applied mathematics>

        <db-field|address|Springfield>

        <db-field|publisher|American Institute of Mathematical Sciences>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V8|article|Vincent2011>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|P. E. <name|Vincent><name-sep>P.
        <name|Castonguay><name-sep>A. <name|Jameson>>

        <db-field|title|Insights from von Neumann analysis of high-order flux
        reconstruction schemes>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2011>

        <db-field|volume|230>

        <db-field|number|22>

        <db-field|pages|8134\U8154>

        <db-field|month|sep>

        <db-field|issn|0021-9991>

        <db-field|url|<slink|http://www.sciencedirect.com/science/article/pii/S0021999111004323>>

        <db-field|doi|10.1016/j.jcp.2011.07.013>

        <db-field|urldate|2018-02-12>

        <db-field|keywords|High-order methods, Flux reconstruction,
        Dispersion, Dissipation, Nodal discontinuous Galerkin method,
        Spectral difference method>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35V9|article|Asthana2015>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Kartikey <name|Asthana><name-sep>Antony
        <name|Jameson>>

        <db-field|title|High-Order Flux Reconstruction Schemes with Minimal
        Dispersion and Dissipation>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2015>

        <db-field|volume|62>

        <db-field|number|3>

        <db-field|pages|913\U944>

        <db-field|month|mar>

        <db-field|note|bibtex: Asthana2015>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-014-9882-5>>

        <db-field|doi|10.1007/s10915-014-9882-5>

        <db-field|language|en>

        <db-field|urldate|2021-09-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VA|article|Vermeire2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|B.C. <name|Vermeire><name-sep>P.E. <name|Vincent>>

        <db-field|title|On the behaviour of fully-discrete flux
        reconstruction schemes>

        <db-field|journal|Computer Methods in Applied Mechanics and
        Engineering>

        <db-field|year|2017>

        <db-field|volume|315>

        <db-field|pages|1053\U1079>

        <db-field|month|mar>

        <db-field|issn|00457825>

        <db-field|url|<slink|http://linkinghub.elsevier.com/retrieve/pii/S0045782516304455>>

        <db-field|doi|10.1016/j.cma.2016.11.019>

        <db-field|language|en>

        <db-field|urldate|2018-08-15>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VD|inproceedings|Vincent2016>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Peter <name|Vincent><name-sep>Freddie
        <name|Witherden><name-sep>Brian <name|Vermeire><name-sep>Jin Seok
        <name|Park><name-sep>Arvind <name|Iyer>>

        <db-field|title|Towards Green Aviation with Python at Petascale>

        <db-field|booktitle|SC16: International Conference for High
        Performance Computing, Networking, Storage and Analysis>

        <db-field|pages|1\U11>

        <db-field|year|2016>

        <db-field|address|Salt Lake City, UT>

        <db-field|month|nov>

        <db-field|publisher|IEEE>

        <db-field|note|bibtex: Vincent2016>

        <db-field|isbn|978-1-4673-8815-3>

        <db-field|url|<slink|https://ieeexplore.ieee.org/document/7876999/>>

        <db-field|doi|10.1109/SC.2016.1>

        <db-field|urldate|2021-09-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VB|inproceedings|Lopez2014>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Manuel R. <name|López><name-sep>Abhishek
        <name|Sheshadri><name-sep>Jonathan R. <name|Bull><name-sep>Thomas D.
        <name|Economon><name-sep>Joshua <name|Romero><name-sep>Jerry E.
        <name|Watkins><name-sep>David M. <name|Williams><name-sep>Francisco
        <name|Palacios><name-sep>Antony <name|Jameson><name-sep>David E.
        <name|Manosalvas>>

        <db-field|title|Verification and Validation of HiFiLES: a High-Order
        LES unstructured solver on multi-GPU platforms>

        <db-field|booktitle|32nd AIAA Applied Aerodynamics Conference>

        <db-field|year|2014>

        <db-field|address|Atlanta, GA>

        <db-field|month|jun>

        <db-field|publisher|American Institute of Aeronautics and
        Astronautics>

        <db-field|note|bibtex: Lopez2014>

        <db-field|isbn|978-1-62410-288-2>

        <db-field|shorttitle|Verification and Validation of HiFiLES>

        <db-field|url|<slink|https://arc.aiaa.org/doi/10.2514/6.2014-3168>>

        <db-field|doi|10.2514/6.2014-3168>

        <db-field|language|en>

        <db-field|urldate|2021-09-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VC|article|Vandenhoeck2019>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Ray <name|Vandenhoeck><name-sep>Andrea <name|Lani>>

        <db-field|title|Implicit high-order flux reconstruction solver for
        high-speed compressible flows>

        <db-field|journal|Computer Physics Communications>

        <db-field|year|2019>

        <db-field|volume|242>

        <db-field|pages|1\U24>

        <db-field|month|sep>

        <db-field|note|bibtex: Vandenhoeck2019>

        <db-field|issn|00104655>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0010465519301328>>

        <db-field|doi|10.1016/j.cpc.2019.04.015>

        <db-field|language|en>

        <db-field|urldate|2021-09-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35US|article|Lou2020>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Shuai <name|Lou><name-sep>Chao
        <name|Yan><name-sep>Li-Bin <name|Ma><name-sep>Zhen-Hua <name|Jiang>>

        <db-field|title|The Flux Reconstruction Method with Lax\UWendroff
        Type Temporal Discretization for Hyperbolic Conservation Laws>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2020>

        <db-field|volume|82>

        <db-field|number|2>

        <db-field|pages|42>

        <db-field|month|feb>

        <db-field|note|bibtex: Lou2020>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-020-01146-8>>

        <db-field|doi|10.1007/s10915-020-01146-8>

        <db-field|language|en>

        <db-field|urldate|2021-07-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tp|article|attig2011>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Norbert <name|Attig><name-sep>Paul
        <name|Gibbon><name-sep>Th <name|Lippert>>

        <db-field|title|Trends in supercomputing: the European path to
        exascale>

        <db-field|journal|Computer Physics Communications>

        <db-field|year|2011>

        <db-field|volume|182>

        <db-field|number|9>

        <db-field|pages|2041\U2046>

        <db-field|publisher|Elsevier>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tq|article|subcommittee2014>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|ASCAC <name|Subcommittee><name-sep><name|others>>

        <db-field|title|Top ten exascale research challenges>

        <db-field|journal|US Department Of Energy Report>

        <db-field|year|2014>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tr|inproceedings|reed1973>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|W. H. <name|Reed><name-sep>T. R. <name|Hill>>

        <db-field|title|Triangular mesh methods for the neutron transport
        equation>

        <db-field|booktitle|National topical meeting on mathematical models
        and computational techniques for analysis of nuclear systems>

        <db-field|year|1973>

        <db-field|address|Ann Arbor, Michigan>

        <db-field|month|oct>

        <db-field|publisher|Los Alamos Scientific Lab., N.Mex. (USA)>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ts|book|cockburn2000>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|editor|Bernardo <name|Cockburn><name-sep>George E.
        <name|Karniadakis><name-sep>Chi-Wang <name|Shu><name-sep>M.
        <name|Griebel><name-sep>D. E. <name|Keyes><name-sep>R. M.
        <name|Nieminen><name-sep>D. <name|Roose><name-sep>T. <name|Schlick>>

        <db-field|title|Discontinuous Galerkin Methods: Theory, Computation
        and Applications>

        <db-field|publisher|Springer Berlin Heidelberg>

        <db-field|year|2000>

        <db-field|volume|11>

        <db-field|series|Lecture Notes in Computational Science and
        Engineering>

        <db-field|address|Berlin, Heidelberg>

        <db-field|note|bibtex: Cockburn2000>

        <db-field|isbn|978-3-642-64098-8 978-3-642-59721-3>

        <db-field|shorttitle|Discontinuous Galerkin Methods>

        <db-field|url|<slink|https://link.springer.com/10.1007/978-3-642-59721-3>>

        <db-field|language|en>

        <db-field|urldate|2023-05-16>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U4|article|Cicchino2022>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Alexander <name|Cicchino><name-sep>David C.
        <name|Del Rey Fernández><name-sep>Siva
        <name|Nadarajah><name-sep>Jesse <name|Chan><name-sep>Mark H.
        <name|Carpenter>>

        <db-field|title|Provably stable flux reconstruction high-order
        methods on curvilinear elements>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2022>

        <db-field|volume|463>

        <db-field|pages|111259>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2022.111259>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999122003217>>

        <db-field|keywords|High-order, Flux reconstruction, Discontinuous
        Galerkin, Summation-by-parts>

        <db-field|abstract|Provably stable flux reconstruction (FR) schemes
        are derived for partial differential equations cast in curvilinear
        coordinates. Specifically, energy stable flux reconstruction (ESFR)
        schemes are considered as they allow for design flexibility as well
        as stability proofs for the linear advection problem on affine
        elements. Additionally, the curvilinear metric split-form for a
        linear physical flux is examined as it enables the development of
        energy stability proofs. The first critical step proves, that in
        curvilinear coordinates, the discontinuous Galerkin (DG) conservative
        and non-conservative forms are inherently different\Ueven under exact
        integration and analytically exact metric terms. This analysis
        demonstrates that the split form is essential to developing provably
        stable DG schemes on curvilinear coordinates and motivates the
        construction of metric dependent ESFR correction functions in each
        element. Furthermore, the provably stable FR schemes differ from
        schemes in the literature that only apply the ESFR correction
        functions to surface terms or on the conservative form, and instead
        incorporate the ESFR correction functions on the full split form of
        the equations. It is demonstrated that the scheme is divergent when
        the correction functions are only used for surface reconstruction in
        curvilinear coordinates. We numerically verify the stability claims
        for our proposed FR split forms and compare them to ESFR schemes in
        the literature. Lastly, the newly proposed provably stable FR schemes
        are shown to obtain optimal orders of convergence. The scheme loses
        the orders of accuracy at the equivalent correction parameter value c
        as that of the one-dimensional ESFR scheme.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TD|article|babbar2022>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Arpit <name|Babbar><name-sep>Sudarshan Kumar
        <name|Kenettinkara><name-sep>Praveen <name|Chandrashekar>>

        <db-field|title|Lax-wendroff flux reconstruction method for
        hyperbolic conservation laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2022>

        <db-field|pages|111423>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2022.111423>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999122004855>>

        <db-field|keywords|Conservation laws, Hyperbolic PDE, Lax-Wendroff,
        Flux reconstruction>

        <db-field|abstract|The Lax-Wendroff method is a single step method
        for evolving time dependent solutions governed by partial
        differential equations, in contrast to Runge-Kutta methods that need
        multiple stages per time step. We develop a flux reconstruction
        version of the method in combination with a Jacobian-free
        Lax-Wendroff procedure that is applicable to general hyperbolic
        conservation laws. The method is of collocation type, is quadrature
        free and can be cast in terms of matrix and vector operations.
        Special attention is paid to the construction of numerical flux,
        including for non-linear problems, resulting in higher CFL numbers
        than existing methods, which is shown through Fourier analysis and
        yielding uniform performance at all orders. Numerical results up to
        fifth order of accuracy for linear and non-linear problems are given
        to demonstrate the performance and accuracy of the method.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ty|article|Dumbser2014>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|M. <name|Dumbser><name-sep>O.
        <name|Zanotti><name-sep>R. <name|Loubère><name-sep>S. <name|Diot>>

        <db-field|title|A posteriori subcell limiting of the discontinuous
        Galerkin finite element method for hyperbolic conservation laws>

        <db-field|journal|J. Comp. Phys.>

        <db-field|year|2014>

        <db-field|volume|278>

        <db-field|pages|47\U75>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Sw|article|Zhang2010b>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Xiangxiong <name|Zhang><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|On maximum-principle-satisfying high order schemes
        for scalar conservation laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2010>

        <db-field|volume|229>

        <db-field|number|9>

        <db-field|pages|3091\U3120>

        <db-field|month|may>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999109007165>>

        <db-field|doi|10.1016/j.jcp.2009.12.030>

        <db-field|language|en>

        <db-field|urldate|2019-02-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tc|article|moe2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Scott A. <name|Moe><name-sep>James A.
        <name|Rossmanith><name-sep>David C. <name|Seal>>

        <db-field|title|Positivity-preserving discontinuous galerkin methods
        with lax\Uwendroff time discretizations>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2017>

        <db-field|volume|71>

        <db-field|pages|44\U70>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VT|article|Xu2022>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Ziyao <name|Xu><name-sep>Chi-Wang <name|Shu>>

        <db-field|title|Third order maximum-principle-satisfying and
        positivity-preserving lax-wendroff discontinuous galerkin methods for
        hyperbolic conservation laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2022>

        <db-field|volume|470>

        <db-field|pages|111591>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2022.111591>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999122006532>>

        <db-field|keywords|Maximum-principle-satisfying,
        Positivity-preserving, Lax-Wendroff discontinuous Galerkin methods
        (LWDG), Scalar conservation laws, Euler equations>

        <db-field|abstract|There have been intensive studies on
        maximum-principle-satisfying and positivity-preserving methods for
        hyperbolic conservation laws. Most of them are based on the method of
        lines type time marching approaches, e.g. the Runge-Kutta methods,
        multi-step methods and backward Euler method. As an alternative, the
        Lax-Wendroff time marching approach utilizes the information of PDEs
        in the Taylor expansion of the solution in time, hence it is a high
        order and single-stage method. In this work, we propose third order
        maximum-principle-satisfying and positivity-preserving schemes for
        scalar conservation laws and the Euler equations based on the
        Lax-Wendroff time discretization and discontinuous Galerkin spatial
        discretization. The accuracy and effectiveness of the
        maximum-principle-satisfying and positivity-preserving techniques are
        demonstrated by ample numerical tests.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VU|article|Chen2016>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Zheng <name|Chen><name-sep>Hongying
        <name|Huang><name-sep>Jue <name|Yan>>

        <db-field|title|Third order maximum-principle-satisfying direct
        discontinuous galerkin methods for time dependent convection
        diffusion equations on unstructured triangular meshes>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2016>

        <db-field|volume|308>

        <db-field|pages|198\U217>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2015.12.039>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S002199911500858X>>

        <db-field|keywords|Discontinuous Galerkin methods, Convection
        diffusion equation, Maximum principle, Positivity preserving,
        Incompressible Navier\UStokes equations>

        <db-field|abstract|We develop 3rd order maximum-principle-satisfying
        direct discontinuous Galerkin methods [8], [9], [19], [21] for
        convection diffusion equations on unstructured triangular mesh. We
        carefully calculate the normal derivative numerical flux across
        element edges and prove that, with proper choice of parameter pair
        (\<beta\>0,\<beta\>1) in the numerical flux formula, the quadratic
        polynomial solution satisfies strict maximum principle. The
        polynomial solution is bounded within the given range and third order
        accuracy is maintained. There is no geometric restriction on the
        meshes and obtuse triangles are allowed in the partition. A sequence
        of numerical examples are carried out to demonstrate the accuracy and
        capability of the maximum-principle-satisfying limiter.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VV|article|Vilar2019>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|François <name|Vilar>>

        <db-field|title|A posteriori correction of high-order discontinuous
        Galerkin scheme through subcell finite volume formulation and flux
        reconstruction>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2019>

        <db-field|volume|387>

        <db-field|pages|245\U279>

        <db-field|month|jun>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999118307174>>

        <db-field|doi|10.1016/j.jcp.2018.10.050>

        <db-field|language|en>

        <db-field|urldate|2021-08-09>

        <db-field|file|Full Text:/Users/praveen/Zotero/storage/R3G2NMEC/Vilar
        - 2019 - A posteriori correction of high-order
        discontinuou.pdf:application/pdf>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VW|article|Biswas1994>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Rupak <name|Biswas><name-sep>Karen D.
        <name|Devine><name-sep>Joseph E. <name|Flaherty>>

        <db-field|title|Parallel, adaptive finite element methods for
        conservation laws>

        <db-field|journal|Applied Numerical Mathematics>

        <db-field|year|1994>

        <db-field|volume|14>

        <db-field|number|1>

        <db-field|pages|255\U283>

        <db-field|issn|0168-9274>

        <db-field|doi|<slink|https://doi.org/10.1016/0168-9274(94)90029-9>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/0168927494900299>>

        <db-field|abstract|We construct parallel finite element methods for
        the solution of hyperbolic conservation laws in one and two
        dimensions. Spatial discretization is performed by a discontinuous
        Galerkin finite element method using a basis of piecewise Legendre
        polynomials. Temporal discretization utilizes a Runge-Kutta method.
        Dissipative fluxes and projection limiting prevent oscillations near
        solution discontinuities. A posteriori estimates of spatial are
        obtained by a p-refinement technique using superconvergence at Radau
        points. The resulting methods is of high order and may be
        parallelized efficiently on MIMD computers. We compare results using
        different limiting schemes and demonstrate parallel efficiency
        through computations on an NCUBE/2 hypercube. We also present results
        using adaptive h- and p-refinement to reduce the computational costof
        the method.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VX|article|Burbeau2001>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|A. <name|Burbeau><name-sep>P.
        <name|Sagaut><name-sep>Ch.-H. <name|Bruneau>>

        <db-field|title|A problem-independent limiter for high-order
        runge\Ukutta discontinuous galerkin methods>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2001>

        <db-field|volume|169>

        <db-field|number|1>

        <db-field|pages|111\U150>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1006/jcph.2001.6718>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S002199910196718X>>

        <db-field|abstract|This paper is devoted to the use of discontinuous
        Galerkin methods to solve hyperbolic conservation laws. The emphasis
        is laid on the elaboration of slope limiters to enforce nonlinear
        stability for shock-capturing. The objectives are to derive
        problem-independent methods that maintain high-order of accuracy in
        regions where the solution is smooth, and in the neighborhood of
        shock waves. The aim is also to define a way of taking into account
        high-order space discretization in limiting process, to make use of
        all the expansion terms of the approximate solution. A new slope
        limiter is first presented for one-dimensional problems and any order
        of approximation. Next, it is extended to bidimensional problems, for
        unstructured triangular meshes. The new method is totally free of
        problem-dependence. Numerical experiments show its capacity to
        preserve the accuracy of discontinuous Galerkin method in smooth
        regions, and to capture strong shocks.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VY|article|Krivodonova2007>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Lilia <name|Krivodonova>>

        <db-field|title|Limiters for high-order discontinuous galerkin
        methods>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2007>

        <db-field|volume|226>

        <db-field|number|1>

        <db-field|pages|879\U896>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2007.05.011>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999107002136>>

        <db-field|keywords|Limiters, High-resolution schemes, Discontinuous
        Galerkin methods, Euler equations>

        <db-field|abstract|We describe a limiter for the discontinuous
        Galerkin method that retains as high an order as possible, and does
        not automatically reduce to first order. The limiter is a
        generalization of the limiter introduced in [R. Biswas, K. Devine,
        J.E. Flaherty, Parallel adaptive finite element methods for
        conservation laws, Applied Numerical Mathematics 14 (1994) 255\U284].
        We present the one-dimensional case and extend it to two-dimensional
        problems on tensor-product meshes. Computational results for examples
        with both smooth and discontinuous solutions are shown.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VZ|article|Qiu2005>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|J. <name|Qiu><name-sep>C.-W. <name|Shu>>

        <db-field|title|Runge Kutta discontinuous Galerkin method using WENO
        limiters>

        <db-field|journal|SIAM J. Sci. Comput.>

        <db-field|year|2005>

        <db-field|volume|26>

        <db-field|pages|907\U929>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Va|article|Balsara2007>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|D. <name|Balsara><name-sep>C.
        <name|Altmann><name-sep>C.D. <name|Munz><name-sep>M. <name|Dumbser>>

        <db-field|title|A sub-cell based indicator for troubled zones in RKDG
        schemes and a novel class of hybrid RKDG+HWENO schemes>

        <db-field|journal|J. Comp. Phys.>

        <db-field|year|2007>

        <db-field|volume|226>

        <db-field|pages|586\U620>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TZ|incollection|Persson2006>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Per-Olof <name|Persson><name-sep>Jaime
        <name|Peraire>>

        <db-field|title|Sub-Cell Shock Capturing for Discontinuous Galerkin
        Methods>

        <db-field|booktitle|44th AIAA Aerospace Sciences Meeting and Exhibit>

        <db-field|publisher|American Institute of Aeronautics and
        Astronautics>

        <db-field|year|2006>

        <db-field|series|Aerospace Sciences Meetings>

        <db-field|month|jan>

        <db-field|url|<slink|https://arc.aiaa.org/doi/10.2514/6.2006-112>>

        <db-field|urldate|2020-11-30>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ta|article|klockner2011>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Andreas <name|Klöckner><name-sep>Tim
        <name|Warburton><name-sep>Jan <name|Hesthaven>>

        <db-field|title|Viscous shock capturing in a time-explicit
        discontinuous galerkin method>

        <db-field|journal|Mathematical Modelling of Natural Phenomena>

        <db-field|year|2011>

        <db-field|volume|6>

        <db-field|pages|0>

        <db-field|month|02>

        <db-field|doi|10.1051/mmnp/20116303>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VF|article|henemann2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Sebastian <name|Hennemann><name-sep>Andrés M.
        <name|Rueda-Ramírez><name-sep>Florian J.
        <name|Hindenlang><name-sep>Gregor J. <name|Gassner>>

        <db-field|title|A provably entropy stable subcell shock capturing
        approach for high order split form dg for the compressible euler
        equations>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2021>

        <db-field|volume|426>

        <db-field|pages|109935>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2020.109935>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999120307099>>

        <db-field|keywords|Compressible Euler equations, Discontinuous
        Galerkin spectral element method, Shock capturing, Entropy stability,
        Computational robustness>

        <db-field|abstract|The main result in this paper is a provably
        entropy stable shock capturing approach for the high order entropy
        stable Discontinuous Galerkin Spectral Element Method (DGSEM) based
        on a hybrid blending with a subcell low order variant. Since it is
        possible to rewrite a high order summation-by-parts (SBP) operator
        into an equivalent conservative finite volume form, we were able to
        design a low order scheme directly with the Legendre-Gauss-Lobatto
        (LGL) nodes that is compatible to the discrete entropy analysis used
        for the proof of the entropy stable DGSEM. Furthermore, we present a
        hybrid low order/high order discretisation where it is possible to
        seamlessly blend between the two approaches, while still being
        provably entropy stable. With tensor products and careful design of
        the low order scheme on curved elements, we are able to extend the
        approach to three spatial dimensions on unstructured curvilinear
        hexahedral meshes. We validate our theoretical findings and
        demonstrate convergence order for smooth problems, conservation of
        the primary quantities and discrete entropy stability for an
        arbitrary blending on curvilinear grids. In practical simulations, we
        connect the blending factor to a local troubled element indicator
        that provides the control of the amount of low order dissipation
        injected into the high order scheme. We modified an existing shock
        indicator, which is based on the modal polynomial representation, to
        our provably stable hybrid scheme. The aim is to reduce the impact of
        the parameters as good as possible. We describe our indicator in
        detail and demonstrate its robustness in combination with the hybrid
        scheme, as it is possible to compute all the different test cases
        without changing the indicator. The test cases include e.g. the
        double Mach reflection setup, forward and backward facing steps with
        shock Mach numbers up to 100. The proposed approach is relatively
        straight forward to implement in an existing entropy stable DGSEM
        code as only modifications local to an element are necessary.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vb|article|Peraire2012>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|A. <name|Huerta><name-sep>E.
        <name|Casoni><name-sep>J. <name|Peraire>>

        <db-field|title|A simple shock-capturing technique for high-order
        discontinuous Galerkin methods>

        <db-field|journal|Int. J. Numer. Meth. Fluids>

        <db-field|year|2012>

        <db-field|volume|69>

        <db-field|pages|1614\U1632>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vc|article|Peraire2013>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|E. <name|Casoni><name-sep>J.
        <name|Peraire><name-sep>A. <name|Huerta>>

        <db-field|title|One-dimensional shock-capturing for high-order
        discontinuous Galerkin methods>

        <db-field|journal|Int. J. Numer. Meth. Fluids>

        <db-field|year|2013>

        <db-field|volume|71>

        <db-field|pages|737\U755>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vd|inproceedings|Sonntag2014>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|M. <name|Sonntag><name-sep>C. D. <name|Munz>>

        <db-field|title|Shock capturing for discontinuous Galerkin methods
        using finite volume subcells>

        <db-field|booktitle|Finite Volumes for Complex Applications VII>

        <db-field|pages|945\U953>

        <db-field|year|2014>

        <db-field|publisher|Springer>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ve|article|Rosa2018>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|J. N. <name-von|de la> <name|Rosa><name-sep>C. D.
        <name|Munz>>

        <db-field|title|Hybrid DG/FV schemes for magnetohydrodynamics and
        relativistichydrodynamics>

        <db-field|journal|Comp. Phys. Commun.>

        <db-field|year|2018>

        <db-field|volume|222>

        <db-field|pages|113\U135>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vf|article|Ramirez2020>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Andr'es M. <name|Rueda-Ram'irez><name-sep>Sebastian
        <name|Hennemann><name-sep>Florian <name|Hindenlang><name-sep>Andrew
        R. <name|Winters><name-sep>Gregor J. <name|Gassner>>

        <db-field|title|An entropy stable nodal discontinuous galerkin method
        for the resistive mhd equations. part ii: subcell finite volume shock
        capturing>

        <db-field|journal|J. Comput. Phys.>

        <db-field|year|2020>

        <db-field|volume|444>

        <db-field|pages|110580>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vg|inproceedings|ramirez2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|A <name|Rueda-Ram<math|<wide|<text|\Y>|\<acute\>>>rez><name-sep>G
        <name|Gassner>>

        <db-field|title|A subcell finite volume positivity-preserving limiter
        for DGSEM discretizations of the euler equations>

        <db-field|booktitle|14th WCCM-ECCOMAS Congress>

        <db-field|year|2021>

        <db-field|publisher|CIMNE>

        <db-field|conference|14th WCCM-ECCOMAS Congress>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vm|article|ramirez2022>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Andrés M. <name|Rueda-Ramírez><name-sep>Will
        <name|Pazner><name-sep>Gregor J. <name|Gassner>>

        <db-field|title|Subcell limiting strategies for discontinuous
        galerkin spectral element methods>

        <db-field|journal|Computers & Fluids>

        <db-field|year|2022>

        <db-field|volume|247>

        <db-field|pages|105627>

        <db-field|issn|0045-7930>

        <db-field|doi|<slink|https://doi.org/10.1016/j.compfluid.2022.105627>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0045793022002262>>

        <db-field|keywords|Entropy stability, Invariant domain preservation,
        Discontinuous Galerkin spectral element methods subcell limiting,
        Shock capturing>

        <db-field|abstract|We present a general family of subcell limiting
        strategies to construct robust high-order accurate nodal
        discontinuous Galerkin (DG) schemes. The main strategy is to
        construct compatible low order finite volume (FV) type
        discretizations that allow for convex blending with the high-order
        variant with the goal of guaranteeing additional properties, such as
        bounds on physical quantities and/or guaranteed entropy dissipation.
        For an implementation of this main strategy, four main ingredients
        are identified that may be combined in a flexible manner: (i) a nodal
        high-order DG method on Legendre\UGauss\ULobatto nodes, (ii) a
        compatible robust subcell FV scheme, (iii) a convex combination
        strategy for the two schemes, which can be element-wise or
        subcell-wise, and (iv) a strategy to compute the convex blending
        factors, which can be either based on heuristic troubled-cell
        indicators, or using ideas from flux-corrected transport methods. By
        carefully designing the metric terms of the subcell FV method, the
        resulting methods can be used on unstructured curvilinear meshes, are
        locally conservative, can handle strong shocks efficiently while
        directly guaranteeing physical bounds on quantities such as density,
        pressure or entropy. We further show that it is possible to choose
        the four ingredients to recover existing methods such as a provably
        entropy dissipative subcell shock-capturing approach or a sparse
        invariant domain preserving approach. We test the versatility of the
        presented strategies and mix and match the four ingredients to solve
        challenging simulation setups, such as the KPP problem (a hyperbolic
        conservation law with non-convex flux function), turbulent and
        hypersonic Euler simulations, and MHD problems featuring shocks and
        turbulence.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TS|article|Rusanov1962>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|V.V <name|Rusanov>>

        <db-field|title|The calculation of the interaction of non-stationary
        shock waves and obstacles>

        <db-field|journal|USSR Computational Mathematics and Mathematical
        Physics>

        <db-field|year|1962>

        <db-field|volume|1>

        <db-field|number|2>

        <db-field|pages|304\U320>

        <db-field|month|jan>

        <db-field|issn|00415553>

        <db-field|url|<slink|http://linkinghub.elsevier.com/retrieve/pii/0041555362900629>>

        <db-field|doi|10.1016/0041-5553(62)90062-9>

        <db-field|language|en>

        <db-field|urldate|2018-10-04>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vn|article|Pazner2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Will <name|Pazner>>

        <db-field|title|Sparse invariant domain preserving discontinuous
        galerkin methods with subcell convex limiting>

        <db-field|journal|Computer Methods in Applied Mechanics and
        Engineering>

        <db-field|year|2021>

        <db-field|volume|382>

        <db-field|pages|113876>

        <db-field|issn|0045-7825>

        <db-field|doi|<slink|https://doi.org/10.1016/j.cma.2021.113876>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0045782521002139>>

        <db-field|keywords|Discontinuous Galerkin, Flux corrected transport,
        Invariant domain preserving, Convex limiting>

        <db-field|abstract|In this paper, we develop high-order nodal
        discontinuous Galerkin (DG) methods for hyperbolic conservation laws
        that satisfy invariant domain preserving properties using subcell
        flux corrections and convex limiting. These methods are based on a
        subcell flux corrected transport (FCT) methodology that involves
        blending a high-order target scheme with a robust, low-order
        invariant domain preserving method that is obtained using a graph
        viscosity technique. The new low-order discretizations are based on
        sparse stencils which do not increase with the polynomial degree of
        the high-order DG method. As a result, the accuracy of the low-order
        method does not degrade when used with high-order target methods. The
        method is applied to both scalar conservation laws, for which the
        discrete maximum principle is naturally enforced, and to systems of
        conservation laws such as the Euler equations, for which positivity
        of density and a minimum principle for specific entropy are enforced.
        Numerical results are presented on a number of benchmark test cases.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U9|article|Clain2011>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|S. <name|Clain><name-sep>S. <name|Diot><name-sep>R.
        <name|Loubère>>

        <db-field|title|A high-order finite volume method for hyperbolic
        systems: Multi-dimensional Optimal Order Detection (MOOD)>

        <db-field|journal|J. Comp. Phys.>

        <db-field|year|2011>

        <db-field|volume|230>

        <db-field|pages|4028\U4050>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vh|article|Diot2012>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|S. <name|Diot><name-sep>S. <name|Clain><name-sep>R.
        <name|Loubère>>

        <db-field|title|Improved detection criteria for the multi-dimensional
        optimal order detection (MOOD) on unstructured meshes with very
        high-order polynomials>

        <db-field|journal|Computers and Fluids>

        <db-field|year|2012>

        <db-field|volume|64>

        <db-field|pages|43\U63>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vi|article|Diot2013>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|S. <name|Diot><name-sep>R.
        <name|Loubère><name-sep>S. <name|Clain>>

        <db-field|title|The MOOD method in the three-dimensional case:
        very-high-order finite volume method for hyperbolic systems>

        <db-field|journal|Int. J. Numer. Meth. Fluids>

        <db-field|year|2013>

        <db-field|volume|73>

        <db-field|pages|362\U392>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vj|article|Dumbser2019>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|M. <name|Dumbser><name-sep>R. <name|Loubère>>

        <db-field|title|A simple robust and accurate a posteriorisub-cell
        finite volume limiter for the discontinuousGalerkin method on
        unstructured meshes>

        <db-field|journal|J. Comp. Phys.>

        <db-field|year|2016>

        <db-field|volume|319>

        <db-field|pages|163\U199>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vk|article|dzanic2022>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|T. <name|Dzanic><name-sep>F.D. <name|Witherden>>

        <db-field|title|Positivity-preserving entropy-based adaptive
        filtering for discontinuous spectral element methods>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2022>

        <db-field|volume|468>

        <db-field|pages|111501>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2022.111501>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999122005630>>

        <db-field|keywords|Spectral element methods, Shock capturing,
        Filtering, Hyperbolic systems, Discontinuous Galerkin, Flux
        reconstruction>

        <db-field|abstract|In this work, we present a positivity-preserving
        entropy-based adaptive filtering method for shock capturing in
        discontinuous spectral element methods. By adapting the filter
        strength to enforce positivity and a local discrete minimum entropy
        principle, the resulting approach can robustly resolve strong
        discontinuities with sub-element resolution, does not require
        problem-dependent parameter tuning, and can be easily implemented on
        general unstructured meshes with relatively low computational cost.
        The efficacy of the approach is shown in numerical experiments on
        hyperbolic and mixed hyperbolic-parabolic conservation laws such as
        the Euler and Navier-Stokes equations for problems including extreme
        shocks, shock-vortex interactions, and complex compressible turbulent
        flows.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vl|article|Lu2021>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Jianfang <name|Lu><name-sep>Yong
        <name|Liu><name-sep>Chi-Wang <name|Shu>>

        <db-field|title|An oscillation-free discontinuous galerkin method for
        scalar hyperbolic conservation laws>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|2021>

        <db-field|volume|59>

        <db-field|number|3>

        <db-field|pages|1299\U1324>

        <db-field|doi|10.1137/20M1354192>

        <db-field|url|<slink|https://doi.org/10.1137/20M1354192>>

        <db-field|eprint|<slink|https://doi.org/10.1137/20M1354192>>

        <db-field|abstract|In this paper, we propose a novel discontinuous
        Galerkin (DG) method to control the spurious oscillations when
        solving the scalar hyperbolic conservation laws. Usually, the high
        order linear numerical schemes would generate spurious oscillations
        when the solution of the hyperbolic conservation laws contains
        discontinuities. The spurious oscillations may be harmful to the
        numerical simulation, as it not only generates some artificial
        structures not belonging to the problems, but also causes many
        overshoots and undershoots that make the numerical scheme less
        robust. To overcome this difficulty, in this paper we introduce a
        numerical damping term to control spurious oscillations based on the
        classic DG formulation. In comparison to the classic DG method, the
        proposed DG method still maintains many good properties, such as the
        extremely local data structure, conservation,
        $L<rsup|2>$-boundedness, optimal error estimates, and
        superconvergence. We also provide some numerical examples to show the
        good performance of the proposed DG scheme and verify our theoretical
        results.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VG|article|vanleer1984>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bram <name-von|van> <name|Leer>>

        <db-field|title|On the relation between the upwind-differencing
        schemes of godunov, engquist\Uosher and roe>

        <db-field|journal|SIAM Journal on Scientific and Statistical
        Computing>

        <db-field|year|1984>

        <db-field|volume|5>

        <db-field|pages|1\U20>

        <db-field|month|03>

        <db-field|doi|10.1137/0905001>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Sv|article|Berthon2006>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Christophe <name|Berthon>>

        <db-field|title|Why the MUSCL\UHancock scheme is l1-stable>

        <db-field|journal|Numerische Mathematik>

        <db-field|year|2006>

        <db-field|volume|104>

        <db-field|number|1>

        <db-field|pages|27\U46>

        <db-field|month|jun>

        <db-field|doi|10.1007/s00211-006-0007-4>

        <db-field|url|<slink|https://doi.org/10.1007/s00211-006-0007-4>>

        <db-field|publisher|Springer Science and Business Media LLC>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UF|article|Romero2016>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|J. <name|Romero><name-sep>K.
        <name|Asthana><name-sep>A. <name|Jameson>>

        <db-field|title|A Simplified Formulation of the Flux Reconstruction
        Method>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2016>

        <db-field|volume|67>

        <db-field|number|1>

        <db-field|pages|351\U374>

        <db-field|month|apr>

        <db-field|note|bibtex: Romero2016>

        <db-field|issn|0885-7474, 1573-7691>

        <db-field|url|<slink|http://link.springer.com/10.1007/s10915-015-0085-5>>

        <db-field|doi|10.1007/s10915-015-0085-5>

        <db-field|language|en>

        <db-field|urldate|2021-11-28>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UG|article|Engquist1981>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Björn <name|Engquist><name-sep>Stanley <name|Osher>>

        <db-field|title|One-sided difference approximations for nonlinear
        conservation laws>

        <db-field|journal|Mathematics of Computation>

        <db-field|year|1981>

        <db-field|volume|36>

        <db-field|number|154>

        <db-field|pages|321\U351>

        <db-field|issn|0025-5718, 1088-6842>

        <db-field|url|<slink|https://www.ams.org/mcom/1981-36-154/S0025-5718-1981-0606500-X/>>

        <db-field|doi|10.1090/S0025-5718-1981-0606500-X>

        <db-field|language|en>

        <db-field|urldate|2021-12-15>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UI|article|Cockburn1991>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bernardo <name|Cockburn><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|The runge-kutta local projection
        <math|p<rsup|1>>-discontinuous-galerkin finite element method for
        scalar conservation laws>

        <db-field|journal|ESAIM: Mathematical Modelling and Numerical
        Analysis - Modélisation Mathématique et Analyse Numérique>

        <db-field|year|1991>

        <db-field|volume|25>

        <db-field|number|3>

        <db-field|pages|337\U361>

        <db-field|publisher|AFCET - Gauthier-Villars>

        <db-field|address|Paris>

        <db-field|zbl|0732.65094>

        <db-field|mrnumber|1103092>

        <db-field|language|en>

        <db-field|url|http://www.numdam.org/item/M2AN<rsub|1>991<rsub|_>25<rsub|3><rsub|3>37<rsub|0>/>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UJ|article|Cockburn1989a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bernardo <name|Cockburn><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|TVB Runge-Kutta local projection discontinuous
        Galerkin finite element method for conservation laws. II. General
        framework>

        <db-field|journal|Mathematics of Computation>

        <db-field|year|1989>

        <db-field|volume|52>

        <db-field|number|186>

        <db-field|pages|411\U411>

        <db-field|month|may>

        <db-field|issn|0025-5718>

        <db-field|url|<slink|http://www.ams.org/jourcgi/jour-getitem?pii=S0025-5718-1989-0983311-4>>

        <db-field|doi|10.1090/S0025-5718-1989-0983311-4>

        <db-field|language|en>

        <db-field|urldate|2018-07-20>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UN|article|Cockburn1989>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bernardo <name|Cockburn><name-sep>San-Yih
        <name|Lin><name-sep>Chi-Wang <name|Shu>>

        <db-field|title|TVB Runge-Kutta local projection discontinuous
        Galerkin finite element method for conservation laws III:
        One-dimensional systems>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1989>

        <db-field|volume|84>

        <db-field|number|1>

        <db-field|pages|90\U113>

        <db-field|month|sep>

        <db-field|issn|00219991>

        <db-field|url|<slink|http://linkinghub.elsevier.com/retrieve/pii/0021999189901836>>

        <db-field|doi|10.1016/0021-9991(89)90183-6>

        <db-field|language|en>

        <db-field|urldate|2018-07-20>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UK|book|Butcher2016>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|J. C. <name|Butcher>>

        <db-field|title|Numerical Methods for Ordinary Differential
        Equations>

        <db-field|publisher|John Wiley & Sons, Ltd>

        <db-field|year|2016>

        <db-field|address|Chichester, UK>

        <db-field|month|jul>

        <db-field|note|bibtex: Butcher2016>

        <db-field|isbn|978-1-119-12150-3 978-1-119-12153-4>

        <db-field|url|<slink|http://doi.wiley.com/10.1002/9781119121534>>

        <db-field|language|en>

        <db-field|urldate|2021-12-16>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UL|article|Gottlieb2001>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Sigal <name|Gottlieb><name-sep>Chi-Wang
        <name|Shu><name-sep>Eitan <name|Tadmor>>

        <db-field|title|Strong Stability-Preserving High-Order Time
        Discretization Methods>

        <db-field|journal|SIAM Review>

        <db-field|year|2001>

        <db-field|volume|43>

        <db-field|number|1>

        <db-field|pages|89\U112>

        <db-field|month|jan>

        <db-field|note|bibtex: Gottlieb2001>

        <db-field|issn|0036-1445>

        <db-field|url|<slink|https://epubs.siam.org/doi/10.1137/S003614450036757X>>

        <db-field|doi|10.1137/S003614450036757X>

        <db-field|urldate|2021-10-29>

        <db-field|keywords|65L06, 65M20, high-order accuracy, multistep
        methods, Runge\UKutta methods, strong stability preserving, time
        discretization>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UM|article|Tsitouras2011>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Ch. <name|Tsitouras>>

        <db-field|title|Runge\UKutta pairs of order 5(4) satisfying only the
        first column simplifying assumption>

        <db-field|journal|Computers & Mathematics with Applications>

        <db-field|year|2011>

        <db-field|volume|62>

        <db-field|number|2>

        <db-field|pages|770\U775>

        <db-field|month|jul>

        <db-field|note|bibtex: Tsitouras2011>

        <db-field|issn|0898-1221>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0898122111004706>>

        <db-field|doi|10.1016/j.camwa.2011.06.002>

        <db-field|language|en>

        <db-field|urldate|2021-10-29>

        <db-field|keywords|Dense output, Free parameters, Non-linear
        algebraic systems, Runge\UKutta, Truncation error>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UO|article|Spiteri2002>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Raymond J. <name|Spiteri><name-sep>Steven J.
        <name|Ruuth>>

        <db-field|title|A New Class of Optimal High-Order
        Strong-Stability-Preserving Time Discretization Methods>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|2002>

        <db-field|volume|40>

        <db-field|number|2>

        <db-field|pages|469\U491>

        <db-field|month|jan>

        <db-field|issn|0036-1429, 1095-7170>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/S0036142901389025>>

        <db-field|doi|10.1137/S0036142901389025>

        <db-field|language|en>

        <db-field|urldate|2018-07-03>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Sz|article|Xu2019>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Yuan <name|Xu><name-sep>Qiang
        <name|Zhang><name-sep>Chi-wang <name|Shu><name-sep>Haijin
        <name|Wang>>

        <db-field|title|The <math|L<rsup|2>>-norm Stability Analysis of
        Runge--Kutta Discontinuous Galerkin Methods for Linear Hyperbolic
        Equations>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|2019>

        <db-field|volume|57>

        <db-field|number|4>

        <db-field|pages|1574\U1601>

        <db-field|month|jan>

        <db-field|note|bibtex: Xu2019>

        <db-field|issn|0036-1429, 1095-7170>

        <db-field|url|<slink|https://epubs.siam.org/doi/10.1137/18M1230700>>

        <db-field|doi|10.1137/18M1230700>

        <db-field|language|en>

        <db-field|urldate|2021-05-10>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UP|article|Carpenter1995>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Mark H. <name|Carpenter><name-sep>David
        <name|Gottlieb><name-sep>Saul <name|Abarbanel><name-sep>Wai-Sun
        <name|Don>>

        <db-field|title|The Theoretical Accuracy of Runge\UKutta Time
        Discretizations for the Initial Boundary Value Problem: A Study of
        the Boundary Error>

        <db-field|journal|SIAM Journal on Scientific Computing>

        <db-field|year|1995>

        <db-field|volume|16>

        <db-field|number|6>

        <db-field|pages|1241\U1252>

        <db-field|month|nov>

        <db-field|note|bibtex: Carpenter1995>

        <db-field|issn|1064-8275, 1095-7197>

        <db-field|shorttitle|The Theoretical Accuracy of Runge\UKutta Time
        Discretizations for the Initial Boundary Value Problem>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/0916072>>

        <db-field|doi|10.1137/0916072>

        <db-field|language|en>

        <db-field|urldate|2021-12-14>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35T7|article|Jiang1996>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Guang-Shan <name|Jiang><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|Efficient Implementation of Weighted ENO Schemes>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1996>

        <db-field|volume|126>

        <db-field|number|1>

        <db-field|pages|202\U228>

        <db-field|month|jun>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999196901308>>

        <db-field|doi|10.1006/jcph.1996.0130>

        <db-field|language|en>

        <db-field|urldate|2019-07-23>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UT|article|Ruuth2002>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Steven J. <name|Ruuth><name-sep>R. <name|Spiteri>>

        <db-field|title|Two Barriers on Strong-Stability-Preserving Time
        Discretization Methods>

        <db-field|journal|J. Sci. Comput.>

        <db-field|year|2002>

        <db-field|note|bibtex: Ruuth2002>

        <db-field|doi|10.1023/A:1015156832269>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UU|article|Sod1978>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Gary A <name|Sod>>

        <db-field|title|A survey of several finite difference methods for
        systems of nonlinear hyperbolic conservation laws>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1978>

        <db-field|volume|27>

        <db-field|number|1>

        <db-field|pages|1\U31>

        <db-field|month|apr>

        <db-field|issn|0021-9991>

        <db-field|url|<slink|http://www.sciencedirect.com/science/article/pii/0021999178900232>>

        <db-field|doi|10.1016/0021-9991(78)90023-2>

        <db-field|abstract|The finite difference methods of Godunov, Hyman,
        Lax and Wendroff (two-step), MacCormack, Rusanov, the upwind scheme,
        the hybrid scheme of Harten and Zwas, the antidiffusion method of
        Boris and Book, the artificial compression method of Harten, and
        Glimm's method, a random choice method, are discussed. The methods
        are used to integrate the one-dimensional Eulerian form of the
        equations of gas dynamics in Cartesian coordinates for an inviscid,
        nonheat-conducting fluid. The test problem was a typical shock tube
        problem. The results are compared and demonstrate that Glimm's method
        has several advantages.>

        <db-field|urldate|2018-02-07>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UV|article|Lax1954>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Peter D. <name|Lax>>

        <db-field|title|Weak solutions of nonlinear hyperbolic equations and
        their numerical computation>

        <db-field|journal|Communications on Pure and Applied Mathematics>

        <db-field|year|1954>

        <db-field|volume|7>

        <db-field|number|1>

        <db-field|pages|159\U193>

        <db-field|month|feb>

        <db-field|issn|00103640, 10970312>

        <db-field|url|<slink|https://onlinelibrary.wiley.com/doi/10.1002/cpa.3160070112>>

        <db-field|doi|10.1002/cpa.3160070112>

        <db-field|language|en>

        <db-field|urldate|2021-07-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UW|book|Hirsch1990>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Charles <name|Hirsch>>

        <db-field|title|Numerical Computation of Internal and External Flows,
        Volume 2: Computational Methods for Inviscid and Viscous Flows>

        <db-field|publisher|Wiley>

        <db-field|year|1990>

        <db-field|note|bibtex: Hirsch1990>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35T2|article|Woodward1984>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Paul <name|Woodward><name-sep>Phillip
        <name|Colella>>

        <db-field|title|The numerical simulation of two-dimensional fluid
        flow with strong shocks>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1984>

        <db-field|volume|54>

        <db-field|number|1>

        <db-field|pages|115\U173>

        <db-field|month|apr>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/0021999184901426>>

        <db-field|doi|10.1016/0021-9991(84)90142-6>

        <db-field|language|en>

        <db-field|urldate|2019-08-09>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UX|book|Toro2009>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Eleuterio F. <name|Toro>>

        <db-field|title|Riemann Solvers and Numerical Methods for Fluid
        Dynamics>

        <db-field|publisher|Springer Berlin Heidelberg>

        <db-field|year|2009>

        <db-field|address|Berlin, Heidelberg>

        <db-field|isbn|978-3-540-25202-3 978-3-540-49834-6>

        <db-field|url|<slink|http://link.springer.com/10.1007/b79761>>

        <db-field|language|en>

        <db-field|urldate|2018-12-01>

        <db-field|doi|10.1007/b79761,>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UY|article|Rackauckas2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Christopher <name|Rackauckas><name-sep>Qing
        <name|Nie>>

        <db-field|title|DifferentialEquations.jl \U A Performant and
        Feature-Rich Ecosystem for Solving Differential Equations in Julia>

        <db-field|journal|Journal of Open Research Software>

        <db-field|year|2017>

        <db-field|volume|5>

        <db-field|number|1>

        <db-field|pages|15>

        <db-field|month|may>

        <db-field|note|bibtex: Rackauckas2017>

        <db-field|issn|2049-9647>

        <db-field|url|<slink|http://openresearchsoftware.metajnl.com/articles/10.5334/jors.151/>>

        <db-field|doi|10.5334/jors.151>

        <db-field|language|en>

        <db-field|urldate|2021-10-29>

        <db-field|keywords|high-precision, Julia, metaprogramming, multiple
        dispatch, multithreading, ordinary differential equations, partial
        differential equations, stochastic differential equations>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35UZ|article|Bezanson2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Jeff <name|Bezanson><name-sep>Alan
        <name|Edelman><name-sep>Stefan <name|Karpinski><name-sep>Viral B.
        <name|Shah>>

        <db-field|title|Julia: A Fresh Approach to Numerical Computing>

        <db-field|journal|SIAM Review>

        <db-field|year|2017>

        <db-field|volume|59>

        <db-field|number|1>

        <db-field|pages|65\U98>

        <db-field|month|jan>

        <db-field|note|bibtex: Bezanson2017>

        <db-field|issn|0036-1445>

        <db-field|shorttitle|Julia>

        <db-field|url|<slink|https://epubs.siam.org/doi/10.1137/141000671>>

        <db-field|doi|10.1137/141000671>

        <db-field|urldate|2021-12-19>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TG|article|Ranocha2022>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Hendrik <name|Ranocha><name-sep>Michael
        <name|Schlottke-Lakemper><name-sep>Andrew Ross
        <name|Winters><name-sep>Erik <name|Faulhaber><name-sep>Jesse
        <name|Chan><name-sep>Gregor <name|Gassner>>

        <db-field|title|Adaptive numerical simulations with Trixi.jl: A case
        study of Julia for scientific computing>

        <db-field|journal|Proceedings of the JuliaCon Conferences>

        <db-field|year|2022>

        <db-field|volume|1>

        <db-field|number|1>

        <db-field|pages|77>

        <db-field|doi|10.21105/jcon.00077>

        <db-field|eprint|2108.06476>

        <db-field|eprinttype|arXiv>

        <db-field|eprintclass|cs.MS>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35T6|article|LeVeque1996>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Randall J. <name|LeVeque>>

        <db-field|title|High-Resolution Conservative Algorithms for Advection
        in Incompressible Flow>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|1996>

        <db-field|volume|33>

        <db-field|number|2>

        <db-field|pages|627\U665>

        <db-field|month|apr>

        <db-field|note|bibtex: LeVeque1996>

        <db-field|issn|0036-1429, 1095-7170>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/0733033>>

        <db-field|doi|10.1137/0733033>

        <db-field|language|en>

        <db-field|urldate|2021-08-27>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ua|article|Batten1997>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|P. <name|Batten><name-sep>N.
        <name|Clarke><name-sep>C. <name|Lambert><name-sep>D. M.
        <name|Causon>>

        <db-field|title|On the Choice of Wavespeeds for the HLLC Riemann
        Solver>

        <db-field|journal|SIAM Journal on Scientific Computing>

        <db-field|year|1997>

        <db-field|volume|18>

        <db-field|number|6>

        <db-field|pages|1553\U1570>

        <db-field|month|nov>

        <db-field|issn|1064-8275, 1095-7197>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/S1064827593260140>>

        <db-field|doi|10.1137/S1064827593260140>

        <db-field|language|en>

        <db-field|urldate|2019-01-29>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ub|article|Yee1999>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|H.C <name|Yee><name-sep>N.D
        <name|Sandham><name-sep>M.J <name|Djomehri>>

        <db-field|title|Low-Dissipative High-Order Shock-Capturing Methods
        Using Characteristic-Based Filters>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1999>

        <db-field|volume|150>

        <db-field|number|1>

        <db-field|pages|199\U238>

        <db-field|month|mar>

        <db-field|issn|00219991>

        <db-field|url|<slink|https://linkinghub.elsevier.com/retrieve/pii/S0021999198961770>>

        <db-field|doi|10.1006/jcph.1998.6177>

        <db-field|language|en>

        <db-field|urldate|2019-08-07>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uc|inproceedings|Spiegel2016>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Seth C. <name|Spiegel><name-sep>James R.
        <name|DeBonis><name-sep>H.T. <name|Huynh>>

        <db-field|title|Overview of the NASA Glenn Flux Reconstruction Based
        High-Order Unstructured Grid Code>

        <db-field|booktitle|54th AIAA Aerospace Sciences Meeting>

        <db-field|year|2016>

        <db-field|address|San Diego, California, USA>

        <db-field|month|jan>

        <db-field|publisher|American Institute of Aeronautics and
        Astronautics>

        <db-field|note|bibtex: Spiegel2016>

        <db-field|isbn|978-1-62410-393-3>

        <db-field|url|<slink|https://arc.aiaa.org/doi/10.2514/6.2016-1061>>

        <db-field|doi|10.2514/6.2016-1061>

        <db-field|language|en>

        <db-field|urldate|2022-05-20>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ud|article|Roe1981>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Philip L. <name|Roe>>

        <db-field|title|Approximate Riemann solvers, parameter vectors, and
        difference schemes>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1981>

        <db-field|volume|43>

        <db-field|number|2>

        <db-field|pages|357\U372>

        <db-field|month|oct>

        <db-field|issn|0021-9991>

        <db-field|url|<slink|http://www.sciencedirect.com/science/article/pii/0021999181901285>>

        <db-field|doi|10.1016/0021-9991(81)90128-5>

        <db-field|urldate|2017-12-28>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ue|article|Harten1983a>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Amiram <name|Harten><name-sep>Peter D.
        <name|Lax><name-sep>Bram van <name|Leer>>

        <db-field|title|On Upstream Differencing and Godunov-Type Schemes for
        Hyperbolic Conservation Laws>

        <db-field|journal|SIAM Review>

        <db-field|year|1983>

        <db-field|volume|25>

        <db-field|number|1>

        <db-field|pages|35\U61>

        <db-field|month|jan>

        <db-field|issn|0036-1445, 1095-7200>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/1025002>>

        <db-field|doi|10.1137/1025002>

        <db-field|language|en>

        <db-field|urldate|2019-07-06>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uf|article|Einfeldt1988>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bernd <name|Einfeldt>>

        <db-field|title|On Godunov-Type Methods for Gas Dynamics>

        <db-field|journal|SIAM Journal on Numerical Analysis>

        <db-field|year|1988>

        <db-field|volume|25>

        <db-field|number|2>

        <db-field|pages|294\U318>

        <db-field|month|apr>

        <db-field|issn|0036-1429, 1095-7170>

        <db-field|url|<slink|http://epubs.siam.org/doi/10.1137/0725021>>

        <db-field|doi|10.1137/0725021>

        <db-field|language|en>

        <db-field|urldate|2019-03-28>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ug|article|Guermond2016>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Jean-Luc <name|Guermond><name-sep>Bojan
        <name|Popov>>

        <db-field|title|Fast estimation from above of the maximum wave speed
        in the Riemann problem for the Euler equations>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2016>

        <db-field|volume|321>

        <db-field|number|C>

        <db-field|pages|908\U926>

        <db-field|month|sep>

        <db-field|note|bibtex: Guermond2016>

        <db-field|issn|0021-9991>

        <db-field|url|<slink|https://doi.org/10.1016/j.jcp.2016.05.054>>

        <db-field|doi|10.1016/j.jcp.2016.05.054>

        <db-field|abstract|This paper is concerned with the construction of a
        fast algorithm for computing the maximum speed of propagation in the
        Riemann solution for the Euler system of gas dynamics with the
        co-volume equation of state. The novelty in the algorithm is that it
        stops when a guaranteed upper bound for the maximum speed is reached
        with a prescribed accuracy. The convergence rate of the algorithm is
        cubic and the bound is guaranteed for gasses with the co-volume
        equation of state and the heat capacity ratio \<gamma\> in the range
        ( 1 , 5 / 3 .>

        <db-field|urldate|2021-10-13>

        <db-field|keywords|Co-volume equation of state, Euler system of gas
        dynamics, Maximum speed of propagation, Riemann problem>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Uh|article|Toro2020>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|E. F. <name|Toro><name-sep>L. O.
        <name|Müller><name-sep>A. <name|Siviglia>>

        <db-field|title|Bounds for Wave Speeds in the Riemann Problem: Direct
        Theoretical Estimates>

        <db-field|journal|Computers & Fluids>

        <db-field|year|2020>

        <db-field|volume|209>

        <db-field|pages|104640>

        <db-field|month|sep>

        <db-field|note|bibtex: Toro2020>

        <db-field|issn|0045-7930>

        <db-field|shorttitle|Bounds for Wave Speeds in the Riemann Problem>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0045793020302127>>

        <db-field|doi|10.1016/j.compfluid.2020.104640>

        <db-field|language|en>

        <db-field|urldate|2021-10-13>

        <db-field|keywords|Riemann problem, Bounds for wave speeds, Courant
        condition, Hyperbolic equations, Stability, Waves>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ui|article|Toro1994>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|E. F. <name|Toro><name-sep>M.
        <name|Spruce><name-sep>W. <name|Speares>>

        <db-field|title|Restoration of the contact surface in the HLL-Riemann
        solver>

        <db-field|journal|Shock Waves>

        <db-field|year|1994>

        <db-field|volume|4>

        <db-field|number|1>

        <db-field|pages|25\U34>

        <db-field|month|jul>

        <db-field|issn|0938-1287, 1432-2153>

        <db-field|url|<slink|https://link.springer.com/article/10.1007/BF01414629>>

        <db-field|doi|10.1007/BF01414629>

        <db-field|abstract|The missing contact surface in the approximate
        Riemann solver of Harten, Lax, and van Leer is restored. This is
        achieved following the same principles as in the original solver. We
        also present new ways of obtaining wave-speed estimates. The
        resulting solver is as accurate and robust as the exact Riemann
        solver, but it is simpler and computationally more efficient than the
        latter, particulaly for non-ideal gases. The improved Riemann solver
        is implemented in the second-order WAF method and tested for
        one-dimensional problems with exact solutions and for a
        two-dimensional problem with experimental results.>

        <db-field|language|en>

        <db-field|urldate|2017-12-28>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TV|article|zhang2010c>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Xiangxiong <name|Zhang><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|On positivity-preserving high order discontinuous
        galerkin schemes for compressible euler equations on rectangular
        meshes>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2010>

        <db-field|volume|229>

        <db-field|number|23>

        <db-field|pages|8918\U8934>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2010.08.016>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999110004535>>

        <db-field|keywords|Hyperbolic conservation laws, Discontinuous
        Galerkin method, Positivity preserving, High order accuracy,
        Compressible Euler equations , Gas dynamics, Finite volume scheme,
        Essentially non-oscillatory scheme, Weighted essentially
        non-oscillatory scheme>

        <db-field|abstract|We construct uniformly high order accurate
        discontinuous Galerkin (DG) schemes which preserve positivity of
        density and pressure for Euler equations of compressible gas
        dynamics. The same framework also applies to high order accurate
        finite volume (e.g. essentially non-oscillatory (ENO) or weighted ENO
        (WENO)) schemes. Motivated by Perthame and Shu (1996) [20] and Zhang
        and Shu (2010) [26], a general framework, for arbitrary order of
        accuracy, is established to construct a positivity preserving limiter
        for the finite volume and DG methods with first order Euler forward
        time discretization solving one-dimensional compressible Euler
        equations. The limiter can be proven to maintain high order accuracy
        and is easy to implement. Strong stability preserving (SSP) high
        order time discretizations will keep the positivity property.
        Following the idea in Zhang and Shu (2010) [26], we extend this
        framework to higher dimensions on rectangular meshes in a
        straightforward way. Numerical tests for the third order DG method
        are reported to demonstrate the effectiveness of the methods.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Tb|book|Canuto2007>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|C. <name|Canuto><name-sep>M.Y.
        <name|Hussaini><name-sep>A. <name|Quarteroni><name-sep>T.A.
        <name|Zang>>

        <db-field|title|Spectral Methods: Fundamentals in Single Domains>

        <db-field|publisher|Springer Berlin Heidelberg>

        <db-field|year|2007>

        <db-field|series|Scientific Computation>

        <db-field|isbn|9783540307266>

        <db-field|url|<slink|https://books.google.co.in/books?id=DFJB0kiq0CQC>>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VH|article|vanleer1977>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Bram <name|Van Leer>>

        <db-field|title|Towards the ultimate conservative difference scheme.
        iv. a new approach to numerical convection>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1977>

        <db-field|volume|23>

        <db-field|number|3>

        <db-field|pages|276\U299>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/0021-9991(77)90095-X>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/002199917790095X>>

        <db-field|abstract|An approach to numerical convection is presented
        that exclusively yields upstream-centered schemes. It starts from a
        meshwise approximation of the initial-value distribution by simple
        basic functions, e.g., Legendre polynomials. In every mesh the
        integral of the distribution is conserved. The overall approximation
        need not be continuous. The approximate distribution is convected
        explicitly and then remapped meshwise in terms of the basic
        functions. The weights of the basic functions that approximate the
        initial values in a mesh may be determined by finite differencing,
        but the most accurate schemes are obtained by least-squares fitting.
        In the latter schemes, the weights of the basic functions must be
        regarded as independent state quantities and must be stored
        separately. Examples of second-order and third-order schemes are
        given, and the accuracy of these schemes is discussed. Several
        monotonicity algorithms, designed to prevent numerical oscillations,
        are indicated. Numerical examples are given of linear and nonlinear
        wave propagation, also regarding monotonicity.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VK|article|meena2017>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Asha Kumari <name|Meena><name-sep>Harish
        <name|Kumar>>

        <db-field|title|Robust MUSCL Schemes for Ten-Moment Gaussian Closure
        Equations with Source Terms>

        <db-field|journal|International Journal on Finite Volumes>

        <db-field|year|2017>

        <db-field|month|Oct>

        <db-field|url|<slink|https://hal.archives-ouvertes.fr/hal-01619021>>

        <db-field|publisher|Institut de Mathématiques de Marseille, AMU>

        <db-field|keywords|Ten-Moment equations ; Finite Volume Methods ;
        MUSCL ; Scheme ; Positivity preserving schemes ; Robust MUSCL Schemes
        for Ten-Moment Gaussian Closure Equations with Source Terms>

        <db-field|pdf|<slink|https://hal.archives-ouvertes.fr/hal-01619021/file/IJFVmeenakumar.pdf>>

        <db-field|hal_id|hal-01619021>

        <db-field|hal_version|v1>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Vo|article|schlottkelakemper2021purely>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Michael <name|Schlottke-Lakemper><name-sep>Andrew R
        <name|Winters><name-sep>Hendrik <name|Ranocha><name-sep>Gregor J
        <name|Gassner>>

        <db-field|title|A purely hyperbolic discontinuous Galerkin approach
        for self-gravitating gas dynamics>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2021>

        <db-field|volume|442>

        <db-field|pages|110467>

        <db-field|month|06>

        <db-field|publisher|Elsevier>

        <db-field|doi|10.1016/j.jcp.2021.110467>

        <db-field|eprint|2008.10593>

        <db-field|eprinttype|arXiv>

        <db-field|eprintclass|math.NA>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VI|misc|tenkai>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Arpit <name|Babbar><name-sep>Praveen
        <name|Chandrashekar><name-sep>Sudarshan Kumar <name|Kenettinkara>>

        <db-field|title|Tenkai.jl: Temporal discretizations of high-order PDE
        solvers>

        <db-field|howpublished|<slink|https://github.com/Arpit-Babbar/Tenkai.jl>>

        <db-field|year|2023>

        <db-field|doi|<slink|https://doi.org/10.5281/zenodo.7807833>>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VJ|misc|paperrepo>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Arpit <name|Babbar><name-sep>Praveen
        <name|Chandrashekar><name-sep>Sudarshan Kumar <name|Kenettinkara>>

        <db-field|title|Admissibility preserving subcell based blending
        limiter with Tenkai.jl>

        <db-field|howpublished|<slink|https://github.com/Arpit-Babbar/jsc2023>>

        <db-field|year|2023>

        <db-field|doi|<slink|https://doi.org/>>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VL|incollection|sedov1959>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|L.I. <name|SEDOV>>

        <db-field|title|Chapter iv - one-dimensional unsteady motion of a
        gas>

        <db-field|booktitle|Similarity and Dimensional Methods in Mechanics>

        <db-field|pages|146\U304>

        <db-field|publisher|Academic Press>

        <db-field|year|1959>

        <db-field|editor|L.I. <name|SEDOV>>

        <db-field|isbn|978-1-4832-0088-0>

        <db-field|doi|<slink|https://doi.org/10.1016/B978-1-4832-0088-0.50011-6>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/B9781483200880500116>>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VS|article|zhang2012>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Xiangxiong <name|Zhang><name-sep>Chi-Wang
        <name|Shu>>

        <db-field|title|Positivity-preserving high order finite difference
        weno schemes for compressible euler equations>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2012>

        <db-field|volume|231>

        <db-field|number|5>

        <db-field|pages|2245\U2258>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2011.11.020>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999111006759>>

        <db-field|keywords|Positivity preserving, High order accuracy,
        Compressible Euler equations, Gas dynamics, Finite difference scheme,
        Essentially non-oscillatory scheme, Weighted essentially
        non-oscillatory scheme>

        <db-field|abstract|In Zhang and Shu (2010) [20], Zhang and Shu (2011)
        [21] and Zhang et al. (in press) [23], we constructed uniformly high
        order accurate discontinuous Galerkin (DG) and finite volume schemes
        which preserve positivity of density and pressure for the Euler
        equations of compressible gas dynamics. In this paper, we present an
        extension of this framework to construct positivity-preserving high
        order essentially non-oscillatory (ENO) and weighted essentially
        non-oscillatory (WENO) finite difference schemes for compressible
        Euler equations. General equations of state and source terms are also
        discussed. Numerical tests of the fifth order finite difference WENO
        scheme are reported to demonstrate the good behavior of such
        schemes.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VM|article|Glimm1985>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|James <name|Glimm><name-sep>Christian
        <name|Klingenberg><name-sep>Oliver <name|McBryan><name-sep>Bradley
        <name|Plohr><name-sep>David <name|Sharp><name-sep>Sara <name|Yaniv>>

        <db-field|title|Front tracking and two-dimensional riemann problems>

        <db-field|journal|Advances in Applied Mathematics>

        <db-field|year|1985>

        <db-field|volume|6>

        <db-field|number|3>

        <db-field|pages|259\U290>

        <db-field|issn|0196-8858>

        <db-field|doi|<slink|https://doi.org/10.1016/0196-8858(85)90014-4>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/0196885885900144>>

        <db-field|abstract|A substantial improvement in resolution has been
        achieved for the computation of jump discontinuities in gas dynamics
        using the method of front tracking. The essential feature of this
        method is that a lower dimensional grid is fitted to and follows the
        discontinuous waves. At the intersection points of these
        discontinuities, two-dimensional Riemann problems occur. In this
        paper we study such two-dimensional Riemann problems from both
        numerical and theoretical points of view. Specifically included is a
        numerical solution for the Mach reflection, a general classification
        scheme for two-dimensional elementary waves, and a discussion of
        problems and conjectures in this area.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VN|article|Zhang1990>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Tong <name|Zhang><name-sep>Yuxi <name|Zheng>>

        <db-field|title|Conjecture on the structure of solutions of the
        riemann problem for two-dimensional gas dynamics systems>

        <db-field|journal|Siam Journal on Mathematical Analysis>

        <db-field|year|1990>

        <db-field|volume|21>

        <db-field|pages|593\U630>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VO|article|Lax1998>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Peter D. <name|Lax><name-sep>Xu-Dong <name|Liu>>

        <db-field|title|Solution of two-dimensional riemann problems of gas
        dynamics by positive schemes>

        <db-field|journal|SIAM Journal on Scientific Computing>

        <db-field|year|1998>

        <db-field|volume|19>

        <db-field|number|2>

        <db-field|pages|319\U340>

        <db-field|doi|10.1137/S1064827595291819>

        <db-field|url|<slink|https://doi.org/10.1137/S1064827595291819>>

        <db-field|eprint|<slink|https://doi.org/10.1137/S1064827595291819>>

        <db-field|abstract|The positivity principle and positive schemes to
        solve multidimensional hyperbolic systems of conservation laws have
        been introduced in [X.-D. Liu and P. D. Lax, J. Fluid Dynam., 5
        (1996), pp. 133\U156]. Some numerical experiments presented there
        show how well the method works. In this paper we use positive schemes
        to solve Riemann problems for two-dimensional gas dynamics.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VP|article|Volker2010>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Volker <name|Springel>>

        <db-field|title|E pur si muove: Galilean-invariant cosmological
        hydrodynamical simulations on a moving mesh>

        <db-field|journal|Monthly Notices of the Royal Astronomical Society>

        <db-field|year|2010>

        <db-field|volume|401>

        <db-field|number|2>

        <db-field|pages|791\U851>

        <db-field|month|01>

        <db-field|abstract|Hydrodynamic cosmological simulations at present
        usually employ either the Lagrangian smoothed particle hydrodynamics
        (SPH) technique or Eulerian hydrodynamics on a Cartesian mesh with
        (optional) adaptive mesh refinement (AMR). Both of these methods have
        disadvantages that negatively impact their accuracy in certain
        situations, for example the suppression of fluid instabilities in the
        case of SPH, and the lack of Galilean invariance and the presence of
        overmixing in the case of AMR. We here propose a novel scheme which
        largely eliminates these weaknesses. It is based on a moving
        unstructured mesh defined by the Voronoi tessellation of a set of
        discrete points. The mesh is used to solve the hyperbolic
        conservation laws of ideal hydrodynamics with a finite-volume
        approach, based on a second-order unsplit Godunov scheme with an
        exact Riemann solver. The mesh-generating points can in principle be
        moved arbitrarily. If they are chosen to be stationary, the scheme is
        equivalent to an ordinary Eulerian method with second-order accuracy.
        If they instead move with the velocity of the local flow, one obtains
        a Lagrangian formulation of continuum hydrodynamics that does not
        suffer from the mesh distortion limitations inherent in other
        mesh-based Lagrangian schemes. In this mode, our new method is fully
        Galilean invariant, unlike ordinary Eulerian codes, a property that
        is of significant importance for cosmological simulations where
        highly supersonic bulk flows are common. In addition, the new scheme
        can adjust its spatial resolution automatically and continuously, and
        hence inherits the principal advantage of SPH for simulations of
        cosmological structure growth. The high accuracy of Eulerian methods
        in the treatment of shocks is also retained, while the treatment of
        contact discontinuities improves. We discuss how this approach is
        implemented in our new code arepo, both in 2D and in 3D, and is
        parallelized for distributed memory computers. We also discuss
        techniques for adaptive refinement or de-refinement of the
        unstructured mesh. We introduce an individual time-step approach for
        finite-volume hydrodynamics, and present a high-accuracy treatment of
        self-gravity for the gas that allows the new method to be seamlessly
        combined with a high-resolution treatment of collisionless dark
        matter. We use a suite of test problems to examine the performance of
        the new code and argue that the hydrodynamic moving-mesh scheme
        proposed here provides an attractive and competitive alternative to
        current SPH and Eulerian techniques.>

        <db-field|issn|0035-8711>

        <db-field|doi|10.1111/j.1365-2966.2009.15715.x>

        <db-field|url|<slink|https://doi.org/10.1111/j.1365-2966.2009.15715.x>>

        <db-field|eprint|<slink|https://academic.oup.com/mnras/article-pdf/401/2/791/3952227/mnras0401-0791.pdf>>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TU|article|ha2005>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Youngsoo <name|Ha><name-sep>Carl
        <name|Gardner><name-sep>Anne <name|Gelb><name-sep>Chi Wang
        <name|Shu>>

        <db-field|title|Numerical simulation of high mach number
        astrophysical jets with radiative cooling>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2005>

        <db-field|volume|24>

        <db-field|number|1>

        <db-field|pages|597\U612>

        <db-field|month|jul>

        <db-field|abstract|Computational fluid dynamics simulations using the
        WENO-LF method are applied to high Mach number nonrelativistic
        astrophysical jets, including the effects of radiative cooling. Our
        numerical methods have allowed us to simulate astrophysical jets at
        much higher Mach numbers than have been attained (Mach 20) in the
        literature. Our simulations of the HH 1-2 astrophysical jets are at
        Mach 80. Simulations at high Mach numbers and with radiative cooling
        are essential for achieving detailed agreement with the astrophysical
        images.>

        <db-field|keywords|Astrophysical jets, Radiative cooling, WENO
        method>

        <db-field|doi|10.1007/s10915-004-4786-4>

        <db-field|language|English (US)>

        <db-field|issn|0885-7474>

        <db-field|publisher|Springer New York>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35VQ|article|Takayama1991>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|K. <name|Takayama><name-sep>O. <name|Inoue>>

        <db-field|title|Shock wave diffraction over a 90 degree sharp corner
        ? posters presented at 18th ISSW>

        <db-field|journal|Shock Waves>

        <db-field|year|1991>

        <db-field|volume|1>

        <db-field|number|4>

        <db-field|pages|301\U312>

        <db-field|month|dec>

        <db-field|doi|10.1007/bf01418886>

        <db-field|url|<slink|https://doi.org/10.1007%2Fbf01418886>>

        <db-field|publisher|Springer Science and Business Media LLC>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35TW|article|emery1968>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Ashley F <name|Emery>>

        <db-field|title|An evaluation of several differencing methods for
        inviscid fluid flow problems>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|1968>

        <db-field|volume|2>

        <db-field|number|3>

        <db-field|pages|306\U331>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/0021-9991(68)90060-0>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/0021999168900600>>

        <db-field|abstract|An evaluation was made of five algorithms for
        ideal inviscid flow: Lax's, Rusanov's, Landshoff's, the Lax-Wendroff,
        and Richtmyer's. These algorithms were compared on the basis of ease
        of coding, spatial and temporal resolution, and execution time. The
        comparisons were drawn through studies of a one-dimensional reflected
        shock wave, a flat-faced step in supersonic flow, and passage of a
        normal shock wave over a stationary cone. Lax's method was found to
        be the easiest to implement and of good resolution; Rusanov's to be
        the most versatile and of better resolution; and a modified version
        of the Lax-Wendroff to yield the best resolution but to be the most
        difficult and time-consuming to use.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35Ti|article|Cui2023>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|Shumo <name|Cui><name-sep>Shengrong
        <name|Ding><name-sep>Kailiang <name|Wu>>

        <db-field|title|Is the classic convex decomposition optimal for
        bound-preserving schemes in multiple dimensions?>

        <db-field|journal|Journal of Computational Physics>

        <db-field|year|2023>

        <db-field|volume|476>

        <db-field|pages|111882>

        <db-field|issn|0021-9991>

        <db-field|doi|<slink|https://doi.org/10.1016/j.jcp.2022.111882>>

        <db-field|url|<slink|https://www.sciencedirect.com/science/article/pii/S0021999122009457>>

        <db-field|keywords|Optimal convex decomposition, Bound-preserving
        schemes, Hyperbolic conservation laws, Discontinuous Galerkin
        methods, Multidimensional>

        <db-field|abstract|Since proposed in Zhang and Shu (2010) [1], the
        Zhang\UShu framework has attracted extensive attention and motivated
        many bound-preserving (BP) high-order discontinuous Galerkin and
        finite volume schemes for various hyperbolic equations. A key
        ingredient in the framework is the decomposition of the cell averages
        of the numerical solution into a convex combination of the solution
        values at certain quadrature points, which helps to rewrite
        high-order schemes as convex combinations of formally first-order
        schemes. The classic convex decomposition originally proposed by
        Zhang and Shu has been widely used over the past decade. It was
        verified, only for the 1D quadratic and cubic polynomial spaces, that
        the classic decomposition is optimal in the sense of achieving the
        mildest BP CFL condition. Yet, it remained unclear whether the
        classic decomposition is optimal in multiple dimensions. In this
        paper, we find that the classic multidimensional decomposition based
        on the tensor product of Gauss\ULobatto and Gauss quadratures is
        generally not optimal, and we discover a novel alternative
        decomposition for the 2D and 3D polynomial spaces of total degree up
        to 2 and 3, respectively, on Cartesian meshes. Our new decomposition
        allows a larger BP time step-size than the classic one, and moreover,
        it is rigorously proved to be optimal to attain the mildest BP CFL
        condition, yet requires much fewer nodes. The discovery of such an
        optimal convex decomposition is highly nontrivial yet meaningful, as
        it may lead to an improvement of high-order BP schemes for a large
        class of hyperbolic or convection-dominated equations, at the cost of
        only a slight and local modification to the implementation code.
        Several numerical examples are provided to further validate the
        advantages of using our optimal decomposition over the classic one in
        terms of efficiency.>
      </db-entry>

      <\db-entry|+1ZeFeLzoEte35U7|article|Mengaldo2015>
        <db-field|contributor|Arpit>

        <db-field|modus|imported>

        <db-field|date|1704255833>
      <|db-entry>
        <db-field|author|G. <name|Mengaldo><name-sep>D. De
        <name|Grazia><name-sep>P. E. <name|Vincent><name-sep>S. J.
        <name|Sherwin>>

        <db-field|title|On the connections between discontinuous galerkin and
        flux reconstruction schemes: extension to curvilinear meshes>

        <db-field|journal|Journal of Scientific Computing>

        <db-field|year|2015>

        <db-field|volume|67>

        <db-field|number|3>

        <db-field|pages|1272\U1292>

        <db-field|month|oct>

        <db-field|doi|10.1007/s10915-015-0119-z>

        <db-field|url|<slink|https://doi.org/10.1007/s10915-015-0119-z>>

        <db-field|publisher|Springer Science and Business Media LLC>
      </db-entry>
    </associate>
  </collection>
</attachments>

<\references>
  <\collection>
    <associate|alg:blended.flux|<tuple|8.1|184|ch6_curved_meshes.tm>>
    <associate|alg:blended.flux.2d|<tuple|G.1|267|appendix.tm>>
    <associate|alg:cache.blocking|<tuple|D.1|244|appendix.tm>>
    <associate|alg:cell.residual|<tuple|8.2|196|ch6_curved_meshes.tm>>
    <associate|alg:flux.limit|<tuple|5.1|115|ch3_blending_limiter.tm>>
    <associate|alg:high.level.lw|<tuple|5.2|117|ch3_blending_limiter.tm>>
    <associate|alg:lw.residual|<tuple|8.3|196|ch6_curved_meshes.tm>>
    <associate|alg:lwfr.paper1|<tuple|4.2|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|alg:rkfr.paper1|<tuple|4.1|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|alg:scaling|<tuple|F.1|249|appendix.tm>>
    <associate|alg:source.limit|<tuple|6.1|139|ch5_10_moment_problem.tm>>
    <associate|alg:time.stepping|<tuple|8.4|197|ch6_curved_meshes.tm>>
    <associate|app:efficient.diff|<tuple|D|243|appendix.tm>>
    <associate|app:equiv.dg.fr|<tuple|C|237|appendix.tm>>
    <associate|app:scaling.limiter|<tuple|F|249|appendix.tm>>
    <associate|auto-1|<tuple|?|3|acknowledgements.tm>>
    <associate|auto-10|<tuple|1.4|25|ch0_introduction.tm>>
    <associate|auto-100|<tuple|4.35|95|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-101|<tuple|4.10.3|95|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-102|<tuple|4.36|96|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-103|<tuple|4.37|96|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-104|<tuple|4.11|96|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-105|<tuple|4.11.1|97|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-106|<tuple|4.38|98|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-107|<tuple|4.39|99|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-108|<tuple|4.40|99|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-109|<tuple|4.11.2|99|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-11|<tuple|1.5|29|ch0_introduction.tm>>
    <associate|auto-110|<tuple|4.41|100|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-111|<tuple|4.42|101|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-112|<tuple|4.43|101|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-113|<tuple|4.12|101|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-114|<tuple|5|103|ch3_blending_limiter.tm>>
    <associate|auto-115|<tuple|5.1|103|ch3_blending_limiter.tm>>
    <associate|auto-116|<tuple|5.2|103|ch3_blending_limiter.tm>>
    <associate|auto-117|<tuple|5.3|105|ch3_blending_limiter.tm>>
    <associate|auto-118|<tuple|5.3.1|105|ch3_blending_limiter.tm>>
    <associate|auto-119|<tuple|5.1|106|ch3_blending_limiter.tm>>
    <associate|auto-12|<tuple|2|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-120|<tuple|5.3.2|108|ch3_blending_limiter.tm>>
    <associate|auto-121|<tuple|5.2|109|ch3_blending_limiter.tm>>
    <associate|auto-122|<tuple|5.3.3|109|ch3_blending_limiter.tm>>
    <associate|auto-123|<tuple|5.4|110|ch3_blending_limiter.tm>>
    <associate|auto-124|<tuple|5.4.1|112|ch3_blending_limiter.tm>>
    <associate|auto-125|<tuple|5.5|113|ch3_blending_limiter.tm>>
    <associate|auto-126|<tuple|5.6|116|ch3_blending_limiter.tm>>
    <associate|auto-127|<tuple|5.7|117|ch3_blending_limiter.tm>>
    <associate|auto-128|<tuple|5.7.1|118|ch3_blending_limiter.tm>>
    <associate|auto-129|<tuple|5.7.1.1|118|ch3_blending_limiter.tm>>
    <associate|auto-13|<tuple|2.1|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-130|<tuple|5.3|118|ch3_blending_limiter.tm>>
    <associate|auto-131|<tuple|5.7.1.2|119|ch3_blending_limiter.tm>>
    <associate|auto-132|<tuple|5.4|119|ch3_blending_limiter.tm>>
    <associate|auto-133|<tuple|5.7.1.3|119|ch3_blending_limiter.tm>>
    <associate|auto-134|<tuple|5.5|120|ch3_blending_limiter.tm>>
    <associate|auto-135|<tuple|5.7.1.4|120|ch3_blending_limiter.tm>>
    <associate|auto-136|<tuple|5.6|121|ch3_blending_limiter.tm>>
    <associate|auto-137|<tuple|5.7|121|ch3_blending_limiter.tm>>
    <associate|auto-138|<tuple|5.8|121|ch3_blending_limiter.tm>>
    <associate|auto-139|<tuple|5.8|122|ch3_blending_limiter.tm>>
    <associate|auto-14|<tuple|2.1.1|32|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-140|<tuple|5.9|122|ch3_blending_limiter.tm>>
    <associate|auto-141|<tuple|5.9.1|123|ch3_blending_limiter.tm>>
    <associate|auto-142|<tuple|5.9|123|ch3_blending_limiter.tm>>
    <associate|auto-143|<tuple|5.9.2|123|ch3_blending_limiter.tm>>
    <associate|auto-144|<tuple|5.10|124|ch3_blending_limiter.tm>>
    <associate|auto-145|<tuple|5.11|125|ch3_blending_limiter.tm>>
    <associate|auto-146|<tuple|5.12|125|ch3_blending_limiter.tm>>
    <associate|auto-147|<tuple|5.9.3|125|ch3_blending_limiter.tm>>
    <associate|auto-148|<tuple|5.13|126|ch3_blending_limiter.tm>>
    <associate|auto-149|<tuple|5.9.4|126|ch3_blending_limiter.tm>>
    <associate|auto-15|<tuple|2.1.2|33|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-150|<tuple|5.14|127|ch3_blending_limiter.tm>>
    <associate|auto-151|<tuple|5.9.5|127|ch3_blending_limiter.tm>>
    <associate|auto-152|<tuple|5.15|128|ch3_blending_limiter.tm>>
    <associate|auto-153|<tuple|5.9.6|128|ch3_blending_limiter.tm>>
    <associate|auto-154|<tuple|5.16|129|ch3_blending_limiter.tm>>
    <associate|auto-155|<tuple|5.17|130|ch3_blending_limiter.tm>>
    <associate|auto-156|<tuple|5.9.7|130|ch3_blending_limiter.tm>>
    <associate|auto-157|<tuple|5.18|131|ch3_blending_limiter.tm>>
    <associate|auto-158|<tuple|5.9.8|131|ch3_blending_limiter.tm>>
    <associate|auto-159|<tuple|5.19|132|ch3_blending_limiter.tm>>
    <associate|auto-16|<tuple|2.1.3|34|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-160|<tuple|5.20|133|ch3_blending_limiter.tm>>
    <associate|auto-161|<tuple|5.10|133|ch3_blending_limiter.tm>>
    <associate|auto-162|<tuple|6|135|ch5_10_moment_problem.tm>>
    <associate|auto-163|<tuple|6.1|135|ch5_10_moment_problem.tm>>
    <associate|auto-164|<tuple|6.2|135|ch5_10_moment_problem.tm>>
    <associate|auto-165|<tuple|6.2.1|137|ch5_10_moment_problem.tm>>
    <associate|auto-166|<tuple|6.2.2|137|ch5_10_moment_problem.tm>>
    <associate|auto-167|<tuple|6.3|137|ch5_10_moment_problem.tm>>
    <associate|auto-168|<tuple|6.3.1|137|ch5_10_moment_problem.tm>>
    <associate|auto-169|<tuple|6.3.2|139|ch5_10_moment_problem.tm>>
    <associate|auto-17|<tuple|2.1|34|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-170|<tuple|6.4|140|ch5_10_moment_problem.tm>>
    <associate|auto-171|<tuple|6.4.1|141|ch5_10_moment_problem.tm>>
    <associate|auto-172|<tuple|6.1|141|ch5_10_moment_problem.tm>>
    <associate|auto-173|<tuple|6.4.2|142|ch5_10_moment_problem.tm>>
    <associate|auto-174|<tuple|6.2|142|ch5_10_moment_problem.tm>>
    <associate|auto-175|<tuple|6.4.3|142|ch5_10_moment_problem.tm>>
    <associate|auto-176|<tuple|6.3|143|ch5_10_moment_problem.tm>>
    <associate|auto-177|<tuple|6.4.4|143|ch5_10_moment_problem.tm>>
    <associate|auto-178|<tuple|6.4|144|ch5_10_moment_problem.tm>>
    <associate|auto-179|<tuple|6.4.5|143|ch5_10_moment_problem.tm>>
    <associate|auto-18|<tuple|2.2|35|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-180|<tuple|6.5|144|ch5_10_moment_problem.tm>>
    <associate|auto-181|<tuple|6.4.6|145|ch5_10_moment_problem.tm>>
    <associate|auto-182|<tuple|6.6|145|ch5_10_moment_problem.tm>>
    <associate|auto-183|<tuple|6.4.7|145|ch5_10_moment_problem.tm>>
    <associate|auto-184|<tuple|6.7|146|ch5_10_moment_problem.tm>>
    <associate|auto-185|<tuple|6.5|146|ch5_10_moment_problem.tm>>
    <associate|auto-186|<tuple|7|147|ch4_mdrk.tm>>
    <associate|auto-187|<tuple|7.1|147|ch4_mdrk.tm>>
    <associate|auto-188|<tuple|7.2|148|ch4_mdrk.tm>>
    <associate|auto-189|<tuple|7.2.1|149|ch4_mdrk.tm>>
    <associate|auto-19|<tuple|2.2|35|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-190|<tuple|7.2.2|149|ch4_mdrk.tm>>
    <associate|auto-191|<tuple|7.2.3|150|ch4_mdrk.tm>>
    <associate|auto-192|<tuple|7.2.4|151|ch4_mdrk.tm>>
    <associate|auto-193|<tuple|7.2.5|151|ch4_mdrk.tm>>
    <associate|auto-194|<tuple|7.2.6|152|ch4_mdrk.tm>>
    <associate|auto-195|<tuple|7.3|153|ch4_mdrk.tm>>
    <associate|auto-196|<tuple|7.3.1|153|ch4_mdrk.tm>>
    <associate|auto-197|<tuple|7.3.2|154|ch4_mdrk.tm>>
    <associate|auto-198|<tuple|7.1|155|ch4_mdrk.tm>>
    <associate|auto-199|<tuple|7.4|155|ch4_mdrk.tm>>
    <associate|auto-2|<tuple|?|5|publications.tm>>
    <associate|auto-20|<tuple|2.3|36|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-200|<tuple|7.5|157|ch4_mdrk.tm>>
    <associate|auto-201|<tuple|7.5.1|158|ch4_mdrk.tm>>
    <associate|auto-202|<tuple|7.5.1.1|158|ch4_mdrk.tm>>
    <associate|auto-203|<tuple|7.1|158|ch4_mdrk.tm>>
    <associate|auto-204|<tuple|7.5.1.2|158|ch4_mdrk.tm>>
    <associate|auto-205|<tuple|7.2|159|ch4_mdrk.tm>>
    <associate|auto-206|<tuple|7.5.1.3|159|ch4_mdrk.tm>>
    <associate|auto-207|<tuple|7.3|159|ch4_mdrk.tm>>
    <associate|auto-208|<tuple|7.4|160|ch4_mdrk.tm>>
    <associate|auto-209|<tuple|7.5.2|160|ch4_mdrk.tm>>
    <associate|auto-21|<tuple|3|39|ch1b_finite_volume_method.tm>>
    <associate|auto-210|<tuple|7.5.2.1|160|ch4_mdrk.tm>>
    <associate|auto-211|<tuple|7.5|160|ch4_mdrk.tm>>
    <associate|auto-212|<tuple|7.5.2.2|161|ch4_mdrk.tm>>
    <associate|auto-213|<tuple|7.6|161|ch4_mdrk.tm>>
    <associate|auto-214|<tuple|7.5.2.3|161|ch4_mdrk.tm>>
    <associate|auto-215|<tuple|7.7|162|ch4_mdrk.tm>>
    <associate|auto-216|<tuple|7.5.2.4|162|ch4_mdrk.tm>>
    <associate|auto-217|<tuple|7.8|162|ch4_mdrk.tm>>
    <associate|auto-218|<tuple|7.5.3|162|ch4_mdrk.tm>>
    <associate|auto-219|<tuple|7.5.3.1|163|ch4_mdrk.tm>>
    <associate|auto-22|<tuple|3.1|39|ch1b_finite_volume_method.tm>>
    <associate|auto-220|<tuple|7.9|163|ch4_mdrk.tm>>
    <associate|auto-221|<tuple|7.5.3.2|163|ch4_mdrk.tm>>
    <associate|auto-222|<tuple|7.10|165|ch4_mdrk.tm>>
    <associate|auto-223|<tuple|7.11|165|ch4_mdrk.tm>>
    <associate|auto-224|<tuple|7.5.3.3|165|ch4_mdrk.tm>>
    <associate|auto-225|<tuple|7.12|166|ch4_mdrk.tm>>
    <associate|auto-226|<tuple|7.5.3.4|166|ch4_mdrk.tm>>
    <associate|auto-227|<tuple|7.13|167|ch4_mdrk.tm>>
    <associate|auto-228|<tuple|7.6|167|ch4_mdrk.tm>>
    <associate|auto-229|<tuple|8|169|ch6_curved_meshes.tm>>
    <associate|auto-23|<tuple|3.1|40|ch1b_finite_volume_method.tm>>
    <associate|auto-230|<tuple|8.1|169|ch6_curved_meshes.tm>>
    <associate|auto-231|<tuple|8.2|169|ch6_curved_meshes.tm>>
    <associate|auto-232|<tuple|8.3|172|ch6_curved_meshes.tm>>
    <associate|auto-233|<tuple|8.3.1|172|ch6_curved_meshes.tm>>
    <associate|auto-234|<tuple|8.1|173|ch6_curved_meshes.tm>>
    <associate|auto-235|<tuple|8.3.2|174|ch6_curved_meshes.tm>>
    <associate|auto-236|<tuple|8.3.3|176|ch6_curved_meshes.tm>>
    <associate|auto-237|<tuple|8.3.4|177|ch6_curved_meshes.tm>>
    <associate|auto-238|<tuple|8.4|179|ch6_curved_meshes.tm>>
    <associate|auto-239|<tuple|8.4.1|180|ch6_curved_meshes.tm>>
    <associate|auto-24|<tuple|3.2|41|ch1b_finite_volume_method.tm>>
    <associate|auto-240|<tuple|8.2|180|ch6_curved_meshes.tm>>
    <associate|auto-241|<tuple|8.4.2|182|ch6_curved_meshes.tm>>
    <associate|auto-242|<tuple|8.4.3|183|ch6_curved_meshes.tm>>
    <associate|auto-243|<tuple|8.4.3.1|184|ch6_curved_meshes.tm>>
    <associate|auto-244|<tuple|8.4.3.2|185|ch6_curved_meshes.tm>>
    <associate|auto-245|<tuple|8.5|186|ch6_curved_meshes.tm>>
    <associate|auto-246|<tuple|8.5.1|187|ch6_curved_meshes.tm>>
    <associate|auto-247|<tuple|8.3|187|ch6_curved_meshes.tm>>
    <associate|auto-248|<tuple|8.5.1.1|188|ch6_curved_meshes.tm>>
    <associate|auto-249|<tuple|8.5.1.2|188|ch6_curved_meshes.tm>>
    <associate|auto-25|<tuple|3.3|43|ch1b_finite_volume_method.tm>>
    <associate|auto-250|<tuple|8.5.2|189|ch6_curved_meshes.tm>>
    <associate|auto-251|<tuple|8.5.2.1|189|ch6_curved_meshes.tm>>
    <associate|auto-252|<tuple|8.4|189|ch6_curved_meshes.tm>>
    <associate|auto-253|<tuple|8.5.2.2|191|ch6_curved_meshes.tm>>
    <associate|auto-254|<tuple|8.5.2.3|191|ch6_curved_meshes.tm>>
    <associate|auto-255|<tuple|8.5.3|193|ch6_curved_meshes.tm>>
    <associate|auto-256|<tuple|8.6|194|ch6_curved_meshes.tm>>
    <associate|auto-257|<tuple|8.6.1|195|ch6_curved_meshes.tm>>
    <associate|auto-258|<tuple|8.6.2|195|ch6_curved_meshes.tm>>
    <associate|auto-259|<tuple|8.7|197|ch6_curved_meshes.tm>>
    <associate|auto-26|<tuple|3.4|44|ch1b_finite_volume_method.tm>>
    <associate|auto-260|<tuple|8.7.1|198|ch6_curved_meshes.tm>>
    <associate|auto-261|<tuple|8.7.1.1|198|ch6_curved_meshes.tm>>
    <associate|auto-262|<tuple|8.5|199|ch6_curved_meshes.tm>>
    <associate|auto-263|<tuple|8.7.1.2|199|ch6_curved_meshes.tm>>
    <associate|auto-264|<tuple|8.6|200|ch6_curved_meshes.tm>>
    <associate|auto-265|<tuple|8.7.1.3|200|ch6_curved_meshes.tm>>
    <associate|auto-266|<tuple|8.7|201|ch6_curved_meshes.tm>>
    <associate|auto-267|<tuple|8.7.1.4|201|ch6_curved_meshes.tm>>
    <associate|auto-268|<tuple|8.8|202|ch6_curved_meshes.tm>>
    <associate|auto-269|<tuple|8.7.2|202|ch6_curved_meshes.tm>>
    <associate|auto-27|<tuple|4|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-270|<tuple|8.7.2.1|202|ch6_curved_meshes.tm>>
    <associate|auto-271|<tuple|8.9|203|ch6_curved_meshes.tm>>
    <associate|auto-272|<tuple|8.7.2.2|203|ch6_curved_meshes.tm>>
    <associate|auto-273|<tuple|8.10|204|ch6_curved_meshes.tm>>
    <associate|auto-274|<tuple|8.7.2.3|204|ch6_curved_meshes.tm>>
    <associate|auto-275|<tuple|8.11|205|ch6_curved_meshes.tm>>
    <associate|auto-276|<tuple|8.7.2.4|206|ch6_curved_meshes.tm>>
    <associate|auto-277|<tuple|8.12|206|ch6_curved_meshes.tm>>
    <associate|auto-278|<tuple|8.7.2.5|206|ch6_curved_meshes.tm>>
    <associate|auto-279|<tuple|8.13|207|ch6_curved_meshes.tm>>
    <associate|auto-28|<tuple|4.1|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-280|<tuple|8.14|207|ch6_curved_meshes.tm>>
    <associate|auto-281|<tuple|8.7.3|208|ch6_curved_meshes.tm>>
    <associate|auto-282|<tuple|8.1|208|ch6_curved_meshes.tm>>
    <associate|auto-283|<tuple|8.8|209|ch6_curved_meshes.tm>>
    <associate|auto-284|<tuple|9|211|ch_parabolic.tm>>
    <associate|auto-285|<tuple|9.1|211|ch_parabolic.tm>>
    <associate|auto-286|<tuple|9.2|211|ch_parabolic.tm>>
    <associate|auto-287|<tuple|9.3|212|ch_parabolic.tm>>
    <associate|auto-288|<tuple|9.3.1|212|ch_parabolic.tm>>
    <associate|auto-289|<tuple|9.3.2|213|ch_parabolic.tm>>
    <associate|auto-29|<tuple|4.2|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-290|<tuple|9.3.2.1|214|ch_parabolic.tm>>
    <associate|auto-291|<tuple|9.3.3|214|ch_parabolic.tm>>
    <associate|auto-292|<tuple|9.4|215|ch_parabolic.tm>>
    <associate|auto-293|<tuple|9.4.1|215|ch_parabolic.tm>>
    <associate|auto-294|<tuple|9.1|216|ch_parabolic.tm>>
    <associate|auto-295|<tuple|9.2|216|ch_parabolic.tm>>
    <associate|auto-296|<tuple|9.3|217|ch_parabolic.tm>>
    <associate|auto-297|<tuple|9.4|217|ch_parabolic.tm>>
    <associate|auto-298|<tuple|9.4.2|217|ch_parabolic.tm>>
    <associate|auto-299|<tuple|9.5|218|ch_parabolic.tm>>
    <associate|auto-3|<tuple|7|7>>
    <associate|auto-30|<tuple|4.2.1|49|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-300|<tuple|9.6|218|ch_parabolic.tm>>
    <associate|auto-301|<tuple|9.4.3|218|ch_parabolic.tm>>
    <associate|auto-302|<tuple|9.7|219|ch_parabolic.tm>>
    <associate|auto-303|<tuple|9.8|220|ch_parabolic.tm>>
    <associate|auto-304|<tuple|9.1|220|ch_parabolic.tm>>
    <associate|auto-305|<tuple|9.4.4|220|ch_parabolic.tm>>
    <associate|auto-306|<tuple|9.9|221|ch_parabolic.tm>>
    <associate|auto-307|<tuple|9.10|221|ch_parabolic.tm>>
    <associate|auto-308|<tuple|9.2|221|ch_parabolic.tm>>
    <associate|auto-309|<tuple|9.5|222|ch_parabolic.tm>>
    <associate|auto-31|<tuple|4.2.2|49|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-310|<tuple|10|223|conclusion.tm>>
    <associate|auto-311|<tuple|10.1|224|conclusion.tm>>
    <associate|auto-312|<tuple|A|227|appendix.tm>>
    <associate|auto-313|<tuple|A.1|227|appendix.tm>>
    <associate|auto-314|<tuple|A.2|227|appendix.tm>>
    <associate|auto-315|<tuple|A.3|230|appendix.tm>>
    <associate|auto-316|<tuple|A.4|231|appendix.tm>>
    <associate|auto-317|<tuple|A.1|232|appendix.tm>>
    <associate|auto-318|<tuple|A.5|232|appendix.tm>>
    <associate|auto-319|<tuple|B|233|appendix.tm>>
    <associate|auto-32|<tuple|4.2.3|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-320|<tuple|B.1|233|appendix.tm>>
    <associate|auto-321|<tuple|B.2|233|appendix.tm>>
    <associate|auto-322|<tuple|B.3|233|appendix.tm>>
    <associate|auto-323|<tuple|B.4|234|appendix.tm>>
    <associate|auto-324|<tuple|C|237|appendix.tm>>
    <associate|auto-325|<tuple|C.1|237|appendix.tm>>
    <associate|auto-326|<tuple|C.2|238|appendix.tm>>
    <associate|auto-327|<tuple|C.2.1|240|appendix.tm>>
    <associate|auto-328|<tuple|D|243|appendix.tm>>
    <associate|auto-329|<tuple|D.1|245|appendix.tm>>
    <associate|auto-33|<tuple|4.2.4|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-330|<tuple|E|247|appendix.tm>>
    <associate|auto-331|<tuple|F|249|appendix.tm>>
    <associate|auto-332|<tuple|G|251|appendix.tm>>
    <associate|auto-333|<tuple|G.1|251|appendix.tm>>
    <associate|auto-334|<tuple|G.2|251|appendix.tm>>
    <associate|auto-335|<tuple|G.1|252|appendix.tm>>
    <associate|auto-336|<tuple|G.3|252|appendix.tm>>
    <associate|auto-337|<tuple|G.4|253|appendix.tm>>
    <associate|auto-338|<tuple|G.2|255|appendix.tm>>
    <associate|auto-339|<tuple|G.3|255|appendix.tm>>
    <associate|auto-34|<tuple|4.2.4.1|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-340|<tuple|G.4|258|appendix.tm>>
    <associate|auto-341|<tuple|G.5|259|appendix.tm>>
    <associate|auto-342|<tuple|G.6|260|appendix.tm>>
    <associate|auto-343|<tuple|G.6.1|261|appendix.tm>>
    <associate|auto-344|<tuple|G.6.2|262|appendix.tm>>
    <associate|auto-345|<tuple|G.6.3|265|appendix.tm>>
    <associate|auto-346|<tuple|H|269|appendix.tm>>
    <associate|auto-347|<tuple|H.18|271|bibliography.tm>>
    <associate|auto-35|<tuple|4.2.4.2|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-36|<tuple|4.2.4.3|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-37|<tuple|4.2.4.4|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-38|<tuple|4.3|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-39|<tuple|4.3.1|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-4|<tuple|7|11>>
    <associate|auto-40|<tuple|4.3.2|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-41|<tuple|4.4|57|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-42|<tuple|4.1|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-43|<tuple|4.5|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-44|<tuple|4.6|61|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-45|<tuple|4.7|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-46|<tuple|4.7.1|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-47|<tuple|4.7.1.1|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-48|<tuple|4.1|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-49|<tuple|4.2|64|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-5|<tuple|7|19|abstract.tm>>
    <associate|auto-50|<tuple|4.3|65|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-51|<tuple|4.4|66|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-52|<tuple|4.5|67|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-53|<tuple|4.6|67|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-54|<tuple|4.7|68|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-55|<tuple|4.8|68|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-56|<tuple|4.7.1.2|68|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-57|<tuple|4.9|69|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-58|<tuple|4.10|69|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-59|<tuple|4.11|70|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-6|<tuple|1|21|ch0_introduction.tm>>
    <associate|auto-60|<tuple|4.12|70|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-61|<tuple|4.13|71|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-62|<tuple|4.7.2|71|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-63|<tuple|4.14|72|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-64|<tuple|4.15|73|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-65|<tuple|4.16|74|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-66|<tuple|4.7.3|74|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-67|<tuple|4.17|74|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-68|<tuple|4.18|75|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-69|<tuple|4.19|76|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-7|<tuple|1.1|21|ch0_introduction.tm>>
    <associate|auto-70|<tuple|4.7.4|76|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-71|<tuple|4.20|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-72|<tuple|4.8|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-73|<tuple|4.8.1|78|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-74|<tuple|4.21|79|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-75|<tuple|4.8.2|79|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-76|<tuple|4.22|80|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-77|<tuple|4.8.3|80|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-78|<tuple|4.23|81|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-79|<tuple|4.8.4|81|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-8|<tuple|1.2|23|ch0_introduction.tm>>
    <associate|auto-80|<tuple|4.24|82|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-81|<tuple|4.8.5|82|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-82|<tuple|4.25|83|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-83|<tuple|4.8.6|83|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-84|<tuple|4.26|84|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-85|<tuple|4.27|85|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-86|<tuple|4.8.7|85|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-87|<tuple|4.28|86|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-88|<tuple|4.29|86|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-89|<tuple|4.9|87|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-9|<tuple|1.3|24|ch0_introduction.tm>>
    <associate|auto-90|<tuple|4.9.1|89|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-91|<tuple|4.30|91|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-92|<tuple|4.31|91|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-93|<tuple|4.2|92|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-94|<tuple|4.10|92|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-95|<tuple|4.10.1|92|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-96|<tuple|4.32|93|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-97|<tuple|4.10.2|93|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-98|<tuple|4.33|94|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-99|<tuple|4.34|94|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|bib-Abe2015|<tuple|1|271|bibliography.tm>>
    <associate|bib-Abgrall2020|<tuple|2|271|bibliography.tm>>
    <associate|bib-Artzi2006|<tuple|24|272|bibliography.tm>>
    <associate|bib-Asthana2015|<tuple|5|271|bibliography.tm>>
    <associate|bib-Balsara2007|<tuple|20|272|bibliography.tm>>
    <associate|bib-Balsara2009a|<tuple|21|272|bibliography.tm>>
    <associate|bib-Bassi1997|<tuple|22|272|bibliography.tm>>
    <associate|bib-Batten1997|<tuple|23|272|bibliography.tm>>
    <associate|bib-Berthon2006|<tuple|26|272|bibliography.tm>>
    <associate|bib-Berthon2015|<tuple|27|272|bibliography.tm>>
    <associate|bib-Berthon_TMP_2006|<tuple|25|272|bibliography.tm>>
    <associate|bib-Bezanson2017|<tuple|29|272|bibliography.tm>>
    <associate|bib-Biswas1994|<tuple|31|272|bibliography.tm>>
    <associate|bib-Biswas2021|<tuple|30|272|bibliography.tm>>
    <associate|bib-Bogacki1989|<tuple|32|272|bibliography.tm>>
    <associate|bib-Burbeau2001|<tuple|33|272|bibliography.tm>>
    <associate|bib-Burger2017|<tuple|34|272|bibliography.tm>>
    <associate|bib-Butcher2016|<tuple|35|272|bibliography.tm>>
    <associate|bib-Canuto2007|<tuple|37|272|bibliography.tm>>
    <associate|bib-Carpenter1995|<tuple|38|272|bibliography.tm>>
    <associate|bib-Carrillo2021|<tuple|39|272|bibliography.tm>>
    <associate|bib-Carrillo2021a|<tuple|40|272|bibliography.tm>>
    <associate|bib-Castro2008|<tuple|42|273|bibliography.tm>>
    <associate|bib-Cenaero2017|<tuple|36|272|bibliography.tm>>
    <associate|bib-Chen2016|<tuple|43|273|bibliography.tm>>
    <associate|bib-Choe1991|<tuple|44|273|bibliography.tm>>
    <associate|bib-Choe1992|<tuple|45|273|bibliography.tm>>
    <associate|bib-Cicchino2022|<tuple|46|273|bibliography.tm>>
    <associate|bib-Cicchino2022a|<tuple|47|273|bibliography.tm>>
    <associate|bib-Clain2011|<tuple|48|273|bibliography.tm>>
    <associate|bib-Cockburn1989|<tuple|50|273|bibliography.tm>>
    <associate|bib-Cockburn1989a|<tuple|51|273|bibliography.tm>>
    <associate|bib-Cockburn1991|<tuple|52|273|bibliography.tm>>
    <associate|bib-Cockburn1998a|<tuple|53|273|bibliography.tm>>
    <associate|bib-Colella1984|<tuple|55|273|bibliography.tm>>
    <associate|bib-Colella1990|<tuple|54|273|bibliography.tm>>
    <associate|bib-Cui2023|<tuple|56|273|bibliography.tm>>
    <associate|bib-Diot2012|<tuple|59|273|bibliography.tm>>
    <associate|bib-Diot2013|<tuple|60|273|bibliography.tm>>
    <associate|bib-Dumbser2006|<tuple|67|274|bibliography.tm>>
    <associate|bib-Dumbser2007|<tuple|66|274|bibliography.tm>>
    <associate|bib-Dumbser2008|<tuple|63|274|bibliography.tm>>
    <associate|bib-Dumbser2008a|<tuple|64|274|bibliography.tm>>
    <associate|bib-Dumbser2009|<tuple|68|274|bibliography.tm>>
    <associate|bib-Dumbser2014|<tuple|62|274|bibliography.tm>>
    <associate|bib-Dumbser2018|<tuple|65|274|bibliography.tm>>
    <associate|bib-Dumbser2019|<tuple|61|274|bibliography.tm>>
    <associate|bib-Einfeldt1988|<tuple|71|274|bibliography.tm>>
    <associate|bib-Ellis2016|<tuple|72|274|bibliography.tm>>
    <associate|bib-Engquist1981|<tuple|74|274|bibliography.tm>>
    <associate|bib-Fambri2017|<tuple|75|274|bibliography.tm>>
    <associate|bib-Gassner2011a|<tuple|76|274|bibliography.tm>>
    <associate|bib-Gassner2012|<tuple|77|274|bibliography.tm>>
    <associate|bib-Gassner_Winters_Hindenlang_Kopriva_2018|<tuple|78|274|bibliography.tm>>
    <associate|bib-Ghia1982|<tuple|79|274|bibliography.tm>>
    <associate|bib-Glimm1985|<tuple|80|274|bibliography.tm>>
    <associate|bib-Gottlieb2001|<tuple|82|275|bibliography.tm>>
    <associate|bib-Grazia2014|<tuple|57|273|bibliography.tm>>
    <associate|bib-Guermond2016|<tuple|83|275|bibliography.tm>>
    <associate|bib-Guo2015|<tuple|84|275|bibliography.tm>>
    <associate|bib-Guthrey2019|<tuple|85|275|bibliography.tm>>
    <associate|bib-Han2010|<tuple|87|275|bibliography.tm>>
    <associate|bib-Harten1983a|<tuple|89|275|bibliography.tm>>
    <associate|bib-Harten1987|<tuple|88|275|bibliography.tm>>
    <associate|bib-Hirsch1990|<tuple|92|275|bibliography.tm>>
    <associate|bib-Huynh2007|<tuple|94|275|bibliography.tm>>
    <associate|bib-Jackson2017|<tuple|95|275|bibliography.tm>>
    <associate|bib-Jameson2012|<tuple|97|275|bibliography.tm>>
    <associate|bib-Jiang1996|<tuple|98|275|bibliography.tm>>
    <associate|bib-Jiang2013|<tuple|99|275|bibliography.tm>>
    <associate|bib-Kaser2005|<tuple|100|275|bibliography.tm>>
    <associate|bib-Kopriva1996|<tuple|106|276|bibliography.tm>>
    <associate|bib-Kopriva2002|<tuple|107|276|bibliography.tm>>
    <associate|bib-Kopriva2006|<tuple|105|276|bibliography.tm>>
    <associate|bib-Kopriva2019|<tuple|104|276|bibliography.tm>>
    <associate|bib-Kozdon2018|<tuple|109|276|bibliography.tm>>
    <associate|bib-Krivodonova2007|<tuple|110|276|bibliography.tm>>
    <associate|bib-Lax1954|<tuple|111|276|bibliography.tm>>
    <associate|bib-Lax1960|<tuple|113|276|bibliography.tm>>
    <associate|bib-Lax1998|<tuple|112|276|bibliography.tm>>
    <associate|bib-LeFloch2002|<tuple|115|276|bibliography.tm>>
    <associate|bib-LeVeque1992|<tuple|116|276|bibliography.tm>>
    <associate|bib-LeVeque1996|<tuple|117|276|bibliography.tm>>
    <associate|bib-Lee2021|<tuple|114|276|bibliography.tm>>
    <associate|bib-Levermore_1996|<tuple|118|276|bibliography.tm>>
    <associate|bib-Lopez2014|<tuple|121|276|bibliography.tm>>
    <associate|bib-Lou2020|<tuple|122|276|bibliography.tm>>
    <associate|bib-Lu2021|<tuple|123|276|bibliography.tm>>
    <associate|bib-Meena2020|<tuple|126|276|bibliography.tm>>
    <associate|bib-Meena_Kumar_Chandrashekar_2017|<tuple|125|276|bibliography.tm>>
    <associate|bib-Mengaldo2015|<tuple|127|277|bibliography.tm>>
    <associate|bib-Montecinos2020|<tuple|129|277|bibliography.tm>>
    <associate|bib-Offner2019|<tuple|131|277|bibliography.tm>>
    <associate|bib-Pan2016|<tuple|132|277|bibliography.tm>>
    <associate|bib-Pazner2021|<tuple|133|277|bibliography.tm>>
    <associate|bib-Peraire2012|<tuple|93|275|bibliography.tm>>
    <associate|bib-Peraire2013|<tuple|41|272|bibliography.tm>>
    <associate|bib-Persson2006|<tuple|134|277|bibliography.tm>>
    <associate|bib-Qiu2003|<tuple|138|277|bibliography.tm>>
    <associate|bib-Qiu2005|<tuple|135|277|bibliography.tm>>
    <associate|bib-Qiu2005b|<tuple|137|277|bibliography.tm>>
    <associate|bib-Qiu2007|<tuple|136|277|bibliography.tm>>
    <associate|bib-Rackauckas2017|<tuple|139|277|bibliography.tm>>
    <associate|bib-Ramirez2020|<tuple|148|278|bibliography.tm>>
    <associate|bib-Ranocha2021|<tuple|140|277|bibliography.tm>>
    <associate|bib-Ranocha2022|<tuple|141|277|bibliography.tm>>
    <associate|bib-Rasha2021|<tuple|96|275|bibliography.tm>>
    <associate|bib-Ray2017|<tuple|144|277|bibliography.tm>>
    <associate|bib-Roe1981|<tuple|146|277|bibliography.tm>>
    <associate|bib-Romero2016|<tuple|147|278|bibliography.tm>>
    <associate|bib-Rosa2018|<tuple|58|273|bibliography.tm>>
    <associate|bib-Rueda2021|<tuple|149|278|bibliography.tm>>
    <associate|bib-Rusanov1962|<tuple|152|278|bibliography.tm>>
    <associate|bib-Ruuth2002|<tuple|153|278|bibliography.tm>>
    <associate|bib-Safjan1995|<tuple|154|278|bibliography.tm>>
    <associate|bib-Schafer1996|<tuple|156|278|bibliography.tm>>
    <associate|bib-Seal2013|<tuple|159|278|bibliography.tm>>
    <associate|bib-Shi2003|<tuple|161|278|bibliography.tm>>
    <associate|bib-Shu1988|<tuple|162|278|bibliography.tm>>
    <associate|bib-Shu1989|<tuple|163|278|bibliography.tm>>
    <associate|bib-Sod1978|<tuple|164|278|bibliography.tm>>
    <associate|bib-Sonntag2014|<tuple|165|278|bibliography.tm>>
    <associate|bib-Spiegel2016|<tuple|166|278|bibliography.tm>>
    <associate|bib-Spiteri2002|<tuple|167|278|bibliography.tm>>
    <associate|bib-Sun2017|<tuple|170|279|bibliography.tm>>
    <associate|bib-Swanson_Langer_2016|<tuple|171|279|bibliography.tm>>
    <associate|bib-Tabarrok1994|<tuple|172|279|bibliography.tm>>
    <associate|bib-Takayama1991|<tuple|173|279|bibliography.tm>>
    <associate|bib-Tang2006|<tuple|174|279|bibliography.tm>>
    <associate|bib-Titarev2002|<tuple|175|279|bibliography.tm>>
    <associate|bib-Titarev2004|<tuple|176|279|bibliography.tm>>
    <associate|bib-Titarev2005|<tuple|177|279|bibliography.tm>>
    <associate|bib-Toro1994|<tuple|180|279|bibliography.tm>>
    <associate|bib-Toro2001|<tuple|178|279|bibliography.tm>>
    <associate|bib-Toro2009|<tuple|181|279|bibliography.tm>>
    <associate|bib-Toro2020|<tuple|179|279|bibliography.tm>>
    <associate|bib-Trojak2021|<tuple|182|279|bibliography.tm>>
    <associate|bib-Tsitouras2011|<tuple|183|279|bibliography.tm>>
    <associate|bib-Vandenhoeck2019|<tuple|186|279|bibliography.tm>>
    <associate|bib-Vermeire2017|<tuple|187|279|bibliography.tm>>
    <associate|bib-Vilar2019|<tuple|188|279|bibliography.tm>>
    <associate|bib-Vincent2011|<tuple|190|279|bibliography.tm>>
    <associate|bib-Vincent2011a|<tuple|189|279|bibliography.tm>>
    <associate|bib-Vincent2015|<tuple|191|279|bibliography.tm>>
    <associate|bib-Vincent2016|<tuple|193|280|bibliography.tm>>
    <associate|bib-Vincent2022|<tuple|192|280|bibliography.tm>>
    <associate|bib-Volker2010|<tuple|168|279|bibliography.tm>>
    <associate|bib-Witherden2021|<tuple|196|280|bibliography.tm>>
    <associate|bib-Woodward1984|<tuple|197|280|bibliography.tm>>
    <associate|bib-Xu2019|<tuple|198|280|bibliography.tm>>
    <associate|bib-Xu2022|<tuple|199|280|bibliography.tm>>
    <associate|bib-Yee1999|<tuple|200|280|bibliography.tm>>
    <associate|bib-Youn1995|<tuple|201|280|bibliography.tm>>
    <associate|bib-Zanotti2015|<tuple|202|280|bibliography.tm>>
    <associate|bib-Zhang1990|<tuple|203|280|bibliography.tm>>
    <associate|bib-Zhang1997|<tuple|204|280|bibliography.tm>>
    <associate|bib-Zhang2010b|<tuple|205|280|bibliography.tm>>
    <associate|bib-Zorio2017|<tuple|208|280|bibliography.tm>>
    <associate|bib-akkurt2022|<tuple|3|271|bibliography.tm>>
    <associate|bib-arpit_babbar_2024_10816439|<tuple|7|271|bibliography.tm>>
    <associate|bib-attig2011|<tuple|6|271|bibliography.tm>>
    <associate|bib-babbar2022|<tuple|18|271|bibliography.tm>>
    <associate|bib-babbar2023admissibility|<tuple|19|271|bibliography.tm>>
    <associate|bib-babbar2024curved|<tuple|13|271|bibliography.tm>>
    <associate|bib-babbar2024equivalence|<tuple|9|271|bibliography.tm>>
    <associate|bib-babbar2024generalized|<tuple|11|271|bibliography.tm>>
    <associate|bib-babbar2024laxwendroff|<tuple|12|271|bibliography.tm>>
    <associate|bib-babbar2024multiderivative|<tuple|14|271|bibliography.tm>>
    <associate|bib-berzins1995|<tuple|28|272|bibliography.tm>>
    <associate|bib-cockburn2000|<tuple|49|273|bibliography.tm>>
    <associate|bib-curvedrepo|<tuple|10|271|bibliography.tm>>
    <associate|bib-dzanic2022|<tuple|69|274|bibliography.tm>>
    <associate|bib-emery1968|<tuple|73|274|bibliography.tm>>
    <associate|bib-godunov1959|<tuple|81|275|bibliography.tm>>
    <associate|bib-ha2005|<tuple|86|275|bibliography.tm>>
    <associate|bib-hennemann2021|<tuple|90|275|bibliography.tm>>
    <associate|bib-hildebrand1973|<tuple|91|275|bibliography.tm>>
    <associate|bib-icosahom2023_tmp|<tuple|8|271|bibliography.tm>>
    <associate|bib-ketcheson2020|<tuple|101|275|bibliography.tm>>
    <associate|bib-klockner2011|<tuple|102|275|bibliography.tm>>
    <associate|bib-kopriva2009|<tuple|103|275|bibliography.tm>>
    <associate|bib-kopriva2010|<tuple|108|276|bibliography.tm>>
    <associate|bib-li2016|<tuple|119|276|bibliography.tm>>
    <associate|bib-lohner1987|<tuple|120|276|bibliography.tm>>
    <associate|bib-meena2017|<tuple|124|276|bibliography.tm>>
    <associate|bib-moe2017|<tuple|128|277|bibliography.tm>>
    <associate|bib-naca1951|<tuple|4|271|bibliography.tm>>
    <associate|bib-nsrepo|<tuple|15|271|bibliography.tm>>
    <associate|bib-obrechkoff1940neue|<tuple|130|277|bibliography.tm>>
    <associate|bib-paperrepo|<tuple|16|271|bibliography.tm>>
    <associate|bib-ramirez2021|<tuple|151|278|bibliography.tm>>
    <associate|bib-ramirez2022|<tuple|150|278|bibliography.tm>>
    <associate|bib-ranocha2023|<tuple|142|277|bibliography.tm>>
    <associate|bib-raythesis|<tuple|143|277|bibliography.tm>>
    <associate|bib-reed1973|<tuple|145|277|bibliography.tm>>
    <associate|bib-schaal2015|<tuple|155|278|bibliography.tm>>
    <associate|bib-schlottkelakemper2020trixi|<tuple|157|278|bibliography.tm>>
    <associate|bib-schlottkelakemper2021purely|<tuple|158|278|bibliography.tm>>
    <associate|bib-sedov1959|<tuple|160|278|bibliography.tm>>
    <associate|bib-su2|<tuple|70|274|bibliography.tm>>
    <associate|bib-subcommittee2014|<tuple|169|279|bibliography.tm>>
    <associate|bib-tenkai|<tuple|17|271|bibliography.tm>>
    <associate|bib-vanleer1977|<tuple|184|279|bibliography.tm>>
    <associate|bib-vanleer1984|<tuple|185|279|bibliography.tm>>
    <associate|bib-ware1995|<tuple|194|280|bibliography.tm>>
    <associate|bib-witherden2014|<tuple|195|280|bibliography.tm>>
    <associate|bib-zhang2010c|<tuple|206|280|bibliography.tm>>
    <associate|bib-zhang2012|<tuple|207|280|bibliography.tm>>
    <associate|ch:10mom|<tuple|6|135|ch5_10_moment_problem.tm>>
    <associate|ch:con.law|<tuple|2|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|ch:curved.meshes|<tuple|8|169|ch6_curved_meshes.tm>>
    <associate|ch:fvm.dg|<tuple|3|39|ch1b_finite_volume_method.tm>>
    <associate|ch:lw.subcell.limiter|<tuple|5|103|ch3_blending_limiter.tm>>
    <associate|ch:lwfr|<tuple|4|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|ch:mdrk|<tuple|7|147|ch4_mdrk.tm>>
    <associate|ch:parabolic|<tuple|9|211|ch_parabolic.tm>>
    <associate|defn.mean|<tuple|8.30|175|ch6_curved_meshes.tm>>
    <associate|defn:adm.pres|<tuple|5.1|104|ch3_blending_limiter.tm>>
    <associate|defn:admissible.fvm|<tuple|3.1|42|ch1b_finite_volume_method.tm>>
    <associate|defn:curved.contravariant.basis|<tuple|8.2|171|ch6_curved_meshes.tm>>
    <associate|defn:curved.covariant.basis|<tuple|8.1|171|ch6_curved_meshes.tm>>
    <associate|defn:curved.well.constructed.mesh|<tuple|8.4|178|ch6_curved_meshes.tm>>
    <associate|defn:hyperbolic|<tuple|2.1|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|defn:mean.pres|<tuple|5.2|105|ch3_blending_limiter.tm>>
    <associate|eq:1d.rh|<tuple|2.9|33|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:1d.smoothness.E|<tuple|5.12|108|ch3_blending_limiter.tm>>
    <associate|eq:1deuler|<tuple|4.15|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2DMH1|<tuple|G.22|260|appendix.tm>>
    <associate|eq:2DMH2|<tuple|G.23|260|appendix.tm>>
    <associate|eq:2DMH3|<tuple|G.24|260|appendix.tm>>
    <associate|eq:2Dupdates|<tuple|G.27|261|appendix.tm>>
    <associate|eq:2d.adm.numflux.desired.x|<tuple|G.38|266|appendix.tm>>
    <associate|eq:2d.adm.numflux.desired.y|<tuple|G.38|266|appendix.tm>>
    <associate|eq:2d.hyp.con.law|<tuple|G.1|251|appendix.tm>>
    <associate|eq:2d.low.update.admissibility.condn|<tuple|G.38|266|appendix.tm>>
    <associate|eq:2d.mh.final.subs|<tuple|G.32|262|appendix.tm>>
    <associate|eq:2d.new.cfl2|<tuple|G.33|263|appendix.tm>>
    <associate|eq:2d.new.cfl3.conservative|<tuple|G.36|265|appendix.tm>>
    <associate|eq:2d.xy.implies.admissibility|<tuple|G.39|266|appendix.tm>>
    <associate|eq:2dadv|<tuple|4.25|89|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dburger|<tuple|4.28|95|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dcfldom|<tuple|4.26|91|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2deuler|<tuple|2.16|36|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:2dns|<tuple|2.18|37|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:2dstate|<tuple|2.15|35|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:2dvaradv|<tuple|4.27|92|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:3deuler|<tuple|2.14|35|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:3dns|<tuple|2.17|36|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:Fblend|<tuple|5.11|107|ch3_blending_limiter.tm>>
    <associate|eq:Uh.defn|<tuple|A.11|230|appendix.tm>>
    <associate|eq:VlVr|<tuple|3.6|40|ch1b_finite_volume_method.tm>>
    <associate|eq:ader.corr.flux|<tuple|A.8|230|appendix.tm>>
    <associate|eq:ader.corr1|<tuple|A.4|228|appendix.tm>>
    <associate|eq:ader.evolution|<tuple|A.6|229|appendix.tm>>
    <associate|eq:ader.fr.flux|<tuple|A.7|229|appendix.tm>>
    <associate|eq:adm2.coeff1|<tuple|G.34|264|appendix.tm>>
    <associate|eq:adm2.coeff2|<tuple|G.35|264|appendix.tm>>
    <associate|eq:all.fvm.updates|<tuple|G.12|256|appendix.tm>>
    <associate|eq:blended.scheme|<tuple|5.6|106|ch3_blending_limiter.tm>>
    <associate|eq:cache.blocking|<tuple|D.1|245|appendix.tm>>
    <associate|eq:cauchy.problem|<tuple|2.6|32|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:con.law|<tuple|3.1|39|ch1b_finite_volume_method.tm>>
    <associate|eq:con.law.dt|<tuple|G.8|253|appendix.tm>>
    <associate|eq:concave.theta|<tuple|5.24|112|ch3_blending_limiter.tm>>
    <associate|eq:concave.theta.source|<tuple|6.15|139|ch5_10_moment_problem.tm>>
    <associate|eq:conservation.blending.scheme|<tuple|5.10|107|ch3_blending_limiter.tm>>
    <associate|eq:conv.pres.con.law|<tuple|5.4|104|ch3_blending_limiter.tm>>
    <associate|eq:corr.expressions|<tuple|C.8|240|appendix.tm>>
    <associate|eq:curved.2d.adm.numflux.desired|<tuple|8.53|185|ch6_curved_meshes.tm>>
    <associate|eq:curved.2d.low.update.admissibility.condn|<tuple|8.52|185|ch6_curved_meshes.tm>>
    <associate|eq:curved.2d.xy.implies.admissibility|<tuple|8.54|185|ch6_curved_meshes.tm>>
    <associate|eq:curved.4to1proj|<tuple|8.62|188|ch6_curved_meshes.tm>>
    <associate|eq:curved.Fdelta.low|<tuple|8.76|195|ch6_curved_meshes.tm>>
    <associate|eq:curved.Fisf|<tuple|8.41|179|ch6_curved_meshes.tm>>
    <associate|eq:curved.I0.defn|<tuple|8.55|186|ch6_curved_meshes.tm>>
    <associate|eq:curved.Nnd|<tuple|8.5|170|ch6_curved_meshes.tm>>
    <associate|eq:curved.Uisu|<tuple|8.42|179|ch6_curved_meshes.tm>>
    <associate|eq:curved.approx.soln|<tuple|8.15|172|ch6_curved_meshes.tm>>
    <associate|eq:curved.blended.flux.in.curved|<tuple|8.48|181|ch6_curved_meshes.tm>>
    <associate|eq:curved.cfl.effective|<tuple|8.79|199|ch6_curved_meshes.tm>>
    <associate|eq:curved.cfl.formula|<tuple|8.72|194|ch6_curved_meshes.tm>>
    <associate|eq:curved.cfl.time.step|<tuple|8.78|198|ch6_curved_meshes.tm>>
    <associate|eq:curved.compact.prolongation|<tuple|8.67|191|ch6_curved_meshes.tm>>
    <associate|eq:curved.con.law|<tuple|8.1|169|ch6_curved_meshes.tm>>
    <associate|eq:curved.conservation.lw|<tuple|8.29|175|ch6_curved_meshes.tm>>
    <associate|eq:curved.contravariant.flux.defn|<tuple|8.13|171|ch6_curved_meshes.tm>>
    <associate|eq:curved.contravariant.identity|<tuple|8.9|171|ch6_curved_meshes.tm>>
    <associate|eq:curved.cts.num.flux|<tuple|8.18|173|ch6_curved_meshes.tm>>
    <associate|eq:curved.cts.time.avg.flux|<tuple|8.25|175|ch6_curved_meshes.tm>>
    <associate|eq:curved.defn1.div|<tuple|8.2|170|ch6_curved_meshes.tm>>
    <associate|eq:curved.divergence.transform.contravariant|<tuple|8.10|171|ch6_curved_meshes.tm>>
    <associate|eq:curved.dtnp1.formula|<tuple|8.73|195|ch6_curved_meshes.tm>>
    <associate|eq:curved.error.estimator|<tuple|8.74|195|ch6_curved_meshes.tm>>
    <associate|eq:curved.final.int.identity.fxi|<tuple|8.66|191|ch6_curved_meshes.tm>>
    <associate|eq:curved.flux.poly.defn|<tuple|8.17|173|ch6_curved_meshes.tm>>
    <associate|eq:curved.fo.rusanov|<tuple|8.47|181|ch6_curved_meshes.tm>>
    <associate|eq:curved.fr.update.curvilinear|<tuple|8.22|174|ch6_curved_meshes.tm>>
    <associate|eq:curved.ft.defn|<tuple|8.32|176|ch6_curved_meshes.tm>>
    <associate|eq:curved.gradient.transform.contravariant|<tuple|8.11|171|ch6_curved_meshes.tm>>
    <associate|eq:curved.integral.identities|<tuple|8.64|189|ch6_curved_meshes.tm>>
    <associate|eq:curved.interpolation.defn|<tuple|8.36|177|ch6_curved_meshes.tm>>
    <associate|eq:curved.interpolation.ue|<tuple|8.5.1.1|188|ch6_curved_meshes.tm>>
    <associate|eq:curved.lagrange.basis|<tuple|8.6|170|ch6_curved_meshes.tm>>
    <associate|eq:curved.lo.numflux|<tuple|8.46|181|ch6_curved_meshes.tm>>
    <associate|eq:curved.lohner.ind|<tuple|8.71|193|ch6_curved_meshes.tm>>
    <associate|eq:curved.low.order.cell.avg.update.curved|<tuple|8.49|181|ch6_curved_meshes.tm>>
    <associate|eq:curved.low.update.2d|<tuple|8.51|185|ch6_curved_meshes.tm>>
    <associate|eq:curved.lower.order.curved|<tuple|8.45|180|ch6_curved_meshes.tm>>
    <associate|eq:curved.lower.order.flux.curved|<tuple|8.44|180|ch6_curved_meshes.tm>>
    <associate|eq:curved.lw.update|<tuple|8.23|174|ch6_curved_meshes.tm>>
    <associate|eq:curved.lwfr.update.curvilinear|<tuple|8.28|175|ch6_curved_meshes.tm>>
    <associate|eq:curved.metric.identity.contravariant|<tuple|8.14|172|ch6_curved_meshes.tm>>
    <associate|eq:curved.metric.identity.contravariant.inter|<tuple|8.35|177|ch6_curved_meshes.tm>>
    <associate|eq:curved.metric.identity.contravariant.poly|<tuple|8.37|177|ch6_curved_meshes.tm>>
    <associate|eq:curved.partition|<tuple|8.3|170|ch6_curved_meshes.tm>>
    <associate|eq:curved.pro4.with.lagrange|<tuple|8.63|188|ch6_curved_meshes.tm>>
    <associate|eq:curved.proP.defn|<tuple|8.59|187|ch6_curved_meshes.tm>>
    <associate|eq:curved.product.of.operators|<tuple|8.60|187|ch6_curved_meshes.tm>>
    <associate|eq:curved.proj.mortar.int.id|<tuple|8.68|192|ch6_curved_meshes.tm>>
    <associate|eq:curved.projection.integral.equation|<tuple|8.69|192|ch6_curved_meshes.tm>>
    <associate|eq:curved.reference.map|<tuple|8.4|170|ch6_curved_meshes.tm>>
    <associate|eq:curved.rusanov.flux|<tuple|8.19|173|ch6_curved_meshes.tm>>
    <associate|eq:curved.rusanov.flux.lw|<tuple|8.26|175|ch6_curved_meshes.tm>>
    <associate|eq:curved.semi.discrete.fr|<tuple|8.21|174|ch6_curved_meshes.tm>>
    <associate|eq:curved.subint.op|<tuple|8.58|186|ch6_curved_meshes.tm>>
    <associate|eq:curved.submap|<tuple|8.56|186|ch6_curved_meshes.tm>>
    <associate|eq:curved.submap.inverse|<tuple|8.57|186|ch6_curved_meshes.tm>>
    <associate|eq:curved.time.averaged.flux|<tuple|8.24|174|ch6_curved_meshes.tm>>
    <associate|eq:curved.time.avg.is.physical.flux|<tuple|8.39|178|ch6_curved_meshes.tm>>
    <associate|eq:curved.transformed.conservation.law|<tuple|8.12|171|ch6_curved_meshes.tm>>
    <associate|eq:curved.uXidefn|<tuple|8.65|191|ch6_curved_meshes.tm>>
    <associate|eq:curved.ueues.defn|<tuple|8.61|188|ch6_curved_meshes.tm>>
    <associate|eq:curved.uloc.high|<tuple|8.75|195|ch6_curved_meshes.tm>>
    <associate|eq:curved.unp1.low|<tuple|8.77|196|ch6_curved_meshes.tm>>
    <associate|eq:curved.ut.defn|<tuple|8.33|176|ch6_curved_meshes.tm>>
    <associate|eq:curved.utt.defn|<tuple|8.34|177|ch6_curved_meshes.tm>>
    <associate|eq:curved.well.constructed|<tuple|8.38|178|ch6_curved_meshes.tm>>
    <associate|eq:curved.xis.notation|<tuple|8.16|172|ch6_curved_meshes.tm>>
    <associate|eq:delta.defn|<tuple|5.17|110|ch3_blending_limiter.tm>>
    <associate|eq:dg.collocated|<tuple|C.5|239|appendix.tm>>
    <associate|eq:dg.discontinuous.flux|<tuple|3.15|43|ch1b_finite_volume_method.tm>>
    <associate|eq:dg.is.fr.corr|<tuple|C.6|239|appendix.tm>>
    <associate|eq:dg.rusanov|<tuple|C.2|237|appendix.tm>>
    <associate|eq:dg.scheme|<tuple|C.1|237|appendix.tm>>
    <associate|eq:dg.weak|<tuple|C.4|238|appendix.tm>>
    <associate|eq:diff.matrix|<tuple|3.5|40|ch1b_finite_volume_method.tm>>
    <associate|eq:dt.lw|<tuple|4.17|78|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:entropy.condition|<tuple|2.11|33|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:erik.ic|<tuple|9.20|215|ch_parabolic.tm>>
    <associate|eq:evolution|<tuple|5.19|111|ch3_blending_limiter.tm>>
    <associate|eq:evolution.general|<tuple|G.5|252|appendix.tm>>
    <associate|eq:explicit.fvm.scheme|<tuple|3.12|42|ch1b_finite_volume_method.tm>>
    <associate|eq:fder|<tuple|4.8|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:final.claim|<tuple|A.15|231|appendix.tm>>
    <associate|eq:first.time.average.flux|<tuple|A.10|230|appendix.tm>>
    <associate|eq:flux.concave.theta|<tuple|5.29|115|ch3_blending_limiter.tm>>
    <associate|eq:flux.optimization.problem|<tuple|5.28|115|ch3_blending_limiter.tm>>
    <associate|eq:fo.at.face|<tuple|5.14|110|ch3_blending_limiter.tm>>
    <associate|eq:forward.euler|<tuple|3.9|41|ch1b_finite_volume_method.tm>>
    <associate|eq:fravgup|<tuple|5.3|104|ch3_blending_limiter.tm>>
    <associate|eq:frcontflux|<tuple|4.7|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:ftilde.free.stream|<tuple|8.40|178|ch6_curved_meshes.tm>>
    <associate|eq:fvm.admissibility|<tuple|3.13|42|ch1b_finite_volume_method.tm>>
    <associate|eq:fvm.fr.corr.functions|<tuple|3.17|44|ch1b_finite_volume_method.tm>>
    <associate|eq:fvm.mol|<tuple|3.7|41|ch1b_finite_volume_method.tm>>
    <associate|eq:fvm.numflux|<tuple|3.8|41|ch1b_finite_volume_method.tm>>
    <associate|eq:g2|<tuple|3.19|45|ch1b_finite_volume_method.tm>>
    <associate|eq:g2.simplifier|<tuple|C.17|241|appendix.tm>>
    <associate|eq:general.pk.source|<tuple|6.14|139|ch5_10_moment_problem.tm>>
    <associate|eq:genuinely.nonlinear|<tuple|2.4|32|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:ghu|<tuple|C.18|241|appendix.tm>>
    <associate|eq:gl.lagrange|<tuple|C.9|240|appendix.tm>>
    <associate|eq:global.lf|<tuple|3.10|41|ch1b_finite_volume_method.tm>>
    <associate|eq:gradau|<tuple|3.18|45|ch1b_finite_volume_method.tm>>
    <associate|eq:integral.con.law|<tuple|2.3|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:intro.con.law|<tuple|2.2|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:intro.rp|<tuple|2.13|34|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:intro.u|<tuple|2.1|31|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:kx.defn|<tuple|G.30|261|appendix.tm>>
    <associate|eq:lag.poly.1d|<tuple|3.4|39|ch1b_finite_volume_method.tm>>
    <associate|eq:laup|<tuple|4.14|58|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:leg.id1|<tuple|C.12|240|appendix.tm>>
    <associate|eq:leg.id2|<tuple|C.13|240|appendix.tm>>
    <associate|eq:linearly.degenerate|<tuple|2.5|32|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:low.order.cell.avg.update|<tuple|5.9|107|ch3_blending_limiter.tm>>
    <associate|eq:low.order.high.level|<tuple|5.5|105|ch3_blending_limiter.tm>>
    <associate|eq:low.order.tilde.update|<tuple|5.27|115|ch3_blending_limiter.tm>>
    <associate|eq:low.order.update|<tuple|5.8|106|ch3_blending_limiter.tm>>
    <associate|eq:low.update.2d|<tuple|G.37|266|appendix.tm>>
    <associate|eq:lw.corr.flux|<tuple|A.13|230|appendix.tm>>
    <associate|eq:lwfr.2d.explicit|<tuple|4.22|88|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:lwfr.evolution|<tuple|A.9|230|appendix.tm>>
    <associate|eq:lwfr.time.average.cts|<tuple|4.6|49|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:lwtay|<tuple|4.1|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:mdrk.2stage.update.eqn|<tuple|7.13|153|ch4_mdrk.tm>>
    <associate|eq:mdrk.A.star.defn|<tuple|7.16|153|ch4_mdrk.tm>>
    <associate|eq:mdrk.A0A1.matrices|<tuple|7.14|153|ch4_mdrk.tm>>
    <associate|eq:mdrk.Fblend|<tuple|7.24|157|ch4_mdrk.tm>>
    <associate|eq:mdrk.blended.scheme|<tuple|7.21|156|ch4_mdrk.tm>>
    <associate|eq:mdrk.c1|<tuple|H.5|269|appendix.tm>>
    <associate|eq:mdrk.c2|<tuple|H.6|270|appendix.tm>>
    <associate|eq:mdrk.c3|<tuple|H.7|270|appendix.tm>>
    <associate|eq:mdrk.c4|<tuple|H.8|270|appendix.tm>>
    <associate|eq:mdrk.c5|<tuple|H.9|270|appendix.tm>>
    <associate|eq:mdrk.c6|<tuple|H.10|270|appendix.tm>>
    <associate|eq:mdrk.c7|<tuple|H.11|270|appendix.tm>>
    <associate|eq:mdrk.c8|<tuple|H.12|270|appendix.tm>>
    <associate|eq:mdrk.d1|<tuple|H.14|270|appendix.tm>>
    <associate|eq:mdrk.d2|<tuple|H.15|270|appendix.tm>>
    <associate|eq:mdrk.d3|<tuple|H.16|270|appendix.tm>>
    <associate|eq:mdrk.d4|<tuple|H.17|270|appendix.tm>>
    <associate|eq:mdrk.d5|<tuple|H.18|270|appendix.tm>>
    <associate|eq:mdrk.f2.defn|<tuple|7.5|148|ch4_mdrk.tm>>
    <associate|eq:mdrk.far.field.solution|<tuple|7.25|164|ch4_mdrk.tm>>
    <associate|eq:mdrk.ho.method|<tuple|7.19|156|ch4_mdrk.tm>>
    <associate|eq:mdrk.intro.us.evolution|<tuple|7.1|147|ch4_mdrk.tm>>
    <associate|eq:mdrk.lo.method|<tuple|7.20|156|ch4_mdrk.tm>>
    <associate|eq:mdrk.low.order.cell.avg.update|<tuple|7.23|156|ch4_mdrk.tm>>
    <associate|eq:mdrk.low.order.update|<tuple|7.22|156|ch4_mdrk.tm>>
    <associate|eq:mdrk.mdrk.first.stage|<tuple|7.2|148|ch4_mdrk.tm>>
    <associate|eq:mdrk.mdrk.second.stage|<tuple|7.3|148|ch4_mdrk.tm>>
    <associate|eq:mdrk.nfdiss1|<tuple|7.10|151|ch4_mdrk.tm>>
    <associate|eq:mdrk.nfdiss2|<tuple|7.11|151|ch4_mdrk.tm>>
    <associate|eq:mdrk.tavgsol|<tuple|7.12|151|ch4_mdrk.tm>>
    <associate|eq:mdrk.taylor.u.five|<tuple|H.4|269|appendix.tm>>
    <associate|eq:mdrk.unp.approximate|<tuple|H.2|269|appendix.tm>>
    <associate|eq:mdrk.uplwfr|<tuple|7.6|148|ch4_mdrk.tm>>
    <associate|eq:mdrk.upmean|<tuple|7.8|149|ch4_mdrk.tm>>
    <associate|eq:mdrk.us.fourier|<tuple|7.15|153|ch4_mdrk.tm>>
    <associate|eq:mdrk.ut.ders|<tuple|H.3|269|appendix.tm>>
    <associate|eq:mh.at.face|<tuple|5.20|111|ch3_blending_limiter.tm>>
    <associate|eq:mh.corr.flux|<tuple|5.16|110|ch3_blending_limiter.tm>>
    <associate|eq:mu.pm|<tuple|G.7|253|appendix.tm>>
    <associate|eq:muscl.final.general|<tuple|G.6|252|appendix.tm>>
    <associate|eq:muxy.defn|<tuple|G.26|261|appendix.tm>>
    <associate|eq:new.cfl1|<tuple|G.10|254|appendix.tm>>
    <associate|eq:new.cfl1.2d|<tuple|G.31|262|appendix.tm>>
    <associate|eq:new.cfl2|<tuple|G.13|256|appendix.tm>>
    <associate|eq:new.cfl3|<tuple|G.17|257|appendix.tm>>
    <associate|eq:new.cfl3.conservative|<tuple|G.19|258|appendix.tm>>
    <associate|eq:nfdiss1|<tuple|4.9|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:nfdiss2|<tuple|4.10|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:nflin1|<tuple|4.12|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:nflin2|<tuple|4.13|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:non.cell.centred.defn|<tuple|G.3|251|appendix.tm>>
    <associate|eq:non.con.face.defn1|<tuple|G.21|259|appendix.tm>>
    <associate|eq:nse.manu|<tuple|9.21|216|ch_parabolic.tm>>
    <associate|eq:num.soln|<tuple|3.3|39|ch1b_finite_volume_method.tm>>
    <associate|eq:numflux.admissibility.cfl|<tuple|G.2|251|appendix.tm>>
    <associate|eq:numflux.d1|<tuple|A.14|230|appendix.tm>>
    <associate|eq:numflux.d2|<tuple|A.12|230|appendix.tm>>
    <associate|eq:numflux.defn|<tuple|A.5|228|appendix.tm>>
    <associate|eq:numresults.2dadv|<tuple|5.8|121|ch3_blending_limiter.tm>>
    <associate|eq:ode.L|<tuple|7.2|148|ch4_mdrk.tm>>
    <associate|eq:optimization.problem|<tuple|5.23|112|ch3_blending_limiter.tm>>
    <associate|eq:parabolic.central.u|<tuple|9.10|213|ch_parabolic.tm>>
    <associate|eq:parabolic.cts.time.avg.flux|<tuple|9.15|214|ch_parabolic.tm>>
    <associate|eq:parabolic.flux.poly.defn|<tuple|9.19|214|ch_parabolic.tm>>
    <associate|eq:parabolic.ft.defn|<tuple|9.17|214|ch_parabolic.tm>>
    <associate|eq:parabolic.grad.transform|<tuple|9.6|212|ch_parabolic.tm>>
    <associate|eq:parabolic.lw.update|<tuple|9.12|213|ch_parabolic.tm>>
    <associate|eq:parabolic.lwfr.update.curvilinear|<tuple|9.16|214|ch_parabolic.tm>>
    <associate|eq:parabolic.matrix.operator.notation|<tuple|9.3|211|ch_parabolic.tm>>
    <associate|eq:parabolic.parabolic.eqn|<tuple|9.1|211|ch_parabolic.tm>>
    <associate|eq:parabolic.parabolic.in.first.order|<tuple|9.4|211|ch_parabolic.tm>>
    <associate|eq:parabolic.q.defn|<tuple|9.11|213|ch_parabolic.tm>>
    <associate|eq:parabolic.rusanov.flux.lw|<tuple|9.14|213|ch_parabolic.tm>>
    <associate|eq:parabolic.time.averaged.flux|<tuple|9.13|213|ch_parabolic.tm>>
    <associate|eq:parabolic.transformed.fo|<tuple|9.7|212|ch_parabolic.tm>>
    <associate|eq:parabolic.u.corrected|<tuple|9.9|213|ch_parabolic.tm>>
    <associate|eq:parabolic.ut.defn|<tuple|9.18|214|ch_parabolic.tm>>
    <associate|eq:parabolic.vector.vector|<tuple|9.2|211|ch_parabolic.tm>>
    <associate|eq:pk.slope.correction|<tuple|5.25|113|ch3_blending_limiter.tm>>
    <associate|eq:predictor.defn|<tuple|A.2|228|appendix.tm>>
    <associate|eq:predictor.eqn|<tuple|A.3|228|appendix.tm>>
    <associate|eq:predictor.linear.solution|<tuple|A.16|231|appendix.tm>>
    <associate|eq:pstar|<tuple|B.1|234|appendix.tm>>
    <associate|eq:radau.corrector|<tuple|C.11|240|appendix.tm>>
    <associate|eq:radau.poly|<tuple|C.12|240|appendix.tm>>
    <associate|eq:radau.simplifier.1|<tuple|C.15|240|appendix.tm>>
    <associate|eq:radau.simplifier.2|<tuple|C.16|240|appendix.tm>>
    <associate|eq:reconstruction|<tuple|5.18|111|ch3_blending_limiter.tm>>
    <associate|eq:reconstruction.general|<tuple|G.4|252|appendix.tm>>
    <associate|eq:regularized.con.law|<tuple|2.10|33|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:rh.cond|<tuple|2.8|32|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:riemann.problem|<tuple|5.15|110|ch3_blending_limiter.tm>>
    <associate|eq:rusanov.fvm|<tuple|3.11|42|ch1b_finite_volume_method.tm>>
    <associate|eq:rusanov.lambda|<tuple|8.20|173|ch6_curved_meshes.tm>>
    <associate|eq:scalar.con.law|<tuple|A.1|227|appendix.tm>>
    <associate|eq:scaling.conv.theta|<tuple|F.1|249|appendix.tm>>
    <associate|eq:scaling.general.theta|<tuple|F.2|249|appendix.tm>>
    <associate|eq:semi.integral.form|<tuple|8.31|176|ch6_curved_meshes.tm>>
    <associate|eq:semidiscrete.dg|<tuple|3.14|43|ch1b_finite_volume_method.tm>>
    <associate|eq:shuosher|<tuple|4.20|81|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:smoothing|<tuple|5.13|109|ch3_blending_limiter.tm>>
    <associate|eq:sod|<tuple|4.18|79|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:soln.points|<tuple|3.2|39|ch1b_finite_volume_method.tm>>
    <associate|eq:state|<tuple|4.16|78|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:strong.form.dg.1d|<tuple|3.16|44|ch1b_finite_volume_method.tm>>
    <associate|eq:subcell.defn|<tuple|5.7|106|ch3_blending_limiter.tm>>
    <associate|eq:tavgflux|<tuple|4.2|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:tavgsol|<tuple|4.11|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:time.step.2d|<tuple|4.29|97|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:tmp.F.S.split|<tuple|6.13|139|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.cell.avg.decomp|<tuple|6.10|138|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.con.law|<tuple|6.1|135|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.fravgup|<tuple|6.8|137|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.low.order.tilde.update|<tuple|6.11|138|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.low.order.update|<tuple|6.9|138|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.lwtay|<tuple|6.2|136|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.pure.low.order.tilde.update|<tuple|6.12|138|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.tavgS|<tuple|6.4|136|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.tavgflux|<tuple|6.3|136|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.tenmom.source|<tuple|6.17|140|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.tmp|<tuple|6.16|140|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.tvgproperty|<tuple|6.5|136|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.tvgproperty.S|<tuple|6.6|136|ch5_10_moment_problem.tm>>
    <associate|eq:tmp.uplwfr|<tuple|6.7|136|ch5_10_moment_problem.tm>>
    <associate|eq:tvgproperty|<tuple|4.3|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:uad.form|<tuple|5.1|103|ch3_blending_limiter.tm>>
    <associate|eq:uj.nph.s|<tuple|G.11|255|appendix.tm>>
    <associate|eq:uj.nph.s.explicit|<tuple|G.14|256|appendix.tm>>
    <associate|eq:ujph.s.identity|<tuple|G.18|257|appendix.tm>>
    <associate|eq:um.lw|<tuple|4.24|88|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:unphsxy|<tuple|G.32|263|appendix.tm>>
    <associate|eq:up2d|<tuple|4.23|88|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:update.x.combination|<tuple|G.28|261|appendix.tm>>
    <associate|eq:update.x.combination2|<tuple|G.29|261|appendix.tm>>
    <associate|eq:uplwfr|<tuple|4.4|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:upmean|<tuple|4.5|49|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:us.conservative|<tuple|G.20|259|appendix.tm>>
    <associate|eq:us.defn.main|<tuple|5.21|111|ch3_blending_limiter.tm>>
    <associate|eq:use.weak.convexity|<tuple|5.25|113|ch3_blending_limiter.tm>>
    <associate|eq:uss.defn|<tuple|G.15|257|appendix.tm>>
    <associate|eq:ustar.2d|<tuple|G.25|261|appendix.tm>>
    <associate|eq:ustar.defn|<tuple|G.9|254|appendix.tm>>
    <associate|eq:ustar.in.uad|<tuple|5.22|112|ch3_blending_limiter.tm>>
    <associate|eq:wave.speed.dg|<tuple|C.2|238|appendix.tm>>
    <associate|eq:weak.convexity|<tuple|5.2|104|ch3_blending_limiter.tm>>
    <associate|eq:weak.form|<tuple|2.7|32|ch1_hyperbolic_conservation_laws.tm>>
    <associate|eq:wj.expression|<tuple|C.10|240|appendix.tm>>
    <associate|eq:wss.simplified|<tuple|G.16|257|appendix.tm>>
    <associate|fig:2d.near.vacuum|<tuple|6.5|144|ch5_10_moment_problem.tm>>
    <associate|fig:2dcfl_g2|<tuple|4.31|91|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:2dcfl_radau|<tuple|4.30|91|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:ShuOsher|<tuple|4.24|82|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:ShuOsher.chblend|<tuple|5.3|118|ch3_blending_limiter.tm>>
    <associate|fig:ShuOsherCorr|<tuple|4.28|86|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:alpha.func|<tuple|5.2|109|ch3_blending_limiter.tm>>
    <associate|fig:astrophysical.jet|<tuple|5.15|128|ch3_blending_limiter.tm>>
    <associate|fig:blast|<tuple|4.25|83|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:blast.chblend|<tuple|5.4|119|ch3_blending_limiter.tm>>
    <associate|fig:blast.periodic|<tuple|5.17|130|ch3_blending_limiter.tm>>
    <associate|fig:blast.periodic.reference|<tuple|5.16|129|ch3_blending_limiter.tm>>
    <associate|fig:bucklev1|<tuple|4.20|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:burg1|<tuple|4.17|74|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:burg2|<tuple|4.18|75|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:burg4|<tuple|4.19|76|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cavity|<tuple|9.6|218|ch_parabolic.tm>>
    <associate|fig:chars|<tuple|2.2|35|ch1_hyperbolic_conservation_laws.tm>>
    <associate|fig:cla1|<tuple|4.1|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla2|<tuple|4.2|64|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla2_dirichlet|<tuple|4.5|67|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla3|<tuple|4.3|65|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla4|<tuple|4.4|66|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla5|<tuple|4.6|67|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:composite.signal.2d|<tuple|5.8|122|ch3_blending_limiter.tm>>
    <associate|fig:conv linear adv 2d|<tuple|4.32|93|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:conv linear rotate 2d|<tuple|4.34|94|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:conv_burger2d|<tuple|4.37|96|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:convergence|<tuple|6.1|141|ch5_10_moment_problem.tm>>
    <associate|fig:convergence.analysis|<tuple|9.3|217|ch_parabolic.tm>>
    <associate|fig:convergence.analysis.nse|<tuple|9.4|217|ch_parabolic.tm>>
    <associate|fig:cp.cf.swanson|<tuple|9.8|220|ch_parabolic.tm>>
    <associate|fig:curved.blunt|<tuple|8.12|206|ch6_curved_meshes.tm>>
    <associate|fig:curved.curved.subcells|<tuple|8.2|180|ch6_curved_meshes.tm>>
    <associate|fig:curved.dmr|<tuple|8.7|201|ch6_curved_meshes.tm>>
    <associate|fig:curved.forward.step|<tuple|8.8|202|ch6_curved_meshes.tm>>
    <associate|fig:curved.free.stream|<tuple|8.9|203|ch6_curved_meshes.tm>>
    <associate|fig:curved.isentropic|<tuple|8.10|204|ch6_curved_meshes.tm>>
    <associate|fig:curved.kh|<tuple|8.6|200|ch6_curved_meshes.tm>>
    <associate|fig:curved.m2000|<tuple|8.5|199|ch6_curved_meshes.tm>>
    <associate|fig:curved.mortar|<tuple|8.4|189|ch6_curved_meshes.tm>>
    <associate|fig:curved.naca|<tuple|8.14|207|ch6_curved_meshes.tm>>
    <associate|fig:curved.naca.mesh|<tuple|8.13|207|ch6_curved_meshes.tm>>
    <associate|fig:curved.ref.map|<tuple|8.1|173|ch6_curved_meshes.tm>>
    <associate|fig:curved.refine.coarsen|<tuple|8.3|187|ch6_curved_meshes.tm>>
    <associate|fig:curved.supersonic.cylinder|<tuple|8.11|205|ch6_curved_meshes.tm>>
    <associate|fig:dmr|<tuple|5.13|126|ch3_blending_limiter.tm>>
    <associate|fig:dmr.plot|<tuple|4.41|100|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:dmr.plot.zoom|<tuple|4.42|101|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:dmr.wct|<tuple|4.43|101|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:dofs2d|<tuple|4.29|86|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:double.rarefaction|<tuple|5.6|121|ch3_blending_limiter.tm>>
    <associate|fig:dwave|<tuple|4.21|79|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:erik|<tuple|9.1|216|ch_parabolic.tm>>
    <associate|fig:error|<tuple|A.1|232|appendix.tm>>
    <associate|fig:ffs.alpha.stats|<tuple|5.20|133|ch3_blending_limiter.tm>>
    <associate|fig:forward.step|<tuple|5.19|132|ch3_blending_limiter.tm>>
    <associate|fig:fv.evolution|<tuple|G.3|255|appendix.tm>>
    <associate|fig:gauss.source|<tuple|6.6|145|ch5_10_moment_problem.tm>>
    <associate|fig:general.grid|<tuple|G.1|252|appendix.tm>>
    <associate|fig:hat1|<tuple|4.9|69|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:hat2|<tuple|4.10|69|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:hat3|<tuple|4.11|70|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:interactions|<tuple|4.35|95|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:isentropic.convergence|<tuple|4.38|98|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:isentropic.convergence.chblend|<tuple|5.9|123|ch3_blending_limiter.tm>>
    <associate|fig:isentropic.ratios.vs.grid.1.2.3.4|<tuple|4.40|99|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:isentropic.time.vs.error|<tuple|4.39|99|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:karman.forces|<tuple|9.10|221|ch_parabolic.tm>>
    <associate|fig:karman.vorticity|<tuple|9.9|221|ch_parabolic.tm>>
    <associate|fig:kh|<tuple|5.14|127|ch3_blending_limiter.tm>>
    <associate|fig:lax|<tuple|4.23|81|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:leblanc|<tuple|5.7|121|ch3_blending_limiter.tm>>
    <associate|fig:lid.cavity.soln|<tuple|9.5|218|ch_parabolic.tm>>
    <associate|fig:lin2d_rotate_soln|<tuple|4.33|94|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:lineplot_burg2d|<tuple|4.36|96|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:mdrk.blast|<tuple|7.5|160|ch4_mdrk.tm>>
    <associate|fig:mdrk.burg1|<tuple|7.3|159|ch4_mdrk.tm>>
    <associate|fig:mdrk.burg2|<tuple|7.4|160|ch4_mdrk.tm>>
    <associate|fig:mdrk.cla1|<tuple|7.1|158|ch4_mdrk.tm>>
    <associate|fig:mdrk.dmr|<tuple|7.9|163|ch4_mdrk.tm>>
    <associate|fig:mdrk.high.density|<tuple|7.7|162|ch4_mdrk.tm>>
    <associate|fig:mdrk.hurricane.critical|<tuple|7.10|165|ch4_mdrk.tm>>
    <associate|fig:mdrk.rayleigh.taylor|<tuple|7.13|167|ch4_mdrk.tm>>
    <associate|fig:mdrk.rotational.all.speed|<tuple|7.11|165|ch4_mdrk.tm>>
    <associate|fig:mdrk.rp2d|<tuple|7.12|166|ch4_mdrk.tm>>
    <associate|fig:mdrk.sedov.blast|<tuple|7.8|162|ch4_mdrk.tm>>
    <associate|fig:mdrk.titarev.toro|<tuple|7.6|161|ch4_mdrk.tm>>
    <associate|fig:mdrk.vla2|<tuple|7.2|159|ch4_mdrk.tm>>
    <associate|fig:mult1|<tuple|4.12|70|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:mult2|<tuple|4.13|71|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:non.interacting.rp1|<tuple|G.2|255|appendix.tm>>
    <associate|fig:non.interacting.rp2|<tuple|G.4|258|appendix.tm>>
    <associate|fig:nse.manu|<tuple|9.2|216|ch_parabolic.tm>>
    <associate|fig:numflux_toro5_contact|<tuple|4.27|85|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:numflx|<tuple|4.26|84|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:realistic|<tuple|6.7|146|ch5_10_moment_problem.tm>>
    <associate|fig:rp|<tuple|6.2|142|ch5_10_moment_problem.tm>>
    <associate|fig:rp2d|<tuple|5.10|124|ch3_blending_limiter.tm>>
    <associate|fig:rp2d.alpha|<tuple|5.11|125|ch3_blending_limiter.tm>>
    <associate|fig:rp2d.alpha.stats|<tuple|5.12|125|ch3_blending_limiter.tm>>
    <associate|fig:sedov.blast|<tuple|5.5|120|ch3_blending_limiter.tm>>
    <associate|fig:shock.diffraction|<tuple|5.18|131|ch3_blending_limiter.tm>>
    <associate|fig:shuosher|<tuple|6.3|143|ch5_10_moment_problem.tm>>
    <associate|fig:sod|<tuple|4.22|80|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:sol.struc|<tuple|2.1|34|ch1_hyperbolic_conservation_laws.tm>>
    <associate|fig:solflux1|<tuple|3.1|40|ch1b_finite_volume_method.tm>>
    <associate|fig:subcells|<tuple|5.1|106|ch3_blending_limiter.tm>>
    <associate|fig:swanson.mesh.mach|<tuple|9.7|219|ch_parabolic.tm>>
    <associate|fig:two.rare.sources|<tuple|6.4|144|ch5_10_moment_problem.tm>>
    <associate|fig:vla1|<tuple|4.14|72|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:vla2|<tuple|4.15|73|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:vla3|<tuple|4.16|74|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:wp1|<tuple|4.7|68|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:wp2|<tuple|4.8|68|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|footnote-4.1|<tuple|4.1|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|footnote-5.1|<tuple|5.1|111|ch3_blending_limiter.tm>>
    <associate|footnote-6.1|<tuple|6.1|139|ch5_10_moment_problem.tm>>
    <associate|footnote-9.1|<tuple|9.1|212|ch_parabolic.tm>>
    <associate|footnote-C.1|<tuple|C.1|239|appendix.tm>>
    <associate|footnote-D.1|<tuple|D.1|244|appendix.tm>>
    <associate|footnr-4.1|<tuple|4.1|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|footnr-5.1|<tuple|5.1|111|ch3_blending_limiter.tm>>
    <associate|footnr-6.1|<tuple|6.1|139|ch5_10_moment_problem.tm>>
    <associate|footnr-9.1|<tuple|9.1|212|ch_parabolic.tm>>
    <associate|footnr-C.1|<tuple|C.1|239|appendix.tm>>
    <associate|footnr-D.1|<tuple|D.1|244|appendix.tm>>
    <associate|lemma:2d.muscl.step2.general|<tuple|G.10|263|appendix.tm>>
    <associate|lemma:2d.muscl.step3.conservative|<tuple|G.11|265|appendix.tm>>
    <associate|lemma:avg.riemann.problem|<tuple|G.1|253|appendix.tm>>
    <associate|lemma:m.h.step.1|<tuple|G.2|254|appendix.tm>>
    <associate|lemma:m.h.step.1.2d|<tuple|G.9|262|appendix.tm>>
    <associate|lemma:muscl.step2.general|<tuple|G.3|256|appendix.tm>>
    <associate|lemma:muscl.step3.conservative|<tuple|G.5|258|appendix.tm>>
    <associate|lemma:muscl.step3.wss|<tuple|G.4|257|appendix.tm>>
    <associate|part:abstract.tm|<tuple|7|19>>
    <associate|part:acknowledgements.tm|<tuple|?|3|prelim_pages.tm>>
    <associate|part:appendix.tm|<tuple|7|225>>
    <associate|part:bibliography.tm|<tuple|H.18|270>>
    <associate|part:ch0_introduction.tm|<tuple|7|19>>
    <associate|part:ch1_hyperbolic_conservation_laws.tm|<tuple|1.5|30>>
    <associate|part:ch1b_finite_volume_method.tm|<tuple|2.18|39>>
    <associate|part:ch2_lax_wendroff_flux_reconstruction.tm|<tuple|3.19|45>>
    <associate|part:ch3_blending_limiter.tm|<tuple|4.12|102>>
    <associate|part:ch4_mdrk.tm|<tuple|6.5|146>>
    <associate|part:ch5_10_moment_problem.tm|<tuple|5.10|134>>
    <associate|part:ch6_curved_meshes.tm|<tuple|7.6|168>>
    <associate|part:ch_parabolic.tm|<tuple|8.8|209>>
    <associate|part:conclusion.tm|<tuple|9.5|223>>
    <associate|part:declaration.tm|<tuple|?|2|prelim_pages.tm>>
    <associate|part:prelim_pages.tm|<tuple|?|2>>
    <associate|part:publications.tm|<tuple|?|3>>
    <associate|part:title_page.tm|<tuple|?|1>>
    <associate|rmk:amr.metric.terms|<tuple|8.7|192|ch6_curved_meshes.tm>>
    <associate|rmk:mh.restriction.for.fr|<tuple|G.7|259|appendix.tm>>
    <associate|rmk:non.linear|<tuple|A.2|231|appendix.tm>>
    <associate|rmk:why.same.flux|<tuple|5.3|107|ch3_blending_limiter.tm>>
    <associate|sec: vla|<tuple|4.7.2|71|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:2d.admissibility|<tuple|G.6.3|265|appendix.tm>>
    <associate|sec:2d.mh|<tuple|G.6|260|appendix.tm>>
    <associate|sec:2drp|<tuple|5.9.2|123|ch3_blending_limiter.tm>>
    <associate|sec:DFR|<tuple|4.2.3|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:ader.dg|<tuple|A.2|227|appendix.tm>>
    <associate|sec:admissibility.preservation|<tuple|5.5|113|ch3_blending_limiter.tm>>
    <associate|sec:alg|<tuple|5.6|116|ch3_blending_limiter.tm>>
    <associate|sec:alw|<tuple|4.2.4|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:alwp|<tuple|9.3.2.1|214|ch_parabolic.tm>>
    <associate|sec:blast|<tuple|4.8.5|82|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:blast.chblend|<tuple|5.7.1.2|119|ch3_blending_limiter.tm>>
    <associate|sec:blend.review|<tuple|5.2|103|ch3_blending_limiter.tm>>
    <associate|sec:blending.scheme|<tuple|5.3.1|105|ch3_blending_limiter.tm>>
    <associate|sec:cla|<tuple|4.7.1|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:con|<tuple|A.5|232|appendix.tm>>
    <associate|sec:conclusion|<tuple|9.5|222|ch_parabolic.tm>>
    <associate|sec:controlling.oscillations|<tuple|5.3|105|ch3_blending_limiter.tm>>
    <associate|sec:curved.alwp|<tuple|8.3.3|176|ch6_curved_meshes.tm>>
    <associate|sec:curved.amr|<tuple|8.5|186|ch6_curved_meshes.tm>>
    <associate|sec:curved.amr.indicator|<tuple|8.5.3|193|ch6_curved_meshes.tm>>
    <associate|sec:curved.blunt|<tuple|8.7.2.4|206|ch6_curved_meshes.tm>>
    <associate|sec:curved.conclusions|<tuple|8.8|209|ch6_curved_meshes.tm>>
    <associate|sec:curved.cons.lw|<tuple|8.3|172|ch6_curved_meshes.tm>>
    <associate|sec:curved.curvilinear.coords|<tuple|8.2|169|ch6_curved_meshes.tm>>
    <associate|sec:curved.cylinder|<tuple|8.7.2.3|204|ch6_curved_meshes.tm>>
    <associate|sec:curved.dmr|<tuple|8.7.1.3|200|ch6_curved_meshes.tm>>
    <associate|sec:curved.el2mortar|<tuple|8.5.2.2|191|ch6_curved_meshes.tm>>
    <associate|sec:curved.error.lw|<tuple|8.6.2|195|ch6_curved_meshes.tm>>
    <associate|sec:curved.flux.correction|<tuple|8.4.3|183|ch6_curved_meshes.tm>>
    <associate|sec:curved.flux.correction.curved|<tuple|8.4.3.2|185|ch6_curved_meshes.tm>>
    <associate|sec:curved.flux.limiter.1d|<tuple|8.4.3.1|184|ch6_curved_meshes.tm>>
    <associate|sec:curved.forward.step|<tuple|8.7.1.4|201|ch6_curved_meshes.tm>>
    <associate|sec:curved.fr|<tuple|8.3.1|172|ch6_curved_meshes.tm>>
    <associate|sec:curved.free.stream.lwfr|<tuple|8.3.4|177|ch6_curved_meshes.tm>>
    <associate|sec:curved.handling.mortars|<tuple|8.5.2|189|ch6_curved_meshes.tm>>
    <associate|sec:curved.isentropic|<tuple|8.7.2.2|203|ch6_curved_meshes.tm>>
    <associate|sec:curved.lwfr.curved|<tuple|8.3.2|174|ch6_curved_meshes.tm>>
    <associate|sec:curved.naca|<tuple|8.7.2.5|206|ch6_curved_meshes.tm>>
    <associate|sec:curved.numerical.results|<tuple|8.7|197|ch6_curved_meshes.tm>>
    <associate|sec:curved.proj.elem|<tuple|8.5.1.2|188|ch6_curved_meshes.tm>>
    <associate|sec:curved.proj.face|<tuple|8.5.2.3|191|ch6_curved_meshes.tm>>
    <associate|sec:curved.rk.error.section|<tuple|8.6.1|195|ch6_curved_meshes.tm>>
    <associate|sec:curved.shock.capturing|<tuple|8.4|179|ch6_curved_meshes.tm>>
    <associate|sec:curved.smooth.ind|<tuple|8.4.2|182|ch6_curved_meshes.tm>>
    <associate|sec:curved.soln.transfer|<tuple|8.5.1|187|ch6_curved_meshes.tm>>
    <associate|sec:curved.time.stepping|<tuple|8.6|194|ch6_curved_meshes.tm>>
    <associate|sec:dmr|<tuple|4.11.2|99|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:ea.scheme|<tuple|4.3.2|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:ffs|<tuple|5.9.8|131|ch3_blending_limiter.tm>>
    <associate|sec:fo|<tuple|5.3.3|109|ch3_blending_limiter.tm>>
    <associate|sec:formal.accuracy|<tuple|H|269|appendix.tm>>
    <associate|sec:four1d|<tuple|4.4|57|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:fourier2d|<tuple|4.9.1|89|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:fr.corr.identities|<tuple|C.2.1|240|appendix.tm>>
    <associate|sec:frdfr|<tuple|E|247|appendix.tm>>
    <associate|sec:intro.contri|<tuple|1.4|25|ch0_introduction.tm>>
    <associate|sec:intro.fr|<tuple|1.2|23|ch0_introduction.tm>>
    <associate|sec:intro.lw|<tuple|1.1|21|ch0_introduction.tm>>
    <associate|sec:intro.outline|<tuple|1.5|29|ch0_introduction.tm>>
    <associate|sec:intro.shock.capturing|<tuple|1.3|24|ch0_introduction.tm>>
    <associate|sec:isentropic.vortex|<tuple|4.11.1|97|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:kh|<tuple|5.9.4|126|ch3_blending_limiter.tm>>
    <associate|sec:lim|<tuple|4.6|61|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:linear.equivalence|<tuple|A.3|230|appendix.tm>>
    <associate|sec:lw|<tuple|4.2|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:lw.bc|<tuple|4.5|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:lwfr.2d|<tuple|4.9|87|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:lwfr.2nd.order|<tuple|9.3|212|ch_parabolic.tm>>
    <associate|sec:lwfr.numfluxes|<tuple|B|233|appendix.tm>>
    <associate|sec:lwfr.res1d|<tuple|4.7|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:lwfr.res2d.euler|<tuple|4.11|96|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:lwfr.res2d.scalar|<tuple|4.10|92|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:m2000|<tuple|5.9.5|127|ch3_blending_limiter.tm>>
    <associate|sec:mdrk|<tuple|7.2|148|ch4_mdrk.tm>>
    <associate|sec:mdrk.ae|<tuple|7.2.5|151|ch4_mdrk.tm>>
    <associate|sec:mdrk.alw|<tuple|7.2.3|150|ch4_mdrk.tm>>
    <associate|sec:mdrk.blending|<tuple|7.4|155|ch4_mdrk.tm>>
    <associate|sec:mdrk.cla|<tuple|7.5.1.1|158|ch4_mdrk.tm>>
    <associate|sec:mdrk.conclusion|<tuple|7.6|167|ch4_mdrk.tm>>
    <associate|sec:mdrk.ea|<tuple|7.2.6|152|ch4_mdrk.tm>>
    <associate|sec:mdrk.fourier|<tuple|7.3|153|ch4_mdrk.tm>>
    <associate|sec:mdrk.num|<tuple|7.5|157|ch4_mdrk.tm>>
    <associate|sec:mdrk.numflux|<tuple|7.2.4|151|ch4_mdrk.tm>>
    <associate|sec:mdrk.reconstruction|<tuple|7.2.2|149|ch4_mdrk.tm>>
    <associate|sec:mdrk.res1dsys|<tuple|7.5.2|160|ch4_mdrk.tm>>
    <associate|sec:mh|<tuple|5.4|110|ch3_blending_limiter.tm>>
    <associate|sec:mh.adm|<tuple|G.4|253|appendix.tm>>
    <associate|sec:muscl.admissibility.proof|<tuple|G|251|appendix.tm>>
    <associate|sec:num|<tuple|A.4|231|appendix.tm>>
    <associate|sec:num.results.chblend|<tuple|5.7|117|ch3_blending_limiter.tm>>
    <associate|sec:numflux|<tuple|4.3|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:numresults.2d.euler|<tuple|5.9|122|ch3_blending_limiter.tm>>
    <associate|sec:reconstruction|<tuple|4.2.2|49|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:res1dsys|<tuple|4.8|77|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:res1dsys.chblend|<tuple|5.7.1|118|ch3_blending_limiter.tm>>
    <associate|sec:results|<tuple|9.4|215|ch_parabolic.tm>>
    <associate|sec:riemann.problem|<tuple|2.1.3|34|ch1_hyperbolic_conservation_laws.tm>>
    <associate|sec:rk|<tuple|3.4|44|ch1b_finite_volume_method.tm>>
    <associate|sec:rotate.composite|<tuple|4.10.2|93|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:scl|<tuple|3.1|39|ch1b_finite_volume_method.tm>>
    <associate|sec:sedov.blast.1d|<tuple|5.7.1.3|119|ch3_blending_limiter.tm>>
    <associate|sec:shuosher|<tuple|4.8.4|81|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:shuosher.blend|<tuple|5.7.1.1|118|ch3_blending_limiter.tm>>
    <associate|sec:slope.limiting|<tuple|5.4.1|112|ch3_blending_limiter.tm>>
    <associate|sec:smooth.ind|<tuple|5.3.2|108|ch3_blending_limiter.tm>>
    <associate|sec:sum|<tuple|4.12|101|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:sum.blend|<tuple|5.10|133|ch3_blending_limiter.tm>>
    <associate|sec:swanson|<tuple|9.4.3|218|ch_parabolic.tm>>
    <associate|sec:tmp.adm.pres|<tuple|6.3|137|ch5_10_moment_problem.tm>>
    <associate|sec:tmp.approximate.lw|<tuple|6.2.1|137|ch5_10_moment_problem.tm>>
    <associate|sec:tmp.conclusion|<tuple|6.5|146|ch5_10_moment_problem.tm>>
    <associate|sec:tmp.flux.correction|<tuple|6.3.1|137|ch5_10_moment_problem.tm>>
    <associate|sec:tmp.lwfr|<tuple|6.2|135|ch5_10_moment_problem.tm>>
    <associate|sec:tmp.numerical.results|<tuple|6.4|140|ch5_10_moment_problem.tm>>
    <associate|sec:tmp.source.limiter|<tuple|6.3.2|139|ch5_10_moment_problem.tm>>
    <associate|sec:transformations.parabolic|<tuple|9.2|211|ch_parabolic.tm>>
    <associate|sec:von.karman|<tuple|9.4.4|220|ch_parabolic.tm>>
    <associate|tab:2Dcfl|<tuple|4.2|92|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|tab:cfl|<tuple|4.1|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|tab:cfl.error|<tuple|8.1|208|ch6_curved_meshes.tm>>
    <associate|tab:max.cl.max.cp|<tuple|9.2|221|ch_parabolic.tm>>
    <associate|tab:mdrk.cfl|<tuple|7.1|155|ch4_mdrk.tm>>
    <associate|tab:swanson.forces|<tuple|9.1|220|ch_parabolic.tm>>
    <associate|thm:curved.lwfr.admissibility|<tuple|8.6|183|ch6_curved_meshes.tm>>
    <associate|thm:final.condn.conservative|<tuple|G.6|259|appendix.tm>>
    <associate|thm:final.condn.conservative.2d|<tuple|G.12|265|appendix.tm>>
    <associate|thm:lwfr.admissibility|<tuple|5.5|114|ch3_blending_limiter.tm>>
    <associate|thm:muscl.admissibility.theorem|<tuple|5.4|111|ch3_blending_limiter.tm>>
    <associate|thm:non.conservative.mh|<tuple|G.8|260|appendix.tm>>
    <associate|thm:rh|<tuple|2.4|32|ch1_hyperbolic_conservation_laws.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      babbar2022

      babbar2023admissibility

      babbar2024curved

      babbar2024equivalence

      babbar2024generalized

      babbar2024laxwendroff

      babbar2024multiderivative

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

      Lou2020

      Qiu2005b

      Cockburn1989a

      Cockburn1991

      Zhang2010b

      moe2017

      Xu2022

      moe2017

      Xu2022

      Chen2016

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

      Zhang2010b

      zhang2010c

      Zhang2010b

      Levermore_1996

      li2016

      li2016

      babbar2022

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

      Gassner2012

      Gassner_Winters_Hindenlang_Kopriva_2018

      Fambri2017

      LeFloch2002

      LeFloch2002

      raythesis

      LeFloch2002

      LeVeque1992

      Rusanov1962

      Colella1990

      Colella1984

      Harten1987

      Shu1989

      Shu1988

      Shu1989

      Zhang2010b

      Huynh2007

      Vincent2011a

      Vincent2011a

      Vincent2011a

      Vincent2011a

      Zorio2017

      Lou2020

      Romero2016

      Zorio2017

      Burger2017

      Zorio2017

      Burger2017

      Qiu2005b

      Rusanov1962

      Engquist1981

      Dumbser2008

      Gassner2011a

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989

      Cockburn1989

      Butcher2016

      Gottlieb2001

      Tsitouras2011

      Guo2015

      Guo2015

      Spiteri2002

      Xu2019

      Gottlieb2001

      Tsitouras2011

      Carpenter1995

      Spiteri2002

      Tsitouras2011

      Jiang1996

      Offner2019

      Offner2019

      Lou2020

      Zhang2010b

      Zhang2010b

      Spiteri2002

      Tsitouras2011

      Ruuth2002

      Spiteri2002

      Sod1978

      Lax1954

      Hirsch1990

      Hirsch1990

      Shu1989

      Qiu2005b

      Woodward1984

      Qiu2005b

      Zhang2010b

      Toro2009

      Gottlieb2001

      Tsitouras2011

      Rackauckas2017

      Bezanson2017

      Ranocha2022

      LeVeque1996

      Qiu2005b

      Gassner2011a

      Gottlieb2001

      Spiteri2002

      Tsitouras2011

      Rackauckas2017

      Batten1997

      Bezanson2017

      Yee1999

      Spiegel2016

      Woodward1984

      Qiu2005b

      Qiu2005b

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

      Zhang2010b

      Levermore_1996

      Zorio2017

      babbar2022

      Zhang2010b

      Zhang2010b

      Zhang2010b

      meena2017

      Meena_Kumar_Chandrashekar_2017

      ramirez2021

      Zhang2010b

      Levermore_1996

      Berthon2015

      Berthon_TMP_2006

      Berthon2015

      meena2017

      Meena_Kumar_Chandrashekar_2017

      Meena_Kumar_Chandrashekar_2017

      Meena_Kumar_Chandrashekar_2017

      meena2017

      Meena2020

      babbar2022

      tenkai

      icosahom2023_tmp

      Biswas2021

      Meena_Kumar_Chandrashekar_2017

      Meena2020

      Meena_Kumar_Chandrashekar_2017

      Berthon2015

      Zhang2010b

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

      hennemann2021

      Berthon2006

      li2016

      Pan2016

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
      <tuple|normal|<\surround|<hidden-binding|<tuple>|2.1>|>
        Solution structure for the Riemann problem of a system of
        conservation laws.
      </surround>|<pageref|auto-17>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2.2>|>
        Characteristic lines for simple waves forming the solution to a
        Riemann problem.
      </surround>|<pageref|auto-18>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|3.1>|>
        Piecewise solutions and flux polynomials
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.1>|>
        Error convergence for constant linear advection comparing Radau and
        <with|mode|<quote|math>|g<rsub|2>> correction.
      </surround>|<pageref|auto-48>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.2>|>
        Error convergence for constant linear advection comparing LWFR and
        RKFR
      </surround>|<pageref|auto-49>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.3>|>
        Error growth for constant linear advection equation.
      </surround>|<pageref|auto-50>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.4>|>
        <with|mode|<quote|math>|L<rsub|2>> norm growth for constant linear
        advection equation.
      </surround>|<pageref|auto-51>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.5>|>
        Convergence for constant linear advection with Dirichlet boundary
        conditions
      </surround>|<pageref|auto-52>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.6>|>
        <with|mode|<quote|math>|L<rsub|2>> norm growth for constant linear
        advection with Dirichlet boundary conditions
      </surround>|<pageref|auto-53>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.7>|>
        Constant linear advection of a wave packet.
      </surround>|<pageref|auto-54>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.8>|>
        Error convergence for constant linear advection of a wave packet.
      </surround>|<pageref|auto-55>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.9>|>
        Constant linear advection of hat profile without limiter.
      </surround>|<pageref|auto-57>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.10>|>
        Constant linear advection of hat profile with TVB limiter.
      </surround>|<pageref|auto-58>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.11>|>
        Constant linear advection of hat profile using RK65 with TVB limiter.
      </surround>|<pageref|auto-59>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.12>|>
        Constant linear advection of a composite profile without limiter.
      </surround>|<pageref|auto-60>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.13>|>
        Constant linear advection of a composite profile with TVB limiter.
      </surround>|<pageref|auto-61>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.14>|>
        Error convergence for variable linear advection with
        <with|mode|<quote|math>|a(x) = x>.
      </surround>|<pageref|auto-63>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.15>|>
        Error convergence for variable linear advection with
        <with|mode|<quote|math>|a(x) = x<rsup|2>>.
      </surround>|<pageref|auto-64>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.16>|>
        Error growth for linear advection with wave speed
        <with|mode|<quote|math>|a(x) = x<rsup|2>>
      </surround>|<pageref|auto-65>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.17>|>
        Solution of 1-D Burger's equation.
      </surround>|<pageref|auto-67>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.18>|>
        Error convergence for 1-D Burger's equation.
      </surround>|<pageref|auto-68>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.19>|>
        Error convergence for 1-D Burger's equation comparing numerical
        fluxes.
      </surround>|<pageref|auto-69>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.20>|>
        Solution of Buckley-Leverett model.
      </surround>|<pageref|auto-71>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.21>|>
        Density error convergence for 1-D Euler's equation.
      </surround>|<pageref|auto-74>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.22>|>
        Numerical solutions of Sod's test case.
      </surround>|<pageref|auto-76>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.23>|>
        Numerical solutions of Lax's test case.
      </surround>|<pageref|auto-78>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.24>|>
        Numerical solutions of Shu-Osher problem.
      </surround>|<pageref|auto-80>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.25>|>
        Numerical solutions of blast wave.
      </surround>|<pageref|auto-82>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.26>|>
        Numerical solutions of Blast wave comparing different numerical
        fluxes.
      </surround>|<pageref|auto-84>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.27>|>
        Numerical solutions of 1-D Euler's equations with different numerical
        fluxes
      </surround>|<pageref|auto-85>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.28>|>
        Numerical solutions of Shu-Osher problem comparing Radau and
        <with|mode|<quote|math>|g<rsub|2>> correction.
      </surround>|<pageref|auto-87>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.29>|>
        Solution and flux points on a 2-D FR element.
      </surround>|<pageref|auto-88>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.30>|>
        Stability region of 2-D LWFR with Radau correction and D2
        dissipation.
      </surround>|<pageref|auto-91>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.31>|>
        Stability region of 2-D LWFR with the
        <with|mode|<quote|math>|g<rsub|2>> correction and D2 dissipation.
      </surround>|<pageref|auto-92>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.32>|>
        Error convergence test for 2-D linear advection equation with
        velocity <with|mode|<quote|math>|\<b-a\>=<around|(|1,1|)>>.
      </surround>|<pageref|auto-96>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.33>|>
        Linear advection with velocity <with|mode|<quote|math>|\<b-a\>=<around|(|-y,x|)>>.
      </surround>|<pageref|auto-98>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.34>|>
        Error convergence test for 2-D linear advection equation with
        velocity <with|mode|<quote|math>|\<b-a\>=<around|(|-y,x|)>>.
      </surround>|<pageref|auto-99>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.35>|>
        Numerical solutions of composite signal with velocity
        <with|mode|<quote|math>|<with|font-series|<quote|bold>|a>=<around*|(|<frac|1|2>-y,x-<frac|1|2>|)>>.
      </surround>|<pageref|auto-100>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.36>|>
        Line plot across the diagonal of the solution of 2-D Burger's
        equation.
      </surround>|<pageref|auto-102>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.37>|>
        Error convergence test for 2-D Burger's equation.
      </surround>|<pageref|auto-103>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.38>|>
        <with|mode|<quote|math>|L<rsup|2>> error, WCT for isentropic vortex
        versus grid resolution.
      </surround>|<pageref|auto-106>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.39>|>
        Wall Clock Time (WCT) versus <with|mode|<quote|math>|L<rsup|2>> error
        for isentropic vortex.
      </surround>|<pageref|auto-107>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.40>|>
        Wall Clock Time (WCT) ratios versus grid resolution for isentropic
        vortex.
      </surround>|<pageref|auto-108>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.41>|>
        Density profile of numerical solutions of double Mach reflection
        problem.
      </surround>|<pageref|auto-110>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.42>|>
        Enlarged density contours of density double Mach reflection problem.
      </surround>|<pageref|auto-111>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.43>|>
        Grid size versus WCT RK and LW for double Mach reflection problem.
      </surround>|<pageref|auto-112>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.1>|>
        Subcells used by lower order scheme for degree
        <with|mode|<quote|math>|N=4>.
      </surround>|<pageref|auto-119>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.2>|>
        Logistic function used to map energy to a smoothness coefficient
        <with|mode|<quote|math>|\<alpha\>\<in\><around|[|0,1|]>>.
      </surround>|<pageref|auto-121>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.3>|>
        Comparing TVB and blending schemes on Shu-Osher test.
      </surround>|<pageref|auto-130>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.4>|>
        Comparing TVB and blending schemes on blast wave.
      </surround>|<pageref|auto-132>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.5>|>
        Sedov's blast wave problem
      </surround>|<pageref|auto-134>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.6>|>
        Double rarefaction problem with LW-MH.
      </surround>|<pageref|auto-136>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.7>|>
        Leblanc's test with LW-MH.
      </surround>|<pageref|auto-137>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.8>|>
        TVB and blending schemes compared on composite signal.
      </surround>|<pageref|auto-139>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.9>|>
        Isentropic convergence with blending limiter.
      </surround>|<pageref|auto-142>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.10>|>
        LW-MH on 2-D Riemann problem.
      </surround>|<pageref|auto-144>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.11>|>
        Blending coefficient <with|mode|<quote|math>|\<alpha\>> for 2-D
        Riemann problem.
      </surround>|<pageref|auto-145>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.12>|>
        2-D Riemann problem, percentage of elements with blending coefficient
        <with|mode|<quote|math>|\<alpha\>\<gtr\>0> vs
        <with|mode|<quote|math>|t>.
      </surround>|<pageref|auto-146>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.13>|>
        Double Mach reflection with LW-MH.
      </surround>|<pageref|auto-148>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.14>|>
        Kelvin-Helmholtz instability with LW-MH.
      </surround>|<pageref|auto-150>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.15>|>
        Mach 2000 astrophysical jet with LW-MH.
      </surround>|<pageref|auto-152>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.16>|>
        Sedov's blast with periodic domain, reference solution.
      </surround>|<pageref|auto-154>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.17>|>
        Sedov's blast with periodic domain, LW-MH.
      </surround>|<pageref|auto-155>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.18>|>
        Shock diffraction test with LW-MH.
      </surround>|<pageref|auto-157>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.19>|>
        Forward facing step with LW-MH.
      </surround>|<pageref|auto-159>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5.20>|>
        Forward facing step, percentage of elements with blending coefficient
        <with|mode|<quote|math>|\<alpha\>\<gtr\>0> vs
        <with|mode|<quote|math>|t>.
      </surround>|<pageref|auto-160>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.1>|>
        Convergence of ten moment problem with sources.
      </surround>|<pageref|auto-172>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.2>|>
        Ten moment problem, Sod and two rarefaction tests.
      </surround>|<pageref|auto-174>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.3>|>
        Ten moment Shu-Osher problem.
      </surround>|<pageref|auto-176>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.4>|>
        Two rarefactions with source terms
      </surround>|<pageref|auto-178>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.5>|>
        Ten moment 2-D near vacuum test.
      </surround>|<pageref|auto-180>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.6>|>
        Uniform plasma with Gaussian source.
      </surround>|<pageref|auto-182>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.7>|>
        Ten moment, realistic simulation.
      </surround>|<pageref|auto-184>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.1>|>
        Convergence for constant advection, MDRK and RK.
      </surround>|<pageref|auto-203>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.2>|>
        Convergence for variable advection with
        <with|mode|<quote|math>|a<around*|(|x|)>=x<rsup|2>>, MDRK and RK.
      </surround>|<pageref|auto-205>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.3>|>
        1-D Burgers' equation, <with|font-series|<quote|bold>|AE> and
        <with|font-series|<quote|bold>|EA> schemes, MDRK and RK.
      </surround>|<pageref|auto-207>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.4>|>
        MDRK D1 and D2 dissipation for 1-D Burgers' equation.
      </surround>|<pageref|auto-208>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.5>|>
        Blast wave, comparing TVB and blending schemes for MDRK.
      </surround>|<pageref|auto-211>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.6>|>
        Titarev-Toro problem, comparing blending schemes for MDRK.
      </surround>|<pageref|auto-213>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.7>|>
        High density problem, comparing blending schemes for MDRK.
      </surround>|<pageref|auto-215>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.8>|>
        Sedov's blast wave problem, comparing TVB and blending schemes for
        MDRK.
      </surround>|<pageref|auto-217>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.9>|>
        Double Mach reflection problem, MDRK.
      </surround>|<pageref|auto-220>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.10>|>
        Rotational low density problem at critical speed.
      </surround>|<pageref|auto-222>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.11>|>
        Rotational low density problem at various speeds.
      </surround>|<pageref|auto-223>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.12>|>
        2-D Riemann problem, MDRK.
      </surround>|<pageref|auto-225>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.13>|>
        Rayleigh-Taylor instability.
      </surround>|<pageref|auto-227>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.1>|>
        Illustration of curvilinear reference map.
      </surround>|<pageref|auto-234>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8.2>||Subcells in a
      curved FR element>|<pageref|auto-240>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.3>|>
        AMR illustration(a) hanging nodes, (b) refinement & coarsening
      </surround>|<pageref|auto-247>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.4>|>
        AMR illustration (a) Prolongation, (b) Projection.
      </surround>|<pageref|auto-252>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.5>|>
        Mach 2000 astrophysical jet with adaptive time stepping.
      </surround>|<pageref|auto-262>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.6>|>
        Kelvin-Helmholtz instability, adaptive mesh and time stepping.
      </surround>|<pageref|auto-264>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.7>|>
        Double Mach reflection, adaptive mesh and time stepping.
      </surround>|<pageref|auto-266>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.8>|>
        Forward facing step, adaptive non-Cartesian mesh and adaptive time
        stepping.
      </surround>|<pageref|auto-268>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.9>|>
        Free stream solutions.
      </surround>|<pageref|auto-271>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.10>|>
        Isentropic vortex on curvilinear mesh.
      </surround>|<pageref|auto-273>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.11>|>
        Supersonic flow over cylinder, adaptive mesh and time stepping.
      </surround>|<pageref|auto-275>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.12>|>
        Mach 4 flow over blunt body, adaptive mesh and time stepping.
      </surround>|<pageref|auto-277>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.13>|>
        Adaptively refined NACA0012 airfoil mesh.
      </surround>|<pageref|auto-279>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|8.14>|>
        Transonic flow over airfoil, adaptive mesh and time stepping.
      </surround>|<pageref|auto-280>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|9.1>||Errikson-Johnson
      test (a) Initial condition (b) Numerical solution at
      <with|mode|<quote|math>|t=1>>|<pageref|auto-294>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.2>|>
        Navier-Stokes equations with manufactured exact solution.
      </surround>|<pageref|auto-295>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.3>|>
        Convergence analysis for scalar advection-diffusion equation.
      </surround>|<pageref|auto-296>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.4>|>
        Convergence analysis for non-periodic advection-diffusion.
      </surround>|<pageref|auto-297>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|9.5>||Lid driven
      cavity, <with|mode|<quote|math>|x>-velocity pseudocolor plot and
      velocity vectors.>|<pageref|auto-299>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.6>|>
        Velocity profiles of lid driven cavity test.
      </surround>|<pageref|auto-300>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.7>|>
        Mach number plot for transonic flow over an airfoil.
      </surround>|<pageref|auto-302>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.8>|>
        <with|mode|<quote|math>|C<rsub|p>,C<rsub|f>> for transonic flow over
        airfoil.
      </surround>|<pageref|auto-303>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.9>|>
        Vorticity profile of Von Karman vortex street.
      </surround>|<pageref|auto-306>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.10>|>
        <with|mode|<quote|math>|c<rsub|l>,c<rsub|d>> for Von Karman vortex
        street.
      </surround>|<pageref|auto-307>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|A.1>|>
        Error growth of LW-D1, LW-D2 and ADER schemes.
      </surround>|<pageref|auto-317>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|D.1>|>
        Cache blocking flux differentiation.
      </surround>|<pageref|auto-329>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.1>||Non-uniform,
      non-cell-centered finite volume grid>|<pageref|auto-335>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.2>||Two
      non-interacting Riemann problems>|<pageref|auto-338>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.3>||Finite volume
      evolution>|<pageref|auto-339>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|G.4>||Two
      non-interacting Riemann problems>|<pageref|auto-340>>
    </associate>
    <\associate|parts>
      <tuple|title_page.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|prelim_pages.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|declaration.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|acknowledgements.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|publications.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|abstract.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|ch0_introduction.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|ch1_hyperbolic_conservation_laws.tm|chapter-nr|1|section-nr|5|subsection-nr|0>

      <tuple|ch1b_finite_volume_method.tm|chapter-nr|2|section-nr|3|subsection-nr|0>

      <tuple|ch2_lax_wendroff_flux_reconstruction.tm|chapter-nr|3|section-nr|4|subsection-nr|0>

      <tuple|ch3_blending_limiter.tm|chapter-nr|4|section-nr|12|subsection-nr|0>

      <tuple|ch5_10_moment_problem.tm|chapter-nr|5|section-nr|10|subsection-nr|0>

      <tuple|ch4_mdrk.tm|chapter-nr|6|section-nr|5|subsection-nr|0>

      <tuple|ch6_curved_meshes.tm|chapter-nr|7|section-nr|6|subsection-nr|0>

      <tuple|ch_parabolic.tm|chapter-nr|8|section-nr|8|subsection-nr|0>

      <tuple|conclusion.tm|chapter-nr|9|section-nr|5|subsection-nr|0>

      <tuple|appendix.tm|chapter-nr|10|section-nr|1|subsection-nr|0>

      <tuple|bibliography.tm|chapter-nr|10|section-nr|0|subsection-nr|3>
    </associate>
    <\associate|table>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.1>|>
        CFL numbers for 1-D LWFR
      </surround>|<pageref|auto-42>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4.2>|>
        Two dimensional CFL numbers for LWFR scheme.
      </surround>|<pageref|auto-93>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7.1>||CFL numbers for
      MDRK scheme.>|<pageref|auto-198>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8.1>||Number of time
      steps comparing error and CFL based methods>|<pageref|auto-282>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.1>|>
        Transonic flow over an airfoil compared with data from Swanson,
        Langer (2016).
      </surround>|<pageref|auto-304>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9.2>|>
        <with|mode|<quote|math>|c<rsub|l>,c<rsub|d>,St> for Von Karman vortex
        street.
      </surround>|<pageref|auto-308>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|List
      of publications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|List
      of figures> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|List
      of tables> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|1.<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-6><vspace|0.5fn>

      1.1.<space|2spc>Lax-Wendroff <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      1.2.<space|2spc>Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      1.3.<space|2spc>Shock capturing and admissibility preservation of FR
      schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      1.4.<space|2spc>Contributions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      1.5.<space|2spc>Outline <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|2.<space|2spc>Equations
      of motion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-12><vspace|0.5fn>

      2.1.<space|2spc>Hyperbolic conservation laws
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      <with|par-left|<quote|1tab>|2.1.1.<space|2spc>Weak formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|2.1.2.<space|2spc>Entropy condition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|1tab>|2.1.3.<space|2spc>The Riemann problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      2.2.<space|2spc>Compressible Euler's equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      2.3.<space|2spc>Compressible Navier-Stokes equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|3.<space|2spc>Flux
      Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-21><vspace|0.5fn>

      3.1.<space|2spc>Conservation law <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      3.2.<space|2spc>Finite volume method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      3.3.<space|2spc>Runge-Kutta DG <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      3.4.<space|2spc>Runge-Kutta FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|4.<space|2spc>Lax-Wendroff
      Flux Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-27><vspace|0.5fn>

      4.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      4.2.<space|2spc>Lax-Wendroff FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      <with|par-left|<quote|1tab>|4.2.1.<space|2spc>Conservation property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>>

      <with|par-left|<quote|1tab>|4.2.2.<space|2spc>Reconstruction of the
      time average flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>>

      <with|par-left|<quote|1tab>|4.2.3.<space|2spc>Direct flux
      reconstruction (DFR) scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>>

      <with|par-left|<quote|1tab>|4.2.4.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>>

      <with|par-left|<quote|2tab>|4.2.4.1.<space|2spc>Second order scheme,
      <with|mode|<quote|math>|N=1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>>

      <with|par-left|<quote|2tab>|4.2.4.2.<space|2spc>Third order scheme,
      <with|mode|<quote|math>|N=2> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>>

      <with|par-left|<quote|2tab>|4.2.4.3.<space|2spc>Fourth order scheme,
      <with|mode|<quote|math>|N=3> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|2tab>|4.2.4.4.<space|2spc>Fifth order scheme,
      <with|mode|<quote|math>|N=4> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>>

      4.3.<space|2spc>Numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      <with|par-left|<quote|1tab>|4.3.1.<space|2spc>Numerical flux \U average
      and extrapolate to face (<with|font-series|<quote|bold>|AE>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>>

      <with|par-left|<quote|1tab>|4.3.2.<space|2spc>Numerical flux \U
      extrapolate to face and average (<with|font-series|<quote|bold>|EA>)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>>

      4.4.<space|2spc>Fourier stability analysis in 1-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>

      4.5.<space|2spc>Boundary conditions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>

      4.6.<space|2spc>TVD limiter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      4.7.<space|2spc>Numerical results in 1-D: scalar problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      <with|par-left|<quote|1tab>|4.7.1.<space|2spc>Linear advection
      equation: constant speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>>

      <with|par-left|<quote|2tab>|4.7.1.1.<space|2spc>Smooth solutions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>>

      <with|par-left|<quote|2tab>|4.7.1.2.<space|2spc>Non-smooth solutions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>>

      <with|par-left|<quote|1tab>|4.7.2.<space|2spc>Linear equation with
      variable coefficient <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-62>>

      <with|par-left|<quote|1tab>|4.7.3.<space|2spc>Inviscid Burgers'
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-66>>

      <with|par-left|<quote|1tab>|4.7.4.<space|2spc>Non-convex problem:
      Buckley-Leverett equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-70>>

      4.8.<space|2spc>Numerical results in 1-D: Euler equations
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-72>

      <with|par-left|<quote|1tab>|4.8.1.<space|2spc>Smooth solution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-73>>

      <with|par-left|<quote|1tab>|4.8.2.<space|2spc>Sod's shock tube problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-75>>

      <with|par-left|<quote|1tab>|4.8.3.<space|2spc>Lax problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-77>>

      <with|par-left|<quote|1tab>|4.8.4.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-79>>

      <with|par-left|<quote|1tab>|4.8.5.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-81>>

      <with|par-left|<quote|1tab>|4.8.6.<space|2spc>Numerical fluxes: LF,
      Roe, HLL and HLLC <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-83>>

      <with|par-left|<quote|1tab>|4.8.7.<space|2spc>Comparison of correction
      functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-86>>

      4.9.<space|2spc>Two dimensional scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-89>

      <with|par-left|<quote|1tab>|4.9.1.<space|2spc>Fourier analysis in 2-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-90>>

      4.10.<space|2spc>Numerical results in 2D: scalar problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-94>

      <with|par-left|<quote|1tab>|4.10.1.<space|2spc>Advection of a smooth
      signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-95>>

      <with|par-left|<quote|1tab>|4.10.2.<space|2spc>Rotation of a composite
      signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-97>>

      <with|par-left|<quote|1tab>|4.10.3.<space|2spc>Inviscid Burgers'
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-101>>

      4.11.<space|2spc>Numerical results in 2-D: Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-104>

      <with|par-left|<quote|1tab>|4.11.1.<space|2spc>Isentropic vortex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-105>>

      <with|par-left|<quote|1tab>|4.11.2.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-109>>

      4.12.<space|2spc>Summary <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-113>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|5.<space|2spc>Admissibility
      preserving subcell based blending limiter>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-114><vspace|0.5fn>

      5.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-115>

      5.2.<space|2spc>Admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-116>

      5.3.<space|2spc>On controlling oscillations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-117>

      <with|par-left|<quote|1tab>|5.3.1.<space|2spc>Blending scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-118>>

      <with|par-left|<quote|1tab>|5.3.2.<space|2spc>Smoothness indicator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-120>>

      <with|par-left|<quote|1tab>|5.3.3.<space|2spc>First order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-122>>

      5.4.<space|2spc>Higher order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-123>

      <with|par-left|<quote|1tab>|5.4.1.<space|2spc>Slope limiting in
      practice <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-124>>

      5.5.<space|2spc>Flux limiter for admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-125>

      5.6.<space|2spc>Some implementation details
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-126>

      5.7.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-127>

      <with|par-left|<quote|1tab>|5.7.1.<space|2spc>1-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-128>>

      <with|par-left|<quote|2tab>|5.7.1.1.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-129>>

      <with|par-left|<quote|2tab>|5.7.1.2.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-131>>

      <with|par-left|<quote|2tab>|5.7.1.3.<space|2spc>Sedov's blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-133>>

      <with|par-left|<quote|2tab>|5.7.1.4.<space|2spc>Riemann problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-135>>

      5.8.<space|2spc>2-D advection equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-138>

      5.9.<space|2spc>2-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-140>

      <with|par-left|<quote|1tab>|5.9.1.<space|2spc>Isentropic vortex
      convergence test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-141>>

      <with|par-left|<quote|1tab>|5.9.2.<space|2spc>2-D Riemann problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-143>>

      <with|par-left|<quote|1tab>|5.9.3.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-147>>

      <with|par-left|<quote|1tab>|5.9.4.<space|2spc>Kelvin-Helmholtz
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-149>>

      <with|par-left|<quote|1tab>|5.9.5.<space|2spc>Astrophysical jet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-151>>

      <with|par-left|<quote|1tab>|5.9.6.<space|2spc>Sedov's blast case with
      periodic boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-153>>

      <with|par-left|<quote|1tab>|5.9.7.<space|2spc>Detonation shock
      diffraction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-156>>

      <with|par-left|<quote|1tab>|5.9.8.<space|2spc>Forward facing step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-158>>

      5.10.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-161>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|6.<space|2spc>Generalized
      admissibility preservation with source terms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-162><vspace|0.5fn>

      6.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-163>

      6.2.<space|2spc>LWFR for source terms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-164>

      <with|par-left|<quote|1tab>|6.2.1.<space|2spc>Approximate Lax-Wendroff
      procedure for degree <with|mode|<quote|math>|N=2>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-165>>

      <with|par-left|<quote|1tab>|6.2.2.<space|2spc>Admissibility
      preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-166>>

      6.3.<space|2spc>Limiting time averages
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-167>

      <with|par-left|<quote|1tab>|6.3.1.<space|2spc>Limiting time average
      flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-168>>

      <with|par-left|<quote|1tab>|6.3.2.<space|2spc>Limiting time average
      sources <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-169>>

      6.4.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-170>

      <with|par-left|<quote|1tab>|6.4.1.<space|2spc>Convergence test
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-171>>

      <with|par-left|<quote|1tab>|6.4.2.<space|2spc>Riemann problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-173>>

      <with|par-left|<quote|1tab>|6.4.3.<space|2spc>Shu-Osher test
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-175>>

      <with|par-left|<quote|1tab>|6.4.4.<space|2spc>Two rarefactions with
      source terms <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-177>>

      <with|par-left|<quote|1tab>|6.4.5.<space|2spc>Two dimensional near
      vacuum test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-179>>

      <with|par-left|<quote|1tab>|6.4.6.<space|2spc>Uniform plasma state with
      Gaussian source <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-181>>

      <with|par-left|<quote|1tab>|6.4.7.<space|2spc>Realistic simulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-183>>

      6.5.<space|2spc>Summary and Conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-185>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|7.<space|2spc>Multi-derivative
      Runge-Kutta> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-186><vspace|0.5fn>

      7.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-187>

      7.2.<space|2spc>Multi-derivative Runge-Kutta FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-188>

      <with|par-left|<quote|1tab>|7.2.1.<space|2spc>Conservation property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-189>>

      <with|par-left|<quote|1tab>|7.2.2.<space|2spc>Reconstruction of the
      time average flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-190>>

      <with|par-left|<quote|1tab>|7.2.3.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-191>>

      <with|par-left|<quote|1tab>|7.2.4.<space|2spc>Numerical flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-192>>

      <with|par-left|<quote|1tab>|7.2.5.<space|2spc>Numerical flux \U average
      and extrapolate to face (AE) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-193>>

      <with|par-left|<quote|1tab>|7.2.6.<space|2spc>Numerical flux \U
      extrapolate to face and average (EA)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-194>>

      7.3.<space|2spc>Fourier stability analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-195>

      <with|par-left|<quote|1tab>|7.3.1.<space|2spc>Stage 1
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-196>>

      <with|par-left|<quote|1tab>|7.3.2.<space|2spc>Stage 2
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-197>>

      7.4.<space|2spc>Blending scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-199>

      7.5.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-200>

      <with|par-left|<quote|1tab>|7.5.1.<space|2spc>Scalar equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-201>>

      <with|par-left|<quote|2tab>|7.5.1.1.<space|2spc>Linear advection
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-202>>

      <with|par-left|<quote|2tab>|7.5.1.2.<space|2spc>Variable advection
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-204>>

      <with|par-left|<quote|2tab>|7.5.1.3.<space|2spc>Burgers' equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-206>>

      <with|par-left|<quote|1tab>|7.5.2.<space|2spc>1-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-209>>

      <with|par-left|<quote|2tab>|7.5.2.1.<space|2spc>Blast
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-210>>

      <with|par-left|<quote|2tab>|7.5.2.2.<space|2spc>Titarev Toro
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-212>>

      <with|par-left|<quote|2tab>|7.5.2.3.<space|2spc>Large density ratio
      Riemann problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-214>>

      <with|par-left|<quote|2tab>|7.5.2.4.<space|2spc>Sedov's blast
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-216>>

      <with|par-left|<quote|1tab>|7.5.3.<space|2spc>2-D Euler's equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-218>>

      <with|par-left|<quote|2tab>|7.5.3.1.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-219>>

      <with|par-left|<quote|2tab>|7.5.3.2.<space|2spc>Rotational low density
      problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-221>>

      <with|par-left|<quote|2tab>|7.5.3.3.<space|2spc>Two Dimensional Riemann
      problem <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-224>>

      <with|par-left|<quote|2tab>|7.5.3.4.<space|2spc>Rayleigh-Taylor
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-226>>

      7.6.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-228>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|8.<space|2spc>Curvilinear
      grids> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-229><vspace|0.5fn>

      8.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-230>

      8.2.<space|2spc>Conservation laws and curvilinear grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-231>

      8.3.<space|2spc>LWFR on curvilinear grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-232>

      <with|par-left|<quote|1tab>|8.3.1.<space|2spc>Flux Reconstruction (FR)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-233>>

      <with|par-left|<quote|1tab>|8.3.2.<space|2spc>Lax-Wendroff Flux
      Reconstruction (LWFR) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-235>>

      <with|par-left|<quote|1tab>|8.3.3.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-236>>

      <with|par-left|<quote|1tab>|8.3.4.<space|2spc>Free stream preservation
      for LWFR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-237>>

      8.4.<space|2spc>Shock capturing and admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-238>

      <with|par-left|<quote|1tab>|8.4.1.<space|2spc>Low order scheme for
      curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-239>>

      <with|par-left|<quote|1tab>|8.4.2.<space|2spc>Smoothness indicator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-241>>

      <with|par-left|<quote|1tab>|8.4.3.<space|2spc>Flux limiter for
      admissibility preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-242>>

      <with|par-left|<quote|2tab>|8.4.3.1.<space|2spc>Flux limiter for
      admissibility preservation in 1-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-243>>

      <with|par-left|<quote|2tab>|8.4.3.2.<space|2spc>Flux limiter for
      admissibility preservation on curved meshes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-244>>

      8.5.<space|2spc>Adaptive mesh refinement
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-245>

      <with|par-left|<quote|1tab>|8.5.1.<space|2spc>Solution transfer between
      element and subelements <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-246>>

      <with|par-left|<quote|2tab>|8.5.1.1.<space|2spc>Interpolation for
      refinement <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-248>>

      <with|par-left|<quote|2tab>|8.5.1.2.<space|2spc>Projection for
      coarsening <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-249>>

      <with|par-left|<quote|1tab>|8.5.2.<space|2spc>Mortar element method
      (MEM) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-250>>

      <with|par-left|<quote|2tab>|8.5.2.1.<space|2spc>Motivation and notation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-251>>

      <with|par-left|<quote|2tab>|8.5.2.2.<space|2spc>Prolongation to mortars
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-253>>

      <with|par-left|<quote|2tab>|8.5.2.3.<space|2spc>Projection of numerical
      fluxes from mortars to faces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-254>>

      <with|par-left|<quote|1tab>|8.5.3.<space|2spc>AMR indicators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-255>>

      8.6.<space|2spc>Time stepping <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-256>

      <with|par-left|<quote|1tab>|8.6.1.<space|2spc>Error estimation for
      Runge-Kutta schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-257>>

      <with|par-left|<quote|1tab>|8.6.2.<space|2spc>Error based time stepping
      for Lax-Wendroff flux reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-258>>

      8.7.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-259>

      <with|par-left|<quote|1tab>|8.7.1.<space|2spc>Results on Cartesian
      grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-260>>

      <with|par-left|<quote|2tab>|8.7.1.1.<space|2spc>Mach 2000 astrophysical
      jet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-261>>

      <with|par-left|<quote|2tab>|8.7.1.2.<space|2spc>Kelvin-Helmholtz
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-263>>

      <with|par-left|<quote|2tab>|8.7.1.3.<space|2spc>Double mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-265>>

      <with|par-left|<quote|2tab>|8.7.1.4.<space|2spc>Forward facing step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-267>>

      <with|par-left|<quote|1tab>|8.7.2.<space|2spc>Results on curved grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-269>>

      <with|par-left|<quote|2tab>|8.7.2.1.<space|2spc>Free stream
      preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-270>>

      <with|par-left|<quote|2tab>|8.7.2.2.<space|2spc>Isentropic vortex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-272>>

      <with|par-left|<quote|2tab>|8.7.2.3.<space|2spc>Supersonic flow over
      cylinder <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-274>>

      <with|par-left|<quote|2tab>|8.7.2.4.<space|2spc>Inviscid bow shock
      upstream of a blunt body <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-276>>

      <with|par-left|<quote|2tab>|8.7.2.5.<space|2spc>Transonic flow over
      NACA0012 airfoil <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-278>>

      <with|par-left|<quote|1tab>|8.7.3.<space|2spc>Performance comparison of
      time stepping schemes <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-281>>

      8.8.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-283>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|9.<space|2spc>Parabolic
      equations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-284><vspace|0.5fn>

      9.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-285>

      9.2.<space|2spc>Curvilinear coordinates for parabolic equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-286>

      9.3.<space|2spc>Lax-Wendroff flux reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-287>

      <with|par-left|<quote|1tab>|9.3.1.<space|2spc>Solving for \<b-q\>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-288>>

      <with|par-left|<quote|1tab>|9.3.2.<space|2spc>Time averaging
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-289>>

      <with|par-left|<quote|2tab>|9.3.2.1.<space|2spc>Approximate
      Lax-Wendroff procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-290>>

      <with|par-left|<quote|1tab>|9.3.3.<space|2spc>Free stream preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-291>>

      9.4.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-292>

      <with|par-left|<quote|1tab>|9.4.1.<space|2spc>Convergence test
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-293>>

      <with|par-left|<quote|1tab>|9.4.2.<space|2spc>Lid driven cavity
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-298>>

      <with|par-left|<quote|1tab>|9.4.3.<space|2spc>Transonic flow past
      NACA-0012 airfoil <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-301>>

      <with|par-left|<quote|1tab>|9.4.4.<space|2spc>Flow past a cylinder
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-305>>

      9.5.<space|2spc>Summary and Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-309>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|10.<space|2spc>Conclusions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-310><vspace|0.5fn>

      10.1.<space|2spc>Future scope <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-311>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      A.<space|2spc>ADER-FR and LWFR for linear problems>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-312><vspace|0.5fn>

      A.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-313>

      A.2.<space|2spc>ADER Discontinuous Galerkin and Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-314>

      A.3.<space|2spc>Equivalence <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-315>

      A.4.<space|2spc>Numerical validation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-316>

      A.5.<space|2spc>Conclusions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-318>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      B.<space|2spc>Some numerical fluxes>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-319><vspace|0.5fn>

      B.1.<space|2spc>Rusanov flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-320>

      B.2.<space|2spc>Roe flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-321>

      B.3.<space|2spc>HLL flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-322>

      B.4.<space|2spc>HLLC flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-323>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      C.<space|2spc>Equivalence of DG and FR>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-324><vspace|0.5fn>

      C.1.<space|2spc>Discontinuous Galerkin on curvilinear grids
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-325>

      C.2.<space|2spc>Equivalence with Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-326>

      <with|par-left|<quote|1tab>|C.2.1.<space|2spc>Corrector function
      identitites <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-327>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      D.<space|2spc>Efficient local differential operators>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-328><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      E.<space|2spc>Equivalence with DFR>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-330><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      F.<space|2spc>Scaling limiter> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-331><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      G.<space|2spc>Admissibility of MUSCL-Hancock on general grids>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-332><vspace|0.5fn>

      G.1.<space|2spc>Introduction and notations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-333>

      G.2.<space|2spc>Review of MUSCL-Hancock scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-334>

      G.3.<space|2spc>Primary generalization for proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-336>

      G.4.<space|2spc>Proving admissibility
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-337>

      G.5.<space|2spc>Non-conservation reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-341>

      G.6.<space|2spc>MUSCL-Hancock scheme in 2-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-342>

      <with|par-left|<quote|1tab>|G.6.1.<space|2spc>First evolution step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-343>>

      <with|par-left|<quote|1tab>|G.6.2.<space|2spc>Finite volume step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-344>>

      <with|par-left|<quote|1tab>|G.6.3.<space|2spc>Limiting numerical flux
      in 2-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-345>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      H.<space|2spc>Formal accuracy of multiderivative RK>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-346><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-347><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>