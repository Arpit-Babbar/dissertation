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

  Good evening everyone, thank you for giving me this opportunity to present
  work that I was involved in. Today, I will be speaking on Lax-Wendroff
  schemes in Flux Reconstruction framework.

  <section*|Outline>

  <\itemize>
    <item>Review Finite Volume Method and how to use them as the building
    block for Flux Reconstruction

    <item>Introduce Lax-Wendroff schemes in the FR framework with all the
    improvements we could make to their numerical flux construction.

    <item>A crucial ingredient of hyperbolic solvers is the limiter. I'd show
    how we used a second order version of the blending limiter to create a
    provable admissibility preserving Lax-Wendroff scheme.

    <item>Finally, I will briefly speak about how to handle unstructured,
    curved meshes for Lax-Wendroff schemes.
  </itemize>

  <section|Finite volume Method>

  <\itemize>
    <item>In the finite volume method, we break the domain into cells. The
    <math|e<rsup|th>> cell is bounded by <math|<around*|[|x<rsub|e-<frac|1|2>>,x<rsub|e+<frac|1|2>>|]>>
    and the degrees of freedom are at cell centres <math|x<rsub|e>>. We
    assume a piecewise constant state within each cell.

    <item>We integrate the conservation law in space to reach the integral
    form, and using the fundamental theorem of calculus and the fact that we
    are dealing with piecewise constant states, leads us to

    <item>The semi-discrete scheme would be fully described once we choose
    how we are going to perform the flux approximation at the face, also
    known as the numerical flux. For today, we are going to chose

    <item>the Rusanov flux or the local Lax-Friedrich's flux. Central part is
    the average flux of cell adjacent to the face and the wave speed of
    dissipative part is computed with all intermediary states. With this, we
    have described the first order finite volume method and can perform the
    evolution
  </itemize>

  <section*|Flux Reconstruction : grid>

  <\itemize>
    <item>I explain Flux Reconstruction for hyperbolic conservation laws,

    <item>Again, we break the domain into cells in\ 

    <item>each of which we put <math|N+1> degrees of freedom so that the
    approximate solution <math|u<rsub|h>> is locally a polynomial of degree
    <math|N>. The faces of the <math|e<rsup|th>> cell are
    <math|x<rsub|e\<pm\><frac|1|2>>>, where the solution
    <with|font-series|bold|is allowed to be discontinuous.> The reference
    cell is <math|<around*|[|0,1|]>> with reference variable <math|\<xi\>>.

    <item>We use Gauss Legendre solution points because we found them to be
    the most accurate. These points do not include values at the face.
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
  we can use it to perform evolution as shown in<text-dots>
  <with|color|blue|Hover over to 4 to go to the previous slide, don't press
  Page up> the previous slide. <with|color|blue|Staying on the previous
  slide.> Since the scheme requires Runge-Kutta, we have to compute the
  residual multiple times, which involves multiple applications of limiters,
  numerical flux and inter-cell communication which can lead to memory
  bottlenecks. We propose to avoid that issue by using Lax-Wendroff schemes,
  which are single step methods.

  <section*|Lax-Wendroff Flux Reconstruction (LWFR) with D2 dissipation>

  <\itemize>
    <item>Performing a Taylor expansion in time and using the conservation
    law to replace one temporal derivative with spatial, we can write
    evolution to the next time as follows, where this <math|F> is
    approximattime averaged flux. To approximate these time derivatives, we
    will have to use the conservation law again. There's various ways of
    doing it, we choose

    <item>the Approximate Lax-Wendroff procedure where we use finite
    difference in time and approximate the time nodal values by Taylor's
    theorem to reduce to spatial derivatives. We chose this approach to avoid
    computing large Jacobian matrices.

    <item>This procedure will give us discontinuous flux polynomial, which we
    will correct with Flux Reconstruction b<with|font-series|bold|y imposing
    flux value <math|F<rsub|e+<frac|1|2>>> at the <math|e+<frac|1|2>>> face.
    I will now explain how we construct the numerical flux to improve
    stability and accuracy.
  </itemize>

  <section*|Numerical flux: D2>

  <\itemize>
    <item>We begin by talking about how we improve the dissipative part of
    the numerical flux. In the past works, the dissipative part was computed,
    with what we call the D1 dissipation, i.e., using the solution
    polynomial. However, since we creating an approximation of the time
    average solution, we propose to use

    <item>the approximate time averaged solution, which is available to use
    through the Lax-Wendroff solution. We call the classical version the one
    with D1 dissipation and the newly proposed one with D2 dissipation.

    <item>With this, the above flux function leads to an upwind flux. This
    scheme leads to around 40-47% increase in the CFL numbers as obtained
    through the Fourier stability analysis.

    <item>For linear problems, it is equivalent to the ADER-DG schemes, which
    are another well established single step methods.
  </itemize>

  <section*|Numerical flux: central part>

  <\itemize>
    <item>In the past works, the central part of numerical fluxes has been
    computed by extrapolating the flux polynomial to the face. We found that
    this standard approach leads to suboptimal accuracy for some non-linear
    problems and is less accuracy. By performing time averaging specifically
    at the face, we were able to remedy those issues. That is, we got the
    optimal convergence rates and obtained a more robust scheme.
  </itemize>

  <section*|Performance (1)>

  Now, those were some improvements made to the Lax-Wendroff scheme. Let us
  briefly see how they appear in practise. This is a double Mach reflection
  test, which starts off with one distcontinuous and ends up with two triple
  points. We will talk about its details later. For now, this fairly detailed
  structure tells us that the accuracy of Lax-Wendroff scheme is very
  comparable to the Runge-Kutta scheme.

  <section*|Performance (2)>

  These plots are showing the performance gain, as measured in Wall Clock
  Time, by using Lax-Wendroff with D2 dissipation over D1 dissipation for
  various polynomial degrees. For higher orders, we are seeing a gain over
  40-65%, which is expected because of the CFL gain. Here, we have a
  performance comparison of Lax-Wendroff and Runge-Kutta. The sweet spot
  seems to be in degree <math|2,3> where we see a gain of 50-60%.

  <section*|Subcell based limiters>

  <\itemize>
    <item>Now this gives us a single step method which has reasonable benefit
    over multi-stage methods. However, all solutions to practical hyperbolic
    problems contain non-smooth profiles. In those cases, a higher order
    method is bound to add oscillations, which is Gibbs' phenomenon. Because
    of the order barrier, the only remedy to this is to tell our scheme to go
    lower order in non-smooth regions. The tools which do that are called
    limiters. They mark certain cells as troubled and then reduces to a lower
    order scheme in those regions.

    <item>A very standard one, and the one I used in the previous results in
    the TVD/TVB limiter. This limiter works looks at the jump between the
    cell average and the interface, and the jumps between cell averages and
    cell averages. If these jumps do not have the same sign, which is what
    would happen in case of a spurious oscillation, the scheme reduces to
    first order. If these jumps do have the same sign, but the magnitude of
    this jump is not the smallest, the scheme uses the smallest jump as slope
    to turn into a linear approximation. While this works in controlling
    oscillations, it actually ends up limiting too much leading to poorly
    resolved results. This is because of two reasons. First, the change in
    sign I mentioned does not just occur in spurious oscillations, but also
    at extrema. Thus, the limiter will unnecessarily mark extremas as
    troubled cells. The limiter also only uses the information from these
    slopes and fails to make use of all the information already present in
    the subcells. It jumps directly from high order to low, with nothing in
    between. Keeping these facts in mind, the limiter we vouch for is the
    blending limiter.

    <item>The blending limiter makes use of a smoothness indicator to mark
    trouble cells, making it possible to notice smooth extrema. It then uses
    that smoothness indicator to blend with a lower order finite volume
    method which is performed within the subcells. Thus, the subcell
    information is kept intact. Now, I'll explain the blending limiter for
    Lax-Wendroff schemes.
  </itemize>

  <section*|Blending limiter (Hennemann Et Al.)>

  <\itemize>
    <item>Being a single step method, the Lax-Wendroff method can be written
    in this explcit way, where I'll be calling
    <math|<with|font-series|bold|R>> the higher order residual.

    <item>The lower order methods that we will be dealing with can also be
    written in this way.

    <item>Then, with the smoothness factor, we can blend the two residuals,\ 

    <item>and obtain a limited scheme. With this, the blending scheme has two
    ingredients that I need to give details on. The first is, how to choose
    this blending coefficient <math|\<alpha\>> and the second is - how to
    perform this subcell update.
  </itemize>

  <section*|Choice of <math|\<alpha\><rsub|e>>>

  <\itemize>
    <item>We follow the procedure of Hennmann Et Al to describe how to
    measure the smoothness of a degree <math|N> polynomial
    <math|\<epsilon\>>. We choose the blending coefficient by a smoothness
    indicator based on Legendre expansion <with|color|blue|select
    <math|\<epsilon\>=<big|sum><rsub|j=1><rsup|N+1>m<rsub|j>L<rsub|j>,<space|2em>m<rsub|j>=<around*|\<langle\>|\<epsilon\>,L<rsub|j>|\<rangle\>><rsub|L<rsup|2>>,>>
    The measure of smoothness is dictated by the content of highest order
    coefficient in comparison to the rest.

    <item>We have put parameters <math|\<beta\><rsub|1>,\<beta\><rsub|2>> as
    coefficients of the constant nodes. We have found them to be problem
    dependent, while they have always been kept to be equal to <math|1> in
    the literature. We were motivated bring these parameters because, an
    ideal smoothness indicator should not even be considering the constant
    nodes. They do not carry smoothness information.

    <item>Now, we need to choose the <math|\<epsilon\>> according to the
    problem we are dealing with. For Euler's equations,
    <math|\<epsilon\>=\<rho\>*p> was used by Henneman Et Al, and we found the
    same to perform well.\ 

    <item>Finally, we map these values to the interval
    <math|<around*|[|0,1|]>> to be used as blending coefficients.\ 
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
    would be that the cell averages of both high order and low order schemes
    would evolve -

    <item> - like this. That is, conservation is maintained. It is to get
    this conservation that we use the subcells as above. But, we have to be
    carefully choose this blended flux. Otherwise, our lower order residual
    may not be admissibility preserving. More specifically, we can and we
    will choose our lower order scheme so that the updates in the inner
    subcells will be admissibility preserving. But, we need to make specific
    correction to ensure that the update at the boundary subcells is also
    admissibility preserving.
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
    preserves admissibility of the last solution point like this.

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
    which is how we do the MUSCL-Hancock reconstruction. The scheme makes use
    of predictions to time level <math|n+1/2> at the face to be fed into the
    Riemann solver and then used to get a second order evolution to level
    <math|n+1>.\ 

    <item>The MUSCL-Hancock procedure depends on creating linear
    reconstructions to be evaluated at the face. At each step, non-cell
    centred nature has to be accounted for. For example, we can't just
    replace this by <math|\<pm\>\<mathLaplace\>x<rsub|j>> here.

    <item>We use the <math|\<beta\>->minmod limiter here. Usually, the
    <math|\<beta\>> parameter has to be fine-tuned according to the problem.
    But, here, we have a natural way to compute it with the smoothness
    coefficient.
  </itemize>

  <section*|Admissibility of low order method>

  We will understand it in isolation of blending. Basically, we'd need
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

  <section*|Unstructured, curvilinear grids>

  In many practical applications, we deal with grids which are not
  structured, that is, there is no natural global cartesian indexing
  <math|i,j> and which are curved, that is, the boundaries of cells need not
  be straight lines. In these cases, we would map each of these subcells to a
  square and then perform change of variables to be able to solve the PDE
  within the cell. The mapping between cells would be a polynomial of certain
  degree <math|k>.

  <section*|Transformation of conservation law>

  We define the physical and transformed variables.\ 

  <section*|Flux Reconstruction for the transformed PDE>

  Here I have written the 3-D FR scheme in a compact form. It looks like a
  lot, but it is the obvious extension of what we saw in 1-D. Rather than the
  1-D derivative, we now have the divergence of the continuous flux
  approximation, which I have expanded here.

  So, we are collocating at the point <math|<with|font-series|bold|\<xi\>><rsub|p>>.
  The first term in the expansion is the divergence of the discontinuous flux
  polynomial. I have put <math|N> to denote that it is a degree <math|N>
  polynomial derivative. This notation will be useful later. Just like in
  1-D, we have to perform correction on all the faces with the numerical
  flux. The idea is to use 1-D Riemann solvers to perform corrections in all
  directions.

  <section*|Lax-Wendroff flux reconstruction for transformed PDE>

  <section*|Free stream preservation of Lax-Wendroff>

  We will show that the free stream condition is all about satisfying this
  identity with the metric terms.\ 

  <section*|Metric identities in practise>

  <\itemize>
    <item>Now, if all the derivatives were exact, the metric identities that
    I mentioned before would have automatically been satisfied. In practise
    however, the Lax-Wendroff scheme doesn't use exact derivatives, but
    derivatives of degree <math|N>. For instance, in 2-D, the metric
    identities look like this. If the derivatives were exact, we would simply
    swap the <math|\<xi\>> and <math|\<eta\>> derivatives here and get our
    claim. However, to be actually able to swap, we would require the
    derivatives computed here are of degree <math|\<leq\>N>. That is, the
    mesh is of degree <math|\<leq\>N>. Thus, in 2-D, we have a pretty
    reasonable condition.\ 

    <item>However, 3-D is not so satisfactory. In 1-D, this
    <math|<with|font-series|bold|a><rsup|3>> term was constant, which is why
    the metric terms were of degree <math|N>. In 3-D, it won't be be so and
    we would end up with degree <math|2N> metric terms. Thus, swapping
    derivatives would require the degree of mesh to be <math|\<leq\>N/2>.
    This is pretty restrictive, and would disable us from seeing the optimal
    convergence rates.

    <item>Fortunately, there is a better way to by pass that. We write the
    metric terms in this conservative form. And rather than changing the
    whole mesh to a lower degree, we just compute this curl with a degree
    <math|N> polynomial approximation.
  </itemize>

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

  <section*|Double Mach reflection>

  Here, a Mach 10 shock is going over a wedge inclined at 30<degreesign>,
  which we simulate by aligning the coordinate system with the wedge making
  the shock angled at 60<degreesign>. In the new frame, the wedge is
  simulated by giving solid wall boundary conditions while the region before
  it is given outflow conditions. The simulation looks like this, there 2
  triple points and slip line near the primary triple point is generating
  vorticity. To test how limiter, we see how well it resolves the voriticity.

  <with|color|blue|Rest is easy to explain>

  <with|color|red|If asked, vorticity is caused by shearing which is caused
  by opposite forces in tangential direction. That is occuring here.>

  <with|color|red|Triple point is the point where three shocks meet.>

  <image|<tuple|<#89504E470D0A1A0A0000000D49484452000002D4000001840806000000164BB79A0000000473424954080808087C086488000000097048597300000EC300000EC301C76FA8640000200049444154789CECDD79585465FFC7F1F75389568C2DB83196622A909A9A80964B08A2661A989A69618B6689955BA96DB6DAA2F6984BA965B628A62D96F8B82642A456C6925A2AD022580E6E947AB0C4E537BF3F66716413041996CFEBBABA2E399C39739F33049FB9E77B7FCF7FAC56AB151111111111392F17B97B002222222222959902B588888888482928508B88888888948202B588888888482928508B88888888948202B588888888482928508B88888888948202B588888888482928508B88888888948202B58888888848295CE2EE018888884875914DEC730F3036661FD4AA4DFDDA3581D31C3BFC173974634AE26BDC56E4C35733A1DF0BAC390C1EBE77316BDEE374F23AC2BAA7FBF3C4AAA3E071351D1E9BC27BF7B629A7F329895CBE7AA6178FEFBE9B2F3E7E90E679BE97BDF57FBCF5E612BECE38021E353975F420FF5C7C356D87FD9705C35ABA69CCD54CDAE78C7DEA03B6EEBB9CF0B73F65EC8D85EDB88DF7EF1DCB9BDB72F0B8FC6AAEBAFC62CD508B88884879F1222CC00F80C683A712BB7E15B1EBD7B26C5C101ED734E49A733EFC363A0500D4A1FF98C7E9E405F00F3939FF071ECD18FE6E4C050DD340EE3AD67C954BE7BE77E40BD329738673EB7DB3D8D9EA513EFC2A96F8F5ABD8B8E12D221B1AD4AEA3305D6EFC42685FEF20878E35A4518BA2766C4360501D003A3E1143ECFA559AA116111191F293FDCF3F005C55FB6AE73673BFC778E39A4B687DCE4767907D08A0094DFC0172489CF138AF7ED780E1EF7EC0A81B6B5E90319785EC98F57C433B2676F33A6B7B6EEC6B8C7E2795AB07BFC9C2F19D709E81677B46CE5BC2E18A7B4A36E9EF31E8CE34066F9B4684BBC7526A5BD9F913D0D88726E7B8EEC6B11CC0932B6BDB76D40CB5888888949BCCFDFB00A8E3E57366634D7F42BA342BC6A3F7B2CF0278D6A5AE572E29B31F62C462E8FFDFFFBA84E95C32E3DE62C46DB712D2AD2B01415DE9F7E23A2CE4B26BC978BA77684FD0F0C5ECDAF1394FDD752B370775E2E601AF139BF9339F3D1D49970EED09E838985762B301B07CF35FEEE9D889806EAF139B19CFAC11FDE9D2A13D413D1F63E18F99C4CF7E8C5B3B76E2860EB73362E1B642C69DCD57715BF0E8D18788B3F2F42F2C5EB89EC30471FF709730EDB82C5E8DA8EF09E466B27AEA30BA77EC4A48F02D04F57C8C7713736C3B65253035B22B0141B7F24AAC6D3C7D826FB18F27C57E2DBA12D0E616BA8F58C47680AC75BCD8F7166E6813C68B31EB7871405702DAB427A05B14B653C825E5FD284282DA13307411198E2BBBEA05C2BAF7E685758E1166B1ECAD8FD9D1F81AAE751D788EED5A8674BBD579ADDEFF31D736D6C1F6E7FDEA076645DAC6F560743ABBBE98C4C0E030BA385EB35736905DE4CF422E99ABDF6048CF5B080AEECDADB7DDCBC0BBC2E83F2305C82261DA03DC1CD489905736D8F6CB7B0D0A3A46F8746273009F6B29FA73815CF6590E0175A85BD7B645815A444444CACD1F7BFE007C68E2731E0FCEDD4FD641C0DC804B639E65F47B07B8E5D9FFF2F42DDECE5DB257BD40E4D86F68FAE2E7C46F58C61301FFF0CB171FB13C3E9EC41A3713EC05C7777EC0C419FB087D7531AF875F41CE2F5FF1E243FF6577C80B2C9FD6972B8FFDC6D2D59B8124BEFDB525B7B43EC98943B1BCF2F457788F7897E847DB727CDF16E63FF1245F5C398CC54B4610787C3F9BBFDCE812D65C64AC60F5779E8404773D3B34676C227EDB49B8B9333DBC0A7A204016314F0D63E2675606BEBF8EF884050CF7DAC2EC27DE20361792BEFD9DD6B7B4E4C489BF58FBDA73ACF11EC6470B87DBC6B3E069C62EBF82A8451F313AE038FBBEFB1F5F6F83A46F2D34BAB12E7094CF5F7D8FE383DEE0A3273BE1712899B9CB36C09FF1249EBE169F1370E2EF231CB58F64C72F3FB1FF402DAEA807B095F7873EC0AB0939B0FF7F4CE8DE9BB0EE2FB03A771B731E7898E9397DF970F55A364E1F40ED7D5B787BC9067EDEBC930601FEC051D6BE328B3F3B74A755BD46F87BC4F3E28B9BA93F7A111B37CC67F40D909561E1AF227E142C31CF12F9D45AEA3CBC884D09AB8879D08B5DA947F1AADF18767CC76FCD3A72C389931CFA6A1A4F7DEDC313CE6BB09DDD798EE179FFBB6C4A58C5DA514100D433D7CFF7E6E66CA9ECFD03A0318DED15460AD4222222524EB691B91BA02E75AF01C822665C18FDE7EC28DEC3532DFC0170EA1BA64F4EE03F0326F16684B7CB0E5B58307B03A7FA0C635490277082932700AEE2AAD6B772EF804BC8DE0BF8DDC7BCF98FD2BDA917274F1E07AEE1EE37E731A17B33BC4C977329D0B4496320900143BDC9DD0FD40DE585F75FE3CEB65E584F9E023CB9F9F1F9CC1ED216AF0697E309D0A45181652BBFAC8F676BDD5BE9DD234F4CDBB693AD403D9F46149AA77FF898391B8E621EF830C3FD6B02CD096C7F2D1CFE811F9220B0FF0398730F0275E8F1FCBB4C1DD0162FEB294E019E1D46B170D610DA7835E0724F7004C0C0FE0FD0E60A806B193AEF335E1B1048ABC121DC04E4FCB48BEDD7DCCAC3F7FAE73B27DB9BA146F6FAE2B60C7DAC17DEB8D6C3BF408798F75890DE94071E1D40E39A907BFA1400575E7D05AD0644D1B6E661C093C0D1D398FAD8337CB43E9A276AFECA0E6A51AFCED54073EE7DFF6BBE9B3F244FADB98BDC0DCC9D9EC0E1968318D9AF313581B4BD7B813AF834F28296FD187A5D2E07807A614FF1C1D401B4F1B272EA14E0710935F21C63DC607F6A02D9070F9203346DEC5FD833DB65B2FB77A06E5DEA00E4A628508B88884879D9CB9F7F021E3B7877506FC2BA0DE6A50D4769D4B0980BEF3232F90D681A1C8A9F07FCBD762531AE75019B135897058137B661FF8E4D2C9C309299C9B568F1F030FA7901DBF6B01BA8E77B1D66DB01D99391031E0D69DCC2167673776790095CDBD011AAECE1A959135AD9F3F0AF191940037C1A7BDA36ECFC83DD40E346052DABDCC69AD5A9987B06D329CF7776EEDD0B80E972CF424F7973DC062CD421B86307E7B64B2EBE1838C4C143B6AF77EFCE009AD0ACA5638099FC0A987D1ADB42313BD89301384B3372D9FDBB6B382E40BE73B2BF19AAEB4D03FBD338AE5593468ED7CF56DA72A27100AD6AEF2669E57F7978D2720ED7E9C6A8FB6C67FFE71F7B011F6E6CE7F246E8FA16B4F538C4A7931E63D63759855E0BA78D1B893D0C6DC3C29CA1DB760D1AD0A0A17D83E367A5592BFB6CF36FECFE0D702C7E2DE018A999BB7186F2A2ECB0B007C0F88AE7BBF726ACC718056A111111292719FBC93A01F80CE2EDF5AB88DDB08C290F0DA65B311B733802E8B58D863068900FE424F0C1C767EA9633D2523980277BBF9ECDDB8BD6B0CFF741667EB19A4F46B6B385AA3FF7F20760AEE7485DF69A6C970E233BF6EC01AEE53AC7AA347B78F2AC57CF3E8B9CCDC1033940431CEF03F2074B173FC4B2EA771F7AF7E890EF5BA7ECB3B785CB206DE721C00FBF40D7C79D063CF1BC1C6087ADFCC0B32E75ED39D031D3EA7CA3929BC1EF99B8D406DB03B64B3826FB18C7C039239DFF9CEC6F2CCC75715CBD7CD7CAB1A8EFC4CFC4CC788FCF926BD26DD2BB7CB5FA356C1F24EC2063F749F0A84F031F97D3F47D8029AFDCC6B5FF6C65FE6343B8FFFD14728BB82ADB77ED24873A5CEFE738883DEC7B36A2917D93ED67C593FACE8B7280FD3967CECF760C4F7C1C0F70D6453B16BC16216B1F16C023789C6D663E61B6BA7C8888884839D97BD016449A34C23631EA45D823638BFD70CBBE7D401DBCEBD7A475F0003A2F7C834D4BA389B9BB0D115E70F4580E5087AEC35F615401217D67662627A881777D1FDB86EC3D641C045A3BCA1A1C33B79DCECCDC66649201F8346860DF90CAEE5F81EB1AD3C4BE257FB03C6373DC062C2DFBD1AB80F1B46ED418C8E08F3FF60205BDAB38428E01700997380F9D4D5AEA1F40102D6E04C824C33640FBACBB63A6D5A54EDD31DB7C9D8F7DB6F64FF66402375F8B333BFE98C64F40DB56AD0B3E27C71B0B9F46F81476AD38464E0ED0E176A6BC1E5EC0F9EC23CB02F834C627CF77CC3D5EE04BBFF64C1EF90ACB67CEE0A3CE0B79C8B78043E0988DF6C1D339B16FFFE4C3E51A646464028DF1764C84A7FE619BB16ED2F8AC633816153AEBA2EB36E65C13D48E372CBE3E8DED5BDA68865A444444CA47EEFE2C0E003ECE2052128E9961FBC7FA5E03B97F6083B366A92FB9F81220C716EA0A600BE48DF1F1B16FD873000B6742963354B9B44DCBD8BF9F13D4A06963C76CAF7D6164A1B5C5AE27BC8E55FF3B745659C159DAB4A02D7062F3F77C55E094EC35D4AD0F708A538EEF676FE09B64F0E8186C5BC8689FF53FF326C531D37A66C11C7BFE3C7BB6D95EFA7266D63D9784EF7E20C7A315219D7D0A3CA7DC5F7F2303303BDF5838CA485C5BCC5D420D0FE09F630577E8C8D843460E70AD99822A4D6A36BE8D6787B50752D9B5ABA0031422DDC29E13AEC7CD60DFBE93E0D1181FFB2967EFC9E400D0A451211F87E4FEC62FBF03CD5CDE6414C2D6A9C6E567022D4A1411119172629BF5244FCDF436DE1D7C0B3704DDCA2BF1453DDA3E338C178E8E7B1D8646D2D9037E5BFA21CBB2A0456000660EB166D91764E642CE6FEB993562286F7E0F45956AE4AB97C660CBDBD124017B0FEC031A728DA326A4B0DA62FE8FDF3F9DCFDA3FCF8C38376133F1273A707B844FC1A7E47337230637809CB5BC1CF516EBD3B2C90572B3F79014BB96946C2F02DBB7C2836D2427E40239247EF0399B68C67D0F45D8C2B07DD6FFDA6B9D851879EAA561FB9E4C004EFFFE29EFACFDD3595FDCCCA72900966F66326BC5117CEF7D947B7C5DCFE918C7F665F2FD7B63193CEB474E00F53D7EE7FD653B70CE7203E466F2FDAA8DFC4A0702036B40F2FF58989803B9D96CFB7C12839E58C65E97B19E7903036C9BCF3D1DBBF2D817D9402E3BF6EC058F0EDCDCB9E04B06D0BC59332083B8F51BF979FD5B3CF8D8427E011AD7FB87850BBFE66801A53CB610EC8DD7D1452C8C3F429B56ADCE3EC66DFFE56B804BFE26EEDD187E29F4D91D33F32E3F1328508B88884839C8DE3C8F595FFE0140D2DA456C3FE2F8CEDF1C3C701A2E6A843313E67F349BA7BDCDB283003F12FB45866DB3570491FD1B40CE665E1D358FEDEDEFE6F17EBEB0F975FAB4EF44F7895F51EBEE57187B13145EAA612B21B1A9CD955702FBB771A0793702C9664FC6D9B3BD8E106EAEEF08855770E55535C0238DB493018438435636315F6EE0446017BA155A4250934E4FBEC35B8F06E3FDDBA78C1BD88BC0A0AEDC3A723629175D4F4B2F687ECFF3BCDCAF3EF1937A1212DC8751DF3766FC9C779D7DB7F3CDBC3AEAA5CDF5708CB0F61557E2410D76A59D2228E41A7B7D710DFEFCFC71C2BA7525E2C91FB976D49B7CF498BDD69C3674EDD5862B6B6D65F6BDE3F8F0DFBEBCF2C80DD4A216BF2465D2B4634B2088AE3DAFC62373310FF7788675FF69C4B57811F1D08374AA6B21FAC1506EB8E57EDED87123CFBFD29F86058D15805A984CFFC7D753EE22AC5B048F7FD798C7FEFB34038B28BB6871D7300635A9C56F8B1EE7813732E9F6F8DD34F380ACF55BA8D1FE666A3B4A795C3E453869B5E2C12136245E4250C72BF089B8C7798CFB5EDF41C7890F12E0011E29891C0CBAB5D00E23BFC6BCC082EF00F692B0220EC77B8AFF58AD566BE143161111119112CBFE94A85BE771D52B6B78356FBB3C375B3DA11313D73526EAE38F19A93B9B9709CD508B88888894B18C98B56CF2E84CD7E08A15A69DF5C52EA52F527A0AD42222222265EA17BE8AFD997AB7F7A4624D4E67B379CEAB7CB00DE047D62EDAEEBC0BA2948E4A3E44444444444A4133D42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D22222222520A0AD42222222222A5A0402D222222A5B08E17BAF726ECC575EE1E48D9593799B0EEBD79A1D8A75471AEC1BA177B13D67D32EE1F49F5A2402D222222D5C43666DDD19E1BEE788BED657ADC5C8E1C38C8FE23B9657AD472B1ED2DFAB6694FDFD9DBDC3D924AED12770F404444442AB39EBCB0BEA7BB0751B67A3E4B6C253DA59ECFAFA2920EBD5253A0161111115B99C31B7F3270D25DF0E5023EFDF96FB8BA05031F7E94FB421B53D3659FC12F0CA3C6E60F59B9DE9B61EB83F8AEFB2C36751E45ECF33D59F7626FA6EDE9CBA47BFEC3EA8FD6906C39CED5ADEEE0910983F0DA3C83290BBF23EBDFAB6835703813860763B63F7D6E663C1F7DF839B19B32F88B5A7807F662E888218434AE09C0CE052318B5F41AC6CD0EE0D78F3EE7ABDF6A50E3EF3F306E7A84552FDF661B1F90113D9A073FFA9580473F664AC415AE27C80BDDDF64DD6180CF19DDFD672267CCE3E6EFF31CF74067A60EDCCBA837BEA3F313AB78A1E73A5EE83E8B3FEE9C40E47F5632F7D39DFCC555B41A388CB1F786D0B82605CBF999CFE6CCE5B3F5F6F3E93C98898F0FA0956729AE3F4056220B177DC8CAF519FC75690302BA0FE0FE877A71BD7D87752FF666DAA69B19BFFE597ABA1E734D342B92F671FC6A1F7ADCF518A3FBF95373DD64C2A6C6F237C09289846DBD8B590B1EA045897F7844251F22222202C78FB0FFC04FBCF3F8B32CC9B991FB46F42328770BB3C70EE3C9982C977DD2F9F0E931CC5CFE17570634E2CA3CE50EC78F1C64FFF60F19377629BBAFBB8DFB7A34242BEE5DC6F5BD8DFBA66DE39AF061DC75E33136BE359E918E3283AC4F19337022B3E38ED0F2AE618CB8EB4672BF7D9751039EE0D36CDB2EA7FEF98BFD07BEE6B5879F67510A5CD7BE252D2F3EC8FEB8EF4970565A6410F7D577EC3F7C1D019DAFE06C4D091BD19FA02B802B021834A22F373628E0B8D7D7E3B2E347D87FE020478E83A39C63EBFCA77962690E81F70EE3AEA05C36BF3591C8A7566029E85A66AD606CEFA1BCB4EC00E6F0C1DC177E1D47564FE5BE07DE22A5B0AA90E25CFFAC158C1DF408D3961DA0E95DC3B8AF8B073F2C7C9EC8C833C73D7EE420FB0F1CE178DE631E6AC15D23FAD12E672B8B5E7C94C9B1B9D0349811770570257065507F46DCD996FA25F891913334432D222222762721602C8BE70DB6CD1CF7F1C714319625733F664BC4E3740020877FEADDCBFCE84769571360054BF31EE604B4183D9745439B037DB9E4B75EBCFADD2584BD348FD722BC802BD8B3F929967FF31D3B1F6B43FDAF13D874DC93DB5F5EC0F33D6A02FDB8FDEA6C025FDCCC779B606084E3C04721E05962A6876306B658D71313BD898D1BA1471890FD1DDF6F038F8E5DE8E6957750CDE8DCFF1829D1F389A70937F7BF95D660AFA53EFBB8C47C9DEFCA9CA02D4F47BFCD606F80DEB4A87D272396BC47F40FE14C687FF6BE5BA2DF23F6B00F433F5CC4D81B6B02910CF47B8EAEE397303F66307307E61B5CB1AE3FF98EDB8F6E4DC7D2FFC5A28E9BE7983758D973E7BBC47EB38997C3BA31E0D836A2DFDE08CDDA33E0D636858C4BCE4533D4222222E21410DCC3598641CD4E0477AD03593BD891E1B24FBFC1F6305D98B6DC16D1DCFE6F2F2EBB0C2080AE118EC05787BAF58053A73805780D7E9B9FB6C5F16A8F9A400EFB77EF26F1F7BD051CB70EBDFA873BC7D72138183339C47EB30180ECAF36F11D35681FD28DC2226BC1CE3E6E81023AD3C3DBF1454D3A75E94C3DF6F1D3CF197976DCC6966FF7419B5EDC71E3998B54B34730619E27D9F4FDE6224752F8F54FE1DB8DFBC037949E2EC735F7EB4E178F936CDA94406193DF671DD3B71EDE404ECEB122C72125A3196A11111171BAFCB2B3A3A8E9724F20879C2385EF93DF659C731757B9A92C7B7D1AF3D7A5B2F7D849A0069E975F5CC08E9E78BAD620B70FA3F7759F30FFDB6436D396BDDF6C058F7684E49F9E3E873CC72DC865979F1DD23D2FC30418C78EE4D93193DDBF03B516F360F7CF5DB69FE6D80960F71EB603AD0B799AC2AFFF9FECC904BA99F3D43837E49A6B803F2CA415F39852F614A8454444A450A74E9F061A50F71A20E3C23CC796591378E18B7F08887C8AC90302F16FD200CF98F1DCF05CC2391ED986AEA13ECC7FEF6B12BEF1E760D2493CBA7427A23CF2E3FF9DE61460AE730D9099FFFB4DBB31A2BF5FFEED9737A161099EE6CCF5BF9C839EC03FC7C80697709F438E01982FA77649C62F654A251F222222E2B4337D8BCB57BF90F4C31FE07D1DD75DB0906A2F91B8AE2FE3C6F721B049033C01CBD1BC33BF056B7DCB2D34E51009D33EE49B139EF4BCB5274556A39CAF9DBF70D695494A269306346B9AF7C234A5B92FF0AF09DFFEFD18E0FCAF29A77F4EE6C783A78B2C4729FCFAB7E586D635E0A75D24BBD676A4EF62FB4130DFD0029F529EA29C3F056A11111171B27C3A9357E332C9CDCDE6DBB9AFF1C18E1AB41D186E5F9078215C43830635E0CF6FD9909803B9D9A4AF9FCA63B3B616EFE16D7A725B4BB0ECF993139E9DE91A5C8C387DFA04B925BD074BD6174C7D3D9ECCDC5CB2BF9DC74B1FA6E2D1E60EEE689F77C79674EFD50A8FDF97F0E2EBEBF93507C8F99515CFBDC0D42FB67091F70D453E4DE1D7DF8B88FEDDB932672D2F8F59C4CF39B65683AF3EF3013B3C5A715744E95EA153B9B985D660CBB9A9E4434444449CCC0D4FF2E5D83B5902402D9AF47B8E29439B9FE351A5E145C4430FF255FA7BBCFF6028EF031E9737A5C74303B8ECDDCF897D6E20B37C3EA56BA18F6F4E48883FB377A4E2D92D981E45E6697F5ADC501B629632B4FDF70C5F58D471F3F03673F2CB89F4B15D186A3509E7B5290F50D095693EF4155EFB631CCF2F7B863B963C637F407D3A8D9ECAB3614507FEA2AE7FCDB0A778F7C9638C9A319BC19D6603E071794B86FCF71586FA16F744F2F0BF9E1BAE84E58B1E2570F3BD2CFEF2D142EBBBA570FFB15AAD56770F42444444DCCC5EB31CF6D20FBCDE790F96A3A7B9AC6E13EABB2ED6CBD9C7EE83FFE6D99EC3FEDD07F9E7D2BA3469E049CEBEDD1CFCF752EADA4B376C0FCBBB2D97EC3D168E521B73232F7B8986FD38179FD9969BBD07CB510FEA3669408DEC3D588E426D7323BCF264D25FE6DF4BBFB70E3364FE8A7C2DECF2B33FF7E94B0B3FEE59E7B982B16D2613DBED597E7AAD137B2C47396D3F57970B73D63538F354D9B6FD39FB7A9CF7F5CFFB7C17BB5EBF02AE75315EAFB3C699EFBCA4B834432D22222267A9E9D588260515FA7A36A049BEBCE5497D978D9E0D9AE40B8EF9B7D5C4AB51933CB5C4671F27DF380A18534E7636353C53F96C592AB47CA880F28B82E479EE82CEB5C0F3046A7AD1A8E00B936FEC45EF7F8E111676FDCFF57CE4B9D6C578BD4A334E3943815A4444442AA5DF3F8EE29EF732C0E31A864C1A5260F985487950C9878888881452CE51B1D94A424E73716D338DF2D681949942CA39CAFC692ADFF5973314A845444444444A416DF344444444444A41815A44444444A41414A845444444444A41815A444444A4840CC360CEBCF90C1D16E5EEA14805A0B679222222222564329988895989C59285C59285D9ECEDEE21891B69865A444444E43C84860403B07CC54A378F44DC4D815A444444E43C04050500101DBDD4CD23117753A016111111390FA121C1984C260CC3C062C972F770C48D14A845444444CE93A3EC232E3EC1CD23117752A016111111394FA1A1B6403D67EE7C378F44DC49815A444444E43C0505B60350D94735A7402D222222729E4C261311E17D00957D54670AD422222222A51014649BA55E14BDC4CD23117751A0161111112905C7C244C74D5EA4FA51A0161111112905957D8802B5888888482939CA3EE2E214A8AB23056A111111915272947D242625ABECA31A52A016111111292593C94450A0ED56E42AFBA87E14A845444444CA4044446F00121393DD3C92CACB300C770FE1BC28508B8888889401D7DB9057D660E86E8B162FA563E76E2426A5B87B2825A2402D22222252064C261366B337A0B28FF361B164111DBDB452BE1951A016111111292343220703EAF6713EE6CC9D8F61188486043B6FE95E5928508B888888949188707B1D75252B5970B7B8F8046256ACC46432111535DCDDC32931056A1111119132E228FB300C8398152BDD3D9C4A233A7A2900919183F0F7F375F3684A4E815A444444A40C397B52276A96BA38A2172F25312919B3D99B21F70C72F770CE8B02B588888848191A692F59D0C2C473330C833973E703B6EB663299DC3CA2F3A3402D2222D5CC163E7CF219267EB8C5DD0329D896854C7CF2198A3FBC8A723E19AC7CE31926BEB18A0C378FC4DD54F6517C8B16DBBA7A0405061011DEC7DDC3396F0AD4222252CDEC67DB9AF5ACDEBEBF9C9F77070B86F5266CD807EC2C6AB77D3FB17ACD7AB6ED2BEE71DD753E791DE1F7CDEB59BD7937478BFB90759309EBDE9B17D65DC871B987CA3ECECDD1260FA8940B115D5DE2EE01888888540FA738F6D741F6738C5345ED16318D9F22CA6B4C65A90DA3BEFC81512579C8F123EC3F709023C72FD498DC6748E460A2172F55D947119E9DF41286611079CFA04AD7262F2F056A1111392F393B62F932EE7B7EDEFB2F97366CC7ADE17DB8A971CD333BE466F2FDFFFEC7DAA42CFEE52A5AF6BD93BB6E6A4C4DD763FCB689B5ABBF2671EFBF5CDAF066063CD087569E2E87C8DECAC62F6359FFEBDF5CDAB01D61B7F5A47353FB0E19AB7863DEB7D4B9E329028D4F581DFB3BD9977A13D4F3766E777D9EDC4CBEFFF433BEDCF1B77D9CFF29E0647E26F6CBAFD9B4C336D66661B73238AC158EA16CF9F019BE38D491071F6848E697B1ACCF06CFBFFF26C73F9C29F777701E263B762E5363FFE4BA9E4FF070C8552E4FB0850F9FFC98AF0F006C66DE9327B96DC458EA7E9DE7B8977461CAF5694CFC328DEBEF7885FB3B6CE1C3275770A8CBFDDCE9F53D9F2C4F25BB906B99E784F839D67E4DB894869DFB32B4CF99F3C92B63D59BCCDDE845BF67DB71E083E56C2AE4F520379B6D1B97B3CE71ADBBDDCAAD9D9BD98F9BC1CA37E6B3918E443DD11B9F2D0B99F865365D86F6A3CE76FBCFC1D5D7D1BDF75D84B5F4B43DE7976900ECFCF21926FE7DF6B5ACECCC666FCC666F2C962C1293522A7D602C6B71F1092426256332999CBDBB2B33957C8888488965AF7A8A5E773FCDAC95BBF997C36C5F329DE1031E60CE36FB0E592B9870DBDD0C9FF239DB0FC3DFBFAE64E6C37773F7EC1472EDBB5862C6D3ABDF38A6ACDCCDBB139DA50000200049444154BFFFFE49C2C29718DC7B3C3159B6EFE7FE388F7B6F7B88B1F3B7F037C7495F3E9DA8410398E0D8E1C86E36AD59CF82097D19FCCC5A7EE5387F7CB384171F1EC6A455D9F683A4302BF26E86CF5AC92F87E1AFEFE7F3C8C0196C723D99F44F89EA3D94B16FADE3B77FE1DFAC04DE7D7C28214317F18B7D977DDBD7B37AED629EECF71063E7AF25F998957F37AE677574029BCF5C15362C8B66F59A3FF84F43D7305DB87CC7CD3C9CA7E4C356CEB16C6A14FD1E5BCCD67FE1EFD4154CCB732DCF929BC29CC1B731F8F18F589F759C7FB3B6B0E899A1F41AB7024B21E338FAFB77AC5EB390277A0FE5A50D5950C0EB416E0A73EEBF83C8C73F62D361F8377D25AF3D721FB74F701C374FC9C7BE9F58BDE67F4C197E378FCC4DE42F0EB36BD93B8CBDFFA1333F27559CA3EC23264675D4AE0CC360AE7D216264E420E7DD252B35AB88884889ECB62E1812646DD56D8A75936353DA7CEB5DAD83AC374D8AB55AADC7ADEB9E0EB1B60A1C6C9D9972DCBEC371EBA6D76EB7B66A3DC4FA4E9AD56A3DF48975446090B5DD90F9D69DF65D8EAF9B64BDA97590B5C7D4EFAD566BBAF59DC141D656B73C615D6E711C22D93A7340476BAB8E93ACEB8E5BADD6ADB3AD11AD83ACAD3A8EB17EEED8C7F2B175786090B5D5C31F5B0F59ADD6F47787585BB50EB13EBACCB183615DF774376BABD641D6566363AC56ABD59AFC663F6BABD6B75B5FD97466AC5FBFD4CBDAAAF560EBDB3FDBB62C1F1B646DD53AC8DA79EC326B867DB7F59342ACAD5AF7B2BEE2B808C763AC630283ACAD86BC6FDD5DE075DB6A9DD937C8DAAAEF6CEB366BE1C7B52E7FC2DAAA759075CC72ABD56A8DB18E691D646DD5FA4EEB74E7B5B4583F7F2CE4CCB574EC633F1FDB3977B38E715E38AB75EFC723ADED5A87589F5A77DC5A906DB3EEB4B66A1D64BDE9B165D6BD8ED34999618D681D64BDE9E9B5D6E3051EF7B83579D66097E3E6393FFB79B4EA3BC39AEC788D374DB1F6681D640D7D6D5301E75AF5FC90986C6DD53AC87A73A750770FA542797BEEBBD656AD83AC3D6E0DB71E3D7AD4DDC329139AA1161191F373642B09EB7F2507C0F741966EFB81EF5EEA066C20F6AB1C3CBA0CE2E11B1D450935E9D4AB074D49655DEC0EF8FE477E3851835BFA0FE17AFB2E357BDCCBB4E79E64F84D5EB06303EB7640E33B0613E198BCAAD98E8707B7879C0DC4C69E198667B73EF477ECE3DD8256D700FBB3D94B3649C9A9E0790B11FD1C3B78D263C0ED3476390DDF416FB062F9BB8CEA94B780E214A7CE2A766EC503A3FAE1A86A09BBE5163C3944C2B7B6EE1AB96B37F2CD0968DB35049F125DC8B38F5BA036BDB8C3792DBDE91F7E0B9EA492949C9D67C71DACFF2A15AEEBCB03116766FDCCFD7A728B470EEB623714F1249E8485F7C36CFFAAE68D1184B7819C2DDB48721CB7F1ED0C39F382D0EEA10174A4E8E3B6BD3D82768ED7B8933F2D800307F28EBB6A0A0A6CE7ECF661B1649DFB01D580EB42C48913C655DA367979A9865A44444AC887887BFBB1FC992F58F2C4DD2CF1B88C3AD7B5A4579F21DC35F0261AFFBA87DF4E80C79E0D3CF7A46B2BB703FC0B1CCAC864FBE9DF3841439AF8B8A6C86674EEDFCCF6CF98774807C29A9C5D775AB369539AB299F4DFB7C135B66DF5EBD629649C7F72703F50AF0EF55C37DFD884E640A6FD4BCFAB2EE2E7F5D1BCF6643CBF1F3AC6DF87FEE184ED3B798EE785978FCB9761DDB9BDEE6A967C9BC876DAB2EF87644ED08A90501F4A26CF710B52C7EBEC905EB70EF5810387FECCB36326191980D736163FF90C8B9DDB73C8F48013BBF7B0136851F09350B7AEEBD73E78D501B61DE410BFF14B3AD0AD0967BD22359BD2FC3AF8FA97DFD94EC342867EAE93ABDA424382895EBC9445D14B9838619CBB87E3768BA297601806A121C1CE9298AA4033D4222252625E614FB2E29B352C7B7B22C3FBB4A4EEBE9F58F4C6282227AD26FBD4294E17F8A87AB4EDD59DB0165EE77E824B2EC10338753A4F95F0FF9DE61470F1C5C5990FBA02CF734E7EE512FBCA3086BFB1827DE65EDC376E321F2D5FC1FB0FFA14E3F89D080EAB03BF7FC3D7DB36B1F1EB1CB8B93B11C5796819315D7E459E2DA73879A2A03D3D69DEA53BB775B896CB4AFA249E9773399750C30338752A4FDDF6694E9F062EB944337485080A0A002066C52A378FC4FD129352885EBC1493C954E9DBE4E5A59F7F111129197B770DBA0CE789DEFDF1EDDC9F51CF67B1706804D3D6C5B3E9E59BB916D8DF229C292F753BF3B8DC54E257EE24F7BA66F8ED698C0709FCF25B2EB4B1CF52E7AEE6D93E6FF37DE751C4DEE74B0B36B0333D09E8E43C44766A3A9978D2D7B725107F8E81FAD0C8C7136276B1231B5A3B72FCB63DEC76EEB381AFD61C85E027F9ECCD7ECEAE1929A74F03179FF35274EAD2957A4B3EE7DBB73E2733A7069D437B508CB70B25B7EF00BF00CDED5F66EFDCC56F78D2B7910FB0DD65C76B68D418B8B22351AF3FE032AB9D45E2AAEFC8ACED574439CA21F6EDCF05E755D8CC8EED40D3C634A3057BAE87353B7FE5AC57243B8D5D99E019D19C16406C0147ADEE42438231994CCEB28F2AB100EF3C3916224684F7C6DFCFD7CDA3295B9AA116119192F13ECDDE0DEBF9E8BD2F48CCB16FCB4927D3025CD798263583E9D2B106396B16F0A673872C12DE7C89275EFA90ED27BDA8D9B90BB778C2B74BE6D98F9143E2EC0F89397098E6D707824F38B777ACC181656F3B8F919BF90593E72582776FFA84156FA8617D7A6326914F3EF8C156EB9D9BCAC2B95FF09B738F9AD4F400FEF8831DF6A9D79CC499BCB2F88FE23D41A7607A7AC38E1F92C9F1684748B70B12A761C752E67C91699B1DCEFA8AE91F15761DDAD1B14B03D8B698998EFDC965D7925719F7F47FD9905554F7911CD6CD77BC1EB9EC7A6F01CB0ED6A0739F707CF021A24F073C0EC6307D86E35A66B2EC95057C4703EEE8D3AD88E38AA3B4A13AF7A48E59B1D2D9266F64159B9D06CD508B884849D50CE791F1F16C9DB694A1212BA873652D8E1FFE8B9C8BFC193A6930ADF1A2F57313498A9CC2FB0FF6E4D33A5752EBDFC31C3A76312D1E9EC1E8F600E18C9FF01D5B272F6668B7FF51BFD609F61F3E4D9D9E139934D0164A073EF71C3F3DF812EF3F781B5FD4BB8C5387FF22E7B2B68C7DED518ADDADB8FDA3BCF6F0361E7EE75142FE57975AC70F72B856337CEBFE4A3A00DDB8F33E7FD6BEBD98E1216BB8AAC63FECFFE7323AB46D86C70F992C193719BF0DCF16F1041D08EED68045D1FBF0E8D29D8822F3F43534685003BE5DC2C3DD7EE6C159F328ACFA3B9F5A27D8F4E2DD747DDB04476DD73A6A5EC1D7A1C3A817884A19C3DC17EFA4F3CCBA5C8191EFDA16AC0617EDF9B4D0D7C36BE0D3BCF6F3489EFAE05142BEAC8BE7C9C31C3A762901A35FB0BFA6E7C1BB016620F6D530C2B68E27F6F99EE779A08A2D34349898152B9933773E91F70C72F770CA84AD77F9BF040D799A012D8BDED7300CE6D867A747460DAF320B115DFDC76AB55ADD3D081111A97C72B3F7F0D38F49641C01AE6844979B02A97FD63ABE1CF6277DCFC6CCA350AB1EAD6F0AC2D72B4F2B8B9C5FD994B09D7DC76BD2A0D54D04F979E5B959C99963D4AADF929B83FC701E22FB47D67EBD1BAE0BE6D61B1D41319B94B509FC4E13426EBDD1597E91F3DB26BEDE7A80E35734A2CB4D4DD8BB2981DF2F6FCD802ECD0AF87E20F53D73F839F62B5273AFA563EF20FED9F8055B0FD4A56DFF2E34CB731DB2973C42D7D77771FBB435BCDAA3A8561DAEE77B352DFB74A5C60F051CF7D78D7CBEED200DDAF4A373B3158C6D3399D86ECFF2DD2357E719A3F3016C5AB69D7DF5CE9C0FE4929D96C8773F1FE038B5F1E97413810D0ABBAD0B6C9F3D907BDE83E11FCE25383B815F8E14F67A40CEBE24BEDFBC87C3F95ED33CD7FEACF3286CACB9646FDD48FC6F47A9D5E866FA0455CD7208C330E8D8D9368BBF6E4D4C9528FB583DA11313D7B5E7851FDEA4FF397EECE7CC9BCFDCB9F3090A0C60E68CA90AD4222222E2EA17DEBDFB1E66FF7517EFAD7DBCF833E7C5762650FF343DBCCC8FEEE00CD40B3F65549B0BF634D5DAB3935E2266C54A264E18576566A98BC362C962C0C0480CC3E0FD05F3AAEC1D2355432D2222721E5266DF4B48B7E1BCB3C393AE0FDD7D01C2B45425A1A1B63AEA45D14BDC3C923290BD81B79E7C86973FFFF99CBBCE993BDFD926AFAA8669500DB58888C87969DCF96E1E31FF43AD860174BFE9427D84DF82FECF3D49A77A05778E2E2B0D3B0FE579335C77CD057D9A6ACD11262D96ACCADFEDE3C78D2C5EB39E1BDA14DD573B2E3E8198152BAB649BBCBC14A8454444CE83D78DB732E0C60BFD2C2E37BBB980CAE75CAA3793C94444781F6256AC242E3EA152977DEC4C4F27876BB9DEBFF045AE866138EF88181939A8CAB5C9CB4B251F22222222E52028C8364B1D175799DBE7E5B22BF557F0F0C5AF883761312B569198948CD9ECCD904AFCE6A1B814A845444444CA81A31F75625232164B969B4773BE9248DB0904B42E74DD40756893979702B5888888483930994C0405DA6E455E696FF2B2E327920F42637FBF42EF0AEA58881814184044789F721D9EBB28508B88888894938888DE00242626BB7924E727372D8D746AD0A279C11D3B52D3D28959B10AA0CA2F4474A5402D222222524E5C6F436E18869B47537249E969801FFE85DC1D71EAD437310C83C87B0655E936797929508B8888B88961184C993ABDF27EFC2F256632999C2DF32ADFEB9E41DACE4350D71F3F9FFCDF8D8B4F2031291993C9C4C86A343B0D0AD42222226E93989442F4E2A53C3BE92552D3D2DD3D1C29274322070395B3DB877FBF2779FE997002F36C370C83B9F68588919183AAC5424457BAF5B88888881B8D1E339EB8F804CC666FD6AD8971F770A41C188641C7CEDD30994C7CBB6983BB875326E6CC9BCFDCB9F3319BBDF9FCD3E86A17A835432D2222E246935F7E0EB3D91B8B258BD163C6BB7B38520E1C651F866110B362A5BB87536A164B96F3262E13278CAB76611A14A8454444DCCA64323173C634C056835AF9EA6AE57C4444D8DAC955C6B28FBC1C6DF24243829D8B2EAB1B056A11111137F3F7F365F2CBCF01A89EBA9A70DC3D303129C5CD23299DC4A4146256ACC4643255AB36797929508B8888540011E17D080D09C6300C957E540355A5ECC3B1103122BC37FE7EBE6E1E8DFB28508B88885410AAA7AE5E9CB7224FAC9CB3D4D18B9756DB36797929508B88885410AAA7AE5E1C21B432BECE8661B0287A09603B8FEAB810D19502B588884805E2EFE7EB0CD5A3C78C573D7515E65AF651D96AA9172D5E8AC5924550600011E1BDDD3D1CB753A0161111A9605CBB25A8F4A36A73BCCE313195A78EDAB54D5E9466A701056A1111910A49F5D4D583B37D5E252AFB983275BAB34D5E50603B770FA74250A0161111A9804C26131F2C9807D8C25665EE042185F3F7F375967D582C59EE1ECE39396AFBAB7B9BBCBC14A84544442A28B3D9DB594FADFED45597A3ECC3B1C8AFA2320CC3D9262F327250B56E93979702B588884805A67AEAAA2F282800809815ABDC3C92A2C5AC58456A5A3A66B3B7F3C63462A3402D222252C14D7EF939FCFD7C554F5D458586046332992A74D9876118CCB1CF4EAB4D5E7E0AD4222222155CDEFED4AAA7AE7A1C9F422CAFA0AFED9CB9F3310CC3DE26AF8FBB8753E128508B88885402AAA7AEDA42436D81DAD18EAE22494C4A7196A3682162C114A84544442A09D553575D4181ED2A6CD9C75CFBEC74E43D83D426AF100AD422222295886B3DF5D06151EE1E8E941193C9E47CB354917A52C7C5279098948CC96472DE2A5DF253A0161111A9445CEBA9139392554F5D8538CA3E1C8BFFDC2D6F9B3C2D442C9C02B588884825A37AEAAAC9514E5151CA3E162D5EAA3679C5A4402D22225209B9D6530F1D168561186E1E919496C9647276D07077D987C592E55C2039F9E5E7353B7D0E0AD422222295D4CC19D3F0F7F3C5300C468F99E0EEE14819080AB2CD52C7C4B8B794C7D1262F3424580B118B41815A4444A41273ADA78E5E5CF15AAE49C9383E75484D4B775BD987AD4DDE4A4C2693DAE4159302B588884825E65A4F3D65EA74D553577215A1DB87EB42447F3F5FB78CA1B251A0161111A9E44243829DB5B7AAA7AEFC1CDD3E1213939DDBCA6BF169F4E2A5CE36795A88587C0AD42222225580A33FB5EAA92B3FD7196AD7374749492917F4790DC370B6EC1B19355C0B114B40815A4444A48A503D75E5651886B3C4C36432394B2DCE6CF3BCE06358B47829866110141840A466A74B44815A44A4BC647FC1F8EEBD091BFD097BDD3D16A992544F5DB9B996754446DA026D5C9C3D50D73671F40296F2B8B6C9D342C49253A01611292FBB32F9E9E841ACDED7D0D0DD63912A4BF5D49593C96462E284B18C1E331E3853F691989482611834347B63D97BE1BA7E4C993A5D6DF24A41815A44E43C6C7F773861DD23797AF65B4CBCAF3F61DD7BD367C45B246466123FFF598684F726AC7B6F068EFD98945CFB833AF7A15FD3DADCD2A1935BC72E559FEAA92BA788F03ED436999C2DEBCC666F672988C964BA606F8EE2E2139CCF3171C2B80BF21C559D02B588488965B323651BFB0FA4B36E79229775B9831ED7E692F9DD42C60DB89BE7626B71CB7DFD68E771985D716FB368AD2D51C7BFFE1ABB07BCC593216E1EBE540BEF2F980BA89EBAB29939631A53A6BE89C592454484FDAE89F6B20FC3C829F3E7330CE3AC367966B377993F4775A0402D2252625BD9F913706530CF457FC4F30F4632E1B1DB690C10F0289F7CF22CC3FB0F6362645BE0245013809027DFE7B57EFEF6AF442E2C93C9C4FB0BE601B68FF3132F708708291B66B33711E1BD993275BAB36D5D62520A66B3377B2D96327FBE9815AB484D4BC76CF6569BBC5250A0161129A91DBFB033079A0E8824C23E9993BB3B834C6A704BAF7E98EDBB65EEDF0734A37933770D54AABBA0C076CE7AEAD163C6AB9EBA921819359CD4B4746790360C836DDBB697F90CB5DAE4951D056A119112CADEFE13E97872C3F56D9CDB92D2D3003F6E68E3987FCE262DF50FA8DB96362DDD324C1140F5D49591C96462F2CBCFF3ECA4979C8B135352B695F9F3CC993BDFB910D1F1C64BCE8F02B5884809FDB86B17703D2D6E746CC9206DE721A8EB8F9F8F63DB167E4C065A3423D00D631471F5FE82B9984C26D55357224181ED080A6CC7C9932701D8B8E95B0CC328B34F191293528859B10A93C94464E4E032396675A6402D2252223B48DF95038D7DF1F3726CDB49EA2ECE0ECF3FFEC2CE13E0EBEFA79A69713B93C974567F6AD553570E935F7E8E4F3E5D46DDBA75300C834B2FBDB4CC8E3DD73E3B1D11DE5B6DF2CA8002B5884849E4A6B12B1D3CFC9BE3FC13544078CE4E4D27134F5AF8AADE432A86A0C076CEBBDF8D1E331E8BE5C2F53496B2612BFD788E53A74E03E0E15183BD65F0BAC5C5279098948CC96462A46EE2522614A845444A22E95776022DFC5B383715149EF3978588B8DFC409E39CF5D4CF4E7AE9ACEF0D1D16E5A651495122C2FB70C515B501C8C93956EA858979DBE4692162D950A01611298936F7F2DEF24F7863A08F7393678F89AC58FE2163BA9CD9EDA6910B58B17C12B77BE53F84883B15554F1DB362A59B4625457967EE2C2EBAE8224E9F3E4D72F28FA53AD6A2C54BD526EF0250A016112909CF063469D284FA9E6736D5F46A4493268DF0AAE9BA5B139A34698067FE2388B85561F5D45151C39D2DD4A462319BBDF1F56D0E40C2379BCEFB38164B16D1D1B63751935F7E5EB3D36548815A4444A49A29A89EDAB1302D352DDD9D439342DC7FDF3D00A4A7FF72DEC7706D93A7858865EB3F56ABD5EAEE418888C885E168B16518391C75F977DE7D8A6AC56532990A9DC932993CA96DFF9E6E595CF1395E67C7EB397458148949C9040506F0FE82B9C4AC584962620A935F7ECE9DC394420487F4E4AFBFFE66DD9A9812FFFF969894C2D06123EC77D09C8BBF9FEF051A65F5A4402D225201D942EE9910ECE8C860B164B177AFC5BE4F8E733FC763008EDAB7B9F3AE78B6106E0BDB8EF06632796232993037B4058186F64060369B9D5F2B945F5871F1094C993A9D9933A6391727F6ECD517C330888A1ACE907B06D1B173B7F30A6C72E14D993A9DE8C54B898A1ACEC81125EBCEE178F3743E8F957353A016112927AE21D962C97286638B25CB19801D2DB1CA320CBB06DADA05CC349F2B38B9CE68E71D97EBAC77598ED96CF6C6DFCF375F00379BCD0ADEA514179FC0E831E39939631AA121C1CE994B809933A611179780B9A1B7425705E428C76968F62E51FD73F4E2A54C993A1DB3D99BCF3F8D56EDF405A0402D22524A8E20B9D71E925D83B2C592755E33C6058560B3FD8FA8C9E449C38666E7F74D7966816BDBF7713D4E79729D35CF7BEE8E370D96BD5967ED6B1886F38D4671994C267BE8F6C46CF6A66143337E7EBE0ADCC5909A96CEE831E38988E8C3C811C39D339F2693890F3F7887FB1F78986F376D70F7302B8C9C7DBB39F8EFA5D46D7215B97B2C1CF5A84B93069563C9B1EBA71013278C73D6CE4BD952A01611298223F0D9C2B285BD962C8CA3066969BF38C3617183B223DC3A029F2304DA02A1D919824B3AFB54D5582C59CEEBEA1AC02DF66DC5BDE67967B983020314B65D1886C1E83113005B2B3DD77A6A93C993D0D06022C2FBB8799415C10EE6DCF900738FDDCCED0DD358F7C35F783F308F95632AC7A2BE39F3E63377EE7C679DBC5C180AD42222B8CC9C5AB2484D4B272931A544E1CD643239C39AEB2CB29F7D06B5BA87E40BC1F15AE50DDD8E6D4571846D3F7F5FFCFD6CFF55D7A03D65EA7492925278EAC9277874D4E3188641A74E37B37B7706EBD6C4B87B78EE97FB058FB57F9DAF812B03EE62C2C87EB4F73FBB75664565B164316060248661F0FE8279EAEC710129508B48B5E1085B8E928CE2CE32BB8665D7D202D7F20A85E58AC7F17AA7A6A53BC3F65E8BA5C8B292D090605B2989BF2F7E7EBED52680386A6C1F7B348AD96FD96631AFBEFA2ADE99375BDD20364FA5DBC8CF397CF358FE376F3066778FA7041C9F3A4484F751E7960B4C815A44AA14D79966D7E07CAE59CB82427360603BCD2C5751894929CE129EA4C494227F3E5C67B3830203F0F76B5E257F2652D3D2193A2C8A264D1AB37DFBCFD4AA558B2E5D3A32FD8DD7DD3D34B7CA787F28B7CFCCA0EF7FE37839CCDDA3293EC7E25393C9C4E79F4657DB4F60CA8B02B588545A866190989452EC120D4768F6F3F3C5DCD0DBF96F856681B37F9ED252D39D9F6614263424B8CA958C1886C1D0615167FD7F54DD5BE8AD9ED08989EBDAF3C20F6FD2BFE6B9F7AF081CAF636A5ABADAE49513056A11A9141CE1C6119E8B9A5174747F309BBD9D8BD154C72CE72B2E3EE1AC4F3B1293920BDD37342418B3D99BA0A000424382CB7194656BF22B53F8E2CB159C3C7992A6D73561F9979FB87B486E92C29BE12378FFCA28FEB7F0017CDC3D9C62722C44549BBCF27389BB072022925771C3B32338FBF9355789865C30050563D7FAECA4C41467C88E8B4F006C35C900418101F8F93577D66457967AE4679F99C845175DCC92A59FF2DBEFBB898B4FA8D46F10CE5BC6365232A15E47DF4A13A60DC3203ADAF6F337326AB87E1F9613CD508B885B198641AA7DD6EF5CE13928B09D73F6CF6CF65678960AA5B0909D97A354242830A0C22F7A7C69F2EB7CF6D917D4AA558B982F3FA97EA51FAB9E22E0E90D747C7E23B3FB558E7A0F474FF1D0906066CE98E6EEE1541B0AD42252AE1CB3CF8989C92425A51458F3EC3AF35CD966F6445CC5C52754FA807DDFFD0F91F2E356FCFD7CF9ECD368770FA75CED5C3082514B61F08C790C6BE9EED19CDB37DF6CE291C7C66132999839635A85FC79AAAA14A845E48271CC3EA7A5A513179750E0ECB363A16060603B8567A9F22C962C129392494C4C212E3EA1C04F631C013B3424B842FCBFE058E0161535BC7A967D5420057531328C1CD2D2D29D771AED16DA156FEF064C9C30CEDDC3AD5614A845A4CCB8966FC4C7251439FB1C18D48ED09060956D48B5E608D8A9A9E9CEC58F7955B4802D174E616D3F4B7293A9C87B06294CBB8102B5889C37D73663F1F619E8BC1CDD36828202B46850E41C0CC3202E3E81B8B8041293520A7C431A11DEBBD27711A9AE4A1B981D7761AD6D32E5BBD15462523273E7CE57EDB49B28508B4889A4A6D966D20A9A8176AD7D0E0DED5A656F8021525E129352484B4B273131D9D941C455506080F3D31ECD5EBB97611818468EF3F7E2F90666C70DA64C2613E686DED436995CFAE5177E5756C330E8D8B91B2693896F376DB810A7284550A0169122A5A6A5939494E2FC48BAA000ADF20D91F251D42247CD5E5F58AEB3CBCE7FBBDCD2DE30724A14981DB3CB2693277E7EBED4B6CF3E97E677E80D6DDA03F0EDA60DFA5D5CCE14A845E42C79EBA0F3967138DAD7858606131A12AC5FDA226EE4280F296881A3A3077644441FCD5E17437116FC9D4B4181D9CFCFB7DC6E2C75E7C04852D3D2F9ECD368BDE6E54C815A44B058B29C7F98F376E2C83B0BAD5FD22215537166AF4343BB56DB566A65B1E0CF9D81D9300CE6CC9D8FBFBF2F11E17D0ADC67F498F1C4C5273071C23822EF1974C1C622F929508B545389492985CE42FBFBF912629F8156198748E554D4EC7555EC1C722117FC95D70C73610CC3E0D9492F39EBE80B2BE970DC723C2A6A3823470C2FEF61566B0AD422D5486121DA310B1D1A1A6CEB075D45FEC08A888D63F6BAB032AE8A3E7BED58F0E728BD28EF057FEE949A96CEE831E3B158B230994C4C7EF9B9426BE4E3E213183D66BC3A7DB88102B5481556543DB4A3163A22A20F4181ED2AE41F1211297B8ED67C898929C4AC5899EFFBA121C10405051011DEBBDC7E2F5486057FEE10BD782973E6CEC7300CFCFD7C9939635A91B77FB758B2E8D92B429D3EDC40815AA48A7184E8B8B8AF8959B12A5F3D7450603B222307ABA59D880045CF5E3B16368686966EF6BA2A2CF82B4F8E7AE9E8C54B018808EFC3C40963CF798E8ED679A04E1FE54D815AA48A28AC9CC3DFCF9740FB4C7455FBA3232265CB300C6256ACB2DF582639DFF7434382090D0DCEB728AEB22FF8AB680CC360C0C0480C23879151C34BB4C0B067AF082C962C75FA28670AD422959861182C5ABCB4C0728EC8C841556AC19188943F5B69487281B7450F0D0966F7EE0C0E65FF55A917FC5554A969E9582C5925EE293E7458148949C9EAF451CE14A8452A1947FD6374F4D2B3667E4C2613A121C144460ED21F271129738EBB36BACE5E7B787870E2C4092EBBEC322EBEE822AEBFDE0F6F6FEF4AB3E0AF2A9A32753AD18B97AAD3473953A016A9040CC3203129859898952426A59C15A2FDFD7C8988E8AD9BAC8848B99AF8D42456AF5E87E7E5977373C79B58BF7E0366B337EBD6C4B87B68D59A3A7DB8C725EE1E808814ACA8C585418101F63AC6F25B852F22E260B1648159B5BD0000200049444154B171E3B7003CF2C8C34484F766C78E9D582C59CC99375F33A36EE4F89B909894E2E691542F9AA116A96052D3D2898B4FC857171D1418A0BB158A4885E0B8239FEB2C6862520A43878D00D082B862707CEA38F9E5E7CAF4B8AE9D3E7EDAF643991E5B0AA7196A910AC0B52E5A8B0B45A4228B5EBC94B8F804E74D461C8202DB1111DE8798152B193D66BC4A3F8A3067DE7CA2A397621886F35E0065C5B600D484616F475854DF6A293B0AD4226E94989492AFA4C3D12B3A2A6AB816178A488562B1643167EE7C0046460DCFF7FB69E284B124262563B1643165EA74264E18E78E615658796F211E79CF20FCFD9A97F9F3F8FBF99298944C6A5ABA02753951A016296785CD46AB2E5A442ABAC4A4640CC3B075142AA0259B6DD6FA79860E1B41F4E2A54444F4D1A76B76796F213E71C2D87CFDBCCB8A9F5F73E71B1B291F0AD422E5C462C962F98A95CE8FF9C0F6C72722BCB7FEE88848A51011DE07BF73FCAE0A0A6C47E43D83885EBC94A1C3A2740B6C6C9D379E9DF452B16F215E5A0D1B9A01484C4C562FEA72A2402D7201393A75CC9D3B9FD4B4746790D66CB4885456C579F33F71C2389292529CB3B2D5BD7DDBDCB9F39D33FB935F7EEE82FFDE7784F5BCB792970B475D3E442E00C71D0C6362563A3F7273F48C9E3061AC66A345A4CAB358B2E8D92B0280F717CC2BD38577958DE396EEE5355BECE8F4613299F409413951A0162943052D32349BBD8988E843DFF03E5A1C2222D58AE3AE7D0A76E5AF63E76E1886C1BA3531FADB530E54F221524A8EB28EA953A7E75B641815351C7FBFE62AEB10916A49A51FEEE3E8F4B157ADF3CA8502B5C879727C841713B3D219A44D26936DF57BE420957588880033674CA367AF08E2E2139C3783910BCFD1E9232D2DBD5A97DB94978BDC3D0091CAC6300CE6CC9BCF8081914CB1CF4ADB5A208D63DD9AE54C7EF939856911A9F46256AC2466C5CA521FC76CF6262ACA762B7247A78BAAC6D177BB2231D5B6DF823C31D9CD23A91E34432D524C86613067EEFCB3EAA3D5AD4344AA225B407C13C330309BCDA59EE11C396238F17109A4A6A5F3ECA497AA54E94762520AA3C78CC7300C4CB54D8C1C31DCDD4302CE7463318C1C378FA47A50A01639078B258B45D14BF205E9A8A8E1FA184D44AAA42953A73BDBBC95D5EFB9AA58FA11BD782973EC2DF1820203E87B816ED4723E1CAF9B5AE7950F056A9142A4A6A51313B3325F9056DB3B11A9CAA2172F252E3E0193C9E42CD5280B66B3F7FFB377E7615156ED03C7BFA589E68C59980A948A0B6020248BE68A20AE91A4994BA995462EAF965A5A9A4B6EA958994BA2615A8A698626E42E8A04AE2C6A89022EA0C9602A650EA5A8FDE6F7C72C0E386C320308F7E7BADEEB4DE659CE739E65EE39CF7DCEE1C389E3991FF40553A6CE246C63E843DB594EAD56333F68A1212566D0EB034C4EC55E96944A254AA512B55AAD6D3D2F4765AB8824A016228FBC81B452A994405A085129A854992C0B0E0160D4C840B33FF306BD3E807DFBA2898B4F60CAD499ACFA26D8ACDB2F0DC929A94C9D3AD3A8FF8CE5A6102F293B5B1B9253B42351C91B55CB92805A081D09A48510959D71AA87A5262159F465106DDB77262E3EE1A14CFD080DDD40724A2A4E8E0ECC2AE79DD03D3DDD494E4995913E4A8104D4A2D293405A08212C97EA919752A964D1970B786FEC848732F5E3C389E30CFF5FDED328F4237D6464A8CAB824159F04D4A2D292405A0821EEF1F474C7C9D18180007F8B3F03B59D1D3D1ECAD40FA552C9EC59D3CABA1845A23F8F2A55661997A4E293A9C745A5632A9076727490405A08214A915AADA66DFBCE80760490872DF5E361A0AF6399FADDF224A0169546DE71A42590164288B2B52F2A9AF7C64E40A9543E74A91F0F8B166EAD003818BBB7DCA7A83CCC64A64451E1A9D56AF64545D3B7DF2042D76D308C17BAEA9B60567D132CC1B4104294A6AC63ECDCB499B098B3F8FA78E3EBE38D5AAD66CAD499655D32E0DE6CB81585FE3B2E39E54C1997A46293805A546871F1890C1D3692F7C64E40A5CAC4C9D181455F2E90405A0821CA484EF41A26CC9CC7FADF7200983D6B1A4AA592B8F80442D76D28D3B2E903FBE0E010DE1B3BA14CCB622E8EBAEFBA94224EF092937591B4B48B64E5E8FF3B8D8B5939FA4FC9BA98465A5A1A7FC8048CB948A744512125A7A4121C1CC2BEA86840DB8964D4C84099225C08214AD1D998CD1CBFF234CFFB37E05A6402976AB9F2927700FDED5278D4CD19B8D7C9EFBDB113981FF405BE3EDE6592FA11179FC894A93350A932512A95040494CFB1A58BCBD64E5B9737741394152666D19B8C0BCF4151FB316E5FFF97DB00D59EA2C7107FFEDCB29E23D7EE6817ACE6C2B875AB182A6D5380B4508B0A463B7BD5170C1D36D230FCD38713C7B36BC71606BD3E408269218400C3ECAF9695C8CF0BE6312338988F7BBE46E0E479ACFFED0AF13FFC40A2CB08DE6C776F497DEA0750262DC3A1EB3618DE647A797A10B631B4904E92399CDE3C9BC13D3BE1E1D68A166E1DE9D07F36BBCBE1601AFAB7B129C94569A14E22F5B4B6E9D9B6C7C7FC702086AD1F7851EDF69FEC58B3179BB1DF71E8C43E16F7A903B74F1277EC2F0B96FCE1222DD4A2C2306E5D00ED34E1B3674D934E2E420891C794A93351A93259F4E502CB3D23B352387D01E0120CFA849F4676A1A92287ACCB8EACAF6F8D559EC567CF9A46DF7E83484E492574DD068B4D2C63EC41A7103FB36A2483169DA569DF89AC18E40CB15F30EEB308262D74A76B504F8B97BB38F401755C7C62E10BE7A4703A15AAB519CD928FBA600BD0B821B589A36ABF8F98F55253005C1DEC815BD4B17ED262E57ED848402D1E7A79D33B9C1C1D18393250866012420813C223B61ADEE0DD50ABB1C54201F5B1147E036A074C67CD84CEBA00DA0AEBFA7943692D6DEAC774860E1BC1FCA02F0CE3625B5278C436C223B616730AF124F6EC38C96D8F312C9CEAAF0D3AED07312CA916A79DAC2D5ADE07A1542A00ED8F07FD0857F98A3FCB29C0C3BBABF6B880F49464AE5087816D5B1B163B76FA34D09CE75A5AACD80F1D09A8C543CBD4307892272D8428EFD46A3519BA4ED265B1EFF9410B011834688045CB702A35956CEA30B05BE7FB5AA3F3E3E5E98EAF8FB76138BD5D3BC22D563ED0B6486764A8F0F5ED548CA9B9EF72F72E90F01D6367C0BB837AD3BE496BDE9CD7BAD035CB8252A9C4D6D606952A5377DDE5FFFD78EAC471AEF02CFE463F0C4E25A700AD70F4D4FFE504A77ECB068716B895BFDF0F6546026AF150CA9BDE11D0CB9F51230325BD430851EE25A79C313CBF6C6D6D707274D0063D763678797A60676B63B167D994A9330D43870EB6684A450EA793CF42B5CE3CDFAEF0A58DE9533F54AA4C962D0F61D408CB4D830EF0E1C4F1C55CC38DE1733F2273CA62766F5EC2C8CD4BA856D306AFB73EE6B3C056282C52CA92B1B3B545A5CA243E3EB1801F51F7CE99A3A1E5399194E43BE0E04873FDAFA2AC539C3C0F8A80663C67F9A23F3424A0160F157DABB47E6825EDC42CE38BD1B220841065CBCBD3DDD0F2AA5265929C92AA6D3DCC50111C1C42864A952BD8B6B5B5C1DAFA299EB1B3A3A6A22677EEDC312CEFE5E551E4F4B67D51D186548F8913C759F84D5E3C29A7000F578ADB6E6B9CFA111C1C82AF8F77B91BE6D4CAA90F73C3FAF049D6457E3BB6878D0B57B163E997AC69FB3DA39CCBBA74F773746C465C7C4221237DE8CE5973877B81B22E0F3E57F0AC4BE569D1FC790B96F8E12301B57868E41DD248D23B84100F3B5B5B1B944A0519FA00DAC901B53A9B8C0C15BFFE96446AEA19E2E213B8752B873B77EEDCB77E352BAB2205D4C613A7583AD50380A4DF48B80A0DFD1D7990AC002F4F77027AF9131EB1B554523F8AEE088BFACFE46787FFB16D564FACAC1BE0E9378C474F6E67C7EAEA54AF59D6E533CDCBCB83D0751B0A1EE9233D95D357A1AE9F038DF47F33113C6B53799EA57939CC172F4B12508B724FFF45A0EF74E8E5E921D385576A6789DDF42B97EBBAD2B743D3B22ECC3D59C7D8B93F0D1A7BD3BDA5F5BDF1775FE9C0839532F771661DDB49D47968DCA93BEEF23DF650D07602CBE6865A8D4A9569685556ABB351A9320DB9D4451DC2EED1471FA54A952A3C636747C3860D78E6195BDC5C5D8AB4AEBEAF89E5533DB472525248E5317A347BF0B7871F4E1C475C7C022A5526F383BE7880D40CADF088AD78797A982D8D26E7EFABFCB133944F5BD7E54D676BB2924299BBEE776A771B464023B3ECC2ECF4C75EE0481F672F73B5EED3B469614896E6CCA5ABD4ACEB86E773F71E3ABF5FFD9B7A75DB4887C43C1ED168349AB22E8410F9098FD8CAFCA085D2E9501889609CDB6C223B4FE1B72F7A957561EE39B1949787AC81B743D832C68DF0F1AD98B2D79BD9271610F0401BCC7D9CBF2EE9C7EB2B2170CD46DE753373D945B1E983617D60AC6F554E493953EC4059A954A2542AA8A5EB3C666B6B439D3AD6A49E39CBC9DF4E91F56716FE2FF6A06FDFDE256A48085DB7A15446CE0048DFB690E018E830621CFE8D1E7C3BDAD96E4700F0E3C6D06295DD3845D0C9D1811F37863E78418CA87E59CACC391B3970F91600D56B3BD06E50201303BD0D236394376AB59AB6ED3B03F0DB89A3655C9A8A495AA845B994776C5019535A3C6C3A4FFC01D7313578DA4CDB737CED3322FCA15679FDC6AE20EE05C3D9A8752DCB19192A430BF30D5DF05C9C6059DFC9501F38DBD9D9E2E8E8A0FD6FDDDFF5FB4E4E394368E87AF6454563676BCBFBEFBF8B97A7BB591A114A635C67BD462F8E63FE8B25DF8E97A73B835E1F609878A5A8A91FC66F36CD3DEBA16DC7D12CEF38DA6CDB2B0DC6237D24A7A4CA1B5E0B90805A943BA672A54BF38BA0B2C8C9BAC86FC7E249FF1B6A376CCB0B9EF5F3F44ECF212B258E4327AF708B5A34EBD401376BABBC1B2135EE30BFFE9143F57AAE746ADF34F7368C3EBF6F1F6763083BF10F8D3BF9D0F09A6E3F4F34A0C30B9ED4CBBD11B28EC71075EE06D5EB39D3C6CBD4D164F347D271E292B5656DD4EE053CEBEB379245E2CE68CED774A56FAB27498D3B4CD2E5DBFCF78806852E3D434F15B78D8317EF62EB1940DB8685ECA77A5D5C5FF0C2216F9DE85C3E734C9BF2615F9FA6C6C7FABBF65878A2313E1D9E279FD5EFDFF3C553249C87C6B51A609DAD4D2F51B8F5E179453C870F5CE47A7EE5C9BE4CFCE183A4FF8DE9735449E803607DAB7249D32FF481B23E48B6B5B5C1CECED6D0C25C4BF7F7C20261B55A4D5C7C22FBF6ED3704D1BEBEDECC9E354DDEC4E97C38713CFBA2A251A93299327526B3674D2B70F9BCDF21B3674D937909B837D287AA8C866CACE824A016E546DE113CA455DA7254E193787DF65EAE3D5A8B7A8ABBFC756D1E8F3E379415DF8EC0DD0AC84964D5E8C97C75F44F1EADFD34D56F5DE5FABCA7E83165354101DAF391736C394346ACE2D4FF3D4E9D5A70E3DABFB9B691736C35C3C70693F0EFE3D4A95D95EC2BF3F8BF677A3277E52774B50192229831330987B02F493F7B8B5AB5AB927DE506336A7B337BC302B4BBC9247CE25BCCDCA52D87E2CE756E3C59973AC60793758085A327B1EAD47F28EAD4A6FACDEB5C9B5905FB7ED359FD7167ACB944EC8A79843CE9CD8129D1445E87263D3B7373FB5EAE75AE8A4FCB5EBA3172CFB075E10C969C69CDD49D269234721259F6E6588275FBA99A7D95EBFF97BB4E8C25FD348F197BBD99FD4A079AE673AC73EB74665AE85C4CAC7E9F8CD855CC5809814DBBE3CE0196CF5C03CF6D21E3543AD5EB3ECEDDEB7F924D5302BF5ECDBB2DB547A4DA3D9B11532348CBE71C553471F189A854AAFBD22F8AD3AAAC0F62F5ADCAB6B636286B29A9A5549A6C552E4959E3E213080FDF8A9DAD2D9E5EEE2CFA7281043AF958FDCD72BAF508203C622B0101FEF98EEC14BA6E03CB82430CF9E2F21D728F7EA48FE49454F981610112508B724146F0284D47080DDECBB56643D9B87A04CDAD40B5FE7FBC346F2D21E1AF12DCCF9A238B3F61E1D1BBF84DFF91797D1A629573811F27BCC5CCD99FE2D97E09FD147B993D7615A79EECCEE7AB67D2D526870B6BC7D3E7B35504ADE9CC86C03F5934299804BCF9246C36AF34B4223B6E116F8C5AC7A499CFE111DC4FD7F3FF1AA9AA7BCBA8368FE39519D1AC0E3B41C01837B2367ECACC5D6A1ABDBD9CEFC7B86395934C48E030165FBA7734A77EF88A55A7AAD269FA0F2CE9630364B2E9DDD7F964E33AC25FEFCCD046BA0513A2896F3B86D0D9FD70B34E6671F25E426262D899D38B002B203D969824A8D6B90B01263AFD6585AFE69B5355E931773B413D159073804F03C6B13EF87B5E0978BF084383E53E567D7DCC9CB991F686FA289E7367EF3274E576C67929C839B688FE6FAEE3BBB5BB18DEB21756591B99F57104198D5E67D5EAF7F0524076DC170C7A7B159316B764D784F23909454904078710179F90EFE785A55F14B555D91C542A158004D145646B6B932BF5E360ECDEFB96494E49657ED01740D1A710AF4C9C9CB4D75981237D88072601B5285379673B74727460D6AC69F2056351595CCB026AFC4BF61DC00A6CFBCCE4A7176E402D05B097AD5B2E439B714CE9D350DB7A6BD59057FB77677974183F87A7D3AF410C91D7A1CD88F7B4ADCD58D1B0DF6B8C4AAA4DEA637F42E40E7ECA84361F7DC42B0DB54DA10AAFF718FFCA2E46ACDF49787A3F86EA4AD3A4EF20C332B67D7C7861C60122D32E004EEC8F3DC2ED6ADE0C79C75D570E27028707B06154185774EB576BD197E9D39EE6F93EFA56281BEC1B3F09D1D964FF6D74D8D5BCF9E0CBC1B85901B8D1C9B711212B1338129D4340572BD2F7C5709CC7F0F3EE667256B73FAE65711BB8F96F163928B0B26AC7BBDFFEC0C09B45CF93363E5685D7088674D8C894BD87D89FD38F571EA0C5B85A87018CF2D2267058B5EC846FE37584A45D2405A815BE93D8DB751838561B4C6BF7F906FDDB6CE0D32D3B889CD01ABFE2EFB25CF3F5F5CE957EA1FD6F5BB3B52A9B53D1A6B816C63E9C389EF8F844925352796FEC04167DB920D7E74E8E0E0C7A7D007676B692266882FEFA4F4E9180DA1224A01665262E3E91A0A02F484E4945A9544A8B42A9E94C57FFC5ECDDBC81A13E11D469EC8C777B5FFC7A76A3BDB515A45F243D1BEA5A6513B569B3D17AFFF1347036FD1CA76EA5924D235C8C8652C2AA1DC3E669A7443BB56C91C9714A3D1D1C81A32427DDFB9B7D83FC86AC4826E377E09986D81B079B9E4D790E0C0175D30E2FF2E4F11836077D4C48C665924E659075FD4FB83792AA569EEDB876EB8AF3CAAF898A8D85AECF73E8E849A8E64DA7EEA623DBE7FC7AE0F1DD12F6CF7A95F64B9EC5E9F936747CC98F3E1DEC8B9C939CFB58ADB0B7B70332C848061E60E48E67ED1BE63BA5F3D9F474E019FEEFF266C236DDFBFB0DAB3A907D918BE9DC57450FBB41AF0F90400AEDB355A95454C88689455F2EA05B8F00C324357953171E7468BDCA409F26A356679771492A2609A845A953ABD5AC5DB781D0D00D8656E991230325A7ABD458E1373D9CDD01316CDEFD137B7625F1F3CA3836AD0CC66FE65A1636FA0735703D6E13CB4F55C9BD6ADDA7A959E52E77FFBB5BE01EB49F57A1CAA379F65CA52A70873B05AFAE5395AA5581BCCB5A55CDF5E0FA75D95BBCB5E22C8FD66F419BB62DE93F6220CA33C14C5D5FC8E61DBCF175FE9A257B63887CEF0A518740E1EF473EF134380CE6DBBD6D88DDB9939F7F8EE2E0E18D1CDFBF91E50E4308091DCD838FB6AB3B4E33FB273B1B4867D7F26FD89FEB9347A857B71A9A7FCCBF4F51F6D46A35EF8D9D805AAD66D537CB2BDC2CB2B6B6368C1C194870700853A6CE64D78E2DD2085344DA3427A561F41AC92D372F09A845A94A4E49253838C430494B402F7F3EB4F814B82297B331849DB84A7DB73E044EF4237022E45C08E383D782880C0DE7D4726BEA02EA5E5389FCA89DD18AD9FC9176959C5AB6D4DC1D011CE7D2258C5A568FF0ED47119C76EAC5FCC64DA8C65ECE9CCB419763014062DA79A029CD9A02670B2BA8338DEC1F83A80BA4E580AB7E33E9595C332CB3971FD79DE5B6C71876AD1A6C1803F6D7255F17A1229AE1E3E3C492A547895A9245020ABA7977CAA7C557375208F6F8F41D4DFBBEA3816CE23E1BCAD0B5EBD910391AF7670ADFE33FFF6681215B3A87B4B40CA8D691461698AAB84EDD3A803DA3367CC540A3170539591751DDA8C6D3F6E6DFA7287BC61DF29C1C9B9575712C62D48840A2F64573F1F74B24A79C29D18F86E49454C3F8DF958193A30371F10986993985F93C5AF822429847E8BA0D0C1D36D2302EE8EC59D36468A8B2F0C7218267CE6356D80172747FB2AAAF440960FD04F5AC3DF174862B3BB6109EA95F29870B615379F9E5612C4F00EB362FE051ED0E31BB36A3D22DA15ABF86253BF670E1CE53E0D7896E0A38B83E8444FD4E322358FBD3EFE0EC4B972206909DFD3AA3B87D906D9BF505C9267AED4F1C372C9143CEED3C2B6546B03A2CBD48DB6FE6DD1167AE11F1D3116E2B3AE2DB35FF44E6942DF398317525BB0D75A2A0F613D58127A85DBB68C7736863A8A13E724EAD252CE60E8AAE9DE85CB4D58BC5D3DD1305C709FB3ED1709EC93ECAE2B7FBD2EBE3AD6416B4B27828ED8B8A2674DD06944A25132B784345A74E1DF9F7DF7F8B3CCC617E8282161A52482A0347DD8FAC14C9A3363B69A116162793B49433ED7AF34EDBDDCC5E3F914EF1CFD3B1299CF9E53867EED83178701FACB1E28D0943D8F5CE1AA6BCFC12612FB8F2E4F55F3974FC0FAA779EC2E8AE56403FDE1DB283C095F30878792FBEF5AFB0EFD0057018C2C421CDC0AA19A327EEE7D0EC3504F68CA39D9782F4A838D27062E484C114B5DDCCAAEB483EDA799029F3FAD32BBA03F5AF1D20E142556A2BE03A009DE9DAE30B76842FE7F5D78FD34AF907078FA55155510BB8C6FE9035B45E5A4072B2831F5DDDBE26E904D47DA94B019DF4ACE933B81F6B1336F2E9CB2FB1DDA84E6AB7FD8057DB01278A7040E7D711D83391762E55397DF8372E3FEECDECD1A63B419694A1EE568EA153B4F1796E4AE0D7453F07E2E1A09FC80460D0A00115327F5A2F74DD0696AF5869966D5DBBA67DDF55917F7C1853D6D21E675C5C82F437303309A8854525A7A43275EA4C43C74399A4A53C6846FFE02D38476E61DF81D364DC04D781E399D8CB9F1774235058B51CCDF73BDB13F353247BCEFE054F75E3C3C0EE74374C0A6285FB98D5ECEEB08775E187C8B869C3E0A9EF13F0D20BE836816DC05C7E768965E7F6FDC465DCA47DE0A7CCEA6D34394CFD16F4EC518DE6F58DCB560FB71E5DA8E6544FF76F1B02BED84293ADDF12169BC9CDC683993FA30DB776AC23A64E3DC00ABF995B58DF4AF7F9533E4C1FB1880ECDAFB275D15A8EDEAC4E0D9EA071BB2EF4C49E5AF7D545239E777F164EDCA19B6FBBFB3E3566D5EE037E0A6BCF9E3DB1C49CFD0B6A78F3CEE0EE0CF473D1D6C913F6B4EFD1051A3FA13D3CD72EF4ACE688F1E1F94D5D856FE61662336ED22570203D07F8E1926F8FC6DC7551AB711B7AF6D06F3EF7BEB4F21EA7B6EE9C6377B17D6F221937E185A13398DEDBC4043DE2A1679CEA31B8023F63C323B6B22C3804D076402C69DF9B6B59590028959563BA23FD0F2D954ADE5199DB231A8D4653D68510155378C456E6072D94E1F044397684A0EE6358FBD43B6CFEFE6DCBB5DA864FA0C5B468FC661E65A18939638428897D51D1BC3776024AA592455F2EA8701D11F5925352193A6C246AB59A41AF0F30CB881E1EADDA733BE736BB7684979BB7A6969C1A5CAD56D3B67D67944AA5C9B1BCC58393166A6176A6663C5CF46550A579A5261E067F133E7F320753554466D6A2C798DE9202211E5A4A5DA7BA8266107CD8A9549986D14BB49DD94B1E4CAB5499DCD675C2F8E38F2B160FA8935352D91715CDA81181052EF7DED809A85499F8FA78E3E8E4C0CBBDFCCD563619E9C37224A01666A5CFE3D3773C94140F513E3D41FD7AB5E1AFDAF49F3A90512F3EC83C85C56032BD4508F3F0F27467D78EF01277D02BCFDE1A3602952A132747073E9C38CE2CDB34EE88F8D7F5EB66D9A6297927302B6A80AC1F6B3B3838042F4F0F02025E34CB844076B63624A7A865A40F3393805A984DDEE9C367CF9A26634B8B72ABF59B738A305DB8B9763684F9156FA66F51CE54E4B7808BBE5C4050D042B3BEED8C893960F8EFE494548B7C5FE96775D47F2F7A797A14BA8EFEC7515C7C22FBF645131EB195B8F804E2E213080DDDC0AA6F824B54079E9EEE24A7A49292925A61DF68940519364F9845E8BA0D86878697A707611B43259816420861164E8E0E250E248DA9D56ACE9D4F03E0A9A79E2425D9FCC3C8A9D56AA64E9D6968595FF54D30ABBE092E52ABB052A9C4D7C79BD9B3A6F1DB89A38614175B5B9B12D7817EA48F8C0C55214B8AE290166A512279F3A565FA702184308774560DE9C7C2135E4CDE977B721E517271F1893468F02C7FFC71853AD6D6C4C5279A7D1FCB8243484E49C5D6D6A6C43F0606BD3E80805E2F9A65DA7019E9C33224A0160F4CF2A58510C252AEF1D863F5A171739C259836BBF0F0ADB8B670212E2E81471FD5BEAC57ABD5666D010F8FD806C0EC59D3CDB25D7D87C292D2A77958E247446526291FE28124A7A4D2B7DFA05CB31E4A302D84104595C3E9CDB319DCB3131E6EAD68E1D6910EFD671BCDC4E94483465571E8D201D7B22C6605A4CF4F7EE6193B401BA83A393A909C72C68CFBC8C6CED6062747877297A7AC0FCAD56A7585EEC85ADA24A016C516179FC8D061230D7961922F2D8410C57366D54806CDD8CDED361FB062CB0FACFEC00D922398B470BB7681239B39D27C26DF8DCA3DD3E7FCA02F981FF4451994B8E2888B4FC4CED686C71ED3BEA4572A15383A3633EB74DCB6B636FCB831941F37869A6D9BE6A44FFB30E78F88CA4E026A512CFACE87FA19B98ADAC1420821845E127B769CE4B647200BA7FAE3696F8FE7E0410CEBD105BFE774F91DAD8730B1AF6E164E9D7D51D184AEDB4078C4B60AFBBA3E2E3E91F088AD16DDC7BE7DD1F8F87A1BF291954A255E5E1EC4C5255874BFE589A7AED5DC9C3F222A3BC9A11645B66C7908C1BA295FA5F3A110423CA8BBDCBD0B247CC7D819F0EEA0DEB46FD29A37E7E53FB6A25AADBEF7FC1D34A0DCA511984B50D01724A7A4A256675B2C8D302E3E81D523971BC6A1562A1538393A30A582FE4831453FD2C70D49F9301B69A11645A20FA6954A251F4E1CCF8713C74B302D84100FC48DE1733FC2BFD95DCE6D5EC2C83EBE78B40D6044C851F21BC3413F628493A303832B687F957D51D1865131027ABD68917DC4C527524B37B3A47130A9542A1EBA9CE265CB431EB8355F9FF26189E1022B2B09A845A17207D3E3A4F3A11042949095531FE686EDE7E0BE30567F3E9CCE4F5EE3C0D22F599374FFB2FA540FA552C9C40ADC98A14FB9F0F5F1B6D831C6C527E0E3ABEDF3A3CAD0F60055D6521A3A2666A5B6A5A900002000494441543C2443C925A7A4121C1CC232DD5B8BE2D207D4153575A82C48402D0A94379836C7B4A7420851791D6151FF17F19BBA9D1CC0CABA019E7EC318D0A53E509DEA35732F5D59523D0052741DE4BCBC0A9F4DF04185876FBD6FB6423B5D3F204F4F77E22D1860EE8B8A3619C0AAD5EA5CD3A017853EFFBBD603FEF0502A15867D3F4CADF2E599E4508B7C49302D8410E697F3F755FED819CAA7ADEBF2A6B3355949A1CC5DF73BB5BB0D23A051EE65D7AEDB50E1533DF4F4419EA5261C494E49A5965269F85192379054D652926CC11488605DDA4E7E76ED082F7227FFB8786D6BBEE703FEC052EAD25E54AA4C325499383956CCB71EA5495AA88549A1EB3648302D841066D79A419387D0EEA94B6CFE7814BD5EEECFC805293CFBCE027E08EA49DE395C468D0864E4C8C00A9DEAA1E7AB4BC5581BBADE22DB77727460D6AC69867F1B8FF201DA54135B3BCB8C5AA556ABF1F1F536A45A18532A9578797A142BDD243C5C9B3B5D92D67C3B5B5B008BB6CA5726D2422DEE13BA6E83619C5309A68510C2BC6C3B8E6679C7D1455E7ED488400B96A6FCF0F5F136B49A86AEDB6091FE3AC601ADBE855A1F503B393A980C78CD41A954326A44A0E15CDED73A5E8C1F4BE1115B51A932B1B5B529510A90A36333E2E21364A40F3391166A914B78C4564327879123032598164208512A944A258BBE5CC0C89181A5D2F9FD8621A05614B2A4F9E9A7112FEE74E22A5526F38316023078D0C012BDB5D0B76ECB481FE6212DD4C220392595F9410B51ABD5DA71A62B49AB88104288F2C192ADC4F979D08E7D65212E3EC130B15A498716D4E76BCB481FE62101B500B4BF7AF5332006F4F267D44809A6851042545CFA1CEA8749402F7FD4EA6C027ABD58E29C7AFDE82632CA877948CA8700607ED017A8549938393AF0E1C47115BEF38B1042888753A86EE49392D20792451D59C352F443D725A7A4B22F2ABAD00077D0EB03CCF21DAD1FE903304B7D5676D2422DD81715CDBEA868944A25B3664D93605A0821CA40724A2A76B636F20C2EC0BEA86843A7792F4F0F3CBDDCF1F5313D7A46418C87E653A932B9A1561B5AAC2D3DD677E8BA0D6464A8484939835AAD264395992B88FE70E2F8529B40CDCED616952A93F8F8C4524FB5A96824A0AEE4F24E1A2037941042943EB55ACDD4A933C95065B2EA9B607916E7433B2DB93FE1115B898B4F202E3EC1F01DE6EBE38DA3934381FD7FF401F98DBF6F18FED6AD4780E1BF954A250763F7165886B6ED3BEB96CDDD9951ADCE46AD56F3E3C6D002CFDFBE7DD18671A48DF7AB542AB0B3B52DD5167319E9C37C24A0AEE4F64545939C928AADAD4D859F34400821CAAB65BA493F6C6D6D0CB9ADE27E4E8E0ECC9E358DD9B3A66983EAB844439A84FE4D6B61EB1BB74E3FFAE8A3D4AC59D3F066A0A8237E946486C1418306E0EBEB8D52A9C0D6D61627C76665F656C2CBCB83D0751B64A40F339080BA920B0DDD00C0A89181F29A510821CA4840803FFBA2A2993D6BBA3C8B8B28A097BF616857B55A4D5C7C62A175676B6BC38F1B43F9E38FAB8C1E330E87664DF9716368B1F6BB6BC716D4EAECFB5A758BFA43C8D7C7BB58FBB3247D7D490E75C949405D8925A7A4929C928A52A92C5737B8104254364E8E0EECDA115ED6C5786815E77BCCC9D1E1BE59128BBB2FA552892D0FFF9B0427C766C0C339E2497923A37C5462FAE946BD3CDDA54544082144A5A152A980B299D4A53CD1FF3850ABD5B9526144F1490B7519F9BFFFFB3FBE5FBFB14CCBB07EFD8F00D4AEFD04A1EB3694695984104288D2A26F50BA72F55AA5FFFE7BB2766DD46A35DF7EB78E060D9E29EBE21468E08057A952A54A5917C3A447341A8DA6AC0B5119FDF7DF7F3CEFDEA6AC8B2184104208F1503818BBAFDCBE5590940F2184104208214A40026A2184104208214A40026A2184104208214A40026A2184104208214A40026A2184104208214A40026A2184104208214A40026A2184104208214A40026A2184104208214A40664A2C238F3CF2085E9E1E655D0C218410A2D2493C769CFFFEFB0F575717ACAA59957571441195D7591241664A144208214425D3C2AD1500BF9D385AC625111585A47C08218410A2D250ABD5655D04510149402D841042884A43ADCE06C0D6D6A68C4B222A1209A8851042085169DC90166A610112500B218410A2D2D0B750D7522ACBB824A22291805A08218410958E52026A614612500B218410A2D250A9540028958A322E89A84824A01642082144A5232DD4C29C24A01642082144A5A1CFA196166A614E12500B218410A2D290513E842548402D841042884A437D431B502B6B49CA87301F09A8851042085169E8533EEC646217614612500B218410A2D290A9C7852548402D841042884A4746F910E62401B5104208212A8D7BA37C48402DCCA76A59174008218410A2B40C1A34004F2F779C1C9B9575514405F28846A3D1947521841042082184785849CA87104208218410252001B5104208218410252001B5104208218410252001B5104208218410252001B5104208218410252001B5104208218410252001B5104208210AF5EB927EB470EBC7E213655D1233089F400BB7568C0B0738C1E2DEAD68D17B29BF3EE8F64E2CE565B756BCBC445B39E1E35BD1C26D02E1662AAE28FF6462172184104214AA56E336F4EC018D9F28EB9298DB13346ED7859ED853CB4C5BACEFDA859ED51CA96FA6ED89F24F026A2184104214AAD18BE398FF625997C2121AE1FFC11CFCCDB8C5D66FCEA1B519B727CA3F49F9104208212A91F0F1AD68D1FB53D62C194397D6AD68E1D60AAF6E6358FC4B669E6516B169DD04FA7977A4C5F8883C291F118C736BC5CBB3D6B27844006DBC5AD1C2AD235D46AC262E693393FA76C2C3AD152D5ABFC48890A3641BB69C49F49231F87B77A4855B2B5A7875A2FB88A5445DC8D17DAE4BBF18BF96DD41C3E8DEB61DDDDFE8450BB756BCB33ECBE82874CB794D203C0713F2ECA7B51FFD266FE6B4C96573A77C688F731C2B364FA54FDB76B4706B8547DB814CDA9C8CC9D5F3AB637DCA47F8045AB8F563D6DAA58CE8A9AF173FFACDD885CA689D9C0B51467579FF3911E59B04D44208214465737E0B0BC2727869F62A22BE99884FD54442DE7F9F65C6F9D19736F2E997BF51D5F70DA6F77ECEE466CE852D61EDDFAD981CBC8A2F063EC39F878219FADAE79C683C9A155B9631C1FD2607964EE6F328EDF2BF2E798FD12B13B1F299C8EA2D3FB07A7A676A26ACE1DD496B3963BCE198E54CDA7403A7812319FB4A179C81845FF66208A94FC4B0EF3C28BAFAD1DDEAFE72656DFC94F12B9378B2C744566F594570607332B7CD63ECE22345ACA0032C9D7B92A6E31711F1FD1CDE70BACAD619A399BA2DABF0554D4A67E3675BB8D5E363BEDBB28C09EE707AF34C666DD46D2F6B3B53877C48C8E97AF49EBE8C886FA6F1AADDE9FBCF8928B724A0164208212A1D052F7DBC8477BBB860EFD997A0856FE17CFB2C6B37EDBDB7C86D2BDA4E5ACDF7D387D1B743D37C36E3CD94A51FF392A70B5DC6F5A52D804D001FCFEA8BA7BD27430675A52E373876F20470895367FFA19ED300267EE28FA7BD3D9EFE5319D201484AE194F1766FDB316879285F8E1944F75EDDF17586DBF171C4EA9A88CF1C3DCA3914F87877C2443C4DECE123DCC68D97C7F9E369EF42FBB7DFE583D7BAF0FC23D7482F620D39BF1344505F4FEC9DBBF06EF0045E52DC60C70F11455EFFBEAAF29FC08A315D70B1F764C8EC61B4E10E47E3B501FE99CD1BD871BD3E033F5DC2447F4FEC3DFD99B8E01DDA7396B51B7715B9655C941D09A8851042884AC70D0F6FA350D4C19DD60D21FBF419A3C0D68D4E2FDA14BC198F3674B7D6FDB755556DC7ACE79C68A7DFB4E2719486859F61C0A26D44FEF00E4D2FA691161F49D8A6AFD8996062BB0DDBE1DD52BF9166F8F838C1ED83ECDF9903A41313930C8AF674F236154EC373CD9D8003CCEB3F81C56B2389BFF814DD3F9CC3FC0F5EA451C147A4F32CAD3D9BDDFBA755273C3C80D3A9B903FF62F0F4300AFEAD6B5213B87DF72E90C3AFBF25C3D3EDF16E67743CD69DE9E801D9BF2593F480FB14A5473A250A218410954E55AAE68A45AB50A50A70F72E77F35DC6D466AA9A6C21CE8F6AF76C467FB28333FFDC81EAB5A857AF214FD500AEE759B04A955C014AB32E3E3CBF3499C347F793E3A622EA0428FCDB914F3C4DB321B358CC5282438F10F25934219F41B59A4DE8F5C9174CEF5AC88F046D01A892ABC9D18AAA5581DB77B9538CE33556B54A7E35954CC6EFC0D53046B88599F8FC12BF03EE0FB85F513A24A0164208212ABD6CB2D5C073B638026996D845CE2E96CE88E0825D5FBE98378A2E4D1480B603DF94C2FADE35F2C1C72D98E3FB0FB1D3E52AC751F0B24FB7FC8379AB86F8042EC02710B22F9FE478EC2E562EF981B08F3FA5B9C712FA15BBF059FCFB2FD0F0199E2DF6BA85A9AA0DD61BBECAE2457D4DB4A0D7E069B3EF53989BA47C08218410954E024776DFCBCCCD397080E8ABE0DCA245B15A9C8B25F90CA7B2E1D98EDD0CC13439899C2F52F4DE08DF4E2E90FD0BF396C6C1D3DDE9EE97DFB2DB99E8D58A1623D6930528EABBD0BEEFFBBCDBFB59B89DC5B5CB45D95F3A078F1A7593CCDC4D5402285A38E15C94D58BC51987E60AB87086DFABDB636FAFFFDF5D62E68F26F0CB68FE36FB3E85B949402D841042543AD9FC3C670C8BF79CE464EC377C302D1C55EDCE0CE9D3ACF0551F9453339E53C0B9B095AC894FE364EC2682464E64D57980DBDCB8985560E7BB46015D684336D9D960DBCD9B76F92ED99A761D1470E81BDE5FB095F8B434E2B77ECEE29F7E87C66D695FC48838E9EB894C0C8B272D7E2B33C7077388A60CEE5740AB7809F8BDD20F876AC759F4F624D6C49E242D29969077C7B0E8500EEE5DFDB0B3C03E857949CA8710420851E938E1D74ECDFAC94309B95D9DDA4EBE7C32630A3DAD0B5FF381597563F4DC33FC3967230B86F5A75A4D1B9EEB368210FF134C9ABB8BA0F77FC4E3C736F9AF6FDD159F360B3974A83E9DBD0B9A36C59A80B9CBB83B63364B7F9ACB5BA177A0DAE3D8790C61E9F4D1B816A9B07568E3F30CC7168CA2D7ADC750D8B913F8F96446B915EF908BCC6D044B3EAF4AD0571B58F2BFBD2CE03114764EF49A3E818F5EB4E44911E6F28846A3D194752184104208513AC2C7B762CA5E6F669F5840405917A6588E10D47D0C6B9F7A87CDDFBF8DA5DAD27F5DD28FD75742E09A8DBC6BA9005A5438D2422D84104288722C9DC4C3D9544BDBC04F998FD17E686F8B05D3423C2809A885104208518EFD4DECFC4042CE3F469D8EEF31BE9FA44088F247523E841042082184280119E5430821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A0821841042881290805A08218410428812A85AD605A80CE2D74EE3C7A4FFF2F9B40E1D468CA3CB23517CF76D02D57BBECE102F1B8B9627E74214DF7D1BC9B99A6D19F9C18B342AE9F6B28E13B33F81C4B8F364F1244DBD1A63D3A00DFE5E4F9175F1378EC59D2051EDC2C4375B9BA3F84528CF457E3BF60B07539EA4D7FF4A7E7C05EC890B87B712BE2B918C9B60EDFC3283067B615B8C2D645F3EC9F184231CBC5A5AF593CD1F49C7894B3C4EFC7F5E7C62B67DE6DC3BD769F5E997DF759593456ADC7E769EA85EF27373690F4B82F77349776B3DEB379ED17ED6F72D9615194C50E425ED3FAAB7E0B54F06E05682DD96DEF5956F013811B3855D91E7C9026AD835A709E9FCD76A0A96BB8472381DB58D73353CE8F24243AC2CB59B52A43D8FF11C4BBC804DBF71F83732B91459297144EDFE8DEA2F8DCC6799D275E4DB8FD99C5CF032CDFDC7E35BFD18D187CEF0A425CA9D7D9993C7133876EC9885AFBB72C0D4332B2799A8ADE7A8E1E9C70B0D2BC2DD20CC415AA84B8167BFCE28E2F7B07DC71EB6C79C47ADFBFB5FC9316CDF7188F37FC3CE451FB264F346167CBA895F2D548E9CACE3FC38E30DBAF7FD90259BF7B0FD401A374ABACD634B79ADFB3BCC88BC857BDFB779B5FD231C583C8F49EBE3803B64EE5DCDD4992B58FBEB1FE63884A29488F3475732FBFDC5844496FCF80AF2EBB2B7E8337C17CA37DFA1738D0BFC72E02497738AB3854C4E870733617269D60FA87FDDC49CCFD6B0C9DCFBBCF40B4B67AE606DBED7551607BE99C4B0FFCD37CFB979A60BAF385DD5DE573BF6B0226C375926F6B97753A86E9963287C7B9728982ECDEBCBA4ACED4CEAD98BA10BCF52DF7F20230677E289B85504AD8CE0C4650BEE37750D9F8C9DC7A4F756B2DF82BB295D9788FA6A1E8BD7699FC1A6641D58CDFBEF8C67C6CAA87C97296D977FDDC3F6433770EEFB3623BAD52669C71EB69FAA4DF7E16FF3AAF30D0EEED8C3B193475931673241162B7736BF6DFCDCF2D75D9933FDCC3AF3DDA7BC3B73066356EC2FCBC289724602EAD260559B2794BAFFAEDB8E11F3E6307FDE1CBEFE612E03758DD1F64ECE28AA55A7BE4B63EC2C51865D9FD0A9FBFFF8E2973FB865B68D6611FEF57A526F7B316AF6FFF0F3B4C7D3FF7D567C3996575CEB010A5CDC9B53AFA4BB39B1914F3E5AC391222D6C45F31E9ED897749F853AC1FE3D67B9DDD8158F860DE93A3D94ADCBDFC2BD80C68AACC8603EFC6C1BE986BFD8E0F58219EAA75814347DAE8905F6698575DBA685D4BB35ED46F9E369C6BDDAD67A02788C6AD58043B1ECCE1B5167ED252A1EEDE72878E28992B62695D6F5655A7A78185BAFDDA1EDB04F18D2DE057BE72E74F6AA63DE9D64ED65E9470BD99A6EF43787217CF2E547CC5DF4369DCCBBB7326365DD1687424EA475BB11F4F6289DF214557DD75E7CF4E5670CF1B4C7FEA91ADAD7CC556A606D6F8FE7E0CF5834B1172D5BF6A095252F5245539C9B99E7BABBFFB9089045E4571FF3D9B67493EB941ED3CFAC666F4C66F1B4E92C19DEA92C0A55B914EBFBBF6C49CA4759B26AC7FBEB9A90AD006BB7D51C7A07C8C9E15E23673627237F607BA43695C2D9BF3B1D9EBC4E52720AA78A9B42D16E0C5B633FC1DAEA048B7B071272DE1C077089CB97EFDCF757AB96AFF149CB7C56890FE5E3B0D3DC05B0E9C0BBEF75C78E1CB28EC7B079771467FFAC819DA71F012FBD4043AB1C2EEC0B61D69CF51CB9664D1A296C069EEE10C8072F3602B2391B1B4DD4C183DAF59C5FC0B7B71F2E8A7BBBCB498A64EDBEC39CFCB3362EED3AD1DBCF0585C982DD2FFB5C2CFBA30E1373F62FAC9BFAD073807EDBE96CFD6C15FBAF001C60F94799289D7A313FDFF391CDC9B0F94C5EB08BB4AA4D505F3B881268DE7B0E6F56D72F73970B87B7B1FB97839CA5311D3AFAE579B59ECDD9D85D6CDF9B48C6CD2769EAD79D81C53C969DDBF71397519DA68D330D6F498C6A8AACE3316C8F39CCC90C8CCE81FE6313AF3DB32F137F781BFB2EDD7F2D1AEAFDA68D8963B95F4ED671627E8A64CFD9BFA861E74EF75EFEC578956A47C70E10B9378EA8DD590C1C782FED236B6F0C47694BC736D14446E7AD949344FEB49FD8A44CB073C7AF6737DA3731AE514B5D5F4669049D3BA0D9BB85D89BCFF1E67B7D686E657CAE6EE6BEEE8EAC21687B3A00A91133F9F0A8365DAC81E90ABD971652C306AF6E2FF152AE73607CBE6F62DDB42D1DBBF8E192FD33733E5ECCD6B4AA34CBBE468C02D05DDBCD7DFAD03CEF7EB2CF121B1DCDC198F3643DD5982E2FF6C7CF595F03BAF4A24367A0AD17D513B475FD78AE7BA9907ABAF81BC7A20F93D5B03B76577612197F9DA7F29C879CAC14E2A2F670BC862F9D34FB088BBD458B37C7F08A9395AE1E76107DE0341998AA079DDB27895CBB9FD8A45BD875684F573FA36BBFB8F56B74AF74E96445EC36DD73ADFDCB0CF56F44BAF133FDE557E95FCC149AD66F4E21FF27BF15EEAF4FC11D08FF21EFB1DD5F77DAE296E4DE03FEBBC0E16D91FC129349F5FCB6BF3DD6709FDDDB7E3ECFC5EE03A9B97B0641DB2E50B5593657631480237DE60DA17561CF29C333C989FE4E9775E978BA7A6E09C77EFE999DF199DCAC6143FBBE6FF29273519FA079ABD9099F579C8C0F928BBF1D23FAD09F34EED580BFF6C41273F6D6FDE52B417D675F8EE7F0D6FD5C6AFE2A4EE77FE4A7F3B5E9F9CEDB78DBA0BD0F77EE24323E939B79EE437D5A61EA5D2F3C6AC6B12BF23CE8EE77C37E73D5DB797ED87281DA3D87F14E479B429F2539170EF3734424711937A1860DAD7B0DA44F4B6B43BDE4B7AE21752ECB9E8086D7B5DF7D378D9729E8FBDF2657BA650D3B4F7ABDD61BF7FB33FE4A95B45097312BEBFA70EA2716CFF81FFD3A77C263400829009CE0EB813D19F8FE2A8E546F8E4BF54416FD6F28BDDEF99C55DFFDC84FA78AF9BA5E618DB5D953BDDC78AE85028863D99CCD5C284ABA438BC7B9B1630F91E79EA0673F6D309DB8E42DBABEB7919B2D07F26A7B0DD1F3DFA5CFA0E5FC0A289ABAD0A4E61DC01EBFE16F3362F8DBF47BC10638CBC6912FD37F6E2CB57D7BE3FCF77E423E9BCC94D527EEED4B154D485832D4AECD3F47D713F4FE50062D39914FC17253854FA0479F0F597DC989570777A2FAC1790CEC3C8465C772001BDAF4EB8D973560EDCEABC3DF664477E702B7F7B48723CFDC325A7EF8DBF4305EE544388B7FB9CC934FD5206DDB0A260D7F8B8FC2F5CDAD99848F7F99FE73E3B17971202F35BDC09AF787D263E27613290E79E590B8EA1D7AF4F990AFCE3C4997BEAFD0A66EF5FB9759F2165DDF98C7C11A9D18DCD7894BABDFA74FCF49846702641139EF6D06E67AED798235EF0EE2ADF74DA4ABA8A209D97601B8C5EFBB563169F86BBCB62CFF7AD7A60D7D40E84D3706F76D83E6972F08ECFB1605AC721F7BEF8E34010EED88306AE9CA62F7BE2354EBEA47FBBC4D07977630FD836012736C6962F72F47D7CC67E480F1AC31AC6CB9EB2B2B720183078D67C6CAF5CC9FB190F55B76B07DDD52BE8FD15D77033EE7A84D7706FB37266DED6406BE3889ED598073575EF57C1280269DDF66C4F0576863AABB454E228B07F562F4F7376939B837ED3507999BEB1C64716081F69EFBCBA93B7EB5D3F861C90C0217ED026B0F9E7BE616F0245EAF68AFD311DD6D48FC69291FBEF10A1D062EBD97929619C1B8175FE3BD6F5534EF3B10BF1A4798F15A4FFA2F4B2407C83A16C627A3C63369C96ABE5EBC8553D4E6A97F4EF1C392C90CECFB79E12D4E67A359FCFE7B8CFB6C0D4BBFFA96C49B3578FCFA09D67E665427597B993764282367ADE1BBA04F99BF7E2B3FEFD8C867DFC71AEA61D0AC23D4E83C90579D335835E635BA4F8C40956B479789FC662769C0CDDF23593EF9DEF3C7A402EBD7E85E59B390E94BA238FBE72D7E8FDB41C8C7C3E9D279048B23CF93C5754E476D64C1F061CC8E2C569E58315D26F21B7DDD27F0DD67931938F8DE3934C7BD777CD36A8EFE09E43D3786EDBFC38C8335F01BDC1BE7DF43F95FDF00266A1F2CA69F8B4E75F06C6ECB2DC0DAB3B7F61A1CDE15E7429F5346CFA4AF83F8647D221937F5F53C18BF5767F27D7C26376F5EE2E8D6354C7EF35D56A53E4095661D63F392290CEEE5477FDDFD7E367A19E3464E2668E52ABE5A124BE6934FF278DA7E4266BD4B9FB11B0DCFE907AEEF136B19DD7F14E3966C64C59C397CB52982ED9BBF66E58E74DD7DF8069F1EAD8FFFE01E344D5BCFB8D75E66E2B62CC83AC6C61963193979055F7DBD8C5DE956547FE4123B56CC30DA6F9E7A0B8EE0C71D112C59B993F4C29E252796F35ADF7709BDDE9AC17D9DF8F797F5AC89D5F5572970DDB3442FF988E1EF2F26E4EBAFEF7DF7ED5BC38CE1AF3176A3B6C6F2FBFED7A65BFEC0DF6D07F2AAF3BF44AF598F7EB7654A234AC171CDA297BD342EAE5E1A979797684E68341A8D46A5D9322E50B3E8B84673EBDA014D509ECF6F6DF940E3EEEAA571711DAB09BBA5D1686E6DD28C76F5D2B8B8BEAA5974DCDC65290155B866826F5B8D8BAB97C6DD778466D1DE74CDAD5CBB5BA20970F5D2B88C0BD7688FB9B3C6DDF723CD1655EECF03BFBF665825766E0F8D8BAB8F66CA1EE3F27EA0D962B4D9D46FDED2B8BBBEA49913ABDBDBAD74CDA19838CD65B546A3D1846BC6E63DBE94104D7F572F8DCBE0559AB4C28EE9DA0F9A119E5E1A9781219AD43CEBBB8FF841A32DA9AE5C45AE431365BAAF7E7487B26BAAE605572FCD0B5323B5FFDEF281C6DDB587664EACA1809AEF877B695C5CDFD27C53D8C1A4ACD20CCA7B2C79F779E4334D57572FCD0B93771ACE9DBE0C5D830EE75FFEFBCA5E40BD7B7EA0D972CBD432BA7A1CFEBDC67005C4CED7F81A1D7F81B67CA0BB2752352B06E6A9936BDF6B025D7D349376DDD26C1957F0BDA3BDE6BC346375179945AF2F8D2677796E5DD35CB8704D73EB56B866ACA797C677AEE1446BAE7D3F4AE3E2EAA519A43BA8138B5FCD554E537FD3FE7B94E6DE2D15AB99D3D94BE3D276BA668F46A3B9B567BAA6BD6B5B4DE0F7FA9B50ADF92D26469372EDD6FD65D32F7176A5E6CD5CC77C4DF3C388B61A17D7C19A1529FAA574E7C073B4E6876B268ED37819D7819AAF4E165E4FF71FEF2DCDAEC93E1A17572F4DC062DD46B77C60F4EF5B9A6B172E68AEDDD2680E07BDA471D19DFFDCEBBEA4997FA4B0F2B5D58CDD62BA3E0AABDFA25E1F79EFF307A2BF074D3C87F23F36FD3D52B27BAFF073735833BF9B97C6A5ED54CDBD53B05333A9AD97C6A5DB671AED93259FE762AE73AA5394E754119EA71A8D4693FAF5E05CF755C1F29651AD39131298A77C26BEA7F4C7EAF991669BF13266A96FB5E6F2F94C8D5A734BB3655C5B8D4BE7F99A7B5F0FDF6B028DAF351375A93F7EF771E1DABACC536FEACCF39ACBEAC2AFF5A4AF06E6BEC6544735FB12AF1995B780FBA48073E53E615BFEF5AA39A9F9AA6FEE6B26E3689426E15E085166A485BAB45D0AE3BD2E2FE2E7DD9F297BAF03A673F9522E5EE0360055A96A055855D5E5E7A493965E8AE52D8C4D2F82C25730EDC5863C7A2D819071AFD17DA2A9D6EABB242E799F99092D99163A97005DCBDAA9030739C7B3D8D7BFC1C9D86D846DDACCD1F45B4036E917D3F3D9693A31FB4F725BE14EAB76BA6677AB86BCD0DE937AF9BDC173A88B0D80FA9FC23B921D3EC6D1DB50D7B539CD0CEBBBD3BA21DC3E7888FD966C5002ACEAD5A51E909DFD0F007B0F1CE436CD78D6368DF8C8CD846DDAC1C93F00D2493B5BF0B6D26363387E1B9EF7F3BB772C799C8A4F4005B470F134BCC6B3F27E1E4F40157398C4921C8C831F5DDD80DB4924C59BF83CE910D1E7A161231B6E24C5B275D366C2E22FF02F909D7E314F5E65419AE1B3B8CCCA0000160149444154E3E3049C246A9F76ADACDDB11C52B4A79377E1AF6694358D2F1C0B5F5F795959D3A08135569187F8E53638DAD992161F49D8A6CD6C3F791580B3E9E78AB8B124627F4987868DA87FE324B1DB3613B62981F49B40F6452EA643CC2FBF701D475E30346F2B7069DF1E87025E61299A3C4DED5C7F39427CFC1D78DA056707FDDF9AE1D9EA59B87D8498E8FC6E9266D4AB0F7097BB778B7848B958D1D5A7230AE05CD229136F68ACB06ED0006BAB24128E5E069AD3C2C37055E3EDE1065CE69783F95DD5CDE8EAE702DCE1D7D3262FD842EBD72413D747DEFBDCF2F4759F4DF6DF98F1DED3CB736E928E71241368D19C7BA7A0131E1E40E6410E1E2BDED61FF43965AA9E9BD5D5F62251FFF3203D3615347DFA89C217B3AA4FFDBAC0EDBBDC0133D7B7827AF6F551B097033177C0C916DBB47822376D266CFB69AE009CBB407E5F0FCDBAF8F03C70FBD7644C5DE58AFAF6D453147EADD7AB634D35D2F971F95A4E6603365EF8B4B4E641EF13FDB9BA5DE0C3A13E75EA3C06E7B710BCF624D980AD57A7324FF700C9A12E7D4F783060443BACFF3AC69A90947C17736DFE1C0AD2C9E65FFECD02F807EDE3C089E6F725329631850BAF7EFA233D5E0F63E6C485ECD8358F779EAA47C447EDEEE5069EF89AF7F7FE89CDE0B174377A4D7DE6EC594041DCA6955CD7072BB5DBD0B3073C9D6FCFB953249F069EA9435D0B1CCEAFE7CF719BBC415615AA5401C82023194A385444319CE0EC993B401A912B567252FF67C72EF4748426CA025605CEA6A70350C7BA51BECB68CF01D47CDCE889A4FF0177E112BF03EE0F5476804658D701B8C6D56BA60A788E544011FF13CBEF5D0074ECD105EA14EFEC36F3EE88F3D2648E47467266A81F313BE250749A85B715ECCC6FA5ECCBA45DBD49D63FC6C35A5AF6FACA8FFEBA3BB77725CB93F47F6D46CF1ECDA07151733DCF7126155024F2E38AEBE82F8F273B74A12775A84B12A9A7B3016B0AB8240A77E23CA9B701E5E3185F8255B53709BF5BF22679BA8E3640FA238B0CC0F4F7A8AE1E789C5C977515ED57DE858B97C8EFAA6E64AD5DE1CA1553095585D5EF43C48CF79E81F1B9397B01ED29A869748EACA85A15E0772E5E04F2EB6B6382659F53A5C012F5ADBF0FCF46B37CC569C39F1D7B74C191C6E4FBF5D0C89A3A0057AF62EAB1AC55F8B56E1DF016FFDB799A85079730B07304FE13A6F3715F171416BD4FAC0978E76DB69F0A26F6B3A1F86CEAC6C4391FF2EA83E6C39B9104D4A54D694F9B57FAE04A1F5E6A1F47D2D3F92CE7379C8FBA1D66E6AE38968D7A9F439CE010B5F0786F2C6F38E4B34E195338F72568E51DAEF75AC8A19FF710F3513BFCF41FBAF9F3EAEFEB095EFB19CB3AAF655C4BE3D6B03A740A9CC3BB26BF7F4D2597DDE5CE6D7397BEA814288AD038617E8EF49937878062AEF54F7676C976ABA849CD926D41A70E4F173028403DEFA1CC1F53C200CCC11B5FE7AF494AFA85A803558839A1C06F4837931DBE54BB6733FA931D5CA8D19476DD3AE29C79D3E8D3B2BCBEE0B9DE73985FDC139D57DD768C98371AD7FB3E38C1E2076A192E1E65CD52B849EA593FF088480A45E15775DDBA053479E55BBF0F1FB3DC7BF76DD41A3B2E14B08082229C82A233DB73CAF22C52DFCFBDC4FC79BD8ABFDED34F53E8582D055EEBEE0C5DB5858E7BBE65DEBCF56C9D359C4B37BE65EDD022AC5B8C3CFDBCAC5ABEC5B7DB3AB067F5E77CBA661733DFCC40BD6E1543CB383692948F3264E5E455C06B0A1B02A6CDE44D67273AFAB7A363E03CB6EDDBC6B743DDCBF7A40A36CFE1F20C90AD6F51D76BC0B0C9FD68423AAB662E2751F746F8D906CF02E99C3C5578F7BA7B9EA14143E0FC39CE5820FDC2B57113AA01EA7F8C83D16B5CBD02281AD0A091F9F7993F27EC9E054822E940F1D7D6D62F5CCC48CA7799664D9B02F0CFBF46E7203D4BDB72D1A4214D8BBF5B23899C3F0B608FBD93898F1B3C4343F27B7D5F5CFAD7F5C96C9AF513C7151DF1F633B5DC09C2822338F3CFF37CB0F13B164F1C469BA6C6AD1B96BDBEF2E368A70D0F7F3DFD0027DA405FF6D32499AC50FDF5749EF3C57CE59E8B5B631CAA01EA7F738D1873E5EA354041230BDE2439E7CE710EA8DBA8413EADD3004D68E60018DEF069A56769FFD1B451937CD74C4CD30E81D4A4A1A90BB6B0FA7D8898F5DED3CA756E9A36417B0AFE31DA7E3A59D7001A615FCC078B659F53A5C002F58D932DCF02FC9A4CB19E1AC7D23803D0F4594C5DE55A45BDD61534ED329A95A1EFD3497187E33BF672AA34EE134553BA8C0966DDA476286E9F645B64FEDF71A54502EA722CEAF3C97C9D749D7F7380BF2F7274FF36C2366D23F65C369043E2B22178B9B5C26BE0BD00F5C13CE8B62218E73D814DC609D399A7387909AA79B8DEF7C2D7AAE508260CAC0FE7D73169E1017200F7B66DB1051236AF2F64BFC65F8CEEB4ED501F38CAF75F2762F698C7AF13DD147065FF61C34804390712389A0DB5BB76D2B5BAFFC77FF94D7E59903C0148E1ACE8D4BE35D5B8C68E4D794727289CBB5B4B6A03A911DB38904F453DE7E78B3390F0CB5EC3835E75289E533C86879F8F6E26C09A2814C0952BC59ABC26E740243B2F80A27337BA9A8A7E5ABE40471B20E167D61D2BF9996CE4DB81E70155E665149D3B60329E26834B9700EEE4D3126DE1EB2B1F56DE6D685F0DAEECD8A21BB5E041E8CB7E9CB0EF4D955D7F3DFDCEE6B5055D4FD914FC72A3337E5D157035960347757FCA39C0D1A3D950DB175FD3156F06996CDE7D146844408F76052CE74C97AE4EC0717ED97B6FB49C434753A0DAF374F16D647AB59C03ECDCF93B28BC79D1E4055B58FD96C0D908823EFA98A0F0423A46988B99EFBDFBCE8D7367BA39FF7F7B771F9873BDFF71FCD9612EA7665397C338BF6C974CB3ECCE2C992D1C8AEEE8A095DC9D7412E5A03A7253915147A9240E49E8A048EC272937CDCFCD30EC7E4D66BB6646EC8689B94E763969E78F6BE3DA5CDBE4625B7EAFC77FFB5EDFEB7B7DEEBFEF7DAFCFF5F90009BBB95405B1EC39000D82BB51AE0A2A1917ED1F6A5CD93855875DF3F2060C5D080F7581139B597DC58386955D9BB690832B3D1EB8BF8A7F4AAB6FEB7B3F997E292FCDBD6865048CEE34BBE6FDC4FEFEBF974FA67E76315E6861F2C208186FF570FA539CA5291F35C09A93496641E91F0559ECCFB2E06FBFDEAD651F19D9975ECFCC05FFE660FC43531A60267ACE0CA2CB5DD18D47DF9D87694FBA6D9316732269B9D0DEABFAB458B20E3848CB4992AFE25A009CDECEEB1183887F6600C17C4FD48A0D1C740BE6F9BF45E085959CCC2CF201B2CDC4597AD3F985313CBA61226B574C61429B45CCE83B8A7F3C9BC2B30B9632F4DEB5B40DEA88C99047C6091F9E9F338E1EC600FC02DDE0501CEF3DFD3CC93EF571ED308ED7868D6758E244167F3C82B0F57E740A6ACC8F1927B8EBB9598C7237935D9ABF833956FC3D0D58E22E3F5629434F464D8925F99528263C03C33A9EE3AB65EB38E53B8C0513BA0260CDF98ED41C807DECD86FC1BFDAF95BFE0405BB109DF025AF0ECCE7EE26BFD06AC00C7AFD605F3E10E25AB1CC2024621293E39F2272D3741E095D846F483B5A588F9251FF3EA6CE1D5CF5D7CEDD9EE6EF3D7712B96935A3BB25117CEF6D14251CE42840C27AE6EDEACC739D07F3F2987D8C993D97A7269DE5B1E669AC589A8C5BCFF1BC39C4ABF44261F4EAF347BEF9742313BB65B2DAE1754A4F2D4864FDB228F6E66EE1AB35719CF27D9C77C6F5C60858BF3F4E2E40C1317EB080BF6B47C6FC6318092316B3F02FF7F1858F1FA1A6861C2FADCB090EB612BFC44A62760E7092CCAC5C08680E5EBD79B0D37C92639BF048CFEEA5A72572281BBBF3BA73FFC31FB0252A99D9838612DFCE4041E62900E23F9B4574D80BF4B89EEDCB3E3D993958034AD7743546F0DAAB490C9CBE85577B7765BE6F3001CD8BC9C9A8CF83536633C427878399B6198FD999BB29B48662C4FED83E2CDC4DC7D1AF3332712CF33F1E41D8EA360475F2A461AE9902DFE1FC737C778C116318BF73146F6D99CE23A12B08BEB7151C3153BFD724E60D0920203090065B925933792879214D28313DC63BE115EBCDC0FDA3C6F36872249F4F1C097FE9C0B9F52B58FDA30F233F1C4737B01BD7ECF2E9E85855EDB7D4F7DB17B1BAE81C711BD7139DD188AE13227936C0BE0D407E662639D6808B6BFE7A0F19CB0BB12F33EBDD114C2CEA43F39435FC2BA1110FBC3A958BCD1A5B5AE2362C67755C1E9BD7AF23F6471F06CF7C913EB606CBF13CDB393F1CB340806BB5E5EB9A945D65FB281BDF8F6795F5F36C12ADD070F34A966D3043D6ED3CDCA735BED5968ADD5851B1DD5D51D93BD3F7AEA46EBC193A6E24BBC7CE67E6D3AF71A65F335256AE20C1AD3B93DF185C1A003B1A1767F16C803FC10DB693B0661A4FE606D3A4C493273F185AED3875A94C1D8DA7B6726E6FB06F33591C2780165595F26563969503C76D4B85E61F3D8685005C2EDEE373C8B07DB0DD7DBFEC9833E59D4B66857E6EBBE31889983C9EF8416FB161727F3A2DF021C4DF8362BBFE5C263F6E13CBD6C493FBED46BE883D8DEFA0698CEB63ACA4DC6CEFA9AEADE7A5AE63C6FC14D29EB1F5AFE5F93E8C9CDAD716E056F9DE302C15EF738EEE7DAE8EEEFF419C8A9AC73F930E30BC5F335256AE22DF7718917D6BFF57893795949494D476226E74E69828920BEC8FFC81C07EE117BFA22A4CDAC8D6433F5D7CD5B555273CB3E7F1CA3B71341B309CEE76BDFDE8B773591C6BA1CDB34BF8ECF1FF10B3ED10F8DC6FB79942550A49DCB89D43F673316E31D1AD5710AE85C9BFF25A60DB78E13845055924E414016E78B56F878FC9A3B4B39BD9B92695B29D695D5B75A15790D12EBF97CAC1B6F87C0679C5063C7C8209BCCBE3D20619D6425262B69379C680476017BBCD372CE4C7EF2126A78886CDDA1012D88E66AE15F2D8D49FFEE1B73A3876055F105AF288DFB39BC367DCF00A09C2AFA5B1F4E65FB11CCBD767E5D733B3737B2A79C56E78770D27C078D441F9FCE8B0CC2E6E72117784D3544C4F752EBD17CF50EE31E51277C0853BDA7AD3D26E65076BE141E2F6EC278FA6F80407D2CEA3623BB06D48129B7686C63EC1047A54BC8E999DD1A7F10E3271E6C01E52F3C1A3DD3D84DC5949B9D9D783258FB4E404D2F3AD7675594DB60A93D8B82D1BDB33AC4B75606B5FB754F8BBAC7F959D67DB20626B96D59646AF13EC5E9F854B0DB4AFF2E9B999565D7B959BFA65DBF0209EC367A0B1670782FC5ADAD69037C7B03AE5C4C5F33C02FA1286FD31FB6B956EAA925E40714347F55956970514BBB7E4EE203FBBB660DBD02639DF4AE33BBA101E08FB2BCDDFA5322A97D64ACAFD56877551B9D439110CFCF830E17F9F47DF9B8F70DABD25E1F7D8ADB652AE0DD8F797CBF3898376658E89E6B47710A633074ACFB98B4E2177569987D665F97658BE57DA3EB8BC9F7BE712BD29E3CAC7E00A792F1BCB8D95A4BBD2B2BF9ABE0714266DE3C0CD7EB475CF26699783BA29632D2423AE743CA838B6838371D156F896AC9D6C4B2EA0D8BD15DDC2032FD649E5E394A3FB8D83F1B4E59172E5E611D097B04A1BA183FAF43D7BD9FB3D72EDEEF1A5F5F063CCE5C78C575BDE8EFABE7D9A4B3796D997530415FBF397E3F09BBC1DCF01914CF0FB893C9AE27F4F88DDAA3EE5CBEDF2F1ABF2B1C492974D7A5A1287CF50495E2A7BEF15D65590D1C1FD1FF2B3D3F92EF108A771102FD42205D475D237BC1CF23A1BCE07326EE3470C295B15C39AC317E39E2232D683911F7FC67335B6D2848848CD2B0BA87B44EE6396B33FD414F9FFA834A0BEE3AF0B597BAD7F0C29E568CA479DD491AEF7DDC696AF9399F9680F96BAD9FE93B4169DE027D7609E7977B2826911B9C159F8E1A8ED6BEEDC23A958F0AF134FA1447E3BECA7A71CA1D01A701D764C96327A425D8759F2E2D9B3EB08B6ED5F7EEDD7FC2222BF61D57DCD2D2255AB764A945C4B0AA845444444449CA065F344444444449CA0805A44444444C4090AA845444444449CA0805A44444444C4090AA86BCD19F62E9DCEF0C77BD1E9B1B9A4D6767244444444E4AA28A0AE35EE747CDC1743FA292C3FD7765A44444444E46A29A0AE21961D6FD23320820F52EC0E1AEA6B671D11111191DF38C573352065F1485E5A90403E2EAC78F121D6FD0E081B4DF494D2132EE4B265D220C66CCBE6E47F5C68D22A9CB16F4CA34FD92606B9DBF9E8ED85AC483DC9CF96B3FC6C6CCF800993187D6FF34A3E11CC318B88FA742B5F25DDCCFD830CEC58BE9753AE3D99B66A1A81FBE712F9CE5A12728A286EE846DBD0614C98F124ED0D8524FEEF0A3E5FFB2D3B8ADA11D13687A82D199C2E76C1D5FB01268EF52176CE8744A717514C433C3A3DC55BB39FA2BD01CC9BE7B23C6A0FDB531B10D8F3260E6C4AE758695E464D7D957E3EDA8E464444446E4C7A425D030286CDE76F9D01FEC880F7BE26FADBAF899ED2F3D2093FFD9EB62366B371EB3A160C6C4151FA26223FFAC6F69A35910F464F62C98547F9E49B8DC4EC984384612F0B5F7A935585957FE6ED2DDD39FA5D06A78B8BF97DD0E30CEFDE865B9BDC86BBAB994367037971C9D7C4EDFA8C491D7FE1C0FFBDCF875185809136FF739E83C9B958CE16D3BCEF3496AE5CCC7B033C399FB98E57E615D06FC64256AD9DC7B8D006E4C5CE67D6A7870168DDC58F7AE60C4EFEBB3EBE4FBCCD979BD7B064B41F3FA76FE2F5B1B3D965BD4E852B22222252CB1450D7058D1AD3A2A51183C148E8C8FE8402E7330F910A58B7AF654586811EBDFBE369000CEDE9FE272F38BF97D89D955FD2E0E98D77538066788785F1D89BCB89FEFC053A1B5A13F650186D8C06706DCD80EEC100149CFC0100D790D698001A99F0ED60C2646AC77D2FD8D2C4B95F68603261327560C8F047F00492D34A7F4E69688C7B2300779ADE69C4E0EA4187C1A3197C1790BB918D31D7BED844444444EA024DF9A86B2ACCAB8E4F8CC702EC5FFB0AA397A5F3FDF162AC452700C83E920204D4789A00F85DBD2B683CDE74B8FB76D87F94EF33F6438FBBAE4BF2444444446A9302EA3AEE64C149E07642FAFD9527BCCABF56CFADC5555CD14A61720C5BBF4B276D7F2EE7F20E5E835456AE7EBD7A005CB8A0A54C444444E4C6A480BA8E73A9EF029CA3A4810993C9F9EB652E1EC913B3D368D2FD65DE183B00BFA4197C9394E7FC852B71F6DF16004C2D6BE049BA888888482DD01CEA3ACED7E74EE024FB1253AA3DB77A8789D996C679BC7868687F3AB434727DD7DEC8647FEA49A01D7E8AA7454444E406A580BA86DCE2EA0A1C232D35072B560A0B2D57F43EAF3EFD79A031642D7D8B29EBE3C9B700D64232766E23B18A553E1C6B84EB2D2EC031B66FDD87050BE6136700F8F9C2855F7BB16A58C989FA8865FBA1719F810CF402F6BDCF43217713FCC8FBECBDC69F26222222525B1450D790F03F47E07F0BC4BEF318613D9F6351C211A2A72E6107C0A1B5BCB7340528BCFC98F141A62D98C0C3AD4EB179EA73F4E8DC994E0F8E61495E13DA182BFF3CF3AA8FF9E210C06E16BCBC0E330046FA8C798987BD5D38BC6414DDBA8C6051496B021B40FE860F59185FC8AE992BAB4CD3FC5566C0CCAA0FD7920510B392B777D947F67B99D3BB1FDD42FF44FFD9B9048F9AC9E791DDAFF3937011111191DA7353494949496D27426E04297CF0E7675878A80BD35366D2A7B693232222225243F4845A44444444C4090AA8E59A307FB99CAF0F0124F0AFC965534C444444446E7C9AF22122222222E2043DA116111111117182026A11111111112728A016111111117182026A11111111112728A016111111117182026A11111111112728A016111111117182026A11111111112728A016111111117182026A111111111127FC17B7F6339FC4DD2A440000000049454E44AE426082>|png>|1par|||>

  <with|color|red|Slip line is this line below the primary triple point, I
  don't know why it is called that.>

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
    <associate|auto-17|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-18|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-19|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-20|<tuple|<with|mode|<quote|math>|\<bullet\>>|5>>
    <associate|auto-21|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-22|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-23|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-24|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-25|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-26|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-27|<tuple|<with|mode|<quote|math>|\<bullet\>>|6>>
    <associate|auto-28|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-29|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-3|<tuple|1|1>>
    <associate|auto-30|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-31|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-32|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-33|<tuple|<with|mode|<quote|math>|\<bullet\>>|7>>
    <associate|auto-34|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-35|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-36|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-37|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-38|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-39|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-4|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-40|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-41|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-42|<tuple|<with|mode|<quote|math>|\<bullet\>>|8>>
    <associate|auto-43|<tuple|<with|mode|<quote|math>|\<bullet\>>|9>>
    <associate|auto-44|<tuple|2|9>>
    <associate|auto-45|<tuple|2|9>>
    <associate|auto-46|<tuple|1|9>>
    <associate|auto-47|<tuple|1|9>>
    <associate|auto-48|<tuple|1|9>>
    <associate|auto-49|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-5|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-50|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-51|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-52|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-53|<tuple|<with|mode|<quote|math>|\<bullet\>>|10>>
    <associate|auto-54|<tuple|3|10>>
    <associate|auto-55|<tuple|3|11>>
    <associate|auto-56|<tuple|3|11>>
    <associate|auto-57|<tuple|3|11>>
    <associate|auto-58|<tuple|3|11>>
    <associate|auto-59|<tuple|3|11>>
    <associate|auto-6|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-60|<tuple|3|11>>
    <associate|auto-7|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-8|<tuple|<with|mode|<quote|math>|\<bullet\>>|2>>
    <associate|auto-9|<tuple|<with|mode|<quote|math>|\<bullet\>>|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      Title <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>

      Outline <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      1.<space|2spc>Finite volume Method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      Flux Reconstruction : grid <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      Flux reconstruction : ODE <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      Flux reconstruction : Continuous flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      Lax-Wendroff Flux Reconstruction (LWFR) with D2 dissipation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>

      Numerical flux: D2 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      Numerical flux: central part <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      Performance (1) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>

      Performance (2) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>

      Subcell based limiters <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>

      Blending limiter (Hennemann Et Al.)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>

      Choice of <with|mode|<quote|math>|\<alpha\><rsub|e>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>

      Lower order update <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>

      Interface numerical flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>

      Extension of Zhang-Shu's limiter to Lax-Wendroff schemes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>

      Low order residual : MUSCL-Hancock <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>

      Admissibility of low order method <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>

      Generalizing Berthon's proof <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>

      Idea of proof <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>

      Enforcing slope restriction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>

      Unstructured, curvilinear grids <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>

      Transformation of conservation law <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>

      Flux Reconstruction for the transformed PDE
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>

      Lax-Wendroff flux reconstruction for transformed PDE
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26>

      Free stream preservation of Lax-Wendroff
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>

      Metric identities in practise <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-28>

      Composite signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29>

      1-D Euler's equations <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-30>

      Shu-Osher <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-31>

      Blast wave <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-32>

      Sedov's blast wave <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-33>

      Double rarefaction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-34>

      Leblanc's test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-35>

      2-D Results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-36>

      2-D composite signal <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-37>

      Double Mach reflection <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-38>

      Kelvin-Helmholtz stability <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-39>

      2-D Sedov blast <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-40>

      Astrophysical jet <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-41>

      Astrophysical jet Mach 80 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-42>

      Astrophysical jet Mach 2000 <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-43>

      Implementation in Julia <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-44>

      Type instabilities <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-45>

      Cache blocking (picture) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-46>

      Cache Blocking (code) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-47>

      Conclusions <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-48>

      2.<space|2spc>Removed stuff <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-49>

      Choosing <with|mode|<quote|math>|\<beta\><rsub|1>,\<beta\><rsub|2>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-50>

      <with|par-left|<quote|1tab>|1.<space|2spc>Admissibility proof
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-51>>

      Step 1 : evolution to <with|mode|<quote|math>|n+1/2>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-52>

      Step 1 : Evolution to <with|mode|<quote|math>|n+1/2> (2)
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-53>

      Step 2 : FVM type update <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-54>

      Step 2 : FVM type update <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-55>

      Final admissibility condition <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-56>

      Final admissibility condition (2) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-57>

      Final admissibility condition (3) <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-58>

      3.<space|2spc>ADER-FR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-59>

      ADER correction step <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-60>
    </associate>
  </collection>
</auxiliary>