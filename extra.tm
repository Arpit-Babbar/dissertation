<TeXmacs|2.1.1>

<style|<tuple|tmbook|old-lengths|preview-ref|style_common>>

<\body>
  <\hide-preamble>
    # Vector symbol

    <assign|vec|<macro|f|<wide|<arg|f>|\<vect\>>>>

    <assign|vect|<\macro|f>
      <wide|<arg|f>|\<vect\>>
    </macro>>

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

    <assign|bw|<macro|\<b-w\>>>

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

  <section|Some scalar numerical fluxes>

  <\example>
    <with|font-series|bold|Upwind Scheme for linear advection>

    Suppose <math|a\<gtr\>0> in the linear advection equation

    <\equation*>
      u<rsub|t>+a*u<rsub|x>=0
    </equation*>

    Then, a characteristic passing through
    <math|<around*|(|x<rsub|j>,t<rsup|n+1>|)>> would time level <math|n>
    backward of <math|x<rsub|j>>. We make two-point linear approximations of
    solution at that point as

    <\equation*>
      a*\<lambda\>*u<rsub|j-1><rsup|n>+<around*|(|1-\<lambda\>*a|)>*u<rsub|j><rsup|n>
    </equation*>

    To ensure that this is not done by extrapolation, the CFL condition(which
    can also be derived by a Fourier stability analysis) is

    <\equation*>
      <around|\||\<lambda\>*a|\|>\<leq\>1
    </equation*>

    Thus,

    <\equation*>
      u<rsub|j><rsup|n+1>=a*\<lambda\>*u<rsub|j-1><rsup|n>+<around*|(|1-\<lambda\>*a|)>*u<rsub|j><rsup|n>
    </equation*>

    This is nothing but

    <\equation*>
      <frac|u<rsup|n+1><rsub|j>-u<rsub|j><rsup|n>|\<mathLaplace\>t>+a*<frac|u<rsub|j><rsup|n>-u<rsub|j-1><rsup|n>|\<mathLaplace\>x>=0
    </equation*>

    Similarly, for <math|a\<less\>0>, we'd have

    <\equation*>
      <frac|u<rsup|n+1><rsub|j>-u<rsub|j><rsup|n>|\<mathLaplace\>t>+a*<frac|u<rsub|j+1><rsup|n>-u<rsub|j><rsup|n>|\<mathLaplace\>x>=0
    </equation*>

    Thus, we do a backward difference for <math|a\<gtr\>0> and forward
    difference for <math|a\<less\>0>. This extends to the nonlinear case if
    <math|f> is monotone. For the general case, we look at the next three
    possible extensions.
  </example>

  <\example>
    <with|font-series|bold|The Godunov scheme>

    The scheme is based on the idea of solving Riemann problems. Recall that
    the (unique) entropy solution of the Riemann problem

    <\equation*>
      <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<pdv|u|t>+<pdv||x>*f<around*|(|u|)>>|<cell|=>|<cell|0>>|<row|<cell|u<around*|(|x,0|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|u<rsub|l>,>|<cell|<space|1em>>|<cell|x\<less\>0>>|<row|<cell|u<rsub|r>>|<cell|>|<cell|x\<gtr\>0>>>>>>>>>>
    </equation*>

    is self-similar, i.e., zooming at the origin reveals the same structure,
    or more precisely

    <\equation*>
      u<around*|(|x,t|)>=w<rsub|R><around*|(|x/t;u<rsub|l>,u<rsub|r>|)>
    </equation*>

    where <math|w<rsub|R>> depends only on the function <math|f>, and
    consists of the two constant states <math|u<rsub|l>> and <math|u<rsub|r>>
    separated by various waves starting from the origin whose speeds are
    bounded by

    <\equation*>
      max<around*|{|<around*|\||a<around*|(|\<xi\>|)>|\|>:\<xi\><text| is
      between >u<rsub|l>,u<rsub|r>|}>
    </equation*>

    Suppose that we are given an approximation
    <math|v<rsup|n>=<around*|(|v<rsup|n><rsub|j>|)><rsub|j\<in\>\<bbb-Z\>>>
    of the solution at time level <math|n>. Then, the Godunov scheme
    constructs <math|v<rsup|n+1>> as follows.

    <no-indent><with|font-series|bold|1st step>

    We solve the following problem exactly

    <\equation*>
      <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|5|5|cell-halign|l>|<table|<row|<cell|<pdv|w|t>+<pdv||x>f<around*|(|w|)>>|<cell|=>|<cell|0,>|<cell|<space|1em>>|<cell|x\<in\>\<bbb-R\>,t\<in\><around*|[|t<rsub|n>,t<rsub|n+1>|]>>>|<row|<cell|w<around*|(|x,t<rsub|n>|)>>|<cell|=>|<cell|v<rsub|\<mathLaplace\>><around*|(|x,t<rsub|n>|)>>|<cell|>|<cell|>>>>>
    </equation*>

    where hte function <math|v<rsub|\<mathLaplace\>>> is again
    (<reference|ch.num:piecewise.soln>) defined by piece-wise constants
    states, i.e.,

    <\equation*>
      v<rsub|\<mathLaplace\>><around*|(|x,t<rsub|n>|)>=v<rsub|j><rsup|n>,<space|1em>x\<in\><around|(|x<rsub|j-<frac|1|2>>,x<rsub|j+<frac|1|2>>|)>,<space|1em>j\<in\>\<bbb-Z\>
    </equation*>

    Since <math|v<rsub|\<mathLaplace\>>\<in\>L<rsup|\<infty\>><around*|(|\<bbb-R\>|)>>,
    this problem has a unique entropy solution that we can determine
    explicitly at least for <math|\<mathLaplace\>t> small enough. The CFL
    condition

    <\equation*>
      \<lambda\>*max<around*|{|<around*|\||a<around*|(|v|)>|\|>:v<text|
      between >v<rsub|j-1><rsup|n>,v<rsub|j><rsup|n>|}>\<leq\><value|half>,<space|1em>j\<in\>\<bbb-Z\>
    </equation*>

    ensures that all problems are decoupled, and we actually have

    <\equation>
      w<around*|(|x,t<rsub|n+1>|)>=w<rsub|R><around*|(|<frac|x-x<rsub|j+<frac|1|2>>|\<Delta\>t>;v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>,<space|1em>x\<in\><around*|(|x<rsub|j>,x<rsub|j+1>|)>,<space|1em>j\<in\>\<bbb-Z\><label|ch.num:godnnov.explicit>
    </equation>

    <no-indent><with|font-series|bold|2nd step>

    Then, <math|v<rsub|j><rsup|n+1>> is is defined as the average value of
    the preceding solution on the interval
    <math|<around*|(|x<rsub|j-<frac|1|2>>,x<rsub|j+<frac|1|2>>|)>>

    <\equation*>
      v<rsub|j><rsup|n+1>=<frac|1|\<mathLaplace\>x><big|int><rsub|x<rsub|j-<frac|1|2>>><rsup|x<rsub|j+<frac|1|2>>>w<around*|(|x,t<rsub|n+1>|)>*<value|ud>x
    </equation*>

    Using the above expression, we actually have

    <\equation*>
      v<rsub|j><rsup|n+1>=<frac|1|\<mathLaplace\>x>*<around*|[|<big|int><rsub|-<frac|\<mathLaplace\>x|2>><rsup|0>w<rsub|R><around*|(|<frac|x|\<mathLaplace\>t>;v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>+<big|int><rsub|0><rsup|<frac|\<mathLaplace\>x|2>>w<rsub|R><around*|(|<frac|x|\<mathLaplace\>t>;v<rsub|j-1><rsup|n>,v<rsub|j><rsup|n>|)>|]>
    </equation*>

    That gives us an expression for the update. But, we can also get a simple
    expression by integrating the conservation law satisfied by <math|w> to
    get

    <\equation*>
      <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|0>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<Delta\>t><big|int><rsub|x<rsub|j-<frac|1|2>>><rsup|x<rsub|j+<frac|1|2>>><around*|[|<pdv|w|t>+<pdv||x>*f<around*|(|w|)>|]>*<value|ud>x
      <value|ud>t>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|x<rsub|j-<frac|1|2>>><rsup|x<rsub|j+<frac|1|2>>><around*|(|w<around*|(|x,\<mathLaplace\>t|)>-w<around*|(|x,0|)>|)>*<value|ud>x+<big|int><rsub|0><rsup|\<mathLaplace\>t>f<around*|(|w<around*|(|x<rsub|j+1/2><rsup|->|)>|)>-f<around*|(|w<around*|(|x<rsub|j-1/2><rsup|+>,t|)>|)>*<value|ud>t>>|<row|<cell|>|<cell|=>|<cell|\<mathLaplace\>x<around*|(|v<rsub|j><rsup|n+1>-v<rsub|j><rsup|n>|)>-\<mathLaplace\>t*<around*|{|f<around*|(|w<rsub|R><around*|(|0<rsup|->;v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>-f<around*|(|w<rsub|R><around*|(|0<rsup|+>;v<rsub|j-1>,v<rsub|j><rsup|n>|)>|)>|)>|}>>>>>>
    </equation*>

    If <math|\<xi\>\<mapsto\>w<rsub|R><around*|(|\<xi\>;u<rsub|l>,u<rsub|r>|)>>
    is continuous at <math|0>, so is <math|\<xi\>\<mapsto\>f<around*|(|w<rsub|R><around*|(|\<xi\>;u<rsub|l>,u<rsub|r>|)>|)>>
    at 0. If not, there is a stationary/zero speed discontinuity wave at
    <math|x=0> line, so by RH conditions we have

    <\equation*>
      f<around*|(|w<rsub|R><around*|(|0<rsup|+>;u<rsub|l>,u<rsub|r>|)>|)>=f<around*|(|w<rsub|R><around*|(|u<rsup|->;u<rsub|l>,u<rsub|r>|)>|)>
    </equation*>

    Thus, we can get the Godunov's scheme in the simple form

    <\equation*>
      v<rsub|j><rsup|n+1>=v<rsub|j><rsup|n>-\<lambda\>*<around*|{|f<around*|(|w<rsub|R><around*|(|0;v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>-f<around*|(|w<rsub|R><around*|(|0;v<rsub|j-1><rsup|n>,v<rsub|j><rsup|n>|)>|)>|)>|}>
    </equation*>

    This is a conservative scheme with numerical flux

    <\equation*>
      f<rsup|G><around*|(|u,v|)>=f<around*|(|w<rsub|R><around*|(|0;u,v|)>|)>
    </equation*>

    In the above scheme, only the values of
    <math|f<around*|(|w<around*|(|x<rsub|j+1/2>,t|)>|)>> are needed, and we
    have <math|f<around*|(|w<around*|(|x<rsub|j+1/2>,t|)>|)>=f<around*|(|w<around*|(|x<rsub|j+1/2><rsup|+>,t|)>|)>=f<around*|(|w<around*|(|x<rsub|j<rsub|+1/2>><rsup|->,t|)>|)>>
    for as long as we satisfy the more relaxed CFL condition

    <\equation*>
      \<lambda\>*max<around*|{|<around*|\||a<around*|(|v|)>|\|><space|0.2spc>:<space|0.2spc>v<text|
      is between >v<rsub|j-1><rsup|n>,v<rsub|j><rsup|n>|}>\<leq\>1,<space|1em>j\<in\>\<bbb-Z\>
    </equation*>

    holds. Do note that, in this weaker CFL condition, we no longer have
    neatly decoupled Riemann problems giving
    us<nbsp><eqref|ch.num:godnnov.explicit>.
  </example>

  <\example>
    <with|font-series|bold|Murman-Roe scheme>

    Define

    <\equation*>
      a<around*|(|u,v|)>=<frac|f<around*|(|u|)>-f<around*|(|v|)>|u-v>
    </equation*>

    Murman Roe's scheme is a natural extension to the upwind scheme by giving
    the numerical flux

    <\equation*>
      f<rsup|Roe><around*|(|v<rsub|j>,v<rsub|j+1>|)>=<choice|<tformat|<table|<row|<cell|f<around*|(|v<rsub|j>|)>,>|<cell|<space|1em>>|<cell|a<around*|(|v<rsub|j>,v<rsub|j+1>|)>\<gtr\>0>>|<row|<cell|f<around*|(|v<rsub|j+1>|)>,>|<cell|>|<cell|a<around*|(|v<rsub|j>,v<rsub|j+1>|)>\<less\>0>>>>>
    </equation*>

    It can also be derived as an approximate Riemann Solver. That is, for the
    face at <math|x<rsub|j+1/2>>, we solve the linearized equation

    <\equation*>
      <tabular*|<tformat|<table|<row|<cell|<pdv|w|t>+a<around*|(|v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>*<pdv|w|x>=0>>|<row|<cell|w<around*|(|x,0|)>=<choice|<tformat|<table|<row|<cell|v<rsub|j><rsup|n>,>|<cell|<space|1em>>|<cell|x\<less\>x<rsub|j+1/2>>>|<row|<cell|v<rsub|j+1><rsup|n>,>|<cell|>|<cell|x\<gtr\>x<rsub|j+1/2>>>>>>>>>>>
    </equation*>

    The solution to this is given by

    <\equation*>
      w<around*|(|x,t|)>=w<rsub|R><rsup|Roe><around*|(|\<xi\>;v<rsub|j><rsup|n>,v<rsub|j><rsup|n+1>|)>=<choice|<tformat|<table|<row|<cell|v<rsub|j>,>|<cell|<space|1em>>|<cell|\<xi\>\<less\>a<around*|(|v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>>>|<row|<cell|v<rsub|j+1>,>|<cell|>|<cell|\<xi\>\<gtr\>a<around*|(|v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>>>>>>
    </equation*>

    In the Godunov scheme, we replace the <math|w<rsub|R>> by
    <math|w<rsub|R><rsup|Roe>> to get the following scheme

    <\equation*>
      v<rsub|j><rsup|n+1>=v<rsub|j><rsup|n>-\<lambda\><around*|{|f<around*|(|w<rsub|R><rsup|Roe><around*|(|0;v<rsub|j><rsup|n>,v<rsub|j+1><rsup|n>|)>-f<around*|(|w<rsub|R><rsup|Roe><around*|(|0;v<rsub|j-1><rsup|n>,v<rsub|j><rsup|n>|)>|)>|)>|}>
    </equation*>

    The associated numerical flux is given by

    <\equation*>
      f<rsup|Roe><around*|(|u,v|)>=f<around*|(|w<rsub|R><rsup|roe><around*|(|0;u,v|)>|)>=<choice|<tformat|<table|<row|<cell|f<around*|(|u|)>>|<cell|<space|1em>>|<cell|<text|if
      >a<around*|(|u,v|)>\<gtr\>0>>|<row|<cell|f<around*|(|v|)>>|<cell|>|<cell|<text|if
      >a<around*|(|u,v|)>\<less\>0>>>>>
    </equation*>

    which can also be written as

    <\equation*>
      f<rsup|Roe><around*|(|u,v|)>=<frac|f<around*|(|u|)>+f<around*|(|v|)>|2>-<frac|<around*|\||a<around*|(|u,v|)>|\|>|2>*<around*|(|v-u|)>
    </equation*>

    Murman Roe's scheme fails to resolve rarefactions. For example,\ 

    <\equation*>
      v<rsub|j><rsup|0>=<choice|<tformat|<table|<row|<cell|u<rsub|l>>|<cell|<space|1em>>|<cell|j\<leq\>-1>>|<row|<cell|u<rsub|r>,>|<cell|>|<cell|j\<geq\>0>>>>>
    </equation*>

    leads to\ 

    <\equation*>
      v<rsub|j><rsup|n>=v<rsub|j><rsup|0>,<space|1em><text|for all >j<text|
      and all >n
    </equation*>
  </example>

  <\example>
    <with|font-series|bold|The Enguist-Osher Scheme>
  </example>

  We replace, by its approximation, the dissipation term

  <\equation*>
    \ <math|<frac|a<around*|(|u,v|)>|2><around*|(|v-u|)>>
  </equation*>

  \ in the flux of <math|g<rsup|Roe>> to define Enguist-Osher's flux

  <\equation*>
    f<rsup|E.O.><around*|(|u,v|)>=<frac|f<around*|(|u|)>+f<around*|(|v|)>|2>-<frac|1|2>*<big|int><rsub|u><rsup|v><around*|\||a<around*|(|\<xi\>|)>|\|>*<value|ud>\<xi\>
  </equation*>

  <section|2 DG schemes>

  Corresponding to each <math|\<Omega\><rsub|e>>, we define the reference
  maps

  <\equation*>
    \<Theta\><rsub|e>:<value|Oo>\<rightarrow\>\<Omega\><rsub|e>
  </equation*>

  The hat notation to indicate the quantity in reference space coordinates
  will usually be suppressed.

  Thus, we can specify degree <math|N> approximate solution and fluxes in the
  reference space <value|Oo> as

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<wide|<value|uu>|^><rsub|e><rsup|\<delta\>><around*|(|<vxi>|)>>|<cell|=>|<cell|<big|sum><rsub|<bp>><value|uebp>*\<ell\><rsub|<bp>><around*|(|<vxi>|)>>>|<row|<cell|<wide|<value|pf>|^><rsub|e><rsup|\<delta\>><around*|(|<vxi>|)>>|<cell|=>|<cell|<big|sum><rsub|<bp>><value|pf><around*|(|<value|uebp>|)>*\<ell\><rsub|<bp>><around*|(|<vxi>|)>>>|<row|<cell|<around*|(|<value|tf><rsub|e><rsup|\<delta\>>|)><rsub|i><around*|(|<vxi>|)>>|<cell|=>|<cell|<big|sum><rsub|<bp>><around*|(|J*<ba><rsup|i>\<cdot\><value|pf><rsup|\<delta\>><rsub|e>|)><around*|(|<vxi><rsub|<bp>>|)>*\<ell\><rsub|<bp>><around*|(|<vxi>|)>>>>>><text|<with|color|red|Use
    basis of Chapter, don't do 2 DGs>>
  </equation>

  where <math|<value|uu><rsub|e,<bp>>> are the unknowns we solve for. The
  solution and flux in physical variables are given by

  <\equation*>
    <value|uu><rsup|\<delta\>><around*|(|\<Theta\><rsub|e><around*|(|<vxi>|)>|)>=<value|rpu><rsub|e><around*|(|<vxi>|)>,<space|2em><value|pf><rsup|\<delta\>><around*|(|\<Theta\><rsub|e><around*|(|<vxi>|)>|)>=<wide|<value|pf>|^><rsub|e><around*|(|<vxi>|)>
  </equation*>

  We now derive the other approach where the DG procedure is performed in the
  physical cell. Consider a test function <math|\<varphi\>> which is a
  polynomial in the reference coordinates. After
  multiplying<nbsp><eqref|eq:con.law> with <math|\<varphi\>> and performing a
  formal integration by parts, we get

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<big|int><rsub|\<Omega\><rsub|e>><pdv|<value|uu><rsub|e><rsup|\<delta\>>|t>*\<varphi\><around*|(|<vxi>|)>*<ud><bx>-<big|int><rsub|\<Omega\><rsub|e>><bof><rsub|e><rsup|\<delta\>>\<cdot\><around*|(|\<nabla\><rsub|<bx>>
    \<varphi\>|)>*<ud><bx>>>|<row|<cell|<tabular*|<tformat|<table|<row|<cell|<space|1em>>|<cell|+<big|sum><rsub|i=1><rsup|d><big|int><rsub|\<partial\>\<Omega\><rsub|e,i><rsup|L>><around*|(|<value|pf><rsub|e>\<cdot\><value|bn><rsub|L,i>|)><rsup|\<ast\>>*\<varphi\>*<ud>S<rsub|<bx>>+<big|int><rsub|\<partial\>\<Omega\><rsub|e,i><rsup|R>><around*|(|<value|pf><rsub|e>\<cdot\><value|bn><rsub|R,i>|)><rsup|\<ast\>>*\<varphi\>*<ud>S<rsub|<bx>>=<value|bzero>>>>>>>>>>>
  </equation*>

  where <math|\<partial\>\<Omega\><rsub|e,i><rsup|\<pm\>>> corresponds to the
  image of the two faces <math|<value|Oipm>>, under the reference map
  <math|\<Theta\><rsub|e>>, <math|<value|bn><rsub|s,i>> is the outward normal
  of side <math|s> in direction <math|i>. In physical coordinates,
  <math|<value|bn><rsub|s,i>> is a function of the variable <math|<bx>>.

  By using the metric identities<nbsp><eqref|eq:curved.metric.identity.contravariant>,
  we get can apply product rule to<nbsp>(<reference|eq:curved.divergence.transform.contravariant>,<nbsp><reference|eq:curved.gradient.transform.contravariant>)
  to get the non-conservative transformation of divergence and gradient

  <\equation>
    <value|Div><value|pf>=<big|sum><rsub|i=1><rsup|d><ba><rsup|i>\<cdot\><pdv|<value|pf>|<value|xii>>,<space|2em>\<nabla\>*f=<big|sum><rsub|i=1><rsup|d><ba><rsup|i>*<pdv|f|<value|xii>><label|eq:gradient.transform.noncons>
  </equation>

  The transformation of gradient<nbsp><eqref|eq:gradient.transform.noncons>,
  and the following identities from Chapter 6 in<nbsp><cite|kopriva2009> will
  be useful in proving the equivalence

  <\equation>
    <ud><bx>=J*<ud><vxi>,<space|2em><with|font-series|bold|<value|bn>><rsub|R,i>=<frac|<ba><rsup|i>|<around*|\<\|\|\>|<ba><rsup|i>|\<\|\|\>>>,<space|2em><value|bn><rsub|L,i>=-<frac|<ba><rsup|i>|<around*|\<\|\|\>|<ba><rsup|i>|\<\|\|\>>>,<space|2em><ud>S<rsub|<bx>><rsup|i>=<around*|\<\|\|\>|J*<ba><rsup|i>|\<\|\|\>>*<ud>S<rsub|<vxi>><label|eq:kopriva.identities>
  </equation>

  Using these identities to perform a change of coordinates from
  <math|\<Omega\><rsub|e>> to <math|<value|Oo>>

  <\eqnarray*>
    <tformat|<cwith|1|1|2|2|cell-halign|l>|<table|<row|<cell|>|<cell|<big|int><rsub|<value|Oo>><pdv|<value|uu><rsub|e><rsup|\<delta\>>|t>*\<varphi\><around*|(|<vxi>|)>*J*<ud><vxi>-<big|int><rsub|<value|Oo>><value|pf><rsub|e><rsup|\<delta\>>\<cdot\><around*|(|<big|sum><rsub|i=1><rsup|d><ba><rsup|i>*<pdv|\<varphi\>|\<xi\><rsup|i>>|)>*J*<ud><vxi>>|<cell|<label|eq:dg.physical><eq-number>>>|<row|<cell|>|<cell|<space|2em>+<big|sum><rsub|i=1><rsup|d><big|int><rsub|<value|Oim>><around*|(|<value|pf><rsub|e><rsup|\<delta\>>\<cdot\><value|bn><rsub|L,i>|)><rsup|\<ast\>>*\<varphi\>*<around*|\<\|\|\>|J*<ba><rsup|i>|\<\|\|\>>*<ud>S<rsub|<vxi>>+<big|int><rsub|<value|Oip>><around*|(|<value|pf><rsub|e><rsup|\<delta\>>\<cdot\><value|bn><rsub|R,i>|)><rsup|\<ast\>>*\<varphi\>*<around*|\<\|\|\>|J*<ba><rsup|i>|\<\|\|\>>*<ud>S<rsub|<vxi>>=<value|bzero>>|<cell|>>>>
  </eqnarray*>

  The volume term can be seen as

  <\equation*>
    <value|pf>\<cdot\><around*|(|<big|sum><rsub|i=1><rsup|d><ba><rsup|i>*<pdv|\<varphi\>|<value|xii>>|)>*J=<big|sum><rsub|i=1><rsup|d><around*|(|J*<ba><rsup|i>\<cdot\><value|pf>|)>*<around*|(|\<nabla\><rsub|<vxi>>
    \<varphi\>|)><rsub|i>=<value|tf>\<cdot\><around*|(|\<nabla\><rsub|<vxi>>
    \<varphi\>|)>
  </equation*>

  Thus, the volume terms in<nbsp>(<reference|eq:dg.scheme>,<nbsp><reference|eq:dg.physical>)
  match. For the surface term, we have to match numerical flux in reference
  coordinates<nbsp><eqref|eq:dg.rusanov> with the numerical flux computed in
  physical coordinates which is given by

  <\equation>
    <around*|(|<value|pf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|\<ast\>>=<frac|1|2>*<around*|(|<around*|(|<value|pf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|+>+<around*|(|<value|pf><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)><rsup|->|)>-<frac|\<lambda\><rsub|s,i>|2>*<around*|(|<value|uu><rsup|+><rsub|s,i>-<value|uu><rsup|-><rsub|s,i>|)><label|eq:rusanov.flux.physical>
  </equation>

  For the central part, we need to prove

  <\equation*>
    <value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|s,i>=<around*|(|<value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bn><rsub|s,i>|)>*<around*|\<\|\|\>|J*<ba><rsup|i>|\<\|\|\>>
  </equation*>

  By using the expression for contravariant
  flux<nbsp><eqref|eq:curved.contravariant.flux.defn> and expression of
  <math|<value|bn><rsub|s,i>> from<nbsp><eqref|eq:kopriva.identities>

  <\equation*>
    <value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|R,i>=<value|pf>\<cdot\>J*<ba><rsup|i>=<around*|\<\|\|\>|J*<ba><rsup|i>|\<\|\|\>>*<around*|(|<value|pf>\<cdot\><value|bn><rsub|R,i>|)>
  </equation*>

  and similarly for side <math|s=L>. Thus,

  <\equation*>
    <value|tf><rsub|e><rsup|\<delta\>>\<cdot\><value|bnr><rsub|s,i>=<around*|(|<value|pf><rsub|e>\<cdot\><value|bn><rsub|s,i>|)>*<around*|\<\|\|\>|J*<ba><rsup|i>|\<\|\|\>>
  </equation*>

  The dissipative parts of numerical fluxes are going to be same because wave
  speed estimates will the same for both, using the physical normal as
  in<nbsp><eqref|eq:wave.speed.dg>. Thus, we get our claim that the two
  formulations are equivalent. In <verbatim|Trixi.jl><nbsp><cite|Ranocha2022>,
  while the volume terms are computed using the contravariant flux, the
  numerical flux is actually computed using the physical flux as
  in<nbsp><eqref|eq:rusanov.flux.physical>. This simplifies implementation as
  the contravariant flux changes with the reference map while the normal is
  continuous for a well-constructed mesh<nbsp><eqref|defn:curved.well.constructed.mesh>.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|ch.num:godnnov.explicit|<tuple|1|?>>
    <associate|eq:dg.physical|<tuple|4|1>>
    <associate|eq:gradient.transform.noncons|<tuple|3|1>>
    <associate|eq:kopriva.identities|<tuple|4|1>>
    <associate|eq:rusanov.flux.physical|<tuple|6|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      kopriva2009

      Ranocha2022
    </associate>
  </collection>
</auxiliary>