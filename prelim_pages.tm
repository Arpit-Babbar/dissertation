<TeXmacs|2.1.4>

<project|main.tm>

<style|<tuple|tmbook|preview-ref|comment|style_common>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <include|acknowledgements.tm>

  <assign|list-fig|0>

  <assign|glossary-1|<macro|left|right|Figure
  <assign|list-fig|<plus|<value|list-fig>|1>><value|list-fig>.
  <arg|left><glossary-dots><arg|right>>>

  <\list-of-figures|figure>
    <glossary-1|<\surround|<hidden-binding|<tuple>|2.1>|>
      Solution structure for the Riemann problem of a system of conservation
      laws.
    </surround>|<pageref|auto-12>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|2.2>|>
      Characteristic lines for simple waves forming the solution to a Riemann
      problem.
    </surround>|<pageref|auto-13>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|3.1>|>
      Piecewise solutions and flux polynomials
    </surround>|<pageref|auto-18>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.1>|>
      Error convergence for constant linear advection comparing Radau and
      <with|mode|math|g<rsub|2>> correction.
    </surround>|<pageref|auto-43>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.2>|>
      Error convergence for constant linear advection comparing LWFR and RKFR
    </surround>|<pageref|auto-44>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.3>|>
      Error growth for constant linear advection equation.
    </surround>|<pageref|auto-45>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.4>|>
      <with|mode|math|L<rsub|2>> norm growth for constant linear advection
      equation.
    </surround>|<pageref|auto-46>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.5>|>
      Convergence for constant linear advection with Dirichlet boundary
      conditions
    </surround>|<pageref|auto-47>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.6>|>
      <with|mode|math|L<rsub|2>> norm growth for constant linear advection
      with Dirichlet boundary conditions
    </surround>|<pageref|auto-48>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.7>|>
      Constant linear advection of a wave packet.
    </surround>|<pageref|auto-49>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.8>|>
      Error convergence for constant linear advection of a wave packet.
    </surround>|<pageref|auto-50>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.9>|>
      Constant linear advection of hat profile without limiter.
    </surround>|<pageref|auto-52>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.10>|>
      Constant linear advection of hat profile with TVB limiter.
    </surround>|<pageref|auto-53>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.11>|>
      Constant linear advection of hat profile using RK65 with TVB limiter.
    </surround>|<pageref|auto-54>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.12>|>
      Constant linear advection of a composite profile without limiter.
    </surround>|<pageref|auto-55>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.13>|>
      Constant linear advection of a composite profile with TVB limiter.
    </surround>|<pageref|auto-56>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.14>|>
      Error convergence for variable linear advection with
      <with|mode|math|a(x) = x>.
    </surround>|<pageref|auto-58>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.15>|>
      Error convergence for variable linear advection with
      <with|mode|math|a(x) = x<rsup|2>>.
    </surround>|<pageref|auto-59>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.16>|>
      Error growth for linear advection with wave speed <with|mode|math|a(x)
      = x<rsup|2>>
    </surround>|<pageref|auto-60>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.17>|>
      Solution of 1-D Burgers' equation.
    </surround>|<pageref|auto-62>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.18>|>
      Error convergence for 1-D Burgers' equation.
    </surround>|<pageref|auto-63>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.19>|>
      Error convergence for 1-D Burgers' equation comparing numerical fluxes.
    </surround>|<pageref|auto-64>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.20>|>
      Solution of Buckley-Leverett model.
    </surround>|<pageref|auto-66>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.21>|>
      Density error convergence for 1-D Euler's equation.
    </surround>|<pageref|auto-69>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.22>|>
      Numerical solutions of Sod's test case.
    </surround>|<pageref|auto-71>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.23>|>
      Numerical solutions of Lax's test case.
    </surround>|<pageref|auto-73>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.24>|>
      Numerical solutions of Shu-Osher problem.
    </surround>|<pageref|auto-75>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.25>|>
      Numerical solutions of blast wave.
    </surround>|<pageref|auto-77>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.26>|>
      Numerical solutions of Blast wave comparing different numerical fluxes.
    </surround>|<pageref|auto-79>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.27>|>
      Numerical solutions of 1-D Euler's equations with different numerical
      fluxes
    </surround>|<pageref|auto-80>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.28>|>
      Numerical solutions of Shu-Osher problem comparing Radau and
      <with|mode|math|g<rsub|2>> correction.
    </surround>|<pageref|auto-82>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.29>|>
      Solution and flux points on a 2-D FR element.
    </surround>|<pageref|auto-83>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.30>|>
      Stability region of 2-D LWFR with Radau correction and D2 dissipation.
    </surround>|<pageref|auto-86>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.31>|>
      Stability region of 2-D LWFR with the <with|mode|math|g<rsub|2>>
      correction and D2 dissipation.
    </surround>|<pageref|auto-87>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.32>|>
      Error convergence test for 2-D linear advection equation with velocity
      <with|mode|math|\<b-a\>=<around|(|1,1|)>>.
    </surround>|<pageref|auto-91>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.33>|>
      Linear advection with velocity <with|mode|math|\<b-a\>=<around|(|-y,x|)>>.
    </surround>|<pageref|auto-93>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.34>|>
      Error convergence test for 2-D linear advection equation with velocity
      <with|mode|math|\<b-a\>=<around|(|-y,x|)>>.
    </surround>|<pageref|auto-94>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.35>|>
      Numerical solutions of composite signal with velocity
      <with|mode|math|<with|font-series|bold|a>=<around*|(|<frac|1|2>-y,x-<frac|1|2>|)>>.
    </surround>|<pageref|auto-95>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.36>|>
      Line plot across the diagonal of the solution of 2-D Burger's equation.
    </surround>|<pageref|auto-97>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.37>|>
      Error convergence test for 2-D Burgers' equation.
    </surround>|<pageref|auto-98>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.38>|>
      <with|mode|math|L<rsup|2>> error, WCT for isentropic vortex versus grid
      resolution.
    </surround>|<pageref|auto-101>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.39>|>
      Wall Clock Time (WCT) versus <with|mode|math|L<rsup|2>> error for
      isentropic vortex.
    </surround>|<pageref|auto-102>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.40>|>
      Wall Clock Time (WCT) ratios versus grid resolution for isentropic
      vortex.
    </surround>|<pageref|auto-103>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.41>|>
      Density profile of numerical solutions of double Mach reflection
      problem.
    </surround>|<pageref|auto-105>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.42>|>
      Enlarged density contours of density double Mach reflection problem.
    </surround>|<pageref|auto-106>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.43>|>
      Grid size versus WCT RK and LW for double Mach reflection problem.
    </surround>|<pageref|auto-107>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.1>|>
      Subcells used by lower order scheme for degree <with|mode|math|N=4>.
    </surround>|<pageref|auto-114>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.2>|>
      Logistic function used to map energy to a smoothness coefficient
      <with|mode|math|\<alpha\>\<in\><around|[|0,1|]>>.
    </surround>|<pageref|auto-116>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.3>|>
      Comparing TVB and blending schemes on Shu-Osher test.
    </surround>|<pageref|auto-125>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.4>|>
      Zoomed plot comparing TVB and blending schemes on Shu-Osher test.
    </surround>|<pageref|auto-126>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.5>|>
      Comparing TVB and blending schemes on blast wave.
    </surround>|<pageref|auto-128>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.6>|>
      Sedov's blast wave problem
    </surround>|<pageref|auto-130>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.7>|>
      Double rarefaction problem with LW-MH.
    </surround>|<pageref|auto-132>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.8>|>
      Leblanc's test with LW-MH.
    </surround>|<pageref|auto-133>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.9>|>
      TVB and blending schemes compared on composite signal.
    </surround>|<pageref|auto-135>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.10>|>
      Isentropic convergence with blending limiter.
    </surround>|<pageref|auto-138>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.11>|>
      Double Mach reflection with LW-MH.
    </surround>|<pageref|auto-140>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.12>|>
      Double Mach reflection with LW-MH.
    </surround>|<pageref|auto-141>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.13>|>
      LW-MH on 2-D Riemann problem.
    </surround>|<pageref|auto-143>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.14>|>
      Blending coefficient <with|mode|math|\<alpha\>> for 2-D Riemann
      problem.
    </surround>|<pageref|auto-144>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.15>|>
      2-D Riemann problem, percentage of elements with blending coefficient
      <with|mode|math|\<alpha\>\<gtr\>0> vs <with|mode|math|t>.
    </surround>|<pageref|auto-145>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.16>|>
      Kelvin-Helmholtz instability with LW-MH.
    </surround>|<pageref|auto-147>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.17>|>
      Mach 2000 astrophysical jet with LW-MH.
    </surround>|<pageref|auto-149>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.18>|>
      Sedov's blast with periodic domain, reference solution.
    </surround>|<pageref|auto-151>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.19>|>
      Sedov's blast with periodic domain, LW-MH.
    </surround>|<pageref|auto-152>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.20>|>
      Shock diffraction test with LW-MH.
    </surround>|<pageref|auto-154>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.21>|>
      Forward facing step, percentage of elements with blending coefficient
      <with|mode|math|\<alpha\>\<gtr\>0> vs <with|mode|math|t>.
    </surround>|<pageref|auto-156>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|5.22>|>
      Forward facing step with LW-MH.
    </surround>|<pageref|auto-157>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.1>|>
      Convergence of ten moment problem with sources.
    </surround>|<pageref|auto-169>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.2>|>
      Ten moment problem, Sod and two rarefaction tests.
    </surround>|<pageref|auto-171>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.3>|>
      Ten moment Shu-Osher problem.
    </surround>|<pageref|auto-173>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.4>|>
      Two rarefactions with source terms
    </surround>|<pageref|auto-175>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.5>|>
      Ten moment 2-D near vacuum test.
    </surround>|<pageref|auto-177>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.6>|>
      Uniform plasma with Gaussian source.
    </surround>|<pageref|auto-179>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|6.7>|>
      Ten moment, realistic simulation.
    </surround>|<pageref|auto-181>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.1>|>
      Convergence for constant advection, MDRK and RK.
    </surround>|<pageref|auto-200>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.2>|>
      Convergence for variable advection with
      <with|mode|math|a<around*|(|x|)>=x<rsup|2>>, MDRK and RK.
    </surround>|<pageref|auto-202>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.3>|>
      1-D Burgers' equation, <with|font-series|bold|AE> and
      <with|font-series|bold|EA> schemes, MDRK and RK.
    </surround>|<pageref|auto-204>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.4>|>
      MDRK D1 and D2 dissipation for 1-D Burgers' equation.
    </surround>|<pageref|auto-205>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.5>|>
      Blast wave, comparing TVB and blending schemes for MDRK.
    </surround>|<pageref|auto-208>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.6>|>
      Titarev-Toro problem, comparing blending schemes for MDRK.
    </surround>|<pageref|auto-210>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.7>|>
      High density problem, comparing blending schemes for MDRK.
    </surround>|<pageref|auto-212>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.8>|>
      Sedov's blast wave problem, comparing TVB and blending schemes for
      MDRK.
    </surround>|<pageref|auto-214>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.9>|>
      Double Mach reflection problem, MDRK.
    </surround>|<pageref|auto-217>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.10>|>
      Rotational low density problem at critical speed.
    </surround>|<pageref|auto-219>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.11>|>
      Rotational low density problem at various speeds.
    </surround>|<pageref|auto-220>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.12>|>
      2-D Riemann problem, MDRK.
    </surround>|<pageref|auto-222>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.13>|>
      Rayleigh-Taylor instability.
    </surround>|<pageref|auto-224>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.1>|>
      Illustration of curvilinear reference map.
    </surround>|<pageref|auto-231>>

    <glossary-1|<surround|<hidden-binding|<tuple>|8.2>||Subcells in a curved
    FR element>|<pageref|auto-237>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.3>|>
      AMR illustration (a) hanging nodes, (b) refinement & coarsening
    </surround>|<pageref|auto-244>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.4>|>
      AMR illustration (a) Prolongation, (b) Projection.
    </surround>|<pageref|auto-249>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.5>|>
      Mach 2000 astrophysical jet with adaptive time stepping.
    </surround>|<pageref|auto-259>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.6>|>
      Kelvin-Helmholtz instability, adaptive mesh and time stepping.
    </surround>|<pageref|auto-261>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.7>|>
      Double Mach reflection, adaptive mesh and time stepping.
    </surround>|<pageref|auto-263>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.8>|>
      Forward facing step, adaptive non-Cartesian mesh and adaptive time
      stepping.
    </surround>|<pageref|auto-265>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.9>|>
      Free stream solutions.
    </surround>|<pageref|auto-268>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.10>|>
      Isentropic vortex on curvilinear mesh.
    </surround>|<pageref|auto-270>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.11>|>
      Supersonic flow over cylinder, adaptive mesh and time stepping.
    </surround>|<pageref|auto-272>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.12>|>
      Mach 4 flow over blunt body, adaptive mesh and time stepping.
    </surround>|<pageref|auto-274>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.13>|>
      Adaptively refined NACA0012 airfoil mesh.
    </surround>|<pageref|auto-276>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|8.14>|>
      Transonic flow over airfoil, adaptive mesh and time stepping.
    </surround>|<pageref|auto-277>>

    <glossary-1|<surround|<hidden-binding|<tuple>|9.1>||Errikson-Johnson test
    (a) Initial condition (b) Numerical solution at
    <with|mode|math|t=1>>|<pageref|auto-292>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.2>|>
      Navier-Stokes equations with manufactured exact solution.
    </surround>|<pageref|auto-293>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.3>|>
      Convergence analysis for scalar advection-diffusion equation.
    </surround>|<pageref|auto-294>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.4>|>
      Convergence analysis for non-periodic advection-diffusion.
    </surround>|<pageref|auto-295>>

    <glossary-1|<surround|<hidden-binding|<tuple>|9.5>||Lid driven cavity,
    <with|mode|math|x>-velocity pseudocolor plot and velocity
    vectors.>|<pageref|auto-297>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.6>|>
      Velocity profiles of lid driven cavity test.
    </surround>|<pageref|auto-298>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.7>|>
      Mach number plot for transonic flow over an airfoil.
    </surround>|<pageref|auto-300>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.8>|>
      <with|mode|math|C<rsub|p>,C<rsub|f>> for transonic flow over airfoil.
    </surround>|<pageref|auto-301>>

    <glossary-1|<surround|<hidden-binding|<tuple>|9.9>||Physical domain used
    in Von Karman street.>|<pageref|auto-304>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.10>|>
      Vorticity profile of Von Karman vortex street.
    </surround>|<pageref|auto-305>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.11>|>
      <with|mode|math|c<rsub|l>,c<rsub|d>> for Von Karman vortex street.
    </surround>|<pageref|auto-306>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|A.1>|>
      Error growth of LW-D1, LW-D2 and ADER schemes.
    </surround>|<pageref|auto-316>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|E.1>|>
      Cache blocking flux differentiation.
    </surround>|<pageref|auto-329>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.1>||Non-uniform,
    non-cell-centered finite volume grid>|<pageref|auto-334>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.2>||Two non-interacting
    Riemann problems>|<pageref|auto-337>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.3>||Finite volume
    evolution>|<pageref|auto-338>>

    <glossary-1|<surround|<hidden-binding|<tuple>|G.4>||Two non-interacting
    Riemann problems>|<pageref|auto-339>>
  </list-of-figures>

  <assign|list-fig|0><assign|list-fig|0><assign|glossary-1|<macro|left|right|Table
  <assign|list-fig|<plus|<value|list-fig>|1>><value|list-fig>.
  <arg|left><glossary-dots><arg|right>>>

  <\list-of-tables|table>
    <glossary-1|<\surround|<hidden-binding|<tuple>|4.1>|>
      CFL numbers for 1-D LWFR
    </surround>|<pageref|auto-37>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|4.2>|>
      Two dimensional CFL numbers for LWFR scheme.
    </surround>|<pageref|auto-88>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|7.1>|>
      CFL numbers for MDRK scheme.
    </surround>|<pageref|auto-195>>

    <glossary-1|<surround|<hidden-binding|<tuple>|8.1>||Number of time steps
    comparing error and CFL based methods>|<pageref|auto-279>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.1>|>
      Transonic flow over an airfoil compared with data from Swanson, Langer
      (2016).
    </surround>|<pageref|auto-302>>

    <glossary-1|<\surround|<hidden-binding|<tuple>|9.2>|>
      <with|mode|math|c<rsub|l>,c<rsub|d>,St> for Von Karman vortex street.
    </surround>|<pageref|auto-307>>
  </list-of-tables>
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|0>
    <associate|font-base-size|12>
    <associate|page-even|1in>
    <associate|page-first|ii>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|auto>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|part:acknowledgements.tm|<tuple|?|1>>
    <associate|part:declaration.tm|<tuple|?|0>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|parts>
      <tuple|declaration.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|acknowledgements.tm|chapter-nr|0|section-nr|0|subsection-nr|0>
    </associate>
  </collection>
</auxiliary>