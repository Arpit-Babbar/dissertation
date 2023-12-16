<TeXmacs|2.1.1>

<style|<tuple|tmbook|style_common>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <\center>
    <\with|font-base-size|18>
      <with|font|helvetica|font-series|bold|font-base-size|25|Lax-Wendroff
      Flux Reconstruction<new-line>for compressible flows>

      \;

      <with|font-series|bold|A Thesis><blanc-page>

      \;

      \;

      submitted to the

      <with|font-series|bold|Tata Institute of Fundamental Research, Mumbai>

      for the degree of <with|font-series|bold|Doctor of Philosophy>

      in <with|font-series|bold|Mathematics>

      \;

      \;

      by

      <with|font-series|bold|Arpit Babbar>

      \;

      \;

      <image|tifr-logo.png|0.3par|||>

      \;

      Centre for Applicable Mathematics

      Tata Institute of Fundamental Research

      Bangalore - 560065

      India

      \;

      \;

      \;

      \;

      <date|>
    </with>
  </center>

  \;

  <include|declaration_acknowledgements.tm>

  <include|acknowledgements.tm>

  <include|abstract.tm>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Acknowledgements>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|1.<space|2spc>conservation
    laws> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|2.<space|2spc>Finite
    volume method, Discontinuous Galerkin and Flux Reconstruction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-5><vspace|0.5fn>

    2.1.<space|2spc>Scalar conservation law
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>

    2.2.<space|2spc>Runge-Kutta FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|3.<space|2spc>Lax-Wendroff
    Flux Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-9><vspace|0.5fn>

    3.1.<space|2spc>Lax-Wendroff FR scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10>

    <with|par-left|1tab|3.1.1.<space|2spc>Conservation property
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|3.1.2.<space|2spc>Reconstruction of the time average
    flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|3.1.3.<space|2spc>Direct flux reconstruction (DFR)
    scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|3.1.4.<space|2spc>Approximate Lax-Wendroff procedure
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|2tab|3.1.4.1.<space|2spc>Second order scheme,
    <with|mode|math|N=1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-15>>

    <with|par-left|2tab|3.1.4.2.<space|2spc>Third order scheme,
    <with|mode|math|N=2> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <with|par-left|2tab|3.1.4.3.<space|2spc>Fourth order scheme,
    <with|mode|math|N=3> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17>>

    <with|par-left|2tab|3.1.4.4.<space|2spc>Fifth order scheme,
    <with|mode|math|N=4> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18>>

    3.2.<space|2spc>Numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>

    <with|par-left|1tab|3.2.1.<space|2spc>Numerical flux \U average and
    extrapolate to face (AE) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <with|par-left|1tab|3.2.2.<space|2spc>Numerical flux \U extrapolate to
    face and average (EA) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    3.3.<space|2spc>Fourier stability analysis in 1-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22>

    3.4.<space|2spc>TVD limiter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-24>

    3.5.<space|2spc>Numerical results in 1-D: scalar problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>

    <with|par-left|1tab|3.5.1.<space|2spc>Linear advection equation: constant
    speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-26>>

    <with|par-left|2tab|3.5.1.1.<space|2spc>Smooth solutions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <with|par-left|2tab|3.5.1.2.<space|2spc>Non-smooth solutions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-36>>

    <with|par-left|1tab|3.5.2.<space|2spc>Linear advection equation: variable
    speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-42>>

    <with|par-left|1tab|3.5.3.<space|2spc>Inviscid Burgers' equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-46>>

    <with|par-left|1tab|3.5.4.<space|2spc>Non-convex problem:
    Buckley-Leverett equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-50>>

    3.6.<space|2spc>Numerical results in 1-D: Euler equations
    \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-52>

    <with|par-left|1tab|3.6.1.<space|2spc>Smooth solution
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-53>>

    <with|par-left|1tab|3.6.2.<space|2spc>Sod's shock tube problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-55>>

    <with|par-left|1tab|3.6.3.<space|2spc>Lax problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-57>>

    <with|par-left|1tab|3.6.4.<space|2spc>Shu-Osher problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-59>>

    <with|par-left|1tab|3.6.5.<space|2spc>Blast wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-61>>

    <with|par-left|1tab|3.6.6.<space|2spc>Numerical fluxes: LF, Roe, HLL and
    HLLC <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-63>>

    <with|par-left|1tab|3.6.7.<space|2spc>Comparison of correction functions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-66>>

    3.7.<space|2spc>Two dimensional scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-69>

    3.8.<space|2spc>Numerical results in 2D: scalar problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-70>

    <with|par-left|1tab|3.8.1.<space|2spc>Advection of a smooth signal
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-71>>

    <with|par-left|1tab|3.8.2.<space|2spc>Rotation of a composite signal
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-73>>

    <with|par-left|1tab|3.8.3.<space|2spc>Inviscid Burgers' equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-77>>

    3.9.<space|2spc>Numerical results in 2-D: Euler equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-80>

    <with|par-left|1tab|3.9.1.<space|2spc>Isentropic vortex
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-81>>

    <with|par-left|1tab|3.9.2.<space|2spc>Double Mach reflection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-85>>

    3.10.<space|2spc>Summary and conclusions
    \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-89>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    A.<space|2spc>Numerical flux> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-90><vspace|0.5fn>

    A.1.<space|2spc>Some numerical fluxes
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-91>

    <with|par-left|1tab|A.1.1.<space|2spc>Rusanov flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-92>>

    <with|par-left|1tab|A.1.2.<space|2spc>Roe flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-93>>

    <with|par-left|1tab|A.1.3.<space|2spc>HLL flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-94>>

    <with|par-left|1tab|A.1.4.<space|2spc>HLLC flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-95>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    B.<space|2spc>Fourier stability analysis in 2-D>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-96><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    C.<space|2spc>equivalence with direct flux reconstruction (DFR)>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-100><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|4.<space|2spc>Admissibility
    preserving subcell based blending limiter for Lax-Wendroff Flux
    Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-101><vspace|0.5fn>

    4.1.<space|2spc>Lax-Wendroff FR scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-102>

    4.2.<space|2spc>On controlling oscillations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-103>

    <with|par-left|1tab|4.2.1.<space|2spc>TVD limiter
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-104>>

    <with|par-left|1tab|4.2.2.<space|2spc>Blending scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-105>>

    <with|par-left|1tab|4.2.3.<space|2spc>Smoothness indicator
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-107>>

    <with|par-left|1tab|4.2.4.<space|2spc>First order blending
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-109>>

    4.3.<space|2spc>Higher order blending
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-110>

    <with|par-left|1tab|Slope limiting in practice
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-111>>

    4.4.<space|2spc>Flux limiter for admissibility preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-112>

    4.5.<space|2spc>Some implementation details
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-113>

    4.6.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-114>

    <with|par-left|1tab|4.6.1.<space|2spc>1-D Euler equations
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-115>>

    <with|par-left|2tab|4.6.1.1.<space|2spc>Shu-Osher problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-116>>

    <with|par-left|2tab|4.6.1.2.<space|2spc>Blast wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-118>>

    <with|par-left|2tab|4.6.1.3.<space|2spc>Sedov's blast wave
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-120>>

    <with|par-left|2tab|4.6.1.4.<space|2spc>Riemann problems
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-122>>

    4.7.<space|2spc>2-D advection equation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-125>

    4.8.<space|2spc>2-D Euler equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-127>

    <with|par-left|1tab|4.8.1.<space|2spc>Isentropic vortex convergence test
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-128>>

    <with|par-left|1tab|4.8.2.<space|2spc>2-D Riemann problem
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-130>>

    <with|par-left|1tab|4.8.3.<space|2spc>Double Mach reflection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-132>>

    <with|par-left|1tab|4.8.4.<space|2spc>Kelvin-Helmholtz instability
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-134>>

    <with|par-left|1tab|4.8.5.<space|2spc>Astrophysical jet
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-136>>

    <with|par-left|1tab|4.8.6.<space|2spc>Sedov's blast case with periodic
    boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-138>>

    <with|par-left|1tab|4.8.7.<space|2spc>Detonation shock diffraction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-141>>

    <with|par-left|1tab|4.8.8.<space|2spc>Forward facing step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-143>>

    4.9.<space|2spc>Summary and conclusions
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-145>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Appendix
    D.<space|2spc>Admissibility of MUSCL-Hancock scheme for general grids>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-146><vspace|0.5fn>

    D.1.<space|2spc>Review of MUSCL-Hancock scheme
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-147>

    D.2.<space|2spc>Primary generalization for proof
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-149>

    D.3.<space|2spc>Proving admissibility
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-150>

    D.4.<space|2spc>Non-conservation reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-154>

    D.5.<space|2spc>MUSCL-Hancock scheme in 2-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-155>

    <with|par-left|1tab|D.5.1.<space|2spc>First evolution step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-156>>

    <with|par-left|1tab|D.5.2.<space|2spc>Finite volume step
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-157>>

    <with|par-left|1tab|D.5.3.<space|2spc>Limiting numerical flux in 2-D
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-158>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|5.<space|2spc>Multi-derivative
    Runge-Kutta schemes in Flux Reconstruction framework>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-159><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|6.<space|2spc>10
    Moment Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-160><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|7.<space|2spc>Lax-Wendroff
    Flux Reconstruction on curved geometries>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-161><vspace|0.5fn>

    7.1.<space|2spc>Transformation of conservation law
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-162>

    7.2.<space|2spc>Conservative Lax-Wendroff Flux Reconstruction (LWFR) on
    curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-166>

    <with|par-left|1tab|7.2.1.<space|2spc>Discontinuous Galerkin
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-167>>

    <with|par-left|1tab|7.2.2.<space|2spc>Flux Reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-168>>

    <with|par-left|1tab|7.2.3.<space|2spc>Lax-Wendroff Flux Reconstruction
    (LWFR) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-169>>

    <with|par-left|1tab|7.2.4.<space|2spc>Free stream preservation for LWFR
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-170>>

    <with|par-left|1tab|7.2.5.<space|2spc>Satisfying metric identities
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-171>>

    <with|par-left|2tab|7.2.5.1.<space|2spc>Evaluating metrics in two space
    dimensions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-172>>

    <with|par-left|2tab|7.2.5.2.<space|2spc>Evaluating metrics in three space
    dimensions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-173>>

    7.3.<space|2spc>Non-conservative Lax-Wendroff Flux Reconstruction (FR) on
    curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-174>

    <with|par-left|1tab|7.3.1.<space|2spc>Non-conservative Discontinuous
    Galerkin (DG) method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-175>>

    <with|par-left|1tab|7.3.2.<space|2spc>Flux Reconstruction
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-176>>

    <with|par-left|1tab|7.3.3.<space|2spc>Free stream preservation for
    Lax-Wendroff scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-177>>

    7.4.<space|2spc>Adaptive mesh refinement
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-178>

    <with|par-left|1tab|Refinement and coarsening
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-179>>

    <with|par-left|1tab|Projection for coarsening
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-181>>

    <with|par-left|1tab|Handling mortars <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-182>>

    <with|par-left|1tab|Prolongation to mortars
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-184>>

    <with|par-left|1tab|Calculation of mortar flux
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-185>>

    <with|par-left|1tab|Projection of numerical fluxes from mortars to faces
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-186>>

    <with|par-left|2tab|Conservation property
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-187>>

    <with|par-left|2tab|Upwind / outflow property
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-188>>

    <with|par-left|2tab|Free stream preservation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-189>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|font-shape|small-caps|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <pageref|auto-190><vspace|0.5fn>
  </table-of-contents>

  \;

  \;

  <include|ch0_introduction.tm>

  <include|ch1_hyperbolic_conservation_laws.tm>

  <include|ch1b_finite_volume_method.tm>

  <include|ch2_lax_wendroff_flux_reconstruction.tm>

  <include|ch3_blending_limiter.tm>

  <include|ch4_mdrk.tm>

  <include|ch5_10_moment_problem.tm>

  <include|ch6_curved_meshes.tm>

  <\bibliography|bib|tm-plain|references>
    <\bib-list|136>
      <bibitem*|1><label|bib-Abgrall2020>Rémi Abgrall, Elise<nbsp>le Mélédo,
      Philipp Öffner<localize|, and >Hendrik Ranocha. <newblock>Error
      boundedness of correction procedure via Reconstruction/Flux
      reconstruction and the connection to residual distribution schemes.
      <newblock><localize|In >Alberto Bressan, Marta Lewicka, Dehua
      Wang<localize|, and >Yuxi Zheng<localize|, editors>,
      <with|font-shape|italic|Hyperbolic problems: Theory, numerics,
      applications>, <localize|volume><nbsp>10<localize| of
      ><with|font-shape|italic|AIMS on applied mathematics>, <localize|pages
      >215\U222. Springfield, 2020. American Institute of Mathematical
      Sciences.<newblock>

      <bibitem*|2><label|bib-naca1951>Ames Resarch Staff - National Advisory
      Committee for Aeronautics. <newblock>Report 1135 - equations, tables
      and charts for compressible flow. <newblock>1951.<newblock>

      <bibitem*|3><label|bib-Asthana2015>Kartikey Asthana<localize| and
      >Antony Jameson. <newblock>High-Order Flux Reconstruction Schemes with
      Minimal Dispersion and Dissipation.
      <newblock><with|font-shape|italic|Journal of Scientific Computing>,
      62(3):913\U944, mar 2015. <newblock>Bibtex: Asthana2015.<newblock>

      <bibitem*|4><label|bib-attig2011>Norbert Attig, Paul Gibbon<localize|,
      and >Th Lippert. <newblock>Trends in supercomputing: the European path
      to exascale. <newblock><with|font-shape|italic|Computer Physics
      Communications>, 182(9):2041\U2046, 2011.<newblock>

      <bibitem*|5><label|bib-paperrepo>Arpit Babbar, Praveen
      Chandrashekar<localize|, and >Sudarshan<nbsp>Kumar Kenettinkara.
      <newblock>Admissibility preserving subcell based blending limiter with
      Tenkai.jl. <newblock><slink|https://github.com/Arpit-Babbar/jsc2023>,
      2023.<newblock>

      <bibitem*|6><label|bib-tenkai>Arpit Babbar, Praveen
      Chandrashekar<localize|, and >Sudarshan<nbsp>Kumar Kenettinkara.
      <newblock>Tenkai.jl: Temporal discretizations of high-order PDE
      solvers. <newblock><slink|https://github.com/Arpit-Babbar/Tenkai.jl>,
      2023.<newblock>

      <bibitem*|7><label|bib-babbar2022>Arpit Babbar, Sudarshan<nbsp>Kumar
      Kenettinkara<localize|, and >Praveen Chandrashekar.
      <newblock>Lax-wendroff flux reconstruction method for hyperbolic
      conservation laws. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, <localize|page >111423, 2022.<newblock>

      <bibitem*|8><label|bib-Balsara2007>D.<nbsp>Balsara, C.<nbsp>Altmann,
      C.D.<nbsp>Munz<localize|, and >M.<nbsp>Dumbser. <newblock>A sub-cell
      based indicator for troubled zones in RKDG schemes and a novel class of
      hybrid RKDG+HWENO schemes. <newblock><with|font-shape|italic|J. Comp.
      Phys.>, 226:586\U620, 2007.<newblock>

      <bibitem*|9><label|bib-Balsara2009a>Dinshaw<nbsp>S.<nbsp>Balsara,
      Tobias Rumpf, Michael Dumbser<localize|, and >Claus-Dieter Munz.
      <newblock>Efficient, high accuracy ADER-WENO schemes for hydrodynamics
      and divergence-free magnetohydrodynamics.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      228(7):2480\U2516, apr 2009.<newblock>

      <bibitem*|10><label|bib-Batten1997>P.<nbsp>Batten, N.<nbsp>Clarke,
      C.<nbsp>Lambert<localize|, and >D.<nbsp>M.<nbsp>Causon. <newblock>On
      the Choice of Wavespeeds for the HLLC Riemann Solver.
      <newblock><with|font-shape|italic|SIAM Journal on Scientific
      Computing>, 18(6):1553\U1570, nov 1997.<newblock>

      <bibitem*|11><label|bib-Artzi2006>Matania Ben-Artzi, Jiequan
      Li<localize|, and >Gerald Warnecke. <newblock>A direct Eulerian GRP
      scheme for compressible fluid flows.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      218(1):19\U43, oct 2006. <newblock>Bibtex: Artzi2006.<newblock>

      <bibitem*|12><label|bib-Berthon2006>Christophe Berthon. <newblock>Why
      the MUSCL\UHancock scheme is l1-stable.
      <newblock><with|font-shape|italic|Numerische Mathematik>,
      104(1):27\U46, jun 2006.<newblock>

      <bibitem*|13><label|bib-Bezanson2017>Jeff Bezanson, Alan Edelman,
      Stefan Karpinski<localize|, and >Viral<nbsp>B.<nbsp>Shah.
      <newblock>Julia: A Fresh Approach to Numerical Computing.
      <newblock><with|font-shape|italic|SIAM Review>, 59(1):65\U98, jan 2017.
      <newblock>Bibtex: Bezanson2017.<newblock>

      <bibitem*|14><label|bib-Biswas1994>Rupak Biswas,
      Karen<nbsp>D.<nbsp>Devine<localize|, and >Joseph<nbsp>E.<nbsp>Flaherty.
      <newblock>Parallel, adaptive finite element methods for conservation
      laws. <newblock><with|font-shape|italic|Applied Numerical Mathematics>,
      14(1):255\U283, 1994.<newblock>

      <bibitem*|15><label|bib-Burbeau2001>A.<nbsp>Burbeau,
      P.<nbsp>Sagaut<localize|, and >Ch.-H.<nbsp>Bruneau. <newblock>A
      problem-independent limiter for high-order runge\Ukutta discontinuous
      galerkin methods. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 169(1):111\U150, 2001.<newblock>

      <bibitem*|16><label|bib-Burger2017>Raimund Bürger, Sudarshan<nbsp>Kumar
      Kenettinkara<localize|, and >David Zorío. <newblock>Approximate
      Lax\UWendroff discontinuous Galerkin methods for hyperbolic
      conservation laws. <newblock><with|font-shape|italic|Computers &
      Mathematics with Applications>, 74(6):1288\U1310, sep 2017.<newblock>

      <bibitem*|17><label|bib-Butcher2016>J.<nbsp>C.<nbsp>Butcher.
      <newblock><with|font-shape|italic|Numerical Methods for Ordinary
      Differential Equations>. <newblock>John Wiley & Sons, Ltd, Chichester,
      UK, jul 2016. <newblock>Bibtex: Butcher2016.<newblock>

      <bibitem*|18><label|bib-Canuto2007>C.<nbsp>Canuto, M.Y.<nbsp>Hussaini,
      A.<nbsp>Quarteroni<localize|, and >T.A.<nbsp>Zang.
      <newblock><with|font-shape|italic|Spectral Methods: Fundamentals in
      Single Domains>. <newblock>Scientific Computation. Springer Berlin
      Heidelberg, 2007.<newblock>

      <bibitem*|19><label|bib-Carpenter1995>Mark<nbsp>H.<nbsp>Carpenter,
      David Gottlieb, Saul Abarbanel<localize|, and >Wai-Sun Don.
      <newblock>The Theoretical Accuracy of Runge\UKutta Time Discretizations
      for the Initial Boundary Value Problem: A Study of the Boundary Error.
      <newblock><with|font-shape|italic|SIAM Journal on Scientific
      Computing>, 16(6):1241\U1252, nov 1995. <newblock>Bibtex:
      Carpenter1995.<newblock>

      <bibitem*|20><label|bib-Carrillo2021>H.<nbsp>Carrillo, E.<nbsp>Macca,
      C.<nbsp>Parés, G.<nbsp>Russo<localize|, and >D.<nbsp>Zorío.
      <newblock>An order-adaptive compact approximation Taylor method for
      systems of conservation laws. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 438:110358, aug 2021. <newblock>Bibtex:
      Carrillo2021.<newblock>

      <bibitem*|21><label|bib-Carrillo2021a>H.<nbsp>Carrillo,
      C.<nbsp>Parés<localize|, and >D.<nbsp>Zorío. <newblock>Lax-Wendroff
      Approximate Taylor Methods with Fast and Optimized Weighted Essentially
      Non-oscillatory Reconstructions. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 86(1):15, jan 2021. <newblock>Bibtex:
      Carrillo2021a.<newblock>

      <bibitem*|22><label|bib-Peraire2013>E.<nbsp>Casoni,
      J.<nbsp>Peraire<localize|, and >A.<nbsp>Huerta.
      <newblock>One-dimensional shock-capturing for high-order discontinuous
      Galerkin methods. <newblock><with|font-shape|italic|Int. J. Numer.
      Meth. Fluids>, 71:737\U755, 2013.<newblock>

      <bibitem*|23><label|bib-Castro2008>C.E.<nbsp>Castro<localize| and
      >E.F.<nbsp>Toro. <newblock>Solvers for the high-order Riemann problem
      for hyperbolic balance laws. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 227(4):2481\U2513, feb 2008.
      <newblock>Bibtex: Castro2008.<newblock>

      <bibitem*|24><label|bib-Chen2016>Zheng Chen, Hongying Huang<localize|,
      and >Jue Yan. <newblock>Third order maximum-principle-satisfying direct
      discontinuous galerkin methods for time dependent convection diffusion
      equations on unstructured triangular meshes.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      308:198\U217, 2016.<newblock>

      <bibitem*|25><label|bib-Choe1991>Kyu<nbsp>Y.<nbsp>Choe<localize| and
      >Keith<nbsp>A.<nbsp>Holsapple. <newblock>The Taylor-Galerkin
      discontinuous finite element method\VAn explicit scheme for nonlinear
      hyperbolic conservation laws. <newblock><with|font-shape|italic|Finite
      Elements in Analysis and Design>, 10(3):243\U265, dec 1991.
      <newblock>Bibtex: Choe1991.<newblock>

      <bibitem*|26><label|bib-Choe1992>Kyu<nbsp>Y.<nbsp>Choe<localize| and
      >Keith<nbsp>A.<nbsp>Holsapple. <newblock>The discontinuous finite
      element method with the Taylor-Galerkin approach for nonlinear
      hyperbolic conservation laws. <newblock><with|font-shape|italic|Computer
      Methods in Applied Mechanics and Engineering>, 95(2):141\U167, mar
      1992. <newblock>Bibtex: Choe1992.<newblock>

      <bibitem*|27><label|bib-Cicchino2022>Alexander Cicchino,
      David<nbsp>C.<nbsp>Del Rey Fernández, Siva Nadarajah, Jesse
      Chan<localize|, and >Mark<nbsp>H.<nbsp>Carpenter. <newblock>Provably
      stable flux reconstruction high-order methods on curvilinear elements.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      463:111259, 2022.<newblock>

      <bibitem*|28><label|bib-Clain2011>S.<nbsp>Clain,
      S.<nbsp>Diot<localize|, and >R.<nbsp>Loubère. <newblock>A high-order
      finite volume method for hyperbolic systems: Multi-dimensional Optimal
      Order Detection (MOOD). <newblock><with|font-shape|italic|J. Comp.
      Phys.>, 230:4028\U4050, 2011.<newblock>

      <bibitem*|29><label|bib-cockburn2000>Bernardo Cockburn,
      George<nbsp>E.<nbsp>Karniadakis, Chi-Wang Shu, M.<nbsp>Griebel,
      D.<nbsp>E.<nbsp>Keyes, R.<nbsp>M.<nbsp>Nieminen,
      D.<nbsp>Roose<localize|, and >T.<nbsp>Schlick<localize|, editors>.
      <newblock><with|font-shape|italic|Discontinuous Galerkin Methods:
      Theory, Computation and Applications>,
      <localize|volume><nbsp>11<localize| of ><with|font-shape|italic|Lecture
      Notes in Computational Science and Engineering>. <newblock>Springer
      Berlin Heidelberg, Berlin, Heidelberg, 2000. <newblock>Bibtex:
      Cockburn2000.<newblock>

      <bibitem*|30><label|bib-Cockburn1989>Bernardo Cockburn, San-Yih
      Lin<localize|, and >Chi-Wang Shu. <newblock>TVB Runge-Kutta local
      projection discontinuous Galerkin finite element method for
      conservation laws III: One-dimensional systems.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      84(1):90\U113, sep 1989.<newblock>

      <bibitem*|31><label|bib-Cockburn1989a>Bernardo Cockburn<localize| and
      >Chi-Wang Shu. <newblock>TVB Runge-Kutta local projection discontinuous
      Galerkin finite element method for conservation laws. II. General
      framework. <newblock><with|font-shape|italic|Mathematics of
      Computation>, 52(186):411\U411, may 1989.<newblock>

      <bibitem*|32><label|bib-Cockburn1991>Bernardo Cockburn<localize| and
      >Chi-Wang Shu. <newblock>The runge-kutta local projection
      <math|P<rsup|1>>-discontinuous-galerkin finite element method for
      scalar conservation laws. <newblock><with|font-shape|italic|ESAIM:
      Mathematical Modelling and Numerical Analysis - Modélisation
      Mathématique et Analyse Numérique>, 25(3):337\U361, 1991.<newblock>

      <bibitem*|33><label|bib-Cockburn1998a>Bernardo Cockburn<localize| and
      >Chi-Wang Shu. <newblock>The Local Discontinuous Galerkin Method for
      Time-Dependent Convection-Diffusion Systems.
      <newblock><with|font-shape|italic|SIAM Journal on Numerical Analysis>,
      35(6):2440\U2463, dec 1998.<newblock>

      <bibitem*|34><label|bib-Cui2023>Shumo Cui, Shengrong Ding<localize|,
      and >Kailiang Wu. <newblock>Is the classic convex decomposition optimal
      for bound-preserving schemes in multiple dimensions?
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      476:111882, 2023.<newblock>

      <bibitem*|35><label|bib-Rosa2018>J.<nbsp>N.<nbsp>de
      la<nbsp>Rosa<localize| and >C.<nbsp>D.<nbsp>Munz. <newblock>Hybrid
      DG/FV schemes for magnetohydrodynamics and relativistichydrodynamics.
      <newblock><with|font-shape|italic|Comp. Phys. Commun.>, 222:113\U135,
      2018.<newblock>

      <bibitem*|36><label|bib-Diot2012>S.<nbsp>Diot, S.<nbsp>Clain<localize|,
      and >R.<nbsp>Loubère. <newblock>Improved detection criteria for the
      multi-dimensional optimal order detection (MOOD) on unstructured meshes
      with very high-order polynomials. <newblock><with|font-shape|italic|Computers
      and Fluids>, 64:43\U63, 2012.<newblock>

      <bibitem*|37><label|bib-Diot2013>S.<nbsp>Diot,
      R.<nbsp>Loubère<localize|, and >S.<nbsp>Clain. <newblock>The MOOD
      method in the three-dimensional case: very-high-order finite volume
      method for hyperbolic systems. <newblock><with|font-shape|italic|Int.
      J. Numer. Meth. Fluids>, 73:362\U392, 2013.<newblock>

      <bibitem*|38><label|bib-Dumbser2019>M.<nbsp>Dumbser<localize| and
      >R.<nbsp>Loubère. <newblock>A simple robust and accurate a
      posteriorisub-cell finite volume limiter for the discontinuousGalerkin
      method on unstructured meshes. <newblock><with|font-shape|italic|J.
      Comp. Phys.>, 319:163\U199, 2016.<newblock>

      <bibitem*|39><label|bib-Dumbser2014>M.<nbsp>Dumbser, O.<nbsp>Zanotti,
      R.<nbsp>Loubère<localize|, and >S.<nbsp>Diot. <newblock>A posteriori
      subcell limiting of the discontinuous Galerkin finite element method
      for hyperbolic conservation laws. <newblock><with|font-shape|italic|J.
      Comp. Phys.>, 278:47\U75, 2014.<newblock>

      <bibitem*|40><label|bib-Dumbser2008>Michael Dumbser,
      Dinshaw<nbsp>S.<nbsp>Balsara, Eleuterio<nbsp>F.<nbsp>Toro<localize|,
      and >Claus-Dieter Munz. <newblock>A unified framework for the
      construction of one-step finite volume and discontinuous Galerkin
      schemes on unstructured meshes. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 227(18):8209\U8253, sep 2008.<newblock>

      <bibitem*|41><label|bib-Dumbser2008a>Michael Dumbser, Cedric
      Enaux<localize|, and >Eleuterio<nbsp>F.<nbsp>Toro. <newblock>Finite
      volume schemes of very high order of accuracy for stiff hyperbolic
      balance laws. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 227(8):3971\U4001, apr 2008. <newblock>Bibtex:
      Dumbser2008a.<newblock>

      <bibitem*|42><label|bib-Dumbser2018>Michael Dumbser, Francesco Fambri,
      Maurizio Tavelli, Michael Bader<localize|, and >Tobias Weinzierl.
      <newblock>Efficient Implementation of ADER Discontinuous Galerkin
      Schemes for a Scalable Hyperbolic PDE Engine.
      <newblock><with|font-shape|italic|Axioms>, 7(3):63, sep 2018.
      <newblock>Bibtex: Dumbser2018.<newblock>

      <bibitem*|43><label|bib-Dumbser2007>Michael Dumbser, Martin Käser,
      Vladimir<nbsp>A.<nbsp>Titarev<localize|, and
      >Eleuterio<nbsp>F.<nbsp>Toro. <newblock>Quadrature-free non-oscillatory
      finite volume schemes on unstructured meshes for nonlinear hyperbolic
      systems. <newblock><with|font-shape|italic|Journal of Computational
      Physics>, 226(1):204\U243, sep 2007. <newblock>Bibtex:
      Dumbser2007.<newblock>

      <bibitem*|44><label|bib-Dumbser2006>Michael Dumbser<localize| and
      >Claus-Dieter Munz. <newblock>Building Blocks for Arbitrary High Order
      Discontinuous Galerkin Schemes. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 27(1-3):215\U230, jun 2006. <newblock>Bibtex:
      Dumbser2006.<newblock>

      <bibitem*|45><label|bib-dzanic2022>T.<nbsp>Dzanic<localize| and
      >F.D.<nbsp>Witherden. <newblock>Positivity-preserving entropy-based
      adaptive filtering for discontinuous spectral element methods.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      468:111501, 2022.<newblock>

      <bibitem*|46><label|bib-Einfeldt1988>Bernd Einfeldt. <newblock>On
      Godunov-Type Methods for Gas Dynamics.
      <newblock><with|font-shape|italic|SIAM Journal on Numerical Analysis>,
      25(2):294\U318, apr 1988.<newblock>

      <bibitem*|47><label|bib-emery1968>Ashley<nbsp>F Emery. <newblock>An
      evaluation of several differencing methods for inviscid fluid flow
      problems. <newblock><with|font-shape|italic|Journal of Computational
      Physics>, 2(3):306\U331, 1968.<newblock>

      <bibitem*|48><label|bib-Engquist1981>Björn Engquist<localize| and
      >Stanley Osher. <newblock>One-sided difference approximations for
      nonlinear conservation laws. <newblock><with|font-shape|italic|Mathematics
      of Computation>, 36(154):321\U351, 1981.<newblock>

      <bibitem*|49><label|bib-Gassner2011a>Gregor Gassner, Michael Dumbser,
      Florian Hindenlang<localize|, and >Claus-Dieter Munz.
      <newblock>Explicit one-step time discretizations for discontinuous
      Galerkin and finite volume schemes based on local predictors.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      230(11):4232\U4247, may 2011. <newblock>Bibtex: Gassner2011a.<newblock>

      <bibitem*|50><label|bib-Glimm1985>James Glimm, Christian Klingenberg,
      Oliver McBryan, Bradley Plohr, David Sharp<localize|, and >Sara Yaniv.
      <newblock>Front tracking and two-dimensional riemann problems.
      <newblock><with|font-shape|italic|Advances in Applied Mathematics>,
      6(3):259\U290, 1985.<newblock>

      <bibitem*|51><label|bib-Gottlieb2001>Sigal Gottlieb, Chi-Wang
      Shu<localize|, and >Eitan Tadmor. <newblock>Strong Stability-Preserving
      High-Order Time Discretization Methods.
      <newblock><with|font-shape|italic|SIAM Review>, 43(1):89\U112, jan
      2001. <newblock>Bibtex: Gottlieb2001.<newblock>

      <bibitem*|52><label|bib-Guermond2016>Jean-Luc Guermond<localize| and
      >Bojan Popov. <newblock>Fast estimation from above of the maximum wave
      speed in the Riemann problem for the Euler equations.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      321(C):908\U926, sep 2016. <newblock>Bibtex: Guermond2016.<newblock>

      <bibitem*|53><label|bib-Guo2015>Wei Guo, Jing-Mei Qiu<localize|, and
      >Jianxian Qiu. <newblock>A New Lax\UWendroff Discontinuous Galerkin
      Method with Superconvergence. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 65(1):299\U326, oct 2015. <newblock>Bibtex:
      Guo2015.<newblock>

      <bibitem*|54><label|bib-Guthrey2019>Pierson<nbsp>T.<nbsp>Guthrey<localize|
      and >James<nbsp>A.<nbsp>Rossmanith. <newblock>The Regionally Implicit
      Discontinuous Galerkin Method: Improving the Stability of DG-FEM.
      <newblock><with|font-shape|italic|SIAM Journal on Numerical Analysis>,
      57(3):1263\U1288, jan 2019. <newblock>Bibtex: Guthrey2019.<newblock>

      <bibitem*|55><label|bib-ha2005>Youngsoo Ha, Carl Gardner, Anne
      Gelb<localize|, and ><keepcase|Chi Wang> Shu. <newblock>Numerical
      simulation of high mach number astrophysical jets with radiative
      cooling. <newblock><with|font-shape|italic|Journal of Scientific
      Computing>, 24(1):597\U612, jul 2005.<newblock>

      <bibitem*|56><label|bib-Han2010>Ee Han, Jiequan Li<localize|, and
      >Huazhong Tang. <newblock>An adaptive GRP scheme for compressible fluid
      flows. <newblock><with|font-shape|italic|Journal of Computational
      Physics>, 229(5):1448\U1466, mar 2010. <newblock>Bibtex:
      Han2010.<newblock>

      <bibitem*|57><label|bib-Harten1983a>Amiram Harten,
      Peter<nbsp>D.<nbsp>Lax<localize|, and >Bram<nbsp>van Leer. <newblock>On
      Upstream Differencing and Godunov-Type Schemes for Hyperbolic
      Conservation Laws. <newblock><with|font-shape|italic|SIAM Review>,
      25(1):35\U61, jan 1983.<newblock>

      <bibitem*|58><label|bib-henemann2021>Sebastian Hennemann,
      Andrés<nbsp>M.<nbsp>Rueda-Ramírez, Florian<nbsp>J.<nbsp>Hindenlang<localize|,
      and >Gregor<nbsp>J.<nbsp>Gassner. <newblock>A provably entropy stable
      subcell shock capturing approach for high order split form dg for the
      compressible euler equations. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 426:109935, 2021.<newblock>

      <bibitem*|59><label|bib-Hirsch1990>Charles Hirsch.
      <newblock><with|font-shape|italic|Numerical Computation of Internal and
      External Flows, Volume 2: Computational Methods for Inviscid and
      Viscous Flows>. <newblock>Wiley, 1990. <newblock>Bibtex:
      Hirsch1990.<newblock>

      <bibitem*|60><label|bib-Peraire2012>A.<nbsp>Huerta,
      E.<nbsp>Casoni<localize|, and >J.<nbsp>Peraire. <newblock>A simple
      shock-capturing technique for high-order discontinuous Galerkin
      methods. <newblock><with|font-shape|italic|Int. J. Numer. Meth.
      Fluids>, 69:1614\U1632, 2012.<newblock>

      <bibitem*|61><label|bib-Huynh2007>H.<nbsp>T.<nbsp>Huynh. <newblock>A
      Flux Reconstruction Approach to High-Order Schemes Including
      Discontinuous Galerkin Methods. <newblock>Miami, FL, jun 2007.
      AIAA.<newblock>

      <bibitem*|62><label|bib-Jameson2012>A.<nbsp>Jameson,
      P.<nbsp>E.<nbsp>Vincent<localize|, and >P.<nbsp>Castonguay.
      <newblock>On the Non-linear Stability of Flux Reconstruction Schemes.
      <newblock><with|font-shape|italic|Journal of Scientific Computing>,
      50(2):434\U445, feb 2012. <newblock>Bibtex: Jameson2012.<newblock>

      <bibitem*|63><label|bib-Jiang1996>Guang-Shan Jiang<localize| and
      >Chi-Wang Shu. <newblock>Efficient Implementation of Weighted ENO
      Schemes. <newblock><with|font-shape|italic|Journal of Computational
      Physics>, 126(1):202\U228, jun 1996.<newblock>

      <bibitem*|64><label|bib-Jiang2013>Yan Jiang, Chi-Wang Shu<localize|,
      and >Mengping Zhang. <newblock>An Alternative Formulation of Finite
      Difference Weighted ENO Schemes with Lax\UWendroff Time Discretization
      for Conservation Laws. <newblock><with|font-shape|italic|SIAM Journal
      on Scientific Computing>, 35(2):0, jan 2013. <newblock>Bibtex:
      Jiang2013.<newblock>

      <bibitem*|65><label|bib-Kaser2005>Martin Käser<localize| and >Armin
      Iske. <newblock>ADER schemes on adaptive triangular meshes for scalar
      conservation laws. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 205(2):486\U508, may 2005. <newblock>Bibtex:
      Kaser2005.<newblock>

      <bibitem*|66><label|bib-klockner2011>Andreas Klöckner, Tim
      Warburton<localize|, and >Jan Hesthaven. <newblock>Viscous shock
      capturing in a time-explicit discontinuous galerkin method.
      <newblock><with|font-shape|italic|Mathematical Modelling of Natural
      Phenomena>, 6:0, 02 2011.<newblock>

      <bibitem*|67><label|bib-Krivodonova2007>Lilia Krivodonova.
      <newblock>Limiters for high-order discontinuous galerkin methods.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      226(1):879\U896, 2007.<newblock>

      <bibitem*|68><label|bib-Lax1954>Peter<nbsp>D.<nbsp>Lax. <newblock>Weak
      solutions of nonlinear hyperbolic equations and their numerical
      computation. <newblock><with|font-shape|italic|Communications on Pure
      and Applied Mathematics>, 7(1):159\U193, feb 1954.<newblock>

      <bibitem*|69><label|bib-Lax1998>Peter<nbsp>D.<nbsp>Lax<localize| and
      >Xu-Dong Liu. <newblock>Solution of two-dimensional riemann problems of
      gas dynamics by positive schemes. <newblock><with|font-shape|italic|SIAM
      Journal on Scientific Computing>, 19(2):319\U340, 1998.<newblock>

      <bibitem*|70><label|bib-Lax1960>Peter Lax<localize| and >Burton
      Wendroff. <newblock>Systems of conservation laws.
      <newblock><with|font-shape|italic|Communications on Pure and Applied
      Mathematics>, 13(2):217\U237, may 1960. <newblock>Bibtex:
      Lax1960.<newblock>

      <bibitem*|71><label|bib-Lee2021>Youngjun Lee<localize| and >Dongwook
      Lee. <newblock>A single-step third-order temporal discretization with
      Jacobian-free and Hessian-free formulations for finite difference
      methods. <newblock><with|font-shape|italic|Journal of Computational
      Physics>, 427:110063, feb 2021.<newblock>

      <bibitem*|72><label|bib-LeVeque1996>Randall<nbsp>J.<nbsp>LeVeque.
      <newblock>High-Resolution Conservative Algorithms for Advection in
      Incompressible Flow. <newblock><with|font-shape|italic|SIAM Journal on
      Numerical Analysis>, 33(2):627\U665, apr 1996. <newblock>Bibtex:
      LeVeque1996.<newblock>

      <bibitem*|73><label|bib-Lopez2014>Manuel<nbsp>R.<nbsp>López, Abhishek
      Sheshadri, Jonathan<nbsp>R.<nbsp>Bull, Thomas<nbsp>D.<nbsp>Economon,
      Joshua Romero, Jerry<nbsp>E.<nbsp>Watkins, David<nbsp>M.<nbsp>Williams,
      Francisco Palacios, Antony Jameson<localize|, and
      >David<nbsp>E.<nbsp>Manosalvas. <newblock>Verification and Validation
      of HiFiLES: a High-Order LES unstructured solver on multi-GPU
      platforms. <newblock><localize|In ><with|font-shape|italic|32nd AIAA
      Applied Aerodynamics Conference>. Atlanta, GA, jun 2014. American
      Institute of Aeronautics and Astronautics. <newblock>Bibtex:
      Lopez2014.<newblock>

      <bibitem*|74><label|bib-Lou2020>Shuai Lou, Chao Yan, Li-Bin
      Ma<localize|, and >Zhen-Hua Jiang. <newblock>The Flux Reconstruction
      Method with Lax\UWendroff Type Temporal Discretization for Hyperbolic
      Conservation Laws. <newblock><with|font-shape|italic|Journal of
      Scientific Computing>, 82(2):42, feb 2020. <newblock>Bibtex:
      Lou2020.<newblock>

      <bibitem*|75><label|bib-Lu2021>Jianfang Lu, Yong Liu<localize|, and
      >Chi-Wang Shu. <newblock>An oscillation-free discontinuous galerkin
      method for scalar hyperbolic conservation laws.
      <newblock><with|font-shape|italic|SIAM Journal on Numerical Analysis>,
      59(3):1299\U1324, 2021.<newblock>

      <bibitem*|76><label|bib-meena2017>Asha<nbsp>Kumari Meena<localize| and
      >Harish Kumar. <newblock>Robust MUSCL Schemes for Ten-Moment Gaussian
      Closure Equations with Source Terms.
      <newblock><with|font-shape|italic|International Journal on Finite
      Volumes>, Oct 2017.<newblock>

      <bibitem*|77><label|bib-Mengaldo2015>G.<nbsp>Mengaldo, D.<nbsp>De
      Grazia, P.<nbsp>E.<nbsp>Vincent<localize|, and
      >S.<nbsp>J.<nbsp>Sherwin. <newblock>On the connections between
      discontinuous galerkin and flux reconstruction schemes: extension to
      curvilinear meshes. <newblock><with|font-shape|italic|Journal of
      Scientific Computing>, 67(3):1272\U1292, oct 2015.<newblock>

      <bibitem*|78><label|bib-moe2017>Scott<nbsp>A.<nbsp>Moe,
      James<nbsp>A.<nbsp>Rossmanith<localize|, and >David<nbsp>C.<nbsp>Seal.
      <newblock>Positivity-preserving discontinuous galerkin methods with
      lax\Uwendroff time discretizations.
      <newblock><with|font-shape|italic|Journal of Scientific Computing>,
      71:44\U70, 2017.<newblock>

      <bibitem*|79><label|bib-Montecinos2020>Gino<nbsp>I.<nbsp>Montecinos<localize|
      and >Dinshaw<nbsp>S.<nbsp>Balsara. <newblock>A simplified
      Cauchy-Kowalewskaya procedure for the local implicit solution of
      generalized Riemann problems of hyperbolic balance laws.
      <newblock><with|font-shape|italic|Computers & Fluids>, 202:104490, apr
      2020. <newblock>Bibtex: Montecinos2020.<newblock>

      <bibitem*|80><label|bib-Offner2019>Philipp Öffner<localize| and
      >Hendrik Ranocha. <newblock>Error Boundedness of Discontinuous Galerkin
      Methods with Variable Coefficients.
      <newblock><with|font-shape|italic|Journal of Scientific Computing>,
      79(3):1572\U1607, jun 2019. <newblock>Bibtex: Offner2019.<newblock>

      <bibitem*|81><label|bib-Pazner2021>Will Pazner. <newblock>Sparse
      invariant domain preserving discontinuous galerkin methods with subcell
      convex limiting. <newblock><with|font-shape|italic|Computer Methods in
      Applied Mechanics and Engineering>, 382:113876, 2021.<newblock>

      <bibitem*|82><label|bib-Persson2006>Per-Olof Persson<localize| and
      >Jaime Peraire. <newblock>Sub-Cell Shock Capturing for Discontinuous
      Galerkin Methods. <newblock><localize|In ><with|font-shape|italic|44th
      AIAA Aerospace Sciences Meeting and Exhibit>, Aerospace Sciences
      Meetings. American Institute of Aeronautics and Astronautics, jan
      2006.<newblock>

      <bibitem*|83><label|bib-Qiu2005>J.<nbsp>Qiu<localize| and
      >C.-W.<nbsp>Shu. <newblock>Runge Kutta discontinuous Galerkin method
      using WENO limiters. <newblock><with|font-shape|italic|SIAM J. Sci.
      Comput.>, 26:907\U929, 2005.<newblock>

      <bibitem*|84><label|bib-Qiu2007>Jianxian Qiu. <newblock>A Numerical
      Comparison of the Lax\UWendroff Discontinuous Galerkin Method Based on
      Different Numerical Fluxes. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 30(3):345\U367, mar 2007.<newblock>

      <bibitem*|85><label|bib-Qiu2005b>Jianxian Qiu, Michael
      Dumbser<localize|, and >Chi-Wang Shu. <newblock>The discontinuous
      Galerkin method with Lax\UWendroff type time discretizations.
      <newblock><with|font-shape|italic|Computer Methods in Applied Mechanics
      and Engineering>, 194(42-44):4528\U4543, oct 2005.<newblock>

      <bibitem*|86><label|bib-Qiu2003>Jianxian Qiu<localize| and >Chi-Wang
      Shu. <newblock>Finite Difference WENO Schemes with Lax\UWendroff-Type
      Time Discretizations. <newblock><with|font-shape|italic|SIAM Journal on
      Scientific Computing>, 24(6):2185\U2198, jan 2003. <newblock>Bibtex:
      Qiu2003.<newblock>

      <bibitem*|87><label|bib-Rackauckas2017>Christopher Rackauckas<localize|
      and >Qing Nie. <newblock>DifferentialEquations.jl \U A Performant and
      Feature-Rich Ecosystem for Solving Differential Equations in Julia.
      <newblock><with|font-shape|italic|Journal of Open Research Software>,
      5(1):15, may 2017. <newblock>Bibtex: Rackauckas2017.<newblock>

      <bibitem*|88><label|bib-Ranocha2022>Hendrik Ranocha, Michael
      Schlottke-Lakemper, Andrew<nbsp>Ross Winters, Erik Faulhaber, Jesse
      Chan<localize|, and >Gregor Gassner. <newblock>Adaptive numerical
      simulations with Trixi.jl: A case study of Julia for scientific
      computing. <newblock><with|font-shape|italic|Proceedings of the
      JuliaCon Conferences>, 1(1):77, 2022.<newblock>

      <bibitem*|89><label|bib-reed1973>W.<nbsp>H.<nbsp>Reed<localize| and
      >T.<nbsp>R.<nbsp>Hill. <newblock>Triangular mesh methods for the
      neutron transport equation. <newblock><localize|In
      ><with|font-shape|italic|National topical meeting on mathematical
      models and computational techniques for analysis of nuclear systems>.
      Ann Arbor, Michigan, oct 1973. Los Alamos Scientific Lab., N.Mex.
      (USA).<newblock>

      <bibitem*|90><label|bib-Roe1981>Philip<nbsp>L.<nbsp>Roe.
      <newblock>Approximate Riemann solvers, parameter vectors, and
      difference schemes. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 43(2):357\U372, oct 1981.<newblock>

      <bibitem*|91><label|bib-Romero2016>J.<nbsp>Romero,
      K.<nbsp>Asthana<localize|, and >A.<nbsp>Jameson. <newblock>A Simplified
      Formulation of the Flux Reconstruction Method.
      <newblock><with|font-shape|italic|Journal of Scientific Computing>,
      67(1):351\U374, apr 2016. <newblock>Bibtex: Romero2016.<newblock>

      <bibitem*|92><label|bib-Ramirez2020>Andr'es<nbsp>M.<nbsp>Rueda-Ram'irez,
      Sebastian Hennemann, Florian Hindenlang,
      Andrew<nbsp>R.<nbsp>Winters<localize|, and
      >Gregor<nbsp>J.<nbsp>Gassner. <newblock>An entropy stable nodal
      discontinuous galerkin method for the resistive mhd equations. part ii:
      subcell finite volume shock capturing.
      <newblock><with|font-shape|italic|J. Comput. Phys.>, 444:110580,
      2020.<newblock>

      <bibitem*|93><label|bib-ramirez2022>Andrés<nbsp>M.<nbsp>Rueda-Ramírez,
      Will Pazner<localize|, and >Gregor<nbsp>J.<nbsp>Gassner.
      <newblock>Subcell limiting strategies for discontinuous galerkin
      spectral element methods. <newblock><with|font-shape|italic|Computers &
      Fluids>, 247:105627, 2022.<newblock>

      <bibitem*|94><label|bib-ramirez2021>A Rueda-Ramrez<localize| and >G
      Gassner. <newblock>A subcell finite volume positivity-preserving
      limiter for DGSEM discretizations of the euler equations.
      <newblock><localize|In ><with|font-shape|italic|14th WCCM-ECCOMAS
      Congress>. CIMNE, 2021.<newblock>

      <bibitem*|95><label|bib-Rusanov1962>V.V Rusanov. <newblock>The
      calculation of the interaction of non-stationary shock waves and
      obstacles. <newblock><with|font-shape|italic|USSR Computational
      Mathematics and Mathematical Physics>, 1(2):304\U320, jan
      1962.<newblock>

      <bibitem*|96><label|bib-Ruuth2002>Steven<nbsp>J.<nbsp>Ruuth<localize|
      and >R.<nbsp>Spiteri. <newblock>Two Barriers on
      Strong-Stability-Preserving Time Discretization Methods.
      <newblock><with|font-shape|italic|J. Sci. Comput.>, 2002.
      <newblock>Bibtex: Ruuth2002.<newblock>

      <bibitem*|97><label|bib-Safjan1995>A.<nbsp>Safjan<localize| and
      >J.T.<nbsp>Oden. <newblock>High-Order Taylor-Galerkin Methods for
      Linear Hyperbolic Systems. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 120(2):206\U230, sep 1995. <newblock>Bibtex:
      Safjan1995.<newblock>

      <bibitem*|98><label|bib-sedov1959>L.I.<nbsp>SEDOV. <newblock>Chapter iv
      - one-dimensional unsteady motion of a gas. <newblock><localize|In
      >L.I.<nbsp>SEDOV<localize|, editor>, <with|font-shape|italic|Similarity
      and Dimensional Methods in Mechanics>, <localize|pages >146\U304.
      Academic Press, 1959.<newblock>

      <bibitem*|99><label|bib-Shu1989>Chi-Wang Shu<localize| and >Stanley
      Osher. <newblock>Efficient implementation of essentially
      non-oscillatory shock-capturing schemes, II.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      83(1):32\U78, jul 1989.<newblock>

      <bibitem*|100><label|bib-Sod1978>Gary<nbsp>A Sod. <newblock>A survey of
      several finite difference methods for systems of nonlinear hyperbolic
      conservation laws. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 27(1):1\U31, apr 1978.<newblock>

      <bibitem*|101><label|bib-Sonntag2014>M.<nbsp>Sonntag<localize| and
      >C.<nbsp>D.<nbsp>Munz. <newblock>Shock capturing for discontinuous
      Galerkin methods using finite volume subcells. <newblock><localize|In
      ><with|font-shape|italic|Finite Volumes for Complex Applications VII>,
      <localize|pages >945\U953. Springer, 2014.<newblock>

      <bibitem*|102><label|bib-Spiegel2016>Seth<nbsp>C.<nbsp>Spiegel,
      James<nbsp>R.<nbsp>DeBonis<localize|, and >H.T.<nbsp>Huynh.
      <newblock>Overview of the NASA Glenn Flux Reconstruction Based
      High-Order Unstructured Grid Code. <newblock><localize|In
      ><with|font-shape|italic|54th AIAA Aerospace Sciences Meeting>. San
      Diego, California, USA, jan 2016. American Institute of Aeronautics and
      Astronautics. <newblock>Bibtex: Spiegel2016.<newblock>

      <bibitem*|103><label|bib-Spiteri2002>Raymond<nbsp>J.<nbsp>Spiteri<localize|
      and >Steven<nbsp>J.<nbsp>Ruuth. <newblock>A New Class of Optimal
      High-Order Strong-Stability-Preserving Time Discretization Methods.
      <newblock><with|font-shape|italic|SIAM Journal on Numerical Analysis>,
      40(2):469\U491, jan 2002.<newblock>

      <bibitem*|104><label|bib-Volker2010>Volker Springel. <newblock>E pur si
      muove: Galilean-invariant cosmological hydrodynamical simulations on a
      moving mesh. <newblock><with|font-shape|italic|Monthly Notices of the
      Royal Astronomical Society>, 401(2):791\U851, 01 2010.<newblock>

      <bibitem*|105><label|bib-subcommittee2014>ASCAC Subcommittee
      et<nbsp>al. <newblock>Top ten exascale research challenges.
      <newblock><with|font-shape|italic|US Department Of Energy Report>,
      2014.<newblock>

      <bibitem*|106><label|bib-Sun2017>Zheng Sun<localize| and >Chi-Wang Shu.
      <newblock>Stability analysis and error estimates of Lax\UWendroff
      discontinuous Galerkin methods for linear conservation laws.
      <newblock><with|font-shape|italic|ESAIM: Mathematical Modelling and
      Numerical Analysis>, 51(3):1063\U1087, may 2017. <newblock>Bibtex:
      Sun2017.<newblock>

      <bibitem*|107><label|bib-Tabarrok1994>B Tabarrok<localize| and >Jichao
      Su. <newblock>Semi-implicit Taylor\VGalerkin finite element methods for
      incompressible viscous flows. <newblock><with|font-shape|italic|Computer
      Methods in Applied Mechanics and Engineering>, 117(3-4):391\U410, aug
      1994. <newblock>Bibtex: Tabarrok1994.<newblock>

      <bibitem*|108><label|bib-Takayama1991>K.<nbsp>Takayama<localize| and
      >O.<nbsp>Inoue. <newblock>Shock wave diffraction over a 90 degree sharp
      corner ? posters presented at 18th ISSW.
      <newblock><with|font-shape|italic|Shock Waves>, 1(4):301\U312, dec
      1991.<newblock>

      <bibitem*|109><label|bib-Titarev2002>V.<nbsp>A.<nbsp>Titarev<localize|
      and >E.<nbsp>F.<nbsp>Toro. <newblock>ADER: Arbitrary High Order Godunov
      Approach. <newblock><with|font-shape|italic|Journal of Scientific
      Computing>, 17(1/4):609\U618, 2002. <newblock>Bibtex:
      Titarev2002.<newblock>

      <bibitem*|110><label|bib-Titarev2005>V.A.<nbsp>Titarev<localize| and
      >E.F.<nbsp>Toro. <newblock>ADER schemes for three-dimensional
      non-linear hyperbolic systems. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 204(2):715\U736, apr 2005. <newblock>Bibtex:
      Titarev2005.<newblock>

      <bibitem*|111><label|bib-Toro2001>E.<nbsp>F.<nbsp>Toro,
      R.<nbsp>C.<nbsp>Millington<localize|, and
      >L.<nbsp>A.<nbsp>M.<nbsp>Nejad. <newblock>Towards Very High Order
      Godunov Schemes. <newblock><localize|In
      >E.<nbsp>F.<nbsp>Toro<localize|, editor>,
      <with|font-shape|italic|Godunov Methods>, <localize|pages >907\U940.
      Springer US, New York, NY, 2001. <newblock>Bibtex: Toro2001.<newblock>

      <bibitem*|112><label|bib-Toro2020>E.<nbsp>F.<nbsp>Toro,
      L.<nbsp>O.<nbsp>Müller<localize|, and >A.<nbsp>Siviglia.
      <newblock>Bounds for Wave Speeds in the Riemann Problem: Direct
      Theoretical Estimates. <newblock><with|font-shape|italic|Computers &
      Fluids>, 209:104640, sep 2020. <newblock>Bibtex: Toro2020.<newblock>

      <bibitem*|113><label|bib-Toro1994>E.<nbsp>F.<nbsp>Toro,
      M.<nbsp>Spruce<localize|, and >W.<nbsp>Speares. <newblock>Restoration
      of the contact surface in the HLL-Riemann solver.
      <newblock><with|font-shape|italic|Shock Waves>, 4(1):25\U34, jul
      1994.<newblock>

      <bibitem*|114><label|bib-Toro2009>Eleuterio<nbsp>F.<nbsp>Toro.
      <newblock><with|font-shape|italic|Riemann Solvers and Numerical Methods
      for Fluid Dynamics>. <newblock>Springer Berlin Heidelberg, Berlin,
      Heidelberg, 2009.<newblock>

      <bibitem*|115><label|bib-Trojak2021>W.<nbsp>Trojak<localize| and
      >F.<nbsp>D.<nbsp>Witherden. <newblock>A new family of weighted
      one-parameter flux reconstruction schemes.
      <newblock><with|font-shape|italic|Computers & Fluids>, 222:104918, may
      2021. <newblock>Bibtex: Trojak2021.<newblock>

      <bibitem*|116><label|bib-Tsitouras2011>Ch.<nbsp>Tsitouras.
      <newblock>Runge\UKutta pairs of order 5(4) satisfying only the first
      column simplifying assumption. <newblock><with|font-shape|italic|Computers
      & Mathematics with Applications>, 62(2):770\U775, jul 2011.
      <newblock>Bibtex: Tsitouras2011.<newblock>

      <bibitem*|117><label|bib-vanleer1977>Bram Van Leer. <newblock>Towards
      the ultimate conservative difference scheme. iv. a new approach to
      numerical convection. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 23(3):276\U299, 1977.<newblock>

      <bibitem*|118><label|bib-vanleer1984>Bram van<nbsp>Leer. <newblock>On
      the relation between the upwind-differencing schemes of godunov,
      engquist\Uosher and roe. <newblock><with|font-shape|italic|SIAM Journal
      on Scientific and Statistical Computing>, 5:1\U20, 03 1984.<newblock>

      <bibitem*|119><label|bib-Vandenhoeck2019>Ray Vandenhoeck<localize| and
      >Andrea Lani. <newblock>Implicit high-order flux reconstruction solver
      for high-speed compressible flows. <newblock><with|font-shape|italic|Computer
      Physics Communications>, 242:1\U24, sep 2019. <newblock>Bibtex:
      Vandenhoeck2019.<newblock>

      <bibitem*|120><label|bib-Vermeire2017>B.C.<nbsp>Vermeire<localize| and
      >P.E.<nbsp>Vincent. <newblock>On the behaviour of fully-discrete flux
      reconstruction schemes. <newblock><with|font-shape|italic|Computer
      Methods in Applied Mechanics and Engineering>, 315:1053\U1079, mar
      2017.<newblock>

      <bibitem*|121><label|bib-Vilar2019>François Vilar. <newblock>A
      posteriori correction of high-order discontinuous Galerkin scheme
      through subcell finite volume formulation and flux reconstruction.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      387:245\U279, jun 2019.<newblock>

      <bibitem*|122><label|bib-Vincent2011a>P.<nbsp>E.<nbsp>Vincent,
      P.<nbsp>Castonguay<localize|, and >A.<nbsp>Jameson. <newblock>A New
      Class of High-Order Energy Stable Flux Reconstruction Schemes.
      <newblock><with|font-shape|italic|Journal of Scientific Computing>,
      47(1):50\U72, apr 2011.<newblock>

      <bibitem*|123><label|bib-Vincent2011>P.<nbsp>E.<nbsp>Vincent,
      P.<nbsp>Castonguay<localize|, and >A.<nbsp>Jameson. <newblock>Insights
      from von Neumann analysis of high-order flux reconstruction schemes.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      230(22):8134\U8154, sep 2011.<newblock>

      <bibitem*|124><label|bib-Vincent2015>P.<nbsp>E.<nbsp>Vincent,
      A.<nbsp>M.<nbsp>Farrington, F.<nbsp>D.<nbsp>Witherden<localize|, and
      >A.<nbsp>Jameson. <newblock>An extended range of
      stable-symmetric-conservative Flux Reconstruction correction functions.
      <newblock><with|font-shape|italic|Computer Methods in Applied Mechanics
      and Engineering>, 296:248\U272, nov 2015. <newblock>Bibtex:
      Vincent2015.<newblock>

      <bibitem*|125><label|bib-Vincent2016>Peter Vincent, Freddie Witherden,
      Brian Vermeire, Jin<nbsp>Seok Park<localize|, and >Arvind Iyer.
      <newblock>Towards Green Aviation with Python at Petascale.
      <newblock><localize|In ><with|font-shape|italic|SC16: International
      Conference for High Performance Computing, Networking, Storage and
      Analysis>, <localize|pages >1\U11. Salt Lake City, UT, nov 2016. IEEE.
      <newblock>Bibtex: Vincent2016.<newblock>

      <bibitem*|126><label|bib-Witherden2021>F.D.<nbsp>Witherden<localize|
      and >P.E.<nbsp>Vincent. <newblock>On nodal point sets for flux
      reconstruction. <newblock><with|font-shape|italic|Journal of
      Computational and Applied Mathematics>, 381:113014, jan 2021.
      <newblock>Bibtex: Witherden2021.<newblock>

      <bibitem*|127><label|bib-Woodward1984>Paul Woodward<localize| and
      >Phillip Colella. <newblock>The numerical simulation of two-dimensional
      fluid flow with strong shocks. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 54(1):115\U173, apr 1984.<newblock>

      <bibitem*|128><label|bib-Xu2019>Yuan Xu, Qiang Zhang, Chi-wang
      Shu<localize|, and >Haijin Wang. <newblock>The <math|L<rsup|2>>-norm
      Stability Analysis of Runge\UKutta Discontinuous Galerkin Methods for
      Linear Hyperbolic Equations. <newblock><with|font-shape|italic|SIAM
      Journal on Numerical Analysis>, 57(4):1574\U1601, jan 2019.
      <newblock>Bibtex: Xu2019.<newblock>

      <bibitem*|129><label|bib-Xu2022>Ziyao Xu<localize| and >Chi-Wang Shu.
      <newblock>Third order maximum-principle-satisfying and
      positivity-preserving lax-wendroff discontinuous galerkin methods for
      hyperbolic conservation laws. <newblock><with|font-shape|italic|Journal
      of Computational Physics>, 470:111591, 2022.<newblock>

      <bibitem*|130><label|bib-Yee1999>H.C Yee, N.D Sandham<localize|, and
      >M.J Djomehri. <newblock>Low-Dissipative High-Order Shock-Capturing
      Methods Using Characteristic-Based Filters.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      150(1):199\U238, mar 1999.<newblock>

      <bibitem*|131><label|bib-Youn1995>Sung-Kie Youn<localize| and
      >Sang-Hoon Park. <newblock>A new direct higher-order Taylor-Galerkin
      finite element method. <newblock><with|font-shape|italic|Computers &
      Structures>, 56(4):651\U656, aug 1995. <newblock>Bibtex:
      Youn1995.<newblock>

      <bibitem*|132><label|bib-Zhang1990>Tong Zhang<localize| and >Yuxi
      Zheng. <newblock>Conjecture on the structure of solutions of the
      riemann problem for two-dimensional gas dynamics systems.
      <newblock><with|font-shape|italic|Siam Journal on Mathematical
      Analysis>, 21:593\U630, 1990.<newblock>

      <bibitem*|133><label|bib-Zhang2010b>Xiangxiong Zhang<localize| and
      >Chi-Wang Shu. <newblock>On maximum-principle-satisfying high order
      schemes for scalar conservation laws.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      229(9):3091\U3120, may 2010.<newblock>

      <bibitem*|134><label|bib-zhang2010c>Xiangxiong Zhang<localize| and
      >Chi-Wang Shu. <newblock>On positivity-preserving high order
      discontinuous galerkin schemes for compressible euler equations on
      rectangular meshes. <newblock><with|font-shape|italic|Journal of
      Computational Physics>, 229(23):8918\U8934, 2010.<newblock>

      <bibitem*|135><label|bib-zhang2012>Xiangxiong Zhang<localize| and
      >Chi-Wang Shu. <newblock>Positivity-preserving high order finite
      difference weno schemes for compressible euler equations.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      231(5):2245\U2258, 2012.<newblock>

      <bibitem*|136><label|bib-Zorio2017>D.<nbsp>Zorío,
      A.<nbsp>Baeza<localize|, and >P.<nbsp>Mulet. <newblock>An Approximate
      Lax\UWendroff-Type Procedure for High Order Accurate Schemes for
      Hyperbolic Conservation Laws. <newblock><with|font-shape|italic|Journal
      of Scientific Computing>, 71(1):246\U273, apr 2017. <newblock>Bibtex:
      Zorio2017.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|9>
    <associate|page-medium|paper>
    <associate|preamble|false>
    <associate|project-flag|true>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:blended.flux.2d|<tuple|D.1|97|ch3_blending_limiter.tm>>
    <associate|alg:high.level.lw|<tuple|4.1|74|ch3_blending_limiter.tm>>
    <associate|alg:lwfr.paper1|<tuple|3.2|33|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|alg:rkfr.paper1|<tuple|3.1|32|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|apendix:numfluxes|<tuple|A|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-1|<tuple|?|3|acknowledgements.tm>>
    <associate|auto-10|<tuple|3.1|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-100|<tuple|C|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-101|<tuple|4|65|ch3_blending_limiter.tm>>
    <associate|auto-102|<tuple|4.1|65|ch3_blending_limiter.tm>>
    <associate|auto-103|<tuple|4.2|66|ch3_blending_limiter.tm>>
    <associate|auto-104|<tuple|4.2.1|66|ch3_blending_limiter.tm>>
    <associate|auto-105|<tuple|4.2.2|67|ch3_blending_limiter.tm>>
    <associate|auto-106|<tuple|4.1|67|ch3_blending_limiter.tm>>
    <associate|auto-107|<tuple|4.2.3|68|ch3_blending_limiter.tm>>
    <associate|auto-108|<tuple|4.2|69|ch3_blending_limiter.tm>>
    <associate|auto-109|<tuple|4.2.4|70|ch3_blending_limiter.tm>>
    <associate|auto-11|<tuple|3.1.1|24|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-110|<tuple|4.3|70|ch3_blending_limiter.tm>>
    <associate|auto-111|<tuple|4.20|71|ch3_blending_limiter.tm>>
    <associate|auto-112|<tuple|4.4|72|ch3_blending_limiter.tm>>
    <associate|auto-113|<tuple|4.5|73|ch3_blending_limiter.tm>>
    <associate|auto-114|<tuple|4.6|74|ch3_blending_limiter.tm>>
    <associate|auto-115|<tuple|4.6.1|74|ch3_blending_limiter.tm>>
    <associate|auto-116|<tuple|4.6.1.1|74|ch3_blending_limiter.tm>>
    <associate|auto-117|<tuple|4.3|75|ch3_blending_limiter.tm>>
    <associate|auto-118|<tuple|4.6.1.2|75|ch3_blending_limiter.tm>>
    <associate|auto-119|<tuple|4.4|75|ch3_blending_limiter.tm>>
    <associate|auto-12|<tuple|3.1.2|24|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-120|<tuple|4.6.1.3|76|ch3_blending_limiter.tm>>
    <associate|auto-121|<tuple|4.5|76|ch3_blending_limiter.tm>>
    <associate|auto-122|<tuple|4.6.1.4|76|ch3_blending_limiter.tm>>
    <associate|auto-123|<tuple|4.6|77|ch3_blending_limiter.tm>>
    <associate|auto-124|<tuple|4.7|77|ch3_blending_limiter.tm>>
    <associate|auto-125|<tuple|4.7|77|ch3_blending_limiter.tm>>
    <associate|auto-126|<tuple|4.8|78|ch3_blending_limiter.tm>>
    <associate|auto-127|<tuple|4.8|78|ch3_blending_limiter.tm>>
    <associate|auto-128|<tuple|4.8.1|78|ch3_blending_limiter.tm>>
    <associate|auto-129|<tuple|4.9|79|ch3_blending_limiter.tm>>
    <associate|auto-13|<tuple|3.1.3|25|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-130|<tuple|4.8.2|79|ch3_blending_limiter.tm>>
    <associate|auto-131|<tuple|4.10|79|ch3_blending_limiter.tm>>
    <associate|auto-132|<tuple|4.8.3|80|ch3_blending_limiter.tm>>
    <associate|auto-133|<tuple|4.11|80|ch3_blending_limiter.tm>>
    <associate|auto-134|<tuple|4.8.4|80|ch3_blending_limiter.tm>>
    <associate|auto-135|<tuple|4.12|81|ch3_blending_limiter.tm>>
    <associate|auto-136|<tuple|4.8.5|81|ch3_blending_limiter.tm>>
    <associate|auto-137|<tuple|4.13|82|ch3_blending_limiter.tm>>
    <associate|auto-138|<tuple|4.8.6|82|ch3_blending_limiter.tm>>
    <associate|auto-139|<tuple|4.14|82|ch3_blending_limiter.tm>>
    <associate|auto-14|<tuple|3.1.4|25|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-140|<tuple|4.15|83|ch3_blending_limiter.tm>>
    <associate|auto-141|<tuple|4.8.7|83|ch3_blending_limiter.tm>>
    <associate|auto-142|<tuple|4.16|83|ch3_blending_limiter.tm>>
    <associate|auto-143|<tuple|4.8.8|84|ch3_blending_limiter.tm>>
    <associate|auto-144|<tuple|4.17|84|ch3_blending_limiter.tm>>
    <associate|auto-145|<tuple|4.9|84|ch3_blending_limiter.tm>>
    <associate|auto-146|<tuple|D|87|ch3_blending_limiter.tm>>
    <associate|auto-147|<tuple|D.1|87|ch3_blending_limiter.tm>>
    <associate|auto-148|<tuple|D.1|87|ch3_blending_limiter.tm>>
    <associate|auto-149|<tuple|D.2|88|ch3_blending_limiter.tm>>
    <associate|auto-15|<tuple|3.1.4.1|26|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-150|<tuple|D.3|88|ch3_blending_limiter.tm>>
    <associate|auto-151|<tuple|D.2|89|ch3_blending_limiter.tm>>
    <associate|auto-152|<tuple|D.3|90|ch3_blending_limiter.tm>>
    <associate|auto-153|<tuple|D.4|91|ch3_blending_limiter.tm>>
    <associate|auto-154|<tuple|D.4|92|ch3_blending_limiter.tm>>
    <associate|auto-155|<tuple|D.5|93|ch3_blending_limiter.tm>>
    <associate|auto-156|<tuple|D.5.1|93|ch3_blending_limiter.tm>>
    <associate|auto-157|<tuple|D.5.2|95|ch3_blending_limiter.tm>>
    <associate|auto-158|<tuple|D.5.3|96|ch3_blending_limiter.tm>>
    <associate|auto-159|<tuple|5|99|ch4_mdrk.tm>>
    <associate|auto-16|<tuple|3.1.4.2|26|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-160|<tuple|6|101|ch5_10_moment_problem.tm>>
    <associate|auto-161|<tuple|7|103|ch6_curved_meshes.tm>>
    <associate|auto-162|<tuple|7.1|103|ch6_curved_meshes.tm>>
    <associate|auto-163|<tuple|7.1|103|ch6_curved_meshes.tm>>
    <associate|auto-164|<tuple|7.2|104|ch6_curved_meshes.tm>>
    <associate|auto-165|<tuple|7.3|105|ch6_curved_meshes.tm>>
    <associate|auto-166|<tuple|7.2|107|ch6_curved_meshes.tm>>
    <associate|auto-167|<tuple|7.2.1|107|ch6_curved_meshes.tm>>
    <associate|auto-168|<tuple|7.2.2|108|ch6_curved_meshes.tm>>
    <associate|auto-169|<tuple|7.2.3|109|ch6_curved_meshes.tm>>
    <associate|auto-17|<tuple|3.1.4.3|26|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-170|<tuple|7.2.4|110|ch6_curved_meshes.tm>>
    <associate|auto-171|<tuple|7.2.5|111|ch6_curved_meshes.tm>>
    <associate|auto-172|<tuple|7.2.5.1|112|ch6_curved_meshes.tm>>
    <associate|auto-173|<tuple|7.2.5.2|113|ch6_curved_meshes.tm>>
    <associate|auto-174|<tuple|7.3|113|ch6_curved_meshes.tm>>
    <associate|auto-175|<tuple|7.3.1|113|ch6_curved_meshes.tm>>
    <associate|auto-176|<tuple|7.3.2|115|ch6_curved_meshes.tm>>
    <associate|auto-177|<tuple|7.3.3|116|ch6_curved_meshes.tm>>
    <associate|auto-178|<tuple|7.4|116|ch6_curved_meshes.tm>>
    <associate|auto-179|<tuple|7.4|116|ch6_curved_meshes.tm>>
    <associate|auto-18|<tuple|3.1.4.4|26|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-180|<tuple|7.4|116|ch6_curved_meshes.tm>>
    <associate|auto-181|<tuple|7.4|117|ch6_curved_meshes.tm>>
    <associate|auto-182|<tuple|7.54|118|ch6_curved_meshes.tm>>
    <associate|auto-183|<tuple|7.5|118|ch6_curved_meshes.tm>>
    <associate|auto-184|<tuple|7.5|119|ch6_curved_meshes.tm>>
    <associate|auto-185|<tuple|7.55|119|ch6_curved_meshes.tm>>
    <associate|auto-186|<tuple|7.55|119|ch6_curved_meshes.tm>>
    <associate|auto-187|<tuple|7.56|120|ch6_curved_meshes.tm>>
    <associate|auto-188|<tuple|7.56|120|ch6_curved_meshes.tm>>
    <associate|auto-189|<tuple|7.56|121|ch6_curved_meshes.tm>>
    <associate|auto-19|<tuple|3.2|27|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-190|<tuple|7.58|123>>
    <associate|auto-2|<tuple|?|5|abstract.tm>>
    <associate|auto-20|<tuple|3.2.1|28|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-21|<tuple|3.2.2|29|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-22|<tuple|3.3|30|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-23|<tuple|3.1|31|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-24|<tuple|3.4|31|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-25|<tuple|3.5|32|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-26|<tuple|3.5.1|33|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-27|<tuple|3.5.1.1|33|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-28|<tuple|3.1|33|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-29|<tuple|3.2|34|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-3|<tuple|?|11|ch0_introduction.tm>>
    <associate|auto-30|<tuple|3.3|35|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-31|<tuple|3.4|35|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-32|<tuple|3.5|36|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-33|<tuple|3.6|36|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-34|<tuple|3.7|37|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-35|<tuple|3.8|37|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-36|<tuple|3.5.1.2|37|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-37|<tuple|3.9|38|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-38|<tuple|3.10|38|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-39|<tuple|3.11|38|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-4|<tuple|1|17|ch1_hyperbolic_conservation_laws.tm>>
    <associate|auto-40|<tuple|3.12|39|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-41|<tuple|3.13|39|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-42|<tuple|3.5.2|39|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-43|<tuple|3.14|40|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-44|<tuple|3.15|40|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-45|<tuple|3.16|40|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-46|<tuple|3.5.3|41|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-47|<tuple|3.17|41|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-48|<tuple|3.18|41|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-49|<tuple|3.19|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-5|<tuple|2|19|ch1b_finite_volume_method.tm>>
    <associate|auto-50|<tuple|3.5.4|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-51|<tuple|3.20|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-52|<tuple|3.6|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-53|<tuple|3.6.1|43|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-54|<tuple|3.21|43|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-55|<tuple|3.6.2|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-56|<tuple|3.22|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-57|<tuple|3.6.3|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-58|<tuple|3.23|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-59|<tuple|3.6.4|45|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-6|<tuple|2.1|19|ch1b_finite_volume_method.tm>>
    <associate|auto-60|<tuple|3.24|45|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-61|<tuple|3.6.5|45|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-62|<tuple|3.25|46|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-63|<tuple|3.6.6|46|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-64|<tuple|3.26|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-65|<tuple|3.27|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-66|<tuple|3.6.7|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-67|<tuple|3.28|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-68|<tuple|3.29|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-69|<tuple|3.7|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-7|<tuple|2.1|19|ch1b_finite_volume_method.tm>>
    <associate|auto-70|<tuple|3.8|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-71|<tuple|3.8.1|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-72|<tuple|3.30|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-73|<tuple|3.8.2|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-74|<tuple|3.31|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-75|<tuple|3.32|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-76|<tuple|3.33|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-77|<tuple|3.8.3|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-78|<tuple|3.34|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-79|<tuple|3.35|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-8|<tuple|2.2|20|ch1b_finite_volume_method.tm>>
    <associate|auto-80|<tuple|3.9|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-81|<tuple|3.9.1|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-82|<tuple|3.36|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-83|<tuple|3.37|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-84|<tuple|3.38|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-85|<tuple|3.9.2|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-86|<tuple|3.39|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-87|<tuple|3.40|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-88|<tuple|3.41|57|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-89|<tuple|3.10|57|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-9|<tuple|3|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-90|<tuple|A|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-91|<tuple|A.1|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-92|<tuple|A.1.1|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-93|<tuple|A.1.2|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-94|<tuple|A.1.3|59|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-95|<tuple|A.1.4|60|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-96|<tuple|B|61|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-97|<tuple|B.1|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-98|<tuple|B.2|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|auto-99|<tuple|B.1|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|bib-Abgrall2020|<tuple|1|123>>
    <associate|bib-Artzi2006|<tuple|11|123>>
    <associate|bib-Asthana2015|<tuple|3|123>>
    <associate|bib-Balsara2007|<tuple|8|123>>
    <associate|bib-Balsara2009a|<tuple|9|123>>
    <associate|bib-Batten1997|<tuple|10|123>>
    <associate|bib-Berthon2006|<tuple|12|123>>
    <associate|bib-Bezanson2017|<tuple|13|123>>
    <associate|bib-Biswas1994|<tuple|14|123>>
    <associate|bib-Burbeau2001|<tuple|15|123>>
    <associate|bib-Burger2017|<tuple|16|123>>
    <associate|bib-Butcher2016|<tuple|17|123>>
    <associate|bib-Canuto2007|<tuple|18|123>>
    <associate|bib-Carpenter1995|<tuple|19|123>>
    <associate|bib-Carrillo2021|<tuple|20|123>>
    <associate|bib-Carrillo2021a|<tuple|21|123>>
    <associate|bib-Castro2008|<tuple|23|123>>
    <associate|bib-Chen2016|<tuple|24|123>>
    <associate|bib-Choe1991|<tuple|25|123>>
    <associate|bib-Choe1992|<tuple|26|123>>
    <associate|bib-Cicchino2022|<tuple|27|124>>
    <associate|bib-Clain2011|<tuple|28|124>>
    <associate|bib-Cockburn1989|<tuple|30|124>>
    <associate|bib-Cockburn1989a|<tuple|31|124>>
    <associate|bib-Cockburn1991|<tuple|32|124>>
    <associate|bib-Cockburn1998a|<tuple|33|124>>
    <associate|bib-Cui2023|<tuple|34|124>>
    <associate|bib-Diot2012|<tuple|36|124>>
    <associate|bib-Diot2013|<tuple|37|124>>
    <associate|bib-Dumbser2006|<tuple|44|124>>
    <associate|bib-Dumbser2007|<tuple|43|124>>
    <associate|bib-Dumbser2008|<tuple|40|124>>
    <associate|bib-Dumbser2008a|<tuple|41|124>>
    <associate|bib-Dumbser2014|<tuple|39|124>>
    <associate|bib-Dumbser2018|<tuple|42|124>>
    <associate|bib-Dumbser2019|<tuple|38|124>>
    <associate|bib-Einfeldt1988|<tuple|46|124>>
    <associate|bib-Engquist1981|<tuple|48|124>>
    <associate|bib-Gassner2011a|<tuple|49|124>>
    <associate|bib-Glimm1985|<tuple|50|124>>
    <associate|bib-Gottlieb2001|<tuple|51|124>>
    <associate|bib-Guermond2016|<tuple|52|124>>
    <associate|bib-Guo2015|<tuple|53|124>>
    <associate|bib-Guthrey2019|<tuple|54|124>>
    <associate|bib-Han2010|<tuple|56|124>>
    <associate|bib-Harten1983a|<tuple|57|125>>
    <associate|bib-Hirsch1990|<tuple|59|125>>
    <associate|bib-Huynh2007|<tuple|61|125>>
    <associate|bib-Jameson2012|<tuple|62|125>>
    <associate|bib-Jiang1996|<tuple|63|125>>
    <associate|bib-Jiang2013|<tuple|64|125>>
    <associate|bib-Kaser2005|<tuple|65|125>>
    <associate|bib-Krivodonova2007|<tuple|67|125>>
    <associate|bib-Lax1954|<tuple|68|125>>
    <associate|bib-Lax1960|<tuple|70|125>>
    <associate|bib-Lax1998|<tuple|69|125>>
    <associate|bib-LeVeque1996|<tuple|72|125>>
    <associate|bib-Lee2021|<tuple|71|125>>
    <associate|bib-Lopez2014|<tuple|73|125>>
    <associate|bib-Lou2020|<tuple|74|125>>
    <associate|bib-Lu2021|<tuple|75|125>>
    <associate|bib-Mengaldo2015|<tuple|77|125>>
    <associate|bib-Montecinos2020|<tuple|79|125>>
    <associate|bib-Offner2019|<tuple|80|125>>
    <associate|bib-Pazner2021|<tuple|81|125>>
    <associate|bib-Peraire2012|<tuple|60|125>>
    <associate|bib-Peraire2013|<tuple|22|123>>
    <associate|bib-Persson2006|<tuple|82|125>>
    <associate|bib-Qiu2003|<tuple|86|125>>
    <associate|bib-Qiu2005|<tuple|83|125>>
    <associate|bib-Qiu2005b|<tuple|85|125>>
    <associate|bib-Qiu2007|<tuple|84|125>>
    <associate|bib-Rackauckas2017|<tuple|87|125>>
    <associate|bib-Ramirez2020|<tuple|92|126>>
    <associate|bib-Ranocha2022|<tuple|88|126>>
    <associate|bib-Roe1981|<tuple|90|126>>
    <associate|bib-Romero2016|<tuple|91|126>>
    <associate|bib-Rosa2018|<tuple|35|124>>
    <associate|bib-Rusanov1962|<tuple|95|126>>
    <associate|bib-Ruuth2002|<tuple|96|126>>
    <associate|bib-Safjan1995|<tuple|97|126>>
    <associate|bib-Shu1989|<tuple|99|126>>
    <associate|bib-Sod1978|<tuple|100|126>>
    <associate|bib-Sonntag2014|<tuple|101|126>>
    <associate|bib-Spiegel2016|<tuple|102|126>>
    <associate|bib-Spiteri2002|<tuple|103|126>>
    <associate|bib-Sun2017|<tuple|106|126>>
    <associate|bib-Tabarrok1994|<tuple|107|126>>
    <associate|bib-Takayama1991|<tuple|108|126>>
    <associate|bib-Titarev2002|<tuple|109|126>>
    <associate|bib-Titarev2005|<tuple|110|126>>
    <associate|bib-Toro1994|<tuple|113|126>>
    <associate|bib-Toro2001|<tuple|111|126>>
    <associate|bib-Toro2009|<tuple|114|126>>
    <associate|bib-Toro2020|<tuple|112|126>>
    <associate|bib-Trojak2021|<tuple|115|126>>
    <associate|bib-Tsitouras2011|<tuple|116|126>>
    <associate|bib-Vandenhoeck2019|<tuple|119|126>>
    <associate|bib-Vermeire2017|<tuple|120|126>>
    <associate|bib-Vilar2019|<tuple|121|126>>
    <associate|bib-Vincent2011|<tuple|123|127>>
    <associate|bib-Vincent2011a|<tuple|122|127>>
    <associate|bib-Vincent2015|<tuple|124|127>>
    <associate|bib-Vincent2016|<tuple|125|127>>
    <associate|bib-Volker2010|<tuple|104|126>>
    <associate|bib-Witherden2021|<tuple|126|127>>
    <associate|bib-Woodward1984|<tuple|127|127>>
    <associate|bib-Xu2019|<tuple|128|127>>
    <associate|bib-Xu2022|<tuple|129|127>>
    <associate|bib-Yee1999|<tuple|130|127>>
    <associate|bib-Youn1995|<tuple|131|127>>
    <associate|bib-Zhang1990|<tuple|132|127>>
    <associate|bib-Zhang2010b|<tuple|133|127>>
    <associate|bib-Zorio2017|<tuple|136|127>>
    <associate|bib-attig2011|<tuple|4|123>>
    <associate|bib-babbar2022|<tuple|7|123>>
    <associate|bib-cockburn2000|<tuple|29|124>>
    <associate|bib-dzanic2022|<tuple|45|124>>
    <associate|bib-emery1968|<tuple|47|124>>
    <associate|bib-ha2005|<tuple|55|124>>
    <associate|bib-henemann2021|<tuple|58|125>>
    <associate|bib-klockner2011|<tuple|66|125>>
    <associate|bib-meena2017|<tuple|76|125>>
    <associate|bib-moe2017|<tuple|78|125>>
    <associate|bib-naca1951|<tuple|2|123>>
    <associate|bib-paperrepo|<tuple|5|123>>
    <associate|bib-ramirez2021|<tuple|94|126>>
    <associate|bib-ramirez2022|<tuple|93|126>>
    <associate|bib-reed1973|<tuple|89|126>>
    <associate|bib-sedov1959|<tuple|98|126>>
    <associate|bib-subcommittee2014|<tuple|105|126>>
    <associate|bib-tenkai|<tuple|6|123>>
    <associate|bib-vanleer1977|<tuple|117|126>>
    <associate|bib-vanleer1984|<tuple|118|126>>
    <associate|bib-zhang2010c|<tuple|134|127>>
    <associate|bib-zhang2012|<tuple|135|127>>
    <associate|ch:10mom|<tuple|6|101|ch5_10_moment_problem.tm>>
    <associate|ch:con.law|<tuple|1|17|ch1_hyperbolic_conservation_laws.tm>>
    <associate|ch:curved.meshes|<tuple|7|103|ch6_curved_meshes.tm>>
    <associate|ch:fvm.dg|<tuple|2|19|ch1b_finite_volume_method.tm>>
    <associate|ch:lw.subcell.limiter|<tuple|4|65|ch3_blending_limiter.tm>>
    <associate|ch:lwfr|<tuple|3|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|ch:mdrk|<tuple|5|99|ch4_mdrk.tm>>
    <associate|defn:adm.pres|<tuple|4.1|66|ch3_blending_limiter.tm>>
    <associate|defn:mean.pres|<tuple|4.2|66|ch3_blending_limiter.tm>>
    <associate|eq:1deuler|<tuple|3.13|43|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2DMH1|<tuple|D.23|93|ch3_blending_limiter.tm>>
    <associate|eq:2DMH2|<tuple|D.24|93|ch3_blending_limiter.tm>>
    <associate|eq:2DMH3|<tuple|D.25|93|ch3_blending_limiter.tm>>
    <associate|eq:2Dupdates|<tuple|D.28|94|ch3_blending_limiter.tm>>
    <associate|eq:2d.adm.numflux.desired.x|<tuple|D.44|97|ch3_blending_limiter.tm>>
    <associate|eq:2d.adm.numflux.desired.y|<tuple|D.45|97|ch3_blending_limiter.tm>>
    <associate|eq:2d.hyp.con.law|<tuple|D.1|87|ch3_blending_limiter.tm>>
    <associate|eq:2d.low.update.admissibility.condn|<tuple|D.43|97|ch3_blending_limiter.tm>>
    <associate|eq:2d.mh.final.subs|<tuple|D.35|95|ch3_blending_limiter.tm>>
    <associate|eq:2d.new.cfl2|<tuple|D.10|95|ch3_blending_limiter.tm>>
    <associate|eq:2d.new.cfl3.conservative|<tuple|D.41|96|ch3_blending_limiter.tm>>
    <associate|eq:2d.xy.implies.admissibility|<tuple|D.46|97|ch3_blending_limiter.tm>>
    <associate|eq:2dadv|<tuple|B.1|61|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dburger|<tuple|3.22|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dcfldom|<tuple|B.2|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2deuler|<tuple|3.23|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dstate|<tuple|3.24|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dvaradv|<tuple|3.21|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:2dvaradv.chblend|<tuple|4.24|77|ch3_blending_limiter.tm>>
    <associate|eq:4to1proj|<tuple|7.54|117|ch6_curved_meshes.tm>>
    <associate|eq:Fblend|<tuple|4.11|68|ch3_blending_limiter.tm>>
    <associate|eq:VlVr|<tuple|2.1|20|ch1b_finite_volume_method.tm>>
    <associate|eq:adm2.coeff1|<tuple|D.39|95|ch3_blending_limiter.tm>>
    <associate|eq:adm2.coeff2|<tuple|D.40|96|ch3_blending_limiter.tm>>
    <associate|eq:all.fvm.updates|<tuple|D.13|90|ch3_blending_limiter.tm>>
    <associate|eq:blended.scheme|<tuple|4.7|67|ch3_blending_limiter.tm>>
    <associate|eq:boundary.normal.3d|<tuple|7.26|106|ch6_curved_meshes.tm>>
    <associate|eq:burrah!|<tuple|7.43|111|ch6_curved_meshes.tm>>
    <associate|eq:con.dg.poly.defns|<tuple|7.35|107|ch6_curved_meshes.tm>>
    <associate|eq:con.law|<tuple|4.1|65|ch3_blending_limiter.tm>>
    <associate|eq:con.law.dt|<tuple|D.8|88|ch3_blending_limiter.tm>>
    <associate|eq:conservative.curl.form|<tuple|7.46|112|ch6_curved_meshes.tm>>
    <associate|eq:contravariant.as.covariant|<tuple|7.25|106|ch6_curved_meshes.tm>>
    <associate|eq:conv.pres.con.law|<tuple|4.6|66|ch3_blending_limiter.tm>>
    <associate|eq:cross.product.form|<tuple|7.45|112|ch6_curved_meshes.tm>>
    <associate|eq:cross.product.form.2d|<tuple|7.48|112|ch6_curved_meshes.tm>>
    <associate|eq:defn1.div|<tuple|7.2|103|ch6_curved_meshes.tm>>
    <associate|eq:delta.defn|<tuple|4.15|70|ch3_blending_limiter.tm>>
    <associate|eq:dg.collocated|<tuple|7.51|114|ch6_curved_meshes.tm>>
    <associate|eq:divergence.con.form|<tuple|7.17|105|ch6_curved_meshes.tm>>
    <associate|eq:divergence.transform.contravariant|<tuple|7.27|106|ch6_curved_meshes.tm>>
    <associate|eq:dt.lw|<tuple|4.23|74|ch3_blending_limiter.tm>>
    <associate|eq:evolution|<tuple|4.17|71|ch3_blending_limiter.tm>>
    <associate|eq:evolution.general|<tuple|D.5|87|ch3_blending_limiter.tm>>
    <associate|eq:fder|<tuple|3.6|24|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:fo.at.face|<tuple|4.13|70|ch3_blending_limiter.tm>>
    <associate|eq:fr.update.curvilinear|<tuple|7.36|109|ch6_curved_meshes.tm>>
    <associate|eq:fravgup|<tuple|4.5|66|ch3_blending_limiter.tm>>
    <associate|eq:frcontflux|<tuple|4.4|65|ch3_blending_limiter.tm>>
    <associate|eq:ft.defn|<tuple|7.38|110|ch6_curved_meshes.tm>>
    <associate|eq:gradient.transform.contravariant|<tuple|7.28|106|ch6_curved_meshes.tm>>
    <associate|eq:gradient.transformation|<tuple|7.22|106|ch6_curved_meshes.tm>>
    <associate|eq:interpolation.operator|<tuple|7.30|106|ch6_curved_meshes.tm>>
    <associate|eq:invariant.curl.form|<tuple|7.47|112|ch6_curved_meshes.tm>>
    <associate|eq:kx.defn|<tuple|D.31|94|ch3_blending_limiter.tm>>
    <associate|eq:laup|<tuple|3.12|30|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:low.order.cell.avg.update|<tuple|4.10|68|ch3_blending_limiter.tm>>
    <associate|eq:low.order.tilde.update|<tuple|4.22|72|ch3_blending_limiter.tm>>
    <associate|eq:low.order.update|<tuple|4.9|68|ch3_blending_limiter.tm>>
    <associate|eq:low.update.2d|<tuple|D.42|97|ch3_blending_limiter.tm>>
    <associate|eq:lwfr.update.curvilinear|<tuple|7.37|109|ch6_curved_meshes.tm>>
    <associate|eq:lwtay|<tuple|3.1|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:metric.identities|<tuple|7.19|105|ch6_curved_meshes.tm>>
    <associate|eq:metric.identity.contravariant|<tuple|7.29|106|ch6_curved_meshes.tm>>
    <associate|eq:mh.at.face|<tuple|4.18|71|ch3_blending_limiter.tm>>
    <associate|eq:mu.pm|<tuple|D.7|88|ch3_blending_limiter.tm>>
    <associate|eq:muscl.final.general|<tuple|D.6|88|ch3_blending_limiter.tm>>
    <associate|eq:muxy.defn|<tuple|D.27|93|ch3_blending_limiter.tm>>
    <associate|eq:new.cfl1|<tuple|D.11|89|ch3_blending_limiter.tm>>
    <associate|eq:new.cfl1.2d|<tuple|D.34|94|ch3_blending_limiter.tm>>
    <associate|eq:new.cfl2|<tuple|D.14|90|ch3_blending_limiter.tm>>
    <associate|eq:new.cfl3|<tuple|D.18|91|ch3_blending_limiter.tm>>
    <associate|eq:new.cfl3.conservative|<tuple|D.20|92|ch3_blending_limiter.tm>>
    <associate|eq:nfdiss1|<tuple|3.7|27|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:nfdiss2|<tuple|3.8|27|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:nflin1|<tuple|3.10|28|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:nflin2|<tuple|3.11|28|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:non.cell.centred.defn|<tuple|D.3|87|ch3_blending_limiter.tm>>
    <associate|eq:non.con.face.defn1|<tuple|D.22|93|ch3_blending_limiter.tm>>
    <associate|eq:numflux.admissibility.cfl|<tuple|D.2|87|ch3_blending_limiter.tm>>
    <associate|eq:pk.slope.correction|<tuple|4.21|71|ch3_blending_limiter.tm>>
    <associate|eq:projection.integral.equation|<tuple|7.56|119|ch6_curved_meshes.tm>>
    <associate|eq:pstar|<tuple|A.1|60|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:reconstruction|<tuple|4.16|70|ch3_blending_limiter.tm>>
    <associate|eq:reconstruction.general|<tuple|D.4|87|ch3_blending_limiter.tm>>
    <associate|eq:riemann.problem|<tuple|4.14|70|ch3_blending_limiter.tm>>
    <associate|eq:shuosher|<tuple|3.17|45|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:smoothing|<tuple|4.12|69|ch3_blending_limiter.tm>>
    <associate|eq:sod|<tuple|3.15|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:state|<tuple|3.14|43|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:subcell.defn|<tuple|4.8|67|ch3_blending_limiter.tm>>
    <associate|eq:surface.cov|<tuple|7.10|104|ch6_curved_meshes.tm>>
    <associate|eq:tavgflux|<tuple|3.2|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:tavgsol|<tuple|3.9|28|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:time.step.2d|<tuple|4.25|78|ch3_blending_limiter.tm>>
    <associate|eq:transformed.conservation.law|<tuple|7.31|107|ch6_curved_meshes.tm>>
    <associate|eq:transformed.pde.1|<tuple|7.33|107|ch6_curved_meshes.tm>>
    <associate|eq:transformed.pde.2|<tuple|7.34|107|ch6_curved_meshes.tm>>
    <associate|eq:tvgproperty|<tuple|3.3|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:uXidefn|<tuple|7.5|119|ch6_curved_meshes.tm>>
    <associate|eq:uad.form|<tuple|4.2|65|ch3_blending_limiter.tm>>
    <associate|eq:uj.nph.s|<tuple|D.12|90|ch3_blending_limiter.tm>>
    <associate|eq:uj.nph.s.explicit|<tuple|D.15|91|ch3_blending_limiter.tm>>
    <associate|eq:ujph.s.identity|<tuple|D.19|91|ch3_blending_limiter.tm>>
    <associate|eq:unphsxy|<tuple|D.36|95|ch3_blending_limiter.tm>>
    <associate|eq:up2d|<tuple|3.20|49|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:update.x.combination|<tuple|D.29|94|ch3_blending_limiter.tm>>
    <associate|eq:update.x.combination2|<tuple|D.30|94|ch3_blending_limiter.tm>>
    <associate|eq:uplwfr|<tuple|3.4|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:upmean|<tuple|3.5|24|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|eq:us.conservative|<tuple|D.21|92|ch3_blending_limiter.tm>>
    <associate|eq:us.defn.main|<tuple|4.19|71|ch3_blending_limiter.tm>>
    <associate|eq:uss.defn|<tuple|D.16|91|ch3_blending_limiter.tm>>
    <associate|eq:ustar.2d|<tuple|D.26|93|ch3_blending_limiter.tm>>
    <associate|eq:ustar.defn|<tuple|D.10|89|ch3_blending_limiter.tm>>
    <associate|eq:ustar.in.uad|<tuple|4.20|71|ch3_blending_limiter.tm>>
    <associate|eq:ut.defn|<tuple|7.39|110|ch6_curved_meshes.tm>>
    <associate|eq:utt.defn|<tuple|7.40|110|ch6_curved_meshes.tm>>
    <associate|eq:volume.cov|<tuple|7.13|105|ch6_curved_meshes.tm>>
    <associate|eq:wss.simplified|<tuple|D.17|91|ch3_blending_limiter.tm>>
    <associate|eq:xi0.defn|<tuple|4.3|65|ch3_blending_limiter.tm>>
    <associate|fig:2dcfl_g2|<tuple|B.2|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:2dcfl_radau|<tuple|B.1|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:ShuOsher|<tuple|3.24|45|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:ShuOsher.chblend|<tuple|4.3|75|ch3_blending_limiter.tm>>
    <associate|fig:ShuOsherCorr|<tuple|3.28|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:alpha.func|<tuple|4.2|69|ch3_blending_limiter.tm>>
    <associate|fig:astrophysical.jet|<tuple|4.13|82|ch3_blending_limiter.tm>>
    <associate|fig:blast|<tuple|3.25|46|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:blast.chblend|<tuple|4.4|75|ch3_blending_limiter.tm>>
    <associate|fig:blast.periodic|<tuple|4.15|83|ch3_blending_limiter.tm>>
    <associate|fig:blast.periodic.reference|<tuple|4.14|82|ch3_blending_limiter.tm>>
    <associate|fig:bucklev1|<tuple|3.20|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:burg1|<tuple|3.17|41|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:burg2|<tuple|3.18|41|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:burg4|<tuple|3.19|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla1|<tuple|3.1|33|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla2|<tuple|3.2|34|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla2_dirichlet|<tuple|3.5|36|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla3|<tuple|3.3|35|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla4|<tuple|3.4|35|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:cla5|<tuple|3.6|36|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:composite.signal.2d|<tuple|4.8|78|ch3_blending_limiter.tm>>
    <associate|fig:conv linear adv 2d|<tuple|3.30|50|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:conv linear rotate 2d|<tuple|3.32|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:conv_burger2d|<tuple|3.35|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:diff.volume|<tuple|7.3|105|ch6_curved_meshes.tm>>
    <associate|fig:dmr|<tuple|4.11|80|ch3_blending_limiter.tm>>
    <associate|fig:dmr.plot|<tuple|3.39|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:dmr.plot.zoom|<tuple|3.40|56|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:dmr.wct|<tuple|3.41|57|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:dofs2d|<tuple|3.29|48|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:double.rarefaction|<tuple|4.6|77|ch3_blending_limiter.tm>>
    <associate|fig:dwave|<tuple|3.21|43|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:forward.step|<tuple|4.17|84|ch3_blending_limiter.tm>>
    <associate|fig:fv.evolution|<tuple|D.3|90|ch3_blending_limiter.tm>>
    <associate|fig:general.grid|<tuple|D.1|87|ch3_blending_limiter.tm>>
    <associate|fig:hat1|<tuple|3.9|38|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:hat2|<tuple|3.10|38|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:hat3|<tuple|3.11|38|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:interactions|<tuple|3.33|52|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:isentropic.convergence|<tuple|3.36|54|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:isentropic.convergence.chblend|<tuple|4.9|79|ch3_blending_limiter.tm>>
    <associate|fig:isentropic.ratios.vs.grid.1.2.3.4|<tuple|3.38|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:isentropic.time.vs.error|<tuple|3.37|55|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:kh|<tuple|4.12|81|ch3_blending_limiter.tm>>
    <associate|fig:lax|<tuple|3.23|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:leblanc|<tuple|4.7|77|ch3_blending_limiter.tm>>
    <associate|fig:lin2d_rotate_soln|<tuple|3.31|51|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:lineplot_burg2d|<tuple|3.34|53|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:mult1|<tuple|3.12|39|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:mult2|<tuple|3.13|39|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:non.interacting.rp1|<tuple|D.2|89|ch3_blending_limiter.tm>>
    <associate|fig:non.interacting.rp2|<tuple|D.4|91|ch3_blending_limiter.tm>>
    <associate|fig:numflux_toro5_contact|<tuple|3.27|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:numflx|<tuple|3.26|47|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:rp2d|<tuple|4.10|79|ch3_blending_limiter.tm>>
    <associate|fig:sedov.blast|<tuple|4.5|76|ch3_blending_limiter.tm>>
    <associate|fig:shock.diffraction|<tuple|4.16|83|ch3_blending_limiter.tm>>
    <associate|fig:sod|<tuple|3.22|44|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:solflux1|<tuple|2.1|19|ch1b_finite_volume_method.tm>>
    <associate|fig:subcells|<tuple|4.1|67|ch3_blending_limiter.tm>>
    <associate|fig:surface.element|<tuple|7.2|104|ch6_curved_meshes.tm>>
    <associate|fig:vla1|<tuple|3.14|40|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:vla2|<tuple|3.15|40|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:vla3|<tuple|3.16|40|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:wp1|<tuple|3.7|37|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|fig:wp2|<tuple|3.8|37|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|lemma:2d.muscl.step2.general|<tuple|D.10|95|ch3_blending_limiter.tm>>
    <associate|lemma:2d.muscl.step3.conservative|<tuple|D.11|96|ch3_blending_limiter.tm>>
    <associate|lemma:avg.riemann.problem|<tuple|D.9|88|ch3_blending_limiter.tm>>
    <associate|lemma:m.h.step.1|<tuple|D.2|89|ch3_blending_limiter.tm>>
    <associate|lemma:m.h.step.1.2d|<tuple|D.9|94|ch3_blending_limiter.tm>>
    <associate|lemma:muscl.step2.general|<tuple|D.3|90|ch3_blending_limiter.tm>>
    <associate|lemma:muscl.step3.conservative|<tuple|D.5|92|ch3_blending_limiter.tm>>
    <associate|lemma:muscl.step3.wss|<tuple|D.4|91|ch3_blending_limiter.tm>>
    <associate|part:abstract.tm|<tuple|?|5>>
    <associate|part:acknowledgements.tm|<tuple|?|3>>
    <associate|part:ch0_introduction.tm|<tuple|?|9>>
    <associate|part:ch1_hyperbolic_conservation_laws.tm|<tuple|?|15>>
    <associate|part:ch1b_finite_volume_method.tm|<tuple|1|19>>
    <associate|part:ch2_lax_wendroff_flux_reconstruction.tm|<tuple|1|23>>
    <associate|part:ch3_blending_limiter.tm|<tuple|C.0.4.0.2|64>>
    <associate|part:ch4_mdrk.tm|<tuple|D.1|99>>
    <associate|part:ch5_10_moment_problem.tm|<tuple|2|101>>
    <associate|part:ch6_curved_meshes.tm|<tuple|1|101>>
    <associate|part:declaration_acknowledgements.tm|<tuple|?|2>>
    <associate|rmk:mh.restriction.for.fr|<tuple|D.7|92|ch3_blending_limiter.tm>>
    <associate|rmk:why.same.flux|<tuple|4.3|68|ch3_blending_limiter.tm>>
    <associate|sec: vla|<tuple|3.5.2|39|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:2d.admissibility|<tuple|D.5.3|96|ch3_blending_limiter.tm>>
    <associate|sec:2d.mh|<tuple|D.5|93|ch3_blending_limiter.tm>>
    <associate|sec:DFR|<tuple|3.1.3|25|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:admissibility.preservation|<tuple|4.4|72|ch3_blending_limiter.tm>>
    <associate|sec:alg|<tuple|4.5|73|ch3_blending_limiter.tm>>
    <associate|sec:alw|<tuple|3.1.4|25|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:blast.chblend|<tuple|4.6.1.2|75|ch3_blending_limiter.tm>>
    <associate|sec:blending.scheme|<tuple|4.2.2|67|ch3_blending_limiter.tm>>
    <associate|sec:cla|<tuple|3.5.1|33|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:cons.lw|<tuple|7.2|107|ch6_curved_meshes.tm>>
    <associate|sec:controlling.oscillations|<tuple|4.2|66|ch3_blending_limiter.tm>>
    <associate|sec:dmr|<tuple|4.8.3|80|ch3_blending_limiter.tm>>
    <associate|sec:fo|<tuple|4.2.4|70|ch3_blending_limiter.tm>>
    <associate|sec:four1d|<tuple|3.3|30|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:fourier2d|<tuple|B|61|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:frdfr|<tuple|C|63|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:free.stream.lwfr|<tuple|7.2.4|110|ch6_curved_meshes.tm>>
    <associate|sec:lim|<tuple|3.4|31|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:lw|<tuple|3.1|23|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:mh|<tuple|4.3|70|ch3_blending_limiter.tm>>
    <associate|sec:mh.adm|<tuple|D.3|88|ch3_blending_limiter.tm>>
    <associate|sec:muscl.admissibility.proof|<tuple|D|87|ch3_blending_limiter.tm>>
    <associate|sec:num.results.chblend|<tuple|4.6|74|ch3_blending_limiter.tm>>
    <associate|sec:numflux|<tuple|3.2|27|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:reconstruction|<tuple|3.1.2|24|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:res1dsys|<tuple|3.6|42|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:res1dsys.chblend|<tuple|4.6.1|74|ch3_blending_limiter.tm>>
    <associate|sec:rk|<tuple|2.2|20|ch1b_finite_volume_method.tm>>
    <associate|sec:satisfying.identities|<tuple|7.2.5|111|ch6_curved_meshes.tm>>
    <associate|sec:scl|<tuple|2.1|19|ch1b_finite_volume_method.tm>>
    <associate|sec:sedov.blast.1d|<tuple|4.6.1.3|76|ch3_blending_limiter.tm>>
    <associate|sec:shuosher.blend|<tuple|4.6.1.1|74|ch3_blending_limiter.tm>>
    <associate|sec:smooth.ind|<tuple|4.2.3|68|ch3_blending_limiter.tm>>
    <associate|sec:sum|<tuple|3.10|57|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|sec:sum.blend|<tuple|4.9|84|ch3_blending_limiter.tm>>
    <associate|sec:transformation|<tuple|7.1|103|ch6_curved_meshes.tm>>
    <associate|sec:tvd|<tuple|4.2.1|66|ch3_blending_limiter.tm>>
    <associate|tab:2Dcfl|<tuple|B.1|62|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|tab:cfl|<tuple|3.1|31|ch2_lax_wendroff_flux_reconstruction.tm>>
    <associate|thm:dmi.2d|<tuple|7.8|112|ch6_curved_meshes.tm>>
    <associate|thm:final.condn.conservative|<tuple|D.6|92|ch3_blending_limiter.tm>>
    <associate|thm:final.condn.conservative.2d|<tuple|D.12|96|ch3_blending_limiter.tm>>
    <associate|thm:lwfr.admissibility|<tuple|4.5|72|ch3_blending_limiter.tm>>
    <associate|thm:muscl.admissibility.theorem|<tuple|4.4|71|ch3_blending_limiter.tm>>
    <associate|thm:non.conservative.mh|<tuple|D.8|93|ch3_blending_limiter.tm>>
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

      Huynh2007

      Vincent2011a

      Vincent2011a

      Vincent2011a

      Vincent2011a

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

      Romero2016

      babbar2022

      zhang2010c

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989a

      Cockburn1991

      Cockburn1989

      Rusanov1962

      Persson2006

      klockner2011

      henemann2021

      henemann2021

      Canuto2007

      Persson2006

      henemann2021

      henemann2021

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

      ramirez2021

      Zhang2010b

      moe2017

      moe2017

      ramirez2021

      Zhang2010b

      Zhang2010b

      ramirez2021

      Zhang2010b

      Zhang2010b

      ramirez2021

      babbar2022

      henemann2021

      Ranocha2022

      tenkai

      paperrepo

      babbar2022

      Shu1989

      Qiu2005b

      Woodward1984

      Qiu2005b

      sedov1959

      zhang2012

      Zhang2010b

      LeVeque1996

      babbar2022

      henemann2021

      Ranocha2022

      Yee1999

      Spiegel2016

      Glimm1985

      Zhang1990

      Lax1998

      Zhang1990

      Lax1998

      Woodward1984

      Volker2010

      Volker2010

      ha2005

      zhang2010c

      ramirez2021

      Takayama1991

      henemann2021

      naca1951

      henemann2021

      emery1968

      Woodward1984

      babbar2022

      henemann2021

      zhang2010c

      henemann2021

      Berthon2006

      Berthon2006

      babbar2022

      Zhang2010b

      Cui2023

      babbar2022

      Huynh2007

      Cicchino2022

      Mengaldo2015
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|2.1>||(a) Piecewise
      polynomial solution at time <with|mode|<quote|math>|t<rsub|n>>, and (b)
      discontinuous and continuous flux.>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.1>||Error convergence
      for constant linear advection; (a) GL points, (b) GLL points. The
      different colors correspond to degrees
      <with|mode|<quote|math>|N=1,2,3,4> from top to
      bottom.>|<pageref|auto-28>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.2>||Error convergence
      for constant linear advection; (a) GL points , (b) GLL points. The
      different colors correspond to degrees
      <with|mode|<quote|math>|N=1,2,3,4> from top to
      bottom.>|<pageref|auto-29>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.3>||Error versus time
      for constant linear advection, initial condition
      <with|mode|<quote|math>|u(x, 0) = \\sin(2 \<pi\> x)>,
      <with|mode|<quote|math>|x\<in\> [0,1]>, for different polynomial
      degrees, each with 200 dofs; GL solution points and Radau correction.
      (a) <with|mode|<quote|math>|N=1>, (b) <with|mode|<quote|math>|N=2>, (c)
      <with|mode|<quote|math>|N=3>, (d) <with|mode|<quote|math>|N=4>.>|<pageref|auto-30>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.4>|| Semi-log plot of
      relative change in L2 norm versus time for constant linear advection
      with the initial condition <with|mode|<quote|math>|u(x, 0) =
      sin(2\<pi\>x), x \<in\> [0, 1]> for different polynomial degrees, each
      with 200 dofs; GL solution points and Radau
      correction.>|<pageref|auto-31>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.5>||Convergence for
      constant linear advection with Dirichlet boundary conditions; (a) using
      CFL numbers of LW-D1 for all schemes, (b) using corresponding CFL
      number for each scheme. The different colors correspond to degrees N =
      1, 2, 3, 4 from top to bottom.>|<pageref|auto-32>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.6>|| Semi-log plot of
      relative change in <with|mode|<quote|math>|L<rsub|2>> norm versus time
      for constant linear advection, with initial condition
      <with|mode|<quote|math>|u(x, 0) = sin(2\<pi\>x), x \<in\> [0, 1]>
      together with Dirichlet boundary conditions, for different polynomial
      degrees, each with 200 dofs; GL solution points and Radau
      correction.>|<pageref|auto-33>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.7>||Constant linear
      advection of a wave packet; solution at time <with|mode|<quote|math>|t
      = 1> with 160 dofs using polynomial degree (a)
      <with|mode|<quote|math>|N = 3>, (b) <with|mode|<quote|math>|N =
      4>.>|<pageref|auto-34>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.8>||Error convergence
      for constant linear advection of a wave packet; (a) GL points, (b) GLL
      points. The different colors correspond to degrees N = 1, 2, 3, 4 from
      top to bottom.>|<pageref|auto-35>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.9>|| Constant linear
      advection of hat profile without limiter. The solution is shown at time
      t = 1 with 200 dofs using polynomial degree (a)
      <with|mode|<quote|math>|N = 3>, (b) <with|mode|<quote|math>|N =
      4>.>|<pageref|auto-37>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.10>|| Constant linear
      advection of hat profile with TVB limiter (<with|mode|<quote|math>|M =
      100>). The solution is shown at time <with|mode|<quote|math>|t = 1> and
      200 dofs using polynomial degree (a) <with|mode|<quote|math>|N = 3>,
      (b) <with|mode|<quote|math>|N = 4>.>|<pageref|auto-38>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.11>|| Constant linear
      advection of hat profile with TVB limiter (<with|mode|<quote|math>|M =
      100>) where Runge-Kutta time integration is performed using RK65
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>[<write|bib|Tsitouras2011><reference|bib-Tsitouras2011>].
      The solution is shown at time <with|mode|<quote|math>|t = 1> and 200
      dofs using polynomial degree <with|mode|<quote|math>|N =
      4>.>|<pageref|auto-39>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.12>||Constant linear
      advection of a composite profile without limiter. The solution is shown
      at time <with|mode|<quote|math>|t = 8> using 400 dofs in each case and
      polynomial degree (a) <with|mode|<quote|math>|N = 3>, (b)
      <with|mode|<quote|math>|N = 4>.>|<pageref|auto-40>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.13>||Constant linear
      advection of a composite profile with TVB limiter
      (<with|mode|<quote|math>|M = 50>). The solution is shown at time
      <with|mode|<quote|math>|t = 8> using 400 dofs in each case and
      polynomial degree (a) <with|mode|<quote|math>|N = 3>, (b)
      <with|mode|<quote|math>|N = 4>.>|<pageref|auto-41>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.14>|| Error
      convergence for variable linear advection with
      <with|mode|<quote|math>|a(x) = x>: (a) AE scheme, (b) EA scheme, (c) AE
      vs EA.>|<pageref|auto-43>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.15>|| Error
      convergence for variable linear advection with
      <with|mode|<quote|math>|a(x) = x<rsup|2>>: (a) AE scheme, (b) EA
      scheme, (c) AE vs EA.>|<pageref|auto-44>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.16>|| Error versus
      time for linear advection with wave speed <with|mode|<quote|math>|a(x)
      = x<rsup|2>> for different polynomial degrees; GL solution points,
      Radau correction and polynomial degree (a) <with|mode|<quote|math>|N =
      3>, (b) <with|mode|<quote|math>|N = 4>.>|<pageref|auto-45>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.17>||Solution of 1-D
      Burger's equation with <with|mode|<quote|math>|N=3> and 100 cells at
      different time instants. TVB limiter <with|mode|<quote|math>|(M=1)> is
      used. The reference solution is computed using RKFR, degree
      <with|mode|<quote|math>|N=1>, on a mesh of 3500
      cells.>|<pageref|auto-47>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.18>||Error
      convergence for 1-D Burger's equation at time
      <with|mode|<quote|math>|t=2>. (a) AE vs EA, (b) Radau vs g2, EA scheme,
      (c) LW-EA vs RK.>|<pageref|auto-48>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.19>||Error
      convergence for 1-D Burger's equation at time
      <with|mode|<quote|math>|t=2>; effect of numerical fluxes for
      <with|mode|<quote|math>|N=1,3>. (a) AE scheme, (b) EA
      scheme.>|<pageref|auto-49>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.20>||Solution of 1-D
      Burger's equation with <with|mode|<quote|math>|N=3> and 100 cells at
      different time instants. TVB limiter <with|mode|<quote|math>|(M=1)> is
      used. The reference solution is computed using RKFR, degree
      <with|mode|<quote|math>|N=1>, on a mesh of 3500
      cells.>|<pageref|auto-51>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|3.21>|>
        Density error convergence for 1-D Euler's equation at time
        <with|mode|<quote|math>|t=1>. The different colors correspond to
        degrees <with|mode|<quote|math>|N=1,2,3,4> from top to bottom. (a) GL
        points, (b) GLL points.
      </surround>|<pageref|auto-54>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.22>||Numerical
      solutions of 1-D Euler equations (Sod's test case) obtained by LW and
      RK schemes for polynomial degree (a) <with|mode|<quote|math>|N=3> and
      (b) <with|mode|<quote|math>|N=4> using Radau correction function and GL
      solution points. The solutions are shown at time
      <with|mode|<quote|math>|t=0.2> on a mesh of
      <with|mode|<quote|math>|100> cells with Rusanov flux and D2
      dissipation. The TVB limiter is used with the parameter
      <with|mode|<quote|math>|M=10>.>|<pageref|auto-56>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.23>|| Numerical
      solutions of 1-D Euler equations (Lax's test case) obtained by LW and
      RK schemes for polynomial degree (a) <with|mode|<quote|math>|N = 3> and
      (b) <with|mode|<quote|math>|N = 4> with Radau correction function and
      GL solution points. The solutions are computed on a mesh of 200 cells
      with dissipation model D2 and Rusanov numerical flux and are shown at
      time <with|mode|<quote|math>|t = 1.3>. The TVB limiter is used with
      parameter <with|mode|<quote|math>|M = 1>.>|<pageref|auto-58>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.24>||Numerical
      solutions of 1-D Euler equations (Shu-Osher problem) obtained by LW and
      RK schemes for (a, c) <with|mode|<quote|math>|N=3> and (b, d)
      <with|mode|<quote|math>|N=4> with Radau correction function and GL
      solution points. The enlarged plot of the oscillatory portion is given
      in the bottom row. The solutions are shown at time
      <with|mode|<quote|math>|t=1.8> on a mesh of 400 cells with dissipation
      model D2 and Rusanov numerical flux. \ The TVB limiter is used with
      parameter <with|mode|<quote|math>|M=300>.>|<pageref|auto-60>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.25>||. Numerical
      solutions of 1-D Euler equations (Blast wave) obtained by LWFR and RKFR
      schemes for (a) <with|mode|<quote|math>|N = 3> and (b)
      <with|mode|<quote|math>|N = 4> using Radau correction function and GL
      solution points. The solutions are plotted at time
      <with|mode|<quote|math>|t = 0.038> on a mesh of 400 cells with
      dissipation model D2 and Rusanov numerical flux. The corresponding CFL
      numbers of LWFR scheme are chosen from the Table
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|tab:cfl>
      and kept same for the RKFR schemes. TVB limiter is used with the
      parameter <with|mode|<quote|math>|M = 300> and the EA scheme is used
      for numerical flux.>|<pageref|auto-62>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.26>||Numerical
      solutions of 1-D Euler equations (Blast wave) obtained by LW schemes
      with different numerical fluxes (a) LF, (b) HLL, (c) HLLC and (d) ROE
      compared with Rusanov flux, for <with|mode|<quote|math>|N=3> using
      Radau correction function and GL solution points. All other parameters
      remain the same as in Figure <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|fig:blast>.>|<pageref|auto-64>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.27>||Numerical
      solutions of 1-D Euler's equations for (a) stationary contact test, (b)
      Toro's Test 5 obtained by LW schemes with different numerical fluxes
      for polynomial degree <with|mode|<quote|math>|N=4> using Radau
      correction function and GL solution points, TVB
      <with|mode|<quote|math>|<around|(|M=1|)>> limiter on a grid of 100
      cells.>|<pageref|auto-65>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.28>||Numerical
      solutions of 1-D Euler equations (Shu-Osher problem) for (a)
      <with|mode|<quote|math>|N=1>, (b) <with|mode|<quote|math>|N=2>, (c)
      <with|mode|<quote|math>|N=3>, (d) <with|mode|<quote|math>|N=4>.
      Comparison of LW scheme with GL solution points for two correction
      functions, Radau and g2, with their own CFL numbers chosen from Table
      <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>><reference|tab:cfl>,
      except for <with|mode|<quote|math>|g<rsub|2>> correction function with
      <with|mode|<quote|math>|N=1>, where we choose CFL=0.44. The enlarged
      oscillatory portion of the solutions are shown. The solutions are
      computed at time <with|mode|<quote|math>|t=1.8> on a mesh of 400 cells
      with dissipation model D2 and HLLC numerical flux. The TVB limiter is
      used with parameter <with|mode|<quote|math>|M=300>.>|<pageref|auto-67>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.29>||Location of
      solution points and flux points. Numerical flux is required at the blue
      points on the faces.>|<pageref|auto-68>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.30>||Error
      convergence test for 2-D linear advection equation with velocity
      <with|mode|<quote|math>|\<b-a\>=<around|(|1,1|)>> at
      <with|mode|<quote|math>|t=1.0>, initial data
      <with|mode|<quote|math>|u<rsub|0>*<around|(|x,y|)>=sin
      <around|(|2*\<pi\>*x|)>*sin <around|(|2*\<pi\>*y|)>>; (a) GL points,
      (b) GLL points. The different colors correspond to degrees
      <with|mode|<quote|math>|N=1,2,3,4> from top to
      bottom.>|<pageref|auto-72>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.31>||Linear advection
      with velocity <with|mode|<quote|math>|\<b-a\>=<around|(|-y,x|)>> on
      <with|mode|<quote|math>|<around|[|0,1|]>\<times\><around|[|0,1|]>> with
      inflow/outflow boundary condition. The solutions are shown on a mesh of
      <with|mode|<quote|math>|50\<times\>50> cells with polynomial degree
      <with|mode|<quote|math>|N=3>; (a) initial solution, (b) LWFR,
      <with|mode|<quote|math>|t=<frac|\<pi\>|2>> (c) RKFR,
      <with|mode|<quote|math>|t=<frac|\<pi\>|2>>.>|<pageref|auto-74>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.32>||Error
      convergence test for 2-D linear advection equation with velocity
      <with|mode|<quote|math>|\<b-a\>=<around|(|-y,x|)>> at
      <with|mode|<quote|math>|t=<frac|\<pi\>|2>>, initial data
      <with|mode|<quote|math>|u<rsub|0>*<around|(|x,y|)>=1+exp
      <around|(|-50*<around|(|<around|(|x-1/2|)><rsup|2>+y<rsup|2>|)>|)>>
      using (a) GL points, (b) GLL points.>|<pageref|auto-75>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.33>||Numerical
      solutions of composite signal with velocity
      <with|mode|<quote|math>|a=(<frac|1|2>-y,x-<frac|1|2>)> obtained for
      degree <with|mode|<quote|math>|N=3> using Radau correction function and
      GL solution points. The solutions are plotted after 1 period of
      rotation on a mesh of <with|mode|<quote|math>|100\<times\>100> cells;
      No limiter is used in (b), (c) and TVB limiter
      <with|mode|<quote|math>|(M=100)> is used in (d), (e).
      >|<pageref|auto-76>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|3.34>|>
        Line plot across the diagonal of <with|mode|<quote|math>|[0, 1]
        \<times\> [0, 1]> of the solution of 2-D Burger's equation with 50
        \<times\> 50 cells and degree <with|mode|<quote|math>|N = 3>. The
        reference solution for <with|mode|<quote|math>|t = 0.2> is computed
        using RKFR scheme with degree <with|mode|<quote|math>|N = 1> on a
        mesh of 1000 \<times\> 1000 cells.
      </surround>|<pageref|auto-78>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.35>||Error
      convergence test for 2-D Burger's equation with initial condition
      <with|mode|<quote|math>|u*<around|(|x,y,0|)>=<with|mode|<quote|math>|<with|math-display|<quote|true>|<frac|1|4>>>+<with|mode|<quote|math>|<with|math-display|<quote|true>|<frac|1|2>>>*sin<around|(|2*\<pi\>*<around|(|x+y|)>|)>>
      in the domain <with|mode|<quote|math>|<around|[|0,1|]>\<times\><around|[|0,1|]>>
      comparing the two boundary fluxes of LWFR (a) AE, (b) EA. The errors
      are computed at <with|mode|<quote|math>|t=0.1>.>|<pageref|auto-79>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.36>||<with|mode|<quote|math>|L<rsup|2>>
      error and Wall Clock Time (WCT) analysis of 2-D Euler equations
      (isentropic vortex) against grid resolution comparing LW-D1, LW-D2 and
      RK is shown in (a) and (b) respectively. The error is computed after
      one period. The time step size of each scheme is computed using its
      optimal CFL from Fourier stability analysis.>|<pageref|auto-82>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.37>||Wall Clock Time
      (WCT) versus <with|mode|<quote|math>|L<rsup|2>> error for 2-D Euler
      equations (isentropic vortex) comparing LW-D1, LW-D2 and RK for degrees
      <with|mode|<quote|math>|N=1,2,3,4>. The different colors correspond to
      different degrees, with the degree increasing from right to left. The
      error is computed after one period. The time step size of each scheme
      is computed using its optimal CFL number from Fourier stability
      analysis.>|<pageref|auto-83>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.38>||Wall Clock Time
      (WCT) ratios versus grid resolution for 2-D Euler equations (isentropic
      vortex). (a) WCT ratio of LW-D1 and LW-D2, (b) WCT ratio of RK and
      LW-D2. The error is computed after one period. The time step size of
      each scheme is computed using its optimal CFL number from Fourier
      stability analysis.>|<pageref|auto-84>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.39>||Density profile
      of numerical solutions of 2-D Euler equations (double Mach reflection
      problem) at <with|mode|<quote|math>|t=0.2> for
      <with|mode|<quote|math>|N=2>, with <with|mode|<quote|math>|\<Delta\>*x=\<Delta\>*y=1/240>.
      Contours of 30 steps from 1.4 to 22.5 are printed.>|<pageref|auto-86>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.40>||Wall Clock Time
      (WCT) ratios versus grid resolution for 2-D Euler equations (isentropic
      vortex). (a) WCT ratio of LW-D1 and LW-D2, (b) WCT ratio of RK and
      LW-D2. The error is computed after one period. The time step size of
      each scheme is computed using its optimal CFL number from Fourier
      stability analysis.>|<pageref|auto-87>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3.41>||<with|mode|<quote|math>|L<rsup|2>>
      error and Wall Clock Time (WCT) analysis of 2-D Euler equations
      (isentropic vortex) against grid resolution comparing LW-D1, LW-D2 and
      RK is shown in (a) and (b) respectively. The error is computed after
      one period. The time step size of each scheme is computed using its
      optimal CFL from Fourier stability analysis.>|<pageref|auto-88>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|B.1>||Stability regions
      of LWFR scheme with the Radau correction function and D2 dissipation
      model in two dimensions. (a) <with|mode|<quote|math>|N=1>, (b)
      <with|mode|<quote|math>|N=2>, (c) <with|mode|<quote|math>|N=3>, (d)
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-97>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|B.2>||Stability regions
      of LWFR scheme with the Radau correction function and D2 dissipation
      model in two dimensions. (a) <with|mode|<quote|math>|N=1>, (b)
      <with|mode|<quote|math>|N=2>, (c) <with|mode|<quote|math>|N=3>, (d)
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-98>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.1>||Subcells used by
      lower order scheme for degree <with|mode|<quote|math>|N=4>.>|<pageref|auto-106>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.2>||Logistic function
      used to map energy to a smoothness coefficient
      <with|mode|<quote|math>|\<alpha\>\<in\><around|[|0,1|]>> shown for
      various solution polynomial degrees
      <with|mode|<quote|math>|N>.>|<pageref|auto-108>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.3>||Shu-Osher
      problem, numerical solution with degree <with|mode|<quote|math>|N=4>
      using first order (FO) and MUSCL-Hancock (MH) blending schemes, and TVB
      limited scheme (TVB-300) with parameter <with|mode|<quote|math>|M=300>.
      (a) Full and (b) zoomed density profiles of numerical solutions are
      shown up to time <with|mode|<quote|math>|t=1.8> on a mesh of 400
      cells.>|<pageref|auto-117>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.4>||Blast wave
      problem, numerical solution with degree <with|mode|<quote|math>|N=4>
      using first order (FO) and MUSCL-Hancock (MH) blending schemes, and TVB
      limited scheme (TVB-300) with parameter <with|mode|<quote|math>|M=300>.
      (a) Density, (b) pressure profiles are shown at time
      <with|mode|<quote|math>|t=0.038> on a mesh of 400
      cells.>|<pageref|auto-119>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.5>||Sedov's blast
      wave problem, numerical solution with degree
      <with|mode|<quote|math>|N=4> using first order (FO) and MUSCL-Hancock
      blending schemes. (a) Density and (b) pressure profiles of numerical
      solutions are plotted at time <with|mode|<quote|math>|t=0.001> on a
      mesh of <with|mode|<quote|math>|201> cells.>|<pageref|auto-121>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.6>||Double
      rarefaction problem, numerical solution with degree
      <with|mode|<quote|math>|N=4> using first order (FO) and MUSCL-Hancock
      (MH) blending. (a) Density and (b) pressure profiles of numerical
      solutions are plotted at <with|mode|<quote|math>|t=0.6> on a mesh of
      <with|mode|<quote|math>|200> cells.>|<pageref|auto-123>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.7>||Leblanc's test,
      numerical solution with polynomial degree <with|mode|<quote|math>|N=4>
      using first order (FO) and MUSCL-Hancock (MH) blending. (a) Density and
      (b) pressure profiles of numerical solutions with log-scales are
      plotted at <with|mode|<quote|math>|t=0.001> on a mesh of
      <with|mode|<quote|math>|800> cells.>|<pageref|auto-124>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.8>||Rotation of a
      composite signal with velocity <with|mode|<quote|math>|<rigid|<with|mode|<quote|text>|<with|font-family|<quote|rm>|font-series|<quote|bold>|font-shape|<quote|right>|a>>>=<around|(|<frac|1|2>-y,x-<frac|1|2>|)>>,
      numerical solution with polynomial degree <with|mode|<quote|math>|N=4>
      on a mesh of <with|mode|<quote|math>|100<rsup|2>>
      elements.>|<pageref|auto-126>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.9>||Convergence
      analysis of isentropic vortex test for polynomial degrees
      <with|mode|<quote|math>|N=3,4> when (a) the blending limiter is active
      (b) no limiter is active.>|<pageref|auto-129>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.10>||2-D Riemann
      problem, density plots of numerical solution at
      <with|mode|<quote|math>|t=0.25> for degree <with|mode|<quote|math>|N=4>
      on a <with|mode|<quote|math>|256\<times\>256>
      mesh.>|<pageref|auto-131>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.11>||Double Mach
      reflection problem, density plots of numerical solution at
      <with|mode|<quote|math>|t=0.2> using polynomial degree
      <with|mode|<quote|math>|N=4> on a <with|mode|<quote|math>|600\<times\>150>
      mesh zoomed near the primary triple point. >|<pageref|auto-133>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.12>||Kelvin-Helmholtz
      instability, density plots of numerical solution at
      <with|mode|<quote|math>|t=0.4> using polynomial degree
      <with|mode|<quote|math>|N=4> with Rusanov flux on a
      <with|mode|<quote|math>|256<rsup|2>> element mesh.>|<pageref|auto-135>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.13>||Mach 2000
      astrophysical jet, density plot of numerical solution in log scales on
      <with|mode|<quote|math>|400\<times\>400> mesh at time
      <with|mode|<quote|math>|t=0.001>.>|<pageref|auto-137>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.14>||Sedov's blast
      test with periodic domain, density plot of numerical solution on
      <with|mode|<quote|math>|128\<times\>128> mesh in log scales with degree
      <with|mode|<quote|math>|N=4> at (a) <with|mode|<quote|math>|t=2> and
      (b) <with|mode|<quote|math>|t=20> with polynomial degree
      <with|mode|<quote|math>|N=4> computed using
      <with|font-family|<quote|tt>|Trixi.jl>.>|<pageref|auto-139>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.15>||Sedov's blast
      test with periodic domain, density plot of numerical solution on
      <with|mode|<quote|math>|64\<times\>64> mesh in log scales at
      <with|mode|<quote|math>|t=20> with degree
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-140>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.16>||Shock
      diffraction test, numerical solution at time
      <with|mode|<quote|math>|t=0.01> with degree
      <with|mode|<quote|math>|N=4>.>|<pageref|auto-142>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|4.17>||Forward facing
      step, density plots of numerical solution at time
      <with|mode|<quote|math>|t=3.0>. The meshes are formed by taking grid
      spacing <with|mode|<quote|math>|\<Delta\>x<rsub|max>=\<Delta\>y<rsub|max>>
      away from the corner and smaller grid spacing
      <with|mode|<quote|math>|\<Delta\>x<rsub|min>=\<Delta\>y<rsub|min>=<frac|1|4>*\<Delta\>x<rsub|max>>
      near the corner.>|<pageref|auto-144>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|D.1>||Non-uniform,
      non-cell-centered finite volume grid>|<pageref|auto-148>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|D.2>||Two
      non-interacting Riemann problems>|<pageref|auto-151>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|D.3>||Finite volume
      evolution>|<pageref|auto-152>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|D.4>||Two
      non-interacting Riemann problems>|<pageref|auto-153>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.1>|>
        Covariant and contravariant coordinate vectors in relation to the
        coordinate lines
      </surround>|<pageref|auto-163>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.2>|>
        Surface element vector computed from covariant basis vectors
      </surround>|<pageref|auto-164>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7.3>|>
        Differential volume element for divergence
      </surround>|<pageref|auto-165>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7.4>||Illustration of
      refinement and coarsening>|<pageref|auto-180>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|7.5>||(a) Prolongation
      to mortar and computation of numerical flux
      <with|mode|<quote|math>|F<rsub|\<Xi\><rsub|1>>,F<rsub|\<Xi\><rsub|2>>>,
      (b) Projection of numerical flux to interfaces>|<pageref|auto-183>>
    </associate>
    <\associate|parts>
      <tuple|declaration_acknowledgements.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|acknowledgements.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|abstract.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|ch0_introduction.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|ch1_hyperbolic_conservation_laws.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|ch1b_finite_volume_method.tm|chapter-nr|1|section-nr|0|subsection-nr|0>

      <tuple|ch2_lax_wendroff_flux_reconstruction.tm|chapter-nr|2|section-nr|2|subsection-nr|0>

      <tuple|ch3_blending_limiter.tm|chapter-nr|3|section-nr|0|subsection-nr|4>

      <tuple|ch4_mdrk.tm|chapter-nr|4|section-nr|5|subsection-nr|3>

      <tuple|ch5_10_moment_problem.tm|chapter-nr|5|section-nr|0|subsection-nr|3>

      <tuple|ch6_curved_meshes.tm|chapter-nr|6|section-nr|0|subsection-nr|3>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|3.1>||CFL numbers for
      1-D LWFR using the two dissipation models and correction
      functions>|<pageref|auto-23>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|B.1>||Two dimensional
      CFL condition defined in equation <no-break><specific|screen|<resize|<move|<with|color|<quote|#A0A0FF>|->|-0.3em|>|0em||0em|>>(<reference|eq:2dcfldom>)
      for LWFR method with the dissipation model D2 and two correction
      functions>|<pageref|auto-99>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Acknowledgements>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|1.<space|2spc>conservation
      laws> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|2.<space|2spc>Finite
      volume method, Discontinuous Galerkin and Flux Reconstruction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-5><vspace|0.5fn>

      2.1.<space|2spc>Scalar conservation law
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      2.2.<space|2spc>Runge-Kutta FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|3.<space|2spc>Lax-Wendroff
      Flux Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-9><vspace|0.5fn>

      3.1.<space|2spc>Lax-Wendroff FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      <with|par-left|<quote|1tab>|3.1.1.<space|2spc>Conservation property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|3.1.2.<space|2spc>Reconstruction of the
      time average flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|3.1.3.<space|2spc>Direct flux
      reconstruction (DFR) scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|3.1.4.<space|2spc>Approximate Lax-Wendroff
      procedure <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|2tab>|3.1.4.1.<space|2spc>Second order scheme,
      <with|mode|<quote|math>|N=1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|3.1.4.2.<space|2spc>Third order scheme,
      <with|mode|<quote|math>|N=2> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|2tab>|3.1.4.3.<space|2spc>Fourth order scheme,
      <with|mode|<quote|math>|N=3> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|2tab>|3.1.4.4.<space|2spc>Fifth order scheme,
      <with|mode|<quote|math>|N=4> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      3.2.<space|2spc>Numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      <with|par-left|<quote|1tab>|3.2.1.<space|2spc>Numerical flux \U average
      and extrapolate to face (AE) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|3.2.2.<space|2spc>Numerical flux \U
      extrapolate to face and average (EA)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      3.3.<space|2spc>Fourier stability analysis in 1-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      3.4.<space|2spc>TVD limiter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      3.5.<space|2spc>Numerical results in 1-D: scalar problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      <with|par-left|<quote|1tab>|3.5.1.<space|2spc>Linear advection
      equation: constant speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>>

      <with|par-left|<quote|2tab>|3.5.1.1.<space|2spc>Smooth solutions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <with|par-left|<quote|2tab>|3.5.1.2.<space|2spc>Non-smooth solutions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>>

      <with|par-left|<quote|1tab>|3.5.2.<space|2spc>Linear advection
      equation: variable speed <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>>

      <with|par-left|<quote|1tab>|3.5.3.<space|2spc>Inviscid Burgers'
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>>

      <with|par-left|<quote|1tab>|3.5.4.<space|2spc>Non-convex problem:
      Buckley-Leverett equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>>

      3.6.<space|2spc>Numerical results in 1-D: Euler equations
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>

      <with|par-left|<quote|1tab>|3.6.1.<space|2spc>Smooth solution
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>>

      <with|par-left|<quote|1tab>|3.6.2.<space|2spc>Sod's shock tube problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>>

      <with|par-left|<quote|1tab>|3.6.3.<space|2spc>Lax problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>>

      <with|par-left|<quote|1tab>|3.6.4.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>>

      <with|par-left|<quote|1tab>|3.6.5.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>>

      <with|par-left|<quote|1tab>|3.6.6.<space|2spc>Numerical fluxes: LF,
      Roe, HLL and HLLC <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-63>>

      <with|par-left|<quote|1tab>|3.6.7.<space|2spc>Comparison of correction
      functions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-66>>

      3.7.<space|2spc>Two dimensional scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-69>

      3.8.<space|2spc>Numerical results in 2D: scalar problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-70>

      <with|par-left|<quote|1tab>|3.8.1.<space|2spc>Advection of a smooth
      signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-71>>

      <with|par-left|<quote|1tab>|3.8.2.<space|2spc>Rotation of a composite
      signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-73>>

      <with|par-left|<quote|1tab>|3.8.3.<space|2spc>Inviscid Burgers'
      equation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-77>>

      3.9.<space|2spc>Numerical results in 2-D: Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-80>

      <with|par-left|<quote|1tab>|3.9.1.<space|2spc>Isentropic vortex
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-81>>

      <with|par-left|<quote|1tab>|3.9.2.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-85>>

      3.10.<space|2spc>Summary and conclusions
      \ <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-89>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      A.<space|2spc>Numerical flux> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-90><vspace|0.5fn>

      A.1.<space|2spc>Some numerical fluxes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-91>

      <with|par-left|<quote|1tab>|A.1.1.<space|2spc>Rusanov flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-92>>

      <with|par-left|<quote|1tab>|A.1.2.<space|2spc>Roe flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-93>>

      <with|par-left|<quote|1tab>|A.1.3.<space|2spc>HLL flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-94>>

      <with|par-left|<quote|1tab>|A.1.4.<space|2spc>HLLC flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-95>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      B.<space|2spc>Fourier stability analysis in 2-D>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-96><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      C.<space|2spc>equivalence with direct flux reconstruction (DFR)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-100><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|4.<space|2spc>Admissibility
      preserving subcell based blending limiter for Lax-Wendroff Flux
      Reconstruction> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-101><vspace|0.5fn>

      4.1.<space|2spc>Lax-Wendroff FR scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-102>

      4.2.<space|2spc>On controlling oscillations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-103>

      <with|par-left|<quote|1tab>|4.2.1.<space|2spc>TVD limiter
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-104>>

      <with|par-left|<quote|1tab>|4.2.2.<space|2spc>Blending scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-105>>

      <with|par-left|<quote|1tab>|4.2.3.<space|2spc>Smoothness indicator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-107>>

      <with|par-left|<quote|1tab>|4.2.4.<space|2spc>First order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-109>>

      4.3.<space|2spc>Higher order blending
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-110>

      <with|par-left|<quote|1tab>|Slope limiting in practice
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-111>>

      4.4.<space|2spc>Flux limiter for admissibility preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-112>

      4.5.<space|2spc>Some implementation details
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-113>

      4.6.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-114>

      <with|par-left|<quote|1tab>|4.6.1.<space|2spc>1-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-115>>

      <with|par-left|<quote|2tab>|4.6.1.1.<space|2spc>Shu-Osher problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-116>>

      <with|par-left|<quote|2tab>|4.6.1.2.<space|2spc>Blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-118>>

      <with|par-left|<quote|2tab>|4.6.1.3.<space|2spc>Sedov's blast wave
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-120>>

      <with|par-left|<quote|2tab>|4.6.1.4.<space|2spc>Riemann problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-122>>

      4.7.<space|2spc>2-D advection equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-125>

      4.8.<space|2spc>2-D Euler equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-127>

      <with|par-left|<quote|1tab>|4.8.1.<space|2spc>Isentropic vortex
      convergence test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-128>>

      <with|par-left|<quote|1tab>|4.8.2.<space|2spc>2-D Riemann problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-130>>

      <with|par-left|<quote|1tab>|4.8.3.<space|2spc>Double Mach reflection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-132>>

      <with|par-left|<quote|1tab>|4.8.4.<space|2spc>Kelvin-Helmholtz
      instability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-134>>

      <with|par-left|<quote|1tab>|4.8.5.<space|2spc>Astrophysical jet
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-136>>

      <with|par-left|<quote|1tab>|4.8.6.<space|2spc>Sedov's blast case with
      periodic boundary conditions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-138>>

      <with|par-left|<quote|1tab>|4.8.7.<space|2spc>Detonation shock
      diffraction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-141>>

      <with|par-left|<quote|1tab>|4.8.8.<space|2spc>Forward facing step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-143>>

      4.9.<space|2spc>Summary and conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-145>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Appendix
      D.<space|2spc>Admissibility of MUSCL-Hancock scheme for general grids>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-146><vspace|0.5fn>

      D.1.<space|2spc>Review of MUSCL-Hancock scheme
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-147>

      D.2.<space|2spc>Primary generalization for proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-149>

      D.3.<space|2spc>Proving admissibility
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-150>

      D.4.<space|2spc>Non-conservation reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-154>

      D.5.<space|2spc>MUSCL-Hancock scheme in 2-D
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-155>

      <with|par-left|<quote|1tab>|D.5.1.<space|2spc>First evolution step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-156>>

      <with|par-left|<quote|1tab>|D.5.2.<space|2spc>Finite volume step
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-157>>

      <with|par-left|<quote|1tab>|D.5.3.<space|2spc>Limiting numerical flux
      in 2-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-158>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|5.<space|2spc>Multi-derivative
      Runge-Kutta schemes in Flux Reconstruction framework>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-159><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|6.<space|2spc>10
      Moment Problem> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-160><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|7.<space|2spc>Lax-Wendroff
      Flux Reconstruction on curved geometries>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-161><vspace|0.5fn>

      7.1.<space|2spc>Transformation of conservation law
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-162>

      7.2.<space|2spc>Conservative Lax-Wendroff Flux Reconstruction (LWFR) on
      curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-166>

      <with|par-left|<quote|1tab>|7.2.1.<space|2spc>Discontinuous Galerkin
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-167>>

      <with|par-left|<quote|1tab>|7.2.2.<space|2spc>Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-168>>

      <with|par-left|<quote|1tab>|7.2.3.<space|2spc>Lax-Wendroff Flux
      Reconstruction (LWFR) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-169>>

      <with|par-left|<quote|1tab>|7.2.4.<space|2spc>Free stream preservation
      for LWFR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-170>>

      <with|par-left|<quote|1tab>|7.2.5.<space|2spc>Satisfying metric
      identities <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-171>>

      <with|par-left|<quote|2tab>|7.2.5.1.<space|2spc>Evaluating metrics in
      two space dimensions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-172>>

      <with|par-left|<quote|2tab>|7.2.5.2.<space|2spc>Evaluating metrics in
      three space dimensions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-173>>

      7.3.<space|2spc>Non-conservative Lax-Wendroff Flux Reconstruction (FR)
      on curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-174>

      <with|par-left|<quote|1tab>|7.3.1.<space|2spc>Non-conservative
      Discontinuous Galerkin (DG) method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-175>>

      <with|par-left|<quote|1tab>|7.3.2.<space|2spc>Flux Reconstruction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-176>>

      <with|par-left|<quote|1tab>|7.3.3.<space|2spc>Free stream preservation
      for Lax-Wendroff scheme <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-177>>

      7.4.<space|2spc>Adaptive mesh refinement
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-178>

      <with|par-left|<quote|1tab>|Refinement and coarsening
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-179>>

      <with|par-left|<quote|1tab>|Projection for coarsening
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-181>>

      <with|par-left|<quote|1tab>|Handling mortars
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-182>>

      <with|par-left|<quote|1tab>|Prolongation to mortars
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-184>>

      <with|par-left|<quote|1tab>|Calculation of mortar flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-185>>

      <with|par-left|<quote|1tab>|Projection of numerical fluxes from mortars
      to faces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-186>>

      <with|par-left|<quote|2tab>|Conservation property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-187>>

      <with|par-left|<quote|2tab>|Upwind / outflow property
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-188>>

      <with|par-left|<quote|2tab>|Free stream preservation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-189>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-190><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>