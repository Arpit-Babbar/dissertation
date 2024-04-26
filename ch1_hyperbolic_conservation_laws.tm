<TeXmacs|2.1>

<project|main.tm>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <chapter|Equations of motion><label|ch:con.law>

  In this chapter, we give a brief overview of the PDEs of interest along
  with the needed notations and definitions.

  <section|Hyperbolic conservation laws>

  Consider

  <\equation>
    <value|uu>=<value|uu><around*|(|<bx>,t|)>:\<Omega\>\<times\>\<bbb-R\><rsub|+>\<longrightarrow\><Uad>\<subset\>\<bbb-R\><rsup|m><label|eq:intro.u>
  </equation>

  to be a vector of conserved quantities satisfying a system of equations of
  the form

  <\equation>
    \<partial\><rsub|t>*<value|uu>+<value|Div><value|pf><around*|(|<value|uu>|)>=\<partial\><rsub|t>*<value|uu>+<big|sum><rsub|i=1><rsup|d>\<partial\><rsub|x<rsub|i>>*<value|pf><rsub|i><around*|(|<value|uu>|)>=<value|bzero><label|eq:intro.con.law>
  </equation>

  The set <math|\<Omega\>\<subset\>\<bbb-R\><rsup|d>> is the domain and
  <math|<Uad>\<subset\>\<bbb-R\><rsup|m>><nbsp><eqref|eq:intro.u> is a convex
  open set containing the set of <with|font-shape|italic|physically
  admissible solutions> of<nbsp><eqref|eq:intro.con.law>. The
  <math|<pf><around|(|<uu>|)>=<around|(|<pf><rsub|1>,\<ldots\>,<pf><rsub|d>|)>\<in\>\<bbb-R\><rsup|p\<times\>d>>
  are called the fluxes with <math|<value|pf><rsub|i>> being the flux in the
  <math|i<rsup|th>> direction. The equations<nbsp><eqref|eq:intro.con.law>
  are called a <with|font-shape|italic|system of conservation laws>. By
  fundamental theorem of calculus, <math|<value|uu>> is a classical
  <math|C<rsup|1>> solution to<nbsp><eqref|eq:intro.u> if and only if for any
  open set <math|\<Omega\><rprime|'>\<subset\>\<Omega\>>

  <\equation>
    <dv||t>*<big|int><rsub|\<Omega\><rprime|'>><value|uu><around*|(|<bx>,t|)>*<value|ud><bx>=-<big|int><rsub|\<partial\>\<Omega\><rprime|'>><value|pf>\<cdot\><value|bn>*<value|ud>S=-<big|int><rsub|\<partial\>\<Omega\><rprime|'>><value|pf><rsub|i>*n<rsub|i>*<value|ud>S<label|eq:integral.con.law>
  </equation>

  where <math|<value|bn>=<around*|(|n<rsub|i>|)><rsub|i=1><rsup|d>> is the
  outward unit normal across <math|\<partial\>\<Omega\><rprime|'>>. The
  integral equation<nbsp><eqref|eq:integral.con.law> says that rate of change
  of <math|<value|uu>> in any volume <math|\<Omega\><rprime|'>\<subset\>\<Omega\>>
  depends only on the flux through the boundary
  <math|\<partial\>\<Omega\><rprime|'>> which is
  why<nbsp><eqref|eq:intro.con.law> is called a conservation law. This
  integral form of conservation law is how the
  equation<nbsp><eqref|eq:intro.u> is usually derived; e.g., Euler's
  equations<nbsp><eqref|eq:2deuler> are derived from conservation of mass,
  momentum and energy. In this work, we only deal with
  <with|font-shape|italic|hyperbolic> conservation laws which are defined as
  follows.

  <\definition>
    Let <bA><math|<rsub|i><around*|(|<value|uu>|)>\<assign\><value|pf><rsub|i><rprime|'><around*|(|<value|uu>|)>>
    be the flux Jacobians. Then the system<nbsp><eqref|eq:intro.con.law> is
    called hyperbolic if, for any <math|<value|uu>\<in\><Uad>\<subset\>\<bbb-R\><rsup|m>>
    and and any <math|<value|bn>\<in\>\<bbb-R\><rsup|d>>, the matrix

    <\equation*>
      <bA><around*|(|<value|uu>,<value|bn>|)>\<assign\><big|sum><rsub|i=1><rsup|d><bA><rsub|i><around*|(|<value|uu>|)>*n<rsub|i>
    </equation*>

    has <math|m> real eigenvalues <math|\<lambda\><rsub|1><around*|(|<value|uu>|)>\<leq\>\<ldots\>\<leq\>\<lambda\><rsub|m><around*|(|<value|uu>|)>>
    and <math|m> linearly independent eigenvectors
    <math|<around*|{|<br><rsub|j><around*|(|<value|uu>|)>|}><rsub|j=1><rsup|m>>.
    The eigenvalues are also called the wave speeds or characteristic speeds
    associated with<nbsp><eqref|eq:intro.con.law>. If, in addition, these
    eigenvalues are distinct, then the system is said to be \Pstrictly
    hyperbolic\Q.<label|defn:hyperbolic>
  </definition>

  The pair <math|<around*|(|\<lambda\><rsub|i><around*|(|<value|uu>|)>,<br><rsub|i><around*|(|<value|uu>|)>|)>>
  corresponding to <math|<bA><around*|(|<value|uu>,<value|bn>|)>> is called
  the <with|font-shape|italic|<math|\<lambda\><rsub|i>>-characteristic
  field>.

  <\definition>
    For <math|i\<in\><around*|{|1,\<ldots\>,m|}>>, the
    <math|i>-characteristic field of<nbsp><eqref|eq:intro.con.law> is
    genuinely nonlinear when

    <\equation>
      <label|eq:genuinely.nonlinear>\<nabla\>\<lambda\><rsub|i><around*|(|<value|uu>|)>\<cdot\>r<rsub|i><around*|(|<value|uu>|)>\<neq\>0,<space|2em>\<forall\><value|uu>\<in\><Uad>
    </equation>

    and linearly degenerate when

    <\equation>
      <label|eq:linearly.degenerate>\<nabla\>\<lambda\><rsub|i><around*|(|<value|uu>|)>\<cdot\>r<rsub|i><around*|(|<value|uu>|)>\<neq\>0,<space|2em><value|uu>\<in\><Uad>
    </equation>
  </definition>

  The <with|font-shape|italic|Cauchy problem> for the above system also
  requires the prescription of initial conditions

  <\equation>
    <value|uu><around*|(|<bx>,0|)>=<value|uu><rsub|0><around*|(|<bx>|)>,<space|2em><bx>\<in\>\<bbb-R\><rsup|d><label|eq:cauchy.problem>
  </equation>

  where <math|<value|uu><rsub|0>:\<bbb-R\><rsup|d>\<rightarrow\>\<bbb-R\><rsup|m>>
  and boundary conditions on <math|\<partial\>\<Omega\>> which will are
  weakly enforced through the flux <math|<value|pf>>.

  <subsection|Weak formulation>

  In many practical problems, solutions to hyperbolic conservation laws
  contain non-smooth solutions including shocks and rarefactions. In fact, it
  is well known that the solutions can develop discontinuities in finite
  time, even when the initial condition is smooth<nbsp><cite|LeFloch2002>.
  Thus, the class of solutions to<nbsp><eqref|eq:intro.con.law> must be
  enlarged beyond the classical <math|C<rsup|1>> solutions to include
  discontinuous solutions. For simplicity, we take the physical domain to be
  <math|\<Omega\>=\<bbb-R\><rsup|d>>. Then, we consider solutions in the
  space <math|L<rsup|\<infty\>><around*|(|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>,<Uad>|)>>
  of bounded Lebesgue measure functions <math|<value|uu>:\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>\<rightarrow\><Uad>>
  and define them to be solutions in a weak (distributional) sense as
  follows.

  <\definition>
    A function <math|<value|uu>\<in\>L<rsup|\<infty\>><around*|(|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>,<Uad>|)>>
    is called a weak solution of<nbsp><eqref|eq:intro.con.law> with initial
    condition <math|<value|uu><rsub|0>\<in\>L<rsup|\<infty\>><around*|(|\<bbb-R\><rsup|d>,<Uad>|)>>
    if

    <\equation>
      <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|\<bbb-R\><rsup|d>><around*|(|<value|uu>*\<cdot\>\<partial\><rsub|t>*<with|font-series|bold|\<phi\>>+<big|sum><rsub|i=1><rsup|d><value|pf><rsub|i>\<cdot\>\<partial\><rsub|x<rsub|i>>*<with|font-series|bold|\<phi\>>|)>*<with|font-shape|right|<value|ud>>t*<with|font-shape|right|<value|ud>><bx>+<big|int><rsub|\<bbb-R\><rsup|d>><value|uu><rsub|0><around*|(|<bx>|)>\<cdot\><with|font-series|bold|\<phi\>><around*|(|<bx>,<value|bzero>|)>*<with|font-shape|right|<value|ud>><bx>=0<label|eq:weak.form>
    </equation>

    for all <math|<with|font-series|bold|\<phi\>>\<in\>C<rsup|\<infty\>><rsub|c><around*|(|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>|)>>.
  </definition>

  The weak formulation<nbsp><eqref|eq:weak.form> is obtained by taking the
  inner product of<nbsp><eqref|eq:intro.con.law> with a test function
  <math|<with|font-series|bold|\<phi\>>\<in\>C<rsup|\<infty\>><around*|(|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>|)>>
  and performing integration by parts in space and time. As desired, the weak
  formulation allows for solutions with less regularity and every
  <math|C<rsup|1>> solution of<nbsp><eqref|eq:intro.con.law>
  satisfies<nbsp><eqref|eq:weak.form>. The
  formulation<nbsp><eqref|eq:weak.form> imposes conditions on the
  discontinuity, known as the <with|font-shape|italic|Rankine-Hugoniot>
  conditions. Let <math|\<Gamma\>> be a surface of the discontinuity in
  <math|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>> for the solution
  <math|<value|uu>>, and <math|<wide|<value|bn>|~>=<around*|(|n<rsub|1>,\<ldots\>,n<rsub|d>,n<rsub|t>|)>\<neq\><value|bzero>>
  be the normal vector to <math|\<Gamma\>>. Let us denote by
  <math|<value|uu><rsub|\<pm\>>> the limits of <math|<value|uu>> on either
  side of <math|\<Gamma\>>

  <\equation*>
    <value|uu><rsub|\<pm\>><around*|(|<bx>,t|)>=lim<rsub|\<epsilon\>\<rightarrow\>0<rsup|+>><value|uu><around*|(|<around*|(|<bx>,t|)>\<pm\>\<epsilon\>*<wide|<value|bn>|~>|)>
  </equation*>

  <\theorem>
    <label|thm:rh><with|font-series|bold|(Rankine-Hugoniot (RH) condition).>
    Consider a <math|<value|uu>\<in\>L<rsup|\<infty\>><around*|(|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>,<Uad>|)>>
    that has a surface of discontinuity <math|\<Gamma\>> and is smooth
    everywhere else . Then, <math|<value|uu>> is a solution
    of<nbsp><eqref|eq:weak.form> if and only if it
    satisfies<nbsp><eqref|eq:intro.con.law> in regions of smoothness and

    <\equation>
      <around*|(|<value|uu><rsub|+>-<value|uu><rsub|->|)>*n<rsub|t>+<big|sum><rsub|i=1><rsup|d><around|(|<value|pf><rsub|i><around*|(|<value|uu><rsub|+>|)>-<value|pf><rsub|i><around*|(|<value|uu><rsub|->|)>|)>*n<rsub|i>=<value|bzero><label|eq:rh.cond>
    </equation>

    across the surface of discontinuity <math|\<Gamma\>>.
  </theorem>

  The condition<nbsp><eqref|eq:weak.form> is not enough to get unique
  solutions, and thus additional <with|font-shape|italic|entropy conditions>
  are imposed to get the physically correct solution. In the 1-D case where
  dimension <math|d=1>, the <math|\<Gamma\>> can be parametrized as
  <math|<around*|(|\<xi\><around*|(|t|)>,t|)>>. Thus, the normal in
  <math|<around*|(|t,x|)>> plane is given by
  <math|<wide|<value|bn>|~>=<around*|(|1,-s|)>> with
  <math|s=<value|ud>\<xi\>/<value|ud>t> being the speed of the discontinuity.
  Thus, the RH condition<nbsp><eqref|eq:rh.cond> becomes

  <\equation>
    s*<around*|(|<value|uu><rsub|+>-<value|uu><rsub|->|)>=<value|pf><around*|(|<value|uu><rsub|+>|)>-<value|pf><around*|(|<value|uu><rsub|->|)><label|eq:1d.rh>
  </equation>

  <subsection|Entropy condition>

  To single out solutions of interest, we restrict attention to weak
  solutions realizable as limits <math|<around*|(|\<epsilon\>\<rightarrow\>0|)>>
  of smooth solutions of an augmented system

  <\equation>
    \<partial\><rsub|t> <value|uu>+<value|Div><value|pf><around*|(|<value|uu>|)>=<with|font-series|bold|R><rsup|\<epsilon\>><label|eq:regularized.con.law>
  </equation>

  where <math|\<epsilon\>\<gtr\>0>, represents a small-scale parameter
  corresponding, in the applications, to the viscosity, capillarity, etc. of
  the physical medium under consideration. For simplicity, we take
  <math|<with|font-series|bold|R><rsup|\<epsilon\>>=\<epsilon\>*\<mathLaplace\><value|uu>>
  (cf. <cite|LeFloch2002> for conditions required in the general case). The
  idea is that, in the limit as <math|\<epsilon\>\<rightarrow\>0> the weak
  solution will satisfy an additional principal, which is usually called an
  <with|font-shape|italic|entropy condition>. We introduce the notion for a
  general system of conservation laws as follows.

  Assume that we have a strictly convex function
  <math|\<eta\>=\<eta\><around*|(|<value|uu>|)>> called the
  <with|font-shape|italic|entropy function> and associated
  <with|font-shape|italic|entropy fluxes>
  <math|<bq>=<around*|(|q<rsub|i>|)><rsub|i=1><rsup|d>> satisfying

  <\equation*>
    *\<eta\><rprime|'><around*|(|<value|uu>|)>*<value|pf><rsub|i><rprime|'><around*|(|<value|uu>|)>=q<rsub|i><rprime|'><around*|(|<value|uu>|)>,<space|2em>1\<leq\>i\<leq\>d
  </equation*>

  The set <math|<around*|(|\<eta\>,<bq>|)>> is called an
  <with|font-shape|italic|entropy pair>. We multiply the augmented
  system<nbsp><eqref|eq:regularized.con.law> by
  <math|\<eta\><rprime|'><around*|(|<value|uu>|)>> to get

  <\equation*>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|\<eta\><rprime|'><around*|(|<value|uu>|)>*\<partial\><rsub|t>
    <value|uu>+\<eta\><rprime|'><around*|(|<value|uu>|)>*<big|sum><rsub|i=1><rsup|d><value|pf><rprime|'><rsub|i><around*|(|<value|uu>|)>\<cdot\>\<partial\><rsub|x<rsub|i>>*<value|uu>>|<cell|=>|<cell|\<epsilon\>*\<eta\><rprime|'><around*|(|<value|uu>|)>*\<mathLaplace\>*<value|uu>>>|<row|<cell|>|<cell|=>|<cell|\<epsilon\>*<value|Div>*<around*|[|\<eta\><rprime|'><around*|(|<value|uu>|)>*\<nabla\>*<value|uu>|]>-<wide*|\<epsilon\>*<around*|(|\<nabla\>*<value|uu>|)><rsup|T>*\<eta\><rprime|''><around*|(|<value|uu>|)>*\<nabla\>*<value|uu>|\<wide-underbrace\>><rsub|\<geq\>0>>>>>>
  </equation*>

  where the inequality below underbraces follows of convexity of
  <math|\<eta\>>. Thus, we have the inequality

  <\equation*>
    \<partial\><rsub|t> \<eta\><around*|(|<value|uu>|)>+<value|Div><bq><around*|(|<value|uu>|)>\<leq\>\<epsilon\>*<value|Div>*<around*|[|\<eta\><rprime|'><around*|(|<value|uu>|)>*\<nabla\>*<value|uu>|]>
  </equation*>

  Then, as <math|\<epsilon\>\<rightarrow\>0>, the following entropy
  inequality is obtained

  <\equation>
    \<partial\><rsub|t>*\<eta\><around*|(|<value|uu>|)>+<value|Div><bq><around*|(|<value|uu>|)>\<leq\>0<label|eq:entropy.condition>
  </equation>

  In a weak sense, the inequality is given by

  <\equation>
    <big|int><rsub|0><rsup|\<infty\>><big|int><rsub|\<bbb-R\><rsup|d>><around*|(|\<eta\><around*|(|<value|uu>|)>*\<partial\><rsub|t>*\<phi\>+<big|sum><rsub|i=1><rsup|d>q<rsub|i><around*|(|<value|uu>|)>*\<partial\><rsub|x<rsub|i>>*\<phi\>|)>*<value|ud>t*<value|ud><bx>+<big|int><rsub|\<bbb-R\><rsup|d>>\<eta\><around*|(|<value|uu><rsub|0><around*|(|<bx>|)>|)>*\<phi\><around*|(|<bx>,0|)>*<value|ud><bx>\<geq\>0
  </equation>

  for all <math|\<phi\>\<in\>C<rsub|c><rsup|\<infty\>><around*|(|\<bbb-R\><rsup|d>\<times\>\<bbb-R\><rsub|+>|)>>,
  with <math|\<phi\><around*|(|<bx>,t|)>\<geq\>0>. The solution
  <math|<value|uu>> is called an <with|font-shape|italic|entropy solution> if
  it satisfies the above inequality for every convex entropy.

  <subsection|The Riemann problem><label|sec:riemann.problem>

  A particularly important special case of Cauchy
  problem<nbsp><eqref|eq:cauchy.problem> for 1-D conservation laws

  <\equation*>
    \<partial\><rsub|t>*<value|uu>+\<partial\><rsub|x>*<value|pf><around*|(|<value|uu>|)>=<value|bzero>
  </equation*>

  is the Riemann problem with piecewise constant initial data

  <\equation>
    <value|uu><around*|(|<bx>,0|)>=<value|uu><rsub|0><around*|(|<bx>|)>=<choice|<tformat|<table|<row|<cell|<value|uu><rsub|l>,>|<cell|<space|1em>>|<cell|x\<less\>0>>|<row|<cell|<value|uu><rsub|r>>|<cell|>|<cell|x\<gtr\>0>>>>><label|eq:intro.rp>
  </equation>

  where <math|<value|uu><rsub|l>,<value|uu><rsub|r>> are constant states.
  This is the simplest problem that can be posed for conservation laws and is
  also central in the theory as it exhibits many important features
  encountered with general solutions of<nbsp><eqref|eq:intro.con.law>.

  <big-figure|<image|illustrations\\ch1_hyperbolic_conservation_laws-image-1.png|0.7par|||><label|fig:sol.struc>|<caption-detailed|Solution
  structure for the Riemann problem of a system of conservation laws. The
  illustration is from<nbsp><cite|raythesis>.|Solution structure for the
  Riemann problem of a system of conservation laws.>>

  We assume for simplicity that the 1-D system<nbsp><eqref|eq:intro.con.law>
  is strictly hyperbolic (Definition<nbsp><reference|defn:hyperbolic>) and
  thus has <math|m> distinct eigenvalues. This is satisfied by the
  compressible Euler's equations<nbsp><eqref|eq:3deuler> in 1-D. The solution
  of the Riemann problem<nbsp><eqref|eq:intro.rp> is as in
  Figure<nbsp><reference|fig:sol.struc> which consists of <math|m> distinct
  <with|font-shape|italic|waves> emanating from the origin, corresponding to
  each eigenvalue. The solutions to such problems are
  self-similar<nbsp><cite|LeFloch2002> in the sense that
  <math|<value|uu><around*|(|x,t|)>=<with|font-series|bold|W><around*|(|x/t|)>>.
  The <math|m+1> states are connected by the following waves:

  <\itemize>
    <item><with|font-series|bold|Shock wave:> The
    <math|\<lambda\><rsub|i>>-wave is a shock wave if it corresponds to a
    genuinely nonlinear field<nbsp><eqref|eq:genuinely.nonlinear> and
    connects two states <math|<value|uu><rsub|->> and
    <math|<value|uu><rsub|+>> through a single jump discontinuity. The
    discontinuity moves with speed <math|S<rsub|i>> satisfying 1-D RH
    condition<nbsp><eqref|eq:1d.rh> and relating to the eigenvalues by the
    Lax entropy condition

    <\equation*>
      \<lambda\><rsub|i><around*|(|<value|uu><rsub|->|)>\<gtr\>S<rsub|i>\<gtr\>\<lambda\><rsub|i><around*|(|<value|uu><rsub|+>|)>
    </equation*>

    This relation can be deduced from the entropy
    condition<nbsp><eqref|eq:entropy.condition> and the arguments in the
    proof of Theorem<nbsp><reference|thm:rh> for a convex flux. As shown in
    Figure<nbsp><reference|fig:chars>a, the
    <with|font-shape|italic|characteristic> lines
    <math|<value|ud>x/<value|ud>t=\<lambda\><rsub|i>> on both sides collide
    leading to the shock wave <math|<value|ud>x/<value|ud>t=S<rsub|i>>.

    <item><with|font-series|bold|Contact wave:> The
    <math|\<lambda\><rsub|i>>-wave is a contact wave, if it corresponds to a
    linearly degenerate field<nbsp><eqref|eq:linearly.degenerate> and
    connects two states <math|<value|uu><rsub|->> and
    <math|<value|uu><rsub|+>> through a single jump discontinuity. As in the
    case of the shock wave, the discontinuity moves with a speed
    <math|S<rsub|i>> given by the RH condition<nbsp><eqref|eq:rh.cond>. It
    additionally satisfies the <with|font-shape|italic|parallel
    characteristic condition>

    <\equation*>
      \<lambda\><rsub|i><around*|(|<value|uu><rsub|->|)>=S<rsub|i>=\<lambda\><rsub|i><around*|(|<value|uu><rsub|+>|)>
    </equation*>

    This implies that the characteristic lines on either side of the contact
    line <math|<value|ud>x/<value|ud>t=S<rsub|i>> run parallel to it, as
    shown in Figure<nbsp><reference|fig:chars>b.

    <item><with|font-series|bold|Rarefaction:> The
    <math|\<lambda\><rsub|i>>-wave corresponds to a rarefaction, if it
    connects two states <math|<value|uu><rsub|->> and
    <math|<value|uu><rsub|+>> through a smooth transition in a genuinely
    nonlinear field. As shown in Figure<nbsp><reference|fig:chars>b, the
    characteristic lines corresponding to a rarefaction diverge from each
    other, i.e.,

    <\equation*>
      \<lambda\><rsub|i><around*|(|<value|uu><rsub|->|)>\<less\>\<lambda\><rsub|i><around*|(|<value|uu><rsub|+>|)>
    </equation*>
  </itemize>

  <big-figure|<center|<wide-tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<cwith|1|1|3|3|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
    <image|illustrations\\shock.png|0.3par|||>
  </cell>|<\cell>
    <image|illustrations\\contact.png|0.3par|||>
  </cell>|<\cell>
    <image|illustrations\\rarefaction.png|0.3par|||>
  </cell>>|<row|<\cell>
    (a) Shock wave
  </cell>|<\cell>
    (b) Contact wave
  </cell>|<\cell>
    (c) Rarefaction
  </cell>>>>>><label|fig:chars>|<caption-detailed|Characteristic lines for
  simple waves forming the solution to a Riemann problem. The illustration is
  from<nbsp><cite|raythesis>.|Characteristic lines for simple waves forming
  the solution to a Riemann problem.>>

  <section|Compressible Euler's equations>

  The compressible Euler's equations of gas dynamics in 3-D are given by

  <\equation>
    <label|eq:3deuler>\<partial\><rsub|t>*<matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*<bv>>>|<row|<cell|E>>>>>+<value|Div><matrix|<tformat|<table|<row|<cell|\<rho\>*<bv>>>|<row|<cell|\<rho\>*<bv>\<otimes\><bv>+p*I>>|<row|<cell|<bv>*<around*|(|E+p|)>>>>>>=<value|bzero>,<space|1em>I=<around*|(|\<delta\><rsub|i\<nocomma\>j>|)><rsub|<tabular*|<tformat|<table|<row|<cell|1\<leq\>i,j\<leq\>3>>>>>>
  </equation>

  The conservative variable is thus given by
  <math|<value|uu>=<around*|(|\<rho\>,\<rho\>*<bv>,E|)>=<around*|(|\<rho\>,\<rho\>*v<rsub|1>,\<rho\>*v<rsub|2>,\<rho\>*v<rsub|3>,E|)>>
  where <math|\<rho\>,<bv>,p,E> denote the fluid density, velocity, pressure
  and total energy per unit volume. For a polytropic gas, an equation of
  state <math|E=E<around|(|\<rho\>,u,v,p|)>> which leads to a closed system
  is given by

  <\equation>
    <label|eq:2dstate>E=E<around|(|\<rho\>,u,v,p|)>=<frac|p|\<gamma\>-1>+<frac|1|2>*\<rho\>*<around*|\||<bv>|\|><rsup|2>
  </equation>

  and the admissible set<nbsp><eqref|eq:intro.u> where
  <math|\<gamma\>\<gtr\>1> is the adiabatic constant, that will usually be
  considered to be 1.4, which is the typical value for air. The admissible
  set is given by <math|<Uad>=<around*|{|<value|uu>:\<rho\><around*|(|<value|uu>|)>,p<around*|(|<value|uu>|)>\<gtr\>0|}>>.
  Defining the flux Jacobian <math|<with|font-series|bold|<bA><rsub|i>><around*|(|<value|uu>|)>=<value|pf><rsub|i><rprime|'><around*|(|<value|uu>|)>>
  for <math|i=1,2,3>, we consider the matrix

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|<with|font-series|bold|A><around*|(|<value|uu>,<value|bn>|)>>|<cell|=>|<cell|<with|font-series|bold|A><rsub|1>*n<rsub|1>+<with|font-series|bold|A><rsub|2>*n<rsub|2>+<with|font-series|bold|A><rsub|3>*n<rsub|3>,<space|2em><value|bn>=<around*|(|n<rsub|1>,n<rsub|2>,n<rsub|3>|)>\<in\>\<bbb-R\><rsup|3>>>>>>
  </equation*>

  The eigenvalues and eigenvectors of <math|<bA><around*|(|<value|uu>,<value|bn>|)>>
  are given by

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|1>=v<rsub|n>-a,<space|2em>\<lambda\><rsub|2>=\<lambda\><rsub|3>=\<lambda\><rsub|3>=v<rsub|n>,<space|2em>\<lambda\><rsub|5>=v<rsub|n>+a>>|<row|<cell|>>|<row|<cell|<tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<with|font-series|bold|R><around*|(|<value|uu>,<value|bn>|)>>|<cell|=>|<cell|<around*|(|<br><rsub|1>,<br><rsub|2>,<br><rsub|3>,<br><rsub|4>,<br><rsub|5>|)>>>|<row|<cell|>|<cell|=>|<cell|<matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|0>|<cell|0>|<cell|1>>|<row|<cell|v<rsub|1>-a*n<rsub|1>>|<cell|v<rsub|1>>|<cell|n<rsub|2>>|<cell|-n<rsub|3>>|<cell|v<rsub|1>+a*n<rsub|1>>>|<row|<cell|v<rsub|2>-a*n<rsub|2>>|<cell|v<rsub|2>>|<cell|-n<rsub|1>>|<cell|0>|<cell|v<rsub|2>+a*n<rsub|2>>>|<row|<cell|v<rsub|3>-a*n<rsub|3>>|<cell|v<rsub|3>>|<cell|0>|<cell|n<rsub|1>>|<cell|v<rsub|3>+a*n<rsub|3>>>|<row|<cell|H-a*v<rsub|n>>|<cell|<frac|1|2>*<around*|\||<bv>|\|><rsup|2>>|<cell|v<rsub|1>*n<rsub|2>-v<rsub|2>*n<rsub|1>>|<cell|v<rsub|3>*n<rsub|1>-v<rsub|1>*n<rsub|3>>|<cell|H+a*v<rsub|n>>>>>>>>>>>>>>>>
  </equation*>

  where <math|v<rsub|n>=<bv>\<cdot\><value|bn>>,
  <math|a=<sqrt|\<gamma\>*p/\<rho\>>> is the speed of sound in air and
  <math|H=<around*|(|\<gamma\>-1|)><rsup|-1>*a<rsup|2>+<around*|\||<bv>|\|><rsup|2>/2>
  is the specific enthalpy. Assuming the solution is admissible (i.e.,
  <math|\<rho\>,p\<gtr\>0>), the eigenvalues are real and the corresponding
  eigenvectors are linearly-independent. Thus, Euler's
  equations<nbsp><eqref|eq:3deuler> form a hyperbolic system. In this work,
  we will be restricted to the 2-D compressible Euler's equations which are
  given by

  <\equation>
    <label|eq:2deuler><pd||t>*<matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*u>>|<row|<cell|\<rho\>*v>>|<row|<cell|E>>>>>+<pd||x>*<around*|(|<tabular*|<tformat|<table|<row|<cell|\<rho\>*u>>|<row|<cell|p+\<rho\>*u<rsup|2>>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|<around*|(|E+p|)>*u>>>>>|)>+<pd||y>*<around*|(|<tabular*|<tformat|<table|<row|<cell|\<rho\>*v>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|p+\<rho\>*v<rsup|2>>>|<row|<cell|<around*|(|E+p|)>*v>>>>>|)>=<value|bzero>
  </equation>

  where <math|u,v=v<rsub|1>,v<rsub|2>>.

  <section|Compressible Navier-Stokes equations>

  The Euler's equations<nbsp><eqref|eq:3deuler> describe inviscid flows which
  do not account for viscosity and are thus applicable where the effect of
  viscosity is negligible in comparison to the advection. These advection
  dominated flows occur in a variety of practical problems. However, viscous
  effects do become important for studying flows with boundary layers near
  solid walls and the behaviour of fluids in turbulent regions. Thus, we
  consider the compressible Navier-Stokes equations which are
  hyperbolic-parabolic in nature. The equations are given in three dimensions
  as

  <\equation>
    <label|eq:3dns>\<partial\><rsub|t>*<matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*<bv>>>|<row|<cell|E>>>>>+<value|Div><matrix|<tformat|<table|<row|<cell|\<rho\>*<bv>>>|<row|<cell|\<rho\>*<bv>\<otimes\><bv>+p*I>>|<row|<cell|<bv>*<around*|(|E+p|)>>>>>>=<value|Div><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|<with|font-series|bold|\<tau\>>>>|<row|<cell|<with|font-series|bold|\<tau\>>*<bv>-<bQ>>>>>>
  </equation>

  with the symmetric shear stress tensor <math|<with|font-series|bold|\<tau\>>>
  and heat flux <math|<bQ>> given by Newtonian and Fourier constitutive
  relations respectively

  <\equation*>
    <with|font-series|bold|\<tau\>>=\<mu\>*<around*|(|\<nabla\>*<value|uu>+<around*|(|\<nabla\>*<value|uu>|)><rsup|T>|)>-<frac|2|3>*\<mu\>*<around*|(|<value|Div><value|uu>|)>*I,<space|2em><bQ>=<around*|(|Q<rsub|1>,Q<rsub|2>,Q<rsub|3>|)>=-\<kappa\>*\<nabla\>\<theta\>
  </equation*>

  Here, <math|I=<around*|(|\<delta\><rsub|i\<nocomma\>j>|)><rsub|1\<leq\>i,j\<leq\>3>>,
  <math|\<mu\>> is the coefficient of dynamic viscosity and <math|\<kappa\>>
  is the coefficient of heat conductance. The <math|\<theta\>> denotes
  temperature of the flow which is obtained using the
  <with|font-shape|italic|ideal gas law> <math|p=\<rho\>*R*\<theta\>> where
  <math|R> is the gas constant with <math|R=c<rsub|p>-c<rsub|v>>. The
  coefficient of heat conductance can be determined from <math|\<mu\>> using
  the relation

  <\equation*>
    \<kappa\>=<frac|\<mu\>*c<rsub|p>|Pr>
  </equation*>

  where <math|Pr> is the Prandtl number, which is assumed to be constant for
  a given gas. The Euler's equations<nbsp><eqref|eq:3deuler> can be recovered
  from the Navier-Stokes equations<nbsp><eqref|eq:3dns> by setting
  <math|\<mu\>=0>.

  An important non-dimensional number for viscous flows is the
  <with|font-shape|italic|Reynolds number> given by

  <\equation*>
    Re=<frac|L*U|\<nu\>>
  </equation*>

  where <math|L> and <math|U> are the respective characteristic length and
  velocity scales of the flow, <math|\<nu\>=\<mu\>/\<rho\><rsub|0>> is the
  coefficient of kinematic viscosity given the free stream density
  <math|\<rho\><rsub|0>>. The Reynolds number can be seen as a measure of the
  ratio of advection and diffusion. High Reynolds number flows are advection
  dominated flows, while low reynolds number flows are diffusion dominated.

  In this work, we will be restricted to the Navier-Stokes equations in two
  dimensions which are given by

  <\equation>
    <tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|<pd||t><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*u>>|<row|<cell|\<rho\>*v>>|<row|<cell|E>>>>>|)>+<pd||x><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<rho\>*u>>|<row|<cell|p+\<rho\>*u<rsup|2>>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|<around|(|E+p|)>*u>>>>>|)>+<pd||y><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<rho\>*v>>|<row|<cell|\<rho\>*u*v>>|<row|<cell|p+\<rho\>*v<rsup|2>>>|<row|<cell|<around|(|E+p|)>*v>>>>>|)>>>|<row|<cell|>>|<row|<cell|<space|2em>=<pdv||x><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|0>>|<row|<cell|\<tau\><rsub|11>>>|<row|<cell|\<tau\><rsub|12>>>|<row|<cell|u*\<tau\><rsub|11>+u<rsub|2>*\<tau\><rsub|12>-Q<rsub|1>>>>>>|)>+<pdv||y><around*|(|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|0>>|<row|<cell|\<tau\><rsub|21>>>|<row|<cell|\<tau\><rsub|22>>>|<row|<cell|u<rsub|1>*\<tau\><rsub|21>+u<rsub|2>*\<tau\><rsub|22>-Q<rsub|2>>>>>>|)>>>>>><label|eq:2dns>
  </equation>

  where <math|u,v=v<rsub|1>,v<rsub|2>>.
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|1>
    <associate|font-base-size|12>
    <associate|info-flag|minimal>
    <associate|page-even|1in>
    <associate|page-first|30>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|section-nr|5>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|2|31>>
    <associate|auto-2|<tuple|2.1|31>>
    <associate|auto-3|<tuple|2.1.1|32>>
    <associate|auto-4|<tuple|2.1.2|33>>
    <associate|auto-5|<tuple|2.1.3|34>>
    <associate|auto-6|<tuple|2.1|34>>
    <associate|auto-7|<tuple|2.2|35>>
    <associate|auto-8|<tuple|2.2|35>>
    <associate|auto-9|<tuple|2.3|36>>
    <associate|ch:con.law|<tuple|2|31>>
    <associate|defn:hyperbolic|<tuple|2.1|31>>
    <associate|eq:1d.rh|<tuple|2.9|33>>
    <associate|eq:2deuler|<tuple|2.16|36>>
    <associate|eq:2dns|<tuple|2.18|37>>
    <associate|eq:2dstate|<tuple|2.15|35>>
    <associate|eq:3deuler|<tuple|2.14|35>>
    <associate|eq:3dns|<tuple|2.17|36>>
    <associate|eq:cauchy.problem|<tuple|2.6|32>>
    <associate|eq:entropy.condition|<tuple|2.11|33>>
    <associate|eq:genuinely.nonlinear|<tuple|2.4|32>>
    <associate|eq:integral.con.law|<tuple|2.3|31>>
    <associate|eq:intro.con.law|<tuple|2.2|31>>
    <associate|eq:intro.rp|<tuple|2.13|34>>
    <associate|eq:intro.u|<tuple|2.1|31>>
    <associate|eq:linearly.degenerate|<tuple|2.5|32>>
    <associate|eq:regularized.con.law|<tuple|2.10|33>>
    <associate|eq:rh.cond|<tuple|2.8|32>>
    <associate|eq:weak.form|<tuple|2.7|32>>
    <associate|fig:chars|<tuple|2.2|35>>
    <associate|fig:sol.struc|<tuple|2.1|34>>
    <associate|sec:riemann.problem|<tuple|2.1.3|34>>
    <associate|thm:rh|<tuple|2.4|32>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      LeFloch2002

      LeFloch2002

      raythesis

      LeFloch2002
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|2.1>|>
        Solution structure for the Riemann problem of a system of
        conservation laws.
      </surround>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|2.2>|>
        Characteristic lines for simple waves forming the solution to a
        Riemann problem.
      </surround>|<pageref|auto-7>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|2.<space|2spc>Equations
      of motion> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      2.1.<space|2spc>Hyperbolic conservation laws
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      <with|par-left|<quote|1tab>|2.1.1.<space|2spc>Weak formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.1.2.<space|2spc>Entropy condition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.1.3.<space|2spc>The Riemann problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      2.2.<space|2spc>Compressible Euler's equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      2.3.<space|2spc>Compressible Navier-Stokes equations
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>
    </associate>
  </collection>
</auxiliary>