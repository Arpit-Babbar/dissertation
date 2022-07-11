<TeXmacs|1.99.19>

<style|<tuple|beamer|old-lengths|preview-ref|libertine-font|boring-white>>

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

    <assign|bw|<macro|\<b-u\>>>

    <assign|bx|<macro|\<b-x\>>>

    #Bold symbols-end
  </hide-preamble>

  <screens|<\hidden>
    <unroll-greyed|<\shown>
      <doc-data|<doc-title|Annual Thesis Committee (TC)
      meeting>|<doc-misc|Arpit Babbar>|<doc-date|<date>>>
    </shown>|<\shown>
      <with|font-series|bold|Main developments> <with|color|red| Move to end>

      <\itemize>
        <unroll-greyed|<\shown>
          <item>Extended Zhang-Shu's positivity limiter <cite|Zhang2010b> to
          Lax-Wendroff schemes to obtain a provably admissibility preserving
          Lax-Wendroff scheme
        </shown>|<\shown>
          <item>Developed blending limiter of Hennemann Et Al
          <cite|HENNEMANN2021109935> for Lax-Wendroff schemes. Improved the
          lower order part of blending from first order finite volume method
          to second order MUSCL-Hancock method.
        </shown>|<\shown>
          <item>Extended proof of admissibility of MUSCL-Hancock method by
          Berthon <cite|Berthon2006> to non-cell centred finite volume grids
          used by <cite|HENNEMANN2021109935>. Used a problem independent
          procedure to limit slope for admissibility.
        </shown>|<\shown>
          <item>Made theoretical comparison of Lax-Wendroff and ADER schemes
          - proved equivalence for linear case with D2 dissipation and
          <with|font-shape|italic|closeness> for non-linear case.
        </shown>|<\shown>
          <item><with|color|red|Add about efficient implementation in Julia,
          maybe pseudocode.>
        </shown>>
      </itemize>
    </shown>|<\shown>
      <with|font-series|bold|Structure of presentation>

      <\itemize>
        <unroll|<\shown>
          <item>Review of Lax-Wendroff Flux Reconstruction with D2
          dissipation numerical flux. <with|color|red|Add about 2-D>
        </shown>|<\shown>
          <item>Brief introduction to the blending limiter of
          <cite|HENNEMANN2021109935>.
        </shown>|<\shown>
          <item>Extending Zhang-Shu's limiter <cite|Zhang2010b> to
          Lax-Wendroff schemes.
        </shown>|<\shown>
          <item>Admissibility preserving MUSCL-Hancock reconstruction on
          non-cell centred grids used by <cite|HENNEMANN2021109935>.
        </shown>|<\shown>
          <item>Prove equivalence of ADER and LW-D2 schemes with numerical
          verification, also recall instability issues noted in RKDG schemes
          by Xu Et Al in <cite|Xu2019>.
        </shown>|<\shown>
          <item>Numerical results in 1-D, 2-D demonstrating admissibility
          preservation and accuracy improvement of limiting procedure.
        </shown>|<\hidden*>
          <item>Summary and future plans
        </hidden*>>
      </itemize>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Flux Reconstruction (FR) by Huynh <cite|Huynh2007>>

    <\with|font-base-size|8>
      <unroll-phantoms|<\shown>
        <\equation*>
          <large|<with|font-series|bold|u><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|u>|)><rsub|x>=0>
        </equation*>
      </shown>|<\hidden*>
        <with|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1cm|<tuple|0.629993gw|0.599997gh>>|gr-geometry|<tuple|geometry|1par|0.482581par|center>|gr-color|blue|gr-point-size|2ln|<graphics||<line|<point|-10.8254|-0.173849>|<point|-8.76160867839661|-0.173849054107686>>|<with|arrow-end|\<gtr\>|<spline|<point|-9.2167|0.19657>|<point|-3.96732372006879|1.17024407990475>|<point|1.55721656303744|0.196570313533536>>>|<line|<point|-0.0514618|-0.110349>|<point|4.28773647307845|-0.173849054107686>>|<text-at|<tiny|<math|<with|font-base-size|10|x<rsub|e-<frac|1|2>>>>>|<point|-11.1058995898928|-0.51253424130176>>|<text-at|<tiny|<math|<with|font-base-size|10|x<rsub|e+<frac|1|2>>>>>|<point|-8.79869908056621|-0.576019451779336>>|<text-at|<tiny|<math|0>>|<point|-0.247288925783834|-0.459601041275301>>|<with|arrow-end|\<gtr\>|<spline|<point|1.79529|-0.814278>|<point|-4.03616549808176|-2.23245468977378>|<point|-9.27495369757905|-1.00477907130573>>>|<text-at|<large|<math|<small|I<rsub|e>>>>|<point|-10.0264|0.210064>>|<with|color|blue|point-size|2ln|<point|-10.3948|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.78272|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.19266|-0.173849>>|<with|color|blue|point-size|2ln|<point|0.813427|-0.123006>>|<with|color|blue|point-size|2ln|<point|2.22103|-0.152302>>|<with|color|blue|point-size|2ln|<point|3.47767|-0.161994>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-11.8933|5.4261>>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-11.0084998015611|-5.00388609604445>>>|<with|color|blue|<\document-at>
          <math|N+1> <with|color|black|solution points where >

          <math|N> <with|color|black|is the degree of numerical solution
          <math|<with|font-series|bold|u><rsub|h>>>

          <with|color|black| within each cell>
        </document-at|<point|-14.3566|-1.66788>>>|<text-at|<math|<small|I>>|<point|1.96146977113375|0.104246593464744>>|<text-at|<math|<tiny|<with|font-base-size|10|x\<mapsto\>\<xi\><rsub|e><around*|(|x|)>>>>|<point|-4.49125214975526|1.51496560391586>>|<text-at|<tiny|<math|<with|font-base-size|10|\<xi\>\<mapsto\>x<rsub|e><around*|(|\<xi\>|)>>>>|<point|-4.60766966529964|-1.94580963090356>>|<with|color|blue|<text-at|<math|r=r<around*|(|x|)>>|<point|-14.2914902764916|-0.326547823786215>>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|4.44186|-2.32501>>>|<with|color|blue|<text-at|<math|<tabular*|<tformat|<table|<row|<cell|x<rsub|e,j>\<mapsto\>\<xi\><rsub|j>>>>>>>|<point|-5.16169466860696|-0.560408122767562>>>|<with|color|blue|<\document-at>
          <math|<with|font-base-size|9|<pdv|r|x>=<frac|1|\<mathLaplace\>x<rsub|e>><pdv|<wide|r|^>|\<xi\>>>>
        </document-at|<point|5.49060722317767|-1.30420690567535>>>|<with|color|blue|<text-at|<math|<wide|r|^>=<wide|r|^><around*|(|\<xi\>|)>>|<point|5.61046434713586|0.32884640825506>>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-6.06474|1.83437>>>|<text-at|<math|<tiny|1>>|<point|4.35570181240905|-0.52194404021696>>>>
      </hidden*>>
    </with>
  </hidden>|<\hidden>
    <unroll|<\shown>
      <\tit>
        Flux Reconstruction (FR) by Huynh <cite|Huynh2007>
      </tit>

      \;

      <\equation*>
        <large|<tabular*|<tformat|<table|<row|<cell|<with|color|blue|<dv||t>u<rsub|e,i>>=-<pdv|f<rsub|h>|x><around*|(|x<rsub|e,i>|)>,<space|1em>1\<leq\>i\<leq\>N+1.>>>>>>
      </equation*>

      \;

      \;

      \;

      <\wide-tabular>
        <tformat|<cwith|1|1|2|2|cell-halign|r>|<table|<row|<\cell>
          <image|figures/intro_fr/soln_2.pdf|0.48par|||>
        </cell>|<\cell>
          <image|figures/intro_fr/fc_2.pdf|0.48par|||>
        </cell>>>>
      </wide-tabular>
    </shown>>
  </hidden>|<\hidden>
    <\tit>
      Flux Reconstruction (FR) by Huynh <cite|Huynh2007>
    </tit>

    <with|font-base-size|7|<unroll|<\shown>
      <with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.150005gh>>|gr-geometry|<tuple|geometry|1par|0.673889par|center>|gr-line-width|2ln|gr-snap|<tuple|control
      point|grid point|grid curve point|curve-grid intersection|curve-curve
      intersection|text border point|text
      border>|<with|font-base-size|9|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.150005gh>>|gr-geometry|<tuple|geometry|1par|0.586931par|center>|<graphics||<with|magnify|0.84629758534134|<line|<point|-0.0921688443002041|9.3846306204784>|<point|-0.0832120999999998|7.74555>|<point|-0.0742553852457589|6.68865765899957>>>|<with|arrow-end|\<gtr\>|<arrow-with-text|<point|-0.114962|5.26903>|<point|-0.0937954755920095|3.35343630109803>|<math-at|>>>|<with|line-width|2ln|<line|<point|-0.519281144992725|10.1258597565816>|<point|0.26883521524011|10.1360270104577>>>|<with|line-width|2ln|<line|<point|-0.093794987008864|9.7881436301098>|<point|-0.114962252520175|10.4231686731049>>>|<text-at|<image|Figures/cts_flux/fc_labeled.pdf|0.38par|||>|<point|-4.63407858182299|-1.78452837676941>>|<text-at|<math|<with|color|white|<with|color|black|<wide|f|^><rsub|h>=<wide|f|^><rsub|h><rsup|\<delta\>><with|color|black|+><with|color|black|<with|color|white|<with|color|black|<around*|(|<with|color|purple|f<rsub|e+<frac|1|2>>>-<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|1|)>|)>>>>>>g<rsub|R>><math|+<with|color|white|<with|color|black|<around*|(|<with|color|black|<with|color|purple|f<rsub|e-<frac|1|2>>>>-<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|0|)>|)>>>g<rsub|L>>|<point|-4.77166291837545|5.59601137716629>>|<text-at|<image|Figures/cts_flux/fd_2.pdf|0.3par|||>|<point|-9.84111654980818|6.30509988093663>>|<text-at|<math|<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|\<xi\><rsub|i>|)>=f<around*|(|<wide|u|^><rsub|h><around*|(|\<xi\><rsub|i>|)>|)>>|<point|-8.50760682629977|9.31078846408255>>|<text-at|<image|Figures/cts_flux/corr.pdf|0.3par|||>|<point|2.62351736392765|6.29747651805794>>|<text-at|<math|<tabular*|<tformat|<cwith|1|-1|1|1|font-base-size|8>|<table|<row|<cell|g<rsub|L><around*|(|0|)>=1,g<rsub|L><around*|(|1|)>=0>>|<row|<cell|g<rsub|R><around*|(|0|)>=0,g<rsub|R><around*|(|1|)>=1>>>>>>|<point|3.89615028442916|9.77645852626009>>>>>
    </shown>>>
  </hidden>|<\hidden>
    <tit|Lax-Wendroff Flux Reconstruction (LWFR) with D2 dissipation>

    <unroll|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<large|u<rsup|n+1>=u<rsup|n>-\<mathLaplace\>t*F<rsup|n><rsub|x>>,>>|<row|<cell|<text|where
        >F=f<around*|(|u|)>+<frac|\<mathLaplace\>t|2><around*|(|f<around*|(|u|)>|)><rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>f<around*|(|u|)><rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N||t>f<around*|(|u|)>>>>>>
      </equation*>
    </shown>|<\shown>
      Approximate Lax-Wendroff procedure (Zorio Et Al.
      <cite|zorio_approximate_2017>):

      <\equation*>
        <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|f<around*|(|u|)><rsub|t>>|<cell|\<approx\>>|<cell|<frac|f<around*|(|u<around*|(|x,t+\<mathLaplace\>t|)>|)>-f<around*|(|u<around*|(|x,t-\<mathLaplace\>t|)>|)>|2\<mathLaplace\>t>+O<around*|(|\<mathLaplace\>t<rsup|2>|)>>>|<row|<cell|>|<cell|\<approx\>>|<cell|<frac|f<around*|(|u+\<mathLaplace\>t*<with|color|blue|u<rsub|t>>|)>-f<around*|(|u-\<mathLaplace\>t*<with|color|blue|u<rsub|t>>|)>|2\<mathLaplace\>t>+O<around*|(|\<mathLaplace\>t<rsup|2>|)>,>>>>>
      </equation*>

      and<with|color|blue| <with|color|blue|<with|color|blue|<math|<with|color|blue|u<rsub|t>=-f<around*|(|u|)><rsub|x>>>>>>.
    </shown>|<\shown>
      Gives discontinuous <math|F<rsub|h><rsup|\<delta\>>> to be corrected
      with Flux Reconstruction (FR) using <math|F<rsub|e+1/2>>.
    </shown>|<\shown>
      Past works :\ 

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|F<rsub|e+<frac|1|2>>=F<around*|(|F<rsub|L>,F<rsub|R>,u<rsub|L>,u<rsub|R>|)>,>>|<row|<cell|u<rsub|L>=u<rsub|h><around*|(|x<rsub|e+1/2><rsup|->|)>,<space|2em>u<rsub|R>=u<rsub|h><around*|(|x<rsub|e+1/2><rsup|+>|)>.>>>>>
      </equation*>
    </shown>|<\shown>
      <with|font-series|bold|Dissipation 2> flux <cite|oldpaper>:

      <\equation*>
        u<rsub|L>=U<rsub|h><around*|(|x<rsub|e+1/2><rsup|->|)>,<space|2em>u<rsub|R>=U<rsub|h><around*|(|x<rsub|e+1/2><rsup|+>|)>,
      </equation*>

      where

      <\equation*>
        U<rsub|h>=u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>\<approx\><frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>u<rsub|h>*
        d t.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Conservation property of LWFR>

    <unroll|<\shown>
      <\equation*>
        <around*|(|u<rsup|e><rsub|j>|)><rsup|n+1>=<around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<pdv|F<rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </shown>|<\shown>
      For <math|<around*|{|w<rsub|j>|}><rsub|j=1><rsup|N+1>> being the
      quadrature weights associated with solution points:

      <\equation*>
        <big|sum><rsub|j=1><rsup|N+1>w<rsub|j><around*|(|u<rsup|e><rsub|j>|)><rsup|n+1>=<big|sum><rsub|j=1><rsup|N+1><around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<pdv|F<rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>,
      </equation*>
    </shown>|<\shown>
      <\equation*>
        \<Rightarrow\><wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|]>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Blending limiter (Hennemann Et Al. <cite|HENNEMANN2021109935>)>

    <unroll-compressed|<\shown>
      <with|color|red|High order> LWFR update

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|H,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|H>.
      </equation*>
    </shown>|<\shown>
      <with|color|red|Lower order> (FO FVM or MUSCL-Hancock) subcell update
      (like \ method)

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|L,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|L>.
      </equation*>
    </shown>|<\shown>
      <with|color|blue|Blended> residual

      <\equation*>
        <with|font-series|bold|R><rsub|e>=<around*|(|1-\<alpha\><rsub|e>|)>*<with|font-series|bold|R><rsub|e><rsup|H>+\<alpha\><rsub|e>*<with|font-series|bold|R><rsub|e><rsup|L>,<rsub|>
      </equation*>

      <with|color|red|Limited> update

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Choice of <math|\<alpha\><rsub|e>> : Smoothness indicator
    <cite|HENNEMANN2021109935>>

    <unroll|<\shown>
      Legendre expansion of degree <math|N> polynomial
      <math|\<epsilon\>=\<epsilon\>=<around*|(|\<xi\>|)>>

      <\equation*>
        \<epsilon\>=<big|sum><rsub|j=1><rsup|N+1>m<rsub|j>L<rsub|j>,<space|2em>m<rsub|j>=<around*|\<langle\>|\<epsilon\>,L<rsub|j>|\<rangle\>><rsub|L<rsup|2>>,
      </equation*>

      Energy content (Persson and Peraire <cite|Persson2006>)

      <\equation*>
        \<bbb-E\>:=max<around*|(|<frac|m<rsub|N+1><rsup|2>|\<beta\><rsub|1>m<rsub|1>+<big|sum><rsub|j=2><rsup|N+1>m<rsub|j><rsup|2>>,<frac|m<rsub|N><rsup|2>|\<beta\><rsub|2>m<rsub|1>+<big|sum><rsub|j=2><rsup|N>m<rsub|j><rsup|2>>|)>.
      </equation*>
    </shown>|<\shown>
      In literature, <math|\<beta\><rsub|1>=\<beta\><rsub|2>=1>
    </shown>|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|2|2|cell-valign|c>|<table|<row|<\cell>
          <image|illustrations/alpha_func.pdf|0.42par|||>
        </cell>|<\cell>
          <\equation*>
            \<epsilon\>=\<rho\>*p
          </equation*>

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
  </hidden>|<\hidden>
    <tit|Choosing <math|\<beta\><rsub|1>,\<beta\><rsub|2>>>

    <unroll|<\shown>
      <\equation*>
        \<bbb-E\>=max<around*|(|<frac|m<rsub|N+1><rsup|2>|\<beta\><rsub|1>m<rsub|1>+<big|sum><rsub|j=2><rsup|N+1>m<rsub|j><rsup|2>>,<frac|m<rsub|N><rsup|2>|\<beta\><rsub|2>m<rsub|1>+<big|sum><rsub|j=2><rsup|N>m<rsub|j><rsup|2>>|)>
      </equation*>

      <switch|<\hidden>
        <center|<small-figure|<image|figures/scalar/composite.pdf|0.7par|||>|Comparing
        <math|\<beta\><rsub|1>=0> and <math|\<beta\><rsub|1>=1>.
        <math|\<beta\><rsub|2>> has been set to <math|1>.>>
      </hidden>|<\hidden>
        <center|<small-figure|<image|figures/scalar/composite_zoomed.pdf|0.7par|||>|Comparing
        <math|\<beta\><rsub|1>=0> and <math|\<beta\><rsub|1>=1>.
        <math|\<beta\><rsub|2>> has been set to <math|1>.>>
      </hidden>|<\shown>
        <center|<small-figure|<image|figures/scalar/composite_scaled.pdf|0.7par|||>|Comparing
        <math|\<beta\><rsub|1>=0> and <math|\<beta\><rsub|1>=1>.
        <math|\<beta\><rsub|2>> has been set to <math|1>.>>
      </shown>>
    </shown>>

    \;
  </hidden>|<\shown>
    <tit|Lower order update>

    <unroll|<\shown>
      <center|<image|illustrations/subcells.pdf|0.381par|||>>
    </shown>|<\shown>
      <with|font|Lucida|>In the physical cell
      <math|I<rsub|e>=<around*|[|x<rsub|e-<frac|1|2>>,x<rsub|e+<frac|1|2>>|]>>,
      we define subcells <math|<around*|{|<around*|[|x<rsub|j-<frac|1|2>><rsup|e>,x<rsup|e><rsub|j+<frac|1|2>>|]>|}><rsub|j:1><rsup|N+1>>
      with (sub)faces <math|x<rsup|e><rsub|j+<frac|1|2>>> defined as

      <\equation*>
        x<rsub|j+<frac|1|2>><rsup|e>=x<rsub|e-<frac|1|2>>+\<mathLaplace\>x<rsub|e><big|sum><rsub|1\<leq\>k\<leq\>j>w<rsub|k>,<space|2em>0\<leq\>j\<leq\>N+1,
      </equation*>

      where <math|<around*|{|w<rsub|j>|}><rsub|j:1><rsup|N+1>> are the
      Gauss-Legendre quadrature weights.
    </shown>|<\shown>
      With this, we can define the lower order update in subcells to be

      <\equation>
        <tabular*|<tformat|<table|<row|<cell|<around*|(|u<rsub|1><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|1><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|0>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|<frac|3|2>>-F<rsub|e-<frac|1|2>><rsup|L>|]>,>>|<row|<cell|<around*|(|u<rsub|j><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|j>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|j+<frac|1|2>>-f<rsub|j-<frac|1|2>>|]>,<space|2em>2\<leq\>j\<leq\>N,>>|<row|<cell|<around*|(|u<rsub|N><rsup|e>|)><rsup|n+1>=<around*|(|u<rsub|N><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|N+1>*\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>><rsup|L>-f<rsub|N-<frac|1|2>>|]>.>>>>><label|eq:low.order.update>
      </equation>
    </shown>|<\shown>
      Multiply <math|j<rsup|th>> equation in <eqref|eq:low.order.update> by
      <math|w<rsub|j>> to get

      <\equation*>
        <big|sum><rsub|j:1><rsup|N+1>u<rsub|j><rsup|L,n+1>w<rsub|j>=<big|sum><rsub|j:1><rsup|N+1>u<rsub|j><rsup|e>w<rsub|j>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around|(|F<rsub|e+1/2><rsup|L>-F<rsub|e-1/2><rsup|L>|)>
      </equation*>
    </shown>|<\hidden*>
      <\equation*>
        \<Rightarrow\><large|<wide|u|\<wide-bar\>><rsub|e><rsup|L,n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|L,n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around|(|F<rsub|e+1/2><rsup|L>-F<rsub|e-1/2><rsup|L>|)>>.
      </equation*>
    </hidden*>>
  </shown>|<\hidden>
    <tit|Interface numerical flux>

    <unroll|<\shown>
      For LWFR, high order numerical flux <math|F<rsub|e+<frac|1|2>><rsup|H>>
      is computed by time averaging and satisfies the conservation property

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|H,n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<around*|(|F<rsub|e+<frac|1|2>><rsup|H>-F<rsub|e-<frac|1|2>><rsup|H>|)>
      </equation*>
    </shown>|<\hidden*>
      The same is true for the lower order method

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|L,n+1>=<around*|(|<wide|u|\<wide-bar\>><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<around*|(|F<rsub|e+<frac|1|2>><rsup|L>-F<rsub|e-<frac|1|2>><rsup|L>|)>.
      </equation*>
    </hidden*>|<\hidden*>
      Thus, the blended update is given by
    </hidden*>|<\hidden*>
      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-\<mathLaplace\>t*<around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>,
      </equation*>

      <\equation*>
        where<space|1em> F<rsub|e+<frac|1|2>>=\<alpha\><rsub|e>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e>|)>*F<rsub|e+<frac|1|2>><rsup|H>.
      </equation*>
    </hidden*>|<\hidden*>
      For conservation, we must have

      <\equation*>
        \<alpha\><rsub|e>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e>|)>*F<rsub|e+<frac|1|2>><rsup|H>=\<alpha\><rsub|e+1>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e+1>|)>*F<rsub|e+<frac|1|2>><rsup|H>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        \<Rightarrow\>F<rsub|e+<frac|1|2>><rsup|L>=F<rsub|e+<frac|1|2>><rsup|H>
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Interface numerical flux>

    <unroll|<\shown>
      Initial candidate for the interface flux :

      <\equation*>
        <wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>=<around*|(|1-\<alpha\><rsub|e+<frac|1|2>>|)>*<with|font-series|bold|F><rsub|e+<frac|1|2>><rsup|LW>+\<alpha\><rsub|e+<frac|1|2>>*<with|font-series|bold|f><rsub|e,N+3/2>,<space|2em>\<alpha\><rsub|e+<frac|1|2>>=<frac|1|2><around*|(|\<alpha\><rsub|e>+\<alpha\><rsub|e+1>|)>.
      </equation*>
    </shown>|<\hidden*>
      Then the lower order update of last solution point would be

      <\equation*>
        <wide|<bu>|~><rsup|n+1>=<bu><rsub|e,N+1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|N+1>><around*|(|<wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>-<with|font-series|bold|f><rsub|e,N+1/2>|)>.
      </equation*>
    </hidden*>|<\hidden*>
      Assume there is a <with|color|red|concave> <math|p> such that the
      admissibility condition <math|<with|font-series|bold|u>\<in\>\<Omega\>>
      is equivalent to

      <\equation*>
        p<around*|(|<with|font-series|bold|u>|)>\<gtr\>0.
      </equation*>
    </hidden*>|<\hidden*>
      Our lower order method is chosen so that

      <\equation*>
        <wide|<bu>|~><rsub|low><rsup|n+1>=<bu><rsub|e,N+1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|N+1>><around*|(|<with|font-series|bold|f><rsub|e,N+3/2>-<with|font-series|bold|f><rsub|e,N+1/2>|)>\<in\>\<Omega\>.
      </equation*>
    </hidden*>|<\hidden*>
      Thus, for

      <\equation*>
        \<theta\>=min<around*|(|<around*|\||<frac|\<epsilon\>-p<around*|(|<wide|<bu>|~><rsub|low><rsup|n+1>|)>|p<around*|(|<wide|<bu>|~><rsup|n+1>|)>-p<around*|(|<wide|<bu>|~><rsub|low><rsup|n+1>|)>>|\|>,1|)>,
      </equation*>

      we will have

      <\equation*>
        p<around*|(|\<theta\>*<wide|<bu>|~><rsup|n+1>+<around*|(|1-\<theta\>|)>*<bu><rsub|low><rsup|n+1>|)>\<gtr\>\<epsilon\>.
      </equation*>
    </hidden*>|<\hidden*>
      Finally choose

      <\equation*>
        <with|font-series|bold|F><rsub|e+<frac|1|2>>=\<theta\>*<wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>+<around*|(|1-\<theta\>|)><with|font-series|bold|f><rsub|e,N+3/2>.
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Extension of Zhang-Shu's limiter to Lax-Wendroff schemes>

    <unroll|<\shown>
      Recall that the lower order update looks like

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<around*|(|<wide|<bw>|~><rsub|1><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|1><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|0>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|<frac|3|2>>-F<rsub|e-<frac|1|2>>|]>,>>|<row|<cell|<around*|(|<wide|<bw>|~><rsub|j><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|j>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|j+<frac|1|2>>-f<rsub|j-<frac|1|2>>|]>,<space|2em>2\<leq\>j\<leq\>N,>>|<row|<cell|<around*|(|<wide|<bw>|~><rsub|N><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|N><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|N+1>*\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-f<rsub|N-<frac|1|2>>|]>.>>>>>
      </equation*>
    </shown>|<\hidden*>
      With our choice of <math|F<rsub|e\<pm\><frac|1|2>>>, we have

      <\equation*>
        <wide|<bw>|~><rsup|e><rsub|j>\<in\>\<Omega\>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </hidden*>|<\hidden*>
      This gives us

      <\equation*>
        <wide|<bw>|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|<bw>|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>=<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<wide|<bw>|~><rsub|j><rsup|n+1>\<in\>\<Omega\>.
      </equation*>
    </hidden*>|<\hidden*>
      Thus, the cell averages preserve admissibility and we can now use
      Zhang-Shu's admissibility preserving limiter to obtain an admissibility
      preserving Lax-Wendroff scheme.
    </hidden*>|<\hidden*>
      The approach of preserving admissibility of cell averages and using
      Zhang-Shu's limiter has also been explored by Rossmanith Et Al.
      <cite|Felton2018-ip>. The advantage of our proposed approach over
      theirs is that we don't require additional cell/face loops and there
      are very little (and optional) additional storage requirements.
    </hidden*>|<\hidden*>
      Now that our lower order method is admissibility preserving, we can
      also aposteriorily modify <math|\<alpha\><rsub|e>> to ensure that the
      blended scheme is admissibility preserving. This approach has been
      explored by Gassner and Ramírez in <cite|Rueda-Ramirez2021-ib>.
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Admissibility preservation in 2-D>

    <unroll|<\shown>
      <\equation*>
        Initial candidate:<tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<cell|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,j>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>>|)>*F<rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,j><rsup|LW>+\<alpha\><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>>*f<rsub|<with|font-series|bold|e>,N+<frac|3|2>,j>,>|<cell|<space|1em>>|<cell|1\<leq\>j\<leq\>N+1,>>|<row|<cell|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,i>>|<cell|=>|<cell|<around|(|1-\<alpha\><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>>|)>*F<rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,i><rsup|LW>+\<alpha\><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>>*f<rsub|<with|font-series|bold|e>,i,N+<frac|3|2>>,>|<cell|>|<cell|1\<leq\>i\<leq\>N+1.>>>>>
      </equation*>
    </shown>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<table|<row|<cell|<wide|<bw>|~><rsup|n+1>>|<cell|=>|<cell|<bw><rsub|<with|font-series|bold|e>,1,j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|<with|font-series|bold|e>>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,j>-f<rsub|<with|font-series|bold|e>,<frac|1|2>,j>|)>-<frac|\<mathLaplace\>t|\<mathLaplace\>y<rsub|e>w<rsub|j>><around*|(|f<rsub|<with|font-series|bold|e>,1,j+<frac|1|2>>-f<rsub|<with|font-series|bold|e>,1,j-<frac|1|2>><rsub|>|)>,>|<cell|1\<less\>j\<less\>N+1,>>|<row|<cell|<wide|<bw>|~><rsup|n+1>>|<cell|=>|<cell|<bw><rsub|<with|font-series|bold|e>,1,1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|<with|font-series|bold|e>>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>-f<rsub|<with|font-series|bold|e>,<frac|1|2>,1>|)>-<frac|\<mathLaplace\>t|\<mathLaplace\>y<rsub|e>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>-f<rsub|<with|font-series|bold|e>,1,<frac|1|2>><rsub|>|)>,>|<cell|j=1.>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      In the 2-D code, there's two separate face loops for vertical and
      horizontal faces. This poses a challenge because to ensure
      <math|<wide|u|~><rsup|n+1>> is admissible, we need to correct both
      <math|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>> and
      <math|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>> and these
      values are never available together.
    </hidden*>|<\hidden*>
      To avoid having to store values and doing aposteriori correction, we
      find appropriate <math|\<lambda\><rsub|x>,\<lambda\><rsub|y>> such that

      <\equation*>
        \<lambda\><rsub|x>+\<lambda\><rsub|y>=1,
      </equation*>

      and then, following the 1-D procedure, construct corrected
      <math|F<rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>> and
      <math|F<rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>> such that
    </hidden*>|<\hidden*>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-valign|t>|<table|<row|<\cell>
          <center|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|1.05995gw|0.210026gh>>|gr-geometry|<tuple|geometry|0.286093par|0.202901par|center>|gr-color|<pattern|X/TeXmacs/misc/patterns/vintage/granite-dark.png|1gu|>|<graphics||<cline|<point|-6.77838|3.62184>|<point|-6.7711998941659|-0.820644265114433>|<point|-0.85745468977378|-0.842174890858579>|<point|-0.886162190765974|3.6074877629316>>|<point|-6.26164|-0.490508>|<point|-6.276|0.0334039>|<point|-6.28317|0.600377>|<with|color|red|<carc|<point|-6.55589|-0.260848>|<point|-5.98174361688054|-0.662753009657362>|<point|-6.20124830760045|-0.822719331570375>>>|<with|color|<pattern|X/TeXmacs/misc/patterns/vintage/granite-dark.png|1gu|>|<text-at|<math|<small|i=1,j=1>>|<point|-5.7207633284826|-0.572942849583278>>>>>>
        </cell>|<\cell>
          <unroll-phantoms|<\shown>
            <\equation*>
              <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<bw><rsub|<with|font-series|bold|e>,1,1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|<with|font-series|bold|e>>\<lambda\><rsub|x>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>+<frac|1|2>,e<rsub|y>,1>-f<rsub|<with|font-series|bold|e>,<frac|1|2>,1>|)>\<in\>\<Omega\>,>>|<row|<cell|<bw><rsub|<with|font-series|bold|e>,1,1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>y<rsub|e>\<lambda\><rsub|y>w<rsub|1>><around*|(|<wide|F|~><rsub|e<rsub|x>,e<rsub|y>+<frac|1|2>,1>-f<rsub|<with|font-series|bold|e>,1,<frac|1|2>><rsub|>|)>\<in\>\<Omega\>.>>>>>
            </equation*>
          </shown>|<\hidden*>
            <\equation*>
              \<lambda\><rsub|x>=<frac|<around*|\||s<rsub|x><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>x<rsub|<with|font-series|bold|e>>|<around*|\||s<rsub|x><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>x<rsub|<with|font-series|bold|e>>+<around*|\||s<rsub|y><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>y<rsub|<with|font-series|bold|e>>>,<space|2em>\<lambda\><rsub|y>=<frac|<around*|\||s<rsub|y><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>y<rsub|<with|font-series|bold|e>>|<around*|\||s<rsub|x><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>x<rsub|<with|font-series|bold|e>>+<around*|\||s<rsub|y><rsup|<with|font-series|bold|e>>|\|>/\<mathLaplace\>y<rsub|<with|font-series|bold|e>>>
            </equation*>
          </hidden*>>

          \;

          \;
        </cell>>>>
      </wide-tabular>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Low order residual : MUSCL-Hancock>

    <unroll|<\shown>
      <center|<image|illustrations/subcells.pdf|0.4par|||>>
    </shown>|<\hidden*>
      Integrating the conservation law over the subcell
      <math|I<rsup|e><rsub|j>>, we get

      <\equation*>
        \<mathLaplace\>x<rsub|e>*w<rsub|j>*<around*|(|<bw><rsub|j><rsup|n+1>-<bw><rsub|j><rsup|n>|)>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|<with|font-series|bold|f><rsub|j+1/2>-<with|font-series|bold|f><rsub|j-1/2>|)>*d\<nocomma\>t=0.
      </equation*>
    </hidden*>|<\hidden*>
      Using the mid-point rule, writing explicit update,

      <\equation*>
        <bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|j>>*<around*|(|<with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>-<with|font-series|bold|f><rsub|j-1/2><rsup|n+1/2>|)>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>=<with|font-series|bold|f><around*|(|<bw><rsub|j+1/2-><rsup|n+1/2>,<bw><rsub|j+1/2+><rsup|n+1/2>|)>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<bw><rsub|j-1/2+>=<bw><rsub|j><around*|(|x<rsub|j-1/2>|)>,<space|1em><bw><rsub|j+1/2->=<bw><rsub|j><around*|(|x<rsub|j+1/2>|)>>>|<row|<cell|<bw><rsub|j><around*|(|x|)>=<bw><rsub|j><rsup|n>+\<delta\><rsub|j>*<around*|(|x-x<rsub|j>|)>>>|<row|<cell|\<delta\><rsub|j>=minmod<around*|(|\<beta\><rsub|j>*<frac|<bw><rsub|j+1>-<bw><rsub|j>|x<rsub|j+1>-x<rsub|j>>,D<rsub|cent><around*|(|<bw>|)><rsub|j>,\<beta\><rsub|j><frac|<bw><rsub|j><rsup|n>-<bw><rsub|j-1><rsup|n>|x<rsub|j>-x<rsub|j-1>>|)>>>|<row|<cell|\<beta\><rsub|j>=2-\<alpha\><rsub|j>>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <bw><rsub|j-<frac|1|2>+><rsup|n+1/2>=<bw><rsub|j-1/2><rsup|n>-<frac|\<mathLaplace\>t|2><frac|f<around*|(|<bw><rsub|j+1/2>|)>-f<around*|(|<bw><rsub|j-1/2>|)>|x<rsub|j+1/2>-x<rsub|j-1/2>>,<space|1em><bw><rsub|j+<frac|1|2>-><rsup|n+1/2>=<bw><rsub|j+1/2><rsup|n>-<frac|\<mathLaplace\>t|2><frac|f<around*|(|<bw><rsub|j+1/2>|)>-f<around*|(|<bw><rsub|j-1/2>|)>|x<rsub|j+1/2>-x<rsub|j-1/2>>.
      </equation*>
    </hidden*>>

    <samp|>
  </hidden>|<\hidden>
    <tit|Admissibility of low order method>

    <\theorem>
      <with|font-shape|italic|<math|(>Extension of Berthon
      <math|<cite|Berthon2006>><math|)>> Consider the conservation law

      <\equation*>
        <bw><rsub|t>+<with|font-series|bold|f><around*|(|<bw>|)><rsub|x>=0
      </equation*>

      which preserves a convex set <math|\<Omega\>>. Let
      <math|<around*|{|<bw><rsub|i><rsup|n>|}><rsub|i\<in\>\<bbb-Z\>>> be the
      approximate solution at time level <math|n> and assume that
      <math|<bw><rsup|n><rsub|i>\<in\>\<Omega\>> for all
      <math|i\<in\>\<bbb-Z\>>. Consider <with|color|red|conservative
      reconstructions>

      <\equation*>
        <bw><rsub|i><rsup|n,+>=<bw><rsub|i>+<around*|(|x<rsub|i+1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>,<space|1em><bw><rsub|i><rsup|n,->=<bw><rsub|i>+<around*|(|x<rsub|i-1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>.
      </equation*>

      Define <math|<with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,\<pm\>>>
      satisfying

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|color|red|\<mu\><rsup|->>*<bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<with|color|red|\<mu\><rsup|+>>*<bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>,>>>>>
      </equation*>

      where

      <\equation*>
        <with|color|red|\<mu\><rsup|->>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em><with|color|red|\<mu\><rsup|+>>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
      </equation*>

      Assume that the slope <math|<with|font-series|bold|\<sigma\>><rsub|i>>
      is chosen so that

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\>.
      </equation*>

      Then, under <with|color|blue|appropriate> time step restrictions, the
      updated solution <math|<bw><rsub|i><rsup|n+1>>, defined by the
      MUSCL-Hancock procedure is in <math|\<Omega\>>.
    </theorem>

    <center|<image|illustrations/1dgrid_cells.pdf|0.6par|||>>
  </hidden>|<\hidden>
    <tit|Generalizing Berthon's proof>

    <unroll|<\shown>
      Berthon defined <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> to be the
      quantity satisfying

      <\equation*>
        <frac|1|2><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|1|2><bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>.
      </equation*>
    </shown>|<\hidden*>
      For non-cell centred grids, we generalize to

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|color|red|\<mu\><rsup|->>*<bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<with|color|red|\<mu\><rsup|+>>*<bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>,>>>>>
      </equation*>

      where

      <\equation*>
        <with|color|red|\<mu\><rsup|->>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em><with|color|red|\<mu\><rsup|+>>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
      </equation*>
    </hidden*>|<\hidden*>
      This choice was made to get the natural expression of
      <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> in the
      <with|font-series|bold|conservative reconstruction case> -\ 

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>=<with|font-series|bold|<bw>><rsub|i><rsup|n>+2<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>,
      </equation*>

      noting that

      <\equation*>
        <bw><rsub|i><rsup|n,+>=<bw><rsub|i>+<around*|(|x<rsub|i+1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>,<space|1em><bw><rsub|i><rsup|n,->=<bw><rsub|i>+<around*|(|x<rsub|i-1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>.
      </equation*>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Step 1 : Evolution to <math|n+1/2>>

    <\lemma>
      <label|lemma:m.h.step.1><with|font-series|bold|(Evolution)> Pick

      <\equation*>
        <with|color|red|\<mu\><rsup|->>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em><with|color|red|\<mu\><rsup|+>>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>,
      </equation*>

      so that

      <\equation*>
        <frac|<with|color|red|\<mu\><rsup|->>|2><bw><rsub|i><rsup|n,->+<frac|1|2><bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|<with|color|red|\<mu\><rsup|+>>|2><bw><rsub|i><rsup|n,+>=<bw><rsub|i><rsup|n,\<pm\>>.
      </equation*>

      Then, assume that

      <\equation*>
        <bw><rsub|i><rsup|n,\<pm\>>\<in\>\<Omega\><space|1em><text|and><space|1em><bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\>,
      </equation*>

      and the CFL restrictions

      <\equation>
        <tabular*|<tformat|<table|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x/2>*max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n,->,<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x/2>*max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>,<bw><rsub|i><rsup|n,+>|)>|\|>|)>\<leq\><frac|1|2>,>>>>><label|eq:new.cfl1>
      </equation>

      where <math|\<sigma\><rsub|e><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>>
      denotes the maximum spectral radius among all Jacobian matrices at
      states between <math|<bw><rsub|1><infix-and><bw><rsub|2>>.

      Then, we have invariance of <math|\<Omega\>> under the first step of
      MUSCL-Hancock scheme, i.e.,

      <\equation*>
        <bw><rsub|i><rsup|n+1/2,\<pm\>>\<in\>\<Omega\>.
      </equation*>
    </lemma>
  </hidden>|<\hidden>
    <tit|Step 1 : Evolution to <math|n+1/2>>

    <unroll|<\shown>
      <center|<with|gr-mode|<tuple|edit|document-at>|gr-frame|<tuple|scale|1cm|<tuple|0.48gw|0.639987gh>>|gr-geometry|<tuple|geometry|1.00667par|0.405796par|center>|<graphics||<line|<point|-6.90399|-2.94341>|<point|6.59779732768885|-2.90769281651012>>|<with|dash-style|10|<line|<point|-6.90399|-2.94341>|<point|-6.86833575869824|3.20025797063104>>>|<with|dash-style|10|<line|<point|6.5978|-2.90769>|<point|6.54415266569652|3.11096044450324>>>|<point|1.24732|-2.92185>|<math-at|y<rsub|i>|<point|1.14599653657891|-3.31964>>|<math-at|x<rsub|i+1/2>|<point|5.9012104775764|-3.24702341579574>>|<math-at|x<rsub|i-1/2>|<point|-6.92191427437492|-3.2648829210213>>|<math-at|x<rsub|i-1/4>|<point|-3.34554789390131|-3.32838402963355>>|<math-at|x<rsub|i+1/4>|<point|3.33030423997883|-3.2768146051065>>|<point|3.68263|-2.9154>|<with|dash-style|10|<line|<point|1.24732|-2.92185>|<point|1.18024871014684|3.05342968646646>>>|<line|<point|3.68263|-2.9154>|<point|2.14820082021431|0.620700489482736>>|<line|<point|3.68263|-2.9154>|<point|4.10980288397936|0.792019447016801>>|<line|<point|3.68263|-2.9154>|<point|4.83790845349914|0.603568593729329>>|<line|<point|3.68263|-2.9154>|<point|4.41817700754068|0.749189707633285>>|<line|<point|3.68263|-2.9154>|<point|4.60662786082815|0.706359968249768>>|<bezier|<point|-6.64903|-3.7249>|<point|-2.80291705252017|-5.60940600608546>|<point|1.02842637915068|-3.50578780261939>>|<point|-2.9462|-2.93294>|<line|<point|-2.9462|-2.93294>|<point|-5.62265180579442|0.314972218547427>>|<line|<point|-2.9462|-2.93294>|<point|-1.85429620320148|0.547145786479693>>|<line|<point|-2.9462|-2.93294>|<point|-0.934531684085196|0.279253208096309>>|<line|<point|-2.9462|-2.93294>|<point|-1.60426313004366|0.413199497288001>>|<line|<point|-2.9462|-2.93294>|<point|-1.20242426246858|0.297112713321868>>|<math-at|<with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,+>|<point|1.54067998412488|-1.3756614631565>>|<math-at|<with|font-series|bold|<bw>><rsub|i><rsup|n,+<rsub|>>|<point|4.73753141949993|-1.35198108215372>>|<math-at|<bw><rsub|i><rsup|\<ast\>,+>|<point|-0.82735811615293|-1.38750165365789>>|<math-at|<with|font-series|bold|<bw>><rsub|i><rsup|n,->|<point|-6.51064955681969|-1.51774374917317>>|<bezier|<point|1.28236|-3.50579>|<point|3.85788464082551|-5.55099880936632>|<point|6.38892379944437|-3.4849847863474>>|<\document-at>
        <with|font-series|bold|Proof>
      </document-at|<point|-11.0243|3.14592>>|<math-at|<small|<with|color|red|\<mu\><rsup|->>\<Delta\>x<rsub|i>>|<point|-3.29256515412092|-5.6780824183093>>|<math-at|<small|<with|color|red|\<mu\><rsup|+>>\<Delta\>x<rsub|i>>|<point|3.45965074745337|-5.66749900780527>>>>>
    </shown>|<\hidden*>
      <\equation*>
        <with|font-base-size|8|<tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|4|4|3|3|cell-halign|l>|<table|<row|<cell|<wide|<bw>|~><rsub|i><rsup|n+<frac|1|2>,+>>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,\<mathLaplace\>t/2|)>d
        x>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><bmatrix|<tformat|<table|<row|<cell|<frac|y<rsub|i>-x<rsub|i-1/2>|2><bw><rsub|i><rsup|n,->+<frac|\<mathLaplace\>x<rsub|i>|2><bw><rsub|i><rsup|\<ast\>,+>+<frac|x<rsub|i+1/2>-y<rsub|i>|2><bw><rsub|i><rsup|n,+>-\<mathLaplace\>t/2<around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>>>>>>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|(|<with|color|red|\<mu\><rsup|->><with|font-series|bold|w><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,+>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>|)>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|i><rsup|n,+>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>=<bw><rsub|i><rsup|n+<frac|1|2>,+>>|<cell|<qed>>>>>>>
      </equation*>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Step 2 : FVM type update>

    <unroll|<\shown>
      <with|font-base-size|8|<small|We introduce a new variable
      <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>> defined so that>>

      <\equation*>
        <with|font-base-size|8|<small|<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=2<bw><rsub|i><rsup|n>.>>
      </equation*>
    </shown>|<\hidden*>
      <with|gr-mode|<tuple|group-edit|move>|gr-frame|<tuple|scale|1cm|<tuple|0.49gw|0.48gh>>|gr-geometry|<tuple|geometry|1par|0.292755par|center>|gr-arrow-end|\<gtr\>|<graphics||<line|<point|-6.0355|-2.45993>|<point|6.71618269612383|-2.38849384839264>>|<line|<point|-6.0355|-2.45993>|<point|-6.03550403492525|3.39798584468845>>|<with|color|dark
      red|<line|<point|-6.94634|2.50501>|<point|6.37685209683821|2.5943081095383>>>|<with|color|dark
      red|<math-at|t<rsup|n+1>|<point|-7.34498346342109|2.73741653657891>>>|<math-at|<with|font-series|bold|<bw>><rsub|i><rsup|n+1>|<point|-0.30817540732901|2.94217129117608>>|<line|<point|-3.50215|2.52809>|<point|-3.49703144851745|-2.4457092552861>>|<line|<point|4.79771702109703|2.58077139156652>|<point|4.85380555158732|-2.40117248161961>>|<math-at|x<rsub|i-<frac|1|2>>|<point|-3.96676804868369|-2.8427156211139>>|<math-at|x<rsub|i+<frac|1|2>>|<point|4.34808275036381|-2.78239215504696>>|<math-at|<small|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>>|<point|-5.39256|-1.29906>>|<math-at|<small|<bw><rsub|i+1><rsup|n+<frac|1|2>,->>|<point|5.00167|-1.40622>>|<math-at|<small|<bw><rsub|i><rsup|n+1,->>|<point|-2.9311764115658|2.04366152746032>>|<math-at|<small|<bw><rsub|i><rsup|n+1,*\<ast\>>>|<point|0.103949444503241|2.09625543325837>>|<math-at|<small|<bw><rsub|i><rsup|n+1,+>>|<point|3.00963060060854|2.07614465140891>>|<math-at|<small|<with|color|red|<frac|\<mu\><rsup|->|2>>\<mathLaplace\>x<rsub|i>>|<point|-2.81798471887816|-2.21453285752083>>|<math-at|<frac|\<mathLaplace\>x<rsub|i>|2>|<point|0.411363987696785|-2.12031887286678>>|<math-at|<small|<with|color|red|<frac|\<mu\><rsup|+>|2>>\<mathLaplace\>x<rsub|i>>|<point|3.03255641222384|-2.12887070115094>>|<math-at|<small|<bw><rsub|i><rsup|n+<frac|1|2>,->>|<point|-2.88652028390245|-1.29798384932741>>|<math-at|<small|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>|<point|0.291440666754862|-1.29853485910835>>|<math-at|<small|<bw><rsub|i><rsup|n+<frac|1|2>,+>>|<point|3.14034653657891|-1.31214>>|<with|dash-style|10|<line|<point|-1.04300153467399|2.54457686664027>|<point|-0.981984420404842|-2.43161972019639>>>|<with|dash-style|10|<line|<point|2.68986221383723|2.55466498789824>|<point|2.66207500992195|-2.17811549146713>|<point|2.65202279058874|-2.41126166265582>>>|<with|arrow-end|\<gtr\>|<line|<point|-2.320726948009|-0.0617641222383913>|<point|-2.34861433639441|1.74456840810773>>>|<with|arrow-end|\<gtr\>|<line|<point|0.597020713360667|-0.068758815423929>|<point|0.602163787450467|1.5776856554742>>>|<with|arrow-end|\<gtr\>|<line|<point|3.70308977482299|-0.124668495595117>|<point|3.68523026959743|1.58091425344576>>>|<math-at||<point|-6.84811|1.43843>>>>
    </hidden*>|<\hidden*>
      <with|font-base-size|8|<\small>
        <\equation*>
          <tabular*|<tformat|<cwith|3|3|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<bw><rsub|i><rsup|n+1,->>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,->-<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>-f<around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|)>>>|<row|<cell|<bw><rsub|i><rsup|n+1,\<ast\>>>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>-<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>-f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|)>>>|<row|<cell|<bw><rsub|i><rsup|n+1,+>>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,+>-<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>-f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>|)>>>>>>
        </equation*>
      </small>>
    </hidden*>|<\hidden*>
      <\equation*>
        <with|font-base-size|8|<small|<bw><rsub|i><rsup|n+1>=<bw><rsub|i><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x><around*|(|<with|font-series|bold|f><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>-<with|font-series|bold|f><around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|)>>>
      </equation*>
    </hidden*>>

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
          <with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n+<frac|1|2>,+>=2<bw><rsub|i><rsup|n>.
        </equation*>

        Then, the updated solution of MUSCL-Hancock scheme is in
        <math|\<Omega\>> under the CFL conditions

        <\equation>
          <tabular*|<tformat|<table|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|>>|<row|<cell|<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|>>|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x<rsub|i>/2>
          max<rsub|i\<in\>\<bbb-Z\>> <around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x<rsub|i>/2>
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
      <switch|<\shown>
        <\equation*>
          <with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n+<frac|1|2>,+>=2<bw><rsub|i><rsup|n>
        </equation*>
      </shown>|<\hidden>
        <\equation*>
          <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>|)>|)>-<frac|\<mathLaplace\>t|2\<mathLaplace\>x><around*|[|<around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>|]>>
        </equation*>
      </hidden>|<\hidden>
        <\equation*>
          <bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=<around*|(|<wide*|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>|)>|\<wide-underbrace\>><rsub|<bw><rsub|i><rsup|n>>|)>-<frac|\<mathLaplace\>t|2\<mathLaplace\>x><around*|[|<around*|(|f<around*|(|<with|color|blue|<with|font-series|bold|<bw>><rsub|i><rsup|n,->>|)>-f<around*|(|<with|color|blue|<with|font-series|bold|<bw>><rsub|i><rsup|n,+>>|)>|)>|]>
        </equation*>
      </hidden>>
    </shown>|<\hidden*>
      <\lemma>
        <label|lemma:muscl.step3.wss><math|(><with|font-series|bold|Link
        previous lemmas><math|)> Define <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>>
        to satisfy

        <\equation>
          <with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>=2<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>|)>|)>,<label|eq:lemma.1.used>
        </equation>

        where, as defined before,

        <\equation*>
          <with|color|red|\<mu\><rsup|->>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em><with|color|red|\<mu\><rsup|+>>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
        </equation*>

        Assume that <math|<bw><rsub|i><rsup|n,\<pm\>>> and
        <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> are in <math|\<Omega\>>.
        Consider the CFL conditions

        <\equation>
          <tabular|<tformat|<table|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|\<ast\>,\<ast\>>,<bw><rsub|i><rsup|n,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n,+>,<bw><rsub|i><rsup|\<ast\>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>>>><label|eq:new.cfl3>
        </equation>

        then <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>\<in\>\<Omega\>>.
      </lemma>
    </hidden*>|<\hidden*>
      <\remark>
        For conservative reconstruction, we actually have
        <math|<with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,\<ast\>>=<bw><rsub|i>>.
      </remark>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Final admissibility condition>

    <unroll|<\shown>
      <with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.529998gw|0.539998gh>>|gr-geometry|<tuple|geometry|0.956522par|0.339126par|center>|<graphics||<line|<point|1.98464|-2.90614>|<point|-0.706806455880407|0.342737134541606>>|<line|<point|-6.90399|-2.94341>|<point|6.59779732768885|-2.90769281651012>>|<with|dash-style|10|<line|<point|-6.90399|-2.94341>|<point|-6.86833575869824|3.20025797063104>>>|<with|dash-style|10|<line|<point|6.5978|-2.90769>|<point|6.54415266569652|3.11096044450324>>>|<point|-2.61154|-2.93205>|<math-at|x<rsub|i>|<point|-2.70707104114301|-3.28274242624686>>|<with|dash-style|10|<line|<point|-2.61154|-2.93205>|<point|-2.63563302024077|3.21811747585659>>>|<math-at|x<rsub|i+1/2>|<point|5.9012104775764|-3.24702341579574>>|<math-at|x<rsub|i-1/2>|<point|-6.92191427437492|-3.2648829210213>>|<math-at|x<rsub|i-1/4>|<point|-5.27135575340654|-3.28532361555761>>|<math-at|x<rsub|i+1/4>|<point|1.69252423997883|-3.2747246051065>>|<point|1.98875|-2.91989>|<line|<point|1.98875|-2.91989>|<point|3.0683622172245|0.503555364466199>>|<line|<point|1.98875|-2.91989>|<point|4.40716364598492|0.260136922873396>>|<line|<point|1.98875|-2.91989>|<point|3.50228204788993|0.46122172245006>>|<line|<point|1.98875|-2.91989>|<point|4.01028575208361|0.33422079640164>>|<point|-4.82983|-2.93792>|<line|<point|-4.82983|-2.93792>|<point|-6.34855801031883|0.347284693742559>>|<line|<point|-4.82983|-2.93792>|<point|-3.998677073687|0.362299907395158>>|<line|<point|-4.82983|-2.93792>|<point|-3.06773382722582|0.122056488953565>>|<line|<point|-4.82983|-2.93792>|<point|-3.6908651938087|0.227162984521762>>|<line|<point|-4.82983|-2.93792>|<point|-3.35302288662522|0.137071702606165>>|<math-at|<bw><rsub|i><rsup|n,+>|<point|-6.67009525069454|-2.62791043788861>>|<text-at|<with|font-series|bold|Proof.>|<point|-11.2954|3.11891>>|<math-at|<bw><rsub|i><rsup|\<ast\>,\<ast\>>|<point|-4.0865359174494|-2.5416225691229>>|<math-at|<bw><rsub|i><rsup|\<ast\>,\<ast\>>|<point|-1.30151144331261|-2.56173104908057>>|<math-at|<bw><rsub|i><rsup|n,-<rsub|>>|<point|3.83620518587115|-2.5717852890594>>|<text-at||<point|9.76821|-2.29027>>>>
    </shown>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<cwith|4|4|3|3|cell-halign|l>|<table|<row|<cell|<wide|<bw>|~><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,<frac|\<mathLaplace\>t|2>|)>
        d\<nocomma\>x>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><around*|(|<frac|x<rsub|i>-x<rsub|i-1/2>|2><bw><rsub|i><rsup|n,+>+<frac|\<mathLaplace\>x<rsub|i>|2><bw><rsub|i><rsup|\<ast\>,\<ast\>>+<frac|x<rsub|i+1/2>-x<rsub|i>|2><bw><rsub|i><rsup|n,->-<frac|\<mathLaplace\>t|2><around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><around*|(|<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->|)>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>>>>>
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Final admissibility condition>

    <unroll|<\shown>
      <\theorem>
        <\with|font-family|ss-sans|font-base-size|7>
          Consider the conservation law

          <\equation*>
            <bw><rsub|t>+<with|font-series|bold|f><around*|(|<bw>|)><rsub|x>=0
          </equation*>

          which<with|font-family|ss-sans|font-base-size|6|> preserves a
          convex set <math|\<Omega\>>. Let
          <math|<around*|{|<bw><rsub|i><rsup|n>|}><rsub|i\<in\>\<bbb-Z\>>> be
          the approximate solution at time level <math|n> and assume that
          <math|<bw><rsup|n><rsub|i>\<in\>\<Omega\>> for all
          <math|i\<in\>\<bbb-Z\>>. Consider <with|color|red|conservative
          reconstructions>

          <\equation*>
            <bw><rsub|i><rsup|n,+>=<bw><rsub|i>+<around*|(|x<rsub|i+1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>,<space|1em><bw><rsub|i><rsup|n,->=<bw><rsub|i>+<around*|(|x<rsub|i-1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>.
          </equation*>

          Define <math|<with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,\<pm\>>>
          to be

          <\equation*>
            <bw><rsub|i><rsup|\<ast\>,\<pm\>>=<bw><rsub|i><rsup|n>+2<around*|(|x<rsub|i\<pm\><frac|1|2>>-x<rsub|i>|)>
            <with|font-series|bold|\<sigma\>><rsub|i>
          </equation*>

          and assume that the slope <math|\<sigma\><rsub|i>> is chosen so
          that

          <\equation*>
            <bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\>.
          </equation*>

          Then, under time step restrictions <eqref|eq:new.cfl1>,
          <eqref|eq:new.cfl2>, <eqref|eq:new.cfl3>, the updated solution
          <math|<bw><rsub|i><rsup|n+1>>, defined by the MUSCL-Hancock
          procedure is in <math|\<Omega\>>.
        </with>
      </theorem>
    </shown>|<\hidden*>
      <\proof>
        <\with|font-base-size|7>
          We only need <math|<bw><rsub|i><rsup|n,\<pm\>>\<in\>\<Omega\>> to
          apply the previous lemmas. To that end, notice

          <\equation*>
            <bw><rsub|i><rsup|n,\<pm\>>=<frac|1|2><bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|1|2><bw><rsub|i><rsup|n>.
          </equation*>
        </with>
      </proof>
    </hidden*>>

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

      By concavity of <math|p>,

      <\equation*>
        *p<around*|(|\<theta\>*<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<around*|(|1-\<theta\>|)>*<bw><rsub|i><rsup|n>|)>\<gtr\>\<theta\>*p<around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>+<around*|(|1-\<theta\>|)>*p<around*|(|<bw><rsub|i><rsup|n>|)>\<gtr\>\<epsilon\>\<gtr\>0.
      </equation*>

      Thus, this <math|\<theta\>> will give us
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

    <\equation>
      <tabular*|<tformat|<table|<row|<cell|<bw><rsub|i><rsup|n,\<pm\>>>|<cell|:=>|<cell|\<kappa\><rsup|-1><around*|(|<with|font-series|bold|U><rsub|i><rsup|n,\<pm\>>|)>>>>>><label|eq:non.con.face.defn1>
    </equation>

    <\theorem>
      Assume that <math|<bw><rsub|i><rsup|n>\<in\>\<Omega\>> for all
      <math|i\<in\>\<bbb-Z\>>. Consider <math|<bw><rsub|i><rsup|n,\<pm\>>>
      defined in <math|<eqref|eq:non.con.face.defn1>>,
      <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>> defined so that

      <\equation*>
        \<mu\><rsup|-><bw><rsub|i><rsup|n+<frac|1|2>,->+<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+\<mu\><rsup|+><bw><rsub|i><rsup|n+<frac|1|2>,+>=2<bw><rsub|i><rsup|n>,
      </equation*>

      and <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> defined explicitly as

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<ast\>>=4<bw><rsub|i><rsup|n>-3<around*|(|\<mu\><rsup|-><bw><rsub|i><rsup|n,->+\<mu\><rsup|+><bw><rsub|i><rsup|n,+>|)>.
      </equation*>

      Assume that the slope is chosen so that

      <\equation*>
        <bw><rsub|i><rsup|n,\<pm\>>\<in\>\<Omega\>,<space|1em><bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<Omega\><space|1em>and<space|1em><with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,\<ast\>>\<in\>\<Omega\>.
      </equation*>

      Consider the same CFL conditions <eqref|eq:new.cfl1>,<eqref|eq:new.cfl2>,<eqref|eq:new.cfl3>.
      Then the updated solution <math|<bw><rsub|i><rsup|n+1>> of
      MUSCL-Hancock procedure is in <math|\<Omega\>>.
    </theorem>

    <\remark>
      The definition of <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> comes from

      <\equation*>
        <with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>=2<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|\<mu\><rsup|-><bw><rsub|i><rsup|n,->+\<mu\><rsup|+><bw><rsub|i><rsup|n,+>|)>|)>
      </equation*>
    </remark>
  </hidden>|<\hidden>
    <tit|ADER-DG : Predictor step>

    <unroll|<\shown>
      Current solution

      <\equation*>
        x\<in\>I<rsub|e>:<space|2em>u<rsub|h><rsup|n><around*|(|\<xi\>|)>=<big|sum><rsub|j=1><rsup|N+1>u<rsub|j><rsup|n>\<ell\><rsub|j><around*|(|\<xi\>|)>
      </equation*>
    </shown>|<\hidden*>
      Cell local space-time solution and flux:
      <math|\<tau\>=<around*|(|t-t<rsub|n>|)>/\<mathLaplace\>t>

      <\equation*>
        <wide|u|~><rsub|h><around*|(|\<xi\>,\<tau\>|)>=<big|sum><rsub|r,s=1><rsup|N+1><wide|u|~><rsub|r
        s>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>,<space|1em><wide|f|~><rsub|h><around*|(|\<xi\>,\<tau\>|)>=<big|sum><rsub|r,s=1><rsup|N+1>f<around*|(|<wide|u|~><rsub|r\<nocomma\>s>|)>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>.
      </equation*>
    </hidden*>|<\hidden*>
      Find <math|<wide|u|~><rsub|h>> by cell local Galerkin method

      <\equation*>
        <big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>><around*|(|\<partial\><rsub|t><wide|u|~><rsub|h>+\<partial\><rsub|x><wide|f|~><rsub|h>|)>*\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>*d\<nocomma\>x
        d\<nocomma\> t,<space|2em>1\<leq\>r,s\<leq\>N+1.
      </equation*>
    </hidden*>|<\hidden*>
      Integrate by parts in time

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|-<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>><with|color|red|<wide|u|~><rsub|h>>\<ell\><rsub|r><around*|(|\<xi\>|)>\<partial\><rsub|t>\<ell\><rsub|s><around*|(|\<tau\>|)>
        d x d t+<big|int><rsub|I<rsub|e>><with|color|red|<with|color|red|<wide|u|~><rsub|h>><around*|(|\<xi\>,1|)>>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|1|)>
        d x-<big|int><rsub|I<rsub|e>><with|color|blue|u<rsub|h><rsup|n><around*|(|\<xi\>|)>>\<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|0|)>
        d \<xi\>>>|<row|<cell|+<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>>\<partial\><rsub|x><wide|f|~><rsub|h>
        \<ell\><rsub|r><around*|(|\<xi\>|)>\<ell\><rsub|s><around*|(|\<tau\>|)>d
        x d t=0.>>>>>
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|ADER correction step>

    <unroll|<\shown>
      <\equation*>
        <big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|0><rsup|1><around*|(|\<partial\><rsub|t>u<rsub|h>+\<partial\><rsub|x>f<around*|(|u<rsub|h>|)>|)>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t=0
      </equation*>
    </shown>|<\hidden*>
      Integrate by parts in space:

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>*\<ell\><rsub|i><around*|(|\<xi\>|)>*d
        x+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>><wide|f|~><rsub|h>\<partial\><rsub|x>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|<space|1em>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>\<ell\><rsub|i><around*|(|0|)>d
        t-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>\<ell\><rsub|i><around*|(|1|)>d
        t.>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      Another integration by parts :\ 

      <\equation*>
        <tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>d
        x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>\<ell\><rsub|i><around*|(|\<xi\>|)>d
        x- <big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>>\<partial\><rsub|x><wide|f|~><rsub|h>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>|)>\<ell\><rsub|i><around*|(|0|)>d
        t>>|<row|<cell|>|<cell|>|<cell|-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>|)>\<ell\><rsub|i><around*|(|1|)>d
        t,>>>>
      </equation*>
    </hidden*>|<\hidden*>
      Quadrature on solution points :

      <switch|<\shown>
        <\equation*>
          <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
          \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>+<frac|\<ell\><rsub|i><around*|(|0|)>|w<rsub|i>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>d
          t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<frac|\<ell\><rsub|i><around*|(|1|)>|w<rsub|i>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>
          d t>>>>>
        </equation*>
      </shown>|<\hidden>
        <\equation*>
          <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
          \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>-<with|color|red|g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>d
          t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<with|color|red|g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>
          -<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>d t>>>>>
        </equation*>
      </hidden>>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|ADER and LWFR for constant linear advection>

    <unroll|<\shown>
      For constant linear advection

      <\equation*>
        u<rsub|t>+u<rsub|x>=0,
      </equation*>

      the ADER update is given by

      <\equation>
        <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-\<partial\><rsub|x><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
        \ d t>>|<row|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>-g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around*|(|<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>
        d t,<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>
        d t|)>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|0,\<tau\>|)>d
        t|]>>>|<row|<cell|>|<cell|>|<cell|<space|1em>-g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around*|(|<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>
        d t,<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>
        d t|)>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|1,\<tau\>|)>
        d t|]>>>>>><label|eq:ader.linear.update>
      </equation>
    </shown>|<\hidden*>
      The LWFR update is given by

      <\equation>
        u<rsub|i><rsup|n+1>=u<rsub|i><rsup|n>-\<partial\><rsub|x>U<rsub|h><around*|(|\<xi\><rsub|i>|)>-g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around|(|U<rsub|e-<frac|1|2>><rsup|->,U<rsub|e-<frac|1|2>><rsup|+>|)>-U<rsub|h><around*|(|0|)>|]>-g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around|(|U<rsub|e+<frac|1|2>><rsup|->,U<rsub|e+<frac|1|2>><rsup|+>|)>-U<rsub|h><around*|(|1|)>|]>,<label|eq:lwfr.linear.update>
      </equation>

      where

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|U<rsub|h><rsup|n>>|<cell|=>|<cell|u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t\<nocomma\>t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>>>|<row|<cell|>|<cell|=>|<cell|u-<frac|\<mathLaplace\>t|2>u<rsub|x>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|x\<nocomma\>x>+\<cdots\>+<around*|(|-1|)><rsup|N><frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|x>.>>>>>
      </equation*>
    </hidden*>>
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
    </shown>|<\hidden*>
      <with|font-series|bold|Proof.> Let <math|u<rsub|e><rsup|n>=u<rsub|e><rsup|n><around*|(|x|)>>
      denote the solution polynomial at time level <math|n> in element
      <math|e>.
    </hidden*>|<\hidden*>
      Then, \ <math|<wide|u|~><rsub|h><around*|(|x,t|)>:=u<rsub|e><rsup|n><around*|(|x-<around*|(|t-t<rsup|n>|)>|)>>
      is a weak solution of the equation

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|4|4|cell-halign|r>|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<wide|u|~><rsub|t>+<wide|u|~><rsub|x>>|<cell|=>|<cell|0,>|<cell|x\<in\><around*|[|x<rsub|e-1/2>,x<rsub|e+1/2>|]>,t\<in\><around*|(|t<rsub|n>,t<rsub|n+1>|]>,>>|<row|<cell|<wide|u|~><around*|(|x,t<rsup|n>|)>>|<cell|=>|<cell|u<rsup|n><rsub|e><around*|(|x|)>,>|<cell|t=t<rsub|n>.>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      Since the predictor equation has a <with|color|red|unique> solution of
      degree <math|N> <cite|Jackson2017|Dumbser2009>, the specified
      <math|<wide|u|~><rsub|h>> must be <with|color|red|the> predictor
      solution.
    </hidden*>|<\hidden*>
      <unroll|<\shown>
        <\math>
          <\equation*>
            <tabular*|<tformat|<cwith|2|2|4|4|cell-halign|l>|<cwith|1|1|2|2|cell-halign|r>|<cwith|3|3|4|4|cell-halign|l>|<cwith|1|1|4|4|cell-halign|l>|<cwith|4|4|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|<wide|u|~><rsub|h><around*|(|x,t|)>>|<cell|=>|<cell|<wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>+<around*|(|t-t<rsup|n>|)><pdv||t><wide|u|~><rsub|h><rsub|><around*|(|x,t<rsup|n>|)>+\<ldots\>+<frac|<around*|(|t-t<rsup|n>|)><rsup|N>|N!><pdv*|N||t><wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>>>|<row|<cell|>|<cell|>|<cell|=>|<cell|u<rsup|n><around*|(|x|)>-<around*|(|t-t<rsup|n>|)>
            <pdv||x>u<rsup|n><around*|(|x|)>+\<ldots\>+<around*|(|-1|)><rsup|N><frac|<around*|(|t-t<rsup|n>|)><rsup|N>|N!><pdv*|N||x>u<rsup|n><around*|(|x|)>>>|<row|<cell|\<Rightarrow\>>|<cell|
            <frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|x,t|)>
            d t>|<cell|=>|<cell|u<rsup|n><around*|(|x|)>-<frac|\<mathLaplace\>t|2>
            <pdv||x>u<rsub|><rsup|n><around*|(|x|)>+\<ldots\>+<around*|(|-1|)><rsup|N><frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N||x>u<rsup|n>d
            t,>>|<row|<cell|\<Rightarrow\>>|<cell|
            <frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><wide|u|~><rsub|h><around*|(|x,t|)>
            d t>|<cell|=>|<cell|U<rsub|h><rsup|n><around*|(|x|)>>>>>>
          </equation*>
        </math>

        Thus, the ADER update <eqref|eq:ader.linear.update> and the LWFR
        update <eqref|eq:lwfr.linear.update> are the same.<space|2em><qed>
      </shown>>
    </hidden*>>

    \;

    \;
  </hidden>|<\hidden>
    <tit|Numerical verification of equivalence of ADER and LW-D2>

    <\big-figure|<wide-tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
      <image|figures/equivalence_ader/error1.pdf|0.35par|||>
    </cell>|<\cell>
      <image|figures/equivalence_ader/error2.pdf|0.35par|||>
    </cell>>|<row|<\cell>
      <math|<with|font-series||N=1>>
    </cell>|<\cell>
      <math|<with|font-series||N=2>>
    </cell>>|<row|<\cell>
      <image|figures/equivalence_ader/error3.pdf|0.35par|||>
    </cell>|<\cell>
      <image|figures/equivalence_ader/error4.pdf|0.35par|||>
    </cell>>|<row|<\cell>
      <math|N=3>
    </cell>|<\cell>
      <math|N=4>
    </cell>>>>>>
      <math|L<rsup|2>> error comparison of ADER, LWFR and RKFR for linear
      advection equation with <with|font-series|bold|wave packet> initial
      data <math|u<rsub|0><around*|(|x|)>=e<rsup|-10*x<rsup|2>>*sin<around*|(|10*\<pi\>*x|)>>
      and <with|font-series|bold|periodic boundary conditions> on
      <math|<around*|[|-1,1|]>> with <math|120> degrees of freedom each.
    </big-figure>
  </hidden>|<\hidden>
    <tit|Numerical verification of equivalence of ADER and LW-D2>

    <\equation*>
      <around*|\<\|\|\>|u<around*|(|t|)>|\<\|\|\>><rsup|\<ast\>><rsub|2>\<assign\><frac|<around*|\<\|\|\>|u<around*|(|t|)>|\<\|\|\>><rsub|2>-<around*|\<\|\|\>|u<around*|(|0|)>|\<\|\|\>><rsub|2>|<around*|\<\|\|\>|u<around*|(|0|)>|\<\|\|\>><rsub|2>>
    </equation*>

    <\big-figure>
      <wide-tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|4|4|2|2|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
        <image|figures/equivalence_ader/energy1.pdf|0.32par|||>
      </cell>|<\cell>
        <image|figures/equivalence_ader/energy2.pdf|0.32par|||>
      </cell>>|<row|<\cell>
        <math|N=1>
      </cell>|<\cell>
        <math|N=2>
      </cell>>|<row|<\cell>
        <image|figures/equivalence_ader/energy3.pdf|0.32par|||>
      </cell>|<\cell>
        <image|figures/equivalence_ader/energy4.pdf|0.32par|||>
      </cell>>|<row|<\cell>
        <math|N=3>
      </cell>|<\cell>
        <math|N=4> in semi-log scales
      </cell>>>>>
    <|big-figure>
      Energy comparison of ADER, LWFR and RKFR for linear advection equation
      with <with|font-series|bold|smooth initial data>
      <math|u<rsub|0><around*|(|x|)>=sin<around*|(|2\<pi\>x|)>> and
      <with|font-series|bold|periodic boundary conditions> on
      <math|<around*|[|-1,1|]>> with <math|120> degrees of freedom each.
    </big-figure>
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
          <around*|\<\|\|\>|u<rsup|n+1><rsub|ADER>-u<rsup|n+1><rsub|LW>|\<\|\|\>><rsub|\<infty\>>=O<around*|(|\<mathLaplace\>x<rsup|N+1>|)>.
        </equation*>
      </theorem>
    </shown>|<\hidden*>
      <with|font-series|bold|Idea of proof.> The weak formulation will give
      us

      <\equation>
        <wide|u|~><rsub|t>+<around*|(|<wide|f|~><rsub|h>|)><rsub|x>=0,<label|eq:quadrature1>
      </equation>

      for all <math|<around*|(|x<rsub|r>,t<rsub|s>|)>> where
      <math|s\<gtr\>0>, i.e., <math|t<rsub|s>\<gtr\>t<rsup|n>>. Then, we can
      extrapolate to <math|t=t<rsup|n>> as
    </hidden*>|<\hidden*>
      <\equation*>
        <wide|u|~><rsub|t>+<around*|(|<wide|f|~><rsub|h>|)><rsub|x>=O<around*|(|\<mathLaplace\>t<rsup|N>|)><space|2em><text|at>
        <space|1em>t=t<rsup|n>,
      </equation*>
    </hidden*>|<\hidden*>
      so that we will have

      <\equation*>
        <tabular|<tformat|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>>|<cell|=>|<cell|<wide|u|~><rsub|h><around*|(|x,t<rsup|n>|)>+\<mathLaplace\>t*<around*|(|<wide|f|~><rsub|h>|)><rsub|x>+\<ldots\>+<frac|\<mathLaplace\>t<rsup|N>|N!>*<pdv*|N-1||t><around*|(|<wide|f|~><rsub|h>|)><rsub|x>+O<around*|(|\<mathLaplace\>t<rsup|N+1>|)>.>>>>>
      </equation*>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      \;
    </padded-center>

    \;

    <doc-data|<doc-title|<with|font-base-size|12|Numerical Results>>>

    \;
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      \;
    </padded-center>

    \;

    <doc-data|<doc-title|<with|font-base-size|12|<math|u<rsub|t>+u<rsub|x>=0>>>>

    \;
  </hidden>|<\hidden>
    <tit|Convergence of pure MUSCL-Hancock method>

    <\equation*>
      <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|5|5|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|u<rsub|t>+u<rsub|x>>|<cell|=>|<cell|0,>|<cell|<space|1em>>|<cell|x\<in\><around*|[|-1,1|]>,<space|1em>t\<gtr\>0,>>|<row|<cell|u<rsub|0><around*|(|x|)>>|<cell|=>|<cell|sin<around*|(|2*\<pi\>*x|)>,>|<cell|>|<cell|x\<in\><around*|[|-1,1|]>.>>>>>
    </equation*>

    <\center>
      <\big-figure|<image|figures/scalar/convergence_pure_fv.pdf|0.4par|||>>
        Convergence test of MUSCL-Hancock setting all
        <math|\<alpha\><rsub|e>=1> showing close to second order convergence
        <with|color|red|Mention <math|t>>\ 

        <with|color|red|Repetition AVOID>
      </big-figure>
    </center>
  </hidden>|<\hidden>
    <tit|Optimal convergence with limiter>

    <\equation*>
      <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|5|5|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|u<rsub|t>+u<rsub|x>>|<cell|=>|<cell|0,>|<cell|<space|1em>>|<cell|x\<in\><around*|[|-2,2|]>,<space|1em>t\<gtr\>0,>>|<row|<cell|u<rsub|0><around*|(|x|)>>|<cell|=>|<cell|e<rsup|-10*x<rsup|2>>*sin<around*|(|10*\<pi\>*x|)>,>|<cell|>|<cell|x\<in\><around*|[|-2,2|]>.>>>>>
    </equation*>

    <\big-figure|<image|figures/scalar/convergence_wpack.pdf|0.4par|||>>
      Convergence analysis with wave packet test case for <math|N=3,4> at
      <math|t=1>
    </big-figure>
  </hidden>|<\hidden>
    <tit|Handling discontinuities>

    <center|<small-figure|<image|figures/scalar/composite_good_only.pdf|0.6par|||>|Composite
    signal <cite|Jiang1996> on a mesh of 60 cells for <math|N=4> comparing
    TVB limiter with parameter <math|M=50> and MUSCL-Hancock (MH) blending.
    Here, the smoothness indicator function has been set with
    <math|\<beta\><rsub|1>=0.1> and <math|\<beta\><rsub|2>=1.0>.>>

    <\equation*>
      <tabular*|<tformat|<cwith|2|2|5|5|cell-halign|l>|<table|<row|<cell|u<rsub|t>+u<rsub|x>>|<cell|=>|<cell|0,>|<cell|<space|1em>>|<cell|x\<in\><around*|[|-1,1|]>,<space|1em>t\<gtr\>0,>>|<row|<cell|u<around*|(|x,0|)>>|<cell|=>|<cell|u<rsub|0><around*|(|x|)>,>|<cell|>|<cell|x\<in\><around*|[|-1,1|]>,>>>>>
    </equation*>

    <with|font-base-size|5|<\equation*>
      <tabular*|<tformat|<table|<row|<cell|<tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|u<rsub|0><around*|(|x|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|G<around*|(|x,\<beta\>,z|)>,>|<cell|<space|2em>>|<cell|x\<in\><around*|[|-0.8,0.6|]>,>>|<row|<cell|1,>|<cell|>|<cell|x\<in\><around*|[|-0.4,-0.2|]>,>>|<row|<cell|1-<around*|\||10<around*|(|x-0.1|)>|\|>,>|<cell|>|<cell|x\<in\><around*|[|0,0.2|]>,>>|<row|<cell|F<around*|(|x,\<alpha\>,a|)>,>|<cell|>|<cell|x\<in\><around*|[|0.4,0.6|]>,>>|<row|<cell|0,>|<cell|>|<cell|elsewhere,>>>>>>|<cell|x\<in\><around*|[|-1,1|]>,>>>>>>|<cell|<tabular*|<tformat|<table|<row|<cell|G<around*|(|x,\<beta\>,z|)>=e<rsup|-\<beta\><around*|(|x-z|)><rsup|2>>,<space|1em>F<around*|(|x,\<alpha\>,a|)>=<sqrt|1-\<alpha\><rsup|2><around*|(|x-a|)><rsup|2>>>>|<row|<cell|a=0.5,<space|1em>z=-0.7,<space|1em>\<delta\>=0.005,<space|1em>\<alpha\>=10,<space|1em>\<beta\>=<frac|log
      2|36*\<delta\><rsup|2>>.>>>>>>>>>>
    </equation*>>
  </hidden>|<\hidden>
    <switch|<\shown>
      \;

      \;

      \;

      \;

      <doc-data|<doc-title|<with|font-base-size|10|<huge|1-D Euler's
      equations>>>>

      \;

      \;

      \;

      <\equation*>
        <frac|\<partial\>|\<partial\>*t><matrix|<tformat|<table|<row|<cell|\<rho\>>>|<row|<cell|\<rho\>*v>>|<row|<cell|E>>>>>+<frac|\<partial\>|\<partial\>*x><matrix|<tformat|<table|<row|<cell|\<rho\>*v>>|<row|<cell|p+\<rho\>*v<rsup|2>>>|<row|<cell|<around|(|E+p|)>*v>>>>>=\<b-0\>
      </equation*>

      where <math|\<rho\>,v,p> and <math|E> denote the density, velocity,
      pressure and total energy of the gas, respectively. For a polytropic
      gas, an equation of sate <math|E=E<around|(|\<rho\>,v,p|)>> which forms
      the system closed is given as

      <\equation*>
        E=E<around|(|\<rho\>,v,p|)>=<frac|p|\<gamma\>-1>+<frac|1|2>*\<rho\>*v<rsup|2>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Shu-Osher>

    <\big-figure|<image|figures/euler1d/shuosher.pdf|0.6par|||>>
      Density profile of Shu-Osher test case <cite|Shu1989> at <math|t=1.8>
      for accuracy comparison of TVB limiter
      <math|<around*|(|M=300,<cite|Qiu2005b>|)>>, blending limiter with
      MUSCL-Hancock (MH) and First Order (FO) blending for degree <math|N=4>
      on a grid of <math|400> cells.
    </big-figure>

    Transmissive boundary conditions on <math|<around*|[|-5,5|]>> with

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|(3.857143,
      2.629369, 10.333333),>|<cell|<space|1em>>|<cell|if
      x\<less\>-4,>>|<row|<cell|(1+0.2*sin(5x),0,1),>|<cell|>|<cell|if
      x\<geq\>-4,>>>>>
    </equation*>

    and solution is plotted at <math|t=1.8>.
  </hidden>|<\hidden>
    <tit|Blast>

    <\big-figure|<image|figures/euler1d/blast.pdf|0.6par|||>>
      Density profile of Blast test of Woodward and Collela
      <cite|Woodward1984> for comparison of TVB limiter
      <math|<around*|(|M=300,<cite|Qiu2005b>|)>>, blending limiter with
      MUSCL-Hancock (MH) and First Order (FO) blending for degree <math|N=4>
      on a grid of <math|400> cells.
    </big-figure>

    Solid wall boundary conditions on <math|<around*|[|0,1|]>> with intial
    condition

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1,0,1000|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\>0.1,>>|<row|<cell|<around*|(|1,0,0.01|)>,>|<cell|>|<cell|0.1\<less\>x\<less\>0.9,>>|<row|<cell|<around*|(|1,0,100|)>,>|<cell|>|<cell|x\<gtr\>0.9,>>>>>
    </equation*>

    and solution is plotted at <math|t=0.038>.
  </hidden>|<\hidden>
    <tit|Sedov's blast wave>

    <\big-figure>
      <image|figures/euler1d/sedov_density.pdf|0.44par|||><image|figures/euler1d/sedov_pressure.pdf|0.44par|||>
    <|big-figure>
      Density and pressure profiles of Sedov blast test case
      <cite|SEDOV1959146> on <math|201> elements for degree <math|N=4> to
      demonstrate admissibility preservation in very severe cases.
    </big-figure>

    We impose transmissive boundary conditions on <math|<around*|[|-1,1|]>>
    with number of elements <math|M<rsub|elem>=201> and with the following
    intial data

    <\equation*>
      \<rho\><around*|(|x|)>=1,<space|1em>v<around*|(|x|)>=0,<space|1em>p<around*|(|x|)>=<choice|<tformat|<table|<row|<cell|<around*|(|\<gamma\>-1|)><frac|3.2\<times\>10<rsup|6>|\<mathLaplace\>x>,>|<cell|<space|1em>>|<cell|<around*|\||x|\|>\<leq\><frac|\<mathLaplace\>x|2>,>>|<row|<cell|<around*|(|\<gamma\>-1|)>10<rsup|-12>,>|<cell|>|<cell|otherwise,>>>>>
    </equation*>

    where <math|\<mathLaplace\>x> is the mesh grid spacing. The odd number of
    elements are chosen so that the middle element

    <\equation*>
      e=<frac|M<rsub|elem>+1|2>
    </equation*>

    is centred at the origin. The solution is plotted at <math|t=0.004>.
  </hidden>|<\hidden>
    <tit|Double rarefaction>

    <\big-figure|<image|figures/euler1d/double_rarefaction.pdf|0.5par|||><image|figures/euler1d/double_rarefaction_pressure.pdf|0.5par|||>>
      Density and pressure profiles of Double rarefaction test case of
      <cite|Linde1997> on a mesh of 2000 elements for degree <math|N=4> to
      demonstrate admissibility preservation in a low density test case.
    </big-figure>

    \;

    We impose transmissive boundary conditions on <math|<around*|[|-1,1|]>>
    with intial conditions

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|7,-1,0.2|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\>0,>>|<row|<cell|<around*|(|7,1,0.2|)>,>|<cell|>|<cell|if
      x\<gtr\>0.>>>>>
    </equation*>

    The solution is plotted at <math|t=0.6>.
  </hidden>|<\hidden>
    <tit|Leblanc's test>

    <\big-figure|<image|figures/euler1d/leblanc.pdf|0.5par|||><image|figures/euler1d/leblanc_pressure.pdf|0.5par|||>>
      Density and pressure profiles of Leblance test case on a mesh of 6400
      elements for degree <math|N=4> to demonstrate admissibility
      preservation.
    </big-figure>

    We impose transmissive boundary conditions on <math|<around*|[|-10,10|]>>
    with intial conditions

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|2,0,10<rsup|9>|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\>0,>>|<row|<cell|<around*|(|0.001,0,1|)>,>|<cell|>|<cell|if
      x\<gtr\>0.>>>>>
    </equation*>

    The solution is plotted at <math|t=0.0001>.
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    <\padded-center>
      \;
    </padded-center>

    \;

    \;

    <doc-data|<doc-title|<with|font-base-size|12|2-D Results>>>

    \;
  </hidden>|<\hidden>
    <tit|2-D Composite signal <cite|LeVeque1996>>

    <\wide-tabular>
      <tformat|<table|<row|<\cell>
        \;

        <center|<small-figure|<image|figures/la2d/rotate_composite/initial.pdf|0.35par|||>|Initial
        data>>
      </cell>>|<row|<\cell>
        <\wide-tabular>
          <tformat|<table|<row|<\cell>
            <small-figure|<image|figures/la2d/rotate_composite/tvb.pdf|0.35par|||>|TVB
            with <math|M=100>>
          </cell>|<\cell>
            <small-figure|<image|figures/la2d/rotate_composite/blend.pdf|0.35par|||>|MUSCL-Hancock
            blending>
          </cell>>>>
        </wide-tabular>
      </cell>>>>
    </wide-tabular>

    <\equation*>
      We compare solutions on <text|a> <math|100\<times\>100> mesh with
      degree <math|N=4> at <math|t=2*\<pi\>> (1 period).
    </equation*>
  </hidden>|<\hidden>
    <tit|Double Mach Reflection>

    <\big-figure|<image|figures/euler2d/dmr/no_zoom_mh.pdf|1.0par|||>>
      Density profile of Double Mach reflection <cite|Woodward1984> test case
      on a mesh of <math|568\<times\>142> cells using HLLC flux with
      MUSCL-Hancock blending limiter for degree <math|N=4>.
    </big-figure>

    The problem consists of a shock impinging on a wedge/ramp which is
    inclined by 30 degrees. The solution consists of a self similar shock
    structure with two triple points. The situation is simulated in the
    rectangular domain <math|\<Omega\>=<around*|[|0,4|]>\<times\><around*|[|0,1|]>>,
    where the wedge/ramp is positioned at <math|x=1/6,y=0>. Defining
    <math|<with|font-series|bold|u><rsub|b>=<with|font-series|bold|u><rsub|b><around*|(|x,y,t|)>>
    with primitive variables given by

    <\equation*>
      <around*|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|8,8.25*cos<around*|(|<frac|\<pi\>|6>|)>,-8.25*sin<around*|(|<frac|\<pi\>|6>|)>,116.5|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\><frac|1|6>+<frac|y+20*t|<sqrt|3>>,>>|<row|<cell|<around*|(|1.4,0,0,1|)>,>|<cell|>|<cell|if
      x\<gtr\><frac|1|6>+<frac|y+20*t|<sqrt|3>>,>>>>>
    </equation*>

    we define the initial condition to be
    <math|<with|font-series|bold|u><rsub|0>=<with|font-series|bold|u><rsub|b><around*|(|x,y,0|)>>.
    With <math|<with|font-series|bold|u><rsub|b>>, we impose inflow boundary
    conditions at the left side <math|<around*|{|0|}>\<times\> [0, 1]>,
    outflow boundary conditions both at <math|[0, 1/6] \<times\> {0}> and
    <math|{4} \<times\> [0, 1]>, reflecting boundary conditions a <math|[1/6,
    4] \<times\> {0}> and inflow boundary conditions at the upper side
    <math|[0, 4] \<times\> {1}>. The test is run till <math|t=0.2>.
  </hidden>|<\hidden>
    <tit|Double Mach Reflection>

    <center|<small-figure|<image|figures/euler2d/dmr/trixi_zoomed.pdf|0.44par|||>|<verbatim|Trixi.jl>
    using First Order blending limiter for Runge-Kutta on a mesh of
    <math|568\<times\>142> elements with Rusanov flux for <math|N=4>.>>

    <center|<small-figure|<image|figures/euler2d/dmr/mh_zoomed.pdf|0.44par|||>|LWFR
    using MUSCL-Hancock blending limiter with Rusanov flux on a mesh of
    <math|568*\<times\>142> elements for <math|N=4>.>>

    \;
  </hidden>|<\hidden>
    <tit|Double Mach Reflection>

    <center|<small-figure|<image|figures/euler2d/dmr/mh_hllc_zoomed.pdf|0.44par|||>|LWFR
    using MUSCL-Hancock blending limiter with Rusanov flux on a mesh of
    <math|568\<times\>142> elements for <math|N=4>. The smoothness indicator
    uses <math|\<beta\><rsub|1>=0.1> and <math|\<beta\><rsub|2>=1.0>.>>

    <center|<small-figure|<image|figures/euler2d/dmr/mh_zoomed.pdf|0.44par|||>|LWFR
    using MUSCL-Hancock blending limiter with Rusanov flux on a mesh of
    <math|568\<times\>142> elements for <math|N=4>.>>
  </hidden>|<\hidden>
    <tit|Kelvin-Helmholtz Instability>

    \;

    <center|<small-figure|<image|figures/euler2d/kh_schaal/trixi.pdf|0.43par|||><space|1em><image|figures/euler2d/kh_schaal/lwfr.pdf|0.43par|||>|Density
    profile of Kelvin-Helmholtz test <cite|volkner2010|schaal2015> with
    <verbatim|Trixi.jl> (left) and MUSCL-Hancock (right). Both the tests are
    with <math|N=4> on a mesh of <math|256<rsup|2>> elements.>>

    <\with|font-base-size|6>
      The test is run on <math|<around*|[|0,1|]><rsup|2>> with periodic
      boundary conditions. The initial condition is given by

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<tabular*|<tformat|<table|<row|<cell|p=2.5,>|<cell|<space|2em>>|<cell|<around*|(|\<rho\>,v<rsub|1>|)>=<choice|<tformat|<table|<row|<cell|<around*|(|2,0.5|)>>|<cell|<space|1em>>|<cell|if
        0.25\<less\>y\<less\>0.75,>>|<row|<cell|<around*|(|1,-0.5|)>>|<cell|>|<cell|otherwise,>>>>>>>>>>>>|<row|<cell|v<rsub|2><around*|(|x,y|)>=w<rsub|0>*sin<around*|(|4*\<pi\>*x|)>*<around*|{|exp<around*|[|-<frac|<around*|(|y-0.25|)><rsup|2>|2*\<sigma\><rsup|2>>|]>+exp<around*|[|-<frac|<around*|(|y-0.75|)><rsup|2>|2*\<sigma\><rsup|2>>|]>|}>.>>>>>
      </equation*>

      where <math|\<omega\><rsub|0>=0.1,\<sigma\>=0.05/<sqrt|2>>, adiabatic
      index is <math|\<gamma\>=7/5>. The solution is plotted at <math|t=0.4>.
    </with>
  </hidden>|<\hidden>
    <tit|2-D Sedov blast>

    <\big-figure>
      \;

      <image|figures/euler2d/sedov_Density.pdf|0.5par|||><image|figures/euler2d/sedov_Pressure.pdf|0.5par|||>
    <|big-figure>
      Density and pressure profile of 2-D Sedov blast test case
      <cite|SEDOV1959146> on a mesh of <math|160<rsup|2>> elements for degree
      <math|N=4> to demonstrate admissibility preservation in very severe
      cases.
    </big-figure>

    We solve on <math|<around*|[|0,1.1|]>\<times\><around*|[|0,1.1|]>> with
    solid wall boundary conditions on left and bottom, transmissive boundary
    conditions on right and top. The initial condition is given by

    <\equation*>
      \<rho\>=1.0,<space|1em>v<rsub|1>=v<rsub|2>=0.0,<space|1em>E<around*|(|x,y|)>=<choice|<tformat|<table|<row|<cell|<frac|0.244816|\<mathLaplace\>x*\<mathLaplace\>y>>|<cell|<space|1em>>|<cell|x\<less\>\<mathLaplace\>x,y\<less\>\<mathLaplace\>y,>>|<row|<cell|10<rsup|-12>>|<cell|>|<cell|otherwise.>>>>>
    </equation*>

    The solution is plotted at <math|t=0.001>.

    <\equation*>
      \;
    </equation*>
  </hidden>|<\hidden>
    <tit|Astrophysial jet <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    <unroll|<\shown>
      We simulate Mach 80 jetflow <cite|b0ca7a5eeb40423caed7422ff5e0b525>
      without radiative cooling, <math|\<gamma\>=5/3> on
      <math|<around*|[|0,2|]>\<times\><around*|[|-0.5,0.5|]>> with initial
      ambient gas

      <\equation*>
        <around*|(|\<rho\>,u,v,p|)>=<around*|(|0.5,0,0,0.4127|)>.
      </equation*>

      The boundary condition on the right, top and bottom are outflow. For
      the left, we have the high speed jetflow. Mach 80 is simulated by the
      inflow

      <\equation*>
        <around*|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|5,30,0,0.4127|)>,>|<cell|<space|1em>>|<cell|if
        y\<in\><around*|[|-0.05,0.05|]>,>>|<row|<cell|<around*|(|0.5,0,0,0.4127|)>,>|<cell|>|<cell|otherwise,>>>>>
      </equation*>

      and Mach 2000 is simulated on the domain
      <math|<around*|[|0,1|]>\<times\><around*|[|-0.25,0.25|]>> with inflow

      <\equation*>
        <around*|(|\<rho\>,u,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|5,30,0,0.4127|)>,>|<cell|<space|1em>>|<cell|if
        y\<in\><around*|[|-0.05,0.05|]>,>>|<row|<cell|<around*|(|0.5,0,0,0.4127|)>,>|<cell|>|<cell|otherwise.>>>>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Astrophysical jet Mach 80 <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    <\big-figure|<image|figures/euler2d/M80/lwfr.pdf|0.6par|||>>
      Density profile of Mach 80 jet in log scales on a mesh of
      <math|448\<times\>224> with <math|N=4>
    </big-figure>

    The terminal time is <math|t=0.07>.
  </hidden>|<\hidden>
    <tit|Astrophysical jet Mach 2000 <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    <\big-figure|<image|figures/euler2d/M2000/lwfr.pdf|0.45par|||>>
      Density profile of Mach 2000 jet in log scales on a mesh of
      <math|640\<times\>320> mesh with <math|N=4>
    </big-figure>

    The terminal time is <math|t=0.001>.
  </hidden>|<\hidden>
    <tit|Summary and future plans>

    <\itemize>
      <unroll|<\shown>
        <item>A sub-cell based blending limiter based on
        <cite|HENNEMANN2021109935> with MUSCL-Hancock reconstruction has been
        constructed for Lax-Wendroff schemes. <with|color|red|Mention benefit
        of MH over FO>
      </shown>|<\hidden*>
        <item>The MUSCL-Hancock residual for relevant grids has been proven
        to be admissibility preserving following the ideas of Berthon
        <cite|Berthon2006>.
      </hidden*>|<\hidden*>
        <item>By correcting Lax-Wendroff time averaged flux during the face
        loop, an admissibility preserving Lax-Wendroff scheme has been
        constructed.
      </hidden*>|<\hidden*>
        <item>Lax-Wendroff schemes and ADER schemes were proved to be
        equivalent for linear equations, and mentioned to be
        <with|font-shape|italic|close> for non-linear equations.
      </hidden*>|<\hidden*>
        <item>Mild instability for ADER and LW schemes was detected for
        <math|N=4>.
      </hidden*>|<\hidden*>
        <with|font-series|bold|<with|font-base-size|11|Future Plans>>
      </hidden*>|<\hidden*>
        <item>Extend the scheme to unstructured grids.
      </hidden*>|<\hidden*>
        \;
      </hidden*>>
    </itemize>
  </hidden>|<\hidden>
    <tit|References>

    <\bibliography|bib|tm-plain|references>
      <\bib-list|22>
        <bibitem*|1><label|bib-oldpaper>Arpit Babbar, Sudarshan<nbsp>Kumar
        Kenettinkara<localize|, and >Praveen Chandrashekar.
        <newblock>Lax-wendroff flux reconstruction method for hyperbolic
        conservation laws. <newblock>2022.<newblock>

        <bibitem*|2><label|bib-Berthon2006>Christophe Berthon. <newblock>Why
        the MUSCL\UHancock scheme is l1-stable.
        <newblock><with|font-shape|italic|Numerische Mathematik>,
        104(1):27\U46, jun 2006.<newblock>

        <bibitem*|3><label|bib-Dumbser2009>Michael Dumbser<localize| and
        >Olindo Zanotti. <newblock>Very high order PNPM schemes on
        unstructured meshes for the resistive relativistic MHD equations.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        228(18):6991\U7006, oct 2009.<newblock>

        <bibitem*|4><label|bib-Felton2018-ip>Camille Felton, Mariana Harris,
        Caleb Logemann, Stefan Nelson, Ian Pelakh<localize|, and
        >James<nbsp>A Rossmanith. <newblock>A positivity-preserving limiting
        strategy for locally-implicit Lax-Wendroff discontinuous galerkin
        methods. <newblock>Jun 2018.<newblock>

        <bibitem*|5><label|bib-b0ca7a5eeb40423caed7422ff5e0b525>Youngsoo Ha,
        Carl Gardner, Anne Gelb<localize|, and ><keepcase|Chi Wang> Shu.
        <newblock>Numerical simulation of high mach number astrophysical jets
        with radiative cooling. <newblock><with|font-shape|italic|Journal of
        Scientific Computing>, 24(1):597\U612, jul 2005. <newblock>Funding
        Information: We would like to thank Jeff Hester for valuable
        discussions. The authors would like to acknowledge for the following:
        (1) Research supported in part by the BK21 project at KAIST (Youngsoo
        Ha); (2) Research supported in part by the Space Telescope Science
        Institute under grant HST-GO-09863.06-A (Carl L. Gardner); (3)
        Research supported in part by the National Science Foundation under
        grant DMS-0107428. (Anne Gelb); (4) Research supported in part by the
        Army Research Office under grant DAAD19-00-1-0405 and in part by the
        National Science Foundation under grant DMS-0207451 (Chi-Wang
        Shu).<newblock>

        <bibitem*|6><label|bib-HENNEMANN2021109935>Sebastian Hennemann,
        Andrés<nbsp>M.<nbsp>Rueda-Ramírez,
        Florian<nbsp>J.<nbsp>Hindenlang<localize|, and
        >Gregor<nbsp>J.<nbsp>Gassner. <newblock>A provably entropy stable
        subcell shock capturing approach for high order split form dg for the
        compressible euler equations. <newblock><with|font-shape|italic|Journal
        of Computational Physics>, 426:109935, 2021.<newblock>

        <bibitem*|7><label|bib-Huynh2007>H.<nbsp>T.<nbsp>Huynh. <newblock>A
        Flux Reconstruction Approach to High-Order Schemes Including
        Discontinuous Galerkin Methods. <newblock>Miami, FL, jun 2007.
        AIAA.<newblock>

        <bibitem*|8><label|bib-Jackson2017>Haran Jackson. <newblock>On the
        eigenvalues of the ADER-WENO galerkin predictor.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        333:409\U413, mar 2017.<newblock>

        <bibitem*|9><label|bib-Jiang1996>Guang-Shan Jiang<localize| and
        >Chi-Wang Shu. <newblock>Efficient Implementation of Weighted ENO
        Schemes. <newblock><with|font-shape|italic|Journal of Computational
        Physics>, 126(1):202\U228, jun 1996.<newblock>

        <bibitem*|10><label|bib-LeVeque1996>Randall<nbsp>J.<nbsp>LeVeque.
        <newblock>High-Resolution Conservative Algorithms for Advection in
        Incompressible Flow. <newblock><with|font-shape|italic|SIAM Journal
        on Numerical Analysis>, 33(2):627\U665, apr 1996. <newblock>Bibtex:
        LeVeque1996.<newblock>

        <bibitem*|11><label|bib-Linde1997>Timur Linde, Philip Roe, Timur
        Linde<localize|, and >Philip Roe. <newblock>Robust euler codes.
        <newblock><localize|In ><with|font-shape|italic|13th Computational
        Fluid Dynamics Conference>. American Institute of Aeronautics and
        Astronautics, jun 1997.<newblock>

        <bibitem*|12><label|bib-Persson2006>Per-Olof Persson<localize| and
        >Jaime Peraire. <newblock>Sub-Cell Shock Capturing for Discontinuous
        Galerkin Methods. <newblock><localize|In
        ><with|font-shape|italic|44th AIAA Aerospace Sciences Meeting and
        Exhibit>, Aerospace Sciences Meetings. American Institute of
        Aeronautics and Astronautics, jan 2006.<newblock>

        <bibitem*|13><label|bib-Qiu2005b>Jianxian Qiu, Michael
        Dumbser<localize|, and >Chi-Wang Shu. <newblock>The discontinuous
        Galerkin method with Lax\UWendroff type time discretizations.
        <newblock><with|font-shape|italic|Computer Methods in Applied
        Mechanics and Engineering>, 194(42-44):4528\U4543, oct
        2005.<newblock>

        <bibitem*|14><label|bib-Rueda-Ramirez2021-ib>A Rueda-Ramrez<localize|
        and >G Gassner. <newblock>A subcell finite volume
        positivity-preserving limiter for DGSEM discretizations of the euler
        equations. <newblock><localize|In ><with|font-shape|italic|14th
        WCCM-ECCOMAS Congress>. CIMNE, 2021.<newblock>

        <bibitem*|15><label|bib-schaal2015>Kevin Schaal, Andreas Bauer,
        Praveen Chandrashekar, Rüdiger Pakmor, Christian
        Klingenberg<localize|, and >Volker Springel. <newblock>Astrophysical
        hydrodynamics with a high-order discontinuous Galerkin scheme and
        adaptive mesh refinement. <newblock><with|font-shape|italic|Monthly
        Notices of the Royal Astronomical Society>, 453(4):4278\U4300, 09
        2015.<newblock>

        <bibitem*|16><label|bib-SEDOV1959146>L.I.<nbsp>SEDOV.
        <newblock>Chapter iv - one-dimensional unsteady motion of a gas.
        <newblock><localize|In >L.I.<nbsp>SEDOV<localize|, editor>,
        <with|font-shape|italic|Similarity and Dimensional Methods in
        Mechanics>, <localize|pages >146\U304. Academic Press,
        1959.<newblock>

        <bibitem*|17><label|bib-Shu1989>Chi-Wang Shu<localize| and >Stanley
        Osher. <newblock>Efficient implementation of essentially
        non-oscillatory shock-capturing schemes, II.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        83(1):32\U78, jul 1989.<newblock>

        <bibitem*|18><label|bib-volkner2010>Volker Springel. <newblock>E pur
        si muove: Galilean-invariant cosmological hydrodynamical simulations
        on a moving mesh. <newblock><with|font-shape|italic|Monthly Notices
        of the Royal Astronomical Society>, 401(2):791\U851, 01
        2010.<newblock>

        <bibitem*|19><label|bib-Woodward1984>Paul Woodward<localize| and
        >Phillip Colella. <newblock>The numerical simulation of
        two-dimensional fluid flow with strong shocks.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        54(1):115\U173, apr 1984.<newblock>

        <bibitem*|20><label|bib-Xu2019>Yuan Xu, Qiang Zhang, Chi-wang
        Shu<localize|, and >Haijin Wang. <newblock>The <math|L<rsup|2>>-norm
        Stability Analysis of Runge\UKutta Discontinuous Galerkin Methods for
        Linear Hyperbolic Equations. <newblock><with|font-shape|italic|SIAM
        Journal on Numerical Analysis>, 57(4):1574\U1601, jan 2019.
        <newblock>Bibtex: Xu2019.<newblock>

        <bibitem*|21><label|bib-Zhang2010b>Xiangxiong Zhang<localize| and
        >Chi-Wang Shu. <newblock>On maximum-principle-satisfying high order
        schemes for scalar conservation laws.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        229(9):3091\U3120, may 2010.<newblock>

        <bibitem*|22><label|bib-zorio_approximate_2017>D.<nbsp>Zorío,
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
    <associate|font|roman>
    <associate|font-base-size|7>
    <associate|font-family|sans>
    <associate|info-flag|short>
    <associate|math-font|roman>
    <associate|page-medium|beamer>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|10|?>>
    <associate|auto-11|<tuple|11|?>>
    <associate|auto-12|<tuple|12|?>>
    <associate|auto-13|<tuple|13|?>>
    <associate|auto-14|<tuple|14|1>>
    <associate|auto-15|<tuple|15|1>>
    <associate|auto-16|<tuple|16|1>>
    <associate|auto-17|<tuple|17|?>>
    <associate|auto-18|<tuple|18|?>>
    <associate|auto-19|<tuple|19|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-20|<tuple|20|?>>
    <associate|auto-21|<tuple|21|?>>
    <associate|auto-22|<tuple|22|?>>
    <associate|auto-23|<tuple|23|?>>
    <associate|auto-24|<tuple|24|1>>
    <associate|auto-25|<tuple|25|1>>
    <associate|auto-26|<tuple|<with|mode|<quote|math>|\<bullet\>>|1>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|5|?>>
    <associate|auto-6|<tuple|6|?>>
    <associate|auto-7|<tuple|7|?>>
    <associate|auto-8|<tuple|8|?>>
    <associate|auto-9|<tuple|9|?>>
    <associate|bib-Berthon2006|<tuple|2|?>>
    <associate|bib-Dumbser2009|<tuple|3|?>>
    <associate|bib-Felton2018-ip|<tuple|4|?>>
    <associate|bib-HENNEMANN2021109935|<tuple|6|?>>
    <associate|bib-Huynh2007|<tuple|7|?>>
    <associate|bib-Jackson2017|<tuple|8|?>>
    <associate|bib-Jiang1996|<tuple|9|?>>
    <associate|bib-LeVeque1996|<tuple|10|?>>
    <associate|bib-Linde1997|<tuple|11|?>>
    <associate|bib-Persson2006|<tuple|12|?>>
    <associate|bib-Qiu2005b|<tuple|13|?>>
    <associate|bib-Rueda-Ramirez2021-ib|<tuple|14|?>>
    <associate|bib-SEDOV1959146|<tuple|16|?>>
    <associate|bib-Shu1989|<tuple|17|?>>
    <associate|bib-Woodward1984|<tuple|19|?>>
    <associate|bib-Xu2019|<tuple|20|?>>
    <associate|bib-Zhang2010b|<tuple|21|?>>
    <associate|bib-b0ca7a5eeb40423caed7422ff5e0b525|<tuple|5|?>>
    <associate|bib-oldpaper|<tuple|1|?>>
    <associate|bib-schaal2015|<tuple|15|?>>
    <associate|bib-volkner2010|<tuple|18|?>>
    <associate|bib-zorio_approximate_2017|<tuple|22|?>>
    <associate|eq:ader.linear.update|<tuple|8|?>>
    <associate|eq:admissible.theta.defn|<tuple|6|?>>
    <associate|eq:lemma.1.used|<tuple|4|?>>
    <associate|eq:low.order.update|<tuple|1|?>>
    <associate|eq:lwfr.linear.update|<tuple|9|?>>
    <associate|eq:new.cfl1|<tuple|2|?>>
    <associate|eq:new.cfl2|<tuple|3|?>>
    <associate|eq:new.cfl3|<tuple|5|?>>
    <associate|eq:non.con.face.defn1|<tuple|7|?>>
    <associate|eq:quadrature1|<tuple|10|?>>
    <associate|lemma:m.h.step.1|<tuple|2|?>>
    <associate|lemma:muscl.step2.general|<tuple|3|?>>
    <associate|lemma:muscl.step3.wss|<tuple|4|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Zhang2010b

      HENNEMANN2021109935

      Berthon2006

      HENNEMANN2021109935

      HENNEMANN2021109935

      Zhang2010b

      HENNEMANN2021109935

      Xu2019

      Huynh2007

      Huynh2007

      Huynh2007

      zorio_approximate_2017

      oldpaper

      HENNEMANN2021109935

      HENNEMANN2021109935

      Persson2006

      Felton2018-ip

      Rueda-Ramirez2021-ib

      Berthon2006

      Zhang2010b

      Jackson2017

      Dumbser2009

      Jiang1996

      Shu1989

      Qiu2005b

      Woodward1984

      Qiu2005b

      SEDOV1959146

      Linde1997

      LeVeque1996

      Woodward1984

      volkner2010

      schaal2015

      SEDOV1959146

      b0ca7a5eeb40423caed7422ff5e0b525

      b0ca7a5eeb40423caed7422ff5e0b525

      b0ca7a5eeb40423caed7422ff5e0b525

      b0ca7a5eeb40423caed7422ff5e0b525

      HENNEMANN2021109935

      Berthon2006
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Comparing
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=0>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=1>>.
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|2>>>
      has been set to <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|1>>.>|<pageref|auto-1>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|2>||Comparing
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=0>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=1>>.
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|2>>>
      has been set to <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|1>>.>|<pageref|auto-2>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|3>||Comparing
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=0>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=1>>.
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|2>>>
      has been set to <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|1>>.>|<pageref|auto-3>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|4>|>
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|L<rsup|2>>>
        error comparison of ADER, LWFR and RKFR for linear advection equation
        with <with|font-series|<quote|bold>|wave packet> initial data
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|u<rsub|0><around*|(|x|)>=e<rsup|-10*x<rsup|2>>*sin<around*|(|10*\<pi\>*x|)>>>
        and <with|font-series|<quote|bold>|periodic boundary conditions> on
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<around*|[|-1,1|]>>>
        with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|120>>
        degrees of freedom each.
      </surround>|<pageref|auto-4>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|5>|>
        Energy comparison of ADER, LWFR and RKFR for linear advection
        equation with <with|font-series|<quote|bold>|smooth initial data>
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|u<rsub|0><around*|(|x|)>=sin<around*|(|2\<pi\>x|)>>>
        and <with|font-series|<quote|bold>|periodic boundary conditions> on
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<around*|[|-1,1|]>>>
        with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|120>>
        degrees of freedom each.
      </surround>|<pageref|auto-5>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6>|>
        Convergence test of MUSCL-Hancock setting all
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<alpha\><rsub|e>=1>>
        showing close to second order convergence
        <with|color|<quote|red>|Mention <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|t>>>\ 

        <with|color|<quote|red>|Repetition AVOID>
      </surround>|<pageref|auto-6>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|7>|>
        Convergence analysis with wave packet test case for
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=3,4>>
        at <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|t=1>>
      </surround>|<pageref|auto-7>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|8>||Composite signal
      [<write|bib|Jiang1996><reference|bib-Jiang1996>] on a mesh of 60 cells
      for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
      comparing TVB limiter with parameter
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|M=50>>
      and MUSCL-Hancock (MH) blending. Here, the smoothness indicator
      function has been set with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=0.1>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|2>=1.0>>.>|<pageref|auto-8>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|9>|>
        Density profile of Shu-Osher test case
        [<write|bib|Shu1989><reference|bib-Shu1989>] at
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|t=1.8>>
        for accuracy comparison of TVB limiter
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<around*|(|M=300,[<write|bib|Qiu2005b><reference|bib-Qiu2005b>]|)>>>,
        blending limiter with MUSCL-Hancock (MH) and First Order (FO)
        blending for degree <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
        on a grid of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|400>>
        cells.
      </surround>|<pageref|auto-9>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|10>|>
        Density profile of Blast test of Woodward and Collela
        [<write|bib|Woodward1984><reference|bib-Woodward1984>] for comparison
        of TVB limiter <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|<around*|(|M=300,[<write|bib|Qiu2005b><reference|bib-Qiu2005b>]|)>>>,
        blending limiter with MUSCL-Hancock (MH) and First Order (FO)
        blending for degree <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
        on a grid of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|400>>
        cells.
      </surround>|<pageref|auto-10>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|11>|>
        Density and pressure profiles of Sedov blast test case
        [<write|bib|SEDOV1959146><reference|bib-SEDOV1959146>] on
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|201>>
        elements for degree <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
        to demonstrate admissibility preservation in very severe cases.
      </surround>|<pageref|auto-11>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|12>|>
        Density and pressure profiles of Double rarefaction test case of
        [<write|bib|Linde1997><reference|bib-Linde1997>] on a mesh of 2000
        elements for degree <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
        to demonstrate admissibility preservation in a low density test case.
      </surround>|<pageref|auto-12>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|13>|>
        Density and pressure profiles of Leblance test case on a mesh of 6400
        elements for degree <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
        to demonstrate admissibility preservation.
      </surround>|<pageref|auto-13>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|14>||Initial
      data>|<pageref|auto-14>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|15>||TVB with
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|M=100>>>|<pageref|auto-15>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|16>||MUSCL-Hancock
      blending>|<pageref|auto-16>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|17>|>
        Density profile of Double Mach reflection
        [<write|bib|Woodward1984><reference|bib-Woodward1984>] test case on a
        mesh of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|568\<times\>142>>
        cells using HLLC flux with MUSCL-Hancock blending limiter for degree
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>.
      </surround>|<pageref|auto-17>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|18>||<with|font-family|<quote|tt>|language|<quote|verbatim>|Trixi.jl>
      using First Order blending limiter for Runge-Kutta on a mesh of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|568\<times\>142>>
      elements with Rusanov flux for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>.>|<pageref|auto-18>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|19>||LWFR using
      MUSCL-Hancock blending limiter with Rusanov flux on a mesh of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|568*\<times\>142>>
      elements for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>.>|<pageref|auto-19>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|20>||LWFR using
      MUSCL-Hancock blending limiter with Rusanov flux on a mesh of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|568\<times\>142>>
      elements for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>.
      The smoothness indicator uses <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|1>=0.1>>
      and <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|\<beta\><rsub|2>=1.0>>.>|<pageref|auto-20>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|21>||LWFR using
      MUSCL-Hancock blending limiter with Rusanov flux on a mesh of
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|568\<times\>142>>
      elements for <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>.>|<pageref|auto-21>>

      <tuple|normal|<surround|<hidden-binding|<tuple>|22>||Density profile of
      Kelvin-Helmholtz test [<write|bib|volkner2010><reference|bib-volkner2010>,
      <write|bib|schaal2015><reference|bib-schaal2015>] with
      <with|font-family|<quote|tt>|language|<quote|verbatim>|Trixi.jl> (left)
      and MUSCL-Hancock (right). Both the tests are with
      <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
      on a mesh of <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|256<rsup|2>>>
      elements.>|<pageref|auto-22>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|23>|>
        Density and pressure profile of 2-D Sedov blast test case
        [<write|bib|SEDOV1959146><reference|bib-SEDOV1959146>] on a mesh of
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|160<rsup|2>>>
        elements for degree <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
        to demonstrate admissibility preservation in very severe cases.
      </surround>|<pageref|auto-23>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|24>|>
        Density profile of Mach 80 jet in log scales on a mesh of
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|448\<times\>224>>
        with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
      </surround>|<pageref|auto-24>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|25>|>
        Density profile of Mach 2000 jet in log scales on a mesh of
        <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|640\<times\>320>>
        mesh with <with|color|<quote|#503050>|font-family|<quote|rm>|<with|mode|<quote|math>|N=4>>
      </surround>|<pageref|auto-25>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-26><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>