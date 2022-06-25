<TeXmacs|2.1>

<style|<tuple|beamer|old-lengths|boring-white>>

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

    <assign|dv*|<\macro|degree|num|den>
      <frac|<math|d<rsup|<arg|degree>><arg|num>>|d
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
  </hide-preamble>

  <screens|<\hidden>
    <unroll-greyed|<\shown>
      <\tit>
        Thesis Committee (TC) meeting
      </tit>
    </shown>|<\shown>
      1. MUSCL-Hancock reconstruction in blending limiter, extending proof of
      admissibility of MUSCL-Hancock method by Berthon for general Finite
      volume grids used by Gassner Et Al
    </shown>|<\hidden*>
      2. Extension of Zhang-Shu's limiter to Lax-Wendroff schemes to obtain a
      provably admissibility preserving Lax-Wendroff scheme
    </hidden*>|<\hidden*>
      3. Formal comparison of Lax-Wendroff and ADER schemes - equivalence for
      linear case and <with|font-shape|italic|closeness> for non-linear case
    </hidden*>|<\hidden*>
      4. Mild instabilities in LW and RK schemes

      <with|font-series|bold|If prepared in time>

      <\enumerate>
        <item>Aposteriori limiter

        <item>Hierarchical limiter to show that admissibility preserving
        Lax-Wendroff can be extended to any other limiter.

        <item>Over-dissipation in RK schemes and convergence issues in RK
        schemes, shown in Figure 12 and 6 of Overleaf
      </enumerate>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Review of Flux Reconstruction (FR) by Huynh <cite|Huynh2007>>

    <unroll-phantoms|<\shown>
      <\equation*>
        <large|u<rsub|t>+f<around*|(|u|)><rsub|x>=0>
      </equation*>
    </shown>|<\shown>
      <with|gr-mode|<tuple|edit|document-at>|gr-frame|<tuple|scale|1cm|<tuple|0.629993gw|0.499999gh>>|gr-geometry|<tuple|geometry|1par|0.265195par|center>|gr-color|blue|gr-point-size|2ln|<graphics||<line|<point|-10.8254|-0.173849>|<point|-8.76160867839661|-0.173849054107686>>|<with|arrow-end|\<gtr\>|<spline|<point|-9.2167|0.19657>|<point|-3.96732372006879|1.17024407990475>|<point|1.55721656303744|0.196570313533536>>>|<line|<point|-0.0514618|-0.110349>|<point|4.28773647307845|-0.173849054107686>>|<text-at|<tiny|<math|x<rsub|e-<frac|1|2>>>>|<point|-11.1058995898928|-0.51253424130176>>|<text-at|<tiny|<math|x<rsub|e+<frac|1|2>>>>|<point|-8.79869908056621|-0.576019451779336>>|<text-at|<tiny|<math|0>>|<point|-0.247288925783834|-0.459601041275301>>|<text-at|<math|<tiny|1>>|<point|4.27182253604974|-0.53368532530758>>|<text-at|<math|<tiny|x\<mapsto\>\<xi\><rsub|e><around*|(|x|)>>>|<point|-4.51242|1.43999>>|<with|arrow-end|\<gtr\>|<spline|<point|1.79529|-0.814278>|<point|-4.03616549808176|-2.23245468977378>|<point|-9.27495369757905|-1.00477907130573>>>|<text-at|<tiny|<math|\<xi\>\<mapsto\>x<rsub|e><around*|(|\<xi\>|)>>>|<point|-4.523|-1.71387>>|<text-at|<large|<math|<small|I<rsub|e>>>>|<point|-10.0264|0.210064>>|<with|color|blue|point-size|2ln|<point|-10.3948|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.78272|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.19266|-0.173849>>|<with|color|blue|point-size|2ln|<point|0.813427|-0.123006>>|<with|color|blue|point-size|2ln|<point|2.22103|-0.152302>>|<with|color|blue|point-size|2ln|<point|3.47767|-0.161994>>|<with|color|blue|<text-at|<math|<tabular*|<tformat|<table|<row|<cell|x<rsub|e,j>\<mapsto\>\<xi\><rsub|j>>>>>>>|<point|-4.71350377033999|-0.247288001058341>>>|<with|color|blue|<text-at|<math|r=r<around*|(|x|)>>|<point|-13.7412|1.24497>>>|<with|color|blue|<text-at|<math|<wide|r|^>=<wide|r|^><around*|(|\<xi\>|)>>|<point|5.90165696520704|1.19205582749041>>>|<with|color|blue|<\document-at>
        \;
      </document-at|<point|-11.8933|5.4261>>>|<with|color|blue|<\document-at>
        \;
      </document-at|<point|-11.0084998015611|-5.00388609604445>>>|<with|color|blue|<\document-at>
        <math|N+1> <with|color|black|solution points where >

        <math|N> <with|color|black|is the degree of numerical solution
        <math|u<rsub|h>>>

        <with|color|black| within each cell>
      </document-at|<point|-14.3566|-1.66788>>>|<with|color|blue|<\document-at>
        <math|<pdv|r|x>=<frac|1|\<mathLaplace\>x<rsub|e>><pdv|<wide|r|^>|\<xi\>>>
      </document-at|<point|5.17882656436037|-1.3636724434449>>>|<text-at|<math|<small|I>>|<point|1.96146977113375|0.104246593464744>>>>
    </shown>|<\shown>
      <\equation*>
        <large|<tabular*|<tformat|<table|<row|<cell|<dv|<wide|u|^><rsub|j>|t>+<frac|1|\<mathLaplace\>x<rsub|e>>*<pdv|<wide|f|^><rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>=0,>>|<row|<cell|<wide|f|^><rsub|h>=<wide|f|^><rsub|h><rsup|\<delta\>>+<with|color|white|<with|color|black|<around*|(|<with|color|black|<with|color|black|f<rsub|e-<frac|1|2>>>>-<wide|f|^><rsub|h><around*|(|0|)>|)>>>*g<rsub|L><with|color|black|+><with|color|black|<with|color|white|<with|color|black|<around*|(|<with|color|black|f<rsub|e+<frac|1|2>>>-<wide|f|^><rsub|h><around*|(|1|)>|)>>>>*g<rsub|R><around*|(|\<xi\><rsub|j>|)>=0,>>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|u - Numerical solution of degree
        N,<space|2em>f<rsub|h><rsup|\<delta\>>-Discontinuous flux polynomial
        of degree N,>>|<row|<cell|f<rsub|e+<frac|1|2>> - Numerical flux
        function,>>|<row|<cell|>>|<row|<cell|g<rsub|L>,g<rsub|R>-corrector
        functions of degree N+1 satisfying
        >>|<row|<cell|g<rsub|L><around*|(|0|)>=1,<space|1em>g<rsub|L><around*|(|1|)>=0,>>|<row|<cell|g<rsub|R><around*|(|0|)>=0,<space|1em>g<rsub|R><around*|(|1|)>=1.>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Review of Lax-Wendroff Flux Reconstruction (LWFR)>

    <unroll|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<large|u<rsup|n+1>=u<rsup|n>-\<mathLaplace\>t*F<rsup|n><rsub|x>>,>>|<row|<cell|>>|<row|<cell|<text|where
        >F=f<around*|(|u|)>+<frac|\<mathLaplace\>t|2><around*|(|f<around*|(|u|)>|)><rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>f<around*|(|u|)><rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N||t>f<around*|(|u|)>>>>>>
      </equation*>
    </shown>|<\shown>
      To compute <math|F>, we use the approximate Lax-Wendroff procedure
      proposed by Zorio Et Al. <cite|zorio_approximate_2017>

      <\equation*>
        <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|f<around*|(|u|)><rsub|t>>|<cell|\<approx\>>|<cell|<frac|f<around*|(|u<around*|(|x,t+\<mathLaplace\>t|)>|)>-f<around*|(|u<around*|(|x,t-\<mathLaplace\>t|)>|)>|2\<mathLaplace\>t>+\<cal-O\><around*|(|\<mathLaplace\>t<rsup|2>|)>>>|<row|<cell|>|<cell|\<approx\>>|<cell|<frac|f<around*|(|u+\<mathLaplace\>t*<with|color|blue|u<rsub|t>>|)>-f<around*|(|u-\<mathLaplace\>t*<with|color|blue|u<rsub|t>>|)>|2\<mathLaplace\>t>+\<cal-O\><around*|(|\<mathLaplace\>t<rsup|2>|)>,>>>>>
      </equation*>

      and<with|color|blue| <with|color|blue|<with|color|blue|<math|<with|color|blue|u<rsub|t>=-f<around*|(|u|)><rsub|x>>>>>>.
    </shown>|<\shown>
      This will give us a discontinuous flux polynomial
      <math|F<rsub|h><rsup|\<delta\>>> which we will correct with Flux
      Reconstruction (FR) using numerical flux <math|F<rsub|e+<frac|1|2>>>.
    </shown>|<\shown>
      In the past works, <math|F<rsub|e+<frac|1|2>>> has been computed as

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|F<rsub|e+<frac|1|2>>=<around*|(|F<rsub|L>,F<rsub|R>,u<rsub|L>,u<rsub|R>|)>,>>|<row|<cell|u<rsub|L>=u<rsub|h><around*|(|x<rsub|e+1/2><rsup|->|)>,<space|2em>u<rsub|R>=u<rsub|h><around*|(|x<rsub|e+1/2><rsup|+>|)>.>>>>>
      </equation*>
    </shown>|<\shown>
      In <with|color|red|cite>, we propose <with|font-series|bold|Dissipation
      2> flux

      <\equation*>
        u<rsub|L>=U<rsub|h><around*|(|x<rsub|e+1/2><rsup|->|)>,<space|2em>u<rsub|R>=U<rsub|h><around*|(|x<rsub|e+1/2><rsup|+>|)>,
      </equation*>

      where

      <\equation*>
        U=u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>\<approx\><frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>u
        d t.
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Conservation property of LWFR>

    <unroll|<\shown>
      <\equation*>
        <around*|(|u<rsup|e><rsub|j>|)><rsup|n+1>=<around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<pdv|F<rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </shown>|<\shown>
      For <math|<around*|{|w<rsub|j>|}><rsub|j=1><rsup|N+1>> being the
      quadrature weights associated to solution points,

      <\equation*>
        <big|sum><rsub|j=1><rsup|N+1>w<rsub|j><around*|(|u<rsup|e><rsub|j>|)><rsup|n+1>=<big|sum><rsub|j=1><rsup|N+1><around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<pdv|F<rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>,
      </equation*>
    </shown>|<\shown>
      <\equation*>
        \<Rightarrow\><wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|]><space|2em><with|color|red|<around*|(|Conservation|)>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Blending limiter>

    <unroll-compressed|<\shown>
      Here we apply the approach of Gassner Et Al. <cite|HENNEMANN2021109935>
      to the LWFR scheme. The update for a <with|color|red|high order> LWFR
      method can be written as

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|H,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|H>.
      </equation*>
    </shown>|<\shown>
      The update for a lower order subcell method (like FO FVM or
      MUSCL-Hancock method) is given by

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|L,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|L>.
      </equation*>
    </shown>|<\shown>
      Then, defining the <with|color|blue|blended> residual

      <\equation*>
        <with|font-series|bold|R><rsub|e>=\<alpha\><rsub|e>*<with|font-series|bold|R><rsub|e><rsup|H>+<around*|(|1-\<alpha\><rsub|e>|)>*<with|font-series|bold|R><rsub|e><rsup|L>,<rsub|>
      </equation*>

      the <with|color|red|limited> update is performed as

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e>
      </equation*>
    </shown>>
  </hidden>|<\shown>
    <tit|Choice of <math|\<alpha\><rsub|e>> : Smoothness indicator>

    <unroll|<\shown>
      We compute <math|\<alpha\><rsub|e>> as proposed by Gassner Et Al.
      <cite|HENNEMANN2021109935>. For a degree <math|N> polynomial
      <math|\<epsilon\>=\<epsilon\><around*|(|\<xi\>|)>>, we can perform an
      expansion in the orthonormal Legendre basis

      <\equation*>
        \<epsilon\>=<big|sum><rsub|j=1><rsup|N+1>m<rsub|j>L<rsub|j>,<space|2em>m<rsub|j>=<around*|\<langle\>|\<epsilon\>,L<rsub|j>|\<rangle\>><rsub|L<rsup|2>>
      </equation*>

      and define the energy content to be

      <\equation*>
        \<bbb-E\>=max<around*|(|<frac|m<rsub|N+1><rsup|2>|\<beta\><rsub|1>m<rsub|1>+<big|sum><rsub|j=2><rsup|N+1>m<rsub|j><rsup|2>>,<frac|m<rsub|N><rsup|2>|\<beta\><rsub|2>m<rsub|1>+<big|sum><rsub|j=2><rsup|N>m<rsub|j><rsup|2>>|)>.
      </equation*>
    </shown>|<\shown>
      This smoothness indicator was first proposed by Persson and Peraire
      <cite|Persson2006>. In the literature, the choice of
      <math|\<beta\><rsub|1>=\<beta\><rsub|2>=1> has been made. So far, our
      experiments reveal that the optimal choice of <math|\<beta\><rsub|i>>'s
      is problem dependent.
    </shown>|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|2|2|cell-valign|c>|<table|<row|<\cell>
          <image|figures/alpha_func.pdf|0.4499999par|||>
        </cell>|<\cell>
          <\equation*>
            \<alpha\><around*|(|\<bbb-E\>|)>=<frac|1|1+exp<around*|(|-<frac|s|\<bbb-T\>><around*|(|\<bbb-E\>-\<bbb-T\>|)>|)>>
          </equation*>

          where

          <\equation*>
            \<bbb-T\><around*|(|N|)>=0.5\<cdot\>10<rsup|-1.8*<around*|(|N+1|)><rsup|1/4>>,<space|2em>\<alpha\><around*|(|\<bbb-E\>=0|)>=0.0001
          </equation*>

          <\equation*>
            <tabular*|<tformat|<table|<row|<cell|<wide|\<alpha\>|~>=<choice|<tformat|<table|<row|<cell|0,>|<cell|<space|1em>>|<cell|if
            \<alpha\>\<less\>\<alpha\><rsub|min>>>|<row|<cell|\<alpha\>,>|<cell|>|<cell|if
            \<alpha\><rsub|min>\<leq\>\<alpha\>\<leq\>1-\<alpha\><rsub|min>>>|<row|<cell|1,>|<cell|>|<cell|if
            1-\<alpha\><rsub|min>\<less\>\<alpha\>>>>>>>>|<row|<cell|\<alpha\><rsup|final>=max<rsub|e\<in\>V<rsub|e>><around*|{|\<alpha\>,0.5*\<alpha\><rsub|e>|}>>>>>>
          </equation*>
        </cell>>>>
      </wide-tabular>
    </shown>>
  </shown>|<\hidden>
    <tit|Lower order update>

    <unroll|<\shown>
      <center|<image|figures/subcells.pdf|0.381par|||>>
    </shown>|<\shown>
      In the physical cell <math|I<rsub|e>=<around*|[|x<rsub|e-<frac|1|2>>,x<rsub|e+<frac|1|2>>|]>>,
      we define subcells <math|<around*|{|<around*|[|x<rsub|j-<frac|1|2>><rsup|e>,x<rsup|e><rsub|j+<frac|1|2>>|]>|}><rsub|j:1><rsup|N+1>>
      with (sub)faces <math|x<rsup|e><rsub|j+<frac|1|2>>> defined as

      <\equation*>
        x<rsub|j+<frac|1|2>><rsup|e>=x<rsub|e-<frac|1|2>>+\<mathLaplace\>x<rsub|e><big|sum><rsub|1\<leq\>k\<leq\>j>w<rsub|k>,<space|2em>0\<leq\>j\<leq\>N+1,
      </equation*>

      where <math|<around*|{|w<rsub|j>|}><rsub|j:1><rsup|N+1>> are the
      Gauss-Legendre quadrature weights.
    </shown>|<\shown>
      With this, we can define the lower order update in subcells to be

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<around*|(|u<rsub|1><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|1><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|0>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|<frac|3|2>>-F<rsub|e-<frac|1|2>><rsup|L>|]>,>>|<row|<cell|<around*|(|u<rsub|j><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|j>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|j+<frac|1|2>>-f<rsub|j-<frac|1|2>>|]>,<space|2em>2\<leq\>j\<leq\>N,>>|<row|<cell|<around*|(|u<rsub|N><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|N><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|N+1>*\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>><rsup|L>-f<rsub|N-<frac|1|2>>|]>.>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Subcells justified>

    <unroll|<\shown>
      <\equation*>
        <big|sum><rsub|j:1><rsup|N+1>u<rsub|j><rsup|L,n+1>w<rsub|j>=<big|sum><rsub|j:1><rsup|N+1>u<rsub|j><rsup|e>w<rsub|j>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around|(|F<rsub|e+1/2><rsup|L>-F<rsub|e-1/2><rsup|L>|)>.
      </equation*>
    </shown>|<\shown>
      That is,

      <\equation*>
        <large|<wide|u|\<wide-bar\>><rsub|e><rsup|L,n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|L,n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around|(|F<rsub|e+1/2><rsup|L>-F<rsub|e-1/2><rsup|L>|)>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Interface numerical flux>

    <unroll|<\shown>
      For LWFR, high order numerical flux <math|F<rsub|e+<frac|1|2>><rsup|H>>
      is computed by time averaging and satisfies the conservation property

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|H,n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<around*|(|F<rsub|e+<frac|1|2>><rsup|H>-F<rsub|e-<frac|1|2>><rsup|H>|)>
      </equation*>
    </shown>|<\shown>
      The same is true for the lower order method

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|L,n+1>=<around*|(|<wide|u|\<wide-bar\>><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<around*|(|F<rsub|e+<frac|1|2>><rsup|L>-F<rsub|e-<frac|1|2>><rsup|L>|)>.
      </equation*>
    </shown>|<\shown>
      Thus, the blended update is given by
    </shown>|<\shown>
      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-\<mathLaplace\>t*<around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>,
      </equation*>

      <\equation*>
        where<space|1em> F<rsub|e+<frac|1|2>>=\<alpha\><rsub|e>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e>|)>*F<rsub|e+<frac|1|2>><rsup|H>.
      </equation*>
    </shown>|<\shown>
      For conservation, we must have

      <\equation*>
        \<alpha\><rsub|e>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e>|)>*F<rsub|e+<frac|1|2>><rsup|H>=\<alpha\><rsub|e+1>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e+1>|)>*F<rsub|e+<frac|1|2>><rsup|H>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <with|color|red|\<Rightarrow\>F<rsub|e+<frac|1|2>><rsup|L>=F<rsub|e+<frac|1|2>><rsup|H>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Interface numerical flux>

    <unroll|<\shown>
      Initial candidate for the interface flux :

      <\equation*>
        <wide|F|~><rsub|e+<frac|1|2>>=<around*|(|1-\<alpha\><rsub|e+<frac|1|2>>|)>*F<rsub|e+<frac|1|2>><rsup|LW>+\<alpha\><rsub|e+<frac|1|2>>*f<rsub|e,N+3/2>,<space|2em>\<alpha\><rsub|e+<frac|1|2>>=<frac|1|2><around*|(|\<alpha\><rsub|e>+\<alpha\><rsub|e+1>|)>.
      </equation*>
    </shown>|<\shown>
      Then the lower order update of last solution point would be

      <\equation*>
        <wide|u|~><rsup|n+1>=u<rsub|e,N+1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|N+1>><around*|(|<wide|F|~><rsub|e+<frac|1|2>>-f<rsub|e,N+1/2>|)>.
      </equation*>
    </shown>|<\shown>
      Assume there is a <with|font-series|bold|concave> <math|p> such that
      the admissibility condition <math|<with|font-series|bold|u>\<in\>\<Omega\>>
      is equivalent to

      <\equation*>
        p<around*|(|<with|font-series|bold|u>|)>\<gtr\>0.
      </equation*>
    </shown>|<\shown>
      Our lower order method is chosen so that

      <\equation*>
        <wide|u|~><rsub|low><rsup|n+1>=u<rsub|e,N+1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|N+1>><around*|(|f<rsub|e,N+3/2>-f<rsub|e,N+1/2>|)>\<in\>\<Omega\>.
      </equation*>
    </shown>|<\shown>
      Thus, for

      <\equation*>
        \<theta\>=min<around*|(|\<theta\><rsub|+>,\<theta\><rsub|->|)><space|1em>where<space|1em>\<theta\><rsub|\<pm\>>=min<around*|(|<around*|\||<frac|\<epsilon\>-p<around*|(|<bw><rsub|i><rsup|n>|)>|p<around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>-p<around*|(|<bw><rsub|i><rsup|n>|)>>|\|>,1|)>,
      </equation*>

      we will have

      <\equation*>
        p<around*|(|\<theta\>*<wide|u|~><rsup|n+1>+<around*|(|1-\<theta\>|)>*u<rsub|low><rsup|n+1>|)>\<gtr\>\<epsilon\>.
      </equation*>
    </shown>|<\shown>
      Finally choose

      <\equation*>
        F<rsub|e+<frac|1|2>>=\<theta\>*<wide|F|~><rsub|e+<frac|1|2>>+<around*|(|1-\<theta\>|)>f<rsub|e,N+3/2>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Extension of Zhang-Shu's limiter to Lax-Wendroff schemes>

    <unroll|<\shown>
      Recall that the lower order update looks like

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<around*|(|<wide|u|~><rsub|1><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|1><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|0>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|<frac|3|2>>-F<rsub|e-<frac|1|2>>|]>,>>|<row|<cell|<around*|(|<wide|u|~><rsub|j><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|j>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|j+<frac|1|2>>-f<rsub|j-<frac|1|2>>|]>,<space|2em>2\<leq\>j\<leq\>N,>>|<row|<cell|<around*|(|<wide|u|~><rsub|N><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|N><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|N+1>*\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-f<rsub|N-<frac|1|2>>|]>.>>>>>
      </equation*>
    </shown>|<\shown>
      With our choice of <math|F<rsub|e\<pm\><frac|1|2>>>, we have

      <\equation*>
        <wide|u|~><rsup|e><rsub|j>\<in\>\<Omega\>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </shown>|<\shown>
      This gives us

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>=<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<wide|u|~><rsub|j><rsup|n+1>\<in\>\<Omega\>.
      </equation*>
    </shown>|<\shown>
      Thus, the cell averages preserve admissibility and we can now use
      Zhang-Shu's admissibility preserving limiter to obtain an admissibility
      preserving Lax-Wendroff scheme.
    </shown>|<\shown>
      The approach of preserving admissibility of cell averages and using
      Zhang-Shu's limiter has also been explored by Rossmanith Et Al.
      <cite|Felton2018-ip>. The strength of our proposed approach over theirs
      is that we don't require additional cell/face loops and there are very
      little (and optional) additional storage requirements.
    </shown>|<\shown>
      Now that our lower order method is admissibility preserving, we can
      also aposteriorily modify <math|\<alpha\><rsub|e>> to ensure that the
      blended scheme is admissibility preserving. This approach has been
      explored by Gassner and Ramírez in <cite|Rueda-Ramirez2021-ib>.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Admissibility preservation in 2-D>

    <unroll|<\shown>
      <\equation*>
        Initial candidate:<tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,j>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>>|)>*F<rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,j><rsup|LW>+\<alpha\><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>>*f<rsub|<with|font-series|bold|e>,N+<frac|3|2>,j>,>|<cell|<space|1em>>|<cell|1\<leq\>j\<leq\>N+1,>>|<row|<cell|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,i>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>>|)>*F<rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,i><rsup|LW>+\<alpha\><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>>*f<rsub|<with|font-series|bold|e>,i,N+<frac|3|2>>,>|<cell|>|<cell|1\<leq\>i\<leq\>N+1.>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<wide|u|~><rsup|n+1>>|<cell|=>|<cell|u<rsub|<with|font-series|bold|e>,1,j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|<with|font-series|bold|e>>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,j>-f<rsub|<with|font-series|bold|e>,<frac|1|2>,j>|)>-<frac|\<mathLaplace\>t|\<mathLaplace\>y<rsub|e>w<rsub|j>><around*|(|f<rsub|<with|font-series|bold|e>,1,j+<frac|1|2>>-f<rsub|<with|font-series|bold|e>,1,j-<frac|1|2>><rsub|>|)>,>|<cell|1\<less\>j\<less\>N+1,>>|<row|<cell|<wide|u|~><rsup|n+1>>|<cell|=>|<cell|u<rsub|<with|font-series|bold|e>,1,1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|<with|font-series|bold|e>>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>-f<rsub|<with|font-series|bold|e>,<frac|1|2>,1>|)>-<frac|\<mathLaplace\>t|\<mathLaplace\>y<rsub|e>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>-f<rsub|<with|font-series|bold|e>,1,<frac|1|2>><rsub|>|)>.>|<cell|>>>>>
      </equation*>
    </shown>|<\shown>
      In the 2-D code, there's two separate face loops for vertical and
      horizontal faces. This poses a challenge because to ensure
      <math|<wide|u|~><rsup|n+1>> is admissible, we need to correct both
      <math|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>> and
      <math|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>> and these
      values are never available together.
    </shown>|<\shown>
      To avoid having to store values and doing aposteriori correction, we
      find appropriate <math|\<lambda\><rsub|1>,\<lambda\><rsub|2>> such that

      <\equation*>
        \<lambda\><rsub|1>+\<lambda\><rsub|2>=1,
      </equation*>

      and then, following the 1-D procedure, construct corrected
      <math|F<rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>> and
      <math|F<rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>> such that
    </shown>|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-valign|t>|<table|<row|<\cell>
          <center|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|1.05995gw|0.210026gh>>|gr-geometry|<tuple|geometry|0.286093par|0.202901par|center>|gr-color|<pattern|X/TeXmacs/misc/patterns/vintage/granite-dark.png|1gu|>|<graphics||<cline|<point|-6.77838|3.62184>|<point|-6.7711998941659|-0.820644265114433>|<point|-0.85745468977378|-0.842174890858579>|<point|-0.886162190765974|3.6074877629316>>|<point|-6.26164|-0.490508>|<point|-6.276|0.0334039>|<point|-6.28317|0.600377>|<with|color|red|<carc|<point|-6.55589|-0.260848>|<point|-5.98174361688054|-0.662753009657362>|<point|-6.20124830760045|-0.822719331570375>>>|<with|color|<pattern|X/TeXmacs/misc/patterns/vintage/granite-dark.png|1gu|>|<text-at|<math|<small|i=1,j=1>>|<point|-5.7207633284826|-0.572942849583278>>>>>>
        </cell>|<\cell>
          <unroll-phantoms|<\shown>
            <\equation*>
              <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|u<rsub|<with|font-series|bold|e>,1,1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|<with|font-series|bold|e>>\<lambda\><rsub|1>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>-f<rsub|<with|font-series|bold|e>,<frac|1|2>,1>|)>\<in\>\<Omega\>,>>|<row|<cell|u<rsub|<with|font-series|bold|e>,1,1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>y<rsub|e>\<lambda\><rsub|2>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>-f<rsub|<with|font-series|bold|e>,1,<frac|1|2>><rsub|>|)>\<in\>\<Omega\>.>>>>>
            </equation*>
          </shown>|<\shown>
            <\equation*>
              \<lambda\><rsub|1>=<frac|<around*|\||s<rsub|x><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>x<rsub|<with|font-series|bold|e>>|<around*|\||s<rsub|x><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>x<rsub|<with|font-series|bold|e>>+<around*|\||s<rsub|y><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>y<rsub|<with|font-series|bold|e>>>,<space|2em>\<lambda\><rsub|2>=<frac|<around*|\||s<rsub|y><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>y<rsub|<with|font-series|bold|e>>|<around*|\||s<rsub|x><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>x<rsub|<with|font-series|bold|e>>+<around*|\||s<rsub|y><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>y<rsub|<with|font-series|bold|e>>>
            </equation*>
          </shown>>

          \;

          \;
        </cell>>>>
      </wide-tabular>
    </shown>>
  </hidden>|<\hidden>
    <tit|Low order residual : MUSCL-Hancock>

    <unroll|<\shown>
      <center|<image|figures/subcells.pdf|0.4par|||>>
    </shown>|<\shown>
      Integrating the conservation law over the subcell
      <math|I<rsup|e><rsub|j>>, we get

      <\equation*>
        \<mathLaplace\>x<rsub|e>*w<rsub|j>*<around*|(|u<rsub|j><rsup|n+1>-u<rsub|j><rsup|n>|)>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<rsub|j+1/2>-f<rsub|j-1/2>|)>*d\<nocomma\>t=0.
      </equation*>
    </shown>|<\shown>
      Using the mid-point rule, writing explicit update,

      <\equation*>
        u<rsub|j><rsup|n+1>=u<rsub|j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|j>>*<around*|(|f<rsub|j+1/2><rsup|n+1/2>-f<rsub|j-1/2><rsup|n+1/2>|)>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        f<rsub|j+1/2><rsup|n+1/2>=f<around*|(|u<rsub|j+1/2,-><rsup|n+1/2>,u<rsub|j+1/2,+><rsup|n+1/2>|)>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|u<rsub|j-1/2<rsup|+>>=u<rsub|j><around*|(|x<rsub|j-1/2>|)>,<space|1em>u<rsub|j+1/2<rsup|->>=u<rsub|j><around*|(|x<rsub|j+1/2>|)>>>|<row|<cell|u<rsub|j><around*|(|x|)>=u<rsub|j><rsup|n>+\<delta\><rsub|j>*<around*|(|x-x<rsub|j>|)>>>|<row|<cell|\<delta\><rsub|j>=minmod<around*|(|\<beta\><rsub|j>*<frac|u<rsub|j+1>-u<rsub|j>|x<rsub|j+1>-x<rsub|j>>,D<rsub|cent><around*|(|u|)><rsub|j>,\<beta\><rsub|j><frac|u<rsub|j><rsup|n>-u<rsub|j-1><rsup|n>|x<rsub|j>-x<rsub|j-1>>|)>>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        u<rsub|j-<frac|1|2>,+><rsup|n+1/2>=u<rsub|j-1/2><rsup|n>-<frac|\<mathLaplace\>t|2><frac|f<around*|(|u<rsub|j+1/2>|)>-f<around*|(|u<rsub|j-1/2>|)>|x<rsub|j+1/2>-x<rsub|j-1/2>>,<space|1em>u<rsub|j+<frac|1|2>,-><rsup|n+1/2>=u<rsub|j+1/2><rsup|n>-<frac|\<mathLaplace\>t|2><frac|f<around*|(|u<rsub|j+1/2>|)>-f<around*|(|u<rsub|j-1/2>|)>|x<rsub|j+1/2>-x<rsub|j-1/2>>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Admissibility of low order method>

    <\theorem>
      <with|font-shape|italic|<math|(>Extension of Berthon
      <math|<cite|Berthon2006>><math|)>> Consider the conservation law

      <\equation*>
        <with|font-series|bold|w><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|w>|)><rsub|x>=0
      </equation*>

      which preserves a convex set <math|\<Omega\>>. Let
      <math|<around*|{|<with|font-series|bold|w><rsub|i><rsup|n>|}><rsub|i\<in\>\<bbb-Z\>>>
      be the approximate solution at time level <math|n> and assume that
      <math|<with|font-series|bold|w><rsup|n><rsub|i>\<in\>\<Omega\>> for all
      <math|i\<in\>\<bbb-Z\>>. Consider <with|color|red|conservative
      reconstructions>

      <\equation*>
        <bw><rsub|i><rsup|n,+>=<bw><rsub|i>+<around*|(|x<rsub|i+1/2>-x<rsub|i>|)>\<sigma\><rsub|i>,<space|1em><bw><rsub|i><rsup|n,->=<bw><rsub|i>+<around*|(|x<rsub|i-1/2>-x<rsub|i>|)>\<sigma\><rsub|i>.
      </equation*>

      Define <math|<with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<pm\>>>
      satisfying

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|1>*<bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+\<lambda\><rsub|2>*<bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>,>>>>>
      </equation*>

      where

      <\equation*>
        \<lambda\><rsub|1>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em>\<lambda\><rsub|2>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
      </equation*>

      Assume that the slope <math|\<sigma\><rsub|i>> is chosen so that

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\>.
      </equation*>

      Then, under <with|color|blue|appropriate> time step restrictions, the
      updated solution <math|<with|font-series|bold|w><rsub|i><rsup|n+1>>,
      defined by the MUSCL-Hancock procedure is in <math|\<Omega\>>.
    </theorem>

    \;

    <center|<with|gr-mode|<tuple|edit|point>|gr-frame|<tuple|scale|1cm|<tuple|0.549995gw|0.80997gh>>|gr-geometry|<tuple|geometry|0.780009par|0.0933373par|center>|gr-point-style|plus|gr-point-size|5ln|gr-point-border|2ln|<graphics||<line|<point|-5.57623|-0.20426>|<point|4.43735943907924|-0.229957666357984>>|<line|<point|-5.56767|-0.43554>|<point|-5.57623362878688|-0.0072430215636989>>|<line|<point|4.42023|-0.5212>|<point|4.40309564757243|-0.0243749173171054>>|<math-at|x<rsub|i-<frac|1|2>>|<point|-5.80475261277947|-0.874950390263262>>|<math-at|x<rsub|i+<frac|1|2>>|<point|3.96340455086652|-0.827589628257706>>|<math-at|x<rsub|i>|<point|-2.9512667019447|-0.839429818759095>>|<with|point-style|plus|point-border|2ln|point-size|5ln|<point|-2.72974|-0.211565>>>>>
  </hidden>|<\hidden>
    <tit|Generalizing Berthon's proof>

    <unroll|<\shown>
      Berthon defined <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> to be the
      quantity satisfying

      <\equation*>
        <frac|1|2><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|1|2><bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>.
      </equation*>
    </shown>|<\shown>
      For non-cell centred grids, we generalize to

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|\<lambda\><rsub|1>*<bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+\<lambda\><rsub|2>*<bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>,>>>>>
      </equation*>

      where

      <\equation*>
        \<lambda\><rsub|1>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em>\<lambda\><rsub|2>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
      </equation*>
    </shown>|<\shown>
      This choice was made because, in Berthon's proof,
      <with|font-series|bold|conservative reconstruction> lead to

      <\equation*>
        <with|font-series|bold|w><rsub|i><rsup|n,\<pm\>>=<with|font-series|bold|w><rsub|i><rsup|n>+<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)>\<sigma\><rsub|i>
      </equation*>

      and thus

      <\equation*>
        <with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<pm\>>=<with|font-series|bold|w><rsub|i><rsup|n>+2<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)>\<sigma\><rsub|i.>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Step 1 : Evolution to <math|n+1/2>>

    <\lemma>
      <label|lemma:m.h.step.1><with|font-series|bold|(Evolution)> Pick

      <\equation*>
        \<lambda\><rsub|1>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em>\<lambda\><rsub|2>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>,
      </equation*>

      so that

      <\equation*>
        <frac|\<lambda\><rsub|1>|2><bw><rsub|i><rsup|n,->+<frac|1|2><bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|\<lambda\><rsub|2>|2><bw><rsub|i><rsup|n,+>=<bw><rsub|i><rsup|n,\<pm\>>.
      </equation*>

      Then, assume that

      <\equation*>
        <bw><rsub|i><rsup|n,\<pm\>>\<in\>\<Omega\><space|1em><text|and><space|1em><bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\>,
      </equation*>

      and the CFL restrictions

      <\equation>
        <tabular*|<tformat|<table|<row|<cell|<frac|\<mathLaplace\>t/2|\<lambda\><rsub|1>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n,->,<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<frac|\<mathLaplace\>t/2|\<lambda\><rsub|2>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>,<bw><rsub|i><rsup|n,+>|)>|\|>|)>\<leq\><frac|1|2>,>>>>><label|eq:new.cfl1>
      </equation>

      where <math|\<sigma\><rsub|e><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>>
      denotes all eigenvalues of all Jacobian matrices at the states between
      <math|<bw><rsub|1><infix-and><bw><rsub|2>>.

      Then, we have invariance of <math|\<Omega\>> under the first step of
      MUSCL-Hancock scheme, i.e.,

      <\equation*>
        <bw><rsub|i><rsup|n+1/2,\<pm\>>\<in\>\<Omega\>.
      </equation*>
    </lemma>
  </hidden>|<\hidden>
    <tit|Step 1 : Evolution to <math|n+1/2>>

    <unroll|<\shown>
      <center|<with|gr-mode|<tuple|edit|document-at>|gr-frame|<tuple|scale|1cm|<tuple|0.48gw|0.639987gh>>|gr-geometry|<tuple|geometry|1.00667par|0.405796par|center>|<graphics||<line|<point|-6.90399|-2.94341>|<point|6.59779732768885|-2.90769281651012>>|<with|dash-style|10|<line|<point|-6.90399|-2.94341>|<point|-6.86833575869824|3.20025797063104>>>|<with|dash-style|10|<line|<point|6.5978|-2.90769>|<point|6.54415266569652|3.11096044450324>>>|<point|1.24732|-2.92185>|<math-at|y<rsub|i>|<point|1.14599653657891|-3.31964>>|<math-at|x<rsub|i+1/2>|<point|5.9012104775764|-3.24702341579574>>|<math-at|x<rsub|i-1/2>|<point|-6.92191427437492|-3.2648829210213>>|<math-at|x<rsub|i-1/4>|<point|-3.34554789390131|-3.32838402963355>>|<math-at|x<rsub|i+1/4>|<point|3.33030423997883|-3.2768146051065>>|<point|3.68263|-2.9154>|<with|dash-style|10|<line|<point|1.24732|-2.92185>|<point|1.18024871014684|3.05342968646646>>>|<line|<point|3.68263|-2.9154>|<point|2.14820082021431|0.620700489482736>>|<line|<point|3.68263|-2.9154>|<point|4.10980288397936|0.792019447016801>>|<line|<point|3.68263|-2.9154>|<point|4.83790845349914|0.603568593729329>>|<line|<point|3.68263|-2.9154>|<point|4.41817700754068|0.749189707633285>>|<line|<point|3.68263|-2.9154>|<point|4.60662786082815|0.706359968249768>>|<bezier|<point|-6.64903|-3.7249>|<point|-2.80291705252017|-5.60940600608546>|<point|1.02842637915068|-3.50578780261939>>|<point|-2.9462|-2.93294>|<line|<point|-2.9462|-2.93294>|<point|-5.62265180579442|0.314972218547427>>|<line|<point|-2.9462|-2.93294>|<point|-1.85429620320148|0.547145786479693>>|<line|<point|-2.9462|-2.93294>|<point|-0.934531684085196|0.279253208096309>>|<line|<point|-2.9462|-2.93294>|<point|-1.60426313004366|0.413199497288001>>|<line|<point|-2.9462|-2.93294>|<point|-1.20242426246858|0.297112713321868>>|<math-at|<with|font-series|bold|w><rsub|i><rsup|\<ast\>,+>|<point|1.54067998412488|-1.3756614631565>>|<math-at|<with|font-series|bold|w><rsub|i><rsup|n,+<rsub|>>|<point|4.73753141949993|-1.35198108215372>>|<math-at|<with|font-series|bold|w><rsub|i><rsup|\<ast\>,+>|<point|-0.82735811615293|-1.38750165365789>>|<math-at|<with|font-series|bold|w><rsub|i><rsup|n,->|<point|-6.51064955681969|-1.51774374917317>>|<math-at|<small|y<rsub|i>-x<rsub|i-1/2>=\<lambda\><rsub|1>\<Delta\>x<rsub|i>=x<rsub|i+1/2>-x<rsub|i>>|<point|-6.6286876570975|-5.67164968911232>>|<bezier|<point|1.28236|-3.50579>|<point|3.85788464082551|-5.55099880936632>|<point|6.38892379944437|-3.4849847863474>>|<math-at|<small|x<rsub|i+1/2>-y<rsub|i>=\<lambda\><rsub|2>\<Delta\>x<rsub|i>=x<rsub|i>-x<rsub|i-1/2>>|<point|0.96226352692155|-5.64148696917582>>|<\document-at>
        <with|font-series|bold|Proof>
      </document-at|<point|-11.0243|3.14592>>>>>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|4|4|3|3|cell-halign|l>|<table|<row|<cell|<wide|<bw>|~><rsub|i><rsup|n+<frac|1|2>,+>>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,\<mathLaplace\>t/2|)>d
        x>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><bmatrix|<tformat|<table|<row|<cell|<around*|(|<frac|y<rsub|i>-x<rsub|i-1/2>|2>|)><bw><rsub|i><rsup|n,->+<frac|\<mathLaplace\>x<rsub|i>|2><bw><rsub|i><rsup|\<ast\>,+>+<frac|<around*|(|x<rsub|i+1/2>-y<rsub|i>|)>|2><bw><rsub|i><rsup|n,+>-\<mathLaplace\>t/2<around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>>>>>>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|(|\<lambda\><rsub|1><with|font-series|bold|w><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,+>+\<lambda\><rsub|2><bw><rsub|i><rsup|n,+>|)>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|i><rsup|n,+>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>=<bw><rsub|i><rsup|n+<frac|1|2>,+>>|<cell|<qed>>>>>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Step 2 : FVM type update>

    <unroll|<\shown>
      <small|We introduce a new variable <math|<with|font-series|bold|w><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>
      defined so that>

      <\equation*>
        <small|<with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=2<bw><rsub|i><rsup|n>.>
      </equation*>
    </shown>|<\shown>
      <with|gr-mode|<tuple|group-edit|move>|gr-frame|<tuple|scale|1cm|<tuple|0.49gw|0.48gh>>|gr-geometry|<tuple|geometry|1par|0.292755par|center>|gr-arrow-end|\<gtr\>|<graphics||<line|<point|-6.0355|-2.45993>|<point|6.71618269612383|-2.38849384839264>>|<line|<point|-6.0355|-2.45993>|<point|-6.03550403492525|3.39798584468845>>|<with|color|dark
      red|<line|<point|-6.94634|2.50501>|<point|6.37685209683821|2.5943081095383>>>|<with|color|dark
      red|<math-at|t<rsup|n+1>|<point|-7.34498346342109|2.73741653657891>>>|<math-at|<with|font-series|bold|w><rsub|i><rsup|n+1>|<point|-0.30817540732901|2.94217129117608>>|<line|<point|-3.50215|2.52809>|<point|-3.49703144851745|-2.4457092552861>>|<line|<point|4.79771702109703|2.58077139156652>|<point|4.85380555158732|-2.40117248161961>>|<math-at|x<rsub|i-<frac|1|2>>|<point|-3.96676804868369|-2.8427156211139>>|<math-at|x<rsub|i+<frac|1|2>>|<point|4.34808275036381|-2.78239215504696>>|<math-at|<small|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>>|<point|-5.39256|-1.29906>>|<math-at|<small|<bw><rsub|i+1><rsup|n+<frac|1|2>,->>|<point|5.00167|-1.40622>>|<math-at|<small|<bw><rsub|i><rsup|n+1,->>|<point|-2.9311764115658|2.04366152746032>>|<math-at|<small|<bw><rsub|i><rsup|n+1,*\<ast\>>>|<point|0.103949444503241|2.09625543325837>>|<math-at|<small|<bw><rsub|i><rsup|n+1,+>>|<point|3.00963060060854|2.07614465140891>>|<math-at|<small|<with|color|red|<frac|\<lambda\><rsub|1>|2>>\<mathLaplace\>x<rsub|i>>|<point|-2.81798471887816|-2.21453285752083>>|<math-at|<frac|\<mathLaplace\>x<rsub|i>|2>|<point|0.411363987696785|-2.12031887286678>>|<math-at|<small|<with|color|red|<frac|\<lambda\><rsub|2>|2>>\<mathLaplace\>x<rsub|i>>|<point|3.03255641222384|-2.12887070115094>>|<math-at|<small|<bw><rsub|i><rsup|n+<frac|1|2>,->>|<point|-2.88652028390245|-1.29798384932741>>|<math-at|<small|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>|<point|0.291440666754862|-1.29853485910835>>|<math-at|<small|<bw><rsub|i><rsup|n+<frac|1|2>,+>>|<point|3.14034653657891|-1.31214>>|<with|dash-style|10|<line|<point|-1.04300153467399|2.54457686664027>|<point|-0.981984420404842|-2.43161972019639>>>|<with|dash-style|10|<line|<point|2.68986221383723|2.55466498789824>|<point|2.66207500992195|-2.17811549146713>|<point|2.65202279058874|-2.41126166265582>>>|<with|arrow-end|\<gtr\>|<line|<point|-2.320726948009|-0.0617641222383913>|<point|-2.34861433639441|1.74456840810773>>>|<with|arrow-end|\<gtr\>|<line|<point|0.597020713360667|-0.068758815423929>|<point|0.602163787450467|1.5776856554742>>>|<with|arrow-end|\<gtr\>|<line|<point|3.70308977482299|-0.124668495595117>|<point|3.68523026959743|1.58091425344576>>>|<math-at||<point|-6.84811|1.43843>>>>
    </shown>|<\shown>
      <\small>
        <\equation*>
          <tabular*|<tformat|<cwith|3|3|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<bw><rsub|i><rsup|n+1,->>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,->-<cfrac|\<mathLaplace\>t|<with|color|red|\<lambda\><rsub|1>>\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>-f<around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|)>>>|<row|<cell|<bw><rsub|i><rsup|n+1,\<ast\>>>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>-<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>-f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|)>>>|<row|<cell|<bw><rsub|i><rsup|n+1,+>>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,+>-<cfrac|\<mathLaplace\>t|<with|color|red|\<lambda\><rsub|2>>\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>-f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>|)>>>>>>
        </equation*>
      </small>
    </shown>|<\shown>
      <\equation*>
        <small|<bw><rsub|i><rsup|n+1>=<bw><rsub|i><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x><around*|(|<with|font-series|bold|f><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>-<with|font-series|bold|f><around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|)>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Step 2 : FVM type update>

    <unroll|<\shown>
      <\lemma>
        <label|lemma:muscl.step2.general><math|(><with|font-series|bold|Riemann
        solver><math|)> Assume that the states
        <math|<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<pm\>>|)><rsub|i\<in\>\<bbb-Z\>>>,<math|<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)><rsub|i\<in\>\<bbb-Z\>>>
        belong to <math|\<Omega\>>, where
        <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>> was defined above as

        <\equation*>
          \<lambda\><rsub|1><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+\<lambda\><rsub|2><bw><rsub|i><rsup|n+<frac|1|2>,+>=2<bw><rsub|i><rsup|n>.
        </equation*>

        Then, the updated solution of MUSCL-Hancock scheme is in
        <math|\<Omega\>> under the CFL conditions\ 

        <\equation>
          <tabular*|<tformat|<table|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<lambda\><rsub|1>>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<lambda\><rsub|1>>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|>>|<row|<cell|<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|>>|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<lambda\><rsub|2>>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<lambda\><rsub|2>>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>|\|>|)>\<leq\><frac|1|2>.>>>>><label|eq:new.cfl2>
        </equation>
      </lemma>
    </shown>>

    <unroll|<\shown>
      \;
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Final admissibility condition>

    <unroll|<\shown>
      <switch|<\hidden>
        <\equation*>
          <with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n+<frac|1|2>,+>=2<bw><rsub|i><rsup|n>
        </equation*>
      </hidden>|<\hidden>
        <\equation*>
          <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n,->+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n,+>|)>|)>-<frac|\<mathLaplace\>t|2\<mathLaplace\>x><around*|[|<around*|(|f<around*|(|<with|font-series|bold|w><rsub|i><rsup|n,->|)>-f<around*|(|<with|font-series|bold|w><rsub|i><rsup|n,+>|)>|)>|]>>
        </equation*>
      </hidden>|<\shown>
        <\equation*>
          <bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=<around*|(|<wide*|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n,->+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n,+>|)>|\<wide-underbrace\>><rsub|<bw><rsub|i><rsup|n>>|)>-<frac|\<mathLaplace\>t|2\<mathLaplace\>x><around*|[|<around*|(|f<around*|(|<with|color|blue|<with|font-series|bold|w><rsub|i><rsup|n,->>|)>-f<around*|(|<with|color|blue|<with|font-series|bold|w><rsub|i><rsup|n,+>>|)>|)>|]>
        </equation*>
      </shown>>
    </shown>|<\shown>
      <\lemma>
        <label|lemma:muscl.step3.wss><math|(><with|font-series|bold|Link
        previous lemmas><math|)> Assume that
        <math|<bw><rsub|i><rsup|n>\<in\>\<Omega\>> for all
        <math|i\<in\>\<bbb-Z\>>. Let us define
        <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> as follows:

        <\equation>
          <with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n,+>=2<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n,->+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n,+>|)>|)>,<label|eq:lemma.1.used>
        </equation>

        where, as defined before,

        <\equation*>
          \<lambda\><rsub|1>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em>\<lambda\><rsub|2>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
        </equation*>

        Assume that <math|<bw><rsub|i><rsup|n,\<pm\>>> and
        <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> are in <math|\<Omega\>>.
        Consider the CFL conditions

        <\equation>
          <tabular|<tformat|<table|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<lambda\><rsub|1>>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|\<ast\>,\<ast\>>,<bw><rsub|i><rsup|n,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<lambda\><rsub|2>>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n,+>,<bw><rsub|i><rsup|\<ast\>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>>>><label|eq:new.cfl3>
        </equation>

        then <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>\<in\>\<Omega\>>.
      </lemma>
    </shown>|<\shown>
      <\remark>
        For conservative reconstruction, we actually have
        <math|<with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<ast\>>=<with|font-series|bold|w><rsub|i>>.
      </remark>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Final admissibility condition>

    <unroll|<\shown>
      <with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.529998gw|0.539998gh>>|gr-geometry|<tuple|geometry|0.956522par|0.339126par|center>|<graphics||<line|<point|1.98464|-2.90614>|<point|-0.706806455880407|0.342737134541606>>|<line|<point|-6.90399|-2.94341>|<point|6.59779732768885|-2.90769281651012>>|<with|dash-style|10|<line|<point|-6.90399|-2.94341>|<point|-6.86833575869824|3.20025797063104>>>|<with|dash-style|10|<line|<point|6.5978|-2.90769>|<point|6.54415266569652|3.11096044450324>>>|<point|-2.61154|-2.93205>|<math-at|x<rsub|i>|<point|-2.70707104114301|-3.28274242624686>>|<with|dash-style|10|<line|<point|-2.61154|-2.93205>|<point|-2.63563302024077|3.21811747585659>>>|<math-at|x<rsub|i+1/2>|<point|5.9012104775764|-3.24702341579574>>|<math-at|x<rsub|i-1/2>|<point|-6.92191427437492|-3.2648829210213>>|<math-at|x<rsub|i-1/4>|<point|-5.27135575340654|-3.28532361555761>>|<math-at|x<rsub|i+1/4>|<point|1.69252423997883|-3.2747246051065>>|<point|1.98875|-2.91989>|<line|<point|1.98875|-2.91989>|<point|3.0683622172245|0.503555364466199>>|<line|<point|1.98875|-2.91989>|<point|4.40716364598492|0.260136922873396>>|<line|<point|1.98875|-2.91989>|<point|3.50228204788993|0.46122172245006>>|<line|<point|1.98875|-2.91989>|<point|4.01028575208361|0.33422079640164>>|<point|-4.82983|-2.93792>|<line|<point|-4.82983|-2.93792>|<point|-6.34855801031883|0.347284693742559>>|<line|<point|-4.82983|-2.93792>|<point|-3.998677073687|0.362299907395158>>|<line|<point|-4.82983|-2.93792>|<point|-3.06773382722582|0.122056488953565>>|<line|<point|-4.82983|-2.93792>|<point|-3.6908651938087|0.227162984521762>>|<line|<point|-4.82983|-2.93792>|<point|-3.35302288662522|0.137071702606165>>|<math-at|W<rsub|i><rsup|n,+>|<point|-6.67009525069454|-2.62791043788861>>|<text-at|<with|font-series|bold|Proof.>|<point|-11.2954|3.11891>>|<math-at|W<rsub|i><rsup|\<ast\>,\<ast\>>|<point|-4.0865359174494|-2.5416225691229>>|<math-at|W<rsub|i><rsup|\<ast\>,\<ast\>>|<point|-1.30151144331261|-2.56173104908057>>|<math-at|W<rsub|i><rsup|n,-<rsub|>>|<point|3.83620518587115|-2.5717852890594>>|<text-at||<point|9.76821|-2.29027>>>>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|4|4|3|3|cell-halign|l>|<cwith|5|5|3|3|cell-halign|l>|<table|<row|<cell|<wide|<bw>|~><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,<frac|\<mathLaplace\>t|2>|)>
        d\<nocomma\>x>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><matrix|<tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<around*|(|<frac|x<rsub|i>-x<rsub|i-1/2>|2>|)><bw><rsub|i><rsup|n,+>+<frac|\<mathLaplace\>x<rsub|i>|2><bw><rsub|i><rsup|\<ast\>,\<ast\>>+<frac|<around*|(|x<rsub|i+1/2>-x<rsub|i>|)>|2><bw><rsub|i><rsup|n,->>>|<row|<cell|<space|1em>-<frac|\<mathLaplace\>t|2><around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>>>>>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|(|\<lambda\><rsub|2><with|font-series|bold|w><rsub|i><rsup|n,+>+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+\<lambda\><rsub|1><bw><rsub|i><rsup|n,->|)>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|i><rsup|n>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<wide|<bw>|~><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Final admissibility condition>

    <unroll|<\shown>
      <\theorem>
        <\with|font-family|ss-sans|font-base-size|7>
          Consider the conservation law

          <\equation*>
            <with|font-series|bold|w><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|w>|)><rsub|x>=0
          </equation*>

          which<with|font-family|ss-sans|font-base-size|6|> preserves a
          convex set <math|\<Omega\>>. Let
          <math|<around*|{|<with|font-series|bold|w><rsub|i><rsup|n>|}><rsub|i\<in\>\<bbb-Z\>>>
          be the approximate solution at time level <math|n> and assume that
          <math|<with|font-series|bold|w><rsup|n><rsub|i>\<in\>\<Omega\>> for
          all <math|i\<in\>\<bbb-Z\>>. Consider <with|color|red|conservative
          reconstructions>

          <\equation*>
            <bw><rsub|i><rsup|n,+>=<bw><rsub|i>+<around*|(|x<rsub|i+1/2>-x<rsub|i>|)>\<sigma\><rsub|i>,<space|1em><bw><rsub|i><rsup|n,->=<bw><rsub|i>+<around*|(|x<rsub|i-1/2>-x<rsub|i>|)>\<sigma\><rsub|i>.
          </equation*>

          Define <math|<with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<pm\>>>
          to be

          <\equation*>
            <bw><rsub|i><rsup|\<ast\>,\<pm\>>=<bw><rsub|i><rsup|n>+2<around*|(|x<rsub|i\<pm\><frac|1|2>>-x<rsub|i>|)>
            \<sigma\><rsub|i>
          </equation*>

          and assume that the slope <math|\<sigma\><rsub|i>> is chosen so
          that

          <\equation*>
            <bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\>.
          </equation*>

          Then, under time step restrictions <eqref|eq:new.cfl1>,
          <eqref|eq:new.cfl2>, <eqref|eq:new.cfl3>, the updated solution
          <math|<with|font-series|bold|w><rsub|i><rsup|n+1>>, defined by the
          MUSCL-Hancock procedure is in <math|\<Omega\>>.
        </with>
      </theorem>
    </shown>|<\shown>
      <\proof>
        <\with|font-base-size|7>
          We only need <math|<bw><rsub|i><rsup|n,\<pm\>>\<in\>\<Omega\>> to
          apply previous lemmas. To that end, notice

          <\equation*>
            <bw><rsub|i><rsup|n,\<pm\>>=<frac|1|2><bw><rsub|i><rsup|\<star\>,\<pm\>>+<frac|1|2><bw><rsub|i><rsup|n>.
          </equation*>
        </with>
      </proof>
    </shown>>

    \;

    \;
  </hidden>|<\hidden>
    <tit|Enforcing slope restriction>

    <unroll|<\shown>
      We are given that <math|<bw><rsub|i><rsup|n>\<in\>\<Omega\>> and a
      candidate slope <math|<with|font-series|bold|\<sigma\>><rsub|i>>. We
      have to limit it so that

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>=<bw><rsub|i><rsup|n>+2<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>\<in\>\<Omega\>.
      </equation*>
    </shown>|<\hidden*>
      We shall do this by finding a <math|\<theta\>\<in\><around*|[|0,1|]>>
      such that

      <\equation>
        <bw><rsub|i><rsup|n>+<rsup|>\<theta\><around*|(|2<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>|)>\<in\>\<Omega\>.<label|eq:admissible.theta.defn>
      </equation>
    </hidden*>|<\hidden*>
      We assume that there is a a concave function
      <math|p=p<around*|(|<bw>|)>> such that the admissibility criterion is
      given by

      <\equation*>
        p<around*|(|<bw>|)>\<gtr\>0.
      </equation*>
    </hidden*>|<\hidden*>
      We pick

      <\equation*>
        \<theta\><rsub|\<pm\>>=min<around*|(|<around*|\||<frac|\<epsilon\>-p<around*|(|<bw><rsub|i><rsup|n>|)>|p<around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>-p<around*|(|<bw><rsub|i><rsup|n>|)>>|\|>,1|)>
      </equation*>

      and

      <\equation*>
        \<theta\>=min<around*|(|\<theta\><rsub|+>,\<theta\><rsub|->|)>.
      </equation*>

      By Jensen's inequality, this <math|\<theta\>> will give us
      <eqref|eq:admissible.theta.defn>. This approach is used when using
      Zhang-Shu's positivty limiter <cite|Zhang2010b> in practice.
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Non-conservative reconstruction>

    Consider non-conservative variables

    <\equation*>
      <with|font-series|bold|U><rsub|i><rsup|n>=\<kappa\><around*|(|<bw><rsub|i><rsup|n>|)>,
    </equation*>

    so that reconstruction is given by

    <\equation*>
      <with|font-series|bold|U><rsup|n><around*|(|x|)>=<with|font-series|bold|U><rsup|n><rsub|i>+\<sigma\><rsub|i><around*|(|x-x<rsub|i>|)>
    </equation*>

    and <math|<with|font-series|bold|w><rsub|i><rsup|n,\<pm\>>> are defined
    by

    <\equation>
      <tabular*|<tformat|<table|<row|<cell|<bw><rsub|i><rsup|n,\<pm\>>>|<cell|:=>|<cell|\<kappa\><rsup|-1><around*|(|<with|font-series|bold|U><rsub|i><rsup|n,\<pm\>>|)>>>>>><label|eq:non.con.face.defn1>
    </equation>

    <\theorem>
      Assume that <math|<bw><rsub|i><rsup|n>\<in\>\<Omega\>> for all
      <math|i\<in\>\<bbb-Z\>>. Consider <math|<bw><rsub|i><rsup|n,\<pm\>>>
      defined in <math|<eqref|eq:non.con.face.defn1>>,
      <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> defined so that

      <\equation*>
        \<lambda\><rsub|1><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+\<lambda\><rsub|2><bw><rsub|i><rsup|n+<frac|1|2>,+>=2<bw><rsub|i><rsup|n>,
      </equation*>

      and <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> defined explicitly as

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<ast\>>=4<bw><rsub|i><rsup|n>-3<around*|(|\<lambda\><rsub|1><bw><rsub|i><rsup|n,->+\<lambda\><rsub|2><bw><rsub|i><rsup|n,+>|)>.
      </equation*>

      Assume that the slope is chosen so that

      <\equation*>
        <with|font-series|bold|w><rsub|i><rsup|n,\<pm\>>\<in\>\<Omega\>,<space|1em><with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\><space|1em>and<space|1em><with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<ast\>>\<in\>\<Omega\>.
      </equation*>

      Consider the same CFL conditions <eqref|eq:new.cfl1>,<eqref|eq:new.cfl2>,<eqref|eq:new.cfl3>.
      Then the updated solution <math|<bw><rsub|i><rsup|n+1>> of
      MUSCL-Hancock procedure is in <math|\<Omega\>>.
    </theorem>

    <\remark>
      The definition of <math|<with|font-series|bold|w><rsub|i><rsup|\<ast\>,\<ast\>>>
      comes from

      <\equation*>
        <with|color|red|\<lambda\><rsub|1>><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+<with|color|red|\<lambda\><rsub|2>><bw><rsub|i><rsup|n,+>=2<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|\<lambda\><rsub|1><bw><rsub|i><rsup|n,->+\<lambda\><rsub|2><bw><rsub|i><rsup|n,+>|)>|)>
      </equation*>
    </remark>
  </hidden>|<\hidden>
    <tit|ADER-DG : Predictor step>

    <unroll|<\shown>
      Current solution

      <\equation*>
        x\<in\>I<rsub|e>:<space|2em>u<rsub|h><rsup|n><around*|(|\<xi\>|)>=<big|sum><rsub|j=1><rsup|N+1>u<rsub|j><rsup|n>\<ell\><rsub|j><around*|(|\<xi\>|)>
      </equation*>
    </shown>|<\shown>
      Cell local space-time solution and flux:
      <math|\<tau\>=<around*|(|t-t<rsub|n>|)>/\<mathLaplace\>t>

      <\equation*>
        <wide|u|~><rsub|h><around*|(|\<xi\>,\<tau\>|)>=<big|sum><rsub|r,s=1><rsup|N+1><wide|u|~><rsub|r
        s>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>,<space|1em><wide|f|~><rsub|h><around*|(|\<xi\>,\<tau\>|)>=<big|sum><rsub|r,s=1><rsup|N+1>f<around*|(|<wide|u|~><rsub|r\<nocomma\>s>|)>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>.
      </equation*>
    </shown>|<\shown>
      Find <math|<wide|u|~><rsub|h>> by cell local Galerkin method

      <\equation*>
        <big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>><around*|(|\<partial\><rsub|t><wide|u|~><rsub|h>+\<partial\><rsub|x><wide|f|~><rsub|h>|)>*\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>*d\<nocomma\>x
        d\<nocomma\> t,<space|2em>1\<leq\>r,s\<leq\>N+1.
      </equation*>
    </shown>|<\shown>
      Integrate by parts in time

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|-<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>><with|color|red|<wide|u|~><rsub|h>>\<ell\><rsub|r><around*|(|\<xi\>|)>\<partial\><rsub|t>\<ell\><rsub|s><around*|(|\<tau\>|)>
        d x d t+<big|int><rsub|I<rsub|e>><with|color|red|<with|color|red|<wide|u|~><rsub|h>><around*|(|\<xi\>,1|)>>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|1|)>
        d x-<big|int><rsub|I<rsub|e>><with|color|blue|u<rsub|h><rsup|n><around*|(|\<xi\>|)>>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|0|)>
        d \<xi\>>>|<row|<cell|+<frac|1|\<mathLaplace\>x<rsub|e>><big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>>\<partial\><rsub|\<xi\>><wide|f|~><rsub|h>
        \<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>d
        x d t=0.>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|ADER correction step>

    <unroll|<\shown>
      <\equation*>
        <big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|0><rsup|1><around*|(|\<partial\><rsub|t>u<rsub|h>+\<partial\><rsub|x>f<around*|(|u<rsub|h>|)>|)>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t=0
      </equation*>
    </shown>|<\shown>
      Integrate by parts :\ 

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>*\<ell\><rsub|i><around*|(|\<xi\>|)>*d
        x+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>><wide|f|~><rsub|h>\<partial\><rsub|x>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|<space|1em>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>\<ell\><rsub|i><around*|(|0|)>d
        t-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>\<ell\><rsub|i><around*|(|1|)>d
        t.>>>>>
      </equation*>
    </shown>|<\shown>
      Another integration by parts :\ 

      <\equation*>
        <tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>d
        x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>\<ell\><rsub|i><around*|(|\<xi\>|)>d
        x- <big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>>\<partial\><rsub|x><wide|f|~><rsub|h>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>\<ell\><rsub|i><around*|(|0|)>d
        t-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>\<ell\><rsub|i><around*|(|1|)>d
        t,>>>>
      </equation*>
    </shown>|<\shown>
      Quadrature on solution points :\ 

      <switch|<\hidden>
        <\equation*>
          <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
          \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>+<frac|\<ell\><rsub|i><around*|(|0|)>|w<rsub|i>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|f|^><rsub|e-<frac|1|2>><around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>d
          t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<frac|\<ell\><rsub|i><around*|(|1|)>|w<rsub|i>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|f|^><rsub|e+<frac|1|2>><around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>
          d t>>>>>
        </equation*>
      </hidden>|<\shown>
        <\equation*>
          <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
          \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>-<with|color|red|g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>d
          t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<with|color|red|g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>
          -<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>d t>>>>>
        </equation*>
      </shown>>
    </shown>>
  </hidden>|<\hidden>
    <tit|Constant linear advection>

    <unroll|<\shown>
      For constant linear advection

      <\equation*>
        u<rsub|t>+u<rsub|x>=0,
      </equation*>

      the ADER update is given by

      <\equation*>
        <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|u|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
        \ d t>>|<row|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>-g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around*|(|<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>
        d t,<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>
        d t|)>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|0,\<tau\>|)>d
        t|]>>>|<row|<cell|>|<cell|>|<cell|<space|1em>-g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around*|(|<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>
        d t,<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>
        d t|)>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|1,\<tau\>|)>
        d t|]>>>>>>
      </equation*>
    </shown>|<\shown>
      The LWFR update is given by

      <\equation*>
        u<rsub|i><rsup|n+1>=u<rsub|i><rsup|n>-\<partial\><rsub|x>U<rsub|h><around*|(|\<xi\><rsub|i>|)>-g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around|(|U<rsub|e-<frac|1|2>><rsup|->,U<rsub|e-<frac|1|2>><rsup|+>|)>-U<rsub|h><around*|(|0|)>|]>-g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around|(|U<rsub|e+<frac|1|2>><rsup|->,U<rsub|e+<frac|1|2>><rsup|+>|)>-U<rsub|h><around*|(|1|)>|]>,
      </equation*>

      where

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|U<rsub|h><rsup|n>>|<cell|=>|<cell|u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t\<nocomma\>t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>>>|<row|<cell|>|<cell|=>|<cell|u-<frac|\<mathLaplace\>t|2>u<rsub|x>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|x\<nocomma\>x>+\<cdots\>+<around*|(|-1|)><rsup|N><frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|x>.>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Equivalence of ADER-FR and LWFR for linear case>

    <unroll|<\shown>
      <\theorem>
        For the linear advection equation

        <\equation*>
          u<rsub|t>+u<rsub|x>=0,
        </equation*>

        the Lax-Wendroff Flux Reconstruction scheme with D2 dissipation and
        ADER-FR scheme are equivalent.
      </theorem>
    </shown>|<\shown>
      <with|font-series|bold|Proof.> <math|<wide|u|~><rsub|h><around*|(|x,t|)>=u<rsub|j><rsup|n><around*|(|x-<around*|(|t-t<rsup|n>|)>|)>>
      satisfies the equation

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|2|2|4|4|cell-halign|r>|<table|<row|<cell|<wide|u|~><rsub|t>+<wide|u|~><rsub|x>>|<cell|=>|<cell|0,>|<cell|x\<in\><around*|[|x<rsub|j-1/2>,x<rsub|j+1/2>|]>,t\<in\><around*|(|t<rsub|n>,t<rsub|n+1>|]>,>>|<row|<cell|<wide|u|~><around*|(|x,t<rsup|n>|)>>|<cell|=>|<cell|u<rsup|n><rsub|j><around*|(|x|)>,>|<cell|t=t<rsub|n>.>>>>>
      </equation*>
    </shown>|<\shown>
      Since the predictor equation has a <with|color|red|unique> solution of
      degree <math|N> <cite|Jackson2017|Dumbser2009>, the specified
      <math|<wide|u|~><rsub|h>> must be the predictor solution.
    </shown>|<\shown>
      <unroll|<\shown>
        <\math>
          <\equation*>
            <tabular*|<tformat|<cwith|2|2|4|4|cell-halign|l>|<cwith|1|1|2|2|cell-halign|r>|<cwith|3|3|4|4|cell-halign|l>|<cwith|1|1|4|4|cell-halign|l>|<cwith|4|4|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|<wide|u|~><rsub|h><around*|(|x,t|)>>|<cell|=>|<cell|<wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>+<around*|(|t-t<rsup|n>|)><pdv||t><wide|u|~><rsub|h><rsub|><around*|(|x,t<rsup|n>|)>+\<ldots\>+<frac|<around*|(|t-t<rsup|n>|)><rsup|N>|N!><pdv*|N||t><wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>>>|<row|<cell|>|<cell|>|<cell|=>|<cell|u<rsup|n><around*|(|x|)>-<around*|(|t-t<rsup|n>|)>
            <pdv||x>u<rsup|n><around*|(|x|)>+\<ldots\>+<around*|(|-1|)><rsup|N><frac|<around*|(|t-t<rsup|n>|)><rsup|N>|N!><pdv*|N||x>u<rsup|n><around*|(|x|)>>>|<row|<cell|\<Rightarrow\>>|<cell|
            <frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|x,t|)>
            d t>|<cell|=>|<cell|u<rsup|n><around*|(|x|)>-<frac|\<mathLaplace\>t|2>
            <pdv||x>u<rsub|><rsup|n><around*|(|x|)>+\<ldots\>+<around*|(|-1|)><rsup|N><frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N||x>u<rsup|n>d
            t,>>|<row|<cell|>|<cell|>|<cell|=>|<cell|U<rsub|h><rsup|n><around*|(|x|)>>>>>>
          </equation*>
        </math>

        <space|51em><qed>
      </shown>>
    </shown>>

    \;

    \;
  </hidden>|<\hidden>
    <tit|ADER-FR and LWFR for non-linear case>

    <unroll|<\shown>
      <\theorem>
        If the predictor solution of ADER satisfies

        <\equation*>
          <around*|\<\|\|\>|U<rsup|n>|\<\|\|\>><rsub|C<rsup|N+1>>\<leq\>C
        </equation*>

        where <math|C> is a constant independent of
        <math|n,\<mathLaplace\>x,\<mathLaplace\>t>, then the ADER and LW
        solution will satisfy

        <\equation*>
          <around*|\<\|\|\>|u<rsup|n+1><rsub|ADER>-u<rsup|n+1><rsub|LW>|\<\|\|\>><rsub|\<infty\>>=\<cal-O\><around*|(|\<mathLaplace\>x<rsup|N+1>|)>.
        </equation*>
      </theorem>
    </shown>|<\shown>
      <with|font-series|bold|Idea.> The weak formulation will give us

      <\equation>
        <wide|u|~><rsub|t>+<around*|(|<wide|f|~><rsub|h>|)><rsub|x>=0,<label|eq:quadrature1>
      </equation>

      for all <math|<around*|(|x<rsub|r>,t<rsub|s>|)>> where
      <math|s\<gtr\>0>, i.e., <math|t<rsub|s>\<gtr\>t<rsup|n>>. Then, we can
      extrapolate to <math|t=t<rsup|n>> as
    </shown>|<\shown>
      <\equation*>
        <wide|u|~><rsub|t>+<around*|(|<wide|f|~><rsub|h>|)><rsub|x>=O<around*|(|\<mathLaplace\>t<rsup|N>|)><space|2em><text|at>
        <space|1em>t=t<rsup|n>,
      </equation*>
    </shown>|<\shown>
      so that we will have

      <\equation*>
        <tabular|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>>|<cell|=>|<cell|<wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>+\<mathLaplace\>t*<around*|(|<wide|f|~><rsub|h>|)><rsub|x>+\<ldots\>+<frac|<around*|(|t-t<rsup|n>|)><rsup|N>|N!>*<pdv*|N-1||t><around*|(|<wide|f|~><rsub|h>|)><rsub|x>+O<around*|(|\<mathLaplace\>t<rsup|N+1>|)>.>>>>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Results plan>

    <\enumerate>
      <item>Do all admissibility preserving tests. In 1-D, Sedov blast is the
      best.
    </enumerate>
  </hidden>|<\hidden>
    <tit|Summary and future plans>

    \;
  </hidden>|<\hidden>
    <tit|References>

    <\bibliography|bib|tm-plain|references>
      <\bib-list|10>
        <bibitem*|1><label|bib-Berthon2006>Christophe Berthon. <newblock>Why
        the MUSCL\UHancock scheme is l1-stable.
        <newblock><with|font-shape|italic|Numerische Mathematik>,
        104(1):27\U46, jun 2006.<newblock>

        <bibitem*|2><label|bib-Dumbser2009>Michael Dumbser<localize| and
        >Olindo Zanotti. <newblock>Very high order PNPM schemes on
        unstructured meshes for the resistive relativistic MHD equations.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        228(18):6991\U7006, oct 2009.<newblock>

        <bibitem*|3><label|bib-Felton2018-ip>Camille Felton, Mariana Harris,
        Caleb Logemann, Stefan Nelson, Ian Pelakh<localize|, and
        >James<nbsp>A Rossmanith. <newblock>A positivity-preserving limiting
        strategy for locally-implicit Lax-Wendroff discontinuous galerkin
        methods. <newblock>Jun 2018.<newblock>

        <bibitem*|4><label|bib-HENNEMANN2021109935>Sebastian Hennemann,
        Andrés<nbsp>M.<nbsp>Rueda-Ramírez,
        Florian<nbsp>J.<nbsp>Hindenlang<localize|, and
        >Gregor<nbsp>J.<nbsp>Gassner. <newblock>A provably entropy stable
        subcell shock capturing approach for high order split form dg for the
        compressible euler equations. <newblock><with|font-shape|italic|Journal
        of Computational Physics>, 426:109935, 2021.<newblock>

        <bibitem*|5><label|bib-Huynh2007>H.<nbsp>T.<nbsp>Huynh. <newblock>A
        Flux Reconstruction Approach to High-Order Schemes Including
        Discontinuous Galerkin Methods. <newblock>Miami, FL, jun 2007.
        AIAA.<newblock>

        <bibitem*|6><label|bib-Jackson2017>Haran Jackson. <newblock>On the
        eigenvalues of the ADER-WENO galerkin predictor.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        333:409\U413, mar 2017.<newblock>

        <bibitem*|7><label|bib-Persson2006>Per-Olof Persson<localize| and
        >Jaime Peraire. <newblock>Sub-Cell Shock Capturing for Discontinuous
        Galerkin Methods. <newblock><localize|In
        ><with|font-shape|italic|44th AIAA Aerospace Sciences Meeting and
        Exhibit>, Aerospace Sciences Meetings. American Institute of
        Aeronautics and Astronautics, jan 2006.<newblock>

        <bibitem*|8><label|bib-Rueda-Ramirez2021-ib>A Rueda-Ramrez<localize|
        and >G Gassner. <newblock>A subcell finite volume
        positivity-preserving limiter for DGSEM discretizations of the euler
        equations. <newblock><localize|In ><with|font-shape|italic|14th
        WCCM-ECCOMAS Congress>. CIMNE, 2021.<newblock>

        <bibitem*|9><label|bib-Zhang2010b>Xiangxiong Zhang<localize| and
        >Chi-Wang Shu. <newblock>On maximum-principle-satisfying high order
        schemes for scalar conservation laws.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        229(9):3091\U3120, may 2010.<newblock>

        <bibitem*|10><label|bib-zorio_approximate_2017>D.<nbsp>Zorío,
        A.<nbsp>Baeza<localize|, and >P.<nbsp>Mulet. <newblock>An Approximate
        Lax\UWendroff-Type Procedure for High Order Accurate Schemes for
        Hyperbolic Conservation Laws. <newblock><with|font-shape|italic|Journal
        of Scientific Computing>, 71(1):246\U273, apr 2017. <newblock>Bibtex:
        Zorio2017.<newblock>
      </bib-list>
    </bibliography>

    \;
  </hidden>|<\hidden>
    <tit|<really-huge|Thank you>>

    \;

    \;

    \;

    \;

    <really-huge|<center|<with|color|dark green|Joint Work With>>>

    <\wide-tabular>
      <tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<\cell>
        <\center>
          <large|<with|color|red|Praveen Chandrashekar,>>

          <large|<with|color|red|Sudarshan Kumar Kenettinkara,>>
        </center>
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <large|<with|color|blue|TIFR-CAM, Bangalore>>

        <large|<with|color|blue|IISER-Trivandrum>>
      </cell>>>>
    </wide-tabular>
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|7>
    <associate|info-flag|short>
    <associate|page-medium|beamer>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|32>>
    <associate|bib-Berthon2006|<tuple|1|32>>
    <associate|bib-Dumbser2009|<tuple|2|32>>
    <associate|bib-Felton2018-ip|<tuple|3|32>>
    <associate|bib-HENNEMANN2021109935|<tuple|4|32>>
    <associate|bib-Huynh2007|<tuple|5|32>>
    <associate|bib-Jackson2017|<tuple|6|32>>
    <associate|bib-Persson2006|<tuple|7|32>>
    <associate|bib-Rueda-Ramirez2021-ib|<tuple|8|32>>
    <associate|bib-Zhang2010b|<tuple|9|32>>
    <associate|bib-zorio_approximate_2017|<tuple|10|32>>
    <associate|eq:admissible.theta.defn|<tuple|5|23>>
    <associate|eq:lemma.1.used|<tuple|3|20>>
    <associate|eq:new.cfl1|<tuple|1|16>>
    <associate|eq:new.cfl2|<tuple|2|19>>
    <associate|eq:new.cfl3|<tuple|4|20>>
    <associate|eq:non.con.face.defn1|<tuple|6|24>>
    <associate|eq:quadrature1|<tuple|7|?>>
    <associate|lemma:m.h.step.1|<tuple|2|16>>
    <associate|lemma:muscl.step2.general|<tuple|3|19>>
    <associate|lemma:muscl.step3.wss|<tuple|4|20>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Huynh2007

      zorio_approximate_2017

      HENNEMANN2021109935

      HENNEMANN2021109935

      Persson2006

      Felton2018-ip

      Rueda-Ramirez2021-ib

      Berthon2006

      Zhang2010b

      Jackson2017

      Dumbser2009
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>