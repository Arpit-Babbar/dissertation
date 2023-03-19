<TeXmacs|2.1>

<style|<tuple|tmbook|old-lengths|preview-ref>>

<\body>
  <\hide-preamble>
    #Partial Derivative symbol

    <assign|pdv|<\macro|num|den>
      <frac|\<partial\> <arg|num>|\<partial\> <arg|den>>
    </macro>>

    <assign|pdv*|<\macro|degree|num|den>
      <frac|<math|\<partial\><rsup|<arg|degree>><arg|num>>|\<partial\>
      <math|<arg|den><rsup|<arg|degree>>>>
    </macro>>

    #Ordinary derivative symbol

    <assign|dv|<\macro|num|den>
      <frac|\<mathd\><arg|num>|\<mathd\><arg|den>>
    </macro>>

    <assign|Dv|<\macro|num|den>
      <frac|D<arg|num>|D<arg|den>>
    </macro>>

    <assign|dv*|<\macro|degree|num|den>
      <frac|<math|d<rsup|<arg|degree>><arg|num>>|d
      <math|<arg|den><rsup|<arg|degree>>>>
    </macro>>

    <assign|Dv*|<\macro|degree|num|den>
      <frac|<math|D<rsup|<arg|degree>><arg|num>>|D
      <math|<arg|den><rsup|<arg|degree>>>>
    </macro>>

    #Bold symbols - Start

    <assign|bC|<macro|\<b-C\>>>

    <assign|bd|<macro|\<b-d\>>>

    <assign|bD|<macro|\<b-D\>>>

    <assign|be|<macro|\<b-e\>>>

    <assign|bE|<macro|\<b-E\>>>

    <assign|bof|<macro|\<b-f\>>>

    <assign|bF|<macro|\<b-F\>>>

    <assign|bg|<macro|\<b-g\>>>

    <assign|bG|<macro|\<b-G\>>>

    <assign|bl|<macro|\<b-l\>>>

    <assign|bM|<macro|\<b-M\>>>

    <assign|bp|<macro|\<b-p\>>>

    <assign|bP|<macro|\<b-P\>>>

    <assign|bq|<macro|\<b-q\>>>

    <assign|bS|<macro|\<b-S\>>>

    <assign|br|<macro|\<b-r\>>>

    <assign|bu|<macro|\<b-u\>>>

    <assign|bv|<macro|\<b-v\>>>

    <assign|bw|<macro|<math|<with|font-series|bold|u>>>>

    <assign|bx|<macro|\<b-x\>>>

    #Bold symbols-end

    \;

    <assign|subequation|<\macro|body>
      <surround|<next-equation><new-counter|subequation>||<with|equation|<\macro|body>
        <\surround|<next-subequation>|>
          <\equation-lab>
            <arg|body>
          </equation-lab|<the-equation><number|<the-subequation>|alpha>>
        </surround>
      </macro>|next-number|<macro|<next-subequation><with|mode|text|font-shape|right|(<the-equation><number|<the-subequation>|alpha>)>>|<arg|body>>>
    </macro>>

    # Source - <hlink|Numeration of subequation like 1a, 1b etc - General -
    GNU TeXmacs Forum|http://forum.texmacs.cn/t/numeration-of-subequation-like-1a-1b-etc/332/2>
  </hide-preamble>

  <\enumerate>
    <item>Every bullet is an unroll

    <item>Blue colour indicates where to hover the mouse, what text to
    select, etc.
  </enumerate>

  <section*|Title>

  Thank you for attending my TMC meeting, I'd be speaking about Lax-Wendroff
  schemes in FR framework. I'd make my proposals on how to limit them and
  study their relation with ADER.

  <section*|Outline>

  <\itemize>
    <item>Review of previous year's work

    <item>I'll show the subcell based blending limiter we are propsing

    <item>Use blending limiter to extend Zhang-Shu's limiter to Lax-Wendroff,
    leading to a provably admissibility preserving Lax-Wendroff scheme

    <item>I'd show how to use an admissibility preserving MUSCL-Hancock with
    blending.

    <item>Study relation between ADER and Lax-Wendroff

    <item>1-D and 2-D numerical results showing accuracy and robustness

    <item>A bit about implementation details in Julia

    <item>Ending with a summary and reading activities I did in the year
  </itemize>

  <section*|Flux Reconstruction : grid>

  <\itemize>
    <item>I explain Flux Reconstruction for hyperbolic conservation laws,

    <item>We break the domain into cells in\ 

    <item>each of which we put <math|N+1> degrees of freedom so that the
    approximate solution <math|u<rsub|h>> is locally a polynomial of degree
    <math|N>. The faces of the <math|e<rsup|th>> cell are
    <math|x<rsub|e\<pm\><frac|1|2>>>, where the solution is allowed to be
    discontinuous. The reference cell is <math|<around*|[|0,1|]>> with
    reference variable <math|\<xi\>>.
  </itemize>

  <section*|Flux reconstruction : ODE>

  The overall idea of FR is to construct a degree <math|N+1> continuous flux
  approximation taking numerical flux values at the interfaces and then using
  it to convert the conservation law to an ODE. A motivation to keep it at
  degree <math|N+1> is to get the same degree for LHS and RHS here. Now to
  complete the explanation of FR, I need to explain how to construct this
  continuous flux.

  <section*|Flux reconstruction : Continuous flux>

  To construct the continuous flux, we require the discontinuous flux,
  numerical flux and correction functions. Discontinuous flux function is the
  degree <math|N> polynomial obtained which agrees with the flux function at
  the solution points. Corrector functions <math|g<rsub|L>,g<rsub|R>> are
  degree <math|N+1> polynomials that take the value <math|1> at one interface
  and <math|0> at the other; so we can use them to correct the discontinuous
  flux to set the corresponding numerical flux value at the left
  <with|color|blue|select left correction in <math|f<rsub|h>> definition> and
  right interface <with|color|blue|select left correction in <math|f<rsub|h>>
  definition> respectively. This gives us the continuous flux polynomial and
  we can use it to performed evolution as shown in<text-dots>
  <with|color|blue|Hover over to 4 to go to the previous slide, don't press
  Page up> the previous slide.

  <section*|Lax-Wendroff Flux Reconstruction (LWFR) with D2 dissipation>

  <\itemize>
    <item>Performing a Taylor expansion in time and using the conservation
    law to replace one temporal derivative with spatial, we can write
    evolution to the next time as follows. To approximate these time
    derivatives, we will have to use the conservation law again. There's
    various ways of doing it, we choose

    <item>the Approximate Lax-Wendroff procedure where we use finite
    difference in time and approximate the time nodal values by Taylor's
    theorem to reduce to spatial derivatives. We chose this approach to avoid
    computing large Jacobian matrices.

    <item>This procedure will give us discontinuous flux polynomial, which we
    will correct with Flux Reconstruction.

    <item>In the past works, the dissipative part of numerical flux has been
    computed using the solution polynomial.\ 

    <item>However, in our last work, we proposed computing the dissipation
    with the time averaged of the solution polynomial which is already
    available through the Lax-Wendroff procedure. This gives makes Rusanov's
    flux upwind for constant linear advection and leads to higher CFL
    numbers.
  </itemize>

  <section*|Extension to 2-D>

  <\itemize>
    <item>For 2-D conservation laws, our reference map is a tensor product of
    1-D reference maps

    <item>Conversion of temporal derivatives to spatial now has gives both
    the <math|x,y> fluxes. Applying the approximate Lax-Wendroff procedure to
    approximate these will give us

    <item>the discontinuous approximation to <math|x,y> fluxes
    <with|color|blue|Select <math|F<rsub|h><rsup|\<delta\>>,G<rsub|h><rsup|\<delta\>>>>.

    <item>At each of the solution points on the face, we construct the
    continuous <math|x,y> fluxes following same procedure as 1-D

    <item>and then we can perform the FR corrected update as in 1-D.
  </itemize>

  <section*|Blending limiter (Hennemann Et Al.)>

  <\itemize>
    <item>Let's see a brief overview of subcell based blending limiters. The
    high order update can be written like <with|color|blue|hover over
    <math|<with|font-series|bold|u><rsub|e><rsup|H,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|H>>>.

    <item>We will create a<with|font-series|bold| subcell based lower order
    scheme> which can also be written in the same way ,

    <item>and then we can naturally blend the two residuals and perform a
    limited update.

    <item>There's two things that we need to specify. First, how we compute
    the lower order residual and how we choose the blending factor
    <math|\<alpha\><rsub|e>>. Let's first decide how we choose the
    <math|\<alpha\><rsub|e>>.
  </itemize>

  <section*|Choice of <math|\<alpha\><rsub|e>>>

  <\itemize>
    <item>We follow the procedure of Hennmann Et Al. We choose the blending
    coefficient by a smoothness indicator based on Legendre expansion
    <with|color|blue|select <math|\<epsilon\>=<big|sum><rsub|j=1><rsup|N+1>m<rsub|j>L<rsub|j>,<space|2em>m<rsub|j>=<around*|\<langle\>|\<epsilon\>,L<rsub|j>|\<rangle\>><rsub|L<rsup|2>>,>>
    The measure of smoothness is dictated by the content of highest order
    coefficient in comparison to the rest.

    <item>We have put parameters <math|\<beta\><rsub|1>,\<beta\><rsub|2>> as
    coefficients of the constant nodes. We have found them to be problem
    dependent, while they have always been kept to be equal to <math|1> in
    the literature.

    <item>After this, we decide the quantity whose smoothness we are going to
    be measure. For Euler's equations, <math|\<epsilon\>=\<rho\>*p> was used
    by Henneman Et Al, and we found the same to perform well.\ 

    <item>Finally, we map these values to the interval
    <math|<around*|[|0,1|]>> to be used as blending coefficients.
  </itemize>

  \;

  <section*|Lower order update>

  <\itemize>
    <item>We begin to understand the lower order update by understanding what
    the precise subcells are.\ 

    <item>We choose them so that size of <math|j<rsup|th>> subcell would be
    of the <math|j<rsup|th>> quadrature weight. Thus, the subcells are not
    uniform and that the solution values, staying the same, are not
    corresponding to cell centres of the subcells.

    <item>In the inner subfaces, we pick the numerical flux according to the
    lower order scheme, which would be MUSCL-Hancock in our case. At the
    faces which are shared by the FR cells, we use a blended numerical flux.
    Even the numerical flux used by the higher order scheme will be replaced
    by the blended numerical flux. The benefit of the choice of subcells
    would be that both the cell averages of both high order and low order
    schemes would evolve -

    <item> - like this. That is, conservation is maintained. It is to get
    this conservation that we use the subcells as above. But, we have to be
    carefully choose this blended flux. Otherwise, our lower order residual
    may not be admissibility preserving. More specifically, we first make
    corrections to preserve admissibility at the first and last solution
    points.
  </itemize>

  <section*|Interface numerical flux>

  <\itemize>
    <item>We pick an initial candidate where the blending coefficient is
    chosen to be the average of its neighbours. This choice already gives a
    balance between accuracy and robustness.

    <item>Recall that we are interested in making corrections for the last
    solution point. With this candidate, the candidate update would look like
    this. It is <with|font-shape|italic|not> guaranteed to be admissible.

    <item>We assume that admissibility can be written as positivity of a
    concave function.

    <item>Now, a purely low order flux update would preserve admissibility.
    So, we do have an admissible reference where blended flux has been
    replaced with the purely low order one. Ideally, we'd like to find the
    optimal, admissible convex combination between the two. But, that would
    be an expensive, problem dependent procedure. So, we instead do find the
    <math|\<theta\>> that is used for Zhang-Shu's limiter in practice.\ 

    <item>With this, we can replace the candidate flux with a flux that
    preserves admissibility of the last solution point like this

    <item>The complete procedure would require the same procedure on the
    first point on the <math|e+1<rsup|th>> cell. Also, if there are multiple
    variables, we correct them successively. With this, we have chosen the
    numerical flux that will be shared by both the residuals.
  </itemize>

  <section*|Extension of Zhang-Shu's limiter to Lax-Wendroff schemes>

  <\itemize>
    <item>Our lower order update explicitly looks as follows,

    <item>and the way we corrected the time averages flux now ensures
    admissibility,

    <item>so that the conservation property actually implies that the cell
    averages of blended scheme now preserve admissibility.

    <item>We can now apply Zhang-Shu's limiter to obtain an admissibility
    preserving Lax-Wendroff scheme.

    <item>That is, their idea too was of doing something to keep cell
    averages admissible to use Zhang-Shu's limiter. However, their idea was
    to directly correct cell averages which would require additional cell
    loop and storage. The advantage of our proposed approach is that we don't
    require any additional cell/face loops and there are very little storage
    requirements.

    <item>Other approach is to aposteriorily modify <math|\<alpha\><rsub|e>>,
    which will also require additional storage.
  </itemize>

  <section*|Low order residual : MUSCL-Hancock>

  <\itemize>
    <item>Now we explain the final ingredient in understanding the scheme
    which is how we do the MUSCL-Hancock reconstruction. The derivation
    starts by integrating the conservation law in space-time. Here we have
    the numerical flux at each time level.

    <item>We approximate the time integral with mid-point rule,

    <item>leaving us with these time level <math|n+1/2> quantities to compute
    at the faces,\ 

    <item>which we compute by a finite difference method applied to the
    conservation law,

    <item>where we require reconstruction of approximate solution to the
    face. Here we have to account for non-centred nature of the grid.
    <with|color|red|Slope is an approximate to the first derivative> Also, we
    use the <math|\<beta\>>-minmod limiter for the grid, where the
    <math|\<beta\>> parameter is chosen according to the smoothness
    indicator.

    Now, we want this procedure to be admissibility preserving. It is not
    guaranteed by default so we have to limit this slope further to ensure
    it.

    Our arguments will first ensure that evolution to <math|n+1/2> is
    admissible and then the final FVM type update.
  </itemize>

  <section*|Admissibility of low order method>

  We will understand it in isolation of blending. Basically, we'd beed
  admissibility of MUSCL-Hancock procedure for finite volume grids which are
  not cell-centred; the solution point could be anywhere.

  This theorem gives the final requirement for admissibility of
  MUSCL-Hancock, for conservative reconstruction \ <with|color|blue|select
  <math|u<rsub|i><rsup|n,\<pm\>>> definitions>. The fundamental quantity is
  this <math|<with|font-series|bold|u><rsub|i><rsup|\<ast\>,\<pm\>>>, it is
  all about limiting the slope so that this guy becomes admissible, along
  with some time step restrictions, which we'll see in a while. Now we
  briefly see the proof.

  <section*|Generalizing Berthon's proof>

  <\itemize>
    <item>Berthon had proven the previous theorem for cell-centred grids,
    where <math|<bu><rsub|i><rsup|\<ast\>,\<pm\>>> is defined as follows,

    <item>while our generalization is chosen with these factors
    <math|\<mu\><rsup|->,\<mu\><rsup|+>> so that

    <item>in the conservative case, <math|<bu><rsub|i><rsup|\<ast\>,\<pm\>>>
    still has the natural expression. That is, in Berthon's case, these were
    <math|\<pm\>2\<Delta\>x<rsub|i>>, making this a natural generalization.
  </itemize>

  <section*|Idea of proof>

  <\itemize>
    <item>We split the domain into sizes <math|\<mu\><rsup|->,\<mu\><rsup|+>>
    creating Riemann problems at each of their centers. The left and right
    most state of the Cauchy problem are the reconstructions and center state
    is the <math|<bu><rsub|i><rsup|\<ast\>,+>>. By choosing time step
    restriction so that the Riemann problems are non-interacting, we are
    actually able to prove that average of this Riemann problem gives us
    admissibility, which proves that evolution to <math|n+1/2> remains
    admissible.

    <item>After that, we introduce a new center state
    <math|<bu><rsub|i><rsup|n+<frac|1|2>,*\<ast\>>> and this state helps us
    to write the FVM update as a convex combination, giving admissibility
    there too.
  </itemize>

  <section*|Enforcing slope restriction>

  Slope reconstruction is performed by Zhang-Shu type limiting. We have a
  candidate slope <math|\<sigma\><rsub|i>> and want to find <math|\<theta\>>
  so that this quantity becomes admissible. For that, we do just do the
  Zhang-Shu type limiting between the <math|\<theta\>=0> quantity which is
  admissible and <math|\<theta\>=1> which need not be admissible. Finally,
  this will be the slope we use.

  <section*|Non-conservative reconstruction>

  For non-conservative variables, all our previous lemmas apply. We just have
  to enforce slope restrictions to ensure admissibility on these quantities
  separately.

  <section*|ADER-DG : Predictor step>

  <\itemize>
    <item>We now do a compare of ADER and LWFR schemes. This is the degree
    <math|N> solution polynomial at the current time level,
    <math|\<ell\><rsub|i>> denotes the <math|i<rsup|th>> Lagrange polynomial.

    <item>And then we define the cell-local space time predictor solution and
    the flux. The unknowns are the space-time predictor values.

    <item>We solve for predictor values by this cell local Galerkin method,
    performing a formal integration by parts in time\ 

    <item>where we impose the information of the previous time level.
  </itemize>

  <section*|ADER correction step>

  <\itemize>
    <item>To perform the correction, we take the spatial test function
    <math|\<ell\><rsub|i>> and integrate in space time

    <item>We do the formal integration by parts in space and bring in
    numerical fluxes to couple neighbouring cells. To make the equivalence
    proof simpler, we'd do another integration parts and take quadrature
    points to be the solution points, enabling us to write in the FR form.
    Now, if we look at this equation for constant linear advection with unit
    speed, the <math|<wide|f|~><rsub|h>> will be <math|<wide|u|~><rsub|h>>,
    numerical flux function would be linear and we'd be able to bring the
    numerical flux function out of the integral by linearity.
  </itemize>

  <section*|ADER and LWFR for constant linear advection>

  <\itemize>
    <item>the update becomes this. We can see that the time average of the
    predictor is showing up everywehre. For instance, the numerical flux
    function is using the time average.

    <item>Let's also recall the LWFR-D2 update. And we can see, the only
    difference is that the LWFR scheme has replaced time average of the
    predictor with time average of solution, as computed by the Lax-Wendroff
    procedure. So, all we have to prove is that these two quantitites are the
    same.
  </itemize>

  <section*|Equivalence of ADER-FR and LWFR for linear case>

  <\itemize>
    <item>For the proof, we look at the local solution polynomial as a
    polynomial defined on the whole real line.

    <item>We then see that the advection of that polynomial gives us a
    solution to the predictor.

    <item>Since the predictor has a unique solution, it is this.

    <item>Then, being a degree <math|N> polynomial, we also know that the
    Taylor's expansion terminates at <math|N>. Then, knowing the predictor
    exactly, we do know that we can replace the temporal derivatives with
    spatial we do get that the time average of the predictor equals the time
    average of solution approximated by Lax-Wendroff procedure, and we get
    our claim.
  </itemize>

  <section*|Equivalence of ADER-FR and LWFR for linear case>

  We can also see it numerically in these time <math|>V/S error plots. We see
  that the equivalence is not occuring for <math|N=4>. That will be
  understood from

  <section*|Equivalence of ADER-FR and LWFR for linear case>

  these time very change in energy plots, which show dissipation of energy
  for <math|N=1,2,3> but for <math|N=4>, we see that the energy actually
  increases. That is, there is a mild instability. Something similar has
  already been noted in literature for certain RK schemes, as we show here.

  <section*|ADER-FR and LWFR for non-linear case>

  <\itemize>
    <item>For non-linear case, we can't expect equivalence, but we do have
    this measure of closeness upto the optimal order of accuracy, saying that
    both schemes are equally reliable.

    <item>The idea is again to space time derivatives with spatial. We use
    the fact that the predictor equation gives this identity for all time
    levels greater than initial. We can extrapolate to the initial time level
    to approximately get

    <item>and thus we'd get the same approximation when trying to do the
    Taylor's expansion.
  </itemize>

  <section*|Numerical results>

  Now, we see numerical results of the blending limiter, to see how it
  performs, starting with

  \ <section*|Constant linear advection>

  constant linear advection

  <section*|Convergence of pure MUSCL-Hancock method>

  Here, we do a convergence test where we set the blending coefficient
  <math|\<alpha\><rsub|e>=1> everywhere so that it is just MUSCL-Hancock with
  those non-cell centred grids. And, we do see the optimal second order
  convergence.

  <section*|Optimal convergence with limiter>

  Here we show that optimal convergence of our limited scheme, when we are
  using a <with|font-series|bold|broad band spectrum initial data>. This
  shows that our indicator doesn't activate when dealing with smooth data.

  <section*|Composite signal>

  This is a composite signal which contains profiles with various levels of
  regularity. We compare the blending limiter with the TVB limiter. We see
  that the TVB limiter is developing oscillations while the blending limiter
  is not. The blending limiter is also more accurate than TVB in all the
  profiles. This is one of the only two tests where I had to tune the
  indicator factors, i.e., change the coefficients of constant node from 1 to
  something else.

  <section*|1-D Euler's equations>

  We now see the results for 1-D Euler's equations with primitive variables
  being density, velocity and pressure. Here, we will test accuracy, that is,
  resolution of smooth extrema and contact discontinuities while also testing
  robustness against strong shocks where there is a high risk of pressure
  turning negative leading to a code crash.

  <section*|Shu-Osher>

  In this test, the initial data has a jump from a constant state to a
  sinusoidal state, so this is a test to see how well the limiter can
  maintain smooth information carried through shocks. We have zoomed in at
  the smooth extremas. FO means first order blending scheme, while MH is the
  one with MUSCL-Hancock reconstruction. We are comparing them with the TVB
  limiter. We can see that both the blending schemes are a lot better than
  TVB and the MH blending is slightly better than FO.

  <section*|Blast wave>

  This is a three state Cauchy problem with solid wall boundary conditions to
  make the two shocks interact, making it a tough test. We see that the
  MUSCL-Hancock blending is clearly the best at resolving the extrema and
  contact discontinuity.

  <section*|Sedov's blast wave>

  In this three state problem, very high energy is stored at the single
  centre of the grid while energy is negligible everywhere. It's a pressure
  ratio of <math|10<rsup|6>> and almost zero, so it's a very tough test of
  robustness and thus valididty of admissibility preservation.

  <section*|Double rarefaction>

  In this <with|font-series|bold|Riemann problem>, there are no shocks, just
  rarefactions. They are occuring because the flow is moving in opposite
  directions. This is a low density test to show robustness at a high
  resolution.

  <section*|Leblanc's test>

  This Riemann problem is another test with very high pressure ratios at high
  resolution to show robustness.

  <section*|2-D Results>

  We now look at the 2-D results

  <section*|2-D composite signal>

  This is a linear test where the initial state consists of three profiles
  which rotate and return to their initial state at <math|t=2*\<pi\>>, the
  time at which results are shown. This cylindrical profile gets dissipated a
  lot when we use the TVB limiter, but the MUSCL-Hancock blending does a much
  better job. Looking at the maximum and minimum, we also see that blending
  is able to control oscillations a lot better.

  <section*|Double Mach reflection>

  Here, a Mach 10 shock is going over a wedge inclined at 30<degreesign>,
  which we simulate by alrigning the coordinate system with the wedge making
  the shock angled at 60<degreesign>. In the new frame, the wedge is
  simulated by giving solid wall boundary conditions while the region before
  it is given outflow conditions. The simulation looks like this, there 2
  triple points and slip line near the primary triple point is generating
  vorticity. To test how limiter, we see how well it resolves the voriticity.

  <with|color|blue|Rest is easy to explain>

  <with|color|red|If asked, vorticity is caused by shearing which is caused
  by opposite forces in tangential direction. That is occuring here.>

  <section*|Kelvin-Helmholtz stability>

  This is a test where vorticity is generated by putting a jump in tangential
  velocity in opposite directions. So, naturally, this will lead to very high
  vorticity generation and this will be another test to compare resolution of
  small scales.

  <section*|2-D Sedov blast>

  This is another robustness test where very high energy is concentrated in
  the bottom left corner with negligible energy everywhere else. This leads
  to very high pressure ratios.

  <section*|Astrophysical jet>

  Here we simulate jet flows at very high numbers, leading to strong bow
  shocks, certainly making it a robustness test. But, because of the
  shearing, it also becomes a test of accuracy.

  <section*|Astrophysical jet Mach 80>

  We can see that our code is able to capture a lot more of the small scale
  structures.

  <section*|Astrophysical jet Mach 2000>

  We see the same for a Mach 2000 jet.

  <section*|Implementation in Julia>

  <section*|Type instabilities>

  As I said, we are satisfied by the speed of our code. But, it was not
  always this way. Julia has a rich type system and being a dynamic language,
  it is even capable of inferring object types at run time. That reduces
  developement time, but if we want efficiency, we have to communicate types
  to the compiler for all the performance-crtical parts. When object types
  are not inferrable at the compile time, we call it a type instability.

  Here is an example to get a feel. Julia is not object oriented, so to pass
  the many objects around, we use containers. Using dictionaries is type
  unstable because dictionaries don't carry type information. So, this is not
  a good code. However, named tuples do carry type information, so this is
  type stable.

  This is one example. Type instabilities can be subtle, this tool catches
  them well and points out exactly where you have done something wrong. You
  must also keep measuring the memory allocations of the code. With this
  tool, we can put counters in various parts of your code. If it
  \ intuitively seems there shouldn't be memory allocations somewhere but
  there are, something needs to be fixed. If you are not able to fix issues
  discovered by either of these tools, you can ask help at these three
  places. With this, you should be able to make the best out of Julia.

  <section*|Cache blocking (picture)>

  Now, I wish to show one thing we learnt which also applies to other
  languages, which is cache blocking. We learnt it from <verbatim|Trixi>,
  this explanation is from Akkurt Et Al. It is required when, for example
  computing the derivative of a flux polynomial, something done a lot in the
  Lax-Wendroff procedure. To compute the derivative of flux polynomial
  produced by evaluating a vector <math|U>, we could compute all the flux in
  a vector it all the points, store it in a vector <math|F> and multiply by
  the differentiation matrix. It works, but we are unecessarily writing to
  memory in the process. The right way to do it is to do it all in cache -
  compute flux for one point and compute its contribution to derivative and
  add it to the flux. <with|color|red|SLides need to be fixed. This IS
  updating every flux point.> This way, no unnecessary writing in the memory
  would be needed, we can do it all in the cache. Let's understand it through
  some pseudocode.

  \;

  <section*|Cache Blocking (code)>

  Let's understand it through code. Derivative of flux has to be computed for
  every cell. The bad approach would be to first compute the flux at every
  point and then multiply by the differentiation matrix. This is inefficient
  even if we use a BLAS kernel.\ 

  At each solution point, there's all conservative variables values. We load
  them into this static array. By passing this <verbatim|eq> object, the size
  of this static array, which is the number of conservative variables, is
  known at the time of compilation. This enables it to be loaded directly
  into cache. We compute the flux and add the derivative contribution to the
  residual. We could do it by simple vector operation, but we do it
  efficiently by passing reminding the compiler of the size of this
  <verbatim|f_node>.

  <section*|Conclusions>

  <\itemize>
    <item>

    <item>

    <item>MUSCL-Hancock for non-cell centred grids proved to be admissibility
    preserving <with|color|red|following the ideas of Berthon>.

    <item><with|color|red|By correcting Lax-Wendroff time averaged flux
    during the face loop>, Admissibility preserving Lax-Wendroff scheme
    constructed.
  </itemize>

  \;

  <section|Removed stuff>

  <section*|Choosing <math|\<beta\><rsub|1>,\<beta\><rsub|2>>>

  <\itemize>
    <item>Here we test a composite signal on constant linear advection
    equation. We should the signifiance of these coefficients of constant
    nodes by comparing the performance of blending limiter. We keep
    <math|\<beta\><rsub|2>=1> in both and compare <math|\<beta\><rsub|1>=0.0>
    and <math|\<beta\><rsub|1>=1.0>. Since all regions other than the jump
    are well resolved, we zoom in.

    <item>We can clearly see that <math|\<beta\><rsub|1>=0> is able to
    suppress all the oscillations while <math|\<beta\><rsub|1>=1> doesn't.
    Another thing to note is that this indicator is clearly not frame
    invariant. For instance, if we just translate the solution point values
    from <math|<around*|[|0,1|]>> to <math|<around*|[|100,101|]>>,

    <item> the behaviour of limiter changes. I am not arguing that indicator
    should be frame invariant, just that the optimal indicator would be
    problem dependent.
  </itemize>

  <subsection|Admissibility proof>

  <section*|Step 1 : evolution to <math|n+1/2>>

  We are breaking the proof into parts, starting by proving that the
  evolution to <math|n+1/2> is admissible. By using the general definition of
  <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>>, we are not restricted to
  conservative reconstruction, and need to separately enforce admissibility
  constraint on the reconstructions to the face. The CFL conditions ensure
  characteristics of Riemann problems between these two states wouldn't
  intersect in appropriately sized domain with half the time step.

  <section*|Step 1 : Evolution to <math|n+1/2> (2)>

  <\itemize>
    <item>This is the proof that evolution on the right is admissibile, left
    shall follow similarly.

    \;

    The proof requires two non-interacting Riemann problems on domains with
    sizes <math|\<mu\><rsup|->,\<mu\><rsup|+>>. The left most and right most
    states are the left and right reconstructions respectively and
    <math|<bw><rsub|i><rsup|\<ast\>,+>> being the centre.

    <item>And, by using the CFL condition and the definition of
    <math|<bw><rsub|i><rsup|\<ast\>,+>>, we can write the cell average of the
    solution of this problem as the <math|n+<frac|1|2>> evolution. Since the
    conservation law preserves admissibility, so does this average and thus
    the evolution step is admissible.
  </itemize>

  <section*|Step 2 : FVM type update>

  <\itemize>
    <item>Since we have understood the admissibility to time level
    <math|n+1/2>, we now see admissibility of the FVM type update. For that
    we define <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>> in the similar
    spirit as before, but now with the natural objective of breaking into
    appropriate finite volume updates.

    <item>We split the cell in three constant states; left, right evolution
    on left, right respectively with <math|n+1/2,\<ast\>> in the center. Of
    course, to perform evolution, we will require states from the
    neighbouring cells as well.

    <item>The update of three FVMs looks like this

    <item>and when we multiply each with the weights according to the
    definition of <math|<bu><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>, we get the
    final MUSCL update to be a convex combination of these FVM updates. Thus,
    if these updates are admissible, MUSCL-update is admissible. For that, we
    require admissibility of <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>
    and CFL conditions corresponding to the numerical flux. We write all of
    that in a lemma.
  </itemize>

  <section*|Step 2 : FVM type update>

  We now have a condition that guarantees admissibility of the MUSCL-Hancock.
  We just need these states to be admissible and these CFL conditions.
  Typically, CFL conditions would be dependent on the numerical flux, we are
  assuming this special case. Admissiblity of evolution to the faces comes
  from previous lemma. So, what we need to do next is to find conditions when
  <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>> will be admissible.

  <section*|Final admissibility condition>

  <\itemize>
    <item>We expand this definition of <bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>
    to write it explicitly as\ 

    <item>We can see that it looks similar to the finite difference update.
    Thus, the proof of its admissible will go exactly the same as the first
    admissibility lemma we did, just that the left and right reconstructions
    have been swapped.

    <item>Just as in the first lemma, we have to introduce a new state to
    obtain admissibility, called <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>>
    and assume its admissibile with the same CFL conditions.

    <item>And, by our choice of <math|\<mu\><rsup|\<pm\>>>, we do get
    <math|<with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,\<ast\>>=<bw><rsub|i>>
    for conservative reconstruction. So, this theorem is not really placing
    new admissibility conditions\ 
  </itemize>

  <section*|Final admissibility condition (2)>

  <\itemize>
    <item>The proof goes the same way, the states just have to be swapped so
    the picture looks like a mirror image of the previous one.

    <item>The cell average now becomes <math|<bu><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>
    and we get the claim.
  </itemize>

  <section*|Final admissibility condition (3)>

  <\itemize>
    <item>Now with the previous lemmas, we have already proven that, for the
    conservative case, once the reconstructions and the
    <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> are admissible, the MH procedure
    preserves admissibility. Now, we are saying that the admissibility of
    reconstructions doesn't need to be separately enforced. That is easy
    because

    <item>for the conservative case, the reconstructures are a convex
    combination of <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> and
    <math|<bw><rsub|i><rsup|n>>. Thus, that is the admissibility criterion we
    needed.
  </itemize>

  <section|ADER-FR>

  <section*|ADER correction step>

  <\itemize>
    <item>To perform the correction, we take the spatial test function
    <math|\<ell\><rsub|i>> and integrate in space time

    <item>We do the formal integration by parts in space and bring in
    numerical fluxes to couple neighbouring cells. Now, this is enough to
    define the scheme, but for easier comparison, I'd write it as an FR
    scheme. So, I do another integration by parts in space

    <item>Now, to make it a collocation type scheme, we do quadrature on the
    solution points.

    <item>Now, if the solution points are GL or GLL, this can be written as
    the FR scheme with appropriate corrector functions like this

    <item>Now that we have the needed form, let us see what it looks like
    with constant linear advection equation with unit speed. The
    <math|<wide|f|~><rsub|h>> will be <math|<wide|u|~><rsub|h>>, numerical
    flux function would be linear and we'd be able to bring the numerical
    flux function out of the integral by linearity. Overall,
  </itemize>
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|2|1>>
    <associate|auto-10|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-11|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-12|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-13|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
    <associate|auto-14|<tuple|<with|mode|<quote|math>|\<bullet\>>|4>>
    <associate|auto-15|<tuple|<with|mode|<quote|math>|\<bullet\>>|4>>
    <associate|auto-16|<tuple|<with|mode|<quote|math>|\<bullet\>>|4>>
    <associate|auto-17|<tuple|<with|mode|<quote|math>|\<bullet\>>|4>>
    <associate|auto-18|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-19|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-20|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-21|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-22|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-23|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-24|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-25|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-26|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-27|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-28|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-29|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-3|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-30|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-31|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-32|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-33|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-34|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-35|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-36|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-37|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-38|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-39|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-40|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-41|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-42|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-43|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-44|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-45|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-46|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-47|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-48|<tuple|<with|mode|<quote|math>|\<bullet\>>|9>>
    <associate|auto-49|<tuple|<with|mode|<quote|math>|\<bullet\>>|9>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-50|<tuple|1|9>>
    <associate|auto-51|<tuple|1|9>>
    <associate|auto-52|<tuple|1|9>>
    <associate|auto-53|<tuple|1|9>>
    <associate|auto-54|<tuple|1|9>>
    <associate|auto-55|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-56|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-57|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-58|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-59|<tuple|<with|mode|<quote|math>|\<bullet\>>|11>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-60|<tuple|2|11>>
    <associate|auto-61|<tuple|2|11>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-8|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-9|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      Title <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>

      Outline <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      Flux Reconstruction : grid <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      Flux reconstruction : ODE <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      Flux reconstruction : Continuous flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      Lax-Wendroff Flux Reconstruction (LWFR) with D2 dissipation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      Extension to 2-D <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      Blending limiter (Hennemann Et Al.)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      Choice of <with|mode|<quote|math>|\<alpha\><rsub|e>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      Choosing <with|mode|<quote|math>|\<beta\><rsub|1>,\<beta\><rsub|2>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      Lower order update <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      Interface numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      Extension of Zhang-Shu's limiter to Lax-Wendroff schemes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      Low order residual : MUSCL-Hancock <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      Admissibility of low order method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      Generalizing Berthon's proof <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      Idea of proof <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      Enforcing slope restriction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      Non-conservative reconstruction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      ADER-DG : Predictor step <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      ADER correction step <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      ADER and LWFR for constant linear advection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      Equivalence of ADER-FR and LWFR for linear case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      Equivalence of ADER-FR and LWFR for linear case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      Equivalence of ADER-FR and LWFR for linear case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      ADER-FR and LWFR for non-linear case
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      Constant linear advection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      Convergence of pure MUSCL-Hancock method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      Optimal convergence with limiter <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      Composite signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      1-D Euler's equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>

      Shu-Osher <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>

      Blast wave <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>

      Sedov's blast wave <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>

      Double rarefaction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>

      Leblanc's test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>

      2-D Results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      2-D composite signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>

      Double Mach reflection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>

      Kelvin-Helmholtz stability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>

      2-D Sedov blast <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>

      Astrophysical jet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>

      Astrophysical jet Mach 80 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      Astrophysical jet Mach 2000 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      Implementation in Julia <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>

      Type instabilities <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>

      Cache blocking (picture) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>

      Cache Blocking (code) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>

      Conclusions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      1.<space|2spc>Removed stuff <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>

      <with|par-left|<quote|1tab>|1.1.<space|2spc>Admissibility proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>>

      Step 1 : evolution to <with|mode|<quote|math>|n+1/2>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>

      Step 1 : Evolution to <with|mode|<quote|math>|n+1/2> (2)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>

      Step 2 : FVM type update <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>

      Step 2 : FVM type update <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>

      Final admissibility condition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>

      Final admissibility condition (2) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>

      Final admissibility condition (3) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>

      2.<space|2spc>ADER-FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60>

      ADER correction step <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-61>
    </associate>
  </collection>
</auxiliary>